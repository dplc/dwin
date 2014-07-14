// igfxdev 1.0 Type Library
// Version 1.0

/*[uuid("bb74af42-dc70-11d2-b561-00a0c92e6848")]*/
module dwin.sys.win32.com.tlb.more.igfxdev;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Structs

struct __MIDL___MIDL_itf_igfxdev_0209_0001 {
  DWINGUID* bGuid;
  byte Get_Supported;
  byte Set_Supported;
  byte AsyncGet_Supported;
  byte AsyncSet_Supported;
}

// Aliases

alias __MIDL___MIDL_itf_igfxdev_0209_0001 ENUM_GUID;

// Interfaces

// ICUIDriver Interface
interface ICUIDriver : IUnknown {
  mixin(uuid("bb74af4f-dc70-11d2-b561-00a0c92e6848"));
  // static DWINGUID IID = { 0xbb74af4f, 0xdc70, 0x11d2, 0xb5, 0x61, 0x00, 0xa0, 0xc9, 0x2e, 0x68, 0x48 };
  // method GetDeviceData
  /*[id(0x60010000)]*/ int GetDeviceData(ref DWINGUID guid, int cb, ref ubyte lpData);
  // method PutDeviceData
  /*[id(0x60010001)]*/ int PutDeviceData(ref DWINGUID guid, int cb, ref ubyte lpData);
  // method EnumGuids
  /*[id(0x60010002)]*/ int EnumGuids(out IEnumSupportedGuids ppEnum);
}

// IEnumSupportedGuids Interface
interface IEnumSupportedGuids : IUnknown {
  mixin(uuid("26a92ba1-dd0d-11d2-b561-00a0c92e6848"));
  // static DWINGUID IID = { 0x26a92ba1, 0xdd0d, 0x11d2, 0xb5, 0x61, 0x00, 0xa0, 0xc9, 0x2e, 0x68, 0x48 };
  // Get next celt Supported guid elements
  /*[id(0x60010000)]*/ int Next(uint celt, out ENUM_GUID ppguid, out uint pCeltFetched);
  // Skip next celt Supported guid elements
  /*[id(0x60010001)]*/ int Skip(uint celt);
  // Reset the enumerator
  /*[id(0x60010002)]*/ int Reset();
  // Make a copy of the enumerator
  /*[id(0x60010003)]*/ int Clone(out IEnumSupportedGuids ppEnum);
}

// CoClasses

// CUIDriver Class
abstract class CUIDriver {
  mixin(uuid("9cee304e-dc6c-11d2-b561-00a0c92e6848"));
  // static DWINGUID CLSID = { 0x9cee304e, 0xdc6c, 0x11d2, 0xb5, 0x61, 0x00, 0xa0, 0xc9, 0x2e, 0x68, 0x48 };
  mixin Interfaces!(ICUIDriver);
}
