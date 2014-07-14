// RDCClientHost 1.0 Type Library
// Version 1.0

/*[uuid("97917068-bb0b-4dda-8067-b1a00c890f44")]*/
//module dwin.sys.win32.com.tlb.more.rdcclienthost;
module dwin.sys.win32.com.tlb.more.rdchost;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// _ISAFRemoteDesktopDataChannelEvents Interface
interface _ISAFRemoteDesktopDataChannelEvents : IDispatch {
  mixin(uuid("59ae79bc-9721-42df-9396-9d98e7f7a396"));
  // static DWINGUID IID = { 0x59ae79bc, 0x9721, 0x42df, 0x93, 0x96, 0x9d, 0x98, 0xe7, 0xf7, 0xa3, 0x96 };
  /+// method ChannelDataReady
  /*[id(0x00000001)]*/ void ChannelDataReady(wchar* channelName);+/
}

// ISAFRemoteDesktopClientHost Interface
interface ISAFRemoteDesktopClientHost : IDispatch {
  mixin(uuid("69de5bf3-5eb9-4158-81da-6fd662bbdddd"));
  // static DWINGUID IID = { 0x69de5bf3, 0x5eb9, 0x4158, 0x81, 0xda, 0x6f, 0xd6, 0x62, 0xbb, 0xdd, 0xdd };
  // method GetRemoteDesktopClient
  /*[id(0x00000001)]*/ int GetRemoteDesktopClient(out ISAFRemoteDesktopClient client);
}

// ISAFRemoteDesktopClient Interface
interface ISAFRemoteDesktopClient : IDispatch {
  mixin(uuid("8aa5f108-2918-435c-88aa-de0afee51440"));
  // static DWINGUID IID = { 0x8aa5f108, 0x2918, 0x435c, 0x88, 0xaa, 0xde, 0x0a, 0xfe, 0xe5, 0x14, 0x40 };
  // ChannelManager
  /*[id(0x00000001)]*/ int get_ChannelManager(out ISAFRemoteDesktopChannelMgr mgr);
  // ConnectParms
  /*[id(0x00000002)]*/ int set_ConnectParms(wchar* parms);
  // ConnectParms
  /*[id(0x00000002)]*/ int get_ConnectParms(out wchar* parms);
  // method ConnectToServer
  /*[id(0x00000003)]*/ int ConnectToServer(wchar* expertBlob);
  // method ConnectRemoteDesktop
  /*[id(0x00000004)]*/ int ConnectRemoteDesktop();
  // method DisconnectRemoteDesktop
  /*[id(0x00000005)]*/ int DisconnectRemoteDesktop();
  // property IsRemoteDesktopConnected
  /*[id(0x00000006)]*/ int get_IsRemoteDesktopConnected(out int pVal);
  // property IsServerConnected
  /*[id(0x00000007)]*/ int get_IsServerConnected(out int pVal);
  // method DisconnectFromServer
  /*[id(0x00000008)]*/ int DisconnectFromServer();
  // OnConnected
  /*[id(0x00000009)]*/ int set_OnConnected(IDispatch value);
  // OnDisconnected
  /*[id(0x0000000A)]*/ int set_OnDisconnected(IDispatch value);
  // OnConnectRemoteDesktopComplete
  /*[id(0x0000000B)]*/ int set_OnConnectRemoteDesktopComplete(IDispatch value);
  // ExtendedErrorInfo
  /*[id(0x0000000C)]*/ int get_ExtendedErrorInfo(out int error);
  // EnableSmartSizing
  /*[id(0x0000000D)]*/ int set_EnableSmartSizing(int val);
  // EnableSmartSizing
  /*[id(0x0000000D)]*/ int get_EnableSmartSizing(out int val);
  // ConnectedServer
  /*[id(0x0000000E)]*/ int get_ConnectedServer(out wchar* val);
  // ConnectedPort
  /*[id(0x0000000F)]*/ int get_ConnectedPort(out int val);
  // CreateListenEndpoint
  /*[id(0x00000010)]*/ int CreateListenEndpoint(int port, out wchar* pConnectParm);
  // StartListen
  /*[id(0x00000011)]*/ int StartListen(int timeout);
  // AcceptListenConnection
  /*[id(0x00000012)]*/ int AcceptListenConnection(wchar* expertBlob);
  // StopListen
  /*[id(0x00000013)]*/ int StopListen();
  // OnListenConnect
  /*[id(0x00000014)]*/ int set_OnListenConnect(IDispatch value);
  // ColorDepth
  /*[id(0x00000015)]*/ int set_ColorDepth(int val);
  // ColorDepth
  /*[id(0x00000015)]*/ int get_ColorDepth(out int val);
  // OnBeginConnect
  /*[id(0x00000016)]*/ int set_OnBeginConnect(IDispatch value);
}

// ISAFRemoteDesktopChannelMgr Interface
interface ISAFRemoteDesktopChannelMgr : IDispatch {
  mixin(uuid("8e6e0954-33ce-4945-acf7-6728d23b2067"));
  // static DWINGUID IID = { 0x8e6e0954, 0x33ce, 0x4945, 0xac, 0xf7, 0x67, 0x28, 0xd2, 0x3b, 0x20, 0x67 };
  // method OpenDataChannel
  /*[id(0x00000001)]*/ int OpenDataChannel(wchar* name, out ISAFRemoteDesktopDataChannel channel);
}

// ISAFRemoteDesktopDataChannel Interface
interface ISAFRemoteDesktopDataChannel : IDispatch {
  mixin(uuid("64976fae-b108-4095-8e59-5874e00e562a"));
  // static DWINGUID IID = { 0x64976fae, 0xb108, 0x4095, 0x8e, 0x59, 0x58, 0x74, 0xe0, 0x0e, 0x56, 0x2a };
  // ChannelName
  /*[id(0x00000001)]*/ int get_channelName(out wchar* name);
  // OnChannelDataReady
  /*[id(0x00000002)]*/ int set_OnChannelDataReady(IDispatch value);
  // method SendChannelData
  /*[id(0x00000003)]*/ int SendChannelData(wchar* data);
  // method ReceiveChannelData
  /*[id(0x00000004)]*/ int ReceiveChannelData(out wchar* data);
}

// _ISAFRemoteDesktopClientEvents Interface
interface _ISAFRemoteDesktopClientEvents : IDispatch {
  mixin(uuid("327a98f6-b337-43b0-a3de-408b46e6c4ce"));
  // static DWINGUID IID = { 0x327a98f6, 0xb337, 0x43b0, 0xa3, 0xde, 0x40, 0x8b, 0x46, 0xe6, 0xc4, 0xce };
  /+// method Connected
  /*[id(0x00000002)]*/ void Connected();+/
  /+// method Disconnected
  /*[id(0x00000003)]*/ void Disconnected(int reason);+/
  /+// method RemoteControlRequestComplete
  /*[id(0x00000004)]*/ void RemoteControlRequestComplete(int status);+/
  /+// method ListenConnect
  /*[id(0x00000005)]*/ void ListenConnect(int status);+/
  /+// method BeginConnect
  /*[id(0x00000006)]*/ void BeginConnect();+/
}

// _IDataChannelIOEvents Interface
interface _IDataChannelIOEvents : IDispatch {
  mixin(uuid("85c037e5-743f-4938-936b-a8db95430391"));
  // static DWINGUID IID = { 0x85c037e5, 0x743f, 0x4938, 0x93, 0x6b, 0xa8, 0xdb, 0x95, 0x43, 0x03, 0x91 };
  /+// method DataReady
  /*[id(0x00000001)]*/ void DataReady(wchar* data);+/
}

// ISAFRemoteDesktopTestExtension Interface
interface ISAFRemoteDesktopTestExtension : IDispatch {
  mixin(uuid("5c7a32ef-1c77-4f35-8fba-729dd2de7222"));
  // static DWINGUID IID = { 0x5c7a32ef, 0x1c77, 0x4f35, 0x8f, 0xba, 0x72, 0x9d, 0xd2, 0xde, 0x72, 0x22 };
  // property TestExtDllName
  /*[id(0x00000001)]*/ int set_TestExtDllName(wchar* value);
  // property TestExtParams
  /*[id(0x00000002)]*/ int set_TestExtParams(wchar* value);
}

// CoClasses

// RemoteDesktopClientHost Class
abstract class SAFRemoteDesktopClientHost {
  mixin(uuid("299be050-e83e-4db7-a7da-d86fdebfe6d0"));
  // static DWINGUID CLSID = { 0x299be050, 0xe83e, 0x4db7, 0xa7, 0xda, 0xd8, 0x6f, 0xde, 0xbf, 0xe6, 0xd0 };
  mixin Interfaces!(ISAFRemoteDesktopClientHost);
}

// ClientDataChannel Class
abstract class ClientDataChannel {
  mixin(uuid("c91c2a81-8b14-4a96-a5db-4640f551f3ee"));
  // static DWINGUID CLSID = { 0xc91c2a81, 0x8b14, 0x4a96, 0xa5, 0xdb, 0x46, 0x40, 0xf5, 0x51, 0xf3, 0xee };
  mixin Interfaces!(ISAFRemoteDesktopDataChannel);
}

// ClientRemoteDesktopChannelMgr Class
abstract class ClientRemoteDesktopChannelMgr {
  mixin(uuid("078bb428-fa9b-43f1-b002-1abf3a8c95cf"));
  // static DWINGUID CLSID = { 0x078bb428, 0xfa9b, 0x43f1, 0xb0, 0x02, 0x1a, 0xbf, 0x3a, 0x8c, 0x95, 0xcf };
  mixin Interfaces!(ISAFRemoteDesktopChannelMgr);
}

// RemoteDesktopClient Class
abstract class SAFRemoteDesktopClient {
  mixin(uuid("b90d0115-3aea-45d3-801e-93913008d49e"));
  // static DWINGUID CLSID = { 0xb90d0115, 0x3aea, 0x45d3, 0x80, 0x1e, 0x93, 0x91, 0x30, 0x08, 0xd4, 0x9e };
  mixin Interfaces!(ISAFRemoteDesktopClient, ISAFRemoteDesktopTestExtension);
}

// TSRDPRemoteDesktopClient Class
abstract class TSRDPRemoteDesktopClient {
  mixin(uuid("f137e241-0092-4575-976a-d3e33980bb26"));
  // static DWINGUID CLSID = { 0xf137e241, 0x0092, 0x4575, 0x97, 0x6a, 0xd3, 0xe3, 0x39, 0x80, 0xbb, 0x26 };
  mixin Interfaces!(ISAFRemoteDesktopClient, ISAFRemoteDesktopTestExtension);
}
