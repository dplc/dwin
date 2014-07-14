// Microsoft ActiveX Data Objects 2.8 Library
// Version 2.8

/*[uuid("2a75196c-d9eb-4129-b803-931327f72d5c")]*/
module dwin.sys.win32.com.tlb.adodb;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum CursorTypeEnum {
  adOpenUnspecified = 0xFFFFFFFF,
  adOpenForwardOnly = 0x00000000,
  adOpenKeyset = 0x00000001,
  adOpenDynamic = 0x00000002,
  adOpenStatic = 0x00000003,
}

enum CursorOptionEnum {
  adHoldRecords = 0x00000100,
  adMovePrevious = 0x00000200,
  adAddNew = 0x01000400,
  adDelete = 0x01000800,
  adUpdate = 0x01008000,
  adBookmark = 0x00002000,
  adApproxPosition = 0x00004000,
  adUpdateBatch = 0x00010000,
  adResync = 0x00020000,
  adNotify = 0x00040000,
  adFind = 0x00080000,
  adSeek = 0x00400000,
  adIndex = 0x00800000,
}

enum LockTypeEnum {
  adLockUnspecified = 0xFFFFFFFF,
  adLockReadOnly = 0x00000001,
  adLockPessimistic = 0x00000002,
  adLockOptimistic = 0x00000003,
  adLockBatchOptimistic = 0x00000004,
}

enum ExecuteOptionEnum {
  adOptionUnspecified = 0xFFFFFFFF,
  adAsyncExecute = 0x00000010,
  adAsyncFetch = 0x00000020,
  adAsyncFetchNonBlocking = 0x00000040,
  adExecuteNoRecords = 0x00000080,
  adExecuteStream = 0x00000400,
  adExecuteRecord = 0x00000800,
}

enum ConnectOptionEnum {
  adConnectUnspecified = 0xFFFFFFFF,
  adAsyncConnect = 0x00000010,
}

enum ObjectStateEnum {
  adStateClosed = 0x00000000,
  adStateOpen = 0x00000001,
  adStateConnecting = 0x00000002,
  adStateExecuting = 0x00000004,
  adStateFetching = 0x00000008,
}

enum CursorLocationEnum {
  adUseNone = 0x00000001,
  adUseServer = 0x00000002,
  adUseClient = 0x00000003,
  adUseClientBatch = 0x00000003,
}

enum DataTypeEnum {
  adEmpty = 0x00000000,
  adTinyInt = 0x00000010,
  adSmallInt = 0x00000002,
  adInteger = 0x00000003,
  adBigInt = 0x00000014,
  adUnsignedTinyInt = 0x00000011,
  adUnsignedSmallInt = 0x00000012,
  adUnsignedInt = 0x00000013,
  adUnsignedBigInt = 0x00000015,
  adSingle = 0x00000004,
  adDouble = 0x00000005,
  adCurrency = 0x00000006,
  adDecimal = 0x0000000E,
  adNumeric = 0x00000083,
  adBoolean = 0x0000000B,
  adError = 0x0000000A,
  adUserDefined = 0x00000084,
  adVariant = 0x0000000C,
  adIDispatch = 0x00000009,
  adIUnknown = 0x0000000D,
  adGUID = 0x00000048,
  adDate = 0x00000007,
  adDBDate = 0x00000085,
  adDBTime = 0x00000086,
  adDBTimeStamp = 0x00000087,
  adBSTR = 0x00000008,
  adChar = 0x00000081,
  adVarChar = 0x000000C8,
  adLongVarChar = 0x000000C9,
  adWChar = 0x00000082,
  adVarWChar = 0x000000CA,
  adLongVarWChar = 0x000000CB,
  adBinary = 0x00000080,
  adVarBinary = 0x000000CC,
  adLongVarBinary = 0x000000CD,
  adChapter = 0x00000088,
  adFileTime = 0x00000040,
  adPropVariant = 0x0000008A,
  adVarNumeric = 0x0000008B,
  adArray = 0x00002000,
}

enum FieldAttributeEnum {
  adFldUnspecified = 0xFFFFFFFF,
  adFldMayDefer = 0x00000002,
  adFldUpdatable = 0x00000004,
  adFldUnknownUpdatable = 0x00000008,
  adFldFixed = 0x00000010,
  adFldIsNullable = 0x00000020,
  adFldMayBeNull = 0x00000040,
  adFldLong = 0x00000080,
  adFldRowID = 0x00000100,
  adFldRowVersion = 0x00000200,
  adFldCacheDeferred = 0x00001000,
  adFldIsChapter = 0x00002000,
  adFldNegativeScale = 0x00004000,
  adFldKeyColumn = 0x00008000,
  adFldIsRowURL = 0x00010000,
  adFldIsDefaultStream = 0x00020000,
  adFldIsCollection = 0x00040000,
}

enum EditModeEnum {
  adEditNone = 0x00000000,
  adEditInProgress = 0x00000001,
  adEditAdd = 0x00000002,
  adEditDelete = 0x00000004,
}

enum RecordStatusEnum {
  adRecOK = 0x00000000,
  adRecNew = 0x00000001,
  adRecModified = 0x00000002,
  adRecDeleted = 0x00000004,
  adRecUnmodified = 0x00000008,
  adRecInvalid = 0x00000010,
  adRecMultipleChanges = 0x00000040,
  adRecPendingChanges = 0x00000080,
  adRecCanceled = 0x00000100,
  adRecCantRelease = 0x00000400,
  adRecConcurrencyViolation = 0x00000800,
  adRecIntegrityViolation = 0x00001000,
  adRecMaxChangesExceeded = 0x00002000,
  adRecObjectOpen = 0x00004000,
  adRecOutOfMemory = 0x00008000,
  adRecPermissionDenied = 0x00010000,
  adRecSchemaViolation = 0x00020000,
  adRecDBDeleted = 0x00040000,
}

enum GetRowsOptionEnum {
  adGetRowsRest = 0xFFFFFFFF,
}

enum PositionEnum {
  adPosUnknown = 0xFFFFFFFF,
  adPosBOF = 0xFFFFFFFE,
  adPosEOF = 0xFFFFFFFD,
}

enum BookmarkEnum {
  adBookmarkCurrent = 0x00000000,
  adBookmarkFirst = 0x00000001,
  adBookmarkLast = 0x00000002,
}

enum MarshalOptionsEnum {
  adMarshalAll = 0x00000000,
  adMarshalModifiedOnly = 0x00000001,
}

enum AffectEnum {
  adAffectCurrent = 0x00000001,
  adAffectGroup = 0x00000002,
  adAffectAll = 0x00000003,
  adAffectAllChapters = 0x00000004,
}

enum ResyncEnum {
  adResyncUnderlyingValues = 0x00000001,
  adResyncAllValues = 0x00000002,
}

enum CompareEnum {
  adCompareLessThan = 0x00000000,
  adCompareEqual = 0x00000001,
  adCompareGreaterThan = 0x00000002,
  adCompareNotEqual = 0x00000003,
  adCompareNotComparable = 0x00000004,
}

enum FilterGroupEnum {
  adFilterNone = 0x00000000,
  adFilterPendingRecords = 0x00000001,
  adFilterAffectedRecords = 0x00000002,
  adFilterFetchedRecords = 0x00000003,
  adFilterPredicate = 0x00000004,
  adFilterConflictingRecords = 0x00000005,
}

enum SearchDirectionEnum {
  adSearchForward = 0x00000001,
  adSearchBackward = 0xFFFFFFFF,
}

enum PersistFormatEnum {
  adPersistADTG = 0x00000000,
  adPersistXML = 0x00000001,
}

enum StringFormatEnum {
  adClipString = 0x00000002,
}

enum ConnectPromptEnum {
  adPromptAlways = 0x00000001,
  adPromptComplete = 0x00000002,
  adPromptCompleteRequired = 0x00000003,
  adPromptNever = 0x00000004,
}

enum ConnectModeEnum {
  adModeUnknown = 0x00000000,
  adModeRead = 0x00000001,
  adModeWrite = 0x00000002,
  adModeReadWrite = 0x00000003,
  adModeShareDenyRead = 0x00000004,
  adModeShareDenyWrite = 0x00000008,
  adModeShareExclusive = 0x0000000C,
  adModeShareDenyNone = 0x00000010,
  adModeRecursive = 0x00400000,
}

enum RecordCreateOptionsEnum {
  adCreateCollection = 0x00002000,
  adCreateStructDoc = 0x80000000,
  adCreateNonCollection = 0x00000000,
  adOpenIfExists = 0x02000000,
  adCreateOverwrite = 0x04000000,
  adFailIfNotExists = 0xFFFFFFFF,
}

enum RecordOpenOptionsEnum {
  adOpenRecordUnspecified = 0xFFFFFFFF,
  adOpenSource = 0x00800000,
  adOpenOutput = 0x00800000,
  adOpenAsync = 0x00001000,
  adDelayFetchStream = 0x00004000,
  adDelayFetchFields = 0x00008000,
  adOpenExecuteCommand = 0x00010000,
}

enum IsolationLevelEnum {
  adXactUnspecified = 0xFFFFFFFF,
  adXactChaos = 0x00000010,
  adXactReadUncommitted = 0x00000100,
  adXactBrowse = 0x00000100,
  adXactCursorStability = 0x00001000,
  adXactReadCommitted = 0x00001000,
  adXactRepeatableRead = 0x00010000,
  adXactSerializable = 0x00100000,
  adXactIsolated = 0x00100000,
}

enum XactAttributeEnum {
  adXactCommitRetaining = 0x00020000,
  adXactAbortRetaining = 0x00040000,
  adXactAsyncPhaseOne = 0x00080000,
  adXactSyncPhaseOne = 0x00100000,
}

enum PropertyAttributesEnum {
  adPropNotSupported = 0x00000000,
  adPropRequired = 0x00000001,
  adPropOptional = 0x00000002,
  adPropRead = 0x00000200,
  adPropWrite = 0x00000400,
}

enum ErrorValueEnum {
  adErrProviderFailed = 0x00000BB8,
  adErrInvalidArgument = 0x00000BB9,
  adErrOpeningFile = 0x00000BBA,
  adErrReadFile = 0x00000BBB,
  adErrWriteFile = 0x00000BBC,
  adErrNoCurrentRecord = 0x00000BCD,
  adErrIllegalOperation = 0x00000C93,
  adErrCantChangeProvider = 0x00000C94,
  adErrInTransaction = 0x00000CAE,
  adErrFeatureNotAvailable = 0x00000CB3,
  adErrItemNotFound = 0x00000CC1,
  adErrObjectInCollection = 0x00000D27,
  adErrObjectNotSet = 0x00000D5C,
  adErrDataConversion = 0x00000D5D,
  adErrObjectClosed = 0x00000E78,
  adErrObjectOpen = 0x00000E79,
  adErrProviderNotFound = 0x00000E7A,
  adErrBoundToCommand = 0x00000E7B,
  adErrInvalidParamInfo = 0x00000E7C,
  adErrInvalidConnection = 0x00000E7D,
  adErrNotReentrant = 0x00000E7E,
  adErrStillExecuting = 0x00000E7F,
  adErrOperationCancelled = 0x00000E80,
  adErrStillConnecting = 0x00000E81,
  adErrInvalidTransaction = 0x00000E82,
  adErrNotExecuting = 0x00000E83,
  adErrUnsafeOperation = 0x00000E84,
  adwrnSecurityDialog = 0x00000E85,
  adwrnSecurityDialogHeader = 0x00000E86,
  adErrIntegrityViolation = 0x00000E87,
  adErrPermissionDenied = 0x00000E88,
  adErrDataOverflow = 0x00000E89,
  adErrSchemaViolation = 0x00000E8A,
  adErrSignMismatch = 0x00000E8B,
  adErrCantConvertvalue = 0x00000E8C,
  adErrCantCreate = 0x00000E8D,
  adErrColumnNotOnThisRow = 0x00000E8E,
  adErrURLDoesNotExist = 0x00000E8F,
  adErrTreePermissionDenied = 0x00000E90,
  adErrInvalidURL = 0x00000E91,
  adErrResourceLocked = 0x00000E92,
  adErrResourceExists = 0x00000E93,
  adErrCannotComplete = 0x00000E94,
  adErrVolumeNotFound = 0x00000E95,
  adErrOutOfSpace = 0x00000E96,
  adErrResourceOutOfScope = 0x00000E97,
  adErrUnavailable = 0x00000E98,
  adErrURLNamedRowDoesNotExist = 0x00000E99,
  adErrDelResOutOfScope = 0x00000E9A,
  adErrPropInvalidColumn = 0x00000E9B,
  adErrPropInvalidOption = 0x00000E9C,
  adErrPropInvalidValue = 0x00000E9D,
  adErrPropConflicting = 0x00000E9E,
  adErrPropNotAllSettable = 0x00000E9F,
  adErrPropNotSet = 0x00000EA0,
  adErrPropNotSettable = 0x00000EA1,
  adErrPropNotSupported = 0x00000EA2,
  adErrCatalogNotSet = 0x00000EA3,
  adErrCantChangeConnection = 0x00000EA4,
  adErrFieldsUpdateFailed = 0x00000EA5,
  adErrDenyNotSupported = 0x00000EA6,
  adErrDenyTypeNotSupported = 0x00000EA7,
  adErrProviderNotSpecified = 0x00000EA9,
  adErrConnectionStringTooLong = 0x00000EAA,
}

enum ParameterAttributesEnum {
  adParamSigned = 0x00000010,
  adParamNullable = 0x00000040,
  adParamLong = 0x00000080,
}

enum ParameterDirectionEnum {
  adParamUnknown = 0x00000000,
  adParamInput = 0x00000001,
  adParamOutput = 0x00000002,
  adParamInputOutput = 0x00000003,
  adParamReturnValue = 0x00000004,
}

enum CommandTypeEnum {
  adCmdUnspecified = 0xFFFFFFFF,
  adCmdUnknown = 0x00000008,
  adCmdText = 0x00000001,
  adCmdTable = 0x00000002,
  adCmdStoredProc = 0x00000004,
  adCmdFile = 0x00000100,
  adCmdTableDirect = 0x00000200,
}

enum EventStatusEnum {
  adStatusOK = 0x00000001,
  adStatusErrorsOccurred = 0x00000002,
  adStatusCantDeny = 0x00000003,
  adStatusCancel = 0x00000004,
  adStatusUnwantedEvent = 0x00000005,
}

enum EventReasonEnum {
  adRsnAddNew = 0x00000001,
  adRsnDelete = 0x00000002,
  adRsnUpdate = 0x00000003,
  adRsnUndoUpdate = 0x00000004,
  adRsnUndoAddNew = 0x00000005,
  adRsnUndoDelete = 0x00000006,
  adRsnRequery = 0x00000007,
  adRsnResynch = 0x00000008,
  adRsnClose = 0x00000009,
  adRsnMove = 0x0000000A,
  adRsnFirstChange = 0x0000000B,
  adRsnMoveFirst = 0x0000000C,
  adRsnMoveNext = 0x0000000D,
  adRsnMovePrevious = 0x0000000E,
  adRsnMoveLast = 0x0000000F,
}

enum SchemaEnum {
  adSchemaProviderSpecific = 0xFFFFFFFF,
  adSchemaAsserts = 0x00000000,
  adSchemaCatalogs = 0x00000001,
  adSchemaCharacterSets = 0x00000002,
  adSchemaCollations = 0x00000003,
  adSchemaColumns = 0x00000004,
  adSchemaCheckConstraints = 0x00000005,
  adSchemaConstraintColumnUsage = 0x00000006,
  adSchemaConstraintTableUsage = 0x00000007,
  adSchemaKeyColumnUsage = 0x00000008,
  adSchemaReferentialContraints = 0x00000009,
  adSchemaReferentialConstraints = 0x00000009,
  adSchemaTableConstraints = 0x0000000A,
  adSchemaColumnsDomainUsage = 0x0000000B,
  adSchemaIndexes = 0x0000000C,
  adSchemaColumnPrivileges = 0x0000000D,
  adSchemaTablePrivileges = 0x0000000E,
  adSchemaUsagePrivileges = 0x0000000F,
  adSchemaProcedures = 0x00000010,
  adSchemaSchemata = 0x00000011,
  adSchemaSQLLanguages = 0x00000012,
  adSchemaStatistics = 0x00000013,
  adSchemaTables = 0x00000014,
  adSchemaTranslations = 0x00000015,
  adSchemaProviderTypes = 0x00000016,
  adSchemaViews = 0x00000017,
  adSchemaViewColumnUsage = 0x00000018,
  adSchemaViewTableUsage = 0x00000019,
  adSchemaProcedureParameters = 0x0000001A,
  adSchemaForeignKeys = 0x0000001B,
  adSchemaPrimaryKeys = 0x0000001C,
  adSchemaProcedureColumns = 0x0000001D,
  adSchemaDBInfoKeywords = 0x0000001E,
  adSchemaDBInfoLiterals = 0x0000001F,
  adSchemaCubes = 0x00000020,
  adSchemaDimensions = 0x00000021,
  adSchemaHierarchies = 0x00000022,
  adSchemaLevels = 0x00000023,
  adSchemaMeasures = 0x00000024,
  adSchemaProperties = 0x00000025,
  adSchemaMembers = 0x00000026,
  adSchemaTrustees = 0x00000027,
  adSchemaFunctions = 0x00000028,
  adSchemaActions = 0x00000029,
  adSchemaCommands = 0x0000002A,
  adSchemaSets = 0x0000002B,
}

enum FieldStatusEnum {
  adFieldOK = 0x00000000,
  adFieldCantConvertValue = 0x00000002,
  adFieldIsNull = 0x00000003,
  adFieldTruncated = 0x00000004,
  adFieldSignMismatch = 0x00000005,
  adFieldDataOverflow = 0x00000006,
  adFieldCantCreate = 0x00000007,
  adFieldUnavailable = 0x00000008,
  adFieldPermissionDenied = 0x00000009,
  adFieldIntegrityViolation = 0x0000000A,
  adFieldSchemaViolation = 0x0000000B,
  adFieldBadStatus = 0x0000000C,
  adFieldDefault = 0x0000000D,
  adFieldIgnore = 0x0000000F,
  adFieldDoesNotExist = 0x00000010,
  adFieldInvalidURL = 0x00000011,
  adFieldResourceLocked = 0x00000012,
  adFieldResourceExists = 0x00000013,
  adFieldCannotComplete = 0x00000014,
  adFieldVolumeNotFound = 0x00000015,
  adFieldOutOfSpace = 0x00000016,
  adFieldCannotDeleteSource = 0x00000017,
  adFieldReadOnly = 0x00000018,
  adFieldResourceOutOfScope = 0x00000019,
  adFieldAlreadyExists = 0x0000001A,
  adFieldPendingInsert = 0x00010000,
  adFieldPendingDelete = 0x00020000,
  adFieldPendingChange = 0x00040000,
  adFieldPendingUnknown = 0x00080000,
  adFieldPendingUnknownDelete = 0x00100000,
}

enum SeekEnum {
  adSeekFirstEQ = 0x00000001,
  adSeekLastEQ = 0x00000002,
  adSeekAfterEQ = 0x00000004,
  adSeekAfter = 0x00000008,
  adSeekBeforeEQ = 0x00000010,
  adSeekBefore = 0x00000020,
}

enum ADCPROP_UPDATECRITERIA_ENUM {
  adCriteriaKey = 0x00000000,
  adCriteriaAllCols = 0x00000001,
  adCriteriaUpdCols = 0x00000002,
  adCriteriaTimeStamp = 0x00000003,
}

enum ADCPROP_ASYNCTHREADPRIORITY_ENUM {
  adPriorityLowest = 0x00000001,
  adPriorityBelowNormal = 0x00000002,
  adPriorityNormal = 0x00000003,
  adPriorityAboveNormal = 0x00000004,
  adPriorityHighest = 0x00000005,
}

enum ADCPROP_AUTORECALC_ENUM {
  adRecalcUpFront = 0x00000000,
  adRecalcAlways = 0x00000001,
}

enum ADCPROP_UPDATERESYNC_ENUM {
  adResyncNone = 0x00000000,
  adResyncAutoIncrement = 0x00000001,
  adResyncConflicts = 0x00000002,
  adResyncUpdates = 0x00000004,
  adResyncInserts = 0x00000008,
  adResyncAll = 0x0000000F,
}

enum MoveRecordOptionsEnum {
  adMoveUnspecified = 0xFFFFFFFF,
  adMoveOverWrite = 0x00000001,
  adMoveDontUpdateLinks = 0x00000002,
  adMoveAllowEmulation = 0x00000004,
}

enum CopyRecordOptionsEnum {
  adCopyUnspecified = 0xFFFFFFFF,
  adCopyOverWrite = 0x00000001,
  adCopyAllowEmulation = 0x00000004,
  adCopyNonRecursive = 0x00000002,
}

enum StreamTypeEnum {
  adTypeBinary = 0x00000001,
  adTypeText = 0x00000002,
}

enum LineSeparatorEnum {
  adLF = 0x0000000A,
  adCR = 0x0000000D,
  adCRLF = 0xFFFFFFFF,
}

enum StreamOpenOptionsEnum {
  adOpenStreamUnspecified = 0xFFFFFFFF,
  adOpenStreamAsync = 0x00000001,
  adOpenStreamFromRecord = 0x00000004,
}

enum StreamWriteEnum {
  adWriteChar = 0x00000000,
  adWriteLine = 0x00000001,
  stWriteChar = 0x00000000,
  stWriteLine = 0x00000001,
}

enum SaveOptionsEnum {
  adSaveCreateNotExist = 0x00000001,
  adSaveCreateOverWrite = 0x00000002,
}

enum FieldEnum {
  adDefaultStream = 0xFFFFFFFF,
  adRecordURL = 0xFFFFFFFE,
}

enum StreamReadEnum {
  adReadAll = 0xFFFFFFFF,
  adReadLine = 0xFFFFFFFE,
}

enum RecordTypeEnum {
  adSimpleRecord = 0x00000000,
  adCollectionRecord = 0x00000001,
  adStructDoc = 0x00000002,
}

// Aliases

alias PositionEnum PositionEnum_Param;

alias SearchDirectionEnum SearchDirection;

alias int ADO_LONGPTR;

// Interfaces

interface _Collection : IDispatch {
  mixin(uuid("00000512-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x00000512, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x00000001)]*/ int get_Count(out int c);
  /*[id(0xFFFFFFFC)]*/ int _NewEnum(out IUnknown ppvObject);
  /*[id(0x00000002)]*/ int Refresh();
}

interface _DynaCollection : _Collection {
  mixin(uuid("00000513-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x00000513, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x60030000)]*/ int Append(IDispatch ObjectParam);
  /*[id(0x60030001)]*/ int Delete(DWINVARIANT Index);
}

interface _ADO : IDispatch {
  mixin(uuid("00000534-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x00000534, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x000001F4)]*/ int get_Properties(out Properties ppvObject);
}

interface Properties : _Collection {
  mixin(uuid("00000504-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x00000504, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT Index, out Property ppvObject);
}

interface Property : IDispatch {
  mixin(uuid("00000503-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x00000503, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x00000000)]*/ int get_Value(out DWINVARIANT pval);
  /*[id(0x00000000)]*/ int put_Value(DWINVARIANT pval);
  /*[id(0x60020002)]*/ int get_Name(out wchar* pbstr);
  /*[id(0x60020003)]*/ int get_Type(out DataTypeEnum ptype);
  /*[id(0x60020004)]*/ int get_Attributes(out int plAttributes);
  /*[id(0x60020004)]*/ int put_Attributes(int plAttributes);
}

interface Error : IDispatch {
  mixin(uuid("00000500-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x00000500, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x00000001)]*/ int get_Number(out int pl);
  /*[id(0x00000002)]*/ int get_Source(out wchar* pbstr);
  /*[id(0x00000000)]*/ int get_Description(out wchar* pbstr);
  /*[id(0x00000003)]*/ int get_HelpFile(out wchar* pbstr);
  /*[id(0x00000004)]*/ int get_HelpContext(out int pl);
  /*[id(0x00000005)]*/ int get_SQLState(out wchar* pbstr);
  /*[id(0x00000006)]*/ int get_NativeError(out int pl);
}

interface Errors : _Collection {
  mixin(uuid("00000501-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x00000501, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT Index, out Error ppvObject);
  /*[id(0x60030001)]*/ int Clear();
}

interface Command15 : _ADO {
  mixin(uuid("00000508-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x00000508, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x00000001)]*/ int get_ActiveConnection(out _Connection ppvObject);
  /*[id(0x00000001)]*/ int setref_ActiveConnection(_Connection ppvObject);
  /*[id(0x00000001)]*/ int put_ActiveConnection(DWINVARIANT ppvObject);
  /*[id(0x00000002)]*/ int get_CommandText(out wchar* pbstr);
  /*[id(0x00000002)]*/ int put_CommandText(wchar* pbstr);
  /*[id(0x00000003)]*/ int get_CommandTimeout(out int pl);
  /*[id(0x00000003)]*/ int put_CommandTimeout(int pl);
  /*[id(0x00000004)]*/ int get_Prepared(out short pfPrepared);
  /*[id(0x00000004)]*/ int put_Prepared(short pfPrepared);
  /*[id(0x00000005)]*/ int Execute(DWINVARIANT* RecordsAffected, DWINVARIANT* Parameters, int Options, out _Recordset ppiRs);
  /*[id(0x00000006)]*/ int CreateParameter(wchar* Name, DataTypeEnum Type, ParameterDirectionEnum Direction, ADO_LONGPTR Size, DWINVARIANT Value, out _Parameter ppiprm);
  /*[id(0x00000000)]*/ int get_Parameters(out Parameters ppvObject);
  /*[id(0x00000007)]*/ int put_CommandType(CommandTypeEnum plCmdType);
  /*[id(0x00000007)]*/ int get_CommandType(out CommandTypeEnum plCmdType);
  /*[id(0x00000008)]*/ int get_Name(out wchar* pbstrName);
  /*[id(0x00000008)]*/ int put_Name(wchar* pbstrName);
}

interface _Connection : Connection15 {
  mixin(uuid("00000550-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x00000550, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x00000015)]*/ int Cancel();
}

interface Connection15 : _ADO {
  mixin(uuid("00000515-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x00000515, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x00000000)]*/ int get_ConnectionString(out wchar* pbstr);
  /*[id(0x00000000)]*/ int put_ConnectionString(wchar* pbstr);
  /*[id(0x00000002)]*/ int get_CommandTimeout(out int plTimeout);
  /*[id(0x00000002)]*/ int put_CommandTimeout(int plTimeout);
  /*[id(0x00000003)]*/ int get_ConnectionTimeout(out int plTimeout);
  /*[id(0x00000003)]*/ int put_ConnectionTimeout(int plTimeout);
  /*[id(0x00000004)]*/ int get_Version(out wchar* pbstr);
  /*[id(0x00000005)]*/ int Close();
  /*[id(0x00000006)]*/ int Execute(wchar* CommandText, DWINVARIANT* RecordsAffected, int Options, out _Recordset ppiRset);
  /*[id(0x00000007)]*/ int BeginTrans(out int TransactionLevel);
  /*[id(0x00000008)]*/ int CommitTrans();
  /*[id(0x00000009)]*/ int RollbackTrans();
  /*[id(0x0000000A)]*/ int Open(wchar* ConnectionString, wchar* UserID, wchar* Password, int Options);
  /*[id(0x0000000B)]*/ int get_Errors(out Errors ppvObject);
  /*[id(0x0000000C)]*/ int get_DefaultDatabase(out wchar* pbstr);
  /*[id(0x0000000C)]*/ int put_DefaultDatabase(wchar* pbstr);
  /*[id(0x0000000D)]*/ int get_IsolationLevel(out IsolationLevelEnum Level);
  /*[id(0x0000000D)]*/ int put_IsolationLevel(IsolationLevelEnum Level);
  /*[id(0x0000000E)]*/ int get_Attributes(out int plAttr);
  /*[id(0x0000000E)]*/ int put_Attributes(int plAttr);
  /*[id(0x0000000F)]*/ int get_CursorLocation(out CursorLocationEnum plCursorLoc);
  /*[id(0x0000000F)]*/ int put_CursorLocation(CursorLocationEnum plCursorLoc);
  /*[id(0x00000010)]*/ int get_Mode(out ConnectModeEnum plMode);
  /*[id(0x00000010)]*/ int put_Mode(ConnectModeEnum plMode);
  /*[id(0x00000011)]*/ int get_Provider(out wchar* pbstr);
  /*[id(0x00000011)]*/ int put_Provider(wchar* pbstr);
  /*[id(0x00000012)]*/ int get_State(out int plObjState);
  /*[id(0x00000013)]*/ int OpenSchema(SchemaEnum Schema, DWINVARIANT Restrictions, DWINVARIANT SchemaID, out _Recordset pprset);
}

interface _Recordset : Recordset21 {
  mixin(uuid("00000556-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x00000556, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x00000421)]*/ int Save(DWINVARIANT Destination, PersistFormatEnum PersistFormat);
}

interface Recordset21 : Recordset20 {
  mixin(uuid("00000555-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x00000555, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x0000042A)]*/ int Seek(DWINVARIANT KeyValues, SeekEnum SeekOption);
  /*[id(0x0000042B)]*/ int put_Index(wchar* pbstrIndex);
  /*[id(0x0000042B)]*/ int get_Index(out wchar* pbstrIndex);
}

interface Recordset20 : Recordset15 {
  mixin(uuid("0000054f-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x0000054f, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x0000041F)]*/ int Cancel();
  /*[id(0x00000420)]*/ int get_DataSource(out IUnknown ppunkDataSource);
  /*[id(0x00000420)]*/ int setref_DataSource(IUnknown ppunkDataSource);
  /*[id(0x60040003)]*/ int _xSave(wchar* FileName, PersistFormatEnum PersistFormat);
  /*[id(0x00000425)]*/ int get_ActiveCommand(out IDispatch ppCmd);
  /*[id(0x00000427)]*/ int put_StayInSync(short pbStayInSync);
  /*[id(0x00000427)]*/ int get_StayInSync(out short pbStayInSync);
  /*[id(0x00000426)]*/ int GetString(StringFormatEnum StringFormat, int NumRows, wchar* ColumnDelimeter, wchar* RowDelimeter, wchar* NullExpr, out wchar* pRetString);
  /*[id(0x00000428)]*/ int get_DataMember(out wchar* pbstrDataMember);
  /*[id(0x00000428)]*/ int put_DataMember(wchar* pbstrDataMember);
  /*[id(0x00000429)]*/ int CompareBookmarks(DWINVARIANT Bookmark1, DWINVARIANT Bookmark2, out CompareEnum pCompare);
  /*[id(0x0000040A)]*/ int Clone(LockTypeEnum LockType, out _Recordset ppvObject);
  /*[id(0x00000400)]*/ int Resync(AffectEnum AffectRecords, ResyncEnum ResyncValues);
}

interface Recordset15 : _ADO {
  mixin(uuid("0000050e-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x0000050e, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x000003E8)]*/ int get_AbsolutePosition(out PositionEnum_Param pl);
  /*[id(0x000003E8)]*/ int put_AbsolutePosition(PositionEnum_Param pl);
  /*[id(0x000003E9)]*/ int setref_ActiveConnection(IDispatch pvar);
  /*[id(0x000003E9)]*/ int put_ActiveConnection(DWINVARIANT pvar);
  /*[id(0x000003E9)]*/ int get_ActiveConnection(out DWINVARIANT pvar);
  /*[id(0x000003EA)]*/ int get_BOF(out short pb);
  /*[id(0x000003EB)]*/ int get_Bookmark(out DWINVARIANT pvBookmark);
  /*[id(0x000003EB)]*/ int put_Bookmark(DWINVARIANT pvBookmark);
  /*[id(0x000003EC)]*/ int get_CacheSize(out int pl);
  /*[id(0x000003EC)]*/ int put_CacheSize(int pl);
  /*[id(0x000003ED)]*/ int get_CursorType(out CursorTypeEnum plCursorType);
  /*[id(0x000003ED)]*/ int put_CursorType(CursorTypeEnum plCursorType);
  /*[id(0x000003EE)]*/ int get_EOF(out short pb);
  /*[id(0x00000000)]*/ int get_Fields(out Fields ppvObject);
  /*[id(0x000003F0)]*/ int get_LockType(out LockTypeEnum plLockType);
  /*[id(0x000003F0)]*/ int put_LockType(LockTypeEnum plLockType);
  /*[id(0x000003F1)]*/ int get_MaxRecords(out ADO_LONGPTR plMaxRecords);
  /*[id(0x000003F1)]*/ int put_MaxRecords(ADO_LONGPTR plMaxRecords);
  /*[id(0x000003F2)]*/ int get_RecordCount(out ADO_LONGPTR pl);
  /*[id(0x000003F3)]*/ int setref_Source(IDispatch pvSource);
  /*[id(0x000003F3)]*/ int put_Source(wchar* pvSource);
  /*[id(0x000003F3)]*/ int get_Source(out DWINVARIANT pvSource);
  /*[id(0x000003F4)]*/ int AddNew(DWINVARIANT FieldList, DWINVARIANT Values);
  /*[id(0x000003F5)]*/ int CancelUpdate();
  /*[id(0x000003F6)]*/ int Close();
  /*[id(0x000003F7)]*/ int Delete(AffectEnum AffectRecords);
  /*[id(0x000003F8)]*/ int GetRows(int Rows, DWINVARIANT Start, DWINVARIANT Fields, out DWINVARIANT pvar);
  /*[id(0x000003F9)]*/ int Move(ADO_LONGPTR NumRecords, DWINVARIANT Start);
  /*[id(0x000003FA)]*/ int MoveNext();
  /*[id(0x000003FB)]*/ int MovePrevious();
  /*[id(0x000003FC)]*/ int MoveFirst();
  /*[id(0x000003FD)]*/ int MoveLast();
  /*[id(0x000003FE)]*/ int Open(DWINVARIANT Source, DWINVARIANT ActiveConnection, CursorTypeEnum CursorType, LockTypeEnum LockType, int Options);
  /*[id(0x000003FF)]*/ int Requery(int Options);
  /*[id(0x60030022)]*/ int _xResync(AffectEnum AffectRecords);
  /*[id(0x00000401)]*/ int Update(DWINVARIANT Fields, DWINVARIANT Values);
  /*[id(0x00000417)]*/ int get_AbsolutePage(out PositionEnum_Param pl);
  /*[id(0x00000417)]*/ int put_AbsolutePage(PositionEnum_Param pl);
  /*[id(0x00000402)]*/ int get_EditMode(out EditModeEnum pl);
  /*[id(0x00000406)]*/ int get_Filter(out DWINVARIANT Criteria);
  /*[id(0x00000406)]*/ int put_Filter(DWINVARIANT Criteria);
  /*[id(0x0000041A)]*/ int get_PageCount(out ADO_LONGPTR pl);
  /*[id(0x00000418)]*/ int get_PageSize(out int pl);
  /*[id(0x00000418)]*/ int put_PageSize(int pl);
  /*[id(0x00000407)]*/ int get_Sort(out wchar* Criteria);
  /*[id(0x00000407)]*/ int put_Sort(wchar* Criteria);
  /*[id(0x00000405)]*/ int get_Status(out int pl);
  /*[id(0x0000041E)]*/ int get_State(out int plObjState);
  /*[id(0x60030030)]*/ int _xClone(out _Recordset ppvObject);
  /*[id(0x0000040B)]*/ int UpdateBatch(AffectEnum AffectRecords);
  /*[id(0x00000419)]*/ int CancelBatch(AffectEnum AffectRecords);
  /*[id(0x0000041B)]*/ int get_CursorLocation(out CursorLocationEnum plCursorLoc);
  /*[id(0x0000041B)]*/ int put_CursorLocation(CursorLocationEnum plCursorLoc);
  /*[id(0x0000041C)]*/ int NextRecordset(DWINVARIANT* RecordsAffected, out _Recordset ppiRs);
  /*[id(0x0000040C)]*/ int Supports(CursorOptionEnum CursorOptions, out short pb);
  /*[id(0xFFFFFFF8)]*/ int get_Collect(DWINVARIANT Index, out DWINVARIANT pvar);
  /*[id(0xFFFFFFF8)]*/ int put_Collect(DWINVARIANT Index, DWINVARIANT pvar);
  /*[id(0x0000041D)]*/ int get_MarshalOptions(out MarshalOptionsEnum peMarshal);
  /*[id(0x0000041D)]*/ int put_MarshalOptions(MarshalOptionsEnum peMarshal);
  /*[id(0x00000422)]*/ int Find(wchar* Criteria, ADO_LONGPTR SkipRecords, SearchDirectionEnum SearchDirection, DWINVARIANT Start);
}

interface Fields : Fields20 {
  mixin(uuid("00000564-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x00000564, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x00000003)]*/ int Append(wchar* Name, DataTypeEnum Type, ADO_LONGPTR DefinedSize, FieldAttributeEnum Attrib, DWINVARIANT FieldValue);
  /*[id(0x00000005)]*/ int Update();
  /*[id(0x00000006)]*/ int Resync(ResyncEnum ResyncValues);
  /*[id(0x00000007)]*/ int CancelUpdate();
}

interface Fields20 : Fields15 {
  mixin(uuid("0000054d-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x0000054d, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x60040000)]*/ int _Append(wchar* Name, DataTypeEnum Type, ADO_LONGPTR DefinedSize, FieldAttributeEnum Attrib);
  /*[id(0x00000004)]*/ int Delete(DWINVARIANT Index);
}

interface Fields15 : _Collection {
  mixin(uuid("00000506-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x00000506, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT Index, out Field ppvObject);
}

interface Field : Field20 {
  mixin(uuid("00000569-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x00000569, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x0000045C)]*/ int get_Status(out int pFStatus);
}

interface Field20 : _ADO {
  mixin(uuid("0000054c-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x0000054c, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x00000455)]*/ int get_ActualSize(out ADO_LONGPTR pl);
  /*[id(0x0000045A)]*/ int get_Attributes(out int pl);
  /*[id(0x0000044F)]*/ int get_DefinedSize(out ADO_LONGPTR pl);
  /*[id(0x0000044C)]*/ int get_Name(out wchar* pbstr);
  /*[id(0x0000044E)]*/ int get_Type(out DataTypeEnum pDataType);
  /*[id(0x00000000)]*/ int get_Value(out DWINVARIANT pvar);
  /*[id(0x00000000)]*/ int put_Value(DWINVARIANT pvar);
  /*[id(0x00000458)]*/ int get_Precision(out ubyte pbPrecision);
  /*[id(0x00000459)]*/ int get_NumericScale(out ubyte pbNumericScale);
  /*[id(0x00000453)]*/ int AppendChunk(DWINVARIANT Data);
  /*[id(0x00000454)]*/ int GetChunk(int Length, out DWINVARIANT pvar);
  /*[id(0x00000450)]*/ int get_OriginalValue(out DWINVARIANT pvar);
  /*[id(0x00000451)]*/ int get_UnderlyingValue(out DWINVARIANT pvar);
  /*[id(0x0000045B)]*/ int get_DataFormat(out IUnknown ppiDF);
  /*[id(0x0000045B)]*/ int setref_DataFormat(IUnknown ppiDF);
  /*[id(0x00000458)]*/ int put_Precision(ubyte pbPrecision);
  /*[id(0x00000459)]*/ int put_NumericScale(ubyte pbNumericScale);
  /*[id(0x0000044E)]*/ int put_Type(DataTypeEnum pDataType);
  /*[id(0x0000044F)]*/ int put_DefinedSize(ADO_LONGPTR pl);
  /*[id(0x0000045A)]*/ int put_Attributes(int pl);
}

interface _Parameter : _ADO {
  mixin(uuid("0000050c-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x0000050c, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x00000001)]*/ int get_Name(out wchar* pbstr);
  /*[id(0x00000001)]*/ int put_Name(wchar* pbstr);
  /*[id(0x00000000)]*/ int get_Value(out DWINVARIANT pvar);
  /*[id(0x00000000)]*/ int put_Value(DWINVARIANT pvar);
  /*[id(0x00000002)]*/ int get_Type(out DataTypeEnum psDataType);
  /*[id(0x00000002)]*/ int put_Type(DataTypeEnum psDataType);
  /*[id(0x00000003)]*/ int put_Direction(ParameterDirectionEnum plParmDirection);
  /*[id(0x00000003)]*/ int get_Direction(out ParameterDirectionEnum plParmDirection);
  /*[id(0x00000004)]*/ int put_Precision(ubyte pbPrecision);
  /*[id(0x00000004)]*/ int get_Precision(out ubyte pbPrecision);
  /*[id(0x00000005)]*/ int put_NumericScale(ubyte pbScale);
  /*[id(0x00000005)]*/ int get_NumericScale(out ubyte pbScale);
  /*[id(0x00000006)]*/ int put_Size(ADO_LONGPTR pl);
  /*[id(0x00000006)]*/ int get_Size(out ADO_LONGPTR pl);
  /*[id(0x00000007)]*/ int AppendChunk(DWINVARIANT Val);
  /*[id(0x00000008)]*/ int get_Attributes(out int plParmAttribs);
  /*[id(0x00000008)]*/ int put_Attributes(int plParmAttribs);
}

interface Parameters : _DynaCollection {
  mixin(uuid("0000050d-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x0000050d, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT Index, out _Parameter ppvObject);
}

interface Command25 : Command15 {
  mixin(uuid("0000054e-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x0000054e, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x00000009)]*/ int get_State(out int plObjState);
  /*[id(0x0000000A)]*/ int Cancel();
}

interface _Command : Command25 {
  mixin(uuid("b08400bd-f9d1-4d02-b856-71d5dba123e9"));
  // static DWINGUID IID = { 0xb08400bd, 0xf9d1, 0x4d02, 0xb8, 0x56, 0x71, 0xd5, 0xdb, 0xa1, 0x23, 0xe9 };
  /*[id(0x0000000B)]*/ int setref_CommandStream(IUnknown pvStream);
  /*[id(0x0000000B)]*/ int get_CommandStream(out DWINVARIANT pvStream);
  /*[id(0x0000000C)]*/ int put_Dialect(wchar* pbstrDialect);
  /*[id(0x0000000C)]*/ int get_Dialect(out wchar* pbstrDialect);
  /*[id(0x0000000D)]*/ int put_NamedParameters(short pfNamedParameters);
  /*[id(0x0000000D)]*/ int get_NamedParameters(out short pfNamedParameters);
}

interface ConnectionEventsVt : IUnknown {
  mixin(uuid("00000402-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x00000402, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x00000000)]*/ int InfoMessage(Error pError, ref EventStatusEnum adStatus, _Connection pConnection);
  /*[id(0x00000001)]*/ int BeginTransComplete(int TransactionLevel, Error pError, ref EventStatusEnum adStatus, _Connection pConnection);
  /*[id(0x00000003)]*/ int CommitTransComplete(Error pError, ref EventStatusEnum adStatus, _Connection pConnection);
  /*[id(0x00000002)]*/ int RollbackTransComplete(Error pError, ref EventStatusEnum adStatus, _Connection pConnection);
  /*[id(0x00000004)]*/ int WillExecute(ref wchar* Source, ref CursorTypeEnum CursorType, ref LockTypeEnum LockType, ref int Options, ref EventStatusEnum adStatus, _Command pCommand, _Recordset pRecordset, _Connection pConnection);
  /*[id(0x00000005)]*/ int ExecuteComplete(int RecordsAffected, Error pError, ref EventStatusEnum adStatus, _Command pCommand, _Recordset pRecordset, _Connection pConnection);
  /*[id(0x00000006)]*/ int WillConnect(ref wchar* ConnectionString, ref wchar* UserID, ref wchar* Password, ref int Options, ref EventStatusEnum adStatus, _Connection pConnection);
  /*[id(0x00000007)]*/ int ConnectComplete(Error pError, ref EventStatusEnum adStatus, _Connection pConnection);
  /*[id(0x00000008)]*/ int Disconnect(ref EventStatusEnum adStatus, _Connection pConnection);
}

interface RecordsetEventsVt : IUnknown {
  mixin(uuid("00000403-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x00000403, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x00000009)]*/ int WillChangeField(int cFields, DWINVARIANT Fields, ref EventStatusEnum adStatus, _Recordset pRecordset);
  /*[id(0x0000000A)]*/ int FieldChangeComplete(int cFields, DWINVARIANT Fields, Error pError, ref EventStatusEnum adStatus, _Recordset pRecordset);
  /*[id(0x0000000B)]*/ int WillChangeRecord(EventReasonEnum adReason, int cRecords, ref EventStatusEnum adStatus, _Recordset pRecordset);
  /*[id(0x0000000C)]*/ int RecordChangeComplete(EventReasonEnum adReason, int cRecords, Error pError, ref EventStatusEnum adStatus, _Recordset pRecordset);
  /*[id(0x0000000D)]*/ int WillChangeRecordset(EventReasonEnum adReason, ref EventStatusEnum adStatus, _Recordset pRecordset);
  /*[id(0x0000000E)]*/ int RecordsetChangeComplete(EventReasonEnum adReason, Error pError, ref EventStatusEnum adStatus, _Recordset pRecordset);
  /*[id(0x0000000F)]*/ int WillMove(EventReasonEnum adReason, ref EventStatusEnum adStatus, _Recordset pRecordset);
  /*[id(0x00000010)]*/ int MoveComplete(EventReasonEnum adReason, Error pError, ref EventStatusEnum adStatus, _Recordset pRecordset);
  /*[id(0x00000011)]*/ int EndOfRecordset(ref short fMoreData, ref EventStatusEnum adStatus, _Recordset pRecordset);
  /*[id(0x00000012)]*/ int FetchProgress(int Progress, int MaxProgress, ref EventStatusEnum adStatus, _Recordset pRecordset);
  /*[id(0x00000013)]*/ int FetchComplete(Error pError, ref EventStatusEnum adStatus, _Recordset pRecordset);
}

interface ConnectionEvents : IDispatch {
  mixin(uuid("00000400-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x00000400, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /+/*[id(0x00000000)]*/ int InfoMessage(Error pError, ref EventStatusEnum adStatus, _Connection pConnection);+/
  /+/*[id(0x00000001)]*/ int BeginTransComplete(int TransactionLevel, Error pError, ref EventStatusEnum adStatus, _Connection pConnection);+/
  /+/*[id(0x00000003)]*/ int CommitTransComplete(Error pError, ref EventStatusEnum adStatus, _Connection pConnection);+/
  /+/*[id(0x00000002)]*/ int RollbackTransComplete(Error pError, ref EventStatusEnum adStatus, _Connection pConnection);+/
  /+/*[id(0x00000004)]*/ int WillExecute(ref wchar* Source, ref CursorTypeEnum CursorType, ref LockTypeEnum LockType, ref int Options, ref EventStatusEnum adStatus, _Command pCommand, _Recordset pRecordset, _Connection pConnection);+/
  /+/*[id(0x00000005)]*/ int ExecuteComplete(int RecordsAffected, Error pError, ref EventStatusEnum adStatus, _Command pCommand, _Recordset pRecordset, _Connection pConnection);+/
  /+/*[id(0x00000006)]*/ int WillConnect(ref wchar* ConnectionString, ref wchar* UserID, ref wchar* Password, ref int Options, ref EventStatusEnum adStatus, _Connection pConnection);+/
  /+/*[id(0x00000007)]*/ int ConnectComplete(Error pError, ref EventStatusEnum adStatus, _Connection pConnection);+/
  /+/*[id(0x00000008)]*/ int Disconnect(ref EventStatusEnum adStatus, _Connection pConnection);+/
}

interface RecordsetEvents : IDispatch {
  mixin(uuid("00000266-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x00000266, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /+/*[id(0x00000009)]*/ int WillChangeField(int cFields, DWINVARIANT Fields, ref EventStatusEnum adStatus, _Recordset pRecordset);+/
  /+/*[id(0x0000000A)]*/ int FieldChangeComplete(int cFields, DWINVARIANT Fields, Error pError, ref EventStatusEnum adStatus, _Recordset pRecordset);+/
  /+/*[id(0x0000000B)]*/ int WillChangeRecord(EventReasonEnum adReason, int cRecords, ref EventStatusEnum adStatus, _Recordset pRecordset);+/
  /+/*[id(0x0000000C)]*/ int RecordChangeComplete(EventReasonEnum adReason, int cRecords, Error pError, ref EventStatusEnum adStatus, _Recordset pRecordset);+/
  /+/*[id(0x0000000D)]*/ int WillChangeRecordset(EventReasonEnum adReason, ref EventStatusEnum adStatus, _Recordset pRecordset);+/
  /+/*[id(0x0000000E)]*/ int RecordsetChangeComplete(EventReasonEnum adReason, Error pError, ref EventStatusEnum adStatus, _Recordset pRecordset);+/
  /+/*[id(0x0000000F)]*/ int WillMove(EventReasonEnum adReason, ref EventStatusEnum adStatus, _Recordset pRecordset);+/
  /+/*[id(0x00000010)]*/ int MoveComplete(EventReasonEnum adReason, Error pError, ref EventStatusEnum adStatus, _Recordset pRecordset);+/
  /+/*[id(0x00000011)]*/ int EndOfRecordset(ref short fMoreData, ref EventStatusEnum adStatus, _Recordset pRecordset);+/
  /+/*[id(0x00000012)]*/ int FetchProgress(int Progress, int MaxProgress, ref EventStatusEnum adStatus, _Recordset pRecordset);+/
  /+/*[id(0x00000013)]*/ int FetchComplete(Error pError, ref EventStatusEnum adStatus, _Recordset pRecordset);+/
}

interface ADOConnectionConstruction15 : IUnknown {
  mixin(uuid("00000516-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x00000516, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x60010000)]*/ int get_DSO(out IUnknown ppDSO);
  /*[id(0x60010001)]*/ int get_Session(out IUnknown ppSession);
  /*[id(0x60010002)]*/ int WrapDSOandSession(IUnknown pDSO, IUnknown pSession);
}

interface ADOConnectionConstruction : ADOConnectionConstruction15 {
  mixin(uuid("00000551-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x00000551, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
}

interface _Record : _ADO {
  mixin(uuid("00000562-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x00000562, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x00000001)]*/ int get_ActiveConnection(out DWINVARIANT pvar);
  /*[id(0x00000001)]*/ int put_ActiveConnection(wchar* pvar);
  /*[id(0x00000001)]*/ int setref_ActiveConnection(_Connection pvar);
  /*[id(0x00000002)]*/ int get_State(out ObjectStateEnum pState);
  /*[id(0x00000003)]*/ int get_Source(out DWINVARIANT pvar);
  /*[id(0x00000003)]*/ int put_Source(wchar* pvar);
  /*[id(0x00000003)]*/ int setref_Source(IDispatch pvar);
  /*[id(0x00000004)]*/ int get_Mode(out ConnectModeEnum pMode);
  /*[id(0x00000004)]*/ int put_Mode(ConnectModeEnum pMode);
  /*[id(0x00000005)]*/ int get_ParentURL(out wchar* pbstrParentURL);
  /*[id(0x00000006)]*/ int MoveRecord(wchar* Source, wchar* Destination, wchar* UserName, wchar* Password, MoveRecordOptionsEnum Options, short Async, out wchar* pbstrNewURL);
  /*[id(0x00000007)]*/ int CopyRecord(wchar* Source, wchar* Destination, wchar* UserName, wchar* Password, CopyRecordOptionsEnum Options, short Async, out wchar* pbstrNewURL);
  /*[id(0x00000008)]*/ int DeleteRecord(wchar* Source, short Async);
  /*[id(0x00000009)]*/ int Open(DWINVARIANT Source, DWINVARIANT ActiveConnection, ConnectModeEnum Mode, RecordCreateOptionsEnum CreateOptions, RecordOpenOptionsEnum Options, wchar* UserName, wchar* Password);
  /*[id(0x0000000A)]*/ int Close();
  /*[id(0x00000000)]*/ int get_Fields(out Fields ppFlds);
  /*[id(0x0000000B)]*/ int get_RecordType(out RecordTypeEnum ptype);
  /*[id(0x0000000C)]*/ int GetChildren(out _Recordset pprset);
  /*[id(0x0000000D)]*/ int Cancel();
}

interface _Stream : IDispatch {
  mixin(uuid("00000565-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x00000565, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x00000001)]*/ int get_Size(out ADO_LONGPTR pSize);
  /*[id(0x00000002)]*/ int get_EOS(out short pEOS);
  /*[id(0x00000003)]*/ int get_Position(out ADO_LONGPTR pPos);
  /*[id(0x00000003)]*/ int put_Position(ADO_LONGPTR pPos);
  /*[id(0x00000004)]*/ int get_Type(out StreamTypeEnum ptype);
  /*[id(0x00000004)]*/ int put_Type(StreamTypeEnum ptype);
  /*[id(0x00000005)]*/ int get_LineSeparator(out LineSeparatorEnum pLS);
  /*[id(0x00000005)]*/ int put_LineSeparator(LineSeparatorEnum pLS);
  /*[id(0x00000006)]*/ int get_State(out ObjectStateEnum pState);
  /*[id(0x00000007)]*/ int get_Mode(out ConnectModeEnum pMode);
  /*[id(0x00000007)]*/ int put_Mode(ConnectModeEnum pMode);
  /*[id(0x00000008)]*/ int get_Charset(out wchar* pbstrCharset);
  /*[id(0x00000008)]*/ int put_Charset(wchar* pbstrCharset);
  /*[id(0x00000009)]*/ int Read(int NumBytes, out DWINVARIANT pval);
  /*[id(0x0000000A)]*/ int Open(DWINVARIANT Source, ConnectModeEnum Mode, StreamOpenOptionsEnum Options, wchar* UserName, wchar* Password);
  /*[id(0x0000000B)]*/ int Close();
  /*[id(0x0000000C)]*/ int SkipLine();
  /*[id(0x0000000D)]*/ int Write(DWINVARIANT Buffer);
  /*[id(0x0000000E)]*/ int SetEOS();
  /*[id(0x0000000F)]*/ int CopyTo(_Stream DestStream, ADO_LONGPTR CharNumber);
  /*[id(0x00000010)]*/ int Flush();
  /*[id(0x00000011)]*/ int SaveToFile(wchar* FileName, SaveOptionsEnum Options);
  /*[id(0x00000012)]*/ int LoadFromFile(wchar* FileName);
  /*[id(0x00000013)]*/ int ReadText(int NumChars, out wchar* pbstr);
  /*[id(0x00000014)]*/ int WriteText(wchar* Data, StreamWriteEnum Options);
  /*[id(0x00000015)]*/ int Cancel();
}

interface ADORecordConstruction : IDispatch {
  mixin(uuid("00000567-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x00000567, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x60020000)]*/ int get_Row(out IUnknown ppRow);
  /*[id(0x60020000)]*/ int put_Row(IUnknown ppRow);
  /*[id(0x60020002)]*/ int put_ParentRow(IUnknown value);
}

interface ADOStreamConstruction : IDispatch {
  mixin(uuid("00000568-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x00000568, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x60020000)]*/ int get_Stream(out IUnknown ppStm);
  /*[id(0x60020000)]*/ int put_Stream(IUnknown ppStm);
}

interface ADOCommandConstruction : IUnknown {
  mixin(uuid("00000517-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x00000517, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x60010000)]*/ int get_OLEDBCommand(out IUnknown ppOLEDBCommand);
  /*[id(0x60010000)]*/ int put_OLEDBCommand(IUnknown ppOLEDBCommand);
}

interface ADORecordsetConstruction : IDispatch {
  mixin(uuid("00000283-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x00000283, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x60020000)]*/ int get_Rowset(out IUnknown ppRowset);
  /*[id(0x60020000)]*/ int put_Rowset(IUnknown ppRowset);
  /*[id(0x60020002)]*/ int get_Chapter(out ADO_LONGPTR plChapter);
  /*[id(0x60020002)]*/ int put_Chapter(ADO_LONGPTR plChapter);
  /*[id(0x60020004)]*/ int get_RowPosition(out IUnknown ppRowPos);
  /*[id(0x60020004)]*/ int put_RowPosition(IUnknown ppRowPos);
}

interface Field15 : _ADO {
  mixin(uuid("00000505-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID IID = { 0x00000505, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  /*[id(0x00000455)]*/ int get_ActualSize(out ADO_LONGPTR pl);
  /*[id(0x0000045A)]*/ int get_Attributes(out int pl);
  /*[id(0x0000044F)]*/ int get_DefinedSize(out ADO_LONGPTR pl);
  /*[id(0x0000044C)]*/ int get_Name(out wchar* pbstr);
  /*[id(0x0000044E)]*/ int get_Type(out DataTypeEnum pDataType);
  /*[id(0x00000000)]*/ int get_Value(out DWINVARIANT pvar);
  /*[id(0x00000000)]*/ int put_Value(DWINVARIANT pvar);
  /*[id(0x00000458)]*/ int get_Precision(out ubyte pbPrecision);
  /*[id(0x00000459)]*/ int get_NumericScale(out ubyte pbNumericScale);
  /*[id(0x00000453)]*/ int AppendChunk(DWINVARIANT Data);
  /*[id(0x00000454)]*/ int GetChunk(int Length, out DWINVARIANT pvar);
  /*[id(0x00000450)]*/ int get_OriginalValue(out DWINVARIANT pvar);
  /*[id(0x00000451)]*/ int get_UnderlyingValue(out DWINVARIANT pvar);
}

// CoClasses

abstract class Connection {
  mixin(uuid("00000514-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID CLSID = { 0x00000514, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  mixin Interfaces!(_Connection);
}

abstract class Record {
  mixin(uuid("00000560-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID CLSID = { 0x00000560, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  mixin Interfaces!(_Record);
}

abstract class Stream {
  mixin(uuid("00000566-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID CLSID = { 0x00000566, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  mixin Interfaces!(_Stream);
}

abstract class Command {
  mixin(uuid("00000507-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID CLSID = { 0x00000507, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  mixin Interfaces!(_Command);
}

abstract class Recordset {
  mixin(uuid("00000535-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID CLSID = { 0x00000535, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  mixin Interfaces!(_Recordset);
}

abstract class Parameter {
  mixin(uuid("0000050b-0000-0010-8000-00aa006d2ea4"));
  // static DWINGUID CLSID = { 0x0000050b, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x6d, 0x2e, 0xa4 };
  mixin Interfaces!(_Parameter);
}

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
