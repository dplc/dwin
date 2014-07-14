// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2009  (dyuyan  gmail at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: May 2009

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module dwin.sys.win32.headers.ocidl;

private import dwin.sys.win32.com.Core;
private import tango.sys.win32.Types; //for HANDLE, TEXTMETRIC
    alias TEXTMETRIC TEXTMETRICOLE;
    

private import dwin.sys.win32.headers.oleidl;
private import dwin.sys.win32.headers.oaidl;
//import "servprov.idl";
private import dwin.sys.win32.headers.urlmon;
private import dwin.sys.win32.headers.objidl; // for IPersist

extern(Windows):

/+
interface IEnumConnections;
interface IEnumConnectionPoints;
interface IConnectionPoint;
interface IConnectionPointContainer;

interface IClassFactory2;
interface IProvideClassInfo;
interface IProvideClassInfo2;
interface IProvideMultipleClassInfo;
interface IOleControl;
interface IOleControlSite;
interface IPropertyPage;
interface IPropertyPage2;
interface IPropertyPageSite;
interface IPropertyNotifySink;
interface ISpecifyPropertyPages;
interface IPersistMemory;
interface IPersistStreamInit;
interface IPersistPropertyBag;
interface ISimpleFrameSite;
interface IFont;
interface IPicture;
interface IFontEventsDisp;
interface IFontDisp;
interface IPictureDisp;

interface IAdviseSinkEx;
interface IOleInPlaceObjectWindowless;
interface IOleInPlaceSiteEx;
interface IOleInPlaceSiteWindowless;
interface IViewObjectEx;
interface IOleUndoUnit;
interface IOleParentUndoUnit;
interface IEnumOleUndoUnits;
interface IOleUndoManager;
interface IPointerInactive;
interface IObjectWithSite;

interface IErrorLog;
interface IPropertyBag;
interface IPerPropertyBrowsing;

interface IPropertyBag2;
interface IPersistPropertyBag2;

interface IQuickActivate;


#if !defined(_DCOM_OA_REMOTING_) && !defined(_DCOM_OC_REMOTING_)

[
  version(1.0), pointer_default(unique)
]

interface IOleControlTypes
{
    typedef [v1_enum] enum tagUASFLAGS {
        UAS_NORMAL          = 0x00,
        UAS_BLOCKED         = 0x01,
        UAS_NOPARENTENABLE  = 0x02,
        UAS_MASK            = 0x03
    } UASFLAGS;

    cpp_quote("/* State values for the DISPID_READYSTATE property */")
    typedef [v1_enum] enum tagREADYSTATE {
        READYSTATE_UNINITIALIZED= 0, // Never used except as default init state
        READYSTATE_LOADING      = 1, // Control is loading its properties
        READYSTATE_LOADED       = 2, // Has been init'ed via IPersist*::Load
        READYSTATE_INTERACTIVE  = 3, // Interactive but not all data available
        READYSTATE_COMPLETE     = 4  // Control has all its data
    } READYSTATE;

#if _MIDL_USER_MARSHAL_DISABLED

    #define HWND        UserHWND
    #define HACCEL      UserHACCEL
    #define HDC         UserHDC
    #define HFONT       UserHFONT
    #define MSG         UserMSG
    #define BSTR        UserBSTR
    #define VARIANT     UserVARIANT
    #define EXCEPINFO   UserEXCEPINFO

    typedef struct tagUserHWND {
        wireHWND pRemHwnd;
    } UserHWND;

    typedef struct tagUserHWND UserHACCEL;
    typedef struct tagUserHWND UserHDC;
    typedef struct tagUserHWND UserHFONT;

    typedef struct tagUserMSG {
        wireHWND pRemHwnd;
        UINT   message;
        WPARAM wParam;
        LPARAM lParam;
        DWORD  time;
        POINT  pt;
    } UserMSG;

    typedef struct tagUserBSTR {
        wireBSTR pBstrBlob;
    } UserBSTR;

    typedef struct tagVARIANT_BLOB {
        DWORD clSize;
        DWORD rpcReserved;
        [size_is(clSize-1)] ULONGLONG ahData[];
    } * wireVARIANT_BLOB;

    typedef struct tagUserVARIANT {
        wireVARIANT_BLOB pVarBlob;
    } UserVARIANT;

    typedef struct tagUserEXCEPINFO {
        WORD  wCode;
        WORD  wReserved;
        wireBSTR bstrSource;
        wireBSTR bstrDescription;
        wireBSTR bstrHelpFile;
        DWORD dwHelpContext;
        ULONG_PTR pvReserved;
        ULONG_PTR pfnDeferredFillIn;
        SCODE scode;
    } UserEXCEPINFO;

#endif // _MIDL_USER_MARSHAL_DISABLED
}


[
    object,
    uuid(B196B287-BAB4-101A-B69C-00AA00341D07),
    pointer_default(unique)
]

interface IEnumConnections : IUnknown
{
    typedef IEnumConnections * PENUMCONNECTIONS;
    typedef IEnumConnections * LPENUMCONNECTIONS;

    typedef struct tagCONNECTDATA {
        IUnknown *  pUnk;
        DWORD       dwCookie;
    } CONNECTDATA;

    typedef struct tagCONNECTDATA * PCONNECTDATA;
    typedef struct tagCONNECTDATA * LPCONNECTDATA;

    [local]
    HRESULT Next(
                [in]  ULONG cConnections,
                [out, size_is(cConnections), length_is(*pcFetched)]
                      LPCONNECTDATA rgcd,
                [out] ULONG * pcFetched
            );

    [call_as(Next)]
    HRESULT RemoteNext(
                [in]  ULONG cConnections,
                [out, size_is(cConnections), length_is(*pcFetched)]
                      LPCONNECTDATA rgcd,
                [out] ULONG * pcFetched
            );

    HRESULT Skip(
                [in]  ULONG cConnections
            );

    HRESULT Reset(
                void
            );

    HRESULT Clone(
                [out] IEnumConnections ** ppEnum
            );
}


[
    object,
    uuid(B196B286-BAB4-101A-B69C-00AA00341D07),
    pointer_default(unique)
]

interface IConnectionPoint : IUnknown
{
    typedef IConnectionPoint * PCONNECTIONPOINT;
    typedef IConnectionPoint * LPCONNECTIONPOINT;

    HRESULT GetConnectionInterface(
                [out] IID * pIID
            );

    HRESULT GetConnectionPointContainer(
                [out] IConnectionPointContainer ** ppCPC
            );

    HRESULT Advise(
                [in] IUnknown * pUnkSink,
                [out] DWORD * pdwCookie
            );

    HRESULT Unadvise(
                [in] DWORD dwCookie
            );

    HRESULT EnumConnections(
                [out] IEnumConnections ** ppEnum
    );
}


[
    object,
    uuid(B196B285-BAB4-101A-B69C-00AA00341D07),
    pointer_default(unique)
]

interface IEnumConnectionPoints : IUnknown
{
    typedef IEnumConnectionPoints * PENUMCONNECTIONPOINTS;
    typedef IEnumConnectionPoints * LPENUMCONNECTIONPOINTS;

    [local]
    HRESULT Next(
                [in] ULONG cConnections,
                [out, size_is(cConnections), length_is(*pcFetched)]
                      LPCONNECTIONPOINT * ppCP,
                [out] ULONG * pcFetched
            );

    [call_as(Next)]
    HRESULT RemoteNext(
                [in]  ULONG cConnections,
                [out, size_is(cConnections), length_is(*pcFetched)]
                      LPCONNECTIONPOINT * ppCP,
                [out] ULONG * pcFetched
            );

    HRESULT Skip(
                [in] ULONG cConnections
            );

    HRESULT Reset(
                void
            );

    HRESULT Clone(
                [out] IEnumConnectionPoints ** ppEnum
            );
}


[
    object,
    uuid(B196B284-BAB4-101A-B69C-00AA00341D07),
    pointer_default(unique)
]

interface IConnectionPointContainer : IUnknown
{
    typedef IConnectionPointContainer * PCONNECTIONPOINTCONTAINER;
    typedef IConnectionPointContainer * LPCONNECTIONPOINTCONTAINER;

    HRESULT EnumConnectionPoints
    (
        [out] IEnumConnectionPoints ** ppEnum
    );

    HRESULT FindConnectionPoint
    (
        [in] REFIID riid,
        [out] IConnectionPoint ** ppCP
    );
}
+/

    struct LICINFO {
      int cbLicInfo = LICINFO.sizeof;
      int fRuntimeKeyAvail;
      int fLicVerified;
    }
    alias LICINFO* LPLICINFO;    

/+
[
    object,
    uuid(B196B28F-BAB4-101A-B69C-00AA00341D07),
    pointer_default(unique)
]

interface IClassFactory2 : IClassFactory
{
    typedef IClassFactory2 * LPCLASSFACTORY2;

    typedef struct tagLICINFO {
        LONG cbLicInfo;
        BOOL fRuntimeKeyAvail;
        BOOL fLicVerified;
    } LICINFO;

    typedef struct tagLICINFO * LPLICINFO;

    HRESULT GetLicInfo(
                [out] LICINFO * pLicInfo
            );

    HRESULT RequestLicKey(
                [in] DWORD dwReserved,
                [out] BSTR * pBstrKey
            );

    [local]
    HRESULT CreateInstanceLic(
                [in] IUnknown * pUnkOuter,
                [in] IUnknown * pUnkReserved,
                [in] REFIID riid,
                [in] BSTR bstrKey,
                [out, iid_is(riid)] PVOID * ppvObj
            );

    [call_as(CreateInstanceLic)]
    HRESULT RemoteCreateInstanceLic(
                [in] REFIID riid,
                [in] BSTR bstrKey,
                [out, iid_is(riid)] IUnknown ** ppvObj
            );
}


[
    object,
    uuid(B196B283-BAB4-101A-B69C-00AA00341D07),
    pointer_default(unique)
]

interface IProvideClassInfo : IUnknown
{
    typedef IProvideClassInfo * LPPROVIDECLASSINFO;

    HRESULT GetClassInfo(
                [out] ITypeInfo ** ppTI
            );
}


[
    object,
    uuid(A6BC3AC0-DBAA-11CE-9DE3-00AA004BB851),
    pointer_default(unique)
]

interface IProvideClassInfo2 : IProvideClassInfo
{
    typedef IProvideClassInfo2 * LPPROVIDECLASSINFO2;

    typedef enum tagGUIDKIND {
        GUIDKIND_DEFAULT_SOURCE_DISP_IID = 1
    } GUIDKIND;

    HRESULT GetGUID(
                [in]  DWORD dwGuidKind,
                [out] GUID * pGUID
            );
}


[
    object,
    uuid(A7ABA9C1-8983-11cf-8F20-00805F2CD064),
    pointer_default(unique)
]

interface IProvideMultipleClassInfo : IProvideClassInfo2
{
    cpp_quote("#define MULTICLASSINFO_GETTYPEINFO           0x00000001")
    cpp_quote("#define MULTICLASSINFO_GETNUMRESERVEDDISPIDS 0x00000002")
    cpp_quote("#define MULTICLASSINFO_GETIIDPRIMARY         0x00000004")
    cpp_quote("#define MULTICLASSINFO_GETIIDSOURCE          0x00000008")
    cpp_quote("#define TIFLAGS_EXTENDDISPATCHONLY           0x00000001")

    typedef IProvideMultipleClassInfo * LPPROVIDEMULTIPLECLASSINFO;

    HRESULT GetMultiTypeInfoCount( 
                [out] ULONG * pcti
            );

    HRESULT GetInfoOfIndex( 
                [in]  ULONG iti,
                [in]  DWORD dwFlags,
                [out] ITypeInfo ** pptiCoClass,
                [out] DWORD * pdwTIFlags,
                [out] ULONG * pcdispidReserved,
                [out] IID   * piidPrimary,
                [out] IID   * piidSource
            );
}


[
    object,
    uuid(B196B288-BAB4-101A-B69C-00AA00341D07),
    pointer_default(unique)
]

interface IOleControl : IUnknown
{
    typedef IOleControl * LPOLECONTROL;

    typedef struct tagCONTROLINFO {
        ULONG  cb;
        HACCEL hAccel;
        USHORT cAccel;
        DWORD  dwFlags;
    } CONTROLINFO;

    typedef struct tagCONTROLINFO * LPCONTROLINFO;

    typedef enum tagCTRLINFO {
        CTRLINFO_EATS_RETURN = 1,
        CTRLINFO_EATS_ESCAPE = 2
    } CTRLINFO;

    HRESULT GetControlInfo(
                [out] CONTROLINFO * pCI
            );

    HRESULT OnMnemonic(
                [in] MSG * pMsg
            );

    HRESULT OnAmbientPropertyChange(
                [in] DISPID dispID
            );

    HRESULT FreezeEvents(
                [in] BOOL bFreeze
            );
}


[
    object,
    uuid(B196B289-BAB4-101A-B69C-00AA00341D07),
    pointer_default(unique)
]

interface IOleControlSite : IUnknown
{
    typedef IOleControlSite * LPOLECONTROLSITE;

    typedef struct tagPOINTF {
        FLOAT x;
        FLOAT y;
    } POINTF;

    typedef struct tagPOINTF * LPPOINTF;

    typedef enum tagXFORMCOORDS {
        XFORMCOORDS_POSITION            = 0x1,
        XFORMCOORDS_SIZE                = 0x2,
        XFORMCOORDS_HIMETRICTOCONTAINER = 0x4,
        XFORMCOORDS_CONTAINERTOHIMETRIC = 0x8,
        XFORMCOORDS_EVENTCOMPAT         = 0x10
    } XFORMCOORDS;

    HRESULT OnControlInfoChanged(
                void
            );

    HRESULT LockInPlaceActive(
                [in] BOOL fLock
            );

    HRESULT GetExtendedControl(
                [out] IDispatch ** ppDisp
            );

    HRESULT TransformCoords(
                [in, out] POINTL * pPtlHimetric,
                [in, out] POINTF * pPtfContainer,
                [in] DWORD dwFlags
            );

    HRESULT TranslateAccelerator(
                [in] MSG * pMsg,
                [in] DWORD grfModifiers
            );

    HRESULT OnFocus(
                [in] BOOL fGotFocus
            );

    HRESULT ShowPropertyFrame(
                void
            );
}


[
    object,
    uuid(B196B28D-BAB4-101A-B69C-00AA00341D07),
    pointer_default(unique)
]

interface IPropertyPage : IUnknown
{
    typedef IPropertyPage * LPPROPERTYPAGE;

    typedef struct tagPROPPAGEINFO {
        ULONG    cb;
        LPOLESTR pszTitle;
        SIZE     size;
        LPOLESTR pszDocString;
        LPOLESTR pszHelpFile;
        DWORD    dwHelpContext;
    } PROPPAGEINFO;

    typedef struct tagPROPPAGEINFO * LPPROPPAGEINFO;

    HRESULT SetPageSite(
                [in] IPropertyPageSite * pPageSite
            );

    HRESULT Activate(
                [in] HWND hWndParent,
                [in] LPCRECT pRect,
                [in] BOOL bModal
            );

    HRESULT Deactivate(
                void
            );

    HRESULT GetPageInfo(
                [out] PROPPAGEINFO * pPageInfo
            );

    HRESULT SetObjects(
                [in] ULONG cObjects,
                [in, size_is(cObjects)] IUnknown ** ppUnk
            );

    HRESULT Show(
                [in] UINT nCmdShow
            );

    HRESULT Move(
                [in] LPCRECT pRect
            );

    HRESULT IsPageDirty(
                void
            );

    HRESULT Apply(
                void
            );

    HRESULT Help(
                [in] LPCOLESTR pszHelpDir
            );

    HRESULT TranslateAccelerator(
                [in] MSG * pMsg
            );
}


[
    object,
    uuid(01E44665-24AC-101B-84ED-08002B2EC713),
    pointer_default(unique)
]

interface IPropertyPage2 : IPropertyPage
{
    typedef IPropertyPage2 * LPPROPERTYPAGE2;

    HRESULT EditProperty(
                [in] DISPID dispID
            );
}


[
    object,
    uuid(B196B28C-BAB4-101A-B69C-00AA00341D07),
    pointer_default(unique)
]

interface IPropertyPageSite : IUnknown
{
    typedef IPropertyPageSite * LPPROPERTYPAGESITE;

    typedef enum tagPROPPAGESTATUS {
        PROPPAGESTATUS_DIRTY    = 0x01,
        PROPPAGESTATUS_VALIDATE = 0x02,
        PROPPAGESTATUS_CLEAN    = 0x04
    } PROPPAGESTATUS;

    HRESULT OnStatusChange(
                [in] DWORD dwFlags
            );

    HRESULT GetLocaleID(
                [out] LCID * pLocaleID
            );

    HRESULT GetPageContainer(
                [out] IUnknown ** ppUnk
            );

    HRESULT TranslateAccelerator(
                [in] MSG * pMsg
            );
}


[
    object,
    uuid(9BFBBC02-EFF1-101A-84ED-00AA00341D07),
    pointer_default(unique)
]

interface IPropertyNotifySink : IUnknown
{
    typedef IPropertyNotifySink * LPPROPERTYNOTIFYSINK;

    HRESULT OnChanged(
                [in] DISPID dispID
            );

    HRESULT OnRequestEdit(
                [in] DISPID dispID
            );
}


[
    object,
    uuid(B196B28B-BAB4-101A-B69C-00AA00341D07),
    pointer_default(unique)
]

interface ISpecifyPropertyPages : IUnknown
{
    typedef ISpecifyPropertyPages * LPSPECIFYPROPERTYPAGES;

    typedef struct tagCAUUID {
        ULONG cElems;
        [size_is(cElems)] GUID * pElems;
    } CAUUID;

    typedef struct tagCAUUID * LPCAUUID;

    HRESULT GetPages(
                [out] CAUUID * pPages
            );
}


[
    object,
    uuid(BD1AE5E0-A6AE-11CE-BD37-504200C10000),
    pointer_default(unique)
]

interface IPersistMemory : IPersist
{
    typedef IPersistMemory * LPPERSISTMEMORY;

    HRESULT IsDirty(
                void
            );

    [local]
    HRESULT Load(
                [in, size_is(cbSize)] LPVOID pMem,
                [in] ULONG cbSize
            );

    [call_as(Load)]
    HRESULT RemoteLoad(
                [in, size_is(cbSize)] BYTE * pMem,
                [in] ULONG cbSize
            );

    [local]
    HRESULT Save(
                [out, size_is(cbSize)] LPVOID pMem,
                [in] BOOL fClearDirty,
                [in] ULONG cbSize
            );

    [call_as(Save)]
    HRESULT RemoteSave(
                [out, size_is(cbSize)] BYTE * pMem,
                [in] BOOL fClearDirty,
                [in] ULONG cbSize
            );

    HRESULT GetSizeMax(
                [out] ULONG * pCbSize
            );

    HRESULT InitNew(
                void
            );
}
+/

    interface IPersistStreamInit : IPersist { 
        mixin(uuid("7FD52380-4E07-101B-AE2D-08002B2EC713"));        
    //from regist {7FD52380-4E07-101B-AE2D-08002B2EC713}
        // static DWINGUID IID = {0x7FD52380,0x4E07,0x101B,0xAE,0x2D,0x08,0x00,0x2B,0x2E,0xC7,0x13};    
        int IsDirty(); 
        int Load(IStream pStm); 
        int Save(IStream pStm, int fClearDirty);
        int GetSizeMax(out ulong); 
        int InitNew(); 
    } 

    /*
[
    object,
    uuid(7FD52380-4E07-101B-AE2D-08002B2EC713),
    pointer_default(unique)
]

interface IPersistStreamInit : IPersist
{
    typedef IPersistStreamInit * LPPERSISTSTREAMINIT;

    HRESULT IsDirty(
                void
            );

    HRESULT Load(
                [in] LPSTREAM pStm
            );

    HRESULT Save(
                [in] LPSTREAM pStm,
                [in] BOOL fClearDirty
            );

    HRESULT GetSizeMax(
                [out] ULARGE_INTEGER * pCbSize
            );

    HRESULT InitNew(
                void
            );
}
*/


/+
[
    object,
    uuid(37D84F60-42CB-11CE-8135-00AA004BB851),
    pointer_default(unique)
]

interface IPersistPropertyBag : IPersist
{
    typedef IPersistPropertyBag * LPPERSISTPROPERTYBAG;

    HRESULT InitNew(
                void
            );

    HRESULT Load(
                [in] IPropertyBag * pPropBag,
                [in] IErrorLog * pErrorLog
            );

    HRESULT Save(
                [in] IPropertyBag * pPropBag,
                [in] BOOL fClearDirty,
                [in] BOOL fSaveAllProperties
            );
}


[
    object,
    uuid(742B0E01-14E6-101B-914E-00AA00300CAB),
    pointer_default(unique)
]

interface ISimpleFrameSite : IUnknown
{
    typedef ISimpleFrameSite * LPSIMPLEFRAMESITE;

    HRESULT PreMessageFilter(
                [in] HWND hWnd,
                [in] UINT msg,
                [in] WPARAM wp,
                [in] LPARAM lp,
                [out] LRESULT * plResult,
                [out] DWORD * pdwCookie
            );

    HRESULT PostMessageFilter(
                [in] HWND hWnd,
                [in] UINT msg,
                [in] WPARAM wp,
                [in] LPARAM lp,
                [out] LRESULT *plResult,
                [in] DWORD dwCookie
            );
}
+/

    interface IFont : IUnknown {
      mixin(uuid("BEF6E002-A874-101A-8BBA-00AA00300CAB"));
      // static DWINGUID IID = { 0xBEF6E002, 0xA874, 0x101A, 0x8B, 0xBA, 0x00, 0xAA, 0x00, 0x30, 0x0C, 0xAB };
      int get_Name(out wchar* pName);
      int set_Name(wchar* name);
      int get_Size(out long pSize);
      int set_Size(long size);
      int get_Bold(out int pBold);
      int set_Bold(int bold);
      int get_Italic(out int pItalic);
      int set_Italic(int italic);
      int get_Underline(out int pUnderline);
      int set_Underline(int underline);
      int get_Strikethrough(out int pStrikethrough);
      int set_Strikethrough(int strikethrough);
      int get_Weight(out short pWeight);
      int set_Weight(short weight);
      int get_Charset(out short pCharset);
      int set_Charset(short charset);
      int get_hFont(out HANDLE phFont);
      int Clone(out IFont ppFont);
      int IsEqual(IFont pFontOther);
      int SetRatio(int cyLogical, int cyHimetric);
      int QueryTextMetrics(out TEXTMETRICOLE pTM);
      int AddRefHfont(HANDLE hFont);
      int ReleaseHfont(HANDLE hFont);
      int SetHdc(HANDLE hDC);
    }



    /*
[
    object,
    uuid(BEF6E002-A874-101A-8BBA-00AA00300CAB),
    pointer_default(unique)
]

interface IFont : IUnknown
{
    typedef IFont * LPFONT;

cpp_quote("#if (defined(_WIN32) || defined (_WIN64)) && !defined(OLE2ANSI)")
    typedef TEXTMETRICW TEXTMETRICOLE;
cpp_quote("#else")
cpp_quote("typedef TEXTMETRIC TEXTMETRICOLE;")
cpp_quote("#endif")

    typedef TEXTMETRICOLE * LPTEXTMETRICOLE;

    HRESULT get_Name(
                [out] BSTR * pName
            );

    HRESULT put_Name(
                [in] BSTR name
            );

    HRESULT get_Size(
                [out] CY * pSize
            );

    HRESULT put_Size(
                [in] CY size
            );

    HRESULT get_Bold(
                [out] BOOL * pBold
            );

    HRESULT put_Bold(
                [in] BOOL bold
            );

    HRESULT get_Italic(
                [out] BOOL * pItalic
            );

    HRESULT put_Italic(
                [in] BOOL italic
            );

    HRESULT get_Underline(
                [out] BOOL * pUnderline
            );

    HRESULT put_Underline(
                [in] BOOL underline
            );

    HRESULT get_Strikethrough(
                [out] BOOL * pStrikethrough
            );

    HRESULT put_Strikethrough(
                [in] BOOL strikethrough
            );

    HRESULT get_Weight(
                [out] SHORT * pWeight
            );

    HRESULT put_Weight(
                [in] SHORT weight
            );

    HRESULT get_Charset(
                [out] SHORT * pCharset
            );

    HRESULT put_Charset(
                [in] SHORT charset
            );

    HRESULT get_hFont(
                [out] HFONT * phFont
            );

    HRESULT Clone(
                [out] IFont ** ppFont
            );

    HRESULT IsEqual(
                [in] IFont * pFontOther
            );

    HRESULT SetRatio(
                [in] LONG cyLogical,
                [in] LONG cyHimetric
            );

    HRESULT QueryTextMetrics(
                [out] TEXTMETRICOLE * pTM
            );

    HRESULT AddRefHfont(
                [in] HFONT hFont
            );

    HRESULT ReleaseHfont(
                [in] HFONT hFont
            );

    HRESULT SetHdc(
                [in] HDC hDC
            );
}
*/

    interface IPicture : IUnknown {
        mixin(uuid("7BF80980-BF32-101A-8BBB-00AA00300CAB"));
      // static DWINGUID IID = { 0x7BF80980, 0xBF32, 0x101A, 0x8B, 0xBB, 0x00, 0xAA, 0x00, 0x30, 0x0C, 0xAB };
      int get_Handle(out uint pHandle);
      int get_hPal(out uint phPal);
      int get_Type(out short pType);
      int get_Width(out int pWidth);
      int get_Height(out int pHeight);
      int Render(HANDLE hDC, int x, int y, int cx, int cy, int xSrc, int ySrc, int cxSrc, int cySrc, RECT* pRcBounds);
      int set_hPal(uint hPal);
      int get_CurDC(out HANDLE phDC);
      int SelectPicture(HANDLE hDCIn, out HANDLE phDCOut, out uint phBmpOut);
      int get_KeepOriginalFormat(out int pKeep);
      int put_KeepOriginalFormat(int keep);
      int PictureChanged();
      int SaveAsFile(IStream pStream, int fSaveMemCopy, out int pCbSize);
      int get_Attributes(out uint pDwAttr);
    }

/+
[
    object,
    uuid(7BF80980-BF32-101A-8BBB-00AA00300CAB),
    pointer_default(unique)
]

interface IPicture : IUnknown
{
    typedef IPicture * LPPICTURE;

    typedef enum tagPictureAttributes {
        PICTURE_SCALABLE    = 0x1,
        PICTURE_TRANSPARENT = 0x2
    } PICTUREATTRIBUTES;

    typedef [uuid(66504313-BE0F-101A-8BBB-00AA00300CAB), public] UINT OLE_HANDLE;
    typedef [uuid(66504306-BE0F-101A-8BBB-00AA00300CAB), hidden] LONG OLE_XPOS_HIMETRIC;
    typedef [uuid(66504307-BE0F-101A-8BBB-00AA00300CAB), hidden] LONG OLE_YPOS_HIMETRIC;
    typedef [uuid(66504308-BE0F-101A-8BBB-00AA00300CAB), hidden] LONG OLE_XSIZE_HIMETRIC;
    typedef [uuid(66504309-BE0F-101A-8BBB-00AA00300CAB), hidden] LONG OLE_YSIZE_HIMETRIC;

    HRESULT get_Handle(
                [out] OLE_HANDLE * pHandle
            );

    HRESULT get_hPal(
                [out] OLE_HANDLE * phPal
            );

    HRESULT get_Type(
                [out] SHORT * pType
            );

    HRESULT get_Width(
                [out] OLE_XSIZE_HIMETRIC * pWidth
            );

    HRESULT get_Height(
                [out] OLE_YSIZE_HIMETRIC * pHeight
            );

    HRESULT Render(
                [in] HDC hDC,
                [in] LONG x,
                [in] LONG y,
                [in] LONG cx,
                [in] LONG cy,
                [in] OLE_XPOS_HIMETRIC xSrc,
                [in] OLE_YPOS_HIMETRIC ySrc,
                [in] OLE_XSIZE_HIMETRIC cxSrc,
                [in] OLE_YSIZE_HIMETRIC cySrc,
                [in] LPCRECT pRcWBounds
            );

    HRESULT set_hPal(
                [in] OLE_HANDLE hPal
            );

    HRESULT get_CurDC(
                [out] HDC * phDC
            );

    HRESULT SelectPicture(
                [in] HDC hDCIn,
                [out] HDC * phDCOut,
                [out] OLE_HANDLE * phBmpOut
            );

    HRESULT get_KeepOriginalFormat(
                [out] BOOL * pKeep
            );

    HRESULT put_KeepOriginalFormat(
                [in] BOOL keep
            );

    HRESULT PictureChanged(
                void
            );

    HRESULT SaveAsFile(
                [in] LPSTREAM pStream,
                [in] BOOL fSaveMemCopy,
                [out] LONG * pCbSize
            );

    HRESULT get_Attributes(
                [out] DWORD * pDwAttr
            );
}
+/

    interface IFontEventsDisp : IDispatch {
      mixin(uuid("4ef6100a-af88-11d0-9846-00c04fc29993"));        
      // static DWINGUID IID = { 0x4EF6100A, 0xAF88, 0x11D0, 0x98, 0x46, 0x00, 0xC0, 0x4F, 0xC2, 0x99, 0x93 };
    }    
    
    /*
[
    object,
    uuid(4EF6100A-AF88-11D0-9846-00C04FC29993),
    pointer_default(unique)
]

interface IFontEventsDisp : IDispatch
{
    typedef IFontEventsDisp * LPFONTEVENTS;
}
*/
    
    interface IFontDisp : IDispatch {
       mixin(uuid("bef6e003-a874-101a-8bba-00aa00300cab"));        
      // static DWINGUID IID = { 0xBEF6E003, 0xA874, 0x101A, 0x8B, 0xBA, 0x00, 0xAA, 0x00, 0x30, 0x0C, 0xAB };
    }
/*    
[
    object,
    uuid(BEF6E003-A874-101A-8BBA-00AA00300CAB),
    pointer_default(unique)
]

interface IFontDisp : IDispatch
{
    typedef IFontDisp * LPFONTDISP;
}
    */
    
    interface IPictureDisp : IDispatch {
      mixin(uuid("7bf80981-bf32-101a-8bbb-00aa00300cab"));        
      // static DWINGUID IID = { 0x7BF80981, 0xBF32, 0x101A, 0x8B, 0xBB, 0x00, 0xAA, 0x00, 0x30, 0x0C, 0xAB };
    }      

/*
[
    object,
    uuid(7BF80981-BF32-101A-8BBB-00AA00300CAB),
    pointer_default(unique)
]

interface IPictureDisp : IDispatch
{
    typedef IPictureDisp * LPPICTUREDISP;
}
*/

//+---------------------------------------------------------------------------
//
//  Extensions to OLE and OLE Controls.
//
//----------------------------------------------------------------------------

/+
[
    local,
    object,
    pointer_default(unique),
    uuid(1C2056CC-5EF4-101B-8BC8-00AA003E3B29)
]

interface IOleInPlaceObjectWindowless : IOleInPlaceObject
{
    typedef IOleInPlaceObjectWindowless *LPOLEINPLACEOBJECTWINDOWLESS;

    HRESULT OnWindowMessage(
                [in] UINT msg,
                [in] WPARAM wParam,
                [in] LPARAM lParam,
                [out] LRESULT * plResult
            );

    HRESULT GetDropTarget(
                [out] IDropTarget ** ppDropTarget
            );
}


[
    object,
    pointer_default(unique),
    uuid(9C2CAD80-3424-11CF-B670-00AA004CD6D8)
]

interface IOleInPlaceSiteEx : IOleInPlaceSite
{
    typedef IOleInPlaceSiteEx * LPOLEINPLACESITEEX;

    typedef [v1_enum] enum tagACTIVATEFLAGS {
        ACTIVATE_WINDOWLESS = 1,
    } ACTIVATEFLAGS;

    HRESULT OnInPlaceActivateEx(
                [out] BOOL * pfNoRedraw,
                [in] DWORD dwFlags
            );

    HRESULT OnInPlaceDeactivateEx(
                [in] BOOL fNoRedraw
            );

    HRESULT RequestUIActivate(
                void
            );
}


[
    local,
    object,
    pointer_default(unique),
    uuid(922EADA0-3424-11CF-B670-00AA004CD6D8)
]

interface IOleInPlaceSiteWindowless : IOleInPlaceSiteEx
{
    typedef IOleInPlaceSiteWindowless * LPOLEINPLACESITEWINDOWLESS;

    typedef [v1_enum] enum tagOLEDCFLAGS {
        OLEDC_NODRAW     = 0x01,
        OLEDC_PAINTBKGND = 0x02,
        OLEDC_OFFSCREEN  = 0x04
    } OLEDCFLAGS;

    HRESULT CanWindowlessActivate(
                void
            );

    HRESULT GetCapture(
                void
            );

    HRESULT SetCapture(
                [in] BOOL fCapture
            );

    HRESULT GetFocus(
                void
            );

    HRESULT SetFocus(
                [in] BOOL fFocus
            );

    HRESULT GetDC(
                [in] LPCRECT pRect,
                [in] DWORD grfFlags,
                [out] HDC * phDC
            );

    HRESULT ReleaseDC(
                [in] HDC hDC
            );

    HRESULT InvalidateRect(
                [in] LPCRECT pRect,
                [in] BOOL fErase
            );

    HRESULT InvalidateRgn(
                [in] HRGN hRGN,
                [in] BOOL fErase
            );

    HRESULT ScrollRect(
                [in] INT dx,
                [in] INT dy,
                [in] LPCRECT pRectScroll,
                [in] LPCRECT pRectClip
            );

    HRESULT AdjustRect(
                [in, out] LPRECT prc
            );

    HRESULT OnDefWindowMessage(
                [in] UINT msg,
                [in] WPARAM wParam,
                [in] LPARAM lParam,
                [out] LRESULT * plResult
            );
}


[
    local,
    object,
    pointer_default(unique),
    uuid(3AF24292-0C96-11CE-A0CF-00AA00600AB8)
]

interface IViewObjectEx : IViewObject2
{
    typedef IViewObjectEx * LPVIEWOBJECTEX;

    typedef [v1_enum] enum tagVIEWSTATUS {
        VIEWSTATUS_OPAQUE               = 1,
        VIEWSTATUS_SOLIDBKGND           = 2,
        VIEWSTATUS_DVASPECTOPAQUE       = 4,
        VIEWSTATUS_DVASPECTTRANSPARENT  = 8,
        VIEWSTATUS_SURFACE              = 16,
        VIEWSTATUS_3DSURFACE            = 32
    } VIEWSTATUS;

    typedef [v1_enum] enum tagHITRESULT {
        HITRESULT_OUTSIDE       = 0,
        HITRESULT_TRANSPARENT   = 1,
        HITRESULT_CLOSE         = 2,
        HITRESULT_HIT           = 3
    } HITRESULT;

    typedef [v1_enum] enum tagDVASPECT2 {
        DVASPECT_OPAQUE         = 16,
        DVASPECT_TRANSPARENT    = 32,
    } DVASPECT2;

    typedef struct tagExtentInfo {
        ULONG   cb;
        DWORD   dwExtentMode;
        SIZEL   sizelProposed;
    } DVEXTENTINFO;

    typedef [v1_enum] enum tagExtentMode {
        DVEXTENT_CONTENT,
        DVEXTENT_INTEGRAL
    } DVEXTENTMODE;

    typedef [v1_enum] enum tagAspectInfoFlag {
        DVASPECTINFOFLAG_CANOPTIMIZE = 1
    } DVASPECTINFOFLAG;

    typedef struct tagAspectInfo {
        ULONG   cb;
        DWORD   dwFlags;
    } DVASPECTINFO;

    HRESULT GetRect(
                [in] DWORD dwAspect,
                [out] LPRECTL pRect
            );

    HRESULT GetViewStatus(
                [out] DWORD * pdwStatus
            );

    HRESULT QueryHitPoint(
                [in] DWORD dwAspect,
                [in] LPCRECT pRectBounds,
                [in] POINT ptlLoc,
                [in] LONG lCloseHint,
                [out] DWORD * pHitResult
            );

    HRESULT QueryHitRect(
                [in] DWORD dwAspect,
                [in] LPCRECT pRectBounds,
                [in] LPCRECT pRectLoc,
                [in] LONG lCloseHint,
                [out] DWORD * pHitResult
            );

    HRESULT GetNaturalExtent (
                [in] DWORD dwAspect,
                [in] LONG lindex,
                [in] DVTARGETDEVICE * ptd,
                [in] HDC hicTargetDev,
                [in] DVEXTENTINFO * pExtentInfo,
                [out] LPSIZEL pSizel
            );
}


[
    object,
    pointer_default(unique),
    uuid(894AD3B0-EF97-11CE-9BC9-00AA00608E01)
]

interface IOleUndoUnit : IUnknown
{
    typedef IOleUndoUnit * LPOLEUNDOUNIT;

    HRESULT Do(
                [in] IOleUndoManager * pUndoManager
            );

    HRESULT GetDescription(
                [out] BSTR * pBstr
            );

    HRESULT GetUnitType(
                [out] CLSID * pClsid,
                [out] LONG * plID
            );

    HRESULT OnNextAdd(
                void
            );
}


[
    object,
    pointer_default(unique),
    uuid(A1FAF330-EF97-11CE-9BC9-00AA00608E01)
]

interface IOleParentUndoUnit : IOleUndoUnit
{
    typedef IOleParentUndoUnit * LPOLEPARENTUNDOUNIT;

    HRESULT Open(
                [in] IOleParentUndoUnit * pPUU
            );

    HRESULT Close(
                [in] IOleParentUndoUnit * pPUU,
                [in] BOOL fCommit
            );

    HRESULT Add(
                [in] IOleUndoUnit * pUU
            );

    HRESULT FindUnit(
                [in] IOleUndoUnit * pUU
            );

    HRESULT GetParentState(
                [out] DWORD * pdwState
            );
}


[
    object,
    pointer_default(unique),
    uuid(B3E7C340-EF97-11CE-9BC9-00AA00608E01)
]

interface IEnumOleUndoUnits : IUnknown
{
    typedef IEnumOleUndoUnits * LPENUMOLEUNDOUNITS;

    [local]
    HRESULT Next(
                [in] ULONG cElt,
                [out, size_is(cElt), length_is(*pcEltFetched)]
                      IOleUndoUnit ** rgElt,
                [out] ULONG * pcEltFetched
            );

    [call_as(Next)]
    HRESULT RemoteNext(
                [in] ULONG cElt,
                [out, size_is(cElt), length_is(*pcEltFetched)]
                      IOleUndoUnit ** rgElt,
                [out] ULONG * pcEltFetched
            );

    HRESULT Skip(
                [in] ULONG cElt
            );

    HRESULT Reset(
                void
            );

    HRESULT Clone(
                [out] IEnumOleUndoUnits ** ppEnum
            );
}


[
    object,
    pointer_default(unique),
    uuid(D001F200-EF97-11CE-9BC9-00AA00608E01)
]

interface IOleUndoManager : IUnknown
{
cpp_quote("#define SID_SOleUndoManager IID_IOleUndoManager")

    typedef IOleUndoManager * LPOLEUNDOMANAGER;

    HRESULT Open(
                [in] IOleParentUndoUnit * pPUU
            );

    HRESULT Close(
                [in] IOleParentUndoUnit * pPUU,
                [in] BOOL fCommit   
            );

    HRESULT Add(
                [in] IOleUndoUnit * pUU
            );

    HRESULT GetOpenParentState(
                [out] DWORD * pdwState
            );

    HRESULT DiscardFrom(
                [in] IOleUndoUnit * pUU
            );

    HRESULT UndoTo(
                [in] IOleUndoUnit * pUU
            );

    HRESULT RedoTo(
                [in] IOleUndoUnit * pUU
            );

    HRESULT EnumUndoable(
                [out] IEnumOleUndoUnits ** ppEnum
            );

    HRESULT EnumRedoable(
                [out] IEnumOleUndoUnits ** ppEnum
            );

    HRESULT GetLastUndoDescription(
                [out] BSTR * pBstr
            );

    HRESULT GetLastRedoDescription(
                [out] BSTR * pBstr
            );

    HRESULT Enable(
                [in] BOOL fEnable
            );
}


[
    object,
    pointer_default(unique),
    uuid(55980BA0-35AA-11CF-B671-00AA004CD6D8)
]

interface IPointerInactive : IUnknown
{
    typedef IPointerInactive * LPPOINTERINACTIVE;

    typedef [v1_enum] enum tagPOINTERINACTIVE {
        POINTERINACTIVE_ACTIVATEONENTRY   = 1,
        POINTERINACTIVE_DEACTIVATEONLEAVE = 2,
        POINTERINACTIVE_ACTIVATEONDRAG    = 4
    } POINTERINACTIVE;

    HRESULT GetActivationPolicy(
                [out] DWORD * pdwPolicy
            );

    HRESULT OnInactiveMouseMove(
                [in] LPCRECT pRectBounds,
                [in] LONG x,
                [in] LONG y,
                [in] DWORD grfKeyState
            );

    HRESULT OnInactiveSetCursor(
                [in] LPCRECT pRectBounds,
                [in] LONG x,
                [in] LONG y,
                [in] DWORD dwMouseMsg,
                [in] BOOL fSetAlways
            );
}


[
    object,
    uuid(FC4801A3-2BA9-11CF-A229-00AA003D7352),
    pointer_default(unique)
]

interface IObjectWithSite : IUnknown
{
    typedef IObjectWithSite * LPOBJECTWITHSITE;

    HRESULT SetSite(
                [in] IUnknown * pUnkSite
            );

    HRESULT GetSite(
                [in] REFIID riid,
                [out, iid_is(riid)] void ** ppvSite
            );
}

#endif // #if !defined(_DCOM_OA_REMOTING_) && !defined(_DCOM_OC_REMOTING_)

#if !defined(_DCOM_OC_REMOTING_)



[
    object,
    uuid(376BD3AA-3845-101B-84ED-08002B2EC713),
    pointer_default(unique)
]


interface IPerPropertyBrowsing : IUnknown
{
    typedef IPerPropertyBrowsing * LPPERPROPERTYBROWSING;

    typedef struct tagCALPOLESTR {
        ULONG cElems;
        [size_is(cElems)] LPOLESTR * pElems;
    } CALPOLESTR;

    typedef struct tagCALPOLESTR * LPCALPOLESTR;

    typedef struct tagCADWORD {
        ULONG cElems;
        [size_is(cElems)] DWORD * pElems;
    } CADWORD;

    typedef struct tagCADWORD * LPCADWORD;

    HRESULT GetDisplayString(
                [in] DISPID dispID,
                [out] BSTR * pBstr
            );

    HRESULT MapPropertyToPage(
                [in] DISPID dispID,
                [out] CLSID * pClsid
            );

    HRESULT GetPredefinedStrings(
                [in] DISPID dispID,
                [out] CALPOLESTR * pCaStringsOut,
                [out] CADWORD * pCaCookiesOut
            );

    HRESULT GetPredefinedValue(
                [in] DISPID dispID,
                [in] DWORD dwCookie,
                [out] VARIANT * pVarOut
            );
}

#endif // #if !defined(_DCOM_OC_REMOTING_)


#if !defined(_NON_DCOM_REMOTING_) && !defined(_DCOM_OC_REMOTING_)


[
    object,
    uuid(22F55882-280B-11d0-A8A9-00A0C90C2004),
    pointer_default(unique)
]

interface IPropertyBag2 : IUnknown
{
    typedef IPropertyBag2 * LPPROPERTYBAG2;

    typedef [v1_enum] enum tagPROPBAG2_TYPE {
        PROPBAG2_TYPE_UNDEFINED = 0,
        PROPBAG2_TYPE_DATA      = 1,    // Value is simple data
        PROPBAG2_TYPE_URL       = 2,    // Value is a URL reference
        PROPBAG2_TYPE_OBJECT    = 3,    // Value is an object
        PROPBAG2_TYPE_STREAM    = 4,    // Value is a stream
        PROPBAG2_TYPE_STORAGE   = 5,    // Value is a storage
        PROPBAG2_TYPE_MONIKER   = 6     // Value is a moniker
    } PROPBAG2_TYPE;

    typedef struct tagPROPBAG2 {
        DWORD       dwType;             // Property type (from PROPBAG2_TYPE)
        VARTYPE     vt;                 // VARIANT property type
        CLIPFORMAT  cfType;             // Clipboard format (aka MIME-type)
        DWORD       dwHint;             // Property name hint
        LPOLESTR    pstrName;           // Property name
        CLSID       clsid;              // CLSID (for PROPBAG2_TYPE_OBJECT)
    } PROPBAG2;

    HRESULT Read(
                [in] ULONG cProperties,
                [in] PROPBAG2 * pPropBag,
                [in] IErrorLog * pErrLog,
                [out] VARIANT * pvarValue,
                [out] HRESULT * phrError
            );

    HRESULT Write(
                [in] ULONG cProperties,
                [in] PROPBAG2 * pPropBag,
                [in] VARIANT * pvarValue
            );

    HRESULT CountProperties(
                [out] ULONG * pcProperties
            );

    HRESULT GetPropertyInfo(
                [in] ULONG iProperty,
                [in] ULONG cProperties,
                [out] PROPBAG2 * pPropBag,
                [out] ULONG * pcProperties
            );

    HRESULT LoadObject(
                [in] LPCOLESTR pstrName,
                [in] DWORD dwHint,
                [in] IUnknown * pUnkObject,
                [in] IErrorLog * pErrLog
            );
}


[
    object,
    uuid(22F55881-280B-11d0-A8A9-00A0C90C2004),
    pointer_default(unique)
]

interface IPersistPropertyBag2 : IPersist
{
    typedef IPersistPropertyBag2 * LPPERSISTPROPERTYBAG2;

    HRESULT InitNew(
                void
            );

    HRESULT Load(
                [in] IPropertyBag2 * pPropBag,
                [in] IErrorLog * pErrLog
            );

    HRESULT Save(
                [in] IPropertyBag2 * pPropBag,
                [in] BOOL fClearDirty,
                [in] BOOL fSaveAllProperties
            );

    HRESULT IsDirty(
                void
            );
}

#endif // #if !defined(_NON_DCOM_REMOTING_) && !defined(_DCOM_OC_REMOTING_)

#if !defined(_NON_DCOM_REMOTING_) && !defined(_DCOM_OA_REMOTING_)

#if !defined(_DCOM_OC_REMOTING_)

[
    object,
    pointer_default(unique),
    uuid(3AF24290-0C96-11CE-A0CF-00AA00600AB8)
]

interface IAdviseSinkEx : IAdviseSink
{
    typedef IAdviseSinkEx * LPADVISESINKEX;

    [local]
    void OnViewStatusChange(
                [in] DWORD dwViewStatus
            );

    [call_as(OnViewStatusChange)]
    HRESULT RemoteOnViewStatusChange(
                [in] DWORD dwViewStatus
            );
}

#endif // #if !defined(_DCOM_OC_REMOTING_)

[
    object,
    pointer_default(unique),
    uuid(CF51ED10-62FE-11CF-BF86-00A0C9034836)
]

interface IQuickActivate : IUnknown
{
    typedef IQuickActivate * LPQUICKACTIVATE;

    typedef [v1_enum] enum tagQACONTAINERFLAGS {
        QACONTAINER_SHOWHATCHING      = 0x0001,
        QACONTAINER_SHOWGRABHANDLES   = 0x0002,
        QACONTAINER_USERMODE          = 0x0004,
        QACONTAINER_DISPLAYASDEFAULT  = 0x0008,
        QACONTAINER_UIDEAD            = 0x0010,
        QACONTAINER_AUTOCLIP          = 0x0020,
        QACONTAINER_MESSAGEREFLECT    = 0x0040,
        QACONTAINER_SUPPORTSMNEMONICS = 0x0080
    } QACONTAINERFLAGS;

    typedef [uuid(66504301-BE0F-101A-8BBB-00AA00300CAB), public] DWORD OLE_COLOR;
    
    typedef struct tagQACONTAINER {
        ULONG                   cbSize;
        IOleClientSite *        pClientSite;
        IAdviseSinkEx *         pAdviseSink;
        IPropertyNotifySink *   pPropertyNotifySink;
        IUnknown *              pUnkEventSink;
        DWORD                   dwAmbientFlags;
        OLE_COLOR               colorFore;
        OLE_COLOR               colorBack;
        IFont *                 pFont;
        IOleUndoManager *       pUndoMgr;
        DWORD                   dwAppearance;
        LONG                    lcid;
        HPALETTE                hpal;
        IBindHost *             pBindHost;
        IOleControlSite *       pOleControlSite;
        IServiceProvider *      pServiceProvider;
    } QACONTAINER;
    
    typedef struct tagQACONTROL {
        ULONG   cbSize;
        DWORD   dwMiscStatus;
        DWORD   dwViewStatus;
        DWORD   dwEventCookie;
        DWORD   dwPropNotifyCookie;
        DWORD   dwPointerActivationPolicy;
    } QACONTROL;

    [local]
    HRESULT QuickActivate(
                [in] QACONTAINER * pQaContainer,
                [in,out] QACONTROL * pQaControl
            );

    [call_as(QuickActivate)]
    HRESULT RemoteQuickActivate(
                [in] QACONTAINER * pQaContainer,
                [out] QACONTROL * pQaControl
            );

    HRESULT SetContentExtent(
                [in] LPSIZEL pSizel
            );

    HRESULT GetContentExtent(
                [out] LPSIZEL pSizel
            );
}

#endif // #if !defined(_NON_DCOM_REMOTING_) && !defined(_DCOM_OA_REMOTING_)

+/
version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
