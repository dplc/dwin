// Windows Media Player Launcher
// Version 1.0

/*[uuid("5cb42160-cd7c-4806-9367-1c4a65153f4a")]*/
//module dwin.sys.win32.com.tlb.more.wmplauncher;
module dwin.sys.win32.com.tlb.more.wmpshell;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// IWMPSkinManager: Public interface for Windows Media Player SDK.
interface IWMPSkinManager : IUnknown {
  mixin(uuid("076f2fa6-ed30-448b-8cc5-3f3ef3529c7a"));
  // static DWINGUID IID = { 0x076f2fa6, 0xed30, 0x448b, 0x8c, 0xc5, 0x3f, 0x3e, 0xf3, 0x52, 0x9c, 0x7a };
  /*[id(0x60010000)]*/ int SetVisualStyle(wchar* bstrPath);
}

// CoClasses

// WMPPlayAsPlaylistLauncher: Not Public.  Internal object used by Windows Media Player.
abstract class WMPPlayAsPlaylistLauncher {
  mixin(uuid("ce3fb1d1-02ae-4a5f-a6e9-d9f1b4073e6c"));
  // static DWINGUID CLSID = { 0xce3fb1d1, 0x02ae, 0x4a5f, 0xa6, 0xe9, 0xd9, 0xf1, 0xb4, 0x07, 0x3e, 0x6c };
  mixin Interfaces!(IUnknown);
}

// WMPPlayFolderAsPlaylistLauncher: Not Public.  Internal object used by Windows Media Player.
abstract class WMPPlayFolderAsPlaylistLauncher {
  mixin(uuid("7d4734e6-047e-41e2-aeaa-e763b4739dc4"));
  // static DWINGUID CLSID = { 0x7d4734e6, 0x047e, 0x41e2, 0xae, 0xaa, 0xe7, 0x63, 0xb4, 0x73, 0x9d, 0xc4 };
  mixin Interfaces!(IUnknown);
}

// WMPAddToPlaylistLauncher: Not Public.  Internal object used by Windows Media Player.
abstract class WMPAddToPlaylistLauncher {
  mixin(uuid("f1b9284f-e9dc-4e68-9d7e-42362a59f0fd"));
  // static DWINGUID CLSID = { 0xf1b9284f, 0xe9dc, 0x4e68, 0x9d, 0x7e, 0x42, 0x36, 0x2a, 0x59, 0xf0, 0xfd };
  mixin Interfaces!(IUnknown);
}

// WMPBurnAudioCDLauncher: Not Public.  Internal object used by Windows Media Player.
abstract class WMPBurnAudioCDLauncher {
  mixin(uuid("8dd448e6-c188-4aed-af92-44956194eb1f"));
  // static DWINGUID CLSID = { 0x8dd448e6, 0xc188, 0x4aed, 0xaf, 0x92, 0x44, 0x95, 0x61, 0x94, 0xeb, 0x1f };
  mixin Interfaces!(IUnknown);
}

// WMPSkinMngr: Not Public.  Internal object used by Windows Media Player.
abstract class WMPSkinMngr {
  mixin(uuid("b2a7fd52-301f-4348-b93a-638c6de49229"));
  // static DWINGUID CLSID = { 0xb2a7fd52, 0x301f, 0x4348, 0xb9, 0x3a, 0x63, 0x8c, 0x6d, 0xe4, 0x92, 0x29 };
  mixin Interfaces!(IWMPSkinManager);
}
