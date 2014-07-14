// IAS DataStore2 1.0
// Version 1.0

/*[uuid("6bc096c5-0ce6-11d1-baae-00c04fc2e20d")]*/
//module dwin.sys.win32.com.tlb.more.datastore2;
module dwin.sys.win32.com.tlb.more.iasads;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

interface IDataStore2 : IDispatch {
  mixin(uuid("6bc096c2-0ce6-11d1-baae-00c04fc2e20d"));
  // static DWINGUID IID = { 0x6bc096c2, 0x0ce6, 0x11d1, 0xba, 0xae, 0x00, 0xc0, 0x4f, 0xc2, 0xe2, 0x0d };
  /*[id(0x60020000)]*/ int get_Root(out IDataStoreObject ppObject);
  /*[id(0x60020001)]*/ int Initialize(wchar* bstrDSName, wchar* bstrUserName, wchar* bstrPassword);
  /*[id(0x60020002)]*/ int OpenObject(wchar* bstrPath, out IDataStoreObject ppObject);
  /*[id(0x60020003)]*/ int Shutdown();
}

interface IDataStoreObject : IDispatch {
  mixin(uuid("6bc096c0-0ce6-11d1-baae-00c04fc2e20d"));
  // static DWINGUID IID = { 0x6bc096c0, 0x0ce6, 0x11d1, 0xba, 0xae, 0x00, 0xc0, 0x4f, 0xc2, 0xe2, 0x0d };
  /*[id(0x00000001)]*/ int get_Name(out wchar* pVal);
  /*[id(0x00000002)]*/ int get_Class(out wchar* pVal);
  /*[id(0x00000003)]*/ int get_GUID(out wchar* pVal);
  /*[id(0x00000004)]*/ int get_Container(out IDataStoreContainer pVal);
  /*[id(0x00000005)]*/ int GetValue(wchar* bstrName, out DWINVARIANT pVal);
  /*[id(0x00000006)]*/ int GetValueEx(wchar* bstrName, out DWINVARIANT pVal);
  /*[id(0x00000007)]*/ int PutValue(wchar* bstrName, DWINVARIANT* pVal);
  /*[id(0x00000008)]*/ int Update();
  /*[id(0x00000009)]*/ int Restore();
  /*[id(0x0000000A)]*/ int get_Count(out int pVal);
  /*[id(0x00000000)]*/ int Item(wchar* bstrName, out IDataStoreProperty pVal);
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown pVal);
}

interface IDataStoreContainer : IDispatch {
  mixin(uuid("6bc096c1-0ce6-11d1-baae-00c04fc2e20d"));
  // static DWINGUID IID = { 0x6bc096c1, 0x0ce6, 0x11d1, 0xba, 0xae, 0x00, 0xc0, 0x4f, 0xc2, 0xe2, 0x0d };
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown pVal);
  /*[id(0x00000000)]*/ int Item(wchar* bstrName, out IDataStoreObject ppObject);
  /*[id(0x00000001)]*/ int get_Count(out int pVal);
  /*[id(0x00000002)]*/ int Create(wchar* bstrClass, wchar* bstrName, out IDataStoreObject ppObject);
  /*[id(0x00000003)]*/ int MoveHere(IDataStoreObject pObject, wchar* bstrNewName);
  /*[id(0x00000004)]*/ int Remove(wchar* bstrClass, wchar* bstrName);
}

interface IDataStoreProperty : IDispatch {
  mixin(uuid("6bc096c9-0ce6-11d1-baae-00c04fc2e20d"));
  // static DWINGUID IID = { 0x6bc096c9, 0x0ce6, 0x11d1, 0xba, 0xae, 0x00, 0xc0, 0x4f, 0xc2, 0xe2, 0x0d };
  /*[id(0x00000001)]*/ int get_Name(out wchar* pVal);
  /*[id(0x00000002)]*/ int get_Value(out DWINVARIANT pVal);
  /*[id(0x00000003)]*/ int get_ValueEx(out DWINVARIANT pVal);
  /*[id(0x00000004)]*/ int get_Owner(out IDataStoreObject pVal);
}

// CoClasses

// IAS Active Directory Data Store
abstract class ADsDataStore {
  mixin(uuid("6bc096c6-0ce6-11d1-baae-00c04fc2e20d"));
  // static DWINGUID CLSID = { 0x6bc096c6, 0x0ce6, 0x11d1, 0xba, 0xae, 0x00, 0xc0, 0x4f, 0xc2, 0xe2, 0x0d };
  mixin Interfaces!(IDataStore2, IDispatch);
}

// IAS Networking Data Store
abstract class NetDataStore {
  mixin(uuid("6bc096c8-0ce6-11d1-baae-00c04fc2e20d"));
  // static DWINGUID CLSID = { 0x6bc096c8, 0x0ce6, 0x11d1, 0xba, 0xae, 0x00, 0xc0, 0x4f, 0xc2, 0xe2, 0x0d };
  mixin Interfaces!(IDataStore2, IDispatch);
}

// IAS OLE-DB Data Store
abstract class OleDBDataStore {
  mixin(uuid("6bc096c4-0ce6-11d1-baae-00c04fc2e20d"));
  // static DWINGUID CLSID = { 0x6bc096c4, 0x0ce6, 0x11d1, 0xba, 0xae, 0x00, 0xc0, 0x4f, 0xc2, 0xe2, 0x0d };
  mixin Interfaces!(IDataStore2, IDispatch);
}
