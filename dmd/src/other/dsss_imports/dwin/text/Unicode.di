
// Written in the D programming language.

/*******************************************************************************

        Copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: Nov 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module dwin.text.Unicode;

private import  tango.text.Unicode,
                tango.core.Traits;

private import  dwin.text.convert.Utf,
        dwin.core.Traits;


/**
 * Determines if characters oncly contains digit. It returns true for decimal
 * digits only.
 *
 * Params:
 *     chs = the characters to be inspected
 */
bool isDigits(T)(T[] chs)
{
    static assert( isCharType!(T) );

    if(!chs.length)
        return false;

    foreach(v; toString32(chs) )
        if( !isDigit(v) )
            return false;

    return true;
}

/**
 * Determines if characters only contain letter.
 *
 * Params:
 *     chs = the character to be inspected
 */
bool isLetters (T)(T[] chs)
{
    static assert( isCharType!(T) );

    foreach(v; chs)
        if( !isLetter(cast(int)v) )
            return false;
    return true;
}


/**
 * Determines if characters contains letter or decimal digit only.
 *
 * Params:
 *     chs = the characters to be inspected
 */
bool isAlnums(T)(T[] chs)
{
    static assert( isCharType!(T) );
    foreach(v; chs)
        if( !isLetterOrDigit(cast(int)v) )
            return false;
    return true;

}


/**
 * Determines if characters contains lower case letter only.
 * Params:
 *     chs = the characters to be inspected
 */
bool isLowers(T)(T[] chs)
{
    static assert( isCharType!(T) );
    foreach( v; toString32(chs) )
        if( !isLower(v) )
            return false;

    return true;
}




/**
 * Determines if characters contains upper case letter only.
 * Params:
 *     chs = the characters to be inspected
 */
bool isUppers(T)(T[] chs)
{
    static assert( isCharType!(T) );
    foreach( v; toString32(chs) )
        if( !isUpper(v) )
            return false;

    return true;
}


debug(UnitTest) unittest
{
    assert( isDigits("123456"c.dup) );
    assert( isDigits("123456"w.dup) );
    assert( isDigits("123456"d.dup) );
    assert( !isDigits("12345a"c.dup) );
    assert( !isDigits("12345a"w.dup) );
    assert( !isDigits("12345a"d.dup) );

    assert( isLetters("abcDE"c.dup) );
    assert( isLetters("abcDE"w.dup) );
    assert( isLetters("abcDE"d.dup) );
    assert( !isLetters("ab3DE"c.dup) );
    assert( !isLetters("ab3DE"w.dup) );
    assert( !isLetters("ab3DE"d.dup) );

    assert( isAlnums("123abc"c.dup) );
    assert( isAlnums("123abc"w.dup) );
    assert( isAlnums("123abc"d.dup) );
    assert( !isAlnums("12,ab"c.dup) );
    assert( !isAlnums("12,ab"w.dup) );
    assert( !isAlnums("12,ab"d.dup) );

    assert( isLowers("abcdefghijklmnopqrstuvwxyz"c.dup) );
    assert( isLowers("abcdefghijklmnopqrstuvwxyz"w.dup) );
    assert( isLowers("abcdefghijklmnopqrstuvwxyz"d.dup) );
    assert( !isLowers("Abcdefghijklmnopqrstuvwxyz"c.dup) );
    assert( !isLowers("Abcdefghijklmnopqrstuvwxyz"w.dup) );
    assert( !isLowers("Abcdefghijklmnopqrstuvwxyz"d.dup) );

    assert( isUppers("ABCDEFGHIJKLMNOPQRSTUVWXYZ"c.dup) );
    assert( isUppers("ABCDEFGHIJKLMNOPQRSTUVWXYZ"w.dup) );
    assert( isUppers("ABCDEFGHIJKLMNOPQRSTUVWXYZ"d.dup) );
    assert( !isUppers("aBCDEFGHIJKLMNOPQRSTUVWXYZ"c.dup) );
    assert( !isUppers("aBCDEFGHIJKLMNOPQRSTUVWXYZ"w.dup) );
    assert( !isUppers("aBCDEFGHIJKLMNOPQRSTUVWXYZ"d.dup) );


}



T toLower(T)(T str)
{
    static if ( isStringType!(T) )
    {
        return tango.text.Unicode.toLower(str);
    }
    else static if( isCharType!(T) )
    {
        return ( toLower!(T[])(cast(T[])"" ~ str) )[0];
    }
    else static assert
        (false,  "The type of '" ~ typeof(T).stringof ~
            " must be char type or String type." );
}
//
debug unittest
{
    assert( toLower('A') == 'a' );
    assert( toLower("A".dup) == "a" );
    assert(isDigits("1234"));
    assert(isDigits("1"));
    assert(!isDigits("abc"));
}


version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
