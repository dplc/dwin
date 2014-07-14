//wrapper for Andrew Fedoniouk's excellent HTMLayout (3.2.2.13) - http://www.terrainformatica.com/

//todo: make the event struct wrappers (i.e. HMouse, HKey, etc) return HElement everywhere, not HELEMENT
//todo: wrap HTMLayoutElementSetExpando, HTMLayoutElementGetExpando
//todo: complete HJson templates {fromAA,toAA,fromArray,toArray}; HJson.toString should work with arrays and maps maybe
//todo: wrap HRange propperly
//todo: handleEvent(size) followed by handleEvent(draw) makes draw to not work, but vice versa works
//todo: port Andrew's hpp behaviors (or get some ideas from them)
//todo: flowerd.skin: msgBox, SkinnedWindow.icon, dropped files (and other dropped stuff) handler, HSkinLite
//todo: add scripting support
//todo: add mootools style animator class

/*

changelog:

0.7
	JSON_VALUE.toString is not including the terminating null character for strings anymore
	added shortcuts for all HElement states (most of which are only getters; i.e. readOnly, disabled, checked, etc.)
	made HJson a separate class instead of alias of JSON_VALUE
	upadated to HTMLayout 3.2.2.13 (new HDataArrived members)
	added HJson.V_BYTES
	renamed HLayout.elementByUID to HLayout.getUID
	added HElement.location
	added HElement.isInside
	added flowerd.sharedlib, which can now load HTMLayout from memory
	added HBehavior.reset and HBehavior.resetAll . This is intended to be used if HTMLayout is unloaded and loaded again in the lifetime of the application

0.6
	renamed flowerd.flowerd to flowerd.dfl
	added flowerd.dwt
	added htmlayout.behavior.translatable
	removed HElement.setAttribute and HElement.setStyle and HElement.setState (these was because of flowerscript, which ain't gonna be)
	removed the Object parameter from all event handler delegates and put 'param' member in the appropriate struct instead
	added HDialogCreated struct
	changed the param of DOCUMENT_LOADED and DOCUMENT_COMPLETE notification to HReady instead of int
	renamed HElement.byId to HElement.getId and HElement.byTag to HElement.getTag
	renamed HElement.type to HElement.tag
	renamed HEventHandler.tag to HEventHandler.htag
	made this syntax possible: HElement.style["display"]="none";
	added HElement.handleStatic, HElement.unhandleStatic that will not erase the event handlers for the element when the HElement object is destoyed. I.e. the event handler will be GC proof. handleStatic will take precedence before handleEvent
	added HElement.opIndex, HElement.opIndexAssign which is working with the element's attrinutes
	added HELement.opCall, HScrollBar.opCall, HEditBox.opCall
	modified HLite.render to make use of the x and y parameters
	updated to HTMLayout 3.2.2.8 (drag and drop)
	updated to HTMLayout 3.2.2.5 (graphin)
	removed the dependency of DFL for Win32 headers, now using tango.sys.win32.Types
	fixed few potential bugs similar to the one in 0.5
	some small code cleanups

0.5
	fixed bug in HJson.opCall(char[])

0.4:
	fixed HElement.showPopup
	added HElement.showAsPopup, HElement.showAsPopupAt
	added additional parameter to HElement.addClass and HElement.delClass

0.3:
	added HJson.parse, JSon.toBool
	added missing alias for UI_STATE_CHANGED
	added HElement.hasClass, HElement.scrollPos(POINT), HElement.viewSize
	renamed HElement.setCapture to capture

0.2:
	wrapped all event structures. MOUSE_PARAMS becomes HMouse, etc. (params is omitted)
	aliased all METHOD_PARAMS derivatives like HXcall, HTextValue, etc. (params is omitted)
	wrapped JSON_VALUE (aliased as HJson; only partially tested)
	HElement is not increasing the ref count of the element by default anymore. call HElement.keep explicitly if you need it
	HLayoutBase,HLayout and HLite are now handling the events just like HElement (with handleEvent)
	added HElement.click, HElement.xcall
	added HEditBox, HScrollBar

0.1:
	first release

*/

module htmlayout.htmlayout;

public import htmlayout.capi;
public import htmlayout.events;
public import htmlayout.element;
public import htmlayout.graphin;
import tango.stdc.stringz;
import tango.text.convert.Utf;
import tango.io.device.File;
import tango.io.FilePath;
import tango.sys.Environment;
import tango.sys.win32.Types;

extern(Windows) BOOL OffsetViewportOrgEx(
  HDC hdc,         // handle to device context
  int nXOffset,    // horizontal offset
  int nYOffset,    // vertical offset
  LPPOINT lpPoint  // original origin
);

template EVENT_HANDLER_STRING0(char[] RETURNTYPE,char[] NAME,char[] TYPE,char[] EVENT)
{
	const EVENT_HANDLER_STRING0 =
	RETURNTYPE~" on"~NAME~"("~(TYPE.length?TYPE~" e":"")~") {return dg"~NAME~".call("~(TYPE.length?"e":"")~");}"~
	"protected alias Handlers!("~RETURNTYPE~(TYPE.length?","~TYPE:"")~") dg"~NAME~"_t;"~
	"protected dg"~NAME~"_t mdg"~NAME~";"~
	"protected dg"~NAME~"_t dg"~NAME~"(){if(mdg"~NAME~" is null) mdg"~NAME~"=new dg"~NAME~"_t; return mdg"~NAME~";}"~
	"bool handleEvent("~RETURNTYPE~" delegate("~(TYPE.length?TYPE:"")~") dg,Object param=null){return dg"~NAME~".add(dg,param);}"~
	"bool unhandleEvent("~RETURNTYPE~" delegate("~(TYPE.length?TYPE:"")~") dg){return dg"~NAME~".del(dg);}";
}

abstract class HLayoutBase : HEventHandler
{
	this(char[] mediatype="screen")
	{
		if(!mediaType(mediatype)) throw new Exception("Error setting media type");
	}

	HElement rootElement(){lastResult=HPR_INVALID_STATE;return null;}
	HElement findElement(INT x, INT y){lastResult=HPR_INVALID_STATE;return null;}
	bool mediaType(char[] mediatype){return false;}
	bool loadHTML(char[] url,char[] data){return false;}
	bool loadHTML(char[] file)
	{
		char[] buf;
		scope(exit) delete buf;
		try (buf=cast(char[])File.get(file));
		catch(Object o)
		{
			lastResult=HPRESULT.HPR_FILE_NOT_FOUND;
			return false;
		}
		return loadHTML((new FilePath(file)).absolute(tango.sys.Environment.Environment.cwd).toString,buf);
	}
	bool masterCSS(char[] data,bool append=true)
	{
		if(append) return cast(bool)HTMLayoutAppendMasterCSS(cast(LPCBYTE)data.ptr,data.length);
		else return cast(bool)HTMLayoutSetMasterCSS(cast(LPCBYTE)data.ptr,data.length);
	}
	bool renderBitmap(HBITMAP hbmp, INT x, INT y, INT w, INT h) {return false;}
	bool traverseUIEvent(UINT evt,PVOID eventCtlStruct,out bool bProcessed){return false;}
	bool declareElement(char[] type,UINT elementModel) {return cast(bool)HTMLayoutDeclareElementType(toStringz(type),elementModel);}

	HPRESULT lastResult;
	char[] lastResultMsg()
	{
		if(lastResult==HPR_OK) return "HPR_OK";
		else if(lastResult==HPR_INVALID_HANDLE) return "HPR_INVALID_HANDLE";
		else if(lastResult==HPR_INVALID_FORMAT) return "HPR_INVALID_FORMAT";
		else if(lastResult==HPR_FILE_NOT_FOUND) return "HPR_FILE_NOT_FOUND";
		else if(lastResult==HPR_INVALID_PARAMETER) return "HPR_INVALID_PARAMETER";
		else if(lastResult==HPR_INVALID_STATE) return "HPR_INVALID_STATE";
		else return null;
	}

	mixin(EVENT_HANDLER_STRING0!("bool","LoadData","HLoadData","HLN_LOAD_DATA"));
	mixin(EVENT_HANDLER_STRING0!("bool","DataLoaded","HDataLoaded","HLN_DATA_LOADED"));
	mixin(EVENT_HANDLER_STRING0!("bool","CreateControl","HCreateControl","HLN_CREATE_CONTROL"));
	mixin(EVENT_HANDLER_STRING0!("bool","ControlCreated","HControlCreated","HLN_CONTROL_CREATED"));
	mixin(EVENT_HANDLER_STRING0!("bool","DestroyControl","HDestroyControl","HLN_DESTROY_CONTROL"));
	mixin(EVENT_HANDLER_STRING0!("bool","AttachBehavior","HAttachBehavior","HLN_ATTACH_BEHAVIOR"));
	mixin(EVENT_HANDLER_STRING0!("bool","BehaviorChanged","HBehaviorChanged","HLN_BEHAVIOR_CHANGED"));
	mixin(EVENT_HANDLER_STRING0!("bool","Ready","HReady","HLN_DOCUMENT_COMPLETE+HLN_DOCUMENT_LOADED"));

protected:

	UINT mBaseCallback(LPNMHDR hdr)
	{
		if(hdr.code==HLN_CREATE_CONTROL) return onCreateControl(HCreateControl(cast(LPNMHL_CREATE_CONTROL)hdr));
		else if(hdr.code==HLN_CONTROL_CREATED) return onControlCreated(HControlCreated(cast(LPNMHL_CREATE_CONTROL)hdr));
		else if(hdr.code==HLN_LOAD_DATA) return onLoadData(HLoadData(cast(LPNMHL_LOAD_DATA)hdr));
		else if(hdr.code==HLN_DATA_LOADED) return onDataLoaded(HDataLoaded(cast(LPNMHL_DATA_LOADED)hdr));
		else if(hdr.code==HLN_DESTROY_CONTROL) return onDestroyControl(HDestroyControl(cast(LPNMHL_DESTROY_CONTROL)hdr));
		else if(hdr.code==HLN_ATTACH_BEHAVIOR)
		{
			auto a=HAttachBehavior(cast(LPNMHL_ATTACH_BEHAVIOR)hdr);
			if(onAttachBehavior(a)) return true;
			else
			{
				auto b=HBehavior.find(a.name);
				if(b)
				{
					a.elementProc=b.callback;
					a.elementTag=b.htag;
					a.elementEvents=b.events;
					return true;
				}
				else return false;
			}
		}
		else if(hdr.code==HLN_BEHAVIOR_CHANGED) return onBehaviorChanged(HBehaviorChanged(cast(LPNMHL_BEHAVIOR_CHANGED)hdr));
		else if(hdr.code==HLN_DOCUMENT_LOADED || hdr.code==HLN_DOCUMENT_COMPLETE) return onReady(HReady(hdr.code));
		else
		{
			//tango.io.Stdout.Stdout(cast(int)hdr.code).newline.flush;
			return false;
		}
	}

protected:
}

class HLite : HLayoutBase
{
	this(char[] mediatype="screen")
	{
		mHandle=HTMLiteCreateInstance();
		mHandles[mHandle]=this;
		mHandles.rehash;
		if(HTMLiteSetCallback(mHandle,&mCallback)!=HPR_OK) throw new Exception("Error setting HTMLite callback");
		super(mediatype);
	}
	~this()
	{
		mHandles.remove(mHandle);
		HTMLiteDestroyInstance(mHandle);
	}

	HElement rootElement()
	{
		HELEMENT hret;
		if((lastResult=HTMLiteGetRootElement(mHandle,&hret))==HPR_OK) return new HElement(hret);
		else return null;
	}

	HElement findElement(INT x, INT y)
	{
		HELEMENT hret;
		if((lastResult=HTMLiteFindElement(mHandle,x,y,&hret))==HPR_OK) return new HElement(hret);
		else return null;
	}

	bool loadHTML(char[] url,char[] data){return (lastResult=HTMLiteLoadHtmlFromMemory(mHandle,toString16z(.toString16(url)),cast(LPCBYTE)toStringz(data),data.length))==HPR_OK;}
	bool loadHTML(char[] file){return HTMLiteLoadHtmlFromFile(mHandle,toString16z(.toString16((new FilePath(file)).absolute(tango.sys.Environment.Environment.cwd).toString)))==HPR_OK;}
	bool mediaType(char[] mediatype){return (lastResult=HTMLiteSetMediaType(mHandle,toStringz(mediatype)))==HPR_OK;}

	HPRESULT measure(INT viewWidth, INT viewHeight) {return HTMLiteMeasure (mHandle,viewWidth,viewHeight);}
	HPRESULT render(HDC hdc, INT x, INT y, INT w, INT h)
	{
		POINT p;
		OffsetViewportOrgEx(hdc,x,y,&p);
		scope(exit) OffsetViewportOrgEx(hdc,p.x,p.y,null);
		return HTMLiteRender (mHandle,hdc,x,y,w,h);		
	}

	bool renderBitmap(HBITMAP hbmp, INT x, INT y, INT w, INT h) {return (lastResult=HTMLiteRenderOnBitmap (mHandle,hbmp,x,y,w,h))==HPR_OK;}
	HPRESULT dataReady(char[] url,void[] data){return HTMLiteSetDataReady (mHandle,toStringz(url),cast(LPCBYTE)data.ptr,data.length);}
	INT minWidth()
	{
		INT ret;
		if((lastResult=HTMLiteGetDocumentMinWidth(mHandle,&ret))==HPR_OK) return ret;
		else return -1;
	}
	INT minHeight()
	{
		INT ret;
		if((lastResult=HTMLiteGetDocumentMinHeight(mHandle,&ret))==HPR_OK) return ret;
		else return -1;
	}

	bool traverseUIEvent(UINT evt,PVOID eventCtlStruct,out bool bProcessed)
	{
		BOOL bOutProcessed;
		auto ret=cast(bool)HTMLiteTraverseUIEvent(mHandle,evt,eventCtlStruct,&bOutProcessed);
		bProcessed=cast(bool)bOutProcessed;
		return ret;
	}

	bool advanceFocus(UINT where)
	{
		BOOL res;
		if((lastResult=HTMLiteAdvanceFocus(mHandle,where,&res))==HPR_OK) return cast(bool)res;
		else return false;
	}

	mixin(EVENT_HANDLER_STRING0!("bool","RefreshArea","HRefreshArea","HLN_REFRESH_AREA"));
	mixin(EVENT_HANDLER_STRING0!("bool","SetTimer","HSetTimer","HLN_SET_TIMER"));
	mixin(EVENT_HANDLER_STRING0!("bool","SetCursor","HSetCursor","HLN_SET_CURSOR"));
	mixin(EVENT_HANDLER_STRING0!("bool","UpdateUI","","HLN_UPDATE_UI"));

protected:

	extern(Windows) static UINT mCallback(HTMLITE hLite,LPNMHDR hdr)
	{
		auto lite=hLite in mHandles;
		if(lite is null) throw new Exception("Error handling event");

		if(hdr.code==HLN_REFRESH_AREA) return lite.onRefreshArea(HRefreshArea(cast(LPNMHL_REFRESH_AREA)hdr));
		else if(hdr.code==HLN_SET_TIMER) return lite.onSetTimer(HSetTimer(cast(LPNMHL_SET_TIMER)hdr));
		else if(hdr.code==HLN_SET_CURSOR) return lite.onSetCursor(HSetCursor(cast(LPNMHL_SET_CURSOR)hdr));
		else if(hdr.code==HLN_UPDATE_UI) return lite.onUpdateUI();
		else return lite.mBaseCallback(hdr);
	}

	static HLite[HTMLITE] mHandles;
	HTMLITE mHandle;
}

class HLayout : HLayoutBase
{
	this(HWND handle,char[] mediatype="screen")
	{
		mHandle=handle;
		mHandles[mHandle]=this;
		mHandles.rehash;
		HTMLayoutSetCallback(mHandle,&mCallback,mHandle);
		super(mediatype);
	}

	static char[] className8() {return fromStringz(HTMLayoutClassNameA());}
	static wchar[] className16() {return fromString16z(HTMLayoutClassNameW());}
	bool dataReady(char[] uri,void[] data) {return cast(bool)HTMLayoutDataReady (mHandle, toString16z(toString16(uri)), cast(LPBYTE)data.ptr, data.length);}
	bool dataReadyAsync(char[] uri,void[] data, UINT dataType) {return cast(bool)HTMLayoutDataReadyAsync (mHandle, toString16z(toString16(uri)), cast(LPBYTE)data.ptr, data.length,dataType);}
	LRESULT defProc(UINT msg, WPARAM wParam, LPARAM lParam) {return HTMLayoutProc (mHandle, msg, wParam, lParam);}
	LRESULT defProcND(UINT msg, WPARAM wParam, LPARAM lParam, out bool pbHandled)
	{
		BOOL res;
		auto ret=HTMLayoutProcND (mHandle, msg, wParam, lParam, &res);
		pbHandled=cast(bool)res;
		return ret;
	}
	UINT minWidth() {return HTMLayoutGetMinWidth(mHandle);}
	UINT minHeight(UINT width) {return HTMLayoutGetMinHeight(mHandle,width);}
	bool loadHTML(char[] url,char[] data)
	{
		if(url is null) return cast(bool)HTMLayoutLoadHtml(mHandle,cast(LPCBYTE)(toStringz(data)),data.length);
		else return cast(bool)HTMLayoutLoadHtmlEx(mHandle,cast(LPCBYTE)(toStringz(data)),data.length,toString16z(.toString16(url)));
	}
	bool loadHTML(char[] file){return cast(bool)HTMLayoutLoadFile(mHandle,toString16z(.toString16((new FilePath(file)).absolute(tango.sys.Environment.Environment.cwd).toString)));}
	bool mediaType(char[] mediatype){return true;return cast(bool)HTMLayoutSetMediaType(mHandle,toString16z(toString16(mediatype)));}

	void mode(int HTMLayoutMode) {return HTMLayoutSetMode(mHandle,HTMLayoutMode);}
	bool selectionExist() {return cast(bool)HTMLayoutSelectionExist(mHandle);}
	char[] selectedHTML()
	{
		UINT pSize;
		auto ret=HTMLayoutGetSelectedHTML(mHandle,&pSize);
		return (cast(char*)ret)[0..pSize];
	}
	bool clipboardCopy() {return cast(bool)HTMLayoutClipboardCopy(mHandle);}
	HElement rootElement()
	{
		HELEMENT hret;
		if((lastResult=HTMLayoutGetRootElement(mHandle,&hret))==HLDOM_OK) return new HElement(hret);
		else return null;
	}

	HElement findElement(INT x, INT y)
	{
		HELEMENT hret;
		if((lastResult=HTMLayoutFindElement(mHandle,POINT(x,y),&hret))==HLDOM_OK) return new HElement(hret);
		else return null;
	}

	HElement focusElement()
	{
		HELEMENT hret;
		if((lastResult=HTMLayoutGetFocusElement(mHandle,&hret))==HLDOM_OK) return new HElement(hret);
		else return null;
	}

	HElement getUID(UINT uid)
	{
		HELEMENT hret;
		if((lastResult=HTMLayoutGetElementByUID(mHandle,uid,&hret))==HLDOM_OK) return new HElement(hret);
		else return null;
	}

	bool traverseUIEvent(UINT evt,PVOID eventCtlStruct,out bool bProcessed)
	{
		BOOL bOutProcessed;
		auto ret=cast(bool)HTMLayoutTraverseUIEvent(evt,eventCtlStruct,&bOutProcessed);
		bProcessed=cast(bool)bOutProcessed;
		return ret;
	}

	bool renderBitmap(HBITMAP hbmp, INT x, INT y, INT w, INT h) {return cast(bool)HTMLayoutRender(mHandle,hbmp,RECT(x,y,w,h));}

	UINT enumResources(bool delegate(char[] uri,char[] type,char[] imageData) dg)
	{
		synchronized
		{
			mEnumCallback=dg;
			return HTMLayoutEnumResources(mHandle,&mEnumResoureCallback);
		}
	}

	bool css(char[] data,char[] baseurl,char[] mediatype){return cast(bool)HTMLayoutSetCSS(mHandle,cast(LPCBYTE)data.ptr,data.length,toString16z(toString16(baseurl)), toString16z(toString16(mediatype)));}
	bool headers(char[] headers){return cast(bool)HTMLayoutSetHttpHeaders(mHandle,headers.ptr,headers.length);}
	bool setOption(UINT option,UINT value){return cast(bool)HTMLayoutSetOption(mHandle,option,value );}

	int dialog(POINT position, INT alignment, UINT style, UINT styleEx, LPHTMLAYOUT_NOTIFY notificationCallback, LPELEMENT_EVENT_PROC eventsCallback, LPVOID callbackParam, char[] html){INT_PTR ret=HTMLayoutDialog (mHandle, position, alignment, style, styleEx, notificationCallback, eventsCallback, callbackParam, cast(LPCBYTE) html.ptr, html.length); if(ret) return ret; else return -1;}

	bool _handleEvent(UINT subscription){return (lastResult=HTMLayoutWindowAttachEventHandler(mHandle,callback,htag,subscription))==HLDOM_OK;}
	bool _unhandleEvents(){return (lastResult=HTMLayoutWindowDetachEventHandler(mHandle,callback,htag))==HLDOM_OK;}

	HLDOM_RESULT lastResult;
	char[] lastResultMsg()
	{
		if(lastResult==HLDOM_OK) return "HLDOM_OK - function completed successfully";
		else if(lastResult==HLDOM_INVALID_HWND) return "HLDOM_INVALID_HWND - invalid HWND";
		else if(lastResult==HLDOM_INVALID_HANDLE) return "HLDOM_INVALID_HANDLE - invalid HELEMENT";
		else if(lastResult==HLDOM_PASSIVE_HANDLE) return "HLDOM_PASSIVE_HANDLE - attempt to use HELEMENT which is not marked by HTMLayout_UseElement()";
		else if(lastResult==HLDOM_INVALID_PARAMETER) return "HLDOM_INVALID_PARAMETER - parameter is invalid, e.g. pointer is null";
		else if(lastResult==HLDOM_OPERATION_FAILED) return "HLDOM_OPERATION_FAILED";
		else return null;
	}

	mixin(EVENT_HANDLER_STRING0!("bool","DialogCreated","HDialogCreated","HLN_DIALOG_CREATED"));
	mixin(EVENT_HANDLER_STRING0!("bool","DialogCloseRQ","HDialogCloseRQ","HLN_DIALOG_CLOSE_RQ"));

protected:

	static bool delegate(char[] uri,char[] type,char[] imageData) mEnumCallback;
	extern(Windows) static BOOL mEnumResoureCallback(LPCWSTR resourceUri, LPCSTR resourceType, LPCBYTE imageData, DWORD imageDataSize){return mEnumCallback(.toString(fromString16z(resourceUri)),fromStringz(resourceType),(cast(char*)imageData)[0..imageDataSize]);}

	extern(Windows) static LRESULT mCallback(UINT uMsg, WPARAM wParam, LPARAM lParam, LPVOID vParam)
	{
		LPNMHDR  hdr = cast(LPNMHDR)lParam;
		auto lay=cast(HWND)vParam in mHandles;
		if(lay is null) throw new Exception("Error handling event");

		if(hdr.code==HLN_DIALOG_CREATED) return lay.onDialogCreated(HDialogCreated(hdr));
		else if(hdr.code==HLN_DIALOG_CLOSE_RQ) return lay.onDialogCloseRQ(HDialogCloseRQ(cast(LPNMHL_DIALOG_CLOSE_RQ)hdr));
		else return lay.mBaseCallback(hdr);
	}

	static HLayout[HWND] mHandles;
	HWND mHandle;
}

version (build) {
    debug {
        pragma(link, "debug-htmlayout");
    } else {
        pragma(link, "htmlayout");
    }
}
