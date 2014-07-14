// MSPMSP 1.0 Type Library
// Version 1.0

/*[uuid("896e7419-3851-11d3-aa54-00c04fd22f6c")]*/
//module dwin.sys.win32.com.tlb.more.mdsp;
module dwin.sys.win32.com.tlb.more.mspmsp;

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

// MDServiceProvider Class
abstract class MDServiceProvider {
  mixin(uuid("896e73f0-3851-11d3-aa54-00c04fd22f6c"));
  // static DWINGUID CLSID = { 0x896e73f0, 0x3851, 0x11d3, 0xaa, 0x54, 0x00, 0xc0, 0x4f, 0xd2, 0x2f, 0x6c };
  mixin Interfaces!(IMDServiceProvider);
}

// MDSPEnumDevice Class
abstract class MDSPEnumDevice {
  mixin(uuid("896e742a-3851-11d3-aa54-00c04fd22f6c"));
  // static DWINGUID CLSID = { 0x896e742a, 0x3851, 0x11d3, 0xaa, 0x54, 0x00, 0xc0, 0x4f, 0xd2, 0x2f, 0x6c };
  mixin Interfaces!(IMDSPEnumDevice);
}

// MDSPDevice Class
abstract class MDSPDevice {
  mixin(uuid("896e742c-3851-11d3-aa54-00c04fd22f6c"));
  // static DWINGUID CLSID = { 0x896e742c, 0x3851, 0x11d3, 0xaa, 0x54, 0x00, 0xc0, 0x4f, 0xd2, 0x2f, 0x6c };
  mixin Interfaces!(IMDSPDevice);
}

// MDSPEnumStorage Class
abstract class MDSPEnumStorage {
  mixin(uuid("896e7430-3851-11d3-aa54-00c04fd22f6c"));
  // static DWINGUID CLSID = { 0x896e7430, 0x3851, 0x11d3, 0xaa, 0x54, 0x00, 0xc0, 0x4f, 0xd2, 0x2f, 0x6c };
  mixin Interfaces!(IMDSPEnumStorage);
}

// MDSPStorage Class
abstract class MDSPStorage {
  mixin(uuid("896e7432-3851-11d3-aa54-00c04fd22f6c"));
  // static DWINGUID CLSID = { 0x896e7432, 0x3851, 0x11d3, 0xaa, 0x54, 0x00, 0xc0, 0x4f, 0xd2, 0x2f, 0x6c };
  mixin Interfaces!(IMDSPStorage);
}

// MDSPStorageGlobals Class
abstract class MDSPStorageGlobals {
  mixin(uuid("896e7434-3851-11d3-aa54-00c04fd22f6c"));
  // static DWINGUID CLSID = { 0x896e7434, 0x3851, 0x11d3, 0xaa, 0x54, 0x00, 0xc0, 0x4f, 0xd2, 0x2f, 0x6c };
  mixin Interfaces!(IMDSPStorageGlobals);
}
