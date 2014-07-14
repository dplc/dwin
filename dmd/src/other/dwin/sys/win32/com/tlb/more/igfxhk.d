// igfxhk 1.0 Type Library
// Version 1.0

/*[uuid("a531fc81-cb91-11d4-aa31-00902704c6bf")]*/
module dwin.sys.win32.com.tlb.more.igfxhk;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// IHotKey Interface
interface IHotKey : IUnknown {
  mixin(uuid("a531fc8f-cb91-11d4-aa31-00902704c6bf"));
  // static DWINGUID IID = { 0xa531fc8f, 0xcb91, 0x11d4, 0xaa, 0x31, 0x00, 0x90, 0x27, 0x04, 0xc6, 0xbf };
  // method Start
  /*[id(0x60010000)]*/ int Start();
  // method Stop
  /*[id(0x60010001)]*/ int Stop();
  // property DeviceName
  /*[id(0x60010002)]*/ int set_DeviceName(wchar* value);
  // property IsSupported
  /*[id(0x60010003)]*/ int get_IsSupported(out int pVal);
  // property IsEnabled
  /*[id(0x60010004)]*/ int get_IsEnabled(out int pVal);
}

// CoClasses

// HotKey Class
abstract class HotKey {
  mixin(uuid("235cc099-cfb4-44d9-8228-270fee479d8a"));
  // static DWINGUID CLSID = { 0x235cc099, 0xcfb4, 0x44d9, 0x82, 0x28, 0x27, 0x0f, 0xee, 0x47, 0x9d, 0x8a };
  mixin Interfaces!(IHotKey);
}
