// NodeMgr 1.0 Type Library
// Version 1.0

/*[uuid("43136eb0-d36c-11cf-adbc-00aa00a80033")]*/
//module dwin.sys.win32.com.tlb.more.nodemgr;
module dwin.sys.win32.com.tlb.more.mmcndmgr;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// IDocConfig Interface
interface IDocConfig : IDispatch {
  mixin(uuid("f1e752c2-fd72-11d0-aef6-00c04fb6dd2c"));
  // static DWINGUID IID = { 0xf1e752c2, 0xfd72, 0x11d0, 0xae, 0xf6, 0x00, 0xc0, 0x4f, 0xb6, 0xdd, 0x2c };
  // method OpenFile
  /*[id(0x00000001)]*/ int OpenFile(wchar* bstrFilePath);
  // method CloseFile
  /*[id(0x00000002)]*/ int CloseFile();
  // method SaveFile
  /*[id(0x00000003)]*/ int SaveFile(wchar* bstrFilePath);
  // method EnableSnapInExtension
  /*[id(0x00000004)]*/ int EnableSnapInExtension(wchar* bstrSnapInCLSID, wchar* bstrExtensionCLSID, short bEnable);
}

// TaskSymbolEvents Interface
interface TaskSymbolEvents : IDispatch {
  mixin(uuid("bc0b572c-0599-4ccf-bf8d-e21da624e5f7"));
  // static DWINGUID IID = { 0xbc0b572c, 0x0599, 0x4ccf, 0xbf, 0x8d, 0xe2, 0x1d, 0xa6, 0x24, 0xe5, 0xf7 };
  /+// Event generated when the symbol is clicked
  /*[id(0xFFFFFDA8)]*/ void Click();+/
}

// CoClasses

// NodeInit Class
abstract class NodeInit {
  mixin(uuid("43136eb5-d36c-11cf-adbc-00aa00a80033"));
  // static DWINGUID CLSID = { 0x43136eb5, 0xd36c, 0x11cf, 0xad, 0xbc, 0x00, 0xaa, 0x00, 0xa8, 0x00, 0x33 };
  mixin Interfaces!(IUnknown);
}

// Master scope tree interface
abstract class ScopeTree {
  mixin(uuid("7f1899da-62a6-11d0-a2c6-00c04fd909dd"));
  // static DWINGUID CLSID = { 0x7f1899da, 0x62a6, 0x11d0, 0xa2, 0xc6, 0x00, 0xc0, 0x4f, 0xd9, 0x09, 0xdd };
  mixin Interfaces!(IUnknown);
}

// MMCDocConfig Class
abstract class MMCDocConfig {
  mixin(uuid("f1e752c3-fd72-11d0-aef6-00c04fb6dd2c"));
  // static DWINGUID CLSID = { 0xf1e752c3, 0xfd72, 0x11d0, 0xae, 0xf6, 0x00, 0xc0, 0x4f, 0xb6, 0xdd, 0x2c };
  mixin Interfaces!(IDocConfig);
}

// TaskSymbol Class
abstract class TaskSymbol {
  mixin(uuid("44f9a03b-a3ec-4f3b-9364-08e0007f21df"));
  // static DWINGUID CLSID = { 0x44f9a03b, 0xa3ec, 0x4f3b, 0x93, 0x64, 0x08, 0xe0, 0x00, 0x7f, 0x21, 0xdf };
  mixin Interfaces!();
}

// ComCacheCleanup Class
abstract class ComCacheCleanup {
  mixin(uuid("f7a4f1da-96c3-4bcf-beb3-1d9ffde89ee9"));
  // static DWINGUID CLSID = { 0xf7a4f1da, 0x96c3, 0x4bcf, 0xbe, 0xb3, 0x1d, 0x9f, 0xfd, 0xe8, 0x9e, 0xe9 };
  mixin Interfaces!(IUnknown);
}
