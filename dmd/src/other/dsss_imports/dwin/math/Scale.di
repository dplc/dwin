
// Written in the D programming language.

/*******************************************************************************
        
        copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: Nov 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module dwin.math.Scale;




private import  tango.util.Convert,
                tango.text.Util,
                tango.math.Math,
                tango.core.Traits;
    
private import tango.core.Exception: IllegalArgumentException;
    
private import dwin.text.Util: insert;

version(mathVerbose) private import tango.util.log.Trace;



/**
    arbitrary Scale translate
    Examples:
    ---
        char[] num = "2 7";
        Cout( scale(num, 10, 26) ).newline ;    //"1 1"
    ---
*/

char[] Scale(T)(T num , int from, int des, char[] sep = " ")
{
    char[]   snum;      //string format number
    
    static if( isIntegerType!(T) )
        snum = to!(char[])(num) ;
    else static if( is(T == char[]) )
        snum = num;
    else static assert(false, "The type of " ~ typeof(T).stringof ~ " not accept");

    if( from == 10 && !containsPattern(snum, sep) )
        snum = dwin.text.Util.insert( snum, sep, 1 );
    
    foreach( str;   snum.delimit(sep) ) 
        if ( to!(int)(str) > from - 1 ) 
            throw new IllegalArgumentException("wrong input number " ~ str ~ " in " ~ snum) ;
        
    char[] result = Scale_imp(snum, from, des, sep);
    //if(des == 10)
    //    result = substitute(result, sep, "");
    
    return result;
}


char[] Scale_imp(char[] snum , int from, int des, char[] sep = " ")
{
        
    char[] quotient = "";
    int residue; 
    div(snum, from, des, quotient, residue, sep);
    if (quotient.length) 
        return Scale_imp(quotient.dup, from, des, sep) ~ sep ~ to!(char[])( residue );
    else 
        return to!(char[])( residue );
}
debug( UnitTest ) unittest
{
    //from = 10, three format
    assert( Scale("2 7".dup, 10, 26) == "1 1" );
    assert( Scale("27".dup, 10, 26) == "1 1" );
    assert( Scale(27, 10, 26) == "1 1" );
    
    assert( Scale("1 1".dup, 26, 10) == "2 7" );
    assert( Scale("9".dup, 26, 10) == "9" );
    assert( Scale(9, 26, 10) == "9" );
    assert( Scale(9, 10, 26) == "9" );
}



private void div(char[] num, int from, int des, ref char[] quotient, ref int residue, char[] sep) 
{
    int d; 
    
    if ( containsPattern(num, sep) )
    {        
        d = to!(int)( num[0 .. locatePattern(num, sep)] ) + residue * from ;
        num = num[locatePattern(num, sep) + 1 .. $];
    }
    else 
    {
        d = to!(int)(num) + residue * from;
        num = "";
    } 
    
    if ( trunc(d / des) is 0 && quotient == "" ) {}
    else 
        quotient ~= sep ~ to!(char[])( trunc(d / des) );
    
    residue = d % des;
    quotient = tango.text.Util.trim(quotient); 
    if (num.length)
        div(num, from, des, quotient, residue, sep);
}

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
