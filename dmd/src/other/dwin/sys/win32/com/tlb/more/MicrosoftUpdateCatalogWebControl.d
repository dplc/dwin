// MicrosoftUpdateCatalogWebControl 1.0 Type Library
// Version 1.0

/*[uuid("efee32dd-8305-408e-bcae-ff792ca76ef2")]*/
module dwin.sys.win32.com.tlb.more.MicrosoftUpdateCatalogWebControl;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum tagDownloadFlags {
  e_downloadFlagPlaceHolder = 0x00000001,
}

enum tagDownloadState {
  e_downloadJobQueued = 0x00000000,
  e_downloadJobConnecting = 0x00000001,
  e_downloadJobTransferring = 0x00000002,
  e_downloadJobSuspended = 0x00000003,
  e_downloadJobError = 0x00000004,
  e_downloadJobTransientError = 0x00000005,
  e_downloadJobTransferred = 0x00000006,
  e_downloadJobAcknowledged = 0x00000007,
  e_downloadJobCancelled = 0x00000008,
}

enum tagOSVersionField {
  e_majorVer = 0x00000000,
  e_minorVer = 0x00000001,
  e_buildNumber = 0x00000002,
  e_platform = 0x00000003,
  e_SPMajor = 0x00000004,
  e_SPMinor = 0x00000005,
  e_productSuite = 0x00000006,
  e_productType = 0x00000007,
  e_systemMetric = 0x00000008,
  e_SPVersionString = 0x00000009,
  e_controlVersionString = 0x0000000A,
  e_maxOSVersionFieldValue = 0x0000000A,
}

// Aliases

alias tagDownloadFlags DownloadFlags;

alias tagDownloadState DownloadState;

alias tagOSVersionField OSVersionField;

// Interfaces

// IMUCatalogWebControl Interface
interface IMUCatalogWebControl : IDispatch {
  mixin(uuid("8ab565c4-e5e3-4393-ae1d-8a7a708316bc"));
  // static DWINGUID IID = { 0x8ab565c4, 0xe5e3, 0x4393, 0xae, 0x1d, 0x8a, 0x7a, 0x70, 0x83, 0x16, 0xbc };
  /*[id(0x60020001)]*/ int DownloadUpdate(wchar* bstrUpdateID, DWINVARIANT varDownloadInfoList, wchar* bstrDestinationPath, DownloadFlags dlFlags);
  /*[id(0x60020002)]*/ int CompleteTransfer(wchar* bstrUpdateID);
  /*[id(0x60020003)]*/ int CancelTransfer(wchar* bstrUpdateID);
  /*[id(0x60020004)]*/ int GetDownloadStatus(wchar* bstrUpdateID, out IMUCatalogDownloadStatus ppDownloadStatus);
  /*[id(0x60020005)]*/ int CheckIfFileExists(wchar* bstrFilePath, out short pfFilesExist);
  /*[id(0x60020006)]*/ int GetDirectory(wchar* bstrTitle, out wchar* pbstrSelectedPath);
  /*[id(0x60020007)]*/ int IsWsusApiPresent(out short pfWsusApiPresent);
  /*[id(0x60020008)]*/ int ImportToWsus(wchar* bstrUpdateID, DWINVARIANT varFileList, wchar* bstrServerName, short fUseSecureConn, int lPortNumber);
  /*[id(0x60020009)]*/ int GetOSVersionInfo(OSVersionField osField, int systemMetric, out DWINVARIANT osVersionInfo);
  /*[id(0x6002000A)]*/ int ValidateFile(wchar* bstrFilePath, wchar* bstrFileDigest, out short pfIsValid);
  /*[id(0x6002000B)]*/ int GetDefaultDirectory(out wchar* pbstrDefaultDir);
  /*[id(0x6002000C)]*/ int DownloadUpdateCore(wchar* bstrUpdateID, DWINVARIANT varDownloadInfoList, wchar* bstrDestinationPath, DownloadFlags dlFlags);
  /*[id(0x6002000D)]*/ int CompleteTransferCore(wchar* bstrUpdateID);
  /*[id(0x6002000E)]*/ int CancelTransferCore(wchar* bstrUpdateID);
  /*[id(0x6002000F)]*/ int GetDownloadStatusCore(wchar* bstrUpdateID, out IMUCatalogDownloadStatus ppDownloadStatus);
  /*[id(0x60020010)]*/ int ImportToLocalWsus(wchar* bstrUpdateID, DWINVARIANT varFileList);
  /*[id(0x60020011)]*/ int ImportToWsusCore(wchar* bstrUpdateID, DWINVARIANT varFileList, wchar* bstrServerName, short fUseSecureConn, int lPortNumber);
}

// IMUCatalogDownloadStatus Interface
interface IMUCatalogDownloadStatus : IDispatch {
  mixin(uuid("bb0bf87a-6a8a-47e8-864f-940391533bbe"));
  // static DWINGUID IID = { 0xbb0bf87a, 0x6a8a, 0x47e8, 0x86, 0x4f, 0x94, 0x03, 0x91, 0x53, 0x3b, 0xbe };
  /*[id(0x60020001)]*/ int get_BytesTotal(out uint pVal);
  /*[id(0x60020002)]*/ int get_BytesTransferred(out uint pVal);
  /*[id(0x60020003)]*/ int get_DownloadState(out DownloadState pVal);
}

// CoClasses

// MUCatalogWebControl Class
abstract class MUCatalogWebControl {
  mixin(uuid("5ae58fcf-6f6a-49b2-b064-02492c66e3f4"));
  // static DWINGUID CLSID = { 0x5ae58fcf, 0x6f6a, 0x49b2, 0xb0, 0x64, 0x02, 0x49, 0x2c, 0x66, 0xe3, 0xf4 };
  mixin Interfaces!(IMUCatalogWebControl);
}
