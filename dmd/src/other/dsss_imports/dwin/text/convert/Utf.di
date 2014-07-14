
// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: Nov 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/




module dwin.text.convert.Utf;

private import tango.text.convert.Utf : toUTF8 = toString, toUTF16 = toString16, toUTF32 = toString32;
private import tango.stdc.stringz;

//alias fromUtf8z fromStringz;
//alias fromUtf16z fromString16z;

char[] toString(wchar[] input)
{
    return toUTF8(input);
}
char[] toString(dchar[] input)
{
    return toUTF8(input);
}

char[] toString(char[] input)
{
    return input;
}
//

char[] toString(char* input)
{
    return fromStringz(input);
}

char[] toString(wchar* input)
{
    return toString( fromString16z(input) );
}

char[] toString(wchar* s, int start , int count) 
{
  if (s is null)
    return null;
  if (count == -1)
    count = strlenz(s);
  return toString( s[start .. count] );
}
//
//

wchar[] toString16(char[] input)
{
    return toUTF16( input );
}

wchar[] toString16(dchar[] input)
{
    return toUTF16( input );
}
wchar[] toString16(wchar[] input)
{
    return input;
}
//

wchar[] toString16(wchar* input)
{
    return fromString16z(input);
}

wchar[] toString16(char* input)
{
    return toString16( fromStringz(input) );
}
//


dchar[] toString32(char[] input)
{
    return toUTF32( input );
}

dchar[] toString32(dchar[] input)
{
    return input;
}
dchar[] toString32(wchar[] input)
{
    return toUTF32(input);
}
//





version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
