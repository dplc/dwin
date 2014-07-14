// mswmdm 1.0 Type Library
// Version 1.0

/*[uuid("6ec6c744-355f-11d3-8470-00c04f79dbc0")]*/
module dwin.sys.win32.com.tlb.more.mswmdm;

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

struct tagCONNECTDATA {
  IUnknown pUnk;
  uint dwCookie;
}

// Interfaces

interface IClassFactory : IUnknown {
  mixin(uuid("00000001-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00000001, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RemoteCreateInstance(ref DWINGUID riid, out IUnknown ppvObject);
  /*[id(0x60010001)]*/ int RemoteLockServer(int fLock);
}

interface IWMDeviceManager : IUnknown {
  mixin(uuid("1dcb3a00-33ed-11d3-8470-00c04f79dbc0"));
  // static DWINGUID IID = { 0x1dcb3a00, 0x33ed, 0x11d3, 0x84, 0x70, 0x00, 0xc0, 0x4f, 0x79, 0xdb, 0xc0 };
  /*[id(0x60010000)]*/ int GetRevision(out uint pdwRevision);
  /*[id(0x60010001)]*/ int GetDeviceCount(out uint pdwCount);
  /*[id(0x60010002)]*/ int EnumDevices(out IWMDMEnumDevice ppEnumDevice);
}

interface IWMDMEnumDevice : IUnknown {
  mixin(uuid("1dcb3a01-33ed-11d3-8470-00c04f79dbc0"));
  // static DWINGUID IID = { 0x1dcb3a01, 0x33ed, 0x11d3, 0x84, 0x70, 0x00, 0xc0, 0x4f, 0x79, 0xdb, 0xc0 };
  /*[id(0x60010000)]*/ int Next(uint celt, out IWMDMDevice ppDevice, out uint pceltFetched);
  /*[id(0x60010001)]*/ int Skip(uint celt, out uint pceltFetched);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IWMDMEnumDevice ppEnumDevice);
}

interface IWMDMDevice : IUnknown {
  mixin(uuid("1dcb3a02-33ed-11d3-8470-00c04f79dbc0"));
  // static DWINGUID IID = { 0x1dcb3a02, 0x33ed, 0x11d3, 0x84, 0x70, 0x00, 0xc0, 0x4f, 0x79, 0xdb, 0xc0 };
  /*[id(0x60010000)]*/ int GetName(out wchar* pwszName, uint nMaxChars);
  /*[id(0x60010001)]*/ int GetManufacturer(out wchar* pwszName, uint nMaxChars);
  /*[id(0x60010002)]*/ int GetVersion(out uint pdwVersion);
  /*[id(0x60010003)]*/ int GetType(out uint pdwType);
  /*[id(0x60010004)]*/ int GetSerialNumber(out __WMDMID pSerialNumber, /*ref*/ ubyte[8] abMac);
  /*[id(0x60010005)]*/ int GetPowerSource(out uint pdwPowerSource, out uint pdwPercentRemaining);
  /*[id(0x60010006)]*/ int GetStatus(out uint pdwStatus);
  /*[id(0x60010007)]*/ int GetDeviceIcon(out uint hIcon);
  /*[id(0x60010008)]*/ int EnumStorage(out IWMDMEnumStorage ppEnumStorage);
  /*[id(0x60010009)]*/ int GetFormatSupport(out _tWAVEFORMATEX ppFormatEx, out uint pnFormatCount, out wchar* pppwszMimeType, out uint pnMimeTypeCount);
  /*[id(0x6001000A)]*/ int SendOpaqueCommand(ref __OPAQUECOMMAND pCommand);
}

interface IWMDMEnumStorage : IUnknown {
  mixin(uuid("1dcb3a05-33ed-11d3-8470-00c04f79dbc0"));
  // static DWINGUID IID = { 0x1dcb3a05, 0x33ed, 0x11d3, 0x84, 0x70, 0x00, 0xc0, 0x4f, 0x79, 0xdb, 0xc0 };
  /*[id(0x60010000)]*/ int Next(uint celt, out IWMDMStorage ppStorage, out uint pceltFetched);
  /*[id(0x60010001)]*/ int Skip(uint celt, out uint pceltFetched);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IWMDMEnumStorage ppEnumStorage);
}

interface IWMDMStorage : IUnknown {
  mixin(uuid("1dcb3a06-33ed-11d3-8470-00c04f79dbc0"));
  // static DWINGUID IID = { 0x1dcb3a06, 0x33ed, 0x11d3, 0x84, 0x70, 0x00, 0xc0, 0x4f, 0x79, 0xdb, 0xc0 };
  /*[id(0x60010000)]*/ int SetAttributes(uint dwAttributes, _tWAVEFORMATEX* pFormat);
  /*[id(0x60010001)]*/ int GetStorageGlobals(out IWMDMStorageGlobals ppStorageGlobals);
  /*[id(0x60010002)]*/ int GetAttributes(out uint pdwAttributes, ref _tWAVEFORMATEX pFormat);
  /*[id(0x60010003)]*/ int GetName(out wchar* pwszName, uint nMaxChars);
  /*[id(0x60010004)]*/ int GetDate(out _WMDMDATETIME pDateTimeUTC);
  /*[id(0x60010005)]*/ int GetSize(out uint pdwSizeLow, out uint pdwSizeHigh);
  /*[id(0x60010006)]*/ int GetRights(out __WMDMRIGHTS ppRights, out uint pnRightsCount, /*ref*/ ubyte[8] abMac);
  /*[id(0x60010007)]*/ int EnumStorage(out IWMDMEnumStorage pEnumStorage);
  /*[id(0x60010008)]*/ int SendOpaqueCommand(ref __OPAQUECOMMAND pCommand);
}

interface IWMDMStorageGlobals : IUnknown {
  mixin(uuid("1dcb3a07-33ed-11d3-8470-00c04f79dbc0"));
  // static DWINGUID IID = { 0x1dcb3a07, 0x33ed, 0x11d3, 0x84, 0x70, 0x00, 0xc0, 0x4f, 0x79, 0xdb, 0xc0 };
  /*[id(0x60010000)]*/ int GetCapabilities(out uint pdwCapabilities);
  /*[id(0x60010001)]*/ int GetSerialNumber(out __WMDMID pSerialNum, /*ref*/ ubyte[8] abMac);
  /*[id(0x60010002)]*/ int GetTotalSize(out uint pdwTotalSizeLow, out uint pdwTotalSizeHigh);
  /*[id(0x60010003)]*/ int GetTotalFree(out uint pdwFreeLow, out uint pdwFreeHigh);
  /*[id(0x60010004)]*/ int GetTotalBad(out uint pdwBadLow, out uint pdwBadHigh);
  /*[id(0x60010005)]*/ int GetStatus(out uint pdwStatus);
  /*[id(0x60010006)]*/ int Initialize(uint fuMode, IWMDMProgress pProgress);
}

interface IWMDMProgress : IUnknown {
  mixin(uuid("1dcb3a0c-33ed-11d3-8470-00c04f79dbc0"));
  // static DWINGUID IID = { 0x1dcb3a0c, 0x33ed, 0x11d3, 0x84, 0x70, 0x00, 0xc0, 0x4f, 0x79, 0xdb, 0xc0 };
  /*[id(0x60010000)]*/ int Begin(uint dwEstimatedTicks);
  /*[id(0x60010001)]*/ int Progress(uint dwTranspiredTicks);
  /*[id(0x60010002)]*/ int End();
}

interface IConnectionPointContainer : IUnknown {
  mixin(uuid("b196b284-bab4-101a-b69c-00aa00341d07"));
  // static DWINGUID IID = { 0xb196b284, 0xbab4, 0x101a, 0xb6, 0x9c, 0x00, 0xaa, 0x00, 0x34, 0x1d, 0x07 };
  /*[id(0x60010000)]*/ int EnumConnectionPoints(out IEnumConnectionPoints ppEnum);
  /*[id(0x60010001)]*/ int FindConnectionPoint(ref DWINGUID riid, out IConnectionPoint ppCP);
}

interface IEnumConnectionPoints : IUnknown {
  mixin(uuid("b196b285-bab4-101a-b69c-00aa00341d07"));
  // static DWINGUID IID = { 0xb196b285, 0xbab4, 0x101a, 0xb6, 0x9c, 0x00, 0xaa, 0x00, 0x34, 0x1d, 0x07 };
  /*[id(0x60010000)]*/ int RemoteNext(uint cConnections, out IConnectionPoint ppCP, out uint pcFetched);
  /*[id(0x60010001)]*/ int Skip(uint cConnections);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IEnumConnectionPoints ppEnum);
}

interface IConnectionPoint : IUnknown {
  mixin(uuid("b196b286-bab4-101a-b69c-00aa00341d07"));
  // static DWINGUID IID = { 0xb196b286, 0xbab4, 0x101a, 0xb6, 0x9c, 0x00, 0xaa, 0x00, 0x34, 0x1d, 0x07 };
  /*[id(0x60010000)]*/ int GetConnectionInterface(out DWINGUID pIID);
  /*[id(0x60010001)]*/ int GetConnectionPointContainer(out IConnectionPointContainer ppCPC);
  /*[id(0x60010002)]*/ int Advise(IUnknown pUnkSink, out uint pdwCookie);
  /*[id(0x60010003)]*/ int Unadvise(uint dwCookie);
  /*[id(0x60010004)]*/ int EnumConnections(out IEnumConnections ppEnum);
}

interface IEnumConnections : IUnknown {
  mixin(uuid("b196b287-bab4-101a-b69c-00aa00341d07"));
  // static DWINGUID IID = { 0xb196b287, 0xbab4, 0x101a, 0xb6, 0x9c, 0x00, 0xaa, 0x00, 0x34, 0x1d, 0x07 };
  /*[id(0x60010000)]*/ int RemoteNext(uint cConnections, out tagCONNECTDATA rgcd, out uint pcFetched);
  /*[id(0x60010001)]*/ int Skip(uint cConnections);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IEnumConnections ppEnum);
}

interface IWMDMRevoked : IUnknown {
  mixin(uuid("ebeccedb-88ee-4e55-b6a4-8d9f07d696aa"));
  // static DWINGUID IID = { 0xebeccedb, 0x88ee, 0x4e55, 0xb6, 0xa4, 0x8d, 0x9f, 0x07, 0xd6, 0x96, 0xaa };
  /*[id(0x60010000)]*/ int GetRevocationURL(ref wchar* ppwszRevocationURL, ref uint pdwBufferLen, out uint pdwRevokedBitFlag);
}

// CoClasses

// MediaDevMgrClassFactory Class
abstract class MediaDevMgrClassFactory {
  mixin(uuid("50040c1d-bdbf-4924-b873-f14d6c5bfd66"));
  // static DWINGUID CLSID = { 0x50040c1d, 0xbdbf, 0x4924, 0xb8, 0x73, 0xf1, 0x4d, 0x6c, 0x5b, 0xfd, 0x66 };
  mixin Interfaces!(IClassFactory);
}

// MediaDevMgr Class
abstract class MediaDevMgr {
  mixin(uuid("25baad81-3560-11d3-8471-00c04f79dbc0"));
  // static DWINGUID CLSID = { 0x25baad81, 0x3560, 0x11d3, 0x84, 0x71, 0x00, 0xc0, 0x4f, 0x79, 0xdb, 0xc0 };
  mixin Interfaces!(IWMDeviceManager, IConnectionPointContainer, IConnectionPoint);
}

// WMDMDevice Class
abstract class WMDMDevice {
  mixin(uuid("807b3cdf-357a-11d3-8471-00c04f79dbc0"));
  // static DWINGUID CLSID = { 0x807b3cdf, 0x357a, 0x11d3, 0x84, 0x71, 0x00, 0xc0, 0x4f, 0x79, 0xdb, 0xc0 };
  mixin Interfaces!(IWMDMDevice);
}

// WMDMStorage Class
abstract class WMDMStorage {
  mixin(uuid("807b3ce0-357a-11d3-8471-00c04f79dbc0"));
  // static DWINGUID CLSID = { 0x807b3ce0, 0x357a, 0x11d3, 0x84, 0x71, 0x00, 0xc0, 0x4f, 0x79, 0xdb, 0xc0 };
  mixin Interfaces!(IWMDMStorage, IWMDMRevoked);
}

// WMDMStorageGlobal Class
abstract class WMDMStorageGlobal {
  mixin(uuid("807b3ce1-357a-11d3-8471-00c04f79dbc0"));
  // static DWINGUID CLSID = { 0x807b3ce1, 0x357a, 0x11d3, 0x84, 0x71, 0x00, 0xc0, 0x4f, 0x79, 0xdb, 0xc0 };
  mixin Interfaces!(IWMDMStorageGlobals);
}

// WMDMDeviceEnum Class
abstract class WMDMDeviceEnum {
  mixin(uuid("430e35af-3971-11d3-8474-00c04f79dbc0"));
  // static DWINGUID CLSID = { 0x430e35af, 0x3971, 0x11d3, 0x84, 0x74, 0x00, 0xc0, 0x4f, 0x79, 0xdb, 0xc0 };
  mixin Interfaces!(IWMDMEnumDevice);
}

// WMDMStorageEnum Class
abstract class WMDMStorageEnum {
  mixin(uuid("eb401a3b-3af7-11d3-8474-00c04f79dbc0"));
  // static DWINGUID CLSID = { 0xeb401a3b, 0x3af7, 0x11d3, 0x84, 0x74, 0x00, 0xc0, 0x4f, 0x79, 0xdb, 0xc0 };
  mixin Interfaces!(IWMDMEnumStorage);
}
