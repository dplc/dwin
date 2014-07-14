// rcbdyctl 1.0 Type Library
// Version 1.0

/*[uuid("d149c2b1-25bb-4d8c-9684-2696fda4af60")]*/
module dwin.sys.win32.com.tlb.more.rcbdyctl;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum __MIDL___MIDL_itf_rcbdyctl_0257_0001 {
  SS_UNKNOWN = 0x00000000,
  SS_READY = 0x00000001,
  SS_INVITATION = 0x00000002,
  SS_ACCEPTED = 0x00000003,
  SS_CONNECTED = 0x00000004,
  SS_CANCELLED = 0x00000005,
  SS_DECLINED = 0x00000006,
  SS_TERMINATED = 0x00000007,
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

alias __MIDL___MIDL_itf_rcbdyctl_0257_0001 SESSION_STATE;

alias _RemotableHandle* wireHWND;

// Interfaces

// IIMSession Interface
interface IIMSession : IDispatch {
  mixin(uuid("f3d16de6-045b-48cc-87ac-8ab75974685d"));
  // static DWINGUID IID = { 0xf3d16de6, 0x045b, 0x48cc, 0x87, 0xac, 0x8a, 0xb7, 0x59, 0x74, 0x68, 0x5d };
  // property OnSessionStatus
  /*[id(0x00000001)]*/ int set_OnSessionStatus(IDispatch value);
  // Send Expert Ticket
  /*[id(0x00000002)]*/ int SendOutExpertTicket(wchar* bstrTicket);
  // property ReceivedUserTicket
  /*[id(0x00000003)]*/ int get_ReceivedUserTicket(out wchar* pbstrVal);
  // property User
  /*[id(0x00000004)]*/ int get_User(out IDispatch ppUser);
  // Send Invitation
  /*[id(0x00000005)]*/ int HSC_Invite(IDispatch pUser);
  // ProcessContext
  /*[id(0x00000007)]*/ int ProcessContext(wchar* pContext);
  // Close RA Window
  /*[id(0x00000008)]*/ int CloseRA();
  // property GetLaunchingSession
  /*[id(0x00000009)]*/ int GetLaunchingSession(int ID);
  // HookUp existing session object
  /*[id(0x0000000A)]*/ int Hook(IMsgrSession __MIDL_0011, wireHWND __MIDL_0012);
  // Notify inviter/recipient
  /*[id(0x0000000B)]*/ int Notify(int __MIDL_0013);
  // ContextDataProperty
  /*[id(0x0000000C)]*/ int ContextDataProperty(wchar* pName, out wchar* ppValue);
  // IsInviter
  /*[id(0x0000000D)]*/ int get_IsInviter(out int ppValue);
}

// Messenger Session Interface
interface IMsgrSession : IDispatch {
  mixin(uuid("42d7cafc-0167-4941-a5d8-9fd7f104c41a"));
  // static DWINGUID IID = { 0x42d7cafc, 0x0167, 0x4941, 0xa5, 0xd8, 0x9f, 0xd7, 0xf1, 0x04, 0xc4, 0x1a };
  // Obtains the application DWINGUID set by the inviter for this session.
  /*[id(0x00000000)]*/ int get_Application(out wchar* pbstrAppGUID);
  // Obtains the application DWINGUID set by the inviter for this session.
  /*[id(0x00000000)]*/ int set_Application(wchar* pbstrAppGUID);
  // Gets the current state of the session.
  /*[id(0x00000001)]*/ int get_State(out SESSION_STATE pState);
  // Invites user to this session.
  /*[id(0x00000002)]*/ int Invite(IDispatch pUser, wchar* bstrAppData);
  // Decline an invitation.
  /*[id(0x00000003)]*/ int Decline(wchar* bstrAppData);
  // Cancel an invitation.
  /*[id(0x00000004)]*/ int Cancel(int hr, wchar* bstrAppData);
  // Accept an invitation.
  /*[id(0x00000005)]*/ int Accept(wchar* bstrAppData);
  // Retrieve the IP address of the other party in the session.
  /*[id(0x00000006)]*/ int get_RemoteAddress(out wchar* pbstrRemoteAddress);
  // Retrieve session ID.
  /*[id(0x00000007)]*/ int get_SessionID(out wchar* pbstrSessionID);
  // Retrieve the app-specific context data.
  /*[id(0x00000008)]*/ int get_ContextData(out wchar* pbstrData);
  // Retrieve the application name.
  /*[id(0x00000009)]*/ int get_ApplicationName(out wchar* pbstrName);
  // Retrieve the application URL.
  /*[id(0x0000000A)]*/ int get_ApplicationURL(out wchar* pbstrURL);
  // Retrieve the session flags.
  /*[id(0x0000000B)]*/ int get_Flags(out int plFlags);
  // Retrieve the other user.
  /*[id(0x0000000C)]*/ int get_User(out IDispatch ppUser);
  // Set the local IP address of the session.
  /*[id(0x0000000D)]*/ int set_LocalAddress(wchar* pbstrLocalAddress);
  // Set the local IP address of the session.
  /*[id(0x0000000D)]*/ int get_LocalAddress(out wchar* pbstrLocalAddress);
  // Send app-specific context data.
  /*[id(0x0000000E)]*/ int SendContextData(wchar* bstrData);
}

// Ismapi Interface
interface Ismapi : IDispatch {
  mixin(uuid("11685fca-2787-4235-ace5-aa92af5dd900"));
  // static DWINGUID IID = { 0x11685fca, 0x2787, 0x4235, 0xac, 0xe5, 0xaa, 0x92, 0xaf, 0x5d, 0xd9, 0x00 };
  // method Logon
  /*[id(0x00000001)]*/ int Logon(out uint plRet);
  // method Logoff
  /*[id(0x00000002)]*/ int Logoff();
  // method OpenAddressBox
  /*[id(0x00000003)]*/ int OpenAddressBox();
  // method AddRecipient
  /*[id(0x00000004)]*/ int AddRecipient(wchar* newRecip);
  // method ClearRecipList
  /*[id(0x00000005)]*/ int ClearRecipList();
  // method SendMail
  /*[id(0x00000006)]*/ int SendMail(out int plStatus);
  // property Recipients
  /*[id(0x00000007)]*/ int get_Recipients(out IRecipients pVal);
  // property Subject
  /*[id(0x00000008)]*/ int get_Subject(out wchar* pVal);
  // property Subject
  /*[id(0x00000008)]*/ int set_Subject(wchar* pVal);
  // property Body
  /*[id(0x00000009)]*/ int get_Body(out wchar* pVal);
  // property Body
  /*[id(0x00000009)]*/ int set_Body(wchar* pVal);
  // property AttachedXMLFile
  /*[id(0x0000000A)]*/ int get_AttachedXMLFile(out wchar* pVal);
  // property AttachedXMLFile
  /*[id(0x0000000A)]*/ int set_AttachedXMLFile(wchar* pVal);
  // property SMAPI email client
  /*[id(0x0000000B)]*/ int get_SMAPIClientName(out wchar* pVal);
  // property IsSMAPIClient_OE
  /*[id(0x0000000C)]*/ int get_IsSMAPIClient_OE(out int pVal);
  // Reload
  /*[id(0x0000000D)]*/ int get_Reload(out int pVal);
}

// IRecipients Interface
interface IRecipients : IDispatch {
  mixin(uuid("5049bf87-9ba1-4b8e-8fec-5ad21d9c63ac"));
  // static DWINGUID IID = { 0x5049bf87, 0x9ba1, 0x4b8e, 0x8f, 0xec, 0x5a, 0xd2, 0x1d, 0x9c, 0x63, 0xac };
  // property _NewEnum
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown pVal);
  // property Item
  /*[id(0x00000000)]*/ int get_Item(int vIndex, out IRecipient pVal);
  // property Count
  /*[id(0x00000001)]*/ int get_Count(out int pVal);
}

// IRecipient Interface
interface IRecipient : IDispatch {
  mixin(uuid("6a5ed548-6dfd-4c7b-b377-526899d148b1"));
  // static DWINGUID IID = { 0x6a5ed548, 0x6dfd, 0x4c7b, 0xb3, 0x77, 0x52, 0x68, 0x99, 0xd1, 0x48, 0xb1 };
  // property Name
  /*[id(0x00000001)]*/ int get_Name(out wchar* pVal);
  // property Name
  /*[id(0x00000001)]*/ int set_Name(wchar* pVal);
  // property Address
  /*[id(0x00000002)]*/ int get_Address(out wchar* pVal);
  // property Address
  /*[id(0x00000002)]*/ int set_Address(wchar* pVal);
}

// ISetting Interface
interface ISetting : IDispatch {
  mixin(uuid("22ff2143-d949-47ed-b912-aade1e3b67f3"));
  // static DWINGUID IID = { 0x22ff2143, 0xd949, 0x47ed, 0xb9, 0x12, 0xaa, 0xde, 0x1e, 0x3b, 0x67, 0xf3 };
  // property GetIPAddress
  /*[id(0x00000001)]*/ int get_GetIPAddress(out wchar* pVal);
  // property CreatePassword
  /*[id(0x00000005)]*/ int get_CreatePassword(out wchar* pVal);
  // property GetPropertyInBlob
  /*[id(0x00000006)]*/ int get_GetPropertyInBlob(wchar* bstrBlob, wchar* bstrName, out wchar* pVal);
}

// IConnection Interface
interface IConnection : IDispatch {
  mixin(uuid("0108a95e-b23e-4372-841b-8153fd529a6e"));
  // static DWINGUID IID = { 0x0108a95e, 0xb23e, 0x4372, 0x84, 0x1b, 0x81, 0x53, 0xfd, 0x52, 0x9a, 0x6e };
  // method NotifyStub
  /*[id(0x00000005)]*/ int NotifyStub();
  // property ReceivedData
  /*[id(0x00000008)]*/ int get_ReceivedData(out wchar* pVal);
  // method SendData
  /*[id(0x00000009)]*/ int SendData(wchar* bstrData);
  // method SendDataFromFile
  /*[id(0x0000000A)]*/ int SendDataFromFile(wchar* bstrFile);
}

// IDisplay Interface
interface IDisplay : IDispatch {
  mixin(uuid("954dc5ab-4f3b-493b-af10-30ff50a38143"));
  // static DWINGUID IID = { 0x954dc5ab, 0x4f3b, 0x493b, 0xaf, 0x10, 0x30, 0xff, 0x50, 0xa3, 0x81, 0x43 };
  // perperty PixBits
  /*[id(0x00000001)]*/ int get_PixBits(out int lbits);
  // perperty PixBits
  /*[id(0x00000001)]*/ int set_PixBits(int lbits);
  // perperty WallPaper
  /*[id(0x00000002)]*/ int set_WallPaper(int value);
}

// CoClasses

// IMSession Class
abstract class IMSession {
  mixin(uuid("a93bf5a1-443d-48fe-921a-244d3afa7ed4"));
  // static DWINGUID CLSID = { 0xa93bf5a1, 0x443d, 0x48fe, 0x92, 0x1a, 0x24, 0x4d, 0x3a, 0xfa, 0x7e, 0xd4 };
  mixin Interfaces!(IIMSession);
}

// smapi Class
abstract class smapi {
  mixin(uuid("5e7c299f-6ead-4f6d-afc0-b6972931517d"));
  // static DWINGUID CLSID = { 0x5e7c299f, 0x6ead, 0x4f6d, 0xaf, 0xc0, 0xb6, 0x97, 0x29, 0x31, 0x51, 0x7d };
  mixin Interfaces!(Ismapi);
}

// Recipient Class
abstract class Recipient {
  mixin(uuid("0f59e739-5a8a-4411-b246-0b8968054d93"));
  // static DWINGUID CLSID = { 0x0f59e739, 0x5a8a, 0x4411, 0xb2, 0x46, 0x0b, 0x89, 0x68, 0x05, 0x4d, 0x93 };
  mixin Interfaces!(IRecipient);
}

// Recipients Class
abstract class Recipients {
  mixin(uuid("92e4a8c4-4de4-4e62-9025-63d975aca4c1"));
  // static DWINGUID CLSID = { 0x92e4a8c4, 0x4de4, 0x4e62, 0x90, 0x25, 0x63, 0xd9, 0x75, 0xac, 0xa4, 0xc1 };
  mixin Interfaces!(IRecipients);
}

// Setting Class
abstract class Setting {
  mixin(uuid("bfb3ec07-a552-4f57-9cc5-06b02205c566"));
  // static DWINGUID CLSID = { 0xbfb3ec07, 0xa552, 0x4f57, 0x9c, 0xc5, 0x06, 0xb0, 0x22, 0x05, 0xc5, 0x66 };
  mixin Interfaces!(ISetting);
}

// Connection Class
abstract class Connection {
  mixin(uuid("f0a45e65-84a6-4543-baf7-491d38de8e8b"));
  // static DWINGUID CLSID = { 0xf0a45e65, 0x84a6, 0x4543, 0xba, 0xf7, 0x49, 0x1d, 0x38, 0xde, 0x8e, 0x8b };
  mixin Interfaces!(IConnection);
}

// Display Class
abstract class Display {
  mixin(uuid("c2aef40e-be1f-4bae-a3d7-8f7531213de8"));
  // static DWINGUID CLSID = { 0xc2aef40e, 0xbe1f, 0x4bae, 0xa3, 0xd7, 0x8f, 0x75, 0x31, 0x21, 0x3d, 0xe8 };
  mixin Interfaces!(IDisplay);
}
