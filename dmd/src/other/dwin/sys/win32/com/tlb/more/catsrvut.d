// ComExp 1.0 Type Library
// Version 1.0

/*[uuid("cfadac75-e12c-11d1-b34c-00c04f990d54")]*/
//module dwin.sys.win32.com.tlb.more.comexp;
module dwin.sys.win32.com.tlb.more.catsrvut;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Structs

struct _tagCLASSINFO {
 DWINGUID Clsid;
  wchar* pszClassName;
  uint nProgIDs;
  wchar** ppszProgID;
}

struct _tagPSCLASSINFO {
 DWINGUID PSClsid;
  wchar* pszPSClassName;
  uint nInterfaces;
  _tagPSITFINFO* pPSItfInfo;
}

struct _tagPSITFINFO {
 DWINGUID iid;
  wchar* pszInterfaceName;
}

// Interfaces

// IComClientExport Interface
interface IComExport : IUnknown {
  mixin(uuid("cfadac84-e12c-11d1-b34c-00c04f990d54"));
  // static DWINGUID IID = { 0xcfadac84, 0xe12c, 0x11d1, 0xb3, 0x4c, 0x00, 0xc0, 0x4f, 0x99, 0x0d, 0x54 };
  // method ExportAsMSI
  /*[id(0x00000001)]*/ int ExportAsMSI(ref DWINGUID rApplID, wchar* pszMSIPath, wchar* pszRSN, uint dwFlags);
  // method GetRemoteClassInfo
  /*[id(0x00000002)]*/ int GetRemoteClassInfo(ref uint nNumRemClass, out _tagCLASSINFO parrRemClassInfo);
  // method GetTypeLibInfo
  /*[id(0x00000003)]*/ int GetTypeLibInfo(ref uint nNumTLBs, out wchar* arrTLBs);
  // method GetPSDlls
  /*[id(0x00000004)]*/ int GetPSDlls(ref uint nNumPSDlls, out wchar* arrPSDlls);
  // method GetPSInfo
  /*[id(0x00000005)]*/ int GetPSClassInfo(uint nPSDllIndex, ref uint nPSClassInfo, out _tagPSCLASSINFO arrPSClassInfo);
}

interface IComExport2 : IUnknown {
  mixin(uuid("f131ea3e-b7be-480e-a60d-51cb2785779e"));
  // static DWINGUID IID = { 0xf131ea3e, 0xb7be, 0x480e, 0xa6, 0x0d, 0x51, 0xcb, 0x27, 0x85, 0x77, 0x9e };
  /*[id(0x60010000)]*/ int ExportPartitionAsMSI(ref DWINGUID guidPartitionId, wchar* pszMSIPath, wchar* pszRSN, uint dwFlags);
}

// CoClasses

// ComExport Class
abstract class ComExport {
  mixin(uuid("cfadac85-e12c-11d1-b34c-00c04f990d54"));
  // static DWINGUID CLSID = { 0xcfadac85, 0xe12c, 0x11d1, 0xb3, 0x4c, 0x00, 0xc0, 0x4f, 0x99, 0x0d, 0x54 };
  mixin Interfaces!(IComExport, IComExport2);
}
