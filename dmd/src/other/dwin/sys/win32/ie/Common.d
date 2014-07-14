/*******************************************************************************

        some function had two Interface.
        
        copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/



module dwin.sys.win32.ie.Common;

private import dwin.sys.win32.ie.IE;
private import dwin.sys.win32.com.Core;
    
private import bstr = dwin.sys.win32.com.Bstr;
    
version(ieVerbose) import tango.util.log.Trace;

/**
    Example:
        auto iwb2 = ieCreate();
        navigate(iwb2, "http://www.d-programming-language-china.org");
        Sleep(10000);

        auto eles = getElementsByTagName!(IHTMLElement, IWebBrowser2)(iwb2, "div");
        if(eles)
        {
            foreach(e; eles)
                Trace.formatln( getInnerHTML(e) );
        }

*/
R[] getElementsByTagName(R, T, U...)(T t, char[] name, U u)
{
    R[] result;
    IHTMLElementCollection collection;
    scope(exit) tryRelease(collection);
    wchar* bstring = bstr.fromString(name);
    scope(exit) bstr.free(bstring);
    int hr = E_FAIL;
    
    static if( is(T == IHTMLElement2) || is(T == IHTMLDocument3) )
        hr = t.getElementsByTagName(bstring, collection);
    else static if( is(T == IHTMLElement) || is(T == IHTMLElement3) || is(T == IHTMLElement4) )
    {
        auto ele = com_cast!(IHTMLElement2)(t);
        scope(exit) tryRelease(ele);
        if(ele) hr = ele.getElementsByTagName(bstring, collection);
    }
    else static if( is(T == IHTMLDocument) || is(T == IHTMLDocument2) || is(T == IHTMLDocument4) || is(T == IHTMLDocument5))
    {
        auto doc = com_cast!(IHTMLDocument3)(t);
        scope(exit) tryRelease(doc);
        if(doc) hr = doc.getElementsByTagName(bstring, collection);
    }
    else static if( is(T == IWebBrowser2) )
    {
        auto doc = getDocument!(IHTMLDocument3, T)(t);
        scope(exit) tryRelease(doc);
        if(doc) hr = doc.getElementsByTagName(bstring, collection);
    }
    else static assert(false, "The type of " ~ typeof(T).stringof ~ "must be one of the allowed types.");
        
    if(hr != S_OK || !collection) return result;

    int len;
    hr = collection.get_length(len);
    if( hr != S_OK )    {   debug(ieVerbose) Trace.formatln("getElementsByTagName not got IHTMLELementcollection length ");   return result;  }   

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
            {    debug(ieVerbose) Trace.formatln("getElementsByTagName not got pDisp ");      continue;   }

        r = com_cast!(R) (pDisp);  
        if(!r) continue;
            
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
            //else static if( u.length > 1 && is(U[0] == char[]) && is(U[1] == char[]) )  
            else static if( u.length > 1 && is(U[0] == char[]) )  
            //means had special char[] attribute, u[0] = attribute name, u[1] = value
            {
                //auto attr = getAttribute!(char[], R)(r, u[0]);
                auto attr = getAttribute!(U[1], R)(r, u[0]);
                if(!attr || attr != u[1])
                {
                    tryRelease(r);
                    //msgBox( attr ~ " not match attribute, release " ~ std.string.toString(i) );
                    continue;
                }
            }
        }
        result ~= r;
    }//for    
    
    return result;
}
//getElementsByTagName


//failed to get the children of iframe
R[] getAll(R, T)(T t)
{
    R[] result;
    IHTMLElementCollection collection;
    int hr = E_FAIL;
    static if(is(T == IHTMLDocument2))
        hr = t.get_all(collection);
    else static if(is(T == IHTMLElement))
    {
        IDispatch dis;
        scope(exit) tryRelease(dis);
        hr = t.get_all(dis);
        if(hr == S_OK && dis)
            collection = com_cast!(IHTMLElementCollection)(dis);
    }
    else static if( is(T == IHTMLElement2) || is(T == IHTMLElement3) || is(T == IHTMLElement4) )
    {
        auto ele = com_cast!(IHTMLElement)(t);
        scope(exit) tryRelease(ele);
        return getAll!(R, IHTMLElement)(ele);
    }
    else static if( is(T == IHTMLDocument) ||  is(T == IHTMLDocument3) || is(T == IHTMLDocument4) || is(T == IHTMLDocument5) 
        || is(T == IWebBrowser2) 
        )
    {
        IHTMLDocument2 doc;
        scope(exit) tryRelease(doc);
        doc = getDocument!(IHTMLDocument2, T)(t);
        if(doc)
            return getAll!(R, IHTMLDocument2)(doc);
    }
    
    if (hr != S_OK || !collection) return result;
    int len;
    hr = collection.get_length(len);
    if( hr != S_OK )    
        {   
            debug(ieVerbose) Trace.formatln("getElementsByTagName not got IHTMLELementcollection length ");   
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
                debug(ieVerbose) Trace.formatln("getElementsByTagName not got pDisp ");      
                continue;   
            }

        r = com_cast!(R) (pDisp);  
        if(r)
            result ~= r;
    }//for      
    
    return result;
}
//getAll
