
// Written in the D programming language.

/*******************************************************************************
        
        copyright:      Copyright (c) 2007  (yidabu  g m a i l at com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: 2007

        author:         yidabu ( D programming language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module ydb.Math;

private import  tango.text.convert.Integer,
                tango.text.Util,
                tango.text.Unicode;

private import  tango.util.Convert;
    
private import  tango.math.Math;

private import  tango.core.Exception;


/+

// old code of Phobos

 ' Module  : hexconv.d
 ' Author  : David L. 'SpottedTiger' Davis
 ' Tested  : dmd v2.002 (WinXP OS/ Intel CPU)
 ' Licence : Public Domain / Contributed to Digital Mars
 ' =====================================================
  ' To complie for a unittest:
 ' dmd hexconv.d -debug=hexconv -unittest
 '
 ' To compile a D program that uses hexconv.d:
 ' dmd MySource.d hexconv.d
    from:   http://www.digitalmars.com/d/archives/digitalmars/D/learn/read_Hexadecimal_value_from_string_8632.html
    example:
    auto i = xtoul("C");

    writefln("i=%d, xtoul(\"C\")=%d, ultox(i)=\"%s\"", i, xtoul("C"),ultox(i));	
 +/
 
/+
// Function : xtoul() - Hex string to an unsigned decimal whole number 
// Author   : David 'SpottedTiger' L. Davis
// Created  : 03.May.05
// CPU      : Intel x86 (Numercials stored as "Low byte to High byte")
// Last Test: dmd v2.002
// ----------------------------------------
// Converts a Hex string from 0x0 to 0xFFFFFFFFFFFFFF
// into a ulong value 0 to 18,446,744,073,709,551,615
// also it handles the lowercase 'a' thru 'f'.
ulong xtoul(string sx)
{
    ulong  ul = 0L;
    int    j = 7;
    char   c, c1, c2;
    char[] st  = cast(char[])sx;
    auto    len = st.length;
    
    const char[] zeros = "0000000000000000"c;
    union u { ulong ul; char[8] c; }
    
    u U;
    
    if (len == 0 || len > 16)
        throw new Exception( "xtoul() the string parameter is either an empty
string,"c ~
                             " or its length is greater than 16 characters."c );
     
    // isHex()                         
    for (int i = 0; i < st.length; i++)                             
    {
        //c = ( sx[i] > 'F' ? sx[i] - 32 : sx[i] );
        c = st[i];

        if ((c >= '0' && c <= '9') || 
            (c >= 'A' && c <= 'F') ||
            (c >= 'a' && c <= 'f'))
           continue;
        else     
          throw new Exception("xtoul() invalid hex character used."c);   
    }
          
    if (len < 16)
        st = zeros[0..16 - len] ~ st;
    
    j = 7;
    for (int i = 0; i < 16; i += 2)
    {
        c1 = (st[i] > 'F' ? st[i] - 32 : st[i]); 
        c2 = (st[i + 1] > 'F' ? st[i + 1] - 32 : st[i + 1]);
        c1 = cast(int)(c1 > 52 ? c1 - 55 : c1 - 48) << 4;
        U.c[j--] = c1 + cast(int)(c2 > 52 ? c2 - 55 : c2 - 48);
    }

    return U.ul;
} 

unittest
{
    debug( hexconv ) writefln( "hexconv.xtoul( string ).unittest"c );
    ulong ul;

    ul = xtoul("0"c); 
    assert( ul == 0x0 );
    ul = xtoul("FF"c); 
    assert( ul == 0xFF );
    ul = xtoul("eea"c); 
    assert( ul == 0xEEA );
    ul = xtoul("AB"c);
    assert( ul == 0xAB );
    ul = xtoul("ABCD"c);
    assert( ul == 0xABCD );
    ul = xtoul("A12CD00"c);
    assert( ul == 0xA12CD00 );
    ul = xtoul("FFFFFFFFFFFFFFFF"c); 
    assert( ul == 0xFFFFFFFFFFFFFFFF );
}

// Function : ultox() - Decimal unsigned whole number to Hex string
// Author   : David 'SpottedTiger' L. Davis
// Created  : 04.May.05
// CPU      : Intel x86 (Numercials stored as "Low byte to High byte")
// Last Test: dmd v2.002
// -----------------------------------------
// Accepts any positive number from 0 to 18,446,744,073,709,551,615
// and the returns an even number of hex strings up to 16 characters
// (from 0x0 to 0xFFFFFFFFFFFFFF).
string ultox(in ulong ul)
{
    char[16] sx;
    char     c1, c2;
    union    u { ulong ul; char[8] c; }
    int      i = 0, j = 0, k = 0;
    bit      z = true;
    u U;

    U.ul = ul;
    
    for (i = 7; i >= 0; i--)
    {
        c1 = U.c[i] >> 4;
        c1 = cast(char)(c1 > 9 ? c1 + 55 : c1 + 48);
        c2 = U.c[i] & 0x0F;
        c2 = cast(char)(c2 > 9 ? c2 + 55 : c2 + 48);
        
        if (z && c1 == '0' && c2 == '0')
            continue;

        z = false;
        sx[j++] = c1;
        sx[j++] = c2;
    }
    
    if (j > 0)
        //Copying a fixed array into a dynamic array, must COW.
        return sx[0..j].dup;
    else
        return "00"c;    
}

unittest
{
    debug( hexconv ) writefln( "hexconv.ultox( in ulong ).unittest"c );
    string sx;

    sx = ultox(0); //0x0
    assert( sx == "00"c );

    sx = ultox(255); //0xFF
    assert( sx == "FF"c );
    sx = ultox(171); //0xAB
    assert( sx == "AB"c );
    sx = ultox(43981); //0xABCD
    assert( sx == "ABCD"c );
    sx = ultox(169004288); //0xA12CD00
    assert( sx == "0A12CD00"c );
    sx = ultox(0xA12CD00); //169004288
    assert( sx == "0A12CD00"c );
   
    sx = ultox(ulong.max); //0xFFFFFFFFFFFFFFFF
    assert( sx == "FFFFFFFFFFFFFFFF"c );
}

bool isHex(string sx)   
{          
    char c;
                
    for (int i = 0; i < sx.length; i++)                             
    {
        c = sx[i];
        
        if ((c >= '0' && c <= '9') || 
            (c >= 'A' && c <= 'F') ||
            (c >= 'a' && c <= 'f'))
            continue;
        else     
            return false;   
    }
    
    return true;
}

unittest
{
    debug( hexconv ) writefln( "hexconv.isHex( string ).unittest"c );
    
    assert( isHex("00"c) );
    assert( isHex("FF"c) );
    assert( isHex("Ffae0"c) );
    assert( isHex("AB"c) );
    assert( isHex("abdef"c) );
    assert( isHex("ABCD"c) );
    assert( isHex("0A12CD00"c) );
    assert( isHex("FFFFFFFFFFFFFFFF"c) );
    
    assert( isHex("00ER"c) == false );
    assert( !isHex("0xW"c) );
}
//

+/

/*

    ["0" :"z",  "1" :"a", "2" :"b", "3" :"c", "4" :"d", "5" :"e", "6" :"f", "7" :"g",
     "8" :"h",  "9" :"i", "10":"j", "11":"k", "12":"l", "13":"m", "14":"n", "15":"o",
     "16":"p",  "17":"q", "18":"r", "19":"s", "20":"t", "21":"u", "22":"v",
     "23":"w",  "24":"x", "25":"y"];
     
*/

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
