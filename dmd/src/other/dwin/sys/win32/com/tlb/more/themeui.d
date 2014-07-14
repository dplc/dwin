// Microsoft Theme API Type Library
// Version 1.0

/*[uuid("40643250-8d23-47fb-895c-eaf48e2c8892")]*/
//module dwin.sys.win32.com.tlb.more.themedisp;
module dwin.sys.win32.com.tlb.more.themeui;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// Theme Manager Interface
interface IThemeManagerDisp : IDispatch {
  mixin(uuid("56c927d6-56ef-482a-bfc2-582d6d5ae0e7"));
  // static DWINGUID IID = { 0x56c927d6, 0x56ef, 0x482a, 0xbf, 0xc2, 0x58, 0x2d, 0x6d, 0x5a, 0xe0, 0xe7 };
  // Get a property of a special marked scheme.  Like a filename, displayname, or canonical name.
  /*[id(0x00000096)]*/ int GetSelectedSchemeProperty(wchar* bstrName, out wchar* pbstrValue);
}

// CoClasses

// Theme Manager Class
abstract class ThemeManager {
  mixin(uuid("2e17c0ef-2851-459b-a3c8-27a41d4bc9f7"));
  // static DWINGUID CLSID = { 0x2e17c0ef, 0x2851, 0x459b, 0xa3, 0xc8, 0x27, 0xa4, 0x1d, 0x4b, 0xc9, 0xf7 };
  mixin Interfaces!(IThemeManagerDisp);
}
