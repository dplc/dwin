
// Written in the D programming language.

/*******************************************************************************
        
        copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: Nov 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module dwin.net.Uri;

public import tango.net.Uri;
    
private import tango.sys.win32.CodePage;

private import tango.text.Util;
    
/**
	simple uri encode. 
    Params:
        s       = UTF-8 string
        page    = Code Page

    Examples:
    ---
        auto s = uriEncode("一大步");
        Trace.formatln(s).newline;
    ---

*/
char[] uriEncode(char[] s, size_t page = 0)
{
	static const char[] hexDigits = "0123456789ABCDEF";	
    static const char[] esc = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz;/?:@&=+$,-.!~*'()";
        //RFC2396 Mark characters
    
    char[3] hex;
    char[] result;
    hex[0] = '%';
    char[] tmp = (page is 65001) ? s : CodePage.into(s, new char[s.length * 2 ], page);
    foreach ( char c;  tmp )
    {
        if (c == ' ') 
            //result ~= "%20";  // + ?
            result ~= "+";  // + ?
        else if ( esc.contains(c) ) 
            result ~= c;
        else
        {
            hex[1] = hexDigits [(c >> 4) & 0x0f];
            hex[2] = hexDigits [c & 0x0f];
            result ~= hex;
        }
    }
	return result;
}
debug(UnitTest) unittest
{
    assert( uriEncode("一大步", 936) == "%D2%BB%B4%F3%B2%BD" );
    assert( uriEncode("http://bbs.d-programming-language-china.org/forum-10-1.html?from=一大步", 936) == 
                      "http://bbs.d-programming-language-china.org/forum-10-1.html?from=%D2%BB%B4%F3%B2%BD" );
}
    

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
