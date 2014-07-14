module dwin.sys.win32.ie.Base;

private import dwin.sys.win32.com.Core;
private import dwin.sys.win32.com.tlb.shdocvw;
private import dwin.sys.win32.com.tlb.mshtml;
    
private import dwin.core.Ctfe;

private import dwin.sys.win32.com.tlb.danim : IOleContainer ;
    

//////////////////////////////////////////////////////////////////////////////////////////////////////
// Base Tuple
//////////////////////////////////////////////////////////////////////////////////////////////////////

alias Tuple!(IWebBrowser,    IWebBrowserApp,     IWebBrowser2,      IHTMLFrameBase2) browserTypes;

alias Tuple!(IHTMLElement,   IHTMLElement2,      IHTMLElement3,      IHTMLElement4) elemTypes;

alias Tuple!(IDispatch,     browserTypes,       elemTypes)    dispatchTypes;

alias Tuple!(dispatchTypes, IHTMLDocument, IHTMLDocument2,     IHTMLDocument3,     IHTMLDocument4,     IHTMLDocument5) documentTypes;


//////////////////////////////////////////////////////////////////////////////////////////////////////
// Base Functions 
//////////////////////////////////////////////////////////////////////////////////////////////////////


IDispatch getDispatch(T)(T t)
{
    static assert( InTuple!(T, dispatchTypes),  
        "The type of '" ~ typeof(T).stringof ~ "' must be one of the allowed types." );
    
    IDispatch r;
    if(!t) return r;
    
    static if( is(T == IDispatch) )
        return t;
    else static if( is(T == IWebBrowser2) )
        t.get_Document(r);
    else static if( InTuple!(T, browserTypes) )
    {
        auto iwb2 = getBrowser!(IWebBrowser2, T)(t);
        if(iwb2)
        {
            scope(exit) tryRelease(iwb2);
            return getDispatch!(IWebBrowser2)(iwb2);
        }
    }
    else static if( is(T == IHTMLElement) )
        t.get_document(r);                
    else static if( InTuple!(T, elemTypes) )
    {
        auto ihe = getElement!(IHTMLElement, T)(t);
        if(ihe)
        {
            scope(exit) tryRelease(ihe);
            return getDispatch!(IHTMLElement)(ihe); 
        }
    }
    
    return r;
}
//getDispatch

/** 
 *  Get IHTMLDocument, 2, 3, 4 ... interface
 *  params:
 *    R = return Type, e.g. IHTMLDocument2 
 *    T = source Interface Type
 */
R getDocument(R, T)(T t)
{
    static assert( InTuple!(T, documentTypes),  
        "The type of '" ~ typeof(T).stringof ~ "' must be one of the allowed types." );
    
    R r;
    if(!t) return r;
    
    static if(is(T == R))
        return t;
    else static if ( is(T == IDispatch) )
        return com_cast!(R)(t);
    else static if( InTuple!(T, dispatchTypes) )
    {
        IDispatch idis = getDispatch!(T)(t);
        scope(exit) tryRelease(idis);
        return getDocument!(R, IDispatch)(idis);
    }
    else static if( InTuple!(T, documentTypes) )
        return com_cast!(R)(t);
    else
        return r;
}
//getDocument

R getBrowser(R, T)(T t)
{    
    static assert( InTuple!(T, browserTypes),  
        "The type of '" ~ typeof(T).stringof ~ "' must be one of the allowed types." );
    
    static if( is(T == R) )
        return t;
    else 
        return com_cast!(R)(t);
}
//getBrowser

R getElement(R, T)(T t)
{   
    static assert( InTuple!(T, elemTypes),  
        "The type of '" ~ typeof(T).stringof ~ "' must be one of the allowed types." );
    
    static if( is(R == T) )
        return t;
    else 
        return com_cast!(R)(t);
}
//getElement

R getEventObj(R = IHTMLEventObj2, T =IHTMLEventObj )(T t)
{  
    static if( is(R == T) )
        return t;
    else static if( is(T == IHTMLEventObj) || is(T == IHTMLEventObj2) )
        return com_cast!(R)(t);
    else static assert(false, "The type of '" ~ typeof(T).stringof ~ "' must be one of the allowed types.");    
}
//getEventObj


IOleContainer getOleContainer(T)(T t)
{   
    static if( is(T == IOleContainer ) )
        return t;
    else static if( is(T == IDispatch) )
        return com_cast!(IOleContainer)(t);
    else static if( InTuple!(T, dispatchTypes) )
    {
        IDispatch idis = getDispatch!(T)(t);
        if(idis)
        {
            scope(exit) tryRelease(idis);
            return com_cast!(IOleContainer)(idis);
        }
    }
    else static assert(false, "The type of '" ~ typeof(T).stringof ~ "' must be one of the allowed types.");
}
//getOleContainer


