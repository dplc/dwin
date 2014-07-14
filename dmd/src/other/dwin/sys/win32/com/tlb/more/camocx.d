// wiaview 1.0 Type Library
// Version 1.0

/*[uuid("1f1c00f8-8876-11d2-8067-00805f6596d2")]*/
//module dwin.sys.win32.com.tlb.more.wiaview;
module dwin.sys.win32.com.tlb.more.camocx;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// IVideoPreview Interface
interface IVideoPreview : IDispatch {
  mixin(uuid("d82237ec-5be9-4760-b950-b7afa51b0ba9"));
  // static DWINGUID IID = { 0xd82237ec, 0x5be9, 0x4760, 0xb9, 0x50, 0xb7, 0xaf, 0xa5, 0x1b, 0x0b, 0xa9 };
  // Device Interface
  /*[id(0x00000001)]*/ int Device(IUnknown pDevice);
}

// CoClasses

// WIA VideoPreview Class
abstract class VideoPreview {
  mixin(uuid("457a23df-6f2a-4684-91d0-317fb768d87c"));
  // static DWINGUID CLSID = { 0x457a23df, 0x6f2a, 0x4684, 0x91, 0xd0, 0x31, 0x7f, 0xb7, 0x68, 0xd8, 0x7c };
  mixin Interfaces!(IVideoPreview);
}
