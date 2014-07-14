// Microsoft Disk Quota Type Library
// Version 1.0

/*[uuid("7988b57c-ec89-11cf-9c00-00aa00a14f56")]*/
//module dwin.sys.win32.com.tlb.more.diskquotatypelibrary;
module dwin.sys.win32.com.tlb.more.diskquota;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum AccountStatusConstants {
  dqAcctResolved = 0x00000000,
  dqAcctUnavailable = 0x00000001,
  dqAcctDeleted = 0x00000002,
  dqAcctInvalid = 0x00000003,
  dqAcctUnknown = 0x00000004,
  dqAcctUnresolved = 0x00000005,
}

enum QuotaStateConstants {
  dqStateDisable = 0x00000000,
  dqStateTrack = 0x00000001,
  dqStateEnforce = 0x00000002,
}

enum UserNameResolutionConstants {
  dqResolveNone = 0x00000000,
  dqResolveSync = 0x00000001,
  dqResolveAsync = 0x00000002,
}

// Interfaces

// Automation interface for DiskQuotaUser
interface DIDiskQuotaUser : IDispatch {
  mixin(uuid("7988b57a-ec89-11cf-9c00-00aa00a14f56"));
  // static DWINGUID IID = { 0x7988b57a, 0xec89, 0x11cf, 0x9c, 0x00, 0x00, 0xaa, 0x00, 0xa1, 0x4f, 0x56 };
  // Unique ID number
  /*[id(0x60020000)]*/ int get_ID(out int pID);
  // Name of user's account container
  /*[id(0x60020001)]*/ int get_AccountContainerName(out wchar* pContainerName);
  // User's logon account name
  /*[id(0x60020002)]*/ int get_LogonName(out wchar* pLogonName);
  // User's display name
  /*[id(0x60020003)]*/ int get_DisplayName(out wchar* pDisplayName);
  // User's quota warning threshold (bytes)
  /*[id(0x60020004)]*/ int get_QuotaThreshold(out double pThreshold);
  // User's quota warning threshold (bytes)
  /*[id(0x60020004)]*/ int set_QuotaThreshold(double pThreshold);
  // User's quota warning threshold (text)
  /*[id(0x60020006)]*/ int get_QuotaThresholdText(out wchar* pThresholdText);
  // User's quota limit (bytes)
  /*[id(0x60020007)]*/ int get_QuotaLimit(out double pLimit);
  // User's quota limit (bytes)
  /*[id(0x60020007)]*/ int set_QuotaLimit(double pLimit);
  // User's quota limit (text)
  /*[id(0x60020009)]*/ int get_QuotaLimitText(out wchar* pLimitText);
  // Quota charged to user (bytes)
  /*[id(0x6002000A)]*/ int get_QuotaUsed(out double pUsed);
  // Quota charged to user (text)
  /*[id(0x6002000B)]*/ int get_QuotaUsedText(out wchar* pUsedText);
  // Status of user's account
  /*[id(0x6002000C)]*/ int get_AccountStatus(out AccountStatusConstants pStatus);
  // Invalidate data cached in user object
  /*[id(0x6002000D)]*/ int Invalidate();
}

// DIDiskQuotaControlEvents Interface
interface DIDiskQuotaControlEvents : IDispatch {
  mixin(uuid("7988b581-ec89-11cf-9c00-00aa00a14f56"));
  // static DWINGUID IID = { 0x7988b581, 0xec89, 0x11cf, 0x9c, 0x00, 0x00, 0xaa, 0x00, 0xa1, 0x4f, 0x56 };
  /+// Called when name information for a DiskQuotaUser object has been resolved
  /*[id(0x00000001)]*/ void OnUserNameChanged(DIDiskQuotaUser pUser);+/
}

// Automation interface for DiskQuotaControl object
interface DIDiskQuotaControl : IDispatch {
  mixin(uuid("7988b575-ec89-11cf-9c00-00aa00a14f56"));
  // static DWINGUID IID = { 0x7988b575, 0xec89, 0x11cf, 0x9c, 0x00, 0x00, 0xaa, 0x00, 0xa1, 0x4f, 0x56 };
  // State of the volume's disk quota system
  /*[id(0x60020000)]*/ int set_QuotaState(QuotaStateConstants pState);
  // State of the volume's disk quota system
  /*[id(0x60020000)]*/ int get_QuotaState(out QuotaStateConstants pState);
  // Indicates if quota information is out of date
  /*[id(0x60020002)]*/ int get_QuotaFileIncomplete(out short pbIncomplete);
  // Indicates if quota information is being rebuilt
  /*[id(0x60020003)]*/ int get_QuotaFileRebuilding(out short pbRebuilding);
  // Write event log entry when user exceeds quota warning threshold
  /*[id(0x60020004)]*/ int set_LogQuotaThreshold(short pbLogThreshold);
  // Write event log entry when user exceeds quota warning threshold
  /*[id(0x60020004)]*/ int get_LogQuotaThreshold(out short pbLogThreshold);
  // Write event log entry when user exceeds quota limit
  /*[id(0x60020006)]*/ int set_LogQuotaLimit(short pbLogLimit);
  // Write event log entry when user exceeds quota limit
  /*[id(0x60020006)]*/ int get_LogQuotaLimit(out short pbLogLimit);
  // Default warning threshold applied to new volume users (byte value)
  /*[id(0x60020008)]*/ int set_DefaultQuotaThreshold(double pThreshold);
  // Default warning threshold applied to new volume users (byte value)
  /*[id(0x60020008)]*/ int get_DefaultQuotaThreshold(out double pThreshold);
  // Default warning threshold applied to new volume users (text string)
  /*[id(0x6002000A)]*/ int get_DefaultQuotaThresholdText(out wchar* pThresholdText);
  // Default quota limit applied to new volume users (byte value)
  /*[id(0x6002000B)]*/ int set_DefaultQuotaLimit(double pLimit);
  // Default quota limit applied to new volume users (byte value)
  /*[id(0x6002000B)]*/ int get_DefaultQuotaLimit(out double pLimit);
  // Default quota limit applied to new volume users (text string)
  /*[id(0x6002000D)]*/ int get_DefaultQuotaLimitText(out wchar* pLimitText);
  // Control the resolution of user Security IDs to user Names
  /*[id(0x6002000E)]*/ int set_UserNameResolution(UserNameResolutionConstants pResolutionType);
  // Control the resolution of user Security IDs to user Names
  /*[id(0x6002000E)]*/ int get_UserNameResolution(out UserNameResolutionConstants pResolutionType);
  // Initialize the quota control object for a specified volume
  /*[id(0x60020010)]*/ int Initialize(wchar* path, short bReadWrite);
  // Terminate the user name resolution thread
  /*[id(0x60020011)]*/ int ShutdownNameResolution();
  // Add a user quota entry by Name
  /*[id(0x60020012)]*/ int AddUser(wchar* LogonName, out DIDiskQuotaUser ppUser);
  // Delete a user quota entry
  /*[id(0x60020013)]*/ int DeleteUser(DIDiskQuotaUser pUser);
  // Find a user quota entry by Name
  /*[id(0x60020014)]*/ int FindUser(wchar* LogonName, out DIDiskQuotaUser ppUser);
  // Invalidate the cache of user name information
  /*[id(0x60020015)]*/ int InvalidateSidNameCache();
  // Promote a user quota entry to the head of the name resolution queue
  /*[id(0x60020016)]*/ int GiveUserNameResolutionPriority(DIDiskQuotaUser pUser);
  // Translates a user logon name to a security ID
  /*[id(0x60020017)]*/ int TranslateLogonNameToSID(wchar* LogonName, out wchar* psid);
  // Create a Collection object for user quota entry enumeration.
  /*[id(0xFFFFFFFC)]*/ int _NewEnum(out IDispatch ppEnum);
}

// Dual interface for DiskQuotaControl Events
interface IDiskQuotaControlEvents : IDispatch {
  mixin(uuid("7988b579-ec89-11cf-9c00-00aa00a14f56"));
  // static DWINGUID IID = { 0x7988b579, 0xec89, 0x11cf, 0x9c, 0x00, 0x00, 0xaa, 0x00, 0xa1, 0x4f, 0x56 };
  /*[id(0x60020000)]*/ int OnUserNameChanged(DIDiskQuotaUser pUser);
}

// CoClasses

// Microsoft Disk Quota
abstract class DiskQuotaControl {
  mixin(uuid("7988b571-ec89-11cf-9c00-00aa00a14f56"));
  // static DWINGUID CLSID = { 0x7988b571, 0xec89, 0x11cf, 0x9c, 0x00, 0x00, 0xaa, 0x00, 0xa1, 0x4f, 0x56 };
  mixin Interfaces!(DIDiskQuotaControl, IDiskQuotaControlEvents, DIDiskQuotaUser);
}
