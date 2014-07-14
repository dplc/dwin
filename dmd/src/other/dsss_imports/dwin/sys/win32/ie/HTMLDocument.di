/*******************************************************************************
        
        All implementions of IHTMLDocument functions here.
        
        copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/



module dwin.sys.win32.ie.HTMLDocument;

private import dwin.sys.win32.ie.IE;
private import dwin.sys.win32.com.Core;
private import dwin.core.Ctfe;

private import bstr = dwin.sys.win32.com.Bstr;
private import tango.sys.win32.Types;    
    
version(ieVerbose) import tango.util.log.Trace;


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IHTMLDocument
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IHTMLDocument2
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
IHTMLElement getBody(T = IHTMLDocument2)(T t)
{
    static assert( InTuple!(T, documentTypes),  
        "The type of '" ~ typeof(T).stringof ~ "' must be one of the allowed types." );
    if(!t) return null;
        
    static if( is(T == IHTMLDocument2) )
    {
        IHTMLElement ihe;
        t.get_body(ihe);
        return ihe;
    }
    else
    {
        auto ihd2 = getDocument!(IHTMLDocument2, T)(t);
        scope(exit) tryRelease(ihd2);
        return getBody!(IHTMLDocument2)(ihd2);
    }
}
//getBody

char[] getTitle(T)(T t)
{
    static assert( InTuple!(T, documentTypes),  
        "The type of '" ~ typeof(T).stringof ~ "' must be one of the allowed types." );
    if(!t) return null;
        
    static if( is(T == IHTMLDocument2) )
    {
        wchar* bstring;
        if( t.get_title(bstring) == S_OK)
        {
            auto str = bstr.toString(bstring);
            bstr.free(bstring);
            return str;
        }
        return null;
    }
    else
    {
        auto ihd2 = getDocument!(IHTMLDocument2, T)(t);
        scope(exit) tryRelease(ihd2);
        return getTitle!(IHTMLDocument2)(ihd2);
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IHTMLDocument3
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/**
    Params:
        R = return type
        T = IWebBrowser2 or IHTMLDocument3...
        u = specify children node index or attribute name and attribute value
        name = html node name


    Examples:
    ---
        auto ie = ieCreate(null, "Width",800, "Height",600, "ToolBar",false, "MenuBar",false, "Navigate", "http://www.d-programming-language-china.org/forum-10-1.html");
        waitId(ie, "postform"); //wait postform node load
        auto result = getElementsByName(ie, "moderate");    
        
        Stdout( getInnerText(result[0]) ).newline;
        ie.Quit();
    ---
*/

/*
    http://blog.csdn.net/ywtywt337/archive/2006/11/20/1396965.aspx
    1、getElementsByName 与getElementsByTagName 相比，相同的是都返回元素对象数组
        1）、getElementsByName()只是document的方法，对部分元素(div,span)的name属性无效。相关方法：document.all.元素ID
        2）、getElementsByTagName() 是所有页面元素的方法，对tag有效，tag不分大小写。相关方法：document.all.tags()
    2、getElementById 只是document的方法，而且只对ID有效，对name属性无效，只返回一个元素，而不是元素数组。
    3、form，image，applet,可以作为document的属性直接返回，其它元素须由document.all返回
    4、input是form的子元素，所以由formID.inputID来返回，IE下一个例外：document.formID.inputID 这样会报错，而要这样：document.all.formID.inputID。具体原因，不太明白，请知道的朋友给一个说明，谢谢。
*/
R[] getElementsByName(R = IHTMLElement, T = IHTMLDocument3, U...)(T t, char[] name, U u)
{
    static assert( InTuple!(T, documentTypes),  
        "The type of '" ~ typeof(T).stringof ~ "' must be one of the allowed types." );
    
    R[] result;
    IHTMLElementCollection collection;
    scope(exit) tryRelease(collection);
    wchar* bstring = bstr.fromString(name);
    scope(exit) bstr.free(bstring);
    int hr = E_FAIL;
    
    static if( is(T == IHTMLDocument3) )
        hr = t.getElementsByName(bstring, collection);
    else 
    {
        auto doc = getDocument!(IHTMLDocument3, T)(t);
        scope(exit) tryRelease(doc);
        if(doc) hr = doc.getElementsByName(bstring, collection);
    }
        
    if(hr != S_OK || !collection) { return result; }

    int len;
    hr = collection.get_length(len);
    if( hr != S_OK )    
        { 
            debug(ieVerbose) Trace.formatln("getElementsByName not got IHTMLELementcollection length ");   
            return result;  
        }   

    IDispatch pDisp;                 
    DWINVARIANT vIndex;

    R r;
    for(size_t i=0; i<len; i++)
    {
        vIndex = toVariant(i);
        scope(exit) vIndex.clear();
            
        hr = collection.item(vIndex, vIndex, pDisp);
        scope(exit) tryRelease(pDisp);
            
        if(hr != S_OK || !pDisp) 
            {  
                debug(ieVerbose) Trace.formatln("getElementsByName not got pDisp "); 
                continue; 
            }

        r = com_cast!(R) (pDisp);    
        if(!r)  continue;
            
       static if(u.length) 
        {
            static if( is(U[0] == uint) )  //means special index 
            {
                if(i != u[0])
                {
                    tryRelease(r);
                    //msgBox( "not match index, release " ~ std.string.toString(i) );
                    continue;
                }
            }
            else static if( is(U[0] : IUnknown) )   //means a special com interface
            {
                if( u[0] && r != u[0] )
                {
                    tryRelease(r);
                    //msgBox(" not same interface, release " ~ std.string.toString(i) );
                    continue;
                }
            }
            else static if( u.length > 1 && is(U[0] == char[]) && is(U[1] == char[]) )  
            //means had special string attribute, u[0] = attribute name, u[1] = value
            {
                auto attr = getAttribute!(char[], R)(r, u[0]);
                if(!attr || attr != u[1])
                {
                    tryRelease(r);
                    //msgBox( attr ~ " not match attribute, release " ~ std.string.toString(i) );
                    continue;
                }
            }
        }//static if
        
        result ~= r; 
        
    }//for    
    
    return result;
}
//getElementsByName


IHTMLElement getElementById(T = IHTMLDocument3)(T t, char[] id, bool discard = false)
{
    static assert( InTuple!(T, documentTypes),  
        "The type of '" ~ typeof(T).stringof ~ "' must be one of the allowed types." );
    
    scope(exit)
        if(discard)
            tryRelease(t);    
        
    static if(is(T == IHTMLDocument3))
    {
        wchar* wid = bstr.fromString(id);
        scope(exit)
            bstr.free(wid);                        
        IHTMLElement result;
        t.getElementById(wid, result);
        return result;
    }   
    else  
    {       
        auto ihd3 = getDocument!(IHTMLDocument3, T)(t);
        return getElementById!(IHTMLDocument3)(ihd3, id, true);
    }        
}
//getElementById


IHTMLElement getDocumentElement(T)(T t)
{
    static assert( InTuple!(T, documentTypes),  
        "The type of '" ~ typeof(T).stringof ~ "' must be one of the allowed types." );
    
    static if(is(T == IHTMLDocument3))
    {
        IHTMLElement result;        
        t.get_documentElement(result);
        return result;
    }   
    else  
    {
        auto ihd3 = getDocument!(IHTMLDocument3, T)(t);
        scope(exit) tryRelease(ihd3);
        return getDocumentElement!(IHTMLDocument3)(ihd3);
    }  
}
//getDocument(T)(T t)



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IHTMLDocument4
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
