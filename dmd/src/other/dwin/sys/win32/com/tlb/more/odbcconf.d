// Microsoft Data Access Components Installed Version
// Version 2.50

/*[uuid("54af9343-1923-11d3-9ca4-00c04f72c514")]*/
//module dwin.sys.win32.com.tlb.more.mdacver;
module dwin.sys.win32.com.tlb.more.odbcconf;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// IVersion Interface
interface IVersion : IDispatch {
  mixin(uuid("54af934f-1923-11d3-9ca4-00c04f72c514"));
  // static DWINGUID IID = { 0x54af934f, 0x1923, 0x11d3, 0x9c, 0xa4, 0x00, 0xc0, 0x4f, 0x72, 0xc5, 0x14 };
  /*[id(0x00000001)]*/ int get_Major(out DWINVARIANT uValue);
  /*[id(0x00000002)]*/ int get_Minor(out DWINVARIANT uValue);
  /*[id(0x00000003)]*/ int get_Build(out DWINVARIANT uValue);
  /*[id(0x00000004)]*/ int get_Qfe(out DWINVARIANT uValue);
  /*[id(0x00000005)]*/ int get_String(out DWINVARIANT bstrValue);
}

// CoClasses

// Version Class
abstract class Version {
  mixin(uuid("54af9350-1923-11d3-9ca4-00c04f72c514"));
  // static DWINGUID CLSID = { 0x54af9350, 0x1923, 0x11d3, 0x9c, 0xa4, 0x00, 0xc0, 0x4f, 0x72, 0xc5, 0x14 };
  mixin Interfaces!(IVersion);
}
