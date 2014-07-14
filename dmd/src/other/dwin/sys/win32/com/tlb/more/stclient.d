// STClient 1.0 Type Library
// Version 1.0

/*[uuid("92ad68aa-17e0-11d1-b230-00c04fb9473f")]*/
module dwin.sys.win32.com.tlb.more.stclient;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// ISimpleDataTableDispenser
interface ISimpleDataTableDispenser : IUnknown {
  mixin(uuid("4915a36c-0138-11d1-8d56-00c04fc2e0c7"));
  // static DWINGUID IID = { 0x4915a36c, 0x0138, 0x11d1, 0x8d, 0x56, 0x00, 0xc0, 0x4f, 0xc2, 0xe0, 0xc7 };
  /*[id(0x60010000)]*/ int GetTable(ref DWINGUID i_did, ref DWINGUID i_tid, void* i_QueryData, void* i_QueryMeta, uint i_eQueryFormat, uint i_fTable, wchar* i_wszLocator, void *o_ppv);
}

// ISimpleTableRead
interface ISimpleTableRead : IUnknown {
  mixin(uuid("958b6db6-ae2f-11d1-8de1-00c04fc2e0c7"));
  // static DWINGUID IID = { 0x958b6db6, 0xae2f, 0x11d1, 0x8d, 0xe1, 0x00, 0xc0, 0x4f, 0xc2, 0xe0, 0xc7 };
  /*[id(0x60010000)]*/ int PopulateCache();
  /*[id(0x60010001)]*/ int RestartRow();
  /*[id(0x60010002)]*/ int MoveToNextRow();
  /*[id(0x60010003)]*/ int MoveToRowByIndex(uint i_iRow);
  /*[id(0x60010004)]*/ int MoveToRowByIdentity(uint* i_acb, void** i_apv);
  /*[id(0x60010005)]*/ int GetColumn(uint i_iColumn, out uint o_pdbType, out uint o_pcbSize, void *o_ppv);
  /*[id(0x60010006)]*/ int GetTableMeta(out DWINGUID o_pdid, out DWINGUID o_ptid, void *o_pQueryData, void *o_pQueryMeta, out uint o_pfQueryFormat, out uint o_pfTable, out uint o_pcRows, out uint o_pcColumns);
  /*[id(0x60010007)]*/ int GetColumnMeta(uint i_iColumn, out uint o_pdbType, out uint o_pcbSize, out uint o_pfMeta);
  /*[id(0x60010008)]*/ int CloneCursor(out ISimpleTableRead o_ppISTRead);
}

// ISimpleTableWrite
interface ISimpleTableWrite : ISimpleTableRead {
  mixin(uuid("0032d55a-c320-11d1-8dec-00c04fc2e0c7"));
  // static DWINGUID IID = { 0x0032d55a, 0xc320, 0x11d1, 0x8d, 0xec, 0x00, 0xc0, 0x4f, 0xc2, 0xe0, 0xc7 };
  /*[id(0x60020000)]*/ int UpdateStore();
  /*[id(0x60020001)]*/ int RestartWriteRow();
  /*[id(0x60020002)]*/ int MoveToNextWriteRow(out uint o_peAction);
  /*[id(0x60020003)]*/ int AddRowForInsert();
  /*[id(0x60020004)]*/ int AddRowForUpdate();
  /*[id(0x60020005)]*/ int AddRowForDelete();
  /*[id(0x60020006)]*/ int SetRow();
  /*[id(0x60020007)]*/ int GetWriteColumn(uint i_iColumn, out uint o_pfStatus, out uint o_pdbType, out uint o_pcb, void *o_ppv);
  /*[id(0x60020008)]*/ int SetWriteColumn(uint i_iColumn, uint i_cb, void* i_pv);
}

// ISimpleTableMarshall
interface ISimpleTableMarshall : IUnknown {
  mixin(uuid("e7073790-bbc6-11d1-9d31-006008b0e5ca"));
  // static DWINGUID IID = { 0xe7073790, 0xbbc6, 0x11d1, 0x9d, 0x31, 0x00, 0x60, 0x08, 0xb0, 0xe5, 0xca };
  /*[id(0x60010000)]*/ int SupplyMarshallable(uint i_fCaches, out ubyte o_ppv1, out uint o_pcb1, out ubyte o_ppv2, out uint o_pcb2, out ubyte o_ppv3, out uint o_pcb3, out ubyte o_ppv4, out uint o_pcb4, out ubyte o_ppv5, out uint o_pcb5);
  /*[id(0x60010001)]*/ int ConsumeMarshallable(uint i_fCaches, ubyte* i_pv1, uint i_cb1, ubyte* i_pv2, uint i_cb2, ubyte* i_pv3, uint i_cb3, ubyte* i_pv4, uint i_cb4, ubyte* i_pv5, uint i_cb5);
}

// IRemoteHelper
interface IRemoteHelper : IUnknown {
  mixin(uuid("cb46e850-fc2f-11d2-b126-00805fc73204"));
  // static DWINGUID IID = { 0xcb46e850, 0xfc2f, 0x11d2, 0xb1, 0x26, 0x00, 0x80, 0x5f, 0xc7, 0x32, 0x04 };
  /*[id(0x60010000)]*/ int GetAcceptableSecuritySettings(wchar* i_wszComputer, out uint o_dwImpersonationLevel, out uint o_dwAuthenticationService);
}

// CoClasses

// STClient Class
abstract class STClient {
  mixin(uuid("92ad68ab-17e0-11d1-b230-00c04fb9473f"));
  // static DWINGUID CLSID = { 0x92ad68ab, 0x17e0, 0x11d1, 0xb2, 0x30, 0x00, 0xc0, 0x4f, 0xb9, 0x47, 0x3f };
  mixin Interfaces!(ISimpleDataTableDispenser, ISimpleTableRead, ISimpleTableWrite, ISimpleTableMarshall);
}

// RemoteHelper Class
abstract class RemoteHelper {
  mixin(uuid("e423af7c-fc2d-11d2-b126-00805fc73204"));
  // static DWINGUID CLSID = { 0xe423af7c, 0xfc2d, 0x11d2, 0xb1, 0x26, 0x00, 0x80, 0x5f, 0xc7, 0x32, 0x04 };
  mixin Interfaces!(IRemoteHelper);
}
