// COLBCAT 1.0 Type Library
// Version 1.0

/*[uuid("8c758293-9351-11d1-9d1a-006008b0e5ca")]*/
//module dwin.sys.win32.com.tlb.more.colbcat;
module dwin.sys.win32.com.tlb.more.clbcatex;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Structs

struct __MIDL___MIDL_itf_colbcat_0000_0001 {
 DWINGUID clsid;
 DWINGUID lbClsid;
  uint cServers;
  wchar** szServers;
  int fEnabled;
}

// Aliases

alias __MIDL___MIDL_itf_colbcat_0000_0001 ClassLBData;

// Interfaces

// ICOM98RouterCatalog Interface
interface ICOM98RouterCatalog : IUnknown {
  mixin(uuid("8c758291-9351-11d1-9d1a-006008b0e5ca"));
  // static DWINGUID IID = { 0x8c758291, 0x9351, 0x11d1, 0x9d, 0x1a, 0x00, 0x60, 0x08, 0xb0, 0xe5, 0xca };
  // method GetServerGroupComponents 
  /*[id(0x60010000)]*/ int GetServerGroupComponents(out uint o_pcClasses, out ClassLBData o_pplbData);
}

// CoClasses

// COM98RuntimeCatalog Class
abstract class COLBCatalog {
  mixin(uuid("8c758294-9351-11d1-9d1a-006008b0e5ca"));
  // static DWINGUID CLSID = { 0x8c758294, 0x9351, 0x11d1, 0x9d, 0x1a, 0x00, 0x60, 0x08, 0xb0, 0xe5, 0xca };
  mixin Interfaces!(ICOM98RouterCatalog);
}
