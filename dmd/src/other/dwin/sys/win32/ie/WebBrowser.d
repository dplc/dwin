/*******************************************************************************
        
        All implementions of IWebBrowser functions here.
        
        copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/



module dwin.sys.win32.ie.WebBrowser;

private import  dwin.sys.win32.com.Core,
                dwin.sys.win32.ie.IE,
                dwin.core.Ctfe,
                dwin.sys.win32.com.tlb.shdocvw;

private import tango.sys.win32.Types;
    
private import bstr = dwin.sys.win32.com.Bstr;
        
version(ieVerbose) import tango.util.log.Trace;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IWebBrowser
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

bool navigate(IWebBrowser t, char[] URL = "about:blank")
{
        wchar* url = bstr.fromString(URL);
        scope(exit) bstr.free(url);
            
        DWINVARIANT var;

        scope(exit)
            VariantClear(&var);
        
        return t.Navigate(url, &var, &var, &var, &var) == S_OK ;
}
//navigate



bool navigate(IWebBrowser t, char[] URL, DWINVARIANT* Flags, DWINVARIANT* TargetFrameName, DWINVARIANT* PostData, DWINVARIANT* Headers)

{
        wchar* url = bstr.fromString(URL);
        scope(exit) bstr.free(url);
            
        scope(exit)
        {
                VariantClear(Flags);
                VariantClear(TargetFrameName);
                VariantClear(PostData);
                VariantClear(Headers);
        }
        
        return t.Navigate(url, Flags, TargetFrameName, PostData, Headers) == S_OK ;
}
//navigate

/**
    Examples:
    ---
        auto ie = ieCreate(null, "Width",800, "Height",600);
        char[] url = "http://bbs.d-programming-language-china.org";
        int flags = navNoHistory | navNoReadFromCache | navNoWriteToCache;
        char[] target = "_self";
        char[] postData = "name=yidabu&pass=bbs.d-programming-language-china.org";
        char[] header = "Content-Type: application/x-www-form-urlencoded\r\n";

        assert( navigate2(ie, url, flags, target, postData, header), "navigate2 failed"); 

    ---

    See_Also:
        IWebBrowser2::Navigate2 Method
        http://msdn2.microsoft.com/en-us/library/aa752134.aspx

        用IWebBrowser2接口的Navigate2方法实现Http POST传输
        http://blog.csdn.net/kesalin/archive/2007/11/11/1878959.aspx
        InternetExplorer如何自动化POST 表单数据
        http://support.microsoft.com/kb/167658

*/

bool navigate2(IWebBrowser2 t, char[] URL, int Flags, char[] TargetFrameName, char[] PostData, char[] Headers = "Content-Type: application/x-www-form-urlencoded\r\n")
{          

        auto url = DWINVARIANT(URL);
        auto flags = DWINVARIANT(Flags);
        auto targetFrameName = DWINVARIANT(TargetFrameName);

        DWINVARIANT postData = SAFEARRAY.fromArray(cast(ubyte[])PostData);    
        /*
        DWINVARIANT postData;
            auto psa = toSafeArray2(cast(ubyte[]) PostData);
            scope(exit)
                SafeArrayDestroy(psa);
            
            postData.vt = cast(VARTYPE) (VT_ARRAY | VT_UI1);
            postData.parray = psa;
        */
        auto headers = DWINVARIANT(Headers);

        
        scope(exit)
        {
            VariantClear(&url);
            VariantClear(&flags);
            VariantClear(&targetFrameName);
            VariantClear(&postData);
            VariantClear(&headers);
        }
        
        return t.Navigate2(&url, &flags, &targetFrameName, &postData, &headers) == S_OK ;
}
//navigate2


int getLeft(T)(T t)
{
    static if( is(T : IWebBrowser) )
    {
        int pl;
        return t.get_Left(pl) == S_OK ? pl : int.max ;
    }
    else static assert(false, "The type '" ~ typeof(T).stringof ~ "' must be one of the allowed types.");    
}
//getLeft

char[] getLocationURL(T = IWebBrowser2)(T t)
{
    static if( is(T : IWebBrowser) )
    {
        wchar* w;
        char[] result;
        t.get_LocationURL(w);
        result = bstr.toString(w);
        bstr.free(w);
        return result;
    }
    else static assert(false, "The type '" ~ typeof(T).stringof ~ "' must be one of the allowed types.");    
}
//getLocationURL


char[] getLocationName(T)(T t)
{
    static if( is(T : IWebBrowser) )
    {
        wchar* w;
        char[] result;
        t.get_LocationName(w);
        result = bstr.toString(w);
        bstr.free(w);
        return result;
    }
    else static assert(false, "The type '" ~ typeof(T).stringof ~ "' must be one of the allowed types.");    
}
//getLocationName

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IWebBrowserApp
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

bool putVisible(T)(T t, bool pBool)
{
    static if( is(T : IWebBrowserApp) )
    {
        VARIANT_BOOL v = (pBool == false) ? VARIANT_FALSE : VARIANT_TRUE;
        return t.put_Visible(v) == S_OK;
    }
    else static assert(false, "The type '" ~ typeof(T).stringof ~ "' must be one of the allowed types.");    
}
//putVisible

bool getVisible(T)(T t)
{
    static if( is(T : IWebBrowserApp) )
    {
        VARIANT_BOOL pBool;
        auto result = t.get_Visible(pBool);
        return (result == S_OK && pBool == VARIANT_TRUE);
    }
    else static assert(false, "The type '" ~ typeof(T).stringof ~ "' must be one of the allowed types.");    
}
//getVisible

/**
    get HWND of WebBrowser
    Example:
        auto hie = getHWND(ie);
*/
HWND getHWND(T)( T t )
{   
    static assert( InTuple!(T, browserTypes),  
        "The type of '" ~ typeof(T).stringof ~ "' must be one of the allowed types." );
    
    int hWnd;
    int hr = E_FAIL;
    
    static if( is(T : IWebBrowserApp) )
        hr = t.get_HWND(hWnd);
    else 
    {
        auto iwb2 = getBrowser!(IWebBrowser2, T)(t);
        scope(exit) tryRelease(iwb2);
        if(iwb2) 
            hr = iwb2.get_HWND(hWnd);
    }
    
    return (hr == S_OK && hWnd) ? (cast(HWND) hWnd) : null;
    /+
    while(IsWindow(cast(void*)hWnd))
    {
        Application.doEvents();
        iwb.get_HWND (hWnd);
    }
    +/
}
//getHWND


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IWebBrowser2
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

