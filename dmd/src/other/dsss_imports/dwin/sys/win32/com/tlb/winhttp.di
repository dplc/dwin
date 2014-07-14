// Microsoft WinHTTP Services, version 5.1
// Version 5.1

/*[uuid("662901fc-6951-4854-9eb2-d9a2570f2b2e")]*/
module dwin.sys.win32.com.tlb.winhttp;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

// WinHttpRequest Options
enum WinHttpRequestOption {
  WinHttpRequestOption_UserAgentString = 0x00000000,
  WinHttpRequestOption_URL = 0x00000001,
  WinHttpRequestOption_URLCodePage = 0x00000002,
  WinHttpRequestOption_EscapePercentInURL = 0x00000003,
  WinHttpRequestOption_SslErrorIgnoreFlags = 0x00000004,
  WinHttpRequestOption_SelectCertificate = 0x00000005,
  WinHttpRequestOption_EnableRedirects = 0x00000006,
  WinHttpRequestOption_UrlEscapeDisable = 0x00000007,
  WinHttpRequestOption_UrlEscapeDisableQuery = 0x00000008,
  WinHttpRequestOption_SecureProtocols = 0x00000009,
  WinHttpRequestOption_EnableTracing = 0x0000000A,
  WinHttpRequestOption_RevertImpersonationOverSsl = 0x0000000B,
  WinHttpRequestOption_EnableHttpsToHttpRedirects = 0x0000000C,
  WinHttpRequestOption_EnablePassportAuthentication = 0x0000000D,
  WinHttpRequestOption_MaxAutomaticRedirects = 0x0000000E,
  WinHttpRequestOption_MaxResponseHeaderSize = 0x0000000F,
  WinHttpRequestOption_MaxResponseDrainSize = 0x00000010,
  WinHttpRequestOption_EnableHttp1_1 = 0x00000011,
  WinHttpRequestOption_EnableCertificateRevocationCheck = 0x00000012,
}

enum WinHttpRequestAutoLogonPolicy {
  AutoLogonPolicy_Always = 0x00000000,
  AutoLogonPolicy_OnlyIfBypassProxy = 0x00000001,
  AutoLogonPolicy_Never = 0x00000002,
}

enum WinHttpRequestSslErrorFlags {
  SslErrorFlag_UnknownCA = 0x00000100,
  SslErrorFlag_CertWrongUsage = 0x00000200,
  SslErrorFlag_CertCNInvalid = 0x00001000,
  SslErrorFlag_CertDateInvalid = 0x00002000,
  SslErrorFlag_Ignore_All = 0x00003300,
}

enum WinHttpRequestSecureProtocols {
  SecureProtocol_SSL2 = 0x00000008,
  SecureProtocol_SSL3 = 0x00000020,
  SecureProtocol_TLS1 = 0x00000080,
  SecureProtocol_ALL = 0x000000A8,
}

// Aliases

alias int HTTPREQUEST_PROXY_SETTING;

int HTTPREQUEST_PROXYSETTING_DEFAULT   = 0; //Indicates that the proxy settings should be obtained from the registry. 
int HTTPREQUEST_PROXYSETTING_PRECONFIG = 0; 
int HTTPREQUEST_PROXYSETTING_DIRECT    = 1; //Indicates that all HTTP and HTTPS servers should be accessed directly. Use this command if there is no proxy server.
int HTTPREQUEST_PROXYSETTING_PROXY     = 2; //When HTTPREQUEST_PROXYSETTING_PROXY is specified, varProxyServer should be set to a proxy server string and varBypassList should be set to a domain bypass list string. This proxy configuration applies only to the current instance of the WinHttpRequest object.


alias int HTTPREQUEST_SETCREDENTIALS_FLAGS;

// Interfaces

// IWinHttpRequest Interface
interface IWinHttpRequest : IDispatch {
  mixin(uuid("016fe2ec-b2c8-45f8-b23b-39e53a75396b"));
  // static DWINGUID IID = { 0x016fe2ec, 0xb2c8, 0x45f8, 0xb2, 0x3b, 0x39, 0xe5, 0x3a, 0x75, 0x39, 0x6b };
  // Specify proxy configuration
  /*[id(0x0000000D)]*/ int SetProxy(HTTPREQUEST_PROXY_SETTING ProxySetting, DWINVARIANT ProxyServer, DWINVARIANT BypassList);
  // Specify authentication credentials
  /*[id(0x0000000E)]*/ int SetCredentials(wchar* UserName, wchar* Password, HTTPREQUEST_SETCREDENTIALS_FLAGS Flags);
  // Open HTTP connection
  /*[id(0x00000001)]*/ int Open(wchar* Method, wchar* Url, DWINVARIANT Async);
  // Add HTTP request header
  /*[id(0x00000002)]*/ int SetRequestHeader(wchar* Header, wchar* Value);
  // Get HTTP response header
  /*[id(0x00000003)]*/ int GetResponseHeader(wchar* Header, out wchar* Value);
  // Get all HTTP response headers
  /*[id(0x00000004)]*/ int GetAllResponseHeaders(out wchar* Headers);
  // Send HTTP request
  /*[id(0x00000005)]*/ int Send(DWINVARIANT Body);
  // Get HTTP status code
  /*[id(0x00000007)]*/ int get_Status(out int Status);
  // Get HTTP status text
  /*[id(0x00000008)]*/ int get_StatusText(out wchar* Status);
  // Get response body as a string
  /*[id(0x00000009)]*/ int get_ResponseText(out wchar* Body);
  // Get response body as a safearray of UI1
  /*[id(0x0000000A)]*/ int get_ResponseBody(out DWINVARIANT Body);
  // Get response body as a stream
  /*[id(0x0000000B)]*/ int get_ResponseStream(out DWINVARIANT Body);
  /*[id(0x00000006)]*/ int get_Option(WinHttpRequestOption Option, out DWINVARIANT Value);
  /*[id(0x00000006)]*/ int set_Option(WinHttpRequestOption Option, DWINVARIANT Value);
  // Wait for asynchronous send to complete, with optional timeout (in seconds)
  /*[id(0x0000000F)]*/ int WaitForResponse(DWINVARIANT Timeout, out short Succeeded);
  // Abort an asynchronous operation in progress
  /*[id(0x0000000C)]*/ int Abort();
  // Specify timeout settings (in milliseconds)
  /*[id(0x00000010)]*/ int SetTimeouts(int ResolveTimeout, int ConnectTimeout, int SendTimeout, int ReceiveTimeout);
  // Specify a client certificate
  /*[id(0x00000011)]*/ int SetClientCertificate(wchar* ClientCertificate);
  // Specify if credentials should be sent automatically
  /*[id(0x00000012)]*/ int SetAutoLogonPolicy(WinHttpRequestAutoLogonPolicy AutoLogonPolicy);
}

// IWinHttpRequestEvents Interface
interface IWinHttpRequestEvents : IUnknown {
  mixin(uuid("f97f4e15-b787-4212-80d1-d380cbbf982e"));
  // static DWINGUID IID = { 0xf97f4e15, 0xb787, 0x4212, 0x80, 0xd1, 0xd3, 0x80, 0xcb, 0xbf, 0x98, 0x2e };
  /*[id(0x60010000)]*/ void OnResponseStart(int Status, wchar* ContentType);
  /*[id(0x60010001)]*/ void OnResponseDataAvailable(SAFEARRAY* Data);
  /*[id(0x60010002)]*/ void OnResponseFinished();
  /*[id(0x60010003)]*/ void OnError(int ErrorNumber, wchar* ErrorDescription);
}

// CoClasses

// WinHttpRequest component
abstract class WinHttpRequest {
  mixin(uuid("2087c2f4-2cef-4953-a8ab-66779b670495"));
  // static DWINGUID CLSID = { 0x2087c2f4, 0x2cef, 0x4953, 0xa8, 0xab, 0x66, 0x77, 0x9b, 0x67, 0x04, 0x95 };
  mixin Interfaces!(IWinHttpRequest);
}

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
