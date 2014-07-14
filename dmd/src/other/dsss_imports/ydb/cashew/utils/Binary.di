/*****************************************************************************************
 *  Binary search utilities.
 *
 *  $(CASHEW_HEAD)
 *
 *  Version: 0.1.0
 *
 *  Authors:
 *    Bill Baxter
 *
 *  Date: May 29, 2007
 */
module ydb.cashew.utils .Binary ;

/*****************************************************************************************
 *  Imports.
 */
public import ydb.cashew.utils .Array : NOT_FOUND ;

static import UTest = ydb.cashew.utils .UTest ;

/***********************************************************************************
 * Unittest output.
 */
unittest { 
  UTest.beginModule("ydb.cashew.utils.Array");
}

/** Check that the array A is sorted in non-decreasing order */
bool is_sorted(T)(T[] A)
{
    auto N = A.length;
    for(size_t i=1; i<N; i++) {
        if (A[i]<A[i-1]) return false;
    }
    return true;
}
unittest{
    UTest.begin("is_sorted");
    int[] foo = [1,2,3,5,6];
    assert(foo.is_sorted());
    foo = [1,2,4,3,6];
    assert(!foo.is_sorted());
    foo = [];
    assert(foo.is_sorted());
    foo = [42];
    assert(foo.is_sorted());
    UTest.end;
}

/** Use binary search to look for x in A, which must be sorted.
    If there are multiple values that match, returns the value with
    the lowest index.  This method uses bisect_left() for the dirty work.

    Optional args lo (default 0) and hi (default A.length) bound the
    slice of A to be searched.
*/
size_t bsearch(T)(T[] A, T x, size_t lo=0, size_t hi=size_t.max)
in { assert(is_sorted(A)); }
body
{
    size_t ret = A.bisect_left(x,lo,hi);
    if (ret<hi && ret<A.length && A[ret]==x) {
        return ret;
    }
    return NOT_FOUND;
}
unittest{
    UTest.begin("bsearch");
    int[] foo = [1,3,4,6,8];
    assert(foo.bsearch(0) == NOT_FOUND);
    assert(foo.bsearch(1) == 0);
    assert(foo.bsearch(2) == NOT_FOUND);
    assert(foo.bsearch(3) == 1);
    assert(foo.bsearch(4) == 2);
    assert(foo.bsearch(5) == NOT_FOUND);
    assert(foo.bsearch(6) == 3);
    assert(foo.bsearch(7) == NOT_FOUND);
    assert(foo.bsearch(8) == 4);
    assert(foo.bsearch(9) == NOT_FOUND);
    int[] bar = [1,1,3,3,3,8,8];
    assert(bar.bsearch(0) == NOT_FOUND);
    assert(bar.bsearch(1) == 0);
    assert(bar.bsearch(2) == NOT_FOUND);
    assert(bar.bsearch(3) == 2);
    assert(bar.bsearch(4) == NOT_FOUND);
    assert(bar.bsearch(8) == 5);
    assert(bar.bsearch(9) == NOT_FOUND);
    UTest.end;
}


/** Use binary search to look for x in A, which must be sorted.
    If there are multiple values that match, returns the value with
    the highest index.

    Optional args lo (default 0) and hi (default A.length) bound the
    slice of A to be searched.
*/
size_t bsearch_right(T)(T[] A, T x, size_t lo=0, size_t hi=size_t.max)
in { assert(is_sorted(A)); }
body
{
    size_t ret = A.bisect(x,lo,hi);
    if (ret>lo) ret--;
    if (A[ret]==x) {
        return ret;
    }
    return NOT_FOUND;
}
unittest{
    UTest.begin("bsearch_right");
    int[] foo = [1,3,4,6,8];
    assert(foo.bsearch_right(0) == NOT_FOUND);
    assert(foo.bsearch_right(1) == 0);
    assert(foo.bsearch_right(2) == NOT_FOUND);
    assert(foo.bsearch_right(3) == 1);
    assert(foo.bsearch_right(4) == 2);
    assert(foo.bsearch_right(5) == NOT_FOUND);
    assert(foo.bsearch_right(6) == 3);
    assert(foo.bsearch_right(7) == NOT_FOUND);
    assert(foo.bsearch_right(8) == 4);
    assert(foo.bsearch_right(9) == NOT_FOUND);
    int[] bar = [1,1,3,3,3,8,8];
    assert(bar.bsearch_right(0) == NOT_FOUND);
    assert(bar.bsearch_right(1) == 1);
    assert(bar.bsearch_right(2) == NOT_FOUND);
    assert(bar.bsearch_right(3) == 4);
    assert(bar.bsearch_right(4) == NOT_FOUND);
    assert(bar.bsearch_right(8) == 6);
    assert(bar.bsearch_right(9) == NOT_FOUND);
    UTest.end;
}

/** Return the index where to insert item x in list A, assuming A sorted.

    The return value i is such that all e in A[0..i] have e <= x, and all
    e in A[i..$] have e > x.  So if x already appears in the list, i
    points just beyond the rightmost x already there

    Optional args lo (default 0) and hi (default A.length) bound the
    slice of A to be searched.
*/
size_t bisect(T)(T[] A, T x, size_t lo=0, size_t hi=size_t.max)
in { assert(is_sorted(A)); }
body
{
    if (hi == size_t.max) hi = A.length;
    size_t mid;
    while (lo < hi)
    {
        mid = (lo+hi)/2;
        if (x < A[mid]) { hi = mid; }
        else { lo = mid+1; }
    }
    return lo;
}
unittest{
    UTest.begin("bisect");
    int[] foo = [1,3,4,6,8];
    assert(foo.bisect(0) == 0);
    assert(foo.bisect(1) == 1);
    assert(foo.bisect(2) == 1);
    assert(foo.bisect(3) == 2);
    assert(foo.bisect(4) == 3);
    assert(foo.bisect(5) == 3);
    assert(foo.bisect(10) == 5);
    int[] bar = [1,1,3,4,4,6,8,8];
    assert(bar.bisect(0) == 0);
    assert(bar.bisect(1) == 2);
    assert(bar.bisect(2) == 2);
    assert(bar.bisect(3) == 3);
    assert(bar.bisect(4) == 5);
    assert(bar.bisect(5) == 5);
    assert(bar.bisect(6) == 6);
    assert(bar.bisect(7) == 6);
    assert(bar.bisect(8) == 8);
    assert(bar.bisect(9) == 8);
    UTest.end;
}

/** Return the index where to insert item x in list A, assuming A sorted.

    The return value i is such that all e in A[0..i] have e < x, and
    all e in A[i..$] have e >= x.  So if x already appears in the
    list, i points at the leftmost x already there.

    Optional args lo (default 0) and hi (default len(a)) bound the
    slice of a to be searched.
*/
size_t bisect_left(T)(T[] A, T x, size_t lo=0, size_t hi=size_t.max)
in { assert(is_sorted(A)); }
body
{
    if (hi==size_t.max) hi = A.length;
    size_t mid;
    while (lo < hi)
    {
        mid = (lo+hi)/2;
        if (A[mid] < x) { lo = mid+1; }
        else { hi = mid; }
    }
    return lo;
}
unittest{
    UTest.begin("bisect_left");
    int[] foo = [1,3,4,6,8];
    assert(foo.bisect_left(0) == 0);
    assert(foo.bisect_left(1) == 0);
    assert(foo.bisect_left(2) == 1);
    assert(foo.bisect_left(3) == 1);
    assert(foo.bisect_left(4) == 2);
    assert(foo.bisect_left(5) == 3);
    assert(foo.bisect_left(10) == 5);
    int[] bar = [1,1,3,4,4,6,8,8];
    assert(bar.bisect_left(0) == 0);
    assert(bar.bisect_left(1) == 0);
    assert(bar.bisect_left(2) == 2);
    assert(bar.bisect_left(3) == 2);
    assert(bar.bisect_left(4) == 3);
    assert(bar.bisect_left(5) == 5);
    assert(bar.bisect_left(6) == 5);
    assert(bar.bisect_left(7) == 6);
    assert(bar.bisect_left(8) == 6);
    assert(bar.bisect_left(9) == 8);
    UTest.end;
} 

/***********************************************************************************
 * Unittest output.
 */
unittest {
  UTest.endModule;
}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
