// msnetobj 1.0 Type Library
// Version 1.0

/*[uuid("8aa720bf-7468-4da1-97da-66d2e41b3dda")]*/
module dwin.sys.win32.com.tlb.more.msnetobj;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// IRMGetLicense Interface
interface IRMGetLicense : IDispatch {
  mixin(uuid("9ea69f99-f8ff-415e-8b90-35d6dfaf160e"));
  // static DWINGUID IID = { 0x9ea69f99, 0xf8ff, 0x415e, 0x8b, 0x90, 0x35, 0xd6, 0xdf, 0xaf, 0x16, 0x0e };
  // method GetLicenseFromURL
  /*[id(0x60020000)]*/ int GetLicenseFromURL(wchar* bstrXMLDoc, wchar* bstrURL);
  // method GetSystemInfo
  /*[id(0x60020001)]*/ int GetSystemInfo(out wchar* pbstrXMLDoc);
  // method StoreLicense
  /*[id(0x60020002)]*/ int StoreLicense(wchar* bstrXMLDoc);
  // method GetDRMVersion
  /*[id(0x60020003)]*/ int GetDRMVersion(out wchar* pbstrDRMVersion);
  // method GetDRMSecurityVersion
  /*[id(0x60020004)]*/ int GetDRMSecurityVersion(out wchar* pbstrDRMSecurityVersion);
  // method GetLicenseFromURLAsync
  /*[id(0x60020005)]*/ int GetLicenseFromURLAsync(wchar* bstrXMLDoc, wchar* bstrURL);
  // method GetAsyncCallStatus
  /*[id(0x60020006)]*/ int GetAsyncCallStatus(ref DWINVARIANT pvarStatus, ref DWINVARIANT pvarHResult);
}

// CoClasses

// RMGetLicense Class
abstract class RMGetLicense {
  mixin(uuid("a9fc132b-096d-460b-b7d5-1db0fae0c062"));
  // static DWINGUID CLSID = { 0xa9fc132b, 0x096d, 0x460b, 0xb7, 0xd5, 0x1d, 0xb0, 0xfa, 0xe0, 0xc0, 0x62 };
  mixin Interfaces!(IRMGetLicense);
}
