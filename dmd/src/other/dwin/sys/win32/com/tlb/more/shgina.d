// SHGINA 1.0 Type Library
// Version 1.0

/*[uuid("0a055c02-babe-4480-bb7b-a8ec723ce9c0")]*/
module dwin.sys.win32.com.tlb.more.shgina;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum ILUEOrder {
  ILEU_MOSTRECENT = 0x00000000,
  ILEU_ALPHABETICAL = 0x00000001,
}

enum ILM_GUEST_FLAGS {
  ILM_GUEST_ACCOUNT = 0x00000000,
  ILM_GUEST_INTERACTIVE_LOGON = 0x00000001,
  ILM_GUEST_NETWORK_LOGON = 0x00000002,
}

// Unions

union __MIDL_IWinTypes_0009 {
  int hInproc;
  int hRemote;
}

// Structs

struct _RemotableHandle {
  int fContext;
  __MIDL_IWinTypes_0009 u;
}

// Aliases

alias _RemotableHandle* wireHWND;

// Interfaces

// ILogonUser Interface
interface ILogonUser : IDispatch {
  mixin(uuid("60664caf-af0d-1003-a300-5c7d25ff22a0"));
  // static DWINGUID IID = { 0x60664caf, 0xaf0d, 0x1003, 0xa3, 0x00, 0x5c, 0x7d, 0x25, 0xff, 0x22, 0xa0 };
  // Get the named user setting.
  /*[id(0x00000001)]*/ int get_setting(wchar* bstrName, out DWINVARIANT pvarVal);
  // Get the named user setting.
  /*[id(0x00000001)]*/ int set_setting(wchar* bstrName, DWINVARIANT pvarVal);
  // Test whether the user is logged on.
  /*[id(0x00000002)]*/ int get_isLoggedOn(out short pbLoggedIn);
  // Test whether the user requires a password.
  /*[id(0x00000003)]*/ int get_passwordRequired(out short pbPasswordRequired);
  // Test whether the user has the interactive logon right.
  /*[id(0x00000004)]*/ int get_interactiveLogonAllowed(out short pbInteractiveLogonAllowed);
  // Check whether the user's profile folder is private.
  /*[id(0x00000005)]*/ int get_isProfilePrivate(out short pbPrivate);
  // Check whether the user has created a password reset disk.
  /*[id(0x00000006)]*/ int get_isPasswordResetAvailable(out short pbResetAvailable);
  // Log the user onto the system with the given password.
  /*[id(0x60020007)]*/ int logon(wchar* pstrPassword, out short pbRet);
  // Log the user off the system.
  /*[id(0x60020008)]*/ int logoff(out short pbRet);
  // Change the users password.
  /*[id(0x60020009)]*/ int changePassword(DWINVARIANT varNewPassword, DWINVARIANT varOldPassword, out short pbRet);
  // Set ACLs to make the user's profile folder private.
  /*[id(0x6002000A)]*/ int makeProfilePrivate(short bPrivate);
  // Get the email account name and number of unread messages.
  /*[id(0x6002000B)]*/ int getMailAccountInfo(uint uiAccountIndex, out DWINVARIANT pvarAccountName, out uint pcUnreadMessages);
}

// ILogonEnumUsers Interface
interface ILogonEnumUsers : IDispatch {
  mixin(uuid("60664caf-af0d-1004-a300-5c7d25ff22a0"));
  // static DWINGUID IID = { 0x60664caf, 0xaf0d, 0x1004, 0xa3, 0x00, 0x5c, 0x7d, 0x25, 0xff, 0x22, 0xa0 };
  // Get the current domain we are enumerating users on.
  /*[id(0x00000001)]*/ int get_Domain(out wchar* pbstr);
  // Get the current domain we are enumerating users on.
  /*[id(0x00000001)]*/ int set_Domain(wchar* pbstr);
  // Get the current enumeration flags.
  /*[id(0x00000002)]*/ int get_EnumFlags(out ILUEOrder porder);
  // Get the current enumeration flags.
  /*[id(0x00000002)]*/ int set_EnumFlags(ILUEOrder porder);
  // Get the total number of users.
  /*[id(0x00000003)]*/ int get_length(out uint pcUsers);
  // Get the current user.
  /*[id(0x00000006)]*/ int get_currentUser(out ILogonUser ppLogonUserInfo);
  // Return a LogonUser given the specified name/index.
  /*[id(0x00000000)]*/ int item(DWINVARIANT varUserId, out ILogonUser ppLogonUserInfo);
  // Return an IEnumVARIANT ojbect for all of the users.
  /*[id(0xFFFFFFFC)]*/ int _NewEnum(out IUnknown retval);
  // Create a new user.
  /*[id(0x00000004)]*/ int create(wchar* bstrLoginName, out ILogonUser ppLogonUser);
  // Delete a user.
  /*[id(0x00000005)]*/ int remove(DWINVARIANT varUserId, DWINVARIANT varBackupPath, out short pbSuccess);
}

// ILocalMachine Interface
interface ILocalMachine : IDispatch {
  mixin(uuid("60664caf-af0d-1005-a300-5c7d25ff22a0"));
  // static DWINGUID IID = { 0x60664caf, 0xaf0d, 0x1005, 0xa3, 0x00, 0x5c, 0x7d, 0x25, 0xff, 0x22, 0xa0 };
  // Get the machine name.
  /*[id(0x00000001)]*/ int get_MachineName(out DWINVARIANT pvarVal);
  // Test whether the Guest account is enabled.
  /*[id(0x00000002)]*/ int get_isGuestEnabled(ILM_GUEST_FLAGS flags, out short pbEnabled);
  // Test whether friendly UI is enabled.
  /*[id(0x00000003)]*/ int get_isFriendlyUIEnabled(out short pbEnabled);
  // Test whether friendly UI is enabled.
  /*[id(0x00000003)]*/ int set_isFriendlyUIEnabled(short pbEnabled);
  // Test whether multiple users is enabled.
  /*[id(0x00000004)]*/ int get_isMultipleUsersEnabled(out short pbEnabled);
  // Test whether multiple users is enabled.
  /*[id(0x00000004)]*/ int set_isMultipleUsersEnabled(short pbEnabled);
  // Test whether remote connections are enabled.
  /*[id(0x00000005)]*/ int get_isRemoteConnectionsEnabled(out short pbEnabled);
  // Test whether remote connections are enabled.
  /*[id(0x00000005)]*/ int set_isRemoteConnectionsEnabled(short pbEnabled);
  // Get a well-known user account name.
  /*[id(0x00000006)]*/ int get_AccountName(DWINVARIANT varAccount, out DWINVARIANT pvarVal);
  // Test whether the machine can be undocked.
  /*[id(0x00000007)]*/ int get_isUndockEnabled(out short pbEnabled);
  // Test whether the machine can be shut down.
  /*[id(0x00000008)]*/ int get_isShutdownAllowed(out short pbEnabled);
  // Test whether all network traffic will be treated as through it were local guest account.
  /*[id(0x00000009)]*/ int get_isGuestAccessMode(out short pbForceGuest);
  // Test whether Offline Files is enabled.
  /*[id(0x00000064)]*/ int get_isOfflineFilesEnabled(out short pbEnabled);
  // Turn Off Computer.
  /*[id(0x0000000A)]*/ int TurnOffComputer();
  // Signal UI host failure.
  /*[id(0x00000014)]*/ int SignalUIHostFailure();
  // Allow external credentials.
  /*[id(0x0000001E)]*/ int AllowExternalCredentials();
  // Request external credentials.
  /*[id(0x0000001F)]*/ int RequestExternalCredentials();
  // Logon with external credentials.
  /*[id(0x00000020)]*/ int LogonWithExternalCredentials(wchar* pstrUsername, wchar* pstrDomain, wchar* pstrPassword, out short pbRet);
  // Initiate interactive logon with credentials.
  /*[id(0x00000021)]*/ int InitiateInteractiveLogon(wchar* pstrUsername, wchar* pstrDomain, wchar* pstrPassword, uint dwTimeout, out short pbRet);
  // Undock Computer.
  /*[id(0x00000028)]*/ int UndockComputer();
  // Enable the Guest account for interactive and/or network logon.
  /*[id(0x00000032)]*/ int EnableGuest(ILM_GUEST_FLAGS flags);
  // Disable the Guest account for interactive and/or network logon.
  /*[id(0x00000033)]*/ int DisableGuest(ILM_GUEST_FLAGS flags);
}

// ILogonStatusHost Interface
interface ILogonStatusHost : IDispatch {
  mixin(uuid("60664caf-af0d-1007-a300-5c7d25ff22a0"));
  // static DWINGUID IID = { 0x60664caf, 0xaf0d, 0x1007, 0xa3, 0x00, 0x5c, 0x7d, 0x25, 0xff, 0x22, 0xa0 };
  // Initialize.
  /*[id(0x0000000A)]*/ int Initialize(void* hInstance, wireHWND hwndHost);
  // Window procedure helper.
  /*[id(0x0000000B)]*/ int WindowProcedureHelper(wireHWND hwnd, uint uMsg, DWINVARIANT wParam, DWINVARIANT lParam);
  // UnInitialize.
  /*[id(0x0000000C)]*/ int UnInitialize();
}

// CoClasses

// LogonUser Class
abstract class ShellLogonUser {
  mixin(uuid("60664caf-af0d-0003-a300-5c7d25ff22a0"));
  // static DWINGUID CLSID = { 0x60664caf, 0xaf0d, 0x0003, 0xa3, 0x00, 0x5c, 0x7d, 0x25, 0xff, 0x22, 0xa0 };
  mixin Interfaces!(ILogonUser);
}

// LogonEnumUsers Class
abstract class ShellLogonEnumUsers {
  mixin(uuid("60664caf-af0d-0004-a300-5c7d25ff22a0"));
  // static DWINGUID CLSID = { 0x60664caf, 0xaf0d, 0x0004, 0xa3, 0x00, 0x5c, 0x7d, 0x25, 0xff, 0x22, 0xa0 };
  mixin Interfaces!(ILogonEnumUsers);
}

// LocalMachine Class
abstract class ShellLocalMachine {
  mixin(uuid("60664caf-af0d-0005-a300-5c7d25ff22a0"));
  // static DWINGUID CLSID = { 0x60664caf, 0xaf0d, 0x0005, 0xa3, 0x00, 0x5c, 0x7d, 0x25, 0xff, 0x22, 0xa0 };
  mixin Interfaces!(ILocalMachine);
}

// LogonStatusHost Class
abstract class ShellLogonStatusHost {
  mixin(uuid("60664caf-af0d-0007-a300-5c7d25ff22a0"));
  // static DWINGUID CLSID = { 0x60664caf, 0xaf0d, 0x0007, 0xa3, 0x00, 0x5c, 0x7d, 0x25, 0xff, 0x22, 0xa0 };
  mixin Interfaces!(ILogonStatusHost);
}
