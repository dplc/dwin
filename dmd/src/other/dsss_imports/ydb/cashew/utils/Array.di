/*****************************************************************************************
 *  Utility template functions for arrays.
 *
 *  $(CASHEW_HEAD)
 *
 *  Version: 0.14.1
 *
 *  <b>Authors, Contributors, and Acknowledgements:</b><br />
 *    Christopher Nicholson-Sauls<br />
 *    Mikola Lysenko<br />
 *    Reiner Pope<br />
 *    David Medlock<br />
 *    Sean Kelly<br />
 *    David Qualls<br />
 *    Bill Baxter<br />
 *    "baxissimo"
 *
 *  Date: Oct 13, 2008
 *
 *  Notes:
 *    Literals passed to size_t parameters require the unsigned suffix.
 * 
 *----------------------------------------------------------------------------------------
 * import ydb.cashew.utils .array ;
 * // ...
 * int[] foo = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
 * foo.remove(4);
 * foo.eat(foo.indexOf(2));
 *----------------------------------------------------------------------------------------
 */
module ydb.cashew.utils .Array ;

/***********************************************************************************
 * Imports
 */
static import UTest = ydb.cashew.utils .UTest ;

/***********************************************************************************
 * Unittest output.
 */
unittest { 
  UTest.beginModule("ydb.cashew.utils.Array");
}

/***********************************************************************************
 *  Externs
 */
private extern(C) void* memmove (void*, void*, size_t) ;

/***********************************************************************************
 * Convenience constant returned by indexing functions when no valid index is found.
 */
const size_t NOT_FOUND = size_t.max ;

/***********************************************************************************
 * Unittest output.
 */
unittest { UTest.beginSection("stand-alone"); }

/***********************************************************************************
 *  Build an associative array from two standard arrays, the first as keys and the second
 *  as values.
 */
U[T] assoc (T, U) (T[] keys, U[] values)
in {
  assert(keys.length == values.length, "assoc(): keys and values must have equal length");
}
body {
  U[T] result ;

  foreach (i, x; keys) {
    result[x] = values[i];
  }
  return result;
}
unittest {
  UTest.begin(r" assoc([],[])"c);
  auto foo = assoc!(int, char)(
    [           65 , 66 , 67 , 68 , 69 ] ,
    [cast(char) 'A', 'B', 'C', 'D', 'E']
  );
  assert(foo.keys   == [           65 , 66 , 67 , 68 , 69 ]);
  assert(foo.values == [cast(char) 'A', 'B', 'C', 'D', 'E']);
  assert(foo[65]    == 'A'                                 );
  UTest.end;
}

/***********************************************************************************
 * Build an array by repeating an item.
 */
T[] repeat (T) (T needle, size_t len)
body {
  T[] haystack = new T[len];

  haystack[] = needle;
  return haystack;
}
unittest {
  UTest.begin(r" repeat(T [, N])"c);
  assert(repeat(3, 3U) == [3, 3, 3]);
  UTest.end;
}

/***********************************************************************************
 * Build an array by repeating a smaller array.
 */
T[] repeatSub (T) (T[] bale, size_t count)
body {
  T[] haystack = new T[count * bale.length];

  haystack.length = 0;
  for (int i; i < count; i++) {
    haystack ~= bale;
  }
  return haystack;
}
unittest {
  UTest.begin(r" repeatSub(T[], N)"c);
  assert(repeatSub([4, 2], 3U) == [4, 2, 4, 2, 4, 2]);
  UTest.end;
}

/***********************************************************************************
 * Unittest output.
 */
unittest {
  UTest.endSection;
  UTest.beginSection("pseudo-member");
}

/***********************************************************************************
 *  Concatenation in series, via function call.
 *----------------------------------------------------------------------------------------
 *  int[] foo = ... ;
 *  foo.append([1, 2], [3, 4], [5, 6]);
 *----------------------------------------------------------------------------------------
 */
T[] append (T) (inout T[] haystack, T[][] bales ...)
body {
  foreach (x; bales) {
    haystack ~= x;
  }
  return haystack;
}
unittest {
  UTest.begin(r".append(T[], T[]...)"c);
  int[] foo = [1, 2] ;
  foo.append([3, 4], [5, 6]);
  assert(foo == [1, 2, 3, 4, 5, 6]);
  UTest.end;
}

/***********************************************************************************
 *  Update/modify all elements of an array.
 */
T[] apply (T) (inout T[] haystack, void delegate (inout T) dg)
body {
  foreach (inout needle; haystack) {
    dg(needle);
  }
  return haystack;
}
unittest {
  UTest.begin(r".apply(Dlg)"c);
  int[] foo = [1, 3, 5, 7];
  foo.apply((inout int n) { n++; });
  assert(foo == [2, 4, 6, 8]);
  UTest.end;
}

/***********************************************************************************
 *  Run a delegate on all elements of an array and compose a new array from the delegate's
 *  results.
 */
R[] collect (T, R) (T[] haystack, R delegate (T) dg) {
    R[] result = new R[haystack.length];

    foreach (index, needle; haystack) {
        result[index] = dg(needle);
    }
    return result;
}
unittest {
    UTest.begin(r".collect(Dlg)"c);
    auto foo = [1, 2, 3, 4];
    auto bar = foo.collect((int x) { return ++x; });
    assert(bar == [2, 3, 4, 5]);
    UTest.end;
}

/***********************************************************************************
 * Verify that a given value is present in an array.
 */
bool contains (T) (T[] haystack, T needle)
body {
  return haystack.indexOf(needle) != NOT_FOUND;
}
unittest {
  UTest.begin(r".contains(T)"c);
  int[] foo = [1, 2, 3];
  assert(  foo.contains(2));
  assert(! foo.contains(4));
  UTest.end;
}

/***********************************************************************************
 * If len equals NOT_FOUND, re-assign it to haystack.length.
 */
T[] defaultLength (T) (T[] haystack, inout size_t len)
body {
  if (len == NOT_FOUND) {
    len = haystack.length;
  }
  return haystack;
}
unittest {
  UTest.begin(r".defaultLength(N)"c);
  int[]  foo = [1, 2, 3, 4, 5];
  size_t len = NOT_FOUND      ;

  foo.defaultLength(len);
  assert(len == foo.length);

  len = 9U;
  foo.defaultLength(len);
  assert(len == 9U);
  UTest.end;
}

/***********************************************************************************
 * Compose a new array of the values in the first parameter not present in the second.
 */
T[] diff (T) (T[] alpha, T[] beta)
body {
    T[]    result  ;
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
unittest {
  UTest.begin(r".diff(T[])"c);
  int[] foo = [1, 2, 3, 4, 5   ] ;
  int[] bar = [1,    3,    5, 6] ;
  assert(foo.diff(bar) == [2, 4]);
  UTest.end;
}

/***********************************************************************************
 *  Compose a new array of the bidirectional differences of two arrays.
 */
T[] diff2 (T) (T[] alpha, T[] beta)
body {
    return (alpha.diff(beta) ~ beta.diff(alpha));
}
unittest {
    UTest.begin(r".diff2(T[])"c);
    int[] foo = [1, 2,    4, 5,  ];
    int[] bar = [   2, 3,    5, 6];
    assert(foo.diff2(bar).sort == [1, 3, 4, 6]);
    UTest.end;
}

/***********************************************************************************
 *  Remove an item from an array by index.
 */
T[] drop (T) (inout T[] haystack, size_t index)
in {
  assert(index < haystack.length, ".drop() called with index greater than array length");
}
body {
  if (index != haystack.length - 1) {
    memmove(&(haystack[index]), &(haystack[index + 1]), T.sizeof * (haystack.length - index - 1));
  }
  haystack.length = haystack.length - 1;
  return haystack;
}
unittest {
  UTest.begin(r".drop(N)"c);
  int[] foo = [0, 1, 2, 3, 4, 5];
  foo.drop(3_U);
  assert(foo == [0, 1, 2, 4, 5]);
  UTest.end;
}

/***********************************************************************************
 *  Remove items accepted by a given delegate, and returns number of items removed.
 */
size_t dropIf (T) (inout T[] haystack, bool delegate(T) dlg)
body {
  size_t count ;

  for (size_t index; index < haystack.length; ++index) {
    if (dlg(haystack[index])) {
      haystack.drop(index);
      ++count;
      --index;
    }
  }
  return count;
}
unittest {
  UTest.begin(r".dropIf(Dlg)"c);
  int[] foo = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]             ;
  size_t cnt = foo.dropIf((int n) { return n % 2 == 0; }) ;
  assert(foo == [1, 3, 5, 7, 9]);
  assert(cnt == 5U             );

  char[] bar = "AbcdEfghIjklmnOpqrstUvwxyz" ;
  cnt = bar.dropIf((char c) { return (c & 32) != 0; });
  assert(bar == "AEIOU");
  assert(cnt == 21U    );
  UTest.end;
}

/***********************************************************************************
 * Remove a slice from an array.
 */
T[] dropRange (T) (inout T[] haystack, size_t start, size_t wall)
in {
  assert(
    start < haystack.length && wall <= haystack.length,
    ".dropRange(): Range out of bounds"
  );
}
body {
  if (wall == haystack.length) {
    haystack.length = haystack.length - start;
  }
  else {
    memmove(&(haystack[start]), &(haystack[wall]), T.sizeof * (haystack.length - wall));
    haystack.length = haystack.length - (wall - start);
  }
  return haystack;
}
unittest {
  UTest.begin(r".dropRange(N,M)"c);
  int[] foo = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] ;
  
  foo.dropRange(3U, 7U);
  assert(foo == [0, 1, 2, 7, 8, 9]);

  foo.dropRange(3U, 6U);
  assert(foo == [0, 1, 2]);
  UTest.end;
}

/***********************************************************************************
 * Remove some of the beginning of an array.
 */
T[] eat (T) (inout T[] haystack, size_t count)
body {
  return haystack.extractRange(0U, count);
}
unittest {
  UTest.begin(r".eat(N)"c);
  int[] foo = [1, 2, 3, 4, 5];
  foo.eat(3U);
  assert(foo == [4, 5]);
  UTest.end;
}

/***********************************************************************************
 * Drop a value from an array, and return it.
 */
T extract (T) (inout T[] haystack, size_t index)
in {
    assert(haystack.length > 0, "extract(): Cannot take values from an empty array.");
}
body {
  T result = haystack[index] ;

  haystack.drop(index);
  return result;
}
unittest {
  UTest.begin(r".extract(N)"c);
  int[] foo = [0, 1, 2, 3, 4, 5];
  int   elm = foo.extract(3U);
  assert(foo == [0, 1, 2, 4, 5]);
  assert(elm == 3);
  UTest.end;
}

/***********************************************************************************
 * Drop a slice from an array, and return it.
 */
T[] extractRange (T) (inout T[] haystack, size_t start, size_t wall)
in {
  assert(
    start < haystack.length && wall <= haystack.length,
    ".extractRange(): Range out of bounds"
  );
}
body {
  T[] result = haystack[start .. wall].dup;

  haystack.dropRange(start, wall);
  return result;
}
unittest {
  UTest.begin(r".extractRange(N,M)"c);
  int[] foo = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] ;
  int[] sub = foo.extractRange(3U, 7U);
  assert(foo == [0, 1, 2, 7, 8, 9]);
  assert(sub == [3, 4, 5, 6]);
  UTest.end;
}

/***********************************************************************************
 * Fill an array with a given element.
 */
T[] fill (T) (inout T[] haystack, T needle, size_t len = NOT_FOUND)
body {
  haystack.defaultLength(len);
  haystack.length = len;
  haystack[] = needle;
  return haystack;
}
unittest {
  UTest.begin(r".fill (T [, N])"c);
  int[] foo = [1, 2, 3, 4, 5];

  foo.fill(9);
  assert(foo == [9, 9, 9, 9, 9]);

  foo.fill(3, 3U);
  assert(foo == [3, 3, 3]);
  UTest.end;
}

/***********************************************************************************
 * Fill an array with a given smaller array.
 */
T[] fillSub (T) (inout T[] haystack, T[] bale, size_t len = NOT_FOUND)
body {
  haystack.defaultLength(len);
  haystack.length = 0;
  while (haystack.length < len) {
    haystack ~= bale;
  }
  haystack.length = len;
  return haystack;
}
unittest {
  UTest.begin(r".fillSub (T[] [, N])"c);
  int[] foo = [1, 2, 3, 4, 5];
  int[] sub = [3, 2, 1      ];

  foo.fillSub(sub);
  assert(foo == [3, 2, 1, 3, 2]);

  foo.fillSub(sub, 6U);
  assert(foo == [3, 2, 1, 3, 2, 1]);
  UTest.end;
}

/***********************************************************************************
 * Select values from an array using a delegate.
 */
T[] filter (T) (T[] haystack, bool delegate (T) dg)
body {
  T[] result ;

  foreach (needle; haystack) {
    if (dg(needle)) {
      result ~= needle;
    }
  }
  return result;
}
unittest {
  UTest.begin(r".filter(Dlg)"c);
  int[] foo = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  auto sub = foo.filter((int x) { return (x % 2) == 0; });
  assert(sub == [2, 4, 6, 8, 10]);
  UTest.end;
}

/***********************************************************************************
 * Lookup the index of the first element of an array that satisfies a delegate.
 */
size_t find (T) (ref T[] haystack, bool delegate (ref T) dg)
body {
  foreach (index, needle; haystack) {
    if (dg(needle)) {
      return index;
    }
  }
  return NOT_FOUND;
}
unittest {
  UTest.begin(r".find(Dlg)"c);
  int[] foo = [1, 2, 4, 8, 16, 32];
  size_t idx = find(foo, (ref int x) {return x > 10;});
  assert(idx == 4U);
  UTest.end;
}

/***********************************************************************************
 *  Same as splitLen except trailing elements are included in the result.
 */
T[][] greedySplitLen (T) (T[] haystack, size_t len)
body {
  auto result = haystack.splitLen(len) ;

  size_t resultSize = result.length * len ;

  if (resultSize < haystack.length) {
    result ~= haystack[resultSize .. $];
  }
  return result;
}
unittest {
  UTest.begin(r".greedySplitLen(N)"c);
  int[]   foo = [1, 2, 3, 4, 5, 6, 7];
  int[][] bar = foo.greedySplitLen(2U);
  assert(bar == [[1, 2][], [3, 4], [5, 6], [7]]);
  UTest.end;
}

/***********************************************************************************
 * Search an array for a given item, and return its index, or NOT_FOUND if not found.
 */
size_t indexOf (T) (T[] haystack, T needle, size_t start = 0U)
body {
    foreach (idx, elem; haystack[start .. $]) {
        if (elem is needle) {
            return idx;
        }
    }
    return NOT_FOUND;
}
unittest {
  UTest.begin(r".indexOf(T)"c);
  int[] foo = [1, 2, 3];
  assert(foo.indexOf(2) == 1U);

  int[] bar = [4, 5, 6];
  assert(bar.indexOf(2) == NOT_FOUND);
  UTest.end;
}

/***********************************************************************************
 * Search an array for a given sub-array, and return its index, or NOT_FOUND.
 */
size_t indexOfSub (T) (T[] haystack, T[] bale, size_t start = 0U)
body {
    size_t
        mark ;

    foreach (idx, elem; haystack[start .. $ - bale.length]) {
        mark = start + idx;
        if (haystack[mark .. (mark + bale.length)] == bale) {
            return idx;
        }
    }
    return NOT_FOUND;
}
unittest {
  UTest.begin(r".indexOfSub(T[])"c);
  int[] foo = [1, 2, 3, 4, 5];
  int[] sub = [      3, 4   ];
  assert(foo.indexOfSub(sub) == 2U);
  UTest.end;
}

/***********************************************************************************
 * Insert item x into an array at (just before) index.
 */
void insert (T) (ref T[] haystack, size_t index, T x)
in {
    assert(index < haystack.length + 1,
        ".insert() called with index greater than array length"
    );
}
body {
    if (index == haystack.length) {
        haystack ~= x;
    }
    else {
        haystack.length = haystack.length+1;
        memmove(
            &haystack[index+1],
            &haystack[index],
            T.sizeof * (haystack.length - index - 1)
        );
        haystack[index] = x;
    }
}
unittest {
    UTest.begin(r".insert(I,T)"c);
    int[] foo = [0, 1, 2, 3, 4, 5];
    foo.insert(3_U, 3);
    assert(foo == [0, 1, 2, 3,3, 4, 5]);
    foo.insert(7_U, 9);
    assert(foo == [0, 1, 2, 3,3, 4, 5, 9]);
    UTest.end;
} 

/***********************************************************************************
 * Return an array composed of common elements of two arrays.
 */
T[] intersect (T) (T[] alpha, T[] beta)
body {
  T[]    result ;
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
unittest {
  UTest.begin(r".intersect(A,A)"c);
  int[] foo = [1, 2, 3, 4, 5      ];
  int[] bar = [      3, 4, 5, 6, 7];
  assert(foo.intersect(bar) == [3, 4, 5]);
  UTest.end;
}

/***********************************************************************************
 *  Joins a list of subarrays with the given separator.
 */
T[] join (T) (T[][] src, T[] glue)
body {
  T[] result ;

  if (src.length > 0) {
    result ~= src[0];
    foreach (item; src[1 .. $]) {
      result ~= glue ~ item;
    }
  }
  return result;
}
unittest {
  UTest.begin(r".join(T[][], T[])"c);
  int[][] foo = [[1, 2], [3, 4], [5, 6]];
  auto bar = foo.join([0]);
  assert(bar == [1, 2, 0, 3, 4, 0, 5, 6]);
  UTest.end;
}

/***********************************************************************************
 * Stack-like behavior, with the end of the array as the "top".
 */
T[] push (T) (inout T[] haystack, T[] bale ...)
body {
  haystack ~= bale;
  return haystack;
}
unittest {
  UTest.begin(r".push(...)"c);
  int[] foo = [1, 2, 3];
  foo.push(4, 5);
  assert(foo == [1, 2, 3, 4, 5]);
  UTest.end;
}

/**ditto*/
alias rshift pop ;

/***********************************************************************************
 * Remove some of the end of an array.
 */
T[] reat (T) (inout T[] haystack, size_t count)
body {
  return haystack.extractRange(haystack.length - count - 1U, haystack.length);
}
unittest {
  UTest.begin(r".reat(N)"c);
  int[] foo = [1, 2, 3, 4, 5];
  foo.reat(2U);
  assert(foo == [1, 2, 3]);
  UTest.end;
}

/***********************************************************************************
 * Remove an item from an array.
 */
T[] remove (T) (inout T[] haystack, T needle)
body {
  size_t index = haystack.indexOf(needle) ;

  if (index != NOT_FOUND) {
    haystack.drop(index);
  }
  return haystack;
}
unittest {
  UTest.begin(r".remove(T)"c);
  int[] foo = [1, 2, 3];
  foo.remove(2);
  assert(foo == [1, 3]);
  UTest.end;
}

/***********************************************************************************
 * Remove all occurances of an item from an array.
 */
T[] removeAll (T) (inout T[] haystack, T needle)
body {
    haystack.dropIf(
        (T elem) {
            return elem is needle;
        }
    );
    return haystack;
}
unittest {
  UTest.begin(r".removeAll(T)"c);
  int[] foo = [1, 2, 1, 3, 1, 4, 1, 5];
  foo.removeAll(1);
  assert(foo == [2, 3, 4, 5]);
  UTest.end;
}

/***********************************************************************************
 *  Replace occurances of a given element with a new value.
 */
T[] replace (T) (inout T[] haystack, T oldvalue, T newvalue)
body {
  foreach (inout needle; haystack) {
    if (needle is oldvalue) {
      needle = newvalue;
    }
  }
  return haystack;
}
unittest {
  UTest.begin(r".replace(T,T)"c);
  int[] foo = [1, 2, 1, 2, 1];
  foo.replace(2, 1);
  assert(foo == [1, 1, 1, 1, 1]);
  UTest.end;
}

/***********************************************************************************
 *  Replace elements with new values described by an associative array.  Keys of the
 *  associative array correspond to elements, and values to their replacements.
 */
T[] replacePairs (T) (inout T[] haystack, T[T] pairs)
body {
  T* peer ;

  foreach (inout needle; haystack) {
    peer = needle in pairs;
    if (peer !is null) {
      needle = *peer;
    }
  }
  return haystack;
}
unittest {
  UTest.begin(r".replacePairs(T[T])"c);
  int[] foo = [1, 2, 3, 1, 2, 3, 1, 2, 3];
  auto pairs = assoc!(int, int)(
    [1, 2, 3] ,
    [4, 5, 6] 
  );
  foo.replacePairs(pairs);
  assert(foo == [4, 5, 6, 4, 5, 6, 4, 5, 6]);
  UTest.end;
}

/***********************************************************************************
 * Same as indexOf but work backwards from the end.
 */
size_t rindexOf (T) (T[] haystack, T needle, size_t start = NOT_FOUND)
body {
  if (start == NOT_FOUND) {
    start = haystack.length - 1U;
  }
  for (size_t i = start; i >= 0U; --i) {
    if (haystack[i] is needle) {
        return i;
    }
  }
  return NOT_FOUND;
}
unittest {
  UTest.begin(r".rindexOf(T)"c);
  int[] foo = [1, 9, 2, 9, 3];
  assert(foo.rindexOf(9) == 3U);
  UTest.end;
}

/***********************************************************************************
 * Same as indexOfSub but work backwards from the end.
 */
size_t rindexOfSub (T) (T[] haystack, T[] bale, size_t start = NOT_FOUND)
body {
  haystack.defaultLength(start);
  for (size_t i = start - bale.length; i >= 0; --i) {
    if (haystack[i .. i + bale.length] == bale) {
        return i;
    }
  }
  return NOT_FOUND;
}
unittest {
  UTest.begin(r".rindexOfSub(T[])"c);
  int[] foo = [1, 2, 9, 8, 1, 2, 9, 8];
  int[] sub = [1, 2                  ];
  assert(foo.rindexOfSub(sub) == 4U);
  UTest.end;
}

/***********************************************************************************
 * Rotate an array's contents toward the left.
 */
T[] rotl (T) (inout T[] haystack, size_t iter)
body {
  iter     %= haystack.length                           ;
  haystack  = haystack[iter .. $] ~ haystack[0 .. iter] ;
  return haystack;
}
unittest {
  UTest.begin(r".rotl(N)"c);
  int[] foo = [1, 2, 3, 4, 5, 6];
  foo.rotl(2U);
  assert(foo == [3, 4, 5, 6 ,1, 2]);

  int[] bar = [1, 2, 3];
  bar.rotl(4U);
  assert(bar == [2, 3, 1]);
  UTest.end;
}

/***********************************************************************************
 * Rotate an array's contents toward the right.
 */
T[] rotr (T) (inout T[] haystack, size_t iter)
body {
         iter    %= haystack.length                         ;
    auto idx      = haystack.length - iter                  ;
         haystack = haystack[idx .. $] ~ haystack[0 .. idx] ;
    return haystack;
}
unittest {
  UTest.begin(r".rotr(N)"c);
  int[] foo = [1, 2, 3, 4, 5, 6];
  foo.rotr(2U);
  assert(foo == [5, 6, 1, 2, 3, 4]);

  int[] bar = [1, 2, 3];
  bar.rotr(4U);
  assert(bar == [3, 1, 2]);
  UTest.end;
}

/***********************************************************************************
 * Drop a value from the end.
 */
T rshift (T) (inout T[] haystack)
in {
    assert(haystack.length > 0, "rshift(): Cannot take values from an empty array.");
}
body {
  return haystack.extract(haystack.length - 1);
}
unittest {
  UTest.begin(r".rshift()"c);
  int[] foo = [1, 2, 3, 4, 5];
  auto elm = foo.rshift();
  assert(foo == [1, 2, 3, 4]);
  assert(elm == 5           );
  UTest.end;
}

/***********************************************************************************
 * Drop a value from the beginning.
 */
T shift (T) (inout T[] haystack)
in {
    assert(haystack.length > 0, "shift(): Cannot take values from an empty array.");
}
body {
  return haystack.extract(0U);
}
unittest {
  UTest.begin(r".shift()"c);
  int[] foo = [1, 2, 3, 4, 5];
  auto elm = foo.shift();
  assert(foo == [2, 3, 4, 5]);
  assert(elm == 1           );
  UTest.end;
}

/***********************************************************************************
 * Stack-like behavior, with the front of the array as the "top".
 */
T[] shove (T) (inout T[] haystack, T[] bale ...)
body {
  haystack = bale.reverse ~ haystack;
  return haystack;
}
unittest {
  UTest.begin(r".shove(...)"c);
  int[] foo = [3, 4, 5];
  foo.shove(2, 1);
  assert(foo == [1, 2, 3, 4, 5]);
  UTest.end;
}

/**ditto*/
alias shift pull ;

/***********************************************************************************
 *  Split an array into subarrays by the given dilimiters.  Requires at least one
 *  delimiter.
 */
T[][] split (T) (T[] haystack, T[] delim ...)
in {
  assert(delim.length > 0, "Splitting with no delimiters is useless");
}
body {
  T[][] result ;
  T[]   token  ;

  void _put () {
    if (token.length > 0) {
      result ~= token.dup;
      token.length = 0;
    }
  }

  foreach (i, x; haystack) {
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
unittest {
  UTest.begin(r".split(T[]...)"c);
  char[]   foo = "cashew casehew"c;
  char[][] bar = foo.split("sh");
  assert(bar == ["ca", "ew ca", "e", "ew"]);
  UTest.end;
}

/***********************************************************************************
 *  Split an array into subarrays of a given size.  Trailing elements will be lost.
 */
T[][] splitLen (T) (T[] haystack, size_t len)
in {
  assert(len > 0U, "A length of 0 is just rediculous");
}
body {
    auto result = new T[][haystack.length / len] ;

    size_t left  = 0_U ;
    size_t right = len ;

    foreach (i, inout x; result) {
        x      = haystack[left .. right] ;
        left   = right                   ;
        right += len                     ;
    }
    return result;
}
unittest {
  UTest.begin(r".splitLen(N)"c);
  int[]   foo = [1, 2, 3, 4, 5, 6, 7];
  int[][] bar = foo.splitLen(2U);
  assert(bar == [[1, 2][], [3, 4], [5, 6]]);
  UTest.end;
}

/***********************************************************************************
 * Remove duplicate values from an array.
 */
T[] unique (T) (inout T[] haystack)
body {
  size_t ridx ;

  haystack.sort;
  for (size_t i = 0U; i < haystack.length; i++) {
    ridx = i + haystack[i .. $].rindexOf(haystack[i]);
    if (ridx != i) {
      haystack.dropRange(i + 1, ridx + 1);
    }
  }
  return haystack;
}
unittest {
  UTest.begin(r".unique()"c);
  int[] foo = [1, 1, 2, 1, 2, 3, 1, 2, 3, 4, 1, 2, 3, 4, 5];
  foo.unique();
  assert(foo == [1, 2, 3, 4, 5]);
  UTest.end;
}

/***********************************************************************************
 * Unittest output.
 */
unittest {
  UTest.endSection;
  UTest.endModule;
}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
