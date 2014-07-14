// IAS Core Components 1.0
// Version 1.0

/*[uuid("6bc09690-0ce6-11d1-baae-00c04fc2e20d")]*/
//module dwin.sys.win32.com.tlb.more.iascore;
module dwin.sys.win32.com.tlb.more.iassvcs;

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

// Aliases

alias _IASREQUESTSTATUS IASREQUESTSTATUS;

// Interfaces

interface IAttributeDictionary : IUnknown {
  mixin(uuid("f42cfa19-ea06-4eb6-9891-d583f0ce46fc"));
  // static DWINGUID IID = { 0xf42cfa19, 0xea06, 0x4eb6, 0x98, 0x91, 0xd5, 0x83, 0xf0, 0xce, 0x46, 0xfc };
  /*[id(0x60010000)]*/ int GetDictionary(wchar* bstrPath, out DWINVARIANT pVal);
}

interface IAuditSink : IUnknown {
  mixin(uuid("6bc0969a-0ce6-11d1-baae-00c04fc2e20d"));
  // static DWINGUID IID = { 0x6bc0969a, 0x0ce6, 0x11d1, 0xba, 0xae, 0x00, 0xc0, 0x4f, 0xc2, 0xe2, 0x0d };
  /*[id(0x60010000)]*/ int AuditEvent(uint ulEventID, uint ulNumStrings, uint ulDataSize, wchar** aszStrings, ubyte* pRawData);
}

interface IAuditSource : IUnknown {
  mixin(uuid("6bc0969b-0ce6-11d1-baae-00c04fc2e20d"));
  // static DWINGUID IID = { 0x6bc0969b, 0x0ce6, 0x11d1, 0xba, 0xae, 0x00, 0xc0, 0x4f, 0xc2, 0xe2, 0x0d };
  /*[id(0x60010000)]*/ int Clear();
  /*[id(0x60010001)]*/ int Connect(IAuditSink pSink);
  /*[id(0x60010002)]*/ int Disconnect(IAuditSink pSink);
}

interface IIASNetshJetHelper : IUnknown {
  mixin(uuid("20290be7-a2ae-42c2-8883-fa09973ed3a5"));
  // static DWINGUID IID = { 0x20290be7, 0xa2ae, 0x42c2, 0x88, 0x83, 0xfa, 0x09, 0x97, 0x3e, 0xd3, 0xa5 };
  /*[id(0x60010000)]*/ int OpenJetDatabase(wchar* Path, short ReadOnly);
  /*[id(0x60010001)]*/ int ExecuteSQLFunction(wchar* Command, out int Result);
  /*[id(0x60010002)]*/ int ExecuteSQLCommand(wchar* Command);
  /*[id(0x60010003)]*/ int CreateJetDatabase(wchar* Path);
  /*[id(0x60010004)]*/ int CloseJetDatabase();
  /*[id(0x60010005)]*/ int UpgradeDatabase();
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

interface IRequestHandler : IDispatch {
  mixin(uuid("6bc096aa-0ce6-11d1-baae-00c04fc2e20d"));
  // static DWINGUID IID = { 0x6bc096aa, 0x0ce6, 0x11d1, 0xba, 0xae, 0x00, 0xc0, 0x4f, 0xc2, 0xe2, 0x0d };
  /*[id(0x00000001)]*/ int OnRequest(IRequest pRequest);
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
