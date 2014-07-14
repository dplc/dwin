// Microsoft Remote Data Object 2.0
// Version 2.0

/*[uuid("ee008642-64a8-11ce-920f-08002b369a33")]*/
//module dwin.sys.win32.com.tlb.more.rdo;
module dwin.sys.win32.com.tlb.more.MSRDO20;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

// Prompt Constants
enum PromptConstants {
  rdDriverPrompt = 0x00000000,
  rdDriverNoPrompt = 0x00000001,
  rdDriverComplete = 0x00000002,
  rdDriverCompleteRequired = 0x00000003,
}

// CursorDriver Constants
enum CursorDriverConstants {
  rdUseIfNeeded = 0x00000000,
  rdUseOdbc = 0x00000001,
  rdUseServer = 0x00000002,
  rdUseClientBatch = 0x00000003,
  rdUseNone = 0x00000004,
}

// EditMode Constants
enum EditModeConstants {
  rdEditNone = 0x00000000,
  rdEditInProgress = 0x00000001,
  rdEditAdd = 0x00000002,
}

// LockType Constants
enum LockTypeConstants {
  rdConcurReadOnly = 0x00000001,
  rdConcurLock = 0x00000002,
  rdConcurRowVer = 0x00000003,
  rdConcurValues = 0x00000004,
  rdConcurBatch = 0x00000005,
}

// Options Constants
enum OptionConstants {
  rdAsyncEnable = 0x00000020,
  rdExecDirect = 0x00000040,
  rdFetchLongColumns = 0x00000080,
  rdBackgroundFetch = 0x00000100,
}

// Resultset Type Constants
enum ResultsetTypeConstants {
  rdOpenForwardOnly = 0x00000000,
  rdOpenKeyset = 0x00000001,
  rdOpenDynamic = 0x00000002,
  rdOpenStatic = 0x00000003,
}

// Attributes Constants
enum AttributeConstants {
  rdFixedColumn = 0x00000001,
  rdVariableColumn = 0x00000002,
  rdAutoIncrColumn = 0x00000010,
  rdUpdatableColumn = 0x00000020,
  rdTimestampColumn = 0x00000040,
}

// Data Type Constants
enum DataTypeConstants {
  rdTypeCHAR = 0x00000001,
  rdTypeNUMERIC = 0x00000002,
  rdTypeDECIMAL = 0x00000003,
  rdTypeINTEGER = 0x00000004,
  rdTypeSMALLINT = 0x00000005,
  rdTypeFLOAT = 0x00000006,
  rdTypeREAL = 0x00000007,
  rdTypeDOUBLE = 0x00000008,
  rdTypeDATE = 0x00000009,
  rdTypeTIME = 0x0000000A,
  rdTypeTIMESTAMP = 0x0000000B,
  rdTypeVARCHAR = 0x0000000C,
  rdTypeLONGVARCHAR = 0xFFFFFFFF,
  rdTypeBINARY = 0xFFFFFFFE,
  rdTypeVARBINARY = 0xFFFFFFFD,
  rdTypeLONGVARBINARY = 0xFFFFFFFC,
  rdTypeBIGINT = 0xFFFFFFFB,
  rdTypeTINYINT = 0xFFFFFFFA,
  rdTypeBIT = 0xFFFFFFF9,
  rdTypeWCHAR = 0xFFFFFFF8,
  rdTypeWVARCHAR = 0xFFFFFFF7,
  rdTypeWLONGVARCHAR = 0xFFFFFFF6,
  rdTypeGUID = 0xFFFFFFF5,
}

// Direction Constants
enum DirectionConstants {
  rdParamInput = 0x00000000,
  rdParamInputOutput = 0x00000001,
  rdParamOutput = 0x00000002,
  rdParamReturnValue = 0x00000003,
}

// rdoLocaleID  Constants
enum rdoLocaleIDConstants {
  rdLocaleEnglish = 0x00000001,
  rdLocaleFrench = 0x00000002,
  rdLocaleGerman = 0x00000003,
  rdLocaleItalian = 0x00000004,
  rdLocaleJapanese = 0x00000005,
  rdLocaleSpanish = 0x00000006,
  rdLocaleChinese = 0x00000007,
  rdLocaleSimplifiedChinese = 0x00000008,
  rdLocaleKorean = 0x00000009,
  rdLocaleSystem = 0x00000000,
}

// Query Type Constants
enum QueryTypeConstants {
  rdQSelect = 0x00000000,
  rdQAction = 0x00000001,
  rdQProcedures = 0x00000002,
  rdQCompound = 0x00000003,
}

// SQL Retcode Constants
enum SQLRetcodeConstants {
  rdSQLSuccess = 0x00000000,
  rdSQLSuccessWithInfo = 0x00000001,
  rdSQLNoDataFound = 0x00000064,
  rdSQLError = 0xFFFFFFFF,
  rdSQLInvalidHandle = 0xFFFFFFFE,
}

// Row Status Constants
enum RowStatusConstants {
  rdRowUnmodified = 0x00000000,
  rdRowModified = 0x00000001,
  rdRowNew = 0x00000002,
  rdRowDeleted = 0x00000003,
  rdRowDBDeleted = 0x00000004,
}

// Column Status Constants
enum ColumnStatusConstants {
  rdColUnmodified = 0x00000000,
  rdColModified = 0x00000001,
}

// Update Operation Constants
enum UpdateOperationConstants {
  rdOperationUpdate = 0x00000000,
  rdOperationDelIns = 0x00000001,
}

// Update Criteria Constants
enum UpdateCriteriaConstants {
  rdCriteriaKey = 0x00000000,
  rdCriteriaAllCols = 0x00000001,
  rdCriteriaUpdCols = 0x00000002,
  rdCriteriaTimeStamp = 0x00000003,
}

// Update Return Code Constants
enum UpdateReturnCodeConstants {
  rdUpdateSuccessful = 0x00000000,
  rdUpdateWithCollisions = 0x00000001,
  rdUpdateFailed = 0x00000002,
  rdUpdateNotHandled = 0x00000003,
}

// Interfaces

interface _rdoEngine : IDispatch {
  mixin(uuid("5e71f04b-551f-11cf-8152-00aa00a40c25"));
  // static DWINGUID IID = { 0x5e71f04b, 0x551f, 0x11cf, 0x81, 0x52, 0x00, 0xaa, 0x00, 0xa4, 0x0c, 0x25 };
  // Timeout value for connecting to a data source
  /*[id(0x00000001)]*/ int get_rdoDefaultLoginTimeout(out int Value);
  // Timeout value for connecting to a data source
  /*[id(0x00000001)]*/ int set_rdoDefaultLoginTimeout(int Value);
  // Default user name assigned to any new rdoEnvironment
  /*[id(0x00000002)]*/ int get_rdoDefaultUser(out wchar* Value);
  // Default user name assigned to any new rdoEnvironment
  /*[id(0x00000002)]*/ int set_rdoDefaultUser(wchar* Value);
  // Default password assigned to any new rdoEnvironment
  /*[id(0x00000003)]*/ int get_rdoDefaultPassword(out wchar* Value);
  // Default password assigned to any new rdoEnvironment
  /*[id(0x00000003)]*/ int set_rdoDefaultPassword(wchar* Value);
  // Contains all active rdoEnvironment objects of the rdoEngine object
  /*[id(0x00000000)]*/ int get_rdoEnvironments(out rdoEnvironments pCollection);
  // Contains all stored rdoError objects
  /*[id(0x00000005)]*/ int get_rdoErrors(out rdoErrors pCollection);
  // Version of the RDO library associated with the object
  /*[id(0x00000006)]*/ int get_rdoVersion(out wchar* Value);
  // Indicates where cursors are created
  /*[id(0x00000007)]*/ int get_rdoDefaultCursorDriver(out CursorDriverConstants Value);
  // Indicates where cursors are created
  /*[id(0x00000007)]*/ int set_rdoDefaultCursorDriver(CursorDriverConstants Value);
  // Default Error Threshold for ODBC connections
  /*[id(0x00000008)]*/ int get_rdoDefaultErrorThreshold(out int Value);
  // Default Error Threshold for ODBC connections
  /*[id(0x00000008)]*/ int set_rdoDefaultErrorThreshold(int Value);
  // Registers a database with ODBC
  /*[id(0x00000009)]*/ int rdoRegisterDataSource(wchar* DSN, wchar* Driver, short Silent, wchar* Attributes);
  // Creates a new rdoEnvironment object
  /*[id(0x0000000A)]*/ int rdoCreateEnvironment(wchar* Name, wchar* User, wchar* Password, out _rdoEnvironment pRetval);
  // Locale ID used to load resources
  /*[id(0x0000000B)]*/ int get_rdoLocaleID(out rdoLocaleIDConstants Value);
  // Locale ID used to load resources
  /*[id(0x0000000B)]*/ int set_rdoLocaleID(rdoLocaleIDConstants Value);
  // Default user name assigned to any new rdoEnvironment
  /*[id(0x00000020)]*/ int get_rdoDefaultUserA(out wchar* Value);
  // Default user name assigned to any new rdoEnvironment
  /*[id(0x00000020)]*/ int set_rdoDefaultUserA(wchar* Value);
  // Default password assigned to any new rdoEnvironment
  /*[id(0x00000021)]*/ int get_rdoDefaultPasswordA(out wchar* Value);
  // Default password assigned to any new rdoEnvironment
  /*[id(0x00000021)]*/ int set_rdoDefaultPasswordA(wchar* Value);
  // Version of the RDO library associated with the object
  /*[id(0x00000024)]*/ int get_rdoVersionA(out wchar* Value);
  // Registers a database with ODBC
  /*[id(0x00000027)]*/ int rdoRegisterDataSourceA(wchar* DSN, wchar* Driver, short Silent, wchar* Attributes);
  // Creates a new rdoEnvironment object
  /*[id(0x00000028)]*/ int rdoCreateEnvironmentA(wchar* Name, wchar* User, wchar* Password, out _rdoEnvironment pRetval);
  /*[id(0x0000002D)]*/ int SetGlobalDebugMode(IUnknown pDebugger, short fDebuggingOn);
  /*[id(0x0000002E)]*/ int IsGlobalDebugMode(out short fDebuggingOn);
}

// The Remote Data Object Engine object
interface rdoEngineEvents : IDispatch {
  mixin(uuid("ee008643-64a8-11ce-920f-08002b369a33"));
  // static DWINGUID IID = { 0xee008643, 0x64a8, 0x11ce, 0x92, 0x0f, 0x08, 0x00, 0x2b, 0x36, 0x9a, 0x33 };
  /+// SQL error object are added to rdoErros collection
  /*[id(0x00000001)]*/ void InfoMessage();+/
}

// Contains details about remote data access errors
interface rdoError : IDispatch {
  mixin(uuid("b541c034-63bc-11ce-920c-08002b369a33"));
  // static DWINGUID IID = { 0xb541c034, 0x63bc, 0x11ce, 0x92, 0x0c, 0x08, 0x00, 0x2b, 0x36, 0x9a, 0x33 };
  // A numeric value specifying a native error
  /*[id(0x00000001)]*/ int get_Number(out int Value);
  // A value indicating the source of a remote data access error
  /*[id(0x00000002)]*/ int get_Source(out wchar* Value);
  // A descriptive string associated with an error
  /*[id(0x00000000)]*/ int get_Description(out wchar* Value);
  // A Windows Help file topic context ID
  /*[id(0x00000004)]*/ int get_HelpContext(out int Value);
  // Fully qualified path to the Windows Help file
  /*[id(0x00000005)]*/ int get_HelpFile(out wchar* Value);
  // The type of error as defined by the X/Open and SQL Access Group SQL
  /*[id(0x00000006)]*/ int get_SQLState(out wchar* Value);
  // Error return code from the most recent RDO operation
  /*[id(0x00000007)]*/ int get_SQLRetcode(out int Value);
  // A value indicating the source of a remote data access error
  /*[id(0x00000016)]*/ int get_SourceA(out wchar* Value);
  // A descriptive string associated with an error
  /*[id(0x00000014)]*/ int get_DescriptionA(out wchar* Value);
  // Fully qualified path to the Windows Help file
  /*[id(0x00000019)]*/ int get_HelpFileA(out wchar* Value);
  // The type of error as defined by the X/Open and SQL Access Group SQL
  /*[id(0x0000001A)]*/ int get_SQLStateA(out wchar* Value);
}

// An open connection to a remote data source
interface _rdoConnection : IDispatch {
  mixin(uuid("5e71f04d-551f-11cf-8152-00aa00a40c25"));
  // static DWINGUID IID = { 0x5e71f04d, 0x551f, 0x11cf, 0x81, 0x52, 0x00, 0xaa, 0x00, 0xa4, 0x0c, 0x25 };
  // Timeout value for query execution
  /*[id(0x00000001)]*/ int get_QueryTimeout(out int Value);
  // Timeout value for query execution
  /*[id(0x00000001)]*/ int set_QueryTimeout(int Value);
  // Contains all rdoTable objects in a database
  /*[id(0x00000002)]*/ int get_rdoTables(out rdoTables pRetval);
  /*[id(0x00000003)]*/ int get_rdoPreparedStatements(out rdoPreparedStatements pRetval);
  // Contains all open rdoResultset objects in an rdoConnection
  /*[id(0x00000000)]*/ int get_rdoResultsets(out rdoResultsets pRetval);
  // Provides information about the source of an open rdoConnection
  /*[id(0x00000005)]*/ int get_Connect(out wchar* Value);
  // Provides information about the source of an open rdoConnection
  /*[id(0x00000005)]*/ int set_Connect(wchar* Value);
  // User-defined name for a remote data object
  /*[id(0x00000006)]*/ int get_Name(out wchar* Value);
  // User-defined name for a remote data object
  /*[id(0x00000006)]*/ int set_Name(wchar* Value);
  // The number of rows affected
  /*[id(0x00000007)]*/ int get_RowsAffected(out int Value);
  // Indicates whether a Cursor supports transactions
  /*[id(0x00000008)]*/ int get_Transactions(out short Value);
  // Indicates whether a Cursor is updatable
  /*[id(0x00000009)]*/ int get_Updatable(out short Value);
  // ODBC driver version
  /*[id(0x0000000A)]*/ int get_Version(out wchar* Value);
  // The ODBC connection handle
  /*[id(0x00000012)]*/ int get_hDbc(out int Value);
  // Indicates whether an asynchronous query is still executing
  /*[id(0x00000013)]*/ int get_StillExecuting(out short Value);
  // Polling interval for asynchronous queries
  /*[id(0x00000014)]*/ int get_AsyncCheckInterval(out int Value);
  // Polling interval for asynchronous queries
  /*[id(0x00000014)]*/ int set_AsyncCheckInterval(int Value);
  // Close the connections
  /*[id(0x0000000B)]*/ int Close();
  // Executes a query or SQL statement on an object
  /*[id(0x0000000C)]*/ int Execute(wchar* Source, DWINVARIANT Options);
  // Creates a new rdoResultset object
  /*[id(0x0000000D)]*/ int OpenResultset(wchar* Name, DWINVARIANT Type, DWINVARIANT LockType, DWINVARIANT Options, out rdoResultset pRetval);
  /*[id(0x0000000E)]*/ int CreatePreparedStatement(wchar* Name, DWINVARIANT SqlString, out rdoPreparedStatement pRetval);
  // Begins a new transaction
  /*[id(0x0000000F)]*/ int BeginTrans();
  // Commits any outstanding transactions
  /*[id(0x00000010)]*/ int CommitTrans();
  // Rolls back any outstanding transactions
  /*[id(0x00000011)]*/ int RollbackTrans();
  // Cancels an asynchronous query or pending results against the rdoResultset object
  /*[id(0x00000015)]*/ int Cancel();
  // The last resultset returned by a call on the connection to a prepared statement
  /*[id(0x00000016)]*/ int get_LastQueryResults(out rdoResultset pRetval);
  // Determines where the cursor is to be created
  /*[id(0x00000017)]*/ int get_CursorDriver(out CursorDriverConstants Value);
  // Determines where the cursor is to be created
  /*[id(0x00000017)]*/ int set_CursorDriver(CursorDriverConstants Value);
  // Login timeout in seconds
  /*[id(0x00000018)]*/ int get_LoginTimeout(out int Value);
  // Login timeout in seconds
  /*[id(0x00000018)]*/ int set_LoginTimeout(int Value);
  // Connect to data source
  /*[id(0x00000019)]*/ int EstablishConnection(DWINVARIANT Prompt, DWINVARIANT Readonly, DWINVARIANT Options);
  // Still connecting to data source.
  /*[id(0x0000001A)]*/ int get_StillConnecting(out short Value);
  // Creates a new rdoQuery object
  /*[id(0x0000001E)]*/ int CreateQuery(wchar* Name, DWINVARIANT SqlString, out rdoQuery pRetval);
  // rdoQueries collection
  /*[id(0x0000001F)]*/ int get_rdoQueries(out rdoQueries pRetval);
  // Determines the pathname of the ODBC trace file
  /*[id(0x00000020)]*/ int get_LogMessages(out wchar* Value);
  // Determines the pathname of the ODBC trace file
  /*[id(0x00000020)]*/ int set_LogMessages(wchar* Value);
  // *** For internal use only ***
  /*[id(0x00000064)]*/ int get_Owner(out _rdoEnvironment pRet);
  // Provides information about the source of an open rdoConnection
  /*[id(0x0000002D)]*/ int get_ConnectA(out wchar* Value);
  // User-defined name for a remote data object
  /*[id(0x0000002E)]*/ int get_NameA(out wchar* Value);
  // ODBC driver version
  /*[id(0x00000032)]*/ int get_VersionA(out wchar* Value);
  // Executes a query or SQL statement on an object
  /*[id(0x00000034)]*/ int ExecuteA(wchar* Source, DWINVARIANT Options);
  // Creates a new rdoResultset object
  /*[id(0x00000035)]*/ int OpenResultsetA(wchar* Name, DWINVARIANT Type, DWINVARIANT LockType, DWINVARIANT Options, out rdoResultset pRetval);
  // Creates a new rdoQuery object
  /*[id(0x00000036)]*/ int CreateQueryA(wchar* Name, DWINVARIANT SqlString, out rdoQuery pRetval);
  /*[id(0x00000037)]*/ int DaoOpenResultsetA(wchar* Name, DWINVARIANT Type, DWINVARIANT LockType, DWINVARIANT Options, out rdoResultset pRetval);
}

interface rdoConnectionEvents : IDispatch {
  mixin(uuid("8b39dfbd-3647-11cf-814a-00aa00a40c25"));
  // static DWINGUID IID = { 0x8b39dfbd, 0x3647, 0x11cf, 0x81, 0x4a, 0x00, 0xaa, 0x00, 0xa4, 0x0c, 0x25 };
  /+// Fired after a connection is made to the data source
  /*[id(0x00000002)]*/ void Connect(short ErrorOccurred);+/
  /+// Fired before the call to SQLDriverConnect
  /*[id(0x00000001)]*/ void BeforeConnect(wchar** ConnectString, DWINVARIANT* Prompt);+/
  /+// Fired after a connection has been closed
  /*[id(0x00000003)]*/ void Disconnect();+/
  /+// Fired after an asynchronous query has completed
  /*[id(0x00000004)]*/ void QueryComplete(rdoQuery* Query, short ErrorOccurred);+/
  /+// Fired after the query execution time has exceeded the queryTimeout value
  /*[id(0x00000005)]*/ void QueryTimeout(rdoQuery* Query, short* Cancel);+/
  /+// Fired before the query is run.
  /*[id(0x00000006)]*/ void WillExecute(rdoQuery* Query, short* Cancel);+/
}

// A column of data with a common data type
interface _rdoColumn : IDispatch {
  mixin(uuid("5e71f04e-551f-11cf-8152-00aa00a40c25"));
  // static DWINGUID IID = { 0x5e71f04e, 0x551f, 0x11cf, 0x81, 0x52, 0x00, 0xaa, 0x00, 0xa4, 0x0c, 0x25 };
  // Determines the value of an object
  /*[id(0x00000000)]*/ int get_Value(out DWINVARIANT Value);
  // Determines the value of an object
  /*[id(0x00000000)]*/ int set_Value(DWINVARIANT Value);
  // Indicates the type or data type of an object
  /*[id(0x00000001)]*/ int get_Type(out DataTypeConstants Value);
  // Indicates the name of a remote data object
  /*[id(0x00000002)]*/ int get_Name(out wchar* Value);
  // Indicates the name of a remote data object
  /*[id(0x00000002)]*/ int set_Name(wchar* Value);
  // Indicates the size of an rdoColumn object
  /*[id(0x00000003)]*/ int get_Size(out int Value);
  // Indicates the size of an rdoColumn object
  /*[id(0x00000003)]*/ int set_Size(int Value);
  // Indicates if a zero-length string is valid for the Value property
  /*[id(0x00000004)]*/ int get_AllowZeroLength(out short Value);
  // Indicates if a zero-length string is valid for the Value property
  /*[id(0x00000004)]*/ int set_AllowZeroLength(short Value);
  // Indicates characteristics of an rdoColumn object
  /*[id(0x00000005)]*/ int get_Attributes(out AttributeConstants Value);
  // Indicates whether changes can be made to a remote data object
  /*[id(0x00000006)]*/ int get_Updatable(out short Value);
  // Indicates whether changes can be made to a remote data object
  /*[id(0x00000006)]*/ int set_Updatable(short Value);
  // Relative position of an rdoColumn object within the collection
  /*[id(0x00000007)]*/ int get_OrdinalPosition(out short Value);
  // Indicates whether an rdoColumn requires a non-Null value
  /*[id(0x00000008)]*/ int get_Required(out short Value);
  // Indicates the rdoColumn object data's original source column name
  /*[id(0x00000009)]*/ int get_SourceColumn(out wchar* Value);
  // Indicates the rdoColumn object data's original source column name
  /*[id(0x00000009)]*/ int set_SourceColumn(wchar* Value);
  // Indicates the rdoColumn object data's original source table name
  /*[id(0x0000000A)]*/ int get_SourceTable(out wchar* Value);
  // Indicates the rdoColumn object data's original source table name
  /*[id(0x0000000A)]*/ int set_SourceTable(wchar* Value);
  // Indicates if data must be accessed using the GetChunk method
  /*[id(0x0000000B)]*/ int get_ChunkRequired(out short Value);
  // Appends data from a string expression to an rdoColumn object
  /*[id(0x0000000C)]*/ int AppendChunk(DWINVARIANT Chunk);
  // Returns the contents of an rdoColumn object
  /*[id(0x0000000D)]*/ int GetChunk(int Size, out DWINVARIANT pRetval);
  // Returns the number of bytes in an rdoColumn object
  /*[id(0x0000000E)]*/ int ColumnSize(out int pRetval);
  // Returns a value currently in the database that is newer than the Value property as determined by an optimistic batch update conflict.
  /*[id(0x0000000F)]*/ int get_BatchConflictValue(out DWINVARIANT Value);
  // Returns the value of the column as first fetched from the database.
  /*[id(0x00000010)]*/ int get_OriginalValue(out DWINVARIANT Value);
  // Returns/Sets the column buffer status
  /*[id(0x00000011)]*/ int get_Status(out ColumnStatusConstants Value);
  // Returns/Sets the column buffer status
  /*[id(0x00000011)]*/ int set_Status(ColumnStatusConstants Value);
  // Returns/sets a value that specifies if this column is part of the primary key.
  /*[id(0x00000012)]*/ int get_KeyColumn(out short Value);
  // Returns/sets a value that specifies if this column is part of the primary key.
  /*[id(0x00000012)]*/ int set_KeyColumn(short Value);
  /*[id(0x00000064)]*/ int get_VariantType(out int Value);
  /*[id(0x00000065)]*/ int get_CSize(out int Value);
  // Determines the value of an object
  /*[id(0x0000001E)]*/ int get_ValueA(out DWINVARIANT Value);
  // Determines the value of an object
  /*[id(0x0000001E)]*/ int set_ValueA(DWINVARIANT Value);
  // Indicates the name of a remote data object
  /*[id(0x00000020)]*/ int get_NameA(out wchar* Value);
  // Indicates the rdoColumn object data's original source column name
  /*[id(0x00000027)]*/ int get_SourceColumnA(out wchar* Value);
  // Indicates the rdoColumn object data's original source column name
  /*[id(0x00000027)]*/ int set_SourceColumnA(wchar* Value);
  // Indicates the rdoColumn object data's original source table name
  /*[id(0x00000028)]*/ int get_SourceTableA(out wchar* Value);
  // Indicates the rdoColumn object data's original source table name
  /*[id(0x00000028)]*/ int set_SourceTableA(wchar* Value);
  // Appends data from a string expression to an rdoColumn object
  /*[id(0x0000002A)]*/ int AppendChunkA(DWINVARIANT Chunk);
  // Returns the contents of an rdoColumn object
  /*[id(0x0000002B)]*/ int GetChunkA(int Size, out DWINVARIANT pRetval);
  /*[id(0x60020027)]*/ int get_FoxAttributes(out int pAttrib);
  /*[id(0x60020028)]*/ int get_FoxSourceTable(out wchar* pSrcTable);
  /*[id(0x60020029)]*/ int get_FoxType(out short pType);
  /*[id(0x6002002A)]*/ int get_FoxPrecision(out int pPrecision);
  /*[id(0x6002002B)]*/ int get_FoxScale(out short pScale);
  /*[id(0x6002002C)]*/ int get_FoxMoney(out short pMoney);
  /*[id(0x6002002D)]*/ int get_FoxAllowZeroLength(out short pAllowZeroLength);
  /*[id(0x6002002E)]*/ int get_FoxSize(out int pSize);
  /*[id(0x6002002F)]*/ int get_FoxOrdinalPosition(out short pOrdinalPosition);
  /*[id(0x0000002D)]*/ int get_BatchConflictValueA(out DWINVARIANT Value);
  /*[id(0x0000002E)]*/ int get_OriginalValueA(out DWINVARIANT Value);
}

interface rdoColumnEvents : IDispatch {
  mixin(uuid("8b39dfc0-3647-11cf-814a-00aa00a40c25"));
  // static DWINGUID IID = { 0x8b39dfc0, 0x3647, 0x11cf, 0x81, 0x4a, 0x00, 0xaa, 0x00, 0xa4, 0x0c, 0x25 };
  /+// Fired when the value of the column has changed
  /*[id(0x00000001)]*/ void DataChanged();+/
  /+// Fired before data is changed in the column
  /*[id(0x00000002)]*/ void WillChangeData(DWINVARIANT* newvalue, short* Cancel);+/
}

// The stored definition of a base table or SQL view
interface rdoTable : IDispatch {
  mixin(uuid("b541c03d-63bc-11ce-920c-08002b369a33"));
  // static DWINGUID IID = { 0xb541c03d, 0x63bc, 0x11ce, 0x92, 0x0c, 0x08, 0x00, 0x2b, 0x36, 0x9a, 0x33 };
  // Contains stored rdoColumn objects
  /*[id(0x00000000)]*/ int get_rdoColumns(out rdoColumns pRetval);
  // Indicates the name of a remote data object
  /*[id(0x00000002)]*/ int get_Name(out wchar* Value);
  // Indicates whether changes can be made to a remote data object
  /*[id(0x00000003)]*/ int get_Updatable(out short Value);
  // Indicates the number of rows accessed in an rdoResultset object
  /*[id(0x00000004)]*/ int get_RowCount(out int Value);
  // Indicates the type or data type of an object
  /*[id(0x00000005)]*/ int get_Type(out wchar* Value);
  // Creates a new rdoResultset object
  /*[id(0x00000006)]*/ int OpenResultset(DWINVARIANT Type, DWINVARIANT LockType, DWINVARIANT Options, out rdoResultset pRetval);
  // Indicates the name of a remote data object
  /*[id(0x00000016)]*/ int get_NameA(out wchar* Value);
  // Indicates the type or data type of an object
  /*[id(0x00000019)]*/ int get_TypeA(out wchar* Value);
}

// The rows resulting from a query
interface _rdoResultset : IDispatch {
  mixin(uuid("5e71f04f-551f-11cf-8152-00aa00a40c25"));
  // static DWINGUID IID = { 0x5e71f04f, 0x551f, 0x11cf, 0x81, 0x52, 0x00, 0xaa, 0x00, 0xa4, 0x0c, 0x25 };
  // Determines a bookmark that uniquely identifies the current row
  /*[id(0x00000001)]*/ int get_Bookmark(out DWINVARIANT Value);
  // Determines a bookmark that uniquely identifies the current row
  /*[id(0x00000001)]*/ int set_Bookmark(DWINVARIANT Value);
  // Contains stored rdoColumn objects
  /*[id(0x00000000)]*/ int get_rdoColumns(out rdoColumns pRetval);
  // Indicates whether the current row is before the first row
  /*[id(0x00000003)]*/ int get_BOF(out short Value);
  // Indicates whether an rdoResultset object supports bookmarks
  /*[id(0x00000004)]*/ int get_Bookmarkable(out short Value);
  // Indicates whether the current row is after the last row
  /*[id(0x00000005)]*/ int get_EOF(out short Value);
  // Indicates the locking in effect during editing
  /*[id(0x00000006)]*/ int get_LockEdits(out short Value);
  // User-defined name for a remote data object
  /*[id(0x00000007)]*/ int get_Name(out wchar* Value);
  // User-defined name for a remote data object
  /*[id(0x00000007)]*/ int set_Name(wchar* Value);
  // Indicates whether an object supports transaction operations
  /*[id(0x00000009)]*/ int get_Transactions(out short Value);
  // Indicates the type or data type of an object
  /*[id(0x0000000B)]*/ int get_Type(out ResultsetTypeConstants Value);
  // Indicates the number of rows available in an rdoResultset object
  /*[id(0x0000000C)]*/ int get_RowCount(out int Value);
  // Indicates whether a remote data object can be changed
  /*[id(0x0000000D)]*/ int get_Updatable(out short Value);
  // Indicates the type or data type of an object
  /*[id(0x0000000E)]*/ int get_Restartable(out short Value);
  // Indicates the editing state for the current row
  /*[id(0x0000000F)]*/ int get_EditMode(out int Value);
  // Determines the current row's location in the rdoResultset object
  /*[id(0x0000000A)]*/ int get_PercentPosition(out float Value);
  // Determines the current row's location in the rdoResultset object
  /*[id(0x0000000A)]*/ int set_PercentPosition(float Value);
  // Determines the ODBC statement handle
  /*[id(0x0000001F)]*/ int get_hStmt(out int Value);
  // Determines the absolute row number of an rdoResultset object's current row
  /*[id(0x00000020)]*/ int get_AbsolutePosition(out int Value);
  // Determines the absolute row number of an rdoResultset object's current row
  /*[id(0x00000020)]*/ int set_AbsolutePosition(int Value);
  // Indicates whether an asynchronous query is still executing
  /*[id(0x00000021)]*/ int get_StillExecuting(out short Value);
  // Returns the bookmark of the last row modified
  /*[id(0x00000022)]*/ int get_LastModified(out DWINVARIANT Value);
  // Number of records in Batch Update
  /*[id(0x00000029)]*/ int get_BatchSize(out int Value);
  // Number of records in Batch Update
  /*[id(0x00000029)]*/ int set_BatchSize(int Value);
  // Returns/sets a value that specifies if the optimistic batch update should use an Update statement or a Delete followed by an Insert.
  /*[id(0x0000002A)]*/ int get_UpdateOperation(out short Value);
  // Returns/sets a value that specifies if the optimistic batch update should use an Update statement or a Delete followed by an Insert.
  /*[id(0x0000002A)]*/ int set_UpdateOperation(short Value);
  // Returns/sets a value that specifies how the WHERE clause is constructed for each row during an optimistic batch update operation.
  /*[id(0x0000002B)]*/ int get_UpdateCriteria(out short Value);
  // Returns/sets a value that specifies how the WHERE clause is constructed for each row during an optimistic batch update operation.
  /*[id(0x0000002B)]*/ int set_UpdateCriteria(short Value);
  // Initializes copy buffer for a new row
  /*[id(0x00000011)]*/ int AddNew();
  // Closes an open remote data object
  /*[id(0x00000012)]*/ int Close();
  // Deletes the current row
  /*[id(0x00000013)]*/ int Delete();
  // Copies the current row to the copy buffer for editing
  /*[id(0x00000014)]*/ int Edit();
  // Moves the current row pointer to the first row in the result set
  /*[id(0x00000015)]*/ int MoveFirst();
  // Moves the current row pointer to the last row in the result set
  /*[id(0x00000016)]*/ int MoveLast(DWINVARIANT Options);
  // Moves the current row pointer to the next row in the result set
  /*[id(0x00000017)]*/ int MoveNext();
  // Moves the current row pointer to the previous row in the result set
  /*[id(0x0000001C)]*/ int MovePrevious();
  // Saves the copy buffer to the database
  /*[id(0x00000019)]*/ int Update();
  // Re-executes the query on which the rdoResultset object is based
  /*[id(0x0000001A)]*/ int Requery(DWINVARIANT Options);
  // Repositions the current row in an rdoResultset object
  /*[id(0x0000001B)]*/ int Move(int Rows, DWINVARIANT Start);
  // Discards the current rdoResultset and indicates if an additional result set is available
  /*[id(0x00000018)]*/ int MoreResults(out short pRetval);
  // Cancels a query running in asynchronous mode or cancels pending results
  /*[id(0x0000001D)]*/ int Cancel();
  // Cancels pending updates
  /*[id(0x0000001E)]*/ int CancelUpdate();
  // Retrieves multiple rows into an array
  /*[id(0x00000023)]*/ int GetRows(DWINVARIANT NumRows, out DWINVARIANT pReturnValue);
  // Performs a batched optimistic update.
  /*[id(0x0000002C)]*/ int BatchUpdate(DWINVARIANT SingleRow, DWINVARIANT Force);
  // Cancels all uncommitted changes in the local cursor (used in batch mode).
  /*[id(0x0000002D)]*/ int CancelBatch(DWINVARIANT SingleRow);
  // Returns/Sets the parent connection object.
  /*[id(0x00000024)]*/ int get_ActiveConnection(out _rdoConnection pRet);
  // Returns/Sets the parent connection object.
  /*[id(0x00000024)]*/ int setref_ActiveConnection(_rdoConnection pRet);
  // Number of collision rows
  /*[id(0x00000025)]*/ int get_BatchCollisionCount(out int Value);
  // Array of collision rows
  /*[id(0x00000026)]*/ int get_BatchCollisionRows(out DWINVARIANT pReturnValue);
  // Determines the type of concurrency handling
  /*[id(0x00000027)]*/ int get_LockType(out LockTypeConstants Value);
  // Determines the type of concurrency handling
  /*[id(0x00000027)]*/ int set_LockType(LockTypeConstants Value);
  // Current row status
  /*[id(0x00000028)]*/ int get_Status(out RowStatusConstants Value);
  // Current row status
  /*[id(0x00000028)]*/ int set_Status(RowStatusConstants Value);
  // Retrieves multiple rows into a string
  /*[id(0x0000002E)]*/ int GetClipString(int NumRows, DWINVARIANT ColumnDelimiter, DWINVARIANT RowDelimiter, DWINVARIANT NullExpr, out wchar* pStringValue);
  /*[id(0x00000064)]*/ int IsKnownLastRow(short* pRetval);
  /*[id(0x00000065)]*/ int IsKnownFirstRow(short* pRetval);
  /*[id(0x00000066)]*/ int Advise(IUnknown pSink, out int pnCookie);
  /*[id(0x00000067)]*/ int Unadvise(int nCookie);
  /*[id(0x00000068)]*/ int FreezeNotifications(short Frozen);
  /*[id(0x00000069)]*/ int FindByValues(int bmk, IUnknown pBmk, int lFF, int lV, IUnknown rgColumns, IUnknown rgValues, IUnknown plSeekFlags, IUnknown pvFetchParams);
  // *** For internal use only ***
  /*[id(0x0000006A)]*/ int get_Owner(out rdoQuery pRet);
  /*[id(0x0000006B)]*/ int RDCClose();
  /*[id(0xFFFFFFF8)]*/ int get_Collect(DWINVARIANT Index, out DWINVARIANT pRetval);
  /*[id(0xFFFFFFF8)]*/ int set_Collect(DWINVARIANT Index, DWINVARIANT pRetval);
  // User-defined name for a remote data object
  /*[id(0x00000039)]*/ int get_NameA(out wchar* Value);
  // User-defined name for a remote data object
  /*[id(0x00000039)]*/ int set_NameA(wchar* Value);
  // Retrieves multiple rows into an array
  /*[id(0x00000055)]*/ int GetRowsA(DWINVARIANT NumRows, out DWINVARIANT pReturnValue);
  /*[id(0x0000005A)]*/ int get_CollectA(DWINVARIANT Index, out DWINVARIANT pRetval);
  /*[id(0x0000005A)]*/ int set_CollectA(DWINVARIANT Index, DWINVARIANT pRetval);
  // Fetch batch conflict values for the current row
  /*[id(0x0000002F)]*/ int Resync();
  /*[id(0x60020046)]*/ int get_FoxpCursor(out int pCursor);
  /*[id(0x60020047)]*/ int get_FoxBOF(out short pbBOF);
  /*[id(0x60020047)]*/ int set_FoxBOF(short pbBOF);
  /*[id(0x60020049)]*/ int get_FoxEOF(out short pbEOF);
  /*[id(0x60020049)]*/ int set_FoxEOF(short pbEOF);
  /*[id(0x6002004B)]*/ int get_FoxSQL(out wchar* pSQL);
  /*[id(0x6002004C)]*/ int get_FOxBindThreshold(out int pThreshold);
  /*[id(0x6002004D)]*/ int get_FoxQueryDefDisp(out IDispatch lplpQryDisp);
  /*[id(0x6002004E)]*/ int get_FoxConcurrency(out int pnConcurrency);
  /*[id(0x6002004F)]*/ int get_FoxCurrentRow(out int pnCurrentRow);
  /*[id(0x6002004F)]*/ int set_FoxCurrentRow(int pnCurrentRow);
  /*[id(0x60020051)]*/ int get_FoxRowsetStart(out int pnRowsetStart);
  /*[id(0x60020051)]*/ int set_FoxRowsetStart(int pnRowsetStart);
  /*[id(0x60020053)]*/ int get_FoxRowsetDirection(out int pnRowsetDirect);
  /*[id(0x60020053)]*/ int set_FoxRowsetDirection(int pnRowsetDirect);
  /*[id(0x60020055)]*/ int get_FoxCurrentRowsetSize(out int pnCurRowsetSize);
  /*[id(0x60020055)]*/ int set_FoxCurrentRowsetSize(int pnCurRowsetSize);
  /*[id(0x60020057)]*/ int get_FoxMaxRowsetSize(out int pnMaxRowsetSize);
  /*[id(0x60020057)]*/ int set_FoxMaxRowsetSize(int pnMaxRowsetSize);
  /*[id(0x60020059)]*/ int get_FoxRecordCount(out int pnRecordCnt);
  /*[id(0x60020059)]*/ int set_FoxRecordCount(int pnRecordCnt);
  /*[id(0x6002005B)]*/ int FoxCreateErrorInfo(int scode, int IdDecription, int IdHelp);
  /*[id(0x6002005C)]*/ int FoxCreateSQLErro(int retcode, short bCreateInfo, int hDbc, int hResults);
  /*[id(0x6002005D)]*/ int get_RDCLastActionState(out int pState);
  /*[id(0x6002005E)]*/ int GetClipStrCurrentRow(DWINVARIANT ColumnDelimiter, DWINVARIANT RowDelimiter, DWINVARIANT NullExpr, out wchar* pStringValue);
}

interface rdoResultsetEvents : IDispatch {
  mixin(uuid("8b39dfbf-3647-11cf-814a-00aa00a40c25"));
  // static DWINGUID IID = { 0x8b39dfbf, 0x3647, 0x11cf, 0x81, 0x4a, 0x00, 0xaa, 0x00, 0xa4, 0x0c, 0x25 };
  /+// Fired after a new connection associated with the object
  /*[id(0x00000001)]*/ void Associate();+/
  /+// Fired after current rowset is changed
  /*[id(0x00000002)]*/ void ResultsChanged();+/
  /+// Fired after the connection is set to nothing
  /*[id(0x00000003)]*/ void Dissociate();+/
  /+// Fired after the state of current row has changed
  /*[id(0x00000004)]*/ void RowStatusChanged();+/
  /+// Fired after the resultset is positioned to a new row or no row at all
  /*[id(0x00000005)]*/ void RowCurrencyChange();+/
  /+// Fired before a new connection is associated with the object
  /*[id(0x00000006)]*/ void WillAssociate(rdoConnection* Connection, short* Cancel);+/
  /+// Fired before the connection is set to nothing
  /*[id(0x00000007)]*/ void WillDissociate(short* Cancel);+/
  /+// Fired before an update to the server occurs
  /*[id(0x00000008)]*/ void WillUpdateRows(short* ReturnCode);+/
}

// A prepared query definition
interface rdoPreparedStatement : IDispatch {
  mixin(uuid("5e71f050-551f-11cf-8152-00aa00a40c25"));
  // static DWINGUID IID = { 0x5e71f050, 0x551f, 0x11cf, 0x81, 0x52, 0x00, 0xaa, 0x00, 0xa4, 0x0c, 0x25 };
  // Determines the ODBC's driver manager query timeout value
  /*[id(0x00000001)]*/ int get_QueryTimeout(out int Value);
  // Determines the ODBC's driver manager query timeout value
  /*[id(0x00000001)]*/ int set_QueryTimeout(int Value);
  // Indicates the type or data type of an object
  /*[id(0x00000002)]*/ int get_Type(out QueryTypeConstants Value);
  // Determines the maximum number of rows returned from a query
  /*[id(0x00000003)]*/ int get_MaxRows(out int Value);
  // Determines the maximum number of rows returned from a query
  /*[id(0x00000003)]*/ int set_MaxRows(int Value);
  // Determines the size of the largest column automatically bound under ODBC
  /*[id(0x00000004)]*/ int get_BindThreshold(out int Value);
  // Determines the size of the largest column automatically bound under ODBC
  /*[id(0x00000004)]*/ int set_BindThreshold(int Value);
  // Contains all rdoParameter objects of an rdoQuery
  /*[id(0x00000000)]*/ int get_rdoParameters(out rdoParameters pRetval);
  // Indicates the name of a remote data object
  /*[id(0x00000006)]*/ int get_Name(out wchar* Value);
  // Indicates the name of a remote data object
  /*[id(0x00000006)]*/ int set_Name(wchar* Value);
  // Number of rows affected by the most recently invoked Execute method
  /*[id(0x00000009)]*/ int get_RowsAffected(out int Value);
  // Determines the SQL statement defining the executed query
  /*[id(0x0000000A)]*/ int get_SQL(out wchar* Value);
  // Determines the SQL statement defining the executed query
  /*[id(0x0000000A)]*/ int set_SQL(wchar* Value);
  // Determines the type of concurrency handling
  /*[id(0x0000000D)]*/ int get_LockType(out LockTypeConstants Value);
  // Determines the type of concurrency handling
  /*[id(0x0000000D)]*/ int set_LockType(LockTypeConstants Value);
  // Contains stored rdoColumn objects
  /*[id(0x0000000F)]*/ int get_rdoColumns(out rdoColumns pRetval);
  // Determines the number of rows in the keyset buffer
  /*[id(0x00000010)]*/ int get_KeysetSize(out int Value);
  // Determines the number of rows in the keyset buffer
  /*[id(0x00000010)]*/ int set_KeysetSize(int Value);
  // Determines the number of cursor rows kept in memory
  /*[id(0x00000011)]*/ int get_RowsetSize(out int Value);
  // Determines the number of cursor rows kept in memory
  /*[id(0x00000011)]*/ int set_RowsetSize(int Value);
  // The ODBC statement handle
  /*[id(0x00000015)]*/ int get_hStmt(out int Value);
  // Indicates whether an asynchronous query is still executing
  /*[id(0x00000016)]*/ int get_StillExecuting(out short Value);
  // Determines the type of cursor
  /*[id(0x00000018)]*/ int get_CursorType(out ResultsetTypeConstants Value);
  // Determines the type of cursor
  /*[id(0x00000018)]*/ int set_CursorType(ResultsetTypeConstants Value);
  // Parent Connection
  /*[id(0x00000019)]*/ int get_ActiveConnection(out _rdoConnection pRet);
  // Parent Connection
  /*[id(0x00000019)]*/ int setref_ActiveConnection(_rdoConnection pRet);
  // Indicates whether the query should be prepared
  /*[id(0x0000001A)]*/ int get_Prepared(out short Value);
  // Indicates whether the query should be prepared
  /*[id(0x0000001A)]*/ int set_Prepared(short Value);
  /*[id(0x0000000B)]*/ int get_LogMessages(out wchar* Value);
  /*[id(0x0000000B)]*/ int set_LogMessages(wchar* Value);
  // Closes an open remote data object
  /*[id(0x00000012)]*/ int Close();
  // Executes a query or SQL statement on an object
  /*[id(0x00000013)]*/ int Execute(DWINVARIANT Options);
  // Creates a new rdoResultset object
  /*[id(0x00000014)]*/ int OpenResultset(DWINVARIANT Type, DWINVARIANT LockType, DWINVARIANT Options, out rdoResultset pRetval);
  // Cancels an asynchronous query or pending results against the rdoResultset object
  /*[id(0x00000017)]*/ int Cancel();
  // *** For internal use only ***
  /*[id(0x00000064)]*/ int get_Owner(out _rdoConnection pRet);
  // Indicates the name of a remote data object
  /*[id(0x0000002E)]*/ int get_NameA(out wchar* Value);
  // Determines the SQL statement defining the executed query
  /*[id(0x00000032)]*/ int get_SQLA(out wchar* Value);
  // Determines the SQL statement defining the executed query
  /*[id(0x00000032)]*/ int set_SQLA(wchar* Value);
  /*[id(0x00000033)]*/ int get_LogMessagesA(out wchar* Value);
  /*[id(0x00000033)]*/ int set_LogMessagesA(wchar* Value);
  /*[id(0x00000034)]*/ int DaoOpenResultset(DWINVARIANT Type, DWINVARIANT LockType, DWINVARIANT Options, out rdoResultset pRetval);
  /*[id(0x60020029)]*/ int get_FoxMaxRows(out int pnMaxRows);
  /*[id(0x00000007)]*/ int get_Updatable(out short Value);
  /*[id(0x00000008)]*/ int get_Connect(out wchar* Value);
  /*[id(0x00000030)]*/ int get_ConnectA(out wchar* Value);
  /*[id(0x0000000E)]*/ int get_ErrorThreshold(out int Value);
  /*[id(0x0000000E)]*/ int set_ErrorThreshold(int Value);
}

// Defines a logical set of connections for a particular user ID
interface _rdoEnvironment : IDispatch {
  mixin(uuid("5e71f051-551f-11cf-8152-00aa00a40c25"));
  // static DWINGUID IID = { 0x5e71f051, 0x551f, 0x11cf, 0x81, 0x52, 0x00, 0xaa, 0x00, 0xa4, 0x0c, 0x25 };
  // Contains all open rdoConnection objects opened in an rdoEnvironment object
  /*[id(0x00000000)]*/ int get_rdoConnections(out rdoConnections pRetval);
  // Indicates the name of a remote data object
  /*[id(0x00000002)]*/ int get_Name(out wchar* Value);
  // Determines a value representing a user of an rdoEnvironment object
  /*[id(0x00000003)]*/ int get_UserName(out wchar* pRetval);
  // Determines a value representing a user of an rdoEnvironment object
  /*[id(0x00000003)]*/ int set_UserName(wchar* pRetval);
  // Represents the password used during the creation of an rdoEnvironment
  /*[id(0x00000004)]*/ int set_Password(wchar* value);
  // Timeout value for connecting to data source
  /*[id(0x0000000A)]*/ int get_LoginTimeout(out int Value);
  // Timeout value for connecting to data source
  /*[id(0x0000000A)]*/ int set_LoginTimeout(int Value);
  // Determines where the cursor is to be created
  /*[id(0x0000000B)]*/ int get_CursorDriver(out CursorDriverConstants Value);
  // Determines where the cursor is to be created
  /*[id(0x0000000B)]*/ int set_CursorDriver(CursorDriverConstants Value);
  // The ODBC environment handle
  /*[id(0x0000000C)]*/ int get_hEnv(out int Value);
  // Begins a new transaction
  /*[id(0x00000005)]*/ int BeginTrans();
  // Closes an open remote data object
  /*[id(0x00000006)]*/ int Close();
  // Ends the current transaction and saves the changes
  /*[id(0x00000007)]*/ int CommitTrans();
  // Ends the transaction and restores the database to its state before the most recent BeginTrans
  /*[id(0x00000008)]*/ int RollbackTrans();
  // Opens a connection to an ODBC data source
  /*[id(0x00000009)]*/ int OpenConnection(wchar* dsName, DWINVARIANT Prompt, DWINVARIANT Readonly, DWINVARIANT Connect, DWINVARIANT Options, out _rdoConnection pRetval);
  // *** For internal use only ***
  /*[id(0x00000064)]*/ int RDCOpenConnection(wchar* dsName, DWINVARIANT Prompt, DWINVARIANT Readonly, DWINVARIANT Connect, out _rdoConnection pRetval);
  // *** For internal use only ***
  /*[id(0x00000065)]*/ int GetOwner(out _rdoEngine lplpEngine);
  // Indicates the name of a remote data object
  /*[id(0x00000020)]*/ int get_NameA(out wchar* Value);
  // Determines a value representing a user of an rdoEnvironment object
  /*[id(0x00000021)]*/ int get_UserNameA(out wchar* pRetval);
  // Determines a value representing a user of an rdoEnvironment object
  /*[id(0x00000021)]*/ int set_UserNameA(wchar* pRetval);
  // Represents the password used during the creation of an rdoEnvironment
  /*[id(0x00000022)]*/ int set_PasswordA(wchar* value);
  // Opens a connection to an ODBC data source
  /*[id(0x00000027)]*/ int OpenConnectionA(wchar* dsName, DWINVARIANT Prompt, DWINVARIANT Readonly, DWINVARIANT Connect, DWINVARIANT Options, out _rdoConnection pRetval);
  // *** For internal use only ***
  /*[id(0x00000082)]*/ int RDCOpenConnectionA(wchar* dsName, DWINVARIANT Prompt, DWINVARIANT Readonly, DWINVARIANT Connect, out _rdoConnection pRetval);
}

interface rdoEnvironmentEvents : IDispatch {
  mixin(uuid("8b39dfbc-3647-11cf-814a-00aa00a40c25"));
  // static DWINGUID IID = { 0x8b39dfbc, 0x3647, 0x11cf, 0x81, 0x4a, 0x00, 0xaa, 0x00, 0xa4, 0x0c, 0x25 };
  /+// Fired after the beginTrans method has completed
  /*[id(0x00000001)]*/ void BeginTrans();+/
  /+// Fired after the CommitTrans method has completed
  /*[id(0x00000002)]*/ void CommitTrans();+/
  /+// Fired after the RollbackTrans method has completed
  /*[id(0x00000003)]*/ void RollbackTrans();+/
}

// A parameter associated with an rdoQuery
interface rdoParameter : IDispatch {
  mixin(uuid("5e71f052-551f-11cf-8152-00aa00a40c25"));
  // static DWINGUID IID = { 0x5e71f052, 0x551f, 0x11cf, 0x81, 0x52, 0x00, 0xaa, 0x00, 0xa4, 0x0c, 0x25 };
  // Indicates the name of a remote data object
  /*[id(0x00000001)]*/ int get_Name(out wchar* Value);
  // Indicates the name of a remote data object
  /*[id(0x00000001)]*/ int set_Name(wchar* Value);
  // Indicates the type or data type of an object
  /*[id(0x00000002)]*/ int get_Type(out DataTypeConstants Value);
  // Indicates the type or data type of an object
  /*[id(0x00000002)]*/ int set_Type(DataTypeConstants Value);
  // Determines the data value of an object
  /*[id(0x00000000)]*/ int get_Value(out DWINVARIANT Value);
  // Determines the data value of an object
  /*[id(0x00000000)]*/ int set_Value(DWINVARIANT Value);
  // Determines how an argument is passed to or from a procedure
  /*[id(0x00000003)]*/ int get_Direction(out DirectionConstants Value);
  // Determines how an argument is passed to or from a procedure
  /*[id(0x00000003)]*/ int set_Direction(DirectionConstants Value);
  // Appends data from a string expression to an rdoParameter object
  /*[id(0x00000004)]*/ int AppendChunk(DWINVARIANT Chunk);
  // Indicates the name of a remote data object
  /*[id(0x00000015)]*/ int get_NameA(out wchar* Value);
  // Indicates the name of a remote data object
  /*[id(0x00000015)]*/ int set_NameA(wchar* Value);
  // Determines the data value of an object
  /*[id(0x00000014)]*/ int get_ValueA(out DWINVARIANT Value);
  // Determines the data value of an object
  /*[id(0x00000014)]*/ int set_ValueA(DWINVARIANT Value);
  // Indicates the size of an rdoParameter object
  /*[id(0x00000005)]*/ int get_Size(out int Value);
  // Indicates the size of an rdoParameter object
  /*[id(0x00000005)]*/ int set_Size(int Value);
}

// Dual interface for ODBC Ole object collection
interface DualCollection : IDispatch {
  mixin(uuid("64949f43-67b6-11ce-9216-08002b369a33"));
  // static DWINGUID IID = { 0x64949f43, 0x67b6, 0x11ce, 0x92, 0x16, 0x08, 0x00, 0x2b, 0x36, 0x9a, 0x33 };
  // Indicates the number of members in a Remote Data Object collection
  /*[id(0x00000001)]*/ int get_Count(out int pCount);
  /*[id(0x00000002)]*/ int get_Editable(out short Editable);
  /*[id(0x00000002)]*/ int set_Editable(short Editable);
  /*[id(0x00000005)]*/ int Remove(DWINVARIANT ItemToRemove);
  /*[id(0x00000006)]*/ int Add(IDispatch pItem);
  /*[id(0x00000007)]*/ int Refresh();
  // Returns a specific member of a collection
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT Index, out IDispatch pRet);
  /*[id(0xFFFFFFFC)]*/ int _NewEnum(out IUnknown pRet);
  /*[id(0x00000009)]*/ int Clear();
  /*[id(0x00000019)]*/ int RemoveA(DWINVARIANT ItemToRemove);
  // Returns a specific member of a collection
  /*[id(0x00000014)]*/ int get_ItemA(DWINVARIANT Index, out IDispatch pRet);
  /*[id(0x0000001E)]*/ int Fox_GetHeadPos(out int pPos);
  /*[id(0x0000001F)]*/ int Fox_GetNext(ref int pPos, out IDispatch lplpItem);
  /*[id(0x00000020)]*/ int Fox_GetPrev(ref int pPos, out IDispatch lplpItem);
  /*[id(0x00000021)]*/ int Fox_GetItem(int Index, out IDispatch lplpItem);
}

// Collection of rdoColumn objects
interface rdoColumns : IDispatch {
  mixin(uuid("2e746492-6ed1-11ce-9223-08002b369a33"));
  // static DWINGUID IID = { 0x2e746492, 0x6ed1, 0x11ce, 0x92, 0x23, 0x08, 0x00, 0x2b, 0x36, 0x9a, 0x33 };
  // Indicates the number of members in a Remote Data Object collection
  /*[id(0x00000001)]*/ int get_Count(out int Count);
  /*[id(0x00000002)]*/ int get_Editable(out short Editable);
  /*[id(0x00000002)]*/ int set_Editable(short Editable);
  /*[id(0x00000005)]*/ int Remove(DWINVARIANT ItemToRemove);
  /*[id(0x00000006)]*/ int Add(IDispatch prdoColumn);
  // Refreshes the column definitions
  /*[id(0x00000007)]*/ int Refresh();
  // Returns a specific member of a collection
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT Index, out _rdoColumn pRet);
  /*[id(0xFFFFFFFC)]*/ int _NewEnum(out IUnknown pRet);
  /*[id(0x00000009)]*/ int Clear();
  /*[id(0x00000019)]*/ int RemoveA(DWINVARIANT ItemToRemove);
  // Returns a specific member of a collection
  /*[id(0x00000014)]*/ int get_ItemA(DWINVARIANT Index, out rdoColumn pRet);
  /*[id(0x0000001E)]*/ int Fox_GetHeadPos(out int pPos);
  /*[id(0x0000001F)]*/ int Fox_GetNext(ref int pPos, out _rdoColumn lplpItem);
  /*[id(0x00000020)]*/ int Fox_GetPrev(ref int pPos, out _rdoColumn lplpItem);
  /*[id(0x00000021)]*/ int Fox_GetItem(int Index, out _rdoColumn lplpItem);
}

// Collection of rdoTable objects
interface rdoTables : IDispatch {
  mixin(uuid("2e746493-6ed1-11ce-9223-08002b369a33"));
  // static DWINGUID IID = { 0x2e746493, 0x6ed1, 0x11ce, 0x92, 0x23, 0x08, 0x00, 0x2b, 0x36, 0x9a, 0x33 };
  // Indicates the number of members in a Remote Data Object collection
  /*[id(0x00000001)]*/ int get_Count(out int Count);
  /*[id(0x00000002)]*/ int get_Editable(out short Editable);
  /*[id(0x00000002)]*/ int set_Editable(short Editable);
  /*[id(0x00000005)]*/ int Remove(DWINVARIANT ItemToRemove);
  /*[id(0x00000006)]*/ int Add(IDispatch prdoTable);
  // Refreshes the table definitions
  /*[id(0x00000007)]*/ int Refresh();
  // Returns a specific member of a collection
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT Index, out rdoTable pRet);
  /*[id(0xFFFFFFFC)]*/ int _NewEnum(out IUnknown pRet);
  /*[id(0x00000009)]*/ int Clear();
  /*[id(0x00000019)]*/ int RemoveA(DWINVARIANT ItemToRemove);
  // Returns a specific member of a collection
  /*[id(0x00000014)]*/ int get_ItemA(DWINVARIANT Index, out rdoTable pRet);
  /*[id(0x0000001E)]*/ int Fox_GetHeadPos(out int pPos);
  /*[id(0x0000001F)]*/ int Fox_GetNext(ref int pPos, out rdoTable lplpItem);
  /*[id(0x00000020)]*/ int Fox_GetPrev(ref int pPos, out rdoTable lplpItem);
  /*[id(0x00000021)]*/ int Fox_GetItem(int Index, out rdoTable lplpItem);
}

// Collection of rdoConnection objects
interface rdoConnections : IDispatch {
  mixin(uuid("2e746494-6ed1-11ce-9223-08002b369a33"));
  // static DWINGUID IID = { 0x2e746494, 0x6ed1, 0x11ce, 0x92, 0x23, 0x08, 0x00, 0x2b, 0x36, 0x9a, 0x33 };
  // Indicates the number of members in a Remote Data Object collection
  /*[id(0x00000001)]*/ int get_Count(out int Count);
  /*[id(0x00000002)]*/ int get_Editable(out short Editable);
  /*[id(0x00000002)]*/ int set_Editable(short Editable);
  // Removes a specific member from a collection.
  /*[id(0x00000005)]*/ int Remove(DWINVARIANT ItemToRemove);
  // Add item to collection
  /*[id(0x00000006)]*/ int Add(rdoConnection* prdoConnection);
  /*[id(0x00000007)]*/ int Refresh();
  // Returns a specific member of a collection
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT Index, out _rdoConnection pRet);
  /*[id(0xFFFFFFFC)]*/ int _NewEnum(out IUnknown pRet);
  /*[id(0x00000009)]*/ int Clear();
  /*[id(0x00000019)]*/ int RemoveA(DWINVARIANT ItemToRemove);
  // Returns a specific member of a collection
  /*[id(0x00000014)]*/ int get_ItemA(DWINVARIANT Index, out _rdoConnection pRet);
  /*[id(0x0000001E)]*/ int Fox_GetHeadPos(out int pPos);
  /*[id(0x0000001F)]*/ int Fox_GetNext(ref int pPos, out _rdoConnection lplpItem);
  /*[id(0x00000020)]*/ int Fox_GetPrev(ref int pPos, out _rdoConnection lplpItem);
  /*[id(0x00000021)]*/ int Fox_GetItem(int Index, out _rdoConnection lplpItem);
}

// Collection of rdoParameter objects
interface rdoParameters : IDispatch {
  mixin(uuid("2e746495-6ed1-11ce-9223-08002b369a33"));
  // static DWINGUID IID = { 0x2e746495, 0x6ed1, 0x11ce, 0x92, 0x23, 0x08, 0x00, 0x2b, 0x36, 0x9a, 0x33 };
  // Indicates the number of members in a Remote Data Object collection
  /*[id(0x00000001)]*/ int get_Count(out int Count);
  /*[id(0x00000002)]*/ int get_Editable(out short Editable);
  /*[id(0x00000002)]*/ int set_Editable(short Editable);
  /*[id(0x00000005)]*/ int Remove(DWINVARIANT ItemToRemove);
  /*[id(0x00000006)]*/ int Add(IDispatch prdoParameter);
  /*[id(0x00000007)]*/ int Refresh();
  // Returns a specific member of a collection
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT Index, out rdoParameter pRet);
  /*[id(0xFFFFFFFC)]*/ int _NewEnum(out IUnknown pRet);
  /*[id(0x00000009)]*/ int Clear();
  /*[id(0x00000019)]*/ int RemoveA(DWINVARIANT ItemToRemove);
  // Returns a specific member of a collection
  /*[id(0x00000014)]*/ int get_ItemA(DWINVARIANT Index, out rdoParameter pRet);
  /*[id(0x0000001E)]*/ int Fox_GetHeadPos(out int pPos);
  /*[id(0x0000001F)]*/ int Fox_GetNext(ref int pPos, out rdoParameter lplpItem);
  /*[id(0x00000020)]*/ int Fox_GetPrev(ref int pPos, out rdoParameter lplpItem);
  /*[id(0x00000021)]*/ int Fox_GetItem(int Index, out rdoParameter lplpItem);
}

// Collection of rdoResultset objects
interface rdoResultsets : IDispatch {
  mixin(uuid("2e746496-6ed1-11ce-9223-08002b369a33"));
  // static DWINGUID IID = { 0x2e746496, 0x6ed1, 0x11ce, 0x92, 0x23, 0x08, 0x00, 0x2b, 0x36, 0x9a, 0x33 };
  // Indicates the number of members in a Remote Data Object collection
  /*[id(0x00000001)]*/ int get_Count(out int Count);
  /*[id(0x00000002)]*/ int get_Editable(out short Editable);
  /*[id(0x00000002)]*/ int set_Editable(short Editable);
  /*[id(0x00000005)]*/ int Remove(DWINVARIANT ItemToRemove);
  /*[id(0x00000006)]*/ int Add(IDispatch prdoResultset);
  /*[id(0x00000007)]*/ int Refresh();
  // Returns a specific member of a collection
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT Index, out _rdoResultset pRet);
  /*[id(0xFFFFFFFC)]*/ int _NewEnum(out IUnknown pRet);
  /*[id(0x00000009)]*/ int Clear();
  /*[id(0x00000019)]*/ int RemoveA(DWINVARIANT ItemToRemove);
  // Returns a specific member of a collection
  /*[id(0x00000014)]*/ int get_ItemA(DWINVARIANT Index, out _rdoResultset pRet);
  /*[id(0x0000001E)]*/ int Fox_GetHeadPos(out int pPos);
  /*[id(0x0000001F)]*/ int Fox_GetNext(ref int pPos, out _rdoResultset lplpItem);
  /*[id(0x00000020)]*/ int Fox_GetPrev(ref int pPos, out _rdoResultset lplpItem);
  /*[id(0x00000021)]*/ int Fox_GetItem(int Index, out _rdoResultset lplpItem);
}

// Collection of rdoEnvironment objects
interface rdoEnvironments : IDispatch {
  mixin(uuid("5e71f053-551f-11cf-8152-00aa00a40c25"));
  // static DWINGUID IID = { 0x5e71f053, 0x551f, 0x11cf, 0x81, 0x52, 0x00, 0xaa, 0x00, 0xa4, 0x0c, 0x25 };
  // Indicates the number of members in a Remote Data Object collection
  /*[id(0x00000001)]*/ int get_Count(out int Count);
  /*[id(0x00000002)]*/ int get_Editable(out short Editable);
  /*[id(0x00000002)]*/ int set_Editable(short Editable);
  // Removes a specific member from a collection.
  /*[id(0x00000005)]*/ int Remove(DWINVARIANT ItemToRemove);
  // Adds a member to a Collection object.
  /*[id(0x00000006)]*/ int Add(rdoEnvironment* prdoEnvironment);
  /*[id(0x00000007)]*/ int Refresh();
  // Returns a specific member of a collection
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT Index, out _rdoEnvironment pRet);
  /*[id(0xFFFFFFFC)]*/ int _NewEnum(out IUnknown pRet);
  /*[id(0x00000009)]*/ int Clear();
  /*[id(0x00000019)]*/ int RemoveA(DWINVARIANT ItemToRemove);
  // Returns a specific member of a collection
  /*[id(0x00000014)]*/ int get_ItemA(DWINVARIANT Index, out rdoEnvironment pRet);
  /*[id(0x0000001E)]*/ int Fox_GetHeadPos(out int pPos);
  /*[id(0x0000001F)]*/ int Fox_GetNext(ref int pPos, out _rdoEnvironment lplpItem);
  /*[id(0x00000020)]*/ int Fox_GetPrev(ref int pPos, out _rdoEnvironment lplpItem);
  /*[id(0x00000021)]*/ int Fox_GetItem(int Index, out _rdoEnvironment lplpItem);
}

// Collection of rdoQuery objects
interface rdoQueries : IDispatch {
  mixin(uuid("2e746498-6ed1-11ce-9223-08002b369a33"));
  // static DWINGUID IID = { 0x2e746498, 0x6ed1, 0x11ce, 0x92, 0x23, 0x08, 0x00, 0x2b, 0x36, 0x9a, 0x33 };
  // Indicates the number of members in a Remote Data Object collection
  /*[id(0x00000001)]*/ int get_Count(out int Count);
  /*[id(0x00000002)]*/ int get_Editable(out short Editable);
  /*[id(0x00000002)]*/ int set_Editable(short Editable);
  /*[id(0x00000005)]*/ int Remove(DWINVARIANT ItemToRemove);
  /*[id(0x00000006)]*/ int Add(IDispatch prdoQuery);
  /*[id(0x00000007)]*/ int Refresh();
  // Returns a specific member of a collection
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT Index, out rdoQuery pRet);
  /*[id(0xFFFFFFFC)]*/ int _NewEnum(out IUnknown pRet);
  /*[id(0x00000009)]*/ int Clear();
  /*[id(0x00000019)]*/ int RemoveA(DWINVARIANT ItemToRemove);
  // Returns a specific member of a collection
  /*[id(0x00000014)]*/ int get_ItemA(DWINVARIANT Index, out rdoQuery pRet);
  /*[id(0x0000001E)]*/ int Fox_GetHeadPos(out int pPos);
  /*[id(0x0000001F)]*/ int Fox_GetNext(ref int pPos, out rdoPreparedStatement lplpItem);
  /*[id(0x00000020)]*/ int Fox_GetPrev(ref int pPos, out rdoPreparedStatement lplpItem);
  /*[id(0x00000021)]*/ int Fox_GetItem(int Index, out rdoPreparedStatement lplpItem);
}

interface rdoPreparedStatements : IDispatch {
  mixin(uuid("5d545b93-97ca-11cf-8171-00aa00a40c25"));
  // static DWINGUID IID = { 0x5d545b93, 0x97ca, 0x11cf, 0x81, 0x71, 0x00, 0xaa, 0x00, 0xa4, 0x0c, 0x25 };
  /*[id(0x00000001)]*/ int get_Count(out int Count);
  /*[id(0x00000002)]*/ int get_Editable(out short Editable);
  /*[id(0x00000002)]*/ int set_Editable(short Editable);
  /*[id(0x00000005)]*/ int Remove(DWINVARIANT ItemToRemove);
  /*[id(0x00000006)]*/ int Add(IDispatch prdoQuery);
  /*[id(0x00000007)]*/ int Refresh();
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT Index, out rdoQuery pRet);
  /*[id(0xFFFFFFFC)]*/ int _NewEnum(out IUnknown pRet);
  /*[id(0x00000009)]*/ int Clear();
  /*[id(0x00000019)]*/ int RemoveA(DWINVARIANT ItemToRemove);
  /*[id(0x00000014)]*/ int get_ItemA(DWINVARIANT Index, out rdoQuery pRet);
}

// Collection of rdoError objects
interface rdoErrors : IDispatch {
  mixin(uuid("2e7464a0-6ed1-11ce-9223-08002b369a33"));
  // static DWINGUID IID = { 0x2e7464a0, 0x6ed1, 0x11ce, 0x92, 0x23, 0x08, 0x00, 0x2b, 0x36, 0x9a, 0x33 };
  // Indicates the number of members in a Remote Data Object collection
  /*[id(0x00000001)]*/ int get_Count(out int Count);
  /*[id(0x00000002)]*/ int get_Editable(out short Editable);
  /*[id(0x00000002)]*/ int set_Editable(short Editable);
  /*[id(0x00000005)]*/ int Remove(DWINVARIANT ItemToRemove);
  /*[id(0x00000006)]*/ int Add(IDispatch prdoError);
  /*[id(0x00000007)]*/ int Refresh();
  // Returns a specific member of a collection
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT Index, out rdoError pRet);
  /*[id(0xFFFFFFFC)]*/ int _NewEnum(out IUnknown pRet);
  // Removes all objects in a collection.
  /*[id(0x00000009)]*/ int Clear();
  /*[id(0x00000019)]*/ int RemoveA(DWINVARIANT ItemToRemove);
  // Returns a specific member of a collection
  /*[id(0x00000014)]*/ int get_ItemA(DWINVARIANT Index, out rdoError pRet);
  /*[id(0x0000001E)]*/ int Fox_GetHeadPos(out int pPos);
  /*[id(0x0000001F)]*/ int Fox_GetNext(ref int pPos, out rdoError lplpItem);
  /*[id(0x00000020)]*/ int Fox_GetPrev(ref int pPos, out rdoError lplpItem);
  /*[id(0x00000021)]*/ int Fox_GetItem(int Index, out rdoError lplpItem);
}

interface IPrivColGetRows : IUnknown {
  mixin(uuid("499109e4-1e20-11cf-8146-00aa00a40c25"));
  // static DWINGUID IID = { 0x499109e4, 0x1e20, 0x11cf, 0x81, 0x46, 0x00, 0xaa, 0x00, 0xa4, 0x0c, 0x25 };
  /*[id(0x60010000)]*/ int BindColumn(short DataType, void* pColData, int MaxDataLen, int* pdataLen);
  /*[id(0x60010001)]*/ int GetData(short DataType, void* pColData, int MaxDataLen, int* pdataLen);
}

interface IPrivRsGetRows : IUnknown {
  mixin(uuid("499109e5-1e20-11cf-8146-00aa00a40c25"));
  // static DWINGUID IID = { 0x499109e5, 0x1e20, 0x11cf, 0x81, 0x46, 0x00, 0xaa, 0x00, 0xa4, 0x0c, 0x25 };
  /*[id(0x60010000)]*/ int Initiallize();
  /*[id(0x60010001)]*/ int CanGetDataBlock(short* pfCanGetDatablock);
  /*[id(0x60010002)]*/ int SetRowsetSize(int dwNumRows);
  /*[id(0x60010003)]*/ int SetRowLen(int dwRowLen);
  /*[id(0x60010004)]*/ int GetRows(int lRow, short dwFetchType, out int pudwNomRows, out short pudwStatus);
  /*[id(0x60010005)]*/ int get_DaoBOF(out short pBOF);
  /*[id(0x60010006)]*/ int get_DaoEOF(out short pEOF);
  /*[id(0x60010007)]*/ int get_DaoBookmark(out DWINVARIANT Value);
  /*[id(0x60010008)]*/ int MoveTo(int Index);
  /*[id(0x60010009)]*/ int get_DaoRowsetPos(out int lpRowSetPos, out int lpRowsInBuf, out int lpRowIndex);
}

// CoClasses

// The Remote Data Object Engine object
abstract class rdoEngine {
  mixin(uuid("9a8831f0-a263-11d1-8dcf-00a0c90fffc2"));
  // static DWINGUID CLSID = { 0x9a8831f0, 0xa263, 0x11d1, 0x8d, 0xcf, 0x00, 0xa0, 0xc9, 0x0f, 0xff, 0xc2 };
  mixin Interfaces!(_rdoEngine);
}

// An open connection to a remote data source
abstract class rdoConnection {
  mixin(uuid("9a8831f1-a263-11d1-8dcf-00a0c90fffc2"));
  // static DWINGUID CLSID = { 0x9a8831f1, 0xa263, 0x11d1, 0x8d, 0xcf, 0x00, 0xa0, 0xc9, 0x0f, 0xff, 0xc2 };
  mixin Interfaces!(_rdoConnection);
}

// A column of data with a common data type
abstract class rdoColumn {
  mixin(uuid("5ebb68f3-3bf1-11cf-814c-00aa00a40c25"));
  // static DWINGUID CLSID = { 0x5ebb68f3, 0x3bf1, 0x11cf, 0x81, 0x4c, 0x00, 0xaa, 0x00, 0xa4, 0x0c, 0x25 };
  mixin Interfaces!(_rdoColumn);
}

// The rows resulting from a query
abstract class rdoResultset {
  mixin(uuid("5ebb68f4-3bf1-11cf-814c-00aa00a40c25"));
  // static DWINGUID CLSID = { 0x5ebb68f4, 0x3bf1, 0x11cf, 0x81, 0x4c, 0x00, 0xaa, 0x00, 0xa4, 0x0c, 0x25 };
  mixin Interfaces!(_rdoResultset);
}

// A prepared query definition.
abstract class rdoQuery {
  mixin(uuid("9a8831f2-a263-11d1-8dcf-00a0c90fffc2"));
  // static DWINGUID CLSID = { 0x9a8831f2, 0xa263, 0x11d1, 0x8d, 0xcf, 0x00, 0xa0, 0xc9, 0x0f, 0xff, 0xc2 };
  mixin Interfaces!(rdoPreparedStatement);
}

// Defines a logical set of connections for a particular user ID
abstract class rdoEnvironment {
  mixin(uuid("5ebb68f6-3bf1-11cf-814c-00aa00a40c25"));
  // static DWINGUID CLSID = { 0x5ebb68f6, 0x3bf1, 0x11cf, 0x81, 0x4c, 0x00, 0xaa, 0x00, 0xa4, 0x0c, 0x25 };
  mixin Interfaces!(_rdoEnvironment);
}
