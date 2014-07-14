/*******************************************************************************

        copyright:      Copyright (c) 2007  (yidabu  gmail at com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/



module dwin.sys.win32.CodePage;

private import dwin.text.convert.Utf;
private import tango.stdc.stringz : toUTF16z = toString16z;
public import tango.sys.win32.CodePage;


////////////////////////////////////////////////////////////////////////////////
// to MBSz
////////////////////////////////////////////////////////////////////////////////

/******************************************
 * Converts the UTF-8, UTF-16, UTF-32 string s into a null-terminated string in a Windows
 * 8-bit character set.
 *
 * Params:
 * s = UTF-8 or UTF-16 or UTF-32 string to convert.
 * codePage = is the number of the target codepage, or
 *   0 - ANSI,
 *   1 - OEM,
 *   2 - Mac
 *
 * Authors:
 *	yidabu
 */

char* toMbsz(Buf) (Buf buf)
{
    static if( is(Buf == char[]) || is(Buf == wchar[]) || is(Buf == dchar[]) || is(Buf == wchar*) )
        return CodePage.into( toString(buf), new char[buf.length*3] ).ptr;
    else static assert( false, "Code.Page.toMbsz, wrong parameter" );
}
//

char[] toMbs(Buf) (Buf buf)
{
    static if( is(Buf == char[]) || is(Buf == wchar[]) || is(Buf == dchar[]) || is(Buf == wchar*) )
        return CodePage.into( toString(buf), new char[buf.length*3] );
    else static assert( false, "Code.Page.toMbs, wrong parameter" );
}
//



////////////////////////////////////////////////////////////////////////////////
// to UTF16z
////////////////////////////////////////////////////////////////////////////////

/*********************************
 * Convert array of UTF-8 or UTF-32 chars s[] to a C-style 0 terminated string.
 * tango.stdc.stringz lacks this function
 */

wchar* toString16z(wchar[] input)
{
    return toUTF16z(input);
}

wchar* toString16z(dchar[] input)
{
    return toString16z( toString16(input) );
}

wchar* toString16z(char[] input)
{
  return toString16z( toString16(input) );
}
//

wchar* toString16z(char[] input, int start, int count)
{
  if (input is null)
    return null;
  if (input.length == 0 || count == 0)
    return "";
  if (count == -1)
    count = input.length;

  return toString16z( toString16(input[start .. count]) );
}
//

wchar* toString16z(char* input)
{
    return toString16z( toString16(input) );
}
//


/**
    added for use with SHFILEOPSTRUCTW
*/
wchar* toString16zz(wchar[] input)
{
        if (input.ptr)
            if ( !(input.length > 1 && input[$-1] is 0 && input[$-2] is 0) )
                   input = input ~ "\0\0"w;
        return input.ptr;
}

wchar* toString16zz(dchar[] input)
{
    return toString16zz( toString16(input) );
}

wchar* toString16zz(char[] input)
{
  return toString16zz( toString16(input) );
}
//


/+
////////////////////////////////////////////////////////////////////////////////
// MBSz to UTF
////////////////////////////////////////////////////////////////////////////////

/**********************************************
 * Converts the null-terminated string s from a Windows 8-bit character set
 * into a UTF-8 or UTF-16 or UTF-32 char array.
 *
 * Params:
 * s = UTF-8 or UTF-16 or UTF-32 string to convert.
 * codePage = is the number of the source codepage, or
 *   0 - ANSI,
 *   1 - OEM,
 *   2 - Mac
 * Authors: yidabu
 */
char[] toString(char* s, int page = 0)
{
    return tango.text.convert.Utf.toString( toString16(s, page) );
}
//

/// ditto
wchar[] toString16(char* s, int page = 0)
{
    char* c;

    for (c = s; *c != 0; c++)
    {
        if (*c >= 0x80)
        {
            wchar[] result;
            int readLen;

            result.length = MultiByteToWideChar(page, 0, s, -1, null, 0);

            if (result.length)
                readLen = MultiByteToWideChar(page, 0, s, -1, result.ptr, result.length);

            if (!readLen || readLen != result.length)
                throw new IllegalArgumentException ("Stringz.toString16 :: "~SysError.lastMsg);

            return result[0 .. result.length-1]; // omit trailing null
        }
    }
    return tango.text.convert.Utf.toString16( s[0 .. c-s] );		// string is ASCII, no conversion necessary
}
//

/// ditto
dchar[] toUtf32(char* s, int page = 0)
{
    return tango.text.convert.Utf.toUtf32( toString16(s, page) );
}
//
+/
