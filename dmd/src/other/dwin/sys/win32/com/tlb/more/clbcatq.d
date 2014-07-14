// CLBCatQ 1.0 Type Library
// Version 1.0

/*[uuid("8cfa6c81-b2ef-11d1-8b7e-00c04fd7a924")]*/
module dwin.sys.win32.com.tlb.more.clbcatq;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

interface IComCatalogInternal : IUnknown {
  mixin(uuid("a6304910-4115-11d2-8133-0060089f5fed"));
  // static DWINGUID IID = { 0xa6304910, 0x4115, 0x11d2, 0x81, 0x33, 0x00, 0x60, 0x08, 0x9f, 0x5f, 0xed };
  /*[id(0x60010000)]*/ int GetClassInfo(IUserToken pUserToken, ref DWINGUID guidConfiguredClsid, ref DWINGUID riid, void *ppv, void* pvReserved);
  /*[id(0x60010001)]*/ int GetApplicationInfo(IUserToken pUserToken, ref DWINGUID guidApplId, ref DWINGUID riid, void *ppv, void* pvReserved);
  /*[id(0x60010002)]*/ int GetProcessInfo(IUserToken pUserToken, ref DWINGUID guidProcess, ref DWINGUID riid, void *ppv, void* pvReserved);
  /*[id(0x60010003)]*/ int GetServerGroupInfo(IUserToken pUserToken, ref DWINGUID guidServerGroup, ref DWINGUID riid, void *ppv, void* pvReserved);
  /*[id(0x60010004)]*/ int GetRetQueueInfo(IUserToken pUserToken, wchar* wszFormatName, ref DWINGUID riid, void *ppv, void* pvReserved);
  /*[id(0x60010005)]*/ int GetApplicationInfoForExe(IUserToken pUserToken, wchar* pwszExeName, ref DWINGUID riid, void *ppv, void* pvReserved);
  /*[id(0x60010006)]*/ int GetTypeLibrary(IUserToken pUserToken, ref DWINGUID guidTypeLib, ref DWINGUID riid, void *ppv, void* pvReserved);
  /*[id(0x60010007)]*/ int GetInterfaceInfo(IUserToken pUserToken, ref DWINGUID iidInterface, ref DWINGUID riid, void *ppv, void* pComCatalog);
  /*[id(0x60010008)]*/ int FlushCache();
  /*[id(0x60010009)]*/ int GetClassInfoFromProgId(IUserToken pUserToken, ushort* pwszProgID, ref DWINGUID riid, void *ppv, void* pComCatalog);
}

interface IUserToken : IUnknown {
  mixin(uuid("000001fc-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x000001fc, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int GetUserClassesRootKey(void *phKey);
  /*[id(0x60010001)]*/ int ReleaseUserClassesRootKey();
  /*[id(0x60010002)]*/ int GetUserSid(out ubyte ppSid, out ushort pcbSid);
}

interface IComCatalog2Internal : IUnknown {
  mixin(uuid("3310dab4-edc0-4ce9-8a9c-8fea2980fd89"));
  // static DWINGUID IID = { 0x3310dab4, 0xedc0, 0x4ce9, 0x8a, 0x9c, 0x8f, 0xea, 0x29, 0x80, 0xfd, 0x89 };
  /*[id(0x60010000)]*/ int GetClassInfoByPartition(IUserToken pUserToken, ref DWINGUID guidConfiguredClsid, ref DWINGUID guidPartitionId, ref DWINGUID riid, void *ppv, void* pComCatalog);
  /*[id(0x60010001)]*/ int GetClassInfoByApplication(IUserToken pUserToken, ref DWINGUID guidConfiguredClsid, ref DWINGUID guidPartitionId, ref DWINGUID guidApplId, ref DWINGUID riid, void *ppv, void* pComCatalog);
}

interface IPartitionLookup : IUnknown {
  mixin(uuid("000001f8-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x000001f8, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int GetDefaultPartitionForUser(out IPartitionProperty ppPartitionProperty);
  /*[id(0x60010001)]*/ int IsPartitionValidForUser(ref DWINGUID pguidPartitionId, out int pfIsPartitionValid);
  /*[id(0x60010002)]*/ int GetDefaultPartitionForUserByToken(IUserToken pUserToken, out IPartitionProperty ppPartitionProperty);
  /*[id(0x60010003)]*/ int IsPartitionValidForUserByToken(IUserToken pUserToken, ref DWINGUID pguidPartitionId, out int pfIsPartitionValid);
  /*[id(0x60010004)]*/ int IsLocalStoreEnabled(out int pfEnabled);
  /*[id(0x60010005)]*/ int IsDSLookupEnabled(out int pfEnabled);
}

interface IPartitionProperty : IUnknown {
  mixin(uuid("000001f2-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x000001f2, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int GetPartitionID(out DWINGUID pGuid);
  /*[id(0x60010001)]*/ int SetPartitionID(ref DWINGUID pGuid);
}

// CoClasses

// ComCLBCatalog Class
abstract class ComCLBCatalog {
  mixin(uuid("a55b16ff-aff8-11d1-8b7e-00c04fd7a924"));
  // static DWINGUID CLSID = { 0xa55b16ff, 0xaff8, 0x11d1, 0x8b, 0x7e, 0x00, 0xc0, 0x4f, 0xd7, 0xa9, 0x24 };
  mixin Interfaces!(IComCatalogInternal, IComCatalog2Internal, IPartitionLookup);
}
