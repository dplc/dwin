// Windows Media Streamer Plugin Type Library
// Version 1.0

/*[uuid("790ef936-f7a1-4489-90a1-5c77ce75b500")]*/
module dwin.sys.win32.com.tlb.more.wmstream;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum NETSOURCE_PROXY_SETTINGS {
  NETSOURCE_PROXY_SETTING_NONE = 0x00000000,
  NETSOURCE_PROXY_SETTING_MANUAL = 0x00000001,
  NETSOURCE_PROXY_SETTING_AUTO = 0x00000002,
  NETSOURCE_PROXY_SETTING_BROWSER = 0x00000003,
}

enum NETSOURCE_QOS_SETTINGS {
  NETSOURCE_QOS_DISABLED = 0x00000000,
  NETSOURCE_QOS_ENABLED = 0x00000001,
  NETSOURCE_QOS_REQUIRED = 0x00000002,
}

// Interfaces

// IWMSGenericAdminNetSource Interface
interface IWMSGenericAdminNetSource : IDispatch {
  mixin(uuid("f8e21c85-4278-44ad-bbc5-7cb490bd9e52"));
  // static DWINGUID IID = { 0xf8e21c85, 0x4278, 0x44ad, 0xbb, 0xc5, 0x7c, 0xb4, 0x90, 0xbd, 0x9e, 0x52 };
  /*[id(0x60020000)]*/ int GetProxyHostName(wchar* bstrProtocol, out wchar* pbstrProxyName);
  /*[id(0x60020001)]*/ int SetProxyHostName(wchar* bstrProtocol, wchar* bstrProxyName);
  /*[id(0x60020002)]*/ int GetProxyPort(wchar* bstrProtocol, out uint pdwPort);
  /*[id(0x60020003)]*/ int SetProxyPort(wchar* bstrProtocol, uint dwPort);
  /*[id(0x60020004)]*/ int GetProxySettings(wchar* bstrProtocol, out NETSOURCE_PROXY_SETTINGS pProxySetting);
  /*[id(0x60020005)]*/ int SetProxySettings(wchar* bstrProtocol, NETSOURCE_PROXY_SETTINGS ProxySetting);
  /*[id(0x60020006)]*/ int GetProxyExceptionList(wchar* bstrUrlPrefix, out wchar* pbstrExceptionList);
  /*[id(0x60020007)]*/ int SetProxyExceptionList(wchar* bstrUrlPrefix, wchar* bstrExceptionList);
  /*[id(0x60020008)]*/ int GetProxyBypassForLocal(wchar* bstrUrlPrefix, out short pfBypassForLocal);
  /*[id(0x60020009)]*/ int SetProxyBypassForLocal(wchar* bstrUrlPrefix, short fBypassForLocal);
  // Retrieves whether or not to force proxy autodection.
  /*[id(0x0000000B)]*/ int get_ForceRerunAutoProxyDetection(out short pfForceRerunDetection);
  // Retrieves whether or not to force proxy autodection.
  /*[id(0x0000000B)]*/ int set_ForceRerunAutoProxyDetection(short pfForceRerunDetection);
  // Retrieves time spent buffering before rendering.
  /*[id(0x0000000C)]*/ int get_BufferingTime(out uint pdwBufferingTime);
  // Retrieves time spent buffering before rendering.
  /*[id(0x0000000C)]*/ int set_BufferingTime(uint pdwBufferingTime);
  // Retrieves whether or not to use multicast.
  /*[id(0x0000000D)]*/ int get_EnableMulticast(out short pfEnableMulticast);
  // Retrieves whether or not to use multicast.
  /*[id(0x0000000D)]*/ int set_EnableMulticast(short pfEnableMulticast);
  // Retrieves whether or not to use HTTP.
  /*[id(0x0000000E)]*/ int get_HttpEnabled(out short pfEnableHTTP);
  // Retrieves whether or not to use HTTP.
  /*[id(0x0000000E)]*/ int set_HttpEnabled(short pfEnableHTTP);
  // Retrieves whether or not to use UDP.
  /*[id(0x0000000F)]*/ int get_UdpEnabled(out short pfEnableUDP);
  // Retrieves whether or not to use UDP.
  /*[id(0x0000000F)]*/ int set_UdpEnabled(short pfEnableUDP);
  // Retrieves whether or not to use TCP.
  /*[id(0x00000010)]*/ int get_TcpEnabled(out short pfEnableTCP);
  // Retrieves whether or not to use TCP.
  /*[id(0x00000010)]*/ int set_TcpEnabled(short pfEnableTCP);
  // Retrieves whether or not to use a base port for UDP.
  /*[id(0x00000011)]*/ int get_UseFixedUDPPort(out short pfUseFixedUDPPort);
  // Retrieves whether or not to use a base port for UDP.
  /*[id(0x00000011)]*/ int set_UseFixedUDPPort(short pfUseFixedUDPPort);
  // Retrieves base port for UDP.
  /*[id(0x00000012)]*/ int get_FixedUDPPort(out uint pdwFixedUDPPort);
  // Retrieves base port for UDP.
  /*[id(0x00000012)]*/ int set_FixedUDPPort(uint pdwFixedUDPPort);
  // Retrieves QOS setting.
  /*[id(0x00000013)]*/ int get_QosSetting(out NETSOURCE_QOS_SETTINGS pQosSetting);
  // Retrieves QOS setting.
  /*[id(0x00000013)]*/ int set_QosSetting(NETSOURCE_QOS_SETTINGS pQosSetting);
}
