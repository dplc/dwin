// HHCtrl 4.0 Type Library
// Version 4.0

/*[uuid("adb880a2-d8ff-11cf-9377-00aa003b7a11")]*/
//module dwin.sys.win32.com.tlb.more.hhctrl;
module dwin.sys.win32.com.tlb.more.hhctrlui;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// Event interface for HHCtrl
interface _HHCtrlEvents : IDispatch {
  mixin(uuid("adb880a3-d8ff-11cf-9377-00aa003b7a11"));
  // static DWINGUID IID = { 0xadb880a3, 0xd8ff, 0x11cf, 0x93, 0x77, 0x00, 0xaa, 0x00, 0x3b, 0x7a, 0x11 };
  /+/*[id(0x00000000)]*/ void Click(wchar* ParamString);+/
}

// IHHCtrl Interface
interface IHHCtrl : IDispatch {
  mixin(uuid("adb880a1-d8ff-11cf-9377-00aa003b7a11"));
  // static DWINGUID IID = { 0xadb880a1, 0xd8ff, 0x11cf, 0x93, 0x77, 0x00, 0xaa, 0x00, 0x3b, 0x7a, 0x11 };
  /*[id(0x00000001)]*/ int set_Image(wchar* path);
  /*[id(0x00000001)]*/ int get_Image(out wchar* path);
  // Click method
  /*[id(0x00000005)]*/ int Click();
  // Click method
  /*[id(0x00000009)]*/ int HHClick();
  // Print method
  /*[id(0x00000006)]*/ int Print();
  // syncURL method
  /*[id(0x00000004)]*/ int syncURL(wchar* pszUrl);
  // TCard method
  /*[id(0x00000007)]*/ int TCard(uint wParam, int lParam);
  // Text Popup method
  /*[id(0x00000008)]*/ int TextPopup(wchar* pszText, wchar* pszFont, int horzMargins, int vertMargins, uint clrForeground, uint clrBackground);
}

// CoClasses

// HHCtrl Class
abstract class HHCtrl {
  mixin(uuid("adb880a6-d8ff-11cf-9377-00aa003b7a11"));
  // static DWINGUID CLSID = { 0xadb880a6, 0xd8ff, 0x11cf, 0x93, 0x77, 0x00, 0xaa, 0x00, 0x3b, 0x7a, 0x11 };
  mixin Interfaces!(IHHCtrl);
}
