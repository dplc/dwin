// MTxAddIn Type Library
// Version 1.0

/*[uuid("1cb0a010-1676-11d0-825b-00a0c90395df")]*/
//module dwin.sys.win32.com.tlb.more.mtxaddin;
module dwin.sys.win32.com.tlb.more.commaddin;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// IMTxAddIn Interface
interface IMTxAddIn : IDispatch {
  mixin(uuid("1cb0a011-1676-11d0-825b-00a0c90395df"));
  // static DWINGUID IID = { 0x1cb0a011, 0x1676, 0x11d0, 0x82, 0x5b, 0x00, 0xa0, 0xc9, 0x03, 0x95, 0xdf };
  // Entry point; gets called from the VB IDE when loaded
  /*[id(0x00000000)]*/ int ConnectAddIn(ref IDispatch __MIDL_0010);
  // Entry point; gets called from the VB IDE when unloaded or shutting down
  /*[id(0x00000001)]*/ int DisconnectAddIn(ref short __MIDL_0011);
}

// CoClasses

// MTxAddIn Class
abstract class MTxAddIn {
  mixin(uuid("1cb0a015-1676-11d0-825b-00a0c90395df"));
  // static DWINGUID CLSID = { 0x1cb0a015, 0x1676, 0x11d0, 0x82, 0x5b, 0x00, 0xa0, 0xc9, 0x03, 0x95, 0xdf };
  mixin Interfaces!(IMTxAddIn);
}
