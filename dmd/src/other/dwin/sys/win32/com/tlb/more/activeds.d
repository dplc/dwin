// Active DS Type Library
// Version 1.0

/*[uuid("97d25db0-0363-11cf-abc4-02608c9e7553")]*/
module dwin.sys.win32.com.tlb.more.more.activeds;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum __MIDL___MIDL_itf_ads_0000_0001 {
  ADSTYPE_INVALID = 0x00000000,
  ADSTYPE_DN_STRING = 0x00000001,
  ADSTYPE_CASE_EXACT_STRING = 0x00000002,
  ADSTYPE_CASE_IGNORE_STRING = 0x00000003,
  ADSTYPE_PRINTABLE_STRING = 0x00000004,
  ADSTYPE_NUMERIC_STRING = 0x00000005,
  ADSTYPE_BOOLEAN = 0x00000006,
  ADSTYPE_INTEGER = 0x00000007,
  ADSTYPE_OCTET_STRING = 0x00000008,
  ADSTYPE_UTC_TIME = 0x00000009,
  ADSTYPE_LARGE_INTEGER = 0x0000000A,
  ADSTYPE_PROV_SPECIFIC = 0x0000000B,
  ADSTYPE_OBJECT_CLASS = 0x0000000C,
  ADSTYPE_CASEIGNORE_LIST = 0x0000000D,
  ADSTYPE_OCTET_LIST = 0x0000000E,
  ADSTYPE_PATH = 0x0000000F,
  ADSTYPE_POSTALADDRESS = 0x00000010,
  ADSTYPE_TIMESTAMP = 0x00000011,
  ADSTYPE_BACKLINK = 0x00000012,
  ADSTYPE_TYPEDNAME = 0x00000013,
  ADSTYPE_HOLD = 0x00000014,
  ADSTYPE_NETADDRESS = 0x00000015,
  ADSTYPE_REPLICAPOINTER = 0x00000016,
  ADSTYPE_FAXNUMBER = 0x00000017,
  ADSTYPE_EMAIL = 0x00000018,
  ADSTYPE_NT_SECURITY_DESCRIPTOR = 0x00000019,
  ADSTYPE_UNKNOWN = 0x0000001A,
  ADSTYPE_DN_WITH_BINARY = 0x0000001B,
  ADSTYPE_DN_WITH_STRING = 0x0000001C,
}

enum __MIDL___MIDL_itf_ads_0000_0018 {
  ADS_SECURE_AUTHENTICATION = 0x00000001,
  ADS_USE_ENCRYPTION = 0x00000002,
  ADS_USE_SSL = 0x00000002,
  ADS_READONLY_SERVER = 0x00000004,
  ADS_PROMPT_CREDENTIALS = 0x00000008,
  ADS_NO_AUTHENTICATION = 0x00000010,
  ADS_FAST_BIND = 0x00000020,
  ADS_USE_SIGNING = 0x00000040,
  ADS_USE_SEALING = 0x00000080,
  ADS_USE_DELEGATION = 0x00000100,
  ADS_SERVER_BIND = 0x00000200,
  ADS_AUTH_RESERVED = 0x80000000,
}

enum __MIDL___MIDL_itf_ads_0000_0019 {
  ADS_STATUS_S_OK = 0x00000000,
  ADS_STATUS_INVALID_SEARCHPREF = 0x00000001,
  ADS_STATUS_INVALID_SEARCHPREFVALUE = 0x00000002,
}

enum __MIDL___MIDL_itf_ads_0000_0020 {
  ADS_DEREF_NEVER = 0x00000000,
  ADS_DEREF_SEARCHING = 0x00000001,
  ADS_DEREF_FINDING = 0x00000002,
  ADS_DEREF_ALWAYS = 0x00000003,
}

enum __MIDL___MIDL_itf_ads_0000_0021 {
  ADS_SCOPE_BASE = 0x00000000,
  ADS_SCOPE_ONELEVEL = 0x00000001,
  ADS_SCOPE_SUBTREE = 0x00000002,
}

enum __MIDL___MIDL_itf_ads_0000_0022 {
  ADSIPROP_ASYNCHRONOUS = 0x00000000,
  ADSIPROP_DEREF_ALIASES = 0x00000001,
  ADSIPROP_SIZE_LIMIT = 0x00000002,
  ADSIPROP_TIME_LIMIT = 0x00000003,
  ADSIPROP_ATTRIBTYPES_ONLY = 0x00000004,
  ADSIPROP_SEARCH_SCOPE = 0x00000005,
  ADSIPROP_TIMEOUT = 0x00000006,
  ADSIPROP_PAGESIZE = 0x00000007,
  ADSIPROP_PAGED_TIME_LIMIT = 0x00000008,
  ADSIPROP_CHASE_REFERRALS = 0x00000009,
  ADSIPROP_SORT_ON = 0x0000000A,
  ADSIPROP_CACHE_RESULTS = 0x0000000B,
  ADSIPROP_ADSIFLAG = 0x0000000C,
}

enum __MIDL___MIDL_itf_ads_0000_0023 {
  ADSI_DIALECT_LDAP = 0x00000000,
  ADSI_DIALECT_SQL = 0x00000001,
}

enum __MIDL___MIDL_itf_ads_0000_0024 {
  ADS_CHASE_REFERRALS_NEVER = 0x00000000,
  ADS_CHASE_REFERRALS_SUBORDINATE = 0x00000020,
  ADS_CHASE_REFERRALS_EXTERNAL = 0x00000040,
  ADS_CHASE_REFERRALS_ALWAYS = 0x00000060,
}

enum __MIDL___MIDL_itf_ads_0000_0025 {
  ADS_SEARCHPREF_ASYNCHRONOUS = 0x00000000,
  ADS_SEARCHPREF_DEREF_ALIASES = 0x00000001,
  ADS_SEARCHPREF_SIZE_LIMIT = 0x00000002,
  ADS_SEARCHPREF_TIME_LIMIT = 0x00000003,
  ADS_SEARCHPREF_ATTRIBTYPES_ONLY = 0x00000004,
  ADS_SEARCHPREF_SEARCH_SCOPE = 0x00000005,
  ADS_SEARCHPREF_TIMEOUT = 0x00000006,
  ADS_SEARCHPREF_PAGESIZE = 0x00000007,
  ADS_SEARCHPREF_PAGED_TIME_LIMIT = 0x00000008,
  ADS_SEARCHPREF_CHASE_REFERRALS = 0x00000009,
  ADS_SEARCHPREF_SORT_ON = 0x0000000A,
  ADS_SEARCHPREF_CACHE_RESULTS = 0x0000000B,
  ADS_SEARCHPREF_DIRSYNC = 0x0000000C,
  ADS_SEARCHPREF_TOMBSTONE = 0x0000000D,
  ADS_SEARCHPREF_VLV = 0x0000000E,
  ADS_SEARCHPREF_ATTRIBUTE_QUERY = 0x0000000F,
  ADS_SEARCHPREF_SECURITY_MASK = 0x00000010,
}

enum __MIDL___MIDL_itf_ads_0000_0026 {
  ADS_PROPERTY_CLEAR = 0x00000001,
  ADS_PROPERTY_UPDATE = 0x00000002,
  ADS_PROPERTY_APPEND = 0x00000003,
  ADS_PROPERTY_DELETE = 0x00000004,
}

enum tagTYPEKIND {
  TKIND_ENUM = 0x00000000,
  TKIND_RECORD = 0x00000001,
  TKIND_MODULE = 0x00000002,
  TKIND_INTERFACE = 0x00000003,
  TKIND_DISPATCH = 0x00000004,
  TKIND_COCLASS = 0x00000005,
  TKIND_ALIAS = 0x00000006,
  TKIND_UNION = 0x00000007,
  TKIND_MAX = 0x00000008,
}

enum tagDESCKIND {
  DESCKIND_NONE = 0x00000000,
  DESCKIND_FUNCDESC = 0x00000001,
  DESCKIND_VARDESC = 0x00000002,
  DESCKIND_TYPECOMP = 0x00000003,
  DESCKIND_IMPLICITAPPOBJ = 0x00000004,
  DESCKIND_MAX = 0x00000005,
}

enum tagFUNCKIND {
  FUNC_VIRTUAL = 0x00000000,
  FUNC_PUREVIRTUAL = 0x00000001,
  FUNC_NONVIRTUAL = 0x00000002,
  FUNC_STATIC = 0x00000003,
  FUNC_DISPATCH = 0x00000004,
}

enum tagINVOKEKIND {
  INVOKE_FUNC = 0x00000001,
  INVOKE_PROPERTYGET = 0x00000002,
  INVOKE_PROPERTYPUT = 0x00000004,
  INVOKE_PROPERTYPUTREF = 0x00000008,
}

enum tagCALLCONV {
  CC_FASTCALL = 0x00000000,
  CC_CDECL = 0x00000001,
  CC_MSCPASCAL = 0x00000002,
  CC_PASCAL = 0x00000002,
  CC_MACPASCAL = 0x00000003,
  CC_STDCALL = 0x00000004,
  CC_FPFASTCALL = 0x00000005,
  CC_SYSCALL = 0x00000006,
  CC_MPWCDECL = 0x00000007,
  CC_MPWPASCAL = 0x00000008,
  CC_MAX = 0x00000009,
}

enum tagVARKIND {
  VAR_PERINSTANCE = 0x00000000,
  VAR_STATIC = 0x00000001,
  VAR_CONST = 0x00000002,
  VAR_DISPATCH = 0x00000003,
}

enum tagSYSKIND {
  SYS_WIN16 = 0x00000000,
  SYS_WIN32 = 0x00000001,
  SYS_MAC = 0x00000002,
  SYS_WIN64 = 0x00000003,
}

enum __MIDL___MIDL_itf_ads_0125_0001 {
  ADS_SYSTEMFLAG_DISALLOW_DELETE = 0x80000000,
  ADS_SYSTEMFLAG_CONFIG_ALLOW_RENAME = 0x40000000,
  ADS_SYSTEMFLAG_CONFIG_ALLOW_MOVE = 0x20000000,
  ADS_SYSTEMFLAG_CONFIG_ALLOW_LIMITED_MOVE = 0x10000000,
  ADS_SYSTEMFLAG_DOMAIN_DISALLOW_RENAME = 0x08000000,
  ADS_SYSTEMFLAG_DOMAIN_DISALLOW_MOVE = 0x04000000,
  ADS_SYSTEMFLAG_CR_NTDS_NC = 0x00000001,
  ADS_SYSTEMFLAG_CR_NTDS_DOMAIN = 0x00000002,
  ADS_SYSTEMFLAG_ATTR_NOT_REPLICATED = 0x00000001,
  ADS_SYSTEMFLAG_ATTR_IS_CONSTRUCTED = 0x00000004,
}

enum __MIDL___MIDL_itf_ads_0131_0001 {
  ADS_GROUP_TYPE_GLOBAL_GROUP = 0x00000002,
  ADS_GROUP_TYPE_DOMAIN_LOCAL_GROUP = 0x00000004,
  ADS_GROUP_TYPE_LOCAL_GROUP = 0x00000004,
  ADS_GROUP_TYPE_UNIVERSAL_GROUP = 0x00000008,
  ADS_GROUP_TYPE_SECURITY_ENABLED = 0x80000000,
}

enum ADS_USER_FLAG {
  ADS_UF_SCRIPT = 0x00000001,
  ADS_UF_ACCOUNTDISABLE = 0x00000002,
  ADS_UF_HOMEDIR_REQUIRED = 0x00000008,
  ADS_UF_LOCKOUT = 0x00000010,
  ADS_UF_PASSWD_NOTREQD = 0x00000020,
  ADS_UF_PASSWD_CANT_CHANGE = 0x00000040,
  ADS_UF_ENCRYPTED_TEXT_PASSWORD_ALLOWED = 0x00000080,
  ADS_UF_TEMP_DUPLICATE_ACCOUNT = 0x00000100,
  ADS_UF_NORMAL_ACCOUNT = 0x00000200,
  ADS_UF_INTERDOMAIN_TRUST_ACCOUNT = 0x00000800,
  ADS_UF_WORKSTATION_TRUST_ACCOUNT = 0x00001000,
  ADS_UF_SERVER_TRUST_ACCOUNT = 0x00002000,
  ADS_UF_DONT_EXPIRE_PASSWD = 0x00010000,
  ADS_UF_MNS_LOGON_ACCOUNT = 0x00020000,
  ADS_UF_SMARTCARD_REQUIRED = 0x00040000,
  ADS_UF_TRUSTED_FOR_DELEGATION = 0x00080000,
  ADS_UF_NOT_DELEGATED = 0x00100000,
  ADS_UF_USE_DES_KEY_ONLY = 0x00200000,
  ADS_UF_DONT_REQUIRE_PREAUTH = 0x00400000,
  ADS_UF_PASSWORD_EXPIRED = 0x00800000,
  ADS_UF_TRUSTED_TO_AUTHENTICATE_FOR_DELEGATION = 0x01000000,
}

enum __MIDL___MIDL_itf_ads_0153_0001 {
  ADS_RIGHT_DELETE = 0x00010000,
  ADS_RIGHT_READ_CONTROL = 0x00020000,
  ADS_RIGHT_WRITE_DAC = 0x00040000,
  ADS_RIGHT_WRITE_OWNER = 0x00080000,
  ADS_RIGHT_SYNCHRONIZE = 0x00100000,
  ADS_RIGHT_ACCESS_SYSTEM_SECURITY = 0x01000000,
  ADS_RIGHT_GENERIC_READ = 0x80000000,
  ADS_RIGHT_GENERIC_WRITE = 0x40000000,
  ADS_RIGHT_GENERIC_EXECUTE = 0x20000000,
  ADS_RIGHT_GENERIC_ALL = 0x10000000,
  ADS_RIGHT_DS_CREATE_CHILD = 0x00000001,
  ADS_RIGHT_DS_DELETE_CHILD = 0x00000002,
  ADS_RIGHT_ACTRL_DS_LIST = 0x00000004,
  ADS_RIGHT_DS_SELF = 0x00000008,
  ADS_RIGHT_DS_READ_PROP = 0x00000010,
  ADS_RIGHT_DS_WRITE_PROP = 0x00000020,
  ADS_RIGHT_DS_DELETE_TREE = 0x00000040,
  ADS_RIGHT_DS_LIST_OBJECT = 0x00000080,
  ADS_RIGHT_DS_CONTROL_ACCESS = 0x00000100,
}

enum __MIDL___MIDL_itf_ads_0153_0002 {
  ADS_ACETYPE_ACCESS_ALLOWED = 0x00000000,
  ADS_ACETYPE_ACCESS_DENIED = 0x00000001,
  ADS_ACETYPE_SYSTEM_AUDIT = 0x00000002,
  ADS_ACETYPE_ACCESS_ALLOWED_OBJECT = 0x00000005,
  ADS_ACETYPE_ACCESS_DENIED_OBJECT = 0x00000006,
  ADS_ACETYPE_SYSTEM_AUDIT_OBJECT = 0x00000007,
  ADS_ACETYPE_SYSTEM_ALARM_OBJECT = 0x00000008,
  ADS_ACETYPE_ACCESS_ALLOWED_CALLBACK = 0x00000009,
  ADS_ACETYPE_ACCESS_DENIED_CALLBACK = 0x0000000A,
  ADS_ACETYPE_ACCESS_ALLOWED_CALLBACK_OBJECT = 0x0000000B,
  ADS_ACETYPE_ACCESS_DENIED_CALLBACK_OBJECT = 0x0000000C,
  ADS_ACETYPE_SYSTEM_AUDIT_CALLBACK = 0x0000000D,
  ADS_ACETYPE_SYSTEM_ALARM_CALLBACK = 0x0000000E,
  ADS_ACETYPE_SYSTEM_AUDIT_CALLBACK_OBJECT = 0x0000000F,
  ADS_ACETYPE_SYSTEM_ALARM_CALLBACK_OBJECT = 0x00000010,
}

enum __MIDL___MIDL_itf_ads_0153_0003 {
  ADS_ACEFLAG_INHERIT_ACE = 0x00000002,
  ADS_ACEFLAG_NO_PROPAGATE_INHERIT_ACE = 0x00000004,
  ADS_ACEFLAG_INHERIT_ONLY_ACE = 0x00000008,
  ADS_ACEFLAG_INHERITED_ACE = 0x00000010,
  ADS_ACEFLAG_VALID_INHERIT_FLAGS = 0x0000001F,
  ADS_ACEFLAG_SUCCESSFUL_ACCESS = 0x00000040,
  ADS_ACEFLAG_FAILED_ACCESS = 0x00000080,
}

enum __MIDL___MIDL_itf_ads_0153_0004 {
  ADS_FLAG_OBJECT_TYPE_PRESENT = 0x00000001,
  ADS_FLAG_INHERITED_OBJECT_TYPE_PRESENT = 0x00000002,
}

enum __MIDL___MIDL_itf_ads_0153_0005 {
  ADS_SD_CONTROL_SE_OWNER_DEFAULTED = 0x00000001,
  ADS_SD_CONTROL_SE_GROUP_DEFAULTED = 0x00000002,
  ADS_SD_CONTROL_SE_DACL_PRESENT = 0x00000004,
  ADS_SD_CONTROL_SE_DACL_DEFAULTED = 0x00000008,
  ADS_SD_CONTROL_SE_SACL_PRESENT = 0x00000010,
  ADS_SD_CONTROL_SE_SACL_DEFAULTED = 0x00000020,
  ADS_SD_CONTROL_SE_DACL_AUTO_INHERIT_REQ = 0x00000100,
  ADS_SD_CONTROL_SE_SACL_AUTO_INHERIT_REQ = 0x00000200,
  ADS_SD_CONTROL_SE_DACL_AUTO_INHERITED = 0x00000400,
  ADS_SD_CONTROL_SE_SACL_AUTO_INHERITED = 0x00000800,
  ADS_SD_CONTROL_SE_DACL_PROTECTED = 0x00001000,
  ADS_SD_CONTROL_SE_SACL_PROTECTED = 0x00002000,
  ADS_SD_CONTROL_SE_SELF_RELATIVE = 0x00008000,
}

enum __MIDL___MIDL_itf_ads_0153_0006 {
  ADS_SD_REVISION_DS = 0x00000004,
}

enum __MIDL___MIDL_itf_ads_0154_0001 {
  ADS_NAME_TYPE_1779 = 0x00000001,
  ADS_NAME_TYPE_CANONICAL = 0x00000002,
  ADS_NAME_TYPE_NT4 = 0x00000003,
  ADS_NAME_TYPE_DISPLAY = 0x00000004,
  ADS_NAME_TYPE_DOMAIN_SIMPLE = 0x00000005,
  ADS_NAME_TYPE_ENTERPRISE_SIMPLE = 0x00000006,
  ADS_NAME_TYPE_GUID = 0x00000007,
  ADS_NAME_TYPE_UNKNOWN = 0x00000008,
  ADS_NAME_TYPE_USER_PRINCIPAL_NAME = 0x00000009,
  ADS_NAME_TYPE_CANONICAL_EX = 0x0000000A,
  ADS_NAME_TYPE_SERVICE_PRINCIPAL_NAME = 0x0000000B,
  ADS_NAME_TYPE_SID_OR_SID_HISTORY_NAME = 0x0000000C,
}

enum __MIDL___MIDL_itf_ads_0154_0002 {
  ADS_NAME_INITTYPE_DOMAIN = 0x00000001,
  ADS_NAME_INITTYPE_SERVER = 0x00000002,
  ADS_NAME_INITTYPE_GC = 0x00000003,
}

enum __MIDL___MIDL_itf_ads_0168_0001 {
  ADS_OPTION_SERVERNAME = 0x00000000,
  ADS_OPTION_REFERRALS = 0x00000001,
  ADS_OPTION_PAGE_SIZE = 0x00000002,
  ADS_OPTION_SECURITY_MASK = 0x00000003,
  ADS_OPTION_MUTUAL_AUTH_STATUS = 0x00000004,
}

enum __MIDL___MIDL_itf_ads_0168_0002 {
  ADS_SECURITY_INFO_OWNER = 0x00000001,
  ADS_SECURITY_INFO_GROUP = 0x00000002,
  ADS_SECURITY_INFO_DACL = 0x00000004,
  ADS_SECURITY_INFO_SACL = 0x00000008,
}

enum __MIDL___MIDL_itf_ads_0169_0001 {
  ADS_SETTYPE_FULL = 0x00000001,
  ADS_SETTYPE_PROVIDER = 0x00000002,
  ADS_SETTYPE_SERVER = 0x00000003,
  ADS_SETTYPE_DN = 0x00000004,
}

enum __MIDL___MIDL_itf_ads_0169_0002 {
  ADS_FORMAT_WINDOWS = 0x00000001,
  ADS_FORMAT_WINDOWS_NO_SERVER = 0x00000002,
  ADS_FORMAT_WINDOWS_DN = 0x00000003,
  ADS_FORMAT_WINDOWS_PARENT = 0x00000004,
  ADS_FORMAT_X500 = 0x00000005,
  ADS_FORMAT_X500_NO_SERVER = 0x00000006,
  ADS_FORMAT_X500_DN = 0x00000007,
  ADS_FORMAT_X500_PARENT = 0x00000008,
  ADS_FORMAT_SERVER = 0x00000009,
  ADS_FORMAT_PROVIDER = 0x0000000A,
  ADS_FORMAT_LEAF = 0x0000000B,
}

enum __MIDL___MIDL_itf_ads_0169_0003 {
  ADS_DISPLAY_FULL = 0x00000001,
  ADS_DISPLAY_VALUE_ONLY = 0x00000002,
}

enum __MIDL___MIDL_itf_ads_0169_0004 {
  ADS_ESCAPEDMODE_DEFAULT = 0x00000001,
  ADS_ESCAPEDMODE_ON = 0x00000002,
  ADS_ESCAPEDMODE_OFF = 0x00000003,
  ADS_ESCAPEDMODE_OFF_EX = 0x00000004,
}

enum __MIDL___MIDL_itf_ads_0174_0001 {
  ADS_PATH_FILE = 0x00000001,
  ADS_PATH_FILESHARE = 0x00000002,
  ADS_PATH_REGISTRY = 0x00000003,
}

enum __MIDL___MIDL_itf_ads_0174_0002 {
  ADS_SD_FORMAT_IID = 0x00000001,
  ADS_SD_FORMAT_RAW = 0x00000002,
  ADS_SD_FORMAT_HEXSTRING = 0x00000003,
}

// Unions

union __MIDL___MIDL_itf_ads_0000_0017 {
  wchar* DNString;
  wchar* CaseExactString;
  wchar* CaseIgnoreString;
  wchar* PrintableString;
  wchar* NumericString;
  uint Boolean;
  uint Integer;
  ADS_OCTET_STRING OctetString;
  _SYSTEMTIME UTCTime;
  _LARGE_INTEGER LargeInteger;
  wchar* ClassName;
  ADS_PROV_SPECIFIC ProviderSpecific;
  _ADS_CASEIGNORE_LIST* pCaseIgnoreList;
  _ADS_OCTET_LIST* pOctetList;
  __MIDL___MIDL_itf_ads_0000_0005* pPath;
  __MIDL___MIDL_itf_ads_0000_0006* pPostalAddress;
  ADS_TIMESTAMP Timestamp;
  ADS_BACKLINK BackLink;
  __MIDL___MIDL_itf_ads_0000_0009* pTypedName;
  ADS_HOLD Hold;
  __MIDL___MIDL_itf_ads_0000_0011* pNetAddress;
  __MIDL___MIDL_itf_ads_0000_0012* pReplicaPointer;
  __MIDL___MIDL_itf_ads_0000_0013* pFaxNumber;
  ADS_EMAIL Email;
  ADS_NT_SECURITY_DESCRIPTOR SecurityDescriptor;
  __MIDL___MIDL_itf_ads_0000_0015* pDNWithBinary;
  __MIDL___MIDL_itf_ads_0000_0016* pDNWithString;
}

union __MIDL_IOleAutomationTypes_0005 {
  tagTYPEDESC* lptdesc;
  tagARRAYDESC* lpadesc;
  uint hreftype;
}

union __MIDL_IOleAutomationTypes_0006 {
  uint oInst;
  DWINVARIANT* lpvarValue;
}

// Structs

struct __MIDL___MIDL_itf_ads_0000_0002 {
  uint dwLength;
  ubyte* lpValue;
}

struct __MIDL___MIDL_itf_ads_0000_0003 {
  uint dwLength;
  ubyte* lpValue;
}

struct _SYSTEMTIME {
  ushort wYear;
  ushort wMonth;
  ushort wDayOfWeek;
  ushort wDay;
  ushort wHour;
  ushort wMinute;
  ushort wSecond;
  ushort wMilliseconds;
}

struct _LARGE_INTEGER {
  long QuadPart;
}

struct __MIDL___MIDL_itf_ads_0000_0004 {
  uint dwLength;
  ubyte* lpValue;
}

struct _ADS_CASEIGNORE_LIST {
  _ADS_CASEIGNORE_LIST* Next;
  wchar* String;
}

struct _ADS_OCTET_LIST {
  _ADS_OCTET_LIST* Next;
  uint Length;
  ubyte* Data;
}

struct __MIDL___MIDL_itf_ads_0000_0005 {
  uint Type;
  wchar* VolumeName;
  wchar* Path;
}

struct __MIDL___MIDL_itf_ads_0000_0006 {
  wchar*[6] PostalAddress;
}

struct __MIDL___MIDL_itf_ads_0000_0007 {
  uint WholeSeconds;
  uint EventID;
}

struct __MIDL___MIDL_itf_ads_0000_0008 {
  uint RemoteID;
  wchar* ObjectName;
}

struct __MIDL___MIDL_itf_ads_0000_0009 {
  wchar* ObjectName;
  uint Level;
  uint Interval;
}

struct __MIDL___MIDL_itf_ads_0000_0010 {
  wchar* ObjectName;
  uint Amount;
}

struct __MIDL___MIDL_itf_ads_0000_0011 {
  uint AddressType;
  uint AddressLength;
  ubyte* Address;
}

struct __MIDL___MIDL_itf_ads_0000_0012 {
  wchar* ServerName;
  uint ReplicaType;
  uint ReplicaNumber;
  uint Count;
  __MIDL___MIDL_itf_ads_0000_0011* ReplicaAddressHints;
}

struct __MIDL___MIDL_itf_ads_0000_0013 {
  wchar* TelephoneNumber;
  uint NumberOfBits;
  ubyte* Parameters;
}

struct __MIDL___MIDL_itf_ads_0000_0014 {
  wchar* Address;
  uint Type;
}

struct __MIDL___MIDL_itf_ads_0000_0015 {
  uint dwLength;
  ubyte* lpBinaryValue;
  wchar* pszDNString;
}

struct __MIDL___MIDL_itf_ads_0000_0016 {
  wchar* pszStringValue;
  wchar* pszDNString;
}

struct _adsvalue {
  ADSTYPEENUM dwType;
  __MIDL___MIDL_itf_ads_0000_0017 __MIDL_0010;
}

struct _ads_attr_info {
  wchar* pszAttrName;
  uint dwControlCode;
  ADSTYPEENUM dwADsType;
  _adsvalue* pADsValues;
  uint dwNumValues;
}

struct _ads_object_info {
  wchar* pszRDN;
  wchar* pszObjectDN;
  wchar* pszParentDN;
  wchar* pszSchemaDN;
  wchar* pszClassName;
}

struct ads_searchpref_info {
  ADS_SEARCHPREF_ENUM dwSearchPref;
  _adsvalue vValue;
  ADS_STATUSENUM dwStatus;
}

struct ads_search_column {
  wchar* pszAttrName;
  ADSTYPEENUM dwADsType;
  _adsvalue* pADsValues;
  uint dwNumValues;
  void* hReserved;
}

struct _ads_attr_def {
  wchar* pszAttrName;
  ADSTYPEENUM dwADsType;
  uint dwMinRange;
  uint dwMaxRange;
  int fMultiValued;
}

struct _ads_class_def {
  wchar* pszClassName;
  uint dwMandatoryAttrs;
  wchar** ppszMandatoryAttrs;
  uint optionalAttrs;
  wchar*** ppszOptionalAttrs;
  uint dwNamingAttrs;
  wchar*** ppszNamingAttrs;
  uint dwSuperClasses;
  wchar*** ppszSuperClasses;
  int fIsContainer;
}

struct _ads_sortkey {
  wchar* pszAttrType;
  wchar* pszReserved;
  byte fReverseorder;
}

struct _ads_vlv {
  uint dwBeforeCount;
  uint dwAfterCount;
  uint dwOffset;
  uint dwContentCount;
  wchar* pszTarget;
  uint dwContextIDLength;
  ubyte* lpContextID;
}

struct tagTYPEATTR {
 DWINGUID Guid;
  uint lcid;
  uint dwReserved;
  int memidConstructor;
  int memidDestructor;
  wchar* lpstrSchema;
  uint cbSizeInstance;
  tagTYPEKIND typekind;
  ushort cFuncs;
  ushort cVars;
  ushort cImplTypes;
  ushort cbSizeVft;
  ushort cbAlignment;
  ushort wTypeFlags;
  ushort wMajorVerNum;
  ushort wMinorVerNum;
  tagTYPEDESC tdescAlias;
  tagIDLDESC idldescType;
}

struct tagTYPEDESC {
  __MIDL_IOleAutomationTypes_0005 __MIDL_0008;
  ushort vt;
}

struct tagARRAYDESC {
  tagTYPEDESC tdescElem;
  ushort cDims;
  tagSAFEARRAYBOUND* rgbounds;
}

struct tagSAFEARRAYBOUND {
  uint cElements;
  int lLbound;
}

struct tagIDLDESC {
  ULONG_PTR dwReserved;
  ushort wIDLFlags;
}

struct tagFUNCDESC {
  int memid;
  int* lprgscode;
  tagELEMDESC* lprgelemdescParam;
  tagFUNCKIND funckind;
  tagINVOKEKIND invkind;
  tagCALLCONV callconv;
  short cParams;
  short cParamsOpt;
  short oVft;
  short cScodes;
  tagELEMDESC elemdescFunc;
  ushort wFuncFlags;
}

struct tagELEMDESC {
  tagTYPEDESC tdesc;
  tagPARAMDESC paramdesc;
}

struct tagPARAMDESC {
  tagPARAMDESCEX* pparamdescex;
  ushort wParamFlags;
}

struct tagPARAMDESCEX {
  uint cBytes;
  DWINVARIANT varDefaultValue;
}

struct tagVARDESC {
  int memid;
  wchar* lpstrSchema;
  __MIDL_IOleAutomationTypes_0006 __MIDL_0009;
  tagELEMDESC elemdescVar;
  ushort wVarFlags;
  tagVARKIND varkind;
}

struct tagTLIBATTR {
 DWINGUID Guid;
  uint lcid;
  tagSYSKIND syskind;
  ushort wMajorVerNum;
  ushort wMinorVerNum;
  ushort wLibFlags;
}

// Aliases

alias __MIDL___MIDL_itf_ads_0000_0001 ADSTYPEENUM;

alias __MIDL___MIDL_itf_ads_0000_0002 ADS_OCTET_STRING;

alias __MIDL___MIDL_itf_ads_0000_0003 ADS_NT_SECURITY_DESCRIPTOR;

alias __MIDL___MIDL_itf_ads_0000_0004 ADS_PROV_SPECIFIC;

alias __MIDL___MIDL_itf_ads_0000_0005 ADS_PATH;

alias __MIDL___MIDL_itf_ads_0000_0006 ADS_POSTALADDRESS;

alias __MIDL___MIDL_itf_ads_0000_0007 ADS_TIMESTAMP;

alias __MIDL___MIDL_itf_ads_0000_0008 ADS_BACKLINK;

alias __MIDL___MIDL_itf_ads_0000_0009 ADS_TYPEDNAME;

alias __MIDL___MIDL_itf_ads_0000_0010 ADS_HOLD;

alias __MIDL___MIDL_itf_ads_0000_0011 ADS_NETADDRESS;

alias __MIDL___MIDL_itf_ads_0000_0012 ADS_REPLICAPOINTER;

alias __MIDL___MIDL_itf_ads_0000_0013 ADS_FAXNUMBER;

alias __MIDL___MIDL_itf_ads_0000_0014 ADS_EMAIL;

alias __MIDL___MIDL_itf_ads_0000_0015 ADS_DN_WITH_BINARY;

alias __MIDL___MIDL_itf_ads_0000_0016 ADS_DN_WITH_STRING;

alias __MIDL___MIDL_itf_ads_0000_0018 ADS_AUTHENTICATION_ENUM;

alias __MIDL___MIDL_itf_ads_0000_0019 ADS_STATUSENUM;

alias __MIDL___MIDL_itf_ads_0000_0020 ADS_DEREFENUM;

alias __MIDL___MIDL_itf_ads_0000_0021 ADS_SCOPEENUM;

alias __MIDL___MIDL_itf_ads_0000_0022 ADS_PREFERENCES_ENUM;

alias __MIDL___MIDL_itf_ads_0000_0023 ADSI_DIALECT_ENUM;

alias __MIDL___MIDL_itf_ads_0000_0024 ADS_CHASE_REFERRALS_ENUM;

alias __MIDL___MIDL_itf_ads_0000_0025 ADS_SEARCHPREF_ENUM;

alias __MIDL___MIDL_itf_ads_0000_0026 ADS_PROPERTY_OPERATION_ENUM;

alias uint ULONG_PTR;

alias uint DWORD;

alias __MIDL___MIDL_itf_ads_0125_0001 ADS_SYSTEMFLAG_ENUM;

alias __MIDL___MIDL_itf_ads_0131_0001 ADS_GROUP_TYPE_ENUM;

alias __MIDL___MIDL_itf_ads_0153_0001 ADS_RIGHTS_ENUM;

alias __MIDL___MIDL_itf_ads_0153_0002 ADS_ACETYPE_ENUM;

alias __MIDL___MIDL_itf_ads_0153_0003 ADS_ACEFLAG_ENUM;

alias __MIDL___MIDL_itf_ads_0153_0004 ADS_FLAGTYPE_ENUM;

alias __MIDL___MIDL_itf_ads_0153_0005 ADS_SD_CONTROL_ENUM;

alias __MIDL___MIDL_itf_ads_0153_0006 ADS_SD_REVISION_ENUM;

alias __MIDL___MIDL_itf_ads_0154_0001 ADS_NAME_TYPE_ENUM;

alias __MIDL___MIDL_itf_ads_0154_0002 ADS_NAME_INITTYPE_ENUM;

alias __MIDL___MIDL_itf_ads_0168_0001 ADS_OPTION_ENUM;

alias __MIDL___MIDL_itf_ads_0168_0002 ADS_SECURITY_INFO_ENUM;

alias __MIDL___MIDL_itf_ads_0169_0001 ADS_SETTYPE_ENUM;

alias __MIDL___MIDL_itf_ads_0169_0002 ADS_FORMAT_ENUM;

alias __MIDL___MIDL_itf_ads_0169_0003 ADS_DISPLAY_ENUM;

alias __MIDL___MIDL_itf_ads_0169_0004 ADS_ESCAPE_MODE_ENUM;

alias __MIDL___MIDL_itf_ads_0174_0001 ADS_PATHTYPE_ENUM;

alias __MIDL___MIDL_itf_ads_0174_0002 ADS_SD_FORMAT_ENUM;

// Interfaces

interface IADs : IDispatch {
  mixin(uuid("fd8256d0-fd15-11ce-abc4-02608c9e7553"));
  // static DWINGUID IID = { 0xfd8256d0, 0xfd15, 0x11ce, 0xab, 0xc4, 0x02, 0x60, 0x8c, 0x9e, 0x75, 0x53 };
  /*[id(0x00000002)]*/ int get_Name(out wchar* retval);
  /*[id(0x00000003)]*/ int get_Class(out wchar* retval);
  /*[id(0x00000004)]*/ int get_GUID(out wchar* retval);
  /*[id(0x00000005)]*/ int get_ADsPath(out wchar* retval);
  /*[id(0x00000006)]*/ int get_Parent(out wchar* retval);
  /*[id(0x00000007)]*/ int get_Schema(out wchar* retval);
  /*[id(0x00000008)]*/ int GetInfo();
  /*[id(0x00000009)]*/ int SetInfo();
  /*[id(0x0000000A)]*/ int Get(wchar* bstrName, out DWINVARIANT pvProp);
  /*[id(0x0000000B)]*/ int Put(wchar* bstrName, DWINVARIANT vProp);
  /*[id(0x0000000C)]*/ int GetEx(wchar* bstrName, out DWINVARIANT pvProp);
  /*[id(0x0000000D)]*/ int PutEx(int lnControlCode, wchar* bstrName, DWINVARIANT vProp);
  /*[id(0x0000000E)]*/ int GetInfoEx(DWINVARIANT vProperties, int lnReserved);
}

interface IADsContainer : IDispatch {
  mixin(uuid("001677d0-fd16-11ce-abc4-02608c9e7553"));
  // static DWINGUID IID = { 0x001677d0, 0xfd16, 0x11ce, 0xab, 0xc4, 0x02, 0x60, 0x8c, 0x9e, 0x75, 0x53 };
  /*[id(0x00000002)]*/ int get_Count(out int retval);
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown retval);
  /*[id(0x00000003)]*/ int get_Filter(out DWINVARIANT pVar);
  /*[id(0x00000003)]*/ int set_Filter(DWINVARIANT pVar);
  /*[id(0x00000004)]*/ int get_Hints(out DWINVARIANT pvFilter);
  /*[id(0x00000004)]*/ int set_Hints(DWINVARIANT pvFilter);
  /*[id(0x00000005)]*/ int GetObject(wchar* ClassName, wchar* RelativeName, out IDispatch ppObject);
  /*[id(0x00000006)]*/ int Create(wchar* ClassName, wchar* RelativeName, out IDispatch ppObject);
  /*[id(0x00000007)]*/ int Delete(wchar* bstrClassName, wchar* bstrRelativeName);
  /*[id(0x00000008)]*/ int CopyHere(wchar* SourceName, wchar* NewName, out IDispatch ppObject);
  /*[id(0x00000009)]*/ int MoveHere(wchar* SourceName, wchar* NewName, out IDispatch ppObject);
}

interface IADsCollection : IDispatch {
  mixin(uuid("72b945e0-253b-11cf-a988-00aa006bc149"));
  // static DWINGUID IID = { 0x72b945e0, 0x253b, 0x11cf, 0xa9, 0x88, 0x00, 0xaa, 0x00, 0x6b, 0xc1, 0x49 };
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown ppEnumerator);
  /*[id(0x00000004)]*/ int Add(wchar* bstrName, DWINVARIANT vItem);
  /*[id(0x00000005)]*/ int Remove(wchar* bstrItemToBeRemoved);
  /*[id(0x00000006)]*/ int GetObject(wchar* bstrName, out DWINVARIANT pvItem);
}

interface IADsMembers : IDispatch {
  mixin(uuid("451a0030-72ec-11cf-b03b-00aa006e0975"));
  // static DWINGUID IID = { 0x451a0030, 0x72ec, 0x11cf, 0xb0, 0x3b, 0x00, 0xaa, 0x00, 0x6e, 0x09, 0x75 };
  /*[id(0x00000002)]*/ int get_Count(out int plCount);
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown ppEnumerator);
  /*[id(0x00000003)]*/ int get_Filter(out DWINVARIANT pvFilter);
  /*[id(0x00000003)]*/ int set_Filter(DWINVARIANT pvFilter);
}

interface IADsPropertyList : IDispatch {
  mixin(uuid("c6f602b6-8f69-11d0-8528-00c04fd8d503"));
  // static DWINGUID IID = { 0xc6f602b6, 0x8f69, 0x11d0, 0x85, 0x28, 0x00, 0xc0, 0x4f, 0xd8, 0xd5, 0x03 };
  /*[id(0x00000002)]*/ int get_PropertyCount(out int plCount);
  /*[id(0x00000003)]*/ int Next(out DWINVARIANT pVariant);
  /*[id(0x00000004)]*/ int Skip(int cElements);
  /*[id(0x00000005)]*/ int Reset();
  /*[id(0x00000000)]*/ int Item(DWINVARIANT varIndex, out DWINVARIANT pVariant);
  /*[id(0x00000006)]*/ int GetPropertyItem(wchar* bstrName, int lnADsType, out DWINVARIANT pVariant);
  /*[id(0x00000007)]*/ int PutPropertyItem(DWINVARIANT varData);
  /*[id(0x00000008)]*/ int ResetPropertyItem(DWINVARIANT varEntry);
  /*[id(0x00000009)]*/ int PurgePropertyList();
}

interface IADsPropertyEntry : IDispatch {
  mixin(uuid("05792c8e-941f-11d0-8529-00c04fd8d503"));
  // static DWINGUID IID = { 0x05792c8e, 0x941f, 0x11d0, 0x85, 0x29, 0x00, 0xc0, 0x4f, 0xd8, 0xd5, 0x03 };
  /*[id(0x00000001)]*/ int Clear();
  /*[id(0x00000002)]*/ int get_Name(out wchar* retval);
  /*[id(0x00000002)]*/ int set_Name(wchar* retval);
  /*[id(0x00000003)]*/ int get_ADsType(out int retval);
  /*[id(0x00000003)]*/ int set_ADsType(int retval);
  /*[id(0x00000004)]*/ int get_ControlCode(out int retval);
  /*[id(0x00000004)]*/ int set_ControlCode(int retval);
  /*[id(0x00000005)]*/ int get_Values(out DWINVARIANT retval);
  /*[id(0x00000005)]*/ int set_Values(DWINVARIANT retval);
}

interface IADsPropertyValue : IDispatch {
  mixin(uuid("79fa9ad0-a97c-11d0-8534-00c04fd8d503"));
  // static DWINGUID IID = { 0x79fa9ad0, 0xa97c, 0x11d0, 0x85, 0x34, 0x00, 0xc0, 0x4f, 0xd8, 0xd5, 0x03 };
  /*[id(0x00000001)]*/ int Clear();
  /*[id(0x00000002)]*/ int get_ADsType(out int retval);
  /*[id(0x00000002)]*/ int set_ADsType(int retval);
  /*[id(0x00000003)]*/ int get_DNString(out wchar* retval);
  /*[id(0x00000003)]*/ int set_DNString(wchar* retval);
  /*[id(0x00000004)]*/ int get_CaseExactString(out wchar* retval);
  /*[id(0x00000004)]*/ int set_CaseExactString(wchar* retval);
  /*[id(0x00000005)]*/ int get_CaseIgnoreString(out wchar* retval);
  /*[id(0x00000005)]*/ int set_CaseIgnoreString(wchar* retval);
  /*[id(0x00000006)]*/ int get_PrintableString(out wchar* retval);
  /*[id(0x00000006)]*/ int set_PrintableString(wchar* retval);
  /*[id(0x00000007)]*/ int get_NumericString(out wchar* retval);
  /*[id(0x00000007)]*/ int set_NumericString(wchar* retval);
  /*[id(0x00000008)]*/ int get_Boolean(out int retval);
  /*[id(0x00000008)]*/ int set_Boolean(int retval);
  /*[id(0x00000009)]*/ int get_Integer(out int retval);
  /*[id(0x00000009)]*/ int set_Integer(int retval);
  /*[id(0x0000000A)]*/ int get_OctetString(out DWINVARIANT retval);
  /*[id(0x0000000A)]*/ int set_OctetString(DWINVARIANT retval);
  /*[id(0x0000000B)]*/ int get_SecurityDescriptor(out IDispatch retval);
  /*[id(0x0000000B)]*/ int set_SecurityDescriptor(IDispatch retval);
  /*[id(0x0000000C)]*/ int get_LargeInteger(out IDispatch retval);
  /*[id(0x0000000C)]*/ int set_LargeInteger(IDispatch retval);
  /*[id(0x0000000D)]*/ int get_UTCTime(out double retval);
  /*[id(0x0000000D)]*/ int set_UTCTime(double retval);
}

interface IADsPropertyValue2 : IDispatch {
  mixin(uuid("306e831c-5bc7-11d1-a3b8-00c04fb950dc"));
  // static DWINGUID IID = { 0x306e831c, 0x5bc7, 0x11d1, 0xa3, 0xb8, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  /*[id(0x00000001)]*/ int GetObjectProperty(ref int lnADsType, out DWINVARIANT pvProp);
  /*[id(0x00000002)]*/ int PutObjectProperty(int lnADsType, DWINVARIANT vProp);
}

interface IPrivateDispatch : IUnknown {
  mixin(uuid("86ab4bbe-65f6-11d1-8c13-00c04fd8d503"));
  // static DWINGUID IID = { 0x86ab4bbe, 0x65f6, 0x11d1, 0x8c, 0x13, 0x00, 0xc0, 0x4f, 0xd8, 0xd5, 0x03 };
  /*[id(0x60010000)]*/ int ADSIInitializeDispatchManager(int dwExtensionId);
  /*[id(0x60010001)]*/ int ADSIGetTypeInfoCount(out uint pctinfo);
  /*[id(0x60010002)]*/ int ADSIGetTypeInfo(uint itinfo, uint lcid, out ITypeInfo ppTInfo);
  /*[id(0x60010003)]*/ int ADSIGetIDsOfNames(ref DWINGUID riid, ushort** rgszNames, uint cNames, uint lcid, out int rgdispid);
  /*[id(0x60010004)]*/ int ADSIInvoke(int dispidMember, ref DWINGUID riid, uint lcid, ushort wFlags, DISPPARAMS* pdispparams, out DWINVARIANT pvarResult, out EXCEPINFO pexcepinfo, out uint puArgErr);
}

interface ITypeInfo : IUnknown {
  mixin(uuid("00020401-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00020401, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RemoteGetTypeAttr(out tagTYPEATTR ppTypeAttr, out DWORD pDummy);
  /*[id(0x60010001)]*/ int GetTypeComp(out ITypeComp ppTComp);
  /*[id(0x60010002)]*/ int RemoteGetFuncDesc(uint index, out tagFUNCDESC ppFuncDesc, out DWORD pDummy);
  /*[id(0x60010003)]*/ int RemoteGetVarDesc(uint index, out tagVARDESC ppVarDesc, out DWORD pDummy);
  /*[id(0x60010004)]*/ int RemoteGetNames(int memid, out wchar* rgBstrNames, uint cMaxNames, out uint pcNames);
  /*[id(0x60010005)]*/ int GetRefTypeOfImplType(uint index, out uint pRefType);
  /*[id(0x60010006)]*/ int GetImplTypeFlags(uint index, out int pImplTypeFlags);
  /*[id(0x60010007)]*/ int LocalGetIDsOfNames();
  /*[id(0x60010008)]*/ int LocalInvoke();
  /*[id(0x60010009)]*/ int RemoteGetDocumentation(int memid, uint refPtrFlags, out wchar* pBstrName, out wchar* pBstrDocString, out uint pdwHelpContext, out wchar* pBstrHelpFile);
  /*[id(0x6001000A)]*/ int RemoteGetDllEntry(int memid, tagINVOKEKIND invkind, uint refPtrFlags, out wchar* pBstrDllName, out wchar* pBstrName, out ushort pwOrdinal);
  /*[id(0x6001000B)]*/ int GetRefTypeInfo(uint hreftype, out ITypeInfo ppTInfo);
  /*[id(0x6001000C)]*/ int LocalAddressOfMember();
  /*[id(0x6001000D)]*/ int RemoteCreateInstance(ref DWINGUID riid, out IUnknown ppvObj);
  /*[id(0x6001000E)]*/ int GetMops(int memid, out wchar* pBstrMops);
  /*[id(0x6001000F)]*/ int RemoteGetContainingTypeLib(out ITypeLib ppTLib, out uint pIndex);
  /*[id(0x60010010)]*/ int LocalReleaseTypeAttr();
  /*[id(0x60010011)]*/ int LocalReleaseFuncDesc();
  /*[id(0x60010012)]*/ int LocalReleaseVarDesc();
}

interface ITypeComp : IUnknown {
  mixin(uuid("00020403-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00020403, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RemoteBind(wchar* szName, uint lHashVal, ushort wFlags, out ITypeInfo ppTInfo, out tagDESCKIND pDescKind, out tagFUNCDESC ppFuncDesc, out tagVARDESC ppVarDesc, out ITypeComp ppTypeComp, out DWORD pDummy);
  /*[id(0x60010001)]*/ int RemoteBindType(wchar* szName, uint lHashVal, out ITypeInfo ppTInfo);
}

interface ITypeLib : IUnknown {
  mixin(uuid("00020402-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00020402, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RemoteGetTypeInfoCount(out uint pctinfo);
  /*[id(0x60010001)]*/ int GetTypeInfo(uint index, out ITypeInfo ppTInfo);
  /*[id(0x60010002)]*/ int GetTypeInfoType(uint index, out tagTYPEKIND pTKind);
  /*[id(0x60010003)]*/ int GetTypeInfoOfGuid(ref DWINGUID GUID, out ITypeInfo ppTInfo);
  /*[id(0x60010004)]*/ int RemoteGetLibAttr(out tagTLIBATTR ppTLibAttr, out DWORD pDummy);
  /*[id(0x60010005)]*/ int GetTypeComp(out ITypeComp ppTComp);
  /*[id(0x60010006)]*/ int RemoteGetDocumentation(int index, uint refPtrFlags, out wchar* pBstrName, out wchar* pBstrDocString, out uint pdwHelpContext, out wchar* pBstrHelpFile);
  /*[id(0x60010007)]*/ int RemoteIsName(wchar* szNameBuf, uint lHashVal, out int pfName, out wchar* pBstrLibName);
  /*[id(0x60010008)]*/ int RemoteFindName(wchar* szNameBuf, uint lHashVal, out ITypeInfo ppTInfo, out int rgMemId, ref ushort pcFound, out wchar* pBstrLibName);
  /*[id(0x60010009)]*/ int LocalReleaseTLibAttr();
}

interface IPrivateUnknown : IUnknown {
  mixin(uuid("89126bab-6ead-11d1-8c18-00c04fd8d503"));
  // static DWINGUID IID = { 0x89126bab, 0x6ead, 0x11d1, 0x8c, 0x18, 0x00, 0xc0, 0x4f, 0xd8, 0xd5, 0x03 };
  /*[id(0x60010000)]*/ int ADSIInitializeObject(wchar* lpszUserName, wchar* lpszPassword, int lnReserved);
  /*[id(0x60010001)]*/ int ADSIReleaseObject();
}

interface IADsExtension : IUnknown {
  mixin(uuid("3d35553c-d2b0-11d1-b17b-0000f87593a0"));
  // static DWINGUID IID = { 0x3d35553c, 0xd2b0, 0x11d1, 0xb1, 0x7b, 0x00, 0x00, 0xf8, 0x75, 0x93, 0xa0 };
  /*[id(0x60010000)]*/ int Operate(uint dwCode, DWINVARIANT varData1, DWINVARIANT varData2, DWINVARIANT varData3);
  /*[id(0x60010001)]*/ int PrivateGetIDsOfNames(ref DWINGUID riid, ushort** rgszNames, uint cNames, uint lcid, out int rgdispid);
  /*[id(0x60010002)]*/ int PrivateInvoke(int dispidMember, ref DWINGUID riid, uint lcid, ushort wFlags, DISPPARAMS* pdispparams, out DWINVARIANT pvarResult, out EXCEPINFO pexcepinfo, out uint puArgErr);
}

interface IADsDeleteOps : IDispatch {
  mixin(uuid("b2bd0902-8878-11d1-8c21-00c04fd8d503"));
  // static DWINGUID IID = { 0xb2bd0902, 0x8878, 0x11d1, 0x8c, 0x21, 0x00, 0xc0, 0x4f, 0xd8, 0xd5, 0x03 };
  /*[id(0x00000002)]*/ int DeleteObject(int lnFlags);
}

interface IADsNamespaces : IADs {
  mixin(uuid("28b96ba0-b330-11cf-a9ad-00aa006bc149"));
  // static DWINGUID IID = { 0x28b96ba0, 0xb330, 0x11cf, 0xa9, 0xad, 0x00, 0xaa, 0x00, 0x6b, 0xc1, 0x49 };
  /*[id(0x00000001)]*/ int get_DefaultContainer(out wchar* retval);
  /*[id(0x00000001)]*/ int set_DefaultContainer(wchar* retval);
}

interface IADsClass : IADs {
  mixin(uuid("c8f93dd0-4ae0-11cf-9e73-00aa004a5691"));
  // static DWINGUID IID = { 0xc8f93dd0, 0x4ae0, 0x11cf, 0x9e, 0x73, 0x00, 0xaa, 0x00, 0x4a, 0x56, 0x91 };
  /*[id(0x0000000F)]*/ int get_PrimaryInterface(out wchar* retval);
  /*[id(0x00000010)]*/ int get_CLSID(out wchar* retval);
  /*[id(0x00000010)]*/ int set_CLSID(wchar* retval);
  /*[id(0x00000011)]*/ int get_OID(out wchar* retval);
  /*[id(0x00000011)]*/ int set_OID(wchar* retval);
  /*[id(0x00000012)]*/ int get_Abstract(out short retval);
  /*[id(0x00000012)]*/ int set_Abstract(short retval);
  /*[id(0x0000001A)]*/ int get_Auxiliary(out short retval);
  /*[id(0x0000001A)]*/ int set_Auxiliary(short retval);
  /*[id(0x00000013)]*/ int get_MandatoryProperties(out DWINVARIANT retval);
  /*[id(0x00000013)]*/ int set_MandatoryProperties(DWINVARIANT retval);
  /*[id(0x0000001D)]*/ int get_OptionalProperties(out DWINVARIANT retval);
  /*[id(0x0000001D)]*/ int set_OptionalProperties(DWINVARIANT retval);
  /*[id(0x0000001E)]*/ int get_NamingProperties(out DWINVARIANT retval);
  /*[id(0x0000001E)]*/ int set_NamingProperties(DWINVARIANT retval);
  /*[id(0x00000014)]*/ int get_DerivedFrom(out DWINVARIANT retval);
  /*[id(0x00000014)]*/ int set_DerivedFrom(DWINVARIANT retval);
  /*[id(0x0000001B)]*/ int get_AuxDerivedFrom(out DWINVARIANT retval);
  /*[id(0x0000001B)]*/ int set_AuxDerivedFrom(DWINVARIANT retval);
  /*[id(0x0000001C)]*/ int get_PossibleSuperiors(out DWINVARIANT retval);
  /*[id(0x0000001C)]*/ int set_PossibleSuperiors(DWINVARIANT retval);
  /*[id(0x00000015)]*/ int get_Containment(out DWINVARIANT retval);
  /*[id(0x00000015)]*/ int set_Containment(DWINVARIANT retval);
  /*[id(0x00000016)]*/ int get_Container(out short retval);
  /*[id(0x00000016)]*/ int set_Container(short retval);
  /*[id(0x00000017)]*/ int get_HelpFileName(out wchar* retval);
  /*[id(0x00000017)]*/ int set_HelpFileName(wchar* retval);
  /*[id(0x00000018)]*/ int get_HelpFileContext(out int retval);
  /*[id(0x00000018)]*/ int set_HelpFileContext(int retval);
  /*[id(0x00000019)]*/ int Qualifiers(out IADsCollection ppQualifiers);
}

interface IADsProperty : IADs {
  mixin(uuid("c8f93dd3-4ae0-11cf-9e73-00aa004a5691"));
  // static DWINGUID IID = { 0xc8f93dd3, 0x4ae0, 0x11cf, 0x9e, 0x73, 0x00, 0xaa, 0x00, 0x4a, 0x56, 0x91 };
  /*[id(0x00000011)]*/ int get_OID(out wchar* retval);
  /*[id(0x00000011)]*/ int set_OID(wchar* retval);
  /*[id(0x00000012)]*/ int get_Syntax(out wchar* retval);
  /*[id(0x00000012)]*/ int set_Syntax(wchar* retval);
  /*[id(0x00000013)]*/ int get_MaxRange(out int retval);
  /*[id(0x00000013)]*/ int set_MaxRange(int retval);
  /*[id(0x00000014)]*/ int get_MinRange(out int retval);
  /*[id(0x00000014)]*/ int set_MinRange(int retval);
  /*[id(0x00000015)]*/ int get_MultiValued(out short retval);
  /*[id(0x00000015)]*/ int set_MultiValued(short retval);
  /*[id(0x00000016)]*/ int Qualifiers(out IADsCollection ppQualifiers);
}

interface IADsSyntax : IADs {
  mixin(uuid("c8f93dd2-4ae0-11cf-9e73-00aa004a5691"));
  // static DWINGUID IID = { 0xc8f93dd2, 0x4ae0, 0x11cf, 0x9e, 0x73, 0x00, 0xaa, 0x00, 0x4a, 0x56, 0x91 };
  /*[id(0x0000000F)]*/ int get_OleAutoDataType(out int retval);
  /*[id(0x0000000F)]*/ int set_OleAutoDataType(int retval);
}

interface IADsLocality : IADs {
  mixin(uuid("a05e03a2-effe-11cf-8abc-00c04fd8d503"));
  // static DWINGUID IID = { 0xa05e03a2, 0xeffe, 0x11cf, 0x8a, 0xbc, 0x00, 0xc0, 0x4f, 0xd8, 0xd5, 0x03 };
  /*[id(0x0000000F)]*/ int get_Description(out wchar* retval);
  /*[id(0x0000000F)]*/ int set_Description(wchar* retval);
  /*[id(0x00000010)]*/ int get_LocalityName(out wchar* retval);
  /*[id(0x00000010)]*/ int set_LocalityName(wchar* retval);
  /*[id(0x00000011)]*/ int get_PostalAddress(out wchar* retval);
  /*[id(0x00000011)]*/ int set_PostalAddress(wchar* retval);
  /*[id(0x00000012)]*/ int get_SeeAlso(out DWINVARIANT retval);
  /*[id(0x00000012)]*/ int set_SeeAlso(DWINVARIANT retval);
}

interface IADsO : IADs {
  mixin(uuid("a1cd2dc6-effe-11cf-8abc-00c04fd8d503"));
  // static DWINGUID IID = { 0xa1cd2dc6, 0xeffe, 0x11cf, 0x8a, 0xbc, 0x00, 0xc0, 0x4f, 0xd8, 0xd5, 0x03 };
  /*[id(0x0000000F)]*/ int get_Description(out wchar* retval);
  /*[id(0x0000000F)]*/ int set_Description(wchar* retval);
  /*[id(0x00000010)]*/ int get_LocalityName(out wchar* retval);
  /*[id(0x00000010)]*/ int set_LocalityName(wchar* retval);
  /*[id(0x00000011)]*/ int get_PostalAddress(out wchar* retval);
  /*[id(0x00000011)]*/ int set_PostalAddress(wchar* retval);
  /*[id(0x00000012)]*/ int get_TelephoneNumber(out wchar* retval);
  /*[id(0x00000012)]*/ int set_TelephoneNumber(wchar* retval);
  /*[id(0x00000013)]*/ int get_FaxNumber(out wchar* retval);
  /*[id(0x00000013)]*/ int set_FaxNumber(wchar* retval);
  /*[id(0x00000014)]*/ int get_SeeAlso(out DWINVARIANT retval);
  /*[id(0x00000014)]*/ int set_SeeAlso(DWINVARIANT retval);
}

interface IADsOU : IADs {
  mixin(uuid("a2f733b8-effe-11cf-8abc-00c04fd8d503"));
  // static DWINGUID IID = { 0xa2f733b8, 0xeffe, 0x11cf, 0x8a, 0xbc, 0x00, 0xc0, 0x4f, 0xd8, 0xd5, 0x03 };
  /*[id(0x0000000F)]*/ int get_Description(out wchar* retval);
  /*[id(0x0000000F)]*/ int set_Description(wchar* retval);
  /*[id(0x00000010)]*/ int get_LocalityName(out wchar* retval);
  /*[id(0x00000010)]*/ int set_LocalityName(wchar* retval);
  /*[id(0x00000011)]*/ int get_PostalAddress(out wchar* retval);
  /*[id(0x00000011)]*/ int set_PostalAddress(wchar* retval);
  /*[id(0x00000012)]*/ int get_TelephoneNumber(out wchar* retval);
  /*[id(0x00000012)]*/ int set_TelephoneNumber(wchar* retval);
  /*[id(0x00000013)]*/ int get_FaxNumber(out wchar* retval);
  /*[id(0x00000013)]*/ int set_FaxNumber(wchar* retval);
  /*[id(0x00000014)]*/ int get_SeeAlso(out DWINVARIANT retval);
  /*[id(0x00000014)]*/ int set_SeeAlso(DWINVARIANT retval);
  /*[id(0x00000015)]*/ int get_BusinessCategory(out wchar* retval);
  /*[id(0x00000015)]*/ int set_BusinessCategory(wchar* retval);
}

interface IADsDomain : IADs {
  mixin(uuid("00e4c220-fd16-11ce-abc4-02608c9e7553"));
  // static DWINGUID IID = { 0x00e4c220, 0xfd16, 0x11ce, 0xab, 0xc4, 0x02, 0x60, 0x8c, 0x9e, 0x75, 0x53 };
  /*[id(0x0000000F)]*/ int get_IsWorkgroup(out short retval);
  /*[id(0x00000010)]*/ int get_MinPasswordLength(out int retval);
  /*[id(0x00000010)]*/ int set_MinPasswordLength(int retval);
  /*[id(0x00000011)]*/ int get_MinPasswordAge(out int retval);
  /*[id(0x00000011)]*/ int set_MinPasswordAge(int retval);
  /*[id(0x00000012)]*/ int get_MaxPasswordAge(out int retval);
  /*[id(0x00000012)]*/ int set_MaxPasswordAge(int retval);
  /*[id(0x00000013)]*/ int get_MaxBadPasswordsAllowed(out int retval);
  /*[id(0x00000013)]*/ int set_MaxBadPasswordsAllowed(int retval);
  /*[id(0x00000014)]*/ int get_PasswordHistoryLength(out int retval);
  /*[id(0x00000014)]*/ int set_PasswordHistoryLength(int retval);
  /*[id(0x00000015)]*/ int get_PasswordAttributes(out int retval);
  /*[id(0x00000015)]*/ int set_PasswordAttributes(int retval);
  /*[id(0x00000016)]*/ int get_AutoUnlockInterval(out int retval);
  /*[id(0x00000016)]*/ int set_AutoUnlockInterval(int retval);
  /*[id(0x00000017)]*/ int get_LockoutObservationInterval(out int retval);
  /*[id(0x00000017)]*/ int set_LockoutObservationInterval(int retval);
}

interface IADsComputer : IADs {
  mixin(uuid("efe3cc70-1d9f-11cf-b1f3-02608c9e7553"));
  // static DWINGUID IID = { 0xefe3cc70, 0x1d9f, 0x11cf, 0xb1, 0xf3, 0x02, 0x60, 0x8c, 0x9e, 0x75, 0x53 };
  /*[id(0x00000010)]*/ int get_ComputerID(out wchar* retval);
  /*[id(0x00000012)]*/ int get_Site(out wchar* retval);
  /*[id(0x00000013)]*/ int get_Description(out wchar* retval);
  /*[id(0x00000013)]*/ int set_Description(wchar* retval);
  /*[id(0x00000014)]*/ int get_Location(out wchar* retval);
  /*[id(0x00000014)]*/ int set_Location(wchar* retval);
  /*[id(0x00000015)]*/ int get_PrimaryUser(out wchar* retval);
  /*[id(0x00000015)]*/ int set_PrimaryUser(wchar* retval);
  /*[id(0x00000016)]*/ int get_Owner(out wchar* retval);
  /*[id(0x00000016)]*/ int set_Owner(wchar* retval);
  /*[id(0x00000017)]*/ int get_Division(out wchar* retval);
  /*[id(0x00000017)]*/ int set_Division(wchar* retval);
  /*[id(0x00000018)]*/ int get_Department(out wchar* retval);
  /*[id(0x00000018)]*/ int set_Department(wchar* retval);
  /*[id(0x00000019)]*/ int get_Role(out wchar* retval);
  /*[id(0x00000019)]*/ int set_Role(wchar* retval);
  /*[id(0x0000001A)]*/ int get_OperatingSystem(out wchar* retval);
  /*[id(0x0000001A)]*/ int set_OperatingSystem(wchar* retval);
  /*[id(0x0000001B)]*/ int get_OperatingSystemVersion(out wchar* retval);
  /*[id(0x0000001B)]*/ int set_OperatingSystemVersion(wchar* retval);
  /*[id(0x0000001C)]*/ int get_Model(out wchar* retval);
  /*[id(0x0000001C)]*/ int set_Model(wchar* retval);
  /*[id(0x0000001D)]*/ int get_Processor(out wchar* retval);
  /*[id(0x0000001D)]*/ int set_Processor(wchar* retval);
  /*[id(0x0000001E)]*/ int get_ProcessorCount(out wchar* retval);
  /*[id(0x0000001E)]*/ int set_ProcessorCount(wchar* retval);
  /*[id(0x0000001F)]*/ int get_MemorySize(out wchar* retval);
  /*[id(0x0000001F)]*/ int set_MemorySize(wchar* retval);
  /*[id(0x00000020)]*/ int get_StorageCapacity(out wchar* retval);
  /*[id(0x00000020)]*/ int set_StorageCapacity(wchar* retval);
  /*[id(0x00000011)]*/ int get_NetAddresses(out DWINVARIANT retval);
  /*[id(0x00000011)]*/ int set_NetAddresses(DWINVARIANT retval);
}

interface IADsComputerOperations : IADs {
  mixin(uuid("ef497680-1d9f-11cf-b1f3-02608c9e7553"));
  // static DWINGUID IID = { 0xef497680, 0x1d9f, 0x11cf, 0xb1, 0xf3, 0x02, 0x60, 0x8c, 0x9e, 0x75, 0x53 };
  /*[id(0x00000021)]*/ int Status(out IDispatch ppObject);
  /*[id(0x00000022)]*/ int Shutdown(short bReboot);
}

interface IADsGroup : IADs {
  mixin(uuid("27636b00-410f-11cf-b1ff-02608c9e7553"));
  // static DWINGUID IID = { 0x27636b00, 0x410f, 0x11cf, 0xb1, 0xff, 0x02, 0x60, 0x8c, 0x9e, 0x75, 0x53 };
  /*[id(0x0000000F)]*/ int get_Description(out wchar* retval);
  /*[id(0x0000000F)]*/ int set_Description(wchar* retval);
  /*[id(0x00000010)]*/ int Members(out IADsMembers ppMembers);
  /*[id(0x00000011)]*/ int IsMember(wchar* bstrMember, out short bMember);
  /*[id(0x00000012)]*/ int Add(wchar* bstrNewItem);
  /*[id(0x00000013)]*/ int Remove(wchar* bstrItemToBeRemoved);
}

interface IADsUser : IADs {
  mixin(uuid("3e37e320-17e2-11cf-abc4-02608c9e7553"));
  // static DWINGUID IID = { 0x3e37e320, 0x17e2, 0x11cf, 0xab, 0xc4, 0x02, 0x60, 0x8c, 0x9e, 0x75, 0x53 };
  /*[id(0x00000035)]*/ int get_BadLoginAddress(out wchar* retval);
  /*[id(0x00000036)]*/ int get_BadLoginCount(out int retval);
  /*[id(0x00000038)]*/ int get_LastLogin(out double retval);
  /*[id(0x00000039)]*/ int get_LastLogoff(out double retval);
  /*[id(0x0000003A)]*/ int get_LastFailedLogin(out double retval);
  /*[id(0x0000003B)]*/ int get_PasswordLastChanged(out double retval);
  /*[id(0x0000000F)]*/ int get_Description(out wchar* retval);
  /*[id(0x0000000F)]*/ int set_Description(wchar* retval);
  /*[id(0x00000013)]*/ int get_Division(out wchar* retval);
  /*[id(0x00000013)]*/ int set_Division(wchar* retval);
  /*[id(0x0000007A)]*/ int get_Department(out wchar* retval);
  /*[id(0x0000007A)]*/ int set_Department(wchar* retval);
  /*[id(0x00000014)]*/ int get_EmployeeID(out wchar* retval);
  /*[id(0x00000014)]*/ int set_EmployeeID(wchar* retval);
  /*[id(0x00000017)]*/ int get_FullName(out wchar* retval);
  /*[id(0x00000017)]*/ int set_FullName(wchar* retval);
  /*[id(0x00000016)]*/ int get_FirstName(out wchar* retval);
  /*[id(0x00000016)]*/ int set_FirstName(wchar* retval);
  /*[id(0x00000019)]*/ int get_LastName(out wchar* retval);
  /*[id(0x00000019)]*/ int set_LastName(wchar* retval);
  /*[id(0x0000001B)]*/ int get_OtherName(out wchar* retval);
  /*[id(0x0000001B)]*/ int set_OtherName(wchar* retval);
  /*[id(0x00000072)]*/ int get_NamePrefix(out wchar* retval);
  /*[id(0x00000072)]*/ int set_NamePrefix(wchar* retval);
  /*[id(0x00000073)]*/ int get_NameSuffix(out wchar* retval);
  /*[id(0x00000073)]*/ int set_NameSuffix(wchar* retval);
  /*[id(0x00000024)]*/ int get_Title(out wchar* retval);
  /*[id(0x00000024)]*/ int set_Title(wchar* retval);
  /*[id(0x0000001A)]*/ int get_Manager(out wchar* retval);
  /*[id(0x0000001A)]*/ int set_Manager(wchar* retval);
  /*[id(0x00000020)]*/ int get_TelephoneHome(out DWINVARIANT retval);
  /*[id(0x00000020)]*/ int set_TelephoneHome(DWINVARIANT retval);
  /*[id(0x00000021)]*/ int get_TelephoneMobile(out DWINVARIANT retval);
  /*[id(0x00000021)]*/ int set_TelephoneMobile(DWINVARIANT retval);
  /*[id(0x00000022)]*/ int get_TelephoneNumber(out DWINVARIANT retval);
  /*[id(0x00000022)]*/ int set_TelephoneNumber(DWINVARIANT retval);
  /*[id(0x00000011)]*/ int get_TelephonePager(out DWINVARIANT retval);
  /*[id(0x00000011)]*/ int set_TelephonePager(DWINVARIANT retval);
  /*[id(0x00000010)]*/ int get_FaxNumber(out DWINVARIANT retval);
  /*[id(0x00000010)]*/ int set_FaxNumber(DWINVARIANT retval);
  /*[id(0x0000001C)]*/ int get_OfficeLocations(out DWINVARIANT retval);
  /*[id(0x0000001C)]*/ int set_OfficeLocations(DWINVARIANT retval);
  /*[id(0x0000001E)]*/ int get_PostalAddresses(out DWINVARIANT retval);
  /*[id(0x0000001E)]*/ int set_PostalAddresses(DWINVARIANT retval);
  /*[id(0x0000001F)]*/ int get_PostalCodes(out DWINVARIANT retval);
  /*[id(0x0000001F)]*/ int set_PostalCodes(DWINVARIANT retval);
  /*[id(0x00000075)]*/ int get_SeeAlso(out DWINVARIANT retval);
  /*[id(0x00000075)]*/ int set_SeeAlso(DWINVARIANT retval);
  /*[id(0x00000025)]*/ int get_AccountDisabled(out short retval);
  /*[id(0x00000025)]*/ int set_AccountDisabled(short retval);
  /*[id(0x00000026)]*/ int get_AccountExpirationDate(out double retval);
  /*[id(0x00000026)]*/ int set_AccountExpirationDate(double retval);
  /*[id(0x00000029)]*/ int get_GraceLoginsAllowed(out int retval);
  /*[id(0x00000029)]*/ int set_GraceLoginsAllowed(int retval);
  /*[id(0x0000002A)]*/ int get_GraceLoginsRemaining(out int retval);
  /*[id(0x0000002A)]*/ int set_GraceLoginsRemaining(int retval);
  /*[id(0x0000002B)]*/ int get_IsAccountLocked(out short retval);
  /*[id(0x0000002B)]*/ int set_IsAccountLocked(short retval);
  /*[id(0x0000002D)]*/ int get_LoginHours(out DWINVARIANT retval);
  /*[id(0x0000002D)]*/ int set_LoginHours(DWINVARIANT retval);
  /*[id(0x0000002E)]*/ int get_LoginWorkstations(out DWINVARIANT retval);
  /*[id(0x0000002E)]*/ int set_LoginWorkstations(DWINVARIANT retval);
  /*[id(0x0000002F)]*/ int get_MaxLogins(out int retval);
  /*[id(0x0000002F)]*/ int set_MaxLogins(int retval);
  /*[id(0x00000030)]*/ int get_MaxStorage(out int retval);
  /*[id(0x00000030)]*/ int set_MaxStorage(int retval);
  /*[id(0x00000031)]*/ int get_PasswordExpirationDate(out double retval);
  /*[id(0x00000031)]*/ int set_PasswordExpirationDate(double retval);
  /*[id(0x00000032)]*/ int get_PasswordMinimumLength(out int retval);
  /*[id(0x00000032)]*/ int set_PasswordMinimumLength(int retval);
  /*[id(0x00000033)]*/ int get_PasswordRequired(out short retval);
  /*[id(0x00000033)]*/ int set_PasswordRequired(short retval);
  /*[id(0x00000034)]*/ int get_RequireUniquePassword(out short retval);
  /*[id(0x00000034)]*/ int set_RequireUniquePassword(short retval);
  /*[id(0x0000003C)]*/ int get_EmailAddress(out wchar* retval);
  /*[id(0x0000003C)]*/ int set_EmailAddress(wchar* retval);
  /*[id(0x0000003D)]*/ int get_HomeDirectory(out wchar* retval);
  /*[id(0x0000003D)]*/ int set_HomeDirectory(wchar* retval);
  /*[id(0x0000003E)]*/ int get_Languages(out DWINVARIANT retval);
  /*[id(0x0000003E)]*/ int set_Languages(DWINVARIANT retval);
  /*[id(0x0000003F)]*/ int get_Profile(out wchar* retval);
  /*[id(0x0000003F)]*/ int set_Profile(wchar* retval);
  /*[id(0x00000040)]*/ int get_LoginScript(out wchar* retval);
  /*[id(0x00000040)]*/ int set_LoginScript(wchar* retval);
  /*[id(0x00000041)]*/ int get_Picture(out DWINVARIANT retval);
  /*[id(0x00000041)]*/ int set_Picture(DWINVARIANT retval);
  /*[id(0x00000078)]*/ int get_HomePage(out wchar* retval);
  /*[id(0x00000078)]*/ int set_HomePage(wchar* retval);
  /*[id(0x00000042)]*/ int Groups(out IADsMembers ppGroups);
  /*[id(0x00000043)]*/ int SetPassword(wchar* NewPassword);
  /*[id(0x00000044)]*/ int ChangePassword(wchar* bstrOldPassword, wchar* bstrNewPassword);
}

interface IADsPrintQueue : IADs {
  mixin(uuid("b15160d0-1226-11cf-a985-00aa006bc149"));
  // static DWINGUID IID = { 0xb15160d0, 0x1226, 0x11cf, 0xa9, 0x85, 0x00, 0xaa, 0x00, 0x6b, 0xc1, 0x49 };
  /*[id(0x0000000F)]*/ int get_PrinterPath(out wchar* retval);
  /*[id(0x0000000F)]*/ int set_PrinterPath(wchar* retval);
  /*[id(0x00000010)]*/ int get_Model(out wchar* retval);
  /*[id(0x00000010)]*/ int set_Model(wchar* retval);
  /*[id(0x00000011)]*/ int get_Datatype(out wchar* retval);
  /*[id(0x00000011)]*/ int set_Datatype(wchar* retval);
  /*[id(0x00000012)]*/ int get_PrintProcessor(out wchar* retval);
  /*[id(0x00000012)]*/ int set_PrintProcessor(wchar* retval);
  /*[id(0x00000013)]*/ int get_Description(out wchar* retval);
  /*[id(0x00000013)]*/ int set_Description(wchar* retval);
  /*[id(0x00000014)]*/ int get_Location(out wchar* retval);
  /*[id(0x00000014)]*/ int set_Location(wchar* retval);
  /*[id(0x00000015)]*/ int get_StartTime(out double retval);
  /*[id(0x00000015)]*/ int set_StartTime(double retval);
  /*[id(0x00000016)]*/ int get_UntilTime(out double retval);
  /*[id(0x00000016)]*/ int set_UntilTime(double retval);
  /*[id(0x00000017)]*/ int get_DefaultJobPriority(out int retval);
  /*[id(0x00000017)]*/ int set_DefaultJobPriority(int retval);
  /*[id(0x00000018)]*/ int get_Priority(out int retval);
  /*[id(0x00000018)]*/ int set_Priority(int retval);
  /*[id(0x00000019)]*/ int get_BannerPage(out wchar* retval);
  /*[id(0x00000019)]*/ int set_BannerPage(wchar* retval);
  /*[id(0x0000001A)]*/ int get_PrintDevices(out DWINVARIANT retval);
  /*[id(0x0000001A)]*/ int set_PrintDevices(DWINVARIANT retval);
  /*[id(0x0000001B)]*/ int get_NetAddresses(out DWINVARIANT retval);
  /*[id(0x0000001B)]*/ int set_NetAddresses(DWINVARIANT retval);
}

interface IADsPrintQueueOperations : IADs {
  mixin(uuid("124be5c0-156e-11cf-a986-00aa006bc149"));
  // static DWINGUID IID = { 0x124be5c0, 0x156e, 0x11cf, 0xa9, 0x86, 0x00, 0xaa, 0x00, 0x6b, 0xc1, 0x49 };
  /*[id(0x0000001B)]*/ int get_Status(out int retval);
  /*[id(0x0000001C)]*/ int PrintJobs(out IADsCollection pObject);
  /*[id(0x0000001D)]*/ int Pause();
  /*[id(0x0000001E)]*/ int Resume();
  /*[id(0x0000001F)]*/ int Purge();
}

interface IADsPrintJob : IADs {
  mixin(uuid("32fb6780-1ed0-11cf-a988-00aa006bc149"));
  // static DWINGUID IID = { 0x32fb6780, 0x1ed0, 0x11cf, 0xa9, 0x88, 0x00, 0xaa, 0x00, 0x6b, 0xc1, 0x49 };
  /*[id(0x0000000F)]*/ int get_HostPrintQueue(out wchar* retval);
  /*[id(0x00000010)]*/ int get_User(out wchar* retval);
  /*[id(0x00000011)]*/ int get_UserPath(out wchar* retval);
  /*[id(0x00000012)]*/ int get_TimeSubmitted(out double retval);
  /*[id(0x00000013)]*/ int get_TotalPages(out int retval);
  /*[id(0x000000EA)]*/ int get_Size(out int retval);
  /*[id(0x00000014)]*/ int get_Description(out wchar* retval);
  /*[id(0x00000014)]*/ int set_Description(wchar* retval);
  /*[id(0x00000015)]*/ int get_Priority(out int retval);
  /*[id(0x00000015)]*/ int set_Priority(int retval);
  /*[id(0x00000016)]*/ int get_StartTime(out double retval);
  /*[id(0x00000016)]*/ int set_StartTime(double retval);
  /*[id(0x00000017)]*/ int get_UntilTime(out double retval);
  /*[id(0x00000017)]*/ int set_UntilTime(double retval);
  /*[id(0x00000018)]*/ int get_Notify(out wchar* retval);
  /*[id(0x00000018)]*/ int set_Notify(wchar* retval);
  /*[id(0x00000019)]*/ int get_NotifyPath(out wchar* retval);
  /*[id(0x00000019)]*/ int set_NotifyPath(wchar* retval);
}

interface IADsPrintJobOperations : IADs {
  mixin(uuid("9a52db30-1ecf-11cf-a988-00aa006bc149"));
  // static DWINGUID IID = { 0x9a52db30, 0x1ecf, 0x11cf, 0xa9, 0x88, 0x00, 0xaa, 0x00, 0x6b, 0xc1, 0x49 };
  /*[id(0x0000001A)]*/ int get_Status(out int retval);
  /*[id(0x0000001B)]*/ int get_TimeElapsed(out int retval);
  /*[id(0x0000001C)]*/ int get_PagesPrinted(out int retval);
  /*[id(0x0000001D)]*/ int get_Position(out int retval);
  /*[id(0x0000001D)]*/ int set_Position(int retval);
  /*[id(0x0000001E)]*/ int Pause();
  /*[id(0x0000001F)]*/ int Resume();
}

interface IADsService : IADs {
  mixin(uuid("68af66e0-31ca-11cf-a98a-00aa006bc149"));
  // static DWINGUID IID = { 0x68af66e0, 0x31ca, 0x11cf, 0xa9, 0x8a, 0x00, 0xaa, 0x00, 0x6b, 0xc1, 0x49 };
  /*[id(0x0000000F)]*/ int get_HostComputer(out wchar* retval);
  /*[id(0x0000000F)]*/ int set_HostComputer(wchar* retval);
  /*[id(0x00000010)]*/ int get_DisplayName(out wchar* retval);
  /*[id(0x00000010)]*/ int set_DisplayName(wchar* retval);
  /*[id(0x00000011)]*/ int get_Version(out wchar* retval);
  /*[id(0x00000011)]*/ int set_Version(wchar* retval);
  /*[id(0x00000012)]*/ int get_ServiceType(out int retval);
  /*[id(0x00000012)]*/ int set_ServiceType(int retval);
  /*[id(0x00000013)]*/ int get_StartType(out int retval);
  /*[id(0x00000013)]*/ int set_StartType(int retval);
  /*[id(0x00000014)]*/ int get_Path(out wchar* retval);
  /*[id(0x00000014)]*/ int set_Path(wchar* retval);
  /*[id(0x00000015)]*/ int get_StartupParameters(out wchar* retval);
  /*[id(0x00000015)]*/ int set_StartupParameters(wchar* retval);
  /*[id(0x00000016)]*/ int get_ErrorControl(out int retval);
  /*[id(0x00000016)]*/ int set_ErrorControl(int retval);
  /*[id(0x00000017)]*/ int get_LoadOrderGroup(out wchar* retval);
  /*[id(0x00000017)]*/ int set_LoadOrderGroup(wchar* retval);
  /*[id(0x00000018)]*/ int get_ServiceAccountName(out wchar* retval);
  /*[id(0x00000018)]*/ int set_ServiceAccountName(wchar* retval);
  /*[id(0x00000019)]*/ int get_ServiceAccountPath(out wchar* retval);
  /*[id(0x00000019)]*/ int set_ServiceAccountPath(wchar* retval);
  /*[id(0x0000001A)]*/ int get_Dependencies(out DWINVARIANT retval);
  /*[id(0x0000001A)]*/ int set_Dependencies(DWINVARIANT retval);
}

interface IADsServiceOperations : IADs {
  mixin(uuid("5d7b33f0-31ca-11cf-a98a-00aa006bc149"));
  // static DWINGUID IID = { 0x5d7b33f0, 0x31ca, 0x11cf, 0xa9, 0x8a, 0x00, 0xaa, 0x00, 0x6b, 0xc1, 0x49 };
  /*[id(0x0000001B)]*/ int get_Status(out int retval);
  /*[id(0x0000001C)]*/ int Start();
  /*[id(0x0000001D)]*/ int Stop();
  /*[id(0x0000001E)]*/ int Pause();
  /*[id(0x0000001F)]*/ int Continue();
  /*[id(0x00000020)]*/ int SetPassword(wchar* bstrNewPassword);
}

interface IADsFileService : IADsService {
  mixin(uuid("a89d1900-31ca-11cf-a98a-00aa006bc149"));
  // static DWINGUID IID = { 0xa89d1900, 0x31ca, 0x11cf, 0xa9, 0x8a, 0x00, 0xaa, 0x00, 0x6b, 0xc1, 0x49 };
  /*[id(0x00000021)]*/ int get_Description(out wchar* retval);
  /*[id(0x00000021)]*/ int set_Description(wchar* retval);
  /*[id(0x00000022)]*/ int get_MaxUserCount(out int retval);
  /*[id(0x00000022)]*/ int set_MaxUserCount(int retval);
}

interface IADsFileServiceOperations : IADsServiceOperations {
  mixin(uuid("a02ded10-31ca-11cf-a98a-00aa006bc149"));
  // static DWINGUID IID = { 0xa02ded10, 0x31ca, 0x11cf, 0xa9, 0x8a, 0x00, 0xaa, 0x00, 0x6b, 0xc1, 0x49 };
  /*[id(0x00000023)]*/ int Sessions(out IADsCollection ppSessions);
  /*[id(0x00000024)]*/ int Resources(out IADsCollection ppResources);
}

interface IADsFileShare : IADs {
  mixin(uuid("eb6dcaf0-4b83-11cf-a995-00aa006bc149"));
  // static DWINGUID IID = { 0xeb6dcaf0, 0x4b83, 0x11cf, 0xa9, 0x95, 0x00, 0xaa, 0x00, 0x6b, 0xc1, 0x49 };
  /*[id(0x0000000F)]*/ int get_CurrentUserCount(out int retval);
  /*[id(0x00000010)]*/ int get_Description(out wchar* retval);
  /*[id(0x00000010)]*/ int set_Description(wchar* retval);
  /*[id(0x00000011)]*/ int get_HostComputer(out wchar* retval);
  /*[id(0x00000011)]*/ int set_HostComputer(wchar* retval);
  /*[id(0x00000012)]*/ int get_Path(out wchar* retval);
  /*[id(0x00000012)]*/ int set_Path(wchar* retval);
  /*[id(0x00000013)]*/ int get_MaxUserCount(out int retval);
  /*[id(0x00000013)]*/ int set_MaxUserCount(int retval);
}

interface IADsSession : IADs {
  mixin(uuid("398b7da0-4aab-11cf-ae2c-00aa006ebfb9"));
  // static DWINGUID IID = { 0x398b7da0, 0x4aab, 0x11cf, 0xae, 0x2c, 0x00, 0xaa, 0x00, 0x6e, 0xbf, 0xb9 };
  /*[id(0x0000000F)]*/ int get_User(out wchar* retval);
  /*[id(0x00000010)]*/ int get_UserPath(out wchar* retval);
  /*[id(0x00000011)]*/ int get_Computer(out wchar* retval);
  /*[id(0x00000012)]*/ int get_ComputerPath(out wchar* retval);
  /*[id(0x00000013)]*/ int get_ConnectTime(out int retval);
  /*[id(0x00000014)]*/ int get_IdleTime(out int retval);
}

interface IADsResource : IADs {
  mixin(uuid("34a05b20-4aab-11cf-ae2c-00aa006ebfb9"));
  // static DWINGUID IID = { 0x34a05b20, 0x4aab, 0x11cf, 0xae, 0x2c, 0x00, 0xaa, 0x00, 0x6e, 0xbf, 0xb9 };
  /*[id(0x0000000F)]*/ int get_User(out wchar* retval);
  /*[id(0x00000010)]*/ int get_UserPath(out wchar* retval);
  /*[id(0x00000011)]*/ int get_Path(out wchar* retval);
  /*[id(0x00000012)]*/ int get_LockCount(out int retval);
}

interface IADsOpenDSObject : IDispatch {
  mixin(uuid("ddf2891e-0f9c-11d0-8ad4-00c04fd8d503"));
  // static DWINGUID IID = { 0xddf2891e, 0x0f9c, 0x11d0, 0x8a, 0xd4, 0x00, 0xc0, 0x4f, 0xd8, 0xd5, 0x03 };
  /*[id(0x00000001)]*/ int OpenDSObject(wchar* lpszDNName, wchar* lpszUserName, wchar* lpszPassword, int lnReserved, out IDispatch ppOleDsObj);
}

interface IDirectoryObject : IUnknown {
  mixin(uuid("e798de2c-22e4-11d0-84fe-00c04fd8d503"));
  // static DWINGUID IID = { 0xe798de2c, 0x22e4, 0x11d0, 0x84, 0xfe, 0x00, 0xc0, 0x4f, 0xd8, 0xd5, 0x03 };
  /*[id(0x60010000)]*/ int GetObjectInformation(out _ads_object_info ppObjInfo);
  /*[id(0x60010001)]*/ int GetObjectAttributes(wchar** pAttributeNames, uint dwNumberAttributes, out _ads_attr_info ppAttributeEntries, out uint pdwNumAttributesReturned);
  /*[id(0x60010002)]*/ int SetObjectAttributes(_ads_attr_info* pAttributeEntries, uint dwNumAttributes, out uint pdwNumAttributesModified);
  /*[id(0x60010003)]*/ int CreateDSObject(wchar* pszRDNName, _ads_attr_info* pAttributeEntries, uint dwNumAttributes, out IDispatch ppObject);
  /*[id(0x60010004)]*/ int DeleteDSObject(wchar* pszRDNName);
}

interface IDirectorySearch : IUnknown {
  mixin(uuid("109ba8ec-92f0-11d0-a790-00c04fd8d5a8"));
  // static DWINGUID IID = { 0x109ba8ec, 0x92f0, 0x11d0, 0xa7, 0x90, 0x00, 0xc0, 0x4f, 0xd8, 0xd5, 0xa8 };
  /*[id(0x60010000)]*/ int SetSearchPreference(ads_searchpref_info* pSearchPrefs, uint dwNumPrefs);
  /*[id(0x60010001)]*/ int ExecuteSearch(wchar* pszSearchFilter, wchar** pAttributeNames, uint dwNumberAttributes, void *phSearchResult);
  /*[id(0x60010002)]*/ int AbandonSearch(void* phSearchResult);
  /*[id(0x60010003)]*/ int GetFirstRow(void* hSearchResult);
  /*[id(0x60010004)]*/ int GetNextRow(void* hSearchResult);
  /*[id(0x60010005)]*/ int GetPreviousRow(void* hSearchResult);
  /*[id(0x60010006)]*/ int GetNextColumnName(void* hSearchHandle, out wchar* ppszColumnName);
  /*[id(0x60010007)]*/ int GetColumn(void* hSearchResult, wchar* szColumnName, out ads_search_column pSearchColumn);
  /*[id(0x60010008)]*/ int FreeColumn(ads_search_column* pSearchColumn);
  /*[id(0x60010009)]*/ int CloseSearchHandle(void* hSearchResult);
}

interface IDirectorySchemaMgmt : IUnknown {
  mixin(uuid("75db3b9c-a4d8-11d0-a79c-00c04fd8d5a8"));
  // static DWINGUID IID = { 0x75db3b9c, 0xa4d8, 0x11d0, 0xa7, 0x9c, 0x00, 0xc0, 0x4f, 0xd8, 0xd5, 0xa8 };
  /*[id(0x60010000)]*/ int EnumAttributes(wchar** ppszAttrNames, uint dwNumAttributes, _ads_attr_def** ppAttrDefinition, uint* pdwNumAttributes);
  /*[id(0x60010001)]*/ int CreateAttributeDefinition(wchar* pszAttributeName, _ads_attr_def* pAttributeDefinition);
  /*[id(0x60010002)]*/ int WriteAttributeDefinition(wchar* pszAttributeName, _ads_attr_def* pAttributeDefinition);
  /*[id(0x60010003)]*/ int DeleteAttributeDefinition(wchar* pszAttributeName);
  /*[id(0x60010004)]*/ int EnumClasses(wchar** ppszClassNames, uint dwNumClasses, _ads_class_def** ppClassDefinition, uint* pdwNumClasses);
  /*[id(0x60010005)]*/ int WriteClassDefinition(wchar* pszClassName, _ads_class_def* pClassDefinition);
  /*[id(0x60010006)]*/ int CreateClassDefinition(wchar* pszClassName, _ads_class_def* pClassDefinition);
  /*[id(0x60010007)]*/ int DeleteClassDefinition(wchar* pszClassName);
}

interface IADsAggregatee : IUnknown {
  mixin(uuid("1346ce8c-9039-11d0-8528-00c04fd8d503"));
  // static DWINGUID IID = { 0x1346ce8c, 0x9039, 0x11d0, 0x85, 0x28, 0x00, 0xc0, 0x4f, 0xd8, 0xd5, 0x03 };
  /*[id(0x60010000)]*/ int ConnectAsAggregatee(IUnknown pOuterUnknown);
  /*[id(0x60010001)]*/ int DisconnectAsAggregatee();
  /*[id(0x60010002)]*/ int RelinquishInterface(ref DWINGUID riid);
  /*[id(0x60010003)]*/ int RestoreInterface(ref DWINGUID riid);
}

interface IADsAggregator : IUnknown {
  mixin(uuid("52db5fb0-941f-11d0-8529-00c04fd8d503"));
  // static DWINGUID IID = { 0x52db5fb0, 0x941f, 0x11d0, 0x85, 0x29, 0x00, 0xc0, 0x4f, 0xd8, 0xd5, 0x03 };
  /*[id(0x60010000)]*/ int ConnectAsAggregator(IUnknown pAggregatee);
  /*[id(0x60010001)]*/ int DisconnectAsAggregator();
}

interface IADsAccessControlEntry : IDispatch {
  mixin(uuid("b4f3a14c-9bdd-11d0-852c-00c04fd8d503"));
  // static DWINGUID IID = { 0xb4f3a14c, 0x9bdd, 0x11d0, 0x85, 0x2c, 0x00, 0xc0, 0x4f, 0xd8, 0xd5, 0x03 };
  /*[id(0x00000002)]*/ int get_AccessMask(out int retval);
  /*[id(0x00000002)]*/ int set_AccessMask(int retval);
  /*[id(0x00000003)]*/ int get_AceType(out int retval);
  /*[id(0x00000003)]*/ int set_AceType(int retval);
  /*[id(0x00000004)]*/ int get_AceFlags(out int retval);
  /*[id(0x00000004)]*/ int set_AceFlags(int retval);
  /*[id(0x00000005)]*/ int get_Flags(out int retval);
  /*[id(0x00000005)]*/ int set_Flags(int retval);
  /*[id(0x00000006)]*/ int get_ObjectType(out wchar* retval);
  /*[id(0x00000006)]*/ int set_ObjectType(wchar* retval);
  /*[id(0x00000007)]*/ int get_InheritedObjectType(out wchar* retval);
  /*[id(0x00000007)]*/ int set_InheritedObjectType(wchar* retval);
  /*[id(0x00000008)]*/ int get_Trustee(out wchar* retval);
  /*[id(0x00000008)]*/ int set_Trustee(wchar* retval);
}

interface IADsAccessControlList : IDispatch {
  mixin(uuid("b7ee91cc-9bdd-11d0-852c-00c04fd8d503"));
  // static DWINGUID IID = { 0xb7ee91cc, 0x9bdd, 0x11d0, 0x85, 0x2c, 0x00, 0xc0, 0x4f, 0xd8, 0xd5, 0x03 };
  /*[id(0x00000003)]*/ int get_AclRevision(out int retval);
  /*[id(0x00000003)]*/ int set_AclRevision(int retval);
  /*[id(0x00000004)]*/ int get_AceCount(out int retval);
  /*[id(0x00000004)]*/ int set_AceCount(int retval);
  /*[id(0x00000005)]*/ int AddAce(IDispatch pAccessControlEntry);
  /*[id(0x00000006)]*/ int RemoveAce(IDispatch pAccessControlEntry);
  /*[id(0x00000007)]*/ int CopyAccessList(out IDispatch ppAccessControlList);
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown retval);
}

interface IADsSecurityDescriptor : IDispatch {
  mixin(uuid("b8c787ca-9bdd-11d0-852c-00c04fd8d503"));
  // static DWINGUID IID = { 0xb8c787ca, 0x9bdd, 0x11d0, 0x85, 0x2c, 0x00, 0xc0, 0x4f, 0xd8, 0xd5, 0x03 };
  /*[id(0x00000002)]*/ int get_Revision(out int retval);
  /*[id(0x00000002)]*/ int set_Revision(int retval);
  /*[id(0x00000003)]*/ int get_Control(out int retval);
  /*[id(0x00000003)]*/ int set_Control(int retval);
  /*[id(0x00000004)]*/ int get_Owner(out wchar* retval);
  /*[id(0x00000004)]*/ int set_Owner(wchar* retval);
  /*[id(0x00000005)]*/ int get_OwnerDefaulted(out short retval);
  /*[id(0x00000005)]*/ int set_OwnerDefaulted(short retval);
  /*[id(0x00000006)]*/ int get_Group(out wchar* retval);
  /*[id(0x00000006)]*/ int set_Group(wchar* retval);
  /*[id(0x00000007)]*/ int get_GroupDefaulted(out short retval);
  /*[id(0x00000007)]*/ int set_GroupDefaulted(short retval);
  /*[id(0x00000008)]*/ int get_DiscretionaryAcl(out IDispatch retval);
  /*[id(0x00000008)]*/ int set_DiscretionaryAcl(IDispatch retval);
  /*[id(0x00000009)]*/ int get_DaclDefaulted(out short retval);
  /*[id(0x00000009)]*/ int set_DaclDefaulted(short retval);
  /*[id(0x0000000A)]*/ int get_SystemAcl(out IDispatch retval);
  /*[id(0x0000000A)]*/ int set_SystemAcl(IDispatch retval);
  /*[id(0x0000000B)]*/ int get_SaclDefaulted(out short retval);
  /*[id(0x0000000B)]*/ int set_SaclDefaulted(short retval);
  /*[id(0x0000000C)]*/ int CopySecurityDescriptor(out IDispatch ppSecurityDescriptor);
}

interface IADsLargeInteger : IDispatch {
  mixin(uuid("9068270b-0939-11d1-8be1-00c04fd8d503"));
  // static DWINGUID IID = { 0x9068270b, 0x0939, 0x11d1, 0x8b, 0xe1, 0x00, 0xc0, 0x4f, 0xd8, 0xd5, 0x03 };
  /*[id(0x00000002)]*/ int get_HighPart(out int retval);
  /*[id(0x00000002)]*/ int set_HighPart(int retval);
  /*[id(0x00000003)]*/ int get_LowPart(out int retval);
  /*[id(0x00000003)]*/ int set_LowPart(int retval);
}

interface IADsNameTranslate : IDispatch {
  mixin(uuid("b1b272a3-3625-11d1-a3a4-00c04fb950dc"));
  // static DWINGUID IID = { 0xb1b272a3, 0x3625, 0x11d1, 0xa3, 0xa4, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  /*[id(0x00000001)]*/ int set_ChaseReferral(int value);
  /*[id(0x00000002)]*/ int Init(int lnSetType, wchar* bstrADsPath);
  /*[id(0x00000003)]*/ int InitEx(int lnSetType, wchar* bstrADsPath, wchar* bstrUserID, wchar* bstrDomain, wchar* bstrPassword);
  /*[id(0x00000004)]*/ int Set(int lnSetType, wchar* bstrADsPath);
  /*[id(0x00000005)]*/ int Get(int lnFormatType, out wchar* pbstrADsPath);
  /*[id(0x00000006)]*/ int SetEx(int lnFormatType, DWINVARIANT pVar);
  /*[id(0x00000007)]*/ int GetEx(int lnFormatType, out DWINVARIANT pVar);
}

interface IADsCaseIgnoreList : IDispatch {
  mixin(uuid("7b66b533-4680-11d1-a3b4-00c04fb950dc"));
  // static DWINGUID IID = { 0x7b66b533, 0x4680, 0x11d1, 0xa3, 0xb4, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  /*[id(0x00000002)]*/ int get_CaseIgnoreList(out DWINVARIANT retval);
  /*[id(0x00000002)]*/ int set_CaseIgnoreList(DWINVARIANT retval);
}

interface IADsFaxNumber : IDispatch {
  mixin(uuid("a910dea9-4680-11d1-a3b4-00c04fb950dc"));
  // static DWINGUID IID = { 0xa910dea9, 0x4680, 0x11d1, 0xa3, 0xb4, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  /*[id(0x00000002)]*/ int get_TelephoneNumber(out wchar* retval);
  /*[id(0x00000002)]*/ int set_TelephoneNumber(wchar* retval);
  /*[id(0x00000003)]*/ int get_Parameters(out DWINVARIANT retval);
  /*[id(0x00000003)]*/ int set_Parameters(DWINVARIANT retval);
}

interface IADsNetAddress : IDispatch {
  mixin(uuid("b21a50a9-4080-11d1-a3ac-00c04fb950dc"));
  // static DWINGUID IID = { 0xb21a50a9, 0x4080, 0x11d1, 0xa3, 0xac, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  /*[id(0x00000002)]*/ int get_AddressType(out int retval);
  /*[id(0x00000002)]*/ int set_AddressType(int retval);
  /*[id(0x00000003)]*/ int get_Address(out DWINVARIANT retval);
  /*[id(0x00000003)]*/ int set_Address(DWINVARIANT retval);
}

interface IADsOctetList : IDispatch {
  mixin(uuid("7b28b80f-4680-11d1-a3b4-00c04fb950dc"));
  // static DWINGUID IID = { 0x7b28b80f, 0x4680, 0x11d1, 0xa3, 0xb4, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  /*[id(0x00000002)]*/ int get_OctetList(out DWINVARIANT retval);
  /*[id(0x00000002)]*/ int set_OctetList(DWINVARIANT retval);
}

interface IADsEmail : IDispatch {
  mixin(uuid("97af011a-478e-11d1-a3b4-00c04fb950dc"));
  // static DWINGUID IID = { 0x97af011a, 0x478e, 0x11d1, 0xa3, 0xb4, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  /*[id(0x00000002)]*/ int get_Type(out int retval);
  /*[id(0x00000002)]*/ int set_Type(int retval);
  /*[id(0x00000003)]*/ int get_Address(out wchar* retval);
  /*[id(0x00000003)]*/ int set_Address(wchar* retval);
}

interface IADsPath : IDispatch {
  mixin(uuid("b287fcd5-4080-11d1-a3ac-00c04fb950dc"));
  // static DWINGUID IID = { 0xb287fcd5, 0x4080, 0x11d1, 0xa3, 0xac, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  /*[id(0x00000002)]*/ int get_Type(out int retval);
  /*[id(0x00000002)]*/ int set_Type(int retval);
  /*[id(0x00000003)]*/ int get_VolumeName(out wchar* retval);
  /*[id(0x00000003)]*/ int set_VolumeName(wchar* retval);
  /*[id(0x00000004)]*/ int get_Path(out wchar* retval);
  /*[id(0x00000004)]*/ int set_Path(wchar* retval);
}

interface IADsReplicaPointer : IDispatch {
  mixin(uuid("f60fb803-4080-11d1-a3ac-00c04fb950dc"));
  // static DWINGUID IID = { 0xf60fb803, 0x4080, 0x11d1, 0xa3, 0xac, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  /*[id(0x00000002)]*/ int get_ServerName(out wchar* retval);
  /*[id(0x00000002)]*/ int set_ServerName(wchar* retval);
  /*[id(0x00000003)]*/ int get_ReplicaType(out int retval);
  /*[id(0x00000003)]*/ int set_ReplicaType(int retval);
  /*[id(0x00000004)]*/ int get_ReplicaNumber(out int retval);
  /*[id(0x00000004)]*/ int set_ReplicaNumber(int retval);
  /*[id(0x00000005)]*/ int get_Count(out int retval);
  /*[id(0x00000005)]*/ int set_Count(int retval);
  /*[id(0x00000006)]*/ int get_ReplicaAddressHints(out DWINVARIANT retval);
  /*[id(0x00000006)]*/ int set_ReplicaAddressHints(DWINVARIANT retval);
}

interface IADsAcl : IDispatch {
  mixin(uuid("8452d3ab-0869-11d1-a377-00c04fb950dc"));
  // static DWINGUID IID = { 0x8452d3ab, 0x0869, 0x11d1, 0xa3, 0x77, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  /*[id(0x00000002)]*/ int get_ProtectedAttrName(out wchar* retval);
  /*[id(0x00000002)]*/ int set_ProtectedAttrName(wchar* retval);
  /*[id(0x00000003)]*/ int get_SubjectName(out wchar* retval);
  /*[id(0x00000003)]*/ int set_SubjectName(wchar* retval);
  /*[id(0x00000004)]*/ int get_Privileges(out int retval);
  /*[id(0x00000004)]*/ int set_Privileges(int retval);
  /*[id(0x00000005)]*/ int CopyAcl(out IDispatch ppAcl);
}

interface IADsTimestamp : IDispatch {
  mixin(uuid("b2f5a901-4080-11d1-a3ac-00c04fb950dc"));
  // static DWINGUID IID = { 0xb2f5a901, 0x4080, 0x11d1, 0xa3, 0xac, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  /*[id(0x00000002)]*/ int get_WholeSeconds(out int retval);
  /*[id(0x00000002)]*/ int set_WholeSeconds(int retval);
  /*[id(0x00000003)]*/ int get_EventID(out int retval);
  /*[id(0x00000003)]*/ int set_EventID(int retval);
}

interface IADsPostalAddress : IDispatch {
  mixin(uuid("7adecf29-4680-11d1-a3b4-00c04fb950dc"));
  // static DWINGUID IID = { 0x7adecf29, 0x4680, 0x11d1, 0xa3, 0xb4, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  /*[id(0x00000002)]*/ int get_PostalAddress(out DWINVARIANT retval);
  /*[id(0x00000002)]*/ int set_PostalAddress(DWINVARIANT retval);
}

interface IADsBackLink : IDispatch {
  mixin(uuid("fd1302bd-4080-11d1-a3ac-00c04fb950dc"));
  // static DWINGUID IID = { 0xfd1302bd, 0x4080, 0x11d1, 0xa3, 0xac, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  /*[id(0x00000002)]*/ int get_RemoteID(out int retval);
  /*[id(0x00000002)]*/ int set_RemoteID(int retval);
  /*[id(0x00000003)]*/ int get_ObjectName(out wchar* retval);
  /*[id(0x00000003)]*/ int set_ObjectName(wchar* retval);
}

interface IADsTypedName : IDispatch {
  mixin(uuid("b371a349-4080-11d1-a3ac-00c04fb950dc"));
  // static DWINGUID IID = { 0xb371a349, 0x4080, 0x11d1, 0xa3, 0xac, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  /*[id(0x00000002)]*/ int get_ObjectName(out wchar* retval);
  /*[id(0x00000002)]*/ int set_ObjectName(wchar* retval);
  /*[id(0x00000003)]*/ int get_Level(out int retval);
  /*[id(0x00000003)]*/ int set_Level(int retval);
  /*[id(0x00000004)]*/ int get_Interval(out int retval);
  /*[id(0x00000004)]*/ int set_Interval(int retval);
}

interface IADsHold : IDispatch {
  mixin(uuid("b3eb3b37-4080-11d1-a3ac-00c04fb950dc"));
  // static DWINGUID IID = { 0xb3eb3b37, 0x4080, 0x11d1, 0xa3, 0xac, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  /*[id(0x00000002)]*/ int get_ObjectName(out wchar* retval);
  /*[id(0x00000002)]*/ int set_ObjectName(wchar* retval);
  /*[id(0x00000003)]*/ int get_Amount(out int retval);
  /*[id(0x00000003)]*/ int set_Amount(int retval);
}

interface IADsObjectOptions : IDispatch {
  mixin(uuid("46f14fda-232b-11d1-a808-00c04fd8d5a8"));
  // static DWINGUID IID = { 0x46f14fda, 0x232b, 0x11d1, 0xa8, 0x08, 0x00, 0xc0, 0x4f, 0xd8, 0xd5, 0xa8 };
  /*[id(0x00000002)]*/ int GetOption(int lnOption, out DWINVARIANT pvValue);
  /*[id(0x00000003)]*/ int SetOption(int lnOption, DWINVARIANT vValue);
}

interface IADsPathname : IDispatch {
  mixin(uuid("d592aed4-f420-11d0-a36e-00c04fb950dc"));
  // static DWINGUID IID = { 0xd592aed4, 0xf420, 0x11d0, 0xa3, 0x6e, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  /*[id(0x00000002)]*/ int Set(wchar* bstrADsPath, int lnSetType);
  /*[id(0x00000003)]*/ int SetDisplayType(int lnDisplayType);
  /*[id(0x00000004)]*/ int Retrieve(int lnFormatType, out wchar* pbstrADsPath);
  /*[id(0x00000005)]*/ int GetNumElements(out int plnNumPathElements);
  /*[id(0x00000006)]*/ int GetElement(int lnElementIndex, out wchar* pbstrElement);
  /*[id(0x00000007)]*/ int AddLeafElement(wchar* bstrLeafElement);
  /*[id(0x00000008)]*/ int RemoveLeafElement();
  /*[id(0x00000009)]*/ int CopyPath(out IDispatch ppAdsPath);
  /*[id(0x0000000A)]*/ int GetEscapedElement(int lnReserved, wchar* bstrInStr, out wchar* pbstrOutStr);
  /*[id(0x0000000B)]*/ int get_EscapedMode(out int retval);
  /*[id(0x0000000B)]*/ int set_EscapedMode(int retval);
}

interface IADsADSystemInfo : IDispatch {
  mixin(uuid("5bb11929-afd1-11d2-9cb9-0000f87a369e"));
  // static DWINGUID IID = { 0x5bb11929, 0xafd1, 0x11d2, 0x9c, 0xb9, 0x00, 0x00, 0xf8, 0x7a, 0x36, 0x9e };
  /*[id(0x00000002)]*/ int get_UserName(out wchar* retval);
  /*[id(0x00000003)]*/ int get_ComputerName(out wchar* retval);
  /*[id(0x00000004)]*/ int get_SiteName(out wchar* retval);
  /*[id(0x00000005)]*/ int get_DomainShortName(out wchar* retval);
  /*[id(0x00000006)]*/ int get_DomainDNSName(out wchar* retval);
  /*[id(0x00000007)]*/ int get_ForestDNSName(out wchar* retval);
  /*[id(0x00000008)]*/ int get_PDCRoleOwner(out wchar* retval);
  /*[id(0x00000009)]*/ int get_SchemaRoleOwner(out wchar* retval);
  /*[id(0x0000000A)]*/ int get_IsNativeMode(out short retval);
  /*[id(0x0000000B)]*/ int GetAnyDCName(out wchar* pszDCName);
  /*[id(0x0000000C)]*/ int GetDCSiteName(wchar* szServer, out wchar* pszSiteName);
  /*[id(0x0000000D)]*/ int RefreshSchemaCache();
  /*[id(0x0000000E)]*/ int GetTrees(out DWINVARIANT pvTrees);
}

interface IADsWinNTSystemInfo : IDispatch {
  mixin(uuid("6c6d65dc-afd1-11d2-9cb9-0000f87a369e"));
  // static DWINGUID IID = { 0x6c6d65dc, 0xafd1, 0x11d2, 0x9c, 0xb9, 0x00, 0x00, 0xf8, 0x7a, 0x36, 0x9e };
  /*[id(0x00000002)]*/ int get_UserName(out wchar* retval);
  /*[id(0x00000003)]*/ int get_ComputerName(out wchar* retval);
  /*[id(0x00000004)]*/ int get_DomainName(out wchar* retval);
  /*[id(0x00000005)]*/ int get_PDC(out wchar* retval);
}

interface IADsDNWithBinary : IDispatch {
  mixin(uuid("7e99c0a2-f935-11d2-ba96-00c04fb6d0d1"));
  // static DWINGUID IID = { 0x7e99c0a2, 0xf935, 0x11d2, 0xba, 0x96, 0x00, 0xc0, 0x4f, 0xb6, 0xd0, 0xd1 };
  /*[id(0x00000002)]*/ int get_BinaryValue(out DWINVARIANT retval);
  /*[id(0x00000002)]*/ int set_BinaryValue(DWINVARIANT retval);
  /*[id(0x00000003)]*/ int get_DNString(out wchar* retval);
  /*[id(0x00000003)]*/ int set_DNString(wchar* retval);
}

interface IADsDNWithString : IDispatch {
  mixin(uuid("370df02e-f934-11d2-ba96-00c04fb6d0d1"));
  // static DWINGUID IID = { 0x370df02e, 0xf934, 0x11d2, 0xba, 0x96, 0x00, 0xc0, 0x4f, 0xb6, 0xd0, 0xd1 };
  /*[id(0x00000002)]*/ int get_StringValue(out wchar* retval);
  /*[id(0x00000002)]*/ int set_StringValue(wchar* retval);
  /*[id(0x00000003)]*/ int get_DNString(out wchar* retval);
  /*[id(0x00000003)]*/ int set_DNString(wchar* retval);
}

interface IADsSecurityUtility : IDispatch {
  mixin(uuid("a63251b2-5f21-474b-ab52-4a8efad10895"));
  // static DWINGUID IID = { 0xa63251b2, 0x5f21, 0x474b, 0xab, 0x52, 0x4a, 0x8e, 0xfa, 0xd1, 0x08, 0x95 };
  /*[id(0x00000002)]*/ int GetSecurityDescriptor(DWINVARIANT varPath, int lPathFormat, int lFormat, out DWINVARIANT pVariant);
  /*[id(0x00000003)]*/ int SetSecurityDescriptor(DWINVARIANT varPath, int lPathFormat, DWINVARIANT varData, int lDataFormat);
  /*[id(0x00000004)]*/ int ConvertSecurityDescriptor(DWINVARIANT varSD, int lDataFormat, int lOutFormat, out DWINVARIANT pResult);
  /*[id(0x00000005)]*/ int get_SecurityMask(out int retval);
  /*[id(0x00000005)]*/ int set_SecurityMask(int retval);
}

// CoClasses

abstract class PropertyEntry {
  mixin(uuid("72d3edc2-a4c4-11d0-8533-00c04fd8d503"));
  // static DWINGUID CLSID = { 0x72d3edc2, 0xa4c4, 0x11d0, 0x85, 0x33, 0x00, 0xc0, 0x4f, 0xd8, 0xd5, 0x03 };
  mixin Interfaces!(IADsPropertyEntry, IDispatch);
}

abstract class PropertyValue {
  mixin(uuid("7b9e38b0-a97c-11d0-8534-00c04fd8d503"));
  // static DWINGUID CLSID = { 0x7b9e38b0, 0xa97c, 0x11d0, 0x85, 0x34, 0x00, 0xc0, 0x4f, 0xd8, 0xd5, 0x03 };
  mixin Interfaces!(IADsPropertyValue, IDispatch);
}

abstract class AccessControlEntry {
  mixin(uuid("b75ac000-9bdd-11d0-852c-00c04fd8d503"));
  // static DWINGUID CLSID = { 0xb75ac000, 0x9bdd, 0x11d0, 0x85, 0x2c, 0x00, 0xc0, 0x4f, 0xd8, 0xd5, 0x03 };
  mixin Interfaces!(IADsAccessControlEntry, IDispatch);
}

abstract class AccessControlList {
  mixin(uuid("b85ea052-9bdd-11d0-852c-00c04fd8d503"));
  // static DWINGUID CLSID = { 0xb85ea052, 0x9bdd, 0x11d0, 0x85, 0x2c, 0x00, 0xc0, 0x4f, 0xd8, 0xd5, 0x03 };
  mixin Interfaces!(IADsAccessControlList, IDispatch);
}

abstract class SecurityDescriptor {
  mixin(uuid("b958f73c-9bdd-11d0-852c-00c04fd8d503"));
  // static DWINGUID CLSID = { 0xb958f73c, 0x9bdd, 0x11d0, 0x85, 0x2c, 0x00, 0xc0, 0x4f, 0xd8, 0xd5, 0x03 };
  mixin Interfaces!(IADsSecurityDescriptor, IDispatch);
}

abstract class LargeInteger {
  mixin(uuid("927971f5-0939-11d1-8be1-00c04fd8d503"));
  // static DWINGUID CLSID = { 0x927971f5, 0x0939, 0x11d1, 0x8b, 0xe1, 0x00, 0xc0, 0x4f, 0xd8, 0xd5, 0x03 };
  mixin Interfaces!(IADsLargeInteger, IDispatch);
}

abstract class NameTranslate {
  mixin(uuid("274fae1f-3626-11d1-a3a4-00c04fb950dc"));
  // static DWINGUID CLSID = { 0x274fae1f, 0x3626, 0x11d1, 0xa3, 0xa4, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  mixin Interfaces!(IADsNameTranslate, IDispatch);
}

abstract class CaseIgnoreList {
  mixin(uuid("15f88a55-4680-11d1-a3b4-00c04fb950dc"));
  // static DWINGUID CLSID = { 0x15f88a55, 0x4680, 0x11d1, 0xa3, 0xb4, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  mixin Interfaces!(IADsCaseIgnoreList, IDispatch);
}

abstract class FaxNumber {
  mixin(uuid("a5062215-4681-11d1-a3b4-00c04fb950dc"));
  // static DWINGUID CLSID = { 0xa5062215, 0x4681, 0x11d1, 0xa3, 0xb4, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  mixin Interfaces!(IADsFaxNumber, IDispatch);
}

abstract class NetAddress {
  mixin(uuid("b0b71247-4080-11d1-a3ac-00c04fb950dc"));
  // static DWINGUID CLSID = { 0xb0b71247, 0x4080, 0x11d1, 0xa3, 0xac, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  mixin Interfaces!(IADsNetAddress, IDispatch);
}

abstract class OctetList {
  mixin(uuid("1241400f-4680-11d1-a3b4-00c04fb950dc"));
  // static DWINGUID CLSID = { 0x1241400f, 0x4680, 0x11d1, 0xa3, 0xb4, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  mixin Interfaces!(IADsOctetList, IDispatch);
}

abstract class Email {
  mixin(uuid("8f92a857-478e-11d1-a3b4-00c04fb950dc"));
  // static DWINGUID CLSID = { 0x8f92a857, 0x478e, 0x11d1, 0xa3, 0xb4, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  mixin Interfaces!(IADsEmail, IDispatch);
}

abstract class Path {
  mixin(uuid("b2538919-4080-11d1-a3ac-00c04fb950dc"));
  // static DWINGUID CLSID = { 0xb2538919, 0x4080, 0x11d1, 0xa3, 0xac, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  mixin Interfaces!(IADsPath, IDispatch);
}

abstract class ReplicaPointer {
  mixin(uuid("f5d1badf-4080-11d1-a3ac-00c04fb950dc"));
  // static DWINGUID CLSID = { 0xf5d1badf, 0x4080, 0x11d1, 0xa3, 0xac, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  mixin Interfaces!(IADsReplicaPointer, IDispatch);
}

abstract class Timestamp {
  mixin(uuid("b2bed2eb-4080-11d1-a3ac-00c04fb950dc"));
  // static DWINGUID CLSID = { 0xb2bed2eb, 0x4080, 0x11d1, 0xa3, 0xac, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  mixin Interfaces!(IADsTimestamp, IDispatch);
}

abstract class PostalAddress {
  mixin(uuid("0a75afcd-4680-11d1-a3b4-00c04fb950dc"));
  // static DWINGUID CLSID = { 0x0a75afcd, 0x4680, 0x11d1, 0xa3, 0xb4, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  mixin Interfaces!(IADsPostalAddress, IDispatch);
}

abstract class BackLink {
  mixin(uuid("fcbf906f-4080-11d1-a3ac-00c04fb950dc"));
  // static DWINGUID CLSID = { 0xfcbf906f, 0x4080, 0x11d1, 0xa3, 0xac, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  mixin Interfaces!(IADsBackLink, IDispatch);
}

abstract class TypedName {
  mixin(uuid("b33143cb-4080-11d1-a3ac-00c04fb950dc"));
  // static DWINGUID CLSID = { 0xb33143cb, 0x4080, 0x11d1, 0xa3, 0xac, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  mixin Interfaces!(IADsTypedName, IDispatch);
}

abstract class Hold {
  mixin(uuid("b3ad3e13-4080-11d1-a3ac-00c04fb950dc"));
  // static DWINGUID CLSID = { 0xb3ad3e13, 0x4080, 0x11d1, 0xa3, 0xac, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  mixin Interfaces!(IADsHold, IDispatch);
}

abstract class Pathname {
  mixin(uuid("080d0d78-f421-11d0-a36e-00c04fb950dc"));
  // static DWINGUID CLSID = { 0x080d0d78, 0xf421, 0x11d0, 0xa3, 0x6e, 0x00, 0xc0, 0x4f, 0xb9, 0x50, 0xdc };
  mixin Interfaces!(IADsPathname, IDispatch);
}

abstract class ADSystemInfo {
  mixin(uuid("50b6327f-afd1-11d2-9cb9-0000f87a369e"));
  // static DWINGUID CLSID = { 0x50b6327f, 0xafd1, 0x11d2, 0x9c, 0xb9, 0x00, 0x00, 0xf8, 0x7a, 0x36, 0x9e };
  mixin Interfaces!(IADsADSystemInfo, IDispatch);
}

abstract class WinNTSystemInfo {
  mixin(uuid("66182ec4-afd1-11d2-9cb9-0000f87a369e"));
  // static DWINGUID CLSID = { 0x66182ec4, 0xafd1, 0x11d2, 0x9c, 0xb9, 0x00, 0x00, 0xf8, 0x7a, 0x36, 0x9e };
  mixin Interfaces!(IADsWinNTSystemInfo, IDispatch);
}

abstract class DNWithBinary {
  mixin(uuid("7e99c0a3-f935-11d2-ba96-00c04fb6d0d1"));
  // static DWINGUID CLSID = { 0x7e99c0a3, 0xf935, 0x11d2, 0xba, 0x96, 0x00, 0xc0, 0x4f, 0xb6, 0xd0, 0xd1 };
  mixin Interfaces!(IADsDNWithBinary, IDispatch);
}

abstract class DNWithString {
  mixin(uuid("334857cc-f934-11d2-ba96-00c04fb6d0d1"));
  // static DWINGUID CLSID = { 0x334857cc, 0xf934, 0x11d2, 0xba, 0x96, 0x00, 0xc0, 0x4f, 0xb6, 0xd0, 0xd1 };
  mixin Interfaces!(IADsDNWithString, IDispatch);
}

abstract class ADsSecurityUtility {
  mixin(uuid("f270c64a-ffb8-4ae4-85fe-3a75e5347966"));
  // static DWINGUID CLSID = { 0xf270c64a, 0xffb8, 0x4ae4, 0x85, 0xfe, 0x3a, 0x75, 0xe5, 0x34, 0x79, 0x66 };
  mixin Interfaces!(IADsSecurityUtility, IDispatch);
}
