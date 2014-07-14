// licdll 1.0 Type Library
// Version 1.0

/*[uuid("c7879482-f798-4a74-af43-e887fbdced40")]*/
module dwin.sys.win32.com.tlb.more.licdll;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// ICOMLicenseAgent Interface
interface ICOMLicenseAgent : IDispatch {
  mixin(uuid("b8cbad79-3f1f-481a-bb0c-e7bbd77bddd1"));
  // static DWINGUID IID = { 0xb8cbad79, 0x3f1f, 0x481a, 0xbb, 0x0c, 0xe7, 0xbb, 0xd7, 0x7b, 0xdd, 0xd1 };
  // method Initialize
  /*[id(0x00000001)]*/ int Initialize(uint dwBPC, uint dwMode, wchar* bstrLicSource, out uint pdwRetCode);
  // method GetFirstName
  /*[id(0x00000003)]*/ int GetFirstName(out wchar* pbstrVal);
  // method SetFirstName
  /*[id(0x00000004)]*/ int SetFirstName(wchar* bstrNewVal);
  // method GetLastName
  /*[id(0x00000005)]*/ int GetLastName(out wchar* pbstrVal);
  // method SetLastName
  /*[id(0x00000006)]*/ int SetLastName(wchar* bstrNewVal);
  // method GetOrgName
  /*[id(0x00000007)]*/ int GetOrgName(out wchar* pbstrVal);
  // method SetOrgName
  /*[id(0x00000008)]*/ int SetOrgName(wchar* bstrNewVal);
  // method GetEmail
  /*[id(0x00000009)]*/ int GetEmail(out wchar* pbstrVal);
  // method SetEmail
  /*[id(0x0000000A)]*/ int SetEmail(wchar* bstrNewVal);
  // method GetPhone
  /*[id(0x0000000B)]*/ int GetPhone(out wchar* pbstrVal);
  // method SetPhone
  /*[id(0x0000000C)]*/ int SetPhone(wchar* bstrNewVal);
  // method GetAddress1
  /*[id(0x0000000D)]*/ int GetAddress1(out wchar* pbstrVal);
  // method SetAddress1
  /*[id(0x0000000E)]*/ int SetAddress1(wchar* bstrNewVal);
  // method GetCity
  /*[id(0x0000000F)]*/ int GetCity(out wchar* pbstrVal);
  // method SetCity
  /*[id(0x00000010)]*/ int SetCity(wchar* bstrNewVal);
  // method GetState
  /*[id(0x00000011)]*/ int GetState(out wchar* pbstrVal);
  // method SetState
  /*[id(0x00000012)]*/ int SetState(wchar* bstrNewVal);
  // method GetCountryCode
  /*[id(0x00000013)]*/ int GetCountryCode(out wchar* pbstrVal);
  // method SetCountryCode
  /*[id(0x00000014)]*/ int SetCountryCode(wchar* bstrNewVal);
  // method GetCountryDesc
  /*[id(0x00000015)]*/ int GetCountryDesc(out wchar* pbstrVal);
  // method SetCountryDesc
  /*[id(0x00000016)]*/ int SetCountryDesc(wchar* bstrNewVal);
  // method GetZip
  /*[id(0x00000017)]*/ int GetZip(out wchar* pbstrVal);
  // method SetZip
  /*[id(0x00000018)]*/ int SetZip(wchar* bstrNewVal);
  // method GetIsoLanguage
  /*[id(0x00000019)]*/ int GetIsoLanguage(out uint pdwVal);
  // method SetIsoLanguage
  /*[id(0x0000001A)]*/ int SetIsoLanguage(uint dwNewVal);
  // method GetMSUpdate
  /*[id(0x00000020)]*/ int GetMSUpdate(out wchar* pbstrVal);
  // method SetMSUpdate
  /*[id(0x00000021)]*/ int SetMSUpdate(wchar* bstrNewVal);
  // method GetMSOffer
  /*[id(0x00000022)]*/ int GetMSOffer(out wchar* pbstrVal);
  // method SetMSOffer
  /*[id(0x00000023)]*/ int SetMSOffer(wchar* bstrNewVal);
  // method GetOtherOffer
  /*[id(0x00000024)]*/ int GetOtherOffer(out wchar* pbstrVal);
  // method SetOtherOffer
  /*[id(0x00000025)]*/ int SetOtherOffer(wchar* bstrNewVal);
  // method GetAddress2
  /*[id(0x00000026)]*/ int GetAddress2(out wchar* pbstrVal);
  // method SetAddress2
  /*[id(0x00000027)]*/ int SetAddress2(wchar* bstrNewVal);
  // method AsyncProcessHandshakeRequest
  /*[id(0x00000052)]*/ int AsyncProcessHandshakeRequest(int bReviseCustInfo);
  // method AsyncProcessNewLicenseRequest
  /*[id(0x00000053)]*/ int AsyncProcessNewLicenseRequest();
  // method AsyncProcessReissueLicenseRequest
  /*[id(0x00000054)]*/ int AsyncProcessReissueLicenseRequest();
  // method AsyncProcessReviseCustInfoRequest
  /*[id(0x00000056)]*/ int AsyncProcessReviseCustInfoRequest();
  // method GetAsyncProcessReturnCode
  /*[id(0x0000005A)]*/ int GetAsyncProcessReturnCode(out uint pdwRetCode);
  // method AsyncProcessDroppedLicenseRequest
  /*[id(0x0000005D)]*/ int AsyncProcessDroppedLicenseRequest();
  // method GenerateInstallationId
  /*[id(0x00000064)]*/ int GenerateInstallationId(out wchar* pbstrVal);
  // method DepositConfirmationId
  /*[id(0x00000065)]*/ int DepositConfirmationId(wchar* bstrVal, out uint pdwRetCode);
  // method GetExpirationInfo
  /*[id(0x00000066)]*/ int GetExpirationInfo(out uint pdwWPALeft, out uint pdwEvalLeft);
  // method AsyncProcessRegistrationRequest
  /*[id(0x00000067)]*/ int AsyncProcessRegistrationRequest();
  // method ProcessHandshakeRequest
  /*[id(0x00000068)]*/ int ProcessHandshakeRequest(int bReviseCustInfo);
  // method ProcessNewLicenseRequest
  /*[id(0x00000069)]*/ int ProcessNewLicenseRequest();
  // method ProcessDroppedLicenseRequest
  /*[id(0x0000006A)]*/ int ProcessDroppedLicenseRequest();
  // method ProcessReissueLicenseRequest
  /*[id(0x0000006B)]*/ int ProcessReissueLicenseRequest();
  // method ProcessReviseCustInfoRequest
  /*[id(0x0000006D)]*/ int ProcessReviseCustInfoRequest();
  // method EnsureInternetConnection
  /*[id(0x0000006E)]*/ int EnsureInternetConnection();
  // method SetProductKey
  /*[id(0x0000006F)]*/ int SetProductKey(wchar* pszNewProductKey);
  // method GetProductID
  /*[id(0x00000070)]*/ int GetProductID(out wchar* pbstrVal);
  // method VerifyCheckDigits
  /*[id(0x00000071)]*/ int VerifyCheckDigits(wchar* bstrCIDIID, out int pbValue);
}

// ICOMLicenseAgent Interface 2
interface ICOMLicenseAgent2 : ICOMLicenseAgent {
  mixin(uuid("6a07c5a3-9c67-4bb6-b020-ecbe7fdfd326"));
  // static DWINGUID IID = { 0x6a07c5a3, 0x9c67, 0x4bb6, 0xb0, 0x20, 0xec, 0xbe, 0x7f, 0xdf, 0xd3, 0x26 };
  // method SetReminders
  /*[id(0x00000072)]*/ int SetReminders(int bValue);
  // method GetReminders
  /*[id(0x00000073)]*/ int GetReminders(int* pbValue);
  // method GetKeyType
  /*[id(0x00000074)]*/ int GetKeyType(out uint pdwKeyType);
}

// CoClasses

// COMLicenseAgent Class
abstract class COMLicenseAgent {
  mixin(uuid("acadf079-cbcd-4032-83f2-fa47c4db096f"));
  // static DWINGUID CLSID = { 0xacadf079, 0xcbcd, 0x4032, 0x83, 0xf2, 0xfa, 0x47, 0xc4, 0xdb, 0x09, 0x6f };
  mixin Interfaces!(ICOMLicenseAgent, ICOMLicenseAgent2);
}
