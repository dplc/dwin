// blockdriver 1.0 Type Library
// Version 1.0

/*[uuid("b842074c-8e12-4178-a6d8-7c0d7c87c43e")]*/
//module dwin.sys.win32.com.tlb.more.blockdriver;
module dwin.sys.win32.com.tlb.more.hotplug;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// IBlockedDrivers Interface
interface IBlockedDrivers : IDispatch {
  mixin(uuid("13f176d6-9b1d-477d-bd33-6fe75e960578"));
  // static DWINGUID IID = { 0x13f176d6, 0x9b1d, 0x477d, 0xbd, 0x33, 0x6f, 0xe7, 0x5e, 0x96, 0x05, 0x78 };
  // method BlockedDrivers
  /*[id(0x00000001)]*/ int BlockedDrivers(out IDispatch pCollection);
}

// IDrivers Interface
interface IDrivers : IDispatch {
  mixin(uuid("5fd0c0b2-0c30-43b2-a95b-2d7894acd1c1"));
  // static DWINGUID IID = { 0x5fd0c0b2, 0x0c30, 0x43b2, 0xa9, 0x5b, 0x2d, 0x78, 0x94, 0xac, 0xd1, 0xc1 };
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown ppUnk);
  // method Item
  /*[id(0x00000000)]*/ int Item(int Index, out IDispatch pVal);
  // property Count
  /*[id(0x00000001)]*/ int get_Count(out int pVal);
}

// IDriver Interface
interface IDriver : IDispatch {
  mixin(uuid("08b6a002-8a41-4282-ae6c-7be38158640c"));
  // static DWINGUID IID = { 0x08b6a002, 0x8a41, 0x4282, 0xae, 0x6c, 0x7b, 0xe3, 0x81, 0x58, 0x64, 0x0c };
  // property Name
  /*[id(0x00000001)]*/ int get_Name(out wchar* pVal);
  // property Description
  /*[id(0x00000002)]*/ int get_Description(out wchar* pVal);
  // property Manufacturer
  /*[id(0x00000003)]*/ int get_Manufacturer(out wchar* pVal);
  // property HelpFile
  /*[id(0x00000004)]*/ int get_HelpFile(out wchar* pVal);
}

// CoClasses

// BlockedDrivers Class
abstract class BlockedDrivers {
  mixin(uuid("783c030f-e948-487d-b35d-94fcf0f0c172"));
  // static DWINGUID CLSID = { 0x783c030f, 0xe948, 0x487d, 0xb3, 0x5d, 0x94, 0xfc, 0xf0, 0xf0, 0xc1, 0x72 };
  mixin Interfaces!(IBlockedDrivers);
}

// Drivers Class
abstract class Drivers {
  mixin(uuid("d1ae835c-9d92-492f-80b4-43356f75038c"));
  // static DWINGUID CLSID = { 0xd1ae835c, 0x9d92, 0x492f, 0x80, 0xb4, 0x43, 0x35, 0x6f, 0x75, 0x03, 0x8c };
  mixin Interfaces!(IDrivers);
}

// Driver Class
abstract class Driver {
  mixin(uuid("b62314fc-1215-4aec-bccd-ae51609ba291"));
  // static DWINGUID CLSID = { 0xb62314fc, 0x1215, 0x4aec, 0xbc, 0xcd, 0xae, 0x51, 0x60, 0x9b, 0xa2, 0x91 };
  mixin Interfaces!(IDriver);
}
