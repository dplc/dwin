// Microsoft Message Queue 1.0 Object Library
// Version 1.0

/*[uuid("d7d6e071-dccd-11d0-aa4b-0060970debae")]*/
//module dwin.sys.win32.com.tlb.more.msmq;
module dwin.sys.win32.com.tlb.more.mqoa10;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum MQCALG {
  MQMSG_CALG_MD2 = 0x00008001,
  MQMSG_CALG_MD4 = 0x00008002,
  MQMSG_CALG_MD5 = 0x00008003,
  MQMSG_CALG_SHA = 0x00008004,
  MQMSG_CALG_MAC = 0x00008005,
  MQMSG_CALG_RSA_SIGN = 0x00002400,
  MQMSG_CALG_DSS_SIGN = 0x00002200,
  MQMSG_CALG_RSA_KEYX = 0x0000A400,
  MQMSG_CALG_DES = 0x00006601,
  MQMSG_CALG_RC2 = 0x00006602,
  MQMSG_CALG_RC4 = 0x00006801,
  MQMSG_CALG_SEAL = 0x00006802,
}

enum MQTRANSACTION {
  MQ_NO_TRANSACTION = 0x00000000,
  MQ_MTS_TRANSACTION = 0x00000001,
  MQ_XA_TRANSACTION = 0x00000002,
  MQ_SINGLE_MESSAGE = 0x00000003,
}

enum RELOPS {
  REL_NOP = 0x00000000,
  REL_EQ = 0x00000001,
  REL_NEQ = 0x00000002,
  REL_LT = 0x00000003,
  REL_GT = 0x00000004,
  REL_LE = 0x00000005,
  REL_GE = 0x00000006,
}

enum MQMSGCURSOR {
  MQMSG_FIRST = 0x00000000,
  MQMSG_CURRENT = 0x00000001,
  MQMSG_NEXT = 0x00000002,
}

enum MQMSGCLASS {
  MQMSG_CLASS_NORMAL = 0x00000000,
  MQMSG_CLASS_REPORT = 0x00000001,
  MQMSG_CLASS_ACK_REACH_QUEUE = 0x00000002,
  MQMSG_CLASS_ACK_RECEIVE = 0x00004000,
  MQMSG_CLASS_NACK_BAD_DST_Q = 0x00008000,
  MQMSG_CLASS_NACK_PURGED = 0x00008001,
  MQMSG_CLASS_NACK_REACH_QUEUE_TIMEOUT = 0x00008002,
  MQMSG_CLASS_NACK_Q_EXCEED_QUOTA = 0x00008003,
  MQMSG_CLASS_NACK_ACCESS_DENIED = 0x00008004,
  MQMSG_CLASS_NACK_HOP_COUNT_EXCEEDED = 0x00008005,
  MQMSG_CLASS_NACK_BAD_SIGNATURE = 0x00008006,
  MQMSG_CLASS_NACK_BAD_ENCRYPTION = 0x00008007,
  MQMSG_CLASS_NACK_COULD_NOT_ENCRYPT = 0x00008008,
  MQMSG_CLASS_NACK_NOT_TRANSACTIONAL_Q = 0x00008009,
  MQMSG_CLASS_NACK_NOT_TRANSACTIONAL_MSG = 0x0000800A,
  MQMSG_CLASS_NACK_Q_DELETED = 0x0000C000,
  MQMSG_CLASS_NACK_Q_PURGED = 0x0000C001,
  MQMSG_CLASS_NACK_RECEIVE_TIMEOUT = 0x0000C002,
}

enum MQMSGDELIVERY {
  MQMSG_DELIVERY_EXPRESS = 0x00000000,
  MQMSG_DELIVERY_RECOVERABLE = 0x00000001,
}

enum MQMSGACKNOWLEDGEMENT {
  MQMSG_ACKNOWLEDGMENT_NONE = 0x00000000,
  MQMSG_ACKNOWLEDGMENT_POS_ARRIVAL = 0x00000001,
  MQMSG_ACKNOWLEDGMENT_POS_RECEIVE = 0x00000002,
  MQMSG_ACKNOWLEDGMENT_NEG_ARRIVAL = 0x00000004,
  MQMSG_ACKNOWLEDGMENT_NEG_RECEIVE = 0x00000008,
  MQMSG_ACKNOWLEDGMENT_NACK_REACH_QUEUE = 0x00000004,
  MQMSG_ACKNOWLEDGMENT_FULL_REACH_QUEUE = 0x00000005,
  MQMSG_ACKNOWLEDGMENT_NACK_RECEIVE = 0x0000000C,
  MQMSG_ACKNOWLEDGMENT_FULL_RECEIVE = 0x0000000E,
}

enum MQMSGJOURNAL {
  MQMSG_JOURNAL_NONE = 0x00000000,
  MQMSG_DEADLETTER = 0x00000001,
  MQMSG_JOURNAL = 0x00000002,
}

enum MQMSGTRACE {
  MQMSG_TRACE_NONE = 0x00000000,
  MQMSG_SEND_ROUTE_TO_REPORT_QUEUE = 0x00000001,
}

enum MQMSGSENDERIDTYPE {
  MQMSG_SENDERID_TYPE_NONE = 0x00000000,
  MQMSG_SENDERID_TYPE_SID = 0x00000001,
}

enum MQMSGPRIVLEVEL {
  MQMSG_PRIV_LEVEL_NONE = 0x00000000,
  MQMSG_PRIV_LEVEL_BODY = 0x00000001,
}

enum MQMSGAUTHLEVEL {
  MQMSG_AUTH_LEVEL_NONE = 0x00000000,
  MQMSG_AUTH_LEVEL_ALWAYS = 0x00000001,
}

enum MQMSGIDSIZE {
  MQMSG_MSGID_SIZE = 0x00000014,
  MQMSG_CORRELATIONID_SIZE = 0x00000014,
}

enum MQMSGMAX {
  MQ_MAX_MSG_LABEL_LEN = 0x000000F9,
}

enum MQSHARE {
  MQ_DENY_NONE = 0x00000000,
  MQ_DENY_RECEIVE_SHARE = 0x00000001,
}

enum MQACCESS {
  MQ_RECEIVE_ACCESS = 0x00000001,
  MQ_SEND_ACCESS = 0x00000002,
  MQ_PEEK_ACCESS = 0x00000020,
}

enum MQJOURNAL {
  MQ_JOURNAL_NONE = 0x00000000,
  MQ_JOURNAL = 0x00000001,
}

enum MQTRANSACTIONAL {
  MQ_TRANSACTIONAL_NONE = 0x00000000,
  MQ_TRANSACTIONAL = 0x00000001,
}

enum MQAUTHENTICATE {
  MQ_AUTHENTICATE_NONE = 0x00000000,
  MQ_AUTHENTICATE = 0x00000001,
}

enum MQPRIVLEVEL {
  MQ_PRIV_LEVEL_NONE = 0x00000000,
  MQ_PRIV_LEVEL_OPTIONAL = 0x00000001,
  MQ_PRIV_LEVEL_BODY = 0x00000002,
}

enum MQPRIORITY {
  MQ_MIN_PRIORITY = 0x00000000,
  MQ_MAX_PRIORITY = 0x00000007,
}

enum MQMAX {
  MQ_MAX_Q_NAME_LEN = 0x0000007C,
  MQ_MAX_Q_LABEL_LEN = 0x0000007C,
}

enum MQDEFAULT {
  DEFAULT_M_PRIORITY = 0x00000003,
  DEFAULT_M_DELIVERY = 0x00000000,
  DEFAULT_M_ACKNOWLEDGE = 0x00000000,
  DEFAULT_M_JOURNAL = 0x00000000,
  DEFAULT_M_APPSPECIFIC = 0x00000000,
  DEFAULT_M_PRIV_LEVEL = 0x00000000,
  DEFAULT_M_AUTH_LEVEL = 0x00000000,
  DEFAULT_M_SENDERID_TYPE = 0x00000001,
  DEFAULT_Q_JOURNAL = 0x00000000,
  DEFAULT_Q_BASEPRIORITY = 0x00000000,
  DEFAULT_Q_QUOTA = 0xFFFFFFFF,
  DEFAULT_Q_JOURNAL_QUOTA = 0xFFFFFFFF,
  DEFAULT_Q_TRANSACTION = 0x00000000,
  DEFAULT_Q_AUTHENTICATE = 0x00000000,
  DEFAULT_Q_PRIV_LEVEL = 0x00000001,
}

enum MQERROR {
  MQ_ERROR = 0xC00E0001,
  MQ_ERROR_PROPERTY = 0xC00E0002,
  MQ_ERROR_QUEUE_NOT_FOUND = 0xC00E0003,
  MQ_ERROR_QUEUE_EXISTS = 0xC00E0005,
  MQ_ERROR_INVALID_PARAMETER = 0xC00E0006,
  MQ_ERROR_INVALID_HANDLE = 0xC00E0007,
  MQ_ERROR_OPERATION_CANCELLED = 0xC00E0008,
  MQ_ERROR_SHARING_VIOLATION = 0xC00E0009,
  MQ_ERROR_SERVICE_NOT_AVAILABLE = 0xC00E000B,
  MQ_ERROR_MACHINE_NOT_FOUND = 0xC00E000D,
  MQ_ERROR_ILLEGAL_SORT = 0xC00E0010,
  MQ_ERROR_ILLEGAL_USER = 0xC00E0011,
  MQ_ERROR_UNSUPPORTED_DBMS = 0xC00E0012,
  MQ_ERROR_NO_DS = 0xC00E0013,
  MQ_ERROR_ILLEGAL_QUEUE_PATHNAME = 0xC00E0014,
  MQ_ERROR_ILLEGAL_PROPERTY_VALUE = 0xC00E0018,
  MQ_ERROR_ILLEGAL_PROPERTY_VT = 0xC00E0019,
  MQ_ERROR_BUFFER_OVERFLOW = 0xC00E001A,
  MQ_ERROR_IO_TIMEOUT = 0xC00E001B,
  MQ_ERROR_ILLEGAL_CURSOR_ACTION = 0xC00E001C,
  MQ_ERROR_MESSAGE_ALREADY_RECEIVED = 0xC00E001D,
  MQ_ERROR_ILLEGAL_FORMATNAME = 0xC00E001E,
  MQ_ERROR_FORMATNAME_BUFFER_TOO_SMALL = 0xC00E001F,
  MQ_ERROR_UNSUPPORTED_FORMATNAME_OPERATION = 0xC00E0020,
  MQ_ERROR_ILLEGAL_SECURITY_DESCRIPTOR = 0xC00E0021,
  MQ_ERROR_SENDERID_BUFFER_TOO_SMALL = 0xC00E0022,
  MQ_ERROR_SECURITY_DESCRIPTOR_TOO_SMALL = 0xC00E0023,
  MQ_ERROR_CANNOT_IMPERSONATE_CLIENT = 0xC00E0024,
  MQ_ERROR_ACCESS_DENIED = 0xC00E0025,
  MQ_ERROR_PRIVILEGE_NOT_HELD = 0xC00E0026,
  MQ_ERROR_INSUFFICIENT_RESOURCES = 0xC00E0027,
  MQ_ERROR_USER_BUFFER_TOO_SMALL = 0xC00E0028,
  MQ_ERROR_MESSAGE_STORAGE_FAILED = 0xC00E002A,
  MQ_ERROR_SENDER_CERT_BUFFER_TOO_SMALL = 0xC00E002B,
  MQ_ERROR_INVALID_CERTIFICATE = 0xC00E002C,
  MQ_ERROR_CORRUPTED_INTERNAL_CERTIFICATE = 0xC00E002D,
  MQ_ERROR_INTERNAL_USER_CERT_EXIST = 0xC00E002E,
  MQ_ERROR_NO_INTERNAL_USER_CERT = 0xC00E002F,
  MQ_ERROR_CORRUPTED_SECURITY_DATA = 0xC00E0030,
  MQ_ERROR_CORRUPTED_PERSONAL_CERT_STORE = 0xC00E0031,
  MQ_ERROR_COMPUTER_DOES_NOT_SUPPORT_ENCRYPTION = 0xC00E0033,
  MQ_ERROR_BAD_SECURITY_CONTEXT = 0xC00E0035,
  MQ_ERROR_COULD_NOT_GET_USER_SID = 0xC00E0036,
  MQ_ERROR_COULD_NOT_GET_ACCOUNT_INFO = 0xC00E0037,
  MQ_ERROR_ILLEGAL_MQCOLUMNS = 0xC00E0038,
  MQ_ERROR_ILLEGAL_PROPID = 0xC00E0039,
  MQ_ERROR_ILLEGAL_RELATION = 0xC00E003A,
  MQ_ERROR_ILLEGAL_PROPERTY_SIZE = 0xC00E003B,
  MQ_ERROR_ILLEGAL_RESTRICTION_PROPID = 0xC00E003C,
  MQ_ERROR_ILLEGAL_MQQUEUEPROPS = 0xC00E003D,
  MQ_ERROR_PROPERTY_NOTALLOWED = 0xC00E003E,
  MQ_ERROR_INSUFFICIENT_PROPERTIES = 0xC00E003F,
  MQ_ERROR_MACHINE_EXISTS = 0xC00E0040,
  MQ_ERROR_ILLEGAL_MQQMPROPS = 0xC00E0041,
  MQ_ERROR_DS_IS_FULL = 0xC00E0042,
  MQ_ERROR_DS_ERROR = 0xC00E0043,
  MQ_ERROR_INVALID_OWNER = 0xC00E0044,
  MQ_ERROR_UNSUPPORTED_ACCESS_MODE = 0xC00E0045,
  MQ_ERROR_RESULT_BUFFER_TOO_SMALL = 0xC00E0046,
  MQ_ERROR_DELETE_CN_IN_USE = 0xC00E0048,
  MQ_ERROR_NO_RESPONSE_FROM_OBJECT_SERVER = 0xC00E0049,
  MQ_ERROR_OBJECT_SERVER_NOT_AVAILABLE = 0xC00E004A,
  MQ_ERROR_QUEUE_NOT_AVAILABLE = 0xC00E004B,
  MQ_ERROR_DTC_CONNECT = 0xC00E004C,
  MQ_ERROR_TRANSACTION_IMPORT = 0xC00E004E,
  MQ_ERROR_TRANSACTION_USAGE = 0xC00E0050,
  MQ_ERROR_TRANSACTION_SEQUENCE = 0xC00E0051,
  MQ_ERROR_MISSING_CONNECTOR_TYPE = 0xC00E0055,
  MQ_ERROR_STALE_HANDLE = 0xC00E0056,
  MQ_ERROR_TRANSACTION_ENLIST = 0xC00E0058,
  MQ_ERROR_QUEUE_DELETED = 0xC00E005A,
  MQ_ERROR_ILLEGAL_CONTEXT = 0xC00E005B,
  MQ_ERROR_ILLEGAL_SORT_PROPID = 0xC00E005C,
  MQ_ERROR_LABEL_TOO_LONG = 0xC00E005D,
  MQ_ERROR_LABEL_BUFFER_TOO_SMALL = 0xC00E005E,
  MQ_ERROR_MQIS_SERVER_EMPTY = 0xC00E005F,
  MQ_ERROR_MQIS_READONLY_MODE = 0xC00E0060,
  MQ_ERROR_SYMM_KEY_BUFFER_TOO_SMALL = 0xC00E0061,
  MQ_ERROR_SIGNATURE_BUFFER_TOO_SMALL = 0xC00E0062,
  MQ_ERROR_PROV_NAME_BUFFER_TOO_SMALL = 0xC00E0063,
  MQ_ERROR_ILLEGAL_OPERATION = 0xC00E0064,
  MQ_ERROR_WRITE_NOT_ALLOWED = 0xC00E0065,
}

enum MQWARNING {
  MQ_INFORMATION_PROPERTY = 0x400E0001,
  MQ_INFORMATION_ILLEGAL_PROPERTY = 0x400E0002,
  MQ_INFORMATION_PROPERTY_IGNORED = 0x400E0003,
  MQ_INFORMATION_UNSUPPORTED_PROPERTY = 0x400E0004,
  MQ_INFORMATION_DUPLICATE_PROPERTY = 0x400E0005,
  MQ_INFORMATION_OPERATION_PENDING = 0x400E0006,
  MQ_INFORMATION_FORMATNAME_BUFFER_TOO_SMALL = 0x400E0009,
}

// Structs

struct MQBOID {
  ubyte[16] rgb;
}

struct MQXACTTRANSINFO {
  MQBOID uow;
  int isoLevel;
  uint isoFlags;
  uint grfTCSupported;
  uint grfRMSupported;
  uint grfTCSupportedRetaining;
  uint grfRMSupportedRetaining;
}

// Interfaces

interface IMSMQQuery : IDispatch {
  mixin(uuid("d7d6e072-dccd-11d0-aa4b-0060970debae"));
  // static DWINGUID IID = { 0xd7d6e072, 0xdccd, 0x11d0, 0xaa, 0x4b, 0x00, 0x60, 0x97, 0x0d, 0xeb, 0xae };
  /*[id(0x60020000)]*/ int LookupQueue(DWINVARIANT* QueueGuid, DWINVARIANT* ServiceTypeGuid, DWINVARIANT* Label, DWINVARIANT* CreateTime, DWINVARIANT* ModifyTime, DWINVARIANT* RelServiceType, DWINVARIANT* RelLabel, DWINVARIANT* RelCreateTime, DWINVARIANT* RelModifyTime, out IMSMQQueueInfos ppqinfos);
}

interface IMSMQQueueInfos : IDispatch {
  mixin(uuid("d7d6e07d-dccd-11d0-aa4b-0060970debae"));
  // static DWINGUID IID = { 0xd7d6e07d, 0xdccd, 0x11d0, 0xaa, 0x4b, 0x00, 0x60, 0x97, 0x0d, 0xeb, 0xae };
  /*[id(0x60020000)]*/ int Reset();
  /*[id(0x60020001)]*/ int Next(out IMSMQQueueInfo ppqinfoNext);
}

interface IMSMQQueueInfo : IDispatch {
  mixin(uuid("d7d6e07b-dccd-11d0-aa4b-0060970debae"));
  // static DWINGUID IID = { 0xd7d6e07b, 0xdccd, 0x11d0, 0xaa, 0x4b, 0x00, 0x60, 0x97, 0x0d, 0xeb, 0xae };
  /*[id(0x00000000)]*/ int get_QueueGuid(out wchar* pbstrGuidQueue);
  /*[id(0x00000001)]*/ int get_ServiceTypeGuid(out wchar* pbstrGuidServiceType);
  /*[id(0x00000001)]*/ int set_ServiceTypeGuid(wchar* pbstrGuidServiceType);
  /*[id(0x00000002)]*/ int get_Label(out wchar* pbstrLabel);
  /*[id(0x00000002)]*/ int set_Label(wchar* pbstrLabel);
  /*[id(0x00000003)]*/ int get_PathName(out wchar* pbstrPathName);
  /*[id(0x00000003)]*/ int set_PathName(wchar* pbstrPathName);
  /*[id(0x00000005)]*/ int get_FormatName(out wchar* pbstrFormatName);
  /*[id(0x00000005)]*/ int set_FormatName(wchar* pbstrFormatName);
  /*[id(0x00000006)]*/ int get_IsTransactional(out short pisTransactional);
  /*[id(0x00000007)]*/ int get_PrivLevel(out int plPrivLevel);
  /*[id(0x00000007)]*/ int set_PrivLevel(int plPrivLevel);
  /*[id(0x00000008)]*/ int get_Journal(out int plJournal);
  /*[id(0x00000008)]*/ int set_Journal(int plJournal);
  /*[id(0x0000000D)]*/ int get_Quota(out int plQuota);
  /*[id(0x0000000D)]*/ int set_Quota(int plQuota);
  /*[id(0x00000009)]*/ int get_BasePriority(out int plBasePriority);
  /*[id(0x00000009)]*/ int set_BasePriority(int plBasePriority);
  /*[id(0x0000000A)]*/ int get_CreateTime(out DWINVARIANT pvarCreateTime);
  /*[id(0x0000000B)]*/ int get_ModifyTime(out DWINVARIANT pvarModifyTime);
  /*[id(0x0000000C)]*/ int get_Authenticate(out int plAuthenticate);
  /*[id(0x0000000C)]*/ int set_Authenticate(int plAuthenticate);
  /*[id(0x0000000E)]*/ int get_JournalQuota(out int plJournalQuota);
  /*[id(0x0000000E)]*/ int set_JournalQuota(int plJournalQuota);
  /*[id(0x0000000F)]*/ int get_IsWorldReadable(out short pisWorldReadable);
  /*[id(0x60020019)]*/ int Create(DWINVARIANT* IsTransactional, DWINVARIANT* IsWorldReadable);
  /*[id(0x6002001A)]*/ int Delete();
  /*[id(0x6002001B)]*/ int Open(int Access, int ShareMode, out IMSMQQueue ppq);
  /*[id(0x6002001C)]*/ int Refresh();
  /*[id(0x6002001D)]*/ int Update();
}

interface IMSMQQueue : IDispatch {
  mixin(uuid("d7d6e076-dccd-11d0-aa4b-0060970debae"));
  // static DWINGUID IID = { 0xd7d6e076, 0xdccd, 0x11d0, 0xaa, 0x4b, 0x00, 0x60, 0x97, 0x0d, 0xeb, 0xae };
  /*[id(0x00000001)]*/ int get_Access(out int plAccess);
  /*[id(0x00000002)]*/ int get_ShareMode(out int plShareMode);
  /*[id(0x00000003)]*/ int get_QueueInfo(out IMSMQQueueInfo ppqinfo);
  /*[id(0x00000000)]*/ int get_Handle(out int plHandle);
  /*[id(0x00000004)]*/ int get_IsOpen(out short pisOpen);
  /*[id(0x60020005)]*/ int Close();
  /*[id(0x60020006)]*/ int Receive(DWINVARIANT* Transaction, DWINVARIANT* WantDestinationQueue, DWINVARIANT* WantBody, DWINVARIANT* ReceiveTimeout, out IMSMQMessage ppmsg);
  /*[id(0x60020007)]*/ int Peek(DWINVARIANT* WantDestinationQueue, DWINVARIANT* WantBody, DWINVARIANT* ReceiveTimeout, out IMSMQMessage ppmsg);
  /*[id(0x60020008)]*/ int EnableNotification(IMSMQEvent Event, DWINVARIANT* Cursor, DWINVARIANT* ReceiveTimeout);
  /*[id(0x60020009)]*/ int Reset();
  /*[id(0x6002000A)]*/ int ReceiveCurrent(DWINVARIANT* Transaction, DWINVARIANT* WantDestinationQueue, DWINVARIANT* WantBody, DWINVARIANT* ReceiveTimeout, out IMSMQMessage ppmsg);
  /*[id(0x6002000B)]*/ int PeekNext(DWINVARIANT* WantDestinationQueue, DWINVARIANT* WantBody, DWINVARIANT* ReceiveTimeout, out IMSMQMessage ppmsg);
  /*[id(0x6002000C)]*/ int PeekCurrent(DWINVARIANT* WantDestinationQueue, DWINVARIANT* WantBody, DWINVARIANT* ReceiveTimeout, out IMSMQMessage ppmsg);
}

interface IMSMQMessage : IDispatch {
  mixin(uuid("d7d6e074-dccd-11d0-aa4b-0060970debae"));
  // static DWINGUID IID = { 0xd7d6e074, 0xdccd, 0x11d0, 0xaa, 0x4b, 0x00, 0x60, 0x97, 0x0d, 0xeb, 0xae };
  /*[id(0x00000007)]*/ int get_Class(out int plClass);
  /*[id(0x00000019)]*/ int get_PrivLevel(out int plPrivLevel);
  /*[id(0x00000019)]*/ int set_PrivLevel(int plPrivLevel);
  /*[id(0x0000001A)]*/ int get_AuthLevel(out int plAuthLevel);
  /*[id(0x0000001A)]*/ int set_AuthLevel(int plAuthLevel);
  /*[id(0x0000001B)]*/ int get_IsAuthenticated(out short pisAuthenticated);
  /*[id(0x00000001)]*/ int get_Delivery(out int plDelivery);
  /*[id(0x00000001)]*/ int set_Delivery(int plDelivery);
  /*[id(0x00000018)]*/ int get_Trace(out int plTrace);
  /*[id(0x00000018)]*/ int set_Trace(int plTrace);
  /*[id(0x00000002)]*/ int get_Priority(out int plPriority);
  /*[id(0x00000002)]*/ int set_Priority(int plPriority);
  /*[id(0x00000003)]*/ int get_Journal(out int plJournal);
  /*[id(0x00000003)]*/ int set_Journal(int plJournal);
  /*[id(0x00000004)]*/ int get_ResponseQueueInfo(out IMSMQQueueInfo ppqinfoResponse);
  /*[id(0x00000004)]*/ int setref_ResponseQueueInfo(IMSMQQueueInfo ppqinfoResponse);
  /*[id(0x00000005)]*/ int get_AppSpecific(out int plAppSpecific);
  /*[id(0x00000005)]*/ int set_AppSpecific(int plAppSpecific);
  /*[id(0x00000006)]*/ int get_SourceMachineGuid(out wchar* pbstrGuidSrcMachine);
  /*[id(0x0000000D)]*/ int get_BodyLength(out int pcbBody);
  /*[id(0x00000000)]*/ int get_Body(out DWINVARIANT pvarBody);
  /*[id(0x00000000)]*/ int set_Body(DWINVARIANT pvarBody);
  /*[id(0x00000008)]*/ int get_AdminQueueInfo(out IMSMQQueueInfo ppqinfoAdmin);
  /*[id(0x00000008)]*/ int setref_AdminQueueInfo(IMSMQQueueInfo ppqinfoAdmin);
  /*[id(0x00000009)]*/ int get_Id(out DWINVARIANT pvarMsgId);
  /*[id(0x0000000A)]*/ int get_CorrelationId(out DWINVARIANT pvarMsgId);
  /*[id(0x0000000A)]*/ int set_CorrelationId(DWINVARIANT pvarMsgId);
  /*[id(0x0000000B)]*/ int get_Ack(out int plAck);
  /*[id(0x0000000B)]*/ int set_Ack(int plAck);
  /*[id(0x0000000C)]*/ int get_Label(out wchar* pbstrLabel);
  /*[id(0x0000000C)]*/ int set_Label(wchar* pbstrLabel);
  /*[id(0x0000000E)]*/ int get_MaxTimeToReachQueue(out int plMaxTimeToReachQueue);
  /*[id(0x0000000E)]*/ int set_MaxTimeToReachQueue(int plMaxTimeToReachQueue);
  /*[id(0x0000000F)]*/ int get_MaxTimeToReceive(out int plMaxTimeToReceive);
  /*[id(0x0000000F)]*/ int set_MaxTimeToReceive(int plMaxTimeToReceive);
  /*[id(0x00000011)]*/ int get_HashAlgorithm(out int plHashAlg);
  /*[id(0x00000011)]*/ int set_HashAlgorithm(int plHashAlg);
  /*[id(0x00000010)]*/ int get_EncryptAlgorithm(out int plEncryptAlg);
  /*[id(0x00000010)]*/ int set_EncryptAlgorithm(int plEncryptAlg);
  /*[id(0x00000012)]*/ int get_SentTime(out DWINVARIANT pvarSentTime);
  /*[id(0x00000013)]*/ int get_ArrivedTime(out DWINVARIANT plArrivedTime);
  /*[id(0x00000014)]*/ int get_DestinationQueueInfo(out IMSMQQueueInfo ppqinfoDest);
  /*[id(0x00000015)]*/ int get_SenderCertificate(out DWINVARIANT pvarSenderCert);
  /*[id(0x00000015)]*/ int set_SenderCertificate(DWINVARIANT pvarSenderCert);
  /*[id(0x00000016)]*/ int get_SenderId(out DWINVARIANT pvarSenderId);
  /*[id(0x00000017)]*/ int get_SenderIdType(out int plSenderIdType);
  /*[id(0x00000017)]*/ int set_SenderIdType(int plSenderIdType);
  /*[id(0x6002002F)]*/ int Send(IMSMQQueue DestinationQueue, DWINVARIANT* Transaction);
  /*[id(0x60020030)]*/ int AttachCurrentSecurityContext();
}

interface IMSMQEvent : IDispatch {
  mixin(uuid("d7d6e077-dccd-11d0-aa4b-0060970debae"));
  // static DWINGUID IID = { 0xd7d6e077, 0xdccd, 0x11d0, 0xaa, 0x4b, 0x00, 0x60, 0x97, 0x0d, 0xeb, 0xae };
}

interface IMSMQTransaction : IDispatch {
  mixin(uuid("d7d6e07f-dccd-11d0-aa4b-0060970debae"));
  // static DWINGUID IID = { 0xd7d6e07f, 0xdccd, 0x11d0, 0xaa, 0x4b, 0x00, 0x60, 0x97, 0x0d, 0xeb, 0xae };
  /*[id(0x00000000)]*/ int get_Transaction(out int plTransaction);
  /*[id(0x60020001)]*/ int Commit(DWINVARIANT* fRetaining, DWINVARIANT* grfTC, DWINVARIANT* grfRM);
  /*[id(0x60020002)]*/ int Abort(DWINVARIANT* fRetaining, DWINVARIANT* fAsync);
}

interface IMSMQCoordinatedTransactionDispenser : IDispatch {
  mixin(uuid("d7d6e081-dccd-11d0-aa4b-0060970debae"));
  // static DWINGUID IID = { 0xd7d6e081, 0xdccd, 0x11d0, 0xaa, 0x4b, 0x00, 0x60, 0x97, 0x0d, 0xeb, 0xae };
  /*[id(0x60020000)]*/ int BeginTransaction(out IMSMQTransaction ptransaction);
}

interface IMSMQTransactionDispenser : IDispatch {
  mixin(uuid("d7d6e083-dccd-11d0-aa4b-0060970debae"));
  // static DWINGUID IID = { 0xd7d6e083, 0xdccd, 0x11d0, 0xaa, 0x4b, 0x00, 0x60, 0x97, 0x0d, 0xeb, 0xae };
  /*[id(0x60020000)]*/ int BeginTransaction(out IMSMQTransaction ptransaction);
}

interface IMSMQPrivateEvent : IDispatch {
  mixin(uuid("d7ab3341-c9d3-11d1-bb47-0080c7c5a2c0"));
  // static DWINGUID IID = { 0xd7ab3341, 0xc9d3, 0x11d1, 0xbb, 0x47, 0x00, 0x80, 0xc7, 0xc5, 0xa2, 0xc0 };
  /*[id(0x60020000)]*/ int get_Hwnd(out int phwnd);
  /*[id(0x60020001)]*/ int FireArrivedEvent(IMSMQQueue pq, int msgcursor);
  /*[id(0x60020002)]*/ int FireArrivedErrorEvent(IMSMQQueue pq, int hrStatus, int msgcursor);
}

interface _DMSMQEventEvents : IDispatch {
  mixin(uuid("d7d6e078-dccd-11d0-aa4b-0060970debae"));
  // static DWINGUID IID = { 0xd7d6e078, 0xdccd, 0x11d0, 0xaa, 0x4b, 0x00, 0x60, 0x97, 0x0d, 0xeb, 0xae };
  /+/*[id(0x00000000)]*/ void Arrived(IDispatch Queue, int Cursor);+/
  /+/*[id(0x00000001)]*/ void ArrivedError(IDispatch Queue, int ErrorCode, int Cursor);+/
}

interface IMSMQApplication : IDispatch {
  mixin(uuid("d7d6e085-dccd-11d0-aa4b-0060970debae"));
  // static DWINGUID IID = { 0xd7d6e085, 0xdccd, 0x11d0, 0xaa, 0x4b, 0x00, 0x60, 0x97, 0x0d, 0xeb, 0xae };
  /*[id(0x60020000)]*/ int MachineIdOfMachineName(wchar* MachineName, out wchar* pbstrGuid);
}

// CoClasses

abstract class MSMQQuery {
  mixin(uuid("d7d6e073-dccd-11d0-aa4b-0060970debae"));
  // static DWINGUID CLSID = { 0xd7d6e073, 0xdccd, 0x11d0, 0xaa, 0x4b, 0x00, 0x60, 0x97, 0x0d, 0xeb, 0xae };
  mixin Interfaces!(IMSMQQuery);
}

abstract class MSMQMessage {
  mixin(uuid("d7d6e075-dccd-11d0-aa4b-0060970debae"));
  // static DWINGUID CLSID = { 0xd7d6e075, 0xdccd, 0x11d0, 0xaa, 0x4b, 0x00, 0x60, 0x97, 0x0d, 0xeb, 0xae };
  mixin Interfaces!(IMSMQMessage);
}

abstract class MSMQQueue {
  mixin(uuid("d7d6e079-dccd-11d0-aa4b-0060970debae"));
  // static DWINGUID CLSID = { 0xd7d6e079, 0xdccd, 0x11d0, 0xaa, 0x4b, 0x00, 0x60, 0x97, 0x0d, 0xeb, 0xae };
  mixin Interfaces!(IMSMQQueue);
}

abstract class MSMQEvent {
  mixin(uuid("d7d6e07a-dccd-11d0-aa4b-0060970debae"));
  // static DWINGUID CLSID = { 0xd7d6e07a, 0xdccd, 0x11d0, 0xaa, 0x4b, 0x00, 0x60, 0x97, 0x0d, 0xeb, 0xae };
  mixin Interfaces!(IMSMQEvent, IMSMQPrivateEvent);
}

abstract class MSMQQueueInfo {
  mixin(uuid("d7d6e07c-dccd-11d0-aa4b-0060970debae"));
  // static DWINGUID CLSID = { 0xd7d6e07c, 0xdccd, 0x11d0, 0xaa, 0x4b, 0x00, 0x60, 0x97, 0x0d, 0xeb, 0xae };
  mixin Interfaces!(IMSMQQueueInfo);
}

abstract class MSMQQueueInfos {
  mixin(uuid("d7d6e07e-dccd-11d0-aa4b-0060970debae"));
  // static DWINGUID CLSID = { 0xd7d6e07e, 0xdccd, 0x11d0, 0xaa, 0x4b, 0x00, 0x60, 0x97, 0x0d, 0xeb, 0xae };
  mixin Interfaces!(IMSMQQueueInfos);
}

abstract class MSMQTransaction {
  mixin(uuid("d7d6e080-dccd-11d0-aa4b-0060970debae"));
  // static DWINGUID CLSID = { 0xd7d6e080, 0xdccd, 0x11d0, 0xaa, 0x4b, 0x00, 0x60, 0x97, 0x0d, 0xeb, 0xae };
  mixin Interfaces!(IMSMQTransaction);
}

abstract class MSMQCoordinatedTransactionDispenser {
  mixin(uuid("d7d6e082-dccd-11d0-aa4b-0060970debae"));
  // static DWINGUID CLSID = { 0xd7d6e082, 0xdccd, 0x11d0, 0xaa, 0x4b, 0x00, 0x60, 0x97, 0x0d, 0xeb, 0xae };
  mixin Interfaces!(IMSMQCoordinatedTransactionDispenser);
}

abstract class MSMQTransactionDispenser {
  mixin(uuid("d7d6e084-dccd-11d0-aa4b-0060970debae"));
  // static DWINGUID CLSID = { 0xd7d6e084, 0xdccd, 0x11d0, 0xaa, 0x4b, 0x00, 0x60, 0x97, 0x0d, 0xeb, 0xae };
  mixin Interfaces!(IMSMQTransactionDispenser);
}

abstract class MSMQApplication {
  mixin(uuid("d7d6e086-dccd-11d0-aa4b-0060970debae"));
  // static DWINGUID CLSID = { 0xd7d6e086, 0xdccd, 0x11d0, 0xaa, 0x4b, 0x00, 0x60, 0x97, 0x0d, 0xeb, 0xae };
  mixin Interfaces!(IMSMQApplication);
}
