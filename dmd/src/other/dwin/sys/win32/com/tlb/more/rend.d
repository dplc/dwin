// Microsoft Rendezvous control 1.0 Type Library
// Version 1.0

/*[uuid("f1029e4d-cb5b-11d0-8d59-00c04fd91ac0")]*/
module dwin.sys.win32.com.tlb.more.rend;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum DIRECTORY_TYPE {
  DT_NTDS = 0x00000001,
  DT_ILS = 0x00000002,
}

enum DIRECTORY_OBJECT_TYPE {
  OT_CONFERENCE = 0x00000001,
  OT_USER = 0x00000002,
}

enum RND_ADVERTISING_SCOPE {
  RAS_LOCAL = 0x00000001,
  RAS_SITE = 0x00000002,
  RAS_REGION = 0x00000003,
  RAS_WORLD = 0x00000004,
}

// Interfaces

// Interface to access directories and obejcts.
interface ITRendezvous : IDispatch {
  mixin(uuid("34621d6b-6cff-11d1-aff7-00c04fc31fee"));
  // static DWINGUID IID = { 0x34621d6b, 0x6cff, 0x11d1, 0xaf, 0xf7, 0x00, 0xc0, 0x4f, 0xc3, 0x1f, 0xee };
  // The default directories configured by system administrator.
  /*[id(0x00000001)]*/ int get_DefaultDirectories(out DWINVARIANT pVariant);
  // method Enumerate directories
  /*[id(0x00000002)]*/ int EnumerateDefaultDirectories(out IEnumDirectory ppEnumDirectory);
  // Create a directory of given type and name.
  /*[id(0x00000003)]*/ int CreateDirectory(DIRECTORY_TYPE DirectoryType, wchar* pName, out ITDirectory ppDir);
  // Create a new directory object.
  /*[id(0x00000004)]*/ int CreateDirectoryObject(DIRECTORY_OBJECT_TYPE DirectoryObjectType, wchar* pName, out ITDirectoryObject ppDirectoryObject);
}

// IEnumDirectory interface
interface IEnumDirectory : IUnknown {
  mixin(uuid("34621d6d-6cff-11d1-aff7-00c04fc31fee"));
  // static DWINGUID IID = { 0x34621d6d, 0x6cff, 0x11d1, 0xaf, 0xf7, 0x00, 0xc0, 0x4f, 0xc3, 0x1f, 0xee };
  /*[id(0x60010000)]*/ int Next(uint celt, out ITDirectory ppElements, ref uint pcFetched);
  /*[id(0x60010001)]*/ int Reset();
  /*[id(0x60010002)]*/ int Skip(uint celt);
  /*[id(0x60010003)]*/ int Clone(out IEnumDirectory ppEnum);
}

// Interface to a generic directory service.
interface ITDirectory : IDispatch {
  mixin(uuid("34621d6c-6cff-11d1-aff7-00c04fc31fee"));
  // static DWINGUID IID = { 0x34621d6c, 0x6cff, 0x11d1, 0xaf, 0xf7, 0x00, 0xc0, 0x4f, 0xc3, 0x1f, 0xee };
  // The type of the directory.
  /*[id(0x00010001)]*/ int get_DirectoryType(out DIRECTORY_TYPE pDirectoryType);
  // The name of the directory.
  /*[id(0x00010002)]*/ int get_DisplayName(out wchar* pName);
  // If the object on the server needs refresh.
  /*[id(0x00010003)]*/ int get_IsDynamic(out short pfDynamic);
  // The default Time To Live value(in seconds) for object created. Only apply to dynamic servers.
  /*[id(0x00010004)]*/ int get_DefaultObjectTTL(out int pTTL);
  // The default Time To Live value(in seconds) for object created. Only apply to dynamic servers.
  /*[id(0x00010004)]*/ int set_DefaultObjectTTL(int pTTL);
  // Enable the auto refresh for object created afterwards. Only apply to dynamic servers.
  /*[id(0x00010005)]*/ int EnableAutoRefresh(short fEnable);
  // Connect to the server.
  /*[id(0x00010006)]*/ int Connect(short fSecure);
  // Bind to the server.
  /*[id(0x00010007)]*/ int Bind(wchar* pDomainName, wchar* pUserName, wchar* pPassword, int lFlags);
  // Add an object to the server.
  /*[id(0x00010008)]*/ int AddDirectoryObject(ITDirectoryObject pDirectoryObject);
  // Modify an object on the server.
  /*[id(0x00010009)]*/ int ModifyDirectoryObject(ITDirectoryObject pDirectoryObject);
  // Refresh the TTL for an object on the server. Only apply to dynamic servers.
  /*[id(0x0001000A)]*/ int RefreshDirectoryObject(ITDirectoryObject pDirectoryObject);
  // Delete an object from the server.
  /*[id(0x0001000B)]*/ int DeleteDirectoryObject(ITDirectoryObject pDirectoryObject);
  // All the objects on the server with specified type and name.
  /*[id(0x0001000C)]*/ int get_DirectoryObjects(DIRECTORY_OBJECT_TYPE DirectoryObjectType, wchar* pName, out DWINVARIANT pVariant);
  // method EnumerateDirectoryObjects
  /*[id(0x0001000D)]*/ int EnumerateDirectoryObjects(DIRECTORY_OBJECT_TYPE DirectoryObjectType, wchar* pName, out IEnumDirectoryObject ppEnumObject);
}

// Interface for an object in the directory.
interface ITDirectoryObject : IDispatch {
  mixin(uuid("34621d6e-6cff-11d1-aff7-00c04fc31fee"));
  // static DWINGUID IID = { 0x34621d6e, 0x6cff, 0x11d1, 0xaf, 0xf7, 0x00, 0xc0, 0x4f, 0xc3, 0x1f, 0xee };
  // The type of this object.
  /*[id(0x00010001)]*/ int get_ObjectType(out DIRECTORY_OBJECT_TYPE pObjectType);
  // The name of this object.
  /*[id(0x00010002)]*/ int get_Name(out wchar* ppName);
  // The name of this object.
  /*[id(0x00010002)]*/ int set_Name(wchar* ppName);
  // The addresses of the object that can be dialed.
  /*[id(0x00010003)]*/ int get_DialableAddrs(int dwAddressType, out DWINVARIANT pVariant);
  // method EnumerateDialableAddrs
  /*[id(0x00010004)]*/ int EnumerateDialableAddrs(uint dwAddressType, out IEnumDialableAddrs ppEnumDialableAddrs);
  // The security descriptor.
  /*[id(0x00010005)]*/ int get_SecurityDescriptor(out IDispatch ppSecDes);
  // The security descriptor.
  /*[id(0x00010005)]*/ int set_SecurityDescriptor(IDispatch ppSecDes);
}

// IEnumDialableAddresses interface
interface IEnumDialableAddrs : IUnknown {
  mixin(uuid("34621d70-6cff-11d1-aff7-00c04fc31fee"));
  // static DWINGUID IID = { 0x34621d70, 0x6cff, 0x11d1, 0xaf, 0xf7, 0x00, 0xc0, 0x4f, 0xc3, 0x1f, 0xee };
  /*[id(0x60010000)]*/ int Next(uint celt, out wchar* ppElements, ref uint pcFetched);
  /*[id(0x60010001)]*/ int Reset();
  /*[id(0x60010002)]*/ int Skip(uint celt);
  /*[id(0x60010003)]*/ int Clone(out IEnumDialableAddrs ppEnum);
}

// IEnumDirectoryObject interface
interface IEnumDirectoryObject : IUnknown {
  mixin(uuid("06c9b64a-306d-11d1-9774-00c04fd91ac0"));
  // static DWINGUID IID = { 0x06c9b64a, 0x306d, 0x11d1, 0x97, 0x74, 0x00, 0xc0, 0x4f, 0xd9, 0x1a, 0xc0 };
  /*[id(0x60010000)]*/ int Next(uint celt, out ITDirectoryObject pVal, ref uint pcFetched);
  /*[id(0x60010001)]*/ int Reset();
  /*[id(0x60010002)]*/ int Skip(uint celt);
  /*[id(0x60010003)]*/ int Clone(out IEnumDirectoryObject ppEnum);
}

// Interface for conference announcements.
interface ITDirectoryObjectConference : IDispatch {
  mixin(uuid("f1029e5d-cb5b-11d0-8d59-00c04fd91ac0"));
  // static DWINGUID IID = { 0xf1029e5d, 0xcb5b, 0x11d0, 0x8d, 0x59, 0x00, 0xc0, 0x4f, 0xd9, 0x1a, 0xc0 };
  // The protocol used in describing the conference.
  /*[id(0x00020001)]*/ int get_Protocol(out wchar* ppProtocol);
  // The originator of the conference.
  /*[id(0x00020002)]*/ int get_Originator(out wchar* ppOriginator);
  // The originator of the conference.
  /*[id(0x00020002)]*/ int set_Originator(wchar* ppOriginator);
  // The scope of the conference.
  /*[id(0x00020003)]*/ int get_AdvertisingScope(out RND_ADVERTISING_SCOPE pAdvertisingScope);
  // The scope of the conference.
  /*[id(0x00020003)]*/ int set_AdvertisingScope(RND_ADVERTISING_SCOPE pAdvertisingScope);
  // The Url for the conference.
  /*[id(0x00020004)]*/ int get_Url(out wchar* ppUrl);
  // The Url for the conference.
  /*[id(0x00020004)]*/ int set_Url(wchar* ppUrl);
  // The description of the conference.
  /*[id(0x00020005)]*/ int get_Description(out wchar* ppDescription);
  // The description of the conference.
  /*[id(0x00020005)]*/ int set_Description(wchar* ppDescription);
  // If the conference is encrypted.
  /*[id(0x00020006)]*/ int get_IsEncrypted(out short pfEncrypted);
  // If the conference is encrypted.
  /*[id(0x00020006)]*/ int set_IsEncrypted(short pfEncrypted);
  // The start time of the conference.
  /*[id(0x00020007)]*/ int get_StartTime(out double pDate);
  // The start time of the conference.
  /*[id(0x00020007)]*/ int set_StartTime(double pDate);
  // The stop time of the conference.
  /*[id(0x00020008)]*/ int get_StopTime(out double pDate);
  // The stop time of the conference.
  /*[id(0x00020008)]*/ int set_StopTime(double pDate);
}

// Interface for user object.
interface ITDirectoryObjectUser : IDispatch {
  mixin(uuid("34621d6f-6cff-11d1-aff7-00c04fc31fee"));
  // static DWINGUID IID = { 0x34621d6f, 0x6cff, 0x11d1, 0xaf, 0xf7, 0x00, 0xc0, 0x4f, 0xc3, 0x1f, 0xee };
  // The primary IP phone attribute.
  /*[id(0x00030001)]*/ int get_IPPhonePrimary(out wchar* ppName);
  // The primary IP phone attribute.
  /*[id(0x00030001)]*/ int set_IPPhonePrimary(wchar* ppName);
}

// Interface to configure ILS server.
interface ITILSConfig : IDispatch {
  mixin(uuid("34621d72-6cff-11d1-aff7-00c04fc31fee"));
  // static DWINGUID IID = { 0x34621d72, 0x6cff, 0x11d1, 0xaf, 0xf7, 0x00, 0xc0, 0x4f, 0xc3, 0x1f, 0xee };
  // The port the ILS server is listening on.
  /*[id(0x00020001)]*/ int get_Port(out int pPort);
  // The port the ILS server is listening on.
  /*[id(0x00020001)]*/ int set_Port(int pPort);
}

// CoClasses

// The Rendezvous Control Class
abstract class Rendezvous {
  mixin(uuid("f1029e5b-cb5b-11d0-8d59-00c04fd91ac0"));
  // static DWINGUID CLSID = { 0xf1029e5b, 0xcb5b, 0x11d0, 0x8d, 0x59, 0x00, 0xc0, 0x4f, 0xd9, 0x1a, 0xc0 };
  mixin Interfaces!(ITRendezvous);
}

// Global variables
const int RENDBIND_AUTHENTICATE = 0x00000001;
const int RENDBIND_DEFAULTDOMAINNAME = 0x00000002;
const int RENDBIND_DEFAULTUSERNAME = 0x00000004;
const int RENDBIND_DEFAULTPASSWORD = 0x00000008;
const int RENDBIND_DEFAULTCREDENTIALS = 0x0000000E;
