// Version 1.2

/*[uuid("244d13bd-afdb-11ce-85d1-00aa00695286")]*/
module dwin.sys.win32.com.tlb.more.RACREG32;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Aliases

alias _RegClass RegClass___v0;

alias _RegClass RegClass___v1;

// Interfaces

// This class can be used to set or read information that determines if a given CLSID is a local or remote automation server.
interface _RegClass : IDispatch {
  mixin(uuid("4bb35a55-a91a-11cf-ba7c-00a0d1001a5a"));
  // static DWINGUID IID = { 0x4bb35a55, 0xa91a, 0x11cf, 0xba, 0x7c, 0x00, 0xa0, 0xd1, 0x00, 0x1a, 0x5a };
  /*[id(0x60030024)]*/ int SetNetOLEServerSettings(short Remote, DWINVARIANT ProgID, DWINVARIANT CLSID, DWINVARIANT ServerName, out short value);
  /*[id(0x60030028)]*/ int SetDCOMServerSettings(short Remote, DWINVARIANT ProgID, DWINVARIANT CLSID, DWINVARIANT ServerName, out short value);
  /*[id(0x6003001C)]*/ int SetAutoServerSettings(short Remote, DWINVARIANT ProgID, DWINVARIANT CLSID, DWINVARIANT ServerName, DWINVARIANT Protocol, DWINVARIANT Authentication, out short value);
  /*[id(0x60030020)]*/ int GetAutoServerSettings(DWINVARIANT ProgID, DWINVARIANT CLSID, out DWINVARIANT value);
}

// CoClasses

// This class can be used to set or read information that determines if a given CLSID is a local or remote automation server.
abstract class RegClass {
  mixin(uuid("244d13bc-afdb-11ce-85d1-00aa00695286"));
  // static DWINGUID CLSID = { 0x244d13bc, 0xafdb, 0x11ce, 0x85, 0xd1, 0x00, 0xaa, 0x00, 0x69, 0x52, 0x86 };
  mixin Interfaces!(_RegClass);
}
