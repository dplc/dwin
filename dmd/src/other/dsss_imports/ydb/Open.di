
// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2007  (yidabu  g m a i l at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: 2007

        Authors:        yidabu ( D Programming Language China : http://bbs.d-programming-language-china.org )

*******************************************************************************/

module ydb.Open;

private import  tango.text.Util;
    
private import  dwin.sys.win32.UserGdi,
                dwin.sys.win32.ie.IE,
                dwin.sys.win32.com.Core,
                dwin.sys.win32.Wrapper,
                dwin.sys.win32.SpecialPath;

private import tango.sys.win32.UserGdi;

version(ydbVerbose)
    private import tango.util.log.Trace;

/**
    Examples:
    ---
    auto result = Open.html("http://bbs.d-programming-language-china.org
    Stdout(result).newline;
    ---

    See_Also:
    http://topic.csdn.net/t/20030919/11/2277784.html
    如果想启动多个ie，则需要做一些处理   

    如果你要打开的是几个本地的网页，则可以这样：   
    ShellExecute(NULL,"opennew","c:\\httptest_1.htm",NULL,NULL,SW_SHOWNORMAL);   
    ShellExecute(NULL,"opennew","c:\\httptest_2.htm",NULL,NULL,SW_SHOWNORMAL);   
    一定要是“opennew”，而不是“open”   

    如果要打开的是以http开头的，则可以这样：   
    ShellExecute(NULL,"open","IEXPLORE.exe",NULL,NULL,SW_SHOWNORMAL);//打开新的ie   
    ShellExecute(NULL,"open","http://www.sohu.com",NULL,NULL,SW_SHOWNORMAL);//在刚才的ie窗口打开sohu


    不知道为什么opennew参数为什么不能用了...   
    http://topic.csdn.net/t/20060705/15/4862100.html
    winexec('c:\Program   Files\Internet   Explorer\IEXPLORE.EXE   -new   http://www.sina.com.cn',sw_show);

    -k参数可以让IE工作在全屏方式下 
    -slf参数会让IE连接到默认的主页 
    -new开新的IE进程 
    -channelband 收藏夹 
    -nohome 无显示``blank空白页面也不显示 
    -remote参数可以在Unix平台上启动另一个IE进程 
    -v参数会显示出IE当前的版本(Unix平台上适用) 


*/



class Open
{

    static char[] expand(char[] url)
    {
        char[] result = substitute(url, "exeDir", exeDir());
        result = substitute(result, "exePath", exePath());
        return result;
    }
    
    //why must ref here?
    static void html(ref IWebBrowser2 wb, char[] url, bool isExpand = false)
    {
        if(wb)
        {
            wb.Quit();
            tryRelease(wb);
        }
        wb = html(url, isExpand);      
        if(wb)
            SetForegroundWindow(getHWND(wb));
    }
    
    /**
        Open a html page in IE
        See_Also:
    
        WinExec Function
        http://msdn2.microsoft.com/en-us/library/ms687393.aspx
    
        http://msdn.microsoft.com/msdnmag/issues/05/03/CATWork/
    */
    static IWebBrowser2 html(char[] url, bool isExpand = false)
    {
        IWebBrowser2 result;     
        
        try
        {
        
            if(isExpand)
                url = expand(url);
            
            result = InternetExplorer.coCreate!(IWebBrowser2)(ExecutionContext.LocalServer);
            if(!result)    
                return result;

            int width = cast(int) (GetSystemMetrics(SM_CXFULLSCREEN) * 0.97);
            int height = cast(int) (GetSystemMetrics(SM_CYFULLSCREEN) * 0.97);
            
            result.put_Left(10);
            result.put_Top(10);
            result.put_Width(width);
            result.put_Height(height);
            result.put_Visible(VARIANT_TRUE);
            navigate(result, url);
            
            /*
                result = winExec( "\"" ~ iepath ~ "\" -new " ~ url, showcmd);             
            
                //some times cause Access Violation 
                result = shellExcute(null, "open", "rundll32.exe", "url.dll,FileProtocolHandler " ~ url, null, showcmd);                    
                result = shellExcute(null, "open", iepath, "-new " ~ url, null, showcmd);   //first parameter must -new, not url
                result = shellExcute(null, "open", url, null, null, showcmd);        
            */
        
        }
        catch(Exception e)
        {
            version(ydbVerbose)
                Trace.formatln("Open.html catch {} result is {}", e.msg, result);
        }

        return result;
    }

    
    //TODO
    static HINSTANCE other(HWND hwnd, char[] url, char[] params = null, int showcmd = SW_SHOWMAXIMIZED, bool isExpand = true)
    {
        if(isExpand)
            url = expand(url);        
        return shellExecute(hwnd, "open", url, params, null, showcmd);  
    }
    
    static HINSTANCE other(char[] url, char[] params = null, int showcmd = SW_SHOWMAXIMIZED, bool isExpand = true)
    {
        return other(GetActiveWindow(), url, params, showcmd, isExpand);  
    }    

}


version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
