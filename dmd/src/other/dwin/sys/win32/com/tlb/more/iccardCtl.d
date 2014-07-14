// iccardCtl 1.0 Type Library
// Version 1.0

/*[uuid("cba1a6ec-fbbb-4d76-9db5-f2fa7dd22eee")]*/
//module dwin.sys.win32.com.tlb.more.iccardctl;
module dwin.sys.win32.com.tlb.more.iccardCtl;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// Icardctl Interface
interface Icardctl : IDispatch {
  mixin(uuid("f4481c6f-a7a8-407e-a4fe-66b7e71da351"));
  // static DWINGUID IID = { 0xf4481c6f, 0xa7a8, 0x407e, 0xa4, 0xfe, 0x66, 0xb7, 0xe7, 0x1d, 0xa3, 0x51 };
  // property errorNo
  /*[id(0x00000001)]*/ int get_errorNo(out int pVal);
  // property ProviderName
  /*[id(0x00000002)]*/ int set_ProviderName(wchar* value);
  // method changepin
  /*[id(0x00000003)]*/ int changepin(wchar* oldPin, wchar* newPin, int cardType);
}

// CoClasses

// cardctl Class
abstract class cardctl {
  mixin(uuid("b753331a-9543-41d2-83b2-492e5adb7911"));
  // static DWINGUID CLSID = { 0xb753331a, 0x9543, 0x41d2, 0x83, 0xb2, 0x49, 0x2e, 0x5a, 0xdb, 0x79, 0x11 };
  mixin Interfaces!(Icardctl);
}
