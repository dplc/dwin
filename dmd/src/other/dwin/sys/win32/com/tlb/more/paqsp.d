// PAQSP 1.0 Type Library
// Version 1.0

/*[uuid("d9a76957-f669-4fcc-b1c2-a4635d520235")]*/
module dwin.sys.win32.com.tlb.more.paqsp;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// CoClasses

// PaqServiceProvider Class
abstract class PaqServiceProvider {
  mixin(uuid("82de2263-538e-497c-8040-a0d372b8bf7d"));
  // static DWINGUID CLSID = { 0x82de2263, 0x538e, 0x497c, 0x80, 0x40, 0xa0, 0xd3, 0x72, 0xb8, 0xbf, 0x7d };
  mixin Interfaces!(IUnknown);
}

// PaqSPEnumDevice Class
abstract class PaqSPEnumDevice {
  mixin(uuid("bab04a31-aa2b-4d3f-a459-05e86c0ddb46"));
  // static DWINGUID CLSID = { 0xbab04a31, 0xaa2b, 0x4d3f, 0xa4, 0x59, 0x05, 0xe8, 0x6c, 0x0d, 0xdb, 0x46 };
  mixin Interfaces!(IUnknown);
}

// PaqSPEnumStorage Class
abstract class PaqSPEnumStorage {
  mixin(uuid("f3fbc6ac-90b2-4422-8ffe-f28ebee78367"));
  // static DWINGUID CLSID = { 0xf3fbc6ac, 0x90b2, 0x4422, 0x8f, 0xfe, 0xf2, 0x8e, 0xbe, 0xe7, 0x83, 0x67 };
  mixin Interfaces!(IUnknown);
}

// PaqSPDevice Class
abstract class PaqSPDevice {
  mixin(uuid("b13951ed-1677-4cde-9c14-9b4e25cec807"));
  // static DWINGUID CLSID = { 0xb13951ed, 0x1677, 0x4cde, 0x9c, 0x14, 0x9b, 0x4e, 0x25, 0xce, 0xc8, 0x07 };
  mixin Interfaces!(IUnknown);
}

// PaqSPStorage Class
abstract class PaqSPStorage {
  mixin(uuid("dd1bf608-aea9-4c13-a8da-a0dee2d8204f"));
  // static DWINGUID CLSID = { 0xdd1bf608, 0xaea9, 0x4c13, 0xa8, 0xda, 0xa0, 0xde, 0xe2, 0xd8, 0x20, 0x4f };
  mixin Interfaces!(IUnknown);
}

// PaqSPStorageGlobals Class
abstract class PaqSPStorageGlobals {
  mixin(uuid("5996ac10-a00d-4b0b-93da-683cb01f4731"));
  // static DWINGUID CLSID = { 0x5996ac10, 0xa00d, 0x4b0b, 0x93, 0xda, 0x68, 0x3c, 0xb0, 0x1f, 0x47, 0x31 };
  mixin Interfaces!(IUnknown);
}

// PropPage Class
abstract class PaqSPPropPage {
  mixin(uuid("302db687-0bd7-489a-9964-5a59877718fe"));
  // static DWINGUID CLSID = { 0x302db687, 0x0bd7, 0x489a, 0x99, 0x64, 0x5a, 0x59, 0x87, 0x77, 0x18, 0xfe };
  mixin Interfaces!(IUnknown);
}
