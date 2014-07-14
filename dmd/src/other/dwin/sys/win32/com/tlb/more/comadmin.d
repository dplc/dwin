// COM + 1.0 Admin Type Library
// Version 1.0

/*[uuid("f618c513-dfb8-11d1-a2cf-00805fc79235")]*/
module dwin.sys.win32.com.tlb.more.comadmin;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

// InUse values for IsSafeToDelete
enum COMAdminInUse {
  COMAdminNotInUse = 0x00000000,
  COMAdminInUseByCatalog = 0x00000001,
  COMAdminInUseByRegistryUnknown = 0x00000002,
  COMAdminInUseByRegistryProxyStub = 0x00000003,
  COMAdminInUseByRegistryTypeLib = 0x00000004,
  COMAdminInUseByRegistryClsid = 0x00000005,
}

// ComponentType values for ImportComponentAsLegacy
enum COMAdminComponentType {
  COMAdmin32BitComponent = 0x00000001,
  COMAdmin64BitComponent = 0x00000002,
}

// Application install options - these options can be or'ed together
enum COMAdminApplicationInstallOptions {
  COMAdminInstallNoUsers = 0x00000000,
  COMAdminInstallUsers = 0x00000001,
  COMAdminInstallForceOverwriteOfFiles = 0x00000002,
}

// Application export options - these options can be or'ed together
enum COMAdminApplicationExportOptions {
  COMAdminExportNoUsers = 0x00000000,
  COMAdminExportUsers = 0x00000001,
  COMAdminExportApplicationProxy = 0x00000002,
  COMAdminExportForceOverwriteOfFiles = 0x00000004,
  COMAdminExportIn10Format = 0x00000010,
}

// Threading Model Enumerations
enum COMAdminThreadingModels {
  COMAdminThreadingModelApartment = 0x00000000,
  COMAdminThreadingModelFree = 0x00000001,
  COMAdminThreadingModelMain = 0x00000002,
  COMAdminThreadingModelBoth = 0x00000003,
  COMAdminThreadingModelNeutral = 0x00000004,
  COMAdminThreadingModelNotSpecified = 0x00000005,
}

// Transaction Settings Enumerations
enum COMAdminTransactionOptions {
  COMAdminTransactionIgnored = 0x00000000,
  COMAdminTransactionNone = 0x00000001,
  COMAdminTransactionSupported = 0x00000002,
  COMAdminTransactionRequired = 0x00000003,
  COMAdminTransactionRequiresNew = 0x00000004,
}

// Transaction Isolation Level Enumerations
enum COMAdminTxIsolationLevelOptions {
  COMAdminTxIsolationLevelAny = 0x00000000,
  COMAdminTxIsolationLevelReadUnCommitted = 0x00000001,
  COMAdminTxIsolationLevelReadCommitted = 0x00000002,
  COMAdminTxIsolationLevelRepeatableRead = 0x00000003,
  COMAdminTxIsolationLevelSerializable = 0x00000004,
}

// Synchronization Settings Enumerations
enum COMAdminSynchronizationOptions {
  COMAdminSynchronizationIgnored = 0x00000000,
  COMAdminSynchronizationNone = 0x00000001,
  COMAdminSynchronizationSupported = 0x00000002,
  COMAdminSynchronizationRequired = 0x00000003,
  COMAdminSynchronizationRequiresNew = 0x00000004,
}

// Activation Settings Enumerations
enum COMAdminActivationOptions {
  COMAdminActivationInproc = 0x00000000,
  COMAdminActivationLocal = 0x00000001,
}

// Access Level Settings Enumerations
enum COMAdminAccessChecksLevelOptions {
  COMAdminAccessChecksApplicationLevel = 0x00000000,
  COMAdminAccessChecksApplicationComponentLevel = 0x00000001,
}

// Authentication Level Settings Enumerations
enum COMAdminAuthenticationLevelOptions {
  COMAdminAuthenticationDefault = 0x00000000,
  COMAdminAuthenticationNone = 0x00000001,
  COMAdminAuthenticationConnect = 0x00000002,
  COMAdminAuthenticationCall = 0x00000003,
  COMAdminAuthenticationPacket = 0x00000004,
  COMAdminAuthenticationIntegrity = 0x00000005,
  COMAdminAuthenticationPrivacy = 0x00000006,
}

// Impersonation Level Settings Enumerations
enum COMAdminImpersonationLevelOptions {
  COMAdminImpersonationAnonymous = 0x00000001,
  COMAdminImpersonationIdentify = 0x00000002,
  COMAdminImpersonationImpersonate = 0x00000003,
  COMAdminImpersonationDelegate = 0x00000004,
}

// Authentication Capabilities Settings Enumerations
enum COMAdminAuthenticationCapabilitiesOptions {
  COMAdminAuthenticationCapabilitiesNone = 0x00000000,
  COMAdminAuthenticationCapabilitiesSecureReference = 0x00000002,
  COMAdminAuthenticationCapabilitiesStaticCloaking = 0x00000020,
  COMAdminAuthenticationCapabilitiesDynamicCloaking = 0x00000040,
}

// Operating System Enumerations
enum COMAdminOS {
  COMAdminOSWindows3_1 = 0x00000001,
  COMAdminOSWindows9x = 0x00000002,
  COMAdminOSWindowsNT = 0x00000003,
  COMAdminOSWindowsNTEnterprise = 0x00000004,
  COMAdminOSWindows2000Personal = 0x00000005,
}

// Service Enumerations
enum COMAdminServiceOptions {
  COMAdminServiceLoadBalanceRouter = 0x00000001,
}

// Service Status Enumerations
enum COMAdminServiceStatusOptions {
  COMAdminServiceStopped = 0x00000000,
  COMAdminServiceStartPending = 0x00000001,
  COMAdminServiceStopPending = 0x00000002,
  COMAdminServiceRunning = 0x00000003,
  COMAdminServiceContinuePending = 0x00000004,
  COMAdminServicePausePending = 0x00000005,
  COMAdminServicePaused = 0x00000006,
  COMAdminServiceUnknownState = 0x00000007,
}

// Queued Components Message Authenticate Enumeration
enum COMAdminQCMessageAuthenticateOptions {
  COMAdminQCMessageAuthenticateSecureApps = 0x00000000,
  COMAdminQCMessageAuthenticateOff = 0x00000001,
  COMAdminQCMessageAuthenticateOn = 0x00000002,
}

// File Flags
enum COMAdminFileFlags {
  COMAdminFileFlagLoadable = 0x00000001,
  COMAdminFileFlagCOM = 0x00000002,
  COMAdminFileFlagContainsPS = 0x00000004,
  COMAdminFileFlagContainsComp = 0x00000008,
  COMAdminFileFlagContainsTLB = 0x00000010,
  COMAdminFileFlagSelfReg = 0x00000020,
  COMAdminFileFlagSelfUnReg = 0x00000040,
  COMAdminFileFlagUnloadableDLL = 0x00000080,
  COMAdminFileFlagDoesNotExist = 0x00000100,
  COMAdminFileFlagAlreadyInstalled = 0x00000200,
  COMAdminFileFlagBadTLB = 0x00000400,
  COMAdminFileFlagGetClassObjFailed = 0x00000800,
  COMAdminFileFlagClassNotAvailable = 0x00001000,
  COMAdminFileFlagRegistrar = 0x00002000,
  COMAdminFileFlagNoRegistrar = 0x00004000,
  COMAdminFileFlagDLLRegsvrFailed = 0x00008000,
  COMAdminFileFlagRegTLBFailed = 0x00010000,
  COMAdminFileFlagRegistrarFailed = 0x00020000,
  COMAdminFileFlagError = 0x00040000,
}

// Component Flags
enum COMAdminComponentFlags {
  COMAdminCompFlagTypeInfoFound = 0x00000001,
  COMAdminCompFlagCOMPlusPropertiesFound = 0x00000002,
  COMAdminCompFlagProxyFound = 0x00000004,
  COMAdminCompFlagInterfacesFound = 0x00000008,
  COMAdminCompFlagAlreadyInstalled = 0x00000010,
  COMAdminCompFlagNotInApplication = 0x00000020,
}

// Error codes (HRESULTS)
enum COMAdminErrorCodes {
  COMAdminErrObjectErrors = 0x80110401,
  COMAdminErrObjectInvalid = 0x80110402,
  COMAdminErrKeyMissing = 0x80110403,
  COMAdminErrAlreadyInstalled = 0x80110404,
  COMAdminErrAppFileWriteFail = 0x80110407,
  COMAdminErrAppFileReadFail = 0x80110408,
  COMAdminErrAppFileVersion = 0x80110409,
  COMAdminErrBadPath = 0x8011040A,
  COMAdminErrApplicationExists = 0x8011040B,
  COMAdminErrRoleExists = 0x8011040C,
  COMAdminErrCantCopyFile = 0x8011040D,
  COMAdminErrNoUser = 0x8011040F,
  COMAdminErrInvalidUserids = 0x80110410,
  COMAdminErrNoRegistryCLSID = 0x80110411,
  COMAdminErrBadRegistryProgID = 0x80110412,
  COMAdminErrAuthenticationLevel = 0x80110413,
  COMAdminErrUserPasswdNotValid = 0x80110414,
  COMAdminErrCLSIDOrIIDMismatch = 0x80110418,
  COMAdminErrRemoteInterface = 0x80110419,
  COMAdminErrDllRegisterServer = 0x8011041A,
  COMAdminErrNoServerShare = 0x8011041B,
  COMAdminErrDllLoadFailed = 0x8011041D,
  COMAdminErrBadRegistryLibID = 0x8011041E,
  COMAdminErrAppDirNotFound = 0x8011041F,
  COMAdminErrRegistrarFailed = 0x80110423,
  COMAdminErrCompFileDoesNotExist = 0x80110424,
  COMAdminErrCompFileLoadDLLFail = 0x80110425,
  COMAdminErrCompFileGetClassObj = 0x80110426,
  COMAdminErrCompFileClassNotAvail = 0x80110427,
  COMAdminErrCompFileBadTLB = 0x80110428,
  COMAdminErrCompFileNotInstallable = 0x80110429,
  COMAdminErrNotChangeable = 0x8011042A,
  COMAdminErrNotDeletable = 0x8011042B,
  COMAdminErrSession = 0x8011042C,
  COMAdminErrCompMoveLocked = 0x8011042D,
  COMAdminErrCompMoveBadDest = 0x8011042E,
  COMAdminErrRegisterTLB = 0x80110430,
  COMAdminErrSystemApp = 0x80110433,
  COMAdminErrCompFileNoRegistrar = 0x80110434,
  COMAdminErrCoReqCompInstalled = 0x80110435,
  COMAdminErrServiceNotInstalled = 0x80110436,
  COMAdminErrPropertySaveFailed = 0x80110437,
  COMAdminErrObjectExists = 0x80110438,
  COMAdminErrComponentExists = 0x80110439,
  COMAdminErrRegFileCorrupt = 0x8011043B,
  COMAdminErrPropertyOverflow = 0x8011043C,
  COMAdminErrNotInRegistry = 0x8011043E,
  COMAdminErrObjectNotPoolable = 0x8011043F,
  COMAdminErrApplidMatchesClsid = 0x80110446,
  COMAdminErrRoleDoesNotExist = 0x80110447,
  COMAdminErrStartAppNeedsComponents = 0x80110448,
  COMAdminErrRequiresDifferentPlatform = 0x80110449,
  COMAdminErrQueuingServiceNotAvailable = 0x80110602,
  COMAdminErrObjectParentMissing = 0x80110808,
  COMAdminErrObjectDoesNotExist = 0x80110809,
  COMAdminErrCanNotExportAppProxy = 0x8011044A,
  COMAdminErrCanNotStartApp = 0x8011044B,
  COMAdminErrCanNotExportSystemApp = 0x8011044C,
  COMAdminErrCanNotSubscribeToComponent = 0x8011044D,
  COMAdminErrAppNotRunning = 0x8011080A,
  COMAdminErrEventClassCannotBeSubscriber = 0x8011044E,
  COMAdminErrLibAppProxyIncompatible = 0x8011044F,
  COMAdminErrBasePartitionOnly = 0x80110450,
  COMAdminErrDuplicatePartitionName = 0x80110457,
  COMAdminErrPartitionInUse = 0x80110459,
  COMAdminErrImportedComponentsNotAllowed = 0x8011045B,
  COMAdminErrRegdbNotInitialized = 0x80110472,
  COMAdminErrRegdbNotOpen = 0x80110473,
  COMAdminErrRegdbSystemErr = 0x80110474,
  COMAdminErrRegdbAlreadyRunning = 0x80110475,
  COMAdminErrMigVersionNotSupported = 0x80110480,
  COMAdminErrMigSchemaNotFound = 0x80110481,
  COMAdminErrCatBitnessMismatch = 0x80110482,
  COMAdminErrCatUnacceptableBitness = 0x80110483,
  COMAdminErrCatWrongAppBitnessBitness = 0x80110484,
  COMAdminErrCatPauseResumeNotSupported = 0x80110485,
  COMAdminErrCatServerFault = 0x80110486,
  COMAdminErrCantRecycleLibraryApps = 0x8011080F,
  COMAdminErrCantRecycleServiceApps = 0x80110811,
  COMAdminErrProcessAlreadyRecycled = 0x80110812,
  COMAdminErrPausedProcessMayNotBeRecycled = 0x80110813,
  COMAdminErrInvalidPartition = 0x8011080B,
  COMAdminErrPartitionMsiOnly = 0x80110819,
  COMAdminErrStartAppDisabled = 0x80110451,
  COMAdminErrCompMoveSource = 0x8011081C,
  COMAdminErrCompMoveDest = 0x8011081D,
  COMAdminErrCompMovePrivate = 0x8011081E,
  COMAdminErrCannotCopyEventClass = 0x80110820,
}

// Interfaces

// ICOMAdminCatalog2 Interface
interface ICOMAdminCatalog2 : ICOMAdminCatalog {
  mixin(uuid("790c6e0b-9194-4cc9-9426-a48a63185696"));
  // static DWINGUID IID = { 0x790c6e0b, 0x9194, 0x4cc9, 0x94, 0x26, 0xa4, 0x8a, 0x63, 0x18, 0x56, 0x96 };
  // Get a catalog collection
  /*[id(0x0000001B)]*/ int GetCollectionByQuery2(wchar* bstrCollectionName, DWINVARIANT* pVarQueryStrings, out IDispatch ppCatalogCollection);
  // Get an Application Instance ID from a Process ID
  /*[id(0x0000001C)]*/ int GetApplicationInstanceIDFromProcessID(int lProcessID, out wchar* pbstrApplicationInstanceID);
  // Initiate shutdown of the specified application server processes
  /*[id(0x0000001D)]*/ int ShutdownApplicationInstances(DWINVARIANT* pVarApplicationInstanceID);
  // Pause one or more application server processes
  /*[id(0x0000001E)]*/ int PauseApplicationInstances(DWINVARIANT* pVarApplicationInstanceID);
  // Resume one or more application server processes
  /*[id(0x0000001F)]*/ int ResumeApplicationInstances(DWINVARIANT* pVarApplicationInstanceID);
  // Recycle one or more application server processes
  /*[id(0x00000020)]*/ int RecycleApplicationInstances(DWINVARIANT* pVarApplicationInstanceID, int lReasonCode);
  // Return VARIANT_TRUE if ANY application instances are paused
  /*[id(0x00000021)]*/ int AreApplicationInstancesPaused(DWINVARIANT* pVarApplicationInstanceID, out short pVarBoolPaused);
  // Dump an image of this application process to disk
  /*[id(0x00000022)]*/ int DumpApplicationInstance(wchar* bstrApplicationInstanceID, wchar* bstrDirectory, int lMaxImages, out wchar* pbstrDumpFile);
  // Is the application process dump feature supported on this server
  /*[id(0x00000023)]*/ int get_IsApplicationInstanceDumpSupported(out short pVarBoolDumpSupported);
  // Configure an application to run as an NT service
  /*[id(0x00000024)]*/ int CreateServiceForApplication(wchar* bstrApplicationIDOrName, wchar* bstrServiceName, wchar* bstrStartType, wchar* bstrErrorControl, wchar* bstrDependencies, wchar* bstrRunAs, wchar* bstrPassword, short bDesktopOk);
  // Un-configure an application running as an NT service
  /*[id(0x00000025)]*/ int DeleteServiceForApplication(wchar* bstrApplicationIDOrName);
  // Return the Partition ID for the specified Application
  /*[id(0x00000026)]*/ int GetPartitionID(wchar* bstrApplicationIDOrName, out wchar* pbstrPartitionID);
  // Return the Partition name for the specified Application
  /*[id(0x00000027)]*/ int GetPartitionName(wchar* bstrApplicationIDOrName, out wchar* pbstrPartitionName);
  // Set the current destination Partition
  /*[id(0x00000028)]*/ int set_CurrentPartition(wchar* value);
  // Get the current Partition ID
  /*[id(0x00000029)]*/ int get_CurrentPartitionID(out wchar* pbstrPartitionID);
  // Get the current Partition name
  /*[id(0x0000002A)]*/ int get_CurrentPartitionName(out wchar* pbstrPartitionName);
  // Get the Global Partition ID
  /*[id(0x0000002B)]*/ int get_GlobalPartitionID(out wchar* pbstrGlobalPartitionID);
  // Flush the user-to-default Partition cache
  /*[id(0x0000002C)]*/ int FlushPartitionCache();
  // Copy one or more Applications from Partition to Partition
  /*[id(0x0000002D)]*/ int CopyApplications(wchar* bstrSourcePartitionIDOrName, DWINVARIANT* pVarApplicationID, wchar* bstrDestinationPartitionIDOrName);
  // Copy one or more components from one Application to an Application in a different Partition
  /*[id(0x0000002E)]*/ int CopyComponents(wchar* bstrSourceApplicationIDOrName, DWINVARIANT* pVarCLSIDOrProgID, wchar* bstrDestinationApplicationIDOrName);
  // Move one or more components from an Application to another Application in a different Partition
  /*[id(0x0000002F)]*/ int MoveComponents(wchar* bstrSourceApplicationIDOrName, DWINVARIANT* pVarCLSIDOrProgID, wchar* bstrDestinationApplicationIDOrName);
  // Create an alias for component configuration while retaining the implementation
  /*[id(0x00000030)]*/ int AliasComponent(wchar* bstrSrcApplicationIDOrName, wchar* bstrCLSIDOrProgID, wchar* bstrDestApplicationIDOrName, wchar* bstrNewProgId, wchar* bstrNewClsid);
  // Checks whether a DLL is in use by catalog or registry
  /*[id(0x00000031)]*/ int IsSafeToDelete(wchar* bstrDllName, out COMAdminInUse pCOMAdminInUse);
  // Import the specified classes as non-configured components
  /*[id(0x00000032)]*/ int ImportUnconfiguredComponents(wchar* bstrApplicationIDOrName, DWINVARIANT* pVarCLSIDOrProgID, DWINVARIANT* pVarComponentType);
  // Promote the specified classes to become configured COM+ components
  /*[id(0x00000033)]*/ int PromoteUnconfiguredComponents(wchar* bstrApplicationIDOrName, DWINVARIANT* pVarCLSIDOrProgID, DWINVARIANT* pVarComponentType);
  // Import one or more components that are already registered as an inproc server in the 32 or 64 bit registry
  /*[id(0x00000034)]*/ int ImportComponents(wchar* bstrApplicationIDOrName, DWINVARIANT* pVarCLSIDOrProgID, DWINVARIANT* pVarComponentType);
  // Determine if the target catalog server is 64 bit
  /*[id(0x00000035)]*/ int get_Is64BitCatalogServer(out short pbIs64Bit);
  // Export a Partition to be installed on another machine
  /*[id(0x00000036)]*/ int ExportPartition(wchar* bstrPartitionIDOrName, wchar* bstrPartitionFileName, int lOptions);
  // Import a Partition from a file
  /*[id(0x00000037)]*/ int InstallPartition(wchar* bstrFileName, wchar* bstrDestDirectory, int lOptions, wchar* bstrUserId, wchar* bstrPassword, wchar* bstrRSN);
  // Return information about an application that is about to be installed
  /*[id(0x00000038)]*/ int QueryApplicationFile2(wchar* bstrApplicationFile, out IDispatch ppFilesForImport);
  // Return the number of Partitions in which a specified component is installed
  /*[id(0x00000039)]*/ int GetComponentVersionCount(wchar* bstrCLSIDOrProgID, out int plVersionCount);
}

// ICOMAdminCatalog Interface
interface ICOMAdminCatalog : IDispatch {
  mixin(uuid("dd662187-dfc2-11d1-a2cf-00805fc79235"));
  // static DWINGUID IID = { 0xdd662187, 0xdfc2, 0x11d1, 0xa2, 0xcf, 0x00, 0x80, 0x5f, 0xc7, 0x92, 0x35 };
  // Gets a collection on the local catalog - without reading any objects from the catalog data store
  /*[id(0x00000001)]*/ int GetCollection(wchar* bstrCollName, out IDispatch ppCatalogCollection);
  // Connect to a catalog server and get the Root Collection
  /*[id(0x00000002)]*/ int Connect(wchar* bstrCatalogServerName, out IDispatch ppCatalogCollection);
  // Gets the major version number of the COM Admin objects
  /*[id(0x00000003)]*/ int get_MajorVersion(out int plMajorVersion);
  // Gets the minor version number of the COM Admin objects
  /*[id(0x00000004)]*/ int get_MinorVersion(out int plMinorVersion);
  // ---
  /*[id(0x00000005)]*/ int GetCollectionByQuery(wchar* bstrCollName, SAFEARRAY* ppsaVarQuery, out IDispatch ppCatalogCollection);
  // Imports a component that is already registered as an InProc server
  /*[id(0x00000006)]*/ int ImportComponent(wchar* bstrApplIDOrName, wchar* bstrCLSIDOrProgID);
  // Installs a component into an application
  /*[id(0x00000007)]*/ int InstallComponent(wchar* bstrApplIDOrName, wchar* bstrDLL, wchar* bstrTLB, wchar* bstrPSDLL);
  // Initiates shutdown of an application server process
  /*[id(0x00000008)]*/ int ShutdownApplication(wchar* bstrApplIDOrName);
  // Exports an application or client application to be installed on a different machine
  /*[id(0x00000009)]*/ int ExportApplication(wchar* bstrApplIDOrName, wchar* bstrApplicationFile, int lOptions);
  // Imports an application from a file
  /*[id(0x0000000A)]*/ int InstallApplication(wchar* bstrApplicationFile, wchar* bstrDestinationDirectory, int lOptions, wchar* bstrUserId, wchar* bstrPassword, wchar* bstrRSN);
  // Stops the router service
  /*[id(0x0000000B)]*/ int StopRouter();
  // Refreshes the data being used by the router service
  /*[id(0x0000000C)]*/ int RefreshRouter();
  // Starts the router service
  /*[id(0x0000000D)]*/ int StartRouter();
  // Reserved method 1
  /*[id(0x0000000E)]*/ int Reserved1();
  // Reserved method 2
  /*[id(0x0000000F)]*/ int Reserved2();
  // Installs components into an application from multiple files
  /*[id(0x00000010)]*/ int InstallMultipleComponents(wchar* bstrApplIDOrName, SAFEARRAY* ppsaVarFileNames, SAFEARRAY* ppsaVarCLSIDs);
  // Returns information about components found in the files
  /*[id(0x00000011)]*/ int GetMultipleComponentsInfo(wchar* bstrApplIDOrName, SAFEARRAY* ppsaVarFileNames, out SAFEARRAY ppsaVarCLSIDs, out SAFEARRAY ppsaVarClassNames, out SAFEARRAY ppsaVarFileFlags, out SAFEARRAY ppsaVarComponentFlags);
  // Refreshes all component registration information
  /*[id(0x00000012)]*/ int RefreshComponents();
  // Registration database backup
  /*[id(0x00000013)]*/ int BackupREGDB(wchar* bstrBackupFilePath);
  // Registration database restore (must reboot after)
  /*[id(0x00000014)]*/ int RestoreREGDB(wchar* bstrBackupFilePath);
  // Returns information about an application that is about to be installed
  /*[id(0x00000015)]*/ int QueryApplicationFile(wchar* bstrApplicationFile, out wchar* pbstrApplicationName, out wchar* pbstrApplicationDescription, out short pbHasUsers, out short pbIsProxy, out SAFEARRAY ppsaVarFileNames);
  // Launches application server process
  /*[id(0x00000016)]*/ int StartApplication(wchar* bstrApplIDOrName);
  // Checks the status of a COM+ related service
  /*[id(0x00000017)]*/ int ServiceCheck(int lService, out int plStatus);
  // Installs multiple event classes into an application
  /*[id(0x00000018)]*/ int InstallMultipleEventClasses(wchar* bstrApplIDOrName, SAFEARRAY* ppsaVarFileNames, SAFEARRAY* ppsaVarCLSIDs);
  // Installs a event class into an application (if one is provided)
  /*[id(0x00000019)]*/ int InstallEventClass(wchar* bstrApplIDOrName, wchar* bstrDLL, wchar* bstrTLB, wchar* bstrPSDLL);
  // Gets a list of event classes that implement a specified interface
  /*[id(0x0000001A)]*/ int GetEventClassesForIID(wchar* bstrIID, out SAFEARRAY ppsaVarCLSIDs, out SAFEARRAY ppsaVarProgIDs, out SAFEARRAY ppsaVarDescriptions);
}

// ICatalogObject Interface
interface ICatalogObject : IDispatch {
  mixin(uuid("6eb22871-8a19-11d0-81b6-00a0c9231c29"));
  // static DWINGUID IID = { 0x6eb22871, 0x8a19, 0x11d0, 0x81, 0xb6, 0x00, 0xa0, 0xc9, 0x23, 0x1c, 0x29 };
  // Gets a property value
  /*[id(0x00000001)]*/ int get_Value(wchar* bstrPropName, out DWINVARIANT pvarRetVal);
  // Gets a property value
  /*[id(0x00000001)]*/ int set_Value(wchar* bstrPropName, DWINVARIANT pvarRetVal);
  // Gets the value of the key property
  /*[id(0x00000002)]*/ int get_Key(out DWINVARIANT pvarRetVal);
  // Gets the name of the object
  /*[id(0x00000003)]*/ int get_Name(out DWINVARIANT pvarRetVal);
  // True if the property cannot be set
  /*[id(0x00000004)]*/ int IsPropertyReadOnly(wchar* bstrPropName, out short pbRetVal);
  // True if all properties were successfully read from the catalog data store
  /*[id(0x00000005)]*/ int get_Valid(out short pbRetVal);
  // True if the property cannot be read
  /*[id(0x00000006)]*/ int IsPropertyWriteOnly(wchar* bstrPropName, out short pbRetVal);
}

// ICatalogCollection Interface
interface ICatalogCollection : IDispatch {
  mixin(uuid("6eb22872-8a19-11d0-81b6-00a0c9231c29"));
  // static DWINGUID IID = { 0x6eb22872, 0x8a19, 0x11d0, 0x81, 0xb6, 0x00, 0xa0, 0xc9, 0x23, 0x1c, 0x29 };
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown ppEnumVariant);
  // Returns an object by index
  /*[id(0x00000001)]*/ int get_Item(int lIndex, out IDispatch ppCatalogObject);
  // Returns number of objects in the collection
  /*[id(0x60020002)]*/ int get_Count(out int plObjectCount);
  // Removes an item, given the index
  /*[id(0x60020003)]*/ int Remove(int lIndex);
  // Adds an object to the collection - returns the new object
  /*[id(0x60020004)]*/ int Add(out IDispatch ppCatalogObject);
  // Reads all the collection objects from the catalog data store
  /*[id(0x00000002)]*/ int Populate();
  // Saves changes made to the collection into the catalog data store
  /*[id(0x00000003)]*/ int SaveChanges(out int pcChanges);
  // Gets a collection related to a specific object - without reading any objects from the catalog data store
  /*[id(0x00000004)]*/ int GetCollection(wchar* bstrCollName, DWINVARIANT varObjectKey, out IDispatch ppCatalogCollection);
  // Gets the name of the collection
  /*[id(0x00000006)]*/ int get_Name(out DWINVARIANT pVarNamel);
  // Returns VARIANT_TRUE if Add is enabled
  /*[id(0x00000007)]*/ int get_AddEnabled(out short pVarBool);
  // Returns VARIANT_TRUE if Remove is enabled
  /*[id(0x00000008)]*/ int get_RemoveEnabled(out short pVarBool);
  // Gets the utility interface
  /*[id(0x00000009)]*/ int GetUtilInterface(out IDispatch ppIDispatch);
  // Gets the major version number of the Catalog data store
  /*[id(0x0000000A)]*/ int get_DataStoreMajorVersion(out int plMajorVersion);
  // Gets the minor version number of the Catalog data store
  /*[id(0x0000000B)]*/ int get_DataStoreMinorVersion(out int plMinorVersionl);
  // Reads selected objects from the catalog data store
  /*[id(0x0000000C)]*/ int PopulateByKey(SAFEARRAY psaKeys);
  // Reserved for future use
  /*[id(0x0000000D)]*/ int PopulateByQuery(wchar* bstrQueryString, int lQueryType);
}

// CoClasses

// COM Admin Class
abstract class COMAdminCatalog {
  mixin(uuid("f618c514-dfb8-11d1-a2cf-00805fc79235"));
  // static DWINGUID CLSID = { 0xf618c514, 0xdfb8, 0x11d1, 0xa2, 0xcf, 0x00, 0x80, 0x5f, 0xc7, 0x92, 0x35 };
  mixin Interfaces!(ICOMAdminCatalog2);
}

// COM Admin Catalog Object Class
abstract class COMAdminCatalogObject {
  mixin(uuid("f618c515-dfb8-11d1-a2cf-00805fc79235"));
  // static DWINGUID CLSID = { 0xf618c515, 0xdfb8, 0x11d1, 0xa2, 0xcf, 0x00, 0x80, 0x5f, 0xc7, 0x92, 0x35 };
  mixin Interfaces!(ICatalogObject);
}

// COM Admin Catalog Collection Class
abstract class COMAdminCatalogCollection {
  mixin(uuid("f618c516-dfb8-11d1-a2cf-00805fc79235"));
  // static DWINGUID CLSID = { 0xf618c516, 0xdfb8, 0x11d1, 0xa2, 0xcf, 0x00, 0x80, 0x5f, 0xc7, 0x92, 0x35 };
  mixin Interfaces!(ICatalogCollection);
}
