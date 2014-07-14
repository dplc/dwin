
// Written in the D programming language.

/*******************************************************************************

        Copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module ydb.bridge.php.String;

private import  dwin.text.pcre.RegExp,
        dwin.text.Util,
        dwin.core.Traits,
        dwin.io.Digest;

private import  dwin.text.Unicode : toLower;

private import  tango.text.Unicode,
        tango.core.Traits,
        tango.util.Convert;

private import  tango.util.log.Trace;

private import  Integer = tango.text.convert.Integer;
private import  Unicode = tango.text.Unicode;
private import  Util    = tango.text.Util;



//for htmlspecialchars
enum
{
    ENT_COMPAT,
    ENT_QUOTES,
    ENT_NOQUOTES
}


/// todo, seems not same as PHP
int crc32 ( char[] str )
{
    int result;
    if(!str.length)
        return result;

    auto crc = getCrc32(str);
    result = Integer.toInt(crc.hexDigest, 16);

    return result;
}


/**
    explode — 使用一个字符串分割另一个字符串

    说明
    此函数返回由字符串组成的数组，每个元素都是 string 的一个子串，它们被字符串 separator 作为边界点分割出来。如果设置了 limit 参数，则返回的数组包含最多 limit 个元素，而最后那个元素将包含 string 的剩余部分。

    如果 separator 为空字符串（""），explode() 将返回 FALSE。如果 separator 所包含的值在 string 中找不到，那么 explode() 将返回包含 string 单个元素的数组。

    如果 limit 参数是负数，则返回除了最后的 -limit 个元素外的所有元素。此特性是 PHP 5.1.0 中新增的。

*/
char[][] explode ( char[] separator , char[] src, int limit = int.max )
{
    if(!separator.length)
        return null;

    //if( !Util.containsPattern(src, separator) )
        //return [src];

    char[][] result;

    auto i = Util.locatePattern (src, separator);
    while (i != src.length )
    {
        if( limit > 0)
            if(result.length >= limit -1)
                break;

        result ~= src[0 .. i];
        src = src [i + separator.length .. $];
        i = Util.locatePattern (src, separator);
    }

    if(limit < 0 )
    {
        if( result.length > limit)
            result.length = result.length + limit;
    }
    else
        result ~= src;

    return result;
}
debug unittest
{
        auto pizza  = "piece1 piece2 piece3 piece4 piece5 piece6";
        auto pieces = explode(" ", pizza);
        assert ( pieces[0] == "piece1" );
        assert ( pieces[1] == "piece2" );

        auto str = "one|two|three|four";
        auto result = explode("|", str, 2);
        assert( result.length == 2 && result[0] == "one" && result[1] == "two|three|four" );

        // 负数的 limit（自 PHP 5.1 起）
        result = explode("|", str, -1);
        assert( result.length == 3 && result[0] == "one" && result[1] == "two" && result[2] == "three" );

}
//



/**
The default mode, ENT_COMPAT, is the backwards compatible mode which only translates the double-quote character and leaves the single-quote untranslated. If ENT_QUOTES is set, both single and double quotes are translated and if ENT_NOQUOTES is set neither single nor double quotes are translated.
'&' (ampersand) becomes '&amp;'
'"' (double quote) becomes '&quot;' when ENT_NOQUOTES is not set.
''' (single quote) becomes '&#039;' only when ENT_QUOTES is set.
'<' (less than) becomes '&lt;'
'>' (greater than) becomes '&gt;'
*/

char[] htmlspecialchars ( char[] str, int quote_style = ENT_COMPAT)
{
    str = Util.substitute(str, "&", "&amp;");
    str = Util.substitute(str, "<", "&lt;");
    str = Util.substitute(str, ">", "&gt;");
    switch ( quote_style )
    {
        case ENT_QUOTES :   //both
            str = Util.substitute(str, "\"", "&quot;");
            str = Util.substitute(str, "'", "&#039;");
            break;
        case ENT_COMPAT :   //only translates the double-quote
            str = Util.substitute(str, "\"", "&quot;");
        case ENT_NOQUOTES : //both not
            break;
        default:
    }
    return str;
}
debug unittest
{
    char[] result = htmlspecialchars("<a href='test'>Test</a>", ENT_QUOTES);
    assert( result == "&lt;a href=&#039;test&#039;&gt;Test&lt;/a&gt;" );


}
//

char[] implode(char[] glue, char[][] pieces)
{
    return Util.join(pieces, glue);
}
debug unittest
{
    auto array = ["lastname".dup, "email", "phone"];
    auto result = implode(",", array);
    assert( result == "lastname,email,phone" );
}
//

int ord(char c)
{
    int i = c;
    return i;
}

int ord(char[] str)
{
    int result;
    if(!str.length)
        return result;
    else
        return ord(str[0]);
}
debug unittest
{
    auto str = "\n";
    assert( ord(str) == 10 );
}
//

/**
    substr() returns the portion of string specified by the start and length parameters.

    If start is non-negative, the returned string will start at the start'th position in string, counting from zero. For instance, in the string 'abcdef', the character at position 0 is 'a', the character at position 2 is 'c', and so forth.

    If start is negative, the returned string will start at the start'th character from the end of string.

    If length is given and is positive, the string returned will contain at most length characters beginning from start (depending on the length of string). If string is less than or equal to start characters long, FALSE will be returned.

    If length is given and is negative, then that many characters will be omitted from the end of string (after the start position has been calculated when a start is negative). If start denotes a position beyond this truncation, an empty string will be returned.


*/
T[] substr (T) ( T[] str, int start , int len = int.max )
{
    if(!str.length)
        return str;

    if(start >= str.length)
        return null;

    if(start < 0)
        start = str.length + start;

    if(len < 0)
    {
        str.length = str.length + len;
        if(start >= str.length)
            return "";
    }
    else if(len > 0)
    {
        if( len + start > str.length)
            len = str.length - start;
    }

    return str[start .. start + len];
}
//
debug unittest
{

    char[] str = "abcdef";
    assert( substr(str, 1)     == "bcdef" );
    assert( substr(str, 1, 3)  == "bcd" );
    assert( substr(str, 0, 4)  == "abcd" );
    assert( substr(str, 0, 8)  == "abcdef" );
    assert( substr(str, -1, 1) == "f" );

    assert( substr(str, -1)    == "f" );
    assert( substr(str, -2)    == "ef" );
    assert( substr(str, -3, 1) == "d" );

    assert( substr(str, 0, -1)  == "abcde" );
    assert( substr(str, 2, -1)  == "cde" );
    assert( substr(str, 4, -4)  == "" );
    assert( substr(str, -3, -1) == "de" );

}


int strlen(T)(T[] str)
{
    return str.length;
}
//

/**
    strpos --  Find position of first occurrence of a string
    Description

    Returns the numeric position of the first occurrence of needle in the haystack string.
    Unlike the strrpos(), this function can take a full string as the needle parameter and the entire string will be used.

    TODO: D can not have two types of return value : bool and int
*/

uint strpos (T) ( T[] haystack, T[] needle , int offset = 0 )
{
    return Util.locatePattern(haystack, needle, offset);
}


char[] str_replace ( char[] search , char[] replace , char[] subject)
{
    return Util.substitute(subject, search, replace);
}
debug unittest
{
// Provides: <body text='black'>
    assert( str_replace("%body%", "black", "<body text='%body%'>") == "<body text='black'>" );
}
//


T[] str_repeat(T, U=uint)(T[] src, U count)
{
    return Util.repeat(src, count);
}
//

T strtolower(T)(T str)
{
    return toLower(str);
}


// is here?
char[] dechex ( int number )
{
    char[64] tmp;
    return Integer.format(tmp, number, "x").dup;
}
char[] dechex ( char[] str )
{
    if(!str.length)
        return null;
    return dechex(str[0]);
}

debug unittest
{
    assert(dechex(10) == "a");
    assert(dechex(47) == "2f");

}
//


bool is_numeric(T)(T t)
{
    static if( isNumericType!(T) )
        return true;
    else static if( isCharType!(T) )
        return Unicode.isDigit(t);
    else static assert(false, "the type of " ~ typeof(T).stringof ~ " is numeric type ? ");
}

debug unittest
{
    assert( is_numeric('1') );
    assert( !is_numeric('a') );
    assert( is_numeric(56789) );
}




version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
