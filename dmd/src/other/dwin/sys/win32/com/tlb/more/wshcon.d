// Version 1.0

/*[uuid("563dc060-b09a-11d2-a24d-00104bd35090")]*/
//module dwin.sys.win32.com.tlb.more.wshcontrollerlibrary;
module dwin.sys.win32.com.tlb.more.wshcon;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

interface IWSHController : IDispatch {
  mixin(uuid("563dc061-b09a-11d2-a24d-00104bd35090"));
  // static DWINGUID IID = { 0x563dc061, 0xb09a, 0x11d2, 0xa2, 0x4d, 0x00, 0x10, 0x4b, 0xd3, 0x50, 0x90 };
  /*[id(0x00000001)]*/ int CreateScript(wchar* Command, DWINVARIANT Server, out IDispatch ppdisp);
}

// CoClasses

abstract class WSHController {
  mixin(uuid("563dc062-b09a-11d2-a24d-00104bd35090"));
  // static DWINGUID CLSID = { 0x563dc062, 0xb09a, 0x11d2, 0xa2, 0x4d, 0x00, 0x10, 0x4b, 0xd3, 0x50, 0x90 };
  mixin Interfaces!(IWSHController);
}
