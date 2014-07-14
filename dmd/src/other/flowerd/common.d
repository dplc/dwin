module flowerd.common;

import tango.io.FileSystem;
import tango.io.FilePath;
import Path = tango.io.Path;
import tango.io.model.IFile;
import tango.text.Util;
import tango.sys.Environment;
//alias ulong Hash;
alias uint Hash;

Hash dhash(char[] s)
{
	Hash r=0;
	for(auto c=s.ptr,end=s.ptr+s.length;c<end;) r=r*11+*c++;
	return r;
}

template Shash(char [] s, Hash sofar=0)
{
   static if (s.length == 0) const Shash = sofar;
   else const Shash = Shash!(s[1 .. length], sofar * 11 + s[0]);
}

template Itoa(int i)
{
	static if(i < 0)
		const char[] Itoa = "-" ~ Itoa!(-i);
	else static if(i >= 10)
		const char[] Itoa = Itoa!(i / 10) ~ "0123456789"[i % 10];
	else
		const char[] Itoa = "" ~ "0123456789"[i % 10];
}

int getRelativePath(char[] basepath,char[] destpath,out char[] ret)
{
	if(!destpath.length) return 0;
	if(!basepath.length) {ret=destpath;return 1;}
	auto basefp=(new FilePath(Path.normalize(basepath))).absolute(tango.sys.Environment.Environment.cwd);
	//auto basefp=FileSystem.toAbsolute(FilePath(Path.normalize(basepath)));
	auto destfp=(new FilePath(Path.normalize(destpath))).absolute(tango.sys.Environment.Environment.cwd); 
    //auto destfp = FileSystem.toAbsolute(FilePath(Path.normalize(destpath)));
	basepath=basefp.toString();
	destpath=destfp.toString();
	char[] drv1=basefp.root;
	char[] drv2=destfp.root;
	int s1=0,s2=0;
	if(drv1.length && drv2.length && drv1!=drv2) {ret=destpath;return 1;}
	else
	{
		if(drv1.length) s1=drv1.length+1;
		if(drv2.length) s2=drv2.length+1;
	}
	char[][] basedirs = s1<basepath.length?split(basepath[s1..basepath.length],FileConst.PathSeparatorString):null;
	char[][] destdirs = s2<destpath.length?split(destpath[s2..destpath.length],FileConst.PathSeparatorString):null;

	int maxCompare=basedirs.length>=destdirs.length?destdirs.length:basedirs.length;
	int lastCommonDir=-1;
	for (int i=0; i<maxCompare; ++i)
	{
		if (basedirs[i] != destdirs[i]) break;
		lastCommonDir=i;
	}

	int end=basedirs.length-(lastCommonDir+1);
	for (uint i=0;i<end; ++i) ret ~= ".."~FileConst.PathSeparatorString;
	Array.removei(destdirs,0u,cast(uint)lastCommonDir+1);
	if(destdirs.length) ret ~= join(destdirs,FileConst.PathSeparatorString);
	if(!ret.length) ret=".";
	return 1;
}

class Try
{
	static bool silent(T)(T delegate() dgTry)
	{
		try
		{
			dgTry();
			return true;
		}
		catch(Object o) {return false;}
	}

	static T silentr(T)(T delegate() dgTry,T def=null)
	{
		try return dgTry();
		catch(Object o) {return def;}
	}
}

//todo: add functions to work with multiple items
class Array
{
	static uint remove(T)(ref T[] ar,T item,uint max=1)
	{
		return Array.remove(ar,delegate(T i)
		{
			static if(is(T : char[]) || is(T : wchar[]) || is(T : dchar[])) return i == item;
			else return i is item;
		},max);
	}

	static uint remove(T)(ref T[] ar,bool delegate(T i) cmp,uint max=uint.max)
	{
		if(cmp is null) return 0;
		uint ret,end=ar.length;
		for(uint c=0;c<end && ret<max;)
		{
			if(cmp(ar[c]) && Array.removei(ar,c)/*Array.movei(ar,c,end-1)*/) {++ret;--end;continue;}
			else ++c;
		}
		//ar.length=end;
		return ret;
	}

	static bool removei(T)(ref T[] ar,uint index,uint len=1)
	{
		if(index>=ar.length || index+len>ar.length) return false;
		if(len==0) return true;
		if(len==ar.length)
		{
			ar=null;
			return 1;
		}
		ar=ar[0..index]~ar[index+len..ar.length];
		return true;
	}

	static bool contains(T)(T[] ar,T item,uint start=0)
	{
		return index(ar,item,start)<ar.length;
	}

	static uint index(T)(T[] ar,T item,uint start=0)
	{
		for(uint i=start;i<ar.length;++i)
		{
			static if(is(T : char[]) || is(T : wchar[]) || is(T : dchar[])) {if(ar[i] == item) return i;}
			else {if(ar[i] is item) return i;}
		}
		return ar.length;
	}

	static bool insert(T)(ref T[] ar,T item,uint index=uint.max)
	{
		if(index==uint.max) index=ar.length;
		if(index>ar.length) return false;
		ar.length=ar.length+1;
		if(Array.movei(ar,ar.length-1,index)==false) return false;
		ar[index]=item;
		return true;
	}

	static bool insert(T)(ref T[] ar,T[] items,uint index=uint.max)
	{
		if(index==uint.max) index=ar.length;
		if(index>ar.length) return false;
		ar=ar[0..index]~items~ar[index..$];
		return true;
	}

	static bool move(T)(ref T[] ar,T src,T dest)
	{
		if(src is dest) return true;
		return Array.move(ar,Array.index(ar,src),Array.index(ar,dest));
	}

	static bool move(T)(ref T[] ar,T src,uint dest)
	{
		if(src is dest) return true;
		return Array.move(ar,Array.index(ar,src),dest);
	}

	static bool movei(T)(ref T[] ar,uint src,uint dest)
	{
		if(src>=ar.length || dest>=ar.length) return false;
		if(src==dest) return true;
		int step=1;
		uint next;
		T t;
		if(src>dest) step=-1;
		for(;src!=dest;src=next)
		{
			next=src+step;
			t=ar[src];
			ar[src]=ar[next];
			ar[next]=t;
		}
		return true;
	}

	static bool sort(T)(ref T[] ar,int delegate(ref T a,ref T b) compareFunc)
	{
		if(ar.length==0) return false;
		T tmp;
		bool notdone=true;
		uint c=0,c2=0;
		for(;notdone;)
		{
			notdone=false;
			for(c=ar.length-1;c>0;c=c2)
			{
				c2=c-1;
				if(compareFunc(ar[c],ar[c2])<0)
				{
					tmp=ar[c2];
					ar[c2]=ar[c];
					ar[c]=tmp;
					notdone=true;
				}
			}
		}
		return true;
	}
}

class GrowStack(T)
{
	this(uint step=32,uint initial=0,T bad=T.init)
	{
		if(initial) stack.length=initial;
		this.bad=bad;
		this.step=(step==0?1:step);
	}

	T push(T item)
	{
		if(pointer==stack.length) stack.length=stack.length+step;
		return stack[pointer++]=item;
	}

	void pusha(T[] items)
	{
		if(items.length==0) return;
		uint end=pointer+items.length;
		if(end>stack.length) stack.length=stack.length+step*(end/step+(end%step==0?0:1));
		stack[pointer..end]=items;
		pointer=end;
	}

	T pop()
	{
		T ret=last;
		if(pointer>0) --pointer;
		return ret;
	}

	T[] popa(uint len)
	{
		if(len==0 || len>pointer) return null;
		else
		{
			auto ret=stack[pointer-len..pointer];
			pointer-=len;
			return ret;
		}
	}

	T last()
	{
		if(pointer>0) return stack[pointer-1];
		else return bad;
	}

	T last(T v)
	{
		if(pointer>0) return stack[pointer-1]=v;
		else return bad;
	}

	T opIndex(uint i)
	{
		if(pointer>i) return stack[i];
		else return bad;
	}

	T opIndexAssign(T v, uint i)
	{
		if(pointer>i) return stack[i]=v;
		else return bad;
	}

	void each(void delegate(ref T) dg)
	{
		if(dg is null) return;
		for(uint c=0;c<pointer;++c) dg(stack[c]);
	}

	int opApply(int delegate(ref uint,ref T) dg)
    {
        int result;

        for(uint c=0;c<pointer;++c) if((result=dg(c,stack[c]))!=0) break;

        return result;
    }

	int opApply(int delegate(ref T) dg)
    {
        int result;

        for(uint c=0;c<pointer;++c) if((result=dg(stack[c]))!=0) break;

        return result;
    }

	bool each(bool delegate(ref T) dg)
	{
		if(dg is null) return false;
		for(uint c=0;c<pointer;++c) if(dg(stack[c])) continue; else return false;
		return true;
	}

	void each(void delegate(ref T,uint i) dg)
	{
		if(dg is null) return;
		for(uint c=0;c<pointer;++c) dg(stack[c],c);
	}

	bool each(bool delegate(ref T,uint i) dg)
	{
		if(dg is null) return false;
		for(uint c=0;c<pointer;++c) if(dg(stack[c],c)) continue; else return false;
		return true;
	}

	uint remove(T item,uint max=uint.max)
	{
		return remove(delegate(ref T i){
			static if(is(T : char[]) || is(T : wchar[]) || is(T : dchar[])) return i == item;
			else return i is item;
		},max);
	}

	uint remove(bool delegate(ref T) cmp,uint max=uint.max)
	{
		if(cmp is null) return 0;
		uint ret;
		for(uint c=0;c<pointer && ret<max;)
		{
			if(cmp(stack[c]) && Array.movei(stack,c,pointer-1)) {++ret;--pointer;continue;}
			else ++c;
		}
		return ret;
	}

	//todo: NOT TESTED
	bool remove(uint index,uint len=1)
	{
		if(index+len>pointer) return false;
		else if(Array.removei(stack,index,len))
		{
			pointer-=len;
			return true;
		}
		else return false;
	}

	//todo: NOT TESTED
	bool insert(T[] items,uint pos)
	{
		if(pos>pointer) return false;
		if(Array.insert(stack,items,pos))
		{
			pointer+=items.length;
			return true;
		}
		else return false;
	}

	void opCatAssign(T v){push(v);}
	T[] opSlice(uint x,uint y)
	{
		if(y>=pointer) throw new Exception("Array index out of bounds");
		return stack[x..y];
	}
	GrowStack!(T) opCat(T v){push(v);return this;}

	uint length(){return pointer;}
	uint length(uint i)
	{
		if(i>pointer) return pointer;
		return pointer=i;
	}

	uint limit(){return stack.length;}
	uint limit(uint i)
	{
		stack.length=i;
		return pointer>i?pointer=i:i;
	}
	T[] slice(){if(pointer) return stack[0..pointer]; else return null;}
	void empty(){if(stack.length) delete stack; stack=null; pointer=0;}
	T bad;

protected:
	uint step;
	uint pointer;
	T[] stack;
}