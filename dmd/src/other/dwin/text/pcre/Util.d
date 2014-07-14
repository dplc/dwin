// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2008  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: 2008

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/



module dwin.text.pcre.Util;

private import dwin.text.pcre.RegExp;

char[] stripLineBeginningSpace(char[] src)
{
    scope regex = RegExp("(?m)^[ 　\t]+", PCRE_UTF8);
    return regex.replace(src, r"");    
}

unittest
{
    assert(stripLineBeginningSpace(" aaa") == "aaa");
    assert(stripLineBeginningSpace("　aaa") == "aaa");
    assert(stripLineBeginningSpace("　\n") == "\n");
    assert(stripLineBeginningSpace(" aaa\r\n　bbb\r\n") == "aaa\r\nbbb\r\n");        
}


char[] splitParagraphs(char[] src)
{
    version(Windows)
        char[] line = "\r\n";
    else
        char[] line = "\n";
    
    scope regex = RegExp("(?>)\n([\t ]*)(?=[^\r\n\t ])", PCRE_UTF8);
    return regex.replace(src, "\n" ~ line ~ r"\g(1)");    
}

unittest
{
    assert(splitParagraphs("\n") == "\n");    
    assert(splitParagraphs("\n\n") == "\n\n");
    assert(splitParagraphs("\n\r\n") == "\n\r\n");
    assert(splitParagraphs("\n\t") == "\n\t");
    version(Windows)
    {
        assert(splitParagraphs("\n\ta") == "\n\r\n\ta");
        assert(splitParagraphs("\n a") == "\n\r\n a");
        assert(splitParagraphs("\na") == "\n\r\na");        
    }
}