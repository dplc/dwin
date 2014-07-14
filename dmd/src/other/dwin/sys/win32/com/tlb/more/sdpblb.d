// Microsoft Sdpblb 1.0 Type Library
// Version 1.0

/*[uuid("c259d79a-c8ab-11d0-8d58-00c04fd91ac0")]*/
module dwin.sys.win32.com.tlb.more.sdpblb;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum BLOB_CHARACTER_SET {
  BCS_ASCII = 0x00000001,
  BCS_UTF7 = 0x00000002,
  BCS_UTF8 = 0x00000003,
}

// Interfaces

// ITMedia Interface
interface ITMedia : IDispatch {
  mixin(uuid("0cc1f053-caeb-11d0-8d58-00c04fd91ac0"));
  // static DWINGUID IID = { 0x0cc1f053, 0xcaeb, 0x11d0, 0x8d, 0x58, 0x00, 0xc0, 0x4f, 0xd9, 0x1a, 0xc0 };
  // property MediaName
  /*[id(0x00050001)]*/ int get_MediaName(out wchar* ppMediaName);
  // property MediaName
  /*[id(0x00050001)]*/ int set_MediaName(wchar* ppMediaName);
  // property StartPort
  /*[id(0x00050002)]*/ int get_StartPort(out int pStartPort);
  // property NumPorts
  /*[id(0x00050003)]*/ int get_NumPorts(out int pNumPorts);
  // property TransportProtocol
  /*[id(0x00050004)]*/ int get_TransportProtocol(out wchar* ppProtocol);
  // property TransportProtocol
  /*[id(0x00050004)]*/ int set_TransportProtocol(wchar* ppProtocol);
  // property FormatCodes
  /*[id(0x00050005)]*/ int get_FormatCodes(out DWINVARIANT pVal);
  // property FormatCodes
  /*[id(0x00050005)]*/ int set_FormatCodes(DWINVARIANT pVal);
  // property MediaTitle
  /*[id(0x00050006)]*/ int get_MediaTitle(out wchar* ppMediaTitle);
  // property MediaTitle
  /*[id(0x00050006)]*/ int set_MediaTitle(wchar* ppMediaTitle);
  // method SetPortInfo
  /*[id(0x00050007)]*/ int SetPortInfo(int StartPort, int NumPorts);
}

// ITTime Interface
interface ITTime : IDispatch {
  mixin(uuid("2652bb78-1516-11d1-9771-00c04fd91ac0"));
  // static DWINGUID IID = { 0x2652bb78, 0x1516, 0x11d1, 0x97, 0x71, 0x00, 0xc0, 0x4f, 0xd9, 0x1a, 0xc0 };
  // property StartTime
  /*[id(0x00000001)]*/ int get_StartTime(out double pTime);
  // property StartTime
  /*[id(0x00000001)]*/ int set_StartTime(double pTime);
  // property StopTime
  /*[id(0x00000002)]*/ int get_StopTime(out double pTime);
  // property StopTime
  /*[id(0x00000002)]*/ int set_StopTime(double pTime);
}

// ITConnection Interface
interface ITConnection : IDispatch {
  mixin(uuid("8fa381d4-c8c2-11d0-8d58-00c04fd91ac0"));
  // static DWINGUID IID = { 0x8fa381d4, 0xc8c2, 0x11d0, 0x8d, 0x58, 0x00, 0xc0, 0x4f, 0xd9, 0x1a, 0xc0 };
  // property NetworkType
  /*[id(0x00030001)]*/ int get_NetworkType(out wchar* ppNetworkType);
  // property NetworkType
  /*[id(0x00030001)]*/ int set_NetworkType(wchar* ppNetworkType);
  // property AddressType
  /*[id(0x00030002)]*/ int get_AddressType(out wchar* ppAddressType);
  // property AddressType
  /*[id(0x00030002)]*/ int set_AddressType(wchar* ppAddressType);
  // property StartAddress
  /*[id(0x00030003)]*/ int get_StartAddress(out wchar* ppStartAddress);
  // property NumAddresses
  /*[id(0x00030004)]*/ int get_NumAddresses(out int pNumAddresses);
  // property Ttl
  /*[id(0x00030005)]*/ int get_Ttl(out ubyte pTtl);
  // property BandwidthModifier
  /*[id(0x00030006)]*/ int get_BandwidthModifier(out wchar* ppModifier);
  // property Bandwidth
  /*[id(0x00030007)]*/ int get_Bandwidth(out double pBandwidth);
  // method SetAddressInfo
  /*[id(0x00030008)]*/ int SetAddressInfo(wchar* pStartAddress, int NumAddresses, ubyte Ttl);
  // method SetBandwidthInfo
  /*[id(0x00030009)]*/ int SetBandwidthInfo(wchar* pModifier, double Bandwidth);
  // method SetEncryptionKey
  /*[id(0x0003000A)]*/ int SetEncryptionKey(wchar* pKeyType, wchar** ppKeyData);
  // method GetEncryptionKey
  /*[id(0x0003000B)]*/ int GetEncryptionKey(out wchar* ppKeyType, out short pfValidKeyData, out wchar* ppKeyData);
}

// ITAttributeList Interface
interface ITAttributeList : IDispatch {
  mixin(uuid("5037fb82-cae9-11d0-8d58-00c04fd91ac0"));
  // static DWINGUID IID = { 0x5037fb82, 0xcae9, 0x11d0, 0x8d, 0x58, 0x00, 0xc0, 0x4f, 0xd9, 0x1a, 0xc0 };
  // property Count
  /*[id(0x00040001)]*/ int get_Count(out int pVal);
  // property Item
  /*[id(0x00040002)]*/ int get_Item(int Index, out wchar* pVal);
  // method Add
  /*[id(0x00040003)]*/ int Add(int Index, wchar* pAttribute);
  // method Delete
  /*[id(0x00040004)]*/ int Delete(int Index);
  // property AttributeList
  /*[id(0x00040005)]*/ int get_AttributeList(out DWINVARIANT pVal);
  // property AttributeList
  /*[id(0x00040005)]*/ int set_AttributeList(DWINVARIANT pVal);
}

// ITConferenceBlob Interface
interface ITConferenceBlob : IDispatch {
  mixin(uuid("c259d7aa-c8ab-11d0-8d58-00c04fd91ac0"));
  // static DWINGUID IID = { 0xc259d7aa, 0xc8ab, 0x11d0, 0x8d, 0x58, 0x00, 0xc0, 0x4f, 0xd9, 0x1a, 0xc0 };
  // method Init
  /*[id(0x00010001)]*/ int Init(wchar* pName, BLOB_CHARACTER_SET CharacterSet, wchar* pBlob);
  // property CharacterSet
  /*[id(0x00010002)]*/ int get_CharacterSet(out BLOB_CHARACTER_SET pCharacterSet);
  // property ConferenceBlob
  /*[id(0x00010003)]*/ int get_ConferenceBlob(out wchar* ppBlob);
  // method ConferenceBlob
  /*[id(0x00010004)]*/ int SetConferenceBlob(BLOB_CHARACTER_SET CharacterSet, wchar* pBlob);
}

// ITSdp Interface
interface ITSdp : IDispatch {
  mixin(uuid("9b2719d8-b696-11d0-a489-00c04fd91ac0"));
  // static DWINGUID IID = { 0x9b2719d8, 0xb696, 0x11d0, 0xa4, 0x89, 0x00, 0xc0, 0x4f, 0xd9, 0x1a, 0xc0 };
  // property IsValid
  /*[id(0x00020001)]*/ int get_IsValid(out short pfIsValid);
  // property ProtocolVersion
  /*[id(0x00020002)]*/ int get_ProtocolVersion(out ubyte pProtocolVersion);
  // property SessionId
  /*[id(0x00020003)]*/ int get_SessionId(out double pSessionId);
  // property SessionVersion
  /*[id(0x00020004)]*/ int get_SessionVersion(out double pSessionVersion);
  // property SessionVersion
  /*[id(0x00020004)]*/ int set_SessionVersion(double pSessionVersion);
  // property MachineAddress
  /*[id(0x00020005)]*/ int get_MachineAddress(out wchar* ppMachineAddress);
  // property MachineAddress
  /*[id(0x00020005)]*/ int set_MachineAddress(wchar* ppMachineAddress);
  // property Name
  /*[id(0x00020006)]*/ int get_Name(out wchar* ppName);
  // property Name
  /*[id(0x00020006)]*/ int set_Name(wchar* ppName);
  // property Description
  /*[id(0x00020007)]*/ int get_Description(out wchar* ppDescription);
  // property Description
  /*[id(0x00020007)]*/ int set_Description(wchar* ppDescription);
  // property Url
  /*[id(0x00020008)]*/ int get_Url(out wchar* ppUrl);
  // property Url
  /*[id(0x00020008)]*/ int set_Url(wchar* ppUrl);
  // method GetEmailNames
  /*[id(0x00020009)]*/ int GetEmailNames(out DWINVARIANT pAddresses, out DWINVARIANT pNames);
  // method SetEmailNames
  /*[id(0x0002000A)]*/ int SetEmailNames(DWINVARIANT Addresses, DWINVARIANT Names);
  // method GetPhoneNumbers
  /*[id(0x0002000B)]*/ int GetPhoneNumbers(out DWINVARIANT pNumbers, out DWINVARIANT pNames);
  // method SetPhoneNumbers
  /*[id(0x0002000C)]*/ int SetPhoneNumbers(DWINVARIANT Numbers, DWINVARIANT Names);
  // property Originator
  /*[id(0x0002000D)]*/ int get_Originator(out wchar* ppOriginator);
  // property Originator
  /*[id(0x0002000D)]*/ int set_Originator(wchar* ppOriginator);
  // property MediaCollection
  /*[id(0x0002000E)]*/ int get_MediaCollection(out ITMediaCollection ppMediaCollection);
  // property TimeCollection
  /*[id(0x0002000F)]*/ int get_TimeCollection(out ITTimeCollection ppTimeCollection);
}

// ITMediaCollection Interface
interface ITMediaCollection : IDispatch {
  mixin(uuid("6a8e16a2-0abc-11d1-976d-00c04fd91ac0"));
  // static DWINGUID IID = { 0x6a8e16a2, 0x0abc, 0x11d1, 0x97, 0x6d, 0x00, 0xc0, 0x4f, 0xd9, 0x1a, 0xc0 };
  // returns number of items in collection
  /*[id(0x60020000)]*/ int get_Count(out int pVal);
  // Given an index, returns an item in the collection.
  /*[id(0x00000000)]*/ int get_Item(int Index, out ITMedia pVal);
  // returns an enumerator for the collection.
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown pVal);
  // returns the IEnumMedia enumeration interface that enumerates ITMedia
  /*[id(0x00000001)]*/ int get_EnumerationIf(out IEnumMedia pVal);
  // method CreateMedia
  /*[id(0x00000002)]*/ int Create(int Index, out ITMedia ppMedia);
  // method DeleteMedia
  /*[id(0x00000003)]*/ int Delete(int Index);
}

// IEnumMedia interface
interface IEnumMedia : IUnknown {
  mixin(uuid("ca8397be-2fa4-11d1-9774-00c04fd91ac0"));
  // static DWINGUID IID = { 0xca8397be, 0x2fa4, 0x11d1, 0x97, 0x74, 0x00, 0xc0, 0x4f, 0xd9, 0x1a, 0xc0 };
  /*[id(0x60010000)]*/ int Next(uint celt, out ITMedia pVal, out uint pceltFetched);
  /*[id(0x60010001)]*/ int Reset();
  /*[id(0x60010002)]*/ int Skip(uint celt);
  /*[id(0x60010003)]*/ int Clone(out IEnumMedia ppEnum);
}

// ITTimeCollection Interface
interface ITTimeCollection : IDispatch {
  mixin(uuid("0cc1f04f-caeb-11d0-8d58-00c04fd91ac0"));
  // static DWINGUID IID = { 0x0cc1f04f, 0xcaeb, 0x11d0, 0x8d, 0x58, 0x00, 0xc0, 0x4f, 0xd9, 0x1a, 0xc0 };
  // returns number of items in collection
  /*[id(0x60020000)]*/ int get_Count(out int pVal);
  // Given an index, returns an item in the collection.
  /*[id(0x00000000)]*/ int get_Item(int Index, out ITTime pVal);
  // returns an enumerator for the collection.
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown pVal);
  // returns the IEnumTime enumeration interface that enumerates ITTime
  /*[id(0x00000001)]*/ int get_EnumerationIf(out IEnumTime pVal);
  // method CreateTime
  /*[id(0x00000002)]*/ int Create(int Index, out ITTime ppTime);
  // method DeleteTime
  /*[id(0x00000003)]*/ int Delete(int Index);
}

// IEnumTime interface
interface IEnumTime : IUnknown {
  mixin(uuid("9055322e-2fa8-11d1-9774-00c04fd91ac0"));
  // static DWINGUID IID = { 0x9055322e, 0x2fa8, 0x11d1, 0x97, 0x74, 0x00, 0xc0, 0x4f, 0xd9, 0x1a, 0xc0 };
  /*[id(0x60010000)]*/ int Next(uint celt, out ITTime pVal, out uint pceltFetched);
  /*[id(0x60010001)]*/ int Reset();
  /*[id(0x60010002)]*/ int Skip(uint celt);
  /*[id(0x60010003)]*/ int Clone(out IEnumTime ppEnum);
}

// CoClasses

// SdpConferenceBlob Class
abstract class SdpConferenceBlob {
  mixin(uuid("9b2719dd-b696-11d0-a489-00c04fd91ac0"));
  // static DWINGUID CLSID = { 0x9b2719dd, 0xb696, 0x11d0, 0xa4, 0x89, 0x00, 0xc0, 0x4f, 0xd9, 0x1a, 0xc0 };
  mixin Interfaces!(ITConferenceBlob, ITSdp);
}
