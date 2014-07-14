// CompatUI 1.0 Type Library
// Version 1.0

/*[uuid("233a5627-7755-4b36-aa00-656b8846f501")]*/
module dwin.sys.win32.com.tlb.more.compatUI;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;
private import dwin.sys.win32.com.tlb.stdole2;

// Interfaces

// _IProgViewEvents Interface
interface _IProgViewEvents : IDispatch {
  mixin(uuid("4bcbfec8-c7d4-4a48-a7a5-9824a6ba8755"));
  // static DWINGUID IID = { 0x4bcbfec8, 0xc7d4, 0x4a48, 0xa7, 0xa5, 0x98, 0x24, 0xa6, 0xba, 0x87, 0x55 };
  /+// method DblClk
  /*[id(0x00000001)]*/ int DblClk(int lFlags);+/
  /+// method ProgramListReady
  /*[id(0x00000002)]*/ int ProgramListReady();+/
}

// ISelectFile Interface
interface ISelectFile : IDispatch {
  mixin(uuid("78a029dd-b561-4702-a7ef-0ecd12eef7b1"));
  // static DWINGUID IID = { 0x78a029dd, 0xb561, 0x4702, 0xa7, 0xef, 0x0e, 0xcd, 0x12, 0xee, 0xf7, 0xb1 };
  /*[id(0xFFFFFE0B)]*/ int set_BackColor(OLE_COLOR pclr);
  /*[id(0xFFFFFE0B)]*/ int get_BackColor(out OLE_COLOR pclr);
  /*[id(0xFFFFFE0A)]*/ int set_BackStyle(int pstyle);
  /*[id(0xFFFFFE0A)]*/ int get_BackStyle(out int pstyle);
  /*[id(0xFFFFFDFE)]*/ int set_Enabled(short pbool);
  /*[id(0xFFFFFDFE)]*/ int get_Enabled(out short pbool);
  // property BrowseTitle
  /*[id(0x00000001)]*/ int get_BrowseTitle(out wchar* pVal);
  // property BrowseTitle
  /*[id(0x00000001)]*/ int set_BrowseTitle(wchar* pVal);
  // property BrowseFilter
  /*[id(0x00000002)]*/ int get_BrowseFilter(out wchar* pVal);
  // property BrowseFilter
  /*[id(0x00000002)]*/ int set_BrowseFilter(wchar* pVal);
  // property BrowseInitialDirectory
  /*[id(0x00000003)]*/ int get_BrowseInitialDirectory(out wchar* pVal);
  // property BrowseInitialDirectory
  /*[id(0x00000003)]*/ int set_BrowseInitialDirectory(wchar* pVal);
  // property BrowseFlags
  /*[id(0x00000004)]*/ int get_BrowseFlags(out int pVal);
  // property BrowseFlags
  /*[id(0x00000004)]*/ int set_BrowseFlags(int pVal);
  // property FileName
  /*[id(0x00000005)]*/ int get_FileName(out wchar* pVal);
  // property FileName
  /*[id(0x00000005)]*/ int set_FileName(wchar* pVal);
  // property ErrorCode
  /*[id(0x00000006)]*/ int get_ErrorCode(out int pVal);
  // property ExternAccel
  /*[id(0x00000008)]*/ int get_ExternAccel(out wchar* pVal);
  // property ExternAccel
  /*[id(0x00000008)]*/ int set_ExternAccel(wchar* pVal);
  // property BrowseBtnCaption
  /*[id(0x00000009)]*/ int get_BrowseBtnCaption(out wchar* pVal);
  // property BrowseBtnCaption
  /*[id(0x00000009)]*/ int set_BrowseBtnCaption(wchar* pVal);
  // property AccelCmd
  /*[id(0x0000000A)]*/ int get_AccelCmd(int lCmd, out wchar* pVal);
  // property AccelCmd
  /*[id(0x0000000A)]*/ int set_AccelCmd(int lCmd, wchar* pVal);
  // method ClearAccel
  /*[id(0x0000000B)]*/ int ClearAccel();
  // method ClearExternAccel
  /*[id(0x0000000C)]*/ int ClearExternAccel();
}

// IProgView Interface
interface IProgView : IDispatch {
  mixin(uuid("e84219c9-c6ca-42c9-bfae-521d1b23af96"));
  // static DWINGUID IID = { 0xe84219c9, 0xc6ca, 0x42c9, 0xbf, 0xae, 0x52, 0x1d, 0x1b, 0x23, 0xaf, 0x96 };
  /*[id(0xFFFFFE0B)]*/ int set_BackColor(OLE_COLOR pclr);
  /*[id(0xFFFFFE0B)]*/ int get_BackColor(out OLE_COLOR pclr);
  /*[id(0xFFFFFDFE)]*/ int set_Enabled(short pbool);
  /*[id(0xFFFFFDFE)]*/ int get_Enabled(out short pbool);
  // method GetSelectedItem
  /*[id(0x00000001)]*/ int GetSelectedItem();
  // property SelectionName
  /*[id(0x00000002)]*/ int get_SelectionName(out DWINVARIANT pVal);
  // method GetSelectionInformation
  /*[id(0x00000003)]*/ int GetSelectionInformation(int lInformationClass, out DWINVARIANT pVal);
  // method PopulateList
  /*[id(0x00000004)]*/ int PopulateList();
  // method UpdateListItem
  /*[id(0x00000005)]*/ int UpdateListItem(wchar* pTarget, DWINVARIANT* pKeys, out int pResult);
  // method CancelPopulateList
  /*[id(0x00000006)]*/ int CancelPopulateList();
  // property ExternAccel
  /*[id(0x00000008)]*/ int get_ExternAccel(out wchar* pVal);
  // property ExternAccel
  /*[id(0x00000008)]*/ int set_ExternAccel(wchar* pVal);
  // property ExcludeFiles
  /*[id(0x00000009)]*/ int get_ExcludeFiles(out wchar* pVal);
  // property ExcludeFiles
  /*[id(0x00000009)]*/ int set_ExcludeFiles(wchar* pVal);
  // property AccelCmd
  /*[id(0x0000000A)]*/ int get_AccelCmd(int lCmd, out wchar* pVal);
  // property AccelCmd
  /*[id(0x0000000A)]*/ int set_AccelCmd(int lCmd, wchar* pVal);
  // method ClearAccel
  /*[id(0x0000000B)]*/ int ClearAccel();
  // method ClearExternAccel
  /*[id(0x0000000C)]*/ int ClearExternAccel();
}

// IUtil Interface
interface IUtil : IDispatch {
  mixin(uuid("c5a7c759-1e8d-4b1b-b1e4-59f7f9b5171b"));
  // static DWINGUID IID = { 0xc5a7c759, 0x1e8d, 0x4b1b, 0xb1, 0xe4, 0x59, 0xf7, 0xf9, 0xb5, 0x17, 0x1b };
  // method RemoveArgs
  /*[id(0x00000001)]*/ int RemoveArgs(wchar* sVar, out DWINVARIANT pVal);
  // method GetItemKeys
  /*[id(0x00000002)]*/ int GetItemKeys(wchar* pszPath, out DWINVARIANT pszKeys);
  // method SetItemKeys
  /*[id(0x00000003)]*/ int SetItemKeys(wchar* pszPath, DWINVARIANT* pszKeys, out int pVal);
  // method CheckAdminPrivileges
  /*[id(0x00000004)]*/ int CheckAdminPrivileges(out int pVal);
  // method RunApplication
  /*[id(0x00000005)]*/ int RunApplication(wchar* pLayers, wchar* pszCmdLine, int bEnableLog, out uint pResult);
  // method GetExePathFromObject
  /*[id(0x00000006)]*/ int GetExePathFromObject(wchar* pszPath, out DWINVARIANT pVal);
  // method IsSystemTarget
  /*[id(0x00000007)]*/ int IsSystemTarget(wchar* bstrPath, out int pbSystemTarget);
  // method IsExecutableFile
  /*[id(0x00000008)]*/ int IsExecutableFile(wchar* bstrPath, out int pbExecutableFile);
  // method IsCompatWizardDisabled
  /*[id(0x00000009)]*/ int IsCompatWizardDisabled(out int pbDisabled);
}

// _ISelectFileEvents Interface
interface _ISelectFileEvents : IDispatch {
  mixin(uuid("fcfcb4a2-1656-458a-8713-83d5fd9a9c54"));
  // static DWINGUID IID = { 0xfcfcb4a2, 0x1656, 0x458a, 0x87, 0x13, 0x83, 0xd5, 0xfd, 0x9a, 0x9c, 0x54 };
  /+// method SelectionComplete
  /*[id(0x00000001)]*/ int SelectionComplete();+/
  /+// method StateChanged
  /*[id(0x00000002)]*/ int StateChanged(int lState);+/
}

// IUpload Interface
interface IUpload : IDispatch {
  mixin(uuid("f21eb30d-aa39-47f5-ab0b-686f783147b0"));
  // static DWINGUID IID = { 0xf21eb30d, 0xaa39, 0x47f5, 0xab, 0x0b, 0x68, 0x6f, 0x78, 0x31, 0x47, 0xb0 };
  // method SetKey
  /*[id(0x00000001)]*/ int SetKey(wchar* pszKey, DWINVARIANT* pvValue);
  // method GetKey
  /*[id(0x00000002)]*/ int GetKey(wchar* pszKey, out DWINVARIANT pValue);
  // method AddMatchingInfo
  /*[id(0x00000003)]*/ int AddMatchingInfo(wchar* pszCommand, DWINVARIANT dwFilter, DWINVARIANT pKey, DWINVARIANT pDescription, DWINVARIANT bProgress, out int pbSuccess);
  // method AddDataFile
  /*[id(0x00000004)]*/ int AddDataFile(wchar* pszDataFile, DWINVARIANT pszKey, DWINVARIANT pszDescription, DWINVARIANT bOwn);
  // method RemoveDataFile
  /*[id(0x00000005)]*/ int RemoveDataFile(wchar* pszDataFile);
  // method CreateManifestFile
  /*[id(0x00000006)]*/ int CreateManifestFile(out int pbSuccess);
  // method SendReport
  /*[id(0x00000007)]*/ int SendReport(out int pbSuccess);
  // method AddDescriptionFile
  /*[id(0x00000008)]*/ int AddDescriptionFile(wchar* pszApplicationName, wchar* pszApplicationPath, int lMediaType, int bCompatSuccess, DWINVARIANT* pvFixesApplied, DWINVARIANT pszKey, out int pbSuccess);
  // method DeleteTempFiles
  /*[id(0x00000009)]*/ int DeleteTempFiles();
  // method ShowTempFiles
  /*[id(0x0000000A)]*/ int ShowTempFiles();
  // method GetDataFile
  /*[id(0x0000000B)]*/ int GetDataFile(DWINVARIANT vKey, int InformationClass, out DWINVARIANT pbstrVal);
}

// CoClasses

// ProgView Class
abstract class ProgView {
  mixin(uuid("b9b7d40c-0c41-4eaf-b0b5-6b41378c7f48"));
  // static DWINGUID CLSID = { 0xb9b7d40c, 0x0c41, 0x4eaf, 0xb0, 0xb5, 0x6b, 0x41, 0x37, 0x8c, 0x7f, 0x48 };
  mixin Interfaces!(IProgView);
}

// Util Class
abstract class Util {
  mixin(uuid("0355854a-7f23-47e2-b7c3-97ee8dd42cd8"));
  // static DWINGUID CLSID = { 0x0355854a, 0x7f23, 0x47e2, 0xb7, 0xc3, 0x97, 0xee, 0x8d, 0xd4, 0x2c, 0xd8 };
  mixin Interfaces!(IUtil);
}

// SelectFile Class
abstract class SelectFile {
  mixin(uuid("66cbc149-a49f-48f9-b17a-6a3ea9b42a87"));
  // static DWINGUID CLSID = { 0x66cbc149, 0xa49f, 0x48f9, 0xb1, 0x7a, 0x6a, 0x3e, 0xa9, 0xb4, 0x2a, 0x87 };
  mixin Interfaces!(ISelectFile);
}

// Upload Class
abstract class Upload {
  mixin(uuid("31ead8cc-c2f6-4639-ba99-5f495f9b1502"));
  // static DWINGUID CLSID = { 0x31ead8cc, 0xc2f6, 0x4639, 0xba, 0x99, 0x5f, 0x49, 0x5f, 0x9b, 0x15, 0x02 };
  mixin Interfaces!(IUpload);
}
