// MyComput 1.0 Type Library
// Version 1.0

/*[uuid("3bfc964d-7a55-11d0-b928-00c04fd8d5b0")]*/
module dwin.sys.win32.com.tlb.more.mycomput;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// IMyComputer Interface
interface IMyComputer : IUnknown {
  mixin(uuid("58221c68-ea27-11cf-adcf-00aa00a80033"));
  // static DWINGUID IID = { 0x58221c68, 0xea27, 0x11cf, 0xad, 0xcf, 0x00, 0xaa, 0x00, 0xa8, 0x00, 0x33 };
}

// CoClasses

// MYCOMPUT Class
abstract class MyComputer {
  mixin(uuid("58221c67-ea27-11cf-adcf-00aa00a80033"));
  // static DWINGUID CLSID = { 0x58221c67, 0xea27, 0x11cf, 0xad, 0xcf, 0x00, 0xaa, 0x00, 0xa8, 0x00, 0x33 };
  mixin Interfaces!(IMyComputer);
}

// MYCOMPUT About
abstract class ComputerManagementAbout {
  mixin(uuid("11d5c91f-0a98-11d1-bb10-00c04fc9a3a3"));
  // static DWINGUID CLSID = { 0x11d5c91f, 0x0a98, 0x11d1, 0xbb, 0x10, 0x00, 0xc0, 0x4f, 0xc9, 0xa3, 0xa3 };
  mixin Interfaces!(IMyComputer);
}
