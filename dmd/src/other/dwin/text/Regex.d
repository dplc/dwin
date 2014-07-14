
// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: Dec 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/


module dwin.text.Regex;


/// how weak that Tango Regex does
private import dwin.text.pcre.RegExp;
    

/**
    use with Regex

    UTF SBC case \u3000 or \xe3\x80\x80
    GBK SBC case \xa1\xa1

    \u0020 = space
    \u0009 = TAB
    \u000B = VT
    \u000C = FF
    
*/

// need up to date with new jaschaW's Regex lib
struct Pattern
{
    static const char[] chinese = "[\u4e00-\u9fa5]";
    static const char[] alnum = "[a-zA-Z0-9]";
    
    ///is it a space ? use with Regex
    static const char[] inLineSpace         = "[\u0020\u0009\u000B\u000C]";             
    
    ///is it not a space ? 
    static const char[] notInLineSpace      = "[^\u0020\u0009\u000B\u000C]";         
    
    /// contains SBC case \u3000
    static const char[] inLineSpaceEx       = "[\u0020\u0009\u000B\u000C\u3000]";     
    static const char[] notInLineSpaceEx    = "[^\u0020\u0009\u000B\u000C\u3000]"; 
    
    version(Win32)
    {
        static const char[] line = "\r\n";
        static const char[] notLine = "[^\r\n]";
    }
    else
    {
        static const char[] line = "\n";
        static const char[] notLines = "[^\n]+";        
    }    
}

/*
debug(UnitTest) 
{
    import tango.text.Regex;
    
    unittest
    {
        auto r = Regex(Pattern.inLineSpaceEx);
        char[] s = " ";           //space
        assert(r.test(s));
        s = "   ";               //TAB
        assert(r.test(s));
        s = "　";
        assert(r.test(s));      // UTF SBC case
        
        s = "hello";
        assert(!r.test(s));      
    }
}
*/





/** true if c is a chinese char[], false otherwise */
bool isChinese(char[] c)
{
	auto regexp = RegExp("^[\u4e00-\u9fa5]+$");
	return (regexp.execute(c) !is null);
}


debug(UnitTest) unittest
{
    assert(isChinese("中国"));
    assert(!isChinese("abcd"));
}

