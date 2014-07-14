// ServDeps 1.0 Type Library
// Version 1.0

/*[uuid("a1b9e03c-3226-11d2-883e-00104b2afb46")]*/
module dwin.sys.win32.com.tlb.more.servdeps;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// CoClasses

// SDSnapin Class
abstract class SDSnapin {
  mixin(uuid("bd95ba60-2e26-aad1-ad99-00aa00b8e05a"));
  // static DWINGUID CLSID = { 0xbd95ba60, 0x2e26, 0xaad1, 0xad, 0x99, 0x00, 0xaa, 0x00, 0xb8, 0xe0, 0x5a };
  mixin Interfaces!(IUnknown);
}

// SDSnapin Class About
abstract class SDSnapinAbout {
  mixin(uuid("a1b9e04a-3226-11d2-883e-00104b2afb46"));
  // static DWINGUID CLSID = { 0xa1b9e04a, 0x3226, 0x11d2, 0x88, 0x3e, 0x00, 0x10, 0x4b, 0x2a, 0xfb, 0x46 };
  mixin Interfaces!(IUnknown);
}
