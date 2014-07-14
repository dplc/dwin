
// Written in the D programming language.

/*******************************************************************************

        copyright:      Copyright (c) 2011  (yidabu at gmail com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: 2011

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )
        
        for HTTP GET POST...        
        
        Example:
        ----

        char[] url = "http://www.ip138.com/ip2city.asp";
        char[] proxy = "202.98.123.126:8080";
        char[] bypass ;
        char[] userAgent = "Mozilla/5.0 (Windows; U; Windows NT 6.0; zh-CN; rv:1.9.0.3) Gecko/2008092417 Firefox/3.0.3 (.NET CLR 3.5.30729)";
        
        bool result;
        scope whttp = new WHttpRequest();
        result = whttp.setProxy(HTTPREQUEST_PROXYSETTING_PROXY, proxy, bypass);
        Stdout.formatln("setProxy {}", result);
        
        //error
        //whttp.set_Option!(char[])(WinHttpRequestOption.WinHttpRequestOption_UserAgentString, userAgent);
        //Stdout.formatln("set Option {}", result);
        
        result = whttp.open("GET", url, false);
        Stdout.formatln("open {}", result);
        
        result = whttp.setRequestHeader("User-Agent", userAgent);                
        result = whttp.setRequestHeader("Connection", "close");                
        result = whttp.setRequestHeader("Referer", "http://www.ip138.com/");                
        result = whttp.send(null);
        Stdout.formatln("send {}", result);
        
        //error
        ////char[] oAgent = whttp.get_Option!(char[])(WinHttpRequestOption.WinHttpRequestOption_UserAgentString);
        //Stdout.formatln("User Agent: {}", oAgent);
        
        Stdout.formatln("status: {}", whttp.get_Status());
        Stdout.formatln("status Text: {}", whttp.get_StatusText());
        Stdout.formatln("ResponseText: \r\n{}", whttp.get_ResponseText());
        Stdout.formatln("ResponseBody: {}", whttp.get_ResponseBody());
        Stdout.formatln("ResponseHeader: {}", whttp.getResponseHeader("Content-Type"));
        Stdout.formatln("All ResponseHeaders \r\n{}", whttp.getAllResponseHeaders());      
        ----


*******************************************************************************/


module dwin.sys.win32.WHttpRequest;

public import dwin.sys.win32.com.tlb.winhttp;
private import dwin.sys.win32.com.Core;
private import dwin.sys.win32.com.Client;
private import tango.sys.win32.UserGdi;
    
version(Win32)
{
    pragma(lib, "ole32.lib");
    pragma(lib, "oleaut32.lib");
}



class WHttpRequest
{
	private DispatchObject whr;    
    
    this()
    {
        whr = new DispatchObject("WinHttp.WinHttpRequest.5.1");
        if(whr is null)
            throw new WinHttpRequestException("Exceptin inializing WinHttpRequest");
    }
    
    ~this()
    {
        delete whr;
    }
    
    //////////////////////////////////Method
    bool open(char[] method, char[] url, bool async = false)//
    {
        int result = whr.call!(int)("Open", method, url, async);
        return result == S_OK;
    }
    
    bool send(T=char[])(T t)//
    {
        int result = whr.call!(int)("Send", t);
        return result == S_OK;
    }
     
    //Wait for asynchronous send to complete, with optional timeout (in seconds)
    bool waitForResponse( T=int )(T t)
    {
        short result = whr.call!(short)("WaitForResponse", t);
        return result == S_OK;
    }

    bool abort()
    {
        int result = whr.call!(int)("Abort");
        return result == S_OK;
    }    
    
    
    
    ///////////////////////////////////////Get
    //Get HTTP response header
    char[] getResponseHeader(char[] header)//
    {
        return whr.call!(char[])("GetResponseHeader", header);
    }    
    
    //Get all HTTP response headers
    char[] getAllResponseHeaders()//
    {
        return whr.call!(char[])("GetAllResponseHeaders");
    }       
    
    
    //////////////////////////////////////Set
    bool setProxy(HTTPREQUEST_PROXY_SETTING proxySetting, char[] proxyServer, char[] byPassList )//
    {
        int result = whr.call!(int)("SetProxy", proxySetting, proxyServer, byPassList);
        return result == S_OK;
    }
    
    bool setCredentials(char[] username, char[] password, HTTPREQUEST_SETCREDENTIALS_FLAGS flags)
    {
        int result = whr.call!(int)("SetCredentials", username, password, flags);
        return result == S_OK;
    }
    
    bool setRequestHeader(char[] header, char[] val)
    {
        int result = whr.call!(int)("SetRequestHeader", header, val);
        return result == S_OK;
    }

    //Specify timeout settings (in milliseconds)
    bool setTimeouts(int resolveTimeout, int connectTimeout, int sendTimeout, int receiveTimeout)
    {
        int result = whr.call!(int)("SetTimeouts", resolveTimeout, connectTimeout, sendTimeout, receiveTimeout);
        return result == S_OK;
    }    
    
    bool setClientCertificate(char[] clientCertificate)
    {
        int result = whr.call!(int)("SetClientCertificate", clientCertificate);
        return result == S_OK;
    }

    bool setAutoLogonPolicy(WinHttpRequestAutoLogonPolicy autoLogonPolicy)
    {
        int result = whr.call!(int)("SetAutoLogonPolicy", autoLogonPolicy);
        return result == S_OK;
    }    
    
    // get_
    int get_Status()//
    {
        return whr.get!(int)("Status");
    }  
    
    char[] get_StatusText()//
    {
        return whr.get!(char[])("StatusText");
    }
    
    char[] get_ResponseText()//
    {
        return whr.get!(char[])("ResponseText");
    }
    
    R get_ResponseBody(R=char[])()//
    {
        return whr.get!(R)("ResponseBody");
    }
    
    

    //not works with two arguments
    /*
    R get_Option( R = char[] ) (WinHttpRequestOption option)
    {        
        return whr.get!(R)("Option", option);
    }    
    */
    
    // not works with two arguments
    /*
    void set_Option( T = char[] ) (WinHttpRequestOption option, T t)
    {
        whr.set("Option", option, t);
    }    
    */
    
    
    
}

class WinHttpRequestException: Exception
{
	this(char[] msg)
	{
		super(msg);
	}
}
