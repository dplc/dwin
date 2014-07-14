// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2008  (yidabu at gmail com) All rights reserved

        Version:        Initial release: October 2008

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/


module ydb.text.markdown.Markdown;

public import ydb.text.markdown.c.mkdio;

private static import  tango.stdc.stringz;
private import tango.core.Exception : TextException;
private static import dwin.text.convert.Utf;
private import tango.stdc.stdio : EOF;

version(Windows) pragma(lib, "libmarkdown.lib");


class Markdown
{
    MMIOT* mmiot;
    
    public char[] source;
    public char[] html;
        
    private int flags;
        
    private bool compiled = false;
    
    this(char[] source, int flags = 0)
    {
        this.source = source;
        this.flags = flags;
        initString();
    }     
    
    public static Markdown opCall(char[] source, int flags=0) 
    { 
        return new Markdown(source, flags); 
    }  
    
    ~this() { cleanup(); }   
    
    void cleanup() { mkd_cleanup(mmiot); }  
    
    Markdown setFlags(int flags) 
    { 
        this.flags = flags; 
        return this;
    }
    
    int getFlags() 
    { 
        return flags;
    }
    
    alias document convert;
    alias document toString;
    char[] document()
    {
        compile();
        char* doc;
        int szdoc = mkd_document(mmiot, &doc);        
        html = ( szdoc != EOF ) ? doc[0..szdoc].dup : null;   
        return html;        
    }
    
    /// url base
    Markdown basename(char[] name)
    {
        mkd_basename(mmiot, tango.stdc.stringz.toStringz(name));
        return this;
    }
    
    char[] docTitle()
    {
        if( flags & MKD_NOHEADER )
            return null;
        compile();
        char* tmp = mkd_doc_title(mmiot);
        return dwin.text.convert.Utf.toString(tmp);
    }
    
    char[] docAuthor()
    {
        if( flags & MKD_NOHEADER )
            return null;        
        compile();
        char* tmp = mkd_doc_author(mmiot);
        return dwin.text.convert.Utf.toString(tmp);
    }

    char[] docDate()
    {
        if( flags & MKD_NOHEADER )
            return null;        
        compile();
        char* tmp = mkd_doc_date(mmiot);
        return dwin.text.convert.Utf.toString(tmp);
    }   

    char[] toc()
    {
        if( !(flags & MKD_TOC) )
            return null;        
        compile();
        char* buf;
        int sz = mkd_toc(mmiot, &buf);
        return  ( sz != EOF ) ? buf[0..sz].dup : null;
    }
    
    char[] css()
    {
        compile();
        char* buf;
        int sz = mkd_css(mmiot, &buf);
        return  ( sz != EOF ) ? buf[0..sz].dup : null;
    }    
    
    static char[] xml(char[] src)
    {
        char* buf;
        int sz = mkd_xml(tango.stdc.stringz.toStringz(src), src.length, &buf);
        return  ( sz != EOF ) ? buf[0..sz].dup : null;
    }    
    
    //now works now
    static char[] line(char[] src, int flags = 0)
    {
        char* buf;
        int sz = mkd_line( tango.stdc.stringz.toStringz(src), src.length, &buf, flags );
        return (sz != EOF) ? buf[0..sz].dup : null;
    }
    
    void exception(char[] msg)
    {
        throw new MarkdownException(this.classinfo.name ~ " " ~ msg);
    }    

    void initString()
    {
        mmiot = mkd_string( tango.stdc.stringz.toStringz(source), source.length, flags);
        if(!mmiot)
            exception( "mkd_string falied");     
    }    

    ///takes a document created by mkd_in() or mkd_string() and compiles it into a tree of block elements.                
    void compile()
    {
        if(!compiled)
        {
            if ( !mkd_compile(mmiot, flags) ) 
                exception("mkd_compile failed");         
            compiled = true;
        }        
    }
    
   unittest
    {
        
        char[] src = `% Chinese Astrology
% yidabu
% October 2008
The Eastern zodiac is the oldest known horoscope system in the world`;
        
    char[] htmlA = `<p>% Chinese Astrology
% yidabu
% October 2008
The Eastern zodiac is the oldest known horoscope system in the world</p>`;        
    
        char[] htmlB =  "<p>The Eastern zodiac is the oldest known horoscope system in the world</p>";     
            
        scope m1 = new Markdown(src, MKD_NOHEADER);
        assert (m1.docTitle() is null, "title");
        assert (m1.docAuthor() is null, "Author");
        assert (m1.docDate() is null, "Date");
        assert(m1.toString() == htmlA, "html a");
        
        scope m2 = new Markdown(src, 0);
        assert(m2.docTitle() == "Chinese Astrology");
        assert(m2.docAuthor() == "yidabu");
        assert(m2.docDate() == "October 2008");
        assert(m2.toString() == htmlB, "html b");    

        scope m3 = Markdown("[D China](/index.html)");
        m3.basename("http://www.d-programming-language-china.org");
        assert(m3.document == `<p><a href="http://www.d-programming-language-china.org/index.html">D China</a></p>`);

        scope m4 = Markdown("[D China](index.html)");
        m4.basename("http://www.d-programming-language-china.org");
        assert(m4.document == `<p><a href="index.html">D China</a></p>`);        
        
    }        
     
}

class MarkdownException : TextException
{
    this(char[] msg)
    {
        super(msg);
    }
}    


/*
    //// utilitities
    bool hasUtf8nBom(void[] source)
    {
        auto info = BomSniffer.test(source);
        return info !is null && info.encoding == Encoding.UTF_8N;  // windows utf_8 encoding
    }
    
    char[] removeUTF8nBOM(char[] source)
    {
        static const char[] bom = x"efbbbf";
        if(source.length > bom.length && source[0..bom.length] == bom)
            return source[bom.length..$];
        return source;
    }  
*/


/**
    Convert to D by yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )
    Version:        Initial release: October 2008
    based on Discount 1.36
    
    Steps to Build static library on Windows:
    
    1. download
    http://www.pell.portland.or.us/~orc/Code/markdown/

    2. C:\msys\etc\fstab to
    C:/MinGW /mingw

    3. rename c:/MinGW/bin/gcc.exe to cc.exe

    4. run msys
        run $ configure.sh --enable-all-features  
        
    to config.h:

#define HAVE_STRCASECMP 0         //change
#define HAVE_STRNCASECMP 0        //change
#define ALPHA_LIST 1              //add
#define strcasecmp stricmp        // add for windows fix
#define strncasecmp strnicmp      // add for windows fix 

    5. $ make

    7. static library
    copy libmarkdown.a to dwin/lib/libmarkdown.lib
    run coff2omf libmarkdown.lib

    8. C Module 
    copy mkdio.h to dwin/text/markdown/c/
    run htod.exe mkdio.h -hi
    to generate mkdio.d
    
    
    
    Discount 1.5.5
$ make
cc -I. -L. -I. -c main.c
main.c: In function `main':
main.c:103: warning: return type of 'main' is not `int'
cc -I. -L.    -c -o mkdio.o mkdio.c
cc -I. -L.    -c -o markdown.o markdown.c
cc -I. -L.    -c -o dumptree.o dumptree.c
cc -I. -L.    -c -o generate.o generate.c
generate.c: In function `printheader':
generate.c:1271: warning: passing arg 3 of `mkd_string_to_anchor' from incompati                                             ble pointer type
cc -I. -L.    -c -o resource.o resource.c
cc -I. -L.    -c -o docheader.o docheader.c
cc -I. -L. -DVERSION=\"`cat VERSION`\" -c version.c
cc -I. -L.    -c -o toc.o toc.c
toc.c: In function `mkd_toc':
toc.c:53: warning: passing arg 3 of `mkd_string_to_anchor' from incompatible poi                                             nter type
cc -I. -L.    -c -o css.o css.c
cc -I. -L.    -c -o xml.o xml.c
cc -I. -L.    -c -o Csio.o Csio.c
cc -I. -L.    -c -o xmlpage.o xmlpage.c
cc -I. -L.    -c -o amalloc.o amalloc.c
/c/MinGW/bin/ar crv libmarkdown.a mkdio.o markdown.o dumptree.o generate.o resou                                             rce.o docheader.o version.o toc.o css.o xml.o Csio.o xmlpage.o amalloc.o
a - mkdio.o
a - markdown.o
a - dumptree.o
a - generate.o
a - resource.o
a - docheader.o
a - version.o
a - toc.o
a - css.o
a - xml.o
a - Csio.o
a - xmlpage.o
a - amalloc.o
/c/MinGW/bin/ranlib libmarkdown.a
cc -I. -L. -o markdown main.o -lmarkdown 
./libmarkdown.a(generate.o):generate.c:(.text+0x18b9): undefined reference to `b                                             zero'
collect2: ld returned 1 exit status
make: *** [markdown] Error 1
    
            
*/

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
