// COM+ Services Type Library
// Version 1.0

/*[uuid("2a005c00-a5de-11cf-9e66-00aa00a3f464")]*/
//module dwin.sys.win32.com.tlb.more.comsvcs;
module dwin.sys.win32.com.tlb.more.comsvcs;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum tagTransactionVote {
  TxCommit = 0x00000000,
  TxAbort = 0x00000001,
}

// Trappable Error Codes
enum __MIDL___MIDL_itf_autosvcs_0468_0001 {
  mtsErrCtxAborted = 0x8004E002,
  mtsErrCtxAborting = 0x8004E003,
  mtsErrCtxNoContext = 0x8004E004,
  mtsErrCtxNotRegistered = 0x8004E005,
  mtsErrCtxSynchTimeout = 0x8004E006,
  mtsErrCtxOldReference = 0x8004E007,
  mtsErrCtxRoleNotFound = 0x8004E00C,
  mtsErrCtxNoSecurity = 0x8004E00D,
  mtsErrCtxWrongThread = 0x8004E00E,
  mtsErrCtxTMNotAvailable = 0x8004E00F,
  comQCErrApplicationNotQueued = 0x80110600,
  comQCErrNoQueueableInterfaces = 0x80110601,
  comQCErrQueuingServiceNotAvailable = 0x80110602,
  comQCErrQueueTransactMismatch = 0x80110603,
  comqcErrRecorderMarshalled = 0x80110604,
  comqcErrOutParam = 0x80110605,
  comqcErrRecorderNotTrusted = 0x80110606,
  comqcErrPSLoad = 0x80110607,
  comqcErrMarshaledObjSameTxn = 0x80110608,
  comqcErrInvalidMessage = 0x80110650,
  comqcErrMsmqSidUnavailable = 0x80110651,
  comqcErrWrongMsgExtension = 0x80110652,
  comqcErrMsmqServiceUnavailable = 0x80110653,
  comqcErrMsgNotAuthenticated = 0x80110654,
  comqcErrMsmqConnectorUsed = 0x80110655,
  comqcErrBadMarshaledObject = 0x80110656,
}

enum tagCSC_InheritanceConfig {
  CSC_Inherit = 0x00000000,
  CSC_Ignore = 0x00000001,
}

enum tagCSC_ThreadPool {
  CSC_ThreadPoolNone = 0x00000000,
  CSC_ThreadPoolInherit = 0x00000001,
  CSC_STAThreadPool = 0x00000002,
  CSC_MTAThreadPool = 0x00000003,
}

enum tagCSC_Binding {
  CSC_NoBinding = 0x00000000,
  CSC_BindToPoolThread = 0x00000001,
}

enum tagCSC_TransactionConfig {
  CSC_NoTransaction = 0x00000000,
  CSC_IfContainerIsTransactional = 0x00000001,
  CSC_CreateTransactionIfNecessary = 0x00000002,
  CSC_NewTransaction = 0x00000003,
}

// Transaction Isolation Level Enumerations
enum COMAdminTxIsolationLevelOptions {
  COMAdminTxIsolationLevelAny = 0x00000000,
  COMAdminTxIsolationLevelReadUnCommitted = 0x00000001,
  COMAdminTxIsolationLevelReadCommitted = 0x00000002,
  COMAdminTxIsolationLevelRepeatableRead = 0x00000003,
  COMAdminTxIsolationLevelSerializable = 0x00000004,
}

enum tagCSC_SynchronizationConfig {
  CSC_NoSynchronization = 0x00000000,
  CSC_IfContainerIsSynchronized = 0x00000001,
  CSC_NewSynchronizationIfNecessary = 0x00000002,
  CSC_NewSynchronization = 0x00000003,
}

enum tagCSC_IISIntrinsicsConfig {
  CSC_NoIISIntrinsics = 0x00000000,
  CSC_InheritIISIntrinsics = 0x00000001,
}

enum tagCSC_COMTIIntrinsicsConfig {
  CSC_NoCOMTIIntrinsics = 0x00000000,
  CSC_InheritCOMTIIntrinsics = 0x00000001,
}

enum tagCSC_TrackerConfig {
  CSC_DontUseTracker = 0x00000000,
  CSC_UseTracker = 0x00000001,
}

enum tagCSC_SxsConfig {
  CSC_NoSxs = 0x00000000,
  CSC_InheritSxs = 0x00000001,
  CSC_NewSxs = 0x00000002,
}

enum tagCSC_PartitionConfig {
  CSC_NoPartition = 0x00000000,
  CSC_InheritPartition = 0x00000001,
  CSC_NewPartition = 0x00000002,
}

enum __MIDL___MIDL_itf_autosvcs_0468_0002 {
  LockSetGet = 0x00000000,
  LockMethod = 0x00000001,
}

enum __MIDL___MIDL_itf_autosvcs_0468_0003 {
  Standard = 0x00000000,
  Process = 0x00000001,
}

enum tagCRMFLAGS {
  CRMFLAG_FORGETTARGET = 0x00000001,
  CRMFLAG_WRITTENDURINGPREPARE = 0x00000002,
  CRMFLAG_WRITTENDURINGCOMMIT = 0x00000004,
  CRMFLAG_WRITTENDURINGABORT = 0x00000008,
  CRMFLAG_WRITTENDURINGRECOVERY = 0x00000010,
  CRMFLAG_WRITTENDURINGREPLAY = 0x00000020,
  CRMFLAG_REPLAYINPROGRESS = 0x00000040,
}

enum tagCRMREGFLAGS {
  CRMREGFLAG_PREPAREPHASE = 0x00000001,
  CRMREGFLAG_COMMITPHASE = 0x00000002,
  CRMREGFLAG_ABORTPHASE = 0x00000004,
  CRMREGFLAG_ALLPHASES = 0x00000007,
  CRMREGFLAG_FAILIFINDOUBTSREMAIN = 0x00000010,
}

enum tagCrmTransactionState {
  TxState_Active = 0x00000000,
  TxState_Committed = 0x00000001,
  TxState_Aborted = 0x00000002,
  TxState_Indoubt = 0x00000003,
}

enum tagCOMPLUS_APPTYPE {
  APPTYPE_UNKNOWN = 0xFFFFFFFF,
  APPTYPE_SERVER = 0x00000001,
  APPTYPE_LIBRARY = 0x00000000,
  APPTYPE_SWC = 0x00000002,
}

// Structs

struct tagBLOB {
  uint cbSize;
  ubyte* pBlobData;
}

struct tagCrmLogRecordRead {
  uint dwCrmFlags;
  uint dwSequenceNumber;
  tagBLOB blobUserData;
}

struct BOID {
  ubyte[16] rgb;
}

struct XACTTRANSINFO {
  BOID uow;
  int isoLevel;
  uint isoFlags;
  uint grfTCSupported;
  uint grfRMSupported;
  uint grfTCSupportedRetaining;
  uint grfRMSupportedRetaining;
}

struct __MIDL___MIDL_itf_autosvcs_0358_0001 {
  uint cbSize;
  uint dwPid;
  long lTime;
  int lMicroTime;
  long perfCount;
 DWINGUID guidApp;
  wchar* sMachineName;
}

struct _RECYCLE_INFO {
 DWINGUID guidCombaseProcessIdentifier;
  long ProcessStartTime;
  uint dwRecycleLifetimeLimit;
  uint dwRecycleMemoryLimit;
  uint dwRecycleExpirationTimeout;
}

struct CAppStatistics {
  uint m_cTotalCalls;
  uint m_cTotalInstances;
  uint m_cTotalClasses;
  uint m_cCallsPerSecond;
}

struct CCLSIDData2 {
 DWINGUID m_clsid;
 DWINGUID m_appid;
 DWINGUID m_partid;
  wchar* m_pwszAppName;
  wchar* m_pwszCtxName;
  tagCOMPLUS_APPTYPE m_eAppType;
  uint m_cReferences;
  uint m_cBound;
  uint m_cPooled;
  uint m_cInCall;
  uint m_dwRespTime;
  uint m_cCallsCompleted;
  uint m_cCallsFailed;
}

struct CAppData {
  uint m_idApp;
  ushort[40] m_szAppGuid;
  uint m_dwAppProcessId;
  CAppStatistics m_AppStatistics;
}

struct CCLSIDData {
 DWINGUID m_clsid;
  uint m_cReferences;
  uint m_cBound;
  uint m_cPooled;
  uint m_cInCall;
  uint m_dwRespTime;
  uint m_cCallsCompleted;
  uint m_cCallsFailed;
}

struct _LARGE_INTEGER {
  long QuadPart;
}

struct _ULARGE_INTEGER {
  ulong QuadPart;
}

struct tagSTATSTG {
  wchar* pwcsName;
  uint type;
  _ULARGE_INTEGER cbSize;
  _FILETIME mtime;
  _FILETIME ctime;
  _FILETIME atime;
  uint grfMode;
  uint grfLocksSupported;
 DWINGUID clsid;
  uint grfStateBits;
  uint reserved;
}

struct _FILETIME {
  uint dwLowDateTime;
  uint dwHighDateTime;
}

struct tagBIND_OPTS2 {
  uint cbStruct;
  uint grfFlags;
  uint grfMode;
  uint dwTickCountDeadline;
  uint dwTrackFlags;
  uint dwClassContext;
  uint locale;
  _COSERVERINFO* pServerInfo;
}

struct _COSERVERINFO {
  uint dwReserved1;
  wchar* pwszName;
  _COAUTHINFO* pAuthInfo;
  uint dwReserved2;
}

struct _COAUTHINFO {
  uint dwAuthnSvc;
  uint dwAuthzSvc;
  wchar* pwszServerPrincName;
  uint dwAuthnLevel;
  uint dwImpersonationLevel;
  _COAUTHIDENTITY* pAuthIdentityData;
  uint dwCapabilities;
}

struct _COAUTHIDENTITY {
  ushort* User;
  uint UserLength;
  ushort* Domain;
  uint DomainLength;
  ushort* Password;
  uint PasswordLength;
  uint Flags;
}

// Aliases

// Trappable Error Codes
alias __MIDL___MIDL_itf_autosvcs_0468_0001 Error_Constants;

alias __MIDL___MIDL_itf_autosvcs_0468_0002 LockModes;

alias __MIDL___MIDL_itf_autosvcs_0468_0003 ReleaseModes;

alias __MIDL___MIDL_itf_autosvcs_0358_0001 COMSVCSEVENTINFO;

alias uint ULONG_PTR;

alias _RECYCLE_INFO RECYCLE_INFO;

alias CAppStatistics APPSTATISTICS;

alias CCLSIDData2 CLSIDDATA2;

alias CAppData appData;

alias CCLSIDData CLSIDDATA;

// Interfaces

// COM+ Services Security - Certificate Collection
interface ISecurityCertificateColl : IDispatch {
  mixin(uuid("cafc823b-b441-11d1-b82b-0000f8757e2a"));
  // static DWINGUID IID = { 0xcafc823b, 0xb441, 0x11d1, 0xb8, 0x2b, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a };
  // Returns the number of properties in this collection.
  /*[id(0x60020000)]*/ int get_Count(out int plCount);
  // Return a property from this collection
  /*[id(0x00000000)]*/ int get_Item(wchar* name, out DWINVARIANT pItem);
  // Enumerate property names
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown ppEnum);
}

// COM+ Services Security - Identity Collection
interface ISecurityIdentityColl : IDispatch {
  mixin(uuid("cafc823c-b441-11d1-b82b-0000f8757e2a"));
  // static DWINGUID IID = { 0xcafc823c, 0xb441, 0x11d1, 0xb8, 0x2b, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a };
  // Returns the number of properties in this collection.
  /*[id(0x60020000)]*/ int get_Count(out int plCount);
  // Return a property from this collection
  /*[id(0x00000000)]*/ int get_Item(wchar* name, out DWINVARIANT pItem);
  // Enumerate property names
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown ppEnum);
}

// COM+ Services Security - Callers Collection
interface ISecurityCallersColl : IDispatch {
  mixin(uuid("cafc823d-b441-11d1-b82b-0000f8757e2a"));
  // static DWINGUID IID = { 0xcafc823d, 0xb441, 0x11d1, 0xb8, 0x2b, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a };
  // Returns the number of callers in this collection.
  /*[id(0x60020000)]*/ int get_Count(out int plCount);
  // Return a caller identity collection.
  /*[id(0x00000000)]*/ int get_Item(int lIndex, out ISecurityIdentityColl pObj);
  // Enumerate callers
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown ppEnum);
}

// COM+ Services Security - Call Context Collection
interface ISecurityCallContext : IDispatch {
  mixin(uuid("cafc823e-b441-11d1-b82b-0000f8757e2a"));
  // static DWINGUID IID = { 0xcafc823e, 0xb441, 0x11d1, 0xb8, 0x2b, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a };
  // Returns the number of properties in this collection.
  /*[id(0x60020005)]*/ int get_Count(out int plCount);
  // Return a property from this collection
  /*[id(0x00000000)]*/ int get_Item(wchar* name, out DWINVARIANT pItem);
  // Enumerate property names
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown ppEnum);
  // Returns TRUE if the caller's Userid is included in the identified role.
  /*[id(0x60020006)]*/ int IsCallerInRole(wchar* bstrRole, out short pfInRole);
  // Returns TRUE if security is enabled for this application.
  /*[id(0x60020007)]*/ int IsSecurityEnabled(out short pfIsEnabled);
  // Returns TRUE if the caller's Userid is included in the identified role.
  /*[id(0x60020008)]*/ int IsUserInRole(DWINVARIANT* pUser, wchar* bstrRole, out short pfInRole);
}

// COM+ Services Security - get the security call context
interface IGetSecurityCallContext : IDispatch {
  mixin(uuid("cafc823f-b441-11d1-b82b-0000f8757e2a"));
  // static DWINGUID IID = { 0xcafc823f, 0xb441, 0x11d1, 0xb8, 0x2b, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a };
  // Returns the security call context object.
  /*[id(0x60020000)]*/ int GetSecurityCallContext(out ISecurityCallContext ppObject);
}

interface IContextState : IUnknown {
  mixin(uuid("3c05e54b-a42a-11d2-afc4-00c04f8ee1c4"));
  // static DWINGUID IID = { 0x3c05e54b, 0xa42a, 0x11d2, 0xaf, 0xc4, 0x00, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4 };
  /*[id(0x60010000)]*/ int SetDeactivateOnReturn(short bDeactivate);
  /*[id(0x60010001)]*/ int GetDeactivateOnReturn(out short pbDeactivate);
  /*[id(0x60010002)]*/ int SetMyTransactionVote(tagTransactionVote txVote);
  /*[id(0x60010003)]*/ int GetMyTransactionVote(out tagTransactionVote ptxVote);
}

interface IObjectContext : IUnknown {
  mixin(uuid("51372ae0-cae7-11cf-be81-00aa00a2fa25"));
  // static DWINGUID IID = { 0x51372ae0, 0xcae7, 0x11cf, 0xbe, 0x81, 0x00, 0xaa, 0x00, 0xa2, 0xfa, 0x25 };
  /*[id(0x60010000)]*/ int CreateInstance(ref DWINGUID rclsid, ref DWINGUID riid, void *ppv);
  /*[id(0x60010001)]*/ int SetComplete();
  /*[id(0x60010002)]*/ int SetAbort();
  /*[id(0x60010003)]*/ int EnableCommit();
  /*[id(0x60010004)]*/ int DisableCommit();
  /*[id(0x60010005)]*/ int IsInTransaction();
  /*[id(0x60010006)]*/ int IsSecurityEnabled();
  /*[id(0x60010007)]*/ int IsCallerInRole(wchar* bstrRole, out int pfIsInRole);
}

interface IObjectContextActivity : IUnknown {
  mixin(uuid("51372afc-cae7-11cf-be81-00aa00a2fa25"));
  // static DWINGUID IID = { 0x51372afc, 0xcae7, 0x11cf, 0xbe, 0x81, 0x00, 0xaa, 0x00, 0xa2, 0xfa, 0x25 };
  /*[id(0x60010000)]*/ int GetActivityId(out DWINGUID pGUID);
}

interface IObjectContextInfo : IUnknown {
  mixin(uuid("75b52ddb-e8ed-11d1-93ad-00aa00ba3258"));
  // static DWINGUID IID = { 0x75b52ddb, 0xe8ed, 0x11d1, 0x93, 0xad, 0x00, 0xaa, 0x00, 0xba, 0x32, 0x58 };
  /*[id(0x60010000)]*/ int IsInTransaction();
  /*[id(0x60010001)]*/ int GetTransaction(IUnknown* pptrans);
  /*[id(0x60010002)]*/ int GetTransactionId(out DWINGUID pGUID);
  /*[id(0x60010003)]*/ int GetActivityId(out DWINGUID pGUID);
  /*[id(0x60010004)]*/ int GetContextId(out DWINGUID pGUID);
}

// IObjectConstruct Interface
interface IObjectConstruct : IUnknown {
  mixin(uuid("41c4f8b3-7439-11d2-98cb-00c04f8ee1c4"));
  // static DWINGUID IID = { 0x41c4f8b3, 0x7439, 0x11d2, 0x98, 0xcb, 0x00, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4 };
  /*[id(0x60010000)]*/ int Construct(IDispatch pCtorObj);
}

// IObjectConstructString Interface
interface IObjectConstructString : IDispatch {
  mixin(uuid("41c4f8b2-7439-11d2-98cb-00c04f8ee1c4"));
  // static DWINGUID IID = { 0x41c4f8b2, 0x7439, 0x11d2, 0x98, 0xcb, 0x00, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4 };
  // gets the construction string
  /*[id(0x00000001)]*/ int get_ConstructString(out wchar* pVal);
}

interface IObjectControl : IUnknown {
  mixin(uuid("51372aec-cae7-11cf-be81-00aa00a2fa25"));
  // static DWINGUID IID = { 0x51372aec, 0xcae7, 0x11cf, 0xbe, 0x81, 0x00, 0xaa, 0x00, 0xa2, 0xfa, 0x25 };
  /*[id(0x60010000)]*/ int Activate();
  /*[id(0x60010001)]*/ void Deactivate();
  /*[id(0x60010002)]*/ int CanBePooled();
}

interface IObjectContextTip : IUnknown {
  mixin(uuid("92fd41ca-bad9-11d2-9a2d-00c04f797bc9"));
  // static DWINGUID IID = { 0x92fd41ca, 0xbad9, 0x11d2, 0x9a, 0x2d, 0x00, 0xc0, 0x4f, 0x79, 0x7b, 0xc9 };
  /*[id(0x60010000)]*/ int GetTipUrl(out wchar* pTipUrl);
}

interface IPlaybackControl : IUnknown {
  mixin(uuid("51372afd-cae7-11cf-be81-00aa00a2fa25"));
  // static DWINGUID IID = { 0x51372afd, 0xcae7, 0x11cf, 0xbe, 0x81, 0x00, 0xaa, 0x00, 0xa2, 0xfa, 0x25 };
  /*[id(0x60010000)]*/ int FinalClientRetry();
  /*[id(0x60010001)]*/ int FinalServerRetry();
}

interface ISecurityProperty : IUnknown {
  mixin(uuid("51372aea-cae7-11cf-be81-00aa00a2fa25"));
  // static DWINGUID IID = { 0x51372aea, 0xcae7, 0x11cf, 0xbe, 0x81, 0x00, 0xaa, 0x00, 0xa2, 0xfa, 0x25 };
  /*[id(0x60010000)]*/ int GetDirectCreatorSID(void** pSID);
  /*[id(0x60010001)]*/ int GetOriginalCreatorSID(void** pSID);
  /*[id(0x60010002)]*/ int GetDirectCallerSID(void** pSID);
  /*[id(0x60010003)]*/ int GetOriginalCallerSID(void** pSID);
  /*[id(0x60010004)]*/ int ReleaseSID(void* pSID);
}

// ICrmCompensator Interface
interface ICrmCompensator : IUnknown {
  mixin(uuid("bbc01830-8d3b-11d1-82ec-00a0c91eede9"));
  // static DWINGUID IID = { 0xbbc01830, 0x8d3b, 0x11d1, 0x82, 0xec, 0x00, 0xa0, 0xc9, 0x1e, 0xed, 0xe9 };
  /*[id(0x60010000)]*/ int SetLogControl(ICrmLogControl pLogControl);
  /*[id(0x60010001)]*/ int BeginPrepare();
  /*[id(0x60010002)]*/ int PrepareRecord(tagCrmLogRecordRead crmLogRec, out int pfForget);
  /*[id(0x60010003)]*/ int EndPrepare(out int pfOkToPrepare);
  /*[id(0x60010004)]*/ int BeginCommit(int fRecovery);
  /*[id(0x60010005)]*/ int CommitRecord(tagCrmLogRecordRead crmLogRec, out int pfForget);
  /*[id(0x60010006)]*/ int EndCommit();
  /*[id(0x60010007)]*/ int BeginAbort(int fRecovery);
  /*[id(0x60010008)]*/ int AbortRecord(tagCrmLogRecordRead crmLogRec, out int pfForget);
  /*[id(0x60010009)]*/ int EndAbort();
}

// ICrmLogControl Interface
interface ICrmLogControl : IUnknown {
  mixin(uuid("a0e174b3-d26e-11d2-8f84-00805fc7bcd9"));
  // static DWINGUID IID = { 0xa0e174b3, 0xd26e, 0x11d2, 0x8f, 0x84, 0x00, 0x80, 0x5f, 0xc7, 0xbc, 0xd9 };
  // property TransactionUOW
  /*[id(0x00000001)]*/ int get_TransactionUOW(out wchar* pVal);
  // method RegisterCompensator
  /*[id(0x00000002)]*/ int RegisterCompensator(wchar* lpcwstrProgIdCompensator, wchar* lpcwstrDescription, int lCrmRegFlags);
  // method WriteLogRecordVariants
  /*[id(0x00000003)]*/ int WriteLogRecordVariants(DWINVARIANT* pLogRecord);
  // method ForceLog
  /*[id(0x00000004)]*/ int ForceLog();
  // method ForgetLogRecord
  /*[id(0x00000005)]*/ int ForgetLogRecord();
  // method ForceTransactionToAbort
  /*[id(0x00000006)]*/ int ForceTransactionToAbort();
  /*[id(0x60010006)]*/ int WriteLogRecord(tagBLOB* rgBlob, uint cBlob);
}

// ICrmCompensatorVariants Interface
interface ICrmCompensatorVariants : IUnknown {
  mixin(uuid("f0baf8e4-7804-11d1-82e9-00a0c91eede9"));
  // static DWINGUID IID = { 0xf0baf8e4, 0x7804, 0x11d1, 0x82, 0xe9, 0x00, 0xa0, 0xc9, 0x1e, 0xed, 0xe9 };
  // method SetLogControlVariants
  /*[id(0x00000001)]*/ int SetLogControlVariants(ICrmLogControl pLogControl);
  // method BeginPrepareVariants
  /*[id(0x00000002)]*/ int BeginPrepareVariants();
  // method PrepareRecordVariants
  /*[id(0x00000003)]*/ int PrepareRecordVariants(DWINVARIANT* pLogRecord, out short pbForget);
  // method EndPrepareVariants
  /*[id(0x00000004)]*/ int EndPrepareVariants(out short pbOkToPrepare);
  // method BeginCommitVariants
  /*[id(0x00000005)]*/ int BeginCommitVariants(short bRecovery);
  // method CommitRecordVariants
  /*[id(0x00000006)]*/ int CommitRecordVariants(DWINVARIANT* pLogRecord, out short pbForget);
  // method EndCommitVariants
  /*[id(0x00000007)]*/ int EndCommitVariants();
  // method BeginAbortVariants
  /*[id(0x00000008)]*/ int BeginAbortVariants(short bRecovery);
  // method AbortRecordVariants
  /*[id(0x00000009)]*/ int AbortRecordVariants(DWINVARIANT* pLogRecord, out short pbForget);
  // method EndAbortVariants
  /*[id(0x0000000A)]*/ int EndAbortVariants();
}

// ICrmFormatLogRecords Interface
interface ICrmFormatLogRecords : IUnknown {
  mixin(uuid("9c51d821-c98b-11d1-82fb-00a0c91eede9"));
  // static DWINGUID IID = { 0x9c51d821, 0xc98b, 0x11d1, 0x82, 0xfb, 0x00, 0xa0, 0xc9, 0x1e, 0xed, 0xe9 };
  // method GetColumnCount
  /*[id(0x00000001)]*/ int GetColumnCount(out int plColumnCount);
  // method GetColumnHeaders
  /*[id(0x00000002)]*/ int GetColumnHeaders(out DWINVARIANT pHeaders);
  // method GetColumn
  /*[id(0x00000003)]*/ int GetColumn(tagCrmLogRecordRead crmLogRec, out DWINVARIANT pFormattedLogRecord);
  // method GetColumnVariants
  /*[id(0x00000004)]*/ int GetColumnVariants(DWINVARIANT LogRecord, out DWINVARIANT pFormattedLogRecord);
}

// IServiceCall Interface
interface IServiceCall : IUnknown {
  mixin(uuid("bd3e2e12-42dd-40f4-a09a-95a50c58304b"));
  // static DWINGUID IID = { 0xbd3e2e12, 0x42dd, 0x40f4, 0xa0, 0x9a, 0x95, 0xa5, 0x0c, 0x58, 0x30, 0x4b };
  /*[id(0x60010000)]*/ int OnCall();
}

// IServiceActivity Interface
interface IServiceActivity : IUnknown {
  mixin(uuid("67532e0c-9e2f-4450-a354-035633944e17"));
  // static DWINGUID IID = { 0x67532e0c, 0x9e2f, 0x4450, 0xa3, 0x54, 0x03, 0x56, 0x33, 0x94, 0x4e, 0x17 };
  /*[id(0x60010000)]*/ int SynchronousCall(IServiceCall pIServiceCall);
  /*[id(0x60010001)]*/ int AsynchronousCall(IServiceCall pIServiceCall);
  /*[id(0x60010002)]*/ int BindToCurrentThread();
  /*[id(0x60010003)]*/ int UnbindFromThread();
}

interface ITransactionStatus : IUnknown {
  mixin(uuid("61f589e8-3724-4898-a0a4-664ae9e1d1b4"));
  // static DWINGUID IID = { 0x61f589e8, 0x3724, 0x4898, 0xa0, 0xa4, 0x66, 0x4a, 0xe9, 0xe1, 0xd1, 0xb4 };
  /*[id(0x60010000)]*/ int SetTransactionStatus(int hrStatus);
  /*[id(0x60010001)]*/ int GetTransactionStatus(int* pHrStatus);
}

// ICheckFusionConfig Interface
interface ICheckFusionConfig : IUnknown {
  mixin(uuid("0ff5a96f-11fc-47d1-baa6-25dd347e7242"));
  // static DWINGUID IID = { 0x0ff5a96f, 0x11fc, 0x47d1, 0xba, 0xa6, 0x25, 0xdd, 0x34, 0x7e, 0x72, 0x42 };
  /*[id(0x60010000)]*/ int IsSameFusionConfig(wchar* wszFusionName, wchar* wszFusionDirectory);
}

// IAsyncErrorNotify Interface
interface IAsyncErrorNotify : IUnknown {
  mixin(uuid("fe6777fb-a674-4177-8f32-6d707e113484"));
  // static DWINGUID IID = { 0xfe6777fb, 0xa674, 0x4177, 0x8f, 0x32, 0x6d, 0x70, 0x7e, 0x11, 0x34, 0x84 };
  /*[id(0x60010000)]*/ int OnError(int hr);
}

// ContextInfo
interface ContextInfo : IDispatch {
  mixin(uuid("19a5a02c-0ac8-11d2-b286-00c04f8ef934"));
  // static DWINGUID IID = { 0x19a5a02c, 0x0ac8, 0x11d2, 0xb2, 0x86, 0x00, 0xc0, 0x4f, 0x8e, 0xf9, 0x34 };
  // Returns TRUE if this object context has an active transaction.
  /*[id(0x06002000)]*/ int IsInTransaction(out short pbIsInTx);
  // Returns object context's transaction object
  /*[id(0x60020003)]*/ int GetTransaction(out IUnknown ppTx);
  // Returns transaction ID associated with the object context.
  /*[id(0x60020004)]*/ int GetTransactionId(out wchar* pbstrTxId);
  // Returns activity ID associated with the object context.
  /*[id(0x60020005)]*/ int GetActivityId(out wchar* pbstrActivityId);
  // Returns unique ID of this object context.
  /*[id(0x60020006)]*/ int GetContextId(out wchar* pbstrCtxId);
}

// ContextInfo2
interface ContextInfo2 : ContextInfo {
  mixin(uuid("c99d6e75-2375-11d4-8331-00c04f605588"));
  // static DWINGUID IID = { 0xc99d6e75, 0x2375, 0x11d4, 0x83, 0x31, 0x00, 0xc0, 0x4f, 0x60, 0x55, 0x88 };
  // Returns unique ID of this Application Partition.
  /*[id(0x60020007)]*/ int GetPartitionId(out wchar* __MIDL_0053);
  // Returns unique ID of this Application.
  /*[id(0x60020008)]*/ int GetApplicationId(out wchar* __MIDL_0054);
  // Returns unique ID of this Application Instance.
  /*[id(0x60020009)]*/ int GetApplicationInstanceId(out wchar* __MIDL_0055);
}

// ObjectControl
interface ObjectControl : IUnknown {
  mixin(uuid("7dc41850-0c31-11d0-8b79-00aa00b8a790"));
  // static DWINGUID IID = { 0x7dc41850, 0x0c31, 0x11d0, 0x8b, 0x79, 0x00, 0xaa, 0x00, 0xb8, 0xa7, 0x90 };
  // Called when this object is Activated
  /*[id(0x60010000)]*/ int Activate();
  // Called when this object is Deactivated
  /*[id(0x60010001)]*/ int Deactivate();
  // Called when deactivated to see if this object can be pooled.
  /*[id(0x60010002)]*/ int CanBePooled(out short pbPoolable);
}

// IMTxAS
interface IMTxAS : IDispatch {
  mixin(uuid("74c08641-cedb-11cf-8b49-00aa00b8a790"));
  // static DWINGUID IID = { 0x74c08641, 0xcedb, 0x11cf, 0x8b, 0x49, 0x00, 0xaa, 0x00, 0xb8, 0xa7, 0x90 };
  // Returns the current context for the object.
  /*[id(0x60020000)]*/ int GetObjectContext(out ObjectContext ppContext);
  // Returns a wrapped MTx reference.
  /*[id(0x60020001)]*/ int SafeRef(DWINVARIANT vRefIn, out DWINVARIANT pvRefOut);
  // Marks the current process as recycled.
  /*[id(0x60020002)]*/ int RecycleSurrogate(int lReasonCode);
}

// ObjectContext
interface ObjectContext : IDispatch {
  mixin(uuid("74c08646-cedb-11cf-8b49-00aa00b8a790"));
  // static DWINGUID IID = { 0x74c08646, 0xcedb, 0x11cf, 0x8b, 0x49, 0x00, 0xaa, 0x00, 0xb8, 0xa7, 0x90 };
  // Creates an object using current object's context.
  /*[id(0x60020000)]*/ int CreateInstance(wchar* bstrProgID, out DWINVARIANT pObject);
  // Indicates that the object has completed its work and a transaction can be committed.
  /*[id(0x60020001)]*/ int SetComplete();
  // Indicates that the object has completed its work and the transaction must be aborted.
  /*[id(0x60020002)]*/ int SetAbort();
  // Indicates that the object is not yet finished its work but would allow the transaction to commit.
  /*[id(0x60020003)]*/ int EnableCommit();
  // Indicates that the object is not yet finished its work and any attempt to commit the transaction will force an abort.
  /*[id(0x60020004)]*/ int DisableCommit();
  // Returns TRUE if this object context has an active transaction.
  /*[id(0x60020005)]*/ int IsInTransaction(out short pbIsInTx);
  // Returns TRUE if security is enabled.
  /*[id(0x60020006)]*/ int IsSecurityEnabled(out short pbIsEnabled);
  // Returns TRUE if the caller's Userid is included in the identified role.
  /*[id(0x60020007)]*/ int IsCallerInRole(wchar* bstrRole, out short pbInRole);
  // Get number of named properties.
  /*[id(0x60020020)]*/ int get_Count(out int plCount);
  // Get a named property
  /*[id(0x00000000)]*/ int get_Item(wchar* name, out DWINVARIANT pItem);
  // Enumerate property names
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown ppEnum);
  // Returns the security object
  /*[id(0x60020023)]*/ int get_Security(out SecurityProperty ppSecurityProperty);
  // Returns the context information object
  /*[id(0x60020024)]*/ int get_ContextInfo(out ContextInfo ppContextInfo);
}

// SecurityProperty
interface SecurityProperty : IDispatch {
  mixin(uuid("e74a7215-014d-11d1-a63c-00a0c911b4e0"));
  // static DWINGUID IID = { 0xe74a7215, 0x014d, 0x11d1, 0xa6, 0x3c, 0x00, 0xa0, 0xc9, 0x11, 0xb4, 0xe0 };
  // Returns the Name of the direct caller
  /*[id(0x60020000)]*/ int GetDirectCallerName(out wchar* bstrUserName);
  // Returns the Name of the direct creator
  /*[id(0x60020001)]*/ int GetDirectCreatorName(out wchar* bstrUserName);
  // Returns the Name of the original caller
  /*[id(0x60020002)]*/ int GetOriginalCallerName(out wchar* bstrUserName);
  // Returns the Name of the original creator
  /*[id(0x60020003)]*/ int GetOriginalCreatorName(out wchar* bstrUserName);
}

// ITransactionContext Interface
interface ITransactionContext : IDispatch {
  mixin(uuid("7999fc21-d3c6-11cf-acab-00a024a55aef"));
  // static DWINGUID IID = { 0x7999fc21, 0xd3c6, 0x11cf, 0xac, 0xab, 0x00, 0xa0, 0x24, 0xa5, 0x5a, 0xef };
  // Instantiate a Transaction Server object.
  /*[id(0x00000000)]*/ int CreateInstance(wchar* pszProgId, out DWINVARIANT pObject);
  // Attempt to commit current transaction.
  /*[id(0x00000001)]*/ int Commit();
  // Abort current transaction.
  /*[id(0x00000002)]*/ int Abort();
}

// ITransactionContextEx Interface
interface ITransactionContextEx : IUnknown {
  mixin(uuid("7999fc22-d3c6-11cf-acab-00a024a55aef"));
  // static DWINGUID IID = { 0x7999fc22, 0xd3c6, 0x11cf, 0xac, 0xab, 0x00, 0xa0, 0x24, 0xa5, 0x5a, 0xef };
  // Instantiate a Transaction Server object.
  /*[id(0x60010000)]*/ int CreateInstance(ref DWINGUID rclsid, ref DWINGUID riid, void *pObject);
  // Attempt to commit current transaction.
  /*[id(0x60010001)]*/ int Commit();
  // Abort current transaction.
  /*[id(0x60010002)]*/ int Abort();
}

// ICreateWithTipTransactionEx Interface
interface ICreateWithTipTransactionEx : IUnknown {
  mixin(uuid("455acf59-5345-11d2-99cf-00c04f797bc9"));
  // static DWINGUID IID = { 0x455acf59, 0x5345, 0x11d2, 0x99, 0xcf, 0x00, 0xc0, 0x4f, 0x79, 0x7b, 0xc9 };
  // Instantiate Transaction Server object with BYOT-TIP.
  /*[id(0x60010000)]*/ int CreateInstance(wchar* bstrTipUrl, ref DWINGUID rclsid, ref DWINGUID riid, void *pObject);
}

// ICreateWithTransactionEx Interface
interface ICreateWithTransactionEx : IUnknown {
  mixin(uuid("455acf57-5345-11d2-99cf-00c04f797bc9"));
  // static DWINGUID IID = { 0x455acf57, 0x5345, 0x11d2, 0x99, 0xcf, 0x00, 0xc0, 0x4f, 0x79, 0x7b, 0xc9 };
  // Instantiate Transaction Server object with BYOT.
  /*[id(0x60010000)]*/ int CreateInstance(ITransaction pTransaction, ref DWINGUID rclsid, ref DWINGUID riid, void *pObject);
}

interface ITransaction : IUnknown {
  mixin(uuid("0fb15084-af41-11ce-bd2b-204c4f4f5020"));
  // static DWINGUID IID = { 0x0fb15084, 0xaf41, 0x11ce, 0xbd, 0x2b, 0x20, 0x4c, 0x4f, 0x4f, 0x50, 0x20 };
  /*[id(0x60010000)]*/ int Commit(int fRetaining, uint grfTC, uint grfRM);
  /*[id(0x60010001)]*/ int Abort(BOID* pboidReason, int fRetaining, int fAsync);
  /*[id(0x60010002)]*/ int GetTransactionInfo(out XACTTRANSINFO pinfo);
}

// IServiceInheritanceConfig Interface
interface IServiceInheritanceConfig : IUnknown {
  mixin(uuid("92186771-d3b4-4d77-a8ea-ee842d586f35"));
  // static DWINGUID IID = { 0x92186771, 0xd3b4, 0x4d77, 0xa8, 0xea, 0xee, 0x84, 0x2d, 0x58, 0x6f, 0x35 };
  /*[id(0x60010000)]*/ int ContainingContextTreatment(tagCSC_InheritanceConfig inheritanceConfig);
}

// IServiceThreadPoolConfig Interface
interface IServiceThreadPoolConfig : IUnknown {
  mixin(uuid("186d89bc-f277-4bcc-80d5-4df7b836ef4a"));
  // static DWINGUID IID = { 0x186d89bc, 0xf277, 0x4bcc, 0x80, 0xd5, 0x4d, 0xf7, 0xb8, 0x36, 0xef, 0x4a };
  /*[id(0x60010000)]*/ int SelectThreadPool(tagCSC_ThreadPool threadPool);
  /*[id(0x60010001)]*/ int SetBindingInfo(tagCSC_Binding binding);
}

// IServiceTransactionConfig Interface
interface IServiceTransactionConfig : IServiceTransactionConfigBase {
  mixin(uuid("59f4c2a3-d3d7-4a31-b6e4-6ab3177c50b9"));
  // static DWINGUID IID = { 0x59f4c2a3, 0xd3d7, 0x4a31, 0xb6, 0xe4, 0x6a, 0xb3, 0x17, 0x7c, 0x50, 0xb9 };
  /*[id(0x60020000)]*/ int ConfigureBYOT(ITransaction pITxByot);
}

// IServiceTransactionConfigBase Interface
interface IServiceTransactionConfigBase : IUnknown {
  mixin(uuid("772b3fbe-6ffd-42fb-b5f8-8f9b260f3810"));
  // static DWINGUID IID = { 0x772b3fbe, 0x6ffd, 0x42fb, 0xb5, 0xf8, 0x8f, 0x9b, 0x26, 0x0f, 0x38, 0x10 };
  /*[id(0x60010000)]*/ int ConfigureTransaction(tagCSC_TransactionConfig transactionConfig);
  /*[id(0x60010001)]*/ int IsolationLevel(COMAdminTxIsolationLevelOptions option);
  /*[id(0x60010002)]*/ int TransactionTimeout(uint ulTimeoutSec);
  /*[id(0x60010003)]*/ int BringYourOwnTransaction(wchar* szTipURL);
  /*[id(0x60010004)]*/ int NewTransactionDescription(wchar* szTxDesc);
}

// IServiceSynchronizationConfig Interface
interface IServiceSynchronizationConfig : IUnknown {
  mixin(uuid("fd880e81-6dce-4c58-af83-a208846c0030"));
  // static DWINGUID IID = { 0xfd880e81, 0x6dce, 0x4c58, 0xaf, 0x83, 0xa2, 0x08, 0x84, 0x6c, 0x00, 0x30 };
  /*[id(0x60010000)]*/ int ConfigureSynchronization(tagCSC_SynchronizationConfig synchConfig);
}

// IServiceIISIntrinsicsConfig Interface
interface IServiceIISIntrinsicsConfig : IUnknown {
  mixin(uuid("1a0cf920-d452-46f4-bc36-48118d54ea52"));
  // static DWINGUID IID = { 0x1a0cf920, 0xd452, 0x46f4, 0xbc, 0x36, 0x48, 0x11, 0x8d, 0x54, 0xea, 0x52 };
  /*[id(0x60010000)]*/ int IISIntrinsicsConfig(tagCSC_IISIntrinsicsConfig IISIntrinsicsConfig);
}

// IServiceComTIIntrinsicsConfig Interface
interface IServiceComTIIntrinsicsConfig : IUnknown {
  mixin(uuid("09e6831e-04e1-4ed4-9d0f-e8b168bafeaf"));
  // static DWINGUID IID = { 0x09e6831e, 0x04e1, 0x4ed4, 0x9d, 0x0f, 0xe8, 0xb1, 0x68, 0xba, 0xfe, 0xaf };
  /*[id(0x60010000)]*/ int ComTIIntrinsicsConfig(tagCSC_COMTIIntrinsicsConfig ComTIIntrinsicsConfig);
}

// IServiceTrackerConfig Interface
interface IServiceTrackerConfig : IUnknown {
  mixin(uuid("6c3a3e1d-0ba6-4036-b76f-d0404db816c9"));
  // static DWINGUID IID = { 0x6c3a3e1d, 0x0ba6, 0x4036, 0xb7, 0x6f, 0xd0, 0x40, 0x4d, 0xb8, 0x16, 0xc9 };
  /*[id(0x60010000)]*/ int TrackerConfig(tagCSC_TrackerConfig TrackerConfig, wchar* szTrackerAppName, wchar* szTrackerCtxName);
}

// IServiceSxsConfig Interface
interface IServiceSxsConfig : IUnknown {
  mixin(uuid("c7cd7379-f3f2-4634-811b-703281d73e08"));
  // static DWINGUID IID = { 0xc7cd7379, 0xf3f2, 0x4634, 0x81, 0x1b, 0x70, 0x32, 0x81, 0xd7, 0x3e, 0x08 };
  /*[id(0x60010000)]*/ int SxsConfig(tagCSC_SxsConfig scsConfig);
  /*[id(0x60010001)]*/ int SxsName(wchar* szSxsName);
  /*[id(0x60010002)]*/ int SxsDirectory(wchar* szSxsDirectory);
}

// IServicePartitionConfig Interface
interface IServicePartitionConfig : IUnknown {
  mixin(uuid("80182d03-5ea4-4831-ae97-55beffc2e590"));
  // static DWINGUID IID = { 0x80182d03, 0x5ea4, 0x4831, 0xae, 0x97, 0x55, 0xbe, 0xff, 0xc2, 0xe5, 0x90 };
  /*[id(0x60010000)]*/ int PartitionConfig(tagCSC_PartitionConfig PartitionConfig);
  /*[id(0x60010001)]*/ int PartitionID(ref DWINGUID guidPartitionID);
}

// ISharedProperty Interface
interface ISharedProperty : IDispatch {
  mixin(uuid("2a005c01-a5de-11cf-9e66-00aa00a3f464"));
  // static DWINGUID IID = { 0x2a005c01, 0xa5de, 0x11cf, 0x9e, 0x66, 0x00, 0xaa, 0x00, 0xa3, 0xf4, 0x64 };
  // Set or return a property value.
  /*[id(0x00000000)]*/ int get_Value(out DWINVARIANT pVal);
  // Set or return a property value.
  /*[id(0x00000000)]*/ int set_Value(DWINVARIANT pVal);
}

// ISharedPropertyGroup Interface
interface ISharedPropertyGroup : IDispatch {
  mixin(uuid("2a005c07-a5de-11cf-9e66-00aa00a3f464"));
  // static DWINGUID IID = { 0x2a005c07, 0xa5de, 0x11cf, 0x9e, 0x66, 0x00, 0xaa, 0x00, 0xa3, 0xf4, 0x64 };
  // Given an index, returns a new instance property or existing instance property in the group.
  /*[id(0x00000001)]*/ int CreatePropertyByPosition(int Index, out short fExists, out ISharedProperty ppProp);
  // Given an index, returns a instance property in the group.
  /*[id(0x00000002)]*/ int get_PropertyByPosition(int Index, out ISharedProperty ppProperty);
  // Given a name, returns a new instance property or existing instance property in the group.
  /*[id(0x00000003)]*/ int CreateProperty(wchar* name, out short fExists, out ISharedProperty ppProp);
  // Given a name, returns a instance property in the group.
  /*[id(0x00000004)]*/ int get_Property(wchar* name, out ISharedProperty ppProperty);
}

// ISharedPropertyGroupManager Interface
interface ISharedPropertyGroupManager : IDispatch {
  mixin(uuid("2a005c0d-a5de-11cf-9e66-00aa00a3f464"));
  // static DWINGUID IID = { 0x2a005c0d, 0xa5de, 0x11cf, 0x9e, 0x66, 0x00, 0xaa, 0x00, 0xa3, 0xf4, 0x64 };
  // Given a name, returns a new instance property group or existing instance property group in the group manager.
  /*[id(0x00000001)]*/ int CreatePropertyGroup(wchar* name, ref int dwIsoMode, ref int dwRelMode, out short fExists, out ISharedPropertyGroup ppGroup);
  // Given a name, returns an existing instance property group in the group manager.
  /*[id(0x00000002)]*/ int get_Group(wchar* name, out ISharedPropertyGroup ppGroup);
  // Enumerate instance property groups in group manager.
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown retval);
}

// IMTSEvents Interface
interface IMtsEvents : IDispatch {
  mixin(uuid("bacedf4d-74ab-11d0-b162-00aa00ba3258"));
  // static DWINGUID IID = { 0xbacedf4d, 0x74ab, 0x11d0, 0xb1, 0x62, 0x00, 0xaa, 0x00, 0xba, 0x32, 0x58 };
  // property PackageName
  /*[id(0x00000001)]*/ int get_PackageName(out wchar* pVal);
  // property PackageGuid
  /*[id(0x00000002)]*/ int get_PackageGuid(out wchar* pVal);
  // method PostEvent
  /*[id(0x00000005)]*/ int PostEvent(DWINVARIANT* vEvent);
  // property FireEvents
  /*[id(0x00000006)]*/ int get_FireEvents(out short pVal);
  // method GetProcessID
  /*[id(0x00000007)]*/ int GetProcessID(out int id);
}

// IMtsEventInfo Interface
interface IMtsEventInfo : IDispatch {
  mixin(uuid("d56c3dc1-8482-11d0-b170-00aa00ba3258"));
  // static DWINGUID IID = { 0xd56c3dc1, 0x8482, 0x11d0, 0xb1, 0x70, 0x00, 0xaa, 0x00, 0xba, 0x32, 0x58 };
  // Gets the names of the data values in an enumerator
  /*[id(0x60020000)]*/ int get_Names(out IUnknown pUnk);
  // Gets the display name of the object
  /*[id(0x00000001)]*/ int get_DisplayName(out wchar* sDisplayName);
  // Gets the event id of the object (a guid converted to a string)
  /*[id(0x60020002)]*/ int get_EventID(out wchar* sGuidEventID);
  // Gets the number of data values from the object
  /*[id(0x60020003)]*/ int get_Count(out int lCount);
  // Given the name (or ordinal) return the value
  /*[id(0x60020004)]*/ int get_Value(wchar* sKey, out DWINVARIANT pVal);
}

// IMTSLocator Interface
interface IMTSLocator : IDispatch {
  mixin(uuid("d19b8bfd-7f88-11d0-b16e-00aa00ba3258"));
  // static DWINGUID IID = { 0xd19b8bfd, 0x7f88, 0x11d0, 0xb1, 0x6e, 0x00, 0xaa, 0x00, 0xba, 0x32, 0x58 };
  // method GetEventDispatcher
  /*[id(0x00000001)]*/ int GetEventDispatcher(out IUnknown pUnk);
}

// IMtsGrp Interface
interface IMtsGrp : IDispatch {
  mixin(uuid("4b2e958c-0393-11d1-b1ab-00aa00ba3258"));
  // static DWINGUID IID = { 0x4b2e958c, 0x0393, 0x11d1, 0xb1, 0xab, 0x00, 0xaa, 0x00, 0xba, 0x32, 0x58 };
  // property Count
  /*[id(0x00000001)]*/ int get_Count(out int pVal);
  // method Item
  /*[id(0x00000002)]*/ int Item(int lIndex, out IUnknown ppUnkDispatcher);
  // method Refresh
  /*[id(0x00000003)]*/ int Refresh();
}

interface IComThreadEvents : IUnknown {
  mixin(uuid("683130a5-2e50-11d2-98a5-00c04f8ee1c4"));
  // static DWINGUID IID = { 0x683130a5, 0x2e50, 0x11d2, 0x98, 0xa5, 0x00, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4 };
  /*[id(0x60010000)]*/ int OnThreadStart(COMSVCSEVENTINFO* pinfo, ulong ThreadID, uint dwThread, uint dwTheadCnt);
  /*[id(0x60010001)]*/ int OnThreadTerminate(COMSVCSEVENTINFO* pinfo, ulong ThreadID, uint dwThread, uint dwTheadCnt);
  /*[id(0x60010002)]*/ int OnThreadBindToApartment(COMSVCSEVENTINFO* pinfo, ulong ThreadID, ulong AptID, uint dwActCnt, uint dwLowCnt);
  /*[id(0x60010003)]*/ int OnThreadUnBind(COMSVCSEVENTINFO* pinfo, ulong ThreadID, ulong AptID, uint dwActCnt);
  /*[id(0x60010004)]*/ int OnThreadWorkEnque(COMSVCSEVENTINFO* pinfo, ulong ThreadID, ulong MsgWorkID, uint QueueLen);
  /*[id(0x60010005)]*/ int OnThreadWorkPrivate(COMSVCSEVENTINFO* pinfo, ulong ThreadID, ulong MsgWorkID);
  /*[id(0x60010006)]*/ int OnThreadWorkPublic(COMSVCSEVENTINFO* pinfo, ulong ThreadID, ulong MsgWorkID, uint QueueLen);
  /*[id(0x60010007)]*/ int OnThreadWorkRedirect(COMSVCSEVENTINFO* pinfo, ulong ThreadID, ulong MsgWorkID, uint QueueLen, ulong ThreadNum);
  /*[id(0x60010008)]*/ int OnThreadWorkReject(COMSVCSEVENTINFO* pinfo, ulong ThreadID, ulong MsgWorkID, uint QueueLen);
  /*[id(0x60010009)]*/ int OnThreadAssignApartment(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidActivity, ulong AptID);
  /*[id(0x6001000A)]*/ int OnThreadUnassignApartment(COMSVCSEVENTINFO* pinfo, ulong AptID);
}

interface IComUserEvent : IUnknown {
  mixin(uuid("683130a4-2e50-11d2-98a5-00c04f8ee1c4"));
  // static DWINGUID IID = { 0x683130a4, 0x2e50, 0x11d2, 0x98, 0xa5, 0x00, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4 };
  /*[id(0x60010000)]*/ int OnUserEvent(COMSVCSEVENTINFO* pinfo, DWINVARIANT* pvarEvent);
}

interface IComAppEvents : IUnknown {
  mixin(uuid("683130a6-2e50-11d2-98a5-00c04f8ee1c4"));
  // static DWINGUID IID = { 0x683130a6, 0x2e50, 0x11d2, 0x98, 0xa5, 0x00, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4 };
  /*[id(0x60010000)]*/ int OnAppActivation(COMSVCSEVENTINFO* pinfo, DWINGUID guidApp);
  /*[id(0x60010001)]*/ int OnAppShutdown(COMSVCSEVENTINFO* pinfo, DWINGUID guidApp);
  /*[id(0x60010002)]*/ int OnAppForceShutdown(COMSVCSEVENTINFO* pinfo, DWINGUID guidApp);
}

interface IComInstanceEvents : IUnknown {
  mixin(uuid("683130a7-2e50-11d2-98a5-00c04f8ee1c4"));
  // static DWINGUID IID = { 0x683130a7, 0x2e50, 0x11d2, 0x98, 0xa5, 0x00, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4 };
  /*[id(0x60010000)]*/ int OnObjectCreate(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidActivity, ref DWINGUID clsid, ref DWINGUID tsid, ulong CtxtID, ulong ObjectID);
  /*[id(0x60010001)]*/ int OnObjectDestroy(COMSVCSEVENTINFO* pinfo, ulong CtxtID);
}

interface IComTransactionEvents : IUnknown {
  mixin(uuid("683130a8-2e50-11d2-98a5-00c04f8ee1c4"));
  // static DWINGUID IID = { 0x683130a8, 0x2e50, 0x11d2, 0x98, 0xa5, 0x00, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4 };
  /*[id(0x60010000)]*/ int OnTransactionStart(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidTx, ref DWINGUID tsid, int fRoot);
  /*[id(0x60010001)]*/ int OnTransactionPrepare(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidTx, int fVoteYes);
  /*[id(0x60010002)]*/ int OnTransactionAbort(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidTx);
  /*[id(0x60010003)]*/ int OnTransactionCommit(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidTx);
}

interface IComMethodEvents : IUnknown {
  mixin(uuid("683130a9-2e50-11d2-98a5-00c04f8ee1c4"));
  // static DWINGUID IID = { 0x683130a9, 0x2e50, 0x11d2, 0x98, 0xa5, 0x00, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4 };
  /*[id(0x60010000)]*/ int OnMethodCall(COMSVCSEVENTINFO* pinfo, ulong oid, ref DWINGUID guidCid, ref DWINGUID guidRid, uint iMeth);
  /*[id(0x60010001)]*/ int OnMethodReturn(COMSVCSEVENTINFO* pinfo, ulong oid, ref DWINGUID guidCid, ref DWINGUID guidRid, uint iMeth, int hresult);
  /*[id(0x60010002)]*/ int OnMethodException(COMSVCSEVENTINFO* pinfo, ulong oid, ref DWINGUID guidCid, ref DWINGUID guidRid, uint iMeth);
}

interface IComObjectEvents : IUnknown {
  mixin(uuid("683130aa-2e50-11d2-98a5-00c04f8ee1c4"));
  // static DWINGUID IID = { 0x683130aa, 0x2e50, 0x11d2, 0x98, 0xa5, 0x00, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4 };
  /*[id(0x60010000)]*/ int OnObjectActivate(COMSVCSEVENTINFO* pinfo, ulong CtxtID, ulong ObjectID);
  /*[id(0x60010001)]*/ int OnObjectDeactivate(COMSVCSEVENTINFO* pinfo, ulong CtxtID, ulong ObjectID);
  /*[id(0x60010002)]*/ int OnDisableCommit(COMSVCSEVENTINFO* pinfo, ulong CtxtID);
  /*[id(0x60010003)]*/ int OnEnableCommit(COMSVCSEVENTINFO* pinfo, ulong CtxtID);
  /*[id(0x60010004)]*/ int OnSetComplete(COMSVCSEVENTINFO* pinfo, ulong CtxtID);
  /*[id(0x60010005)]*/ int OnSetAbort(COMSVCSEVENTINFO* pinfo, ulong CtxtID);
}

interface IComResourceEvents : IUnknown {
  mixin(uuid("683130ab-2e50-11d2-98a5-00c04f8ee1c4"));
  // static DWINGUID IID = { 0x683130ab, 0x2e50, 0x11d2, 0x98, 0xa5, 0x00, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4 };
  /*[id(0x60010000)]*/ int OnResourceCreate(COMSVCSEVENTINFO* pinfo, ulong ObjectID, wchar* pszType, ulong resId, int enlisted);
  /*[id(0x60010001)]*/ int OnResourceAllocate(COMSVCSEVENTINFO* pinfo, ulong ObjectID, wchar* pszType, ulong resId, int enlisted, uint NumRated, uint Rating);
  /*[id(0x60010002)]*/ int OnResourceRecycle(COMSVCSEVENTINFO* pinfo, ulong ObjectID, wchar* pszType, ulong resId);
  /*[id(0x60010003)]*/ int OnResourceDestroy(COMSVCSEVENTINFO* pinfo, ulong ObjectID, int hr, wchar* pszType, ulong resId);
  /*[id(0x60010004)]*/ int OnResourceTrack(COMSVCSEVENTINFO* pinfo, ulong ObjectID, wchar* pszType, ulong resId, int enlisted);
}

interface IComSecurityEvents : IUnknown {
  mixin(uuid("683130ac-2e50-11d2-98a5-00c04f8ee1c4"));
  // static DWINGUID IID = { 0x683130ac, 0x2e50, 0x11d2, 0x98, 0xa5, 0x00, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4 };
  /*[id(0x60010000)]*/ int OnAuthenticate(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidActivity, ulong ObjectID, ref DWINGUID guidIID, uint iMeth, uint cbByteOrig, ubyte* pSidOriginalUser, uint cbByteCur, ubyte* pSidCurrentUser, int bCurrentUserInpersonatingInProc);
  /*[id(0x60010001)]*/ int OnAuthenticateFail(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidActivity, ulong ObjectID, ref DWINGUID guidIID, uint iMeth, uint cbByteOrig, ubyte* pSidOriginalUser, uint cbByteCur, ubyte* pSidCurrentUser, int bCurrentUserInpersonatingInProc);
}

interface IComObjectPoolEvents : IUnknown {
  mixin(uuid("683130ad-2e50-11d2-98a5-00c04f8ee1c4"));
  // static DWINGUID IID = { 0x683130ad, 0x2e50, 0x11d2, 0x98, 0xa5, 0x00, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4 };
  /*[id(0x60010000)]*/ int OnObjPoolPutObject(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidObject, int nReason, uint dwAvailable, ulong oid);
  /*[id(0x60010001)]*/ int OnObjPoolGetObject(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidActivity, ref DWINGUID guidObject, uint dwAvailable, ulong oid);
  /*[id(0x60010002)]*/ int OnObjPoolRecycleToTx(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidActivity, ref DWINGUID guidObject, ref DWINGUID guidTx, ulong objid);
  /*[id(0x60010003)]*/ int OnObjPoolGetFromTx(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidActivity, ref DWINGUID guidObject, ref DWINGUID guidTx, ulong objid);
}

interface IComObjectPoolEvents2 : IUnknown {
  mixin(uuid("683130ae-2e50-11d2-98a5-00c04f8ee1c4"));
  // static DWINGUID IID = { 0x683130ae, 0x2e50, 0x11d2, 0x98, 0xa5, 0x00, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4 };
  /*[id(0x60010000)]*/ int OnObjPoolCreateObject(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidObject, uint dwObjsCreated, ulong oid);
  /*[id(0x60010001)]*/ int OnObjPoolDestroyObject(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidObject, uint dwObjsCreated, ulong oid);
  /*[id(0x60010002)]*/ int OnObjPoolCreateDecision(COMSVCSEVENTINFO* pinfo, uint dwThreadsWaiting, uint dwAvail, uint dwCreated, uint dwMin, uint dwMax);
  /*[id(0x60010003)]*/ int OnObjPoolTimeout(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidObject, ref DWINGUID guidActivity, uint dwTimeout);
  /*[id(0x60010004)]*/ int OnObjPoolCreatePool(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidObject, uint dwMin, uint dwMax, uint dwTimeout);
}

interface IComObjectConstructionEvents : IUnknown {
  mixin(uuid("683130af-2e50-11d2-98a5-00c04f8ee1c4"));
  // static DWINGUID IID = { 0x683130af, 0x2e50, 0x11d2, 0x98, 0xa5, 0x00, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4 };
  /*[id(0x60010000)]*/ int OnObjectConstruct(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidObject, wchar* sConstructString, ulong oid);
}

interface IComActivityEvents : IUnknown {
  mixin(uuid("683130b0-2e50-11d2-98a5-00c04f8ee1c4"));
  // static DWINGUID IID = { 0x683130b0, 0x2e50, 0x11d2, 0x98, 0xa5, 0x00, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4 };
  /*[id(0x60010000)]*/ int OnActivityCreate(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidActivity);
  /*[id(0x60010001)]*/ int OnActivityDestroy(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidActivity);
  /*[id(0x60010002)]*/ int OnActivityEnter(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidCurrent, ref DWINGUID guidEntered, uint dwThread);
  /*[id(0x60010003)]*/ int OnActivityTimeout(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidCurrent, ref DWINGUID guidEntered, uint dwThread, uint dwTimeout);
  /*[id(0x60010004)]*/ int OnActivityReenter(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidCurrent, uint dwThread, uint dwCallDepth);
  /*[id(0x60010005)]*/ int OnActivityLeave(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidCurrent, ref DWINGUID guidLeft);
  /*[id(0x60010006)]*/ int OnActivityLeaveSame(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidCurrent, uint dwCallDepth);
}

interface IComIdentityEvents : IUnknown {
  mixin(uuid("683130b1-2e50-11d2-98a5-00c04f8ee1c4"));
  // static DWINGUID IID = { 0x683130b1, 0x2e50, 0x11d2, 0x98, 0xa5, 0x00, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4 };
  /*[id(0x60010000)]*/ int OnIISRequestInfo(COMSVCSEVENTINFO* pinfo, ulong objid, wchar* pszClientIP, wchar* pszServerIP, wchar* pszURL);
}

interface IComQCEvents : IUnknown {
  mixin(uuid("683130b2-2e50-11d2-98a5-00c04f8ee1c4"));
  // static DWINGUID IID = { 0x683130b2, 0x2e50, 0x11d2, 0x98, 0xa5, 0x00, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4 };
  /*[id(0x60010000)]*/ int OnQCRecord(COMSVCSEVENTINFO* pinfo, ulong objid, ushort[60] szQueue, ref DWINGUID guidMsgId, ref DWINGUID guidWorkFlowId, int msmqhr);
  /*[id(0x60010001)]*/ int OnQCQueueOpen(COMSVCSEVENTINFO* pinfo, ushort[60] szQueue, ulong QueueID, int hr);
  /*[id(0x60010002)]*/ int OnQCReceive(COMSVCSEVENTINFO* pinfo, ulong QueueID, ref DWINGUID guidMsgId, ref DWINGUID guidWorkFlowId, int hr);
  /*[id(0x60010003)]*/ int OnQCReceiveFail(COMSVCSEVENTINFO* pinfo, ulong QueueID, int msmqhr);
  /*[id(0x60010004)]*/ int OnQCMoveToReTryQueue(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidMsgId, ref DWINGUID guidWorkFlowId, uint RetryIndex);
  /*[id(0x60010005)]*/ int OnQCMoveToDeadQueue(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidMsgId, ref DWINGUID guidWorkFlowId);
  /*[id(0x60010006)]*/ int OnQCPlayback(COMSVCSEVENTINFO* pinfo, ulong objid, ref DWINGUID guidMsgId, ref DWINGUID guidWorkFlowId, int hr);
}

interface IComExceptionEvents : IUnknown {
  mixin(uuid("683130b3-2e50-11d2-98a5-00c04f8ee1c4"));
  // static DWINGUID IID = { 0x683130b3, 0x2e50, 0x11d2, 0x98, 0xa5, 0x00, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4 };
  /*[id(0x60010000)]*/ int OnExceptionUser(COMSVCSEVENTINFO* pinfo, uint code, ulong address, wchar* pszStackTrace);
}

interface IComCRMEvents : IUnknown {
  mixin(uuid("683130b5-2e50-11d2-98a5-00c04f8ee1c4"));
  // static DWINGUID IID = { 0x683130b5, 0x2e50, 0x11d2, 0x98, 0xa5, 0x00, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4 };
  /*[id(0x60010000)]*/ int OnCRMRecoveryStart(COMSVCSEVENTINFO* pinfo, DWINGUID guidApp);
  /*[id(0x60010001)]*/ int OnCRMRecoveryDone(COMSVCSEVENTINFO* pinfo, DWINGUID guidApp);
  /*[id(0x60010002)]*/ int OnCRMCheckpoint(COMSVCSEVENTINFO* pinfo, DWINGUID guidApp);
  /*[id(0x60010003)]*/ int OnCRMBegin(COMSVCSEVENTINFO* pinfo, DWINGUID guidClerkCLSID, DWINGUID guidActivity, DWINGUID guidTx, ushort[64] szProgIdCompensator, ushort[64] szDescription);
  /*[id(0x60010004)]*/ int OnCRMPrepare(COMSVCSEVENTINFO* pinfo, DWINGUID guidClerkCLSID);
  /*[id(0x60010005)]*/ int OnCRMCommit(COMSVCSEVENTINFO* pinfo, DWINGUID guidClerkCLSID);
  /*[id(0x60010006)]*/ int OnCRMAbort(COMSVCSEVENTINFO* pinfo, DWINGUID guidClerkCLSID);
  /*[id(0x60010007)]*/ int OnCRMIndoubt(COMSVCSEVENTINFO* pinfo, DWINGUID guidClerkCLSID);
  /*[id(0x60010008)]*/ int OnCRMDone(COMSVCSEVENTINFO* pinfo, DWINGUID guidClerkCLSID);
  /*[id(0x60010009)]*/ int OnCRMRelease(COMSVCSEVENTINFO* pinfo, DWINGUID guidClerkCLSID);
  /*[id(0x6001000A)]*/ int OnCRMAnalyze(COMSVCSEVENTINFO* pinfo, DWINGUID guidClerkCLSID, uint dwCrmRecordType, uint dwRecordSize);
  /*[id(0x6001000B)]*/ int OnCRMWrite(COMSVCSEVENTINFO* pinfo, DWINGUID guidClerkCLSID, int fVariants, uint dwRecordSize);
  /*[id(0x6001000C)]*/ int OnCRMForget(COMSVCSEVENTINFO* pinfo, DWINGUID guidClerkCLSID);
  /*[id(0x6001000D)]*/ int OnCRMForce(COMSVCSEVENTINFO* pinfo, DWINGUID guidClerkCLSID);
  /*[id(0x6001000E)]*/ int OnCRMDeliver(COMSVCSEVENTINFO* pinfo, DWINGUID guidClerkCLSID, int fVariants, uint dwRecordSize);
}

interface IComMethod2Events : IUnknown {
  mixin(uuid("fb388aaa-567d-4024-af8e-6e93ee748573"));
  // static DWINGUID IID = { 0xfb388aaa, 0x567d, 0x4024, 0xaf, 0x8e, 0x6e, 0x93, 0xee, 0x74, 0x85, 0x73 };
  /*[id(0x60010000)]*/ int OnMethodCall2(COMSVCSEVENTINFO* pinfo, ulong oid, ref DWINGUID guidCid, ref DWINGUID guidRid, uint dwThread, uint iMeth);
  /*[id(0x60010001)]*/ int OnMethodReturn2(COMSVCSEVENTINFO* pinfo, ulong oid, ref DWINGUID guidCid, ref DWINGUID guidRid, uint dwThread, uint iMeth, int hresult);
  /*[id(0x60010002)]*/ int OnMethodException2(COMSVCSEVENTINFO* pinfo, ulong oid, ref DWINGUID guidCid, ref DWINGUID guidRid, uint dwThread, uint iMeth);
}

interface IComTrackingInfoEvents : IUnknown {
  mixin(uuid("4e6cdcc9-fb25-4fd5-9cc5-c9f4b6559cec"));
  // static DWINGUID IID = { 0x4e6cdcc9, 0xfb25, 0x4fd5, 0x9c, 0xc5, 0xc9, 0xf4, 0xb6, 0x55, 0x9c, 0xec };
  /*[id(0x60010000)]*/ int OnNewTrackingInfo(IUnknown pToplevelCollection);
}

interface IComApp2Events : IUnknown {
  mixin(uuid("1290bc1a-b219-418d-b078-5934ded08242"));
  // static DWINGUID IID = { 0x1290bc1a, 0xb219, 0x418d, 0xb0, 0x78, 0x59, 0x34, 0xde, 0xd0, 0x82, 0x42 };
  /*[id(0x60010000)]*/ int OnAppActivation2(COMSVCSEVENTINFO* pinfo, DWINGUID guidApp, DWINGUID guidProcess);
  /*[id(0x60010001)]*/ int OnAppShutdown2(COMSVCSEVENTINFO* pinfo, DWINGUID guidApp);
  /*[id(0x60010002)]*/ int OnAppForceShutdown2(COMSVCSEVENTINFO* pinfo, DWINGUID guidApp);
  /*[id(0x60010003)]*/ int OnAppPaused2(COMSVCSEVENTINFO* pinfo, DWINGUID guidApp, int bPaused);
  /*[id(0x60010004)]*/ int OnAppRecycle2(COMSVCSEVENTINFO* pinfo, DWINGUID guidApp, DWINGUID guidProcess, int lReason);
}

interface IComTransaction2Events : IUnknown {
  mixin(uuid("a136f62a-2f94-4288-86e0-d8a1fa4c0299"));
  // static DWINGUID IID = { 0xa136f62a, 0x2f94, 0x4288, 0x86, 0xe0, 0xd8, 0xa1, 0xfa, 0x4c, 0x02, 0x99 };
  /*[id(0x60010000)]*/ int OnTransactionStart2(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidTx, ref DWINGUID tsid, int fRoot, int nIsolationLevel);
  /*[id(0x60010001)]*/ int OnTransactionPrepare2(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidTx, int fVoteYes);
  /*[id(0x60010002)]*/ int OnTransactionAbort2(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidTx);
  /*[id(0x60010003)]*/ int OnTransactionCommit2(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidTx);
}

interface IComInstance2Events : IUnknown {
  mixin(uuid("20e3bf07-b506-4ad5-a50c-d2ca5b9c158e"));
  // static DWINGUID IID = { 0x20e3bf07, 0xb506, 0x4ad5, 0xa5, 0x0c, 0xd2, 0xca, 0x5b, 0x9c, 0x15, 0x8e };
  /*[id(0x60010000)]*/ int OnObjectCreate2(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidActivity, ref DWINGUID clsid, ref DWINGUID tsid, ulong CtxtID, ulong ObjectID, ref DWINGUID guidPartition);
  /*[id(0x60010001)]*/ int OnObjectDestroy2(COMSVCSEVENTINFO* pinfo, ulong CtxtID);
}

interface IComObjectPool2Events : IUnknown {
  mixin(uuid("65bf6534-85ea-4f64-8cf4-3d974b2ab1cf"));
  // static DWINGUID IID = { 0x65bf6534, 0x85ea, 0x4f64, 0x8c, 0xf4, 0x3d, 0x97, 0x4b, 0x2a, 0xb1, 0xcf };
  /*[id(0x60010000)]*/ int OnObjPoolPutObject2(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidObject, int nReason, uint dwAvailable, ulong oid);
  /*[id(0x60010001)]*/ int OnObjPoolGetObject2(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidActivity, ref DWINGUID guidObject, uint dwAvailable, ulong oid, ref DWINGUID guidPartition);
  /*[id(0x60010002)]*/ int OnObjPoolRecycleToTx2(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidActivity, ref DWINGUID guidObject, ref DWINGUID guidTx, ulong objid);
  /*[id(0x60010003)]*/ int OnObjPoolGetFromTx2(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidActivity, ref DWINGUID guidObject, ref DWINGUID guidTx, ulong objid, ref DWINGUID guidPartition);
}

interface IComObjectConstruction2Events : IUnknown {
  mixin(uuid("4b5a7827-8df2-45c0-8f6f-57ea1f856a9f"));
  // static DWINGUID IID = { 0x4b5a7827, 0x8df2, 0x45c0, 0x8f, 0x6f, 0x57, 0xea, 0x1f, 0x85, 0x6a, 0x9f };
  /*[id(0x60010000)]*/ int OnObjectConstruct2(COMSVCSEVENTINFO* pinfo, ref DWINGUID guidObject, wchar* sConstructString, ulong oid, ref DWINGUID guidPartition);
}

interface IComLTxEvents : IUnknown {
  mixin(uuid("605cf82c-578e-4298-975d-82babcd9e053"));
  // static DWINGUID IID = { 0x605cf82c, 0x578e, 0x4298, 0x97, 0x5d, 0x82, 0xba, 0xbc, 0xd9, 0xe0, 0x53 };
  /*[id(0x60010000)]*/ int OnLtxTransactionStart(COMSVCSEVENTINFO* pinfo, DWINGUID guidLtx, DWINGUID tsid, int fRoot, int nIsolationLevel);
  /*[id(0x60010001)]*/ int OnLtxTransactionPrepare(COMSVCSEVENTINFO* pinfo, DWINGUID guidLtx, int fVote);
  /*[id(0x60010002)]*/ int OnLtxTransactionAbort(COMSVCSEVENTINFO* pinfo, DWINGUID guidLtx);
  /*[id(0x60010003)]*/ int OnLtxTransactionCommit(COMSVCSEVENTINFO* pinfo, DWINGUID guidLtx);
  /*[id(0x60010004)]*/ int OnLtxTransactionPromote(COMSVCSEVENTINFO* pinfo, DWINGUID guidLtx, DWINGUID txnId);
}

interface ISystemAppEventData : IUnknown {
  mixin(uuid("d6d48a3c-d5c5-49e7-8c74-99e4889ed52f"));
  // static DWINGUID IID = { 0xd6d48a3c, 0xd5c5, 0x49e7, 0x8c, 0x74, 0x99, 0xe4, 0x88, 0x9e, 0xd5, 0x2f };
  /*[id(0x60010000)]*/ int Startup();
  /*[id(0x60010001)]*/ int OnDataChanged(uint dwPid, uint dwMask, uint dwNumberSinks, wchar* bstrDwMethodMask, uint dwReason, ulong u64TraceHandle);
}

// ICrmMonitorLogRecords Interface
interface ICrmMonitorLogRecords : IUnknown {
  mixin(uuid("70c8e441-c7ed-11d1-82fb-00a0c91eede9"));
  // static DWINGUID IID = { 0x70c8e441, 0xc7ed, 0x11d1, 0x82, 0xfb, 0x00, 0xa0, 0xc9, 0x1e, 0xed, 0xe9 };
  // property Count
  /*[id(0x00000001)]*/ int get_Count(out int pVal);
  // property TransactionState
  /*[id(0x00000002)]*/ int get_TransactionState(out tagCrmTransactionState pVal);
  // property StructuredRecords
  /*[id(0x00000003)]*/ int get_StructuredRecords(out short pVal);
  // method GetLogRecord
  /*[id(0x00000004)]*/ int GetLogRecord(uint dwIndex, ref tagCrmLogRecordRead pCrmLogRec);
  // method GetLogRecordVariants
  /*[id(0x00000005)]*/ int GetLogRecordVariants(DWINVARIANT IndexNumber, out DWINVARIANT pLogRecord);
}

// ICrmMonitor Interface
interface ICrmMonitor : IUnknown {
  mixin(uuid("70c8e443-c7ed-11d1-82fb-00a0c91eede9"));
  // static DWINGUID IID = { 0x70c8e443, 0xc7ed, 0x11d1, 0x82, 0xfb, 0x00, 0xa0, 0xc9, 0x1e, 0xed, 0xe9 };
  // method GetClerks
  /*[id(0x00000001)]*/ int GetClerks(out ICrmMonitorClerks pClerks);
  // method HoldClerk
  /*[id(0x00000002)]*/ int HoldClerk(DWINVARIANT Index, out DWINVARIANT pItem);
}

// ICrmMonitorClerks Interface
interface ICrmMonitorClerks : IDispatch {
  mixin(uuid("70c8e442-c7ed-11d1-82fb-00a0c91eede9"));
  // static DWINGUID IID = { 0x70c8e442, 0xc7ed, 0x11d1, 0x82, 0xfb, 0x00, 0xa0, 0xc9, 0x1e, 0xed, 0xe9 };
  // method Item
  /*[id(0x00000000)]*/ int Item(DWINVARIANT Index, out DWINVARIANT pItem);
  // property _NewEnum
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown pVal);
  // property Count
  /*[id(0x00000001)]*/ int get_Count(out int pVal);
  // method ProgIdCompensator
  /*[id(0x00000002)]*/ int ProgIdCompensator(DWINVARIANT Index, out DWINVARIANT pItem);
  // method Description
  /*[id(0x00000003)]*/ int Description(DWINVARIANT Index, out DWINVARIANT pItem);
  // method TransactionUOW
  /*[id(0x00000004)]*/ int TransactionUOW(DWINVARIANT Index, out DWINVARIANT pItem);
  // method ActivityId
  /*[id(0x00000005)]*/ int ActivityId(DWINVARIANT Index, out DWINVARIANT pItem);
}

interface ILBEvents : IUnknown {
  mixin(uuid("683130b4-2e50-11d2-98a5-00c04f8ee1c4"));
  // static DWINGUID IID = { 0x683130b4, 0x2e50, 0x11d2, 0x98, 0xa5, 0x00, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4 };
  // method TargetUp
  /*[id(0x00000001)]*/ int TargetUp(wchar* bstrServerName, wchar* bstrClsidEng);
  // method TargetDown
  /*[id(0x00000002)]*/ int TargetDown(wchar* bstrServerName, wchar* bstrClsidEng);
  // method EngineDefined
  /*[id(0x00000003)]*/ int EngineDefined(wchar* bstrPropName, DWINVARIANT* varPropValue, wchar* bstrClsidEng);
}

// IMessageMover Interface
interface IMessageMover : IDispatch {
  mixin(uuid("588a085a-b795-11d1-8054-00c04fc340ee"));
  // static DWINGUID IID = { 0x588a085a, 0xb795, 0x11d1, 0x80, 0x54, 0x00, 0xc0, 0x4f, 0xc3, 0x40, 0xee };
  /*[id(0x00000001)]*/ int get_SourcePath(out wchar* pVal);
  /*[id(0x00000001)]*/ int set_SourcePath(wchar* pVal);
  /*[id(0x00000002)]*/ int get_DestPath(out wchar* pVal);
  /*[id(0x00000002)]*/ int set_DestPath(wchar* pVal);
  /*[id(0x00000003)]*/ int get_CommitBatchSize(out int pVal);
  /*[id(0x00000003)]*/ int set_CommitBatchSize(int pVal);
  /*[id(0x00000004)]*/ int MoveMessages(out int plMessagesMoved);
}

// IDispenserManager Interface
interface IDispenserManager : IUnknown {
  mixin(uuid("5cb31e10-2b5f-11cf-be10-00aa00a2fa25"));
  // static DWINGUID IID = { 0x5cb31e10, 0x2b5f, 0x11cf, 0xbe, 0x10, 0x00, 0xaa, 0x00, 0xa2, 0xfa, 0x25 };
  /*[id(0x60010000)]*/ int RegisterDispenser(IDispenserDriver __MIDL_0056, wchar* szDispenserName, out IHolder __MIDL_0057);
  /*[id(0x60010001)]*/ int GetContext(out ULONG_PTR __MIDL_0058, out ULONG_PTR __MIDL_0059);
}

// IDispenserDriver Interface
interface IDispenserDriver : IUnknown {
  mixin(uuid("208b3651-2b48-11cf-be10-00aa00a2fa25"));
  // static DWINGUID IID = { 0x208b3651, 0x2b48, 0x11cf, 0xbe, 0x10, 0x00, 0xaa, 0x00, 0xa2, 0xfa, 0x25 };
  /*[id(0x60010000)]*/ int CreateResource(ULONG_PTR ResTypId, out ULONG_PTR pResId, out int pSecsFreeBeforeDestroy);
  /*[id(0x60010001)]*/ int RateResource(ULONG_PTR ResTypId, ULONG_PTR resId, int fRequiresTransactionEnlistment, out uint pRating);
  /*[id(0x60010002)]*/ int EnlistResource(ULONG_PTR resId, ULONG_PTR TransId);
  /*[id(0x60010003)]*/ int ResetResource(ULONG_PTR resId);
  /*[id(0x60010004)]*/ int DestroyResource(ULONG_PTR resId);
  /*[id(0x60010005)]*/ int DestroyResourceS(wchar* resId);
}

// IHolder Interface
interface IHolder : IUnknown {
  mixin(uuid("bf6a1850-2b45-11cf-be10-00aa00a2fa25"));
  // static DWINGUID IID = { 0xbf6a1850, 0x2b45, 0x11cf, 0xbe, 0x10, 0x00, 0xaa, 0x00, 0xa2, 0xfa, 0x25 };
  /*[id(0x60010000)]*/ int AllocResource(ULONG_PTR __MIDL_0060, out ULONG_PTR __MIDL_0061);
  /*[id(0x60010001)]*/ int FreeResource(ULONG_PTR __MIDL_0062);
  /*[id(0x60010002)]*/ int TrackResource(ULONG_PTR __MIDL_0063);
  /*[id(0x60010003)]*/ int TrackResourceS(wchar* __MIDL_0064);
  /*[id(0x60010004)]*/ int UntrackResource(ULONG_PTR __MIDL_0065, int __MIDL_0066);
  /*[id(0x60010005)]*/ int UntrackResourceS(wchar* __MIDL_0067, int __MIDL_0068);
  /*[id(0x60010006)]*/ int Close();
  /*[id(0x60010007)]*/ int RequestDestroyResource(ULONG_PTR __MIDL_0069);
}

// IDispenserManagerShutdownGuarantee Interface
interface IDispenserManagerShutdownGuarantee : IUnknown {
  mixin(uuid("5cb31e11-2b5f-11cf-be10-00aa00a2fa25"));
  // static DWINGUID IID = { 0x5cb31e11, 0x2b5f, 0x11cf, 0xbe, 0x10, 0x00, 0xaa, 0x00, 0xa2, 0xfa, 0x25 };
  /*[id(0x60010000)]*/ int IsComPlusApp(out int pfIsComPlusApp);
}

interface IPoolManager : IDispatch {
  mixin(uuid("0a469861-5a91-43a0-99b6-d5e179bb0631"));
  // static DWINGUID IID = { 0x0a469861, 0x5a91, 0x43a0, 0x99, 0xb6, 0xd5, 0xe1, 0x79, 0xbb, 0x06, 0x31 };
  /*[id(0x00000001)]*/ int ShutdownPool(wchar* CLSIDOrProgID);
}

// IEventServerTrace Interface
interface IEventServerTrace : IDispatch {
  mixin(uuid("9a9f12b8-80af-47ab-a579-35ea57725370"));
  // static DWINGUID IID = { 0x9a9f12b8, 0x80af, 0x47ab, 0xa5, 0x79, 0x35, 0xea, 0x57, 0x72, 0x53, 0x70 };
  // method StartTraceGuid
  /*[id(0x00000001)]*/ int StartTraceGuid(wchar* bstrguidEvent, wchar* bstrguidFilter, int lPidFilter);
  // method StopTraceGuid
  /*[id(0x00000002)]*/ int StopTraceGuid(wchar* bstrguidEvent, wchar* bstrguidFilter, int lPidFilter);
  // method EnumTraceGuid
  /*[id(0x00000003)]*/ int EnumTraceGuid(out int plCntGuids, out wchar* pbstrGuidList);
}

// IEventServer Interface
interface IEventServer : IUnknown {
  mixin(uuid("f1cb0608-ec04-11d1-93ae-00aa00ba3258"));
  // static DWINGUID IID = { 0xf1cb0608, 0xec04, 0x11d1, 0x93, 0xae, 0x00, 0xaa, 0x00, 0xba, 0x32, 0x58 };
  /*[id(0x60010000)]*/ int DispatchManyEvents(uint dwPid, ref DWINGUID appGuid, uint dwEvents, uint cbSize, ubyte* pBuf);
  /*[id(0x60010001)]*/ int DispatchOneEvent(uint dwPid, ref DWINGUID appGuid, uint cbSize, ubyte* pBuf);
  /*[id(0x60010002)]*/ int AddProcess(uint dwPid, ref DWINGUID guidApp, out uint pdwInitialEventMask, out IUnknown ppUnkCallfactory);
  /*[id(0x60010003)]*/ int RemoveProcess(uint dwPid);
  /*[id(0x60010004)]*/ int GetCallFactoryObject(uint dwPid, out IUnknown ppUnkCallfactory);
}

// IEventServer2 Interface
interface IEventServer2 : IUnknown {
  mixin(uuid("378f3ca7-bd24-481c-8dc3-5e5ece1bcad7"));
  // static DWINGUID IID = { 0x378f3ca7, 0xbd24, 0x481c, 0x8d, 0xc3, 0x5e, 0x5e, 0xce, 0x1b, 0xca, 0xd7 };
  /*[id(0x60010000)]*/ int AddProcess2(uint dwPid, ref DWINGUID guidApp, ref DWINGUID guidAppInstance, ref DWINGUID guidPartition, uint dwNumberSinks, out uint pdwInitialEventMask, ref uint pdwInitialMetMasks, out IUnknown ppUnkCallfactory, out ulong pTraceHandle);
  /*[id(0x60010001)]*/ int RemoveProcess2(uint dwPid);
  /*[id(0x60010002)]*/ int UpdateEventMasks(uint dwPid, uint dwNumberSinks, uint dwEventMasksIn, out uint pdwEventMaskOut, ref uint pdwMetMasksInOut);
}

interface IProcessTerminateNotify : IUnknown {
  mixin(uuid("3194b4cf-ef32-11d1-93ae-00aa00ba3258"));
  // static DWINGUID IID = { 0x3194b4cf, 0xef32, 0x11d1, 0x93, 0xae, 0x00, 0xaa, 0x00, 0xba, 0x32, 0x58 };
  /*[id(0x60010000)]*/ void ProcessShutdown(uint dwPid, ref DWINGUID guidAppInstance);
}

interface IReceiveAppData : IUnknown {
  mixin(uuid("413dafb0-bcf4-11d1-861d-0080c729264d"));
  // static DWINGUID IID = { 0x413dafb0, 0xbcf4, 0x11d1, 0x86, 0x1d, 0x00, 0x80, 0xc7, 0x29, 0x26, 0x4d };
  /*[id(0x60010000)]*/ int Register(ref DWINGUID pApplId, ref DWINGUID pguidApplPartitionId, ref DWINGUID pApplInstanceId, tagCOMPLUS_APPTYPE eAppType, wchar* pwszProcessName, IUnknown pUnkPackageObject, uint dwAppProcessId, uint dwState, RECYCLE_INFO* pRecycleInfo, out uint pidApp, out uint pPushRate);
  /*[id(0x60010001)]*/ int PushAppData(uint idApp, APPSTATISTICS appData, uint dwAppState, uint nCLSIDs, CLSIDDATA2* clsids);
  /*[id(0x60010002)]*/ int Unregister(uint idApp);
  /*[id(0x60010003)]*/ int RecycleCallingProcess(uint idApp, int lReasonCode);
}

interface IGetAppData : IUnknown {
  mixin(uuid("b60040e0-bcf3-11d1-861d-0080c729264d"));
  // static DWINGUID IID = { 0xb60040e0, 0xbcf3, 0x11d1, 0x86, 0x1d, 0x00, 0x80, 0xc7, 0x29, 0x26, 0x4d };
  /*[id(0x60010000)]*/ int SetPushRate(uint dwPushRate);
  /*[id(0x60010001)]*/ int GetApps(out uint nApps, out appData aAppData);
  /*[id(0x60010002)]*/ int GetAppData(uint idApp, out uint nCLSIDs, out CLSIDDATA aAppData);
  /*[id(0x60010003)]*/ int GetCLSIDData(uint idApp, DWINGUID clsid, out CLSIDDATA ppAppData);
  /*[id(0x60010004)]*/ int Shutdown();
}

// IProcessDump Interface
interface IProcessDump : IDispatch {
  mixin(uuid("23c9dd26-2355-4fe2-84de-f779a238adbd"));
  // static DWINGUID IID = { 0x23c9dd26, 0x2355, 0x4fe2, 0x84, 0xde, 0xf7, 0x79, 0xa2, 0x38, 0xad, 0xbd };
  // method IsSupported
  /*[id(0x00000001)]*/ int IsSupported();
  // method DumpProcess
  /*[id(0x00000002)]*/ int DumpProcess(wchar* bstrInstanceID, wchar* bstrDirectory, uint dwMaxImages, out wchar* pbstrDumpFile);
}

interface IMoniker : IPersistStream {
  mixin(uuid("0000000f-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x0000000f, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60030000)]*/ int RemoteBindToObject(IBindCtx pbc, IMoniker pmkToLeft, ref DWINGUID riidResult, out IUnknown ppvResult);
  /*[id(0x60030001)]*/ int RemoteBindToStorage(IBindCtx pbc, IMoniker pmkToLeft, ref DWINGUID riid, out IUnknown ppvObj);
  /*[id(0x60030002)]*/ int Reduce(IBindCtx pbc, uint dwReduceHowFar, ref IMoniker ppmkToLeft, out IMoniker ppmkReduced);
  /*[id(0x60030003)]*/ int ComposeWith(IMoniker pmkRight, int fOnlyIfNotGeneric, out IMoniker ppmkComposite);
  /*[id(0x60030004)]*/ int Enum(int fForward, out IEnumMoniker ppenumMoniker);
  /*[id(0x60030005)]*/ int IsEqual(IMoniker pmkOtherMoniker);
  /*[id(0x60030006)]*/ int Hash(out uint pdwHash);
  /*[id(0x60030007)]*/ int IsRunning(IBindCtx pbc, IMoniker pmkToLeft, IMoniker pmkNewlyRunning);
  /*[id(0x60030008)]*/ int GetTimeOfLastChange(IBindCtx pbc, IMoniker pmkToLeft, out _FILETIME pfiletime);
  /*[id(0x60030009)]*/ int Inverse(out IMoniker ppmk);
  /*[id(0x6003000A)]*/ int CommonPrefixWith(IMoniker pmkOther, out IMoniker ppmkPrefix);
  /*[id(0x6003000B)]*/ int RelativePathTo(IMoniker pmkOther, out IMoniker ppmkRelPath);
  /*[id(0x6003000C)]*/ int GetDisplayName(IBindCtx pbc, IMoniker pmkToLeft, out wchar* ppszDisplayName);
  /*[id(0x6003000D)]*/ int ParseDisplayName(IBindCtx pbc, IMoniker pmkToLeft, wchar* pszDisplayName, out uint pchEaten, out IMoniker ppmkOut);
  /*[id(0x6003000E)]*/ int IsSystemMoniker(out uint pdwMksys);
}

interface IPersistStream : IPersist {
  mixin(uuid("00000109-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00000109, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60020000)]*/ int IsDirty();
  /*[id(0x60020001)]*/ int Load(IStream pstm);
  /*[id(0x60020002)]*/ int Save(IStream pstm, int fClearDirty);
  /*[id(0x60020003)]*/ int GetSizeMax(out _ULARGE_INTEGER pcbSize);
}

interface IPersist : IUnknown {
  mixin(uuid("0000010c-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x0000010c, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int GetClassID(out DWINGUID pClassID);
}

interface IStream : ISequentialStream {
  mixin(uuid("0000000c-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x0000000c, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60020000)]*/ int RemoteSeek(_LARGE_INTEGER dlibMove, uint dwOrigin, out _ULARGE_INTEGER plibNewPosition);
  /*[id(0x60020001)]*/ int SetSize(_ULARGE_INTEGER libNewSize);
  /*[id(0x60020002)]*/ int RemoteCopyTo(IStream pstm, _ULARGE_INTEGER cb, out _ULARGE_INTEGER pcbRead, out _ULARGE_INTEGER pcbWritten);
  /*[id(0x60020003)]*/ int Commit(uint grfCommitFlags);
  /*[id(0x60020004)]*/ int Revert();
  /*[id(0x60020005)]*/ int LockRegion(_ULARGE_INTEGER libOffset, _ULARGE_INTEGER cb, uint dwLockType);
  /*[id(0x60020006)]*/ int UnlockRegion(_ULARGE_INTEGER libOffset, _ULARGE_INTEGER cb, uint dwLockType);
  /*[id(0x60020007)]*/ int Stat(out tagSTATSTG pstatstg, uint grfStatFlag);
  /*[id(0x60020008)]*/ int Clone(out IStream ppstm);
}

interface ISequentialStream : IUnknown {
  mixin(uuid("0c733a30-2a1c-11ce-ade5-00aa0044773d"));
  // static DWINGUID IID = { 0x0c733a30, 0x2a1c, 0x11ce, 0xad, 0xe5, 0x00, 0xaa, 0x00, 0x44, 0x77, 0x3d };
  /*[id(0x60010000)]*/ int RemoteRead(out ubyte pv, uint cb, out uint pcbRead);
  /*[id(0x60010001)]*/ int RemoteWrite(ubyte* pv, uint cb, out uint pcbWritten);
}

interface IBindCtx : IUnknown {
  mixin(uuid("0000000e-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x0000000e, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RegisterObjectBound(IUnknown pUnk);
  /*[id(0x60010001)]*/ int RevokeObjectBound(IUnknown pUnk);
  /*[id(0x60010002)]*/ int ReleaseBoundObjects();
  /*[id(0x60010003)]*/ int RemoteSetBindOptions(tagBIND_OPTS2* pbindopts);
  /*[id(0x60010004)]*/ int RemoteGetBindOptions(ref tagBIND_OPTS2 pbindopts);
  /*[id(0x60010005)]*/ int GetRunningObjectTable(out IRunningObjectTable pprot);
  /*[id(0x60010006)]*/ int RegisterObjectParam(wchar* pszKey, IUnknown pUnk);
  /*[id(0x60010007)]*/ int GetObjectParam(wchar* pszKey, out IUnknown ppunk);
  /*[id(0x60010008)]*/ int EnumObjectParam(out IEnumString ppEnum);
  /*[id(0x60010009)]*/ int RevokeObjectParam(wchar* pszKey);
}

interface IRunningObjectTable : IUnknown {
  mixin(uuid("00000010-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00000010, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int Register(uint grfFlags, IUnknown punkObject, IMoniker pmkObjectName, out uint pdwRegister);
  /*[id(0x60010001)]*/ int Revoke(uint dwRegister);
  /*[id(0x60010002)]*/ int IsRunning(IMoniker pmkObjectName);
  /*[id(0x60010003)]*/ int GetObject(IMoniker pmkObjectName, out IUnknown ppunkObject);
  /*[id(0x60010004)]*/ int NoteChangeTime(uint dwRegister, _FILETIME* pfiletime);
  /*[id(0x60010005)]*/ int GetTimeOfLastChange(IMoniker pmkObjectName, out _FILETIME pfiletime);
  /*[id(0x60010006)]*/ int EnumRunning(out IEnumMoniker ppenumMoniker);
}

interface IEnumMoniker : IUnknown {
  mixin(uuid("00000102-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00000102, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RemoteNext(uint celt, out IMoniker rgelt, out uint pceltFetched);
  /*[id(0x60010001)]*/ int Skip(uint celt);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IEnumMoniker ppEnum);
}

interface IEnumString : IUnknown {
  mixin(uuid("00000101-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00000101, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RemoteNext(uint celt, out wchar* rgelt, out uint pceltFetched);
  /*[id(0x60010001)]*/ int Skip(uint celt);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IEnumString ppEnum);
}

// CoClasses

// COM+ Services Security - certificate collection
abstract class SecurityCertificate {
  mixin(uuid("ecabb0a4-7f19-11d2-978e-0000f8757e2a"));
  // static DWINGUID CLSID = { 0xecabb0a4, 0x7f19, 0x11d2, 0x97, 0x8e, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a };
  mixin Interfaces!(ISecurityCertificateColl, IDispatch);
}

// COM+ Services Security - identity collection
abstract class SecurityIdentity {
  mixin(uuid("ecabb0a5-7f19-11d2-978e-0000f8757e2a"));
  // static DWINGUID CLSID = { 0xecabb0a5, 0x7f19, 0x11d2, 0x97, 0x8e, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a };
  mixin Interfaces!(ISecurityIdentityColl, IDispatch);
}

// COM+ Services Security - callers collection
abstract class SecurityCallers {
  mixin(uuid("ecabb0a6-7f19-11d2-978e-0000f8757e2a"));
  // static DWINGUID CLSID = { 0xecabb0a6, 0x7f19, 0x11d2, 0x97, 0x8e, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a };
  mixin Interfaces!(ISecurityCallersColl, IDispatch);
}

// COM+ Services Security - call context collection
abstract class SecurityCallContext {
  mixin(uuid("ecabb0a7-7f19-11d2-978e-0000f8757e2a"));
  // static DWINGUID CLSID = { 0xecabb0a7, 0x7f19, 0x11d2, 0x97, 0x8e, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a };
  mixin Interfaces!(ISecurityCallContext, IDispatch);
}

// COM+ Services Security - get the security call context
abstract class GetSecurityCallContextAppObject {
  mixin(uuid("ecabb0a8-7f19-11d2-978e-0000f8757e2a"));
  // static DWINGUID CLSID = { 0xecabb0a8, 0x7f19, 0x11d2, 0x97, 0x8e, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a };
  mixin Interfaces!(IGetSecurityCallContext, IDispatch);
}

abstract class Dummy30040732 {
  mixin(uuid("ecabb0a9-7f19-11d2-978e-0000f8757e2a"));
  // static DWINGUID CLSID = { 0xecabb0a9, 0x7f19, 0x11d2, 0x97, 0x8e, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a };
  mixin Interfaces!(IObjectContext, IObjectContextActivity, IObjectContextInfo, IObjectConstruct, IObjectConstructString, IObjectControl, IObjectContextTip, IPlaybackControl, ISecurityProperty, ICrmCompensator, ICrmCompensatorVariants, ICrmFormatLogRecords, IServiceCall, IServiceActivity, ITransactionStatus, ICheckFusionConfig, IAsyncErrorNotify);
}

// COM+ Services Application Server Class
abstract class AppServer {
  mixin(uuid("71e38f91-7e88-11cf-9ede-0080c78b7f89"));
  // static DWINGUID CLSID = { 0x71e38f91, 0x7e88, 0x11cf, 0x9e, 0xde, 0x00, 0x80, 0xc7, 0x8b, 0x7f, 0x89 };
  mixin Interfaces!(IMTxAS);
}

// Transaction Context Class
abstract class TransactionContext {
  mixin(uuid("7999fc25-d3c6-11cf-acab-00a024a55aef"));
  // static DWINGUID CLSID = { 0x7999fc25, 0xd3c6, 0x11cf, 0xac, 0xab, 0x00, 0xa0, 0x24, 0xa5, 0x5a, 0xef };
  mixin Interfaces!(ITransactionContext);
}

// Transaction Context Extended Class
abstract class TransactionContextEx {
  mixin(uuid("5cb66670-d3d4-11cf-acab-00a024a55aef"));
  // static DWINGUID CLSID = { 0x5cb66670, 0xd3d4, 0x11cf, 0xac, 0xab, 0x00, 0xa0, 0x24, 0xa5, 0x5a, 0xef };
  mixin Interfaces!(ITransactionContextEx);
}

// BYOT Extended Class
abstract class ByotServerEx {
  mixin(uuid("ecabb0aa-7f19-11d2-978e-0000f8757e2a"));
  // static DWINGUID CLSID = { 0xecabb0aa, 0x7f19, 0x11d2, 0x97, 0x8e, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a };
  mixin Interfaces!(ICreateWithTipTransactionEx, ICreateWithTransactionEx);
}

// CServiceConfig Class
abstract class CServiceConfig {
  mixin(uuid("ecabb0c8-7f19-11d2-978e-0000f8757e2a"));
  // static DWINGUID CLSID = { 0xecabb0c8, 0x7f19, 0x11d2, 0x97, 0x8e, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a };
  mixin Interfaces!(IServiceInheritanceConfig, IServiceThreadPoolConfig, IServiceTransactionConfig, IServiceSynchronizationConfig, IServiceIISIntrinsicsConfig, IServiceComTIIntrinsicsConfig, IServiceTrackerConfig, IServiceSxsConfig, IServicePartitionConfig, IServiceTransactionConfig);
}

// Shared Property Class
abstract class SharedProperty {
  mixin(uuid("2a005c05-a5de-11cf-9e66-00aa00a3f464"));
  // static DWINGUID CLSID = { 0x2a005c05, 0xa5de, 0x11cf, 0x9e, 0x66, 0x00, 0xaa, 0x00, 0xa3, 0xf4, 0x64 };
  mixin Interfaces!(ISharedProperty);
}

// SharedPropertyGroup Class
abstract class SharedPropertyGroup {
  mixin(uuid("2a005c0b-a5de-11cf-9e66-00aa00a3f464"));
  // static DWINGUID CLSID = { 0x2a005c0b, 0xa5de, 0x11cf, 0x9e, 0x66, 0x00, 0xaa, 0x00, 0xa3, 0xf4, 0x64 };
  mixin Interfaces!(ISharedPropertyGroup);
}

// SharedPropertyGroupManager Class
abstract class SharedPropertyGroupManager {
  mixin(uuid("2a005c11-a5de-11cf-9e66-00aa00a3f464"));
  // static DWINGUID CLSID = { 0x2a005c11, 0xa5de, 0x11cf, 0x9e, 0x66, 0x00, 0xaa, 0x00, 0xa3, 0xf4, 0x64 };
  mixin Interfaces!(ISharedPropertyGroupManager);
}

// MTSEvents Class
abstract class COMEvents {
  mixin(uuid("ecabb0ab-7f19-11d2-978e-0000f8757e2a"));
  // static DWINGUID CLSID = { 0xecabb0ab, 0x7f19, 0x11d2, 0x97, 0x8e, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a };
  mixin Interfaces!(IMtsEvents, IMtsEventInfo);
}

// MTSLocator Class
abstract class CoMTSLocator {
  mixin(uuid("ecabb0ac-7f19-11d2-978e-0000f8757e2a"));
  // static DWINGUID CLSID = { 0xecabb0ac, 0x7f19, 0x11d2, 0x97, 0x8e, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a };
  mixin Interfaces!(IMTSLocator);
}

// MtxGrp Class
abstract class MtsGrp {
  mixin(uuid("4b2e958d-0393-11d1-b1ab-00aa00ba3258"));
  // static DWINGUID CLSID = { 0x4b2e958d, 0x0393, 0x11d1, 0xb1, 0xab, 0x00, 0xaa, 0x00, 0xba, 0x32, 0x58 };
  mixin Interfaces!(IMtsGrp);
}

// COM Services Events class
abstract class ComServiceEvents {
  mixin(uuid("ecabb0c3-7f19-11d2-978e-0000f8757e2a"));
  // static DWINGUID CLSID = { 0xecabb0c3, 0x7f19, 0x11d2, 0x97, 0x8e, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a };
  mixin Interfaces!(IComThreadEvents, IComUserEvent, IComAppEvents, IComInstanceEvents, IComTransactionEvents, IComMethodEvents, IComObjectEvents, IComResourceEvents, IComSecurityEvents, IComObjectPoolEvents, IComObjectPoolEvents2, IComObjectConstructionEvents, IComActivityEvents, IComIdentityEvents, IComQCEvents, IComExceptionEvents, IComCRMEvents, IComMethod2Events, IComTrackingInfoEvents, IComApp2Events, IComTransaction2Events, IComInstance2Events, IComObjectPool2Events, IComObjectConstruction2Events, IComLTxEvents);
}

// COM System Application Event Data class
abstract class ComSystemAppEventData {
  mixin(uuid("ecabb0c6-7f19-11d2-978e-0000f8757e2a"));
  // static DWINGUID CLSID = { 0xecabb0c6, 0x7f19, 0x11d2, 0x97, 0x8e, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a };
  mixin Interfaces!(ISystemAppEventData);
}

// CRMClerk Class
abstract class CRMClerk {
  mixin(uuid("ecabb0bd-7f19-11d2-978e-0000f8757e2a"));
  // static DWINGUID CLSID = { 0xecabb0bd, 0x7f19, 0x11d2, 0x97, 0x8e, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a };
  mixin Interfaces!(ICrmLogControl, ICrmMonitorLogRecords);
}

// CRMRecoveryClerk Class
abstract class CRMRecoveryClerk {
  mixin(uuid("ecabb0be-7f19-11d2-978e-0000f8757e2a"));
  // static DWINGUID CLSID = { 0xecabb0be, 0x7f19, 0x11d2, 0x97, 0x8e, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a };
  mixin Interfaces!(ICrmMonitor);
}

// ComLBEvents class
abstract class LBEvents {
  mixin(uuid("ecabb0c1-7f19-11d2-978e-0000f8757e2a"));
  // static DWINGUID CLSID = { 0xecabb0c1, 0x7f19, 0x11d2, 0x97, 0x8e, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a };
  mixin Interfaces!(ILBEvents);
}

// QC MessageMover Class
abstract class MessageMover {
  mixin(uuid("ecabb0bf-7f19-11d2-978e-0000f8757e2a"));
  // static DWINGUID CLSID = { 0xecabb0bf, 0x7f19, 0x11d2, 0x97, 0x8e, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a };
  mixin Interfaces!(IMessageMover);
}

// Dispenser Manager
abstract class DispenserManager {
  mixin(uuid("ecabb0c0-7f19-11d2-978e-0000f8757e2a"));
  // static DWINGUID CLSID = { 0xecabb0c0, 0x7f19, 0x11d2, 0x97, 0x8e, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a };
  mixin Interfaces!(IDispenserManager, IDispenserManagerShutdownGuarantee);
}

abstract class PoolMgr {
  mixin(uuid("ecabafb5-7f19-11d2-978e-0000f8757e2a"));
  // static DWINGUID CLSID = { 0xecabafb5, 0x7f19, 0x11d2, 0x97, 0x8e, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a };
  mixin Interfaces!(IPoolManager);
}

abstract class EventServer {
  mixin(uuid("ecabafbc-7f19-11d2-978e-0000f8757e2a"));
  // static DWINGUID CLSID = { 0xecabafbc, 0x7f19, 0x11d2, 0x97, 0x8e, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a };
  mixin Interfaces!(IEventServerTrace, IEventServer, IEventServer2, IProcessTerminateNotify);
}

abstract class TrackerServer {
  mixin(uuid("ecabafb9-7f19-11d2-978e-0000f8757e2a"));
  // static DWINGUID CLSID = { 0xecabafb9, 0x7f19, 0x11d2, 0x97, 0x8e, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a };
  mixin Interfaces!(IReceiveAppData, IGetAppData);
}

abstract class ProcessDump {
  mixin(uuid("ecabb0c4-7f19-11d2-978e-0000f8757e2a"));
  // static DWINGUID CLSID = { 0xecabb0c4, 0x7f19, 0x11d2, 0x97, 0x8e, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a };
  mixin Interfaces!(IProcessDump);
}

abstract class PartitionMoniker {
  mixin(uuid("ecabb0c5-7f19-11d2-978e-0000f8757e2a"));
  // static DWINGUID CLSID = { 0xecabb0c5, 0x7f19, 0x11d2, 0x97, 0x8e, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a };
  mixin Interfaces!(IMoniker);
}

abstract class SoapMoniker {
  mixin(uuid("ecabb0c7-7f19-11d2-978e-0000f8757e2a"));
  // static DWINGUID CLSID = { 0xecabb0c7, 0x7f19, 0x11d2, 0x97, 0x8e, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a };
  mixin Interfaces!(IMoniker);
}
