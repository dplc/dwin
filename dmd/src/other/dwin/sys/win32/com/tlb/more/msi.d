// Microsoft Windows Installer Object Library
// Version 1.0

/*[uuid("000c1092-0000-0000-c000-000000000046")]*/
//module dwin.sys.win32.com.tlb.more.windowsinstaller;
module dwin.sys.win32.com.tlb.more.msi;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum MsiUILevel {
  msiUILevelNoChange = 0x00000000,
  msiUILevelDefault = 0x00000001,
  msiUILevelNone = 0x00000002,
  msiUILevelBasic = 0x00000003,
  msiUILevelReduced = 0x00000004,
  msiUILevelFull = 0x00000005,
  msiUILevelHideCancel = 0x00000020,
  msiUILevelProgressOnly = 0x00000040,
  msiUILevelEndDialog = 0x00000080,
  msiUILevelSourceResOnly = 0x00000100,
}

enum MsiReadStream {
  msiReadStreamInteger = 0x00000000,
  msiReadStreamBytes = 0x00000001,
  msiReadStreamAnsi = 0x00000002,
  msiReadStreamDirect = 0x00000003,
}

enum MsiRunMode {
  msiRunModeAdmin = 0x00000000,
  msiRunModeAdvertise = 0x00000001,
  msiRunModeMaintenance = 0x00000002,
  msiRunModeRollbackEnabled = 0x00000003,
  msiRunModeLogEnabled = 0x00000004,
  msiRunModeOperations = 0x00000005,
  msiRunModeRebootAtEnd = 0x00000006,
  msiRunModeRebootNow = 0x00000007,
  msiRunModeCabinet = 0x00000008,
  msiRunModeSourceShortNames = 0x00000009,
  msiRunModeTargetShortNames = 0x0000000A,
  msiRunModeWindows9x = 0x0000000C,
  msiRunModeZawEnabled = 0x0000000D,
  msiRunModeScheduled = 0x00000010,
  msiRunModeRollback = 0x00000011,
  msiRunModeCommit = 0x00000012,
}

enum MsiDatabaseState {
  msiDatabaseStateRead = 0x00000000,
  msiDatabaseStateWrite = 0x00000001,
}

enum MsiViewModify {
  msiViewModifySeek = 0xFFFFFFFF,
  msiViewModifyRefresh = 0x00000000,
  msiViewModifyInsert = 0x00000001,
  msiViewModifyUpdate = 0x00000002,
  msiViewModifyAssign = 0x00000003,
  msiViewModifyReplace = 0x00000004,
  msiViewModifyMerge = 0x00000005,
  msiViewModifyDelete = 0x00000006,
  msiViewModifyInsertTemporary = 0x00000007,
  msiViewModifyValidate = 0x00000008,
  msiViewModifyValidateNew = 0x00000009,
  msiViewModifyValidateField = 0x0000000A,
  msiViewModifyValidateDelete = 0x0000000B,
}

enum MsiColumnInfo {
  msiColumnInfoNames = 0x00000000,
  msiColumnInfoTypes = 0x00000001,
}

enum MsiTransformError {
  msiTransformErrorNone = 0x00000000,
  msiTransformErrorAddExistingRow = 0x00000001,
  msiTransformErrorDeleteNonExistingRow = 0x00000002,
  msiTransformErrorAddExistingTable = 0x00000004,
  msiTransformErrorDeleteNonExistingTable = 0x00000008,
  msiTransformErrorUpdateNonExistingRow = 0x00000010,
  msiTransformErrorChangeCodePage = 0x00000020,
  msiTransformErrorViewTransform = 0x00000100,
}

enum MsiEvaluateCondition {
  msiEvaluateConditionFalse = 0x00000000,
  msiEvaluateConditionTrue = 0x00000001,
  msiEvaluateConditionNone = 0x00000002,
  msiEvaluateConditionError = 0x00000003,
}

enum MsiTransformValidation {
  msiTransformValidationNone = 0x00000000,
  msiTransformValidationLanguage = 0x00000001,
  msiTransformValidationProduct = 0x00000002,
  msiTransformValidationPlatform = 0x00000004,
  msiTransformValidationMajorVer = 0x00000008,
  msiTransformValidationMinorVer = 0x00000010,
  msiTransformValidationUpdateVer = 0x00000020,
  msiTransformValidationLess = 0x00000040,
  msiTransformValidationLessOrEqual = 0x00000080,
  msiTransformValidationEqual = 0x00000100,
  msiTransformValidationGreaterOrEqual = 0x00000200,
  msiTransformValidationGreater = 0x00000400,
  msiTransformValidationUpgradeCode = 0x00000800,
}

enum MsiDoActionStatus {
  msiDoActionStatusNoAction = 0x00000000,
  msiDoActionStatusSuccess = 0x00000001,
  msiDoActionStatusUserExit = 0x00000002,
  msiDoActionStatusFailure = 0x00000003,
  msiDoActionStatusSuspend = 0x00000004,
  msiDoActionStatusFinished = 0x00000005,
  msiDoActionStatusWrongState = 0x00000006,
  msiDoActionStatusBadActionData = 0x00000007,
}

enum MsiMessageStatus {
  msiMessageStatusError = 0xFFFFFFFF,
  msiMessageStatusNone = 0x00000000,
  msiMessageStatusOk = 0x00000001,
  msiMessageStatusCancel = 0x00000002,
  msiMessageStatusAbort = 0x00000003,
  msiMessageStatusRetry = 0x00000004,
  msiMessageStatusIgnore = 0x00000005,
  msiMessageStatusYes = 0x00000006,
  msiMessageStatusNo = 0x00000007,
}

enum MsiMessageType {
  msiMessageTypeFatalExit = 0x00000000,
  msiMessageTypeError = 0x01000000,
  msiMessageTypeWarning = 0x02000000,
  msiMessageTypeUser = 0x03000000,
  msiMessageTypeInfo = 0x04000000,
  msiMessageTypeFilesInUse = 0x05000000,
  msiMessageTypeResolveSource = 0x06000000,
  msiMessageTypeOutOfDiskSpace = 0x07000000,
  msiMessageTypeActionStart = 0x08000000,
  msiMessageTypeActionData = 0x09000000,
  msiMessageTypeProgress = 0x0A000000,
  msiMessageTypeCommonData = 0x0B000000,
  msiMessageTypeOk = 0x00000000,
  msiMessageTypeOkCancel = 0x00000001,
  msiMessageTypeAbortRetryIgnore = 0x00000002,
  msiMessageTypeYesNoCancel = 0x00000003,
  msiMessageTypeYesNo = 0x00000004,
  msiMessageTypeRetryCancel = 0x00000005,
  msiMessageTypeDefault1 = 0x00000000,
  msiMessageTypeDefault2 = 0x00000100,
  msiMessageTypeDefault3 = 0x00000200,
}

enum MsiInstallState {
  msiInstallStateNotUsed = 0xFFFFFFF9,
  msiInstallStateBadConfig = 0xFFFFFFFA,
  msiInstallStateIncomplete = 0xFFFFFFFB,
  msiInstallStateSourceAbsent = 0xFFFFFFFC,
  msiInstallStateInvalidArg = 0xFFFFFFFE,
  msiInstallStateUnknown = 0xFFFFFFFF,
  msiInstallStateBroken = 0x00000000,
  msiInstallStateAdvertised = 0x00000001,
  msiInstallStateRemoved = 0x00000001,
  msiInstallStateAbsent = 0x00000002,
  msiInstallStateLocal = 0x00000003,
  msiInstallStateSource = 0x00000004,
  msiInstallStateDefault = 0x00000005,
}

enum MsiCostTree {
  msiCostTreeSelfOnly = 0x00000000,
  msiCostTreeChildren = 0x00000001,
  msiCostTreeParents = 0x00000002,
}

enum MsiReinstallMode {
  msiReinstallModeFileMissing = 0x00000002,
  msiReinstallModeFileOlderVersion = 0x00000004,
  msiReinstallModeFileEqualVersion = 0x00000008,
  msiReinstallModeFileExact = 0x00000010,
  msiReinstallModeFileVerify = 0x00000020,
  msiReinstallModeFileReplace = 0x00000040,
  msiReinstallModeMachineData = 0x00000080,
  msiReinstallModeUserData = 0x00000100,
  msiReinstallModeShortcut = 0x00000200,
  msiReinstallModePackage = 0x00000400,
}

enum MsiInstallType {
  msiInstallTypeDefault = 0x00000000,
  msiInstallTypeNetworkImage = 0x00000001,
  msiInstallTypeSingleInstance = 0x00000002,
}

enum MsiInstallMode {
  msiInstallModeNoSourceResolution = 0xFFFFFFFD,
  msiInstallModeNoDetection = 0xFFFFFFFE,
  msiInstallModeExisting = 0xFFFFFFFF,
  msiInstallModeDefault = 0x00000000,
}

enum MsiSignatureInfo {
  msiSignatureInfoCertificate = 0x00000000,
  msiSignatureInfoHash = 0x00000001,
}

enum MsiInstallContext {
  msiInstallContextFirstVisible = 0x00000000,
  msiInstallContextUserManaged = 0x00000001,
  msiInstallContextUser = 0x00000002,
  msiInstallContextMachine = 0x00000004,
  msiInstallContextAllUserManaged = 0x00000008,
}

enum MsiInstallSourceType {
  msiInstallSourceTypeUnknown = 0x00000000,
  msiInstallSourceTypeNetwork = 0x00000001,
  msiInstallSourceTypeURL = 0x00000002,
  msiInstallSourceTypeMedia = 0x00000004,
}

enum Constants {
  msiDatabaseNullInteger = 0x80000000,
}

enum MsiOpenDatabaseMode {
  msiOpenDatabaseModeReadOnly = 0x00000000,
  msiOpenDatabaseModeTransact = 0x00000001,
  msiOpenDatabaseModeDirect = 0x00000002,
  msiOpenDatabaseModeCreate = 0x00000003,
  msiOpenDatabaseModeCreateDirect = 0x00000004,
  msiOpenDatabaseModePatchFile = 0x00000020,
}

enum MsiSignatureOption {
  msiSignatureOptionInvalidHashFatal = 0x00000001,
}

// Interfaces

interface Installer : IDispatch {
  mixin(uuid("000c1090-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x000c1090, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /+/*[id(0x00000001)]*/ Record CreateRecord(int Count);+/
  /+/*[id(0x00000002)]*/ Session OpenPackage(DWINVARIANT PackagePath, int Options);+/
  /+/*[id(0x00000003)]*/ Session OpenProduct(wchar* ProductCode);+/
  /+/*[id(0x00000004)]*/ Database OpenDatabase(wchar* DatabasePath, DWINVARIANT OpenMode);+/
  /+/*[id(0x00000005)]*/ SummaryInfo get_SummaryInformation(wchar* PackagePath, int UpdateCount);+/
  /+/*[id(0x00000007)]*/ void EnableLog(wchar* LogMode, wchar* LogFile);+/
  /+/*[id(0x00000008)]*/ void InstallProduct(wchar* PackagePath, wchar* PropertyValues);+/
  /+/*[id(0x00000009)]*/ wchar* get_Version();+/
  /+/*[id(0x0000000A)]*/ Record LastErrorRecord();+/
  /+/*[id(0x0000000B)]*/ wchar* RegistryValue(DWINVARIANT Root, wchar* Key, DWINVARIANT Value);+/
  /+/*[id(0x0000000D)]*/ int FileAttributes(wchar* FilePath);+/
  /+/*[id(0x0000000F)]*/ int FileSize(wchar* FilePath);+/
  /+/*[id(0x00000010)]*/ wchar* FileVersion(wchar* FilePath, DWINVARIANT Language);+/
  /+/*[id(0x0000000C)]*/ wchar* get_Environment(wchar* Variable);+/
  /+/*[id(0x0000000C)]*/ void set_Environment(wchar* Variable, wchar* value);+/
  /+/*[id(0x00000011)]*/ MsiInstallState get_ProductState(wchar* Product);+/
  /+/*[id(0x00000012)]*/ wchar* get_ProductInfo(wchar* Product, wchar* Attribute);+/
  /+/*[id(0x00000013)]*/ void ConfigureProduct(wchar* Product, int InstallLevel, MsiInstallState InstallState);+/
  /+/*[id(0x00000014)]*/ void ReinstallProduct(wchar* Product, MsiReinstallMode ReinstallMode);+/
  /+/*[id(0x00000015)]*/ void CollectUserInfo(wchar* Product);+/
  /+/*[id(0x00000016)]*/ void ApplyPatch(wchar* PatchPackage, wchar* InstallPackage, MsiInstallType InstallType, wchar* CommandLine);+/
  /+/*[id(0x00000017)]*/ wchar* get_FeatureParent(wchar* Product, wchar* Feature);+/
  /+/*[id(0x00000018)]*/ MsiInstallState get_FeatureState(wchar* Product, wchar* Feature);+/
  /+/*[id(0x00000019)]*/ void UseFeature(wchar* Product, wchar* Feature, MsiInstallMode InstallMode);+/
  /+/*[id(0x0000001A)]*/ int get_FeatureUsageCount(wchar* Product, wchar* Feature);+/
  /+/*[id(0x0000001B)]*/ double get_FeatureUsageDate(wchar* Product, wchar* Feature);+/
  /+/*[id(0x0000001C)]*/ void ConfigureFeature(wchar* Product, wchar* Feature, MsiInstallState InstallState);+/
  /+/*[id(0x0000001D)]*/ void ReinstallFeature(wchar* Product, wchar* Feature, MsiReinstallMode ReinstallMode);+/
  /+/*[id(0x0000001E)]*/ wchar* ProvideComponent(wchar* Product, wchar* Feature, wchar* Component, int InstallMode);+/
  /+/*[id(0x0000001F)]*/ wchar* get_ComponentPath(wchar* Product, wchar* Component);+/
  /+/*[id(0x00000020)]*/ wchar* ProvideQualifiedComponent(wchar* Category, wchar* Qualifier, int InstallMode);+/
  /+/*[id(0x00000021)]*/ wchar* get_QualifierDescription(wchar* Category, wchar* Qualifier);+/
  /+/*[id(0x00000022)]*/ StringList get_ComponentQualifiers(wchar* Category);+/
  /+/*[id(0x00000023)]*/ StringList get_Products();+/
  /+/*[id(0x00000024)]*/ StringList get_Features(wchar* Product);+/
  /+/*[id(0x00000025)]*/ StringList get_Components();+/
  /+/*[id(0x00000026)]*/ StringList get_ComponentClients(wchar* Component);+/
  /+/*[id(0x00000027)]*/ StringList get_Patches(wchar* Product);+/
  /+/*[id(0x00000028)]*/ StringList get_RelatedProducts(wchar* UpgradeCode);+/
  /+/*[id(0x00000029)]*/ wchar* get_PatchInfo(wchar* Patch, wchar* Attribute);+/
  /+/*[id(0x0000002A)]*/ wchar* get_PatchTransforms(wchar* Product, wchar* Patch);+/
  /+/*[id(0x0000002B)]*/ void AddSource(wchar* Product, wchar* User, wchar* Source);+/
  /+/*[id(0x0000002C)]*/ void ClearSourceList(wchar* Product, wchar* User);+/
  /+/*[id(0x0000002D)]*/ void ForceSourceListResolution(wchar* Product, wchar* User);+/
  /+/*[id(0x0000002E)]*/ Record get_GetShortcutTarget(wchar* ShortcutPath);+/
  /+/*[id(0x0000002F)]*/ Record FileHash(wchar* FilePath, int Options);+/
  /+/*[id(0x00000030)]*/ SAFEARRAY FileSignatureInfo(wchar* FilePath, int Options, MsiSignatureInfo Format);+/
  /+/*[id(0x00000031)]*/ void RemovePatches(wchar* PatchList, wchar* Product, MsiInstallType UninstallType, wchar* PropertyList);+/
  /+/*[id(0x00000033)]*/ void ApplyMultiplePatches(wchar* PatchPackage, wchar* Product, wchar* PropertiesList);+/
  /+/*[id(0x00000035)]*/ int get_Product(wchar* Product, wchar* UserSid, MsiInstallContext iContext, out Product retval);+/
  /+/*[id(0x00000038)]*/ int get_Patch(wchar* PatchCode, wchar* ProductCode, wchar* UserSid, MsiInstallContext iContext, out Patch retval);+/
  /+/*[id(0x00000034)]*/ RecordList get_ProductsEx(wchar* Product, wchar* UserSid, int Contexts);+/
  /+/*[id(0x00000037)]*/ RecordList get_PatchesEx(wchar* Product, wchar* UserSid, int Contexts, int filter);+/
  /+/*[id(0x00000039)]*/ wchar* ExtractPatchXMLData(wchar* PatchPath);+/
  /+const MsiUILevel UILevel;+/
}

interface Record : IDispatch {
  mixin(uuid("000c1093-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x000c1093, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /+/*[id(0x00000001)]*/ wchar* get_StringData(int Field);+/
  /+/*[id(0x00000001)]*/ void set_StringData(int Field, wchar* value);+/
  /+/*[id(0x00000002)]*/ int get_IntegerData(int Field);+/
  /+/*[id(0x00000002)]*/ void set_IntegerData(int Field, int value);+/
  /+/*[id(0x00000003)]*/ void SetStream(int Field, wchar* FilePath);+/
  /+/*[id(0x00000004)]*/ wchar* ReadStream(int Field, int Length, MsiReadStream Format);+/
  /+/*[id(0x00000000)]*/ int get_FieldCount();+/
  /+/*[id(0x00000006)]*/ short get_IsNull(int Field);+/
  /+/*[id(0x00000005)]*/ int get_DataSize(int Field);+/
  /+/*[id(0x00000007)]*/ void ClearData();+/
  /+/*[id(0x00000008)]*/ wchar* FormatText();+/
}

interface Session : IDispatch {
  mixin(uuid("000c109e-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x000c109e, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /+/*[id(0x00000001)]*/ Installer get_Installer();+/
  /+/*[id(0x00000002)]*/ wchar* get_Property(wchar* Name);+/
  /+/*[id(0x00000002)]*/ void set_Property(wchar* Name, wchar* value);+/
  /+/*[id(0x00000003)]*/ int get_Language();+/
  /+/*[id(0x00000004)]*/ short get_Mode(MsiRunMode Flag);+/
  /+/*[id(0x00000004)]*/ void set_Mode(MsiRunMode Flag, short value);+/
  /+/*[id(0x00000005)]*/ Database get_Database();+/
  /+/*[id(0x00000006)]*/ wchar* get_SourcePath(wchar* Folder);+/
  /+/*[id(0x00000007)]*/ wchar* get_TargetPath(wchar* Folder);+/
  /+/*[id(0x00000007)]*/ void set_TargetPath(wchar* Folder, wchar* value);+/
  /+/*[id(0x00000008)]*/ MsiDoActionStatus DoAction(wchar* Action);+/
  /+/*[id(0x00000009)]*/ MsiDoActionStatus Sequence(wchar* Table, DWINVARIANT Mode);+/
  /+/*[id(0x0000000A)]*/ MsiEvaluateCondition EvaluateCondition(wchar* Expression);+/
  /+/*[id(0x0000000B)]*/ wchar* FormatRecord(Record Record);+/
  /+/*[id(0x0000000C)]*/ MsiMessageStatus Message(MsiMessageType Kind, Record Record);+/
  /+/*[id(0x0000000D)]*/ MsiInstallState get_FeatureCurrentState(wchar* Feature);+/
  /+/*[id(0x0000000E)]*/ MsiInstallState get_FeatureRequestState(wchar* Feature);+/
  /+/*[id(0x0000000E)]*/ void set_FeatureRequestState(wchar* Feature, MsiInstallState value);+/
  /+/*[id(0x0000000F)]*/ int get_FeatureValidStates(wchar* Feature);+/
  /+/*[id(0x00000010)]*/ int get_FeatureCost(wchar* Feature, MsiCostTree CostTree, MsiInstallState State);+/
  /+/*[id(0x00000011)]*/ MsiInstallState get_ComponentCurrentState(wchar* Component);+/
  /+/*[id(0x00000012)]*/ MsiInstallState get_ComponentRequestState(wchar* Component);+/
  /+/*[id(0x00000012)]*/ void set_ComponentRequestState(wchar* Component, MsiInstallState value);+/
  /+/*[id(0x00000013)]*/ void SetInstallLevel(int Level);+/
  /+/*[id(0x00000014)]*/ short get_VerifyDiskSpace();+/
  /+/*[id(0x00000015)]*/ wchar* get_ProductProperty(wchar* Property);+/
  /+/*[id(0x00000016)]*/ FeatureInfo get_FeatureInfo(wchar* Feature);+/
  /+/*[id(0x00000017)]*/ RecordList get_ComponentCosts(wchar* Component, MsiInstallState State);+/
}

interface Database : IDispatch {
  mixin(uuid("000c109d-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x000c109d, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /+/*[id(0x00000001)]*/ MsiDatabaseState get_DatabaseState();+/
  /+/*[id(0x00000002)]*/ SummaryInfo get_SummaryInformation(int UpdateCount);+/
  /+/*[id(0x00000003)]*/ View OpenView(wchar* Sql);+/
  /+/*[id(0x00000004)]*/ void Commit();+/
  /+/*[id(0x00000005)]*/ Record get_PrimaryKeys(wchar* Table);+/
  /+/*[id(0x00000006)]*/ void Import(wchar* Folder, wchar* File);+/
  /+/*[id(0x00000007)]*/ void Export(wchar* Table, wchar* Folder, wchar* File);+/
  /+/*[id(0x00000008)]*/ short Merge(Database Database, wchar* ErrorTable);+/
  /+/*[id(0x00000009)]*/ short GenerateTransform(Database ReferenceDatabase, wchar* TransformFile);+/
  /+/*[id(0x0000000A)]*/ void ApplyTransform(wchar* TransformFile, MsiTransformError ErrorConditions);+/
  /+/*[id(0x0000000B)]*/ UIPreview EnableUIPreview();+/
  /+/*[id(0x0000000C)]*/ MsiEvaluateCondition get_TablePersistent(wchar* Table);+/
  /+/*[id(0x0000000D)]*/ void CreateTransformSummaryInfo(Database ReferenceDatabase, wchar* TransformFile, MsiTransformError ErrorConditions, MsiTransformValidation Validation);+/
}

interface SummaryInfo : IDispatch {
  mixin(uuid("000c109b-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x000c109b, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /+/*[id(0x00000001)]*/ DWINVARIANT get_Property(int Pid);+/
  /+/*[id(0x00000001)]*/ void set_Property(int Pid, DWINVARIANT value);+/
  /+/*[id(0x00000002)]*/ int get_PropertyCount();+/
  /+/*[id(0x00000003)]*/ void Persist();+/
}

interface View : IDispatch {
  mixin(uuid("000c109c-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x000c109c, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /+/*[id(0x00000001)]*/ void Execute(Record Params);+/
  /+/*[id(0x00000002)]*/ Record Fetch();+/
  /+/*[id(0x00000003)]*/ void Modify(MsiViewModify Mode, Record Record);+/
  /+/*[id(0x00000005)]*/ Record get_ColumnInfo(MsiColumnInfo Info);+/
  /+/*[id(0x00000004)]*/ void Close();+/
  /+/*[id(0x00000006)]*/ wchar* GetError();+/
}

interface UIPreview : IDispatch {
  mixin(uuid("000c109a-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x000c109a, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /+/*[id(0x00000001)]*/ wchar* get_Property(wchar* Name);+/
  /+/*[id(0x00000001)]*/ void set_Property(wchar* Name, wchar* value);+/
  /+/*[id(0x00000002)]*/ void ViewDialog(wchar* Dialog);+/
  /+/*[id(0x00000003)]*/ void ViewBillboard(wchar* Control, wchar* Billboard);+/
}

interface FeatureInfo : IDispatch {
  mixin(uuid("000c109f-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x000c109f, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /+/*[id(0x00000001)]*/ wchar* get_Title();+/
  /+/*[id(0x00000002)]*/ wchar* get_Description();+/
  /+const int Attributes;+/
}

interface RecordList : IDispatch {
  mixin(uuid("000c1096-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x000c1096, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /+/*[id(0xFFFFFFFC)]*/ IUnknown _NewEnum();+/
  /+/*[id(0x00000000)]*/ Record get_Item(int Index);+/
  /+/*[id(0x00000001)]*/ int get_Count();+/
}

interface StringList : IDispatch {
  mixin(uuid("000c1095-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x000c1095, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /+/*[id(0xFFFFFFFC)]*/ IUnknown _NewEnum();+/
  /+/*[id(0x00000000)]*/ wchar* get_Item(int Index);+/
  /+/*[id(0x00000001)]*/ int get_Count();+/
}

interface Product : IDispatch {
  mixin(uuid("000c10a0-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x000c10a0, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /+/*[id(0x00000001)]*/ int get_ProductCode(out wchar* retval);+/
  /+/*[id(0x00000002)]*/ int get_UserSid(out wchar* retval);+/
  /+/*[id(0x00000003)]*/ int get_Context(out MsiInstallContext retval);+/
  /+/*[id(0x00000004)]*/ int get_State(out MsiInstallState retval);+/
  /+/*[id(0x00000005)]*/ int get_InstallProperty(wchar* Name, out wchar* retval);+/
  /+/*[id(0x00000006)]*/ int get_ComponentState(wchar* Component, out MsiInstallState retval);+/
  /+/*[id(0x00000007)]*/ int get_FeatureState(wchar* Feature, out MsiInstallState retval);+/
  /+/*[id(0x0000000E)]*/ int get_Sources(int SourceType, out StringList retval);+/
  /+/*[id(0x0000000F)]*/ int get_MediaDisks(out RecordList retval);+/
  /+/*[id(0x00000008)]*/ int SourceListAddSource(MsiInstallSourceType iSourceType, wchar* Source, int dwIndex);+/
  /+/*[id(0x00000009)]*/ int SourceListAddMediaDisk(int dwDiskId, wchar* VolumeLabel, wchar* DiskPrompt);+/
  /+/*[id(0x0000000A)]*/ int SourceListClearSource(MsiInstallSourceType iSourceType, wchar* Source);+/
  /+/*[id(0x0000000B)]*/ int SourceListClearMediaDisk(int iDiskId);+/
  /+/*[id(0x0000000C)]*/ int SourceListClearAll(MsiInstallSourceType iSourceType);+/
  /+/*[id(0x0000000D)]*/ int SourceListForceResolution();+/
  /+/*[id(0x00000010)]*/ int get_SourceListInfo(wchar* Property, out wchar* retval);+/
  /+/*[id(0x00000010)]*/ int set_SourceListInfo(wchar* Property, wchar* retval);+/
}

interface Patch : IDispatch {
  mixin(uuid("000c10a1-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x000c10a1, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /+/*[id(0x00000001)]*/ int get_PatchCode(out wchar* retval);+/
  /+/*[id(0x00000002)]*/ int get_ProductCode(out wchar* retval);+/
  /+/*[id(0x00000003)]*/ int get_UserSid(out wchar* retval);+/
  /+/*[id(0x00000004)]*/ int get_Context(out MsiInstallContext retval);+/
  /+/*[id(0x00000005)]*/ int get_State(out MsiInstallState retval);+/
  /+/*[id(0x0000000C)]*/ int get_Sources(int SourceType, out StringList retval);+/
  /+/*[id(0x0000000D)]*/ int get_MediaDisks(out RecordList retval);+/
  /+/*[id(0x00000006)]*/ int SourceListAddSource(MsiInstallSourceType iSourceType, wchar* Source, int dwIndex);+/
  /+/*[id(0x00000007)]*/ int SourceListAddMediaDisk(int dwDiskId, wchar* VolumeLabel, wchar* DiskPrompt);+/
  /+/*[id(0x00000008)]*/ int SourceListClearSource(MsiInstallSourceType iSourceType, wchar* Source);+/
  /+/*[id(0x00000009)]*/ int SourceListClearMediaDisk(int iDiskId);+/
  /+/*[id(0x0000000A)]*/ int SourceListClearAll(MsiInstallSourceType iSourceType);+/
  /+/*[id(0x0000000B)]*/ int SourceListForceResolution();+/
  /+/*[id(0x0000000E)]*/ int get_SourceListInfo(wchar* Property, out wchar* retval);+/
  /+/*[id(0x0000000E)]*/ int set_SourceListInfo(wchar* Property, wchar* retval);+/
  /+/*[id(0x0000000F)]*/ int get_PatchProperty(wchar* Property, out wchar* Value);+/
}
