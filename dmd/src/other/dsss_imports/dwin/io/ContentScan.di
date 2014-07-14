// Written in the D programming language.

/*******************************************************************************

        Copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: Mar 2008

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/


module dwin.io.ContentScan;

private import  tango.io.device.File,
        tango.io.FilePath;

private import  tango.text.Regex,
        tango.text.Util;


/*******************************************************************************

    tango.text.Regex is simple, not powerful, may instead of pcre in the future.

    Example:
    ---
    //auto path = r"D:\path\to\dwin\";
    PathScan scan;
    scan.recurse = true;
    scan.suffixs = ".d";
    //scan.contain = r"\lab\";
    auto result = scan.scan(path);

    auto contentScan = new ContentScan();
    contentScan.regexContain = r"[aA]uthors?:[^\r\n]+?yidabu[^\r\n]+";
    contentScan.replaceWith = "Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )";
    contentScan.scan(result.files);

    Stdout.formatln ("\n{} Relpaced Files", contentScan.find.length);
    foreach(file; contentScan.find)
    {
        Stdout(file).newline;
    }

    Stdout.formatln ("\n{} Files no Replaced", contentScan.notfind.length);
    foreach(file; contentScan.notfind)
    {
        Stdout(file).newline;
    }

    ---

********************************************************************************/


class ContentScan
{
    /// exactly string
    char[] contain;
    /// exactly excluded string
    char[] exclude;

    /// See_Also: tango.text.Regex
    char[] regexContain;
    char[] regexExclude;

    Regex regexContain_;
    Regex regexExclude_;

    char[] replaceWith;

    FilePath[] find;
    FilePath[] notfind;

    ContentScan scan(FilePath[] files)
    {
        if(!files.length)
            return this;

        if(regexContain.length)
            regexContain_ = Regex(regexContain);
        if(regexExclude.length)
            regexExclude_ = Regex(regexExclude);

        foreach(file; files)
        {
            char[] src = cast(char[]) File.get(file.dup.native.toString);

            if( (contain.length && !src.containsPattern(contain))   ||
                (exclude.length && src.containsPattern(exclude))    ||
                (regexContain_  && !regexContain_.test(src))        ||
                (regexExclude_  && regexExclude_.test(src))
            )
            {
                notfind ~= file.dup.native;
                continue;
            }

            find ~= file.dup.native;

            if( replaceWith.length && (regexContain.length || contain.length) )
            {
                if(regexContain.length)
                    src = regexContain_.replaceAll(src, replaceWith);
                else if( contain.length )
                    src = substitute(src, contain, replaceWith);
                (new File(file.dup.native.toString)).write(src);
            }
        }//foreach

        return this;
    }//scan

}//ContentScan

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
