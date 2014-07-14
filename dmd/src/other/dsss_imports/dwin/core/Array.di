// Written in the D programming language.

/*******************************************************************************

        Copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: Mar 2008

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/



/*****************************************************************************************
 *  Utility template functions for arrays.
 *
 *
 *
 */
module dwin.core.Array ;



private import  tango.core.Array;
private import  tango.core.Traits;
                //tango.math.Kiss,
private import  tango.core.Vararg;

private import tango.stdc.string : memmove ;
private import tango.text.Util : substitute;

private import dwin.core.Ctfe : IsLessEqual, IsMoreEqual, IsMore;


version (ArrayVerbose)
    private import tango.util.log.Trace;



////////////////////////////////////////////////////////////////////////////////
// Find nth element
////////////////////////////////////////////////////////////////////////////////

/**
 * Performs a linear scan of buf from $(LB)0 .. buf.length$(RP), returning
 * the index of the first element matching pat, or buf.length if no match
 * was found.  Comparisons will be performed using the supplied predicate
 * or '==' if none is supplied.
 *
 * Params:
 *  buf  = The array to search.
 *  pat  = The pattern to search for.
 *  pred = The evaluation predicate, which should return true if e1 is
 *         equal to e2 and false if not.  This predicate may be any
 *         callable type.
 *  nth = nth found element
 *
 * Returns:
 *  The index of the nth match or buf.length if no match was found.
 */

 //modified from tango.core.Array.find
template findNth_( Elem, Pred = IsEqual!(Elem) )
{
    static assert( isCallableType!(Pred) );


    size_t fn( Elem[] buf, Elem pat, size_t nth = 1U, Pred pred = Pred.init )
    {
        if( nth < 1U ) return buf.length;

        size_t count;
        foreach( size_t pos, Elem cur; buf )
        {
            if( pred( cur, pat ) )
            {
                if( ++count == nth  )
                    return pos;
            }
        }
        return buf.length;
    }


    size_t fn( Elem[] buf, Elem[] pat, size_t nth = 1U, Pred pred = Pred.init )
    {
        if( buf.length == 0 ||
            pat.length == 0 ||
            buf.length < pat.length ||
            nth < 1U )
        {
            return buf.length;
        }
        size_t end = buf.length - pat.length + 1;
        size_t count;
        for( size_t pos = 0; pos < end; ++pos )
        {
            if( pred( buf[pos], pat[0] ) )
            {
                size_t mat = 0;
                do
                {
                    if( ++mat >= pat.length )
                    {
                        if( ++count == nth )
                            return  pos - pat.length + 1;
                        break;
                    }
                    if( ++pos >= buf.length )
                        return buf.length;
                } while( pred( buf[pos], pat[mat] ) );
            }
        }
        return buf.length;
    }
}


template findNth( Buf, Pat )
{
    size_t findNth( Buf buf, Pat pat, size_t nth = 1U )
    {
        return findNth_!(ElemTypeOf!(Buf)).fn( buf, pat, nth );
    }
}


template findNth( Buf, Pat, Pred )
{
    size_t findNth( Buf buf, Pat pat, size_t nth, Pred pred)
    {
        return findNth_!(ElemTypeOf!(Buf), Pred).fn( buf, pat, nth, pred );
    }
}
//
debug( UnitTest )
{
    unittest
    {

        int[] foo = [1, 2, 3, 2, 4, 2];
        assert( findNth(foo, 5) == 6U );        //not found
        assert( findNth(foo, 2) == 1U );        //first 2, index is 1
        assert( findNth(foo, 2, 2U) == 3U );
        assert( findNth(foo, 2, 3U) == 5U );
        assert( findNth(foo, 5, 2U) == 6U );    //not found

        char[] bar = "abcabc";
        assert( findNth(bar, "a") == 0U );
        assert( findNth(bar, 'a') == 0U );
        assert( findNth(bar, 'a', 2U) == 3U );
        assert( findNth(bar, "a", 2U) == 3U );

        assert( findNth(bar, "a", 3U) == 6U );  //not found
        assert( findNth(bar, "d") == 6U );      //not found
        assert( findNth(bar, 'd') == 6U );      //not found
        assert( findNth(bar, 'd', 2U) == 6U );      //not found
        assert( findNth(bar, "d", 2U) == 6U );      //not found

    }
}
//


////////////////////////////////////////////////////////////////////////////////
// Reverse Find nth element
////////////////////////////////////////////////////////////////////////////////

/**
 * Performs a linear scan of buf from $(LP)buf.length .. 0$(RB), returning
 * the index of the first element matching pat, or buf.length if no match
 * was found.  Comparisons will be performed using the supplied predicate
 * or '==' if none is supplied.
 *
 * Params:
 *  buf  = The array to search.
 *  pat  = The pattern to search for.
 *  pred = The evaluation predicate, which should return true if e1 is
 *         equal to e2 and false if not.  This predicate may be any
 *         callable type.
 *  nth = nth element;
 *
 * Returns:
 *  The index of the nth match or buf.length if no match was found.
 */

 //modified from tango.core.Array.find
template rfindNth_( Elem, Pred = IsEqual!(Elem) )
{
    static assert( isCallableType!(Pred) );


    size_t fn( Elem[] buf, Elem pat, size_t nth = 1, Pred pred = Pred.init )
    {
        if( buf.length == 0 || nth < 1U )
            return buf.length;

        auto pos = buf.length;
        size_t count;
        do
        {
            if( pred( buf[--pos], pat ) )
               if( ++count == nth )
                    return pos;
        } while( pos > 0 );
        return buf.length;
    }


    size_t fn( Elem[] buf, Elem[] pat, size_t nth = 1, Pred pred = Pred.init )
    {
        if( buf.length == 0 ||
            pat.length == 0 ||
            buf.length < pat.length ||
            nth < 1U )
        {
            return buf.length;
        }

        size_t pos = buf.length - pat.length + 1;
        size_t count;
        do
        {
            if( pred( buf[--pos], pat[0] ) )
            {
                size_t mat = 0;

                do
                {
                    if( ++mat >= pat.length )
                    {
                        if( ++count == nth )
                            return pos - pat.length + 1;
                        break;
                    }
                    if( ++pos >= buf.length )
                        return buf.length;
                } while( pred( buf[pos], pat[mat] ) );
                pos -= mat;
            }
        } while( pos > 0 );
        return buf.length;
    }
}


template rfindNth( Buf, Pat )
{
    size_t rfindNth( Buf buf, Pat pat, size_t nth = 1)
    {
        return rfindNth_!(ElemTypeOf!(Buf)).fn( buf, pat, nth );
    }
}


template rfindNth( Buf, Pat, Pred )
{
    size_t rfindNth( Buf buf, Pat pat, size_t nth, Pred pred )
    {
        return rfindNth_!(ElemTypeOf!(Buf), Pred).fn( buf, pat, nth, pred );
    }
}


debug( UnitTest )
{
    unittest
    {
        char[] s = "abcabcabc";
        assert( rfindNth(s, "abc") == 6U);
        assert( rfindNth(s, "abc", 2U) == 3U);

        assert( rfindNth(s, "abc", 3U) == 0U);

        assert( rfindNth(s, 'a') == 6U);
        assert( rfindNth(s, 'a', 2U) == 3U);
        assert( rfindNth(s, 'a', 3U) == 0U);

        assert( rfindNth(s, 'd') == 9U);    //not found
        assert( rfindNth(s, "d") == 9U);    //not found

    }
}
//


////////////////////////////////////////////////////////////////////////////////
// Replace nth element
////////////////////////////////////////////////////////////////////////////////

template replaceNth( Buf, Elem )
{
    Buf replaceNth( Buf buf, Elem pat, Elem val, size_t nth =1 )
    {
        size_t where = findNth(buf, pat, nth);
        if( where == buf.length )
            return buf;
        return buf[0..where] ~ val ~ buf[where + pat.length .. $];
    }
}


template replaceNth( Buf, Elem, Pred )
{
    static assert( isCallableType!(Pred) );

    Buf replaceNth( Buf buf, Elem pat, Elem val, size_t nth, Pred pred )
    {
        size_t where = findNth(buf, pat, nth, pred);
        if( where == buf.length )
            return buf;
        return buf[0..where] ~ val ~ buf[where + pat.length .. $];
    }
}

debug( UintTest )
{
    unittest
    {
        char[] s = "ababab";
        auto r = replaceNth(s, "ab", "AB", 1U);
        assert ( r == "ABabab" );
        r = replaceNth(s, "ab", "AB", 2U);
        assert ( r == "abABab" );
        r = replaceNth(s, "ab", "AB", 3U);
        assert ( r == "ababAB" );

        // not found
        r = replaceNth(s, "ac", "AB");
        assert ( r == "ababab" );
        r = replaceNth(s, "ac", "AB", 2U);
        assert ( r == "ababab" );

        //r = replaceNth(s, 'a', 'A', 1U);
        //assert ( r == "Ababab" );
        //r = replaceNth(s, 'c', 'C', 2U);
        //assert ( r == "ababab" );

    }
}
//


////////////////////////////////////////////////////////////////////////////////
// Reverse Replace nth element
////////////////////////////////////////////////////////////////////////////////

template rreplaceNth( Buf, Elem )
{
    Buf rreplaceNth( Buf buf, Elem pat, Elem val, size_t nth =1 )
    {
        size_t where = rfindNth(buf, pat, nth);
        if( where == buf.length )
            return buf;
        return buf[0..where] ~ val ~ buf[where + pat.length .. $];
    }
}


template rreplaceNth( Buf, Elem, Pred )
{
    static assert( isCallableType!(Pred) );

    Buf rreplaceNth( Buf buf, Elem pat, Elem val, size_t nth, Pred pred )
    {
        size_t where = rfindNth(buf, pat, nth, pred);
        if( where == buf.length )
            return buf;
        return buf[0..where] ~ val ~ buf[where + pat.length .. $];
    }
}

debug( UintTest )
{
    unittest
    {
        char[] s = "ababab";
        auto r = rreplaceNth(s, "ab", "AB", 1U);
        assert ( r == "ababAB" );
        r = rreplaceNth(s, "ab", "AB", 2U);
        assert ( r == "abABab" );
        r = rreplaceNth(s, "ab", "AB", 3U);
        assert ( r == "ABabab" );

        // not found
        r = rreplaceNth(s, "ac", "AB");
        assert ( r == "ababab" );
        r = rreplaceNth(s, "ac", "AB", 2U);
        assert ( r == "ababab" );

        r = rreplaceNth(s, 'a', 'A', 1U);
        assert ( r == "ababAb" );
        r = rreplaceNth(s, "c", "C", 2U);
        assert ( r == "ababab" );
    }
}
//


////////////////////////////////////////////////////////////////////////////////
// Replace Series
////////////////////////////////////////////////////////////////////////////////


char[] replaceSeries(char[] buf, ... )
{
    alias char[] t;
    for(size_t i= 0; i < _arguments.length -1; i += 2 )
    {
        if( typeid(t) == _arguments[i] && typeid(t) == _arguments[i+1] )
        {
            buf = tango.text.Util.substitute( buf, va_arg!(t)(_argptr), va_arg!(t)(_argptr) );
        }
    }
    return buf;
}

debug( UnitTest )
{
    unittest
    {
        char[] s = "abcabc";
        auto r = replaceSeries(s, "a", "A", "b", "B");
        assert( r == "ABcABc" );
        r = replaceSeries(s, "ab", "AB");
        assert ( r == "ABcABc" );
    }
}
//


////////////////////////////////////////////////////////////////////////////////
// Remove by index
////////////////////////////////////////////////////////////////////////////////

/**
 * Performs a linear scan of buf from $(LB)0 .. buf.length$(RB), moving all
 * elements matching index  to the end of the sequence.  The relative order of
 * elements not matching index will be preserved.
 * Params:
 *  buf  = The array to scan.  This parameter is not marked 'inout'
 *         to allow temporary slices to be modified.  As buf is not resized
 *         in any way, omitting the 'inout' qualifier has no effect on the
 *         result of this operation, even though it may be viewed as a
 *         side-effect.
 *  inx  = The pattern index to match against.
 *
 * Returns:xxx
*  The result array.
 */

template removeByIndex( Buf )
{
    static assert( isStaticArrayType!(Buf) || isDynamicArrayType!(Buf) );
    Buf removeByIndex(ref Buf buf, size_t inx)
    {
        alias ElemTypeOf!(Buf) Elem;

        if( !buf.length || inx >= buf.length )
            return buf;

        if (inx != buf.length - 1)
        {
            memmove(&(buf[inx]), &(buf[inx + 1]), Elem.sizeof * (buf.length - inx - 1));
        }

        buf.length = buf.length - 1;
        return buf;
    }
}
debug( UnitTest )
{
	unittest
	{
        int[] foo = [0, 1, 2, 3, 4, 5];
        foo.removeByIndex(3_U);
        assert(foo == [0, 1, 2, 4, 5]);
        //auto count = foo.removeByIndexIf( ( int i ) { return i % 2 == 0; } );
        //assert (count == 2U);
        //assert ( foo[0..count] == [1, 4] );
    }
}
//


////////////////////////////////////////////////////////////////////////////////
// Remove by Value Nth
////////////////////////////////////////////////////////////////////////////////

/**
 * Performs a linear scan of buf from $(LB)0 .. buf.length$(RB), moving all
 * elements matching index  to the end of the sequence.  The relative order of
 * elements not matching index will be preserved.
 * Params:
 *  buf  = The array to scan.  This parameter is not marked 'inout'
 *         to allow temporary slices to be modified.  As buf is not resized
 *         in any way, omitting the 'inout' qualifier has no effect on the
 *         result of this operation, even though it may be viewed as a
 *         side-effect.
 *  pat  = The pattern to match against.
 *  nth  = nth match.
 *
 * Returns:
 *  The result array.
 */

template removeNth (Buf, Pat)
{
    Buf removeNth (Buf buf, Pat pat, size_t nth = 1)
    {
        size_t index = findNth(buf, pat, nth);

        if (index != buf.length)
        {
            buf.removeByIndex(index);
        }
        return buf;
    }
}
debug( UnitTest )
{
	unittest
	{

        int[] foo = [1, 2, 3, 2, 3];
        foo = foo.removeNth(2);
        assert(foo == [1, 3, 2, 3]);
        foo = foo.removeNth(3, 2U);
        assert(foo == [1, 3, 2]);

    }
}
//


////////////////////////////////////////////////////////////////////////////////
// ReplacePairs
////////////////////////////////////////////////////////////////////////////////

/***********************************************************************************
 *  Replace elements with new values described by an associative array.  Keys of the
 *  associative array correspond to elements, and values to their replacements.
 */
Elem[] replacePairs (Elem) (ref Elem[] buf, Elem[Elem] pairs)
{
    //cashew.utils.Array
  Elem* peer ;

  foreach (ref needle; buf) {
    peer = needle in pairs;
    if (peer !is null) {
      needle = *peer;
    }
  }
  return buf;
}
debug( UnitTest )
{
	unittest
	{
        int[] foo = [1, 2, 3, 1, 2, 3, 1, 2, 3];
        auto pairs = assoc!(int, int)(
            [1, 2, 3] ,
            [4, 5, 6]
        );
        foo.replacePairs(pairs);
        assert(foo == [4, 5, 6, 4, 5, 6, 4, 5, 6]);
    }
}
//


////////////////////////////////////////////////////////////////////////////////
// apply
////////////////////////////////////////////////////////////////////////////////

/***********************************************************************************
 *  Update/modify all elements of an array.
 */
template apply (Elem, Pred)
{
    static assert( isCallableType!(Pred) );

    Elem[] apply (ref Elem[] buf, Pred pred)
    {
        foreach (ref cur; buf)
            pred(cur);
      return buf;
    }
}
debug( UnitTest )
{
	unittest
	{
        int[] foo = [1, 3, 5, 7];
        foo.apply((ref int n) { n++; });
        assert(foo == [2, 4, 6, 8]);
    }
}
//


////////////////////////////////////////////////////////////////////////////////
// build an Assoicate Array
////////////////////////////////////////////////////////////////////////////////

/***********************************************************************************
 *  Build an associative array from two standard arrays, the first as keys and the second
 *  as values.
 */
ElemV[ElemK] assoc (ElemK, ElemV) (ElemK[] keys, ElemV[] values)
{
    //cashew.utils.Array
    if( keys.length > values.length)
        keys.length = values.length;
    ElemV[ElemK] result ;

    foreach (i, x; keys)
    {
        result[x] = values[i];
    }
    return result;
}

debug( UnitTest )
{
    unittest
    {
        auto foo = assoc!(int, char)(
        [           65 , 66 , 67 , 68 , 69 ] ,
        [cast(char) 'A', 'B', 'C', 'D', 'E']
        );
        assert(foo.keys   == [           65 , 66 , 67 , 68 , 69 ]);
        assert(foo.values == [cast(char) 'A', 'B', 'C', 'D', 'E']);
        assert(foo[65]    == 'A'                                 );
    }
}
//

////////////////////////////////////////////////////////////////////////////////
// maximum value
////////////////////////////////////////////////////////////////////////////////

/// Return the maximum value of an array.
T max(T)(T[] array)
{
    /*
    T m = array[0];
	foreach (T a; array)
		if (a>m)
			m=a;
	return m;
    */
    makeHeap(array);
    return array[0];
}
debug( UnitTest )
{
    unittest
    {
        int[] a = [4, 5, 7, 1, 6];
        assert( max(a) == 7 );
    }
}
//

K[] maxVal(K=char, V=int)(V[K[]] array)
{
    static assert( isIntegerType!(V), "array value type must been integer type" );

    if(!array.length)
        return null;


    K[] result ;
    long i = -(long.max);
	foreach (k, v; array)
    {
		if (v > i)
        {
            i = v;
			result = k;
        }
    }

	return result;
}

debug(UnitTest) unittest
{
    int[char[]] array =["Sun" : 1,
                        "Mon" : 2,
                        "Tue" : 3,
                        "Wed" : 4,
                        "Thu" : 5,
                        "Fri" : 6,
                        "Sat" : 7
                        ];
    assert(maxVal(array) == "Sat"c.dup);
}

////////////////////////////////////////////////////////////////////////////////
// minimum value
////////////////////////////////////////////////////////////////////////////////

/// Return the minimum value of an array.
T min(T)(T[] array)
{
    //yage.core.array;
    T m = array[0];
	foreach (T a; array)
		if (a<m)
			m=a;
	return m;
}
//


////////////////////////////////////////////////////////////////////////////////
// Is Ordered
////////////////////////////////////////////////////////////////////////////////

/**
 * Is the array ordered?
 */
template isOrdered_( T, Pred = IsMoreEqual!(T) )
{
    static assert( isCallableType!(Pred) );

    bool fn (T[] array, Pred pred = Pred.init )
    {
        if (array.length <= 1)
            return true;

        for (int i=0; i<array.length-1; i++)
            if( !pred(array[i+1], array[i]) )
                    return false;
        return true;
    }
}

template isOrdered( T )
{
    bool isOrdered (T[] array )
    {
        return isOrdered_!(T).fn(array);
    }
}
template isOrdered( T, Pred )
{
    bool isOrdered (T[] array, Pred pred )
    {
        return isOrdered_!(T, Pred).fn(array, pred);
    }
}
debug( UnitTest )
{
    unittest
    {
        assert( isOrdered( [-1, 0, 1, 2, 2, 5] ) == true);
        assert(isOrdered( [-1, 0, 1, 2, 1, 5] ) == false);
        assert(isOrdered( [5, 3, 3, 3, 2, -1] , (IsLessEqual!(int)).init) == true);
    }
}

////////////////////////////////////////////////////////////////////////////////
// RandomValue
////////////////////////////////////////////////////////////////////////////////
// see tango.core.Array.shuffle
/*
    Examples:
    ---
        randomValue(["a","b","c"]);
    ---
*/
/*
T randomValue(T)(T[] arr)
{
    return arr[ Kiss().next(0, arr.length) ];
}
*/

////////////////////////////////////////////////////////////////////////////////
// push
////////////////////////////////////////////////////////////////////////////////
/***********************************************************************************
 * Stack-like behavior, with the end of the array as the "top".
 */
int push (Elem) (ref Elem[] buf, Elem[] bale ...)
{
    //cashew.utils.Array
    buf ~= bale;
    return buf.length;
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


version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
