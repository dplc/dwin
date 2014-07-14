//  IAS RADIUS Protocol 1.0 Type Library
// Version 1.0

/*[uuid("6bc09890-0ce6-11d1-baae-00c04fc2e20d")]*/
//module dwin.sys.win32.com.tlb.more.iasradius;
module dwin.sys.win32.com.tlb.more.iasrad;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum _IASPROTOCOL {
  IAS_PROTOCOL_INVALID = 0x00000000,
  IAS_PROTOCOL_NONE = 0x00000001,
  IAS_PROTOCOL_RADIUS = 0x00000002,
  IAS_PROTOCOL_TACACSPLUS = 0x00000003,
  IAS_PROTOCOL_LDAP = 0x00000004,
  IAS_PROTOCOL_RAS = 0x00000005,
}

enum _IASRESPONSE {
  IAS_RESPONSE_INVALID = 0x00000000,
  IAS_RESPONSE_ACCESS_ACCEPT = 0x00000001,
  IAS_RESPONSE_ACCESS_REJECT = 0x00000002,
  IAS_RESPONSE_ACCESS_CHALLENGE = 0x00000003,
  IAS_RESPONSE_ACCOUNTING = 0x00000004,
  IAS_RESPONSE_DISCARD_PACKET = 0x00000005,
  IAS_RESPONSE_FORWARD_PACKET = 0x000003E7,
  IAS_RESPONSE_RAS = 0x000003E8,
  IAS_RESPONSE_MAX = 0x00000800,
}

enum _IASREQUESTSTATUS {
  IAS_REQUEST_STATUS_ABORT = 0x00000000,
  IAS_REQUEST_STATUS_CONTINUE = 0x00000001,
  IAS_REQUEST_STATUS_HANDLED = 0x00000002,
  IAS_REQUEST_STATUS_INVALID = 0x00000003,
}

// Unions

union __MIDL_IWinTypes_0001 {
  uint dwValue;
  wchar* pwszName;
}

// Structs

struct tagPROPBAG2 {
  uint dwType;
  ushort vt;
  wireCLIPFORMAT cfType;
  uint dwHint;
  wchar* pstrName;
 DWINGUID clsid;
}

struct _userCLIPFORMAT {
  int fContext;
  __MIDL_IWinTypes_0001 u;
}

// Aliases

alias _IASREQUESTSTATUS IASREQUESTSTATUS;

alias _userCLIPFORMAT* wireCLIPFORMAT;

// Interfaces

interface IIasComponent : IDispatch {
  mixin(uuid("6bc096b4-0ce6-11d1-baae-00c04fc2e20d"));
  // static DWINGUID IID = { 0x6bc096b4, 0x0ce6, 0x11d1, 0xba, 0xae, 0x00, 0xc0, 0x4f, 0xc2, 0xe2, 0x0d };
  /*[id(0x00000001)]*/ int Initialize();
  /*[id(0x00000002)]*/ int Shutdown();
  /*[id(0x00000003)]*/ int GetProperty(int Id, DWINVARIANT* pValue);
  /*[id(0x00000004)]*/ int PutProperty(int Id, DWINVARIANT* pValue);
  /*[id(0x00000005)]*/ int InitNew();
  /*[id(0x00000006)]*/ int Suspend();
  /*[id(0x00000007)]*/ int Resume();
}

interface IRequestSource : IUnknown {
  mixin(uuid("6bc096a9-0ce6-11d1-baae-00c04fc2e20d"));
  // static DWINGUID IID = { 0x6bc096a9, 0x0ce6, 0x11d1, 0xba, 0xae, 0x00, 0xc0, 0x4f, 0xc2, 0xe2, 0x0d };
  /*[id(0x60010000)]*/ int OnRequestComplete(IRequest pRequest, IASREQUESTSTATUS eStatus);
}

interface IRequest : IUnknown {
  mixin(uuid("6bc096a7-0ce6-11d1-baae-00c04fc2e20d"));
  // static DWINGUID IID = { 0x6bc096a7, 0x0ce6, 0x11d1, 0xba, 0xae, 0x00, 0xc0, 0x4f, 0xc2, 0xe2, 0x0d };
  /*[id(0x00000001)]*/ int get_Request(out int pVal);
  /*[id(0x00000001)]*/ int set_Request(int pVal);
  /*[id(0x00000002)]*/ int get_Response(out int pVal);
  /*[id(0x00000003)]*/ int get_Reason(out int pVal);
  /*[id(0x00000004)]*/ int get_Protocol(out _IASPROTOCOL pVal);
  /*[id(0x00000004)]*/ int set_Protocol(_IASPROTOCOL pVal);
  /*[id(0x00000005)]*/ int get_Source(out IRequestSource pVal);
  /*[id(0x00000005)]*/ int set_Source(IRequestSource pVal);
  /*[id(0x00000007)]*/ int SetResponse(_IASRESPONSE eResponse, int lReason);
  /*[id(0x00000008)]*/ int ReturnToSource(IASREQUESTSTATUS eStatus);
}

interface IPersistPropertyBag2 : IPersist {
  mixin(uuid("22f55881-280b-11d0-a8a9-00a0c90c2004"));
  // static DWINGUID IID = { 0x22f55881, 0x280b, 0x11d0, 0xa8, 0xa9, 0x00, 0xa0, 0xc9, 0x0c, 0x20, 0x04 };
  /*[id(0x60020000)]*/ int InitNew();
  /*[id(0x60020001)]*/ int Load(IPropertyBag2 pPropBag, IErrorLog pErrLog);
  /*[id(0x60020002)]*/ int Save(IPropertyBag2 pPropBag, int fClearDirty, int fSaveAllProperties);
  /*[id(0x60020003)]*/ int IsDirty();
}

interface IPersist : IUnknown {
  mixin(uuid("0000010c-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x0000010c, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int GetClassID(out DWINGUID pClassID);
}

interface IPropertyBag2 : IUnknown {
  mixin(uuid("22f55882-280b-11d0-a8a9-00a0c90c2004"));
  // static DWINGUID IID = { 0x22f55882, 0x280b, 0x11d0, 0xa8, 0xa9, 0x00, 0xa0, 0xc9, 0x0c, 0x20, 0x04 };
  /*[id(0x60010000)]*/ int Read(uint cProperties, tagPROPBAG2* pPropBag, IErrorLog pErrLog, out DWINVARIANT pvarValue, out int phrError);
  /*[id(0x60010001)]*/ int Write(uint cProperties, tagPROPBAG2* pPropBag, DWINVARIANT* pvarValue);
  /*[id(0x60010002)]*/ int CountProperties(out uint pcProperties);
  /*[id(0x60010003)]*/ int GetPropertyInfo(uint iProperty, uint cProperties, out tagPROPBAG2 pPropBag, out uint pcProperties);
  /*[id(0x60010004)]*/ int LoadObject(wchar* pstrName, uint dwHint, IUnknown pUnkObject, IErrorLog pErrLog);
}

interface IErrorLog : IUnknown {
  mixin(uuid("3127ca40-446e-11ce-8135-00aa004bb851"));
  // static DWINGUID IID = { 0x3127ca40, 0x446e, 0x11ce, 0x81, 0x35, 0x00, 0xaa, 0x00, 0x4b, 0xb8, 0x51 };
  /*[id(0x60010000)]*/ int AddError(wchar* pszPropName, EXCEPINFO* pExcepInfo);
}

// IIasClient Interface
interface IIasClient : IUnknown {
  mixin(uuid("6bc096d9-0ce6-11d1-baae-00c04fc2e20d"));
  // static DWINGUID IID = { 0x6bc096d9, 0x0ce6, 0x11d1, 0xba, 0xae, 0x00, 0xc0, 0x4f, 0xc2, 0xe2, 0x0d };
  // method GetAddress
  /*[id(0x60010000)]*/ int GetAddress(out uint pdwAddress);
  // method NeedSignatureCheck
  /*[id(0x60010001)]*/ int NeedSignatureCheck(out int pbNeedCheck);
  // method GetVendorType
  /*[id(0x60010002)]*/ int GetVendorType(out int plVendorType);
  // method GetClientNameW
  /*[id(0x60010003)]*/ wchar* GetClientNameW();
  // method GetSecret
  /*[id(0x60010004)]*/ int GetSecret(out ubyte pbySecret, ref uint pdwSecretSize);
  // method Init
  /*[id(0x60010005)]*/ int Init(ISdo pISdo);
  // method ResolveAddress
  /*[id(0x60010006)]*/ int ResolveAddress();
}

interface ISdo : IDispatch {
  mixin(uuid("56bc53de-96db-11d1-bf3f-000000000000"));
  // static DWINGUID IID = { 0x56bc53de, 0x96db, 0x11d1, 0xbf, 0x3f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
  /*[id(0x00000001)]*/ int GetPropertyInfo(int Id, out IUnknown ppPropertyInfo);
  /*[id(0x00000002)]*/ int GetProperty(int Id, out DWINVARIANT pValue);
  /*[id(0x00000003)]*/ int PutProperty(int Id, DWINVARIANT* pValue);
  /*[id(0x00000004)]*/ int ResetProperty(int Id);
  /*[id(0x00000005)]*/ int Apply();
  /*[id(0x00000006)]*/ int Restore();
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown ppEnumVariant);
}

// CoClasses

// IAS RADIUS Protocol Class
abstract class RadiusProtocol {
  mixin(uuid("6bc09894-0ce6-11d1-baae-00c04fc2e20d"));
  // static DWINGUID CLSID = { 0x6bc09894, 0x0ce6, 0x11d1, 0xba, 0xae, 0x00, 0xc0, 0x4f, 0xc2, 0xe2, 0x0d };
  mixin Interfaces!(IIasComponent, IRequestSource, IPersistPropertyBag2);
}

// IAS Client Class
abstract class CClient {
  mixin(uuid("6bc096da-0ce6-11d1-baae-00c04fc2e20d"));
  // static DWINGUID CLSID = { 0x6bc096da, 0x0ce6, 0x11d1, 0xba, 0xae, 0x00, 0xc0, 0x4f, 0xc2, 0xe2, 0x0d };
  mixin Interfaces!(IIasClient);
}
