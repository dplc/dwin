module htmlayout.events;

import htmlayout.htmlayout;
import htmlayout.element;
import tango.core.Traits;
import tango.stdc.stringz;
import tango.text.convert.Utf;
import Int=tango.text.convert.Integer;
import tango.sys.win32.Types;

/*class MultiHandlers(EVENTYPE=uint,RETURNTYPE=bool,DELEGATE...)
{
	struct HANDLER
	{
		RETURNTYPE delegate(DELEGATE,Object) dg;
		Object param;
	}

	bool add(EVENTYPE event,RETURNTYPE delegate(DELEGATE,Object) dg,Object param=null)
	{
		if(!dg) return false;
		auto a=event in handlers;
		if(a) *a~=HANDLER(dg,param);
		else handlers[event]=[HANDLER(dg,param)];
		return true;
	}

	void del(EVENTYPE event){handlers.remove(event);}

	bool del(EVENTYPE event,RETURNTYPE delegate(DELEGATE,Object) dg)
	{
		if(!dg) return false;
		auto a=event in handlers;
		if(a)
		{
			foreach(i,d;*a)
			{
				if(d.dg is dg)
				{
					if((*a).length==1) handlers.remove(event);
					else
					{
						if(i==0) *a=(*a)[1..$];
						else if(i==(*a).length-1) *a=(*a)[0..i];
						else *a=(*a)[0..i]~(*a)[i+1..$];
						return true;
					}
				}
			}
		}
		return false;
	}

	bool toggle(EVENTYPE event,RETURNTYPE delegate(DELEGATE,Object) dg)
	{
		if(!del(event,dg)) return add(event,dg);
	}

	bool call(EVENTYPE event,DELEGATE data)
	{
		auto a=event in handlers;
		if(a)
		{
			static if(is(RETURNTYPE == void)) foreach(d;*a)
			{
				static if(data.length)
				{
					data[0].param=d.param;
					scope(exit) data[0].param=null;
				}
				d.dg(data);
			}
			else foreach(d;*a)
			{
				static if(data.length)
				{
					data[0].param=d.param;
					scope(exit) data[0].param=null;
				}
				if(d.dg(data)) return true;
			}
		}
		return false;
	}

	bool canHandle(EVENTYPE event){return (event in handlers) !is null;}

//protected:
	HANDLER[][EVENTYPE] handlers;
}*/

class Handlers(RETURNTYPE=bool,DATA...)
{
	struct HANDLER
	{
		RETURNTYPE delegate(DATA) dg;
		Object param;
	}

	bool add(RETURNTYPE delegate(DATA) dg,Object param=null)
	{
		if(!dg) return false;
		handlers~=HANDLER(dg,param);
		return true;
	}

	void del(){delete handlers; handlers=null;}

	bool del(RETURNTYPE delegate(DATA) dg)
	{
		if(!dg) return false;
		return flowerd.common.Array.remove(handlers,delegate(HANDLER h){return h.dg is dg;})>0;
	}

	bool toggle(RETURNTYPE delegate(DATA) dg)
	{
		if(!del(dg)) return add(dg);
        return false;
	}

	bool call(DATA data)
	{
		static if(is(RETURNTYPE == void)) foreach(d;handlers)
		{
			static if(data.length)
			{
				data[0].param=d.param;
				scope(exit) data[0].param=null;
			}
			d.dg(data);
		}
		else foreach(d;handlers)
		{
			static if(data.length)
			{
				data[0].param=d.param;
				scope(exit) data[0].param=null;
			}
			if(d.dg(data)) return true;
		}
		return false;
	}

//protected:
	HANDLER[] handlers;
}

template EVENT_HANDLER_STRING1(char[] RETURNTYPE,char[] NAME,char[] TYPE,char[] EVENT)
{
	const EVENT_HANDLER_STRING1 = 

	RETURNTYPE~" on"~NAME~"("~TYPE~" ev) {return  dg"~NAME~".call(ev);}"~
	"alias Handlers!("~RETURNTYPE~","~TYPE~") dg"~NAME~"_t;"~
	"protected dg"~NAME~"_t mdg"~NAME~";"~
	"dg"~NAME~"_t dg"~NAME~"(){if(mdg"~NAME~" is null) mdg"~NAME~"=new dg"~NAME~"_t; return mdg"~NAME~";}";
}

abstract class HEventHandler
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

	this(uint events=DISABLE_INITIALIZATION)
	{
		mHandlers[mTag=++mLastId]=this;
		mEvents=events;
	}

	bool dispatch(HELEMENT target,UINT event,LPVOID params)
	{
		if(event==HANDLE_INITIALIZATION){return onInit(HInitialization(target,cast(INITIALIZATION_PARAMS*)params));}
		else if(event==HANDLE_MOUSE){return onMouse(HMouse(target,cast(MOUSE_PARAMS*)params));}
		else if(event==HANDLE_KEY){return onKey(HKey(target,cast(KEY_PARAMS*)params));}
		else if(event==HANDLE_FOCUS){return onFocus(HFocus(target,cast(FOCUS_PARAMS*)params));}
		else if(event==HANDLE_DRAW){return onDraw(HDraw(target,cast(DRAW_PARAMS*)params));}
		else if(event==HANDLE_TIMER){return onTimer(HTimer(target));}
		else if(event==HANDLE_BEHAVIOR_EVENT){return onBehaviorEvent(HBehaviorEvent(target,cast(BEHAVIOR_EVENT_PARAMS*)params));}
		else if(event==HANDLE_METHOD_CALL){return onMethodCall(HMethod(target,cast(METHOD_PARAMS*)params));}
		else if(event==HANDLE_DATA_ARRIVED){return onDataArrived(HDataArrived(target,cast(DATA_ARRIVED_PARAMS*)params));}
		else if(event==HANDLE_SIZE){onSize(HSize(target));return false;}
		else if(event==HANDLE_SCROLL){return onScroll(HScroll(target,cast(SCROLL_PARAMS*)params));}
		else throw new Exception("Error handling behavior event");
		return false;
	}

	static HEventHandler find(void* tag)
	{
		auto h=cast(uint)tag in mHandlers;
		if(h) return *h;
		else return null;
	}

	uint events(){return mEvents;}
	void* htag(){return cast(void*)mTag;}
	ElementEventProc callback(){return &mHandler;}

protected:

	static uint mLastId;
	uint mTag,mEvents;

	static HEventHandler[uint] mHandlers;

	extern(Windows) static BOOL mHandler(LPVOID tag, HELEMENT he, UINT event, LPVOID params )
	{
		auto l=find(tag);
		if(l) return l.dispatch(he,event,params);
		return false;
	}
}

template EVENT_HANDLER_STRING2(char[] NAME,char[] EVENT)
{
	const EVENT_HANDLER_STRING2 = 

	"bool handleEvent(ReturnTypeOf!(on"~NAME~") delegate(ParameterTupleOf!(on"~NAME~")) dg,Object param=null){if(handleEvent("~EVENT~")) return dg"~NAME~".add(dg,param); else return false;}"~
	"bool unhandleEvent(ReturnTypeOf!(on"~NAME~") delegate(ParameterTupleOf!(on"~NAME~")) dg){return dg"~NAME~".del(dg);}";
}

abstract class HEventHandler2 : HEventHandler
{
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

	protected uint mSubscriptions;
	bool _handleEvent(UINT subscription){return false;}
	bool handleEvent(UINT subscription,bool force=false)
	{
		if(!force && mSubscriptions&subscription) return true;
		else
		{
			if(_handleEvent(subscription))
			{
				mSubscriptions|=subscription;
				return true;
			}
		}
		return false;
	}

	bool _unhandleEvents(){return false;}

	bool unhandleEvents(bool removehandlers=true)
	{
		if(_unhandleEvents())
		{
			if(removehandlers)
			{
				dgInit.del();
				dgMouse.del();
				dgKey.del();
				dgFocus.del();
				dgDraw.del();
				dgBehaviorEvent.del();
				dgMethodCall.del();
				dgDataArrived.del();
				dgSize.del();
				dgTimer.del();
				dgScroll.del();
			}
			return true;
		}
		else return false;
	}
}

abstract class HBehavior : HEventHandler
{
	this(char[] name,uint events=DISABLE_INITIALIZATION)
	{
		if(name.length==0) throw new Exception("Missing behavior name");
		super(events);
		mBehaviors[mName=name]=this;
	}

	void reset(){}

	static void resetAll() {foreach(b;mBehaviors) b.reset();}

	final static HBehavior find(char[] name)
	{
		auto h=name in mBehaviors;
		if(h) return *h;
		else return null;
	}

	char[] name(){return mName;}

private:
	char[] mName;
	static HBehavior[char[]] mBehaviors;
}

struct HLoadData
{
	LPNMHL_LOAD_DATA event;
	Object param;

	HElement Element;
	char[] uri(){return .toString(fromString16z(event.uri));}
	uint type(){return event.dataType;}
	HElement element(){if(Element) return Element; else return Element=new HElement(event.principal);}
}

struct HDataLoaded
{
	LPNMHL_DATA_LOADED event;
	Object param;

	char[] uri(){return .toString(fromString16z(event.uri));}
	char[] data(){return cast(char[])event.data[0..event.dataSize];}
	uint type(){return event.dataType;}
	uint status(){return event.status;}
}

struct HCreateControl
{
	LPNMHL_CREATE_CONTROL event;
	Object param;

	HElement Element;
	HElement element() {if(Element) return Element; else return Element=new HElement(event.helement);}
	HWND parent() {return event.inHwndParent;}
	HWND control(HWND ctrl) {return event.outControlHwnd=ctrl;}
}

typedef HCreateControl HControlCreated;

struct HDestroyControl
{
	LPNMHL_DESTROY_CONTROL event;
	Object param;

	HElement Element;
	HElement element(){if(Element) return Element; else return Element=new HElement(event.helement);}
	HWND control() {return event.inoutControlHwnd;}
	HWND control(HWND ctrl) {return event.inoutControlHwnd=ctrl;}
}

struct HAttachBehavior
{
	LPNMHL_ATTACH_BEHAVIOR event;
	Object param;
	  
	HElement Element;
	HElement element(){if(Element) return Element; else return Element=new HElement(event.element);}
	char[] name(){return fromStringz(event.behaviorName);}

	ElementEventProc elementProc(ElementEventProc e){return event.elementProc=e;}
	LPVOID elementTag(LPVOID e){return event.elementTag=e;}
	UINT elementEvents(UINT e){return event.elementEvents=e;}
}

struct HBehaviorChanged
{
	LPNMHL_BEHAVIOR_CHANGED event;
	Object param;

	HElement Element;
	HElement element(){if(Element) return Element; else return Element=new HElement(event.element);}
	char[] oldName(){return fromStringz(event.oldNames);}
	char[] newName(){return fromStringz(event.newNames);}
}

struct HRefreshArea
{
	LPNMHL_REFRESH_AREA event;
	Object param;

	RECT area(){return event.area;}
}

struct HSetTimer
{
	LPNMHL_SET_TIMER event;
	Object param;

	uint id(){return cast(uint)event.timerId;}
	uint time(){return event.elapseTime;}
}

struct HSetCursor
{
	LPNMHL_SET_CURSOR event;
	Object param;

	uint id(){return event.cursorId;}
	char* res()
	{
		static auto cursor_ids = 
		[
			"#32512\0", //IDC_ARROW
			"#32513\0", //IDC_IBEAM
			"#32514\0", //IDC_WAIT
			"#32515\0", //IDC_CROSS
			"#32516\0", //IDC_UPARROW
			"#32642\0", //IDC_SIZENWSE
			"#32643\0", //IDC_SIZENESW
			"#32644\0", //IDC_SIZEWE
			"#32645\0", //IDC_SIZENS
			"#32646\0", //IDC_SIZEALL
			"#32648\0", //IDC_NO
			"#32650\0", //IDC_APPSTARTING
			"#32651\0", //IDC_HELP
			"#32649\0", //IDC_HAND
		];
		return cursor_ids[id].ptr;
	}
}

struct HDialogCloseRQ
{
	LPNMHL_DIALOG_CLOSE_RQ event;
	Object param;

	bool cancel(bool c){return cast(bool)(event.outCancel=c);}
}

struct HDialogCreated
{
	LPNMHDR event;
	Object param;
}

alias HInitialization HInit;
struct HInitialization
{
	HELEMENT hElement;
	INITIALIZATION_PARAMS* event;
	Object param;

	HElement Element;
	HElement element(){if(Element) return Element; else return Element=new HElement(hElement);}

	UINT cmd(){return event.cmd;}
}

struct HMouse
{
	HELEMENT hElement;
	MOUSE_PARAMS* event;
	Object param;

	HElement Element;
	HElement element(){if(Element) return Element; else return Element=new HElement(hElement);}

	UINT cmd(){return event.cmd;}
	HELEMENT target(){return event.target;}
	POINT pos(){return event.pos;}
	POINT pos_document(){return event.pos_document;}
	UINT button_state(){return event.button_state;}
	UINT alt_state(){return event.alt_state;}
	UINT cursor_type(){return event.cursor_type;}
	BOOL is_on_icon(){return event.is_on_icon;}
	HELEMENT dragging() {return event.dragging;}
	UINT dragging_mode() {return event.dragging_mode;}
}

struct HKey
{
	HELEMENT hElement;
	KEY_PARAMS* event;
	Object param;

	HElement Element;
	HElement element(){if(Element) return Element; else return Element=new HElement(hElement);}

	UINT cmd(){return event.cmd;}
	HELEMENT target(){return event.target;}
	UINT key_code(){return event.key_code;}
	UINT alt_state(){return event.alt_state;}
}

struct HFocus
{
	HELEMENT hElement;
	FOCUS_PARAMS* event;
	Object param;

	HElement Element;
	HElement element(){if(Element) return Element; else return Element=new HElement(hElement);}

	UINT cmd(){return event.cmd;}
	HELEMENT target(){return event.target;}
	BOOL by_mouse_click(){return event.by_mouse_click;}
	BOOL cancel(){return event.cancel;}
	BOOL cancel(BOOL c){return event.cancel=c;}
}

struct HDraw
{
	HELEMENT hElement;
	DRAW_PARAMS* event;
	Object param;

	HElement Element;
	HElement element(){if(Element) return Element; else return Element=new HElement(hElement);}

	UINT cmd(){return event.cmd;}
	HDC hdc(){return event.hdc;}
	RECT area(){return event.area;}
	UINT reserved(){return event.reserved;}
}

struct HTimer
{
	HELEMENT hElement;
	Object param;

	HElement Element;
	HElement element(){if(Element) return Element; else return Element=new HElement(hElement);}
}

struct HBehaviorEvent
{
	HELEMENT hElement;
	BEHAVIOR_EVENT_PARAMS* event;
	Object param;

	HElement Element;
	HElement element(){if(Element) return Element; else return Element=new HElement(hElement);}

	UINT cmd(){return event.cmd;}
	HELEMENT heTarget(){return event.heTarget;}
	HELEMENT he(){return event.he;}
	UINT reason(){return event.reason;}
}

struct HMethod
{
	HELEMENT hElement;
	METHOD_PARAMS* event;
	Object param;

	HElement Element;
	HElement element(){if(Element) return Element; else return Element=new HElement(hElement);}

	UINT methodID(){return event.methodID;}
}

struct HDataArrived
{
	HELEMENT hElement;
	DATA_ARRIVED_PARAMS* event;
	Object param;

	HElement Element;
	HElement element(){if(Element) return Element; else return Element=new HElement(hElement);}

	HELEMENT initiator(){return event.initiator;}
	LPCBYTE data(){return event.data;}
	UINT dataSize(){return event.dataSize;}
	UINT dataType(){return event.dataType;}
	UINT status(){return event.status;}
	LPCWSTR uri(){return event.uri;}
}

struct HSize
{
	HELEMENT hElement;
	Object param;

	HElement Element;
	HElement element(){if(Element) return Element; else return Element=new HElement(hElement);}
}

struct HScroll
{
	HELEMENT hElement;
	SCROLL_PARAMS* event;
	Object param;

	HElement Element;
	HElement element(){if(Element) return Element; else return Element=new HElement(hElement);}

	UINT cmd(){return event.cmd;}
	HELEMENT target(){return event.target;}
	INT pos(){return event.pos;}
	BOOL vertical(){return event.vertical;}
}

struct HReady
{
	uint event;
	Object param;
}
version (build) {
    debug {
        pragma(link, "debug-htmlayout");
    } else {
        pragma(link, "htmlayout");
    }
}
