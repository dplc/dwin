// ScriptPW 1.0 Type Library
// Version 1.0

/*[uuid("6e3ec78a-6ce7-4298-815b-21bef4967112")]*/
module dwin.sys.win32.com.tlb.more.scriptpw;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// IPassword Interface
interface IPassword : IDispatch {
  mixin(uuid("3d3664fb-a3fb-41f3-9d54-7f99d2ff152f"));
  // static DWINGUID IID = { 0x3d3664fb, 0xa3fb, 0x41f3, 0x9d, 0x54, 0x7f, 0x99, 0xd2, 0xff, 0x15, 0x2f };
  // method GetPassword
  /*[id(0x00000001)]*/ int GetPassword(out wchar* bstrOutPassword);
}

// CoClasses

// Password Class
abstract class Password {
  mixin(uuid("834c5a62-e0bb-4fb4-87b9-f37c869c976b"));
  // static DWINGUID CLSID = { 0x834c5a62, 0xe0bb, 0x4fb4, 0x87, 0xb9, 0xf3, 0x7c, 0x86, 0x9c, 0x97, 0x6b };
  mixin Interfaces!(IPassword);
}
