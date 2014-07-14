module htmlayout.behaviors.translatable;

import htmlayout.events;
import htmlayout.capi;
import htmlayout.element;

import flowerd.config;
import flowerd.common;

static this()
{
	new HBehaviorTranslatable;
}

class HBehaviorTranslatable : HBehavior
{
	this()
	{
		super("translatable",HANDLE_INITIALIZATION);
		elements=new GrowStack!(Translatable);
	}

	void reset()
	{
		if(elements)
		{
			elements.each(delegate(ref Translatable t){t.element.release;});
			elements.empty;
			delete elements;
			elements=null;
		}
		if(strings)
		{
			delete strings;
			strings=null;
		}
		elements=new GrowStack!(Translatable);
	}

	bool onInit(HInit p)
	{
		if(p.cmd==BEHAVIOR_ATTACH)
		{
			if(strings is null) return false;
			auto t=new Translatable(p.element,tango.text.Util.replace(p.element["lang"],'.','/'));
			elements~=t;
			t.element.keep;
			t.update(true);
			return true;
		}
		else
		{
			elements.remove(delegate(ref Translatable t){
				if(t.element==p.element)
				{
					t.element.release;
					return true;
				}
				else return false;
			});
			return true;
		}
	}

	void load(char[] file,char[] lng="en")
	{
		strings=Config(file);
		if(lng !is null) language=lng;
	}

	void load(tango.io.model.IConduit.InputStream file,char[] lng="en")
	{
		strings=Config(file);
		if(lng !is null) language=lng;
	}

	bool language(char[] lang)
	{
		if(strings is null || lang.length==0) return false;
		strings.cwd("/"~lang,true);
		elements.each(delegate(ref Translatable t){t.update(true);});
		return true;
	}

	char[] opCall(char[] id,char[][] params=null)
	{
		return strings.getv(tango.text.Util.replace(id,'.','/'),null,params);
	}

	class Translatable
	{
		this(HElement e,char[] i)
		{
			element=e;
			id=i;
		}

		HElement element;
		char[] id;

		bool update(bool update=false,bool force=false)
		{
			if(strings is null) return false;
			auto n=strings.get(id);
			if(n)
			{
				element.innerText=n.value;
				element["title"]=n.getv("title");
				if(update) element.update;
				return true;
			}
			else if(force)
			{
				element.innerText="";
				element["title"]="";
				if(update) element.update;
			}
			return false;
		}
	}

	GrowStack!(Translatable) elements;
	Config strings;
}