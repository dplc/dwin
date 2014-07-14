// CMProps 1.0 Type Library
// Version 1.0

/*[uuid("a1b9e012-3226-11d2-883e-00104b2afb46")]*/
module dwin.sys.win32.com.tlb.more.cmprops;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// CoClasses

// CMSnapin Class
abstract class CMSnapin {
  mixin(uuid("0f3621f1-23c6-11d1-ad97-00aa00b88e5a"));
  // static DWINGUID CLSID = { 0x0f3621f1, 0x23c6, 0x11d1, 0xad, 0x97, 0x00, 0xaa, 0x00, 0xb8, 0x8e, 0x5a };
  mixin Interfaces!(IUnknown);
}

// CMSnapin Class About
abstract class CMSnapinAbout {
  mixin(uuid("a1b9e020-3226-11d2-883e-00104b2afb46"));
  // static DWINGUID CLSID = { 0xa1b9e020, 0x3226, 0x11d2, 0x88, 0x3e, 0x00, 0x10, 0x4b, 0x2a, 0xfb, 0x46 };
  mixin Interfaces!(IUnknown);
}
