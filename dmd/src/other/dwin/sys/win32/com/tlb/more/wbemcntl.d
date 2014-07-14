// WMICntl 1.0 Type Library
// Version 1.0

/*[uuid("5c65924b-e236-11d2-8899-00104b2afb46")]*/
//module dwin.sys.win32.com.tlb.more.wmicntl;
module dwin.sys.win32.com.tlb.more.wbemcntl;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// CoClasses

// WMISnapin Class
abstract class WMISnapin {
  mixin(uuid("5c659257-e236-11d2-8899-00104b2afb46"));
  // static DWINGUID CLSID = { 0x5c659257, 0xe236, 0x11d2, 0x88, 0x99, 0x00, 0x10, 0x4b, 0x2a, 0xfb, 0x46 };
  mixin Interfaces!(IUnknown);
}

// WMISnapin Class About
abstract class WMISnapinAbout {
  mixin(uuid("5c659258-e236-11d2-8899-00104b2afb46"));
  // static DWINGUID CLSID = { 0x5c659258, 0xe236, 0x11d2, 0x88, 0x99, 0x00, 0x10, 0x4b, 0x2a, 0xfb, 0x46 };
  mixin Interfaces!(IUnknown);
}
