// Preview 1.0 Type Library
// Version 1.0

/*[uuid("50f16b18-467e-11d1-8271-00c04fc3183b")]*/
//module dwin.sys.win32.com.tlb.more.preview;
module dwin.sys.win32.com.tlb.more.shimgvw;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// IPreview Interface
interface IPreview : IDispatch {
  mixin(uuid("50f16b25-467e-11d1-8271-00c04fc3183b"));
  // static DWINGUID IID = { 0x50f16b25, 0x467e, 0x11d1, 0x82, 0x71, 0x00, 0xc0, 0x4f, 0xc3, 0x18, 0x3b };
  // method ShowFile
  /*[id(0x00000001)]*/ int ShowFile(wchar* bstrFileName, int iSelectCount);
  // property printable
  /*[id(0x00000002)]*/ int get_printable(out int pVal);
  // property printable
  /*[id(0x00000002)]*/ int set_printable(int pVal);
  // property cxImage
  /*[id(0x00000003)]*/ int get_cxImage(out int pVal);
  // property cyImage
  /*[id(0x00000004)]*/ int get_cyImage(out int pVal);
  // method Show
  /*[id(0x00000005)]*/ int Show(DWINVARIANT var);
}

// IPreview2 Interface
interface IPreview2 : IPreview {
  mixin(uuid("0ae0a2b1-3a34-11d3-9626-00c04f8eec8c"));
  // static DWINGUID IID = { 0x0ae0a2b1, 0x3a34, 0x11d3, 0x96, 0x26, 0x00, 0xc0, 0x4f, 0x8e, 0xec, 0x8c };
  // zoom the image
  /*[id(0x60030000)]*/ int Zoom(int iSelectCount);
  // fit image to window
  /*[id(0x60030001)]*/ int BestFit();
  // show image at actual size
  /*[id(0x60030002)]*/ int ActualSize();
  // start a slideshow
  /*[id(0x60030003)]*/ int SlideShow();
}

// IPreview3 Interface
interface IPreview3 : IUnknown {
  mixin(uuid("497431ad-5481-4df7-ae5d-130d9cd50db3"));
  // static DWINGUID IID = { 0x497431ad, 0x5481, 0x4df7, 0xae, 0x5d, 0x13, 0x0d, 0x9c, 0xd5, 0x0d, 0xb3 };
  /*[id(0x60010000)]*/ int ShowFile(wchar* bstrFileName);
  /*[id(0x60010001)]*/ int Show(DWINVARIANT var);
  /*[id(0x60010002)]*/ int Zoom(int iSelectCount);
  /*[id(0x60010003)]*/ int BestFit();
  /*[id(0x60010004)]*/ int ActualSize();
  /*[id(0x60010005)]*/ int SlideShow();
  /*[id(0x60010006)]*/ int Rotate(uint dwAngle);
  /*[id(0x60010007)]*/ int SetWallpaper(wchar* bstrPath);
  /*[id(0x60010008)]*/ int SaveAs(wchar* bstrPath);
  /*[id(0x60010009)]*/ int get_cxImage(out int pVal);
  /*[id(0x6001000A)]*/ int get_cyImage(out int pVal);
}

// IImgCmdTarget Interface
interface IImgCmdTarget : IUnknown {
  mixin(uuid("ff36e952-72e9-4ea0-92fb-b63fe5037d78"));
  // static DWINGUID IID = { 0xff36e952, 0x72e9, 0x4ea0, 0x92, 0xfb, 0xb6, 0x3f, 0xe5, 0x03, 0x7d, 0x78 };
  /*[id(0x60010000)]*/ int GetMode(uint* pdw);
  /*[id(0x60010001)]*/ int GetPageFlags(uint* pdw);
  /*[id(0x60010002)]*/ int ZoomIn();
  /*[id(0x60010003)]*/ int ZoomOut();
  /*[id(0x60010004)]*/ int ActualSize();
  /*[id(0x60010005)]*/ int BestFit();
  /*[id(0x60010006)]*/ int Rotate(uint dwAngle);
  /*[id(0x60010007)]*/ int NextPage();
  /*[id(0x60010008)]*/ int PreviousPage();
}

// Event interface for ThumbCtl
interface DPreviewEvents : IDispatch {
  mixin(uuid("1b490296-50df-11d1-8b44-00c04fc3183b"));
  // static DWINGUID IID = { 0x1b490296, 0x50df, 0x11d1, 0x8b, 0x44, 0x00, 0xc0, 0x4f, 0xc3, 0x18, 0x3b };
  /+// The preview is closing.
  /*[id(0x00000001)]*/ void OnClose();+/
  /+// The preview image has been generated.
  /*[id(0x00000002)]*/ void OnPreviewReady();+/
  /+// There was an error generating the preview.
  /*[id(0x00000003)]*/ void OnError();+/
  /+// User chose Best Fit.
  /*[id(0x00000004)]*/ void OnBestFitPress();+/
  /+// User chose Actual Size.
  /*[id(0x00000005)]*/ void OnActualSizePress();+/
}

// CoClasses

// Preview Class
abstract class Preview {
  mixin(uuid("50f16b26-467e-11d1-8271-00c04fc3183b"));
  // static DWINGUID CLSID = { 0x50f16b26, 0x467e, 0x11d1, 0x82, 0x71, 0x00, 0xc0, 0x4f, 0xc3, 0x18, 0x3b };
  mixin Interfaces!(IPreview2);
}
