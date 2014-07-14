// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2009  (dyuyan  gmail at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: May 2009

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/


module dwin.sys.win32.com.Types;

//private import tango.sys.win32.Types;

/*
    note: tango.sys.win32.Types conflicts with COM Types:
    GUID
    VARIANT

*/

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// COM Types Begin
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/**
    See_Also:
    http://msdn2.microsoft.com/en-us/library/aa768360.aspx
    added by yidabu
    Header Exdisp.h 
*/
/*
enum : DWORD
{
    navOpenInNewWindow = 0x1,
    navNoHistory = 0x2,
    navNoReadFromCache = 0x4,
    navNoWriteToCache = 0x8,
    navAllowAutosearch = 0x10,
    navBrowserBar = 0x20,
    navHyperlink = 0x40,
    navEnforceRestricted = 0x80,
    navNewWindowsManaged = 0x0100,
    navUntrustedForDownload = 0x0200,
    navTrustedForActiveX = 0x0400,
    navOpenInNewTab = 0x0800,
    navOpenInBackgroundTab = 0x1000,
    navKeepWordWheelText = 0x2000
} 
*/

//added by yidabu 20071005
// http://msdn2.microsoft.com/en-us/library/aa380337.aspx
// from win32.objbase
// for IPersistMoniker
/*
enum : DWORD
{
    STGM_DIRECT           = 0,
    STGM_TRANSACTED       = 0x10000L,
    STGM_SIMPLE           = 0x8000000L,
    STGM_READ             = 0,
    STGM_WRITE            = 1,
    STGM_READWRITE        = 2,
    STGM_SHARE_DENY_NONE  = 0x40,
    STGM_SHARE_DENY_READ  = 0x30,
    STGM_SHARE_DENY_WRITE = 0x20,
    STGM_SHARE_EXCLUSIVE  = 0x10,
    STGM_PRIORITY         = 0x40000L,
    STGM_DELETEONRELEASE  = 0x4000000,
    STGM_NOSCRATCH        = 0x100000,
    STGM_CREATE           = 0x1000,
    STGM_CONVERT          = 0x20000,
    STGM_NOSNAPSHOT       = 0x200000,
    STGM_FAILIFTHERE      = 0
}
*/

//  http://msdn2.microsoft.com/en-us/library/ms690160.aspx
//  OLECONTF contains a set of bitwise constants used in the IOleContainer::EnumObjects method. 
//oleidl
/*
enum : DWORD
{ 
    OLECONTF_EMBEDDINGS    = 1, 
    OLECONTF_LINKS         = 2, 
    OLECONTF_OTHERS        = 4, 
    OLECONTF_ONLYUSER      = 8, 
    OLECONTF_ONLYIFRUNNING = 16
}
*/



//from juno.com.core
//const ubyte DECIMAL_NEG = 0x80;

//winerror.h
/*
enum {
  TYPE_E_ELEMENTNOTFOUND      = 0x8002802B
}
*/

//com.Core
/*
enum {
  DISP_E_MEMBERNOTFOUND       = 0x80020003,
  DISP_E_PARAMNOTFOUND        = 0x80020004,
  DISP_E_TYPEMISMATCH         = 0x80020005,
  DISP_E_UNKNOWNNAME          = 0x80020006,
  DISP_E_NONAMEDARGS          = 0x80020007,
  DISP_E_BADVARTYPE           = 0x80020008,
  DISP_E_EXCEPTION            = 0x80020009,
  DISP_E_BADPARAMCOUNT        = 0x8002000E
}
*/

//winerror.h
/*
enum {
  CLASS_E_NOAGGREGATION       = 0x80040110,
  CLASS_E_CLASSNOTAVAILABLE   = 0x80040111
}
*/

//wtypes
/*
enum DVASPECT : uint {
  DVASPECT_CONTENT = 1,
  DVASPECT_THUMBNAIL = 2,
  DVASPECT_ICON = 4,
  DVASPECT_DOCPRINT = 8
}
*/

//oleidl
/*
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
*/


//oaidl
/*
struct SAFEARRAYBOUND {
  uint cElements;
  int lLbound;
}
*/

//come.Core SAFEARRAY
/*
enum : ushort {
  FADF_AUTO = 0x1,
  FADF_STATIC = 0x2,
  FADF_EMBEDDED = 0x4,
  FADF_FIXEDSIZE = 0x10,
  FADF_RECORD = 0x20,
  FADF_HAVEIID = 0x40,
  FADF_HAVEVARTYPE = 0x80,
  FADF_BSTR = 0x100,
  FADF_UNKNOWN = 0x200,
  FADF_DISPATCH = 0x400,
  FADF_VARIANT = 0x800,
  FADF_RESERVED = 0xF008
}
*/

/*
struct SAFEARRAY {
  ushort cDims;
  ushort fFeatures;
  uint cbElements;
  uint cLocks;
  void* pvData;
  SAFEARRAYBOUND[1] rgsabound;
}
*/
/*
struct DECIMAL {
  ushort wReserved;
  ubyte scale;
  ubyte sign;
  uint Hi32;
  uint Lo32;
  uint Mid32;
}
*/


/**
 * Identifies the type of a VARIANT.
 */
 //com.Core
 /+
enum /* VARENUM */ : ushort {
  //VT_EMPTY            = 0,
  //VT_NULL             = 1,
  //VT_I2               = 2,
  //VT_I4               = 3,
  //VT_R4               = 4,
  //VT_R8               = 5,
  VT_CY               = 6,
  VT_DATE             = 7,
  //VT_BSTR             = 8,
  VT_DISPATCH         = 9,
  //VT_ERROR            = 10,
  //VT_BOOL             = 11,
  VT_VARIANT          = 12,
  VT_UNKNOWN          = 13,
  VT_DECIMAL          = 14,
  VT_I1               = 16,
  //VT_UI1              = 17,
  VT_UI2              = 18,
  VT_UI4              = 19,
  VT_I8               = 20,
  VT_UI8              = 21,
  VT_INT              = 22,
  VT_UINT             = 23,
  VT_VOID             = 24,
  VT_HRESULT          = 25,
  VT_PTR              = 26,
  VT_SAFEARRAY        = 27,
  VT_CARRAY           = 28,
  VT_USERDEFINED      = 29,
  VT_LPSTR            = 30,
  VT_LPWSTR           = 31,
  VT_RECORD           = 36,
  VT_INT_PTR          = 37,
  VT_UINT_PTR         = 38,
  VT_FILETIME         = 64,
  VT_BLOB             = 65,
  VT_STREAM           = 66,
  VT_STORAGE          = 67,
  VT_STREAMED_OBJECT  = 68,
  VT_STORED_OBJECT    = 69,
  VT_BLOB_OBJECT      = 70,
  VT_CF               = 71,
  VT_CLSID            = 72,
  VT_VERSIONED_STREAM = 73,
  VT_BSTR_BLOB        = 0x0fff,
  VT_VECTOR           = 0x1000,
  VT_ARRAY            = 0x2000,
  //VT_BYREF            = 0x4000,
  //VT_RESERVED         = 0x8000
} alias ushort VARTYPE;

enum : short {
  VARIANT_TRUE = -1,
  VARIANT_FALSE = 0
} alias short VARIANT_BOOL;
+/

//com.Core
/*
enum : VARIANT_BOOL {
  com_true = VARIANT_TRUE,
  com_false = VARIANT_FALSE
} alias VARIANT_BOOL com_bool;
*/

//com.Core PROPVARIANT
/*
struct BSTRBLOB {
  uint cbSize = BSTRBLOB.sizeof;
  ubyte* pBlobData;
}
*/

/*
struct BLOB {
  uint cbSize = BLOB.sizeof;    //tango version not had .sizeof
  ubyte* pBlobData;
}
*/


//com.Core PROPVARIANT
/*
struct CAC {
  uint cElems;
  byte* pElems;
}

struct CAUB {
  uint cElems;
  ubyte* pElems;
}

struct CAI {
  uint cElems;
  short* pElems;
}

struct CAUI {
  uint cElems;
  ushort* pElems;
}

struct CAL {
  uint cElems;
  int* pElems;
}

struct CAUL {
  uint cElems;
  uint* pElems;
}

struct CAFLT {
  uint cElems;
  float* pElems;
}

struct CADBL {
  uint cElems;
  double* pElems;
}

struct CACY {
  uint cElems;
  long* pElems;
}

struct CADATE {
  uint cElems;
  double* pElems;
}

struct CABSTR {
  uint cElems;
  wchar** pElems;
}

struct CABSTRBLOB {
  uint cElems;
  BSTRBLOB* pElems;
}

struct CABOOL {
  uint cElems;
  VARIANT_BOOL* pElems;
}

struct CASCODE {
  uint cElems;
  int* pElems;
}


struct CAH {
  uint cElems;
  long* pElems;
}

struct CAUH {
  uint cElems;
  ulong* pElems;
}


struct CAFILETIME {
  uint cElems;
  FILETIME* pElems;
}
*/

//oaidl
/*
enum TYPEKIND {
  TKIND_ENUM,
  TKIND_RECORD,
  TKIND_MODULE,
  TKIND_INTERFACE,
  TKIND_DISPATCH,
  TKIND_COCLASS,
  TKIND_ALIAS,
  TKIND_UNION
}
*/

//oaidl
/*
struct TYPEDESC {
  union {
    TYPEDESC* lptdesc;
    ARRAYDESC* lpadesc;
    uint hreftype;
  }
  VARTYPE vt;
}
*/

//oaidl
/*
struct ARRAYDESC {
  TYPEDESC tdescElem;
  ushort cDims;
  SAFEARRAYBOUND[1] rgbounds;
}
*/

//oaidl
/*
enum : ushort {
  PARAMFLAG_NONE = 0x0,
  PARAMFLAG_FIN = 0x1,
  PARAMFLAG_FOUT = 0x2,
  PARAMFLAG_FLCID = 0x4,
  PARAMFLAG_FRETVAL = 0x8,
  PARAMFLAG_FOPT = 0x10,
  PARAMFLAG_FHASDEFAULT = 0x20,
  PARAMFLAG_FHASCUSTDATA = 0x40
}
*/

//oaidl
/*
struct IDLDESC {
  uint dwReserved;
  ushort wIDLFlags;
}
*/
// movied into stdole2

//oaidl
/*
struct EXCEPINFO {
  ushort wCode;
  ushort wReserved;
  wchar* bstrSource;
  wchar* bstrDescription;
  wchar* bstrHelpFile;
  uint dwHelpContext;
  void* pvReserved;
  int function(EXCEPINFO*) pfnDeferredFillIn;
  int scode;
}
*/

//oaidl
/*
enum CALLCONV {
  CC_FASTCALL,
  CC_CDECL,
  CC_MSPASCAL,
  CC_PASCAL = CC_MSPASCAL,
  CC_MACPASCAL,
  CC_STDCALL,
  CC_FPFASTCALL,
  CC_SYSCALL,
  CC_MPWCDECL,
  CC_MPWPASCAL
}
*/

// oaidl
/*
enum FUNCKIND {
  FUNC_VIRTUAL,
  FUNC_PUREVIRTUAL,
  FUNC_NONVIRTUAL,
  FUNC_STATIC,
  FUNC_DISPATCH
}
*/

//oaidl
/*
enum INVOKEKIND {
  INVOKE_FUNC = 1,
  INVOKE_PROPERTYGET = 2,
  INVOKE_PROPERTYPUT = 4,
  INVOKE_PROPERTYPUTREF = 8
}
*/

//oaidl
/*
enum VARKIND {
  VAR_PERSISTANCE,
  VAR_STATIC,
  VAR_CONST,
  VAR_DISPATCH
}
*/

//oaidl
/*
enum : ushort {
  IMPLTYPEFLAG_FDEFAULT = 0x1,
  IMPLTYPEFLAG_FSOURCE = 0x2,
  IMPLTYPEFLAG_FRESTRICTED = 0x4,
  IMPLTYPEFLAG_FDEFAULTVTABLE = 0x8
}
*/

//oaidl
/*
enum TYPEFLAGS : ushort {
  TYPEFLAG_FAPPOBJECT = 0x1,
  TYPEFLAG_FCANCREATE = 0x2,
  TYPEFLAG_FLICENSED = 0x4,
  TYPEFLAG_FPREDECLID = 0x8,
  TYPEFLAG_FHIDDEN = 0x10,
  TYPEFLAG_FCONTROL = 0x20,
  TYPEFLAG_FDUAL = 0x40,
  TYPEFLAG_FNONEXTENSIBLE = 0x80,
  TYPEFLAG_FOLEAUTOMATION = 0x100,
  TYPEFLAG_FRESTRICTED = 0x200,
  TYPEFLAG_FAGGREGATABLE = 0x400,
  TYPEFLAG_FREPLACEABLE = 0x800,
  TYPEFLAG_FDISPATCHABLE = 0x1000,
  TYPEFLAG_FREVERSEBIND = 0x2000,
  TYPEFLAG_FPROXY = 0x4000
}
*/

//oaidl
/*
enum FUNCFLAGS : ushort {
  FUNCFLAG_FRESTRICTED = 0x1,
  FUNCFLAG_FSOURCE = 0x2,
  FUNCFLAG_FBINDABLE = 0x4,
  FUNCFLAG_FREQUESTEDIT = 0x8,
  FUNCFLAG_FDISPLAYBIND = 0x10,
  FUNCFLAG_FDEFAULTBIND = 0x20,
  FUNCFLAG_FHIDDEN = 0x40,
  FUNCFLAG_FUSESGETLASTERROR = 0x80,
  FUNCFLAG_FDEFAULTCOLLELEM = 0x100,
  FUNCFLAG_FUIDEFAULT = 0x200,
  FUNCFLAG_FNONBROWSABLE = 0x400,
  FUNCFLAG_FREPLACEABLE = 0x800,
  FUNCFLAG_FIMMEDIATEBIND = 0x1000
}
*/

//oaidl
/*
enum VARFLAGS : ushort {
  VARFLAG_FREADONLY = 0x1,
  VARFLAG_FSOURCE = 0x2,
  VARFLAG_FBINDABLE = 0x4,
  VARFLAG_FREQUESTEDIT = 0x8,
  VARFLAG_FDISPLAYBIND = 0x10,
  VARFLAG_FDEFAULTBIND = 0x20,
  VARFLAG_FHIDDEN = 0x40,
  VARFLAG_FRESTRICTED = 0x80,
  VARFLAG_FDEFAULTCOLLELEM = 0x100,
  VARFLAG_FUIDEFAULT = 0x200,
  VARFLAG_FNONBROWSABLE = 0x400,
  VARFLAG_FREPLACEABLE = 0x800,
  VARFLAG_FIMMEDIATEBIND = 0x1000
}
*/

//oaidl
/*
enum DESCKIND {
  DESCKIND_NONE,
  DESCKIND_FUNCDESC,
  DESCKIND_VARDESC,
  DESCKIND_TYPECOMP,
  DESCKIND_IMPLICITAPPOBJ
}
*/

/*
enum SYSKIND {
  SYS_WIN16,
  SYS_WIN32,
  SYS_MAC,
  SYS_WIN64
}
*/

//oaidl
/+
enum /* LIBFLAGS */ : ushort {
  LIBFLAG_FRESTRICTED = 0x1,
  LIBFLAG_FCONTROL = 0x2,
  LIBFLAG_FHIDDEN = 0x4,
  LIBFLAG_FHASDISKIMAGE = 0x8
}
+/

//oaidl
/*
enum CHANGEKIND {
  CHANGEKIND_ADDMEMBER,
  CHANGEKIND_DELETEMEMBER,
  CHANGEKIND_SETNAMES,
  CHANGEKIND_SETDOCUMENTATION,
  CHANGEKIND_GENERAL,
  CHANGEKIND_INVALIDATE,
  CHANGEKIND_CHANGEFAILED,
  CHANGEKIND_MAX
}
*/

//objidl
/*
struct COAUTHIDENTITY {
  wchar* User;
  uint UserLength;
  wchar* Domain;
  uint DomainLength;
  wchar* Password;
  uint PasswordLength;
}

struct COAUTHINFO {
  uint dwAuthnSvc;
  uint dwAuthzSvc;
  wchar* pwszServerPrincName;
  uint dwAuthnLevel;
  uint dwImpersonationLevel;
  COAUTHIDENTITY* pAuthIdentityData;
  uint dwCapabilities;
}
*/

//defined in objidl
/*
struct COSERVERINFO {
  uint dwReserved1;
  wchar* pwszName;
  COAUTHINFO* pAuthInfo;
  uint dwReserved2;
}
*/

//objidl
/*
enum : uint {
  STGTY_STORAGE = 1,
  STGTY_STREAM = 2,
  STGTY_LOCKBYTES = 3,
  STGTY_PROPERTY = 4
}
*/

//objidl
/*
enum : uint {
  STREAM_SEEK_SET,
  STREAM_SEEK_CUR,
  STREAM_SEEK_END
}
*/

//wtypes.h
/*
    enum STATFLAG : uint {
      STATFLAG_DEFAULT,
      STATFLAG_NONAME,
      STATFLAG_NOOPEN
    }
  */  
    //oelauto
    /*
    enum : uint {
      VARIANT_NOVALUEPROP = 0x1,
      VARIANT_ALPHABOOL = 0x2,
      VARIANT_NOUSEROVERRIDE = 0x4,
      VARIANT_CALENDAR_HIJRI = 0x8,
      VARIANT_LOCALBOOL = 0x10,
      VARIANT_CALENDAR_THAI = 0x20,
      VARIANT_CALENDAR_GREGORIAN = 0x40,
      VARIANT_USE_NLS = 0x80
    }   
    */

    //defined in olectl, not used now
    /*
    struct PICTDESC {
      uint cbSizeofStruct = PICTDESC.sizeof;
      uint picType;
      HANDLE handle;
    }    
    */
    
    //defined in olequto, com.Core
    /*
    enum : ushort {
      DISPATCH_METHOD         = 0x1,
      DISPATCH_PROPERTYGET    = 0x2,
      DISPATCH_PROPERTYPUT    = 0x4,
      DISPATCH_PROPERTYPUTREF = 0x8
    }
    */

    //com.Core
/*    
enum DispatchFlags : ushort {
  InvokeMethod    = DISPATCH_METHOD,
  GetProperty     = DISPATCH_PROPERTYGET,
  PutProperty     = DISPATCH_PROPERTYPUT,
  PutRefProperty  = DISPATCH_PROPERTYPUTREF
}    
*/
    
    
    //defined in oaidl, com.Core
/*
    enum {
      DISPID_UNKNOWN = -1,
      DISPID_VALUE = 0,
      DISPID_PROPERTYPUT = -3,
      DISPID_NEWENUM = -4,
      DISPID_EVALUATE = -5,
      DISPID_CONSTRUCTOR = -6,
      DISPID_DESTRUCTOR = -7,
      DISPID_COLLECT = -8
    }
  */  
    //objbase
    /*
    enum : uint {
      COINIT_MULTITHREADED = 0x0,
      COINIT_APARTMENTTHREADED = 0x2,
      COINIT_DISABLE_OLE1DDE = 0x4,
      COINIT_SPEED_OVER_MEMORY = 0x8
    }
    */
    
    //defined in wtypes
    /*
enum : uint {
  CLSCTX_INPROC_SERVER = 0x1,
  CLSCTX_INPROC_HANDLER = 0x2,
  CLSCTX_LOCAL_SERVER = 0x4,
  CLSCTX_INPROC_SERVER16 = 0x8,
  CLSCTX_REMOTE_SERVER = 0x10,
  CLSCTX_INPROC_HANDLER16 = 0x20,
  CLSCTX_INPROC = CLSCTX_INPROC_SERVER | CLSCTX_INPROC_HANDLER,
  CLSCTX_SERVER = CLSCTX_INPROC_SERVER | CLSCTX_LOCAL_SERVER | CLSCTX_REMOTE_SERVER,
  CLSCTX_ALL = CLSCTX_INPROC_SERVER | CLSCTX_INPROC_HANDLER | CLSCTX_LOCAL_SERVER | CLSCTX_REMOTE_SERVER
}
*/
    
//oleauto
/*
    enum REGKIND {
      REGKIND_DEFAULT,
      REGKIND_REGISTER,
      REGKIND_NONE
    }
*/

//tango.sys.win32.Types
/*
    struct TEXTMETRICOLE {
      int tmHeight;
      int tmAscent;
      int tmDescent;
      int tmInternalLeading;
      int tmExternalLeading;
      int tmAveCharWidth;
      int tmMaxCharWidth;
      int tmWeight;
      int tmOverhang;
      int tmDigitizedAspectX;
      int tmDigitizedAspectY;
      wchar tmFirstChar;
      wchar tmLastChar;
      wchar tmDefaultChar;
      wchar tmBreakChar;
      ubyte tmItalic;
      ubyte tmUnderlined;
      ubyte tmStruckOut;
      ubyte tmPitchAndFamily;
      ubyte tmCharSet;
    }
*/

    //ocidl
    /*
    struct LICINFO {
      int cbLicInfo = LICINFO.sizeof;
      int fRuntimeKeyAvail;
      int fLicVerified;
    }
    */

    //oleauto
    /*
    enum : uint {
      ACTIVEOBJECT_STRONG,
      ACTIVEOBJECT_WEAK
    }
    */
    
    //oleidl
    /*
    struct OLEVERB {
      int lVerb;
      wchar* lpszVerbName;
      uint fuFlags;
      uint grfAttribs;
    }
    */
    
    //objidl
    /*
    struct DVTARGETDEVICE {
      uint tdSize;
      ushort tdDriverNameOffset;
      ushort tdDeviceNameOffset;
      ushort tdPortNameOffset;
      ushort tdExtDevmodeOffset;
      ubyte* tdData;
    }
    */

    //objidl
    /*
    struct FORMATETC {
      ushort cfFormat;
      DVTARGETDEVICE* ptd;
      uint dwAspect;
      int lindex;
      uint tymed;
    }
    */
    
    //objidl
    /*
    struct BIND_OPTS {
      uint cbStruct = BIND_OPTS.sizeof;
      uint grfFlags;
      uint grfMode;
      uint dwTickCountDeadline;
    }
    */    
    
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// COM Types End
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    

    


//private import dwin.sys.win32.com.Core;    
//private import tango.sys.win32.Types;
    


////////////////////////////////////////////////////////////////////////////////////////////////////////
// Windows, from juno.com.core
////////////////////////////////////////////////////////////////////////////////////////////////////////
//extern(Windows):

//com.Core
/*
    struct STATSTG {
      wchar* pwcsName;
      uint type;
      ulong cbSize;
      FILETIME mtime;
      FILETIME ctime;
      FILETIME atime;
      uint grfMode;
      uint grfLocksSupported;
      DWINGUID clsid;
      uint grfStateBits;
      uint reserved;
    }
*/    

    //oaidl
    /*
    struct PARAMDESCEX {
      uint cBytes;
      DWINVARIANT varDefaultValue;
    }
    */
    
    //oaidl
    /*
    struct PARAMDESC {
      PARAMDESCEX* pparamdescex;
      ushort wParamFlags;
    }
    */
    
    //oaidl
    /*
    struct ELEMDESC {
      TYPEDESC tdesc;
      union {
        IDLDESC idldesc;
        PARAMDESC paramdesc;
      }
    }
    */
    
    //oaidl
    /*
    struct FUNCDESC {
      int memid;
      int* lprgscode;
      ELEMDESC* lprgelemdescParam;
      FUNCKIND funckind;
      INVOKEKIND invkind;
      CALLCONV callconv;
      short cParams;
      short cParamsOpt;
      short oVft;
      short cScodes;
      ELEMDESC elemdescFunc;
      ushort wFuncFlags;
    }
    */

//objidl
/*
    struct STGMEDIUM {
      uint tymed;
      union {
        HANDLE hBitmap;
        HANDLE hMetaFilePict;
        HANDLE hEnhMetaFile;
        HANDLE hGlobal;
        wchar* lpszFileName;
        IStream pstm;
        IStorage pstg;
      }
      IUnknown pUnkForRelease;
    }
*/

    //objidl
    /*
    struct STATDATA {
      FORMATETC formatetc;
      uint advf;
      IAdviseSink pAdvSink;
      uint dwConnection;
    }
    */
    
    //oaidl
    /*
    struct CUSTDATAITEM {
      DWINGUID guid;
      DWINVARIANT varValue;
    }
    //oaidl
    struct CUSTDATA {
      uint cCustData;
      CUSTDATAITEM* prgCustData;
    }
    */
    
    //objidl
    /*
    struct CONNECTDATA {
      IUnknown pUnk;
      uint dwCookie;
    }
    */

    //not found in VC 8 .h files
    /*
    struct PROPERTYKEY {
      DWINGUID fmtid;
      uint pid;
    }
    */

//com.Core
//proidl.h
/*
struct VERSIONEDSTREAM {
  DWINGUID guidVersion;
  IStream pStream;
}
*/

//defined in propidl.h, used by PROPVARIANT
//com.Core
/*
struct CAPROPVARIANT {
  uint cElems;
  PROPVARIANT* pElems;
}
*/

//defined in propidl.h, used by PROPVARIANT
//com.Core
/*
struct CACLSID {
  uint cElems;
  DWINGUID* pElems;
}    
*/

//oaidl
/*
struct TYPEATTR {
  DWINGUID guid;
  uint lcid;
  uint dwReserved;
  int memidConstructor;
  int memidDestructor;
  wchar* lpstrSchema;
  uint cbSizeInstance;
  TYPEKIND typekind;
  ushort cFuncs;
  ushort cVars;
  ushort cImplTypes;
  ushort cbSizeVft;
  ushort cbAlignment;
  ushort wTypeFlags;
  ushort wMajorVerNum;
  ushort wMinorVerNum;
  TYPEDESC tdescAlias;
  IDLDESC idldescType;
}
*/

//oaidl
/*
struct VARDESC {
  int memid;
  wchar* lpstrSchema;
  union {
    uint oInst;
    DWINVARIANT* lpvarValue;
  }
  ELEMDESC elemdescVar;
  ushort wVarFlags;
  VARKIND varkind;
}
*/

//oaidl
/*
struct BINDPTR {
  FUNCDESC* lpfuncdesc;
  VARDESC* lpvardesc;
  ITypeComp lptcomp;
}
*/

//oaidl
/*
struct TLIBATTR {
  DWINGUID guid;
  uint lcid;
  SYSKIND syskind;
  ushort wMajorVerNum;
  ushort wMinorVerNum;
  ushort wLibFlags;
}
*/

//defined in objidl, used in CoCreateInstanceEx
/*
struct MULTI_QI {
  DWINGUID* pIID;
  IUnknown pItf;
  int hr;
}
*/

//comcat
/*
struct CATEGORYINFO {
  DWINGUID catid;
  uint lcid;
  wchar[128] szDescription;
}
*/
//

//oaidl
/*
struct DISPPARAMS {
  DWINVARIANT* rgvarg;
  int* rgdispidNamedArgs;
  uint cArgs;
  uint cNamedArgs;
}
 */   
