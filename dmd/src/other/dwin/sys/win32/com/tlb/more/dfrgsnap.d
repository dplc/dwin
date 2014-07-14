// DfrgSnap 1.0 Type Library
// Version 1.0

/*[uuid("cd83a785-6f75-11d2-a385-00609772642e")]*/
module dwin.sys.win32.com.tlb.more.dfrgsnap;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// CoClasses

// DfrgSnapin Class
abstract class DfrgSnapin {
  mixin(uuid("43668e21-2636-11d1-a1ce-0080c88593a5"));
  // static DWINGUID CLSID = { 0x43668e21, 0x2636, 0x11d1, 0xa1, 0xce, 0x00, 0x80, 0xc8, 0x85, 0x93, 0xa5 };
  mixin Interfaces!(IUnknown);
}

// DfrgSnapin Class About
abstract class DfrgSnapinAbout {
  mixin(uuid("b5c45061-2729-11d1-a1d7-0080c88593a5"));
  // static DWINGUID CLSID = { 0xb5c45061, 0x2729, 0x11d1, 0xa1, 0xd7, 0x00, 0x80, 0xc8, 0x85, 0x93, 0xa5 };
  mixin Interfaces!(IUnknown);
}
