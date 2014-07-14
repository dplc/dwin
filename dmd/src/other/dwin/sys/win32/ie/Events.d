/*******************************************************************************
        
        copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/



module dwin.sys.win32.ie.Events;

private import dwin.sys.win32.com.Core;
private import dwin.sys.win32.com.Client;
private import dwin.sys.win32.ie.IE;
private import dwin.core.Ctfe;
        
version(ieVerbose) import tango.util.log.Trace;


/**
    Enable or disable contextmenu.
    Example:
    ---
        auto iwb2 = ieCreate(null, "MenuBar", true, "Navigate", "http://www.baidu.com/");        
        auto idis = waitDocument(iwb2, false);
        auto result = documentOncontextmenu!(IDispatch)(idis);    
        doEvents(8000);
        Stdout(result).newline;
        iwb2.Quit();
    ---
    knowledge:
        http://support.microsoft.com/kb/q180366/    How To Determine When a Page Is Done Loading in WebBrowser Control
        http://mykernelspace.com/oopslab/?p=11      How to know which element is clicked

*/

/*

    //old method, too complex
    auto b = ydb.ie.getDocumentElement( wb );
    debug Trace.formatln("got b ");
        
    if(!b) 
    {   debug Trace.formatln("not got DocumentElement ");
        return;
    }
    scope(exit) tryRelease(b);
    debug Trace.formatln("got b ");
        
    auto  eventbody = new EventProvider!(HTMLElementEvents)(b); //HTMLElementEvents2 failed
*/
bool documentOncontextmenu(T = IHTMLDocument2)(T t, VARIANT_BOOL vRe = VARIANT_FALSE)
{
    static assert( InTuple!(T, documentTypes),  
        "The type of '" ~ typeof(T).stringof ~ "' must be one of the allowed types." );
    
    static if( is(T == IHTMLDocument2) )
    {
        auto  eventbody = new EventProvider!(HTMLDocumentEvents)(t); //HTMLElementEvents2 failed
        scope(exit) tryRelease(eventbody);
        
        if(!eventbody) 
        {
            version(ieVerbose) Trace.formatln("eventbody failed ");
            return false;
        }
            
        version(ieVerbose) Trace.formatln("documentOncontextmenu function");
        eventbody.bind("oncontextmenu", 
            delegate short ()
            {
                return vRe;
                version(ieVerbose) Trace.formatln("attached oncontextmenu");
            }
        );    
        return true;        
    }
    else 
    {
        auto ihd2 = getDocument!(IHTMLDocument2, T)(t);
        scope(exit) 
            tryRelease(ihd2);
        return documentOncontextmenu!(IHTMLDocument2)(ihd2, vRe);
    }
}
//


bool documentOnclick(T = IHTMLDocument2)(T t, void delegate(IHTMLElement ihe) dg)
{
    static assert( InTuple!(T, documentTypes),  
        "The type of '" ~ typeof(T).stringof ~ "' must be one of the allowed types." );
    
    debug(ieVerbose) Trace.formatln("documentOnclick ");
    
    static if( is(T == IHTMLDocument2) )
    {
        auto  eventbody = new EventProvider!(HTMLDocumentEvents)(t); //HTMLElementEvents2 failed
        if(!eventbody) 
        {
            version(ieVerbose) Trace.formatln("eventbody failed ");
            return false;
        }
        scope(exit) tryRelease(eventbody);
            
        eventbody.bind("onclick", 
           delegate short (IHTMLEventObj evtObj)
            {
                short result = VARIANT_TRUE;
                scope(exit) tryRelease(evtObj);
                version(ieVerbose) Trace.formatln("fired documentOnclick ");
                    
                auto ihe = getSrcElement!(IHTMLElement, IHTMLEventObj)(evtObj);
                if(!ihe)
                {
                    version(ieVerbose) Trace.formatln("not got activeELement ");
                    return result ;
                }
                scope(exit) tryRelease(ihe);
                dg(ihe);
            
                //auto s = getInnerHTML(ihe);
                //debug(ieVerbose) Trace.formatln("you clicked ", s);
                    
                return result;
            }        
        );    
        return true;        
    }
    else 
    {
        auto ihd2 = getDocument!(IHTMLDocument2, T)(t);
        scope(exit) 
            tryRelease(ihd2);
        return documentOnclick!(IHTMLDocument2)(ihd2, dg);
    }
        
}
//
