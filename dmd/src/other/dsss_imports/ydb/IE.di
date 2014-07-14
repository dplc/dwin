/*******************************************************************************
        Main module of ie package
        
        copyright:      Copyright (c) 2007  (yidabu  g m a i l at com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: 2007

        author:         yidabu ( D programming language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module ydb.IE;

private import dwin.sys.win32.ie.IE;
private import dwin.sys.win32.com.Core;
private import dwin.io.Stream : MemoryStream;
private import dwin.sys.win32.headers.oleidl : IOleContainer;    
private import dwin.sys.win32.headers.objidl; // : IMoniker, IBindCtx, IEnumMoniker;
private import dwin.sys.win32.headers.objbase; // CreateBindCtx, STGM_READ
private import dwin.sys.win32.headers.urlmon : IPersistMoniker;
private import dwin.sys.win32.headers.ocidl : IPersistStreamInit;

private import tango.sys.win32.CodePage;
private import tango.sys.win32.Types;
    
private import bstr = dwin.sys.win32.com.Bstr;
    
pragma(lib, "dwin.lib");
    


//  How to get the WebBrowser object model of an HTML frame
//  http://support.microsoft.com/kb/196340
/**
    Example:
        auto iwb = ieCreate(null, "MenuBar", true);
        navigate(iwb, "http://www.d-programming-language-china.org
        Sleep(8000);
        auto iwbs = getFrames!(IHTMLFrameBase2, IWebBrowser2 )(iwb);
        wchar* bstr;
        scope(exit) freeBStr(bstr);
        foreach(v; iwbs)
        {
            v.get_readyState(bstr);
            formatln(fromBstr(bstr);
        }

*/
R[] getFrames(R, T)(T t)
{
    R[] result;
    int hr = E_FAIL;
    IOleContainer pContainer;
    scope(exit) tryRelease(pContainer);
        
    pContainer = getOleContainer(t);
    if(!pContainer) return result;
        
    IEnumUnknown pEnumerator;
    scope(exit) tryRelease(pEnumerator);

   // Get an enumerator for the frames
   hr = pContainer.EnumObjects(OLECONTF_EMBEDDINGS, pEnumerator);
   if (FAILED(hr)) { debug printf("not got IEnumUnknown "); return result;}

   IUnknown pUnk;
   size_t uFetched;
   // Enumerate and refresh all the frames
   for (uint i = 0; S_OK == pEnumerator.Next(1, &pUnk, uFetched); i++)
   {
       R r = com_cast!(R)(pUnk);
       tryRelease(pUnk);
       if(r)
           result ~= r;
   }    
    return result;
}
//getFrames(R,T)(T t)

/*
    Example:
    IWebBrowser2 iwb2 = ...
    IHTMLElement ihe = ...
    auto frameBase = isFramesContain!(IHTMLFrameBase2, IWebBrowser2 )(iwb2, ihe);
    if(!frameBase) { debug Trace.formatln("not got frameBase ");  }
    wchar* bstr;
    auto hr = frameBase.get_readyState(bstr);
    if(hr == S_OK) 
    version(ieVerbose) Trace(fromBStr(bstr));
*/

R isFramesContain(R, T)(T t, IHTMLElement ihe)
{
    R result;
    int hr = E_FAIL;
    
    R[] frames = getFrames!(R, T)(t);
    if(!frames) return result;
        
    foreach(ref v; frames)      //must use attribute ref
    {
        IHTMLElement docEle = getDocumentElement(v); 
        scope(exit) tryRelease(docEle);          
        if(!docEle) 
        { 
            debug Trace.formatln("isFramesContains not got document element ");   
            continue; 
        }
        
        if( contains(docEle, ihe) )
        //if( contains(v, ihe) )
            result = v;
        else
            tryRelease(v);
    }
    
    return result;
}
//isFramesContains


/**
    Example:
    ---
        auto iwb2 = ieCreate(null, "MenuBar", true, "Navigate", "http://www.d-programming-language-china.org
        char[] html = "<html><head></head><body>hello, world!</body></html>";
        char[] baseurl = "http://bbs.d-programming-language-china.org
        loadFromMoniker(iwb2, html, baseurl);
    ---
    when html contain <meta http-equiv=content-type content="charset=UTF-8">, the url always changed to about:blank
    solution:   toMBS(html)

*/

bool loadFromMoniker(IWebBrowser2 iwb2, char[] html, char[] sBaseUrl)
{
    bool result;
    int hr = E_FAIL;
    version(ieVerbose) char[] fn = "loadFromMoniker";
    try
    {
    
        auto pDoc = waitDocument(iwb2, false);
        if(!pDoc)
        {
            version(ieVerbose) 
                Trace.formatln("{} faild get IDispatch ", fn);
            return result;
        }        
            
        wchar* bstrUrl = bstr.fromString(sBaseUrl);      
        scope(exit) bstr.free(bstrUrl);
        auto ms = new MemoryStream;    
        //MBCS charatctors cause Access Violaiton
        ms.writeString( CodePage.into(html, new char[html.length*2]) ); //if html contains charset meta, will causes url changed to about:blank, so must toMBS
        //ms.writeString( html ); //if html contains charset meta, will causes url changed to about:blank, so must toMBS
        ms.position = 0; 
        
        auto m_stream = new COMStream(ms);      scope(exit) tryRelease(m_stream);
        auto istream = cast(IStream) m_stream;  scope(exit) tryRelease(istream);

        IPersistMoniker pPM = com_cast!(IPersistMoniker)(pDoc);     scope(exit) tryRelease(pPM);
        if(pPM is null)
        {
            version(ieVerbose) Trace.formatln("{} not got IPersistMoniker", fn);
            return result;
        }
        IBindCtx bindctx;       scope(exit) tryRelease(bindctx);
        hr = CreateBindCtx(0, &bindctx); 
        if( hr != S_OK || bindctx is null) 
        {
            version(ieVerbose) Trace.formatln("{} CreateBindCtx failed", fn);
            return result;            
        }

        LoadHTMLMoniker loadmoniker = new LoadHTMLMoniker();    scope(exit) tryRelease(loadmoniker);
        loadmoniker.initLoad(m_stream, bstrUrl);
        auto im = cast(IMoniker) loadmoniker;           scope(exit) tryRelease(im);
        //hr = CreateURLMoniker(null, bstrUrl, im);
        //testhr(hr, "CreateURLMoniker");
        hr = pPM.Load(0, im, bindctx, STGM_READ); 
        //hr = pPM.Load(1, im, bindctx, STGM_READ); 
        if( hr != S_OK)
        {
            version(ieVerbose) Trace.formatln("{} IMoniker.Load failed", fn);
            return result;
        }
        result = true;

    }//try
    catch(Exception e)
    {
        version(ieVerbose) Trace.formatln("{} loadFromMoniker catch {}", fn, e.msg);
    }
    return result;
}
//loadFromMoniker

/*
    http://groups.google.com/group/microsoft.public.inetsdk.programming.html_objmodel/browse_frm/thread/fa57f1eebf880388
    http://groups.google.com/group/microsoft.public.inetsdk.programming.mshtml_hosting/topics

    http://groups.google.com/group/microsoft.public.inetsdk.programming.mshtml_hosting/browse_thread/thread/af19d808e0d867e3/dcb9bfb4b9d0fc41?lnk=gst&q=load+getclassid&rnum=2#dcb9bfb4b9d0fc41
    I think I've got it figured out.  Any page that includes a <meta http-equiv> 
    causes MSHTML to call GetClassID() followed by Save() on the original 
    moniker and then Load() followed by GetDisplayName() on a newly created 
    moniker.  I suspect it's a round-about way of getting the display name to 
    support meta refresh. 

    CreateBindCtx 
    http://msdn2.microsoft.com/en-us/library/ms678542.aspx
    IPersistMoniker::Load Method
    http://msdn2.microsoft.com/en-us/library/ms775044.aspx
    How To Find the URL of an ActiveX Document from Inside the Server
    http://support.microsoft.com/kb/178059/zh-cn
*/
private class LoadHTMLMoniker : Implements!(IMoniker)
{
    private wchar* bstrUrl;    
    private COMStream m_stream;     
    private DWINGUID GIStream = { 0x0000000C, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };        
    
    /////////////////////////////////////////////// 
    // init the moniker object 
    /*
    this(char[] html, char[] sBaseUrl)
    {
        auto ms = new MemoryStream;     
        ms.writeString(html); 
        ms.position = 0; 
        m_stream = new COMStream(ms); 
            
        bstrUrl = toBStr(sBaseUrl); 
    }
    */

    void initLoad(ref COMStream baseStream, ref wchar* baseUrl)
    {
        this.m_stream = baseStream;
        this.bstrUrl = baseUrl;
    }

    /////////////////////////////////////////////// 
    // IMoniker implementation 
    //IBindCtx pbc, IMoniker pmkToLeft, ref DWINGUID riid, void** ppv
    int BindToStorage(IBindCtx pbc, IMoniker pmkToLeft, ref DWINGUID riid, out IUnknown ppvObj)
    { 
        int result =  E_FAIL;
        try
        {
        // NB: only IID_IStream seems to be used 
           if(riid == GIStream) 
           {
               ppvObj = m_stream ; 
           }
           result = S_OK;
        }
        catch(Exception e)
        {
        version(ieVerbose) Trace.formatln("BindToStorage catch %.*s",e.msg);
        }
        return result;
    } 


    int GetDisplayName(IBindCtx pbc, IMoniker pmkToLeft, out wchar* ppszDisplayName) 
    { 
        int result =  E_FAIL;
        try
        {
            ppszDisplayName = bstrUrl;
            //ppszDisplayName = toBStr("http://www.d-programming-language-china.org
            result = S_OK;
        }//try
        catch(Exception e)
        {
            version(ieVerbose) Trace.formatln("GetDisplayName catch %.*s",e.msg);
        }
        return result;
    }     
    
    int BindToObject(IBindCtx pbc, IMoniker pmkToLeft, ref DWINGUID riidResult, out IUnknown ppvResult)
    {
        version(ieVerbose) Trace.formatln("fired BindToObject ");
        return E_NOTIMPL;
    }
    
    
    int Reduce(IBindCtx pbc, size_t dwReduceHowFar, ref IMoniker ppmkToLeft, out IMoniker ppmkReduced)
    {
        version(ieVerbose) Trace.formatln("fired Reduce ");        
        return E_NOTIMPL;
    }    
    
    int ComposeWith(IMoniker pmkRight, int fOnlyIfNotGeneric, out IMoniker ppmkComposite)
    {
        version(ieVerbose) Trace.formatln("composeWith fired ");
        return E_NOTIMPL;
    }    
    
    int Enum(int fForward, out IEnumMoniker ppenumMoniker)
    {
        version(ieVerbose) Trace.formatln("fired Enum ");
        return E_NOTIMPL;
    }    
    int IsEqual(IMoniker pmkOtherMoniker)
    {
        version(ieVerbose) Trace.formatln("fired IsEqual ");        
        return E_NOTIMPL;
    }    
    int Hash(out size_t pdwHash)
    {
        version(ieVerbose) Trace.formatln("fired Hash ");        
        return E_NOTIMPL;
    }    
    int IsRunning(IBindCtx pbc, IMoniker pmkToLeft, IMoniker pmkNewlyRunning)
    {
        version(ieVerbose) Trace.formatln("fired IsRunning ");        
        return E_NOTIMPL;
    }    
    int GetTimeOfLastChange(IBindCtx pbc, IMoniker pmkToLeft, out FILETIME pFileTime)
    {
        version(ieVerbose) Trace.formatln("fired GetTimeOfLastChange ");        
        return E_NOTIMPL;
    }    
    int Inverse(out IMoniker ppmk)
    {
        version(ieVerbose) Trace.formatln("fired Inverse ");        
        return E_NOTIMPL;
    }    
    int CommonPrefixWith(IMoniker pmkOther, out IMoniker ppmkPrefix)
    {
        version(ieVerbose) Trace.formatln("fired CommonPrefixWith ");        
        return E_NOTIMPL;
    }    
    int RelativePathTo(IMoniker pmkOther, out IMoniker ppmkRelPath)
    {
        version(ieVerbose) Trace.formatln("fired RelativePathTo ");        
        return E_NOTIMPL;
    }    
    int ParseDisplayName(IBindCtx pbc, IMoniker pmkToLeft, wchar* pszDisplayName, out size_t pchEaten, out IMoniker ppmkOut)
    {
        version(ieVerbose) Trace.formatln("fired ParseDisplayName ");        
        return E_NOTIMPL;
    }    
    int IsSystemMoniker(out size_t pdwMksys)
    {
        version(ieVerbose) Trace.formatln("fired IsSystemMoniker ");        
        return E_NOTIMPL;
    }    
    
    int IsDirty()
    {
        version(ieVerbose) Trace.formatln("fired IsDirty ");        
        return E_NOTIMPL;
    }
    int Load(IStream pStm)
    {
        version(ieVerbose) Trace.formatln("fired Load ");
        return E_NOTIMPL;
    }    
    int Save(IStream pStm, int fClearDirty)
    {
        version(ieVerbose) Trace.formatln("fired Save ");        
        return E_NOTIMPL;
    }    
    int GetSizeMax(out ulong pcbSize)
    {
        version(ieVerbose) Trace.formatln("fired GetSizeMax ");        
        return E_NOTIMPL;
    }    
    
    int GetClassID(out DWINGUID pClassID)
    {
        version(ieVerbose) Trace.formatln("fired GeClassID ");
        pClassID = GIStream;
        return E_NOTIMPL;
    }
}
//loadHTMLMoniker

/**
    Examples:
    ---
        auto iwb2 = ieCreate(null, "MenuBar", true, "Navigate", "about:blank");
        char[] html = "<html><head></head><body>hello, world!</body></html>";
        loadFromStream(iwb2, html);
    ---
*/
bool loadFromStream(T = IWebBrowser2)(T t, char[] content)
{
    if(!t || !content.length) return false;
        
    static if( is(T == IWebBrowser2) )
    {
        auto idis = waitDocument(t, false);
        scope(exit) tryRelease(idis);
        return loadFromStream!(IDispatch)(idis, content);       
    }
    else static if( is(T == IPersistStreamInit) )
    {
        auto ms = new MemoryStream; 
        ms.writeString(content); 
        ms.position = 0; 
        auto s = new COMStream(ms); 
        scope(exit) tryRelease(s); 
        t.InitNew(); 
        t.Load(s);		
        return true;        
    }
    else static if( is(T == IDispatch) )
    {
        IPersistStreamInit ip = com_cast!(IPersistStreamInit)(t);         
        scope(exit) tryRelease(ip);
        return loadFromStream!(IPersistStreamInit) (ip, content);
    }
    else static if( InTuple!(T, dispatchTypes) )
    {
        auto idis = getDispatch!(T)(t);
        scope(exit) tryRelease(idis);
        return loadFromStream!(IDispatch)(idis, content);
    }        
    else static assert(false, "The type of '" ~ typeof(T).stringof ~ "' must be one of the allowed types.");    
}
//loadFromStream

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
