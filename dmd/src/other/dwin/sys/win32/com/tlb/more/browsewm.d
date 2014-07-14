// Version 1.0

/*[uuid("3478e7b3-e18e-4548-a446-ddb5b4a59d9e")]*/
//module dwin.sys.win32.com.tlb.more.wmpproxy;
module dwin.sys.win32.com.tlb.more.browserwm;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// ITIMEProxyPlayer Interface
interface ITIMEProxyPlayer : IDispatch {
  mixin(uuid("0f317f2c-3938-4e5b-85d0-bed3f7a0cbf2"));
  // static DWINGUID IID = { 0x0f317f2c, 0x3938, 0x4e5b, 0x85, 0xd0, 0xbe, 0xd3, 0xf7, 0xa0, 0xcb, 0xf2 };
  /*[id(0x00000001)]*/ int get_playerObject(out IDispatch ppdispPlayerObject);
}

// CoClasses

// WMPProxy Class
abstract class WMPProxy {
  mixin(uuid("8610e1b4-57c3-441b-9821-c81c51c3ac08"));
  // static DWINGUID CLSID = { 0x8610e1b4, 0x57c3, 0x441b, 0x98, 0x21, 0xc8, 0x1c, 0x51, 0xc3, 0xac, 0x08 };
  mixin Interfaces!(ITIMEProxyPlayer);
}

// ContentProxy Class
abstract class ContentProxy {
  mixin(uuid("52ca3bcf-3b9b-419e-a3d6-5d28c0b0b50c"));
  // static DWINGUID CLSID = { 0x52ca3bcf, 0x3b9b, 0x419e, 0xa3, 0xd6, 0x5d, 0x28, 0xc0, 0xb0, 0xb5, 0x0c };
  mixin Interfaces!(ITIMEProxyPlayer);
}
