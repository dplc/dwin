module htmlayout.element;

import flowerd.common;
import htmlayout.htmlayout;
import htmlayout.events;
import tango.stdc.stringz;
import tango.text.convert.Utf;
import tango.text.Util;
import tango.core.Traits;
import tango.sys.win32.Types;

alias bool delegate(HElement e,UINT evtgm,LPVOID prms) HElement_event_callback_t;
alias bool delegate(HElement,PVOID param) HElement_callback_t;
alias bool delegate(HElement,LPVOID p,int pos,int postype,wchar code) HElement_enum_callback_t;

extern(Windows)
{
	BOOL ReleaseCapture();
	BOOL PtInRect(RECT *lprc,POINT pt);
}

template EVENT_HANDLER_STRING2(char[] NAME,char[] EVENT)
{
	const EVENT_HANDLER_STRING2 =

	"bool handleStatic(ReturnTypeOf!(on"~NAME~") delegate(ParameterTupleOf!(on"~NAME~")) dg,Object param=null){if(handleStatic("~EVENT~")) return dgs"~NAME~"(mHandle).add(dg,param); else return false;}"~
	"bool unhandleStatic(ReturnTypeOf!(on"~NAME~") delegate(ParameterTupleOf!(on"~NAME~")) dg){return dgs"~NAME~"(mHandle).del(dg);}";
}

template EVENT_HANDLER_STRING1(char[] RETURNTYPE,char[] NAME,char[] TYPE,char[] EVENT)
{
	const EVENT_HANDLER_STRING1 =

	"protected static dg"~NAME~"_t[HELEMENT] mdgs"~NAME~";"~
	"static dg"~NAME~"_t dgs"~NAME~"(HELEMENT handle){auto h=handle in mdgs"~NAME~"; if(h is null) {auto ret=mdgs"~NAME~"[handle]=new dg"~NAME~"_t; mdgs"~NAME~".rehash; return ret;} return *h;}";
}

class HElement : HEventHandler2
{
	mixin(EVENT_HANDLER_STRING1!("bool","Init","HInitialization","HANDLE_INITIALIZATION"));
	mixin(EVENT_HANDLER_STRING1!("bool","Mouse","HMouse","HANDLE_MOUSE"));
	mixin(EVENT_HANDLER_STRING1!("bool","Key","HKey","HANDLE_KEY"));
	mixin(EVENT_HANDLER_STRING1!("bool","Focus","HFocus","HANDLE_FOCUS"));
	mixin(EVENT_HANDLER_STRING1!("bool","Draw","HDraw","HANDLE_DRAW"));
	mixin(EVENT_HANDLER_STRING1!("bool","BehaviorEvent","HBehaviorEvent","HANDLE_BEHAVIOR_EVENT"));
	mixin(EVENT_HANDLER_STRING1!("bool","MethodCall","HMethod","HANDLE_METHOD_CALL"));
	mixin(EVENT_HANDLER_STRING1!("bool","DataArrived","HDataArrived","HANDLE_DATA_ARRIVED"));
	mixin(EVENT_HANDLER_STRING1!("void","Size","HSize","HANDLE_SIZE"));
	mixin(EVENT_HANDLER_STRING1!("bool","Timer","HTimer","HANDLE_TIMER"));
	mixin(EVENT_HANDLER_STRING1!("bool","Scroll","HScroll","HANDLE_SCROLL"));
	mixin(EVENT_HANDLER_STRING2!("Init","HANDLE_INITIALIZATION"));
	mixin(EVENT_HANDLER_STRING2!("Mouse","HANDLE_MOUSE"));
	mixin(EVENT_HANDLER_STRING2!("Key","HANDLE_KEY"));
	mixin(EVENT_HANDLER_STRING2!("Focus","HANDLE_FOCUS"));
	mixin(EVENT_HANDLER_STRING2!("Draw","HANDLE_DRAW"));
	mixin(EVENT_HANDLER_STRING2!("BehaviorEvent","HANDLE_BEHAVIOR_EVENT"));
	mixin(EVENT_HANDLER_STRING2!("MethodCall","HANDLE_METHOD_CALL"));
	mixin(EVENT_HANDLER_STRING2!("DataArrived","HANDLE_DATA_ARRIVED"));
	mixin(EVENT_HANDLER_STRING2!("Size","HANDLE_SIZE"));
	mixin(EVENT_HANDLER_STRING2!("Timer","HANDLE_TIMER"));
	mixin(EVENT_HANDLER_STRING2!("Scroll","HANDLE_SCROLL"));

	class Styles
	{
		char[] opIndex(char[] name){return style(name);}
		char[] opIndexAssign(char[] value,char[] name){if(style(name,value)) return value; else return null;}

		char[] opCall(char[] name) //getter
		{
			LPCWSTR p_value;
			if((lastResult=HTMLayoutGetStyleAttribute(mHandle,toStringz(name),&p_value))==HLDOM_OK) return .toString(fromString16z(p_value).dup);
			else return null;
		}
	
		bool opCall(char[] name,char[] value) //setter
		{return (lastResult=HTMLayoutSetStyleAttribute(mHandle,toStringz(name),toString16z(toString16(value))))==HLDOM_OK;}
	}

	const Styles style;

	this(HELEMENT h,bool use=false){mHandle=h;style=new Styles;if(use) keep();}
	this(HElement element,bool use=false){this(element.mHandle,use);}
	this(char[] tagname,char[] text=null)
	{
		HELEMENT phe;
		if((lastResult=HTMLayoutCreateElement(toStringz(tagname),toString16z(toString16(text)),&phe))==HLDOM_OK)
		{
			style=new Styles;
			mUsed=true;
			mHandle=phe;
		}
		else throw new Exception("Error creating element");
	}
	~this()
	{
		delete style;
		if(mHandle)
		{
			HTMLayoutDetachEventHandler(mHandle,callback,htag);
			release();
		}
	}

	static HElement opCall(HELEMENT h,bool use=false) {return new HElement(h,use);}
	static HElement opCall(HElement element,bool use=false) {return new HElement(element,use);}
	static HElement opCall(char[] tagname,char[] text=null) {return new HElement(tagname,text);}

	bool keep(bool dokeep=true)
	{
		if(dokeep)
		{
			if(mUsed==false && (lastResult=HTMLayout_UseElement(mHandle))==HLDOM_OK)
			{
				mUsed=true;
				return true;
			}
			else return false;
		}
		else
		{
			if(mUsed==true && (lastResult=HTMLayout_UnuseElement(mHandle))==HLDOM_OK)
			{
				mUsed=false;
				return true;
			}
			else return false;
		}
	}

	bool release(){return keep(false);}

	bool opEquals(HELEMENT h){return mHandle==h;}
	bool opEquals(HElement h){return mHandle==h.mHandle;}
	HELEMENT handle(){return mHandle;}
	HELEMENT opCast(){return mHandle;}

	int children()
	{
		UINT count;
		if((lastResult=HTMLayoutGetChildrenCount(mHandle,&count))==HLDOM_OK) return cast(int)count;
		else return -1;
	}

	HElement child(UINT n) //getter
	{
		HELEMENT phe;
		if((lastResult=HTMLayoutGetNthChild(mHandle,n,&phe))==HLDOM_OK) return new HElement(phe);
		else return null;
	}

	HElement parent() //getter
	{
		HELEMENT phe;
		if((lastResult=HTMLayoutGetParentElement(mHandle,&phe))==HLDOM_OK) return new HElement(phe);
		else return null;
	}

	char[] elementText() //getter
	{
		UINT length;
		if((lastResult=HTMLayoutGetElementText(mHandle,null,&length))==HLDOM_OK && length>0)
		{
			wchar[] ret;
			ret.length=length;
			if((lastResult=HTMLayoutGetElementText(mHandle,ret.ptr,&length))==HLDOM_OK) return .toString(ret);
		}
		return null;
	}

	bool innerHTML(char[] html){return setHtml(html,SIH_REPLACE_CONTENT);}
	char[] innerHTML(){return getHtml(false);}
	bool outerHTML(char[] html){return setHtml(html,SOH_REPLACE);}
	char[] outerHTML(){return getHtml(true);}
	bool innerAppend(char[] html){return setHtml(html,SIH_APPEND_AFTER_LAST);}
	bool innerPrepend(char[] html){return setHtml(html,SIH_INSERT_AT_START);}
	bool outerAppend(char[] html){return setHtml(html,SOH_INSERT_AFTER);}
	bool outerPrepend(char[] html){return setHtml(html,SOH_INSERT_BEFORE);}

	char[] getHtml(bool outer)
	{
		LPCBYTE utf8bytes;
		if((lastResult=HTMLayoutGetElementHtml(mHandle,&utf8bytes,outer))==HLDOM_OK) return fromStringz(cast(char*)utf8bytes).dup;
		else return null;
	}

	bool setHtml(char[] html,UINT where=SIH_REPLACE_CONTENT)
	{
		return (lastResult=HTMLayoutSetElementHtml(mHandle,cast(LPCBYTE)html.ptr,html.length,where))==HLDOM_OK;
	}

	bool innerText(char[] txt){return (lastResult=HTMLayoutSetElementInnerText(mHandle,cast(LPCBYTE)txt.ptr,txt.length))==HLDOM_OK;}

	char[] innerText()
	{
		LPCBYTE ret;
		if((lastResult=HTMLayoutGetElementInnerText(mHandle,&ret))==HLDOM_OK) return fromStringz(cast(char*)ret).dup;
		else return null;
	}

	wchar[] innerText16()
	{
		LPWSTR ret;
		if((lastResult=HTMLayoutGetElementInnerText16(mHandle,&ret))==HLDOM_OK) return fromString16z(ret).dup;
		else return null;
	}

	bool innerText16(wchar[] txt){return (lastResult=HTMLayoutSetElementInnerText(mHandle,cast(LPCBYTE)txt.ptr,txt.length))==HLDOM_OK;}

	int attributes()
	{
		UINT count;
		if((lastResult=HTMLayoutGetAttributeCount(mHandle,&count))==HLDOM_OK) return count;
		else return -1;
	}

	bool attribute(UINT n,ref char[] name,ref char[] value) //getter
	{
		LPCSTR p_name;
		LPCWSTR p_value;
		if((lastResult=HTMLayoutGetNthAttribute(mHandle,n,&p_name,&p_value))==HLDOM_OK)
		{
			name=fromStringz(p_name).dup;
			value=.toString(fromString16z(p_value).dup);
			return true;
		}
		else return false;
	}

	char[] attributeName(UINT n)
	{
		LPCSTR p_name;
		LPCWSTR p_value;
		if((lastResult=HTMLayoutGetNthAttribute(mHandle,n,&p_name,null))==HLDOM_OK) return fromStringz(p_name).dup;
		else return null;
	}

	char[] attributeValue(UINT n)
	{
		LPCSTR p_name;
		LPCWSTR p_value;
		if((lastResult=HTMLayoutGetNthAttribute(mHandle,n,null,&p_value))==HLDOM_OK) return .toString(fromString16z(p_value).dup);
		else return null;
	}

	char[] opIndex(char[] name){return attribute(name);}
	char[] opIndexAssign(char[] value,char[] name){if(attribute(name,value)) return value; else return null;}

	char[] attribute(char[] name) //getter
	{
		LPCWSTR p_value;
		if((lastResult=HTMLayoutGetAttributeByName(mHandle,toStringz(name),&p_value))==HLDOM_OK) return .toString(fromString16z(p_value).dup);
		else return null;
	}

	bool attribute(char[] name,char[] value) //setter
	{
		return (lastResult=HTMLayoutSetAttributeByName(mHandle,toStringz(name),toString16z(.toString16(value))))==HLDOM_OK;
	}

	bool clearAttributes(){return (lastResult=HTMLayoutClearAttributes(mHandle))==HLDOM_OK;}

	int index()
	{
		UINT index;
		if((lastResult=HTMLayoutGetElementIndex(mHandle,&index))==HLDOM_OK) return index;
		else return -1;
	}

	char[] tag()
	{
		LPCSTR p_type;
		if((lastResult=HTMLayoutGetElementType(mHandle,&p_type))==HLDOM_OK) return fromStringz(p_type).dup;
		else return null;
	}

	bool update(bool renderNow=false){return (lastResult=HTMLayoutUpdateElement(mHandle,renderNow))==HLDOM_OK;}
	bool updateEx(UINT flags){return (lastResult=HTMLayoutUpdateElementEx(mHandle,flags))==HLDOM_OK;}
	bool capture(bool capt=true)
	{
		if(capt) return (lastResult=HTMLayoutSetCapture(mHandle))==HLDOM_OK;
		else return cast(bool)ReleaseCapture();
	}
	char[] combineURL(char[] url)
	{
		wchar[MAX_URL_LENGTH] buff=void;
		auto str16=.toString16(url);
		buff[0..str16.length]=str16;
		DWORD size=MAX_URL_LENGTH;
		if((lastResult=HTMLayoutCombineURL(mHandle,buff.ptr,size))==HLDOM_OK && size>0) return .toString(buff[0..size]);
		return null;
	}

	HElement[] wildcard(char[] tagName,char[] attributeName=null,char[] attributeValue=null,DWORD depth=0,uint max=0)
	{
		auto ret=new GrowStack!(HElement)(max>0?max:15);
		uint count;
		bool each(HElement e,PVOID param)
		{
			ret.push(e);
			return !(max==0||++count<max?1:0);
		}
		wildcard(tagName,attributeName,attributeValue,&each,null,depth);
		return ret.slice;
	}

	bool wildcard(char[] tagName,char[] attributeName,char[] attributeValue,HElement_callback_t callback,LPVOID param=null,DWORD depth=0)
	{synchronized{

		if(!callback) return false;
		mElementCallback=callback;
		return (lastResult=HTMLayoutVisitElements(mHandle,.toStringz(tagName),toStringz(attributeName),toString16z(toString16(attributeValue)),&mVisitElementCallback,param,depth))==HLDOM_OK;
	}}

	HElement getId(char[] id) //getter
	{
		auto ret=wildcard(null,"id",id,0,1);
		if(ret && ret.length) return ret[0];
		else return null;
	}

	HElement[] getTag(char[] tag,uint max=0) //getter
	{return wildcard(tag,null,null,0,max);}

	bool id(char[] name) //setter
	{return attribute("id",name);}

	char[] id() //getter
	{return attribute("id");}

	bool className(char[] name) //setter
	{return attribute("class",name);}

	char[] className() //getter
	{return attribute("class");}

	bool hasClass(char[] clas)
	{
		auto cn=className;
		uint i=0;
		while(1)
		{
			i=locatePattern(cn,clas,i);
			if(i==cn.length) return false;
			if(i>0 && cn[i-1]!=' ') {i+=clas.length;continue;}
			if(i+clas.length==cn.length) return true;
			if(cn[i+clas.length]!=' ') {i+=clas.length;continue;}
			return true;
		}
		return false;
	}

	bool addClass(char[] clas,bool check=true)
	{
		if(check && hasClass(clas)) return false;
		return className=className~" "~clas;
	}

	bool delClass(char[] clas,bool check=true)
	{
		if(check && !hasClass(clas)) return false;
		auto c=split(className," ");
		auto d=Array.remove(c,clas);
		return className=join(c," ");
	}

	bool display(char[] name) //setter
	{return style("display",name);}

	char[] display() //getter
	{return style("display");}

	HElement[] select(char[] CSS_selectors,uint max=0)
	{
		auto ret=new GrowStack!(HElement)(max>0?max:15);
		uint count;
		bool each(HElement e,PVOID param)
		{
			ret.push(e);
			return !(max==0||++count<max?1:0);
		}
		select(CSS_selectors,&each);
		return ret.slice;
	}

	bool select(char[] CSS_selectors,HElement_callback_t callback,LPVOID param=null)
	{synchronized{
		
		if(!callback) return false;
		mElementCallback=callback;
		return (lastResult=HTMLayoutSelectElements(mHandle,toStringz(CSS_selectors),&mVisitElementCallback,param))==HLDOM_OK;
	}}

	HElement selectParent(char[] selector,UINT depth=0)
	{
		HELEMENT heFound;
		if((lastResult=HTMLayoutSelectParent(mHandle,toStringz(selector),depth,&heFound))==HLDOM_OK && heFound) return new HElement(heFound);
		else return null;
	}

	bool remove()
	{
		if((lastResult=HTMLayoutDeleteElement(mHandle))==HLDOM_OK)
		{
			mHandle=null;
			return true;
		}
		else return false;
	}

	int UID()
	{
		UINT puid;
		if((lastResult=HTMLayoutGetElementUID(mHandle,&puid))==HLDOM_OK) return puid;
		else return -1;
	}

	bool showAsPopup(HElement anchor,UINT placement=2){return anchor.showPopup(this,placement);}
	bool showPopup(HElement hePopup,UINT placement=2){return (lastResult=HTMLayoutShowPopup(hePopup.mHandle,mHandle,placement))==HLDOM_OK;}
	bool showPopupAt(HElement hePopup,int x,int y,bool animate){return (lastResult=HTMLayoutShowPopupAt(hePopup.mHandle,POINT(x,y),animate))==HLDOM_OK;}
	bool showAsPopupAt(int x,int y,bool animate){return showPopupAt(this,x,y,animate);}
	bool hidePopup(HElement hePopup=null){return (lastResult=HTMLayoutHidePopup(hePopup?hePopup.mHandle:mHandle))==HLDOM_OK;}

	uint state() //getter
	{
		UINT pstateBits;
		if((lastResult=HTMLayoutGetElementState(mHandle,&pstateBits))==HLDOM_OK) return pstateBits;
		else return 0;
	}

	bool state(UINT stateBitsToSet,UINT stateBitsToClear,bool updateView) //setter
	{return (lastResult=HTMLayoutSetElementState(mHandle,stateBitsToSet,stateBitsToClear,updateView))==HLDOM_OK;}

	bool link(){return (state&STATE_LINK)!=0;}
	bool hovered(){return (state&STATE_HOVER)!=0;}
	bool active(){return (state&STATE_ACTIVE)!=0;}
	bool visited(){return (state&STATE_VISITED)!=0;}
	bool current(){return (state&STATE_CURRENT)!=0;}
	bool readOnly(){return (state&STATE_READONLY)!=0;}
	bool readOnly(bool v){return state(v?STATE_READONLY:0,v?0:STATE_READONLY,true);}
	bool expanded(){return (state&STATE_EXPANDED)!=0;}
	bool collapsed(){return (state&STATE_COLLAPSED)!=0;}
	bool incomplete(){return (state&STATE_INCOMPLETE)!=0;}
	bool animating(){return (state&STATE_ANIMATING)!=0;}
	bool synthetic(){return (state&STATE_SYNTHETIC)!=0;}
	bool ownsPopup(){return (state&STATE_OWNS_POPUP)!=0;}
	bool tabFocus(){return (state&STATE_TABFOCUS)!=0;}
	bool empty(){return (state&STATE_EMPTY)!=0;}
	bool busy(){return (state&STATE_BUSY)!=0;}
	bool dragOver(){return (state&STATE_DRAG_OVER)!=0;}
	bool dropTarget(){return (state&STATE_DROP_TARGET)!=0;}
	bool moving(){return (state&STATE_MOVING)!=0;}
	bool copying(){return (state&STATE_COPYING)!=0;}
	bool dragSource(){return (state&STATE_DRAG_SOURCE)!=0;}
	bool popup(){return (state&STATE_POPUP)!=0;}
	bool pressed(){return (state&STATE_PRESSED)!=0;}
	bool hasChildren(){return (state&STATE_HAS_CHILDREN)!=0;}
	bool hasChild(){return (state&STATE_HAS_CHILD)!=0;}
	bool focus(){return state(STATE_FOCUS,0,true);}
	bool focused(){return (state&STATE_FOCUS)!=0;}
	bool focusable(bool v){return state(v?STATE_FOCUSABLE:0,v?0:STATE_FOCUSABLE,true);}
	bool focusable(){return (state&STATE_FOCUSABLE)!=0;}
	bool checked(bool v){return state(v?STATE_CHECKED:0,v?0:STATE_CHECKED,true);}
	bool checked(){return (state&STATE_CHECKED)!=0;}
	bool disabled(bool v){return state(v?STATE_DISABLED:0,v?0:STATE_DISABLED,true);}
	bool disabled(){return (state&STATE_DISABLED)!=0;}

	HElement clone()
	{
		HELEMENT phe;
		if((lastResult=HTMLayoutCloneElement(mHandle,&phe))==HLDOM_OK)
		{
			auto r=new HElement(phe,false);
			r.mUsed=true;
			return r;
		}
		return null;
	}

	bool insert(HElement hparent,UINT index=0){return (lastResult=HTMLayoutInsertElement(mHandle,hparent.mHandle,index))==HLDOM_OK;}
	bool adopt(HElement child,UINT index=0){return child.insert(this,index);}
	bool detach(){return (lastResult=HTMLayoutDetachElement(mHandle))==HLDOM_OK;}
	bool timer(UINT milliseconds){return (lastResult=HTMLayoutSetTimer(mHandle,milliseconds))==HLDOM_OK;}

	bool sendEvent(UINT appEventCode,HElement heSource,UINT reason,out bool handled)
	{
		BOOL mHandled;
		if((lastResult=HTMLayoutSendEvent(mHandle,appEventCode,heSource?heSource.mHandle:null,reason,&mHandled))==HLDOM_OK)
		{
			handled=cast(bool)mHandled;
			return true;
		}
		else return false;
	}

	bool postEvent(UINT appEventCode,HElement heSource,UINT reason){return (lastResult=HTMLayoutPostEvent(mHandle,appEventCode,heSource?heSource.mHandle:null,reason))==HLDOM_OK;}

	protected bool callMethod(HMethodParams* params){return (lastResult=HTMLayoutCallBehaviorMethod(mHandle,params))==HLDOM_OK;}

	bool click(){return callMethod(&HMethodParams(DO_CLICK));}
	bool xcall(char[] name,HJson[] values=null)
	{
		JSON_VALUE[] vals;
		vals.length=values.length;
		foreach(i,v;values) vals[i]=*v.handle;
		return callMethod(HXcall(name,vals).opCast);
	}
	bool xcall(char[] name,HJson value){return callMethod(HXcall(name,value.handle).opCast);}

	bool requestData(char[] url,UINT dataType,HElement initiator){return (lastResult=HTMLayoutRequestElementData(mHandle,toString16z(toString16(url)),dataType,initiator?initiator.mHandle:null))==HLDOM_OK;}
	bool scrollInfo(ref POINT scrollPos,ref RECT viewRect,ref SIZE contentSize) //getter
	{return (lastResult=HTMLayoutGetScrollInfo(mHandle,&scrollPos,&viewRect,&contentSize))==HLDOM_OK;}
	POINT scrollPos()
	{
		POINT a;RECT b;SIZE c;
		scrollInfo(a,b,c);
		return a;
	}
	RECT viewRect()
	{
		POINT a;RECT b;SIZE c;
		scrollInfo(a,b,c);
		return b;
	}
	SIZE viewSize()
	{
		auto r=viewRect;
		return SIZE(r.right-r.left,r.bottom-r.top);
	}
	SIZE contentSize()
	{
		POINT a;RECT b;SIZE c;
		scrollInfo(a,b,c);
		return c;
	}
	bool scrollPos(POINT p,bool smooth=false) {return scrollPos(p.x,p.y,smooth);}
	bool scrollPos(int x,int y,bool smooth=false) //setter
	{return (lastResult=HTMLayoutSetScrollPos(mHandle,POINT(x,y),smooth))==HLDOM_OK;}

	bool visible() //getter
	{
		BOOL pVisible;
		return (lastResult=HTMLayoutIsElementVisible(mHandle,&pVisible))==HLDOM_OK && pVisible;
	}

	bool enabled() //getter
	{
		BOOL pEnabled;
		return (lastResult=HTMLayoutIsElementEnabled(mHandle,&pEnabled))==HLDOM_OK && pEnabled;
	}

	bool sort(UINT firstIndex,UINT lastIndex,ELEMENT_COMPARATOR cmpFunc,LPVOID cmpFuncParam){return (lastResult=HTMLayoutSortElements(mHandle,firstIndex,lastIndex,cmpFunc,cmpFuncParam))==HLDOM_OK;}

	bool swap(HElement he2){return (lastResult=HTMLayoutSwapElements(mHandle,he2.mHandle))==HLDOM_OK;}

	int controlType()
	{
		UINT pType;
		if((lastResult=HTMLayoutControlGetType(mHandle,&pType))==HLDOM_OK) return pType;
		else return -1;
	}
	HJson value()
	{
		auto r=new JSON_VALUE;
		if((lastResult=HTMLayoutControlGetValue(mHandle,r))==HLDOM_OK) return HJson(r);
		else return null;
	}
	bool value(HJson pVal){return (lastResult=HTMLayoutControlSetValue(mHandle,pVal.handle))==HLDOM_OK;}

	bool enumerate(HElement_enum_callback_t callback,LPVOID p,bool forward)
	{
		if(!callback) return false;
		mEnumCallback=callback;
		return (lastResult=HTMLayoutEnumerate(mHandle,&mEnumerationCallback,p,forward))==HLDOM_OK;
	}

	RECT* characterRect(int pos)
	{
		auto outRect=new RECT;
		if((lastResult=HTMLayoutGetCharacterRect(mHandle,pos,outRect))==HLDOM_OK) return outRect;
		else return null;
	}

	RECT* location(UINT areas /*ELEMENT_AREAS*/)
	{
		auto outRect=new RECT;
		if((lastResult=HTMLayoutGetElementLocation(mHandle,outRect,areas))==HLDOM_OK) return outRect;
		else return null;
	}

	bool isInside(POINT client_pt)
	{
		auto rc = location(ROOT_RELATIVE | BORDER_BOX);
		if(rc) return PtInRect(rc,client_pt) != FALSE;
		else return false;
	}

	HWND hwnd(BOOL rootWindow)
	{
		HWND hwnd;
		if((lastResult=HTMLayoutGetElementHwnd(mHandle,&hwnd,rootWindow))==HLDOM_OK) return hwnd;
		else return null;
	}

	HRange range(bool outer)
	{
		HRANGE pRange;
		if((lastResult=HTMLayoutRangeCreate(mHandle,&pRange,outer ))==HLDOM_OK) return new HRange(pRange);
		else return null;
	}

	HRange rangeFromSelection()
	{
		HRANGE pRange;
		if((lastResult=HTMLayoutRangeFromSelection(mHandle,&pRange ))==HLDOM_OK) return new HRange(pRange);
		else return null;
	}

	HRange rangeFromPositions(ref HPOSITION pStart,ref HPOSITION pEnd)
	{
		HRANGE pRange;
		if((lastResult=HTMLayoutRangeFromPositions(mHandle,&pStart,&pEnd ))==HLDOM_OK) return new HRange(pRange);
		else return null;
	}

	bool scrollToView(UINT flags=0){return (lastResult=HTMLayoutScrollToView(mHandle,flags))==HLDOM_OK;}

	bool _handleEvent(UINT subscription){return (lastResult=HTMLayoutAttachEventHandlerEx(mHandle,callback,htag,subscription))==HLDOM_OK;}
	bool _handleStatic(UINT subscription){return (lastResult=HTMLayoutAttachEventHandlerEx(mHandle,&mStaticHandler,mHandle,subscription))==HLDOM_OK;}
	bool _unhandleEvents(){return (lastResult=HTMLayoutDetachEventHandler(mHandle,callback,htag))==HLDOM_OK;}
	bool _unhandleStatic(){return (lastResult=HTMLayoutDetachEventHandler(mHandle,&mStaticHandler,mHandle))==HLDOM_OK;}

	protected uint[HELEMENT] mStaticSubscriptions;
	bool handleStatic(UINT subscription,bool force=false)
	{
		auto ms=mHandle in mStaticSubscriptions;
		if(ms is null)
		{
			mStaticSubscriptions[mHandle]=0;
			ms=mHandle in mStaticSubscriptions;
		}
		if(!force && *ms&subscription) return true;
		else
		{
			if(_handleStatic(subscription))
			{
				*ms|=subscription;
				return true;
			}
		}
		return false;
	}

	bool unhandleStatic(bool removehandlers=true)
	{
		if(_unhandleStatic())
		{
			if(removehandlers)
			{
				mdgsInit.remove(mHandle);
				mdgsMouse.remove(mHandle);
				mdgsKey.remove(mHandle);
				mdgsFocus.remove(mHandle);
				mdgsDraw.remove(mHandle);
				mdgsBehaviorEvent.remove(mHandle);
				mdgsMethodCall.remove(mHandle);
				mdgsDataArrived.remove(mHandle);
				mdgsSize.remove(mHandle);
				mdgsTimer.remove(mHandle);
				mdgsScroll.remove(mHandle);
			}
			return true;
		}
		else return false;
	}

	HLDOM_RESULT lastResult;
	char[] lastResultMsg()
	{
		if(lastResult==HLDOM_OK) return "HLDOM_OK - function completed successfully";
		else if(lastResult==HLDOM_INVALID_HWND) return "return HLDOM_INVALID_HWND - invalid HWND";
		else if(lastResult==HLDOM_INVALID_HANDLE) return "return HLDOM_INVALID_HANDLE - invalid HELEMENT";
		else if(lastResult==HLDOM_PASSIVE_HANDLE) return "return HLDOM_PASSIVE_HANDLE - attempt to use HELEMENT which is not marked by HTMLayout_UseElement()";
		else if(lastResult==HLDOM_INVALID_PARAMETER) return "return HLDOM_INVALID_PARAMETER - parameter is invalid,e.g. pointer is null";
		else if(lastResult==HLDOM_OPERATION_FAILED) return "return HLDOM_OPERATION_FAILED";
		else return null;
	}

private:

	static HElement_enum_callback_t mEnumCallback;
	extern(Windows) static BOOL mEnumerationCallback( LPVOID p,HELEMENT he,int pos,int postype,WCHAR code )
	{
		return mEnumCallback(new HElement(he),p,pos,postype,code);
	}

	static HElement_callback_t mElementCallback;
	extern(Windows) static BOOL mVisitElementCallback(HELEMENT el,PVOID param)
	{
		return mElementCallback(new HElement(el),param);
	}

	extern(Windows) static BOOL mStaticHandler(LPVOID tag,HELEMENT target,UINT event,LPVOID params )
	{
		if(event==HANDLE_INITIALIZATION){return dgsInit(target).call(HInitialization(target,cast(INITIALIZATION_PARAMS*)params));}
		else if(event==HANDLE_MOUSE){return dgsMouse(target).call(HMouse(target,cast(MOUSE_PARAMS*)params));}
		else if(event==HANDLE_KEY){return dgsKey(target).call(HKey(target,cast(KEY_PARAMS*)params));}
		else if(event==HANDLE_FOCUS){return dgsFocus(target).call(HFocus(target,cast(FOCUS_PARAMS*)params));}
		else if(event==HANDLE_DRAW){return dgsDraw(target).call(HDraw(target,cast(DRAW_PARAMS*)params));}
		else if(event==HANDLE_TIMER){return dgsTimer(target).call(HTimer(target));}
		else if(event==HANDLE_BEHAVIOR_EVENT){return dgsBehaviorEvent(target).call(HBehaviorEvent(target,cast(BEHAVIOR_EVENT_PARAMS*)params));}
		else if(event==HANDLE_METHOD_CALL){return dgsMethodCall(target).call(HMethod(target,cast(METHOD_PARAMS*)params));}
		else if(event==HANDLE_DATA_ARRIVED){return dgsDataArrived(target).call(HDataArrived(target,cast(DATA_ARRIVED_PARAMS*)params));}
		else if(event==HANDLE_SIZE){dgsSize(target).call(HSize(target));return false;}
		else if(event==HANDLE_SCROLL){return dgsScroll(target).call(HScroll(target,cast(SCROLL_PARAMS*)params));}
		else throw new Exception("Error handling behavior event");
		return false;
	}

	bool mUsed;
	HELEMENT mHandle;
}

class HEditBox : HElement
{
	this(HELEMENT h,bool use=false){super(h,use);}
	this(HElement el,bool use=false){super(el,use);}
	static HEditBox opCall(HELEMENT h,bool use=false) {return new HEditBox(h,use);}
	static HEditBox opCall(HElement el,bool use=false) {return new HEditBox(el,use);}

	char[] textValue()
	{
		auto p=HTextValue();
		if(callMethod(p.opCast) && p.text && p.length) return p.toString;
		else return null;
	}
	bool textValue(char[] value) {return callMethod(HTextValue(value).opCast);}

	bool select(uint start,uint end) {return callMethod(HTextEditSelection(start,end).opCast);}
	HTextEditSelection* selection()
	{
		auto p=HTextEditSelection();
		if(callMethod(p.opCast)) return p;
		else return null;
	}

	bool replace(char[] text) {return callMethod(HTextEditReplaceSelection(text).opCast);}

	HTextCaretPosition* caretPos()
	{
		auto p=HTextCaretPosition();
		if(callMethod(p.opCast)) return p;
		else return null;
	}

	char[] selectedText()
	{
		auto p=HTextSelection(false);
		if(callMethod(p.opCast)) return p.toString;
		else return null;
	}

	char[] selectedHTML()
	{
		auto p=HTextSelection(true);
		if(callMethod(p.opCast)) return p.toString;
		else return null;
	}
}

class HScrollBar : HElement
{
	this(HELEMENT h,bool use=false){super(h,use);}
	this(HElement el,bool use=false){super(el,use);}
	static HScrollBar opCall(HELEMENT h,bool use=false) {return new HScrollBar(h,use);}
	static HScrollBar opCall(HElement el,bool use=false) {return new HScrollBar(el,use);}

	HScrollbarValue* getValue()
	{
		auto p=HScrollbarValue();
		if(callMethod(p.opCast)) return p;
		else return null;
	}

	bool setValue(int value,int min=0,int max=0,int page=0,int step=0)
	{
		return callMethod(HScrollbarValue(value,min,max,page,step).opCast);
	}
}

class HRange
{
	this(HRANGE range){mHandle=range;}
	~this(){if(mHandle) release();}
	static HRange opCall(HRANGE h) {return new HRange(h);}

	bool release(){if((lastResult=HTMLayoutRangeRelease(mHandle))==HLDOM_OK) {mHandle=null;return true;} return false;}
	bool advance(UINT cmd,ref INT c,ref HPOSITION pPos ){return (lastResult=HTMLayoutRangeAdvancePos( mHandle,cmd,&c,&pPos ))==HLDOM_OK;}
	char[] html()
	{
		LPCBYTE ret;
		uint len;
		if((lastResult=HTMLayoutRangeToHtml( mHandle,&ret,&len))==HLDOM_OK) return (cast(char*)ret)[0..len].dup;
		else return null;
	}
	bool replace(char[] html){return (lastResult=HTMLayoutRangeReplace( mHandle,cast(LPCBYTE)html.ptr,html.length))==HLDOM_OK;}
	bool insert(HPOSITION pPos,char[] html){return (lastResult=HTMLayoutRangeInsertHtml( &pPos,cast(LPBYTE) html.ptr,html.length ))==HLDOM_OK;}
	bool isEmpty()
	{
		BOOL pResult;
		lastResult=HTMLayoutRangeIsEmpty( mHandle,&pResult );
		return cast(bool)pResult;
	}

	HLDOM_RESULT lastResult;
	char[] lastResultMsg()
	{
		if(lastResult==HLDOM_OK) return "HLDOM_OK - function completed successfully";
		else if(lastResult==HLDOM_INVALID_HWND) return "HLDOM_INVALID_HWND - invalid HWND";
		else if(lastResult==HLDOM_INVALID_HANDLE) return "HLDOM_INVALID_HANDLE - invalid HELEMENT";
		else if(lastResult==HLDOM_PASSIVE_HANDLE) return "HLDOM_PASSIVE_HANDLE - attempt to use HELEMENT which is not marked by HTMLayout_UseElement()";
		else if(lastResult==HLDOM_INVALID_PARAMETER) return "HLDOM_INVALID_PARAMETER - parameter is invalid,e.g. pointer is null";
		else if(lastResult==HLDOM_OPERATION_FAILED) return "HLDOM_OPERATION_FAILED";
		else return null;
	}

protected:
	HRANGE mHandle;
}
version (build) {
    debug {
        pragma(link, "debug-htmlayout");
    } else {
        pragma(link, "htmlayout");
    }
}
