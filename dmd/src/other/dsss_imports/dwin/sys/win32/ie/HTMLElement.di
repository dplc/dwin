/*******************************************************************************
        
        All implementions of IHTMLElement functions here.
        
        copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: Nov 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/



module dwin.sys.win32.ie.HTMLElement;

private import  dwin.sys.win32.com.tlb.mshtml,
                dwin.sys.win32.ie.IE,
                dwin.core.Tuple;

private import tango.sys.win32.Types;
private import bstr = dwin.sys.win32.com.Bstr;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IHTMLElement
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

char[] getInnerText(T = IHTMLElement)(T t)
{
    static assert( InTuple!(T, elemTypes),  
        "The type of '" ~ typeof(T).stringof ~ "' must be one of the allowed types." );
    
    static if( is(T == IHTMLElement) )
    {
        wchar* w;
        char[] result;
        t.get_innerText(w);
        result = bstr.toString(w);
        bstr.free(w);
        return result;
    }
    else 
    {
        IHTMLElement ele = getElement!(IHTMLElement, T)(t);
        scope(exit)
            tryRelease(ele);
        return getInnerText!(IHTMLElement)(ele);
        
    }
}
//getInnerText

char[] getInnerHTML(T = IHTMLElement)(T t)
{
    static assert( InTuple!(T, elemTypes),  
        "The type of '" ~ typeof(T).stringof ~ "' must be one of the allowed types." );
    
    static if( is(T == IHTMLElement) )
    {
        wchar* w;
        char[] result;
        t.get_innerHTML(w);
        result = bstr.toString(w);
        bstr.free(w);
        return result;
    }
    else 
    {
        IHTMLElement ele = getElement!(IHTMLElement, T)(t);
        scope(exit)
            tryRelease(ele);
        return getInnerHTML!(IHTMLElement)(ele);
        
    }
}
//getInnerHTML

char[] getOuterHTML(T = IHTMLElement)(T t)
{
    static assert( InTuple!(T, elemTypes),  
        "The type of '" ~ typeof(T).stringof ~ "' must be one of the allowed types." );
    
    static if( is(T == IHTMLElement) )
    {
        wchar* w;
        char[] result;
        t.get_outerHTML(w);
        result = bstr.toString(w);
        bstr.free(w);
        return result;
    }
    else 
    {
        IHTMLElement ele = getElement!(IHTMLElement, T)(t);
        scope(exit)
            tryRelease(ele);
        return getOuterHTML!(IHTMLElement)(ele);
    }
}
//getOuterHTML


bool putInnerText(T = IHTMLElement)(T t, char[] html)
{
    static assert( InTuple!(T, elemTypes),  
        "The type of '" ~ typeof(T).stringof ~ "' must be one of the allowed types." );
    
    static if( is(T == IHTMLElement) )
    {
        wchar* w = bstr.fromString(html);
        scope(exit)
            bstr.free(w);
        return t.put_innerText(w) == S_OK;
    }
    else 
    {
        IHTMLElement ele = getElement!(IHTMLElement, T)(t);
        scope(exit)
            tryRelease(ele);
        return putInnerText!(IHTMLElement)(ele, html);
    }
}
//putInnnerText


bool putInnerHTML(T = IHTMLElement)(T t, char[] html)
{
    static assert( InTuple!(T, elemTypes),  
        "The type of '" ~ typeof(T).stringof ~ "' must be one of the allowed types." );
    
    static if( is(T == IHTMLElement) )
    {
        wchar* w = bstr.fromString(html);
        scope(exit)
            bstr.free(w);
        return t.put_innerHTML(w) == S_OK;
    }
    else 
    {
        IHTMLElement ele = getElement!(IHTMLElement, T)(t);
        scope(exit)
            tryRelease(ele);
        return putInnerHTML!(IHTMLElement)(ele, html);
    }
}
//putInnnerHTML

bool putOuterHTML(T = IHTMLElement)(T t, char[] html)
{
    static assert( InTuple!(T, elemTypes),  
        "The type of '" ~ typeof(T).stringof ~ "' must be one of the allowed types." );
    
    static if( is(T == IHTMLElement) )
    {
        wchar* w = bstr.fromString(html);
        scope(exit)
            bstr.free(w);
        return t.put_outerHTML(w) == S_OK;
    }
    else 
    {
        IHTMLElement ele = getElement!(IHTMLElement, T)(t);
        scope(exit)
            tryRelease(ele);
        return putOuterHTML!(IHTMLElement)(ele, html);
    }
}
//putOuterHTML


R getAttribute(R = char[], T = IHTMLElement)(T t, char[] attributeName, int flag = 2)
{
    static assert( InTuple!(T, elemTypes) || HasMember!(T, "getAttribute") ,  
        "The type of '" ~ typeof(T).stringof ~ "' must be one of the allowed types." );
    
    R r;
    if(!t || !attributeName.length) return r;
        
    int hr = E_FAIL;
    wchar* bstring = bstr.fromString(attributeName);
    scope(exit) bstr.free(bstring);

    DWINVARIANT value;
    scope(exit) value.clear();
        
    static if( HasMember!(T, "getAttribute") )
    {
        hr = t.getAttribute(bstring, flag, value);
        if(hr == S_OK) 
            return value.get!(R);
    }
    else 
    {
        auto ele = getElement!(IHTMLElement, T)(t);
        if(ele) 
        {
            scope(exit) tryRelease(ele);
            hr = ele.getAttribute(bstring, flag, value);
            if(hr == S_OK) 
                return value.get!(R);            
        }
    }
    return r;
}
//getAttribute


/**
    See_Also: http://msdn2.microsoft.com/en-us/library/ms536739(VS.85).aspx
    
*/
bool setAttribute(T = IHTMLElement, V = char[])(T t, char[] attributeName, V value, int flag = 0)
{
    static assert( InTuple!(T, elemTypes) || HasMember!(T, "setAttribute") ,  
        "The type of '" ~ typeof(T).stringof ~ "' must be one of the allowed types." );
    
    //if(!t || !attributeName.length || !value) 
    if(t is null || !attributeName.length) 
        return false;
        
    int hr = E_FAIL;
    wchar* bstring = bstr.fromString(attributeName);
    scope(exit) bstr.free(bstring);
    DWINVARIANT vValue = DWINVARIANT(value);

    scope(exit) vValue.clear();
        
    static if( HasMember!(T, "setAttribute") )
    {
        hr = t.setAttribute(bstring, vValue, flag);
        return hr == S_OK;
    }
    else 
    {
        auto ele = getElement!(IHTMLElement, T)(t);
        if(ele) 
        {
            scope(exit) tryRelease(ele);
            hr = ele.setAttribute(bstring, vValue, flag);
            return hr == S_OK;
        }
    }
    //return false;
}
//setAttribute




bool contains(A, B)(A a, B b)
{
    static assert( InTuple!(A, elemTypes) && InTuple!(B, elemTypes) ,  
        "The type of '" ~ typeof(T).stringof ~ "' must be one of the allowed types." );
    
    IHTMLElement aa = getElement!(IHTMLElement, A)(a);
    IHTMLElement bb = getElement!(IHTMLElement, B)(b);
    if(!aa || !bb) return result;
    scope(exit)
    {
        static if(!is(A == IHTMLElement))
            tryRelease(aa);
        static if(!is(B == IHTMLElement))
            tryRelease(bb);
    }
    short var = VARIANT_FALSE;
    int hr = aa.contains(bb, var);
    return (hr == S_OK && var == VARIANT_TRUE)  ;
}
//contains

/**
    Examples:
    ---
    auto ie = ieCreate(null, "Width",800, "Height",600, "ToolBar",false, "MenuBar",false, "Navigate", "http://www.d-programming-language-china.org/forum-10-1.html");
    waitId(ie, "postform"); //wait postform node load
    auto result = getElementsByName!(IHTMLInputElement, IWebBrowser2)(ie, "parseurloff");    
    if(result)
        Stdout( getValue(result[0]) ).newline;            //should print 1
    else
        Stdout("failed").newline;
    ---
*/
char[] getValue(T)(T t)
{
    static assert( HasMember!(T, "get_value"), 
        "The type of '" ~ typeof(T).stringof ~ "' must be one of the allowed types." );
    
    wchar* w;
    auto hr = t.get_value(w);
    if(hr == S_OK)
    {
        char[] result = bstr.toString(w);
        bstr.free(w);
        return result;         
    }
    return null;
}
//

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IHTMLSelectElement
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/**
    Examples:
    ---
    auto ie = ieCreate(null, "Width",800, "Height",600, "ToolBar",false, "MenuBar",false, "Navigate", "http://www.d-programming-language-china.org/forum-10-1.html");
    waitId(ie, "postform"); //wait postform node load
    auto result = getElementsByName!(IHTMLSelectElement, IWebBrowser2)(ie, "orderby");    
    if(result)
        Stdout( getSelectedIndex(result[0]) ).newline;            //should print 0
    else
        Stdout("failed").newline;
    ---
*/

int getSelectedIndex(IHTMLSelectElement ele)
{
    if(!ele) 
        return -1;
    
    int result;
    auto hr = ele.get_selectedIndex(result);
    return hr == S_OK ? result : -1;
}



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IHTMLElement2
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IHTMLElement3
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IHTMLElement4
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
