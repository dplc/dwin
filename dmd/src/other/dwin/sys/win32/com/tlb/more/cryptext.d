// cryptext 1.0 Type Library
// Version 1.0

/*[uuid("7444c709-39bf-11d1-8cd9-00c04fc29d45")]*/
module dwin.sys.win32.com.tlb.more.cryptext;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// ICryptPKO Interface
interface ICryptPKO : IUnknown {
  mixin(uuid("7444c716-39bf-11d1-8cd9-00c04fc29d45"));
  // static DWINGUID IID = { 0x7444c716, 0x39bf, 0x11d1, 0x8c, 0xd9, 0x00, 0xc0, 0x4f, 0xc2, 0x9d, 0x45 };
}

// ICryptSig Interface
interface ICryptSig : IUnknown {
  mixin(uuid("7444c718-39bf-11d1-8cd9-00c04fc29d45"));
  // static DWINGUID IID = { 0x7444c718, 0x39bf, 0x11d1, 0x8c, 0xd9, 0x00, 0xc0, 0x4f, 0xc2, 0x9d, 0x45 };
}

// CoClasses

// CryptPKO Class
abstract class CryptPKO {
  mixin(uuid("7444c717-39bf-11d1-8cd9-00c04fc29d45"));
  // static DWINGUID CLSID = { 0x7444c717, 0x39bf, 0x11d1, 0x8c, 0xd9, 0x00, 0xc0, 0x4f, 0xc2, 0x9d, 0x45 };
  mixin Interfaces!(ICryptPKO);
}

// CryptSig Class
abstract class CryptSig {
  mixin(uuid("7444c719-39bf-11d1-8cd9-00c04fc29d45"));
  // static DWINGUID CLSID = { 0x7444c719, 0x39bf, 0x11d1, 0x8c, 0xd9, 0x00, 0xc0, 0x4f, 0xc2, 0x9d, 0x45 };
  mixin Interfaces!(ICryptSig);
}
