// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2009  (dyuyan  gmail at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: May 2009

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/


module dwin.sys.win32.headers.unknwn;

private import dwin.sys.win32.com.Core;
/*
private import win32.objfwd, win32.windef, win32.wtypes;
private import win32.basetyps;

private import Core = dwin.sys.win32.com.Core;
    public alias Core.IUnknown IUnknown;
        
private import inter = dwin.sys.win32.com.COMInterface;
    public alias inter.IClassFactory IClassFactory;
*/
/*
extern (Windows) {
	void* MIDL_user_allocate(size_t);
	void MIDL_user_free(void*);
}
*/
extern (C)
{
	extern DWINGUID IID_IUnknown;
	extern DWINGUID IID_IClassFactory;
}

extern (Windows) {

    /*
	interface IUnknown {
		HRESULT QueryInterface(IID* riid, void** pvObject);
		ULONG AddRef();
		ULONG Release();
	}
    */
    
	//alias IUnknown LPUNKNOWN;

    interface IClassFactory : IUnknown {
      mixin(uuid("00000001-0000-0000-c000-000000000046"));
      // static DWINGUID IID = { 0x00000001, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int CreateInstance(IUnknown pUnkOuter, ref DWINGUID riid, void** ppvObject);
      int LockServer(int fLock);
    }    
    
    /*
	interface IClassFactory : IUnknown {
		HRESULT CreateInstance(IUnknown UnkOuter, IID* riid, void** pvObject);
		HRESULT LockServer(BOOL fLock);
	}
    */
	//alias IClassFactory LPCLASSFACTORY;

	/+
	// These do not seem to be necessary (or desirable) for D.
	HRESULT IUnknown_QueryInterface_Proxy(IUnknown*,REFIID,void**);
	ULONG IUnknown_AddRef_Proxy(IUnknown*);
	ULONG IUnknown_Release_Proxy(IUnknown*);
	HRESULT IClassFactory_RemoteCreateInstance_Proxy(IClassFactory*,REFIID,IUnknown**);
	HRESULT IClassFactory_RemoteLockServer_Proxy(IClassFactory*,BOOL);
	HRESULT IClassFactory_CreateInstance_Proxy(IClassFactory*,IUnknown*,REFIID,void**);
	HRESULT IClassFactory_CreateInstance_Stub(IClassFactory*,REFIID,IUnknown**);
	HRESULT IClassFactory_LockServer_Proxy(IClassFactory*,BOOL);
	HRESULT IClassFactory_LockServer_Stub(IClassFactory*,BOOL);

	void IUnknown_QueryInterface_Stub(LPRPCSTUBBUFFER,LPRPCCHANNELBUFFER,PRPC_MESSAGE,PDWORD);
	void IUnknown_AddRef_Stub(LPRPCSTUBBUFFER,LPRPCCHANNELBUFFER,PRPC_MESSAGE,PDWORD);
	void IUnknown_Release_Stub(LPRPCSTUBBUFFER,LPRPCCHANNELBUFFER,PRPC_MESSAGE,PDWORD);
	void IClassFactory_RemoteCreateInstance_Stub(LPRPCSTUBBUFFER,LPRPCCHANNELBUFFER,PRPC_MESSAGE,PDWORD);
	void IClassFactory_RemoteLockServer_Stub(LPRPCSTUBBUFFER,LPRPCCHANNELBUFFER,PRPC_MESSAGE,PDWORD);
	+/
}

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
