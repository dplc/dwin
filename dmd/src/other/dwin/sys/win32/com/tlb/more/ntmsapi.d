// RSM 1.0 Type Library
// Version 1.0

/*[uuid("d61a27c0-8f53-11d0-bfa0-00a024151983")]*/
//module dwin.sys.win32.com.tlb.more.rsm;
module dwin.sys.win32.com.tlb.more.rtmsapi;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Structs

struct _RSM_MESSAGE {
  DWINGUID* lpguidOperation;
  uint dwNtmsType;
  uint dwState;
  uint dwFlags;
  uint dwPriority;
  uint dwErrorCode;
  wchar* lpszComputerName;
  wchar* lpszApplication;
  wchar* lpszUser;
  wchar* lpszTimeSubmitted;
  wchar* lpszMessage;
}

// Aliases

alias uint ULONG_PTR;

// Interfaces

// INtms Session Interface
interface INtmsSession1 : IUnknown {
  mixin(uuid("8da03f40-3419-11d1-8fb1-00a024cb6019"));
  // static DWINGUID IID = { 0x8da03f40, 0x3419, 0x11d1, 0x8f, 0xb1, 0x00, 0xa0, 0x24, 0xcb, 0x60, 0x19 };
  /*[id(0x60010000)]*/ int OpenNtmsServerSessionW(wchar* lpServer, wchar* lpApplication, wchar* lpClientName, wchar* lpUserName, uint dwOptions);
  /*[id(0x60010001)]*/ int OpenNtmsServerSessionA(char* lpServer, char* lpApplication, char* lpClientName, char* lpUserName, uint dwOptions);
  /*[id(0x60010002)]*/ int CloseNtmsSession();
  /*[id(0x60010003)]*/ int SubmitNtmsOperatorRequestW(uint dwRequest, wchar* lpMessage, ref DWINGUID lpArg1Id, ref DWINGUID lpArg2Id, out DWINGUID lpRequestId);
  /*[id(0x60010004)]*/ int SubmitNtmsOperatorRequestA(uint dwRequest, char* lpMessage, ref DWINGUID lpArg1Id, ref DWINGUID lpArg2Id, out DWINGUID lpRequestId);
  /*[id(0x60010005)]*/ int WaitForNtmsOperatorRequest(ref DWINGUID lpRequestId, uint dwTimeout);
  /*[id(0x60010006)]*/ int CancelNtmsOperatorRequest(ref DWINGUID lpRequestId);
  /*[id(0x60010007)]*/ int SatisfyNtmsOperatorRequest(ref DWINGUID lpRequestId);
  /*[id(0x60010008)]*/ int ImportNtmsDatabase();
  /*[id(0x60010009)]*/ int ExportNtmsDatabase();
  /*[id(0x6001000A)]*/ int UseRpcNotification(ULONG_PTR Context, char* lpProtocol, char* lpEndpoint);
  /*[id(0x6001000B)]*/ int AddNotification(uint dwType);
  /*[id(0x6001000C)]*/ int RemoveNotification(uint dwType);
  /*[id(0x6001000D)]*/ int DispatchNotification(uint dwType, uint dwOperation, ref DWINGUID lpIdentifier);
}

// INtmsLinkage Interface
interface INtmsLinkage : IUnknown {
  mixin(uuid("785394b0-a9d8-11d0-87b3-00aa00c7f7c9"));
  // static DWINGUID IID = { 0x785394b0, 0xa9d8, 0x11d0, 0x87, 0xb3, 0x00, 0xaa, 0x00, 0xc7, 0xf7, 0xc9 };
  /*[id(0x60010000)]*/ int BottomLink();
}

// IMessenger Interface
interface IMessenger : IUnknown {
  mixin(uuid("081e7188-c080-4ff3-9238-29f66d6cabfd"));
  // static DWINGUID IID = { 0x081e7188, 0xc080, 0x4ff3, 0x92, 0x38, 0x29, 0xf6, 0x6d, 0x6c, 0xab, 0xfd };
  // method SendMessage
  /*[id(0x60010000)]*/ int SendMessage(_RSM_MESSAGE* lpRsmMessage);
  // method RecallMessage
  /*[id(0x60010001)]*/ int RecallMessage(ref DWINGUID lpGuid);
}

// INtmsNotifySink Interface
interface INtmsNotifySink : IUnknown {
  mixin(uuid("bb39332c-bfee-4380-ad8a-badc8aff5bb6"));
  // static DWINGUID IID = { 0xbb39332c, 0xbfee, 0x4380, 0xad, 0x8a, 0xba, 0xdc, 0x8a, 0xff, 0x5b, 0xb6 };
  // method ConnectCallback
  /*[id(0x60010000)]*/ int ConnectCallback(IUnknown pUnkCP, IUnknown pUnkSink);
  // method OnNotify
  /*[id(0x60010001)]*/ int OnNotify(uint dwType, uint dwOperation, ref DWINGUID lpIdentifier);
  // method ReleaseCallback
  /*[id(0x60010002)]*/ int ReleaseCallback();
}

// IClientSink Interface
interface IClientSink : IUnknown {
  mixin(uuid("879c8bbe-41b0-11d1-be11-00c04fb6bf70"));
  // static DWINGUID IID = { 0x879c8bbe, 0x41b0, 0x11d1, 0xbe, 0x11, 0x00, 0xc0, 0x4f, 0xb6, 0xbf, 0x70 };
  /*[id(0x60010000)]*/ int OnNotify(uint dwType, uint dwOperation, ref DWINGUID lpIdentifier);
}

// CoClasses

// Removable Storage Manager Class
abstract class CNtmsSvr {
  mixin(uuid("d61a27c6-8f53-11d0-bfa0-00a024151983"));
  // static DWINGUID CLSID = { 0xd61a27c6, 0x8f53, 0x11d0, 0xbf, 0xa0, 0x00, 0xa0, 0x24, 0x15, 0x19, 0x83 };
  mixin Interfaces!(INtmsSession1, INtmsLinkage);
}

// Removable Storage UI Class
abstract class CMessenger {
  mixin(uuid("2749c5cc-7e2c-4e08-8ab5-fbc064f3dd05"));
  // static DWINGUID CLSID = { 0x2749c5cc, 0x7e2c, 0x4e08, 0x8a, 0xb5, 0xfb, 0xc0, 0x64, 0xf3, 0xdd, 0x05 };
  mixin Interfaces!(IMessenger);
}

// Removable Storage Sink Class
abstract class CNtmsNotifySink {
  mixin(uuid("0022dfd7-0469-49ff-bdd4-192cb402f5c6"));
  // static DWINGUID CLSID = { 0x0022dfd7, 0x0469, 0x49ff, 0xbd, 0xd4, 0x19, 0x2c, 0xb4, 0x02, 0xf5, 0xc6 };
  mixin Interfaces!(INtmsNotifySink, IClientSink);
}
