// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: Mar 2008

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module dwin.text.Locale;

version(Win32):

private import  tango.text.locale.Core;
private import  dwin.sys.Common;

/**
    Get User Default Culture Name
    See_Also:
    CultureInfo Class
    http://msdn2.microsoft.com/en-us/library/system.globalization.cultureinfo(VS.71).aspx   

*/
char[] userDefalutCultureName()
{     
    auto langID = cast(int) (GetUserDefaultLangID());
    scope culture = new Culture( langID );                
    debug(UnitTest) assert(culture.name.length);
    return culture.name;    /// e.g. en-US or zh-CN    
}


version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
