
// Written in the D programming language.

/*******************************************************************************

        copyright:      Copyright (c) 2011  (yidabu at gmail com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: 2011

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )
        
        for HTTP GET POST...
        
        Example:
        ----
        char[] url = "http://www.d-programming-language-china.org/";
        
        auto whttp = new WHttp();
        bool result = whttp.setOption(WinHttpRequestOption.WinHttpRequestOption_EnableHttp1_1, true);        
        whttp.open("GET", url);
        whttp.setRequestHeader("Connection","close");
        whttp.setRequestHeader("Content-Length", "0");
        whttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");        
        whttp.send();
        auto text = whttp.getResponseText();
        Stdout.formatln(text);
        char[] status = whttp.getStatusText();
        Stdout.formatln("status: {}", status);        
        ----
        
        See_Also:
        http://msdn.microsoft.com/en-us/library/aa383979%28v=VS.85%29.aspx
        
*******************************************************************************/


module dwin.sys.win32.WHttp;

public import dwin.sys.win32.com.tlb.winhttp;
private import dwin.sys.win32.com.Core;
private import tango.sys.win32.UserGdi;
    
version(Win32)
{
    pragma(lib, "ole32.lib");
    pragma(lib, "oleaut32.lib");
}


class WHttp
{
    private IWinHttpRequest iwh;
    
    this() {
        iwh = WinHttpRequest.coCreate!(IWinHttpRequest)(ExecutionContext.InProcessServer);   
        if(iwh is null)
            throw new WHttpException("Exception initializing IWinHttpRequest");
    }        
    
    ~this() {
        tryRelease(iwh);
        iwh = null;
    }

    //
    // Specify proxy configuration
    // int SetProxy(HTTPREQUEST_PROXY_SETTING ProxySetting, DWINVARIANT ProxyServer, DWINVARIANT BypassList);    
    bool setProxy(char[] proxyServer, char[] bypassList = null, HTTPREQUEST_PROXY_SETTING proxySetting = HTTPREQUEST_PROXYSETTING_PROXY) {
        DWINVARIANT proxyServerV = DWINVARIANT(proxyServer);
        DWINVARIANT bypassListV = DWINVARIANT(bypassList);
        scope(exit) {
            proxyServerV.clear();
            bypassListV.clear();
        }
        return iwh.SetProxy(proxySetting, proxyServerV, bypassListV) == S_OK;
    }
    
    // Specify authentication credentials
    // int SetCredentials(wchar* UserName, wchar* Password, HTTPREQUEST_SETCREDENTIALS_FLAGS Flags);    
    bool setCredentials(char[] userName, char[] password, HTTPREQUEST_SETCREDENTIALS_FLAGS flags) {
        wchar* usernameV = bstr.fromString(userName);
        wchar* passwordV = bstr.fromString(password);
        scope(exit) {
            bstr.free(usernameV);
            bstr.free(passwordV);
        }
        return iwh.SetCredentials(usernameV, passwordV, flags) == S_OK;
    }
    
    //
    // Open HTTP connection
    // int Open(wchar* Method, wchar* Url, DWINVARIANT Async);
    bool open(char[] method, char[] url, bool async = false) { 
        wchar* methodV = bstr.fromString(method);
        wchar* urlV = bstr.fromString(url);
        scope(exit) {
            bstr.free(methodV);
            bstr.free(urlV);
        }
        
        //VARIANT_BOOL vb = (async == true) ? VARIANT_TRUE : VARIANT_FALSE;
        DWINVARIANT asyncV = DWINVARIANT(async);        
        scope(exit) asyncV.clear();
        
        return iwh.Open( methodV, urlV, asyncV ) == S_OK;
    }
    
    //
    // Add HTTP request header
    // int SetRequestHeader(wchar* Header, wchar* Value);
    bool setRequestHeader(char[] header, char[] val) { 
        wchar* headerV = bstr.fromString(header);
        wchar* valV = bstr.fromString(val);
        scope(exit) {
            bstr.free(headerV);
            bstr.free(valV);
        }
        
        return iwh.SetRequestHeader(headerV, valV) == S_OK;
    }    
    
    //
    // Get HTTP response header
    // int GetResponseHeader(wchar* Header, out wchar* Value);
    char[] getResponseHeader(char[] header) {
        wchar* headerV = bstr.fromString(header);
        scope(exit) bstr.free(headerV);
            
        wchar* valV;        
        int result = iwh.GetResponseHeader(headerV, valV);
        scope(exit) bstr.free(valV);
        return bstr.toString(valV);
    }        
    
    //
    // Get all HTTP response headers
    // int GetAllResponseHeaders(out wchar* Headers);
    char[] getAllResponseHeaders() {
        wchar* valV;
        int result = iwh.GetAllResponseHeaders(valV);
        scope(exit) bstr.free(valV);
        return bstr.toString(valV);
    }
    
    //
    // Send HTTP request
    // int Send(DWINVARIANT Body);
    bool send(T=char[])(T t=null) {
        DWINVARIANT vt = DWINVARIANT(t);
        scope(exit) vt.clear();
        return iwh.Send(vt) == S_OK;
    }
    
    //
    // Get HTTP status code
    // int get_Status(out int Status);
    int getStatus() {
        int status;
        iwh.get_Status(status);
        return status;
    }
    
    //
    //int get_StatusText(out wchar* Status);
    char[] getStatusText() {
        wchar* valV;
        int result = iwh.get_StatusText(valV);
        scope(exit) bstr.free(valV);
        return bstr.toString(valV);
    }       
    
    //
    //int get_ResponseText(out wchar* Body);
    char[] getResponseText() {
        wchar* valV;
        int result = iwh.get_ResponseText(valV);
        scope(exit) bstr.free(valV);
        return bstr.toString(valV);
    }    
    
    // Get response body as a safearray of UI1
    // int get_ResponseBody(out DWINVARIANT Body);
    R getResponseBody( R=char[] )() {
        DWINVARIANT valV;
        int result = iwh.get_ResponseBody(valV);
        scope(exit) valV.clear();
        return com_cast!(R)(valV);
    }
    
    R getResponseStream( R=char[] )() {
        DWINVARIANT valV;
        int result = iwh.get_ResponseStream(valV);
        scope(exit) valV.clear();
        return com_cast!(R)(valV);
    }

    //
    //int get_Option(WinHttpRequestOption Option, out DWINVARIANT Value)
    R getOption(R = char[])(WinHttpRequestOption option) {
        DWINVARIANT valV;
        scope(exit) valV.clear();        
        int result = iwh.get_Option(option, valV);
        return com_cast!(R)(valV);
    }     
    
    //
    // before or after open
    bool setOption(V = char[])(WinHttpRequestOption option, V val) {
        DWINVARIANT valV = DWINVARIANT(val);
        scope(exit) valV.clear();        
        return iwh.set_Option(option, valV) == S_OK;
    }
    
    // Wait for asynchronous send to complete, with optional timeout (in seconds)
    //int WaitForResponse(DWINVARIANT Timeout, out short Succeeded);    
    //Time-out value, in seconds. Default time-out is infinite. To explicitly set time-out to infinite, use the value -1.
    bool waitForResponse(int timeout, ref short succeeded) {
        DWINVARIANT valV = DWINVARIANT(timeout);
        scope(exit) valV.clear();
        return iwh.WaitForResponse(valV, succeeded) == S_OK;
    }
    
    // Abort an asynchronous operation in progress
    // int Abort();    
    bool abort() {
        return iwh.Abort() == S_OK;
    }
    
    // Specify timeout settings (in milliseconds)
    // int SetTimeouts(int ResolveTimeout, int ConnectTimeout, int SendTimeout, int ReceiveTimeout);    
    bool setTimeouts(int resolveTimeout, int connectTimeout, int sendTimeout, int receiveTimeout) {
        return iwh.SetTimeouts(resolveTimeout, connectTimeout, sendTimeout, receiveTimeout) == S_OK;
    }
   
    // Specify a client certificate
    // int SetClientCertificate(wchar* ClientCertificate);    
    bool SetClientCertificate(char[] clientCertificate) {
        wchar* valV = bstr.fromString(clientCertificate);
        scope(exit) bstr.free(valV);
        return iwh.SetClientCertificate(valV) == S_OK;
    }
    
    // Specify if credentials should be sent automatically
    // int SetAutoLogonPolicy(WinHttpRequestAutoLogonPolicy AutoLogonPolicy);    
    bool setAutoLogonPolicy(WinHttpRequestAutoLogonPolicy autoLogonPolicy) {
        return iwh.SetAutoLogonPolicy(autoLogonPolicy) == S_OK;
    }
    
}

class WHttpException: Exception
{
	this(char[] msg)
	{
		super(msg);
	}
}


version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
