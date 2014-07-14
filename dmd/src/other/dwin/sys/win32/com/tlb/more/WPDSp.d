// WPDSp 1.0 Type Library
// Version 1.0

/*[uuid("b9b6535e-7706-490c-84a5-f40e125ad4b5")]*/
module dwin.sys.win32.com.tlb.more.WPDSp;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Structs

struct __WMDMID {
  uint cbSize;
  uint dwVendorID;
  ubyte[128] pID;
  uint SerialNumberLength;
}

struct _tWAVEFORMATEX {
  ushort wFormatTag;
  ushort nChannels;
  uint nSamplesPerSec;
  uint nAvgBytesPerSec;
  ushort nBlockAlign;
  ushort wBitsPerSample;
  ushort cbSize;
}

struct _WMDMDATETIME {
  ushort wYear;
  ushort wMonth;
  ushort wDay;
  ushort wHour;
  ushort wMinute;
  ushort wSecond;
}

struct __WMDMRIGHTS {
  uint cbSize;
  uint dwContentType;
  uint fuFlags;
  uint fuRights;
  uint dwAppSec;
  uint dwPlaybackCount;
  _WMDMDATETIME ExpirationDate;
}

struct __OPAQUECOMMAND {
 DWINGUID guidCommand;
  uint dwDataLen;
  ubyte* pData;
  ubyte[20] abMac;
}

// Interfaces

interface IMDServiceProvider2 : IMDServiceProvider {
  mixin(uuid("b2fa24b7-cda3-4694-9862-413ae1a34819"));
  // static DWINGUID IID = { 0xb2fa24b7, 0xcda3, 0x4694, 0x98, 0x62, 0x41, 0x3a, 0xe1, 0xa3, 0x48, 0x19 };
  /*[id(0x60020000)]*/ int CreateDevice(wchar* pwszDevicePath, out uint pdwCount, out IMDSPDevice pppDeviceArray);
}

interface IMDServiceProvider : IUnknown {
  mixin(uuid("1dcb3a10-33ed-11d3-8470-00c04f79dbc0"));
  // static DWINGUID IID = { 0x1dcb3a10, 0x33ed, 0x11d3, 0x84, 0x70, 0x00, 0xc0, 0x4f, 0x79, 0xdb, 0xc0 };
  /*[id(0x60010000)]*/ int GetDeviceCount(out uint pdwCount);
  /*[id(0x60010001)]*/ int EnumDevices(out IMDSPEnumDevice ppEnumDevice);
}

interface IMDSPEnumDevice : IUnknown {
  mixin(uuid("1dcb3a11-33ed-11d3-8470-00c04f79dbc0"));
  // static DWINGUID IID = { 0x1dcb3a11, 0x33ed, 0x11d3, 0x84, 0x70, 0x00, 0xc0, 0x4f, 0x79, 0xdb, 0xc0 };
  /*[id(0x60010000)]*/ int Next(uint celt, out IMDSPDevice ppDevice, out uint pceltFetched);
  /*[id(0x60010001)]*/ int Skip(uint celt, out uint pceltFetched);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IMDSPEnumDevice ppEnumDevice);
}

interface IMDSPDevice : IUnknown {
  mixin(uuid("1dcb3a12-33ed-11d3-8470-00c04f79dbc0"));
  // static DWINGUID IID = { 0x1dcb3a12, 0x33ed, 0x11d3, 0x84, 0x70, 0x00, 0xc0, 0x4f, 0x79, 0xdb, 0xc0 };
  /*[id(0x60010000)]*/ int GetName(out wchar* pwszName, uint nMaxChars);
  /*[id(0x60010001)]*/ int GetManufacturer(out wchar* pwszName, uint nMaxChars);
  /*[id(0x60010002)]*/ int GetVersion(out uint pdwVersion);
  /*[id(0x60010003)]*/ int GetType(out uint pdwType);
  /*[id(0x60010004)]*/ int GetSerialNumber(out __WMDMID pSerialNumber, /*ref*/ ubyte[8] abMac);
  /*[id(0x60010005)]*/ int GetPowerSource(out uint pdwPowerSource, out uint pdwPercentRemaining);
  /*[id(0x60010006)]*/ int GetStatus(out uint pdwStatus);
  /*[id(0x60010007)]*/ int GetDeviceIcon(out uint hIcon);
  /*[id(0x60010008)]*/ int EnumStorage(out IMDSPEnumStorage ppEnumStorage);
  /*[id(0x60010009)]*/ int GetFormatSupport(out _tWAVEFORMATEX pFormatEx, out uint pnFormatCount, out wchar* pppwszMimeType, out uint pnMimeTypeCount);
  /*[id(0x6001000A)]*/ int SendOpaqueCommand(ref __OPAQUECOMMAND pCommand);
}

interface IMDSPEnumStorage : IUnknown {
  mixin(uuid("1dcb3a15-33ed-11d3-8470-00c04f79dbc0"));
  // static DWINGUID IID = { 0x1dcb3a15, 0x33ed, 0x11d3, 0x84, 0x70, 0x00, 0xc0, 0x4f, 0x79, 0xdb, 0xc0 };
  /*[id(0x60010000)]*/ int Next(uint celt, out IMDSPStorage ppStorage, out uint pceltFetched);
  /*[id(0x60010001)]*/ int Skip(uint celt, out uint pceltFetched);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IMDSPEnumStorage ppEnumStorage);
}

interface IMDSPStorage : IUnknown {
  mixin(uuid("1dcb3a16-33ed-11d3-8470-00c04f79dbc0"));
  // static DWINGUID IID = { 0x1dcb3a16, 0x33ed, 0x11d3, 0x84, 0x70, 0x00, 0xc0, 0x4f, 0x79, 0xdb, 0xc0 };
  /*[id(0x60010000)]*/ int SetAttributes(uint dwAttributes, _tWAVEFORMATEX* pFormat);
  /*[id(0x60010001)]*/ int GetStorageGlobals(out IMDSPStorageGlobals ppStorageGlobals);
  /*[id(0x60010002)]*/ int GetAttributes(out uint pdwAttributes, out _tWAVEFORMATEX pFormat);
  /*[id(0x60010003)]*/ int GetName(out wchar* pwszName, uint nMaxChars);
  /*[id(0x60010004)]*/ int GetDate(out _WMDMDATETIME pDateTimeUTC);
  /*[id(0x60010005)]*/ int GetSize(out uint pdwSizeLow, out uint pdwSizeHigh);
  /*[id(0x60010006)]*/ int GetRights(out __WMDMRIGHTS ppRights, out uint pnRightsCount, /*ref*/ ubyte[8] abMac);
  /*[id(0x60010007)]*/ int CreateStorage(uint dwAttributes, _tWAVEFORMATEX* pFormat, wchar* pwszName, out IMDSPStorage ppNewStorage);
  /*[id(0x60010008)]*/ int EnumStorage(out IMDSPEnumStorage ppEnumStorage);
  /*[id(0x60010009)]*/ int SendOpaqueCommand(ref __OPAQUECOMMAND pCommand);
}

interface IMDSPStorageGlobals : IUnknown {
  mixin(uuid("1dcb3a17-33ed-11d3-8470-00c04f79dbc0"));
  // static DWINGUID IID = { 0x1dcb3a17, 0x33ed, 0x11d3, 0x84, 0x70, 0x00, 0xc0, 0x4f, 0x79, 0xdb, 0xc0 };
  /*[id(0x60010000)]*/ int GetCapabilities(out uint pdwCapabilities);
  /*[id(0x60010001)]*/ int GetSerialNumber(out __WMDMID pSerialNum, /*ref*/ ubyte[8] abMac);
  /*[id(0x60010002)]*/ int GetTotalSize(out uint pdwTotalSizeLow, out uint pdwTotalSizeHigh);
  /*[id(0x60010003)]*/ int GetTotalFree(out uint pdwFreeLow, out uint pdwFreeHigh);
  /*[id(0x60010004)]*/ int GetTotalBad(out uint pdwBadLow, out uint pdwBadHigh);
  /*[id(0x60010005)]*/ int GetStatus(out uint pdwStatus);
  /*[id(0x60010006)]*/ int Initialize(uint fuMode, IWMDMProgress pProgress);
  /*[id(0x60010007)]*/ int GetDevice(out IMDSPDevice ppDevice);
  /*[id(0x60010008)]*/ int GetRootStorage(out IMDSPStorage ppRoot);
}

interface IWMDMProgress : IUnknown {
  mixin(uuid("1dcb3a0c-33ed-11d3-8470-00c04f79dbc0"));
  // static DWINGUID IID = { 0x1dcb3a0c, 0x33ed, 0x11d3, 0x84, 0x70, 0x00, 0xc0, 0x4f, 0x79, 0xdb, 0xc0 };
  /*[id(0x60010000)]*/ int Begin(uint dwEstimatedTicks);
  /*[id(0x60010001)]*/ int Progress(uint dwTranspiredTicks);
  /*[id(0x60010002)]*/ int End();
}

// CoClasses

// WPDServiceProvider Class
abstract class WPDServiceProvider {
  mixin(uuid("77f7f122-20b0-4117-a2fb-059d1fc88256"));
  // static DWINGUID CLSID = { 0x77f7f122, 0x20b0, 0x4117, 0xa2, 0xfb, 0x05, 0x9d, 0x1f, 0xc8, 0x82, 0x56 };
  mixin Interfaces!(IMDServiceProvider2);
}
