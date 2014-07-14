/**
 * these function maybe move to dwin.core.Array
 */

module dwin.lab.Array;

version(LAB):

private import tango.core.Array;
private import tango.core.Traits;
private import dwin.core.Traits;
private import dwin.core.Array;



//by Downs, same as tango.text.Util.repeat
T[] times(T, U)(T[] source, U _count) {
  static assert(is(U: size_t));
  size_t count=_count;
  auto res=new T[source.length*count];
  while (count--) res[count*source.length..(count+1)*source.length]=source;
  return res;
}
debug( UnitTest )
{
    unittest
    {
        assert( times("ab", 3U) == "ababab" );

    }
}
//

////////////////////////////////////////////////////////////////////////////////
// Remove by index If
////////////////////////////////////////////////////////////////////////////////

/**
 * Performs a linear scan of buf from $(LB)0 .. buf.length$(RB), moving all
 * elements matching index  to the end of the sequence.  The relative order of
 * elements not matching index will be preserved.  Comparisons will be
 * performed using the supplied predicate or '==' if none is supplied.
 *
 * Params:
 *  buf  = The array to scan.  This parameter is not marked 'inout'
 *         to allow temporary slices to be modified.  As buf is not resized
 *         in any way, omitting the 'inout' qualifier has no effect on the
 *         result of this operation, even though it may be viewed as a
 *         side-effect.
 *  pred = The evaluation predicate,  This predicate may be any
 *         callable type.
 *
 * Returns:
 *  The number of elements that do not satisfy pred.
 */


template removeByIndexIf_( Elem, Pred )
{
    static assert( isCallableType!(Pred) );

    size_t fn( Elem[] buf, Pred pred )
    {
        // NOTE: Indexes are passed instead of references because DMD does
        //       not inline the reference-based version.
        void exch( size_t p1, size_t p2 )
        {
            Elem t  = buf[p1];
            buf[p1] = buf[p2];
            buf[p2] = t;
        }

        size_t cnt = 0;

        for( size_t pos = 0, len = buf.length; pos < len; pos++ )
        {
            if( pred(pos) )
                ++cnt;
            else
                exch( pos, pos - cnt );
        }
        return buf.length - cnt;
    }

}

/// diitto
template removeByIndexIf( Buf, Pred )
{
    static assert( isCallableType!(Pred) );

    size_t removeByIndexIf( Buf buf, Pred pred )
    {
        return removeByIndexIf_!(ElemTypeOf!(Buf), Pred).fn( buf, pred );
    }
}

debug( UnitTest )
{
	unittest
	{
        int[] foo = [0, 1, 2, 3, 4, 5];
        auto count = foo.removeByIndexIf( ( int i ) { return i % 2 == 0; } );
        assert (count == 3U);
        assert ( foo[0..count] == [1, 3, 5] );
    }
}



////////////////////////////////////////////////////////////////////////////////
// Remove by Value All
////////////////////////////////////////////////////////////////////////////////

/**
 * Performs a linear scan of buf from $(LB)0 .. buf.length$(RP), moving all
 * elements matching pat to the end of the sequence.  The relative order of
 * elements not matching pat will be preserved.  Comparisons will be
 * performed using the supplied predicate or '==' if none is supplied.
 *
 * Params:
 *  buf  = The array to scan.  This parameter is not marked 'inout'
 *         to allow temporary slices to be modified.  As buf is not resized
 *         in any way, omitting the 'inout' qualifier has no effect on the
 *         result of this operation, even though it may be viewed as a
 *         side-effect.
 *  pat  = The pattern to match against.
 *  pred = The evaluation predicate, which should return true if e1 is
 *         equal to e2 and false if not.  This predicate may be any
 *         callable type.
 *
 * Returns:
 *  The number of elements that do not match pat.
 */
template removeByValueAll( Buf, Pat )
{
    size_t removeByValueAll( Buf buf, Pat pat )
    {
        return  .remove(buf, pat);
    }
}

/// ditto
template removeByValueAll( Buf, Pat, Pred )
{
    size_t removeByValueAll( Buf buf, Pat pat, Pred pred )
    {
        return .remove(buf, pat, pred);
    }
}
//


////////////////////////////////////////////////////////////////////////////////
// Remove Slice
////////////////////////////////////////////////////////////////////////////////

/******************************************************************************
 * Remove a slice from an array.
 */
size_t removeSlice (Elem) (ref Elem[] buf, size_t start, size_t wall)
{
    if( start >= buf.length  || wall >  buf.length )
        return buf.length;
    //if (wall != buf.length )
        //memmove(&(buf[start]), &(buf[wall]), Elem.sizeof * (buf.length - wall));
        //buf.length = buf.length - (wall - start);
        buf = buf[0..start] ~ buf[wall..$] ~ buf[start..wall];
    return buf.length - (wall - start);
}
debug( UnitTest )
{
	unittest
    {
        int[] foo =   [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] ;
        foo.removeSlice(3U, 7U);
        assert(foo == [0, 1, 2, 7, 8, 9,  3, 4, 5, 6]);

    }
}
//

////////////////////////////////////////////////////////////////////////////////
// Remove Value If
////////////////////////////////////////////////////////////////////////////////
/**
 * see tango.core.Array.removeIf
 */
template removeByValueIf( Buf, Pred )
{
    static assert( isCallableType!(Pred) );

    size_t removeByValueIf( Buf buf, Pred pred )
    {
        return .removeIf(buf, pred);
    }
}





/***********************************************************************************
 * Return an array composed of common elements of two arrays.
 */
// intersect to intersectionOf by http://www.d-programming-language-china.org/http://www.d-programming-language-china.org/ 20070929
Elem[] intersectionOf ( Elem ) (Elem[] alpha, Elem[] beta, bool sorted = false  )
{
    //cashew.utils.Array
    if(sorted)
        return .intersectionOf(alpha, beta);

  Elem[]    result ;
  size_t apos   ,
         bpos   ;

  alpha .sort ;
  beta  .sort ;

  while (apos < alpha.length && bpos < beta.length) {
    if (alpha[apos] == beta[bpos]) {
      result ~= alpha[apos];
      ++apos;
      ++bpos;
    }
    else {
      if (alpha[apos] < beta[bpos]) {
        ++apos;
      }
      else {
        ++bpos;
      }
    }
  }
  return result;
}
debug( UnitTest )
{
	unittest
	{

        int[] foo = [1, 2, 3, 4, 5      ];
        int[] bar = [      3, 4, 5, 6, 7];
        assert(foo.intersectionOf(bar) == [3, 4, 5]);

    }
}
//



/***********************************************************************************
 *  Split an array into subarrays of a given size.  Trailing elements will be lost.
 */
Elem[][] splitLen (Elem) (Elem[] buf, size_t len, bool all = true)
{
    //cashew.utils.Array
    if( !buf.length )
        return null;
    auto result = new Elem[][ buf.length / len ] ;

    size_t left  = 0_U ;
    size_t right = len ;
    foreach (i, ref x; result)
    {
        x      = buf[left .. right]     ;
        left   = right                  ;
        right += len                    ;
    }
    if(!all) return result;

    size_t resultSize = result.length * len ;

    if (resultSize < buf.length)
    {
        result ~= buf[resultSize .. $];
    }


    return result;
}
debug( UnitTest )
{
	unittest
	{
        int[]   foo = [1, 2, 3, 4, 5, 6, 7];
        int[][] bar = foo.splitLen(2U, false);
        assert(bar == [[1, 2][], [3, 4], [5, 6]]);
        bar = foo.splitLen(2U);
        assert(bar == [[1, 2][], [3, 4], [5, 6], [7]]);
    }
}
//

/***********************************************************************************
 * Fill an array with a given smaller array.
 */
Elem[] fillSub (Elem) (ref Elem[] buf, Elem[] bale, size_t len = 0)
{
    //cashew.utils.Array
    if(!len)
        len = buf.length;
    buf.length = 0;
    while (buf.length < len)
    {
        buf ~= bale;
    }
    buf.length = len;
    return buf;
}
debug( UnitTest )
{
	unittest
	{

        int[] foo = [1, 2, 3, 4, 5];
        int[] sub = [3, 2, 1      ];

        foo.fillSub(sub);
        assert(foo == [3, 2, 1, 3, 2]);

        foo.fillSub(sub, 6U);
        assert(foo == [3, 2, 1, 3, 2, 1]);
    }
}
//

 /***********************************************************************************
 * Stack-like behavior, with the front of the array as the "top".
 */
Elem[] shove (Elem) (ref Elem[] buf, Elem[] bale ...)
{
    //cashew.utils.Array
  buf = bale.reverse ~ buf;
  return buf;
}
debug( UnitTest )
{
	unittest
	{

      int[] foo = [3, 4, 5];
      foo.shove(2, 1);
      assert(foo == [1, 2, 3, 4, 5]);

    }
}
//


/*
 * Fill an array with a given element.
 */
Elem[] fill (Elem) (ref Elem[] buf, Elem needle, size_t len = 0)
{
    //cashew.utils.Array
    if(len)
        buf.length = len;
    buf[] = needle;
    return buf;
}
debug( UnitTest )
{
	unittest
	{

        int[] foo = [1, 2, 3, 4, 5];

        foo.fill(9);
        assert(foo == [9, 9, 9, 9, 9]);

        foo.fill(3, 3U);
        assert(foo == [3, 3, 3]);
    }
}



/***********************************************************************************
 * Rotate an array's contents toward the left.
 */
Elem[] roateL (Elem) (ref Elem[] buf, size_t iter)
{
    //cashew.utils.Array
  iter     %= buf.length                           ;
  buf  = buf[iter .. $] ~ buf[0 .. iter] ;
  return buf;
}
debug( UnitTest )
{
	unittest
	{

        int[] foo = [1, 2, 3, 4, 5, 6];
        foo.roateL(2U);
        assert(foo == [3, 4, 5, 6 ,1, 2]);

        int[] bar = [1, 2, 3];
        bar.roateL(4U);
        assert(bar == [2, 3, 1]);

    }
}

/***********************************************************************************
 * Rotate an array's contents toward the right.
 */
Elem[] roateR (Elem) (ref Elem[] buf, size_t iter)
{
    //cashew.utils.Array
         iter    %= buf.length                         ;
    auto idx      = buf.length - iter                  ;
         buf = buf[idx .. $] ~ buf[0 .. idx] ;
    return buf;
}
debug( UnitTest )
{
	unittest
	{

        int[] foo = [1, 2, 3, 4, 5, 6];
        foo.roateR(2U);
        assert(foo == [5, 6, 1, 2, 3, 4]);

        int[] bar = [1, 2, 3];
        bar.roateR(4U);
        assert(bar == [3, 1, 2]);
    }
}
//



/***********************************************************************************
 * Build an array by repeating an item.
 */
// from repeat to repeatItem 20070928 by http://www.d-programming-language-china.org/
Elem[] repeatItem (Elem) (Elem needle, size_t len)
{
    //cashew.utils.Array
    Elem[] buf = new Elem[len];

    buf[] = needle;
    return buf;
}

debug( UnitTest )
{
    unittest
    {
        assert(repeatItem(3, 3U) == [3, 3, 3]);
    }
}
//

/***********************************************************************************
 *  Concatenation in series, via function call.
 *----------------------------------------------------------------------------------------
 *  int[] foo = ... ;
 *  foo.appendArray([1, 2], [3, 4], [5, 6]);
 *----------------------------------------------------------------------------------------
 */
Elem[] appendArray (Elem) (ref Elem[] buf, Elem[][] bales ...)
{
    //cashew.utils.Array
    foreach (x; bales)
    {
        buf ~= x;
    }
    return buf;
}
debug( UnitTest )
{
	unittest
    {
        int[] foo = [1, 2] ;
        foo.appendArray([3, 4], [5, 6]);
        assert(foo == [1, 2, 3, 4, 5, 6]);
    }
}
//

/**
 * Reserve space inside the array.
 * Params:
 *     array  = The array in which to reserve space.
 *     length = The array will reserve enough space to hold this many total elements. */
void reserve(T)(inout T[] array, int length)
{
    //yage.core.array
    auto old = array.length;
	array.length = length;
	array.length = old;
}


// see tango.core.Array.missingFrom
/*
 * Compose a new array of the values in the first parameter not present in the second.
 */
/*
Elem[] diff (Elem) (Elem[] alpha, Elem[] beta)
{
    Elem[]    result  ;
    size_t last    ;
    size_t current ;

    foreach (i, x; alpha) {
        current = beta.indexOf(x, last);
        if (current == NOT_FOUND) {
            result ~= x;
        }
        else {
            last = current;
        }
    }
    return result;
}
debug( UnitTest )
{
	unittest
	{

        int[] foo = [1, 2, 3, 4, 5   ] ;
        int[] bar = [1,    3,    5, 6] ;
        assert(foo.diff(bar) == [2, 4]);

    }
}
*/

//

// see tango.core.Array.differenceOf
/*
 *  Compose a new array of the bidirectional differences of two arrays.
 */
 /*
Elem[] diff2 (Elem) (Elem[] alpha, Elem[] beta)
body {
    return (alpha.diff(beta) ~ beta.diff(alpha));
}
debug( UnitTest )
{
	unittest
	{

    int[] foo = [1, 2,    4, 5,  ];
    int[] bar = [   2, 3,    5, 6];
    assert(foo.diff2(bar).sort == [1, 3, 4, 6]);

    }
}
*/







//


/*
 *  Run a CallableType on all elements of an array and compose a new array from the delegate's
 *  results.
 */
/*
template collect (Elem, Pred, R = Elem)
{
    static assert( isCallableType!(Pred) );

    R[] collect (Elem[] buf, Pred pred)
    {
        R[] result = new R[buf.length];

        size_t cnt;
        R elem;
        foreach (cur; buf) {
            elem = pred(cur);
            if( elem !is cast(R)null )
            {
                result[cnt] = elem;
                ++cnt;
            }
        }
        result.length = cnt;

        return result;
    }
}
debug ( UnitTest )
{
    unittest
    {
        auto foo = [1, 2, 3, 4];
        auto bar = foo.collect((int x) { return ++x; });
        assert(bar == [2, 3, 4, 5]);
    }
}
*/
//


////////////////////////////////////////////////////////////////////////////////
// some function , no more need
////////////////////////////////////////////////////////////////////////////////

// not reinvent wheel, see tango.text.Util.repeat
/*
 * Build an array by repeating a smaller array.
 */
/*
Elem[] repeatSub (Elem) (Elem[] bale, size_t count)
body {

  Elem[] buf = new Elem[count * bale.length];

  buf.length = 0;
  for (int i; i < count; i++) {
    buf ~= bale;
  }
  return buf;
}
debug( UnitTest )
{
	unittest
	{

  assert(repeatSub([4, 2], 3U) == [4, 2, 4, 2, 4, 2]);

}
}
*/






// see removeByValueIf
/*
 * Select values from an array using a delegate.
 */
/*
Elem[] filter (Elem) (Elem[] buf, bool delegate (Elem) dg)
{
    Elem[] result ;

    foreach (needle; buf)
    {
        if (dg(needle))
        {
            result ~= needle;
        }
    }
    return result;
}
debug( UnitTest )
{
    unittest
    {
        int[] foo = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        auto sub = foo.filter((int x) { return (x % 2) == 0; });
        assert(sub == [2, 4, 6, 8, 10]);
    }
}
*/
//

// see tango.core.Array.contains, not invent wheel, by http://www.d-programming-language-china.org/ 20070928
/*
 * Verify that a given value is present in an array.
 */
/*
bool contains (Elem) (Elem[] buf, Elem needle)
body {
  return buf.indexOf(needle) != NOT_FOUND;
}
debug( UnitTest )
{
	unittest
	{

  int[] foo = [1, 2, 3];
  assert(  foo.contains(2));
  assert(! foo.contains(4));

}
}
*/
//

// see tango.core.Array.find
/*
 * Lookup the index of the first element of an array that satisfies a delegate.
 */
/*
size_t find (Elem) (Elem[] buf, bool delegate (Elem) dg)
body {
  foreach (index, needle; buf) {
    if (dg(needle)) {
      return index;
    }
  }
  return NOT_FOUND;
}
debug( UnitTest )
{
	unittest
	{

  int[] foo = [1, 2, 4, 8, 16, 32];
  size_t idx = foo.find((int x) {return x > 10;});
  assert(idx == 4U);

}
}
*/
//

// see tango.text.Util delimt and split
/*
 *  Split an array into subarrays by the given dilimiters.  Requires at least one
 *  delimiter.
 */
/*
Elem[][] split (Elem) (Elem[] buf, Elem[] delim ...)
{
    Elem[][] result ;
    Elem[]   token  ;

    void _put ()
    {
        if (token.length > 0)
        {
          result ~= token.dup;
          token.length = 0;
        }
    }

  foreach (i, x; buf) {
    if (delim.contains(x)) {
      _put();
    }
    else {
      token ~= x;
    }
  }
  _put();
  return result;
}
debug( UnitTest )
{
	unittest
	{

        char[]   foo = "cashew casehew"c;
        char[][] bar = foo.split("sh");
        assert(bar == ["ca", "ew ca", "e", "ew"]);

    }
}
*/





// see tango.text : locate
/*
 * Search an array for a given item, and return its index, or NOT_FOUND if not found.
 */
/*
size_t indexOf (Elem) (Elem[] buf, Elem needle, size_t start = 0U)
body {
    foreach (idx, elem; buf[start .. $]) {
        if (elem is needle) {
            return idx;
        }
    }
    return NOT_FOUND;
}
debug( UnitTest )
{
	unittest
	{

  int[] foo = [1, 2, 3];
  assert(foo.indexOf(2) == 1U);

  int[] bar = [4, 5, 6];
  assert(bar.indexOf(2) == NOT_FOUND);

}
}
*/
//

//see tango.text.Util : locatePattern
/*
 * Search an array for a given sub-array, and return its index, or NOT_FOUND.
 */
/*
size_t indexOfSub (Elem) (Elem[] buf, Elem[] bale, size_t start = 0U)
body {
    foreach (idx, elem; buf[start .. $ - bale.length]) {
        if (buf[idx .. idx + bale.length] == bale) {
            return idx;
        }
    }
    return NOT_FOUND;
}
debug( UnitTest )
{
	unittest
	{

  int[] foo = [1, 2, 3, 4, 5];
  int[] sub = [      3, 4   ];
  assert(foo.indexOfSub(sub) == 2U);

}
}
*/


//see tango.text.Util : join
/*
 *  Joins a list of subarrays with the given separator.
 */
 /*
Elem[] join (Elem) (Elem[][] src, Elem[] glue)
body {
  Elem[] result ;

  if (src.length > 0) {
    result ~= src[0];
    foreach (item; src[1 .. $]) {
      result ~= glue ~ item;
    }
  }
  return result;
}
debug( UnitTest )
{
	unittest
	{

  int[][] foo = [[1, 2], [3, 4], [5, 6]];
  auto bar = foo.join([0]);
  assert(bar == [1, 2, 0, 3, 4, 0, 5, 6]);

}
}
*/



/*
 *  Remove items accepted by a given delegate, and returns number of items removed.
 */
/*
size_t dropIf (Elem) (ref Elem[] buf, bool delegate(Elem) dlg)
body {
  size_t count ;

  for (size_t index; index < buf.length; ++index) {
    if (dlg(buf[index])) {
      buf.removeByIndex(index);
      ++count;
      --index;
    }
  }
  return count;
}
debug( UnitTest )
{
	unittest
	{

  int[] foo = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]             ;
  size_t cnt = foo.dropIf((int n) { return n % 2 == 0; }) ;
  assert(foo == [1, 3, 5, 7, 9]);
  assert(cnt == 5U             );

  char[] bar = "AbcdEfghIjklmnOpqrstUvwxyz" ;
  cnt = bar.dropIf((char c) { return (c & 32) != 0; });
  assert(bar == "AEIOU");
  assert(cnt == 21U    );

}
}
*/
//

// see removeByValueAll
/***********************************************************************************
 * Remove all occurances of an item from an array.
 */
/*
Elem[] removeByValueAll (Elem) (ref Elem[] buf, Elem needle)
body {
    buf.dropIf(
        (Elem elem) {
            return elem is needle;
        }
    );
    return buf;
}
debug( UnitTest )
{
	unittest
	{

  int[] foo = [1, 2, 1, 3, 1, 4, 1, 5];
  foo.removeByValueAll(1);
  assert(foo == [2, 3, 4, 5]);

}
}
//
*/

// see tango.core.Array.replace
/*
 *  Replace occurances of a given element with a new value.
 */
/*
Elem[] replace (Elem) (ref Elem[] buf, Elem oldvalue, Elem newvalue)
body {
  foreach (ref needle; buf) {
    if (needle is oldvalue) {
      needle = newvalue;
    }
  }
  return buf;
}
debug( UnitTest )
{
	unittest
	{

  int[] foo = [1, 2, 1, 2, 1];
  foo.replace(2, 1);
  assert(foo == [1, 1, 1, 1, 1]);

}
}
*/

// see tango.text.Util : locatePattern
/*
 * Same as indexOfSub but work backwards from the end.
 */
/*
size_t rindexOfSub (Elem) (Elem[] buf, Elem[] bale, size_t start = NOT_FOUND)
body {
  buf.defaultLength(start);
  for (size_t i = start - bale.length; i >= 0; --i) {
    if (buf[i .. i + bale.length] == bale) {
        return i;
    }
  }
  return NOT_FOUND;
}
debug( UnitTest )
{
	unittest
	{

  int[] foo = [1, 2, 9, 8, 1, 2, 9, 8];
  int[] sub = [1, 2                  ];
  assert(foo.rindexOfSub(sub) == 4U);

}
}
*/
//

//see tango.core.Array : rfind
/*
 * Same as indexOf but work backwards from the end.
 */
/*
size_t rindexOf (Elem) (Elem[] buf, Elem needle, size_t start = NOT_FOUND)
body {
  if (start == NOT_FOUND) {
    start = buf.length - 1U;
  }
  for (size_t i = start; i >= 0U; --i) {
    if (buf[i] is needle) {
        return i;
    }
  }
  return NOT_FOUND;
}
debug( UnitTest )
{
	unittest
	{

  int[] foo = [1, 9, 2, 9, 3];
  assert(foo.rindexOf(9) == 3U);

}
}
*/

// too many function name
/*
 * Drop a value from the end.
 */
/*
Elem rshift (Elem) (ref Elem[] buf)
in {
    assert(buf.length > 0, "rshift(): Cannot take values from an empty array.");
}
body {
  return buf.extract(buf.length - 1);
}
debug( UnitTest )
{
	unittest
	{

      int[] foo = [1, 2, 3, 4, 5];
      auto elm = foo.rshift();
      assert(foo == [1, 2, 3, 4]);
      assert(elm == 5           );
    }
}
*/

// too many function name
/*
 * Drop a value from the beginning.
 */
 /*
Elem shift (Elem) (ref Elem[] buf)
in {
    assert(buf.length > 0, "shift(): Cannot take values from an empty array.");
}
body {
  return buf.extract(0U);
}
debug( UnitTest )
{
	unittest
	{

      int[] foo = [1, 2, 3, 4, 5];
      auto elm = foo.shift();
      assert(foo == [2, 3, 4, 5]);
      assert(elm == 1           );
    }
}
*/

//see tango.core.Array
/*
 * Remove duplicate values from an array.
 */
/*
Elem[] unique (Elem) (ref Elem[] buf)
body {
  size_t ridx ;

  buf.sort;
  for (size_t i = 0U; i < buf.length; i++) {
    ridx = i + buf[i .. $].rindexOf(buf[i]);
    if (ridx != i) {
      buf.removeSlice(i + 1, ridx + 1);
    }
  }
  return buf;
}
debug( UnitTest )
{
	unittest
	{

  int[] foo = [1, 1, 2, 1, 2, 3, 1, 2, 3, 4, 1, 2, 3, 4, 5];
  foo.unique();
  assert(foo == [1, 2, 3, 4, 5]);

}
}
*/

/*
 * If len equals NOT_FOUND, re-assign it to buf.length.
 */
/*
Elem[] defaultLength (Elem) (Elem[] buf, ref size_t len)
{
    if (len == NOT_FOUND)
        len = buf.length;
    return buf;
}
debug( UnitTest )
{
	unittest
	{
        int[]  foo = [1, 2, 3, 4, 5];
        size_t len = NOT_FOUND      ;

        foo.defaultLength(len);
        assert(len == foo.length);

        len = 9U;
        foo.defaultLength(len);
        assert(len == 9U);
    }
}
*/




/*
 * Drop a value from an array, and return it.
 */
/*
Elem extract (Elem) (ref Elem[] buf, size_t index)
{
    //cashew.utils.Array
    if( !buf.length || index > buf.length -1 )
        return cast(Elem)null;
    Elem result = buf[index] ;

    buf.removeByIndex(index);
    return result;
}
debug( UnitTest )
{
	unittest
	{
        int[] foo = [0, 1, 2, 3, 4, 5];
        int   elm = foo.extract(3U);
        assert(foo == [0, 1, 2, 4, 5]);
        assert(elm == 3);
    }
}
*/

/*
 * Drop a slice from an array, and return it.
 */
/*
Elem[] extractSlice (Elem) (ref Elem[] buf, size_t start, size_t wall)
{
    if( start >= buf.length || wall > buf.length)
        return null;
    Elem[] result = buf[start .. wall].dup;
    buf.removeSlice(start, wall);
    return result;
}
debug( UnitTest )
{
	unittest
	{

        int[] foo = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] ;
        int[] sub = foo.extractSlice(3U, 7U);
        assert(foo == [0, 1, 2, 7, 8, 9]);
        assert(sub == [3, 4, 5, 6]);
    }
}
*/

// from eat to lextractSlice, by http://www.d-programming-language-china.org/ 20070929
/*
 * Remove some of the beginning of an array.
 */
/*
Elem[] lextractSlice (Elem) (ref Elem[] buf, size_t count)
{
    //cashew.utils.Array
    return buf.extractSlice(0U, count);
}
debug( UnitTest )
{
	unittest
	{
        int[] foo = [1, 2, 3, 4, 5];
        foo.lextractSlice(3U);
        assert(foo == [4, 5]);
    }
}
*/

/*
 * Remove some of the end of an array.
 */
/*
Elem[] rextractSlice (Elem) (ref Elem[] buf, size_t count)
{
    //cashew.utils.Array
    // from reat to rextractSlice, by http://www.d-programming-language-china.org/, 20070729
    return buf.extractSlice(buf.length - count - 1U, buf.length);
}
debug( UnitTest )
{
	unittest
	{
        int[] foo = [1, 2, 3, 4, 5];
        foo.rextractSlice(2U);
        //assert(foo == [1, 2, 3]);
    }
}
*/

