// TAPI3 Terminal Manager 1.0 Type Library
// Version 1.0

/*[uuid("28dcd85b-aca4-11d0-a028-00aa00b605a4")]*/
module dwin.sys.win32.com.tlb.more.termmgr;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum TERMINAL_DIRECTION {
  TD_CAPTURE = 0x00000000,
  TD_RENDER = 0x00000001,
  TD_BIDIRECTIONAL = 0x00000002,
  TD_MULTITRACK_MIXED = 0x00000003,
  TD_NONE = 0x00000004,
}

enum TERMINAL_STATE {
  TS_INUSE = 0x00000000,
  TS_NOTINUSE = 0x00000001,
}

enum TERMINAL_TYPE {
  TT_STATIC = 0x00000000,
  TT_DYNAMIC = 0x00000001,
}

enum __MIDL___MIDL_itf_termmgr_0000_0001 {
  TMGR_TD_CAPTURE = 0x00000001,
  TMGR_TD_RENDER = 0x00000002,
  TMGR_TD_BOTH = 0x00000003,
}

// Aliases

alias __MIDL___MIDL_itf_termmgr_0000_0001 TMGR_DIRECTION;

// Interfaces

// ITTerminalManager Interface
interface ITTerminalManager : IUnknown {
  mixin(uuid("7170f2de-9be3-11d0-a009-00aa00b605a4"));
  // static DWINGUID IID = { 0x7170f2de, 0x9be3, 0x11d0, 0xa0, 0x09, 0x00, 0xaa, 0x00, 0xb6, 0x05, 0xa4 };
  // method GetDynamicTerminalClasses
  /*[id(0x00000001)]*/ int GetDynamicTerminalClasses(uint dwMediaTypes, ref uint pdwNumClasses, out DWINGUID pTerminalClasses);
  // method CreateDynamicTerminal
  /*[id(0x00000002)]*/ int CreateDynamicTerminal(IUnknown pOuterUnknown, DWINGUID iidTerminalClass, uint dwMediaType, TERMINAL_DIRECTION Direction, int* htAddress, out ITTerminal ppTerminal);
}

// TAPI 3.0 ITTerminal interface
interface ITTerminal : IDispatch {
  mixin(uuid("b1efc38a-9355-11d0-835c-00aa003ccabd"));
  // static DWINGUID IID = { 0xb1efc38a, 0x9355, 0x11d0, 0x83, 0x5c, 0x00, 0xaa, 0x00, 0x3c, 0xca, 0xbd };
  // property Name
  /*[id(0x00000001)]*/ int get_Name(out wchar* ppName);
  // property State
  /*[id(0x00000002)]*/ int get_State(out TERMINAL_STATE pTerminalState);
  // property TerminalType
  /*[id(0x00000003)]*/ int get_TerminalType(out TERMINAL_TYPE pType);
  // property TerminalClass
  /*[id(0x00000004)]*/ int get_TerminalClass(out wchar* ppTerminalClass);
  // property MediaType
  /*[id(0x00000005)]*/ int get_MediaType(out int plMediaType);
  // property Direction
  /*[id(0x00000006)]*/ int get_Direction(out TERMINAL_DIRECTION pDirection);
}

// ITPluggableTerminalSuperclassRegistration Interface
interface ITPluggableTerminalSuperclassRegistration : IDispatch {
  mixin(uuid("60d3c08a-c13e-4195-9ab0-8de768090f25"));
  // static DWINGUID IID = { 0x60d3c08a, 0xc13e, 0x4195, 0x9a, 0xb0, 0x8d, 0xe7, 0x68, 0x09, 0x0f, 0x25 };
  // property Name
  /*[id(0x00000001)]*/ int get_Name(out wchar* pName);
  // property Name
  /*[id(0x00000001)]*/ int set_Name(wchar* pName);
  // property CLSID
  /*[id(0x00000002)]*/ int get_CLSID(out wchar* pCLSID);
  // property CLSID
  /*[id(0x00000002)]*/ int set_CLSID(wchar* pCLSID);
  // method Add
  /*[id(0x00000003)]*/ int Add();
  // method Delete
  /*[id(0x00000004)]*/ int Delete();
  // method GetTerminalSuperclassInfo
  /*[id(0x00000005)]*/ int GetTerminalSuperclassInfo();
  // method TerminalClasses
  /*[id(0x00000006)]*/ int get_TerminalClasses(out DWINVARIANT pTerminals);
  // method EnumerateTerminalClasses
  /*[id(0x00000007)]*/ int EnumerateTerminalClasses(out IEnumTerminalClass ppTerminals);
}

// TAPI 3.0 IEnumTerminalClass interface
interface IEnumTerminalClass : IUnknown {
  mixin(uuid("ae269cf5-935e-11d0-835c-00aa003ccabd"));
  // static DWINGUID IID = { 0xae269cf5, 0x935e, 0x11d0, 0x83, 0x5c, 0x00, 0xaa, 0x00, 0x3c, 0xca, 0xbd };
  /*[id(0x60010000)]*/ int Next(uint celt, out DWINGUID pElements, ref uint pceltFetched);
  /*[id(0x60010001)]*/ int Reset();
  /*[id(0x60010002)]*/ int Skip(uint celt);
  /*[id(0x60010003)]*/ int Clone(out IEnumTerminalClass ppEnum);
}

// ITPluggableTerminalClassRegistration Interface
interface ITPluggableTerminalClassRegistration : IDispatch {
  mixin(uuid("924a3723-a00b-4f5f-9fee-8e9aeb9e82aa"));
  // static DWINGUID IID = { 0x924a3723, 0xa00b, 0x4f5f, 0x9f, 0xee, 0x8e, 0x9a, 0xeb, 0x9e, 0x82, 0xaa };
  // property Name
  /*[id(0x00000001)]*/ int get_Name(out wchar* pName);
  // property Name
  /*[id(0x00000001)]*/ int set_Name(wchar* pName);
  // property Company
  /*[id(0x00000002)]*/ int get_Company(out wchar* pCompany);
  // property Company
  /*[id(0x00000002)]*/ int set_Company(wchar* pCompany);
  // property Version
  /*[id(0x00000003)]*/ int get_Version(out wchar* pVersion);
  // property Version
  /*[id(0x00000003)]*/ int set_Version(wchar* pVersion);
  // property TerminalClass
  /*[id(0x00000004)]*/ int get_TerminalClass(out wchar* pTerminalClass);
  // property TerminalClass
  /*[id(0x00000004)]*/ int set_TerminalClass(wchar* pTerminalClass);
  // property CLSID
  /*[id(0x00000005)]*/ int get_CLSID(out wchar* pCLSID);
  // property CLSID
  /*[id(0x00000005)]*/ int set_CLSID(wchar* pCLSID);
  // property Direction
  /*[id(0x00000006)]*/ int get_Direction(out TMGR_DIRECTION pDirection);
  // property Direction
  /*[id(0x00000006)]*/ int set_Direction(TMGR_DIRECTION pDirection);
  // property MediaTypes
  /*[id(0x00000007)]*/ int get_MediaTypes(out int pMediaTypes);
  // property MediaTypes
  /*[id(0x00000007)]*/ int set_MediaTypes(int pMediaTypes);
  // method Add
  /*[id(0x00000008)]*/ int Add(wchar* bstrSuperclass);
  // method Delete
  /*[id(0x00000009)]*/ int Delete(wchar* bstrSuperclass);
  // method GetTerminalClassInfo
  /*[id(0x0000000A)]*/ int GetTerminalClassInfo(wchar* bstrSuperclass);
}

// CoClasses

// TAPI 3.0 TerminalManager Class
abstract class TerminalManager {
  mixin(uuid("7170f2e0-9be3-11d0-a009-00aa00b605a4"));
  // static DWINGUID CLSID = { 0x7170f2e0, 0x9be3, 0x11d0, 0xa0, 0x09, 0x00, 0xaa, 0x00, 0xb6, 0x05, 0xa4 };
  mixin Interfaces!(ITTerminalManager);
}

// PluggableTerminalSuperclass Class
abstract class PluggableSuperclassRegistration {
  mixin(uuid("bb918e32-2a5c-4986-ab40-1686a034390a"));
  // static DWINGUID CLSID = { 0xbb918e32, 0x2a5c, 0x4986, 0xab, 0x40, 0x16, 0x86, 0xa0, 0x34, 0x39, 0x0a };
  mixin Interfaces!(ITPluggableTerminalSuperclassRegistration);
}

// PluggableTerminalClass Class
abstract class PluggableTerminalRegistration {
  mixin(uuid("45234e3e-61cc-4311-a3ab-248082554482"));
  // static DWINGUID CLSID = { 0x45234e3e, 0x61cc, 0x4311, 0xa3, 0xab, 0x24, 0x80, 0x82, 0x55, 0x44, 0x82 };
  mixin Interfaces!(ITPluggableTerminalClassRegistration);
}
