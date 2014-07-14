/*******************************************************************************
        Main module of ie package
        
        copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module dwin.sys.win32.ie.IE;

private import dwin.core.Exception;

public 
{
    import  dwin.sys.win32.ie.Base,
            dwin.sys.win32.ie.WebBrowser,
            dwin.sys.win32.ie.HTMLDocument,
            dwin.sys.win32.ie.HTMLElement,
            dwin.sys.win32.ie.HTMLEventObj,
            dwin.sys.win32.ie.Events,
            dwin.sys.win32.ie.Common;
    
    import  dwin.sys.win32.com.tlb.mshtml,
            dwin.sys.win32.com.tlb.shdocvw;      
    
    import  dwin.core.Ctfe;

    import  dwin.sys.win32.com.Core;
    
    version(ieVerbose) import tango.util.log.Trace;    
}


private import dwin.sys.Process : doEvents;
private import dwin.io.Stream : MemoryStream;
        
private import dwin.sys.win32.com.tlb.danim : IOleContainer;    
    
private import  tango.core.Vararg,
                tango.sys.win32.CodePage,
                tango.sys.win32.UserGdi;

private import dwin.sys.win32.com.COMException : IEException;
private import TextUtil = tango.text.Util;


    

/**
    Simple create a IE instance
    Examples:
    ---
        scope ie = new IE;
        ie.visible = true;
        ie.menuBar = false;
        ie.navigate( "http://www.d-programming-language-china.org/" );
        Sleep(10000);

            auto url = "http://www.d-programming-language-china.org/";
            scope ie = IE(url);
            auto str = ie.bodyInnerText();
            Cout(str);
    ---
*/
public class IE : InternetExplorer
{
    IWebBrowser2 IE_;
    char[] URL_;
    
    bool navigate(char[] URL = "about:blank")
    {      
        return URL_.length ? .navigate(IE_, URL_) : .navigate(IE_, URL);
    }

    bool visible(bool pBool)
    {   
        return IE_.put_Visible( cast(short) (pBool == true ? -1 : 0) ) == S_OK; 
    }
    
    bool left(int pl)
    {
       return IE_.put_Left(pl) == S_OK; 
    }
    
    bool top(int pl)
    {
        return IE_.put_Top(pl) == S_OK;
    }
    
    bool width(int pl)
    { 
        return IE_.put_Width(pl) == S_OK;
    }
    
    bool height(int pl)
    {
        return IE_.put_Height(pl) == S_OK;
    }
    
    bool statusBar(bool pBool)
    {
        return IE_.put_StatusBar( cast(short) (pBool == true ? -1 : 0) ) == S_OK;
    }
    
    bool toolBar(bool pBool)
    {
        return IE_.put_ToolBar(cast(short) (pBool == true ? -1 : 0)) == S_OK;
    }  
    
    bool menuBar(bool pBool)
    {
        return IE_.put_MenuBar(cast(short) (pBool == true ? -1 : 0)) == S_OK;
    }      
    
    bool fullScreen(bool pBool)
    {
        return IE_.put_FullScreen(cast(short) (pBool == true ? -1 : 0)) == S_OK;
    }       
    
    // 2009 03 18 added
    bool silent(bool pBool)
    {
        return IE_.put_Silent(cast(short) (pBool == true ? - 1 : 0)) == S_OK;
    }

    char[] bodyInnerText()
    {
        if(IE_ && URL_.length)
        {
            this.navigate(URL_);
            waitDocument(IE_, true);
            auto Body = getBody(IE_);
            scope(exit)
                tryRelease(Body);
            return getInnerText(Body);
        }
        return null;
    }
    
    // 2009 03 17 added
    void stop()
    {
        IE_.Stop();
    }
    
    // 2009 03 17 added
    void quit()
    {
        if(IE_)
        {
            IE_.Quit();
            tryRelease(IE_);            
        }
    }
    
    this()
    {
        IE_ = InternetExplorer.coCreate!(IWebBrowser2)(ExecutionContext.LocalServer);        
        if(IE_ !is null)
            this.visible = true;
    }
    
    static IE opCall() { return new IE(); }
    static IE opCall(char[] url) { return new IE(url); }
    static IE opCall(IWebBrowser2 iwb2) { return new IE(iwb2); }       
    static IE opCall(IWebBrowser2 iwb2, char[] url) { return new IE(iwb2, url); }       
    IWebBrowser2 getObj() { return IE_; }
    
    this(char[] url)
    {
        this.URL_= url;
        this();
    }    
    
    this(IWebBrowser2 iwb2)
    {
        this.IE_ = iwb2;
    }
     
    this(IWebBrowser2 iwb2, char[] url)
    {
        this.IE_ = iwb2;
        this.URL_ = url;
    }
     
    
    ~this()
    {
        quit();
    }
}
//IE

/**
    Variadic parameters to create a IE instance
    Example:
        auto ie = ieCreate(null, "Width",800, "Height",600, "ToolBar",false, "MenuBar",false);
        Sleep(10000);
*/
IWebBrowser2 ieCreate(IWebBrowser2 iwb2 = null, ...)
{
    char[] name;
    try
    {
        if(iwb2 is null) iwb2 = InternetExplorer.coCreate!(IWebBrowser2)(ExecutionContext.LocalServer);
        if(iwb2 is null)    
            throw new IEException( "Create IE instance failed" );

        iwb2.put_Resizable(VARIANT_TRUE);
        iwb2.put_AddressBar(VARIANT_TRUE);
        iwb2.put_ToolBar(VARIANT_TRUE);
        iwb2.put_MenuBar(VARIANT_FALSE);
        iwb2.put_StatusBar(VARIANT_TRUE);
        //iwb2.put_FullScreen(VARIANT_TRUE);
        //iwb2.put_Silent(VARIANT_TRUE);
        iwb2.put_Visible(VARIANT_TRUE);
        
        for (int i = 0; i < _arguments.length; i +=2)
        {   
            name = va_arg!(char[])(_argptr);
            switch (name)
            {
                case "Width":
                    iwb2.put_Width( va_arg!(int)(_argptr) );                    
                    break;
                case "Height":
                    iwb2.put_Height( va_arg!(int)(_argptr) ); 
                    break;
                case "Left":
                    iwb2.put_Left( va_arg!(int)(_argptr) );                     
                    break;
                case "Top":
                    iwb2.put_Top( va_arg!(int)(_argptr) ); 
                    break;
                case "FullScreen":
                    iwb2.put_FullScreen( cast(short) (va_arg!(bool)(_argptr) ? -1 : 0 )); 
                    break;
                case "Visible":
                    iwb2.put_Visible( cast(short) (va_arg!(bool)(_argptr) ? -1 : 0)); 
                    break;            
                case "Silent":
                    iwb2.put_Silent( cast(short) (va_arg!(bool)(_argptr) ? -1 :0 )); 
                    break;             
                case "Resizable":
                    iwb2.put_Resizable( cast(short) (va_arg!(bool)(_argptr) ? -1 : 0 )); 
                    break;             
                case "AddressBar":
                    iwb2.put_AddressBar( cast(short) (va_arg!(bool)(_argptr) ? -1 : 0 )); 
                    break;             
                case "ToolBar":
                    iwb2.put_ToolBar( cast(short) (va_arg!(bool)(_argptr) ? -1 : 0 )); 
                    break;              
                case "MenuBar":
                    iwb2.put_MenuBar( cast(short) (va_arg!(bool)(_argptr) ? -1 : 0 )); 
                    break;      
                case "StatusBar":
                    iwb2.put_StatusBar( cast(short) (va_arg!(bool)(_argptr) ? -1 : 0)); 
                    break;      
                case "Navigate":
                    navigate(iwb2, va_arg!(char[])(_argptr) );
                    break;
                default:
                    return iwb2;
            }//switch        
        }//for
    }
    catch(IEException e)
    {
        version( ieVerbose ) Trace.formatln(e.msg);
    }
    catch(Exception e)
    {
        version( ieVerbose ) Trace.formatln(e.msg);
    }    
    return iwb2;
}
//ieCreate

/**
    Examples:
    ---
        auto iwb2 = ieCreate(null, "MenuBar", -1);
        navigate(iwb2, "http://www.d-programming-language-china.org");
        Sleep(8000);
        auto middle = getElementById!(IWebBrowser2)(iwb2, "hMiddle");
        auto mright = getElementById!(IWebBrowser2)(iwb2, "hMright");
        
        auto eles = getAll!(IHTMLElement, IHTMLElement)(middle);
        auto one = getOne!(IHTMLElement, IHTMLElement)(eles, mleft, (IHTMLElement a, IHTMLElement b){ return contains(a,b); } );
        or:
            auto one = getOne!(IHTMLElement, char[])(eles, "id", 
                (IHTMLElement a, char[] b)
                { 
                    return  ( getAttribute!(char[], IHTMLElement)(a, b) ) == "hMright" ; 
                } 
            );
    ---

*/
A getOne(A , B)(A[] a, B b, bool delegate(A, B) dg)
{
    static assert( is(A : IUnknown), "Type of '" ~ typeof(A).stringof ~ "' must IUnknown." );
    A result;
    foreach(ref v; a)
    {
        if( !result && dg(v,b) )
            result = v;
        else
            tryRelease(v);
    }
    return result;
}
//getOne


bool isAnchor(T)(T t)
{
    bool result;
    static if(is(T == IHTMLAnchorElement))
        return true;
    static if( is(T == IHTMLElement) || is(T == IHTMLElement2) || is(T == IHTMLElement3) || is(T == IHTMLElement4) )
    {
        auto anchor = com_cast!(IHTMLAnchorElement)(t);
        scope(exit) tryRelease(anchor);
        if(anchor) return true;
        
        IHTMLElement parent;
        scope(exit) tryRelease(parent);
        IHTMLAnchorElement anchor2;
        scope(exit) tryRelease(anchor2);
            
        auto hr = t.get_parentElement(parent);
        if(hr == S_OK && parent)
        {
            anchor2 = com_cast!(IHTMLAnchorElement)(parent);
            if(anchor2) return true;
        }        
    }
    else static assert(false, "the type of '" ~ typeof(T).stringof ~ "' must be one of allowed types");
    return result;
}
//isAnchor


bool waitClose(IWebBrowser2 iwb2, uint delay = 50u)
{
    while( IsWindow(getHWND(iwb2)) )
    {
        doEvents(delay);
    }
    tryRelease(iwb2);
    return true;
}
//waitClose

bool checkNavigate(IWebBrowser2 iwb2, char[] url = "about:blank")
{
    if(!iwb2) return false;
    if( !getLocationURL!(IWebBrowser2)(iwb2) )
        navigate(iwb2, url);    
    return true;
}
//checkNavigate

IDispatch waitDocument(IWebBrowser2 iwb2, bool discard = true, uint timeout = 5000)
{
    if(!iwb2) 
        return null;
        
    IDispatch pDoc;     
    scope(exit) 
    {
        if(discard)
            tryRelease(pDoc);
    }
    uint delay = 50;
    
    // be sure navigate first
    for(size_t i; i < timeout/delay; i++)
    {
        doEvents(delay);        
        if ( iwb2.get_Document(pDoc) == S_OK )	  
            break;         
    }
    return pDoc;
    
    /*
    tagREADYSTATE rs;
    int hr = E_FAIL;
    while (rs != tagREADYSTATE.READYSTATE_COMPLETE) 
    {
        iwb2.get_ReadyState(rs);
        hr = iwb2.get_Document(pDoc);	  
        if(SUCCEEDED(hr)) break;
        if(!iwb2) break;    //TODO: check HWND of iwb2
        doEvents(50);            
    }
    */
}
//waitDocument

/**
    Examples:
    ---
    auto ie = ieCreate(null, "Width",800, "Height",600);
    auto ele = watId(ie, "main");
    if(ele)
        Stdout(getInnerHTML(ele)).newline;
    ---
*/
IHTMLElement waitId(IWebBrowser2 iwb2, char[] id,  uint ms = 15_000, uint delay = 100)
{
    IHTMLElement result;
    if(!iwb2 || !id.length) 
        return result;
    
   auto dispatch = waitDocument(iwb2,false); //for resolve the access violation
   if(!dispatch)
       return result;
   
   result =  getElementById!(IDispatch)(dispatch, id, false);
   if(result) 
       return result;
   
   uint begin = GetTickCount();
   while( (GetTickCount() - begin) < ms  )
   {           
       doEvents(delay);
       result =  getElementById!(IWebBrowser2)(iwb2, id);
       if(result) 
           return result;           
   }           
   return result;
}
//waitId

    
bool waitTitle(IWebBrowser2 iwb2, char[] titleSign, int ms = 15_000)
{
   uint begin = GetTickCount();
   while( (GetTickCount() - begin) < ms  )
   {           
       doEvents(50);
       char[] title = getTitle(iwb2);
       if(title.length && TextUtil.containsPattern(title, titleSign))
           return true;
   }           
   return false;    
}

///
bool isReadystateComplete(IWebBrowser2 iwb2)
{
    if(!iwb2)
        return false;
    
    tagREADYSTATE rs;
    iwb2.get_ReadyState(rs);    
    return rs == tagREADYSTATE.READYSTATE_COMPLETE;
}
//

/// is web browser exists
bool isBrowserExists(IWebBrowser2 iwb2)
{
    if(!iwb2)
        return false;
    
    auto hwb = getHWND(iwb2);
    return ( hwb && IsWindow(hwb) );    
}
//
