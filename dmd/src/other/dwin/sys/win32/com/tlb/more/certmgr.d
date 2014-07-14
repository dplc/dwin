// CertMgr 1.0 Type Library
// Version 1.0

/*[uuid("53d6ab1c-2488-11d1-a28c-00c04fb94f17")]*/
module dwin.sys.win32.com.tlb.more.certmgr;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// ICertificateManager Interface
interface ICertificateManager : IUnknown {
  mixin(uuid("53d6ab1b-2488-11d1-a28c-00c04fb94f17"));
  // static DWINGUID IID = { 0x53d6ab1b, 0x2488, 0x11d1, 0xa2, 0x8c, 0x00, 0xc0, 0x4f, 0xb9, 0x4f, 0x17 };
}

// CoClasses

// CERTMGR Class
abstract class CertificateManager {
  mixin(uuid("53d6ab1d-2488-11d1-a28c-00c04fb94f17"));
  // static DWINGUID CLSID = { 0x53d6ab1d, 0x2488, 0x11d1, 0xa2, 0x8c, 0x00, 0xc0, 0x4f, 0xb9, 0x4f, 0x17 };
  mixin Interfaces!(ICertificateManager);
}

// CERTMGR About
abstract class CertificateManagerAbout {
  mixin(uuid("69a25c12-1811-11d2-a52b-0000f803a951"));
  // static DWINGUID CLSID = { 0x69a25c12, 0x1811, 0x11d2, 0xa5, 0x2b, 0x00, 0x00, 0xf8, 0x03, 0xa9, 0x51 };
  mixin Interfaces!(ICertificateManager);
}

// CERTMGR Public Key Policies About
abstract class PublicKeyPoliciesAbout {
  mixin(uuid("69a25c14-1811-11d2-a52b-0000f803a951"));
  // static DWINGUID CLSID = { 0x69a25c14, 0x1811, 0x11d2, 0xa5, 0x2b, 0x00, 0x00, 0xf8, 0x03, 0xa9, 0x51 };
  mixin Interfaces!(ICertificateManager);
}

// CERTMGR Safer Windows About
abstract class SaferWindowsAbout {
  mixin(uuid("280a7b65-8f00-438f-989b-8eaf9e438a71"));
  // static DWINGUID CLSID = { 0x280a7b65, 0x8f00, 0x438f, 0x98, 0x9b, 0x8e, 0xaf, 0x9e, 0x43, 0x8a, 0x71 };
  mixin Interfaces!(ICertificateManager);
}
