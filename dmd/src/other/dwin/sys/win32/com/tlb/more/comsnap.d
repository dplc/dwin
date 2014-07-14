// ComSnap 1.0 Type Library
// Version 1.0

/*[uuid("410381cd-af42-11d1-8f10-00c04fc2c17b")]*/
module dwin.sys.win32.com.tlb.more.comsnap;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Unions

union __MIDL_IWinTypes_0009 {
  int hInproc;
  int hRemote;
}

// Structs

struct _RemotableHandle {
  int fContext;
  __MIDL_IWinTypes_0009 u;
}

// Aliases

alias _RemotableHandle* wireHWND;

// Interfaces

// ICOMNSView Interface
interface ICOMNSView : IDispatch {
  mixin(uuid("410381da-af42-11d1-8f10-00c04fc2c17b"));
  // static DWINGUID IID = { 0x410381da, 0xaf42, 0x11d1, 0x8f, 0x10, 0x00, 0xc0, 0x4f, 0xc2, 0xc1, 0x7b };
}

interface ICOMNSViewHelper : IUnknown {
  mixin(uuid("7f0b2fed-b19e-11d1-8f10-00c04fc2c17b"));
  // static DWINGUID IID = { 0x7f0b2fed, 0xb19e, 0x11d1, 0x8f, 0x10, 0x00, 0xc0, 0x4f, 0xc2, 0xc1, 0x7b };
  /*[id(0x60010000)]*/ int SetNewContainerHWND(wireHWND hwnd);
}

// IComponentDataImpl Interface
interface IComponentDataImpl : IUnknown {
  mixin(uuid("410381dc-af42-11d1-8f10-00c04fc2c17b"));
  // static DWINGUID IID = { 0x410381dc, 0xaf42, 0x11d1, 0x8f, 0x10, 0x00, 0xc0, 0x4f, 0xc2, 0xc1, 0x7b };
}

// ISnapinAboutImpl Interface
interface ISnapinAboutImpl : IUnknown {
  mixin(uuid("410381df-af42-11d1-8f10-00c04fc2c17b"));
  // static DWINGUID IID = { 0x410381df, 0xaf42, 0x11d1, 0x8f, 0x10, 0x00, 0xc0, 0x4f, 0xc2, 0xc1, 0x7b };
}

// CoClasses

// COMNSView Class
abstract class COMNSView {
  mixin(uuid("410381db-af42-11d1-8f10-00c04fc2c17b"));
  // static DWINGUID CLSID = { 0x410381db, 0xaf42, 0x11d1, 0x8f, 0x10, 0x00, 0xc0, 0x4f, 0xc2, 0xc1, 0x7b };
  mixin Interfaces!(ICOMNSView, ICOMNSViewHelper);
}

// ComponentDataImpl Class
abstract class ComponentDataImpl {
  mixin(uuid("c9bc92df-5b9a-11d1-8f00-00c04fc2c17b"));
  // static DWINGUID CLSID = { 0xc9bc92df, 0x5b9a, 0x11d1, 0x8f, 0x00, 0x00, 0xc0, 0x4f, 0xc2, 0xc1, 0x7b };
  mixin Interfaces!(IComponentDataImpl);
}

// SnapinAboutImpl Class
abstract class SnapinAboutImpl {
  mixin(uuid("d7fcb63b-5c55-11d1-8f00-00c04fc2c17b"));
  // static DWINGUID CLSID = { 0xd7fcb63b, 0x5c55, 0x11d1, 0x8f, 0x00, 0x00, 0xc0, 0x4f, 0xc2, 0xc1, 0x7b };
  mixin Interfaces!(ISnapinAboutImpl);
}

// PartitionSetPropPages Class
abstract class PartitionSetPropPages {
  mixin(uuid("9305969b-f45f-47e5-a954-6ea879e874cc"));
  // static DWINGUID CLSID = { 0x9305969b, 0xf45f, 0x47e5, 0xa9, 0x54, 0x6e, 0xa8, 0x79, 0xe8, 0x74, 0xcc };
  mixin Interfaces!(IDispatch);
}

// PartitionPropPages Class
abstract class PartitionPropPages {
  mixin(uuid("2797cf92-415a-43e6-a8f7-a5faab783719"));
  // static DWINGUID CLSID = { 0x2797cf92, 0x415a, 0x43e6, 0xa8, 0xf7, 0xa5, 0xfa, 0xab, 0x78, 0x37, 0x19 };
  mixin Interfaces!(IDispatch);
}

// UserPropPages Class
abstract class UserPropPages {
  mixin(uuid("fa3e1d55-16df-446d-872e-bd04d4f39c93"));
  // static DWINGUID CLSID = { 0xfa3e1d55, 0x16df, 0x446d, 0x87, 0x2e, 0xbd, 0x04, 0xd4, 0xf3, 0x9c, 0x93 };
  mixin Interfaces!(IDispatch);
}

// PartitionSetContextMenu Class
abstract class PartitionSetContextMenu {
  mixin(uuid("eebd2f15-87ee-4f93-856f-6ad7e31787b3"));
  // static DWINGUID CLSID = { 0xeebd2f15, 0x87ee, 0x4f93, 0x85, 0x6f, 0x6a, 0xd7, 0xe3, 0x17, 0x87, 0xb3 };
  mixin Interfaces!(IDispatch);
}

// PartitionContextMenu Class
abstract class PartitionContextMenu {
  mixin(uuid("ab790aa1-cdc1-478a-9351-b2e05cfcad09"));
  // static DWINGUID CLSID = { 0xab790aa1, 0xcdc1, 0x478a, 0x93, 0x51, 0xb2, 0xe0, 0x5c, 0xfc, 0xad, 0x09 };
  mixin Interfaces!(IDispatch);
}

// PartitionContextMenu Class
abstract class PartitionNotifyHandler {
  mixin(uuid("a00e1768-4a9b-4d97-afc6-99d329f605f2"));
  // static DWINGUID CLSID = { 0xa00e1768, 0x4a9b, 0x4d97, 0xaf, 0xc6, 0x99, 0xd3, 0x29, 0xf6, 0x05, 0xf2 };
  mixin Interfaces!(IDispatch);
}
