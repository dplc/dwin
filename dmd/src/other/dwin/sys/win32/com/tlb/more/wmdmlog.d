// WmdmLog 1.0 Type Library
// Version 1.0

/*[uuid("110a3201-5a79-11d3-8d78-444553540000")]*/
module dwin.sys.win32.com.tlb.more.wmdmlog;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

interface IWMDMLogger : IUnknown {
  mixin(uuid("110a3200-5a79-11d3-8d78-444553540000"));
  // static DWINGUID IID = { 0x110a3200, 0x5a79, 0x11d3, 0x8d, 0x78, 0x44, 0x45, 0x53, 0x54, 0x00, 0x00 };
  /*[id(0x60010000)]*/ int IsEnabled(out int pfEnabled);
  /*[id(0x60010001)]*/ int Enable(int fEnable);
  /*[id(0x60010002)]*/ int GetLogFileName(out char* pszFilename, uint nMaxChars);
  /*[id(0x60010003)]*/ int SetLogFileName(char* pszFilename);
  /*[id(0x60010004)]*/ int LogString(uint dwFlags, char* pszSrcName, char* pszLog);
  /*[id(0x60010005)]*/ int LogDword(uint dwFlags, char* pszSrcName, char* pszLogFormat, uint dwLog);
  /*[id(0x60010006)]*/ int Reset();
  /*[id(0x60010007)]*/ int GetSizeParams(out uint pdwMaxSize, out uint pdwShrinkToSize);
  /*[id(0x60010008)]*/ int SetSizeParams(uint dwMaxSize, uint dwShrinkToSize);
}

// CoClasses

// WMDMLogger Class
abstract class WMDMLogger {
  mixin(uuid("110a3202-5a79-11d3-8d78-444553540000"));
  // static DWINGUID CLSID = { 0x110a3202, 0x5a79, 0x11d3, 0x8d, 0x78, 0x44, 0x45, 0x53, 0x54, 0x00, 0x00 };
  mixin Interfaces!(IWMDMLogger);
}
