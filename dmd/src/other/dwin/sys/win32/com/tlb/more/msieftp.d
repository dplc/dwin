// MSIEFTP 1.0 Type Library
// Version 1.0

/*[uuid("6e8cede1-746a-11d1-91f7-006097df5bd4")]*/
module dwin.sys.win32.com.tlb.more.msieftp;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// IFtpWebView Interface
interface IFtpWebView : IDispatch {
  mixin(uuid("21dce770-abd0-11d2-a32b-006097df5bd4"));
  // static DWINGUID IID = { 0x21dce770, 0xabd0, 0x11d2, 0xa3, 0x2b, 0x00, 0x60, 0x97, 0xdf, 0x5b, 0xd4 };
  // Get name of the server we are currently connected to.
  /*[id(0x00000001)]*/ int get_Server(out wchar* pbstr);
  // Get the current directory on the server.
  /*[id(0x00000002)]*/ int get_Directory(out wchar* pbstr);
  // Get The currently logged in user.
  /*[id(0x00000003)]*/ int get_UserName(out wchar* pbstr);
  // Get length of the password of the current login.
  /*[id(0x00000004)]*/ int get_PasswordLength(out int plLength);
  // Get The Email Address used for Anonymous Logins.
  /*[id(0x00000005)]*/ int get_EmailAddress(out wchar* pbstr);
  // Get The Email Address used for Anonymous Logins.
  /*[id(0x00000005)]*/ int set_EmailAddress(wchar* pbstr);
  // Get The Message of the Day.
  /*[id(0x00000006)]*/ int get_CurrentLoginAnonymous(out short pfAnonymousLogin);
  // Get The Message of the Day.
  /*[id(0x00000007)]*/ int get_MessageOfTheDay(out wchar* pbstr);
  // Login Anonymously.
  /*[id(0x60020008)]*/ int LoginAnonymously();
  // Login with the specified User Name and Password.
  /*[id(0x60020009)]*/ int LoginWithPassword(wchar* bUserName, wchar* bPassword);
  // Login with the specified User Name and Password of the current login.
  /*[id(0x6002000A)]*/ int LoginWithoutPassword(wchar* bUserName);
  // Display FTP Specific help.
  /*[id(0x6002000B)]*/ int InvokeHelp();
}

// CoClasses

// FtpWebView Class
abstract class FtpWebView {
  mixin(uuid("210da8a2-7445-11d1-91f7-006097df5bd4"));
  // static DWINGUID CLSID = { 0x210da8a2, 0x7445, 0x11d1, 0x91, 0xf7, 0x00, 0x60, 0x97, 0xdf, 0x5b, 0xd4 };
  mixin Interfaces!(IFtpWebView);
}
