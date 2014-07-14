// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2009  (dyuyan  gmail at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: June 2009

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/



module dwin.text.convert.UnicodeBom;

private import tango.text.convert.UnicodeBom;
private import tango.sys.win32.CodePage;


    /**
        convert a windows file content to UTF8
        Date: June 20, 2009
        Example:
        -----------
        auto src = File.get(path);
        char[] result = bomToUtf8(src);
        -----------
    */
    char[] bomToUtf8(void[] source, size_t page = 0)
    {        
        //Encoding.UTF_8N == windows utf_8 encoding
        if(auto info = BomSniffer.test(source))
        {
            auto unicodeBom = new UnicodeBom!(char)(Encoding.Unknown);
            return unicodeBom.decode(source);
        }  
        else
            return CodePage.from(cast(char[]) source, new char[source.length * 3], page);        
    } 
