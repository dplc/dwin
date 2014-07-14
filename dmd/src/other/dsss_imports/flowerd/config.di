module flowerd.config;

import flowerd.common;

import Int=tango.text.convert.Integer;
import tango.text.Util;
import tango.io.device.File;
import DeviceArray = tango.io.device.Array;
import tango.io.model.IConduit;

//todo: ConfigNode get is not handling ivalid paths, like multiple slashes or paths ending in slash
//todo: Config.load should accept filters, to load only specific nodes
//todo: ConfigNode.merge to merge with another ConfigNode
//todo: Config.merge to merge with another Config

class ConfigNode
{
	const STRING=0; // :: / :s:
	const BINARY=1; // :b:
	const REFERENCE=2; // :$:
	const VARIABLE=3; // :%:

	const NOVARPARSE=1; // value() will not parse the variables, in case the type is variable
	const NODEREFERENCE=2; // value() will return the reference path instead of its value()
	const NOCARRYFLAGS=4; // value() will not carry its flags to any child.value() calls
	const NOCARRYPARAMS=8; // value() will not carry its params to any child.value() calls

	const DEFFLAGS=NOCARRYPARAMS;
	const DEFTYPE=STRING;

	//~this(){remove();}

	static ConfigNode opCall(char[] name,char[] value=null,uint type=DEFTYPE)
	{
		auto ret=new ConfigNode;
		ret.name=name;
		ret.mValue=value;
		ret.mType=type;
		return ret;
	}

	ConfigNode add(ConfigNode n,uint pos=uint.max)
	{
		if(n !is null && /*!n.hasChild(this,true) &&*/ Array.insert(mChildren,n,pos))
		{
			n.parent=this;
			return n;
		}
		else return null;
	}

	ConfigNode replace(ConfigNode n)
	{
		if(n is null) return null;
		auto i=indexOf(n.mName);
		if(i==uint.max) return add(n);
		else
		{
			mChildren[i].dispose();
			(mChildren[i]=n).parent=this;
			return n;
		}
	}

	ConfigNode root()
	{
		if(mParent) return mParent.root;
		else return this;
	}

	char[] getv(char[] path,char[] def=null,char[][] params=null,uint flags=DEFFLAGS)
	{
		auto n=get(path);
		if(n) return n.value(params,flags);
		else return def;
	}

	ConfigNode get(char[] name,bool create=false,char[] value=null,uint type=DEFTYPE) /*value/type for newly create node*/
	{
		if(name.length==0) return null;

		ConfigNode ret;
		char[] t,h=head(name,"/",t);
		if(h.length==0) ret=root;
		else if(h=="..")
		{
			if(mParent) ret=mParent;
			else return null;
		}
		else if(h==".") ret=this;
		else for(uint c=0;c<mChildren.length;++c) if(mChildren[c].mName==h) {ret=mChildren[c];break;}
		if(ret is null)
		{
			if(mType==REFERENCE)
			{
				auto n=reference;
				if(n) ret=n.get(name);
				if(ret) return ret;
			}
			if(ret is null && create)
			{
				ret=add(ConfigNode(h));
				if(t.length) return ret.get(t,true,value,type);
				else
				{
					ret.mType=type;
					ret.mValue=value;
					return ret;
				}
			}
		}
		else if(t.length) return ret.get(t,create,value,type);
		else return ret;

		return null;
	}

	ConfigNode reference()
	{
		if(mType==REFERENCE) return get(mValue);
		else return null;
	}

	ConfigNode set(char[] path,char[] value,int type=-1)
	{
		auto n=get(path,true);
		if(n)
		{
			n.mValue=value;
			if(type!=-1) n.mType=type;
			return n;
		}
		else return null;
	}

	ConfigNode assign(ConfigNode n)
	{
		if(n is null) return null;
		mType=n.mType;
		//mHash=n.mHash;
		mName=n.mName;
		mValue=n.mValue;
		updateCachedPathName(mName);
		return this;
	}

	ConfigNode clone(bool deep=false)
	{
		auto ret=new ConfigNode;
		ret.mType=mType;
		//ret.mHash=mHash;
		ret.mName=mName.dup;
		ret.mValue=mValue.dup;
		if(deep)
		{
			ret.mChildren.length=mChildren.length;
			foreach(i,v;mChildren) ret.mChildren[i]=v.clone(deep);
		}
		return ret;
	}

	void remove()
	{
		parent=null;
		dispose();
	}

	void removeChildren()
	{
		foreach(c;mChildren) c.dispose();
		mChildren=null;
	}

	void removeSiblings()
	{
		if(!mParent) return;
		foreach(c;mParent.mChildren) if(c !is this) c.dispose();
		mParent.mChildren=[this];
	}

	bool hasChild(ConfigNode n,bool deep=true)
	{
		if(n is null) return false;
		if(Array.index(mChildren,n)<mChildren.length) return true;
		else if(deep) foreach(c;mChildren) if(c.hasChild(n,deep)) return true;
		auto r=reference;
		if(r) return r.hasChild(n,deep);
		return false;
	}

	bool each(bool delegate(ConfigNode) dg)
	{
		if(dg is null) return false;
		foreach(c;mChildren) if(dg(c)) continue; else return false;
		return true;
	}

	void each(void delegate(ConfigNode) dg)
	{
		//if(dg is null) return false;
		if(dg is null) return; //January 19, 2011 yidabu
		foreach(c;mChildren) dg(c);
		//return true;
		return;
	}

	uint children() {return mChildren.length;}

	char[] name(){return mName;}

	char[] name(char[] n)
	{
		if(n.length<1 || n[0]=='\t') throw new Exception("Invalid node name");
		foreach(c;n) if(c=='/' || c==':') throw new Exception("Invalid node name");
		//mHash=dhash(n);
		updateCachedPathName(n);
		return mName=n;
	}

	char[] value(char[][] params=null,uint flags=DEFFLAGS)
	{
		if(mType==VARIABLE && !(flags&NOVARPARSE)) return parseVariable(mValue,params);
		if(mType==REFERENCE && !(flags&NODEREFERENCE))
		{
			auto n=reference;
			if(n) return n.value(flags&NOCARRYPARAMS?null:params,flags&NOCARRYFLAGS?0:flags);
			else return null;
		}
		return mValue;
	}

	char[] value(char[] v){return mValue=v;}

	//Hash hash(){return mHash;}

	char[] path()
	{
		if(mCachedPath is null)
		{
			if(mParent)
			{
				auto pp=mParent.path;
				mCachedPath=(pp=="/"?pp:pp~"/")~mName;
			}
			else mCachedPath="/";
		}
		return mCachedPath;
	}

	uint type(){return mType;}

	uint type(uint t){return mType=t;}

	ConfigNode parent(ConfigNode n)
	{
		if(mParent) Array.remove(mParent.mChildren,this);
		clearCachedPath();
		return mParent=n;
	}

	ConfigNode parent(){return mParent;}

	uint index()
	{
		if(mParent is null) return uint.max;
		else
		{
			auto i=Array.index(mParent.mChildren,this);
			if(i==mParent.mChildren.length) return uint.max;
			else return i;
		}
	}

	uint indexOf(char[] name)
	{
		if(locate(name,'/')!=name.length)
		{
			auto n=get(name);
			if(n) return n.index;
		}
		else foreach(uint i,c;mChildren) if(c.mName==name) return i;
		return uint.max;
	}

	uint indexOf(ConfigNode n)
	{
		auto i=Array.index(mChildren,n);
		if(i==mChildren.length) return uint.max;
		else return i;
	}

protected:

	void updateCachedPathName(char[] name)
	{
		auto i=locatePrior(mCachedPath,'/');
		if(i<mCachedPath.length)
		{
			mCachedPath.length=i+1+name.length;
			mCachedPath[i+1..$]=name;
			foreach(c;mChildren) c.clearCachedPath();
		}
		else mCachedPath=null;
	}

	void clearCachedPath()
	{
		mCachedPath=null;
		foreach(c;mChildren) c.clearCachedPath();
	}

	void dispose(bool deep=true)
	{
		if(deep) foreach(c;mChildren) c.dispose(deep);
		mChildren=null;
		mParent=null;
		mType=0;
		//mHash=0;
		mName=null;
		mValue=null;
	}

	char[] parseVariable(char[] val,char[][] params=null,uint flags=DEFFLAGS)
	{
		char[] ret;
		char[] rest=val;
		int start=-1;
		for(int c=0;;++c)
		{
			if(c>=rest.length)
			{
				if(start<0) ret~=rest;
				break;
			}
			if(rest[c]=='%')
			{
				if(start<0)
				{
					if(c+1>=rest.length)
					{
						ret~=rest[0..$-1];
						break;
					}
					else if(rest[c+1]=='%')
					{
						ret~=rest[0..c+1];
						rest=rest[c+2..$];
						c=-1;
						continue;
					}
					else
					{
						ret~=rest[0..c];
						start=c;
					}
				}
				else
				{
					char[] var=rest[start+1..c];
					if(var[0]==':')
					{
						int i=Int.toLong(var[1..$]);
						if(i<params.length) ret~=params[i];
					}
					else
					{
						auto n=get(var);
						if(n) ret~=n.value(flags&NOCARRYPARAMS?null:params,flags&NOCARRYFLAGS?0:flags);
					}
					rest=rest[c+1..$];
					c=-1;
					start=-1;
				}
			}
		}
		return ret;
	}

	uint mType;
	//Hash mHash;
	char[] mCachedPath;
	char[] mName;
	char[] mValue;
	ConfigNode[] mChildren;
	ConfigNode mParent;
}

class Config
{
	this()
	{
		mRoot=mCwd=ConfigNode("root");
		mStack=new GrowStack!(ConfigNode);
	}

	static Config opCall(char[] f)
	{
		auto ret=new Config;
		ret.load(f);
		return ret;
	}

	static Config opCall(InputStream f)
	{
		auto ret=new Config;
		ret.load(f);
		return ret;
	}

	ConfigNode cwd(ConfigNode n){if(n && (mRoot is n || mRoot.hasChild(n,true))) mCwd=n; return mCwd;}
	ConfigNode cwd(char[] path,bool create=false) {return cwd(cwd.get(path,create));}
	ConfigNode cwd(){return mCwd;}

	char[] getv(char[] path,char[] def=null,char[][] params=null,uint flags=ConfigNode.DEFFLAGS)
	{
		return cwd.getv(path,def,params,flags);
	}

	ConfigNode get(char[] path,bool create=false,char[] value=null,uint type=ConfigNode.STRING){return cwd.get(path,create,value,type);}

	ConfigNode set(char[] path,char[] value,int type=-1)
	{
		return cwd.set(path,value,type);
	}

	//return 0 on error, 1 on success, -1 if the path is not found
	int each(char[] path,bool delegate(ConfigNode) dg)
	{
		auto n=get(path);
		if(n) return n.each(dg);
		else return -1;
	}

	void each(char[] path,void delegate(ConfigNode) dg)
	{
		auto n=get(path);
		if(n) n.each(dg);
	}

	bool each(bool delegate(ConfigNode) dg)
	{
		return cwd.each(dg);
	}

	void each(void delegate(ConfigNode) dg)
	{
		cwd.each(dg);
	}

	ConfigNode add(char[] name,char[] value=null,uint type=ConfigNode.STRING,uint pos=uint.max)
	{
		return add(ConfigNode(name,value,type),pos);
	}

	ConfigNode add(ConfigNode n,uint pos=uint.max)
	{
		return cwd.add(n,pos);
	}

	ConfigNode add(char[] path,char[] name,char[] value,uint type=ConfigNode.STRING,uint pos=uint.max)
	{
		return add(path,ConfigNode(name,value,type),pos);
	}

	ConfigNode add(char[] path,ConfigNode n,uint pos=uint.max)
	{
		auto nn=get(path,true);
		if(nn) return nn.add(n);
		else return null;
	}

	ConfigNode replace(char[] path,ConfigNode n)
	{
		auto nn=get(path,true);
		if(nn) return nn.replace(n);
		else return null;
	}

	ConfigNode replace(ConfigNode n)
	{
		return cwd.replace(n);
	}

	bool remove(char[] path)
	{
		auto nn=get(path);
		if(nn) {nn.remove;return true;}
		else return false;
	}

	ConfigNode push(ConfigNode n=null)
	{
		if(n is null) n=cwd;
		mStack.push(n);
		return n;
	}

	ConfigNode pop() {return cwd(mStack.pop);}

	ConfigNode root() {return mRoot;}

	bool load(InputStream file)
	{
		auto n=parse(file);
		if(n)
		{
			auto nn=cwd;
			n.each(delegate(ConfigNode nnn) {return nn.add(nnn) !is null;});
			return true;
		}
		else return false;
	}

	bool load(char[] file)
	{
		File fc=Try.silentr({return new File(file);});
		if(fc)
		{
			scope(exit) fc.close;
			return load(fc.input);
		}
		return false;
	}

	bool save(char[] file)
	{
		File fc=Try.silentr({return new File(file,File.WriteCreate);});
		if(fc)
		{
			scope(exit) fc.close;
			return save(fc.output);
		}
		return false;
	}

	bool save(OutputStream f)
	{
		int ident=-1;
		void writenode(ConfigNode n,bool first)
		{
			if(first) goto end;
			for(int c=0;c<ident;++c) f.write("\t");
			f.write(n.name);
			auto v=n.value(null,ConfigNode.NODEREFERENCE|ConfigNode.NOVARPARSE);
			if(n.type==ConfigNode.STRING || n.type==ConfigNode.VARIABLE)
			{
				if(locate(v,'\n')==v.length)
				{
					if(n.type==ConfigNode.VARIABLE) f.write(":%:");
					else f.write("::");
					f.write(v);
				}
				else
				{
					if(n.type==ConfigNode.VARIABLE) f.write(":s%:");
					else f.write(":s:");
					char[] str=substitute(v,"\\","\\\\");
					char brace='"';
					if(locate(str,brace)<str.length)
					{
						brace='\'';
						if(locate(str,brace)<str.length)
						{
							brace='`';
							if(locate(str,brace)<str.length) brace='"';
						}
					}
					str=substitute(str,[brace],"\\"~brace);
					f.write(brace~str~brace);
				}
			}
			else if(n.type==ConfigNode.BINARY)
			{
				char[] s=":b"~Int.toString(v.length)~':';
				f.write(s);
				f.write(v);
			}
			else if(n.type==ConfigNode.REFERENCE)
			{
				f.write(":$:");
				char[] str=substitute(v,"\n","");
				f.write(str);
			}
			f.write("\n");
		end:
			++ident;
			n.each(delegate(ConfigNode nn){writenode(nn,false); return true;});
			--ident;
		}
		writenode(cwd,true);
		return 1;
	}

protected:

	ConfigNode parse(InputStream buf)
	{
		auto ret=ConfigNode("root");
		int ident=0;
		const EOF=InputStream.Eof;
		int getbyte()
		{
			static char[1] r;
			int rr=buf.read(r);
			if(rr==0 || rr==EOF) return EOF;
			else return r[0];
		}

		int readident(ref int cbyte)
		{
			int c=0;
			for(;cbyte=='\t';++c) cbyte=getbyte;
			return c;
		}

		char[] readname(ref int cbyte)
		{
			int c=-1;
			scope auto g=new DeviceArray.Array(100,100);
			scope auto bytes=new char[1];
			for(;;++c)
			{
				if(cbyte==':') break;
				else if(cbyte=='\n' || cbyte==EOF) return null;
				bytes[0]=cast(char)cbyte;
				g.append(bytes);
				scope(exit) cbyte=getbyte;
			}
			if(cbyte==EOF) return null;
			else return cast(char[])g.slice;
		}

		int readtype(ref int cbyte)
		{
			cbyte=getbyte;
			if(cbyte==':' || cbyte=='b' || cbyte=='s' || cbyte=='$' || cbyte=='%') return cbyte;
			else return 0;
		}

		char[] readline(ref int cbyte)
		{
			scope auto g=new DeviceArray.Array(100,100);
			scope auto bytes=new char[1];
			for(;cbyte!='\n' && cbyte!=EOF;)
			{
				bytes[0]=cast(char)cbyte;
				g.append(bytes);
				cbyte=getbyte;
			}
			return cast(char[])g.slice;
		}

		long readbinary(ref int cbyte,ref char[] value)
		{
			char[] digit;
			for(cbyte=getbyte;cbyte>='0' && cbyte<='9';cbyte=getbyte) digit~=cbyte;
			if(digit.length==0) return -1;
			uint len=cast(uint)Int.toLong(digit);
			value.length=len;
			if(buf.read(value)<value.length) return -1;
			return len;
		}

		char[] readstring(ref int cbyte,ref int ret)
		{
			scope auto g=new DeviceArray.Array(100,100);
			auto bytes=new char[1];
			int brace=cbyte;
			ret=-1;

			if(brace!='"' && brace!='\'' && brace!='`') return null;
			for(;;)
			{
				cbyte=getbyte;
				if(cbyte==EOF) return null;
				else if(cbyte==brace) {ret=g.readable; return cast(char[])g.slice;}
				else if(cbyte=='\\')
				{
					cbyte=getbyte;
					if(cbyte==EOF) return null;
					else if(cbyte=='\\') {bytes[0]='\\';}
					else if(cbyte==brace) {bytes[0]=cast(char)brace;}
					else if(cbyte=='n') {bytes[0]='\n';}
					else return null;

				}
				else bytes[0]=cast(char)cbyte;
				g.append(bytes);
			}
		}

		int lastbyte=0,lastident=0;

		bool readnodes(ConfigNode now)
		{
			int cbyte;

			for(;cbyte!=EOF;)
			{
				bool var;
				char[] name,value;
				uint type;

				if(lastbyte==0) cbyte=getbyte;
				else {cbyte=lastbyte;lastbyte=0;}
				if(cbyte=='\n') {lastbyte=0;lastident=0;continue;}

				int i=lastident+readident(cbyte);
				if(i!=ident || cbyte==EOF) {lastbyte=cbyte;lastident=i;break;}
				else lastident=0;

				name=readname(cbyte);
				if(!name.length || name=="." || name==".." || locate(name,'/')<name.length) return false;

				int t=readtype(cbyte);
				if(t==0) return false;
				if(t!='b')
				{
					if(t!=':')
					{
						if(t=='%' || (t=='s' && (cbyte=getbyte)=='%')) var=true;
						if(t!='s' || var) cbyte=getbyte;
					}
					if(cbyte!=':') return false;
					cbyte=getbyte;
				}

				if(t==':' || t=='%' || t=='$') value=readline(cbyte);
				else if(t=='s')
				{
					int rr;
					value=readstring(cbyte,rr);
					if(rr<0) return false;
				}
				else if(t=='b')
				{
					auto rr=readbinary(cbyte,value);
					if(rr<0 || value.length<rr) return false;
				}

				if(var) type=ConfigNode.VARIABLE;
				else if(t=='b') type=ConfigNode.BINARY;
				else if(t=='$') type=ConfigNode.REFERENCE;
				else type=ConfigNode.STRING;
				auto n=ConfigNode(name,value,type);
				now.add(n);

				++ident;
				if(!readnodes(n)) return false;
				ident--;
			}
			return true;
		}

		if(readnodes(ret)) return ret;
		else return null;
	}

	GrowStack!(ConfigNode) mStack;
	ConfigNode mCwd;
	ConfigNode mRoot;
}
version (build) {
    debug {
        pragma(link, "debug-flowerd");
    } else {
        pragma(link, "flowerd");
    }
}
