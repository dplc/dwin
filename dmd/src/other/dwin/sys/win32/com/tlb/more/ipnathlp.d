// IP NAT Helper
// Version 1.0

/*[uuid("c3422e9a-4e85-4dd4-9305-de7e18e071a4")]*/
//module dwin.sys.win32.com.tlb.more.ipnathelper;
module dwin.sys.win32.com.tlb.more.ipnathlp;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum IOSINFO_DISPIDS {
  IOSINFO_DISPID_MAGICON = 0x00000001,
  IOSINFO_DISPID_OSMAJORVERSION = 0x00000002,
  IOSINFO_DISPID_OSMINORVERSION = 0x00000003,
  IOSINFO_DISPID_OSBUILDNUMBER = 0x00000004,
  IOSINFO_DISPID_OSMACHINENAME = 0x00000005,
}

enum ICOMMONCONFIG_DISPIDS {
  ICOMMONCONFIG_DISPID_WANACCESSTYPE = 0x00000000,
  ICOMMONCONFIG_DISPID_LAYER1UPSTREAMMAXBITRATE = 0x00000001,
  ICOMMONCONFIG_DISPID_LAYER1DOWNSTREAMMAXBITRATE = 0x00000002,
  ICOMMONCONFIG_DISPID_PHYSICALLINKSTATUS = 0x00000003,
  ICOMMONCONFIG_DISPID_SETENABLEDFORINTERNET = 0x00000004,
  ICOMMONCONFIG_DISPID_ENABLEDFORINTERNET = 0x00000005,
  ICOMMONCONFIG_DISPID_TOTALBYTESSENT = 0x00000006,
  ICOMMONCONFIG_DISPID_TOTALBYTESRECEIVED = 0x00000007,
  ICOMMONCONFIG_DISPID_TOTALPACKETSSSENT = 0x00000008,
  ICOMMONCONFIG_DISPID_TOTALPACKETSRECEIVED = 0x00000009,
  ICOMMONCONFIG_DISPID_WANACCESSPROVIDER = 0x0000000A,
  ICOMMONCONFIG_DISPID_MAXIMUMACTIVECONNECTIONS = 0x0000000B,
  ICOMMONCONFIG_DISPID_XPERSONALFIREWALLENABLED = 0x0000000C,
  ICOMMONCONFIG_DISPID_XUPTIME = 0x0000000D,
  ICOMMONCONFIG_DISPID_GETCOMMONLINKPROPERTIES = 0x0000000E,
  ICOMMONCONFIG_DISPID_XGETICSSTATISTICS = 0x0000000F,
  ICOMMONCONFIG_DISPID_GETTOTALBYTESSENT = 0x00000010,
  ICOMMONCONFIG_DISPID_GETTOTALBYTESRECEIVED = 0x00000011,
  ICOMMONCONFIG_DISPID_GETTOTALPACKETSSENT = 0x00000012,
  ICOMMONCONFIG_DISPID_GETTOTALPACKETSRECEIVED = 0x00000013,
}

enum IWANPOTSLINKCONFIG_DISPIDS {
  IWANPOTSLINKCONFIG_DISPIDS_MAGICON = 0x00000001,
  IWANPOTSLINKCONFIG_DISPID_ISPPHONENUMBER = 0x00000002,
  IWANPOTSLINKCONFIG_DISPID_ISPINFO = 0x00000003,
  IWANPOTSLINKCONFIG_DISPID_LINKTYPE = 0x00000004,
  IWANPOTSLINKCONFIG_DISPID_NUMBEROFRETRIES = 0x00000005,
  IWANPOTSLINKCONFIG_DISPID_DELAYBETWEENRETRIES = 0x00000006,
  IWANPOTSLINKCONFIG_DISPID_GETISPINFO = 0x00000007,
  IWANPOTSLINKCONFIG_DISPID_GETCALLRETRYINFO = 0x00000008,
}

enum IWANIPCONNECTION_DISPIDS {
  IWANIPCONNECTION_DISPIDS_MAGICON = 0x00000001,
  IWANIPCONNECTION_DISPID_CONNECTIONTYPE = 0x00000002,
  IWANIPCONNECTION_DISPID_POSSIBLECONNECTIONTYPES = 0x00000003,
  IWANIPCONNECTION_DISPID_CONNECTIONSTATUS = 0x00000004,
  IWANIPCONNECTION_DISPID_UPTIME = 0x00000005,
  IWANIPCONNECTION_DISPID_UPSTREAMMAXBITRATE = 0x00000006,
  IWANIPCONNECTION_DISPID_DOWNSTREAMMAXBITRATE = 0x00000007,
  IWANIPCONNECTION_DISPID_LASTCONNECTIONERROR = 0x00000008,
  IWANIPCONNECTION_DISPID_RSIPAVAILABLE = 0x00000009,
  IWANIPCONNECTION_DISPID_NATENABLED = 0x0000000A,
  IWANIPCONNECTION_DISPID_NAME = 0x0000000B,
  IWANIPCONNECTION_DISPID_EXTERNALIPADDRESS = 0x0000000C,
  IWANIPCONNECTION_DISPID_REMOTEHOST = 0x0000000D,
  IWANIPCONNECTION_DISPID_EXTERNALPORT = 0x0000000E,
  IWANIPCONNECTION_DISPID_INTERNALPORT = 0x0000000F,
  IWANIPCONNECTION_DISPID_PORTMAPPINGPROTOCOL = 0x00000010,
  IWANIPCONNECTION_DISPID_INTERNALCLIENT = 0x00000011,
  IWANIPCONNECTION_DISPID_PORTMAPPINGDESCRIPTION = 0x00000012,
  IWANIPCONNECTION_DISPID_PORTMAPPINGENABLED = 0x00000013,
  IWANIPCONNECTION_DISPID_PORTMAPPINGLEASEDURATION = 0x00000014,
  IWANIPCONNECTION_DISPID_XPORTMAPPINGINDEX = 0x00000015,
  IWANIPCONNECTION_DISPID_PORTMAPPINGNUMBEROFENTRIES = 0x00000016,
  IWANIPCONNECTION_DISPID_SETCONNECTIONTYPE = 0x00000017,
  IWANIPCONNECTION_DISPID_GETCONNECTIONTYPE = 0x00000018,
  IWANIPCONNECTION_DISPID_REQUESTCONNECTION = 0x00000019,
  IWANIPCONNECTION_DISPID_FORCETERMINATION = 0x0000001A,
  IWANIPCONNECTION_DISPID_GETSTATUSINFO = 0x0000001B,
  IWANIPCONNECTION_DISPID_GETNATRSIPSTATUS = 0x0000001C,
  IWANIPCONNECTION_DISPID_GETLINKLAYERMAXBITRATES = 0x0000001D,
  IWANIPCONNECTION_DISPID_GETSPECIFICPORTMAPPINGENTRY = 0x0000001E,
  IWANIPCONNECTION_DISPID_GETGENERICPORTMAPPINGENTRY = 0x0000001F,
  IWANIPCONNECTION_DISPID_ADDPORTMAPPING = 0x00000020,
  IWANIPCONNECTION_DISPID_DELETEPORTMAPPING = 0x00000021,
  IWANIPCONNECTION_DISPID_GETEXTERNALIPADDRESS = 0x00000022,
}

// Interfaces

interface IOSInfoService : IUnknown {
  mixin(uuid("34e5bd25-df15-405b-9d92-ab74ad0dc121"));
  // static DWINGUID IID = { 0x34e5bd25, 0xdf15, 0x405b, 0x9d, 0x92, 0xab, 0x74, 0xad, 0x0d, 0xc1, 0x21 };
  // OS Major Version
  /*[id(0x00000002)]*/ int get_OSMajorVersion(out int pOSMajorVersion);
  // OS Minor Version
  /*[id(0x00000003)]*/ int get_OSMinorVersion(out int pOSMinorVersion);
  // OS Build Number
  /*[id(0x00000004)]*/ int get_OSBuildNumber(out int pOSBuildNumber);
  // OS Machine Name
  /*[id(0x00000005)]*/ int get_OSMachineName(out wchar* pOSMachineName);
  // Magic On
  /*[id(0x00000001)]*/ int MagicOn();
}

interface ICommonInterfaceConfigService : IUnknown {
  mixin(uuid("eb453baa-08f1-4235-abf0-521c7aa0eda1"));
  // static DWINGUID IID = { 0xeb453baa, 0x08f1, 0x4235, 0xab, 0xf0, 0x52, 0x1c, 0x7a, 0xa0, 0xed, 0xa1 };
  // WANAccessType
  /*[id(0x00000000)]*/ int get_WANAccessType(out wchar* pWANAccessType);
  // Layer1UpstreamMaxBitRate
  /*[id(0x00000001)]*/ int get_Layer1UpstreamMaxBitRate(out uint pLayer1UpstreamMaxBitRate);
  // Layer1DownstreamMaxBitRate
  /*[id(0x00000002)]*/ int get_Layer1DownstreamMaxBitRate(out uint pLayer1DownstreamMaxBitRate);
  // PhysicalLinkStatus
  /*[id(0x00000003)]*/ int get_PhysicalLinkStatus(out wchar* pPhysicalLinkStatus);
  // TotalBytesSent
  /*[id(0x00000006)]*/ int get_TotalBytesSent(out uint pTotalBytesSent);
  // TotalBytesReceived
  /*[id(0x00000007)]*/ int get_TotalBytesReceived(out uint pTotalBytesReceived);
  // TotalPacketsSent
  /*[id(0x00000008)]*/ int get_TotalPacketsSent(out uint pTotalPacketsSent);
  // TotalPacketsReceived
  /*[id(0x00000009)]*/ int get_TotalPacketsReceived(out uint pTotalPacketsReceived);
  // WANAccessProvider
  /*[id(0x0000000A)]*/ int get_WANAccessProvider(out wchar* pWANAccessProvider);
  // MaximumActiveConnections
  /*[id(0x0000000B)]*/ int get_MaximumActiveConnections(out ushort pMaximumActiveConnections);
  // PersonalFirewallEnabled
  /*[id(0x0000000C)]*/ int get_X_PersonalFirewallEnabled(out short pPersonalFirewallEnabled);
  // X_Uptime
  /*[id(0x0000000D)]*/ int get_X_Uptime(out uint pUptime);
  // GetCommonLinkProperties
  /*[id(0x0000000E)]*/ int GetCommonLinkProperties(ref wchar* pWANAccessType, ref uint pLayer1UpstreamMaxBitRate, ref uint pLayer1DownstreamMaxBitRate, ref wchar* pPhysicalLinkStatus);
  // GetTotalBytesSent
  /*[id(0x00000010)]*/ int GetTotalBytesSent(ref uint pTotalBytesSent);
  // GetTotalBytesReceived
  /*[id(0x00000011)]*/ int GetTotalBytesReceived(ref uint pTotalBytesReceived);
  // GetTotalPacketsSent
  /*[id(0x00000012)]*/ int GetTotalPacketsSent(ref uint pTotalPacketsSent);
  // GetTotalPacketsReceived
  /*[id(0x00000013)]*/ int GetTotalPacketsReceived(ref uint pTotalPacketsReceived);
  // X_GetICSStatistics
  /*[id(0x0000000F)]*/ int X_GetICSStatistics(ref uint pTotalBytesSent, ref uint pTotalBytesReceived, ref uint pTotalPacketsSent, ref uint pTotalPacketsReceived, ref uint pSpeed, ref uint pUptime);
}

interface IWANPOTSLinkConfigService : IUnknown {
  mixin(uuid("ea3788a7-84b8-4831-a4f9-9e842d0d44ba"));
  // static DWINGUID IID = { 0xea3788a7, 0x84b8, 0x4831, 0xa4, 0xf9, 0x9e, 0x84, 0x2d, 0x0d, 0x44, 0xba };
  // ISPPhoneNumber
  /*[id(0x00000002)]*/ int get_ISPPhoneNumber(out wchar* pISPPhoneNumber);
  // ISPInfo
  /*[id(0x00000003)]*/ int get_ISPInfo(out wchar* pISPInfo);
  // LinkType
  /*[id(0x00000004)]*/ int get_LinkType(out wchar* pLinkType);
  // NumberOfRetries
  /*[id(0x00000005)]*/ int get_NumberOfRetries(out uint pNumberOfRetries);
  // DelayBetweenRetries
  /*[id(0x00000006)]*/ int get_DelayBetweenRetries(out uint pDelayBetweenRetries);
  // GetISPInfo
  /*[id(0x00000007)]*/ int GetISPInfo(ref wchar* pISPPhoneNumber, ref wchar* pISPInfo, ref wchar* pLinkType);
  // GetCallRetryInfo
  /*[id(0x00000008)]*/ int GetCallRetryInfo(ref uint pNumberOfRetries, ref uint pDelayBetweenRetries);
}

interface IWANIPConnectionService : IUnknown {
  mixin(uuid("b99a547a-9574-46da-8774-3ecaf70bc12f"));
  // static DWINGUID IID = { 0xb99a547a, 0x9574, 0x46da, 0x87, 0x74, 0x3e, 0xca, 0xf7, 0x0b, 0xc1, 0x2f };
  // ConnectionType
  /*[id(0x00000002)]*/ int get_ConnectionType(out wchar* pConnectionType);
  // PossibleConnectionTypes
  /*[id(0x00000003)]*/ int get_PossibleConnectionTypes(out wchar* pPossibleConnectionTypes);
  // ConnectionStatus
  /*[id(0x00000004)]*/ int get_ConnectionStatus(out wchar* pConnectionStatus);
  // Uptime
  /*[id(0x00000005)]*/ int get_Uptime(out uint pUptime);
  // UpstreamMaxBitRate
  /*[id(0x00000006)]*/ int get_UpstreamMaxBitRate(out uint pUpstreamMaxBitRate);
  // DownstreamMaxBitRate
  /*[id(0x00000007)]*/ int get_DownstreamMaxBitRate(out uint pDownstreamMaxBitRate);
  // LastConnectionError
  /*[id(0x00000008)]*/ int get_LastConnectionError(out wchar* pLastConnectionError);
  // RSIPAvailable
  /*[id(0x00000009)]*/ int get_RSIPAvailable(out short pRSIPAvailable);
  // NATEnabled
  /*[id(0x0000000A)]*/ int get_NATEnabled(out short pNATEnabled);
  // Name
  /*[id(0x0000000B)]*/ int get_X_Name(out wchar* pName);
  // ExternalIPAddress
  /*[id(0x0000000C)]*/ int get_ExternalIPAddress(out wchar* pExternalIPAddress);
  // RemoteHost
  /*[id(0x0000000D)]*/ int get_RemoteHost(out wchar* pRemoteHost);
  // ExternalPort
  /*[id(0x0000000E)]*/ int get_ExternalPort(out ushort pExternalPort);
  // InternalPort
  /*[id(0x0000000F)]*/ int get_InternalPort(out ushort pInternalPort);
  // PortMappingProtocol
  /*[id(0x00000010)]*/ int get_PortMappingProtocol(out wchar* pProtocol);
  // InternalClient
  /*[id(0x00000011)]*/ int get_InternalClient(out wchar* pInternalClient);
  // PortMappingDescription
  /*[id(0x00000012)]*/ int get_PortMappingDescription(out wchar* pDescription);
  // PortMappingEnabled
  /*[id(0x00000013)]*/ int get_PortMappingEnabled(out short pEnabled);
  // PortMappingLeaseDuration
  /*[id(0x00000014)]*/ int get_PortMappingLeaseDuration(out uint LeaseDuration);
  // PortMappingNumberOfEntries
  /*[id(0x00000016)]*/ int get_PortMappingNumberOfEntries(out ushort pNumberOfEntries);
  // SetConnectionType
  /*[id(0x00000017)]*/ int SetConnectionType(wchar* NewConnectionType);
  // GetConnectionType
  /*[id(0x00000018)]*/ int GetConnectionTypeInfo(ref wchar* pNewConnectionType, ref wchar* pNewPossibleConnectionTypes);
  // RequestConnection
  /*[id(0x00000019)]*/ int RequestConnection();
  // ForceTermination
  /*[id(0x0000001A)]*/ int ForceTermination();
  // GetStatusInfo
  /*[id(0x0000001B)]*/ int GetStatusInfo(ref wchar* pNewConnectionStatus, ref wchar* pNewLastConnectionError, ref uint pNewUptime);
  // GetNATRSIPStatus
  /*[id(0x0000001C)]*/ int GetNATRSIPStatus(ref short pNewRSIPAvailable, ref short pNewNATEnabled);
  // GetLinkLayerMaxBitRates
  /*[id(0x0000001D)]*/ int GetLinkLayerMaxBitRates(ref uint pNewUpstreamMaxBitRate, ref uint pNewDownstreamMaxBitRate);
  // GetGenericPortMappingEntry
  /*[id(0x0000001F)]*/ int GetGenericPortMappingEntry(ushort uwIndex, ref wchar* pRemoteHost, ref ushort puwExternalPort, ref wchar* pProtocol, ref ushort puwInternalPort, ref wchar* pInternalClient, ref short pbEnabled, ref wchar* pDescription, ref uint pulLeaseDuration);
  // GetSpecificPortMappingEntry
  /*[id(0x0000001E)]*/ int GetSpecificPortMappingEntry(wchar* RemoteHost, ushort uwExternalPort, wchar* Protocol, ref ushort puwInternalPort, ref wchar* pInternalClient, ref short pbEnabled, ref wchar* pDescription, ref uint pulLeaseDuration);
  // AddPortMapping
  /*[id(0x00000020)]*/ int AddPortMapping(wchar* RemoteHost, ushort uwExternalPort, wchar* Protocol, ushort uwInternalPort, wchar* InternalClient, short bEnabled, wchar* Description, uint ulLeaseDuration);
  // DeletePortMapping
  /*[id(0x00000021)]*/ int DeletePortMapping(wchar* RemoteHost, ushort uwExternalPort, wchar* Protocol);
  // GetExternalIPAddress
  /*[id(0x00000022)]*/ int GetExternalIPAddress(ref wchar* pExternalIPAddress);
}

interface IStatisticsProvider : IUnknown {
  mixin(uuid("99780ed7-3c0d-4bb7-b238-9e0228ea4ff5"));
  // static DWINGUID IID = { 0x99780ed7, 0x3c0d, 0x4bb7, 0xb2, 0x38, 0x9e, 0x02, 0x28, 0xea, 0x4f, 0xf5 };
  /*[id(0x60010000)]*/ int GetStatistics(out uint pulBytesSent, out uint pulBytesReceived, out uint pulPacketsSent, out uint pulPacketsReceived, out uint pulUptime, out uint pulSpeedbps);
}

interface INATEventsSink : IUnknown {
  mixin(uuid("2c49d9a1-a48f-41e3-ac0b-7666dede5ee0"));
  // static DWINGUID IID = { 0x2c49d9a1, 0xa48f, 0x41e3, 0xac, 0x0b, 0x76, 0x66, 0xde, 0xde, 0x5e, 0xe0 };
  /*[id(0x60010000)]*/ int PublicIPAddressChanged();
  /*[id(0x60010001)]*/ int PortMappingsChanged();
}
