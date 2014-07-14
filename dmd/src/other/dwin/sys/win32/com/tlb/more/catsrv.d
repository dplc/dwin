// CatalogServer 1.0 Type Library
// Version 1.0

/*[uuid("e6be109b-165f-11d1-b22d-00c04fb9473f")]*/
//module dwin.sys.win32.com.tlb.more.catalogserver;
module dwin.sys.win32.com.tlb.more.catsrv;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

// CatSrv Services Enumeration
enum __MIDL___MIDL_itf_catsrv_0303_0001 {
  css_minService = 0x00000001,
  css_lb = 0x00000001,
  css_maxService = 0x00000001,
}

// CatSrv Service States Enumeration
enum __MIDL___MIDL_itf_catsrv_0303_0002 {
  css_minServiceState = 0x00000000,
  css_serviceStopped = 0x00000000,
  css_serviceStartPending = 0x00000001,
  css_serviceStopPending = 0x00000002,
  css_serviceRunning = 0x00000003,
  css_serviceContinuePending = 0x00000004,
  css_servicePausePending = 0x00000005,
  css_servicePaused = 0x00000006,
  css_serviceUnknownState = 0x00000007,
  css_maxServiceState = 0x00000008,
}

// CatSrv Component Type
enum __MIDL___MIDL_itf_catsrv_0276_0001 {
  COMPONENT_UNKNOWN = 0x00000000,
  COMPONENT_32BIT = 0x00000001,
  COMPONENT_64BIT = 0x00000002,
  COMPONENT_ANY = 0x00000003,
  COMPONENT_NATIVE = 0x00001000,
}

// Structs

struct __MIDL___MIDL_itf_catsrv_0001_0001 {
  uint dbType;
  uint cbSize;
  uint fMeta;
}

struct _tagCLASSINFO {
 DWINGUID Clsid;
  wchar* pszClassName;
  uint nProgIDs;
  wchar** ppszProgID;
}

struct _tagPSCLASSINFO {
 DWINGUID PSClsid;
  wchar* pszPSClassName;
  uint nInterfaces;
  _tagPSITFINFO* pPSItfInfo;
}

struct _tagPSITFINFO {
 DWINGUID iid;
  wchar* pszInterfaceName;
}

struct _tagDLLINFO {
  wchar* pszDllPath;
  uint nNumClsids;
  _tagCLASSINFO* pClassInfo;
  uint eFileType;
}

struct _tagPSDLLINFO {
  wchar* pszPSDllPath;
  uint nNumPSClsids;
  _tagPSCLASSINFO* pPSClassInfo;
}

struct tagSaferLevelInfo {
  uint dwSaferLevel;
  wchar* wszFriendlyName;
}

struct _RUNNING_APP {
 DWINGUID guidAppID;
 DWINGUID guidAppPartitionID;
 DWINGUID guidAppInstanceID;
  uint dwProcessID;
  int bPaused;
  int bRecycled;
}

struct tagImportPartInfo {
  wchar* wszPartitionName;
  wchar* wszPartitionDescription;
 DWINGUID guidPartition;
  uint cApplications;
  tagImportAppInfo* rgAppInfo;
}

struct tagImportAppInfo {
  wchar* wszApplicationName;
  wchar* wszApplicationDescription;
  int fHasUsers;
  int fIsProxy;
  int fIsService;
  uint cFiles;
  wchar** rgszFileName;
}

// Aliases

alias __MIDL___MIDL_itf_catsrv_0001_0001 SimpleColumnMeta;

// CatSrv Services Enumeration
alias __MIDL___MIDL_itf_catsrv_0303_0001 CatSrvServices;

// CatSrv Service States Enumeration
alias __MIDL___MIDL_itf_catsrv_0303_0002 CatSrvServiceStates;

// CatSrv Component Type
alias __MIDL___MIDL_itf_catsrv_0276_0001 ComponentType;

// Interfaces

// ICatalogSession
interface ICatalogSession : IDispatch {
  mixin(uuid("182c40fa-32e4-11d0-818b-00a0c9231c29"));
  // static DWINGUID IID = { 0x182c40fa, 0x32e4, 0x11d0, 0x81, 0x8b, 0x00, 0xa0, 0xc9, 0x23, 0x1c, 0x29 };
  /*[id(0x00000001)]*/ int InitializeSession(float i_flVerLower, float i_flVerUpper, int i_lcid, out float o_pflVerSession);
  /*[id(0x00000002)]*/ int GetServerInformation(out int o_peOSId, out int o_peOSVer, out int o_peOSHardware, out int o_peRes1, out int o_peRes2, out int o_peRes3);
}

// ICatalogTableInfo
interface ICatalogTableInfo : IUnknown {
  mixin(uuid("a8927a41-d3ce-11d1-8472-006008b0e5ca"));
  // static DWINGUID IID = { 0xa8927a41, 0xd3ce, 0x11d1, 0x84, 0x72, 0x00, 0x60, 0x08, 0xb0, 0xe5, 0xca };
  /*[id(0x00000001)]*/ int GetClientTableInfo(ref DWINGUID i_did, ref DWINGUID i_tid, uint i_fTable, ubyte* i_pQuery1, uint i_cbQuery1, ubyte* i_pQuery2, uint i_cbQuery2, uint i_fQueryFormat, out DWINGUID o_pclsidDataTableDispenser, out ubyte o_pwszLocator, out uint cbLocator, out DWINGUID o_paclsidLogicTableDispenser, out uint o_pcLogicTableDispenser, out SimpleColumnMeta o_paColumnMeta, out uint o_pcColumns, out DWINGUID o_piid, void *o_pItf, out ubyte o_pReserved, out uint o_pcbReserved);
}

// ICatalogTableRead1
interface ICatalogTableRead1 : IUnknown {
  mixin(uuid("0e3d6630-b46b-11d1-9d2d-006008b0e5ca"));
  // static DWINGUID IID = { 0x0e3d6630, 0xb46b, 0x11d1, 0x9d, 0x2d, 0x00, 0x60, 0x08, 0xb0, 0xe5, 0xca };
  /*[id(0x00000001)]*/ int ReadTable(ref DWINGUID i_did, ref DWINGUID i_tid, uint i_fTable, ubyte* i_pQuery1, uint i_cbQuery1, ubyte* i_pQuery2, uint i_cbQuery2, uint i_fQueryFormat, out ubyte o_ppv1, out uint o_pcb1, out ubyte o_ppv2, out uint o_pcb2, out ubyte o_ppv3, out uint o_pcb3, out ubyte o_ppv4, out uint o_pcb4, out ubyte o_ppv5, out uint o_pcb5);
}

// ICatalogTableWrite1
interface ICatalogTableWrite1 : IUnknown {
  mixin(uuid("0e3d6631-b46b-11d1-9d2d-006008b0e5ca"));
  // static DWINGUID IID = { 0x0e3d6631, 0xb46b, 0x11d1, 0x9d, 0x2d, 0x00, 0x60, 0x08, 0xb0, 0xe5, 0xca };
  /*[id(0x00000001)]*/ int WriteTable(ref DWINGUID i_did, ref DWINGUID i_tid, uint i_fTable, ubyte* i_pQuery1, uint i_cbQuery1, ubyte* i_pQuery2, uint i_cbQuery2, uint i_fQueryFormat, ubyte* i_pv1, uint i_cb1, ubyte* i_pv2, uint i_cb2, ubyte* i_pv3, uint i_cb3, ubyte* i_pv4, uint i_cb4, ubyte* i_pv5, uint i_cb5, out ubyte o_ppv1, out uint o_pcb1);
}

// ICSServiceControl Interface
interface ICSServiceControl : IUnknown {
  mixin(uuid("47cde9a1-0bf6-11d2-8016-00c04fb9988e"));
  // static DWINGUID IID = { 0x47cde9a1, 0x0bf6, 0x11d2, 0x80, 0x16, 0x00, 0xc0, 0x4f, 0xb9, 0x98, 0x8e };
  /*[id(0x60010000)]*/ int StartService(CatSrvServices i_css);
  /*[id(0x60010001)]*/ int StopService(CatSrvServices i_css);
  /*[id(0x60010002)]*/ int InstallService(CatSrvServices i_css, wchar* szBinaryPath);
  /*[id(0x60010003)]*/ int UninstallService(CatSrvServices i_css);
  /*[id(0x60010004)]*/ int IsServiceInstalled(CatSrvServices i_css, out uint pulStatus);
  /*[id(0x60010005)]*/ int IsServiceRunning(CatSrvServices i_css, out CatSrvServiceStates pulState);
  /*[id(0x60010006)]*/ int RefreshServiceSettings(CatSrvServices i_css);
}

// IApplicationControl Interface
interface IApplicationControl : IUnknown {
  mixin(uuid("3f3b1b86-dbbe-11d1-9da6-00805f85cfe3"));
  // static DWINGUID IID = { 0x3f3b1b86, 0xdbbe, 0x11d1, 0x9d, 0xa6, 0x00, 0x80, 0x5f, 0x85, 0xcf, 0xe3 };
  /*[id(0x60010000)]*/ int StartApplication(ref DWINGUID guidApplId);
  /*[id(0x60010001)]*/ int ShutdownApplication(ref DWINGUID guidApplId);
  /*[id(0x60010002)]*/ int RefreshComponents();
}

// IComClientExport Interface
interface IComExport : IUnknown {
  mixin(uuid("cfadac84-e12c-11d1-b34c-00c04f990d54"));
  // static DWINGUID IID = { 0xcfadac84, 0xe12c, 0x11d1, 0xb3, 0x4c, 0x00, 0xc0, 0x4f, 0x99, 0x0d, 0x54 };
  // method ExportAsMSI
  /*[id(0x00000001)]*/ int ExportAsMSI(ref DWINGUID rApplID, wchar* pszMSIPath, wchar* pszRSN, uint dwFlags);
  // method GetRemoteClassInfo
  /*[id(0x00000002)]*/ int GetRemoteClassInfo(ref uint nNumRemClass, out _tagCLASSINFO parrRemClassInfo);
  // method GetTypeLibInfo
  /*[id(0x00000003)]*/ int GetTypeLibInfo(ref uint nNumTLBs, out wchar* arrTLBs);
  // method GetPSDlls
  /*[id(0x00000004)]*/ int GetPSDlls(ref uint nNumPSDlls, out wchar* arrPSDlls);
  // method GetPSInfo
  /*[id(0x00000005)]*/ int GetPSClassInfo(uint nPSDllIndex, ref uint nPSClassInfo, out _tagPSCLASSINFO arrPSClassInfo);
}

// IAppExport Interface
interface IAppExport : IUnknown {
  mixin(uuid("0d3debaf-debe-11d1-8b87-00c04fd7a924"));
  // static DWINGUID IID = { 0x0d3debaf, 0xdebe, 0x11d1, 0x8b, 0x87, 0x00, 0xc0, 0x4f, 0xd7, 0xa9, 0x24 };
  // method ExportApplication
  /*[id(0x00000001)]*/ int ExportApplication(ref DWINGUID guidApplicationID, wchar* pwszClbFile, uint dwFlags, out uint pnTypeLibs, out wchar* pwszarrTypeLibs, out uint pnNumDlls, out _tagDLLINFO parrDllInfo, out uint pnNumPSDlls, out _tagPSDLLINFO parrPSDllInfo, out uint pnNumManifestFiles, out wchar* parrManifestFilePaths);
}

// IAppImport Interface
interface IAppImport : IUnknown {
  mixin(uuid("c2be6970-df9e-11d1-8b87-00c04fd7a924"));
  // static DWINGUID IID = { 0xc2be6970, 0xdf9e, 0x11d1, 0x8b, 0x87, 0x00, 0xc0, 0x4f, 0xd7, 0xa9, 0x24 };
  // method ImportApplication
  /*[id(0x00000001)]*/ int ImportApplication(wchar* pwszDest, wchar* pwszCLBFileName, wchar* pwszUser, wchar* pwszPassword, wchar* wszRemoteServerName, uint dwFlags, ref DWINGUID refguidApplID, uint dwType, out uint nNumFiles, out uint parrFileFlags, out wchar* pwszarrFileNames, out uint nNumClasses, out DWINGUID parrRegisteredClasses, out wchar* pwszarrRegisteredClassNames, out uint parrComponentFlags, out int parrComponentInstallHRs);
  // method QueryApplication
  /*[id(0x00000002)]*/ int QueryApplication(wchar* pwszCLBFileName, out uint pdwApps, out wchar* parrApplicationName, out wchar* parrDesc, out uint pdwUsers, out uint pdwIsProxy, out uint pdwNumFiles, out wchar* parrFileNames);
  // method GetFileTypeAndAppID
  /*[id(0x00000003)]*/ int GetFileTypeAndAppID(wchar* wszDest, out uint pdwFileType, out DWINGUID gpuidApplID);
  // method SetAppIdentity
  /*[id(0x00000004)]*/ int SetAppIdentity(ref DWINGUID refguidApplID, wchar* wszUser, wchar* wszPassword);
}

// IRegister Interface
interface IRegister : IUnknown {
  mixin(uuid("8db2180e-bd29-11d1-8b7e-00c04fd7a924"));
  // static DWINGUID IID = { 0x8db2180e, 0xbd29, 0x11d1, 0x8b, 0x7e, 0x00, 0xc0, 0x4f, 0xd7, 0xa9, 0x24 };
  // method RegisterModule
  /*[id(0x00000001)]*/ int RegisterModule(DWINGUID guidApplId, wchar** pwszarrFileNames, uint NumFiles, uint dwFlags, ref DWINGUID parrInstallList, uint NumComponents, out uint parrFileFlags, out uint nNumClasses, out DWINGUID parrRegisteredClasses, out wchar* pwszarrRegisteredClassNames, out uint parrComponentFlags, out int parrComponentInstallHRs);
  // method UnregisterModule
  /*[id(0x00000002)]*/ int UnregisterModule(wchar* szModulePath, uint dwFlags);
}

// ICatalogUtils Interface
interface ICatalogUtils : IUnknown {
  mixin(uuid("456129e2-1078-11d2-b0f9-00805fc73204"));
  // static DWINGUID IID = { 0x456129e2, 0x1078, 0x11d2, 0xb0, 0xf9, 0x00, 0x80, 0x5f, 0xc7, 0x32, 0x04 };
  /*[id(0x60010000)]*/ int ValidateUser(wchar* pwszPrincipalName, wchar* pwszPassword);
  /*[id(0x60010001)]*/ int WaitForEndWrites();
  /*[id(0x60010002)]*/ int GetEventClassesForIID(wchar* wszIID, out uint pcClasses, out wchar* pawszCLSIDs, out wchar* pawszProgIDs, out wchar* pawszDescriptions);
}

// ICatalogUtils2 Interface
interface ICatalogUtils2 : IUnknown {
  mixin(uuid("c726744e-5735-4f08-8286-c510ee638fb6"));
  // static DWINGUID IID = { 0xc726744e, 0x5735, 0x4f08, 0x82, 0x86, 0xc5, 0x10, 0xee, 0x63, 0x8f, 0xb6 };
  /*[id(0x60010000)]*/ int CopyApplications(wchar* pwszSourcePartition, wchar* pwszDestPartition, uint dwcAppId, wchar** ppwszAppNamesOrIds);
  /*[id(0x60010001)]*/ int CopyComponent(wchar* pwszSourceApp, wchar* pwszClass, wchar* pwszDestinationApp);
  /*[id(0x60010002)]*/ int AliasComponent(wchar* pwszSourceApp, wchar* pwszClass, wchar* pwszDestinationApp, ref DWINGUID rguidClsidNew, wchar* pwszNewProgId);
  /*[id(0x60010003)]*/ int MoveComponent(wchar* pwszSourceApp, wchar* pwszClass, wchar* pwszDestinationApp);
  /*[id(0x60010004)]*/ int GetEventClassesForIID2(wchar* wszIID, ref DWINGUID PartitionId, out uint pcClasses, out wchar* pawszCLSIDs, out wchar* pawszProgIDs, out wchar* pawszDescriptions, out wchar* pawszApplicationIDs, out uint padwIsPrivate);
  /*[id(0x60010005)]*/ int IsSafeToDelete(wchar* bstrDLL, out int pInUse);
  /*[id(0x60010006)]*/ int FlushPartitionCache();
  /*[id(0x60010007)]*/ int EnumerateSAFERLevels(uint Locale, out int cLevels, out tagSaferLevelInfo aSaferLevels);
  /*[id(0x60010008)]*/ int GetComponentVersions(wchar* pwszClsidOrProgId, out uint pdwVersions, out DWINGUID ppguidPartitionIDs, out DWINGUID ppguidApplicationIDs, out int ppIsPrivate, out int ppBitness);
}

// ICatalogSetup Interface
interface ICatalogSetup : IUnknown {
  mixin(uuid("9864f70d-2cb3-11d2-b0fe-00805fc73204"));
  // static DWINGUID IID = { 0x9864f70d, 0x2cb3, 0x11d2, 0xb0, 0xfe, 0x00, 0x80, 0x5f, 0xc7, 0x32, 0x04 };
  /*[id(0x60010000)]*/ int ConfigureSystemApp(wchar* i_wszUserName, wchar* i_wszPassword, wchar* i_wszProfileFileName);
  /*[id(0x60010001)]*/ int MarkAppAsSystem(ISimpleTableDispenser i_pDispenser, DWINGUID i_applid);
  /*[id(0x60010002)]*/ int MarkAppAsNotSystem(ISimpleTableDispenser i_pDispenser, DWINGUID i_applid);
  /*[id(0x60010003)]*/ int SysprepComplus();
}

// ISimpleTableDispenser
interface ISimpleTableDispenser : IUnknown {
  mixin(uuid("4915a36f-0138-11d1-8d56-00c04fc2e0c7"));
  // static DWINGUID IID = { 0x4915a36f, 0x0138, 0x11d1, 0x8d, 0x56, 0x00, 0xc0, 0x4f, 0xc2, 0xe0, 0xc7 };
  /*[id(0x60010000)]*/ int GetServerTable(ref DWINGUID i_did, ref DWINGUID i_tid, void* i_QueryData, void* i_QueryMeta, uint i_eQueryFormat, uint i_fTable, void *o_ppv);
  /*[id(0x60010001)]*/ int GetClientTable(ref DWINGUID i_did, ref DWINGUID i_tid, void* i_QueryData, void* i_QueryMeta, uint i_eQueryFormat, uint i_fTable, void *o_ppv);
}

// IReplication Interface
interface IReplicationUtil : IUnknown {
  mixin(uuid("98315903-7be5-11d2-adc1-00a02463d6e7"));
  // static DWINGUID IID = { 0x98315903, 0x7be5, 0x11d2, 0xad, 0xc1, 0x00, 0xa0, 0x24, 0x63, 0xd6, 0xe7 };
  /*[id(0x60010000)]*/ int CreateShare(wchar* i_wszShareName, wchar* i_wszPath);
  /*[id(0x60010001)]*/ int CreateEmptyDir(wchar* i_wszBasePath);
  /*[id(0x60010002)]*/ int RemoveShare(wchar* i_wszShareName);
  /*[id(0x60010003)]*/ int MakeNewReplicaCurrent(wchar* i_wszBasePath);
  /*[id(0x60010004)]*/ int QueryApplication(ref DWINGUID i_guidAppId, out ubyte o_ppv, out uint o_pcb);
  /*[id(0x60010005)]*/ int CreateReplicationDir(out wchar* o_pwszPath);
}

// ICatalog64BitSupport Interface
interface ICatalog64BitSupport : IUnknown {
  mixin(uuid("1d118904-94b3-4a64-9fa6-ed432666a7b9"));
  // static DWINGUID IID = { 0x1d118904, 0x94b3, 0x4a64, 0x9f, 0xa6, 0xed, 0x43, 0x26, 0x66, 0xa7, 0xb9 };
  /*[id(0x60010000)]*/ int SupportsWOWComponents(out int pbWOWComponents);
  /*[id(0x60010001)]*/ int Initialize64BitQueryCellSupport(int b64ClientBitQueryCells, out int pbServer64BitQueryCells);
}

// IRegister2 Interface
interface IRegister2 : IUnknown {
  mixin(uuid("971668dc-c3fe-4ea1-9643-0c7230f494a1"));
  // static DWINGUID IID = { 0x971668dc, 0xc3fe, 0x4ea1, 0x96, 0x43, 0x0c, 0x72, 0x30, 0xf4, 0x94, 0xa1 };
  // method ImportComponent
  /*[id(0x00000001)]*/ int ImportComponent(wchar* pwszAppIdOrName, wchar* pwszClass, ComponentType ctComponentType);
  // method ImportComponentAsLegacy
  /*[id(0x00000002)]*/ int ImportComponentAsLegacy(wchar* pwszAppIdOrName, wchar* pwszClass, ComponentType ctComponentType);
  // method PromoteLegacyComponent
  /*[id(0x00000003)]*/ int PromoteLegacyComponent(wchar* pwszAppIdOrName, wchar* pwszClass, ComponentType ctComponentType);
  // method RegisterDll
  /*[id(0x00000004)]*/ int RegisterDll(wchar* wszDllPath);
  // method RegisterExe
  /*[id(0x00000005)]*/ int RegisterExe(wchar* wszExePath);
  // method RegisterModule2
  /*[id(0x00000006)]*/ int RegisterModule2(DWINGUID guidApplId, DWINGUID guidAppPartitionID, wchar** pwszarrFileNames, uint NumFiles, uint dwFlags, ref DWINGUID parrInstallList, uint NumComponents, out uint parrFileFlags, out uint nNumClasses, out DWINGUID parrRegisteredClasses, out wchar* pwszarrRegisteredClassNames, out uint parrComponentFlags, out int parrComponentInstallHRs);
}

// IApplicationControl2 Interface
interface IApplicationControl2 : IUnknown {
  mixin(uuid("6c935649-30a6-4211-8687-c4c83e5fe1c7"));
  // static DWINGUID IID = { 0x6c935649, 0x30a6, 0x4211, 0x86, 0x87, 0xc4, 0xc8, 0x3e, 0x5f, 0xe1, 0xc7 };
  /*[id(0x60010000)]*/ int ShutdownProcess(ref DWINGUID guidApplInstanceId);
  /*[id(0x60010001)]*/ int PauseProcess(ref DWINGUID guidApplInstanceId);
  /*[id(0x60010002)]*/ int ResumeProcess(ref DWINGUID guidApplInstanceId);
  /*[id(0x60010003)]*/ int IsProcessPaused(ref DWINGUID guidApplInstanceId, out int bPaused);
  /*[id(0x60010004)]*/ int GetRunningApps(ref DWINGUID guidApplPartitionID, ref DWINGUID guidApplId, out uint pdwNumApps, out _RUNNING_APP ppApps);
  /*[id(0x60010005)]*/ int GetInstanceIDFromPID(uint dwPID, out wchar* pbstrInstanceID);
  /*[id(0x60010006)]*/ int RecycleProcess(ref DWINGUID guidApplInstanceId, int lReasonCode);
  /*[id(0x60010007)]*/ int GetInstanceIDFromApplID(ref DWINGUID guidApplId, out DWINGUID pguidApplInstanceID);
}

interface INTServiceConfig : IUnknown {
  mixin(uuid("7f43b400-1a0e-4d57-bbc9-6b0c65f7a889"));
  // static DWINGUID IID = { 0x7f43b400, 0x1a0e, 0x4d57, 0xbb, 0xc9, 0x6b, 0x0c, 0x65, 0xf7, 0xa8, 0x89 };
  // Configures an application to be an NT service
  /*[id(0x60010000)]*/ int CreateApplicationService(DWINGUID AppID, wchar* bstrServiceName, uint dwStartType, uint dwErrorControl, wchar* bstrDependencies, wchar* bstrRunAs, wchar* bstrPassword, short bDesktopOk);
  // Destroys an application that's an NT service
  /*[id(0x60010001)]*/ int DeleteApplicationService(DWINGUID AppID);
}

// IAppImport2 Interface
interface IAppImport2 : IUnknown {
  mixin(uuid("1f7b1697-ecb2-4cbb-8a0e-75c427f4a6f0"));
  // static DWINGUID IID = { 0x1f7b1697, 0xecb2, 0x4cbb, 0x8a, 0x0e, 0x75, 0xc4, 0x27, 0xf4, 0xa6, 0xf0 };
  // method SetPartition
  /*[id(0x60010000)]*/ int SetPartition(ref DWINGUID refguidPartitionID, out DWINGUID o_pguidAppIdForPartition);
  // method QueryApplication2
  /*[id(0x60010001)]*/ int QueryApplication2(wchar* pwszFileName, out tagImportPartInfo pPartInfo);
  // method GetDefaultAppInstallDirectory
  /*[id(0x60010002)]*/ int GetDefaultAppInstallDirectory(ref DWINGUID pguidAppId, wchar* pwszSrcAplOrPDF, out wchar* pwszDest);
}

// ICatalogSetup2 Interface
interface ICatalogSetup2 : IUnknown {
  mixin(uuid("d66375aa-132d-43fa-881c-3ebff2ca8e24"));
  // static DWINGUID IID = { 0xd66375aa, 0x132d, 0x43fa, 0x88, 0x1c, 0x3e, 0xbf, 0xf2, 0xca, 0x8e, 0x24 };
  /*[id(0x60010000)]*/ int GetDispenser(void *ppDispenser);
  /*[id(0x60010001)]*/ int GetSecAdmin(void *ppSecAdmin);
  /*[id(0x60010002)]*/ int WriteExistingUsersInRolesToInfFile(ISimpleTableDispenser pDispenser, ref DWINGUID applidSystemApp, wchar* i_wszInfFileName, out uint pulNumRolesWritten);
  /*[id(0x60010003)]*/ int StopRegDBService(uint dwTimeOut, int bTerminateIfTimedOut);
}

interface IAdminPrivate : IUnknown {
  mixin(uuid("7c285ad9-1b0b-4152-9142-09920e1ce4dc"));
  // static DWINGUID IID = { 0x7c285ad9, 0x1b0b, 0x4152, 0x91, 0x42, 0x09, 0x92, 0x0e, 0x1c, 0xe4, 0xdc };
  /*[id(0x60010000)]*/ int EnumerateSAFERLevels(out int cLevels, out tagSaferLevelInfo aSaferLevels);
}

// CoClasses

// CatalogServer Class
abstract class CatalogServer {
  mixin(uuid("182c40f0-32e4-11d0-818b-00a0c9231c29"));
  // static DWINGUID CLSID = { 0x182c40f0, 0x32e4, 0x11d0, 0x81, 0x8b, 0x00, 0xa0, 0xc9, 0x23, 0x1c, 0x29 };
  mixin Interfaces!(ICatalogSession, ICatalogTableInfo, ICatalogTableRead1, ICatalogTableWrite1, ICSServiceControl, IApplicationControl, IComExport, IAppExport, IAppImport, IRegister, ICatalogUtils, ICatalogUtils2, ICatalogSetup, IReplicationUtil, ICatalog64BitSupport, IRegister2, IApplicationControl2, INTServiceConfig, IAppImport2, ICatalogSetup2);
}
