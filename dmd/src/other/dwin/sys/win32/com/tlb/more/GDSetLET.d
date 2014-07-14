// GDSetLET 1.0 Type Library
// Version 1.0

/*[uuid("9aeaaa4d-e6db-473d-a3c2-8de0732a5565")]*/
module dwin.sys.win32.com.tlb.more.GDSetLET;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// ICSetLET Interface
interface ICSetLET : IDispatch {
  mixin(uuid("76b223f9-0e66-492d-a9e6-47dca07ac59c"));
  // static DWINGUID IID = { 0x76b223f9, 0x0e66, 0x492d, 0xa9, 0xe6, 0x47, 0xdc, 0xa0, 0x7a, 0xc5, 0x9c };
  // property SetResult
  /*[id(0x00000001)]*/ int get_SetResult(out int pVal);
  // property RestoreResult
  /*[id(0x00000002)]*/ int get_RestoreResult(out int pVal);
}

// CoClasses

// CSetLET Class
abstract class CSetLET {
  mixin(uuid("c35d7ae1-0865-4a30-bf07-29fa29324155"));
  // static DWINGUID CLSID = { 0xc35d7ae1, 0x0865, 0x4a30, 0xbf, 0x07, 0x29, 0xfa, 0x29, 0x32, 0x41, 0x55 };
  mixin Interfaces!(ICSetLET);
}
