// SubmitControl 1.0 Type Library
// Version 1.0

/*[uuid("66815b62-d2a5-41c4-9452-77da0d281e40")]*/
//module dwin.sys.win32.com.tlb.more.submitcontrol;
module dwin.sys.win32.com.tlb.more.SubmitControl;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// IAxSubmitControl Interface
interface IAxSubmitControl : IDispatch {
  mixin(uuid("d2c86b5c-2e5a-4ab3-8823-74be5bf06a46"));
  // static DWINGUID IID = { 0xd2c86b5c, 0x2e5a, 0x4ab3, 0x88, 0x23, 0x74, 0xbe, 0x5b, 0xf0, 0x6a, 0x46 };
  // method addPair
  /*[id(0x00000001)]*/ int addPair(wchar* name, wchar* value, out int pRet);
  // method reset
  /*[id(0x00000002)]*/ int reset();
  // method submit
  /*[id(0x00000003)]*/ int submit(IUnknown pForm, out int pRet);
}

// CoClasses

// AxSubmitControl Class
abstract class AxSubmitControl {
  mixin(uuid("8d9e0b29-563c-4226-86c1-5ff2ae77e1d2"));
  // static DWINGUID CLSID = { 0x8d9e0b29, 0x563c, 0x4226, 0x86, 0xc1, 0x5f, 0xf2, 0xae, 0x77, 0xe1, 0xd2 };
  mixin Interfaces!(IAxSubmitControl);
}
