// scp 1.0 Type Library
// Version 1.0

/*[uuid("32baed35-34b5-11d3-9315-00c04f72d6cf")]*/
//module dwin.sys.win32.com.tlb.more.scp;
module dwin.sys.win32.com.tlb.more.msscp;

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

interface ISCPSecureAuthenticate2 : ISCPSecureAuthenticate {
  mixin(uuid("b580cfae-1672-47e2-acaa-44bbecbcae5b"));
  // static DWINGUID IID = { 0xb580cfae, 0x1672, 0x47e2, 0xac, 0xaa, 0x44, 0xbb, 0xec, 0xbc, 0xae, 0x5b };
  /*[id(0x60020000)]*/ int GetSCPSession(out ISCPSession ppSCPSession);
}

interface ISCPSecureAuthenticate : IUnknown {
  mixin(uuid("1dcb3a0f-33ed-11d3-8470-00c04f79dbc0"));
  // static DWINGUID IID = { 0x1dcb3a0f, 0x33ed, 0x11d3, 0x84, 0x70, 0x00, 0xc0, 0x4f, 0x79, 0xdb, 0xc0 };
  /*[id(0x60010000)]*/ int GetSecureQuery(out ISCPSecureQuery ppSecureQuery);
}

interface ISCPSecureQuery : IUnknown {
  mixin(uuid("1dcb3a0d-33ed-11d3-8470-00c04f79dbc0"));
  // static DWINGUID IID = { 0x1dcb3a0d, 0x33ed, 0x11d3, 0x84, 0x70, 0x00, 0xc0, 0x4f, 0x79, 0xdb, 0xc0 };
  /*[id(0x60010000)]*/ int GetDataDemands(out uint pfuFlags, out uint pdwMinRightsData, out uint pdwMinExamineData, out uint pdwMinDecideData, /*ref*/ ubyte[8] abMac);
  /*[id(0x60010001)]*/ int ExamineData(uint fuFlags, wchar* pwszExtension, ubyte* pData, uint dwSize, /*ref*/ ubyte[8] abMac);
  /*[id(0x60010002)]*/ int MakeDecision(uint fuFlags, ubyte* pData, uint dwSize, uint dwAppSec, ubyte* pbSPSessionKey, uint dwSessionKeyLen, IMDSPStorageGlobals pStorageGlobals, out ISCPSecureExchange ppExchange, /*ref*/ ubyte[8] abMac);
  /*[id(0x60010003)]*/ int GetRights(ubyte* pData, uint dwSize, ubyte* pbSPSessionKey, uint dwSessionKeyLen, IMDSPStorageGlobals pStgGlobals, out __WMDMRIGHTS ppRights, out uint pnRightsCount, /*ref*/ ubyte[8] abMac);
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

interface ISCPSecureExchange : IUnknown {
  mixin(uuid("1dcb3a0e-33ed-11d3-8470-00c04f79dbc0"));
  // static DWINGUID IID = { 0x1dcb3a0e, 0x33ed, 0x11d3, 0x84, 0x70, 0x00, 0xc0, 0x4f, 0x79, 0xdb, 0xc0 };
  /*[id(0x60010000)]*/ int TransferContainerData(ubyte* pData, uint dwSize, out uint pfuReadyFlags, /*ref*/ ubyte[8] abMac);
  /*[id(0x60010001)]*/ int ObjectData(out ubyte pData, ref uint pdwSize, /*ref*/ ubyte[8] abMac);
  /*[id(0x60010002)]*/ int TransferComplete();
}

interface ISCPSession : IUnknown {
  mixin(uuid("88a3e6ed-eee4-4619-bbb3-fd4fb62715d1"));
  // static DWINGUID IID = { 0x88a3e6ed, 0xeee4, 0x4619, 0xbb, 0xb3, 0xfd, 0x4f, 0xb6, 0x27, 0x15, 0xd1 };
  /*[id(0x60010000)]*/ int BeginSession(IMDSPDevice pIDevice, ubyte* pCtx, uint dwSizeCtx);
  /*[id(0x60010001)]*/ int EndSession(ubyte* pCtx, uint dwSizeCtx);
  /*[id(0x60010002)]*/ int GetSecureQuery(out ISCPSecureQuery ppSecureQuery);
}

interface IComponentAuthenticate : IUnknown {
  mixin(uuid("a9889c00-6d2b-11d3-8496-00c04f79dbc0"));
  // static DWINGUID IID = { 0xa9889c00, 0x6d2b, 0x11d3, 0x84, 0x96, 0x00, 0xc0, 0x4f, 0x79, 0xdb, 0xc0 };
  /*[id(0x60010000)]*/ int SACAuth(uint dwProtocolID, uint dwPass, ubyte* pbDataIn, uint dwDataInLen, out ubyte ppbDataOut, out uint pdwDataOutLen);
  /*[id(0x60010001)]*/ int SACGetProtocols(out uint ppdwProtocols, out uint pdwProtocolCount);
}

interface ISCPSecureQuery2 : ISCPSecureQuery {
  mixin(uuid("ebe17e25-4fd7-4632-af46-6d93d4fcc72e"));
  // static DWINGUID IID = { 0xebe17e25, 0x4fd7, 0x4632, 0xaf, 0x46, 0x6d, 0x93, 0xd4, 0xfc, 0xc7, 0x2e };
  /*[id(0x60020000)]*/ int MakeDecision2(uint fuFlags, ubyte* pData, uint dwSize, uint dwAppSec, ubyte* pbSPSessionKey, uint dwSessionKeyLen, IMDSPStorageGlobals pStorageGlobals, ubyte* pAppCertApp, uint dwAppCertAppLen, ubyte* pAppCertSP, uint dwAppCertSPLen, ref wchar* pszRevocationURL, ref uint pdwRevocationURLLen, out uint pdwRevocationBitFlag, ref ulong pqwFileSize, IUnknown pUnknown, out ISCPSecureExchange ppExchange, /*ref*/ ubyte[8] abMac);
}

interface ISCPSecureQuery3 : ISCPSecureQuery2 {
  mixin(uuid("b7edd1a2-4dab-484b-b3c5-ad39b8b4c0b1"));
  // static DWINGUID IID = { 0xb7edd1a2, 0x4dab, 0x484b, 0xb3, 0xc5, 0xad, 0x39, 0xb8, 0xb4, 0xc0, 0xb1 };
  /*[id(0x60030000)]*/ int GetRightsOnClearChannel(ubyte* pData, uint dwSize, ubyte* pbSPSessionKey, uint dwSessionKeyLen, IMDSPStorageGlobals pStgGlobals, IWMDMProgress3 pProgressCallback, out __WMDMRIGHTS ppRights, out uint pnRightsCount);
  /*[id(0x60030001)]*/ int MakeDecisionOnClearChannel(uint fuFlags, ubyte* pData, uint dwSize, uint dwAppSec, ubyte* pbSPSessionKey, uint dwSessionKeyLen, IMDSPStorageGlobals pStorageGlobals, IWMDMProgress3 pProgressCallback, ubyte* pAppCertApp, uint dwAppCertAppLen, ubyte* pAppCertSP, uint dwAppCertSPLen, ref wchar* pszRevocationURL, ref uint pdwRevocationURLLen, out uint pdwRevocationBitFlag, ref ulong pqwFileSize, IUnknown pUnknown, out ISCPSecureExchange ppExchange);
}

interface IWMDMProgress3 : IWMDMProgress2 {
  mixin(uuid("21de01cb-3bb4-4929-b21a-17af3f80f658"));
  // static DWINGUID IID = { 0x21de01cb, 0x3bb4, 0x4929, 0xb2, 0x1a, 0x17, 0xaf, 0x3f, 0x80, 0xf6, 0x58 };
  /*[id(0x60030000)]*/ int Begin3(DWINGUID EventId, uint dwEstimatedTicks, ref __OPAQUECOMMAND pContext);
  /*[id(0x60030001)]*/ int Progress3(DWINGUID EventId, uint dwTranspiredTicks, ref __OPAQUECOMMAND pContext);
  /*[id(0x60030002)]*/ int End3(DWINGUID EventId, int hrCompletionCode, ref __OPAQUECOMMAND pContext);
}

interface IWMDMProgress2 : IWMDMProgress {
  mixin(uuid("3a43f550-b383-4e92-b04a-e6bbc660fefc"));
  // static DWINGUID IID = { 0x3a43f550, 0xb383, 0x4e92, 0xb0, 0x4a, 0xe6, 0xbb, 0xc6, 0x60, 0xfe, 0xfc };
  /*[id(0x60020000)]*/ int End2(int hrCompletionCode);
}

interface ISCPSecureExchange2 : ISCPSecureExchange {
  mixin(uuid("6c62fc7b-2690-483f-9d44-0a20cb35577c"));
  // static DWINGUID IID = { 0x6c62fc7b, 0x2690, 0x483f, 0x9d, 0x44, 0x0a, 0x20, 0xcb, 0x35, 0x57, 0x7c };
  /*[id(0x60020000)]*/ int TransferContainerData2(ubyte* pData, uint dwSize, IWMDMProgress3 pProgressCallback, out uint pfuReadyFlags, /*ref*/ ubyte[8] abMac);
}

interface ISCPSecureExchange3 : ISCPSecureExchange2 {
  mixin(uuid("ab4e77e4-8908-4b17-bd2a-b1dbe6dd69e1"));
  // static DWINGUID IID = { 0xab4e77e4, 0x8908, 0x4b17, 0xbd, 0x2a, 0xb1, 0xdb, 0xe6, 0xdd, 0x69, 0xe1 };
  /*[id(0x60030000)]*/ int TransferContainerDataOnClearChannel(IMDSPDevice pDevice, ubyte* pData, uint dwSize, IWMDMProgress3 pProgressCallback, out uint pfuReadyFlags);
  /*[id(0x60030001)]*/ int GetObjectDataOnClearChannel(IMDSPDevice pDevice, out ubyte pData, ref uint pdwSize);
  /*[id(0x60030002)]*/ int TransferCompleteForDevice(IMDSPDevice pDevice);
}

interface IWMDRMDeviceApp : IUnknown {
  mixin(uuid("93afdb44-b1e1-411d-b89b-75ad4f97882b"));
  // static DWINGUID IID = { 0x93afdb44, 0xb1e1, 0x411d, 0xb8, 0x9b, 0x75, 0xad, 0x4f, 0x97, 0x88, 0x2b };
  /*[id(0x60010000)]*/ int GenerateMeterChallenge(IWMDMDevice pDevice, wchar* bstrMeterCert, out wchar* pbstrMeterURL, out wchar* pbstrMeterData);
  /*[id(0x60010001)]*/ int ProcessMeterResponse(IWMDMDevice pDevice, ubyte* pbResponse, uint cbResponse, out uint pdwFlags);
  /*[id(0x60010002)]*/ int QueryDeviceStatus(IWMDMDevice pDevice, out uint pdwStatus);
  /*[id(0x60010003)]*/ int AcquireDeviceData(IWMDMDevice pDevice, IWMDMProgress3 pProgressCallback, uint dwFlags, out uint pdwStatus);
  /*[id(0x60010004)]*/ int SynchronizeLicenses(IWMDMDevice pDevice, IWMDMProgress3 pProgressCallback, uint cMinCountThreshold, uint cMinHoursThreshold);
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

// CoClasses

// MSSCP Class
abstract class MSSCP {
  mixin(uuid("32baed44-34b5-11d3-9315-00c04f72d6cf"));
  // static DWINGUID CLSID = { 0x32baed44, 0x34b5, 0x11d3, 0x93, 0x15, 0x00, 0xc0, 0x4f, 0x72, 0xd6, 0xcf };
  mixin Interfaces!(ISCPSecureAuthenticate2, IComponentAuthenticate, ISCPSecureAuthenticate);
}

// SCPSession Class
abstract class SCPSession {
  mixin(uuid("4786de0e-4f93-4ddf-92de-a0a6e049add2"));
  // static DWINGUID CLSID = { 0x4786de0e, 0x4f93, 0x4ddf, 0x92, 0xde, 0xa0, 0xa6, 0xe0, 0x49, 0xad, 0xd2 };
  mixin Interfaces!(ISCPSession);
}

// SCPTrans Class
abstract class SCPTRANS {
  mixin(uuid("5c140836-43de-11d3-847d-00c04f79dbc0"));
  // static DWINGUID CLSID = { 0x5c140836, 0x43de, 0x11d3, 0x84, 0x7d, 0x00, 0xc0, 0x4f, 0x79, 0xdb, 0xc0 };
  mixin Interfaces!(ISCPSecureQuery, ISCPSecureQuery2, ISCPSecureQuery3, ISCPSecureExchange, ISCPSecureExchange2, ISCPSecureExchange3, ISCPSession, IWMDRMDeviceApp);
}
