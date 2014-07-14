// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2009  (dyuyan  gmail at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: May 2009

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/


module dwin.sys.win32.headers.objbase;

private import dwin.sys.win32.com.Core;
private import tango.sys.win32.Types;
    
private import dwin.sys.win32.headers.objidl; //for IBindCtx
    
pragma(lib, "ole32.lib");



//import win32.cguid, win32.objidl, win32.unknwn, win32.wtypes;
//private import win32.basetyps, win32.objfwd, win32.rpcdce, win32.winbase,
  //win32.windef;

// DAC: Not needed for D?
//MACRO #define LISet32(li, v) ((li).HighPart=(v)<0?-1:0, (li).LowPart=(v))
//MACRO #define ULISet32(li, v) ((li).HighPart=0, (li).LowPart=(v))
/*
const CLSCTX_ALL    = CLSCTX.CLSCTX_INPROC_SERVER|CLSCTX.CLSCTX_INPROC_HANDLER|CLSCTX.CLSCTX_LOCAL_SERVER;
const CLSCTX_INPROC = CLSCTX.CLSCTX_INPROC_SERVER|CLSCTX.CLSCTX_INPROC_HANDLER;
const CLSCTX_SERVER = CLSCTX.CLSCTX_INPROC_SERVER|CLSCTX.CLSCTX_LOCAL_SERVER|CLSCTX.CLSCTX_REMOTE_SERVER;
const MARSHALINTERFACE_MIN=500;
const CWCSTORAGENAME=32;
*/
const STGM_DIRECT           = 0;
const STGM_TRANSACTED       = 0x10000L;
const STGM_SIMPLE           = 0x8000000L;
const STGM_READ             = 0;
const STGM_WRITE            = 1;
const STGM_READWRITE        = 2;
const STGM_SHARE_DENY_NONE  = 0x40;
const STGM_SHARE_DENY_READ  = 0x30;
const STGM_SHARE_DENY_WRITE = 0x20;
const STGM_SHARE_EXCLUSIVE  = 0x10;
const STGM_PRIORITY         = 0x40000L;
const STGM_DELETEONRELEASE  = 0x4000000;
const STGM_NOSCRATCH        = 0x100000;
const STGM_CREATE           = 0x1000;
const STGM_CONVERT          = 0x20000;
const STGM_NOSNAPSHOT       = 0x200000;
const STGM_FAILIFTHERE      = 0;

/*
const ASYNC_MODE_COMPATIBILITY = 1;
const ASYNC_MODE_DEFAULT       = 0;

const STGTY_REPEAT = 256;
const STG_TOEND = 0xFFFFFFFF;
const STG_LAYOUT_SEQUENTIAL  = 0;
const STG_LAYOUT_INTERLEAVED = 1;

const COM_RIGHTS_EXECUTE            = 1;
const COM_RIGHTS_SAFE_FOR_SCRIPTING = 2;

const STGOPTIONS_VERSION = 2;

enum STGFMT {
	STGFMT_STORAGE = 0,
	STGFMT_FILE = 3,
	STGFMT_ANY = 4,
	STGFMT_DOCFILE = 5
}

struct STGOPTIONS {
	USHORT usVersion;
	USHORT reserved;
	ULONG ulSectorSize;
	WCHAR* pwcsTemplateFile;
}

enum REGCLS {
	REGCLS_SINGLEUSE = 0,
	REGCLS_MULTIPLEUSE = 1,
	REGCLS_MULTI_SEPARATE = 2
}
*/
BOOL IsEqualGUID(DWINGUID* rguid1, DWINGUID* rguid2) {
	return *rguid1 == *rguid2;
}

alias IsEqualGUID IsEqualIID;
alias IsEqualGUID IsEqualCLSID;

    enum : uint {
      COINIT_MULTITHREADED = 0x0,
      COINIT_APARTMENTTHREADED = 0x2,
      COINIT_DISABLE_OLE1DDE = 0x4,
      COINIT_SPEED_OVER_MEMORY = 0x8
    }
/*
enum COINIT {
	COINIT_APARTMENTTHREADED = 2,
	COINIT_MULTITHREADED     = 0,
	COINIT_DISABLE_OLE1DDE   = 4,
	COINIT_SPEED_OVER_MEMORY = 8
}
*/

/*
enum STDMSHLFLAGS {
	SMEXF_SERVER  = 1,
	SMEXF_HANDLER
}
*/

extern(Windows): 

    /*
	alias HRESULT function(REFCLSID, REFIID, PVOID*) LPFNGETCLASSOBJECT;
	alias HRESULT function() LPFNCANUNLOADNOW;

	DWORD CoBuildVersion();
    */
	HRESULT CoInitialize(PVOID);
	HRESULT CoInitializeEx(LPVOID, DWORD);
	void CoUninitialize();
    int CoGetClassObject(ref DWINGUID rclsid, uint dwClsContext, void* pvReserved, ref DWINGUID riid, void** ppv);
	//HRESULT CoGetClassObject(REFCLSID, DWORD, COSERVERINFO*, REFIID, PVOID*);
    
    /*
	HRESULT CoGetMalloc(DWORD, LPMALLOC*);
	DWORD CoGetCurrentProcess();
	HRESULT CoRegisterMallocSpy(LPMALLOCSPY);
	HRESULT CoRevokeMallocSpy();
	HRESULT CoCreateStandardMalloc(DWORD, IMalloc**);
	//#ifdef DBG
	ULONG DebugCoGetRpcFault();
	void DebugCoSetRpcFault(ULONG);
	//#endif
	HRESULT CoRegisterClassObject(REFCLSID, LPUNKNOWN, DWORD, DWORD, PDWORD);
	HRESULT CoRevokeClassObject(DWORD);
	HRESULT CoGetMarshalSizeMax(ULONG*, REFIID, LPUNKNOWN, DWORD, PVOID, DWORD);
	HRESULT CoMarshalInterface(LPSTREAM, REFIID, LPUNKNOWN, DWORD, PVOID, DWORD);
	HRESULT CoUnmarshalInterface(LPSTREAM, REFIID, PVOID*);
	HRESULT CoMarshalHresult(LPSTREAM, HRESULT);
	HRESULT CoUnmarshalHresult(LPSTREAM, HRESULT*);
	HRESULT CoReleaseMarshalData(LPSTREAM);
	HRESULT CoDisconnectObject(LPUNKNOWN, DWORD);
	HRESULT CoLockObjectExternal(LPUNKNOWN, BOOL, BOOL);
	HRESULT CoGetStandardMarshal(REFIID, LPUNKNOWN, DWORD, PVOID, DWORD, LPMARSHAL*);
	HRESULT CoGetStdMarshalEx(LPUNKNOWN, DWORD, LPUNKNOWN*);
	BOOL CoIsHandlerConnected(LPUNKNOWN);
	BOOL CoHasStrongExternalConnections(LPUNKNOWN);
	HRESULT CoMarshalInterThreadInterfaceInStream(REFIID, LPUNKNOWN, LPSTREAM*);
	HRESULT CoGetInterfaceAndReleaseStream(LPSTREAM, REFIID, PVOID*);
	HRESULT CoCreateFreeThreadedMarshaler(LPUNKNOWN, LPUNKNOWN*);
	HINSTANCE CoLoadLibrary(LPOLESTR, BOOL);
	void CoFreeLibrary(HINSTANCE);
	void CoFreeAllLibraries();
	void CoFreeUnusedLibraries();
	HRESULT CoCreateInstance(REFCLSID, LPUNKNOWN, DWORD, REFIID, PVOID*);
	HRESULT CoCreateInstanceEx(REFCLSID, IUnknown*, DWORD, COSERVERINFO*, DWORD, MULTI_QI*);
	HRESULT StringFromCLSID(REFCLSID, LPOLESTR*);
	HRESULT CLSIDFromString(LPOLESTR, LPCLSID);
	HRESULT StringFromIID(REFIID, LPOLESTR*);
	HRESULT IIDFromString(LPOLESTR, LPIID);
	BOOL CoIsOle1Class(REFCLSID);
*/

    int ProgIDFromCLSID(ref DWINGUID clsid, out wchar* lplpszProgID);
	//HRESULT ProgIDFromCLSID(REFCLSID, LPOLESTR*);
/*    
	HRESULT CLSIDFromProgID(LPCOLESTR, LPCLSID);
	int StringFromGUID2(REFGUID, LPOLESTR, int);
	HRESULT CoCreateGuid(DWINGUID*);
	BOOL CoFileTimeToDosDateTime(FILETIME*, LPWORD, LPWORD);
	BOOL CoDosDateTimeToFileTime(WORD, WORD, FILETIME*);
	HRESULT CoFileTimeNow(FILETIME*);
	HRESULT CoRegisterMessageFilter(LPMESSAGEFILTER, LPMESSAGEFILTER*);
	HRESULT CoGetTreatAsClass(REFCLSID, LPCLSID);
	HRESULT CoTreatAsClass(REFCLSID, REFCLSID);
	HRESULT DllGetClassObject(REFCLSID, REFIID, PVOID*);
	HRESULT DllCanUnloadNow();
*/    

    void* CoTaskMemAlloc(size_t cb);
    void* CoTaskMemRealloc(void* pv, uint cb);
    void CoTaskMemFree(void* pv);
    /*
	PVOID CoTaskMemAlloc(ULONG);
	PVOID CoTaskMemRealloc(PVOID, ULONG);
	void CoTaskMemFree(PVOID);
    */
    /*
	HRESULT CreateDataAdviseHolder(LPDATAADVISEHOLDER*);
	HRESULT CreateDataCache(LPUNKNOWN, REFCLSID, REFIID, PVOID*);
	HRESULT StgCreateDocfile(OLECHAR*, DWORD, DWORD, IStorage**);
	HRESULT StgCreateDocfileOnILockBytes(ILockBytes*, DWORD, DWORD, IStorage**);
	HRESULT StgOpenStorage(OLECHAR*, IStorage, DWORD, SNB, DWORD, IStorage*);
	HRESULT StgOpenStorageOnILockBytes(ILockBytes*, IStorage*, DWORD, SNB, DWORD, IStorage**);
	HRESULT StgIsStorageFile(OLECHAR*);
	HRESULT StgIsStorageILockBytes(ILockBytes*);
	HRESULT StgSetTimes(OLECHAR *, FILETIME *, FILETIME *, FILETIME *);
	HRESULT StgCreateStorageEx(WCHAR*, DWORD, DWORD, DWORD, STGOPTIONS*, void*, REFIID, void**);
	HRESULT StgOpenStorageEx(WCHAR*, DWORD, DWORD, DWORD, STGOPTIONS*, void*, REFIID, void**);
	HRESULT BindMoniker(LPMONIKER, DWORD, REFIID, PVOID*);
	HRESULT CoGetObject(LPCWSTR, BIND_OPTS*, REFIID, void**);
	HRESULT MkParseDisplayName(LPBC, LPCOLESTR, ULONG*, LPMONIKER*);
	HRESULT MonikerRelativePathTo(LPMONIKER, LPMONIKER, LPMONIKER*, BOOL);
	HRESULT MonikerCommonPrefixWith(LPMONIKER, LPMONIKER, LPMONIKER*);
    */
    
    int CreateBindCtx(uint, IBindCtx*);    
	//HRESULT CreateBindCtx(DWORD, LPBC*);
    /*
	HRESULT CreateGenericComposite(LPMONIKER, LPMONIKER, LPMONIKER*);
	HRESULT GetClassFile (LPCOLESTR, CLSID*);
	HRESULT CreateFileMoniker(LPCOLESTR, LPMONIKER*);
	HRESULT CreateItemMoniker(LPCOLESTR, LPCOLESTR, LPMONIKER*);
	HRESULT CreateAntiMoniker(LPMONIKER*);
	HRESULT CreatePointerMoniker(LPUNKNOWN, LPMONIKER*);
	HRESULT GetRunningObjectTable(DWORD, LPRUNNINGOBJECTTABLE*);
	HRESULT CoInitializeSecurity(PSECURITY_DESCRIPTOR, LONG, SOLE_AUTHENTICATION_SERVICE*, void*, DWORD, DWORD, void*, DWORD, void*);
	HRESULT CoGetCallContext(REFIID, void**);
	HRESULT CoQueryProxyBlanket(IUnknown*, DWORD*, DWORD*, OLECHAR**, DWORD*, DWORD*, RPC_AUTH_IDENTITY_HANDLE*, DWORD*);
	HRESULT CoSetProxyBlanket(IUnknown*, DWORD, DWORD, OLECHAR*, DWORD, DWORD, RPC_AUTH_IDENTITY_HANDLE, DWORD);
	HRESULT CoCopyProxy(IUnknown*, IUnknown**);
	HRESULT CoQueryClientBlanket(DWORD*, DWORD*, OLECHAR**, DWORD*, DWORD*, RPC_AUTHZ_HANDLE*, DWORD*);
	HRESULT CoImpersonateClient();
	HRESULT CoRevertToSelf();
	HRESULT CoQueryAuthenticationServices(DWORD*, SOLE_AUTHENTICATION_SERVICE**);
	HRESULT CoSwitchCallContext(IUnknown*, IUnknown**);
	HRESULT CoGetInstanceFromFile(COSERVERINFO*, CLSID*, IUnknown*, DWORD, DWORD, OLECHAR*, DWORD, MULTI_QI*);
	HRESULT CoGetInstanceFromIStorage(COSERVERINFO*, CLSID*, IUnknown*, DWORD, IStorage*, DWORD, MULTI_QI*);
	ULONG CoAddRefServerProcess();
	ULONG CoReleaseServerProcess();
	HRESULT CoResumeClassObjects();
	HRESULT CoSuspendClassObjects();
	HRESULT CoGetPSClsid(REFIID, CLSID*);
	HRESULT CoRegisterPSClsid(REFIID, REFCLSID);
    */