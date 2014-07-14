// xenroll 1.0 Type Library
// Version 1.0

/*[uuid("5b9169c0-db65-42aa-a38a-0726846aaeb3")]*/
module dwin.sys.win32.com.tlb.more.xenroll;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// ICEnroll4 Interface
interface ICEnroll4 : ICEnroll3 {
  mixin(uuid("c1f1188a-2eb5-4a80-841b-7e729a356d90"));
  // static DWINGUID IID = { 0xc1f1188a, 0x2eb5, 0x4a80, 0x84, 0x1b, 0x7e, 0x72, 0x9a, 0x35, 0x6d, 0x90 };
  /*[id(0x60050000)]*/ int set_PrivateKeyArchiveCertificate(wchar* pbstrCert);
  /*[id(0x60050000)]*/ int get_PrivateKeyArchiveCertificate(out wchar* pbstrCert);
  /*[id(0x60050002)]*/ int set_ThumbPrint(wchar* pbstrThumbPrint);
  /*[id(0x60050002)]*/ int get_ThumbPrint(out wchar* pbstrThumbPrint);
  /*[id(0x60050004)]*/ int binaryToString(int Flags, wchar* strBinary, out wchar* pstrEncoded);
  /*[id(0x60050005)]*/ int stringToBinary(int Flags, wchar* strEncoded, out wchar* pstrBinary);
  /*[id(0x60050006)]*/ int addExtensionToRequest(int Flags, wchar* strName, wchar* strValue);
  /*[id(0x60050007)]*/ int addAttributeToRequest(int Flags, wchar* strName, wchar* strValue);
  /*[id(0x60050008)]*/ int addNameValuePairToRequest(int Flags, wchar* strName, wchar* strValue);
  /*[id(0x60050009)]*/ int resetExtensions();
  /*[id(0x6005000A)]*/ int resetAttributes();
  /*[id(0x6005000B)]*/ int createRequest(int Flags, wchar* strDNName, wchar* Usage, out wchar* pstrRequest);
  /*[id(0x6005000C)]*/ int createFileRequest(int Flags, wchar* strDNName, wchar* strUsage, wchar* strRequestFileName);
  /*[id(0x6005000D)]*/ int acceptResponse(wchar* strResponse);
  /*[id(0x6005000E)]*/ int acceptFileResponse(wchar* strResponseFileName);
  /*[id(0x6005000F)]*/ int getCertFromResponse(wchar* strResponse, out wchar* pstrCert);
  /*[id(0x60050010)]*/ int getCertFromFileResponse(wchar* strResponseFileName, out wchar* pstrCert);
  /*[id(0x60050011)]*/ int createPFX(wchar* strPassword, out wchar* pstrPFX);
  /*[id(0x60050012)]*/ int createFilePFX(wchar* strPassword, wchar* strPFXFileName);
  /*[id(0x60050013)]*/ int setPendingRequestInfo(int lRequestID, wchar* strCADNS, wchar* strCAName, wchar* strFriendlyName);
  /*[id(0x60050014)]*/ int enumPendingRequest(int lIndex, int lDesiredProperty, out DWINVARIANT pvarProperty);
  /*[id(0x60050015)]*/ int removePendingRequest(wchar* strThumbprint);
  /*[id(0x60050016)]*/ int GetKeyLenEx(int lSizeSpec, int lKeySpec, out int pdwKeySize);
  /*[id(0x60050017)]*/ int InstallPKCS7Ex(wchar* PKCS7, out int plCertInstalled);
  /*[id(0x60050018)]*/ int addCertTypeToRequestEx(int lType, wchar* bstrOIDOrName, int lMajorVersion, int fMinorVersion, int lMinorVersion);
  /*[id(0x60050019)]*/ int getProviderType(wchar* strProvName, out int plProvType);
  /*[id(0x6005001A)]*/ int set_SignerCertificate(wchar* value);
  /*[id(0x6005001B)]*/ int set_ClientId(int plClientId);
  /*[id(0x6005001B)]*/ int get_ClientId(out int plClientId);
  /*[id(0x6005001D)]*/ int addBlobPropertyToCertificate(int lPropertyId, int lReserved, wchar* bstrProperty);
  /*[id(0x6005001E)]*/ int resetBlobProperties();
  /*[id(0x6005001F)]*/ int set_IncludeSubjectKeyID(int pfInclude);
  /*[id(0x6005001F)]*/ int get_IncludeSubjectKeyID(out int pfInclude);
}

// ICEnroll3 Interface
interface ICEnroll3 : ICEnroll2 {
  mixin(uuid("c28c2d95-b7de-11d2-a421-00c04f79fe8e"));
  // static DWINGUID IID = { 0xc28c2d95, 0xb7de, 0x11d2, 0xa4, 0x21, 0x00, 0xc0, 0x4f, 0x79, 0xfe, 0x8e };
  /*[id(0x60040000)]*/ int InstallPKCS7(wchar* PKCS7);
  /*[id(0x60040001)]*/ int Reset();
  /*[id(0x60040002)]*/ int GetSupportedKeySpec(out int pdwKeySpec);
  /*[id(0x60040003)]*/ int GetKeyLen(int fMin, int fExchange, out int pdwKeySize);
  /*[id(0x60040004)]*/ int EnumAlgs(int dwIndex, int algClass, out int pdwAlgID);
  /*[id(0x60040005)]*/ int GetAlgName(int algID, out wchar* pbstr);
  /*[id(0x60040006)]*/ int set_ReuseHardwareKeyIfUnableToGenNew(int fReuseHardwareKeyIfUnableToGenNew);
  /*[id(0x60040006)]*/ int get_ReuseHardwareKeyIfUnableToGenNew(out int fReuseHardwareKeyIfUnableToGenNew);
  /*[id(0x60040008)]*/ int set_HashAlgID(int HashAlgID);
  /*[id(0x60040008)]*/ int get_HashAlgID(out int HashAlgID);
  /*[id(0x6004000A)]*/ int set_LimitExchangeKeyToEncipherment(int fLimitExchangeKeyToEncipherment);
  /*[id(0x6004000A)]*/ int get_LimitExchangeKeyToEncipherment(out int fLimitExchangeKeyToEncipherment);
  /*[id(0x6004000C)]*/ int set_EnableSMIMECapabilities(int fEnableSMIMECapabilities);
  /*[id(0x6004000C)]*/ int get_EnableSMIMECapabilities(out int fEnableSMIMECapabilities);
}

// ICEnroll2 Interface
interface ICEnroll2 : ICEnroll {
  mixin(uuid("704ca730-c90b-11d1-9bec-00c04fc295e1"));
  // static DWINGUID IID = { 0x704ca730, 0xc90b, 0x11d1, 0x9b, 0xec, 0x00, 0xc0, 0x4f, 0xc2, 0x95, 0xe1 };
  /*[id(0x60030000)]*/ int addCertTypeToRequest(wchar* CertType);
  /*[id(0x60030001)]*/ int addNameValuePairToSignature(wchar* Name, wchar* Value);
  /*[id(0x60030002)]*/ int get_WriteCertToUserDS(out int fBool);
  /*[id(0x60030002)]*/ int set_WriteCertToUserDS(int fBool);
  /*[id(0x60030004)]*/ int get_EnableT61DNEncoding(out int fBool);
  /*[id(0x60030004)]*/ int set_EnableT61DNEncoding(int fBool);
}

// ICEnroll Interface
interface ICEnroll : IDispatch {
  mixin(uuid("43f8f288-7a20-11d0-8f06-00c04fc295e1"));
  // static DWINGUID IID = { 0x43f8f288, 0x7a20, 0x11d0, 0x8f, 0x06, 0x00, 0xc0, 0x4f, 0xc2, 0x95, 0xe1 };
  /*[id(0x60020000)]*/ int createFilePKCS10(wchar* DNName, wchar* Usage, wchar* wszPKCS10FileName);
  /*[id(0x60020001)]*/ int acceptFilePKCS7(wchar* wszPKCS7FileName);
  /*[id(0x60020002)]*/ int createPKCS10(wchar* DNName, wchar* Usage, out wchar* pPKCS10);
  /*[id(0x60020003)]*/ int acceptPKCS7(wchar* PKCS7);
  /*[id(0x60020004)]*/ int getCertFromPKCS7(wchar* wszPKCS7, out wchar* pbstrCert);
  /*[id(0x60020005)]*/ int enumProviders(int dwIndex, int dwFlags, out wchar* pbstrProvName);
  /*[id(0x60020006)]*/ int enumContainers(int dwIndex, out wchar* pbstr);
  /*[id(0x60020007)]*/ int freeRequestInfo(wchar* PKCS7OrPKCS10);
  /*[id(0x60020008)]*/ int get_MyStoreName(out wchar* pbstrName);
  /*[id(0x60020008)]*/ int set_MyStoreName(wchar* pbstrName);
  /*[id(0x6002000A)]*/ int get_MyStoreType(out wchar* pbstrType);
  /*[id(0x6002000A)]*/ int set_MyStoreType(wchar* pbstrType);
  /*[id(0x6002000C)]*/ int get_MyStoreFlags(out int pdwFlags);
  /*[id(0x6002000C)]*/ int set_MyStoreFlags(int pdwFlags);
  /*[id(0x6002000E)]*/ int get_CAStoreName(out wchar* pbstrName);
  /*[id(0x6002000E)]*/ int set_CAStoreName(wchar* pbstrName);
  /*[id(0x60020010)]*/ int get_CAStoreType(out wchar* pbstrType);
  /*[id(0x60020010)]*/ int set_CAStoreType(wchar* pbstrType);
  /*[id(0x60020012)]*/ int get_CAStoreFlags(out int pdwFlags);
  /*[id(0x60020012)]*/ int set_CAStoreFlags(int pdwFlags);
  /*[id(0x60020014)]*/ int get_RootStoreName(out wchar* pbstrName);
  /*[id(0x60020014)]*/ int set_RootStoreName(wchar* pbstrName);
  /*[id(0x60020016)]*/ int get_RootStoreType(out wchar* pbstrType);
  /*[id(0x60020016)]*/ int set_RootStoreType(wchar* pbstrType);
  /*[id(0x60020018)]*/ int get_RootStoreFlags(out int pdwFlags);
  /*[id(0x60020018)]*/ int set_RootStoreFlags(int pdwFlags);
  /*[id(0x6002001A)]*/ int get_RequestStoreName(out wchar* pbstrName);
  /*[id(0x6002001A)]*/ int set_RequestStoreName(wchar* pbstrName);
  /*[id(0x6002001C)]*/ int get_RequestStoreType(out wchar* pbstrType);
  /*[id(0x6002001C)]*/ int set_RequestStoreType(wchar* pbstrType);
  /*[id(0x6002001E)]*/ int get_RequestStoreFlags(out int pdwFlags);
  /*[id(0x6002001E)]*/ int set_RequestStoreFlags(int pdwFlags);
  /*[id(0x60020020)]*/ int get_ContainerName(out wchar* pbstrContainer);
  /*[id(0x60020020)]*/ int set_ContainerName(wchar* pbstrContainer);
  /*[id(0x60020022)]*/ int get_ProviderName(out wchar* pbstrProvider);
  /*[id(0x60020022)]*/ int set_ProviderName(wchar* pbstrProvider);
  /*[id(0x60020024)]*/ int get_ProviderType(out int pdwType);
  /*[id(0x60020024)]*/ int set_ProviderType(int pdwType);
  /*[id(0x60020026)]*/ int get_KeySpec(out int pdw);
  /*[id(0x60020026)]*/ int set_KeySpec(int pdw);
  /*[id(0x60020028)]*/ int get_ProviderFlags(out int pdwFlags);
  /*[id(0x60020028)]*/ int set_ProviderFlags(int pdwFlags);
  /*[id(0x6002002A)]*/ int get_UseExistingKeySet(out int fUseExistingKeys);
  /*[id(0x6002002A)]*/ int set_UseExistingKeySet(int fUseExistingKeys);
  /*[id(0x6002002C)]*/ int get_GenKeyFlags(out int pdwFlags);
  /*[id(0x6002002C)]*/ int set_GenKeyFlags(int pdwFlags);
  /*[id(0x6002002E)]*/ int get_DeleteRequestCert(out int fDelete);
  /*[id(0x6002002E)]*/ int set_DeleteRequestCert(int fDelete);
  /*[id(0x60020030)]*/ int get_WriteCertToCSP(out int fBool);
  /*[id(0x60020030)]*/ int set_WriteCertToCSP(int fBool);
  /*[id(0x60020032)]*/ int get_SPCFileName(out wchar* pbstr);
  /*[id(0x60020032)]*/ int set_SPCFileName(wchar* pbstr);
  /*[id(0x60020034)]*/ int get_PVKFileName(out wchar* pbstr);
  /*[id(0x60020034)]*/ int set_PVKFileName(wchar* pbstr);
  /*[id(0x60020036)]*/ int get_HashAlgorithm(out wchar* pbstr);
  /*[id(0x60020036)]*/ int set_HashAlgorithm(wchar* pbstr);
}

// CoClasses

// CEnroll Class
abstract class CEnroll2 {
  mixin(uuid("127698e4-e730-4e5c-a2b1-21490a70c8a1"));
  // static DWINGUID CLSID = { 0x127698e4, 0xe730, 0x4e5c, 0xa2, 0xb1, 0x21, 0x49, 0x0a, 0x70, 0xc8, 0xa1 };
  mixin Interfaces!(ICEnroll4);
}

// CEnroll Class
abstract class CEnroll {
  mixin(uuid("43f8f289-7a20-11d0-8f06-00c04fc295e1"));
  // static DWINGUID CLSID = { 0x43f8f289, 0x7a20, 0x11d0, 0x8f, 0x06, 0x00, 0xc0, 0x4f, 0xc2, 0x95, 0xe1 };
  mixin Interfaces!(ICEnroll4);
}
