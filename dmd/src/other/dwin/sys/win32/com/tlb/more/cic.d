// cic 1.0 Type Library
// Version 1.0

/*[uuid("3d5905e0-523c-11d1-9fea-00600832db4a")]*/
module dwin.sys.win32.com.tlb.more.cic;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Aliases

alias int LONG_PTR;

// Interfaces

// IMMCCtrl Interface
interface IMMCCtrl : IDispatch {
  mixin(uuid("3d5905ed-523c-11d1-9fea-00600832db4a"));
  // static DWINGUID IID = { 0x3d5905ed, 0x523c, 0x11d1, 0x9f, 0xea, 0x00, 0x60, 0x08, 0x32, 0xdb, 0x4a };
  // method TaskNotify
  /*[id(0x00000001)]*/ int TaskNotify(wchar* szClsid, DWINVARIANT* pvArg, DWINVARIANT* pvParam);
  // method GetFirstTask
  /*[id(0x00000002)]*/ int GetFirstTask(wchar* szGroupText, out IDispatch retval);
  // method GetNextTask
  /*[id(0x00000003)]*/ int GetNextTask(out IDispatch retval);
  // method GetTitle
  /*[id(0x00000004)]*/ int GetTitle(wchar* szGroupText, out wchar* retval);
  // method GetDescriptiveText
  /*[id(0x00000005)]*/ int GetDescriptiveText(wchar* szGroupText, out wchar* retval);
  // method GetBackground
  /*[id(0x00000006)]*/ int GetBackground(wchar* szGroupText, out IDispatch pDispatch);
  // method GetListPadInfo
  /*[id(0x00000007)]*/ int GetListPadInfo(wchar* szGroupText, out IDispatch pDispatch);
}

// IMMCCtrlEvent Interface
interface IMMCCtrlEvent : IDispatch {
  mixin(uuid("69c7c394-905c-11d2-91ad-00c04fa37e1f"));
  // static DWINGUID IID = { 0x69c7c394, 0x905c, 0x11d2, 0x91, 0xad, 0x00, 0xc0, 0x4f, 0xa3, 0x7e, 0x1f };
  // Enable/disable task
  /*[id(0x00000001)]*/ int TaskEnable(int lTaskIndex, int bEnable);
}

// IMMCTask Interface
interface IMMCTask : IDispatch {
  mixin(uuid("3d112e21-62b2-11d1-9fef-00600832db4a"));
  // static DWINGUID IID = { 0x3d112e21, 0x62b2, 0x11d1, 0x9f, 0xef, 0x00, 0x60, 0x08, 0x32, 0xdb, 0x4a };
  // property DisplayObject
  /*[id(0x00000001)]*/ int get_DisplayObject(out IDispatch pDispatch);
  // property Text
  /*[id(0x00000002)]*/ int get_Text(out wchar* pVal);
  // property Help
  /*[id(0x00000003)]*/ int get_Help(out wchar* pVal);
  // property ActionType
  /*[id(0x00000004)]*/ int get_ActionType(out int pVal);
  // property CommandID
  /*[id(0x00000005)]*/ int get_CommandID(out LONG_PTR pVal);
  // property ActionURL
  /*[id(0x00000006)]*/ int get_ActionURL(out wchar* pVal);
  // property Script
  /*[id(0x00000007)]*/ int get_Script(out wchar* pVal);
  // property Clsid
  /*[id(0x00000008)]*/ int get_Clsid(out wchar* pVal);
  // property ScriptLanguage
  /*[id(0x00000009)]*/ int get_ScriptLanguage(out wchar* pVal);
}

// IMMCDisplayObject Interface
interface IMMCDisplayObject : IDispatch {
  mixin(uuid("995a890b-f4c9-11d1-a1bf-0000f875b132"));
  // static DWINGUID IID = { 0x995a890b, 0xf4c9, 0x11d1, 0xa1, 0xbf, 0x00, 0x00, 0xf8, 0x75, 0xb1, 0x32 };
  // property:  DisplayObject type
  /*[id(0x00000001)]*/ int get_DisplayObjectType(out int pVal);
  // property: name of font family
  /*[id(0x00000002)]*/ int get_FontFamilyName(out wchar* pVal);
  // property: URL to EOT file
  /*[id(0x00000003)]*/ int get_URLtoEOT(out wchar* pVal);
  // property: symbol string
  /*[id(0x00000004)]*/ int get_SymbolString(out wchar* pVal);
  // property: mouseover Bitmap
  /*[id(0x00000005)]*/ int get_MouseOverBitmap(out wchar* pVal);
  // property: mouseoff Bitmap
  /*[id(0x00000006)]*/ int get_MouseOffBitmap(out wchar* pVal);
}

// IMMCListPadInfo Interface
interface IMMCListPadInfo : IDispatch {
  mixin(uuid("09474571-b2fb-11d1-a1a1-0000f875b132"));
  // static DWINGUID IID = { 0x09474571, 0xb2fb, 0x11d1, 0xa1, 0xa1, 0x00, 0x00, 0xf8, 0x75, 0xb1, 0x32 };
  // property Title
  /*[id(0x00000001)]*/ int get_Title(out wchar* pVal);
  // property Text
  /*[id(0x00000002)]*/ int get_Text(out wchar* pVal);
  // property NotifyID
  /*[id(0x00000003)]*/ int get_NotifyID(out LONG_PTR pVal);
  // property Clsid
  /*[id(0x00000004)]*/ int get_Clsid(out wchar* pVal);
  // property HasButton
  /*[id(0x00000005)]*/ int get_HasButton(out int pVal);
}

// IListPad Interface
interface IListPad : IDispatch {
  mixin(uuid("5d00f5b1-a357-11d1-a19c-0000f875b132"));
  // static DWINGUID IID = { 0x5d00f5b1, 0xa357, 0x11d1, 0xa1, 0x9c, 0x00, 0x00, 0xf8, 0x75, 0xb1, 0x32 };
}

// Event interface for SysColorCtrl
interface _SysColorEvents : IDispatch {
  mixin(uuid("c47195ed-cd7a-11d1-8ea3-00c04f9900d7"));
  // static DWINGUID IID = { 0xc47195ed, 0xcd7a, 0x11d1, 0x8e, 0xa3, 0x00, 0xc0, 0x4f, 0x99, 0x00, 0xd7 };
  /+/*[id(0x00000001)]*/ void SysColorChange();+/
}

// ISysColorCtrl Interface
interface ISysColorCtrl : IDispatch {
  mixin(uuid("c47195eb-cd7a-11d1-8ea3-00c04f9900d7"));
  // static DWINGUID IID = { 0xc47195eb, 0xcd7a, 0x11d1, 0x8e, 0xa3, 0x00, 0xc0, 0x4f, 0x99, 0x00, 0xd7 };
  // property HEXactiveborder
  /*[id(0x00000001)]*/ int get_HEXactiveborder(out wchar* pVal);
  // property RGBactiveborder
  /*[id(0x00000002)]*/ int get_RGBactiveborder(out int pVal);
  // property HEXactivecaption
  /*[id(0x00000003)]*/ int get_HEXactivecaption(out wchar* pVal);
  // property RGBactivecaption
  /*[id(0x00000004)]*/ int get_RGBactivecaption(out int pVal);
  // property HEXappworkspace
  /*[id(0x00000005)]*/ int get_HEXappworkspace(out wchar* pVal);
  // property RGBappworkspace
  /*[id(0x00000006)]*/ int get_RGBappworkspace(out int pVal);
  // property HEXbackground
  /*[id(0x00000007)]*/ int get_HEXbackground(out wchar* pVal);
  // property RGBbackground
  /*[id(0x00000008)]*/ int get_RGBbackground(out int pVal);
  // property HEXbuttonface
  /*[id(0x00000009)]*/ int get_HEXbuttonface(out wchar* pVal);
  // property RGBbuttonface
  /*[id(0x0000000A)]*/ int get_RGBbuttonface(out int pVal);
  // property HEXbuttonhighlight
  /*[id(0x0000000B)]*/ int get_HEXbuttonhighlight(out wchar* pVal);
  // property RGBbuttonhighlight
  /*[id(0x0000000C)]*/ int get_RGBbuttonhighlight(out int pVal);
  // property HEXbuttonshadow
  /*[id(0x0000000D)]*/ int get_HEXbuttonshadow(out wchar* pVal);
  // property RGBbuttonshadow
  /*[id(0x0000000E)]*/ int get_RGBbuttonshadow(out int pVal);
  // property HEXbuttontext
  /*[id(0x0000000F)]*/ int get_HEXbuttontext(out wchar* pVal);
  // property RGBbuttontext
  /*[id(0x00000010)]*/ int get_RGBbuttontext(out int pVal);
  // property HEXcaptiontext
  /*[id(0x00000011)]*/ int get_HEXcaptiontext(out wchar* pVal);
  // property RGBcaptiontext
  /*[id(0x00000012)]*/ int get_RGBcaptiontext(out int pVal);
  // property HEXgraytext
  /*[id(0x00000013)]*/ int get_HEXgraytext(out wchar* pVal);
  // property RGBgraytext
  /*[id(0x00000014)]*/ int get_RGBgraytext(out int pVal);
  // property HEXhighlight
  /*[id(0x00000015)]*/ int get_HEXhighlight(out wchar* pVal);
  // property RGBhighlight
  /*[id(0x00000016)]*/ int get_RGBhighlight(out int pVal);
  // property HEXhighlighttext
  /*[id(0x00000017)]*/ int get_HEXhighlighttext(out wchar* pVal);
  // property RGBhighlighttext
  /*[id(0x00000018)]*/ int get_RGBhighlighttext(out int pVal);
  // property HEXinactiveborder
  /*[id(0x00000019)]*/ int get_HEXinactiveborder(out wchar* pVal);
  // property RGBinactiveborder
  /*[id(0x0000001A)]*/ int get_RGBinactiveborder(out int pVal);
  // property HEXinactivecaption
  /*[id(0x0000001B)]*/ int get_HEXinactivecaption(out wchar* pVal);
  // property RGBinactivecaption
  /*[id(0x0000001C)]*/ int get_RGBinactivecaption(out int pVal);
  // property HEXinactivecaptiontext
  /*[id(0x0000001D)]*/ int get_HEXinactivecaptiontext(out wchar* pVal);
  // property RGBinactivecaptiontext
  /*[id(0x0000001E)]*/ int get_RGBinactivecaptiontext(out int pVal);
  // property HEXinfobackground
  /*[id(0x0000001F)]*/ int get_HEXinfobackground(out wchar* pVal);
  // property RGBinfobackground
  /*[id(0x00000020)]*/ int get_RGBinfobackground(out int pVal);
  // property HEXinfotext
  /*[id(0x00000021)]*/ int get_HEXinfotext(out wchar* pVal);
  // property RGBinfotext
  /*[id(0x00000022)]*/ int get_RGBinfotext(out int pVal);
  // property HEXmenu
  /*[id(0x00000023)]*/ int get_HEXmenu(out wchar* pVal);
  // property RGBmenu
  /*[id(0x00000024)]*/ int get_RGBmenu(out int pVal);
  // property HEXmenutext
  /*[id(0x00000025)]*/ int get_HEXmenutext(out wchar* pVal);
  // property RGBmenutext
  /*[id(0x00000026)]*/ int get_RGBmenutext(out int pVal);
  // property HEXscrollbar
  /*[id(0x00000027)]*/ int get_HEXscrollbar(out wchar* pVal);
  // property RGBscrollbar
  /*[id(0x00000028)]*/ int get_RGBscrollbar(out int pVal);
  // property HEXthreeddarkshadow
  /*[id(0x00000029)]*/ int get_HEXthreeddarkshadow(out wchar* pVal);
  // property RGBthreeddarkshadow
  /*[id(0x0000002A)]*/ int get_RGBthreeddarkshadow(out int pVal);
  // property HEXthreedface
  /*[id(0x0000002B)]*/ int get_HEXthreedface(out wchar* pVal);
  // property RGBthreedface
  /*[id(0x0000002C)]*/ int get_RGBthreedface(out int pVal);
  // property HEXthreedhighlight
  /*[id(0x0000002D)]*/ int get_HEXthreedhighlight(out wchar* pVal);
  // property RGBthreedhighlight
  /*[id(0x0000002E)]*/ int get_RGBthreedhighlight(out int pVal);
  // property HEXthreedlightshadow
  /*[id(0x0000002F)]*/ int get_HEXthreedlightshadow(out wchar* pVal);
  // property RGBthreedlightshadow
  /*[id(0x00000030)]*/ int get_RGBthreedlightshadow(out int pVal);
  // property HEXthreedshadow
  /*[id(0x00000031)]*/ int get_HEXthreedshadow(out wchar* pVal);
  // property RGBthreedshadow
  /*[id(0x00000032)]*/ int get_RGBthreedshadow(out int pVal);
  // property HEXwindow
  /*[id(0x00000033)]*/ int get_HEXwindow(out wchar* pVal);
  // property RGBwindow
  /*[id(0x00000034)]*/ int get_RGBwindow(out int pVal);
  // property HEXwindowframe
  /*[id(0x00000035)]*/ int get_HEXwindowframe(out wchar* pVal);
  // property RGBwindowframe
  /*[id(0x00000036)]*/ int get_RGBwindowframe(out int pVal);
  // property HEXwindowtext
  /*[id(0x00000037)]*/ int get_HEXwindowtext(out wchar* pVal);
  // property RGBwindowtext
  /*[id(0x00000038)]*/ int get_RGBwindowtext(out int pVal);
  // method ConvertRGBToHex
  /*[id(0x00000039)]*/ int ConvertRGBToHex(int rgb, out wchar* pszHex);
  // method ConvertHexToRGB
  /*[id(0x0000003A)]*/ int ConvertHexToRGB(wchar* szHex, out int pRGB);
  // method GetRedFromRGB
  /*[id(0x0000003B)]*/ int GetRedFromRGB(int rgb, out short pVal);
  // method GetGreenFromRGB
  /*[id(0x0000003C)]*/ int GetGreenFromRGB(int rgb, out short pVal);
  // method GetBlueFromRGB
  /*[id(0x0000003D)]*/ int GetBlueFromRGB(int rgb, out short pVal);
  // method GetDerivedRGB
  /*[id(0x0000003E)]*/ int GetDerivedRGB(wchar* pszFrom, wchar* pszTo, wchar* pszFormat, short nPercent, out int pVal);
  // method GetDerivedHex
  /*[id(0x0000003F)]*/ int GetDerivedHex(wchar* pszFrom, wchar* pszTo, wchar* pszFormat, short nPercent, out wchar* pVal);
  // method Get3QuarterLightRGB
  /*[id(0x00000040)]*/ int Get3QuarterLightRGB(wchar* pszFrom, wchar* pszFormat, out int pVal);
  // method Get3QuarterLightHex
  /*[id(0x00000041)]*/ int Get3QuarterLightHex(wchar* pszFrom, wchar* pszFormat, out wchar* pVal);
  // method GetHalfLightRGB
  /*[id(0x00000042)]*/ int GetHalfLightRGB(wchar* pszFrom, wchar* pszFormat, out int pVal);
  // method GetHalfLightHex
  /*[id(0x00000043)]*/ int GetHalfLightHex(wchar* pszFrom, wchar* pszFormat, out wchar* pVal);
  // method GetQuarterLightRGB
  /*[id(0x00000044)]*/ int GetQuarterLightRGB(wchar* pszFrom, wchar* pszFormat, out int pVal);
  // method GetQuarterLightHex
  /*[id(0x00000045)]*/ int GetQuarterLightHex(wchar* pszFrom, wchar* pszFormat, out wchar* pVal);
  // method Get3QuarterDarkRGB
  /*[id(0x00000046)]*/ int Get3QuarterDarkRGB(wchar* pszFrom, wchar* pszFormat, out int pVal);
  // method Get3QuarterDarkHex
  /*[id(0x00000047)]*/ int Get3QuarterDarkHex(wchar* pszFrom, wchar* pszFormat, out wchar* pVal);
  // method GetHalfDarkRGB
  /*[id(0x00000048)]*/ int GetHalfDarkRGB(wchar* pszFrom, wchar* pszFormat, out int pVal);
  // method GetHalfDarkHex
  /*[id(0x00000049)]*/ int GetHalfDarkHex(wchar* pszFrom, wchar* pszFormat, out wchar* pVal);
  // method GetQuarterDarkRGB
  /*[id(0x0000004A)]*/ int GetQuarterDarkRGB(wchar* pszFrom, wchar* pszFormat, out int pVal);
  // method GetQuarterDarkHex
  /*[id(0x0000004B)]*/ int GetQuarterDarkHex(wchar* pszFrom, wchar* pszFormat, out wchar* pVal);
}

// CoClasses

// MMCCtrl Class
abstract class MMCCtrl {
  mixin(uuid("545ae700-50bf-11d1-9fe9-00600832db4a"));
  // static DWINGUID CLSID = { 0x545ae700, 0x50bf, 0x11d1, 0x9f, 0xe9, 0x00, 0x60, 0x08, 0x32, 0xdb, 0x4a };
  mixin Interfaces!(IMMCCtrl);
}

// MMCTask Class
abstract class MMCTask {
  mixin(uuid("3d112e22-62b2-11d1-9fef-00600832db4a"));
  // static DWINGUID CLSID = { 0x3d112e22, 0x62b2, 0x11d1, 0x9f, 0xef, 0x00, 0x60, 0x08, 0x32, 0xdb, 0x4a };
  mixin Interfaces!(IMMCTask);
}

// MMCDisplayObject Class
abstract class MMCDisplayObject {
  mixin(uuid("995a890c-f4c9-11d1-a1bf-0000f875b132"));
  // static DWINGUID CLSID = { 0x995a890c, 0xf4c9, 0x11d1, 0xa1, 0xbf, 0x00, 0x00, 0xf8, 0x75, 0xb1, 0x32 };
  mixin Interfaces!(IMMCDisplayObject);
}

// MMCListPadInfo Class
abstract class MMCListPadInfo {
  mixin(uuid("09474572-b2fb-11d1-a1a1-0000f875b132"));
  // static DWINGUID CLSID = { 0x09474572, 0xb2fb, 0x11d1, 0xa1, 0xa1, 0x00, 0x00, 0xf8, 0x75, 0xb1, 0x32 };
  mixin Interfaces!(IMMCListPadInfo);
}

// ListPad Class
abstract class ListPad {
  mixin(uuid("289228de-a31e-11d1-a19c-0000f875b132"));
  // static DWINGUID CLSID = { 0x289228de, 0xa31e, 0x11d1, 0xa1, 0x9c, 0x00, 0x00, 0xf8, 0x75, 0xb1, 0x32 };
  mixin Interfaces!(IListPad);
}

// SysColorCtrl Class
abstract class SysColorCtrl {
  mixin(uuid("c47195ec-cd7a-11d1-8ea3-00c04f9900d7"));
  // static DWINGUID CLSID = { 0xc47195ec, 0xcd7a, 0x11d1, 0x8e, 0xa3, 0x00, 0xc0, 0x4f, 0x99, 0x00, 0xd7 };
  mixin Interfaces!(ISysColorCtrl);
}
