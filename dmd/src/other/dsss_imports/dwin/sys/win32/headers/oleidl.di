// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2009  (dyuyan  gmail at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: May 2009

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/


module dwin.sys.win32.headers.oleidl;


private import dwin.sys.win32.com.Core;
private import tango.sys.win32.Types;
    

//private import win32.basetyps;
private import dwin.sys.win32.headers.objidl;
//private import win32.unknwn;
//private import win32.windef;
//private import win32.winuser;
//private import win32.wtypes;
//private import win32.objfwd; // for IMoniker
//private import win32.wingdi; // for LPLOGPALETTE

extern(Windows):


enum : uint
{	OLERENDER_NONE	= 0,
	OLERENDER_DRAW	= 1,
	OLERENDER_FORMAT	= 2,
	OLERENDER_ASIS	= 3
};

alias uint* LPOLERENDER;



//const MK_ALT = 32;

// D pass Interface by reference

alias IParseDisplayName LPPARSEDISPLAYNAME;
alias IOleContainer LPOLECONTAINER;
alias IOleClientSite LPOLECLIENTSITE;
alias IOleObject LPOLEOBJECT;
alias IDropTarget LPDROPTARGET;
alias IDropSource LPDROPSOURCE;
alias IEnumOLEVERB LPENUMOLEVERB;
alias IOleWindow LPOLEWINDOW;
alias IOleInPlaceUIWindow LPOLEINPLACEUIWINDOW;
alias IOleInPlaceActiveObject LPOLEINPLACEACTIVEOBJECT;
alias IOleInPlaceFrame LPOLEINPLACEFRAME;
alias IOleAdviseHolder LPOLEADVISEHOLDER;
//alias IViewObject LPVIEWOBJECT;
//alias IViewObject2 LPVIEWOBJECT2;
//alias IOleCache LPOLECACHE;
//alias IOleCache2 LPOLECACHE2;
//alias IOleCacheControl LPOLECACHECONTROL;


enum BINDSPEED {
	BINDSPEED_INDEFINITE = 1,
	BINDSPEED_MODERATE,
	BINDSPEED_IMMEDIATE
}

enum OLEWHICHMK {
	OLEWHICHMK_CONTAINER = 1,
	OLEWHICHMK_OBJREL,
	OLEWHICHMK_OBJFULL
}

enum OLEGETMONIKER {
	OLEGETMONIKER_ONLYIFTHERE = 1,
	OLEGETMONIKER_FORCEASSIGN,
	OLEGETMONIKER_UNASSIGN,
	OLEGETMONIKER_TEMPFORUSER
}

enum USERCLASSTYPE {
	USERCLASSTYPE_FULL = 1,
	USERCLASSTYPE_SHORT,
	USERCLASSTYPE_APPNAME
}

enum DROPEFFECT {
	DROPEFFECT_NONE   = 0,
	DROPEFFECT_COPY   = 1,
	DROPEFFECT_MOVE   = 2,
	DROPEFFECT_LINK   = 4,
	DROPEFFECT_SCROLL = 0x80000000
}

struct OLEMENUGROUPWIDTHS {
	LONG width[6];
}
alias OLEMENUGROUPWIDTHS* LPOLEMENUGROUPWIDTHS;

alias HGLOBAL HOLEMENU;

enum : uint {
	OLECLOSE_SAVEIFDIRTY,
	OLECLOSE_NOSAVE,
	OLECLOSE_PROMPTSAVE
}

struct OLEVERB {
	LONG lVerb;
	LPWSTR lpszVerbName;
	DWORD fuFlags;
	DWORD grfAttribs;
}
alias OLEVERB* LPOLEVERB;

alias RECT BORDERWIDTHS;
alias LPRECT LPBORDERWIDTHS;
alias RECT* LPCBORDERWIDTHS;

struct OLEINPLACEFRAMEINFO {
	UINT cb;
	BOOL fMDIApp;
	HWND hwndFrame;
	HACCEL haccel;
	UINT cAccelEntries;
}
alias OLEINPLACEFRAMEINFO* LPOLEINPLACEFRAMEINFO;

    interface IEnumOLEVERB : IUnknown {
      mixin(uuid("00000104-0000-0000-c000-000000000046"));
      // static DWINGUID IID = { 0x00000104, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int Next(uint celt, OLEVERB* rgelt, out uint pceltFetched);
      int Skip(uint celt);
      int Reset();
      int Clone(out IEnumOLEVERB ppenum);
    }
alias IEnumOLEVERB IEnumOleVerb;

/*
interface IEnumOLEVERB : IUnknown
{

    typedef [unique] IEnumOLEVERB *LPENUMOLEVERB;

    typedef struct tagOLEVERB {
        LONG    lVerb;
        LPOLESTR  lpszVerbName;
        DWORD   fuFlags;
        DWORD grfAttribs;
        } OLEVERB, * LPOLEVERB;

    // Bitwise verb attributes used in OLEVERB.grfAttribs
    typedef [v1_enum] enum tagOLEVERBATTRIB // bitwise
    {
        OLEVERBATTRIB_NEVERDIRTIES = 1,
        OLEVERBATTRIB_ONCONTAINERMENU = 2
    } OLEVERBATTRIB;

    [local]
    HRESULT Next(
        [in] ULONG celt,
        [out, size_is(celt), length_is(*pceltFetched)]
        LPOLEVERB rgelt,
        [out] ULONG *pceltFetched);

    [call_as(Next)]
    HRESULT RemoteNext(
        [in] ULONG celt,
        [out, size_is(celt), length_is(*pceltFetched)]
        LPOLEVERB rgelt,
        [out] ULONG *pceltFetched);

    HRESULT Skip(
        [in] ULONG celt);

    HRESULT Reset();

    HRESULT Clone(
        [out] IEnumOLEVERB **ppenum);
}
*/

extern (C) {
	extern DWINGUID IID_IParseDisplayName;
	extern DWINGUID IID_IOleContainer;
	extern DWINGUID IID_IOleItemContainer;
	extern DWINGUID IID_IOleClientSite;
	extern DWINGUID IID_IOleObject;
	extern DWINGUID IID_IOleWindow;
	extern DWINGUID IID_IOleInPlaceUIWindow;
	extern DWINGUID IID_IOleInPlaceObject;
	extern DWINGUID IID_IOleInPlaceActiveObject;
	extern DWINGUID IID_IOleInPlaceFrame;
	extern DWINGUID IID_IOleInPlaceSite;
	extern DWINGUID IID_IOleAdviseHolder;
	extern DWINGUID IID_IDropSource;
	extern DWINGUID IID_IDropTarget;
	extern DWINGUID IID_IViewObject;
	extern DWINGUID IID_IViewObject2;
	extern DWINGUID IID_IOleCache;
	extern DWINGUID IID_IOleCache2;
	extern DWINGUID IID_IOleCacheControl;
	// add miss IID_IDocHostUiHandler
	extern DWINGUID IID_IDocHostUIHandler;
}

/*
[
    object,
    uuid(0000011a-0000-0000-C000-000000000046),
    pointer_default(unique)
]

interface IParseDisplayName : IUnknown
{

    typedef [unique] IParseDisplayName *LPPARSEDISPLAYNAME;

    HRESULT ParseDisplayName
    (
        [in, unique] IBindCtx *pbc,
        [in] LPOLESTR pszDisplayName,
        [out] ULONG *pchEaten,
        [out] IMoniker **ppmkOut
    );

}*/

//checked
interface IParseDisplayName : public IUnknown {
    mixin(uuid("0000011a-0000-0000-C000-000000000046"));
	HRESULT ParseDisplayName(IBindCtx, wchar*, out ULONG, out IMoniker);
}

//  http://msdn2.microsoft.com/en-us/library/ms690160.aspx
//  OLECONTF contains a set of bitwise constants used in the IOleContainer::EnumObjects method. 
enum : DWORD
{ 
    OLECONTF_EMBEDDINGS    = 1, 
    OLECONTF_LINKS         = 2, 
    OLECONTF_OTHERS        = 4, 
    OLECONTF_ONLYUSER      = 8, 
    OLECONTF_ONLYIFRUNNING = 16
}

/*

[
    object,
    uuid(0000011b-0000-0000-C000-000000000046),
    pointer_default(unique)
]

interface IOleContainer : IParseDisplayName
{

    typedef [unique] IOleContainer *LPOLECONTAINER;

    HRESULT EnumObjects
    (
        [in] DWORD grfFlags,
        [out] IEnumUnknown **ppenum
    );

    HRESULT LockContainer
    (
        [in] BOOL fLock
    );
}
*/

interface IOleContainer : IParseDisplayName {
    mixin(uuid("0000011b-0000-0000-C000-000000000046"));
	HRESULT EnumObjects(DWORD, out IEnumUnknown);
	HRESULT LockContainer(BOOL);
}

/*
interface IOleItemContainer : public IOleContainer {
	HRESULT GetObject(wchar*,DWORD,IBindCtx*,REFIID,void**);
	HRESULT GetObjectStorage(wchar*,IBindCtx*,REFIID,void**);
	HRESULT IsRunning(wchar*);
}
*/

/*
[
    object,
    uuid(00000118-0000-0000-C000-000000000046),
    pointer_default(unique)
]

interface IOleClientSite : IUnknown
{

    typedef [unique] IOleClientSite * LPOLECLIENTSITE;

    HRESULT SaveObject
    (
        void
    );

    HRESULT GetMoniker
    (
        [in] DWORD dwAssign,
        [in] DWORD dwWhichMoniker,
        [out] IMoniker **ppmk
    );

    HRESULT GetContainer
    (
        [out] IOleContainer **ppContainer
    );

    HRESULT ShowObject
    (
        void
    );

    HRESULT OnShowWindow
    (
        [in] BOOL fShow
    );

    HRESULT RequestNewObjectLayout
    (
        void
    );

}
*/

// checked
interface IOleClientSite : IUnknown {
    mixin(uuid("00000118-0000-0000-C000-000000000046"));
	HRESULT SaveObject();
	HRESULT GetMoniker(DWORD,DWORD, out IMoniker);
	HRESULT GetContainer(out IOleContainer);
	HRESULT ShowObject();
	HRESULT OnShowWindow(BOOL);
	HRESULT RequestNewObjectLayout();
}

enum OLEMISC : uint {
  OLEMISC_RECOMPOSEONRESIZE = 0x1,
  OLEMISC_ONLYICONIC = 0x2,
  OLEMISC_INSERTNOTREPLACE = 0x4,
  OLEMISC_STATIC = 0x8,
  OLEMISC_CANTLINKINSIDE = 0x10,
  OLEMISC_CANLINKBYOLE1 = 0x20,
  OLEMISC_ISLINKOBJECT = 0x40,
  OLEMISC_INSIDEOUT = 0x80,
  OLEMISC_ACTIVATEWHENVISIBLE = 0x100,
  OLEMISC_RENDERINGISDEVICEINDEPENDENT = 0x200,
  OLEMISC_INVISIBLEATRUNTIME = 0x400,
  OLEMISC_ALWAYSRUN = 0x800,
  OLEMISC_ACTSLIKEBUTTON = 0x1000,
  OLEMISC_ACTSLIKELABEL = 0x2000,
  OLEMISC_NOUIACTIVATE = 0x4000,
  OLEMISC_ALIGNABLE = 0x8000,
  OLEMISC_SIMPLEFRAME = 0x10000,
  OLEMISC_SETCLIENTSITEFIRST = 0x20000,
  OLEMISC_IMEMODE = 0x40000,
  OLEMISC_IGNOREACTIVATEWHENVISIBLE = 0x80000,
  OLEMISC_WANTSTOMENUMERGE = 0x100000,
  OLEMISC_SUPPORTSMULTILEVELUNDO = 0x200000
}

/*


[
    object,
    uuid(00000112-0000-0000-C000-000000000046),
    pointer_default(unique)
]

interface IOleObject : IUnknown
{

    typedef [unique] IOleObject *LPOLEOBJECT;

    typedef enum tagOLEGETMONIKER
    {
        OLEGETMONIKER_ONLYIFTHERE = 1,
        OLEGETMONIKER_FORCEASSIGN = 2,
        OLEGETMONIKER_UNASSIGN    = 3,
        OLEGETMONIKER_TEMPFORUSER = 4
    } OLEGETMONIKER;

    typedef enum tagOLEWHICHMK
    {
        OLEWHICHMK_CONTAINER = 1,
        OLEWHICHMK_OBJREL    = 2,
        OLEWHICHMK_OBJFULL   = 3
    } OLEWHICHMK;

    typedef enum tagUSERCLASSTYPE
    {
        USERCLASSTYPE_FULL    = 1,
        USERCLASSTYPE_SHORT   = 2,
        USERCLASSTYPE_APPNAME = 3,
    } USERCLASSTYPE;

    typedef enum tagOLEMISC
    {
        OLEMISC_RECOMPOSEONRESIZE           = 0x00000001,
        OLEMISC_ONLYICONIC                  = 0x00000002,
        OLEMISC_INSERTNOTREPLACE            = 0x00000004,
        OLEMISC_STATIC                      = 0x00000008,
        OLEMISC_CANTLINKINSIDE              = 0x00000010,
        OLEMISC_CANLINKBYOLE1               = 0x00000020,
        OLEMISC_ISLINKOBJECT                = 0x00000040,
        OLEMISC_INSIDEOUT                   = 0x00000080,
        OLEMISC_ACTIVATEWHENVISIBLE         = 0x00000100,
        OLEMISC_RENDERINGISDEVICEINDEPENDENT= 0x00000200,
        OLEMISC_INVISIBLEATRUNTIME          = 0x00000400,
        OLEMISC_ALWAYSRUN                   = 0x00000800,
        OLEMISC_ACTSLIKEBUTTON              = 0x00001000,
        OLEMISC_ACTSLIKELABEL               = 0x00002000,
        OLEMISC_NOUIACTIVATE                = 0x00004000,
        OLEMISC_ALIGNABLE                   = 0x00008000,
        OLEMISC_SIMPLEFRAME                 = 0x00010000,
        OLEMISC_SETCLIENTSITEFIRST          = 0x00020000,
        OLEMISC_IMEMODE                     = 0x00040000,
        OLEMISC_IGNOREACTIVATEWHENVISIBLE   = 0x00080000,
        OLEMISC_WANTSTOMENUMERGE            = 0x00100000,
        OLEMISC_SUPPORTSMULTILEVELUNDO      = 0x00200000
    } OLEMISC;

    typedef enum tagOLECLOSE
    {
        OLECLOSE_SAVEIFDIRTY = 0,
        OLECLOSE_NOSAVE      = 1,
        OLECLOSE_PROMPTSAVE  = 2
    } OLECLOSE;

//IOleObject methods

    HRESULT SetClientSite
    (
        [in, unique] IOleClientSite *pClientSite
    );

    HRESULT GetClientSite
    (
        [out] IOleClientSite **ppClientSite
    );

    HRESULT SetHostNames
    (
        [in] wchar* szContainerApp,
        [in, unique] wchar* szContainerObj
    );

    HRESULT Close
    (
        [in] DWORD dwSaveOption
    );

    HRESULT SetMoniker
    (
        [in] DWORD dwWhichMoniker,
        [in, unique] IMoniker *pmk
    );

    HRESULT GetMoniker
    (
        [in] DWORD dwAssign,
        [in] DWORD dwWhichMoniker,
        [out] IMoniker **ppmk
    );

    HRESULT InitFromData
    (
        [in, unique] IDataObject *pDataObject,
        [in] BOOL fCreation,
        [in] DWORD dwReserved
    );

    HRESULT GetClipboardData
    (
        [in] DWORD dwReserved,
        [out] IDataObject **ppDataObject
    );

    HRESULT DoVerb
    (
        [in] LONG iVerb,
        [in, unique] LPMSG lpmsg,
        [in, unique] IOleClientSite *pActiveSite,
        [in] LONG lindex,
        [in] HWND hwndParent,
        [in, unique] RECT* lprcPosRect
    );

    HRESULT EnumVerbs
    (
        [out] IEnumOLEVERB **ppEnumOleVerb
    );

    HRESULT Update
    (
        void
    );

    HRESULT IsUpToDate
    (
        void
    );

    HRESULT GetUserClassID
    (
        [out] CLSID *pClsid
    );

    HRESULT GetUserType
    (
        [in] DWORD dwFormOfType,
        [out] wchar* *pszUserType
    );

    HRESULT SetExtent
    (
        [in] DWORD dwDrawAspect,
        [in] SIZEL *psizel
    );

    HRESULT GetExtent
    (
        [in] DWORD dwDrawAspect,
        [out] SIZEL *psizel
    );

    HRESULT Advise
    (
        [in, unique] IAdviseSink *pAdvSink,
        [out] DWORD *pdwConnection
    );

    HRESULT Unadvise
    (
        [in] DWORD dwConnection
    );

    HRESULT EnumAdvise
    (
        [out] IEnumSTATDATA **ppenumAdvise
    );

    HRESULT GetMiscStatus
    (
        [in] DWORD dwAspect,
        [out] DWORD *pdwStatus
    );

    HRESULT SetColorScheme
    (
        [in] LOGPALETTE *pLogpal
    );
}
*/





//checked
interface IOleObject : public IUnknown {
    mixin(uuid("00000112-0000-0000-C000-000000000046"));
	HRESULT SetClientSite(IOleClientSite);
	HRESULT GetClientSite(out IOleClientSite);
	HRESULT SetHostNames(wchar*,wchar*);
	HRESULT Close(DWORD);
	HRESULT SetMoniker(DWORD,IMoniker);
	HRESULT GetMoniker(DWORD,DWORD,IMoniker);
	HRESULT InitFromData(IDataObject,BOOL,DWORD);
	HRESULT GetClipboardData(DWORD, out IDataObject);
	HRESULT DoVerb(LONG,LPMSG,IOleClientSite,LONG,HWND,RECT*); //changed to IOleClientSite 
	HRESULT EnumVerbs(out IEnumOLEVERB);
	HRESULT Update();
	HRESULT IsUpToDate();
	HRESULT GetUserClassID(out DWINGUID);
	HRESULT GetUserType(DWORD, out wchar*);
	HRESULT SetExtent(DWORD,SIZEL*);
	HRESULT GetExtent(DWORD,SIZEL*);
	HRESULT Advise(IAdviseSink, out DWORD);
	HRESULT Unadvise(DWORD);
	HRESULT EnumAdvise(out IEnumSTATDATA);
	HRESULT GetMiscStatus(DWORD, out DWORD);
	HRESULT SetColorScheme(LOGPALETTE*);
}

//checked
interface IOleWindow : public IUnknown {
    mixin(uuid("00000114-0000-0000-C000-000000000046"));
	HRESULT GetWindow(out HWND);
	HRESULT ContextSensitiveHelp(BOOL);
}
/*
[
    object,
    uuid(00000114-0000-0000-C000-000000000046),
    pointer_default(unique)
]

interface IOleWindow : IUnknown
{

    typedef [unique] IOleWindow *LPOLEWINDOW;

    [input_sync]
    HRESULT GetWindow
    (
        [out] HWND *phwnd
    );

    HRESULT ContextSensitiveHelp
    (
        [in] BOOL fEnterMode
    );
}
*/
//checked
interface IOleInPlaceUIWindow : public IOleWindow {
    mixin(uuid("00000115-0000-0000-C000-000000000046"));
	HRESULT GetBorder(out RECT);
	HRESULT RequestBorderSpace(RECT*);
	HRESULT SetBorderSpace(RECT*);
	HRESULT SetActiveObject(IOleInPlaceActiveObject,wchar*);
}
/*

[
    object,
    uuid(00000115-0000-0000-C000-000000000046),
    pointer_default(unique)
]

interface IOleInPlaceUIWindow : IOleWindow
{

    typedef [unique] IOleInPlaceUIWindow *LPOLEINPLACEUIWINDOW;

    typedef RECT BORDERWIDTHS;

    typedef LPRECT LPBORDERWIDTHS;

    typedef LPCRECT LPCBORDERWIDTHS;


    [input_sync]
    HRESULT GetBorder
    (
        [out] LPRECT lprectBorder
    );

    [input_sync]
    HRESULT RequestBorderSpace
    (
        [in, unique] LPCBORDERWIDTHS pborderwidths
    );

    [input_sync]
    HRESULT SetBorderSpace
    (
        [in, unique] LPCBORDERWIDTHS pborderwidths
    );

  HRESULT SetActiveObject
    (
        [in, unique] IOleInPlaceActiveObject *pActiveObject,
    [in, string, unique] LPCOLESTR pszObjName
    );

}
*/
//checked
interface IOleInPlaceObject : public IOleWindow {
    mixin(uuid("00000113-0000-0000-C000-000000000046"));
	HRESULT InPlaceDeactivate();
	HRESULT UIDeactivate();
	HRESULT SetObjectRects(RECT*,RECT*);
	HRESULT ReactivateAndUndo();
}
/*
[
    object,
    uuid(00000113-0000-0000-C000-000000000046),
    pointer_default(unique)
]

interface IOleInPlaceObject : IOleWindow
{

    typedef [unique] IOleInPlaceObject *LPOLEINPLACEOBJECT;


    HRESULT InPlaceDeactivate
    (
        void
    );

    HRESULT UIDeactivate
    (
        void
    );

    [input_sync]
    HRESULT SetObjectRects
    (
        [in] LPCRECT lprcPosRect,
        [in] LPCRECT lprcClipRect
    );

    HRESULT ReactivateAndUndo
    (
        void
    );
}*/

//checked
interface IOleInPlaceActiveObject : public IOleWindow {
    mixin(uuid("00000117-0000-0000-C000-000000000046"));
	HRESULT TranslateAccelerator(LPMSG);
	HRESULT OnFrameWindowActivate(BOOL);
	HRESULT OnDocWindowActivate(BOOL);
	HRESULT ResizeBorder(RECT*,IOleInPlaceUIWindow,BOOL);
	HRESULT EnableModeless(BOOL);
}
/*

[
    object,
    uuid(00000117-0000-0000-C000-000000000046)
]

interface IOleInPlaceActiveObject : IOleWindow
{

    typedef [unique] IOleInPlaceActiveObject *LPOLEINPLACEACTIVEOBJECT;

    [local]
    HRESULT TranslateAccelerator
    (
        [in] LPMSG lpmsg
    );

    [call_as(TranslateAccelerator)]
    HRESULT RemoteTranslateAccelerator();

    [input_sync]
    HRESULT OnFrameWindowActivate
    (
        [in] BOOL fActivate
    );

    [input_sync]
    HRESULT OnDocWindowActivate
    (
        [in] BOOL fActivate
    );

    [local]
    HRESULT ResizeBorder
    (
        [in] LPCRECT prcBorder,
        [in, unique] IOleInPlaceUIWindow *pUIWindow,
        [in] BOOL fFrameWindow
    );

    [call_as(ResizeBorder), input_sync]
    HRESULT RemoteResizeBorder
    (
        [in] LPCRECT prcBorder,
        [in] REFIID riid,
        [in, unique, iid_is(riid)] IOleInPlaceUIWindow *pUIWindow,
        [in] BOOL fFrameWindow
    );

    HRESULT EnableModeless
    (
        [in] BOOL fEnable
    );

}
*/
//checked
interface IOleInPlaceFrame : public IOleInPlaceUIWindow {
    mixin(uuid("00000116-0000-0000-C000-000000000046"));
	HRESULT InsertMenus(void*, ref OLEMENUGROUPWIDTHS);
	HRESULT SetMenu(void*,HOLEMENU,HWND);
	HRESULT RemoveMenus(void*);
	HRESULT SetStatusText(wchar*);
	HRESULT EnableModeless(BOOL);
	HRESULT TranslateAccelerator(LPMSG,WORD);
}
//checked
interface IOleInPlaceSite  : public IOleWindow {
    mixin(uuid("00000119-0000-0000-C000-000000000046"));
	HRESULT CanInPlaceActivate();
	HRESULT OnInPlaceActivate();
	HRESULT OnUIActivate();

	HRESULT GetWindowContext(out IOleInPlaceFrame, out IOleInPlaceUIWindow,  out RECT, out RECT, ref OLEINPLACEFRAMEINFO);
	HRESULT Scroll(SIZE);
	HRESULT OnUIDeactivate(BOOL);
	HRESULT OnInPlaceDeactivate();
	HRESULT DiscardUndoState();
	HRESULT DeactivateAndUndo();
	HRESULT OnPosRectChange(RECT*);
}

//checked
interface IOleAdviseHolder : public IUnknown {
    mixin(uuid("00000111-0000-0000-C000-000000000046"));
	HRESULT Advise(IAdviseSink, out DWORD);
	HRESULT Unadvise(DWORD);
	HRESULT EnumAdvise(out IEnumSTATDATA);
	HRESULT SendOnRename(IMoniker);
	HRESULT SendOnSave();
	HRESULT SendOnClose();
}

//checked
interface IDropSource : public IUnknown {
    mixin(uuid("00000121-0000-0000-C000-000000000046"));
	HRESULT QueryContinueDrag(BOOL,DWORD);
	HRESULT GiveFeedback(DWORD);
}
//checked
interface IDropTarget : public IUnknown {
    mixin(uuid("00000122-0000-0000-C000-000000000046"));
	HRESULT DragEnter(IDataObject,DWORD,POINTL, out DWORD);
	HRESULT DragOver(DWORD,POINTL, out DWORD);
	HRESULT DragLeave();
	HRESULT Drop(IDataObject,DWORD,POINTL, out DWORD);
}

/*
extern (Windows) {
	alias BOOL function(DWORD) __IView_pfncont;
}
*/
/*
interface IViewObject : public IUnknown {
	HRESULT Draw(DWORD,LONG,PVOID,DVTARGETDEVICE*,HDC,HDC,LPCRECTL,LPCRECTL,__IView_pfncont pfnContinue,DWORD);
	HRESULT GetColorSet(DWORD,LONG,PVOID,DVTARGETDEVICE*,HDC,LPLOGPALETTE*);
	HRESULT Freeze(DWORD,LONG,PVOID,PDWORD);
	HRESULT Unfreeze(DWORD);
	HRESULT SetAdvise(DWORD,DWORD,IAdviseSink*);
	HRESULT GetAdvise(PDWORD,PDWORD,IAdviseSink**);
}
*/
/*
interface IViewObject2 : public IViewObject {
	HRESULT GetExtent(DWORD,LONG,DVTARGETDEVICE*,LPSIZEL);
}
*/
/*
interface IOleCache : public IUnknown {
	HRESULT Cache(FORMATETC*,DWORD,DWORD*);
	HRESULT Uncache(DWORD);
	HRESULT EnumCache(IEnumSTATDATA**);
	HRESULT InitCache(IDataObject);
	HRESULT SetData(FORMATETC*,STGMEDIUM*,BOOL);
}

interface IOleCache2 : public IOleCache {
	HRESULT UpdateCache(IDataObject,DWORD,LPVOID);
	HRESULT DiscardCache(DWORD);
}

interface IOleCacheControl : public IUnknown {
	HRESULT OnRun(IDataObject);
	HRESULT OnStop();
}
*/

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
