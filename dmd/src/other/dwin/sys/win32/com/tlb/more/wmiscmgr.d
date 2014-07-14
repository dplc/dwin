// SchemaManager 1.0 Type Library
// Version 1.0

/*[uuid("1856ad2e-6f53-4ea2-b76d-b6d7fa07c391")]*/
//module dwin.sys.win32.com.tlb.more.schemamanager;
module dwin.sys.win32.com.tlb.more.wmiscmgr;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Unions

union __MIDL_IWinTypes_0009 {
  int hInproc;
  int hRemote;
}

// Structs

struct _RemotableHandle {
  int fContext;
  __MIDL_IWinTypes_0009 u;
}

// Aliases

alias _RemotableHandle* wireHWND;

// Interfaces

// IWMIFilterManager Interface
interface IWMIFilterManager : IDispatch {
  mixin(uuid("64dcca00-14a6-473c-9006-5ab79dc68491"));
  // static DWINGUID IID = { 0x64dcca00, 0x14a6, 0x473c, 0x90, 0x06, 0x5a, 0xb7, 0x9d, 0xc6, 0x84, 0x91 };
  // method RunManager
  /*[id(0x00000001)]*/ int RunManager(wireHWND hwndParent, wchar* bstrDomain, out DWINVARIANT vSelection);
  // method SetMultiSelection
  /*[id(0x00000002)]*/ int SetMultiSelection(short vbValue);
  // method RunBrowser
  /*[id(0x00000003)]*/ int RunBrowser(wireHWND hwndParent, wchar* bstrDomain, out DWINVARIANT vSelection);
}

// CoClasses

// WMIFilterManager Class
abstract class WMIFilterManager {
  mixin(uuid("d86a8e9b-f53f-45ad-8c49-0a0a5230de28"));
  // static DWINGUID CLSID = { 0xd86a8e9b, 0xf53f, 0x45ad, 0x8c, 0x49, 0x0a, 0x0a, 0x52, 0x30, 0xde, 0x28 };
  mixin Interfaces!(IWMIFilterManager);
}
