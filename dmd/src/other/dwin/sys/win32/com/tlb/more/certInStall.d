// certInStall 1.0 Type Library
// Version 1.0

/*[uuid("320e45ec-a839-4528-8179-fd1b8ba035cb")]*/
//module dwin.sys.win32.com.tlb.more.certinstall;
module dwin.sys.win32.com.tlb.more.certInStall;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// _IInfosecCertInstallEvents Interface
interface _IInfosecCertInstallEvents : IDispatch {
  mixin(uuid("1697dd42-6b31-4e18-93ae-be77435c2990"));
  // static DWINGUID IID = { 0x1697dd42, 0x6b31, 0x4e18, 0x93, 0xae, 0xbe, 0x77, 0x43, 0x5c, 0x29, 0x90 };
}

// IInfosecCertInstall Interface
interface IInfosecCertInstall : IDispatch {
  mixin(uuid("ff6c5c6d-92cc-4578-83d9-a8587bda042a"));
  // static DWINGUID IID = { 0xff6c5c6d, 0x92cc, 0x4578, 0x83, 0xd9, 0xa8, 0x58, 0x7b, 0xda, 0x04, 0x2a };
  // method certImport
  /*[id(0x00000001)]*/ int RegCert(wchar* certificate);
}

// CoClasses

// InfosecCertInstall Class
abstract class InfosecCertInstall {
  mixin(uuid("0eb487c8-e9ac-43a6-8c4c-083999b0622f"));
  // static DWINGUID CLSID = { 0x0eb487c8, 0xe9ac, 0x43a6, 0x8c, 0x4c, 0x08, 0x39, 0x99, 0xb0, 0x62, 0x2f };
  mixin Interfaces!(IInfosecCertInstall);
}
