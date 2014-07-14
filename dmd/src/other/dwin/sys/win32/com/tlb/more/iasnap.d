// IAS Network Access Policy 1.0
// Version 1.0

/*[uuid("6bc098a0-0ce6-11d1-baae-00c04fc2e20d")]*/
//module dwin.sys.win32.com.tlb.more.networkpolicy;
module dwin.sys.win32.com.tlb.more.iasnap;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum _IAS_LOGICAL_TOKEN {
  IAS_LOGICAL_TRUE = 0x00000000,
  IAS_LOGICAL_FALSE = 0x00000001,
  IAS_LOGICAL_NOT = 0x00000002,
  IAS_LOGICAL_AND = 0x00000003,
  IAS_LOGICAL_OR = 0x00000004,
  IAS_LOGICAL_XOR = 0x00000005,
  IAS_LOGICAL_LEFT_PAREN = 0x00000006,
  IAS_LOGICAL_RIGHT_PAREN = 0x00000007,
  IAS_LOGICAL_NUM_TOKENS = 0x00000008,
}

enum _IASPROTOCOL {
  IAS_PROTOCOL_INVALID = 0x00000000,
  IAS_PROTOCOL_NONE = 0x00000001,
  IAS_PROTOCOL_RADIUS = 0x00000002,
  IAS_PROTOCOL_TACACSPLUS = 0x00000003,
  IAS_PROTOCOL_LDAP = 0x00000004,
  IAS_PROTOCOL_RAS = 0x00000005,
}

enum _IASREQUESTSTATUS {
  IAS_REQUEST_STATUS_ABORT = 0x00000000,
  IAS_REQUEST_STATUS_CONTINUE = 0x00000001,
  IAS_REQUEST_STATUS_HANDLED = 0x00000002,
  IAS_REQUEST_STATUS_INVALID = 0x00000003,
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

enum _QUALITYSTATUS {
  QUALITY_STATUS_INOPERABLE = 0x00000001,
  QUALITY_STATUS_FLOODED = 0x00000002,
  QUALITY_STATUS_READY = 0x00000003,
  QUALITY_STATUS_UNKNOWN = 0x00000004,
}

// Aliases

alias _IASREQUESTSTATUS IASREQUESTSTATUS;

// Interfaces

interface ICondition : IUnknown {
  mixin(uuid("6bc098a1-0ce6-11d1-baae-00c04fc2e20d"));
  // static DWINGUID IID = { 0x6bc098a1, 0x0ce6, 0x11d1, 0xba, 0xae, 0x00, 0xc0, 0x4f, 0xc2, 0xe2, 0x0d };
  /*[id(0x60010000)]*/ int IsTrue(IRequest pRequest, out short pVal);
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

interface IRequestSource : IUnknown {
  mixin(uuid("6bc096a9-0ce6-11d1-baae-00c04fc2e20d"));
  // static DWINGUID IID = { 0x6bc096a9, 0x0ce6, 0x11d1, 0xba, 0xae, 0x00, 0xc0, 0x4f, 0xc2, 0xe2, 0x0d };
  /*[id(0x60010000)]*/ int OnRequestComplete(IRequest pRequest, IASREQUESTSTATUS eStatus);
}

interface IConditionText : IUnknown {
  mixin(uuid("6bc098a2-0ce6-11d1-baae-00c04fc2e20d"));
  // static DWINGUID IID = { 0x6bc098a2, 0x0ce6, 0x11d1, 0xba, 0xae, 0x00, 0xc0, 0x4f, 0xc2, 0xe2, 0x0d };
  /*[id(0x60010000)]*/ int get_ConditionText(out wchar* pVal);
  /*[id(0x60010000)]*/ int set_ConditionText(wchar* pVal);
}

interface IPolicyAction : IUnknown {
  mixin(uuid("6bc098a3-0ce6-11d1-baae-00c04fc2e20d"));
  // static DWINGUID IID = { 0x6bc098a3, 0x0ce6, 0x11d1, 0xba, 0xae, 0x00, 0xc0, 0x4f, 0xc2, 0xe2, 0x0d };
  /*[id(0x60010000)]*/ int InitializeAction();
  /*[id(0x60010001)]*/ int ShutdownAction();
  /*[id(0x60010002)]*/ int DoAction(IRequest pRequest);
}

interface IRequestHandler : IDispatch {
  mixin(uuid("6bc096aa-0ce6-11d1-baae-00c04fc2e20d"));
  // static DWINGUID IID = { 0x6bc096aa, 0x0ce6, 0x11d1, 0xba, 0xae, 0x00, 0xc0, 0x4f, 0xc2, 0xe2, 0x0d };
  /*[id(0x00000001)]*/ int OnRequest(IRequest pRequest);
}

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

interface IQualityControl : IDispatch {
  mixin(uuid("6bc096ab-0ce6-11d1-baae-00c04fc2e20d"));
  // static DWINGUID IID = { 0x6bc096ab, 0x0ce6, 0x11d1, 0xba, 0xae, 0x00, 0xc0, 0x4f, 0xc2, 0xe2, 0x0d };
  /*[id(0x60020000)]*/ int OnQualityNotify(_QUALITYSTATUS eQualityStatus, int lObjectID);
  /*[id(0x60020001)]*/ int SetQualityNotify(IQualityControl pQualityControl);
}

// CoClasses

abstract class AttributeMatch {
  mixin(uuid("6bc098a4-0ce6-11d1-baae-00c04fc2e20d"));
  // static DWINGUID CLSID = { 0x6bc098a4, 0x0ce6, 0x11d1, 0xba, 0xae, 0x00, 0xc0, 0x4f, 0xc2, 0xe2, 0x0d };
  mixin Interfaces!(ICondition, IConditionText);
}

abstract class NTGroups {
  mixin(uuid("6bc098a5-0ce6-11d1-baae-00c04fc2e20d"));
  // static DWINGUID CLSID = { 0x6bc098a5, 0x0ce6, 0x11d1, 0xba, 0xae, 0x00, 0xc0, 0x4f, 0xc2, 0xe2, 0x0d };
  mixin Interfaces!(ICondition, IConditionText);
}

abstract class TimeOfDay {
  mixin(uuid("6bc098a6-0ce6-11d1-baae-00c04fc2e20d"));
  // static DWINGUID CLSID = { 0x6bc098a6, 0x0ce6, 0x11d1, 0xba, 0xae, 0x00, 0xc0, 0x4f, 0xc2, 0xe2, 0x0d };
  mixin Interfaces!(ICondition, IConditionText);
}

abstract class PolicyEnforcer {
  mixin(uuid("6bc098a7-0ce6-11d1-baae-00c04fc2e20d"));
  // static DWINGUID CLSID = { 0x6bc098a7, 0x0ce6, 0x11d1, 0xba, 0xae, 0x00, 0xc0, 0x4f, 0xc2, 0xe2, 0x0d };
  mixin Interfaces!(IRequestHandler, IIasComponent, IQualityControl, IDispatch);
}
