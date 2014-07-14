// OptsHold 1.0 Type Library
// Version 1.0

/*[uuid("3050f4e0-98b5-11cf-bb82-00aa00bdce0b")]*/
//module dwin.sys.win32.com.tlb.more.optshold;
module dwin.sys.win32.com.tlb.more.mshtmled;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// IHtmlDlgHelper Interface
interface IHtmlDlgHelper : IDispatch {
  mixin(uuid("3050f4df-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID IID = { 0x3050f4df, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  /*[id(0x00000001)]*/ int get_document(out IDispatch pVal);
  /*[id(0x00000002)]*/ int openfiledlg(DWINVARIANT initFile, DWINVARIANT initDir, DWINVARIANT filter, DWINVARIANT title, out wchar* pathName);
  /*[id(0x00000003)]*/ int savefiledlg(DWINVARIANT initFile, DWINVARIANT initDir, DWINVARIANT filter, DWINVARIANT title, out wchar* pathName);
  /*[id(0x00000004)]*/ int choosecolordlg(DWINVARIANT initColor, out int rgbColor);
  /*[id(0x00000005)]*/ int getCharset(wchar* fontName, out int charset);
  /*[id(0x00000006)]*/ int get_fonts(out IHtmlFontNamesCollection p);
}

// IHtmlFontNamesCollection Interface
interface IHtmlFontNamesCollection : IDispatch {
  mixin(uuid("3050f4eb-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID IID = { 0x3050f4eb, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  /*[id(0x00000001)]*/ int get_length(out int p);
  /*[id(0x00000002)]*/ int item(int index, out wchar* pBstr);
}

// CoClasses

// HtmlDlgHelper Class
abstract class HtmlDlgHelper {
  mixin(uuid("3050f4e1-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID CLSID = { 0x3050f4e1, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  mixin Interfaces!(IHtmlDlgHelper);
}
