// NetCon 1.0 Type Library
// Version 1.0

/*[uuid("43e734ca-043d-4a70-9a2c-a8f254063d91")]*/
//module dwin.sys.win32.com.tlb.more.netcon;
module dwin.sys.win32.com.tlb.more.hnetcfg;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum tagSHARINGCONNECTION_ENUM_FLAGS {
  ICSSC_DEFAULT = 0x00000000,
  ICSSC_ENABLED = 0x00000001,
}

enum tagNETCON_STATUS {
  NCS_DISCONNECTED = 0x00000000,
  NCS_CONNECTING = 0x00000001,
  NCS_CONNECTED = 0x00000002,
  NCS_DISCONNECTING = 0x00000003,
  NCS_HARDWARE_NOT_PRESENT = 0x00000004,
  NCS_HARDWARE_DISABLED = 0x00000005,
  NCS_HARDWARE_MALFUNCTION = 0x00000006,
  NCS_MEDIA_DISCONNECTED = 0x00000007,
  NCS_AUTHENTICATING = 0x00000008,
  NCS_AUTHENTICATION_SUCCEEDED = 0x00000009,
  NCS_AUTHENTICATION_FAILED = 0x0000000A,
  NCS_INVALID_ADDRESS = 0x0000000B,
  NCS_CREDENTIALS_REQUIRED = 0x0000000C,
}

enum tagNETCON_MEDIATYPE {
  NCM_NONE = 0x00000000,
  NCM_DIRECT = 0x00000001,
  NCM_ISDN = 0x00000002,
  NCM_LAN = 0x00000003,
  NCM_PHONE = 0x00000004,
  NCM_TUNNEL = 0x00000005,
  NCM_PPPOE = 0x00000006,
  NCM_BRIDGE = 0x00000007,
  NCM_SHAREDACCESSHOST_LAN = 0x00000008,
  NCM_SHAREDACCESSHOST_RAS = 0x00000009,
}

enum tagSHARINGCONNECTIONTYPE {
  ICSSHARINGTYPE_PUBLIC = 0x00000000,
  ICSSHARINGTYPE_PRIVATE = 0x00000001,
}

enum tagICS_TARGETTYPE {
  ICSTT_NAME = 0x00000000,
  ICSTT_IPADDRESS = 0x00000001,
}

// Structs

struct tagNETCON_PROPERTIES {
 DWINGUID guidId;
  wchar* pszwName;
  wchar* pszwDeviceName;
  tagNETCON_STATUS Status;
  tagNETCON_MEDIATYPE MediaType;
  uint dwCharacter;
 DWINGUID clsidThisObject;
 DWINGUID clsidUiObject;
}

// Interfaces

interface INetSharingManager : IDispatch {
  mixin(uuid("c08956b7-1cd3-11d1-b1c5-00805fc1270e"));
  // static DWINGUID IID = { 0xc08956b7, 0x1cd3, 0x11d1, 0xb1, 0xc5, 0x00, 0x80, 0x5f, 0xc1, 0x27, 0x0e };
  // property SharingInstalled
  /*[id(0x00000001)]*/ int get_SharingInstalled(out short pbInstalled);
  // EnumPublicConnections
  /*[id(0x00000002)]*/ int get_EnumPublicConnections(tagSHARINGCONNECTION_ENUM_FLAGS Flags, out INetSharingPublicConnectionCollection ppColl);
  // EnumPrivateConnections
  /*[id(0x00000003)]*/ int get_EnumPrivateConnections(tagSHARINGCONNECTION_ENUM_FLAGS Flags, out INetSharingPrivateConnectionCollection ppColl);
  // INetSharingConfigurationForINetConnection
  /*[id(0x00000006)]*/ int get_INetSharingConfigurationForINetConnection(INetConnection pNetConnection, out INetSharingConfiguration ppNetSharingConfiguration);
  // EnumEveryConnection
  /*[id(0x00000007)]*/ int get_EnumEveryConnection(out INetSharingEveryConnectionCollection ppColl);
  // NetConnectionProps
  /*[id(0x00000008)]*/ int get_NetConnectionProps(INetConnection pNetConnection, out INetConnectionProps ppProps);
}

// INetSharingPublicConnectionCollection Interface
interface INetSharingPublicConnectionCollection : IDispatch {
  mixin(uuid("7d7a6355-f372-4971-a149-bfc927be762a"));
  // static DWINGUID IID = { 0x7d7a6355, 0xf372, 0x4971, 0xa1, 0x49, 0xbf, 0xc9, 0x27, 0xbe, 0x76, 0x2a };
  // property _NewEnum:  gets item enumerator
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown pVal);
  // property Count
  /*[id(0x00000001)]*/ int get_Count(out int pVal);
}

// INetSharingPrivateConnectionCollection Interface
interface INetSharingPrivateConnectionCollection : IDispatch {
  mixin(uuid("38ae69e0-4409-402a-a2cb-e965c727f840"));
  // static DWINGUID IID = { 0x38ae69e0, 0x4409, 0x402a, 0xa2, 0xcb, 0xe9, 0x65, 0xc7, 0x27, 0xf8, 0x40 };
  // property _NewEnum:  gets item enumerator
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown pVal);
  // property Count
  /*[id(0x00000001)]*/ int get_Count(out int pVal);
}

interface INetConnection : IUnknown {
  mixin(uuid("c08956a1-1cd3-11d1-b1c5-00805fc1270e"));
  // static DWINGUID IID = { 0xc08956a1, 0x1cd3, 0x11d1, 0xb1, 0xc5, 0x00, 0x80, 0x5f, 0xc1, 0x27, 0x0e };
  /*[id(0x60010000)]*/ int Connect();
  /*[id(0x60010001)]*/ int Disconnect();
  /*[id(0x60010002)]*/ int Delete();
  /*[id(0x60010003)]*/ int Duplicate(wchar* pszwDuplicateName, out INetConnection ppCon);
  /*[id(0x60010004)]*/ int GetProperties(out tagNETCON_PROPERTIES ppProps);
  /*[id(0x60010005)]*/ int GetUiObjectClassId(out DWINGUID pclsid);
  /*[id(0x60010006)]*/ int Rename(wchar* pszwNewName);
}

interface INetSharingConfiguration : IDispatch {
  mixin(uuid("c08956b6-1cd3-11d1-b1c5-00805fc1270e"));
  // static DWINGUID IID = { 0xc08956b6, 0x1cd3, 0x11d1, 0xb1, 0xc5, 0x00, 0x80, 0x5f, 0xc1, 0x27, 0x0e };
  // property SharingEnabled
  /*[id(0x00000001)]*/ int get_SharingEnabled(out short pbEnabled);
  // property SharingConnectionType
  /*[id(0x00000002)]*/ int get_SharingConnectionType(out tagSHARINGCONNECTIONTYPE pType);
  // method DisableSharing
  /*[id(0x00000003)]*/ int DisableSharing();
  // method EnableSharing
  /*[id(0x00000004)]*/ int EnableSharing(tagSHARINGCONNECTIONTYPE Type);
  // property InternetFirewallEnabled
  /*[id(0x00000005)]*/ int get_InternetFirewallEnabled(out short pbEnabled);
  // method DisableInternetFirewall
  /*[id(0x00000006)]*/ int DisableInternetFirewall();
  // method EnableInternetFirewall
  /*[id(0x00000007)]*/ int EnableInternetFirewall();
  // EnumPortMappings
  /*[id(0x00000008)]*/ int get_EnumPortMappings(tagSHARINGCONNECTION_ENUM_FLAGS Flags, out INetSharingPortMappingCollection ppColl);
  // method AddPortMapping
  /*[id(0x00000009)]*/ int AddPortMapping(wchar* bstrName, ubyte ucIPProtocol, ushort usExternalPort, ushort usInternalPort, uint dwOptions, wchar* bstrTargetNameOrIPAddress, tagICS_TARGETTYPE eTargetType, out INetSharingPortMapping ppMapping);
  // method RemovePortMapping
  /*[id(0x0000000A)]*/ int RemovePortMapping(INetSharingPortMapping pMapping);
}

// INetSharingPortMappingCollection Interface
interface INetSharingPortMappingCollection : IDispatch {
  mixin(uuid("02e4a2de-da20-4e34-89c8-ac22275a010b"));
  // static DWINGUID IID = { 0x02e4a2de, 0xda20, 0x4e34, 0x89, 0xc8, 0xac, 0x22, 0x27, 0x5a, 0x01, 0x0b };
  // property _NewEnum:  gets item enumerator
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown pVal);
  // property Count
  /*[id(0x00000001)]*/ int get_Count(out int pVal);
}

interface INetSharingPortMapping : IDispatch {
  mixin(uuid("c08956b1-1cd3-11d1-b1c5-00805fc1270e"));
  // static DWINGUID IID = { 0xc08956b1, 0x1cd3, 0x11d1, 0xb1, 0xc5, 0x00, 0x80, 0x5f, 0xc1, 0x27, 0x0e };
  // method Disable
  /*[id(0x00000001)]*/ int Disable();
  // method Enable
  /*[id(0x00000002)]*/ int Enable();
  // property Properties
  /*[id(0x00000003)]*/ int get_Properties(out INetSharingPortMappingProps ppNSPMP);
  // method Delete
  /*[id(0x00000004)]*/ int Delete();
}

interface INetSharingPortMappingProps : IDispatch {
  mixin(uuid("24b7e9b5-e38f-4685-851b-00892cf5f940"));
  // static DWINGUID IID = { 0x24b7e9b5, 0xe38f, 0x4685, 0x85, 0x1b, 0x00, 0x89, 0x2c, 0xf5, 0xf9, 0x40 };
  // property Name
  /*[id(0x00000001)]*/ int get_Name(out wchar* pbstrName);
  // property IPProtocol
  /*[id(0x00000002)]*/ int get_IPProtocol(out ubyte pucIPProt);
  // property ExternalPort
  /*[id(0x00000003)]*/ int get_ExternalPort(out int pusPort);
  // property InternalPort
  /*[id(0x00000004)]*/ int get_InternalPort(out int pusPort);
  // property Options
  /*[id(0x00000005)]*/ int get_Options(out int pdwOptions);
  // property TargetName
  /*[id(0x00000006)]*/ int get_TargetName(out wchar* pbstrTargetName);
  // property TargetIPAddress
  /*[id(0x00000007)]*/ int get_TargetIPAddress(out wchar* pbstrTargetIPAddress);
  // property Enabled
  /*[id(0x00000008)]*/ int get_Enabled(out short pbool);
}

// INetSharingEveryConnectionCollection Interface
interface INetSharingEveryConnectionCollection : IDispatch {
  mixin(uuid("33c4643c-7811-46fa-a89a-768597bd7223"));
  // static DWINGUID IID = { 0x33c4643c, 0x7811, 0x46fa, 0xa8, 0x9a, 0x76, 0x85, 0x97, 0xbd, 0x72, 0x23 };
  // property _NewEnum:  gets item enumerator
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown pVal);
  // property Count
  /*[id(0x00000001)]*/ int get_Count(out int pVal);
}

// INetConnectionProps Interface
interface INetConnectionProps : IDispatch {
  mixin(uuid("f4277c95-ce5b-463d-8167-5662d9bcaa72"));
  // static DWINGUID IID = { 0xf4277c95, 0xce5b, 0x463d, 0x81, 0x67, 0x56, 0x62, 0xd9, 0xbc, 0xaa, 0x72 };
  // property Guid
  /*[id(0x00000001)]*/ int get_Guid(out wchar* pbstrGuid);
  // property Name
  /*[id(0x00000002)]*/ int get_Name(out wchar* pbstrName);
  // property DeviceName
  /*[id(0x00000003)]*/ int get_DeviceName(out wchar* pbstrDeviceName);
  // property Status
  /*[id(0x00000004)]*/ int get_Status(out tagNETCON_STATUS pStatus);
  // property MediaType
  /*[id(0x00000005)]*/ int get_MediaType(out tagNETCON_MEDIATYPE pMediaType);
  // property Characteristics
  /*[id(0x00000006)]*/ int get_Characteristics(out uint pdwFlags);
}

// CoClasses

// NetSharingManager Class
abstract class NetSharingManager {
  mixin(uuid("5c63c1ad-3956-4ff8-8486-40034758315b"));
  // static DWINGUID CLSID = { 0x5c63c1ad, 0x3956, 0x4ff8, 0x84, 0x86, 0x40, 0x03, 0x47, 0x58, 0x31, 0x5b };
  mixin Interfaces!(INetSharingManager);
}
