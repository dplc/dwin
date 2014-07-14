// Windows Media Services DRM Storage object
// Version 1.0

/*[uuid("760c4b74-e211-11d2-bf3e-00805fbe84a6")]*/
//module dwin.sys.win32.com.tlb.more.wmsdrmstor;
module dwin.sys.win32.com.tlb.more.drmstor;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// Windows Media Services DRM Storage Interface
interface IWMSDrmStore : IDispatch {
  mixin(uuid("760c4b82-e211-11d2-bf3e-00805fbe84a6"));
  // static DWINGUID IID = { 0x760c4b82, 0xe211, 0x11d2, 0xbf, 0x3e, 0x00, 0x80, 0x5f, 0xbe, 0x84, 0xa6 };
  // Used to give a license to DRM to store.
  /*[id(0x00000001)]*/ int StoreLicense(wchar* strLicense);
}

// CoClasses

// WMSDrmStore Class
abstract class WMSDrmStore {
  mixin(uuid("760c4b83-e211-11d2-bf3e-00805fbe84a6"));
  // static DWINGUID CLSID = { 0x760c4b83, 0xe211, 0x11d2, 0xbf, 0x3e, 0x00, 0x80, 0x5f, 0xbe, 0x84, 0xa6 };
  mixin Interfaces!(IWMSDrmStore);
}
