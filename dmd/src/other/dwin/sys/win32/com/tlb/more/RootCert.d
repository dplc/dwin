// RootCert 1.0 Type Library
// Version 1.0

/*[uuid("23c57dc9-9fbd-46f2-b0a3-7679bf9ef60b")]*/
module dwin.sys.win32.com.tlb.more.RootCert;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// IRootCertInstall Interface
interface IRootCertInstall : IDispatch {
  mixin(uuid("558af364-ee43-41a8-ab88-ac1bb7270e71"));
  // static DWINGUID IID = { 0x558af364, 0xee43, 0x41a8, 0xab, 0x88, 0xac, 0x1b, 0xb7, 0x27, 0x0e, 0x71 };
  // method AddCerts
  /*[id(0x00000001)]*/ int AddCerts();
}

// CoClasses

// RootCertInstall Class
abstract class RootCertInstall {
  mixin(uuid("d1056c7c-e30b-4234-9a4b-7e1038b167a7"));
  // static DWINGUID CLSID = { 0xd1056c7c, 0xe30b, 0x4234, 0x9a, 0x4b, 0x7e, 0x10, 0x38, 0xb1, 0x67, 0xa7 };
  mixin Interfaces!(IRootCertInstall);
}
