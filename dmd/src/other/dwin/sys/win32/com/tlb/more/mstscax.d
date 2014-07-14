// Microsoft Terminal Services Active Client 1.0 Type Library
// Version 1.0

/*[uuid("8c11efa1-92c3-11d1-bc1e-00c04fa31489")]*/
//module dwin.sys.win32.com.tlb.more.mstsc;
module dwin.sys.win32.com.tlb.more.mstscax;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum __MIDL___MIDL_itf_mstsax_0267_0001 {
  autoReconnectContinueAutomatic = 0x00000000,
  autoReconnectContinueStop = 0x00000001,
  autoReconnectContinueManual = 0x00000002,
}

enum __MIDL_IMsRdpClient_0001 {
  exDiscReasonNoInfo = 0x00000000,
  exDiscReasonAPIInitiatedDisconnect = 0x00000001,
  exDiscReasonAPIInitiatedLogoff = 0x00000002,
  exDiscReasonServerIdleTimeout = 0x00000003,
  exDiscReasonServerLogonTimeout = 0x00000004,
  exDiscReasonReplacedByOtherConnection = 0x00000005,
  exDiscReasonOutOfMemory = 0x00000006,
  exDiscReasonServerDeniedConnection = 0x00000007,
  exDiscReasonLicenseInternal = 0x00000100,
  exDiscReasonLicenseNoLicenseServer = 0x00000101,
  exDiscReasonLicenseNoLicense = 0x00000102,
  exDiscReasonLicenseErrClientMsg = 0x00000103,
  exDiscReasonLicenseHwidDoesntMatchLicense = 0x00000104,
  exDiscReasonLicenseErrClientLicense = 0x00000105,
  exDiscReasonLicenseCantFinishProtocol = 0x00000106,
  exDiscReasonLicenseClientEndedProtocol = 0x00000107,
  exDiscReasonLicenseErrClientEncryption = 0x00000108,
  exDiscReasonLicenseCantUpgradeLicense = 0x00000109,
  exDiscReasonLicenseNoRemoteConnections = 0x0000010A,
  exDiscReasonProtocolRangeStart = 0x00001000,
  exDiscReasonProtocolRangeEnd = 0x00007FFF,
}

enum __MIDL_IMsRdpClient_0002 {
  controlCloseCanProceed = 0x00000000,
  controlCloseWaitForEvents = 0x00000001,
}

// Aliases

alias __MIDL___MIDL_itf_mstsax_0267_0001 AutoReconnectContinueState;

alias __MIDL_IMsRdpClient_0001 ExtendedDisconnectReasonCode;

alias __MIDL_IMsRdpClient_0002 ControlCloseStatus;

alias uint UINT_PTR;

alias int LONG_PTR;

// Interfaces

// IMsTscAxEvents Interface
interface IMsTscAxEvents : IDispatch {
  mixin(uuid("336d5562-efa8-482e-8cb3-c5c0fc7a7db6"));
  // static DWINGUID IID = { 0x336d5562, 0xefa8, 0x482e, 0x8c, 0xb3, 0xc5, 0xc0, 0xfc, 0x7a, 0x7d, 0xb6 };
  /+/*[id(0x00000001)]*/ void OnConnecting();+/
  /+/*[id(0x00000002)]*/ void OnConnected();+/
  /+/*[id(0x00000003)]*/ void OnLoginComplete();+/
  /+/*[id(0x00000004)]*/ void OnDisconnected(int discReason);+/
  /+/*[id(0x00000005)]*/ void OnEnterFullScreenMode();+/
  /+/*[id(0x00000006)]*/ void OnLeaveFullScreenMode();+/
  /+/*[id(0x00000007)]*/ void OnChannelReceivedData(wchar* chanName, wchar* data);+/
  /+/*[id(0x00000008)]*/ void OnRequestGoFullScreen();+/
  /+/*[id(0x00000009)]*/ void OnRequestLeaveFullScreen();+/
  /+/*[id(0x0000000A)]*/ void OnFatalError(int errorCode);+/
  /+/*[id(0x0000000B)]*/ void OnWarning(int warningCode);+/
  /+/*[id(0x0000000C)]*/ void OnRemoteDesktopSizeChange(int width, int height);+/
  /+/*[id(0x0000000D)]*/ void OnIdleTimeoutNotification();+/
  /+/*[id(0x0000000E)]*/ void OnRequestContainerMinimize();+/
  /+/*[id(0x0000000F)]*/ void OnConfirmClose(out short pfAllowClose);+/
  /+/*[id(0x00000010)]*/ void OnReceivedTSPublicKey(wchar* publicKey, out short pfContinueLogon);+/
  /+/*[id(0x00000011)]*/ void OnAutoReconnecting(int disconnectReason, int attemptCount, out AutoReconnectContinueState pArcContinueStatus);+/
}

// IMsRdpClient Interface
interface IMsRdpClient : IMsTscAx {
  mixin(uuid("92b4a539-7115-4b7c-a5a9-e5d9efc2780a"));
  // static DWINGUID IID = { 0x92b4a539, 0x7115, 0x4b7c, 0xa5, 0xa9, 0xe5, 0xd9, 0xef, 0xc2, 0x78, 0x0a };
  // property ColorDepth
  /*[id(0x00000064)]*/ int set_ColorDepth(int pcolorDepth);
  // property ColorDepth
  /*[id(0x00000064)]*/ int get_ColorDepth(out int pcolorDepth);
  // propery get advanced settings2
  /*[id(0x00000065)]*/ int get_AdvancedSettings2(out IMsRdpClientAdvancedSettings ppAdvSettings);
  // propery get secured settings2
  /*[id(0x00000066)]*/ int get_SecuredSettings2(out IMsRdpClientSecuredSettings ppSecuredSettings);
  // property get extended disconnect reason
  /*[id(0x00000067)]*/ int get_ExtendedDisconnectReason(out ExtendedDisconnectReasonCode pExtendedDisconnectReason);
  // propery full screen
  /*[id(0x00000068)]*/ int set_FullScreen(short pfFullScreen);
  // propery full screen
  /*[id(0x00000068)]*/ int get_FullScreen(out short pfFullScreen);
  // Method SetVirtualChannelOptions(chan name, options)
  /*[id(0x00000023)]*/ int SetVirtualChannelOptions(wchar* chanName, int chanOptions);
  // Method GetVirtualChannelOptions(chan name, options)
  /*[id(0x00000024)]*/ int GetVirtualChannelOptions(wchar* chanName, out int pChanOptions);
  // Method RequestClose()
  /*[id(0x00000025)]*/ int RequestClose(out ControlCloseStatus pCloseStatus);
}

// IMsTscAx Interface
interface IMsTscAx : IDispatch {
  mixin(uuid("8c11efae-92c3-11d1-bc1e-00c04fa31489"));
  // static DWINGUID IID = { 0x8c11efae, 0x92c3, 0x11d1, 0xbc, 0x1e, 0x00, 0xc0, 0x4f, 0xa3, 0x14, 0x89 };
  // property Server
  /*[id(0x00000001)]*/ int set_Server(wchar* pServer);
  // property Server
  /*[id(0x00000001)]*/ int get_Server(out wchar* pServer);
  // property Domain
  /*[id(0x00000002)]*/ int set_Domain(wchar* pDomain);
  // property Domain
  /*[id(0x00000002)]*/ int get_Domain(out wchar* pDomain);
  // property UserName
  /*[id(0x00000003)]*/ int set_UserName(wchar* pUserName);
  // property UserName
  /*[id(0x00000003)]*/ int get_UserName(out wchar* pUserName);
  // property DisconnectedText
  /*[id(0x00000004)]*/ int set_DisconnectedText(wchar* pDisconnectedText);
  // property DisconnectedText
  /*[id(0x00000004)]*/ int get_DisconnectedText(out wchar* pDisconnectedText);
  // property ConnectingText
  /*[id(0x00000005)]*/ int set_ConnectingText(wchar* pConnectingText);
  // property ConnectingText
  /*[id(0x00000005)]*/ int get_ConnectingText(out wchar* pConnectingText);
  // property Connected
  /*[id(0x00000006)]*/ int get_Connected(out short pIsConnected);
  // propery Desktop width
  /*[id(0x0000000C)]*/ int set_DesktopWidth(int pVal);
  // propery Desktop width
  /*[id(0x0000000C)]*/ int get_DesktopWidth(out int pVal);
  // propery Desktop Height
  /*[id(0x0000000D)]*/ int set_DesktopHeight(int pVal);
  // propery Desktop Height
  /*[id(0x0000000D)]*/ int get_DesktopHeight(out int pVal);
  // propery start connected
  /*[id(0x00000010)]*/ int set_StartConnected(int pfStartConnected);
  // propery start connected
  /*[id(0x00000010)]*/ int get_StartConnected(out int pfStartConnected);
  // propery HorizontalScrollBarVisible
  /*[id(0x00000011)]*/ int get_HorizontalScrollBarVisible(out int pfHScrollVisible);
  // propery VerticalScrollBarVisible
  /*[id(0x00000012)]*/ int get_VerticalScrollBarVisible(out int pfVScrollVisible);
  // propery FullScreenTitle
  /*[id(0x00000013)]*/ int set_FullScreenTitle(wchar* value);
  // propery CipherStrength
  /*[id(0x00000014)]*/ int get_CipherStrength(out int pCipherStrength);
  // propery Version
  /*[id(0x00000015)]*/ int get_Version(out wchar* pVersion);
  // propery SecuredSettingsEnabled
  /*[id(0x00000016)]*/ int get_SecuredSettingsEnabled(out int pSecuredSettingsEnabled);
  // propery get secured settings
  /*[id(0x00000061)]*/ int get_SecuredSettings(out IMsTscSecuredSettings ppSecuredSettings);
  // propery get advanced settings
  /*[id(0x00000062)]*/ int get_AdvancedSettings(out IMsTscAdvancedSettings ppAdvSettings);
  // propery get debugger interface
  /*[id(0x00000063)]*/ int get_Debugger(out IMsTscDebug ppDebugger);
  // Method Connect
  /*[id(0x0000001E)]*/ int Connect();
  // Method Disconnect
  /*[id(0x0000001F)]*/ int Disconnect();
  // Method  CreateVirtualChannels
  /*[id(0x00000021)]*/ int CreateVirtualChannels(wchar* newVal);
  // Method  SendOnVirtualChannel(chan name, data)
  /*[id(0x00000022)]*/ int SendOnVirtualChannel(wchar* chanName, wchar* ChanData);
}

// IMsTscSecuredSettings Interface
interface IMsTscSecuredSettings : IDispatch {
  mixin(uuid("c9d65442-a0f9-45b2-8f73-d61d2db8cbb6"));
  // static DWINGUID IID = { 0xc9d65442, 0xa0f9, 0x45b2, 0x8f, 0x73, 0xd6, 0x1d, 0x2d, 0xb8, 0xcb, 0xb6 };
  // property StartProgram
  /*[id(0x00000001)]*/ int set_StartProgram(wchar* pStartProgram);
  // property StartProgram
  /*[id(0x00000001)]*/ int get_StartProgram(out wchar* pStartProgram);
  // property Working Directory
  /*[id(0x00000002)]*/ int set_WorkDir(wchar* pWorkDir);
  // property Working Directory
  /*[id(0x00000002)]*/ int get_WorkDir(out wchar* pWorkDir);
  // propery full screen mode
  /*[id(0x00000003)]*/ int set_FullScreen(int pfFullScreen);
  // propery full screen mode
  /*[id(0x00000003)]*/ int get_FullScreen(out int pfFullScreen);
}

// IMsTscAdvancedSettings Interface
interface IMsTscAdvancedSettings : IDispatch {
  mixin(uuid("809945cc-4b3b-4a92-a6b0-dbf9b5f2ef2d"));
  // static DWINGUID IID = { 0x809945cc, 0x4b3b, 0x4a92, 0xa6, 0xb0, 0xdb, 0xf9, 0xb5, 0xf2, 0xef, 0x2d };
  // property Compress
  /*[id(0x00000079)]*/ int set_Compress(int pcompress);
  // property Compress
  /*[id(0x00000079)]*/ int get_Compress(out int pcompress);
  // property BitmapPeristence
  /*[id(0x0000007A)]*/ int set_BitmapPeristence(int pbitmapPeristence);
  // property BitmapPeristence
  /*[id(0x0000007A)]*/ int get_BitmapPeristence(out int pbitmapPeristence);
  // property allowBackgroundInput
  /*[id(0x000000A1)]*/ int set_allowBackgroundInput(int pallowBackgroundInput);
  // property allowBackgroundInput
  /*[id(0x000000A1)]*/ int get_allowBackgroundInput(out int pallowBackgroundInput);
  // property KeyBoardLayoutStr
  /*[id(0x000000A2)]*/ int set_KeyBoardLayoutStr(wchar* value);
  // property PluginDlls
  /*[id(0x000000AA)]*/ int set_PluginDlls(wchar* value);
  // property IconFile
  /*[id(0x000000AB)]*/ int set_IconFile(wchar* value);
  // property IconIndex
  /*[id(0x000000AC)]*/ int set_IconIndex(int value);
  // property ContainerHandledFullScreen
  /*[id(0x000000AD)]*/ int set_ContainerHandledFullScreen(int pContainerHandledFullScreen);
  // property ContainerHandledFullScreen
  /*[id(0x000000AD)]*/ int get_ContainerHandledFullScreen(out int pContainerHandledFullScreen);
  // property DisableRdpdr
  /*[id(0x000000AE)]*/ int set_DisableRdpdr(int pDisableRdpdr);
  // property DisableRdpdr
  /*[id(0x000000AE)]*/ int get_DisableRdpdr(out int pDisableRdpdr);
}

// IMsTscDebug Interface
interface IMsTscDebug : IDispatch {
  mixin(uuid("209d0eb9-6254-47b1-9033-a98dae55bb27"));
  // static DWINGUID IID = { 0x209d0eb9, 0x6254, 0x47b1, 0x90, 0x33, 0xa9, 0x8d, 0xae, 0x55, 0xbb, 0x27 };
  // property HatchBitmapPDU
  /*[id(0x000000C8)]*/ int set_HatchBitmapPDU(int phatchBitmapPDU);
  // property HatchBitmapPDU
  /*[id(0x000000C8)]*/ int get_HatchBitmapPDU(out int phatchBitmapPDU);
  // property HatchSSBOrder
  /*[id(0x000000C9)]*/ int set_HatchSSBOrder(int phatchSSBOrder);
  // property HatchSSBOrder
  /*[id(0x000000C9)]*/ int get_HatchSSBOrder(out int phatchSSBOrder);
  // property HatchMembltOrder
  /*[id(0x000000CA)]*/ int set_HatchMembltOrder(int phatchMembltOrder);
  // property HatchMembltOrder
  /*[id(0x000000CA)]*/ int get_HatchMembltOrder(out int phatchMembltOrder);
  // property HatchIndexPDU
  /*[id(0x000000CB)]*/ int set_HatchIndexPDU(int phatchIndexPDU);
  // property HatchIndexPDU
  /*[id(0x000000CB)]*/ int get_HatchIndexPDU(out int phatchIndexPDU);
  // property LabelMemblt
  /*[id(0x000000CC)]*/ int set_LabelMemblt(int plabelMemblt);
  // property LabelMemblt
  /*[id(0x000000CC)]*/ int get_LabelMemblt(out int plabelMemblt);
  // property BitmapCacheMonitor
  /*[id(0x000000CD)]*/ int set_BitmapCacheMonitor(int pbitmapCacheMonitor);
  // property BitmapCacheMonitor
  /*[id(0x000000CD)]*/ int get_BitmapCacheMonitor(out int pbitmapCacheMonitor);
  // property MallocFailuresPercent
  /*[id(0x000000CE)]*/ int set_MallocFailuresPercent(int pmallocFailuresPercent);
  // property MallocFailuresPercent
  /*[id(0x000000CE)]*/ int get_MallocFailuresPercent(out int pmallocFailuresPercent);
  // property MallocHugeFailuresPercent
  /*[id(0x000000CF)]*/ int set_MallocHugeFailuresPercent(int pmallocHugeFailuresPercent);
  // property MallocHugeFailuresPercent
  /*[id(0x000000CF)]*/ int get_MallocHugeFailuresPercent(out int pmallocHugeFailuresPercent);
  // property NetThroughput
  /*[id(0x000000D0)]*/ int set_NetThroughput(int NetThroughput);
  // property NetThroughput
  /*[id(0x000000D0)]*/ int get_NetThroughput(out int NetThroughput);
  // property CLXCmdLine
  /*[id(0x000000D1)]*/ int set_CLXCmdLine(wchar* pCLXCmdLine);
  // property CLXCmdLine
  /*[id(0x000000D1)]*/ int get_CLXCmdLine(out wchar* pCLXCmdLine);
  // property CLXDll
  /*[id(0x000000D2)]*/ int set_CLXDll(wchar* pCLXDll);
  // property CLXDll
  /*[id(0x000000D2)]*/ int get_CLXDll(out wchar* pCLXDll);
}

// IMsRdpClientAdvancedSettings Interface
interface IMsRdpClientAdvancedSettings : IMsTscAdvancedSettings {
  mixin(uuid("3c65b4ab-12b3-465b-acd4-b8dad3bff9e2"));
  // static DWINGUID IID = { 0x3c65b4ab, 0x12b3, 0x465b, 0xac, 0xd4, 0xb8, 0xda, 0xd3, 0xbf, 0xf9, 0xe2 };
  // property SmoothScroll
  /*[id(0x00000065)]*/ int set_SmoothScroll(int psmoothScroll);
  // property SmoothScroll
  /*[id(0x00000065)]*/ int get_SmoothScroll(out int psmoothScroll);
  // property AcceleratorPassthrough
  /*[id(0x00000066)]*/ int set_AcceleratorPassthrough(int pacceleratorPassthrough);
  // property AcceleratorPassthrough
  /*[id(0x00000066)]*/ int get_AcceleratorPassthrough(out int pacceleratorPassthrough);
  // property ShadowBitmap
  /*[id(0x00000067)]*/ int set_ShadowBitmap(int pshadowBitmap);
  // property ShadowBitmap
  /*[id(0x00000067)]*/ int get_ShadowBitmap(out int pshadowBitmap);
  // property TransportType
  /*[id(0x00000068)]*/ int set_TransportType(int ptransportType);
  // property TransportType
  /*[id(0x00000068)]*/ int get_TransportType(out int ptransportType);
  // property SasSequence
  /*[id(0x00000069)]*/ int set_SasSequence(int psasSequence);
  // property SasSequence
  /*[id(0x00000069)]*/ int get_SasSequence(out int psasSequence);
  // property EncryptionEnabled
  /*[id(0x0000006A)]*/ int set_EncryptionEnabled(int pencryptionEnabled);
  // property EncryptionEnabled
  /*[id(0x0000006A)]*/ int get_EncryptionEnabled(out int pencryptionEnabled);
  // property DedicatedTerminal
  /*[id(0x0000006B)]*/ int set_DedicatedTerminal(int pdedicatedTerminal);
  // property DedicatedTerminal
  /*[id(0x0000006B)]*/ int get_DedicatedTerminal(out int pdedicatedTerminal);
  // property RDPPort
  /*[id(0x0000006C)]*/ int set_RDPPort(int prdpPort);
  // property RDPPort
  /*[id(0x0000006C)]*/ int get_RDPPort(out int prdpPort);
  // property EnableMouse
  /*[id(0x0000006D)]*/ int set_EnableMouse(int penableMouse);
  // property EnableMouse
  /*[id(0x0000006D)]*/ int get_EnableMouse(out int penableMouse);
  // property DisableCtrlAltDel
  /*[id(0x0000006E)]*/ int set_DisableCtrlAltDel(int pdisableCtrlAltDel);
  // property DisableCtrlAltDel
  /*[id(0x0000006E)]*/ int get_DisableCtrlAltDel(out int pdisableCtrlAltDel);
  // property EnableWindowsKey
  /*[id(0x0000006F)]*/ int set_EnableWindowsKey(int penableWindowsKey);
  // property EnableWindowsKey
  /*[id(0x0000006F)]*/ int get_EnableWindowsKey(out int penableWindowsKey);
  // property DoubleClickDetect
  /*[id(0x00000070)]*/ int set_DoubleClickDetect(int pdoubleClickDetect);
  // property DoubleClickDetect
  /*[id(0x00000070)]*/ int get_DoubleClickDetect(out int pdoubleClickDetect);
  // property MaximizeShell
  /*[id(0x00000071)]*/ int set_MaximizeShell(int pmaximizeShell);
  // property MaximizeShell
  /*[id(0x00000071)]*/ int get_MaximizeShell(out int pmaximizeShell);
  // property HotKeyFullScreen
  /*[id(0x00000072)]*/ int set_HotKeyFullScreen(int photKeyFullScreen);
  // property HotKeyFullScreen
  /*[id(0x00000072)]*/ int get_HotKeyFullScreen(out int photKeyFullScreen);
  // property HotKeyCtrlEsc
  /*[id(0x00000073)]*/ int set_HotKeyCtrlEsc(int photKeyCtrlEsc);
  // property HotKeyCtrlEsc
  /*[id(0x00000073)]*/ int get_HotKeyCtrlEsc(out int photKeyCtrlEsc);
  // property HotKeyAltEsc
  /*[id(0x00000074)]*/ int set_HotKeyAltEsc(int photKeyAltEsc);
  // property HotKeyAltEsc
  /*[id(0x00000074)]*/ int get_HotKeyAltEsc(out int photKeyAltEsc);
  // property HotKeyAltTab
  /*[id(0x00000075)]*/ int set_HotKeyAltTab(int photKeyAltTab);
  // property HotKeyAltTab
  /*[id(0x00000075)]*/ int get_HotKeyAltTab(out int photKeyAltTab);
  // property HotKeyAltShiftTab
  /*[id(0x00000076)]*/ int set_HotKeyAltShiftTab(int photKeyAltShiftTab);
  // property HotKeyAltShiftTab
  /*[id(0x00000076)]*/ int get_HotKeyAltShiftTab(out int photKeyAltShiftTab);
  // property HotKeyAltSpace
  /*[id(0x00000077)]*/ int set_HotKeyAltSpace(int photKeyAltSpace);
  // property HotKeyAltSpace
  /*[id(0x00000077)]*/ int get_HotKeyAltSpace(out int photKeyAltSpace);
  // property HotKeyCtrlAltDel
  /*[id(0x00000078)]*/ int set_HotKeyCtrlAltDel(int photKeyCtrlAltDel);
  // property HotKeyCtrlAltDel
  /*[id(0x00000078)]*/ int get_HotKeyCtrlAltDel(out int photKeyCtrlAltDel);
  // property orderDrawThreshold
  /*[id(0x0000007B)]*/ int set_orderDrawThreshold(int porderDrawThreshold);
  // property orderDrawThreshold
  /*[id(0x0000007B)]*/ int get_orderDrawThreshold(out int porderDrawThreshold);
  // property BitmapCacheSize
  /*[id(0x0000007C)]*/ int set_BitmapCacheSize(int pbitmapCacheSize);
  // property BitmapCacheSize
  /*[id(0x0000007C)]*/ int get_BitmapCacheSize(out int pbitmapCacheSize);
  // property BitmapVirtualCacheSize
  /*[id(0x0000007D)]*/ int set_BitmapVirtualCacheSize(int pbitmapVirtualCacheSize);
  // property BitmapVirtualCacheSize
  /*[id(0x0000007D)]*/ int get_BitmapVirtualCacheSize(out int pbitmapVirtualCacheSize);
  // property ScaleBitmapCachesByBPP
  /*[id(0x000000AF)]*/ int set_ScaleBitmapCachesByBPP(int pbScale);
  // property ScaleBitmapCachesByBPP
  /*[id(0x000000AF)]*/ int get_ScaleBitmapCachesByBPP(out int pbScale);
  // property NumBitmapCaches
  /*[id(0x0000007E)]*/ int set_NumBitmapCaches(int pnumBitmapCaches);
  // property NumBitmapCaches
  /*[id(0x0000007E)]*/ int get_NumBitmapCaches(out int pnumBitmapCaches);
  // property CachePersistenceActive
  /*[id(0x0000007F)]*/ int set_CachePersistenceActive(int pcachePersistenceActive);
  // property CachePersistenceActive
  /*[id(0x0000007F)]*/ int get_CachePersistenceActive(out int pcachePersistenceActive);
  // property PersistCacheDirectory
  /*[id(0x0000008A)]*/ int set_PersistCacheDirectory(wchar* value);
  // property brushSupportLevel
  /*[id(0x0000009C)]*/ int set_brushSupportLevel(int pbrushSupportLevel);
  // property brushSupportLevel
  /*[id(0x0000009C)]*/ int get_brushSupportLevel(out int pbrushSupportLevel);
  // property minInputSendInterval
  /*[id(0x0000009D)]*/ int set_minInputSendInterval(int pminInputSendInterval);
  // property minInputSendInterval
  /*[id(0x0000009D)]*/ int get_minInputSendInterval(out int pminInputSendInterval);
  // property InputEventsAtOnce
  /*[id(0x0000009E)]*/ int set_InputEventsAtOnce(int pinputEventsAtOnce);
  // property InputEventsAtOnce
  /*[id(0x0000009E)]*/ int get_InputEventsAtOnce(out int pinputEventsAtOnce);
  // property maxEventCount
  /*[id(0x0000009F)]*/ int set_maxEventCount(int pmaxEventCount);
  // property maxEventCount
  /*[id(0x0000009F)]*/ int get_maxEventCount(out int pmaxEventCount);
  // property keepAliveInterval
  /*[id(0x000000A0)]*/ int set_keepAliveInterval(int pkeepAliveInterval);
  // property keepAliveInterval
  /*[id(0x000000A0)]*/ int get_keepAliveInterval(out int pkeepAliveInterval);
  // property shutdownTimeout
  /*[id(0x000000A3)]*/ int set_shutdownTimeout(int pshutdownTimeout);
  // property shutdownTimeout
  /*[id(0x000000A3)]*/ int get_shutdownTimeout(out int pshutdownTimeout);
  // property overallConnectionTimeout
  /*[id(0x000000A4)]*/ int set_overallConnectionTimeout(int poverallConnectionTimeout);
  // property overallConnectionTimeout
  /*[id(0x000000A4)]*/ int get_overallConnectionTimeout(out int poverallConnectionTimeout);
  // property singleConnectionTimeout
  /*[id(0x000000A5)]*/ int set_singleConnectionTimeout(int psingleConnectionTimeout);
  // property singleConnectionTimeout
  /*[id(0x000000A5)]*/ int get_singleConnectionTimeout(out int psingleConnectionTimeout);
  // property KeyboardType
  /*[id(0x000000A6)]*/ int set_KeyboardType(int pkeyboardType);
  // property KeyboardType
  /*[id(0x000000A6)]*/ int get_KeyboardType(out int pkeyboardType);
  // property KeyboardSubType
  /*[id(0x000000A7)]*/ int set_KeyboardSubType(int pkeyboardSubType);
  // property KeyboardSubType
  /*[id(0x000000A7)]*/ int get_KeyboardSubType(out int pkeyboardSubType);
  // property KeyboardFunctionKey
  /*[id(0x000000A8)]*/ int set_KeyboardFunctionKey(int pkeyboardFunctionKey);
  // property KeyboardFunctionKey
  /*[id(0x000000A8)]*/ int get_KeyboardFunctionKey(out int pkeyboardFunctionKey);
  // property WinceFixedPalette
  /*[id(0x000000A9)]*/ int set_WinceFixedPalette(int pwinceFixedPalette);
  // property WinceFixedPalette
  /*[id(0x000000A9)]*/ int get_WinceFixedPalette(out int pwinceFixedPalette);
  // property ConnectToServerConsole
  /*[id(0x000000B2)]*/ int set_ConnectToServerConsole(short pConnectToConsole);
  // property ConnectToServerConsole
  /*[id(0x000000B2)]*/ int get_ConnectToServerConsole(out short pConnectToConsole);
  // property BitmapPersistence
  /*[id(0x000000B6)]*/ int set_BitmapPersistence(int pbitmapPersistence);
  // property BitmapPersistence
  /*[id(0x000000B6)]*/ int get_BitmapPersistence(out int pbitmapPersistence);
  // property MinutesToIdleTimeout
  /*[id(0x000000B7)]*/ int set_MinutesToIdleTimeout(int pminutesToIdleTimeout);
  // property MinutesToIdleTimeout
  /*[id(0x000000B7)]*/ int get_MinutesToIdleTimeout(out int pminutesToIdleTimeout);
  // property SmartSizing
  /*[id(0x000000B8)]*/ int set_SmartSizing(short pfSmartSizing);
  // property SmartSizing
  /*[id(0x000000B8)]*/ int get_SmartSizing(out short pfSmartSizing);
  // property RDPDR Local Printing Doc Name
  /*[id(0x000000B9)]*/ int set_RdpdrLocalPrintingDocName(wchar* pLocalPrintingDocName);
  // property RDPDR Local Printing Doc Name
  /*[id(0x000000B9)]*/ int get_RdpdrLocalPrintingDocName(out wchar* pLocalPrintingDocName);
  // property RDPDR clean temp directory string
  /*[id(0x000000C9)]*/ int set_RdpdrClipCleanTempDirString(wchar* clipCleanTempDirString);
  // property RDPDR clean temp directory string
  /*[id(0x000000C9)]*/ int get_RdpdrClipCleanTempDirString(out wchar* clipCleanTempDirString);
  // property RDPDR clip paste string
  /*[id(0x000000CA)]*/ int set_RdpdrClipPasteInfoString(wchar* clipPasteInfoString);
  // property RDPDR clip paste string
  /*[id(0x000000CA)]*/ int get_RdpdrClipPasteInfoString(out wchar* clipPasteInfoString);
  // property clear text password (write only)
  /*[id(0x000000BA)]*/ int set_ClearTextPassword(wchar* value);
  // property DisplayConnectionBar
  /*[id(0x000000BB)]*/ int set_DisplayConnectionBar(short pDisplayConnectionBar);
  // property DisplayConnectionBar
  /*[id(0x000000BB)]*/ int get_DisplayConnectionBar(out short pDisplayConnectionBar);
  // property PinConnectionBar
  /*[id(0x000000BC)]*/ int set_PinConnectionBar(short pPinConnectionBar);
  // property PinConnectionBar
  /*[id(0x000000BC)]*/ int get_PinConnectionBar(out short pPinConnectionBar);
  // property GrabFocusOnConnect
  /*[id(0x000000BD)]*/ int set_GrabFocusOnConnect(short pfGrabFocusOnConnect);
  // property GrabFocusOnConnect
  /*[id(0x000000BD)]*/ int get_GrabFocusOnConnect(out short pfGrabFocusOnConnect);
  // property LoadBalanceInfo
  /*[id(0x000000BE)]*/ int set_LoadBalanceInfo(wchar* pLBInfo);
  // property LoadBalanceInfo
  /*[id(0x000000BE)]*/ int get_LoadBalanceInfo(out wchar* pLBInfo);
  // property RedirectDrives
  /*[id(0x000000BF)]*/ int set_RedirectDrives(short pRedirectDrives);
  // property RedirectDrives
  /*[id(0x000000BF)]*/ int get_RedirectDrives(out short pRedirectDrives);
  // property RedirectPrinters
  /*[id(0x000000C0)]*/ int set_RedirectPrinters(short pRedirectPrinters);
  // property RedirectPrinters
  /*[id(0x000000C0)]*/ int get_RedirectPrinters(out short pRedirectPrinters);
  // property RedirectPorts
  /*[id(0x000000C1)]*/ int set_RedirectPorts(short pRedirectPorts);
  // property RedirectPorts
  /*[id(0x000000C1)]*/ int get_RedirectPorts(out short pRedirectPorts);
  // property RedirectSmartCards
  /*[id(0x000000C2)]*/ int set_RedirectSmartCards(short pRedirectSmartCards);
  // property RedirectSmartCards
  /*[id(0x000000C2)]*/ int get_RedirectSmartCards(out short pRedirectSmartCards);
  // property BitmapVirtualCache16BppSize
  /*[id(0x000000C3)]*/ int set_BitmapVirtualCache16BppSize(int pBitmapVirtualCache16BppSize);
  // property BitmapVirtualCache16BppSize
  /*[id(0x000000C3)]*/ int get_BitmapVirtualCache16BppSize(out int pBitmapVirtualCache16BppSize);
  // property BitmapVirtualCache24BppSize
  /*[id(0x000000C4)]*/ int set_BitmapVirtualCache24BppSize(int pBitmapVirtualCache24BppSize);
  // property BitmapVirtualCache24BppSize
  /*[id(0x000000C4)]*/ int get_BitmapVirtualCache24BppSize(out int pBitmapVirtualCache24BppSize);
  // property PerformanceFlags
  /*[id(0x000000C8)]*/ int set_PerformanceFlags(int pDisableList);
  // property PerformanceFlags
  /*[id(0x000000C8)]*/ int get_PerformanceFlags(out int pDisableList);
  // property ConnectWithEndpoint
  /*[id(0x000000CB)]*/ int set_ConnectWithEndpoint(DWINVARIANT* value);
  // property NotifyTSPublicKey
  /*[id(0x000000CC)]*/ int set_NotifyTSPublicKey(short pfNotify);
  // property NotifyTSPublicKey
  /*[id(0x000000CC)]*/ int get_NotifyTSPublicKey(out short pfNotify);
}

// IMsRdpClientSecuredSettings Interface
interface IMsRdpClientSecuredSettings : IMsTscSecuredSettings {
  mixin(uuid("605befcf-39c1-45cc-a811-068fb7be346d"));
  // static DWINGUID IID = { 0x605befcf, 0x39c1, 0x45cc, 0xa8, 0x11, 0x06, 0x8f, 0xb7, 0xbe, 0x34, 0x6d };
  // property KeyboardHookMode
  /*[id(0x00000004)]*/ int set_KeyboardHookMode(int pkeyboardHookMode);
  // property KeyboardHookMode
  /*[id(0x00000004)]*/ int get_KeyboardHookMode(out int pkeyboardHookMode);
  // property AudioRedirectionMode
  /*[id(0x00000005)]*/ int set_AudioRedirectionMode(int pAudioRedirectionMode);
  // property AudioRedirectionMode
  /*[id(0x00000005)]*/ int get_AudioRedirectionMode(out int pAudioRedirectionMode);
}

// IMsTscNonScriptable Interface
interface IMsTscNonScriptable : IUnknown {
  mixin(uuid("c1e6743a-41c1-4a74-832a-0dd06c1c7a0e"));
  // static DWINGUID IID = { 0xc1e6743a, 0x41c1, 0x4a74, 0x83, 0x2a, 0x0d, 0xd0, 0x6c, 0x1c, 0x7a, 0x0e };
  // property (set only) ClearTextPassword
  /*[id(0x00000001)]*/ int set_ClearTextPassword(wchar* value);
  // propterty PortablePassword
  /*[id(0x00000002)]*/ int set_PortablePassword(wchar* pPortablePass);
  // propterty PortablePassword
  /*[id(0x00000002)]*/ int get_PortablePassword(out wchar* pPortablePass);
  // propterty PortableSalt
  /*[id(0x00000003)]*/ int set_PortableSalt(wchar* pPortableSalt);
  // propterty PortableSalt
  /*[id(0x00000003)]*/ int get_PortableSalt(out wchar* pPortableSalt);
  // propterty BinaryPassword
  /*[id(0x00000004)]*/ int set_BinaryPassword(wchar* pBinaryPassword);
  // propterty BinaryPassword
  /*[id(0x00000004)]*/ int get_BinaryPassword(out wchar* pBinaryPassword);
  // property BinarySalt
  /*[id(0x00000005)]*/ int set_BinarySalt(wchar* pSalt);
  // property BinarySalt
  /*[id(0x00000005)]*/ int get_BinarySalt(out wchar* pSalt);
  // Method ResetPassword
  /*[id(0x0000000A)]*/ int ResetPassword();
}

// IMsRdpClientNonScriptable Interface
interface IMsRdpClientNonScriptable : IMsTscNonScriptable {
  mixin(uuid("2f079c4c-87b2-4afd-97ab-20cdb43038ae"));
  // static DWINGUID IID = { 0x2f079c4c, 0x87b2, 0x4afd, 0x97, 0xab, 0x20, 0xcd, 0xb4, 0x30, 0x38, 0xae };
  // Method NotifyRedirectDeviceChange(wParam, lParam)
  /*[id(0x0000000B)]*/ int NotifyRedirectDeviceChange(UINT_PTR wParam, LONG_PTR lParam);
  // Method SendKeys
  /*[id(0x0000000C)]*/ int SendKeys(int numKeys, short* pbArrayKeyUp, int* plKeyData);
}

// IMsRdpClient2 Interface
interface IMsRdpClient2 : IMsRdpClient {
  mixin(uuid("e7e17dc4-3b71-4ba7-a8e6-281ffadca28f"));
  // static DWINGUID IID = { 0xe7e17dc4, 0x3b71, 0x4ba7, 0xa8, 0xe6, 0x28, 0x1f, 0xfa, 0xdc, 0xa2, 0x8f };
  // propery get advanced settings3
  /*[id(0x000000C8)]*/ int get_AdvancedSettings3(out IMsRdpClientAdvancedSettings2 ppAdvSettings);
  // property ConnectedStatusText
  /*[id(0x000000C9)]*/ int set_ConnectedStatusText(wchar* pConnectedStatusText);
  // property ConnectedStatusText
  /*[id(0x000000C9)]*/ int get_ConnectedStatusText(out wchar* pConnectedStatusText);
}

// IMsRdpClientAdvancedSettings2 Interface
interface IMsRdpClientAdvancedSettings2 : IMsRdpClientAdvancedSettings {
  mixin(uuid("9ac42117-2b76-4320-aa44-0e616ab8437b"));
  // static DWINGUID IID = { 0x9ac42117, 0x2b76, 0x4320, 0xaa, 0x44, 0x0e, 0x61, 0x6a, 0xb8, 0x43, 0x7b };
  // property CanAutoReconnect
  /*[id(0x000000CD)]*/ int get_CanAutoReconnect(out short pfCanAutoReconnect);
  // property EnableAutoReconnect
  /*[id(0x000000CE)]*/ int set_EnableAutoReconnect(short pfEnableAutoReconnect);
  // property EnableAutoReconnect
  /*[id(0x000000CE)]*/ int get_EnableAutoReconnect(out short pfEnableAutoReconnect);
  // MaxReconnectAttempts sets number of times to try during autoreconnection
  /*[id(0x000000CF)]*/ int set_MaxReconnectAttempts(int pMaxReconnectAttempts);
  // MaxReconnectAttempts sets number of times to try during autoreconnection
  /*[id(0x000000CF)]*/ int get_MaxReconnectAttempts(out int pMaxReconnectAttempts);
}

// CoClasses

// Microsoft Terminal Services Client Control
abstract class MsTscAx {
  mixin(uuid("a41a4187-5a86-4e26-b40a-856f9035d9cb"));
  // static DWINGUID CLSID = { 0xa41a4187, 0x5a86, 0x4e26, 0xb4, 0x0a, 0x85, 0x6f, 0x90, 0x35, 0xd9, 0xcb };
  mixin Interfaces!(IMsRdpClient, IMsTscAx, IMsTscNonScriptable, IMsRdpClientNonScriptable);
}

// Microsoft RDP Client Control
abstract class MsRdpClient {
  mixin(uuid("7cacbd7b-0d99-468f-ac33-22e495c0afe5"));
  // static DWINGUID CLSID = { 0x7cacbd7b, 0x0d99, 0x468f, 0xac, 0x33, 0x22, 0xe4, 0x95, 0xc0, 0xaf, 0xe5 };
  mixin Interfaces!(IMsRdpClient, IMsTscAx, IMsTscNonScriptable, IMsRdpClientNonScriptable);
}

// Microsoft RDP Client Control
abstract class MsRdpClient2 {
  mixin(uuid("3523c2fb-4031-44e4-9a3b-f1e94986ee7f"));
  // static DWINGUID CLSID = { 0x3523c2fb, 0x4031, 0x44e4, 0x9a, 0x3b, 0xf1, 0xe9, 0x49, 0x86, 0xee, 0x7f };
  mixin Interfaces!(IMsRdpClient2, IMsRdpClient, IMsTscAx, IMsTscNonScriptable, IMsRdpClientNonScriptable);
}
