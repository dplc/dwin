// ctv OLE Control module
// Version 1.0

/*[uuid("cd6c7865-5864-11d0-abf0-0020af6b0b7a")]*/
//module dwin.sys.win32.com.tlb.more.ctv;
module dwin.sys.win32.com.tlb.more.dmocx;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// Dispatch interface for CTreeView Control
interface _DTV : IDispatch {
  mixin(uuid("cd6c7866-5864-11d0-abf0-0020af6b0b7a"));
  // static DWINGUID IID = { 0xcd6c7866, 0x5864, 0x11d0, 0xab, 0xf0, 0x00, 0x20, 0xaf, 0x6b, 0x0b, 0x7a };
}

// Event interface for CTreeView Control
interface _DTVEvents : IDispatch {
  mixin(uuid("cd6c7867-5864-11d0-abf0-0020af6b0b7a"));
  // static DWINGUID IID = { 0xcd6c7867, 0x5864, 0x11d0, 0xab, 0xf0, 0x00, 0x20, 0xaf, 0x6b, 0x0b, 0x7a };
}

// CoClasses

// CTreeView Control
abstract class TV {
  mixin(uuid("cd6c7868-5864-11d0-abf0-0020af6b0b7a"));
  // static DWINGUID CLSID = { 0xcd6c7868, 0x5864, 0x11d0, 0xab, 0xf0, 0x00, 0x20, 0xaf, 0x6b, 0x0b, 0x7a };
  mixin Interfaces!(_DTV);
}
