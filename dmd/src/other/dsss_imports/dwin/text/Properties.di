
// Written in the D programming language.

/*******************************************************************************

        Copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: October 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

        Loads or writes an ini style file.

        Write this module because tango.io.stream.Map has not support multi line value and section.

        this module based on tango.text.Properties and loadINI function ( Adam D. Ruppe, destructionator@gmail.com )
        http://arsdnet.net/code/Ini.html

        It loads the file filename, which should be in a format of :

        ---
            # this is a comment
            [section]
            name = value

            name = {{
            multi
            line
            value
            }}
        ---

        Examples:
        ---
            D:\config.ini :

            [url]
            bbs = http://www.d-programming-language-china.org/
            DChina = http://www.d-programming-language-china.org/
            [about]
            dchina = {{{
                D programming language in China.
            Has Many articles about D.
            }}}

            test.d :

            auto path = r"D:\config.ini";
            auto ini = iniLoad(FilePath(path), "{{{", "}}}");
            Cout(iniToUtf8(ini)).newline;
            ini["url"]["bbs"] = "www.d-programming-language-china.org/forum-10-1.html";
            ini["url"]["DChina"] = "www.d-programming-language-china.org/";
            iniSave(ini, "{{{", "}}}");

        ---
*******************************************************************************/

module dwin.text.Properties;

private import                tango.text.Util;

private import  tango.io.device.Array,
                tango.io.FilePath,
                tango.io.device.File;

private import  tango.io.model.IConduit;

private import  tango.text.Util : trimr;

private import tango.text.Ascii : toLower;

private import  tango.io.stream.Lines; //tango 0.99.8

version(textVerbose) private import tango.util.log.Trace;

/*******************************************************************************

        Provides iniLoad facilities for a string. containing lines of text with a name=value layout.

*******************************************************************************/


T[][T[]] [T[]] iniLoad(T=char) (T[] s, T[] delimBegin = "{{", T[] delimEnd = "}}")
{
    //auto gb = new GrowBuffer;
    //gb.append(s.ptr, s.length);
    auto buf = new Array(s); //tango 0.99.8

    return iniLoad( buf, delimBegin, delimEnd);
}


/***********************************************************************

        Load properties from the named file.

***********************************************************************/

T[][T[]] [T[]] iniLoad(T=char) (FilePath path, T[] delimBegin = "{{", T[] delimEnd = "}}" )
{
    auto fc = new File ( path );
    scope (exit)
           fc.close;

    return iniLoad (fc, delimBegin, delimEnd);
}

/***********************************************************************

        Load properties from the provided buffer.

        We use an iterator to sweep text lines, and extract lValue
        and rValue pairs from each one, The expected file format is
        as follows:

        ---
        [yidabu]
        x = y
        abc = 123
        x.y.z = this is a single property
        bbs = {{
            this is a multie line property.
            http://www.d-programming-language-china.org
            D China , many articles about D programming language.
        }}

        # this is a comment line
        ---

***********************************************************************/

T[][T[]] [T[]] iniLoad(T = char) (InputStream stream, T[] delimBegin = "{{", T[] delimEnd = "}}" )
{
    T[][T[]] [T[]] aa;

    version (Win32)
        const T[] NL = "\r\n" ;
    version (Posix)
        const T[] NL = "\n";

    bool multiLine;
    T[] section;
    T[] mkey;
    T[] mvalue;

    foreach (line; new Lines!(T) (stream))
    {
        auto text = trim (line);

        if ( multiLine )
        {
            if( text == delimEnd )
            {
                aa[section][mkey] = trimr(mvalue);
                mvalue = "";
                mkey = "";
                multiLine = false;
                continue;
            }
            else
            {
                mvalue ~= line.dup ~ NL;        //must dup
                continue;
            }
        }

        // comments require '#' as the first non-whitespace char
        if (!text.length || (text[0] == '#'))
            continue;

        if(text[0] == '[')
        {
            section = text[1..$-1].dup; //must dup
            continue;
        }

       // find the '=' char
       auto i = locate (text, '=');

       // ignore if not found ...
       if (i < text.length)
       {
            T[] key      = trim (text[0 .. i]).dup;         //must dup
            T[] value    = trim (text[i+1 .. $]).dup;
            if( delimBegin.length && delimEnd.length && value == delimBegin )
            {
                mkey = key;
                multiLine = true;
            }
            else
                aa[section][key] = value;
       }

    }//foreach
    return aa;
}//iniLoad


/***********************************************************************

        Write properties to the provided filepath

***********************************************************************/

void iniSave(T = char) (T[] path, T[][T[]] [T[]] properties, T[] delimBegin = "{{", T[] delimEnd = "}}")
{
    iniSave( FilePath(path), properties, delimBegin, delimEnd );
}



void iniSave(T = char) (FilePath path, T[][T[]] [T[]] properties, T[] delimBegin = "{{", T[] delimEnd = "}}")
{
    auto fc = new File (path, File.WriteCreate);
    scope (exit)
           fc.close;
    iniSave (fc, properties, delimBegin, delimEnd);
}

/***********************************************************************

        Write properties to the provided conduit

***********************************************************************/
void iniSave (T)(OutputStream stream, T[][T[]] [T[]] properties, T[] delimBegin = "{{", T[] delimEnd = "}}")
{
        auto b = cast(Buffered) stream;
        auto emit = b ? b.buffer : new Buffer (stream.conduit);
        emit( iniToUtf8(properties, delimBegin, delimEnd) );
        emit.flush;
}


/*
void iniSave(T = char) (IConduit conduit, T[][T[]] [T[]] properties, T[] delimBegin = "{{", T[] delimEnd = "}}")
{
    iniSave (new Buffer(conduit), properties, delimBegin, delimEnd).flush;
}
*/

/*
IBuffer iniSave(T = char) (IBuffer emit, T[][T[]] [T[]] properties, T[] delimBegin = "{{", T[] delimEnd = "}}")
{
    const T[] equals = " = ";

    emit( iniToUtf8(properties, delimBegin, delimEnd) );
    return emit;
}
*/

T[] iniToUtf8(T = char)(T[][T[]] [T[]] properties, T[] delimBegin = "{{", T[] delimEnd = "}}" )
{
    const T[] equals = " = ";
    version (Win32)
        const T[] NL = "\r\n" ;
    version (Posix)
        const T[] NL = "\n";

    T[] result;
    foreach (key, value; properties)
    {
        if(key.length)
            result ~= "[" ~ key ~ "]" ~ NL;
        foreach(kk, vv; value)
        {
            result ~= kk ~ equals;
            if( containsPattern(vv, NL) && delimBegin.length && delimEnd.length )
                result ~= delimBegin ~ NL ~ vv ~NL ~ delimEnd ~ NL;
            else
                result ~= vv ~ NL;
        }
    }
    return trimr(result);
}



/**
	toBool: attempts to convert a string that might be found in the ini to a boolean value.

	See the source for its details; this function is only about 15 lines long.
*/
bool toBool(T = char)(T[] str)
{
	switch(toLower(str))
    {
		case "yes":
		case "true":
		case "t":
		case "y":
		case "1":
			return true;
		case "no":
		case "false":
		case "n":
		case "f":
		case "0":
			return false;
	}
}
//

debug(UnitTest) unittest
{
        char[] s = "[url]
bbs=http://www.d-programming-language-china.org
www=www.d-programming-language-china.org
[contact]
support=support@gmail.com
sales=sales@gmail.com
";

        char[][char[]] [char[]] result = iniLoad(s);
        assert( result["url"]["bbs"] == "http://www.d-programming-language-china.org" );
        assert( result["url"]["www"] == "www.d-programming-language-china.org" );
        assert( result["contact"]["support"] == "support@gmail.com" );
        assert( result["contact"]["sales"] == "sales@gmail.com" );

}
//
/+



/*******************************************************************************

        Provides load facilities for a properties file. That is, a file
        or other medium containing lines of text with a name=value layout.

*******************************************************************************/

struct Ini(T)
{
        alias load opCall;

        static
        {
            T[][T[]] aa = null;
            T[] delim = "`";
            FilePath fp;
        }



        static T[][T[]] load (T[] path, T[] delim = "`")
        {
            this.fp = FilePath(path);
            this.delim = delim;
            return load(fp, delim);
        }


        /***********************************************************************

                Load properties from the named file, and pass each of them
                to the provided delegate.

        ***********************************************************************/

        //static void load (FilePath path, void delegate (T[] name, T[] value) dg)
        static T[][T[]] load (FilePath path = fp, T[] delim = "`")
        {
                auto fc = new File ( path );
                scope (exit)
                       fc.close;

                return load (fc);
        }

        /***********************************************************************

                Load properties from the provided buffer, and pass them to
                the specified delegate.

                We use an iterator to sweep text lines, and extract lValue
                and rValue pairs from each one, The expected file format is
                as follows:

                ---
                x = y
                abc = 123
                x.y.z = this is a single property

                # this is a comment line
                ---

        ***********************************************************************/

        //static void load (InputStream stream, void delegate (T[] name, T[] value) dg)
        static T[][T[]] load (InputStream stream)
        {
                foreach (line; new SimpleIterator!(T) (delim, stream))
                        {
                        auto text = Text.trim (line);
                        // comments require '#' as the first non-whitespace char
                        if (text.length && (text[0] != '#'))
                           {
                           // find the '=' char
                           auto i = Text.locate (text, '=');

                           // ignore if not found ...
                           if (i < text.length)
                               aa[ Text.trim (text[0 .. i]) ] = Text.trim (text[i+1 .. $]);
                           }
                        }
                return aa;
        }

        /***********************************************************************

                Write properties to the provided filepath

        ***********************************************************************/

        static void save (FilePath path = fp, T[][T[]] properties = aa)
        {
                auto fc = new File (path, File.WriteCreate);
                scope (exit)
                       fc.close;
                save (fc, properties);
        }

        /***********************************************************************

                Write properties to the provided conduit

        ***********************************************************************/

        static void save (IConduit conduit, T[][T[]] properties = aa)
        {
                save (new Buffer(conduit), properties).flush;
        }

        /***********************************************************************

                Write properties to the provided buffer

        ***********************************************************************/

        static IBuffer save (IBuffer emit, T[][T[]] properties = aa)
        {
                const T[] equals = " = ";

                version (Win32)
                         //const T[] NL = "\r\n";
                         T[] NL = delim;
                version (Posix)
                         T[] NL = delim;
                         //const T[] NL = "\n";

                foreach (key, value; properties)
                         emit (key) (equals) (value) (" ") (NL);
                return emit;
        }
}
+/

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
