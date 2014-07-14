/*******************************************************************************
        
        All implementions of IHTMLEventObj functions here.
        
        copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/



module dwin.sys.win32.ie.HTMLEventObj;

private import dwin.sys.win32.ie.IE;
        
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IHTMLEventObj2
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

R getSrcElement(R = IHTMLElement, T = IHTMLEventObj)(T t)
{
    static if(is(T == IHTMLEventObj2))
    {
        IHTMLElement ihe;            
        auto hr = t.get_srcElement(ihe);                
        static if(is(R == IHTMLElement))
            return ihe;
        else 
            return com_cast!(R)(ihe);        
    }
    else
    {
        auto obj = getEventObj!(IHTMLEventObj2, T)(t);
        scope(exit) tryRelease(obj);        
        return getSrcElement!(R, IHTMLEventObj2)(obj);
    }
}
//getSrcElement
