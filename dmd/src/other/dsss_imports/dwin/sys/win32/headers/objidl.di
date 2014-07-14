// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2009  (dyuyan  gmail at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: May 2009

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/


module dwin.sys.win32.headers.objidl;

private import dwin.sys.win32.com.Core;
private import tango.sys.win32.Types;

//import win32.unknwn;
//import win32.objfwd;
//private import win32.windef;
//private import win32.basetyps;
//private import win32.oleidl;
//private import win32.wtypes;
//private import win32.winbase; // for FILETIME
//private import win32.rpcdce;    

extern(Windows):

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

//com.Core ComStream
/*
enum : uint {
  STGTY_STORAGE = 1,
  STGTY_STREAM = 2,
  STGTY_LOCKBYTES = 3,
  STGTY_PROPERTY = 4
}
*/

/*
enum STGTY {
	STGTY_STORAGE = 1,
	STGTY_STREAM,
	STGTY_LOCKBYTES,
	STGTY_PROPERTY
}
*/

/*
enum STREAM_SEEK {
	STREAM_SEEK_SET,
	STREAM_SEEK_CUR,
	STREAM_SEEK_END
}

struct INTERFACEINFO {
	LPUNKNOWN pUnk;
	IID iid;
	WORD wMethod;
}
alias INTERFACEINFO* LPINTERFACEINFO;

enum CALLTYPE {
	CALLTYPE_TOPLEVEL = 1,
	CALLTYPE_NESTED,
	CALLTYPE_ASYNC,
	CALLTYPE_TOPLEVEL_CALLPENDING,
	CALLTYPE_ASYNC_CALLPENDING
}

enum PENDINGTYPE {
	PENDINGTYPE_TOPLEVEL = 1,
	PENDINGTYPE_NESTED
}

enum PENDINGMSG {
	PENDINGMSG_CANCELCALL = 0,
	PENDINGMSG_WAITNOPROCESS,
	PENDINGMSG_WAITDEFPROCESS
}

alias wchar** SNB;

enum DATADIR {
	DATADIR_GET = 1,
	DATADIR_SET
}
alias WORD CLIPFORMAT;
alias CLIPFORMAT* LPCLIPFORMAT;

*/
    struct DVTARGETDEVICE {
      uint tdSize;
      ushort tdDriverNameOffset;
      ushort tdDeviceNameOffset;
      ushort tdPortNameOffset;
      ushort tdExtDevmodeOffset;
      ubyte* tdData;
    }
    struct FORMATETC {
      ushort cfFormat;
      DVTARGETDEVICE* ptd;
      uint dwAspect;
      int lindex;
      uint tymed;
    }
alias FORMATETC* LPFORMATETC;

    /*
struct RemSTGMEDIUM {
	DWORD tymed;
	DWORD dwHandleType;
	ULONG pData;
	uint pUnkForRelease;
	uint cbData;
	BYTE data[1];
}

struct HLITEM {
	ULONG uHLID;
	LPWSTR pwzFriendlyName;
}
*/
    struct STATDATA {
      FORMATETC formatetc;
      uint advf;
      IAdviseSink pAdvSink;
      uint dwConnection;
    }
/*
struct STATPROPSETSTG {
	FMTID fmtid;
	CLSID clsid;
	DWORD grfFlags;
	FILETIME mtime;
	FILETIME ctime;
	FILETIME atime;
}

enum EXTCONN {
	EXTCONN_STRONG   = 1,
	EXTCONN_WEAK     = 2,
	EXTCONN_CALLABLE = 4
}

struct MULTI_QI {
	IID*      pIID;
	IUnknown* pItf;
	HRESULT   hr;
}

struct AUTH_IDENTITY {
	USHORT* User;
	ULONG UserLength;
	USHORT* Domain;
	ULONG DomainLength;
	USHORT* Password;
	ULONG PasswordLength;
	ULONG Flags;
}

struct COAUTHINFO {
	DWORD dwAuthnSvc;
	DWORD dwAuthzSvc;
	LPWSTR pwszServerPrincName;
	DWORD dwAuthnLevel;
	DWORD dwImpersonationLevel;
	AUTH_IDENTITY* pAuthIdentityData;
	DWORD dwCapabilities;
}

struct  COSERVERINFO {
	DWORD dwReserved1;
	LPWSTR pwszName;
	COAUTHINFO* pAuthInfo;
	DWORD dwReserved2;
}
*/
    struct BIND_OPTS {
      uint cbStruct = BIND_OPTS.sizeof;
      uint grfFlags;
      uint grfMode;
      uint dwTickCountDeadline;
    }
    //   

alias BIND_OPTS* LPBIND_OPTS;
/*
struct BIND_OPTS2 {
	DWORD cbStruct;
	DWORD grfFlags;
	DWORD grfMode;
	DWORD dwTickCountDeadline;
	DWORD dwTrackFlags;
	DWORD dwClassContext;
	LCID locale;
	COSERVERINFO* pServerInfo;
}
alias BIND_OPTS2* LPBIND_OPTS2;

enum BIND_FLAGS {
	BIND_MAYBOTHERUSER = 1,
	BIND_JUSTTESTEXISTENCE
}
*/
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

alias STGMEDIUM* LPSTGMEDIUM;
/*
enum LOCKTYPE {
	LOCK_WRITE     = 1,
	LOCK_EXCLUSIVE = 2,
	LOCK_ONLYONCE  = 4
}

alias uint RPCOLEDATAREP;

struct  RPCOLEMESSAGE {
	PVOID reserved1;
	RPCOLEDATAREP dataRepresentation;
	PVOID Buffer;
	ULONG cbBuffer;
	ULONG iMethod;
	PVOID reserved2[5];
	ULONG rpcFlags;
}
alias RPCOLEMESSAGE* PRPCOLEMESSAGE;

enum MKSYS {
	MKSYS_NONE,
	MKSYS_GENERICCOMPOSITE,
	MKSYS_FILEMONIKER,
	MKSYS_ANTIMONIKER,
	MKSYS_ITEMMONIKER,
	MKSYS_POINTERMONIKER
}

enum MKREDUCE {
	MKRREDUCE_ALL,
	MKRREDUCE_ONE         = 196608,
	MKRREDUCE_TOUSER      = 131072,
	MKRREDUCE_THROUGHUSER = 65536
}

struct RemSNB {
	uint ulCntStr;
	uint ulCntChar;
	wchar rgString[1];
}

enum ADVF {
	ADVF_NODATA            = 1,
	ADVF_PRIMEFIRST        = 2,
	ADVF_ONLYONCE          = 4,
	ADVFCACHE_NOHANDLER    = 8,
	ADVFCACHE_FORCEBUILTIN = 16,
	ADVFCACHE_ONSAVE       = 32,
	ADVF_DATAONSTOP        = 64
}

enum TYMED {
	TYMED_HGLOBAL  = 1,
	TYMED_FILE     = 2,
	TYMED_ISTREAM  = 4,
	TYMED_ISTORAGE = 8,
	TYMED_GDI      = 16,
	TYMED_MFPICT   = 32,
	TYMED_ENHMF    = 64,
	TYMED_NULL     = 0
}

enum SERVERCALL {
	SERVERCALL_ISHANDLED,
	SERVERCALL_REJECTED,
	SERVERCALL_RETRYLATER
}

struct CAUB {
	ULONG cElems;
	ubyte* pElems;
}

struct CAI {
	ULONG cElems;
	short* pElems;
}

struct CAUI {
	ULONG cElems;
	USHORT* pElems;
}

struct CAL {
	ULONG cElems;
	int* pElems;
}

struct CAUL {
	ULONG cElems;
	ULONG* pElems;
}

struct CAFLT {
	ULONG cElems;
	float* pElems;
}

struct CADBL {
	ULONG cElems;
	double* pElems;
}

struct CACY {
	ULONG cElems;
	CY* pElems;
}

struct CADATE {
	ULONG cElems;
	DATE* pElems;
}

struct CABSTR {
	ULONG cElems;
	BSTR*  pElems;
}

struct CABSTRBLOB {
	ULONG cElems;
	BSTRBLOB* pElems;
}

struct CABOOL {
	ULONG cElems;
	VARIANT_BOOL* pElems;
}

struct CASCODE {
	ULONG cElems;
	SCODE* pElems;
}

struct CAH {
	ULONG cElems;
	LARGE_INTEGER* pElems;
}

struct CAUH {
	ULONG cElems;
	ULARGE_INTEGER* pElems;
}

struct CALPSTR {
	ULONG cElems;
	LPSTR* pElems;
}

struct CALPWSTR {
	ULONG cElems;
	LPWSTR* pElems;
}

struct CAFILETIME {
	ULONG cElems;
	FILETIME* pElems;
}

struct CACLIPDATA {
	ULONG cElems;
	CLIPDATA* pElems;
}

struct CACLSID {
	ULONG cElems;
	CLSID* pElems;
}
alias PROPVARIANT* LPPROPVARIANT;

struct CAPROPVARIANT {
	ULONG cElems;
	LPPROPVARIANT pElems;
}

struct PROPVARIANT {
	VARTYPE vt;
	WORD wReserved1;
	WORD wReserved2;
	WORD wReserved3;
	union {
		CHAR cVal;
		UCHAR bVal;
		short iVal;
		USHORT uiVal;
		VARIANT_BOOL boolVal;
		int lVal;
		ULONG ulVal;
		float fltVal;
		SCODE scode;
		LARGE_INTEGER hVal;
		ULARGE_INTEGER uhVal;
		double dblVal;
		CY cyVal;
		DATE date;
		FILETIME filetime;
		CLSID* puuid;
		BLOB blob;
		CLIPDATA* pclipdata;
		LPSTREAM pStream;
		LPSTORAGE pStorage;
		BSTR bstrVal;
		BSTRBLOB bstrblobVal;
		LPSTR pszVal;
		LPWSTR pwszVal;
		CAUB caub;
		CAI cai;
		CAUI caui;
		CABOOL cabool;
		CAL cal;
		CAUL caul;
		CAFLT caflt;
		CASCODE cascode;
		CAH cah;
		CAUH cauh;
		CADBL cadbl;
		CACY cacy;
		CADATE cadate;
		CAFILETIME cafiletime;
		CACLSID cauuid;
		CACLIPDATA caclipdata;
		CABSTR cabstr;
		CABSTRBLOB cabstrblob;
		CALPSTR calpstr;
		CALPWSTR calpwstr;
		CAPROPVARIANT capropvar;
	}
}

struct PROPSPEC {
	ULONG ulKind;
	union {
		PROPID propid;
		wchar* lpwstr;
	}
}

struct  STATPROPSTG {
	wchar* lpwstrName;
	PROPID propid;
	VARTYPE vt;
}

enum PROPSETFLAG {
	PROPSETFLAG_DEFAULT,
	PROPSETFLAG_NONSIMPLE,
	PROPSETFLAG_ANSI,
	PROPSETFLAG_UNBUFFERED = 4
}

struct STORAGELAYOUT {
	DWORD LayoutType;
	wchar* pwcsElementName;
	LARGE_INTEGER cOffset;
	LARGE_INTEGER cBytes;
}

struct SOLE_AUTHENTICATION_SERVICE {
	DWORD dwAuthnSvc;
	DWORD dwAuthzSvc;
	wchar* pPrincipalName;
	HRESULT hr;
}

const wchar* COLE_DEFAULT_PRINCIPAL = cast ( wchar* )(-1);

enum EOLE_AUTHENTICATION_CAPABILITIES {
	EOAC_NONE              = 0,
	EOAC_MUTUAL_AUTH       = 0x1,
	EOAC_SECURE_REFS       = 0x2,
	EOAC_ACCESS_CONTROL    = 0x4,
	EOAC_APPID             = 0x8,
	EOAC_DYNAMIC           = 0x10,
	EOAC_STATIC_CLOAKING   = 0x20,
	EOAC_DYNAMIC_CLOAKING  = 0x40,
	EOAC_ANY_AUTHORITY     = 0x80,
	EOAC_MAKE_FULLSIC      = 0x100,
	EOAC_REQUIRE_FULLSIC   = 0x200,
	EOAC_AUTO_IMPERSONATE  = 0x400,
	EOAC_DEFAULT           = 0x800,
	EOAC_DISABLE_AAA       = 0x1000,
	EOAC_NO_CUSTOM_MARSHAL = 0x2000
}

struct SOLE_AUTHENTICATION_INFO {
	DWORD dwAuthnSvc;
	DWORD dwAuthzSvc;
	void* pAuthInfo;
}

const void* COLE_DEFAULT_AUTHINFO = cast( void* )(-1 );

struct SOLE_AUTHENTICATION_LIST {
	DWORD cAuthInfo;
	SOLE_AUTHENTICATION_INFO* aAuthInfo;
}

extern (C) {
	extern IID IID_ISequentialStream;
	extern IID IID_IStream;
	extern IID IID_IMarshal;
	extern IID IID_IStdMarshalInfo;
	extern IID IID_IMalloc;
	extern IID IID_IMallocSpy;
	extern IID IID_IMessageFilter;
	extern IID IID_IPersist;
	extern IID IID_IPersistStream;
	extern IID IID_IRunningObjectTable;
	extern IID IID_IBindCtx;
	extern IID IID_IMoniker;
	extern IID IID_IPersistStorage;
	extern IID IID_IPersistFile;
	extern IID IID_IAdviseSink;
	extern IID IID_IAdviseSink2;
	extern IID IID_IDataObject;
	extern IID IID_IDataAdviseHolder;
	extern IID IID_IStorage;
	extern IID IID_IRootStorage;
	extern IID IID_IRpcChannelBuffer;
	extern IID IID_IRpcProxyBuffer;
	extern IID IID_IRpcStubBuffer;
	extern IID IID_IPSFactoryBuffer;
	extern IID IID_ILockBytes;
	extern IID IID_IExternalConnection;
	extern IID IID_IRunnableObject;
	extern IID IID_IROTData;
	extern IID IID_IChannelHook;
	extern IID IID_IPropertyStorage;
	extern IID IID_IPropertySetStorage;
	extern IID IID_IClientSecurity;
	extern IID IID_IServerSecurity;
	extern IID IID_IClassActivator;
	extern IID IID_IFillLockBytes;
	extern IID IID_IProgressNotify;
	extern IID IID_ILayoutStorage;
	extern IID IID_IGlobalInterfaceTable;

	extern FMTID FMTID_SummaryInformation;
	extern FMTID FMTID_DocSummaryInformation;
	extern FMTID FMTID_UserDefinedProperties;
}
*/


    interface IEnumFORMATETC : IUnknown {
      mixin(uuid("00000103-0000-0000-c000-000000000046"));        
      // static DWINGUID IID = { 0x00000103, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int Next(uint celt, FORMATETC* rgelt, out uint pceltFetched);
      int Skip(uint celt);
      int Reset();
      int Clone(out IEnumFORMATETC ppenum);
    }
    /*
interface IEnumHLITEM : public IUnknown {
	  HRESULT Next(ULONG, HLITEM*, ULONG*);
	  HRESULT Skip(ULONG);
	  HRESULT Reset();
	  HRESULT Clone(IEnumHLITEM**);
}
*/
    interface IEnumSTATDATA : IUnknown {
      mixin(uuid("00000105-0000-0000-c000-000000000046"));
      // static DWINGUID IID = { 0x00000105, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int Next(uint celt, STATDATA* rgelt, out uint pceltFetched);
      int Skip(uint celt);
      int Reset();
      int Clone(out IEnumSTATDATA ppenum);
    }
/*
interface IEnumSTATPROPSETSTG : public IUnknown {
	  HRESULT Next(ULONG, STATPROPSETSTG*, ULONG*);
	  HRESULT Skip(ULONG);
	  HRESULT Reset();
	  HRESULT Clone(IEnumSTATPROPSETSTG**);
}

interface IEnumSTATPROPSTG : public IUnknown {
	  HRESULT Next(ULONG, STATPROPSTG*, ULONG*);
	  HRESULT Skip(ULONG);
	  HRESULT Reset();
	  HRESULT Clone(IEnumSTATPROPSTG**);
}
*/
/*
interface IEnumSTATSTG : public IUnknown {
	  HRESULT Next(ULONG, STATSTG*, ULONG*);
	  HRESULT Skip(ULONG);
	  HRESULT Reset();
	  HRESULT Clone(IEnumSTATSTG**);
}
*/


    interface IEnumString : IUnknown {
      mixin(uuid("00000101-0000-0000-c000-000000000046"));
      // static DWINGUID IID = { 0x00000101, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int Next(uint celt, wchar** rgelt, out uint pceltFetched);
      int Skip(uint celt);
      int Reset();
      int Clone(out IEnumString ppenum);
    }
    
    interface IEnumMoniker : IUnknown {
      mixin(uuid("00000102-0000-0000-c000-000000000046"));
      // static DWINGUID IID = { 0x00000102, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int Next(uint celt, IEnumMoniker* rgelt, out uint pceltFetched);
      int Skip(uint celt);
      int Reset();
      int Clone(out IEnumMoniker ppenum);
    }

  
    interface IEnumUnknown : IUnknown {
      mixin(uuid("00000100-0000-0000-c000-000000000046"));
      // static DWINGUID IID = { 0x00000100, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int Next(uint celt, out IUnknown rgelt, out uint pceltFetched);
      int Skip(uint celt);
      int Reset();
      int Clone(out IEnumUnknown ppenum);
    }

/*
interface ISequentialStream : public IUnknown {
	HRESULT Read(void*, ULONG, ULONG*);
	HRESULT Write(void* , ULONG, ULONG*);
}
*/

/*
interface IStream : public ISequentialStream {
	HRESULT Seek(LARGE_INTEGER, DWORD, ULARGE_INTEGER*);
	HRESULT SetSize(ULARGE_INTEGER);
	HRESULT CopyTo(IStream, ULARGE_INTEGER, ULARGE_INTEGER*, ULARGE_INTEGER*);
	HRESULT Commit(DWORD);
	HRESULT Revert();
	HRESULT LockRegion(ULARGE_INTEGER, ULARGE_INTEGER, DWORD);
	HRESULT UnlockRegion(ULARGE_INTEGER, ULARGE_INTEGER, DWORD);
	HRESULT Stat(STATSTG*, DWORD);
	HRESULT Clone(LPSTREAM*);
}
*/

    interface IMarshal : IUnknown {
      mixin(uuid("00000003-0000-0000-c000-000000000046"));
      int GetUnmarshalClass(ref DWINGUID riid, void* pv, uint dwDestContext, void* pvDestContext, uint mshlflags, out DWINGUID pCid);
      int GetMarshalSizeMax(ref DWINGUID riid, void* pv, uint dwDestContext, void* pvDestContext, uint mshlflags, out uint pSize);
      int MarshalInterface(IStream pStm, ref DWINGUID riid, void* pv, uint dwDestContext, void* pvDestContext, uint mshlflags);
      int UnmarshalInterface(IStream pStm, ref DWINGUID riid, void** ppv);
      int ReleaseMarshalData(IStream pStm);
      int DisconnectObject(uint dwReserved);
    } 

    interface IMalloc : IUnknown {
      // static DWINGUID IID = { 0x00000002, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      mixin(uuid("00000002-0000-0000-c000-000000000046"));
      void* Alloc(size_t cb);
      void* Realloc(void* pv, uint cb);
      void Free(void* pv);
      uint GetSize(void* pv);
      int DidAlloc(void* pv);
      void HeapMinimize();
    }    
    
    /+
interface IStdMarshalInfo : public IUnknown {
	HRESULT GetClassForHandler(DWORD, PVOID, CLSID*);
}

    interface IMalloc : IUnknown {
      // static DWINGUID IID = { 0x00000002, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      mixin(uuid("00000002-0000-0000-c000-000000000046"));
      void* Alloc(size_t cb);
      void* Realloc(void* pv, uint cb);
      void Free(void* pv);
      uint GetSize(void* pv);
      int DidAlloc(void* pv);
      void HeapMinimize();
    }
interface IMallocSpy : public IUnknown {
	ULONG PreAlloc(ULONG);
	void* PostAlloc(void*);
	void* PreFree(void*, BOOL);
	void PostFree(BOOL);
	ULONG PreRealloc(void*, ULONG, void**, BOOL);
	void* PostRealloc(void*, BOOL);
	void* PreGetSize(void*, BOOL);
	ULONG PostGetSize(ULONG, BOOL);
	void* PreDidAlloc(void*, BOOL);
	int PostDidAlloc(void*, BOOL, int);
	void PreHeapMinimize();
	void PostHeapMinimize();
}

interface IMessageFilter : public IUnknown {
	DWORD HandleInComingCall(DWORD, HTASK, DWORD, LPINTERFACEINFO);
	DWORD RetryRejectedCall(HTASK, DWORD, DWORD);
	DWORD MessagePending(HTASK, DWORD, DWORD);
}
+/

    interface IPersist : IUnknown {
      mixin(uuid("0000010c-0000-0000-c000-000000000046"));
      // static DWINGUID IID = { 0x0000010c, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int GetClassID(out DWINGUID pClassID);
    }
    
    interface IPersistStream : IPersist {
      mixin(uuid("00000109-0000-0000-c000-000000000046"));
      // static DWINGUID IID = { 0x00000109, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int IsDirty();
      int Load(IStream pStm);
      int Save(IStream pStm, int fClearDirty);
      int GetSizeMax(out ulong pcbSize);
    }    
    
    interface IRunningObjectTable : IUnknown {
      mixin(uuid("00000010-0000-0000-c000-000000000046"));
      // static DWINGUID IID = { 0x00000010, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int Register(uint grfFlags, IUnknown punkObject, IMoniker pmkObjectName, out uint pdwRegister);
      int Revoke(uint dwRegister);
      int IsRunning(IMoniker pmkObjectName);
      int GetObject(IMoniker pmkObjectName, out IUnknown ppunkObject);
      int NoteChangeTime(uint dwRegister, ref FILETIME pfiletime);
      int GetTimeOfLastChange(IMoniker pmkObjectName, out FILETIME pfiletime);
      int EnumRunning(out IEnumMoniker ppenumMoniker);
    }    

    interface IBindCtx : IUnknown {
      mixin(uuid("0000000e-0000-0000-c000-000000000046"));
      // static DWINGUID IID = { 0x0000000e, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int RegisterObjectBound(IUnknown punk);
      int RevokeObjectBound(IUnknown punk);
      int ReleaseBoundObjects();
      int SetBindOptions(ref BIND_OPTS pbindopts);
      int GetRunningObjectTable(out IRunningObjectTable pprot);
      int RegisterObjectParam(wchar* pszKey, IUnknown punk);
      int GetObjectParam(wchar* pszKey, out IUnknown ppunk);
      int EnumObjectParam(out IEnumString ppenum);
      int RemoveObjectParam(wchar* pszKey);
    }    


    // from dwin.sys.win32.com.tlb.danim
    interface IMoniker : IPersistStream {
      mixin(uuid("0000000f-0000-0000-c000-000000000046"));
      // static DWINGUID IID = { 0x0000000f, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      /*[id(0x60030000)]*/ //int RemoteBindToObject(IBindCtx pbc, IMoniker pmkToLeft, ref DWINGUID riidResult, out IUnknown ppvResult);
      /*[id(0x60030000)]*/ int BindToObject(IBindCtx pbc, IMoniker pmkToLeft, ref DWINGUID riidResult, out IUnknown ppvResult);
      /*[id(0x60030001)]*/ //int RemoteBindToStorage(IBindCtx pbc, IMoniker pmkToLeft, ref DWINGUID riid, out IUnknown ppvObj);
      /*[id(0x60030001)]*/ int BindToStorage(IBindCtx pbc, IMoniker pmkToLeft, ref DWINGUID riid, out IUnknown ppvObj);
      /*[id(0x60030002)]*/ int Reduce(IBindCtx pbc, uint dwReduceHowFar, ref IMoniker ppmkToLeft, out IMoniker ppmkReduced);
      /*[id(0x60030003)]*/ int ComposeWith(IMoniker pmkRight, int fOnlyIfNotGeneric, out IMoniker ppmkComposite);
      /*[id(0x60030004)]*/ int Enum(int fForward, out IEnumMoniker ppenumMoniker);
      /*[id(0x60030005)]*/ int IsEqual(IMoniker pmkOtherMoniker);
      /*[id(0x60030006)]*/ int Hash(out uint pdwHash);
      /*[id(0x60030007)]*/ int IsRunning(IBindCtx pbc, IMoniker pmkToLeft, IMoniker pmkNewlyRunning);
      /*[id(0x60030008)]*/ int GetTimeOfLastChange(IBindCtx pbc, IMoniker pmkToLeft, out FILETIME pfiletime);
      /*[id(0x60030009)]*/ int Inverse(out IMoniker ppmk);
      /*[id(0x6003000A)]*/ int CommonPrefixWith(IMoniker pmkOther, out IMoniker ppmkPrefix);
      /*[id(0x6003000B)]*/ int RelativePathTo(IMoniker pmkOther, out IMoniker ppmkRelPath);
      /*[id(0x6003000C)]*/ int GetDisplayName(IBindCtx pbc, IMoniker pmkToLeft, out wchar* ppszDisplayName);
      /*[id(0x6003000D)]*/ int ParseDisplayName(IBindCtx pbc, IMoniker pmkToLeft, wchar* pszDisplayName, out uint pchEaten, out IMoniker ppmkOut);
      /*[id(0x6003000E)]*/ int IsSystemMoniker(out uint pdwMksys);
    }    


/*
interface IPersistStorage : public IPersist
{
	HRESULT IsDirty();
	HRESULT InitNew(LPSTORAGE);
	HRESULT Load(LPSTORAGE);
	HRESULT Save(LPSTORAGE, BOOL);
	HRESULT SaveCompleted(LPSTORAGE);
	HRESULT HandsOffStorage();
}
*/    
    interface IPersistFile : IPersist
    {
        mixin(uuid("0000010b-0000-0000-C000-000000000046"));
        // static DWINGUID IID = { 0x0000010b, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
        int IsDirty ();
        int Load(wchar* pszFileName, uint dwMode);
        int Save(wchar* pszFileName, int fRemember);
        int SaveCompleted (wchar* pszFileName);
        int GetCurFile(out wchar* ppszFileName);
    }    

    interface IAdviseSink : IUnknown {
      mixin(uuid("0000010f-0000-0000-c000-000000000046"));    
      // static DWINGUID IID = { 0x0000010f, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int OnDataChange(ref FORMATETC pFormatetc, ref STGMEDIUM pStgmed);
      int OnViewChange(uint dwAspect, int lindex);
      int OnRename(IMoniker pmk);
      int OnSave();
      int OnClose();
    }
/*
interface IAdviseSink2 : public IAdviseSink
{
	void OnLinkSrcChange(IMoniker*);
}

interface IDataAdviseHolder : public IUnknown {
	HRESULT Advise(IDataObject*, FORMATETC*, DWORD, IAdviseSink*, PDWORD);
	HRESULT Unadvise(DWORD);
	HRESULT EnumAdvise(IEnumSTATDATA**);
	HRESULT SendOnDataChange(IDataObject*, DWORD, DWORD);
}
*/
    interface IDataObject : IUnknown {
      mixin(uuid("0000010e-0000-0000-c000-000000000046"));        
      // static DWINGUID IID = { 0x0000010e, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int GetData(ref FORMATETC pformatetcIn, out STGMEDIUM pmedium);
      int GetDataHere(ref FORMATETC pformatetc, ref STGMEDIUM pmedium);
      int QueryGetData(ref FORMATETC pformatetc);
      int GetCanonicalFormatEtc(ref FORMATETC pformatetcIn, out FORMATETC pformatetcOut);
      int SetData(ref FORMATETC pformatetc, ref STGMEDIUM pmedium, bool fRelease);
      int EnumFormatEtc(uint dwDirection, out IEnumFORMATETC ppenumFormatEtc);
      int DAdvise(ref FORMATETC pformatetc, uint advf, IAdviseSink pAdvSink, out uint pdwConnection);
      int DUnadvise(uint dwConnection);
      int EnumDAdvise(out IEnumSTATDATA ppenumAdvise);
    }
    
    
    
    interface IConnectionPoint : IUnknown {
      mixin(uuid("b196b286-bab4-101a-b69c-00aa00341d07"));        
      // static DWINGUID IID = { 0xB196B286, 0xBAB4, 0x101A, 0xB6, 0x9C, 0x00, 0xAA, 0x00, 0x34, 0x1D, 0x07 };
      int GetConnectionInterface(out DWINGUID pIID);
      int GetConnectionPointContainer(out IConnectionPointContainer ppCPC);
      int Advise(IUnknown pUnkSink, out uint pdwCookie);
      int Unadvise(uint dwCookie);
      int EnumConnections(out IEnumConnections ppenum);
    }
    
    interface IConnectionPointContainer : IUnknown {
      mixin(uuid("b196b284-bab4-101a-b69c-00aa00341d07"));        
      // static DWINGUID IID = { 0xB196B284, 0xBAB4, 0x101A, 0xB6, 0x9C, 0x00, 0xAA, 0x00, 0x34, 0x1D, 0x07 };
      int EnumConnectionPoints(out IEnumConnectionPoints ppEnum);
      int FindConnectionPoint(ref DWINGUID riid, out IConnectionPoint ppCP);
    }
    
    
    /*
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
        [out]   IEnumConnectionPoints ** ppEnum
    );

    HRESULT FindConnectionPoint
    (
        [in]    REFIID riid,
        [out]   IConnectionPoint ** ppCP
    );
}    
*/

    struct CONNECTDATA {
      IUnknown pUnk;
      uint dwCookie;
    }

    interface IEnumConnections : IUnknown {
      mixin(uuid("b196b287-bab4-101a-b69c-00aa00341d07"));        
      // static DWINGUID IID = { 0xB196B287, 0xBAB4, 0x101A, 0xB6, 0x9C, 0x00, 0xAA, 0x00, 0x34, 0x1D, 0x07 };
      int Next(uint celt, CONNECTDATA* rgcd, out uint pceltFetched);
      int Skip(uint celt);
      int Reset();
      int Clone(out IEnumConnections ppenum);
    }
    
/*
[
    object,
    uuid(B196B287-BAB4-101A-B69C-00AA00341D07),
    pointer_default(unique)
]
interface IEnumConnections : IUnknown
{
    typedef IEnumConnections * PENUMCONNECTIONS;
    typedef IEnumConnections * LPENUMCONNECTIONS;

    typedef struct tagCONNECTDATA
    {
        IUnknown *  pUnk;
        DWORD       dwCookie;
    } CONNECTDATA;

    typedef struct tagCONNECTDATA * PCONNECTDATA;
    typedef struct tagCONNECTDATA * LPCONNECTDATA;

    [local]
    HRESULT Next(
        [in]                        ULONG           cConnections,
        [out,
         size_is(cConnections),
         length_is(*lpcFetched)]    CONNECTDATA *   rgcd,
        [out]                       ULONG *         lpcFetched
    );

    [call_as(Next)]
    HRESULT RemoteNext(
        [in]                            ULONG           cConnections,
        [out,
         size_is(cConnections),
         length_is(*lpcFetched)]        CONNECTDATA *   rgcd,
        [out]                           ULONG *         lpcFetched
    );

    HRESULT Skip
    (
        [in]    ULONG cConnections
    );

    HRESULT Reset
    (
        void
    );

    HRESULT Clone
    (
        [out]   IEnumConnections ** ppEnum
    );
}
*/

    interface IEnumConnectionPoints : IUnknown {
      mixin(uuid("b196b285-bab4-101a-b69c-00aa00341d07"));        
      // static DWINGUID IID = { 0xB196B285, 0xBAB4, 0x101A, 0xB6, 0x9C, 0x00, 0xAA, 0x00, 0x34, 0x1D, 0x07 };
      int Next(uint celt, IConnectionPoint* ppCP, out uint pceltFetched);
      int Skip(uint celt);
      int Reset();
      int Clone(out IEnumConnectionPoints ppenum);
    }


/*
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
        [in]                        ULONG               cConnections,
        [out,
         size_is(cConnections),
         length_is(*lpcFetched)]    IConnectionPoint ** rgpcn,
        [out]                       ULONG *             lpcFetched
    );

    [call_as(Next)]
    HRESULT RemoteNext(
        [in]                        ULONG               cConnections,
        [out,
         size_is(cConnections),
         length_is(*lpcFetched)]    IConnectionPoint ** rgpcn,
        [out]                       ULONG *             lpcFetched
    );

    HRESULT Skip
    (
        [in]    ULONG   cConnections
    );

    HRESULT Reset
    (
        void
    );

    HRESULT Clone
    (
        [out]   IEnumConnectionPoints **    ppEnum
    );
}
#endif // __INCLUDE_CPIFS
*/


/*
    interface IStorage : IUnknown {
      // static DWINGUID IID = { 0x0000000b, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      mixin(uuid("0000000b-0000-0000-c000-000000000046"));
      int CreateStream(wchar* pwcsName, uint grfMode, uint reserved1, uint reserved2, out IStream ppstm);
      int OpenStream(wchar* pwcsName, void* reserved1, uint grfMode, uint reserved2, out IStream ppstm);
      int CreateStorage(wchar* pwcsName, uint grfMode, uint reserved1, uint reserved2, out IStorage ppstg);
      int OpenStorage(wchar* pwcsName, IStorage psrgPriority, uint grfMode, wchar** snbExclude, uint reserved, out IStorage ppstg);
      int CopyTo(uint ciidExclude, DWINGUID* rgiidExclude, wchar** snbExclude, IStorage pstgDest);
      int MoveElementTo(wchar* pwcsName, IStorage pstgDest, wchar* pwcsNewName, uint grfFlags);
      int Commit(uint grfCommitFlags);
      int Revert();
      int EnumElements(uint reserved1, void* reserved2, uint reserved3, out IEnumSTATSTG ppenum);
      int DestroyElement(wchar* pwcsName);
      int RenameElement(wchar* pwcsOldName, wchar* pwcsNewName);
      int SetElementTimes(wchar* pwcsName, FILETIME* pctime, FILETIME* patime, FILETIME* pmtime);
      int SetClass(DWINGUID* clsid);
      int SetStateBits(uint grfStateBits, uint grfMask);
      int Stat(out STATSTG pstatstg, uint grfStatFlag);
    }
*/

/*

interface IStorage : IUnknown
{

    typedef [unique] IStorage * LPSTORAGE;

    typedef struct tagRemSNB
    {
        unsigned long ulCntStr;
        unsigned long ulCntChar;
        [size_is(ulCntChar)] OLECHAR rgString[];
    } RemSNB;

    typedef [unique] RemSNB * wireSNB;
    typedef [wire_marshal(wireSNB)] OLECHAR **SNB;

    HRESULT CreateStream(
        [in, string] const OLECHAR *pwcsName,
        [in] DWORD grfMode,
        [in] DWORD reserved1,
        [in] DWORD reserved2,
        [out] IStream **ppstm);

    [local]
    HRESULT OpenStream(
        [in, string] const OLECHAR *pwcsName,
        [in, unique] void *reserved1,
        [in] DWORD grfMode,
        [in] DWORD reserved2,
        [out] IStream **ppstm);

    [call_as(OpenStream)]
    HRESULT RemoteOpenStream(
        [in, string] const OLECHAR *pwcsName,
        [in] unsigned long cbReserved1,
        [in, unique, size_is(cbReserved1)] byte *reserved1,
        [in] DWORD grfMode,
        [in] DWORD reserved2,
        [out] IStream **ppstm);

    HRESULT CreateStorage(
        [in, string] const OLECHAR *pwcsName,
        [in] DWORD grfMode,
        [in] DWORD reserved1,
        [in] DWORD reserved2,
        [out] IStorage **ppstg);

    HRESULT OpenStorage(
        [in, unique, string] const OLECHAR *pwcsName,
        [in, unique] IStorage *pstgPriority,
        [in] DWORD grfMode,
        [in, unique] SNB snbExclude,
        [in] DWORD reserved,
        [out] IStorage **ppstg);

    HRESULT CopyTo(
        [in] DWORD ciidExclude,
        [in, unique, size_is(ciidExclude)] IID const *rgiidExclude,
        [in, unique] SNB snbExclude,
        [in, unique] IStorage *pstgDest);

    HRESULT MoveElementTo(
        [in, string] const OLECHAR * pwcsName,
        [in, unique] IStorage *pstgDest,
        [in, string] const OLECHAR *pwcsNewName,
        [in] DWORD grfFlags);

    HRESULT Commit(
        [in] DWORD grfCommitFlags);

    HRESULT Revert();

    [local]
    HRESULT EnumElements(
        [in] DWORD reserved1,
        [in, unique, size_is(1)] void *reserved2,
        [in] DWORD reserved3,
        [out] IEnumSTATSTG **ppenum);


    [call_as(EnumElements)]
    HRESULT RemoteEnumElements(
        [in] DWORD reserved1,
        [in] unsigned long cbReserved2,
        [in, unique, size_is(cbReserved2)] byte *reserved2,
        [in] DWORD reserved3,
        [out] IEnumSTATSTG **ppenum);

    HRESULT DestroyElement(
        [in, string] const OLECHAR *pwcsName);

    HRESULT RenameElement(
        [in, string] const OLECHAR *pwcsOldName,
        [in, string] const OLECHAR *pwcsNewName);

    HRESULT SetElementTimes(
        [in, unique, string] const OLECHAR *pwcsName,
        [in, unique] FILETIME const *pctime,
        [in, unique] FILETIME const *patime,
        [in, unique] FILETIME const *pmtime);

    HRESULT SetClass(
        [in] REFCLSID clsid);

    HRESULT SetStateBits(
        [in] DWORD grfStateBits,
        [in] DWORD grfMask);

    HRESULT Stat(
        [out] STATSTG *pstatstg,
        [in] DWORD grfStatFlag);
}
*/

// FIXME: GetClassID from IPersist not there - what to do about it?
/*
interface IRootStorage : public IPersist {
	HRESULT QueryInterface(REFIID, PVOID*);
	ULONG AddRef();
	ULONG Release();
	HRESULT SwitchToFile(wchar*);
}

interface IRpcChannelBuffer : public IUnknown {
	HRESULT GetBuffer(RPCOLEMESSAGE*, REFIID);
	HRESULT SendReceive(RPCOLEMESSAGE*, PULONG);
	HRESULT FreeBuffer(RPCOLEMESSAGE*);
	HRESULT GetDestCtx(PDWORD, PVOID*);
	HRESULT IsConnected();
}

interface IRpcProxyBuffer : public IUnknown {
	HRESULT Connect(IRpcChannelBuffer*);
	void Disconnect();
}

interface IRpcStubBuffer : public IUnknown {
	HRESULT Connect(LPUNKNOWN);
	void Disconnect();
	HRESULT Invoke(RPCOLEMESSAGE*, LPRPCSTUBBUFFER);
	LPRPCSTUBBUFFER IsIIDSupported(REFIID);
	ULONG CountRefs();
	HRESULT DebugServerQueryInterface(PVOID*);
	HRESULT DebugServerRelease(PVOID);
}

interface IPSFactoryBuffer : public IUnknown {
	HRESULT CreateProxy(LPUNKNOWN, REFIID, LPRPCPROXYBUFFER*, PVOID*);
	HRESULT CreateStub(REFIID, LPUNKNOWN, LPRPCSTUBBUFFER*);
}
alias IPSFactoryBuffer* LPPSFACTORYBUFFER;

interface ILockBytes : public IUnknown {
	HRESULT ReadAt(ULARGE_INTEGER, PVOID, ULONG, ULONG*);
	HRESULT WriteAt(ULARGE_INTEGER, PCVOID, ULONG, ULONG*);
	HRESULT Flush();
	HRESULT SetSize(ULARGE_INTEGER);
	HRESULT LockRegion(ULARGE_INTEGER, ULARGE_INTEGER, DWORD);
	HRESULT UnlockRegion(ULARGE_INTEGER, ULARGE_INTEGER, DWORD);
	HRESULT Stat(STATSTG*, DWORD);
}

interface IExternalConnection : public IUnknown {
	HRESULT AddConnection(DWORD, DWORD);
	HRESULT ReleaseConnection(DWORD, DWORD, BOOL);
}

interface IRunnableObject : public IUnknown {
	HRESULT GetRunningClass(LPCLSID);
	HRESULT Run(LPBC);
	BOOL IsRunning();
	HRESULT LockRunning(BOOL, BOOL);
	HRESULT SetContainedObject(BOOL);
}

interface IROTData : public IUnknown {
	HRESULT GetComparisonData(PVOID, ULONG, PULONG);
}

interface IChannelHook : public IUnknown {
	void ClientGetSize(REFGUID, REFIID, PULONG);
	void ClientFillBuffer(REFGUID, REFIID, PULONG, PVOID);
	void ClientNotify(REFGUID, REFIID, ULONG, PVOID, DWORD, HRESULT);
	void ServerNotify(REFGUID, REFIID, ULONG, PVOID, DWORD);
	void ServerGetSize(REFGUID, REFIID, HRESULT, PULONG);
	void ServerFillBuffer(REFGUID, REFIID, PULONG, PVOID, HRESULT);
}

interface IPropertyStorage : public IUnknown {
	HRESULT ReadMultiple(ULONG, PROPSPEC* , PROPVARIANT*);
	HRESULT WriteMultiple(ULONG, PROPSPEC* , PROPVARIANT*, PROPID);
	HRESULT DeleteMultiple(ULONG, PROPSPEC* );
	HRESULT ReadPropertyNames(ULONG, PROPID* , LPWSTR*);
	HRESULT WritePropertyNames(ULONG, PROPID* , LPWSTR* );
	HRESULT DeletePropertyNames(ULONG, PROPID* );
	HRESULT SetClass(REFCLSID);
	HRESULT Commit(DWORD);
	HRESULT Revert();
	HRESULT Enum(IEnumSTATPROPSTG**);
	HRESULT Stat(STATPROPSTG*);
	HRESULT SetTimes(FILETIME* , FILETIME* , FILETIME* );
}

interface IPropertySetStorage : public IUnknown {
	HRESULT Create(REFFMTID, CLSID*, DWORD, DWORD, LPPROPERTYSTORAGE*);
	HRESULT Open(REFFMTID, DWORD, LPPROPERTYSTORAGE*);
	HRESULT Delete(REFFMTID);
	HRESULT Enum(IEnumSTATPROPSETSTG**);
}

interface IClientSecurity : public IUnknown {
	HRESULT QueryBlanket(PVOID, PDWORD, PDWORD, wchar**, PDWORD, PDWORD, RPC_AUTH_IDENTITY_HANDLE**, PDWORD*);
	HRESULT SetBlanket(PVOID, DWORD, DWORD, LPWSTR, DWORD, DWORD, RPC_AUTH_IDENTITY_HANDLE*, DWORD);
	HRESULT CopyProxy(LPUNKNOWN, LPUNKNOWN*);
}

interface IServerSecurity : public IUnknown {
	HRESULT QueryBlanket(PDWORD, PDWORD, wchar**, PDWORD, PDWORD, RPC_AUTHZ_HANDLE*, PDWORD*);
	HRESULT ImpersonateClient();
	HRESULT RevertToSelf();
	HRESULT IsImpersonating();
}

interface IClassActivator : public IUnknown {
	HRESULT GetClassObject(REFCLSID, DWORD, LCID, REFIID, PVOID*);
}

interface IFillLockBytes : public IUnknown {
	HRESULT FillAppend(void* , ULONG, PULONG);
	HRESULT FillAt(ULARGE_INTEGER, void* , ULONG, PULONG);
	HRESULT SetFillSize(ULARGE_INTEGER);
	HRESULT Terminate(BOOL);
}

interface IProgressNotify : public IUnknown {
	HRESULT OnProgress(DWORD, DWORD, BOOL, BOOL);
}

interface ILayoutStorage : public IUnknown {
	HRESULT LayoutScript(STORAGELAYOUT*, DWORD, DWORD);
	HRESULT BeginMonitor();
	HRESULT EndMonitor();
	HRESULT ReLayoutDocfile(wchar*);
}

interface IGlobalInterfaceTable : public IUnknown {
	HRESULT RegisterInterfaceInGlobal(IUnknown*, REFIID, DWORD*);
	HRESULT RevokeInterfaceFromGlobal(DWORD);
	HRESULT GetInterfaceFromGlobal(DWORD, REFIID, void**);
}
*/
/+
// These are probably unnecessary for D.
extern (Windows) {
HRESULT IMarshal_GetUnmarshalClass_Proxy(IMarshal*, REFIID, void*, DWORD, void*, DWORD, CLSID*);
void IMarshal_GetUnmarshalClass_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IMarshal_GetMarshalSizeMax_Proxy(IMarshal*, REFIID, void*, DWORD, void*, DWORD, DWORD*);
void IMarshal_GetMarshalSizeMax_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IMarshal_MarshalInterface_Proxy(IMarshal*, IStream*, REFIID, void*, DWORD, void*, DWORD);
void IMarshal_MarshalInterface_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IMarshal_UnmarshalInterface_Proxy(IMarshal*, IStream*, REFIID, void**);
void IMarshal_UnmarshalInterface_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IMarshal_ReleaseMarshalData_Proxy(IMarshal*, IStream*);
void IMarshal_ReleaseMarshalData_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IMarshal_DisconnectObject_Proxy(IMarshal*, DWORD);
void IMarshal_DisconnectObject_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
void* IMalloc_Alloc_Proxy(IMalloc*, ULONG);
void IMalloc_Alloc_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
void* IMalloc_Realloc_Proxy(IMalloc*, void*, ULONG);
void IMalloc_Realloc_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
void IMalloc_Free_Proxy(IMalloc*, void*);
void IMalloc_Free_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
ULONG IMalloc_GetSize_Proxy(IMalloc*, void*);
void IMalloc_GetSize_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
int IMalloc_DidAlloc_Proxy(IMalloc*, void*);
void IMalloc_DidAlloc_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
void IMalloc_HeapMinimize_Proxy(IMalloc*);
void IMalloc_HeapMinimize_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
ULONG IMallocSpy_PreAlloc_Proxy(IMallocSpy*, ULONG cbRequest);
void IMallocSpy_PreAlloc_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
void* IMallocSpy_PostAlloc_Proxy(IMallocSpy*, void*);
void IMallocSpy_PostAlloc_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
void* IMallocSpy_PreFree_Proxy(IMallocSpy*, void*, BOOL);
void IMallocSpy_PreFree_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
void IMallocSpy_PostFree_Proxy(IMallocSpy*, BOOL);
void IMallocSpy_PostFree_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
ULONG IMallocSpy_PreRealloc_Proxy(IMallocSpy*, void*, ULONG, void**, BOOL);
void IMallocSpy_PreRealloc_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
void* IMallocSpy_PostRealloc_Proxy(IMallocSpy*, void*, BOOL);
void IMallocSpy_PostRealloc_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
void* IMallocSpy_PreGetSize_Proxy(IMallocSpy*, void*, BOOL);
void IMallocSpy_PreGetSize_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
ULONG IMallocSpy_PostGetSize_Proxy(IMallocSpy*, ULONG, BOOL);
void IMallocSpy_PostGetSize_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
void* IMallocSpy_PreDidAlloc_Proxy(IMallocSpy*, void*, BOOL);
void IMallocSpy_PreDidAlloc_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
int IMallocSpy_PostDidAlloc_Proxy(IMallocSpy*, void*, BOOL, int);
void IMallocSpy_PostDidAlloc_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
void IMallocSpy_PreHeapMinimize_Proxy(IMallocSpy* );
void IMallocSpy_PreHeapMinimize_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
void IMallocSpy_PostHeapMinimize_Proxy(IMallocSpy*);
void IMallocSpy_PostHeapMinimize_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IStdMarshalInfo_GetClassForHandler_Proxy(IStdMarshalInfo*, DWORD, void*, CLSID*);
void IStdMarshalInfo_GetClassForHandler_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
DWORD IExternalConnection_AddConnection_Proxy(IExternalConnection*, DWORD, DWORD);
void IExternalConnection_AddConnection_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
DWORD IExternalConnection_ReleaseConnection_Proxy(IExternalConnection*, DWORD, DWORD, BOOL);
void IExternalConnection_ReleaseConnection_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IEnumUnknown_RemoteNext_Proxy(IEnumUnknown*, ULONG, IUnknown**, ULONG*);
void IEnumUnknown_RemoteNext_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IEnumUnknown_Skip_Proxy(IEnumUnknown*, ULONG);
void IEnumUnknown_Skip_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IEnumUnknown_Reset_Proxy(IEnumUnknown* );
void IEnumUnknown_Reset_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IEnumUnknown_Clone_Proxy(IEnumUnknown*, IEnumUnknown**);
void IEnumUnknown_Clone_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IBindCtx_RegisterObjectBound_Proxy(IBindCtx*, IUnknown*punk);
void IBindCtx_RegisterObjectBound_Stub(IRpcStubBuffer*, IRpcChannelBuffer*_pRpcChannelBuffer, PRPC_MESSAGE, PDWORD);
HRESULT IBindCtx_RevokeObjectBound_Proxy(IBindCtx*, IUnknown*punk);
void IBindCtx_RevokeObjectBound_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IBindCtx_ReleaseBoundObjects_Proxy(IBindCtx*);
void IBindCtx_ReleaseBoundObjects_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IBindCtx_SetBindOptions_Proxy(IBindCtx*, BIND_OPTS*);
void IBindCtx_SetBindOptions_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IBindCtx_GetBindOptions_Proxy(IBindCtx*, BIND_OPTS*pbindopts);
void IBindCtx_GetBindOptions_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IBindCtx_GetRunningObjectTable_Proxy(IBindCtx*, IRunningObjectTable**);
void IBindCtx_GetRunningObjectTable_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IBindCtx_RegisterObjectParam_Proxy(IBindCtx*, LPCSTR, IUnknown*);
void IBindCtx_RegisterObjectParam_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IBindCtx_GetObjectParam_Proxy(IBindCtx*, LPCSTR, IUnknown**);
void IBindCtx_GetObjectParam_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IBindCtx_EnumObjectParam_Proxy(IBindCtx*, IEnumString**);
void IBindCtx_EnumObjectParam_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IBindCtx_RevokeObjectParam_Proxy(IBindCtx*, LPCSTR);
void IBindCtx_RevokeObjectParam_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IEnumMoniker_RemoteNext_Proxy(IEnumMoniker*, ULONG, IMoniker**, ULONG*);
void IEnumMoniker_RemoteNext_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IEnumMoniker_Skip_Proxy(IEnumMoniker*, ULONG);
void IEnumMoniker_Skip_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IEnumMoniker_Reset_Proxy(IEnumMoniker*);
void IEnumMoniker_Reset_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IEnumMoniker_Clone_Proxy(IEnumMoniker*, IEnumMoniker**);
void IEnumMoniker_Clone_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IRunnableObject_GetRunningClass_Proxy(IRunnableObject*, LPCLSID);
void IRunnableObject_GetRunningClass_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IRunnableObject_Run_Proxy(IRunnableObject*, LPBINDCTX);
void IRunnableObject_Run_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
BOOL IRunnableObject_IsRunning_Proxy(IRunnableObject*);
void IRunnableObject_IsRunning_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IRunnableObject_LockRunning_Proxy(IRunnableObject*, BOOL, BOOL);
void IRunnableObject_LockRunning_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IRunnableObject_SetContainedObject_Proxy(IRunnableObject*, BOOL);
void IRunnableObject_SetContainedObject_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IRunningObjectTable_Register_Proxy(IRunningObjectTable*, DWORD, IUnknown*, IMoniker*, DWORD*);
void IRunningObjectTable_Register_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IRunningObjectTable_Revoke_Proxy(IRunningObjectTable*, DWORD);
void IRunningObjectTable_Revoke_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IRunningObjectTable_IsRunning_Proxy(IRunningObjectTable*, IMoniker*);
void IRunningObjectTable_IsRunning_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IRunningObjectTable_GetObject_Proxy(IRunningObjectTable*, IMoniker*, IUnknown**);
void IRunningObjectTable_GetObject_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IRunningObjectTable_NoteChangeTime_Proxy(IRunningObjectTable*, DWORD, FILETIME*);
void IRunningObjectTable_NoteChangeTime_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IRunningObjectTable_GetTimeOfLastChange_Proxy(IRunningObjectTable*, IMoniker*, FILETIME*);
void IRunningObjectTable_GetTimeOfLastChange_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IRunningObjectTable_EnumRunning_Proxy(IRunningObjectTable*, IEnumMoniker**);
void IRunningObjectTable_EnumRunning_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IPersist_GetClassID_Proxy(IPersist*, CLSID*);
void IPersist_GetClassID_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IPersistStream_IsDirty_Proxy(IPersistStream*);
void IPersistStream_IsDirty_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IPersistStream_Load_Proxy(IPersistStream*, IStream*);
void IPersistStream_Load_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IPersistStream_Save_Proxy(IPersistStream*, IStream*, BOOL);
void IPersistStream_Save_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IPersistStream_GetSizeMax_Proxy(IPersistStream*, ULARGE_INTEGER*);
void IPersistStream_GetSizeMax_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IMoniker_RemoteBindToObject_Proxy(IMoniker*, IBindCtx*, IMoniker*, REFIID, IUnknown**);
void IMoniker_RemoteBindToObject_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IMoniker_RemoteBindToStorage_Proxy(IMoniker*, IBindCtx*, IMoniker*, REFIID, IUnknown**);
void IMoniker_RemoteBindToStorage_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IMoniker_Reduce_Proxy(IMoniker*, IBindCtx*, DWORD, IMoniker**, IMoniker**);
void IMoniker_Reduce_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IMoniker_ComposeWith_Proxy(IMoniker*, IMoniker*, BOOL, IMoniker**);
void IMoniker_ComposeWith_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IMoniker_Enum_Proxy(IMoniker*, BOOL, IEnumMoniker**);
void IMoniker_Enum_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IMoniker_IsEqual_Proxy(IMoniker*, IMoniker*);
void IMoniker_IsEqual_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IMoniker_Hash_Proxy(IMoniker*, DWORD*);
void IMoniker_Hash_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IMoniker_IsRunning_Proxy(IMoniker*, IBindCtx*, IMoniker*, IMoniker*);
void IMoniker_IsRunning_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IMoniker_GetTimeOfLastChange_Proxy(IMoniker*, IBindCtx*, IMoniker*, FILETIME*);
void IMoniker_GetTimeOfLastChange_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IMoniker_Inverse_Proxy(IMoniker*, IMoniker**);
void IMoniker_Inverse_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IMoniker_CommonPrefixWith_Proxy(IMoniker*, IMoniker*, IMoniker**);
void IMoniker_CommonPrefixWith_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IMoniker_RelativePathTo_Proxy(IMoniker*, IMoniker*, IMoniker**);
void IMoniker_RelativePathTo_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IMoniker_GetDisplayName_Proxy(IMoniker*, IBindCtx*, IMoniker*, LPCSTR*);
void IMoniker_GetDisplayName_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IMoniker_ParseDisplayName_Proxy(IMoniker*, IBindCtx*, IMoniker*, LPCSTR, ULONG*, IMoniker**);
void IMoniker_ParseDisplayName_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IMoniker_IsSystemMoniker_Proxy(IMoniker*, DWORD*);
void IMoniker_IsSystemMoniker_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IROTData_GetComparisonData_Proxy(IROTData*, BYTE*, ULONG cbMax, ULONG*);
void IROTData_GetComparisonData_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IEnumString_RemoteNext_Proxy(IEnumString*, ULONG, LPCSTR*rgelt, ULONG*);
void IEnumString_RemoteNext_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IEnumString_Skip_Proxy(IEnumString*, ULONG);
void IEnumString_Skip_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IEnumString_Reset_Proxy(IEnumString*);
void IEnumString_Reset_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IEnumString_Clone_Proxy(IEnumString*, IEnumString**);
void IEnumString_Clone_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IStream_RemoteRead_Proxy(IStream*, BYTE*, ULONG, ULONG*);
void IStream_RemoteRead_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IStream_RemoteWrite_Proxy(IStream*, BYTE*pv, ULONG, ULONG*);
void IStream_RemoteWrite_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IStream_RemoteSeek_Proxy(IStream*, LARGE_INTEGER, DWORD, ULARGE_INTEGER*);
void IStream_RemoteSeek_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IStream_SetSize_Proxy(IStream*, ULARGE_INTEGER);
void IStream_SetSize_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IStream_RemoteCopyTo_Proxy(IStream*, IStream*, ULARGE_INTEGER, ULARGE_INTEGER*, ULARGE_INTEGER*);
void IStream_RemoteCopyTo_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IStream_Commit_Proxy(IStream*, DWORD);
void IStream_Commit_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IStream_Revert_Proxy(IStream*);
void IStream_Revert_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IStream_LockRegion_Proxy(IStream*, ULARGE_INTEGER, ULARGE_INTEGER, DWORD);
void IStream_LockRegion_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IStream_UnlockRegion_Proxy(IStream*, ULARGE_INTEGER, ULARGE_INTEGER, DWORD);
void IStream_UnlockRegion_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IStream_Stat_Proxy(IStream*, STATSTG*, DWORD);
void IStream_Stat_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IStream_Clone_Proxy(IStream*, IStream**);
void IStream_Clone_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IEnumSTATSTG_RemoteNext_Proxy(IEnumSTATSTG*, ULONG, STATSTG*, ULONG*);
void IEnumSTATSTG_RemoteNext_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IEnumSTATSTG_Skip_Proxy(IEnumSTATSTG*, ULONG celt);
void IEnumSTATSTG_Skip_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IEnumSTATSTG_Reset_Proxy(IEnumSTATSTG*);
void IEnumSTATSTG_Reset_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IEnumSTATSTG_Clone_Proxy(IEnumSTATSTG*, IEnumSTATSTG**);
void IEnumSTATSTG_Clone_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IStorage_CreateStream_Proxy(IStorage*, wchar*, DWORD, DWORD, DWORD, IStream**);
void IStorage_CreateStream_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IStorage_RemoteOpenStream_Proxy(IStorage*, wchar*, uint, BYTE*, DWORD, DWORD, IStream**);
void IStorage_RemoteOpenStream_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IStorage_CreateStorage_Proxy(IStorage*, wchar*, DWORD, DWORD, DWORD, IStorage**);
void IStorage_CreateStorage_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IStorage_OpenStorage_Proxy(IStorage*, wchar*, IStorage*, DWORD, SNB, DWORD, IStorage**);
void IStorage_OpenStorage_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IStorage_CopyTo_Proxy(IStorage*, DWORD, IID*, SNB, IStorage*);
void IStorage_CopyTo_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IStorage_MoveElementTo_Proxy(IStorage*, wchar*, IStorage*, wchar*, DWORD);
void IStorage_MoveElementTo_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IStorage_Commit_Proxy(IStorage*, DWORD);
void IStorage_Commit_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IStorage_Revert_Proxy(IStorage*);
void IStorage_Revert_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IStorage_RemoteEnumElements_Proxy(IStorage*, DWORD, uint, BYTE*, DWORD, IEnumSTATSTG**);
void IStorage_RemoteEnumElements_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IStorage_DestroyElement_Proxy(IStorage*, wchar*);
void IStorage_DestroyElement_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IStorage_RenameElement_Proxy(IStorage*, wchar*, wchar*);
void IStorage_RenameElement_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IStorage_SetElementTimes_Proxy(IStorage*, wchar*, FILETIME*, FILETIME*, FILETIME*);
void IStorage_SetElementTimes_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IStorage_SetClass_Proxy(IStorage*, REFCLSID);
void IStorage_SetClass_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IStorage_SetStateBits_Proxy(IStorage*, DWORD, DWORD);
void IStorage_SetStateBits_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IStorage_Stat_Proxy(IStorage*, STATSTG*, DWORD);
void IStorage_Stat_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IPersistFile_IsDirty_Proxy(IPersistFile*);
void IPersistFile_IsDirty_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IPersistFile_Load_Proxy(IPersistFile*, wchar*, DWORD);
void IPersistFile_Load_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IPersistFile_Save_Proxy(IPersistFile*, wchar* pszFileName, BOOL);
void IPersistFile_Save_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IPersistFile_SaveCompleted_Proxy(IPersistFile*, wchar*);
void IPersistFile_SaveCompleted_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IPersistFile_GetCurFile_Proxy(IPersistFile*, LPCSTR*);
void IPersistFile_GetCurFile_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IPersistStorage_IsDirty_Proxy(IPersistStorage*);
void IPersistStorage_IsDirty_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IPersistStorage_InitNew_Proxy(IPersistStorage*, IStorage*);
void IPersistStorage_InitNew_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IPersistStorage_Load_Proxy(IPersistStorage*, IStorage*);
void IPersistStorage_Load_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IPersistStorage_Save_Proxy(IPersistStorage*, IStorage*, BOOL);
void IPersistStorage_Save_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IPersistStorage_SaveCompleted_Proxy(IPersistStorage*, IStorage*);
void IPersistStorage_SaveCompleted_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IPersistStorage_HandsOffStorage_Proxy(IPersistStorage*);
void IPersistStorage_HandsOffStorage_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT ILockBytes_RemoteReadAt_Proxy(ILockBytes*, ULARGE_INTEGER, BYTE*, ULONG, ULONG*);
void ILockBytes_RemoteReadAt_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT ILockBytes_RemoteWriteAt_Proxy(ILockBytes*, ULARGE_INTEGER, BYTE*pv, ULONG, ULONG*);
void ILockBytes_RemoteWriteAt_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT ILockBytes_Flush_Proxy(ILockBytes*);
void ILockBytes_Flush_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT ILockBytes_SetSize_Proxy(ILockBytes*, ULARGE_INTEGER);
void ILockBytes_SetSize_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT ILockBytes_LockRegion_Proxy(ILockBytes*, ULARGE_INTEGER, ULARGE_INTEGER, DWORD);
void ILockBytes_LockRegion_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT ILockBytes_UnlockRegion_Proxy(ILockBytes*, ULARGE_INTEGER, ULARGE_INTEGER, DWORD);
void ILockBytes_UnlockRegion_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT ILockBytes_Stat_Proxy(ILockBytes*, STATSTG*, DWORD);
void ILockBytes_Stat_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IEnumFORMATETC_RemoteNext_Proxy(IEnumFORMATETC*, ULONG, FORMATETC*, ULONG*);
void IEnumFORMATETC_RemoteNext_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IEnumFORMATETC_Skip_Proxy(IEnumFORMATETC*, ULONG);
void IEnumFORMATETC_Skip_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IEnumFORMATETC_Reset_Proxy(IEnumFORMATETC*);
void IEnumFORMATETC_Reset_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IEnumFORMATETC_Clone_Proxy(IEnumFORMATETC*, IEnumFORMATETC**);
void IEnumFORMATETC_Clone_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IEnumFORMATETC_Next_Proxy(IEnumFORMATETC*, ULONG, FORMATETC*, ULONG*);
HRESULT IEnumFORMATETC_Next_Stub(IEnumFORMATETC*, ULONG, FORMATETC*, ULONG*);
HRESULT IEnumSTATDATA_RemoteNext_Proxy(IEnumSTATDATA*, ULONG, STATDATA*, ULONG*);
void IEnumSTATDATA_RemoteNext_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IEnumSTATDATA_Skip_Proxy(IEnumSTATDATA*, ULONG);
void IEnumSTATDATA_Skip_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IEnumSTATDATA_Reset_Proxy(IEnumSTATDATA*);
void IEnumSTATDATA_Reset_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IEnumSTATDATA_Clone_Proxy(IEnumSTATDATA*, IEnumSTATDATA**);
void IEnumSTATDATA_Clone_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IEnumSTATDATA_Next_Proxy(IEnumSTATDATA*, ULONG, STATDATA*, ULONG*);
HRESULT IEnumSTATDATA_Next_Stub(IEnumSTATDATA*, ULONG, STATDATA*, ULONG*);
HRESULT IRootStorage_SwitchToFile_Proxy(IRootStorage*, LPCSTR);
void IRootStorage_SwitchToFile_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
void IAdviseSink_RemoteOnDataChange_Proxy(IAdviseSink*, FORMATETC*, RemSTGMEDIUM*);
void IAdviseSink_RemoteOnDataChange_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
void IAdviseSink_RemoteOnViewChange_Proxy(IAdviseSink*, DWORD, LONG);
void IAdviseSink_RemoteOnViewChange_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
void IAdviseSink_RemoteOnRename_Proxy(IAdviseSink*, IMoniker*);
void IAdviseSink_RemoteOnRename_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
void IAdviseSink_RemoteOnSave_Proxy(IAdviseSink*);
void IAdviseSink_RemoteOnSave_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IAdviseSink_RemoteOnClose_Proxy(IAdviseSink*);
void IAdviseSink_RemoteOnClose_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
void IAdviseSink_OnDataChange_Proxy(IAdviseSink*, FORMATETC*, STGMEDIUM*);
void IAdviseSink_OnDataChange_Stub(IAdviseSink*, FORMATETC*, RemSTGMEDIUM*);
void IAdviseSink_OnViewChange_Proxy(IAdviseSink*, DWORD, LONG);
void IAdviseSink_OnViewChange_Stub(IAdviseSink*, DWORD, LONG);
void IAdviseSink_OnRename_Proxy(IAdviseSink*, IMoniker*);
void IAdviseSink_OnRename_Stub(IAdviseSink*, IMoniker*);
void IAdviseSink_OnSave_Proxy(IAdviseSink*);
void IAdviseSink_OnSave_Stub(IAdviseSink*);
void IAdviseSink_OnClose_Proxy(IAdviseSink*);
HRESULT IAdviseSink_OnClose_Stub(IAdviseSink*);
void IAdviseSink2_RemoteOnLinkSrcChange_Proxy(IAdviseSink2*, IMoniker*);
void IAdviseSink2_RemoteOnLinkSrcChange_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
void IAdviseSink2_OnLinkSrcChange_Proxy(IAdviseSink2*, IMoniker*);
void IAdviseSink2_OnLinkSrcChange_Stub(IAdviseSink2*, IMoniker*);
HRESULT IDataObject_RemoteGetData_Proxy(IDataObject*, FORMATETC*, RemSTGMEDIUM**);
void IDataObject_RemoteGetData_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IDataObject_RemoteGetDataHere_Proxy(IDataObject*, FORMATETC*, RemSTGMEDIUM**);
void IDataObject_RemoteGetDataHere_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IDataObject_QueryGetData_Proxy(IDataObject*, FORMATETC*);
void IDataObject_QueryGetData_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IDataObject_GetCanonicalFormatEtc_Proxy(IDataObject*, FORMATETC*, FORMATETC*);
void IDataObject_GetCanonicalFormatEtc_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IDataObject_RemoteSetData_Proxy(IDataObject*, FORMATETC*, RemSTGMEDIUM*, BOOL);
void IDataObject_RemoteSetData_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IDataObject_EnumFormatEtc_Proxy(IDataObject*, DWORD, IEnumFORMATETC**);
void IDataObject_EnumFormatEtc_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IDataObject_DAdvise_Proxy(IDataObject*, FORMATETC*, DWORD, IAdviseSink*, DWORD*);
void IDataObject_DAdvise_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IDataObject_DUnadvise_Proxy(IDataObject*, DWORD);
void IDataObject_DUnadvise_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IDataObject_EnumDAdvise_Proxy(IDataObject*, IEnumSTATDATA**);
void IDataObject_EnumDAdvise_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IDataObject_GetData_Proxy(IDataObject*, FORMATETC*, STGMEDIUM*);
HRESULT IDataObject_GetData_Stub(IDataObject*, FORMATETC*, RemSTGMEDIUM**);
HRESULT IDataObject_GetDataHere_Proxy(IDataObject*, FORMATETC*, STGMEDIUM*);
HRESULT IDataObject_GetDataHere_Stub(IDataObject*, FORMATETC*, RemSTGMEDIUM**);
HRESULT IDataObject_SetData_Proxy(IDataObject*, FORMATETC*, STGMEDIUM*, BOOL);
HRESULT IDataObject_SetData_Stub(IDataObject*, FORMATETC*, RemSTGMEDIUM*, BOOL);
HRESULT IDataAdviseHolder_Advise_Proxy(IDataAdviseHolder*, IDataObject*, FORMATETC*, DWORD, IAdviseSink*, DWORD*);
void IDataAdviseHolder_Advise_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IDataAdviseHolder_Unadvise_Proxy(IDataAdviseHolder*, DWORD);
void IDataAdviseHolder_Unadvise_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IDataAdviseHolder_EnumAdvise_Proxy(IDataAdviseHolder*, IEnumSTATDATA**);
void IDataAdviseHolder_EnumAdvise_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IDataAdviseHolder_SendOnDataChange_Proxy(IDataAdviseHolder*, IDataObject*, DWORD, DWORD);
void IDataAdviseHolder_SendOnDataChange_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
DWORD IMessageFilter_HandleInComingCall_Proxy(IMessageFilter*, DWORD, HTASK, DWORD, LPINTERFACEINFO);
void IMessageFilter_HandleInComingCall_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
DWORD IMessageFilter_RetryRejectedCall_Proxy(IMessageFilter*, HTASK, DWORD, DWORD);
void IMessageFilter_RetryRejectedCall_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
DWORD IMessageFilter_MessagePending_Proxy(IMessageFilter*, HTASK, DWORD, DWORD);
void IMessageFilter_MessagePending_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IRpcChannelBuffer_GetBuffer_Proxy(IRpcChannelBuffer*, RPCOLEMESSAGE*, REFIID);
void IRpcChannelBuffer_GetBuffer_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IRpcChannelBuffer_SendReceive_Proxy(IRpcChannelBuffer*, RPCOLEMESSAGE*, ULONG*);
void IRpcChannelBuffer_SendReceive_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IRpcChannelBuffer_FreeBuffer_Proxy(IRpcChannelBuffer*, RPCOLEMESSAGE*);
void IRpcChannelBuffer_FreeBuffer_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IRpcChannelBuffer_GetDestCtx_Proxy(IRpcChannelBuffer*, DWORD*, void**);
void IRpcChannelBuffer_GetDestCtx_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IRpcChannelBuffer_IsConnected_Proxy(IRpcChannelBuffer*);
void IRpcChannelBuffer_IsConnected_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IRpcProxyBuffer_Connect_Proxy(IRpcProxyBuffer*, IRpcChannelBuffer*pRpcChannelBuffer);
void IRpcProxyBuffer_Connect_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
void IRpcProxyBuffer_Disconnect_Proxy(IRpcProxyBuffer*);
void IRpcProxyBuffer_Disconnect_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IRpcStubBuffer_Connect_Proxy(IRpcStubBuffer*, IUnknown*);
void IRpcStubBuffer_Connect_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
void IRpcStubBuffer_Disconnect_Proxy(IRpcStubBuffer*);
void IRpcStubBuffer_Disconnect_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IRpcStubBuffer_Invoke_Proxy(IRpcStubBuffer*, RPCOLEMESSAGE*, IRpcChannelBuffer*);
void IRpcStubBuffer_Invoke_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
IRpcStubBuffer*IRpcStubBuffer_IsIIDSupported_Proxy(IRpcStubBuffer*, REFIID);
void IRpcStubBuffer_IsIIDSupported_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
ULONG IRpcStubBuffer_CountRefs_Proxy(IRpcStubBuffer*);
void IRpcStubBuffer_CountRefs_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IRpcStubBuffer_DebugServerQueryInterface_Proxy(IRpcStubBuffer*, void**);
void IRpcStubBuffer_DebugServerQueryInterface_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
void IRpcStubBuffer_DebugServerRelease_Proxy(IRpcStubBuffer*, void*);
void IRpcStubBuffer_DebugServerRelease_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IPSFactoryBuffer_CreateProxy_Proxy(IPSFactoryBuffer*, IUnknown*, REFIID, IRpcProxyBuffer**, void**);
void IPSFactoryBuffer_CreateProxy_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
HRESULT IPSFactoryBuffer_CreateStub_Proxy(IPSFactoryBuffer*, REFIID, IUnknown*, IRpcStubBuffer**);
void IPSFactoryBuffer_CreateStub_Stub(IRpcStubBuffer*, IRpcChannelBuffer*, PRPC_MESSAGE, PDWORD);
void SNB_to_xmit(SNB*, RemSNB**);
void SNB_from_xmit(RemSNB*, SNB*);
void SNB_free_inst(SNB*);
void SNB_free_xmit(RemSNB*);
HRESULT IEnumUnknown_Next_Proxy(IEnumUnknown*, ULONG, IUnknown**, ULONG*);
HRESULT IEnumUnknown_Next_Stub(IEnumUnknown*, ULONG, IUnknown**, ULONG*);
HRESULT IEnumMoniker_Next_Proxy(IEnumMoniker*, ULONG, IMoniker**, ULONG*);
HRESULT IEnumMoniker_Next_Stub(IEnumMoniker*, ULONG, IMoniker**, ULONG*);
HRESULT IMoniker_BindToObject_Proxy(IMoniker*, IBindCtx*, IMoniker*, REFIID, void**);
HRESULT IMoniker_BindToObject_Stub(IMoniker*, IBindCtx*, IMoniker*, REFIID, IUnknown**);
HRESULT IMoniker_BindToStorage_Proxy(IMoniker*, IBindCtx*, IMoniker*, REFIID, void**);
HRESULT IMoniker_BindToStorage_Stub(IMoniker*, IBindCtx*, IMoniker*, REFIID, IUnknown**);
HRESULT IEnumString_Next_Proxy(IEnumString*, ULONG, LPCSTR*, ULONG*);
HRESULT IEnumString_Next_Stub(IEnumString*, ULONG, LPCSTR*, ULONG*);
HRESULT IStream_Read_Proxy(IStream*, void*, ULONG, ULONG*);
HRESULT IStream_Read_Stub(IStream*, BYTE*, ULONG, ULONG*);
HRESULT IStream_Write_Proxy(IStream*, void*, ULONG, ULONG*);
HRESULT IStream_Write_Stub(IStream*, BYTE*, ULONG, ULONG*);
HRESULT IStream_Seek_Proxy(IStream*, LARGE_INTEGER, DWORD, ULARGE_INTEGER*);
HRESULT IStream_Seek_Stub(IStream*, LARGE_INTEGER, DWORD, ULARGE_INTEGER*);
HRESULT IStream_CopyTo_Proxy(IStream*, IStream*, ULARGE_INTEGER, ULARGE_INTEGER*, ULARGE_INTEGER*);
HRESULT IStream_CopyTo_Stub(IStream*, IStream*, ULARGE_INTEGER, ULARGE_INTEGER*, ULARGE_INTEGER*);
HRESULT IEnumSTATSTG_Next_Proxy(IEnumSTATSTG*, ULONG, STATSTG*, ULONG*);
HRESULT IEnumSTATSTG_Next_Stub(IEnumSTATSTG*, ULONG, STATSTG*, ULONG*);
HRESULT IStorage_OpenStream_Proxy(IStorage*, wchar*, void*, DWORD, DWORD, IStream**);
HRESULT IStorage_OpenStream_Stub(IStorage*, wchar*, uint, BYTE*, DWORD, DWORD, IStream** );
HRESULT IStorage_EnumElements_Proxy(IStorage*, DWORD, void*, DWORD, IEnumSTATSTG**);
HRESULT IStorage_EnumElements_Stub(IStorage*, DWORD, uint, BYTE*, DWORD, IEnumSTATSTG**);
HRESULT ILockBytes_ReadAt_Proxy(ILockBytes*, ULARGE_INTEGER, void*, ULONG, ULONG*);
HRESULT ILockBytes_ReadAt_Stub(ILockBytes*, ULARGE_INTEGER, BYTE*, ULONG, ULONG*);
HRESULT ILockBytes_WriteAt_Proxy(ILockBytes*, ULARGE_INTEGER, void*, ULONG, ULONG*);
HRESULT ILockBytes_WriteAt_Stub(ILockBytes*, ULARGE_INTEGER, BYTE*, ULONG, ULONG*);
}
+/

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
