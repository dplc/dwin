//  IAS Helper COM Component 1.0 Type Library
// Version 1.0

/*[uuid("6bc096bb-0ce6-11d1-baae-00c04fc2e20d")]*/
//module dwin.sys.win32.com.tlb.more.iashelper;
module dwin.sys.win32.com.tlb.more.iashlpr;

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

enum IASTYPEENUM {
  IASTYPE_INVALID = 0x00000000,
  IASTYPE_BOOLEAN = 0x00000001,
  IASTYPE_INTEGER = 0x00000002,
  IASTYPE_ENUM = 0x00000003,
  IASTYPE_INET_ADDR = 0x00000004,
  IASTYPE_STRING = 0x00000005,
  IASTYPE_OCTET_STRING = 0x00000006,
  IASTYPE_UTC_TIME = 0x00000007,
  IASTYPE_PROV_SPECIFIC = 0x00000008,
}

// Unions

union __MIDL___MIDL_itf_iashlpr_0252_0002 {
  uint Boolean;
  uint Integer;
  uint Enumerator;
  uint InetAddr;
  _IAS_STRING String;
  _IAS_OCTET_STRING OctetString;
  _FILETIME UTCTime;
  _IAS_OCTET_STRING ProviderSpecific;
}

// Structs

struct _IASATTRIBUTE {
  uint dwReserved;
  uint dwFlags;
  uint dwId;
  _IASVALUE Value;
}

struct _IASVALUE {
  IASTYPEENUM itType;
  __MIDL___MIDL_itf_iashlpr_0252_0002 __MIDL_0011;
}

struct _IAS_STRING {
  char* pszAnsi;
  wchar* pszWide;
}

struct _IAS_OCTET_STRING {
  uint dwLength;
  ubyte* lpValue;
}

struct _FILETIME {
  uint dwLowDateTime;
  uint dwHighDateTime;
}

// Aliases

alias _IASREQUESTSTATUS IASREQUESTSTATUS;

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

// IRecvRequest Interface
interface IRecvRequest : IUnknown {
  mixin(uuid("6bc096bd-0ce6-11d1-baae-00c04fc2e20d"));
  // static DWINGUID IID = { 0x6bc096bd, 0x0ce6, 0x11d1, 0xba, 0xae, 0x00, 0xc0, 0x4f, 0xc2, 0xe2, 0x0d };
  // IASHlpr IRecvRequest Process method
  /*[id(0x60010000)]*/ int Process(uint dwInAttributeCount, _IASATTRIBUTE** ppInIasAttribute, out uint pdwOutAttributeCount, out _IASATTRIBUTE pppOutIasAttribute, int IasRequest, ref int pIasResponse, _IASPROTOCOL IasProtocol, out int plReason, int bProcessVSA);
}

// CoClasses

// IAS Helper COM Component class
abstract class IasHelper {
  mixin(uuid("6bc096bc-0ce6-11d1-baae-00c04fc2e20d"));
  // static DWINGUID CLSID = { 0x6bc096bc, 0x0ce6, 0x11d1, 0xba, 0xae, 0x00, 0xc0, 0x4f, 0xc2, 0xe2, 0x0d };
  mixin Interfaces!(IIasComponent, IRequestSource, IRecvRequest);
}
