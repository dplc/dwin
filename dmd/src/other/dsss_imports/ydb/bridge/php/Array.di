
// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: Feb 2008

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module ydb.bridge.php.Array;


private import  dwin.text.pcre.RegExp,
                dwin.text.Util,
                dwin.core.Array,
                dwin.io.Digest;
    
private import  tango.text.Unicode,
                tango.util.Convert;

private import  tango.util.log.Trace;

private import  Integer = tango.text.convert.Integer;
private import  Util = tango.text.Util;
    

T[] array_slice (T)( T[] array , int offset, int len = int.max)
{
    if(len == int.max)
        len = array.length;
    
    if(offset > -1)
    {
        if( offset + len >= array.length )
            return array[offset .. $];
        
        else if( len > 0 )
            return array[offset .. offset + len];
        
        else if( len < 0 && array.length + len > offset )
            return array[offset .. ($ + len) ];
        
    }
    else if(offset < 0 && array.length + offset > 0)
    {
        if(len > 0 )
            return array[$+offset .. ($+offset + len) % ($+1) ];
    }
    else
        return array;
    return array;
}
debug unittest
{
    auto input = ["a".dup, "b", "c", "d", "e"];

    auto output = array_slice(input, 2);      // returns "c", "d", and "e"
    assert( output == ["c".dup, "d", "e"] );
    
    output = array_slice(input, -2, 1);  // returns "d"
    assert( output == ["d".dup] );
    
    output = array_slice(input, 0, 3);   // returns "a", "b", and "c"
    assert( output == ["a".dup, "b", "c"] );

    // note the differences in the array keys
    output = array_slice(input, 2, -1);
    assert( output == ["c".dup, "d"] );
    
    //array_slice($input, 2, -1, true));
    
}
//

/***********************************************************************************
 * Stack-like behavior, with the end of the array as the "top".
 */
int array_push (Elem) (ref Elem[] buf, Elem[] bale ...)
{
    return push(buf, bale);
}
debug( UnitTest )
{
	unittest
	{
  
        int[] foo = [1, 2, 3];
        foo.push(4, 5);
        assert(foo == [1, 2, 3, 4, 5]);
  
    }
}
//

/**

    Searches haystack for needle and returns TRUE if it is found in the array, FALSE otherwise. 
    If the third parameter strict is set to TRUE then the in_array() function will also check the types of the needle in the haystack. 

    note: diffrent type of array element is not allowed in D
    todo: strict param is not implemented
*/

bool in_array (T) ( T needle, T[] haystack , bool strict = false )
{
    return (needle in haystack) !is null;
}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
