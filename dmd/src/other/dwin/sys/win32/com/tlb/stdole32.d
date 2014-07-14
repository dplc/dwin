// OLE Automation
// Version 1.0

/*[uuid("00020430-0000-0000-c000-000000000046")]*/
//module dwin.sys.win32.com.tlb.stdole;
module dwin.sys.win32.com.tlb.stdole32;

//private import dwin.sys.win32.com.Core;

// Structs
/*
struct DWINGUID {
  uint Data1;
  ushort Data2;
  ushort Data3;
  ubyte[8] Data4;
}
*/
/*
struct DISPPARAMS {
  DWINVARIANT* rgvarg;
  int* rgdispidNamedArgs;
  uint cArgs;
  uint cNamedArgs;
}
*/
/*
struct EXCEPINFO {
  ushort wCode;
  ushort wReserved;
  wchar* bstrSource;
  wchar* bstrDescription;
  wchar* bstrHelpFile;
  uint dwHelpContext;
  void* pvReserved;
  void* pfnDeferredFillIn;
  int scode;
}
*/

// Interfaces
/+
interface IUnknown {
  mixin(uuid("00000000-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00000000, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60000000)]*/ int QueryInterface(ref DWINGUID riid, void *ppvObj);
  /*[id(0x60000001)]*/ uint AddRef();
  /*[id(0x60000002)]*/ uint Release();
}
+/

/+
interface IDispatch : IUnknown {
  mixin(uuid("00020400-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00020400, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int GetTypeInfoCount(out uint pctinfo);
  /*[id(0x60010001)]*/ int GetTypeInfo(uint itinfo, uint lcid, void *pptinfo);
  /*[id(0x60010002)]*/ int GetIDsOfNames(ref DWINGUID riid, byte** rgszNames, uint cNames, uint lcid, out int rgdispid);
  /*[id(0x60010003)]*/ int Invoke(int dispidMember, ref DWINGUID riid, uint lcid, ushort wFlags, DISPPARAMS* pdispparams, out DWINVARIANT pvarResult, out EXCEPINFO pexcepinfo, out uint puArgErr);
}
+/
/+
interface IEnumVARIANT : IUnknown {
  mixin(uuid("00020404-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00020404, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int Next(uint celt, DWINVARIANT* rgvar, out uint pceltFetched);
  /*[id(0x60010001)]*/ int Skip(uint celt);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IEnumVARIANT ppenum);
}
+/
