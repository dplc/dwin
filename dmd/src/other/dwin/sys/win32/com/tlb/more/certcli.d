// CertCli 1.0 Type Library
// Version 1.0

/*[uuid("372fce32-4324-11d0-8810-00a0c903b83c")]*/
//module dwin.sys.win32.com.tlb.more.certclient;
module dwin.sys.win32.com.tlb.more.certcli;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// ICertGetConfig Interface
interface ICertGetConfig : IDispatch {
  mixin(uuid("c7ea09c0-ce17-11d0-8833-00a0c903b83c"));
  // static DWINGUID IID = { 0xc7ea09c0, 0xce17, 0x11d0, 0x88, 0x33, 0x00, 0xa0, 0xc9, 0x03, 0xb8, 0x3c };
  /*[id(0x60020000)]*/ int GetConfig(int Flags, out wchar* pstrOut);
}

// ICertConfig2 Interface
interface ICertConfig2 : ICertConfig {
  mixin(uuid("7a18edde-7e78-4163-8ded-78e2c9cee924"));
  // static DWINGUID IID = { 0x7a18edde, 0x7e78, 0x4163, 0x8d, 0xed, 0x78, 0xe2, 0xc9, 0xce, 0xe9, 0x24 };
  /*[id(0x60030000)]*/ int SetSharedFolder(wchar* strSharedFolder);
}

// ICertConfig Interface
interface ICertConfig : IDispatch {
  mixin(uuid("372fce34-4324-11d0-8810-00a0c903b83c"));
  // static DWINGUID IID = { 0x372fce34, 0x4324, 0x11d0, 0x88, 0x10, 0x00, 0xa0, 0xc9, 0x03, 0xb8, 0x3c };
  /*[id(0x60020000)]*/ int Reset(int Index, out int pCount);
  /*[id(0x60020001)]*/ int Next(out int pIndex);
  /*[id(0x60020002)]*/ int GetField(wchar* strFieldName, out wchar* pstrOut);
  /*[id(0x60020003)]*/ int GetConfig(int Flags, out wchar* pstrOut);
}

// ICertRequest2 Interface
interface ICertRequest2 : ICertRequest {
  mixin(uuid("a4772988-4a85-4fa9-824e-b5cf5c16405a"));
  // static DWINGUID IID = { 0xa4772988, 0x4a85, 0x4fa9, 0x82, 0x4e, 0xb5, 0xcf, 0x5c, 0x16, 0x40, 0x5a };
  /*[id(0x60030000)]*/ int GetIssuedCertificate(wchar* strConfig, int RequestId, wchar* strSerialNumber, out int pDisposition);
  /*[id(0x60030001)]*/ int GetErrorMessageText(int hrMessage, int Flags, out wchar* pstrErrorMessageText);
  /*[id(0x60030002)]*/ int GetCAProperty(wchar* strConfig, int PropId, int PropIndex, int PropType, int Flags, out DWINVARIANT pvarPropertyValue);
  /*[id(0x60030003)]*/ int GetCAPropertyFlags(wchar* strConfig, int PropId, out int pPropFlags);
  /*[id(0x60030004)]*/ int GetCAPropertyDisplayName(wchar* strConfig, int PropId, out wchar* pstrDisplayName);
  /*[id(0x60030005)]*/ int GetFullResponseProperty(int PropId, int PropIndex, int PropType, int Flags, out DWINVARIANT pvarPropertyValue);
}

// ICertRequest Interface
interface ICertRequest : IDispatch {
  mixin(uuid("014e4840-5523-11d0-8812-00a0c903b83c"));
  // static DWINGUID IID = { 0x014e4840, 0x5523, 0x11d0, 0x88, 0x12, 0x00, 0xa0, 0xc9, 0x03, 0xb8, 0x3c };
  /*[id(0x60020000)]*/ int Submit(int Flags, wchar* strRequest, wchar* strAttributes, wchar* strConfig, out int pDisposition);
  /*[id(0x60020001)]*/ int RetrievePending(int RequestId, wchar* strConfig, out int pDisposition);
  /*[id(0x60020002)]*/ int GetLastStatus(out int pStatus);
  /*[id(0x60020003)]*/ int GetRequestId(out int pRequestId);
  /*[id(0x60020004)]*/ int GetDispositionMessage(out wchar* pstrDispositionMessage);
  /*[id(0x60020005)]*/ int GetCACertificate(int fExchangeCertificate, wchar* strConfig, int Flags, out wchar* pstrCertificate);
  /*[id(0x60020006)]*/ int GetCertificate(int Flags, out wchar* pstrCertificate);
}

// ICertServerPolicy Interface
interface ICertServerPolicy : IDispatch {
  mixin(uuid("aa000922-ffbe-11cf-8800-00a0c903b83c"));
  // static DWINGUID IID = { 0xaa000922, 0xffbe, 0x11cf, 0x88, 0x00, 0x00, 0xa0, 0xc9, 0x03, 0xb8, 0x3c };
  /*[id(0x60020000)]*/ int SetContext(int Context);
  /*[id(0x60020001)]*/ int GetRequestProperty(wchar* strPropertyName, int PropertyType, out DWINVARIANT pvarPropertyValue);
  /*[id(0x60020002)]*/ int GetRequestAttribute(wchar* strAttributeName, out wchar* pstrAttributeValue);
  /*[id(0x60020003)]*/ int GetCertificateProperty(wchar* strPropertyName, int PropertyType, out DWINVARIANT pvarPropertyValue);
  /*[id(0x60020004)]*/ int SetCertificateProperty(wchar* strPropertyName, int PropertyType, DWINVARIANT* pvarPropertyValue);
  /*[id(0x60020005)]*/ int GetCertificateExtension(wchar* strExtensionName, int Type, out DWINVARIANT pvarValue);
  /*[id(0x60020006)]*/ int GetCertificateExtensionFlags(out int pExtFlags);
  /*[id(0x60020007)]*/ int SetCertificateExtension(wchar* strExtensionName, int Type, int ExtFlags, DWINVARIANT* pvarValue);
  /*[id(0x60020008)]*/ int EnumerateExtensionsSetup(int Flags);
  /*[id(0x60020009)]*/ int EnumerateExtensions(out wchar* pstrExtensionName);
  /*[id(0x6002000A)]*/ int EnumerateExtensionsClose();
  /*[id(0x6002000B)]*/ int EnumerateAttributesSetup(int Flags);
  /*[id(0x6002000C)]*/ int EnumerateAttributes(out wchar* pstrAttributeName);
  /*[id(0x6002000D)]*/ int EnumerateAttributesClose();
}

// ICertServerExit Interface
interface ICertServerExit : IDispatch {
  mixin(uuid("4ba9eb90-732c-11d0-8816-00a0c903b83c"));
  // static DWINGUID IID = { 0x4ba9eb90, 0x732c, 0x11d0, 0x88, 0x16, 0x00, 0xa0, 0xc9, 0x03, 0xb8, 0x3c };
  /*[id(0x60020000)]*/ int SetContext(int Context);
  /*[id(0x60020001)]*/ int GetRequestProperty(wchar* strPropertyName, int PropertyType, out DWINVARIANT pvarPropertyValue);
  /*[id(0x60020002)]*/ int GetRequestAttribute(wchar* strAttributeName, out wchar* pstrAttributeValue);
  /*[id(0x60020003)]*/ int GetCertificateProperty(wchar* strPropertyName, int PropertyType, out DWINVARIANT pvarPropertyValue);
  /*[id(0x60020004)]*/ int GetCertificateExtension(wchar* strExtensionName, int Type, out DWINVARIANT pvarValue);
  /*[id(0x60020005)]*/ int GetCertificateExtensionFlags(out int pExtFlags);
  /*[id(0x60020006)]*/ int EnumerateExtensionsSetup(int Flags);
  /*[id(0x60020007)]*/ int EnumerateExtensions(out wchar* pstrExtensionName);
  /*[id(0x60020008)]*/ int EnumerateExtensionsClose();
  /*[id(0x60020009)]*/ int EnumerateAttributesSetup(int Flags);
  /*[id(0x6002000A)]*/ int EnumerateAttributes(out wchar* pstrAttributeName);
  /*[id(0x6002000B)]*/ int EnumerateAttributesClose();
}

// CoClasses

// CertGetConfig Class
abstract class CCertGetConfig {
  mixin(uuid("c6cc49b0-ce17-11d0-8833-00a0c903b83c"));
  // static DWINGUID CLSID = { 0xc6cc49b0, 0xce17, 0x11d0, 0x88, 0x33, 0x00, 0xa0, 0xc9, 0x03, 0xb8, 0x3c };
  mixin Interfaces!(ICertGetConfig);
}

// CertConfig Class
abstract class CCertConfig {
  mixin(uuid("372fce38-4324-11d0-8810-00a0c903b83c"));
  // static DWINGUID CLSID = { 0x372fce38, 0x4324, 0x11d0, 0x88, 0x10, 0x00, 0xa0, 0xc9, 0x03, 0xb8, 0x3c };
  mixin Interfaces!(ICertConfig2);
}

// CertRequest Class
abstract class CCertRequest {
  mixin(uuid("98aff3f0-5524-11d0-8812-00a0c903b83c"));
  // static DWINGUID CLSID = { 0x98aff3f0, 0x5524, 0x11d0, 0x88, 0x12, 0x00, 0xa0, 0xc9, 0x03, 0xb8, 0x3c };
  mixin Interfaces!(ICertRequest2);
}

// CertServerPolicy Class
abstract class CCertServerPolicy {
  mixin(uuid("aa000926-ffbe-11cf-8800-00a0c903b83c"));
  // static DWINGUID CLSID = { 0xaa000926, 0xffbe, 0x11cf, 0x88, 0x00, 0x00, 0xa0, 0xc9, 0x03, 0xb8, 0x3c };
  mixin Interfaces!(ICertServerPolicy);
}

// CertServerExit Class
abstract class CCertServerExit {
  mixin(uuid("4c4a5e40-732c-11d0-8816-00a0c903b83c"));
  // static DWINGUID CLSID = { 0x4c4a5e40, 0x732c, 0x11d0, 0x88, 0x16, 0x00, 0xa0, 0xc9, 0x03, 0xb8, 0x3c };
  mixin Interfaces!(ICertServerExit);
}
