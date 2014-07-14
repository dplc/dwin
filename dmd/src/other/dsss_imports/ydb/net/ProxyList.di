// Written in the D programming language.

/*******************************************************************************

        Copyright:      Copyright (c) 2008  (yidabu  g m a i l at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: January 2011

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/


module ydb.net.ProxyList;


private import dwin.text.pcre.RegExp;
private import tango.core.Array : distinct;
private import dwin.sys.win32.WHttp;
private import TextUtil = tango.text.Util;
private import dwin.net.http.MyHttpGet;
private import tango.net.http.HttpHeaders;
    
debug private import tango.io.Stdout;

/**
    get Proxy server_url:port from a web URL
    
    Example:
    ---
        char[][] proxyList = (new ProxyList()).get();
        Stdout.formatln("get {} proxy", proxyList.length);
        foreach(i, proxy; proxyList)
            Stdout.formatln("{}: {}", i, proxy);
    ---

  http://www.cybersyndrome.net/   //被gfw
 http://www.cnproxy.com/          // gfw
 http://www.proxylists.net/       // no last update, 20 tested, 5 passed
 http://proxies.my-proxy.com/proxy-list-s1.html         // You don't have permission to access /proxy-list-s1.html
 http://proxylist.sakura.ne.jp/
 http://www.digitalcybersoft.com/
 http://www.checkedproxylists.com/
 https://www.5uproxy.net/http_anonymous.html  can't open page  r"(?>)(?i)<td>\s*((?:[\d-]+\.)+[\d-]+)\s*</td>\s+<td\s+width[^>]+>\s*(\d+)\s*</td>"
 
**/

/*
    page soure for 5uproxy.net 
    <td width="30">5</td>

    <td>218.240.43.37</td>
    <td width="60">80</td>
    <td width="60">CN</td>
*/

class ProxyList
{
    //private char[][] result;
    char[] src;
    char[][] urls = [
        "http://www.18daili.com/",
        "http://atomintersoft.com/high_anonymity_elite_proxy_list",    
        "http://www.cybersyndrome.net/pla5.html",
        "http://www.proxylists.net/http_highanon.txt"
                            ];
    char[] userAgent = "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)";
    char[][] patterns = [
            r"(?>)(?i)anonymous</td><td>[^<]+<[^>]+?IP((?:\d+\.)+\d+):(\d+)",
            r"(?>)(?i)((?:[\d-]+\.)+[\d-]+):(\d+)",    
            r"(?>)(?i)((?:[\d-]+\.)+[\d-]+):(\d+)",
            r"(?>)(?i)((?:[\d-]+\.)+[\d-]+):(\d+)"
                                    ];
    int timeout = 10; // in seconds
    int limit = 100; // max proxies
    
    private char[] getReferrer(char[] url)
    {
        auto n = url.length;
        if(url.length > "https://".length)
        {
            foreach(i, c; url)
            {
                if( i > "https://".length && c == '/' )
                {
                    n = i+1;
                    break;
                }
            }
        }
        return url[0..n];
    }    
    
    unittest
    {
        //assert(getReferrer("http://atomintersoft.com/high_anonymity_elite_proxy_list") == "http://atomintersoft.com/", "GetReferrer failure");
        //assert(getReferrer("https://atomintersoft.com/high_anonymity_elite_proxy_list") == "https://atomintersoft.com/", "GetReferrer failure");        
    }
    
    private char[] getSrc( char[] url)
    {
        
        try
        {
            /*
            scope whttp = new WHttp();
            whttp.setTimeouts(timeout * 1000, timeout * 1000, timeout * 1000, timeout * 1000); //int ResolveTimeout, int ConnectTimeout, int SendTimeout, int ReceiveTimeout
            whttp.setOption(WinHttpRequestOption.WinHttpRequestOption_EnableRedirects, false);  //如果true, 下面getResponseText会出错 
            whttp.setOption(WinHttpRequestOption.WinHttpRequestOption_UserAgentString, userAgent);        
            whttp.open("GET", url);
            //whttp.SetClientCertificate("www.5uproxy.net");
            whttp.setRequestHeader("Connection","close");
            whttp.setRequestHeader( "Referer", getReferrer(url) );
            whttp.send();  
            this.src.length = 0;
            this.src = whttp.getResponseText();
            */
            
            
            //Tango httpget can't get page source from https page   20110414            
            scope hget = new MyHttpGet(url);    
            hget.setTimeout( timeout );
            hget.keepAlive(false);    
            scope header = hget.getRequestHeaders();
            header.add(HttpHeader.Referrer, getReferrer(url));
            header.add(HttpHeader.UserAgent, userAgent);                    
            //hget.enableRedirect(false); //如果true, 就会直接读取exe文件
            //hget.encodeUri(false);     
            
            this.src = cast(char[]) hget.read();
            
        
        }
        catch(Exception e)
        {
            debug Stdout.formatln("getSrc {} catch {}", url, e.toString);
        }
        
        
        return this.src;
    }

    
    char[][] get()
    {
        char[][] result;
        foreach(i, url; urls)
        {
            if(result.length > limit) break;
            char[] s = this.getSrc(url);
            if(s.length)
            {
                scope regexp = new RegExp(patterns[i], PCRE_UTF8);
                RegMatch[] matchs = regexp.findAll(s);
                foreach(m; matchs)
                    result ~= m[1] ~ ":" ~ m[2];
            }
        }
        
        if(result.length)
        {
            auto i = distinct(result);
            result.length = i;
        }
        
        return result;   
    }    
    
    
    static bool verifyProxy(char[] proxy, char[] url = "http://www.ip138.com/ip2city.asp")
    {
        bool result = false;
         try
        {        
                scope whttp = new WHttp();
                whttp.setProxy(proxy);
                whttp.setTimeouts(6_000, 6_000, 6_000, 6_000); //int ResolveTimeout, int ConnectTimeout, int SendTimeout, int ReceiveTimeout
                whttp.setOption(WinHttpRequestOption.WinHttpRequestOption_EnableRedirects, false);  //如果true, 下面getResponseText会出错 
                //whttp.setOption(WinHttpRequestOption.WinHttpRequestOption_UserAgentString, userAgent);        
                whttp.open("GET", url);
                whttp.setRequestHeader("Connection","close");
                //whttp.setRequestHeader( "Referer", getReferrer(url) );
                whttp.send();  
                char[] text = whttp.getResponseText();
                
                result = text.length && TextUtil.containsPattern(text, TextUtil.delimit(proxy, ":")[0]);
            
        }
        catch(Exception e) { debug Stdout.formatln("{} catch {}", proxy, e.toString); }    
            
        return result;    
    }        
    
    //proxyStr = 换行分隔的代理服务器列表
    static char[][] verifyProxyList(char[] proxyStr)
    {
        return verifyProxyList( TextUtil.splitLines( TextUtil.trim(proxyStr) )  );
    }

    static char[][] verifyProxyList(char[][] list)
    {
        char[][] result;
        foreach(i,  proxy;  list)
        {
            proxy = TextUtil.trim(proxy);
            if( proxy.length && verifyProxy(proxy) )
            {
                result ~= proxy;
                //Stdout.formatln("{}: {}", i, proxy);
            }
        }
        
        return result;
    }     
    
}


version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
