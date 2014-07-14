/*
 * Copyright (c) 2007 John Chapman
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */

// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2007  (dyuyan  gmail at com) All rights reserved

        Version:        Initial release: 2007
                        Major Update:    May 2009

        Authors:        John Chapman, yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

/+
    Provides support for COM (Component Object Model).
    
    (updated on June 2, 2009 by yidabu)
    how to generate a COM type library for D programming language:
    1. run  ...\dmd\windows\bin\tlbimpd.exe sapi.dll /comments
    2. steps to replace generated COM type library file for works with DWin:
        GUID to DWINGUID (for conflicts with tango GUID)
            ([^\w])GUID([^;\w]) to $1DWINGUID$2
            
        VARIANT to DWINVARIANT (for conflicts with tango VARIANT)
            ([^\w])VARIANT([^;\w]) to $1DWINVARIANT$2            
            
          static DWINGUID
          to
          //static DWINGUID
          
 /\*\[(uuid\("[^"]+"\))\]\*/ 
         to
 mixin($1);
         
 out void ppvXXX
    to 
 void** ppvXXX
 
        some ref void to void*
         
        some ushort* to wchar* (not sure about this)
         
        mixin CoInterfaces! to mixin Interfaces!  
                     
+/

module dwin.sys.win32.com.Core;

//pragma(lib,"Urlmon.lib");
pragma (lib, "ole32.lib");
pragma (lib, "oleaut32.lib");
pragma (lib, "propsys.lib");

private import  dwin.sys.win32.com.Util,
                dwin.sys.win32.com.CoInit,
                dwin.sys.win32.com.COMException;

private import bstr = dwin.sys.win32.com.Bstr;

private import  dwin.sys.win32.UserGdi,
                dwin.core.Exception,
                dwin.time.Time;

private static import dwin.sys.win32.CodePage;
    alias dwin.sys.win32.CodePage.toString16z toUTF16z;

private import dwin.io.Stream: Stream, SeekPos;     //Stream


private import tango.sys.win32.UserGdi;
private import tango.core.Vararg;    
private import tango.text.convert.Integer : format;
private import tango.core.Exception;

/*
    private import std.string : stdformat = format;  TODO : fix this
*/

private static import  tango.stdc.stdlib;
private static import tango.core.Memory;

private import tango.stdc.string : memcpy;
private import TTuple = tango.core.Tuple;
    private alias TTuple.IndexOf IndexOf;
    private alias TTuple.MostDerived MostDerived;
    private alias TTuple.Tuple TypeTuple;
    private alias TTuple.Unique NoDuplicates;

private import Traits = tango.core.Traits;
    private alias Traits.ParameterTupleOf ParameterTypeTuple;
    private alias Traits.isArrayType isArray;
    private alias Traits.isPointerType isPointer;
    private alias Traits.BaseTypeTupleOf BaseTypeTuple;

private import TextUtil = tango.text.Util;
    
private alias char[] string;

/**
 * Represents a globally unique identifier.
 */
struct DWINGUID {

  // Slightly different layout from the Windows SDK, but means we can use fewer brackets
  // when defining GUIDs.
  uint a;
  ushort b, c;
  ubyte d, e, f, g, h, i, j, k;

  /**
   * A GUID whose value is all zeros.
   */
  static DWINGUID empty = { 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 };
  
  /**
   * Initializes _a new instance using the specified integers and bytes.
   * Params:
   *   a = The first 4 bytes.
   *   b = The next 2 bytes.
   *   c = The next 2 bytes.
   *   d = The next byte.
   *   e = The next byte.
   *   f = The next byte.
   *   g = The next byte.
   *   h = The next byte.
   *   i = The next byte.
   *   j = The next byte.
   *   k = The next byte.
   * Returns: The resulting GUID.
   */
  static DWINGUID opCall(uint a, ushort b, ushort c, ubyte d, ubyte e, ubyte f, ubyte g, ubyte h, ubyte i, ubyte j, ubyte k) {
    DWINGUID self;
    self.a = a, self.b = b, self.c = c, self.d = d, self.e = e, self.f = f, self.g = g, self.h = h, self.i = i, self.j = j, self.k = k;
    return self;
  }

  /**
   * Initializes _a new instance using the specified integers and byte array.
   * Params:
   *   a = The first 4 bytes.
   *   b = The next 2 bytes.
   *   c = The next 2 bytes.
   *   d = The remaining 8 bytes.
   * Returns: The resulting GUID.
   * Throws: IllegalArgumentException if d is not 8 bytes long.
   */
  static DWINGUID opCall(uint a, ushort b, ushort c, ubyte[] d) {
    if (d.length != 8)
      throw new ArgumentException("Byte array for GUID must be 8 bytes long.");

    DWINGUID self;
    self.a = a, self.b = b, self.c = c, self.d = d[0], self.e = d[1], self.f = d[2], self.g = d[3], self.h = d[4], self.i = d[5], self.j = d[6], self.k = d[7];
    return self;
  }

  /**
   * Initializes a new instance using the value represented by the specified string.
   * Params: s = A string containing a GUID in groups of 8, 4, 4, 4 and 12 digits with hyphens between the groups. The GUID can optionally be enclosed in braces.
   * Returns: The resulting GUID.
   */
  static DWINGUID opCall(char[] s) {

    ulong parse(char[] s) {

      bool hexToInt(char c, out uint result) {
        if (c >= '0' && c <= '9') result = c - '0';
        else if (c >= 'A' && c <= 'F') result = c - 'A' + 10;
        else if (c >= 'a' && c <= 'f') result = c - 'a' + 10;
        else result = -1;
        return (cast(int)result >= 0);
      }

      ulong result;
      uint value, index;
      while (index < s.length && hexToInt(s[index], value)) {
        result = result * 16 + value;
        index++;
      }
      return result;
    }

    //s = TextUtil.trim(s);

    if (s[0] == '{') {
      s = s[1 .. $];
      if (s[$ - 1] == '}')
        s = s[0 .. $ - 1];
    }

    if (s[0] == '[') {
      s = s[1 .. $];
      if (s[$ - 1] == ']')
        s = s[0 .. $ - 1];
    }

    //if (s.find('-') == -1)
    if (TextUtil.locate(s,'-') == s.length)
      throw new FormatException("Unrecognised GUID format.");

    DWINGUID self;
    self.a = cast(uint)parse(s[0 .. 8]);
    self.b = cast(ushort)parse(s[9 .. 13]);
    self.c = cast(ushort)parse(s[14 .. 18]);
    uint m = cast(uint)parse(s[19 .. 23]);
    self.d = cast(ubyte)(m >> 8);
    self.e = cast(ubyte)m;
    ulong n = parse(s[24 .. $]);
    m = cast(uint)(n >> 32);
    self.f = cast(ubyte)(m >> 8);
    self.g = cast(ubyte)m;
    m = cast(uint)n;
    self.h = cast(ubyte)(m >> 24);
    self.i = cast(ubyte)(m >> 16);
    self.j = cast(ubyte)(m >> 8);
    self.k = cast(ubyte)m;
    return self;
  }

  /**
   * Initializes a new instance of the GUID struct.
   */
  static DWINGUID create() {
    DWINGUID self;

    int hr = CoCreateGuid(self);
    if (FAILED(hr))
      throw exceptionForHR(hr);

    return self;
  }

  /**
   * Returns a value indicating whether two instances represent the same value.
   * Params: other = A GUID to compare to this instance.
   * Returns: true if other is equal to this instance; otherwise, false.
   */
  bool opEquals(DWINGUID other) {
    return a == other.a
      && b == other.b
      && c == other.c
      && d == other.d
      && e == other.e
      && f == other.f
      && g == other.g
      && h == other.h
      && i == other.i
      && j == other.j
      && k == other.k;
  }

  /**
   * Compares this instance to a specified GUID and returns an indication of their relative values.
   * Params: other = A GUID to compare to this instance.
   * Returns: A number indicating the relative values of this instance and other.
   */
  int opCmp(DWINGUID other) {
    if (a != other.a)
      return (a < other.a) ? -1 : 1;
    if (b != other.b)
      return (b < other.b) ? -1 : 1;
    if (c != other.c)
      return (c < other.c) ? -1 : 1;
    if (d != other.d)
      return (d < other.d) ? -1 : 1;
    if (e != other.e)
      return (e < other.e) ? -1 : 1;
    if (f != other.f)
      return (f < other.f) ? -1 : 1;
    if (g != other.g)
      return (g < other.g) ? -1 : 1;
    if (h != other.h)
      return (h < other.h) ? -1 : 1;
    if (i != other.i)
      return (i < other.i) ? -1 : 1;
    if (j != other.j)
      return (j < other.j) ? -1 : 1;
    if (k != other.k)
      return (k < other.k) ? -1 : 1;
    return 0;
  }

  /**
   * Returns a string representation of the value of this instance in registry format.
   * Returns: A string formatted in this pattern: {xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx} where the GUID is represented as a series of lowercase hexadecimal digits in groups of 8, 4, 4, 4 and 12 and separated by hyphens.
   */
  char[] toString(char[] format = "D") {

    void hexToString(ref char[] s, ref uint index, uint a, uint b) {

      char hexToChar(uint a) {
        a = a & 0x0F;
        return cast(char)((a > 9) ? a - 10 + 0x61 : a + 0x30);
      }

      s[index++] = hexToChar(a >> 4);
      s[index++] = hexToChar(a);
      s[index++] = hexToChar(b >> 4);
      s[index++] = hexToChar(b);
    }

    char[] s;
    uint index = 0;
    if (format == "D" || format == "d")
      s = new char[36];
    else if (format == "P" || format == "p") {
      s = new char[38];
      s[index++] = '{';
      s[$ - 1] = '}';
    }

    hexToString(s, index, a >> 24, a >> 16);
    hexToString(s, index, a >> 8, a);
    s[index++] = '-';
    hexToString(s, index, b >> 8, b);
    s[index++] = '-';
    hexToString(s, index, c >> 8, c);
    s[index++] = '-';
    hexToString(s, index, d, e);
    s[index++] = '-';
    hexToString(s, index, f, g);
    hexToString(s, index, h, i);
    hexToString(s, index, j, k);

    return cast(char[])s;
  }

  /**
   * Retrieves the hash code for this instance.
   * Returns: The hash code for this instance.
   */
  hash_t toHash() {
    return a ^ ((b >> 16) | c) ^ ((f << 24) | k);
  }

}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

enum /* VARENUM */ : ushort {
  //VT_EMPTY            = 0,
  //VT_NULL             = 1,
  //VT_I2               = 2,
  //VT_I4               = 3,
  //VT_R4               = 4,
  //VT_R8               = 5,
  VT_CY               = 6,
  VT_DATE             = 7,
  //VT_BSTR             = 8,
  VT_DISPATCH         = 9,
  //VT_ERROR            = 10,
  //VT_BOOL             = 11,
  VT_VARIANT          = 12,
  VT_UNKNOWN          = 13,
  VT_DECIMAL          = 14,
  VT_I1               = 16,
  //VT_UI1              = 17,
  VT_UI2              = 18,
  VT_UI4              = 19,
  VT_I8               = 20,
  VT_UI8              = 21,
  VT_INT              = 22,
  VT_UINT             = 23,
  VT_VOID             = 24,
  VT_HRESULT          = 25,
  VT_PTR              = 26,
  VT_SAFEARRAY        = 27,
  VT_CARRAY           = 28,
  VT_USERDEFINED      = 29,
  VT_LPSTR            = 30,
  VT_LPWSTR           = 31,
  VT_RECORD           = 36,
  VT_INT_PTR          = 37,
  VT_UINT_PTR         = 38,
  VT_FILETIME         = 64,
  VT_BLOB             = 65,
  VT_STREAM           = 66,
  VT_STORAGE          = 67,
  VT_STREAMED_OBJECT  = 68,
  VT_STORED_OBJECT    = 69,
  VT_BLOB_OBJECT      = 70,
  VT_CF               = 71,
  VT_CLSID            = 72,
  VT_VERSIONED_STREAM = 73,
  VT_BSTR_BLOB        = 0x0fff,
  VT_VECTOR           = 0x1000,
  VT_ARRAY            = 0x2000,
  //VT_BYREF            = 0x4000,
  //VT_RESERVED         = 0x8000
} alias ushort VARTYPE;

enum : short {
  VARIANT_TRUE = -1,
  VARIANT_FALSE = 0
} alias short VARIANT_BOOL;

/**
 * A container for many different types.
 */
struct DWINVARIANT {

  union {
    struct {
      /// Describes the type of the instance.
      VARTYPE vt;
      private {
        ushort wReserved1;
        ushort wReserved2;
        ushort wReserved3;
      }
      union {
        long llVal;
        int lVal;
        ubyte bVal;
        short iVal;
        float fltVal;
        double dblVal;
        VARIANT_BOOL boolVal;
        int scode;
        long cyVal;
        double date;
        wchar* bstrVal;
        IUnknown punkVal;
        IDispatch pdispVal;
        SAFEARRAY* parray;
        ubyte* pbVal;
        short* piVal;
        int* plVal;
        long* pllVal;
        float* pfltVal;
        double* pdblVal;
        VARIANT_BOOL* pboolVal;
        int* pscode;
        long* pcyVal;
        double* pdate;
        wchar** pbstrVal;
        IUnknown* ppunkVal;
        IDispatch* ppdispVal;
        SAFEARRAY** pparray;
        DWINVARIANT* pvarVal;
        void* byref;
        byte cVal;
        ushort uiVal;
        uint ulVal;
        ulong ullVal;
        int intVal;
        uint uintVal;
        DECIMAL* pdecVal;
        byte* pcVal;
        ushort* puiVal;
        uint* pulVal;
        ulong* pullVal;
        int* pintVal;
        uint* puintVal;
        struct {
          void* pvRecord;
          IRecordInfo pRecInfo;
        }
      }
    }
    DECIMAL decVal;
  }

  /**
   * Initializes a new instance using the specified _value and _type.
   * Params:
   *   value = A _value of one of the acceptable types.
   *   type = The VARTYPE identifying the _type of value.
   * Returns: The resulting VARIANT.
   */
  static DWINVARIANT opCall(T)(T value, VARTYPE type = VariantType!(T)) {
    static if (is(T E == enum)) {
      return opCall(cast(E)value, type);
    }
    else {
      DWINVARIANT self;
      self = value;
      if (type != self.vt)
        VariantChangeType(&self, &self, VARIANT_ALPHABOOL, type);

      return self;
    }
  }

  void opAssign(T)(T value) {
    if (vt != VT_EMPTY)
      clear();

    static if (is(T == VARIANT_BOOL)) boolVal = value;
    else static if (is(T == bool)) boolVal = value ? VARIANT_TRUE : VARIANT_FALSE;
    else static if (is(T == ubyte)) bVal = value;
    else static if (is(T == byte)) cVal = value;
    else static if (is(T == ushort)) uiVal = value;
    else static if (is(T == short)) iVal = value;
    else static if (is(T == uint)) ulVal = value;
    else static if (is(T == int)) lVal = value;
    else static if (is(T == ulong)) ullVal = value;
    else static if (is(T == long)) llVal = value;
    else static if (is(T == float)) fltVal = value;
    else static if (is(T == double)) dblVal = value;
    else static if (is(T == DECIMAL)) decVal = value;
    else static if (is(T : char[])) bstrVal = bstr.fromString(value);
    else static if (is(T : IDispatch)) pdispVal = value, value.AddRef();
    else static if (is(T : IUnknown)) punkVal = value, value.AddRef();
    else static if (is(T : Object)) byref = cast(void*)value;
    else static if (is(T == DWINVARIANT*)) pvarVal = value;
    else static if (is(T == SAFEARRAY*)) parray = value;
    else static if (isArray!(T)) parray = SAFEARRAY.from(value);
    else static assert(false, "'" ~ T.stringof ~ "' is not one of the allowed types.");

    vt = VariantType!(T);

    static if (is(T == SAFEARRAY*)) {
      VARTYPE type;
      SafeArrayGetVartype(value, type);
      vt |= type;
    }
  }

  /**
   * Clears the value of this instance and releases any associated memory.
   * See_Also: $(LINK2 http://msdn2.microsoft.com/en-us/library/ms221165.aspx, VariantClear).
   */
  void clear() {
    if (isCOMAlive && !(vt == VT_NULL || vt == VT_EMPTY))
      VariantClear(this);
  }

  void copyTo(out DWINVARIANT dest) {
    VariantCopy(&dest, this);
  }

  DWINVARIANT changeTo(VARTYPE newType) {
    DWINVARIANT ret;
    if (FAILED(VariantChangeType(&ret, this, VARIANT_ALPHABOOL, newType)))
      throw new InvalidCastException("Invalid cast.");
    return ret;
  }

  /**
   * Converts the value contained in this instance to a string.
   * Returns: A string representation of the value contained in this instance.
   */
  char[] toString() {
    if (vt == VT_NULL || vt == VT_EMPTY)
      return null;

    if (vt == VT_BSTR)
      return bstr.toString(bstrVal);

    DWINVARIANT temp;
    if (SUCCEEDED(VariantChangeType(&temp, this, VARIANT_ALPHABOOL | VARIANT_LOCALBOOL, VT_BSTR)))
      return bstr.toString(temp.bstrVal);

    return null;
  }
  
  /**
   * Returns the _value contained in this instance.
   */
  V value(V)() {
    //if (vt != VariantType!(V)) assert(false);

    static if (is(V == bool)) return (boolVal == VARIANT_TRUE) ? true : false;
    else static if (is(V == VARIANT_BOOL)) return boolVal;
    else static if (is(V == ubyte)) return bVal;
    else static if (is(V == byte)) return cVal;
    else static if (is(V == ushort)) return uiVal;
    else static if (is(V == short)) return iVal;
    else static if (is(V == uint)) return ulVal;
    else static if (is(V == int)) return lVal;
    else static if (is(V == ulong)) return ullVal;
    else static if (is(V == long)) return llVal;
    else static if (is(V == float)) return fltVal;
    else static if (is(V == double)) return dblVal;
    else static if (is(V == DECIMAL)) return decVal;
    else static if (is(V : char[])) return bstr.toString(bstrVal);
    else static if (is(V : IDispatch)) return cast(V)pdispVal;
    else static if (is(V : IUnknown)) return cast(V)punkVal;
    else static if (is(V : Object)) return cast(V)byref;
    else static if (is(V == DWINVARIANT*)) return pvarVal;
    else static if (is(V == SAFEARRAY*)) return parray;
    else static if (isArray!(V)) return parray.toArray!(typeof(*V))();
    else static assert(false, "'" ~ V.stringof ~ "' is not one of the allowed types.");
  }

}
//DWINVARIANT


/+
  /\*\[(uuid\(".*?"\))\]\*/
    replaced to:
  mixin($1);
  // static DWINGUID IID =
    replaced to:
  // static DWINGUID IID =
+/

/**
 * Associates a GUID with an interface.
 * Params: g = A string representing the GUID in normal registry format with or without the { } delimiters.
 * Examples:
 * ---
 * interface IXMLDOMDocument2 : IDispatch {
 *   mixin(uuid("2933bf95-7b36-11d2-b20e-00c04f983e60"));
 * }
 *
 * // Expands to the following code:
 * //
 * // interface IXMLDOMDocument2 : IDispatch {
 * //   static GUID IID = { 0x2933bf95, 0x7b36, 0x11d2, 0xb2, 0x0e, 0x00, 0xc0, 0x4f, 0x98, 0x3e, 0x60 };
 * // }
 * ---
 */
 

char[] uuid(char[] g) {
  if (g.length == 38) {
    assert(g[0] == '{' && g[$-1] == '}', "Incorrect format for GUID.");
    return uuid(g[1..$-1]);
  }
  else if (g.length == 36) {
    assert(g[8] == '-' && g[13] == '-' && g[18] == '-' && g[23] == '-', "Incorrect format for GUID.");
    return "static DWINGUID IID = { 0x" ~ g[0..8] ~ ",0x" ~ g[9..13] ~ ",0x" ~ g[14..18] ~ ",0x" ~ g[19..21] ~ ",0x" ~ g[21..23] ~ ",0x" ~ g[24..26] ~ ",0x" ~ g[26..28] ~ ",0x" ~ g[28..30] ~ ",0x" ~ g[30..32] ~ ",0x" ~ g[32..34] ~ ",0x" ~ g[34..36] ~ " };";
  }
  else assert(false, "Incorrect format for GUID.");
}


char[] uuid(char[] type, char[] g) {
  // Alternative form for module-level (global) declarations, eg: 
  //   mixin(uuid("IUnknown", "00000000-0000-0000-c000-000000000046"));
  // produces:
  //   GUID IID_IUnknown = { ... };
  //   template uuidof(T : IUnknown) { const GUID uuidof = IID_IUnknown; }

  if (g.length == 38) {
    assert(g[0] == '{' && g[$-1] == '}', "Incorrect format for GUID.");
    return uuid(type, g[1..$-1]);
  }
  else if (g.length == 36) {
    assert(g[8] == '-' && g[13] == '-' && g[18] == '-' && g[23] == '-', "Incorrect format for GUID.");
    return "const DWINGUID IID_" ~ type ~ " = { 0x" ~ g[0..8] ~ ",0x" ~ g[9..13] ~ ",0x" ~ g[14..18] ~ ",0x" ~ g[19..21] ~ ",0x" ~ g[21..23] ~ ",0x" ~ g[24..26] ~ ",0x" ~ g[26..28] ~ ",0x" ~ g[28..30] ~ ",0x" ~ g[30..32] ~ ",0x" ~ g[32..34] ~ ",0x" ~ g[34..36] ~ " };"\n ~
      "template uuidof(T : " ~ type ~ ") { const DWINGUID uuidof = IID_" ~ type ~ "; }";
  }
  else assert(false, "Incorrect format for GUID.");
}

/**
 * Retrieves the GUID associated with the specified variable or type.
 * Examples:
 * ---
 * import juno.com.core, 
 *   std.stdio;
 *
 * void main() {
 *   writefln("The GUID of IXMLDOMDocument2 is %s", uuidof!(IXMLDOMDocument2));
 * }
 *
 * // Produces:
 * // The GUID of IXMLDOMDocument2 is {2933bf95-7b36-11d2-b20e-00c04f983e60}
 * ---
 */
 
template uuidof(alias T) {
  const DWINGUID uuidof = uuidofT!(T); //typeof is not necessary
}

/**
 * ditto
 */
 
template uuidof(T) {
  const DWINGUID uuidof = uuidofT!(T);
}

template uuidofT(T : T) {
  static if (is(typeof(mixin("IID_" ~ T.stringof))))
    const DWINGUID uuidofT = mixin("IID_" ~ T.stringof); // e.g., IID_IShellFolder
  else static if (is(typeof(mixin("CLSID_" ~ T.stringof))))
    const DWINGUID uuidofT = mixin("CLSID_" ~ T.stringof); // e.g., CLSID_Shell
  else static if (is(typeof(T.IID)))
    const DWINGUID uuidofT = T.IID;
  else
    static assert(false, "No GUID has been associated with '" ~ T.stringof ~ "'.");
}


public DWINVARIANT toVariant(T)(T value, bool heapAlloc = false) {
  if (!heapAlloc)
    return DWINVARIANT(value);
  else return (new class(value) {
    DWINVARIANT var;
    this(T value) {
      var = DWINVARIANT(value);
    }
    ~this() {
      var.clear();
    }
  }).var;
}



//from oaidl
enum SYSKIND {
  SYS_WIN16,
  SYS_WIN32,
  SYS_MAC,
  SYS_WIN64
}
struct TLIBATTR {
  DWINGUID guid;
  uint lcid;
  SYSKIND syskind;
  ushort wMajorVerNum;
  ushort wMinorVerNum;
  ushort wLibFlags;
}    

struct SAFEARRAYBOUND {
  uint cElements;
  int lLbound;
}

struct ARRAYDESC {
  TYPEDESC tdescElem;
  ushort cDims;
  SAFEARRAYBOUND[1] rgbounds;
}

struct TYPEDESC {
  union {
    TYPEDESC* lptdesc;
    ARRAYDESC* lpadesc;
    uint hreftype;
  }
  VARTYPE vt;
}

    struct ELEMDESC {
      TYPEDESC tdesc;
      union {
        IDLDESC idldesc;
        PARAMDESC paramdesc;
      }
    }

    struct PARAMDESCEX {
      uint cBytes;
      DWINVARIANT varDefaultValue;
    }    
    
    struct PARAMDESC {
      PARAMDESCEX* pparamdescex;
      ushort wParamFlags;
    }    

struct IDLDESC {
  uint dwReserved;
  ushort wIDLFlags;
}

enum FUNCKIND {
  FUNC_VIRTUAL,
  FUNC_PUREVIRTUAL,
  FUNC_NONVIRTUAL,
  FUNC_STATIC,
  FUNC_DISPATCH
}    

enum INVOKEKIND {
  INVOKE_FUNC = 1,
  INVOKE_PROPERTYGET = 2,
  INVOKE_PROPERTYPUT = 4,
  INVOKE_PROPERTYPUTREF = 8
}

enum CALLCONV {
  CC_FASTCALL,
  CC_CDECL,
  CC_MSPASCAL,
  CC_PASCAL = CC_MSPASCAL,
  CC_MACPASCAL,
  CC_STDCALL,
  CC_FPFASTCALL,
  CC_SYSCALL,
  CC_MPWCDECL,
  CC_MPWPASCAL
}
    struct FUNCDESC {
      int memid;
      int* lprgscode;
      ELEMDESC* lprgelemdescParam;
      FUNCKIND funckind;
      INVOKEKIND invkind;
      CALLCONV callconv;
      short cParams;
      short cParamsOpt;
      short oVft;
      short cScodes;
      ELEMDESC elemdescFunc;
      ushort wFuncFlags;
    }
    
struct EXCEPINFO {
  ushort wCode;
  ushort wReserved;
  wchar* bstrSource;
  wchar* bstrDescription;
  wchar* bstrHelpFile;
  uint dwHelpContext;
  void* pvReserved;
  int function(EXCEPINFO*) pfnDeferredFillIn;
  int scode;
}    

enum VARKIND {
  VAR_PERSISTANCE,
  VAR_STATIC,
  VAR_CONST,
  VAR_DISPATCH
}  

struct VARDESC {
  int memid;
  wchar* lpstrSchema;
  union {
    uint oInst;
    DWINVARIANT* lpvarValue;
  }
  ELEMDESC elemdescVar;
  ushort wVarFlags;
  VARKIND varkind;
}

struct DISPPARAMS {
  DWINVARIANT* rgvarg;
  int* rgdispidNamedArgs;
  uint cArgs;
  uint cNamedArgs;
}

enum TYPEKIND {
  TKIND_ENUM,
  TKIND_RECORD,
  TKIND_MODULE,
  TKIND_INTERFACE,
  TKIND_DISPATCH,
  TKIND_COCLASS,
  TKIND_ALIAS,
  TKIND_UNION
}

struct TYPEATTR {
  DWINGUID guid;
  uint lcid;
  uint dwReserved;
  int memidConstructor;
  int memidDestructor;
  wchar* lpstrSchema;
  uint cbSizeInstance;
  TYPEKIND typekind;
  ushort cFuncs;
  ushort cVars;
  ushort cImplTypes;
  ushort cbSizeVft;
  ushort cbAlignment;
  ushort wTypeFlags;
  ushort wMajorVerNum;
  ushort wMinorVerNum;
  TYPEDESC tdescAlias;
  IDLDESC idldescType;
}
//ITypeComp
enum DESCKIND {
  DESCKIND_NONE,
  DESCKIND_FUNCDESC,
  DESCKIND_VARDESC,
  DESCKIND_TYPECOMP,
  DESCKIND_IMPLICITAPPOBJ
}
//ITypeComp
struct BINDPTR {
  FUNCDESC* lpfuncdesc;
  VARDESC* lpvardesc;
  ITypeComp lptcomp;
}
    //defined in oaidl, com.Core
    enum {
      DISPID_UNKNOWN = -1,
      DISPID_VALUE = 0,
      DISPID_PROPERTYPUT = -3,
      DISPID_NEWENUM = -4,
      DISPID_EVALUATE = -5,
      DISPID_CONSTRUCTOR = -6,
      DISPID_DESTRUCTOR = -7,
      DISPID_COLLECT = -8
    }
  
//propvariant, defined in propidl.h
struct VERSIONEDSTREAM {
  DWINGUID guidVersion;
  IStream pStream;
}

//defined in propidl.h, used by PROPVARIANT
//com.Core
/*
struct CAPROPVARIANT {
  uint cElems;
  PROPVARIANT* pElems;
}
*/

//defined in propidl.h, used by PROPVARIANT
//com.Core
struct CACLSID {
  uint cElems;
  DWINGUID* pElems;
}    

//defined in objidl, used by CoCreateInstanceEx
struct MULTI_QI {
  DWINGUID* pIID;
  IUnknown pItf;
  int hr;
}

//defined objidl, used by ComStream
    struct STATSTG {
      wchar* pwcsName;
      uint type;
      ulong cbSize;
      FILETIME mtime;
      FILETIME ctime;
      FILETIME atime;
      uint grfMode;
      uint grfLocksSupported;
      DWINGUID clsid;
      uint grfStateBits;
      uint reserved;
    }
     //objidl used by ComStream   
    enum : uint {
      STGTY_STORAGE = 1,
      STGTY_STREAM = 2,
      STGTY_LOCKBYTES = 3,
      STGTY_PROPERTY = 4
    }    
    
    //objidl
    
    enum : uint {
      STREAM_SEEK_SET,
      STREAM_SEEK_CUR,
      STREAM_SEEK_END
    }
    
    //objidl
    struct COAUTHIDENTITY {
      wchar* User;
      uint UserLength;
      wchar* Domain;
      uint DomainLength;
      wchar* Password;
      uint PasswordLength;
    }

    struct COAUTHINFO {
      uint dwAuthnSvc;
      uint dwAuthzSvc;
      wchar* pwszServerPrincName;
      uint dwAuthnLevel;
      uint dwImpersonationLevel;
      COAUTHIDENTITY* pAuthIdentityData;
      uint dwCapabilities;
    }


    //defined in objidl    
    struct COSERVERINFO {
      uint dwReserved1;
      wchar* pwszName;
      COAUTHINFO* pAuthInfo;
      uint dwReserved2;
    }
          
    
    //defined in wtypes
enum : uint {
  CLSCTX_INPROC_SERVER = 0x1,
  CLSCTX_INPROC_HANDLER = 0x2,
  CLSCTX_LOCAL_SERVER = 0x4,
  CLSCTX_INPROC_SERVER16 = 0x8,
  CLSCTX_REMOTE_SERVER = 0x10,
  CLSCTX_INPROC_HANDLER16 = 0x20,
  CLSCTX_INPROC = CLSCTX_INPROC_SERVER | CLSCTX_INPROC_HANDLER,
  CLSCTX_SERVER = CLSCTX_INPROC_SERVER | CLSCTX_LOCAL_SERVER | CLSCTX_REMOTE_SERVER,
  CLSCTX_ALL = CLSCTX_INPROC_SERVER | CLSCTX_INPROC_HANDLER | CLSCTX_LOCAL_SERVER | CLSCTX_REMOTE_SERVER
}    

    //oleauto
    enum : ushort {
      DISPATCH_METHOD         = 0x1,
      DISPATCH_PROPERTYGET    = 0x2,
      DISPATCH_PROPERTYPUT    = 0x4,
      DISPATCH_PROPERTYPUTREF = 0x8
    }

//used by invokeMethod
enum DispatchFlags : ushort {
  InvokeMethod    = DISPATCH_METHOD,
  GetProperty     = DISPATCH_PROPERTYGET,
  PutProperty     = DISPATCH_PROPERTYPUT,
  PutRefProperty  = DISPATCH_PROPERTYPUTREF
} 

enum {
  DISP_E_UNKNOWNINTERFACE = 0x80020001,
  DISP_E_MEMBERNOTFOUND   = 0x80020003,
  DISP_E_PARAMNOTFOUND    = 0x80020004,
  DISP_E_TYPEMISMATCH     = 0x80020005,
  DISP_E_UNKNOWNNAME      = 0x80020006,
  DISP_E_NONAMEDARGS      = 0x80020007,
  DISP_E_BADVARTYPE       = 0x80020008,
  DISP_E_EXCEPTION        = 0x80020009,
  DISP_E_BADPARAMCOUNT    = 0x8002000E
}

    //oelauto
    enum : uint {
      VARIANT_NOVALUEPROP = 0x1,
      VARIANT_ALPHABOOL = 0x2,
      VARIANT_NOUSEROVERRIDE = 0x4,
      VARIANT_CALENDAR_HIJRI = 0x8,
      VARIANT_LOCALBOOL = 0x10,
      VARIANT_CALENDAR_THAI = 0x20,
      VARIANT_CALENDAR_GREGORIAN = 0x40,
      VARIANT_USE_NLS = 0x80
    }  

extern(Windows)
{
    //oleauto.d
    SAFEARRAY* SafeArrayCreate(VARTYPE vt, uint cDims, SAFEARRAYBOUND* rgsabound);
    int SafeArrayAccessData(SAFEARRAY* psa, void** ppvData);
    int SafeArrayUnaccessData(SAFEARRAY* psa);
    int SafeArrayGetVartype(SAFEARRAY* psa, out VARTYPE pvt);
    int SafeArrayDestroy(SAFEARRAY* psa);
    int SafeArrayRedim(SAFEARRAY* psa, SAFEARRAYBOUND* psaboundNew);
    int SafeArrayGetUBound(SAFEARRAY* psa, uint cDim, out int plUbound);
    int SafeArrayGetLBound(SAFEARRAY* psa, uint cDim, out int plLbound);
    int SafeArrayLock(SAFEARRAY* psa);
    int SafeArrayUnlock(SAFEARRAY* psa);

    //objbase.d
    int CoCreateGuid(out DWINGUID pguid);
    int CoCreateInstance(ref DWINGUID rclsid, IUnknown pUnkOuter, uint dwClsContext, ref DWINGUID riid, void** ppv);
    int CoCreateInstanceEx(ref DWINGUID rclsid, IUnknown pUnkOuter, uint dwClsContext, COSERVERINFO* pServerInfo, uint dwCount, MULTI_QI* pResults);
    int CLSIDFromProgID(wchar* lpszProgID, out DWINGUID lpclsid);

    //oleauto
    int GetActiveObject(ref DWINGUID rclsid, void* pvReserved, out IUnknown ppunk);
    int VariantClear(DWINVARIANT* pvarg);
    int VariantCopy(DWINVARIANT* pvargDest, in DWINVARIANT* pvargSrc);
    int VariantChangeType(DWINVARIANT* pvargDest, in DWINVARIANT* pvarSrc, ushort wFlags, VARTYPE vt);
    int VariantChangeTypeEx(DWINVARIANT* pvargDest, in DWINVARIANT* pvarSrc, uint lcid, ushort wFlags, VARTYPE vt);
int VarDecFromUI4(uint ulIn, out DECIMAL pdecOut);
int VarDecFromI4(int lIn, out DECIMAL pdecOut);
int VarDecFromUI8(ulong ui64In, out DECIMAL pdecOut);
int VarDecFromI8(long i64In, out DECIMAL pdecOut);
int VarDecFromR4(float dlbIn, out DECIMAL pdecOut);
int VarDecFromR8(double dlbIn, out DECIMAL pdecOut);
int VarDecFromStr(in wchar* StrIn, uint lcid, uint dwFlags, out DECIMAL pdecOut);
int VarBstrFromDec(in DECIMAL* pdecIn, uint lcid, uint dwFlags, out wchar* pbstrOut);
int VarUI4FromDec(in DECIMAL* pdecIn, out uint pulOut);
int VarI4FromDec(in DECIMAL* pdecIn, out int plOut);
int VarUI8FromDec(in DECIMAL* pdecIn, out ulong pui64Out);
int VarI8FromDec(in DECIMAL* pdecIn, out long pi64Out);
int VarR8FromDec(in DECIMAL* pdecIn, out double pdblOut);   

int VarDecAdd(DECIMAL* pdecLeft, DECIMAL* pdecRight, DECIMAL* pdecResult);
int VarDecSub(DECIMAL* pdecLeft, DECIMAL* pdecRight, DECIMAL* pdecResult);
int VarDecMul(DECIMAL* pdecLeft, DECIMAL* pdecRight, DECIMAL* pdecResult);
int VarDecDiv(DECIMAL* pdecLeft, DECIMAL* pdecRight, DECIMAL* pdecResult);
int VarDecRound(DECIMAL* pdecIn, int cDecimals, DECIMAL* pdecResult);
int VarDecAbs(DECIMAL* pdecIn, DECIMAL* pdecResult);
int VarDecFix(DECIMAL* pdecIn, DECIMAL* pdecResult);
int VarDecInt(DECIMAL* pdecIn, DECIMAL* pdecResult);
int VarDecNeg(DECIMAL* pdecIn, DECIMAL* pdecResult);
int VarDecCmp(DECIMAL* pdecLeft, DECIMAL* pdecRight);
    
    
    //int PropVariantCopy(PROPVARIANT* pvarDest, in PROPVARIANT* pvarSrc);//ole32.lib origin is dllimport version, by d-programming-language-china.org 20071005
    //int PropVariantToBSTR(PROPVARIANT* propvar, wchar** pbstrOut);    
    
}

    enum : ushort {
      FADF_AUTO = 0x1,
      FADF_STATIC = 0x2,
      FADF_EMBEDDED = 0x4,
      FADF_FIXEDSIZE = 0x10,
      FADF_RECORD = 0x20,
      FADF_HAVEIID = 0x40,
      FADF_HAVEVARTYPE = 0x80,
      FADF_BSTR = 0x100,
      FADF_UNKNOWN = 0x200,
      FADF_DISPATCH = 0x400,
      FADF_VARIANT = 0x800,
      FADF_RESERVED = 0xF008
    }

//
struct SAFEARRAY {

  ushort cDims;
  ushort fFeatures;
  uint cbElements;
  uint cLocks;
  void* pvData;
  SAFEARRAYBOUND[1] rgsabound;

  static SAFEARRAY* opCall(T...)(T values) {
    static if (T.length == 1 && isArray!(T)) {
      return fromArray(values, false);
    }
    else {
      auto bound = SAFEARRAYBOUND(values.length);
      auto sa = SafeArrayCreate(VT_VARIANT, 1, &bound);

      DWINVARIANT* data;
      SafeArrayAccessData(sa, outval(data));
      foreach (i, value; values)
        data[i] = DWINVARIANT(value);
      SafeArrayUnaccessData(sa);

      return sa;
    }
  }

  static SAFEARRAY* fromArray(T)(T[] array, bool wrap = false) {
    VARTYPE vt;
    if (wrap) vt = VT_VARIANT;
    else      vt = VariantType!(T);

    auto bound = SAFEARRAYBOUND(array.length);
    auto sa = SafeArrayCreate(vt, 1, &bound);

    if (wrap) {
      DWINVARIANT* data;
      SafeArrayAccessData(sa, outval(data));
      for (int i = 0; i < array.length; i++) {
        data[i] = DWINVARIANT(array[i]);
      }
      SafeArrayUnaccessData(sa);
    }
    else {
      // Strings are stored as BSTRs
      static if (is(T : char[]))  alias wchar* Type;
      else                        alias T Type;

      Type* data;
      SafeArrayAccessData(sa, outval(data));
      for (int i = 0; i < array.length; i++) {
        static if (is(T : char[]))  data[i] = bstr.fromString(array[i]);
        else                        data[i] = array[i];
      }
      SafeArrayUnaccessData(sa);
    }

    return sa;
  }

  void destroy() {
    SafeArrayDestroy(this);
  }

  void resize(int newSize) {
    auto bound = SAFEARRAYBOUND(newSize);
    SafeArrayRedim(this, &bound);
  }

  T[] toArray(T)() {
    int upperBound, lowerBound;
    SafeArrayGetUBound(this, 1, upperBound);
    SafeArrayGetLBound(this, 1, lowerBound);
    int count = upperBound - lowerBound + 1;

    if (count == 0) return null;

    T[] result = new T[count];

    if ((fFeatures & FADF_VARIANT) != 0) {
      DWINVARIANT* data;
      SafeArrayAccessData(this, outval(data));
      for (int i = lowerBound; i <= upperBound; i++) {
        static if (is(T == DWINVARIANT)) result[i] = data[i];
        else {
          auto val = data[i];
          if (val.vt != VariantType!(T))
            val = val.changeTo(VariantType!(T));
          result[i] = val.value!(T);
        }
      }
      SafeArrayUnaccessData(this);
    }
    else {
      static if (is(T : char[]))  alias wchar* Type;
      else                        alias T Type;

      Type* data;
      SafeArrayAccessData(this, outval(data));
      for (int i = lowerBound; i <= upperBound; i++) {
        static if (is(T : char[]))
          result[i] = bstr.toString(data[i]);
        else
          result[i] = data[i];
      }
      SafeArrayUnaccessData(this);
    }

    return result;
  }

  void lock() {
    SafeArrayLock(this);
  }

  void unlock() {
    SafeArrayUnlock(this);
  }

  int length() {
    int upperBound, lowerBound;
    SafeArrayGetUBound(this, 1, upperBound);
    SafeArrayGetLBound(this, 1, lowerBound);
    return upperBound - lowerBound + 1;
  }

}
//
const ubyte DECIMAL_NEG = 0x80;
struct DECIMAL {

  ushort wReserved;
  ubyte scale;
  ubyte sign;
  uint Hi32;
  uint Lo32;
  uint Mid32;

  static DECIMAL min = { 0, 0, DECIMAL_NEG, uint.max, uint.max, uint.max };
  static DECIMAL max = { 0, 0, 0, uint.max, uint.max, uint.max };
  static DECIMAL minusOne = { 0, 0, DECIMAL_NEG, 0, 1, 0 };
  static DECIMAL zero = { 0, 0, 0, 0, 0, 0 };
  static DECIMAL one = { 0, 0, 0, 0, 1, 0 };

  static DECIMAL opCall(T)(T value) {
    DECIMAL self;

    static if (is(T == uint)) VarDecFromUI4(value, self);
    else static if (is(T == int)) VarDecFromI4(value, self);
    else static if (is(T == ulong)) VarDecFromUI8(value, self);
    else static if (is(T == long)) VarDecFromI8(value, self);
    else static if (is(T == float)) VarDecFromR4(value, self);
    else static if (is(T == double)) VarDecFromR8(value, self);
    else static assert(false);

    return self;
  }

  static DECIMAL opCall(T = void)(uint lo, uint mid, uint hi, bool isNegative, ubyte scale) {
    DECIMAL self;
    self.Hi32 = hi, self.Mid32 = mid, self.Lo32 = lo, self.scale = scale, self.sign = isNegative ? DECIMAL_NEG : 0;
    return self;
  }

  int opCmp(DECIMAL d) {
    return VarDecCmp(this, &d) - 1;
  }

  bool opEquals(DECIMAL d) {
    return opCmp(d) == 0;
  }

  DECIMAL opAdd(DECIMAL d) {
    DECIMAL ret;
    VarDecAdd(this, &d, &ret);
    return ret;
  }

  void opAddAssign(DECIMAL d) {
    *this = *this + d;
  }

  DECIMAL opSub(DECIMAL d) {
    DECIMAL ret;
    VarDecSub(this, &d, &ret);
    return ret;
  }

  void opSubAssign(DECIMAL d) {
    *this = *this - d;
  }

  DECIMAL opMul(DECIMAL d) {
    DECIMAL ret;
    VarDecMul(this, &d, &ret);
    return ret;
  }

  void opMulAssign(DECIMAL d) {
    *this = *this * d;
  }

  DECIMAL opDiv(DECIMAL d) {
    DECIMAL ret;
    VarDecDiv(this, &d, &ret);
    return ret;
  }

  void opDivAssign(DECIMAL d) {
    *this = *this / d;
  }

  DECIMAL opMod(DECIMAL d) {
    return remainder(*this, d);
  }

  void opModAssign(DECIMAL d) {
    *this = *this % d;
  }

  DECIMAL opNeg() {
    DECIMAL ret;
    VarDecNeg(this, &ret);
    return ret;
  }

  DECIMAL opPos() {
    return *this;
  }

  DECIMAL opPostInc() {
    return *this = *this + cast(DECIMAL)1;
  }

  DECIMAL opPostDec() {
    return *this = *this - cast(DECIMAL)1;
  }

  static DECIMAL abs(DECIMAL d) {
    DECIMAL ret;
    VarDecAbs(&d, &ret);
    return ret;
  }

  static DECIMAL round(DECIMAL d, int decimals = 0) {
    DECIMAL ret;
    VarDecRound(&d, decimals, &ret);
    return ret;
  }

  static DECIMAL floor(DECIMAL d) {
    DECIMAL ret;
    VarDecInt(&d, &ret);
    return ret;
  }

  static DECIMAL truncate(DECIMAL d) {
    DECIMAL ret;
    VarDecFix(&d, &ret);
    return ret;
  }

  static DECIMAL remainder(DECIMAL d1, DECIMAL d2) {
    if (abs(d1) < abs(d2))
      return d1;

    d1 -= d2;

    DECIMAL dr = truncate(d1 / d2);
    DECIMAL mr = dr * d2;
    DECIMAL r = d1 - mr;

    if (d1.sign != r.sign && r != cast(DECIMAL)0)
      r += d2;

    return r;
  }

  static DECIMAL parse(char[] s) {
    DECIMAL d;
    VarDecFromStr(toUTF16z(s), 0, 0, d);
    return d;
  }

  hash_t toHash() {
    double d;
    VarR8FromDec(this, d);
    if (d == 0)
      return 0;
    return (cast(int*)&d)[0] ^ (cast(int*)&d)[1];
  }

  char[] toString() {
    wchar* str;
    if (VarBstrFromDec(this, 0, 0, str) != S_OK)
      return null;
    return bstr.toString(str);
  }

}

enum {
  SELFREG_E_FIRST = tMAKE_SCODE!(SEVERITY_ERROR, FACILITY_ITF, 0x0200),
  SELFREG_E_LAST = tMAKE_SCODE!(SEVERITY_ERROR, FACILITY_ITF, 0x020F),
  SELFREG_S_FIRST = tMAKE_SCODE!(SEVERITY_SUCCESS, FACILITY_ITF, 0x0200),
  SELFREG_S_LAST = tMAKE_SCODE!(SEVERITY_SUCCESS, FACILITY_ITF, 0x020F),
  SELFREG_E_TYPELIB = SELFREG_E_FIRST,
  SELFREG_E_CLASS = SELFREG_E_FIRST + 1
}

enum : VARIANT_BOOL {
  com_true = VARIANT_TRUE,
  com_false = VARIANT_FALSE
} alias VARIANT_BOOL com_bool;


struct CAC {
  uint cElems;
  byte* pElems;
}

struct CAUB {
  uint cElems;
  ubyte* pElems;
}

struct CAI {
  uint cElems;
  short* pElems;
}

struct CAUI {
  uint cElems;
  ushort* pElems;
}

struct CAL {
  uint cElems;
  int* pElems;
}

struct CAUL {
  uint cElems;
  uint* pElems;
}

struct CAFLT {
  uint cElems;
  float* pElems;
}

struct CADBL {
  uint cElems;
  double* pElems;
}

struct CACY {
  uint cElems;
  long* pElems;
}

struct CADATE {
  uint cElems;
  double* pElems;
}

struct CABSTR {
  uint cElems;
  wchar** pElems;
}

struct CABSTRBLOB {
  uint cElems;
  BSTRBLOB* pElems;
}

struct CABOOL {
  uint cElems;
  VARIANT_BOOL* pElems;
}

struct CASCODE {
  uint cElems;
  int* pElems;
}


struct CAH {
  uint cElems;
  long* pElems;
}

struct CAUH {
  uint cElems;
  ulong* pElems;
}


struct CAFILETIME {
  uint cElems;
  FILETIME* pElems;
}

struct BSTRBLOB {
  uint cbSize = BSTRBLOB.sizeof;
  ubyte* pBlobData;
}

/*
struct PROPVARIANT {

  union {
    struct {
      VARTYPE vt;
      ushort wReserved1;
      ushort wReserved2;
      ushort wReserved3;
      union {
        ubyte cVal;
        byte bVal;
        short iVal;
        ushort uiVal;
        int lVal;
        uint ulVal;
        int intVal;
        uint uintVal;
        long hVal;
        ulong uhVal;
        float fltVal;
        double dblVal;
        VARIANT_BOOL boolVal;
        int scode;
        long cyVal;
        double date;
        FILETIME filetime;
        DWINGUID* puuid;
        wchar* bstrVal;
        BSTRBLOB bstrblobVal;
        BLOB blob;
        char* pszVal;
        wchar* pwszVal;
        IUnknown punkVal;
        IDispatch pdispVal;
        IStream pStream;
        IStorage pStorage;
        VERSIONEDSTREAM* pVersionedStream;
        SAFEARRAY* parray;
        CAC cac;
        CAUB caub;
        CAI cai;
        CAUI caui;
        CAL cal;
        CAUL caul;
        CAH cah;
        CAUH cauh;
        CAFLT caflt;
        CADBL cadbl;
        CABOOL cabool;
        CASCODE cascode;
        CACY cacy;
        CADATE cadate;
        CAFILETIME cafiletime;
        CACLSID cauuid;
        CABSTR cabstr;
        CABSTRBLOB cabstrblob;
        CAPROPVARIANT capropvar;
        byte* pcVal;
        ubyte* pbVal;
        short* piVal;
        ushort* puiVal;
        int* plVal;
        uint* pulVal;
        int* pintVal;
        uint* puintVal;
        float* pfltVal;
        double pdblVal;
        VARIANT_BOOL* pboolVal;
        DECIMAL* pdecVal;
        int* pscode;
        long* pcyVal;
        double* pdate;
        wchar** pbstrVal;
        IUnknown* ppunkVal;
        IDispatch* ppdispVal;
        SAFEARRAY** pparray;
        PROPVARIANT* pvarVal;
      }
    }
    DECIMAL decVal;
  }

  public static PROPVARIANT opCall(T)(T value, VARTYPE type = VariantType!(T)) {
    PROPVARIANT v;
    v.vt = type;

    static if (is(T == ubyte))
      v.bVal = value;
    else static if (is(T == byte))
      v.cVal = value;
    else static if (is(T == ushort))
      v.uiVal = value;
    else static if (is(T == short))
      v.iVal = value;
    else static if (is(T == uint))
      v.ulVal = value;
    else static if (is(T == int))
      v.lVal = value;
    else static if (is(T == ulong))
      v.ullVal = value;
    else static if (is(T == long))
      v.llVal = value;
    else static if (is(T == float))
      v.fltValue = value;
    else static if (is(T == double))
      v.dblVal = value;
    else static if(is(T == DECIMAL))
      v.decVal = value;
    else static if (is(T : IDispatch))
      v.pdispVal = value, value.AddRef();
    else static if (is(T : IUnknown))
      v.punkVal = value, value.AddRef();
    else static if (is(T : Object))
      v.byref = cast(void*)value;
    else static if(is(T E == enum))
      v = DWINVARIANT(cast(E)value);
    else static if(is(T == bool))
      v.boolVal = (value == true) ? VARIANT_TRUE : VARIANT_FALSE;
    else static if (is(T : char[]))
      v.bstrVal = bstr.fromString(value);
    else static assert(false, "The type '" ~ T.stringof ~ "' must be one of the allowed types.");

    return v;
  }

  public void copyTo(out PROPVARIANT dest) {
    PropVariantCopy(&dest, this);
  }

  public char[] toString() {
    if (vt == VT_BSTR)
      return bstr.toString(bstrVal);

    wchar* bstring;
    PropVariantToBSTR(this, &bstring);  // no propsys.lib file for this function, March 3, 2011
    return bstr.toString(bstring);
  }

}
*/


////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

extern(D):

/**
 * Speciifes whether to throw exceptions or return null when COM operations fail.
 */
enum ExceptionPolicy {
  NoThrow, /// Returns null on failure.
  Throw    /// Throws an exception on failure.
}

template com_cast_impl(T, ExceptionPolicy policy) {

  T com_cast_impl(U)(U obj) {
    static if (is(U : IUnknown)) {
      if (obj is null) {
        static if (policy == ExceptionPolicy.Throw)
          throw new ArgumentNullException("obj");
        else
          return null;
      }

      T result;
      if (SUCCEEDED(obj.QueryInterface(uuidof!(T), outval(result))))
        return result;

      static if (policy == ExceptionPolicy.Throw)
        throw new InvalidCastException("Invalid cast from '" ~ U.stringof ~ "' to '" ~ T.stringof ~ "'.");
      else
        return null;
    }
    else static if (is(U == DWINVARIANT)) {
      const type = VariantType!(T);
      static if (type != VT_VOID) {
        DWINVARIANT temp;
        if (VariantChangeType(&temp, &obj, VARIANT_ALPHABOOL, type) == S_OK) {
          with (temp) {
            static if (type == VT_BOOL) {
              static if (is(T == bool)) return (boolVal == VARIANT_TRUE) ? true : false;
              else return boolVal;
            }
            else static if (type == VT_UI1) return bVal;
            else static if (type == VT_I1) return cVal;
            else static if (type == VT_UI2) return uiVal;
            else static if (type == VT_I2) return iVal;
            else static if (type == VT_UI4) return ulVal;
            else static if (type == VT_I4) return lVal;
            else static if (type == VT_UI8) return ullVal;
            else static if (type == VT_I8) return llVal;
            else static if (type == VT_R4) return fltVal;
            else static if (type == VT_R8) return dblVal;
            else static if (type == VT_DECIMAL) return decVal;
            else static if (type == VT_BSTR) {
              static if (is(T : char[])) return bstr.toString(bstrVal);
              else return bstrVal;
            }
            else static if (type == VT_UNKNOWN) return com_cast_impl(obj.punkVal);
            else static if (type == VT_DISPATCH) return com_cast_impl(obj.pdispVal);
            else return T.init;
          }
        }
        else static if (policy == ExceptionPolicy.Throw)
          throw new InvalidCastException("Invalid cast from '" ~ U.stringof ~ "' to '" ~ T.stringof ~ "'.");
        else return T.init;
      }
      else static assert(false, "Cannot cast from '" ~ U.stringof ~ "' to '" ~ T.stringof ~ "'.");
    }
    else static assert(false, "Cannot cast from '" ~ U.stringof ~ "' to '" ~ T.stringof ~ "'.");
  }

}

/**
 * Invokes the conversion operation to convert from one COM type to another.
 *
 * If the operand is a VARIANT, this function converts its value to the type represented by $(I T). If the operand is an IUnknown-derived object, this function 
 * calls the object's QueryInterface method. If the conversion operation fails, the function returns T.init.
 *
 * Examples:
 * ---
 * // C++
 * bool tryToMeow(Dog* dog) {
 *   Cat* cat = NULL;
 *   HRESULT hr = dog->QueryInterface(IID_Cat, static_cast<void**>(&cat));
 *   if (hr == S_OK) {
 *     hr = cat->meow();
 *     cat->Release();
 *   }
 *   return hr == S_OK;
 * }
 *
 * // C#
 * bool tryToMeow(Dog dog) {
 *   Cat cat = dog as Cat;
 *   if (cat != null)
 *     return cat.meow();
 *   return false;
 * }
 *
 * // D
 * bool tryToMeow(Dog dog) {
 *   if (auto cat = com_cast!(Cat)(dog)) {
 *     scope(exit) cat.Release();
 *     return cat.meow() == S_OK;
 *   }
 *   return false;
 * }
 * ---
 */
template com_cast(T) {
  alias com_cast_impl!(T, ExceptionPolicy.NoThrow) com_cast;
}

/**
 */
template safe_com_cast(T) {
  alias com_cast_impl!(T, ExceptionPolicy.Throw) safe_com_cast;
}


/**
 * Indicates the execution contexts in which a COM object is to be run.
 */
enum ExecutionContext : uint {
  InProcessServer = CLSCTX_INPROC_SERVER,   ///
  InProcessHandler = CLSCTX_INPROC_HANDLER, ///
  LocalServer = CLSCTX_LOCAL_SERVER,        ///
  RemoteServer = CLSCTX_REMOTE_SERVER,      ///
  All = CLSCTX_ALL                          ///
}

IUnknown coCreateInstance(DWINGUID clsid, IUnknown outer, ExecutionContext context, DWINGUID iid) {
  IUnknown ret;
  if (SUCCEEDED(CoCreateInstance(clsid, outer, cast(uint)context, iid, outval(ret))))
    return ret;
  return null;
}

/**
 * Returns a reference to a running object that has been registered with OLE.
 * See_Also: $(LINK2 http://msdn2.microsoft.com/en-us/library/ms221467.aspx, GetActiveObject).
 */
IUnknown getActiveObject(char[] progId) {
  DWINGUID clsid;
  wchar* str = bstr.fromString(progId);
  CLSIDFromProgID(str, clsid);
  bstr.free(str);

  IUnknown obj = null;
  if (SUCCEEDED(GetActiveObject(clsid, null, obj)))
    return obj;

  return null;
}


///
template coCreate(T, ExceptionPolicy policy = ExceptionPolicy.NoThrow) {

  /**
   * Creates a COM object of the class associated with the specified CLSID.
   * Params:
   *   clsid = A CLSID associated with the coclass that will be used to create the object.
   *   context = The _context in which to run the code that manages the new object with run.
   * Returns: A reference to the interface identified by T.
   * Examples:
   * ---
   * if (auto doc = coCreate!(IXMLDOMDocument3)(DOMDocument60.CLSID)) {
   *   scope(exit) doc.Release();
   * }
   * ---
   */
  T coCreate(U)(U clsid, ExecutionContext context = ExecutionContext.InProcessServer) {
    DWINGUID guid;
    static if (is(U == DWINGUID))
      guid = clsid;
    else static if (is(U : string)) {
      try {
        guid = DWINGUID(clsid);
      }
      catch (FormatException) {
        int hr = CLSIDFromProgID(clsid.toUTF16z(), guid);
        if (FAILED(hr)) {
          static if (policy == ExceptionPolicy.Throw)
            throw new COMException(hr);
          else
            return null;
        }
      }
    }

    T ret;
    int hr = CoCreateInstance(guid, null, context, uuidof!(T), outval(ret));

    if (FAILED(hr)) {
      static if (policy == ExceptionPolicy.Throw)
        throw new COMException(hr);
      else
        return null;
    }

    return ret;
  }

}



template coCreateEx(T, ExceptionPolicy policy = ExceptionPolicy.NoThrow) {

  T coCreateEx(U)(U clsid, string server, ExecutionContext context = ExecutionContext.InProcessServer) {
    DWINGUID guid;
    static if (is(U == DWINGUID))
      guid = clsid;
    else static if (is(U : string)) {
      try {
        guid = DWINGUID(clsid);
      }
      catch (FormatException) {
        int hr = CLSIDFromProgID(clsid.toUTF16z(), guid);
        if (FAILED(hr)) {
          static if (policy == ExceptionPolicy.Throw)
            throw new COMException(hr);
          else
            return null;
        }
      }
    }

    COSERVERINFO csi;
    csi.pwszName = server.toUTF16z();

    MULTI_QI ret;
    ret.pIID = &uuidof!(T);
    int hr = CoCreateInstanceEx(guid, null, context, &csi, 1, &ret);

    if (FAILED(hr)) {
      static if (policy == ExceptionPolicy.Throw)
        throw new COMException(hr);
      else
        return null;
    }

    return cast(T)ret.pItf;
  }

}

template Interfaces(TList...) {

  static T coCreate(T, ExceptionPolicy policy = ExceptionPolicy.NoThrow)(ExecutionContext context = ExecutionContext.InProcessServer) {
    //static if (IndexOf!(T, TList) == -1)
    static if (IndexOf!(T, TList) == TList.length)
      static assert(false, "'" ~ typeof(this).stringof ~ "' does not support '" ~ T.stringof ~ "'.");
    else
      return .coCreate!(T, policy)(uuidof!(typeof(this)), context);
  }
}

/*
template CoInterfaces(T ...) {
  public static I coCreate(I, ExceptionPolicy exceptionPolicy = ExceptionPolicy.NoThrow)(ExecutionContext context = ExecutionContext.InProcessServer) {
    static if (IndexOf!(I, T) == T.length)  //Tango version
    //static if (IndexOf!(I, T) == -1)
      static assert(false, "'" ~ typeof(this).stringof ~ "' does not support '" ~ typeof(I).stringof ~ "'.");
    else
      return .coCreate!(I, exceptionPolicy)(typeof(this).CLSID, context);
  }
}
*/

template QueryInterfaceImpl(TList...) {

  int QueryInterface(ref DWINGUID riid, void** ppvObject) {
    if (ppvObject is null)
      return E_POINTER;

    *ppvObject = null;

    if (riid == uuidof!(IUnknown))
      *ppvObject = cast(void*)cast(IUnknown)this;
    else foreach (T; TList) {
      // Search the specified list of types to see if we support the interface we're being asked for.
      if (riid == uuidof!(T)) {
        // This is the one, so we need look no further.
        *ppvObject = cast(void*)cast(T)this;
        break;
      }
    }

    if (*ppvObject is null)
      return E_NOINTERFACE;

    (cast(IUnknown)this).AddRef();
    return S_OK;
  }

}

/*
template QueryInterfaceImpl(T ...) {

  int QueryInterface(ref DWINGUID riid, void** ppvObject) {
    *ppvObject = null;

    if (riid == IUnknown.IID)
      *ppvObject = cast(void*)cast(IUnknown)this;
    else foreach (I; T) {
      if (riid == I.IID) {
        *ppvObject = cast(void*)cast(I)this;
        break;
      }
    }

    if (*ppvObject is null)
      return E_NOINTERFACE;

    (cast(IUnknown)this).AddRef();
    return S_OK;
  }

}
*/

// DMD prevents destructors from running on COM objects.
void runFinalizer(Object obj) {
  if (obj) {
    ClassInfo** ci = cast(ClassInfo**)cast(void*)obj;
    if (*ci) {
      if (auto c = **ci) {
        do {
          if (c.destructor) {
            auto finalizer = cast(void function(Object))c.destructor;
            finalizer(obj);
          }
          c = c.base;
        } while (c);
      }
    }
  }
}

/*
void runFinalizer(Object obj) {
  if (obj !is null) {
    ClassInfo** ci = cast(ClassInfo**)cast(void*)obj;
    if (*ci !is null) {
      ClassInfo c = **ci;
      if (c !is null) {
        do {
          if (c.destructor) {
            auto finalizer = cast(void function(Object))c.destructor;
            finalizer(obj);
          }
          c = c.base;
        } while (c !is null);
      }
    }
  }
}
*/


// Implements AddRef & Release for IUnknown subclasses.
template ReferenceCountImpl() {

  private int refCount = 1;
  private bool finalized;

  uint AddRef() {
    return tango.sys.win32.UserGdi.InterlockedIncrement(&refCount);
  }

  uint Release() {
    if (tango.sys.win32.UserGdi.InterlockedDecrement(&refCount) == 0) {
      if (!finalized) {
        finalized = true;
        runFinalizer(this); // calls destructor (~this) if implemented.
      }
      tango.core.Memory.GC.removeRange(cast(void*)this);
      tango.stdc.stdlib.free(cast(void*)this);
      //std.gc.removeRange(cast(void*)this);
      //std.c.stdlib.free(cast(void*)this);
    }
    return refCount;
  }

  extern(D):

  
  // IUnknown subclasses must manage their memory manually.
  new(size_t sz) {
    //void* p = std.c.stdlib.malloc(sz);
    void* p = tango.stdc.stdlib.malloc(sz); 
    if (p is null)
      throw new tango.core.Exception.OutOfMemoryException("Out of Memory", __LINE__);

    //std.gc.addRange(p, p + sz);
    tango.core.Memory.GC.addRange(p, sz);    
    return p;
  }

}

template IUnknownImpl(T...) {

  mixin QueryInterfaceImpl!(T);
  mixin ReferenceCountImpl;

}

/*
template RefCountImpl() {

  private int refCount = 1;
  private bool finalized = false;

  uint AddRef() {
    //return InterlockedIncrement(refCount);    //juno.base.native
    return InterlockedIncrement(&refCount);     //tango.sys.win32.UserGdi
  }

  uint Release() {
    //if (InterlockedDecrement(refCount) == 0) {
    if (InterlockedDecrement(&refCount) == 0) {
      if (!finalized) {
        runFinalizer(this);
        finalized = true;
      }

      //std.gc.removeRange(cast(void*)this);
      GC.removeRange(cast(void*)this);
      tango.stdc.stdlib.free(cast(void*)this);
      //std.c.stdlib.free(cast(void*)this);
    }
    return refCount;
  }


  new(size_t sz) {
    void* p = tango.stdc.stdlib.malloc(sz);

    if (p is null)
      throw new OutOfMemoryException("", 0);

    //std.gc.addRange(p, p + sz);
    GC.addRange(p, sz);
    return p;
  }

}

template IUnknownImpl(T ...) {
  mixin RefCountImpl;
  mixin QueryInterfaceImpl!(T);
}
*/

template IDispatchImpl(T...) {

  mixin IUnknownImpl!(T);

  int GetTypeInfoCount(out uint pctinfo) {
    pctinfo = 0;
    return E_NOTIMPL;
  }

  int GetTypeInfo(uint iTInfo, uint lcid, out ITypeInfo ppTInfo) {
    ppTInfo = null;
    return E_NOTIMPL;
  }

  int GetIDsOfNames(ref DWINGUID riid, wchar** rgszNames, uint cNames, uint lcid, int* rgDispId) {
    rgDispId = null;
    return E_NOTIMPL;
  }

  int Invoke(int dispIdMember, ref DWINGUID riid, uint lcid, ushort wFlags, DISPPARAMS* pDispParams, DWINVARIANT* pVarResult, EXCEPINFO* pExcepInfo, uint* puArgError) {
    return DISP_E_UNKNOWNNAME;
  }

}

// Only mix this in if you want the default behaviour as declared here implemented. You should subclass the type to override these methods.
/*
template IDispatchImpl(T ...) {

  mixin IUnknownImpl!(IDispatch, T);

  int GetTypeInfoCount(out uint pctinfo) {
    pctinfo = 0;
    return E_NOTIMPL;
  }

  int GetTypeInfo(uint iTInfo, uint lcid, out ITypeInfo ppTInfo) {
    ppTInfo = null;
    return E_NOTIMPL;
  }

  int GetIDsOfNames(ref DWINGUID riid, wchar** rgszNames, uint cNames, uint lcid, int* rgDispId) {
    rgDispId = null;
    return DISP_E_UNKNOWNNAME;
  }

  int Invoke(int dispIdMember, ref DWINGUID riid, uint lcid, ushort wFlags, DISPPARAMS* pDispParams, DWINVARIANT* pVarResult, EXCEPINFO* pExcepInfo, uint* puArgErr) {
    return DISP_E_MEMBERNOTFOUND;
  }

}
*/

template DerivesFrom(T, TList...) {
  const bool DerivesFrom = is(MostDerived!(T, TList) : T);
}

template AllBaseTypesOfImpl(T...) {
  static if (T.length == 0)
    alias TypeTuple!() AllBaseTypesOfImpl;
  else
    alias TypeTuple!(T[0], 
      AllBaseTypesOfImpl!(BaseTypeTuple!(T[0])), 
        AllBaseTypesOfImpl!(T[1 .. $])) 
    AllBaseTypesOfImpl;
}

template AllBaseTypesOf(T) {
  //alias NoDuplicates!(AllBaseTypesOfImpl!(BaseTypeTuple!(T))) AllBaseTypesOf;
  alias TTuple.Unique!(AllBaseTypesOfImpl!(BaseTypeTuple!(T))) AllBaseTypesOf;
}

/**
 * The abstract base class for COM objects that derive from IUnknown or IDispatch.
 *
 * The Implements class provides default implementations of methods required by those interfaces. Therefore, subclasses need only override them when they 
 * specifically need to provide extra functionality. This class also overrides the new operator so that instances are not garbage collected.
 * Examples:
 * ---
 * class MyImpl : Implements!(IUnknown) {
 * }
 * ---
 */
abstract class Implements(T...) : T {

  static if (DerivesFrom!(IDispatch, T))
    mixin IDispatchImpl!(AllBaseTypesOf!(T));
  else
    mixin IUnknownImpl!(AllBaseTypesOf!(T));

}

/*
public abstract class Implements(T ...) : T {
  static if (DerivesFrom!(IDispatch, T))
    mixin IDispatchImpl!(T);
  else
    mixin IUnknownImpl!(T);
}
*/


/**
 * Specified whether to throw exceptions or return null when COM operations fail.
 */

/**
 * Indicates whether the specified object represents a COM object.
 * Params: obj = The object to check.
 * Returns: true if obj is a COM type; otherwise, false.
 */
public bool isComObject(Object obj) {
  ClassInfo** ci = cast(ClassInfo**)cast(void*)obj;
  if (*ci !is null) {
    ClassInfo c = **ci;
    if (c !is null)
      return (c.flags & 1) != 0;
  }
  return false;
}

public void releaseAfter(IUnknown obj, void delegate() block) {
  try {
    block();
  }
  finally {
    if (obj !is null)
      obj.Release();
  }
}

public void clearAfter(DWINVARIANT var, void delegate() block) {
  try {
    block();
  }
  finally {
    var.clear();
  }
}

void tryRelease(IUnknown obj) {
  if (obj) {
    try {
      obj.Release();
    }
    catch {
    }
  }
}

/*
public bool tryRelease(IUnknown obj) {
  if (obj !is null) {
    try {
      obj.Release();
    }
    catch {
      return false;
    }
    return true;
  }
  return false;
}
*/
void finalRelease(IUnknown obj) {
  if (obj) {
    while (obj.Release() > 0) {
    }
  }
}

/*
public void finalRelease(IUnknown obj) {
  if (obj !is null) {
    while (obj.Release() > 0) {
    }
  }
}
*/

/**
 * Determines the equivalent COM type of a built-in type at compile-time.
 * Examples:
 * ---
 * VARTYPE a = VariantType!(string);          // VT_BSTR
 * VARTYPE b = VariantType!(bool);            // VT_BOOL
 * VARTYPE c = VariantType!(typeof([1,2,3])); // VT_ARRAY | VT_I4
 * ---
 */
template VariantType(T) {
  static if (is(T == VARIANT_BOOL))
    const VariantType = VT_BOOL;
  else static if (is(T == bool))
    const VariantType = VT_BOOL;
  else static if (is(T == char))
    const VariantType = VT_UI1;
  else static if (is(T == ubyte))
    const VariantType = VT_UI1;
  else static if (is(T == byte))
    const VariantType = VT_I1;
  else static if (is(T == ushort))
    const VariantType = VT_UI2;
  else static if (is(T == short))
    const VariantType = VT_I2;
  else static if (is(T == uint))
    const VariantType = VT_UI4;
  else static if (is(T == int))
    const VariantType = VT_I4;
  else static if (is(T == ulong))
    const VariantType = VT_UI8;
  else static if (is(T == long))
    const VariantType = VT_I8;
  else static if (is(T == float))
    const VariantType = VT_R4;
  else static if (is(T == double))
    const VariantType = VT_R8;
  else static if (is(T == DECIMAL))
    const VariantType = VT_DECIMAL;
  else static if (is(T E == enum))
    const VariantType = VariantType!(E);
  else static if (is(T : char[]))
    const VariantType = VT_BSTR;
  else static if (is(T == wchar*))
    const VariantType = VT_BSTR;
  else static if (is(T == SAFEARRAY*))
    const VariantType = VT_ARRAY;
  else static if (is(T == DWINVARIANT))
    const VariantType = VT_VARIANT;
  else static if (is(T : IDispatch))
    const VariantType = VT_DISPATCH;
  else static if (is(T : IUnknown))
    const VariantType = VT_UNKNOWN;
  else static if (isArray!(T))
    const VariantType = VariantType!(typeof(*T)) | VT_ARRAY;
  else static if (isPointer!(T))
    const VariantType = VariantType!(typeof(*T)) | VT_BYREF;
  else
    const VariantType = VT_VOID;
}

// Safe Array support
/*
public class ComIterator(TEnum, TItem = void) {

  private TEnum source;

  static if (is(TEnum == SAFEARRAY*) && is(TItem == void))
    static assert(false);

  static if (!is(TEnum == SAFEARRAY*))
    alias typeof(*ParameterTypeTuple!(TEnum.Next)[1]) TItem;
    //alias typeof(*ParameterTupleOf!(TEnum.Next)[1]) TItem;

  public this(TEnum source) {
    this.source = source;
  }

  ~this() {
    static if (!is(TEnum == SAFEARRAY*)) {
      if (source !is null) {
        source.Release();
        source = null;
      }
    }
  }

  public int opApply(int delegate(ref TItem) action) {
    int result;

    uint fetched;
    TItem item;

    static if (is(TEnum == SAFEARRAY*)) {
      int lb = 0, ub = 0;
      SafeArrayGetLBound(source, 1, lb);
      SafeArrayGetUBound(source, 1, ub);
      int end = ub - lb + 1;

      int hr = E_FAIL;
      int index = 0;
      while (index < end) {
        hr = SafeArrayGetElement(source, &index, &item);
        if (hr != S_OK || (result = action(item)) != 0)
          break;
        index++;
      }
    }
    else {
      while (source.Next(1, &item, fetched) == S_OK) {
        if (fetched == 0 || (result = action(item)) != 0)
          break;
      }
      source.Reset();
    }

    return result;
  }

  public int opApply(int delegate(ref int, ref TItem) action) {
    int result, index;

    uint fetched;
    TItem item;

    static if (is(TEnum == SAFEARRAY*)) {
      int lb = 0, ub = 0;
      SafeArrayGetLBound(source, 1, lb);
      SafeArrayGetUBound(source, 1, ub);
      int end = ub - lb + 1;

      int hr = E_FAIL;
      while (index < end) {
        hr = SafeArrayGetElement(source, &index, &item);
        if (hr != S_OK || (result = action(index, item)) != 0)
          break;
        index++;
      }
    }
    else {
      while (source.Next(1, &item, fetched) == S_OK) {
        if (fetched == 0 || (result = action(index, item)) != 0)
          break;
        index++;
      }
      source.Reset();
    }

    return result;
  }

}

public ComIterator!(TEnum, TItem) com_enum(TEnum, TItem = void)(TEnum source) {
  return new ComIterator!(TEnum, TItem)(source);
}
*/


/*
public SAFEARRAY* toSafeArray(T)(T[] array) {
  if (array is null) return null;

  SAFEARRAY* safeArray = SafeArrayCreateVector(VT_VARIANT, 0, array.length);

  DWINVARIANT* data;
  SafeArrayAccessData(safeArray, cast(void**)&data);
  foreach (index, element; array) {
    data[index] = DWINVARIANT(element);
  }
  SafeArrayUnaccessData(safeArray);

  return safeArray;
}

public T[] toArray(T)(SAFEARRAY* safeArray) {
  int upperBound, lowerBound;
  SafeArrayGetUBound(safeArray, 1, upperBound);
  SafeArrayGetLBound(safeArray, 1, lowerBound);
  int count = upperBound - lowerBound + 1;

  if (count == 0) return null;

  T[] result = new T[count];

  DWINVARIANT* data;
  SafeArrayAccessData(safeArray, cast(void**)&data);
  for (int i = lowerBound; i <= upperBound; i++) {
    result[i] = com_cast!(T)(data[i]);
  }
  SafeArrayUnaccessData(safeArray);

  return result;
}
*/


template ComType(T) {
  static if (is(T : char[]))
    alias wchar* ComType;
  else
    alias T ComType;
}

// is this necessary?
public SAFEARRAY* toSafeArray2(T)(T[] array) {
  alias ComType!(T) TElement;

  if (array is null) return null;

  SAFEARRAY* safeArray = SafeArrayCreateVector(VariantType!(T), 0, array.length);

  TElement* data;
  SafeArrayAccessData(safeArray, cast(void**)&data);

  static if (is(T : char[])) {
    foreach (index, element; array) {
      data[index] = bstr.fromString(element);
    }
  }
  else {
    memcpy(data, array.ptr, T.sizeof * array.length);
  }

  SafeArrayUnaccessData(safeArray);

  return safeArray;
}


/*
public T[] toArray2(T)(SAFEARRAY* safeArray) {
  int upperBound, lowerBound;
  SafeArrayGetUBound(safeArray, 1, upperBound);
  SafeArrayGetLBound(safeArray, 1, lowerBound);
  int count = upperBound - lowerBound + 1;

  if (count == 0) return null;

  T[] result = new T[count];

  void** data;
  SafeArrayAccessData(safeArray, cast(void**)&data);
  for (int i = lowerBound; i <= upperBound; i++) {
    static if (is(T : char[])) {
      result[i] = bstr.toString(cast(wchar*)data[i]);
    }
    else static if (is(T == int)) {
      result[i] = cast(int)data[i];
    }
  }
  SafeArrayUnaccessData(safeArray);

  return result;
}
*/

/+
public struct SafeArray(T/*, int dims = 1*/) {

  private static class Data {

    SAFEARRAY* ptr;

    this(SAFEARRAY* ptr) {
      this.ptr = ptr;
    }

    ~this() {
      if (ptr !is null) {
        SafeArrayDestroy(ptr);
        ptr = null;
      }
    }

  }

  private Data data_;

  public static SafeArray opCall(int length) {
    SAFEARRAYBOUND[1] bound;
    bound[0] = SAFEARRAYBOUND(length, 0);

    SAFEARRAY* psa = SafeArrayCreate(VT_VARIANT, 1, bound.ptr);

    SafeArray arr;
    arr.data_ = new SafeArray.Data(psa);
    return arr;
  }

  public static SafeArray opCall(T[] array) {
    SAFEARRAYBOUND[1] bound;
    bound[0] = SAFEARRAYBOUND(array.length, 0);

    SAFEARRAY* psa = SafeArrayCreate(VT_VARIANT, 1, bound.ptr);

    SafeArray arr;
    arr.data_ = new SafeArray.Data(psa);

    foreach (index, value; array) {
      arr.set(value, index);
    }

    return arr;
  }

  public int lowerBound(int dimension) {
    int lb;
    SafeArrayGetLBound(ptr, dimension + 1, lb);
    return lb;
  }

  public int upperBound(int dimension) {
    int ub;
    SafeArrayGetUBound(ptr, dimension + 1, ub);
    return ub;
  }

  public void resize(int newSize) {
    SAFEARRAYBOUND[1] bound;
    bound[0] = SAFEARRAYBOUND(newSize, 0);
    SafeArrayRedim(ptr, bound.ptr);
  }

  public T get(int index) {
    DWINVARIANT v;
    SafeArrayGetElement(ptr, &index, &v);
    return v.get!(T);
  }

  public void set(T value, int index) {
    SafeArrayPutElement(ptr, &index, &DWINVARIANT(value));
  }

  public T opIndex(int index) {
    return get(index);
  }

  public void opIndexAssign(T value, int index) {
    set(value, index);
  }

  public int opApply(int delegate(ref T) action) {
    int result = 0;
    for (int i = 0; i < length; i++) {
      T value = get(i);
      if ((result = action(value)) != 0)
        break;
    }
    return result;
  }

  public int opApply(int delegate(ref int, ref T) action) {
    int result = 0;
    for (int i = 0; i < length; i++) {
      T value = get(i);
      if ((result = action(i, value)) != 0)
        break;
    }
    return result;
  }

  public int length() {
    return upperBound(0) - lowerBound(0) + 1;
  }

  public SAFEARRAY* ptr() {
    if (data_ !is null)
      return data_.ptr;
    return null;
  }

}
+/




public Exception getExceptionForHR(int hr) {
  if (hr < S_OK) {
    switch (hr) {
      case E_NOTIMPL:
        return new NotImplementedException("");
      case E_NOINTERFACE:
        return new InvalidCastException("");
      case E_POINTER:
        return new NullReferenceException("");
      case E_ACCESSDENIED:
        return new UnauthorizedAccessException("");
      case E_OUTOFMEMORY:
        return new OutOfMemoryException("", 0);
      case E_INVALIDARG:
        return new IllegalArgumentException("");
      default:
    }
    //return new COMException(hr);
    return new COMException( format(new char[64], hr, "X#") );
  }
  return null;
}


public class COMStream : Implements!(IStream) {

  private Stream stream_;

  public this(Stream stream) {
    if (stream is null)
      throw new IllegalArgumentException("stream");
    stream_ = stream;
  }

  int Read(void* buffer, uint size, ref uint result) {
    uint ret = stream_.readBlock(buffer, size);
    if (&result)
      result = ret;
    return S_OK;
  }

  int Write(void* buffer, uint size, ref uint result) {
    uint ret = stream_.writeBlock(buffer, size);
    if (&result)
      result = ret;
    return S_OK;
  }

  int Seek(long offset, uint origin, ref ulong result) {
    SeekPos whence;
    if (origin == STREAM_SEEK_SET)
      whence = SeekPos.Set;
    else if (origin == STREAM_SEEK_CUR)
      whence = SeekPos.Current;
    else if (origin == STREAM_SEEK_END)
      whence = SeekPos.End;
    //else
      //throw new IllegalArgumentException("origin");

    ulong ret = stream_.seek(offset, whence);
    if (&result)
      result = ret;
    return S_OK;
  }

  int SetSize(ulong value) {
    return E_NOTIMPL;
  }

  int CopyTo(IStream stream, ulong size, ref ulong read, ref ulong written) {
    read = 0;
    written = 0;
    return E_NOTIMPL;
  }

  int Commit(uint flags) {
    return E_NOTIMPL;
  }

  int Revert() {
    return E_NOTIMPL;
  }

  int LockRegion(ulong offset, ulong size, uint lockType) {
    return E_NOTIMPL;
  }

  int UnlockRegion(ulong offset, ulong size, uint lockType) {
    return E_NOTIMPL;
  }

  int Stat(out STATSTG statstg, uint flag) {
    statstg.type = STGTY_STREAM;
    statstg.cbSize = stream_.size;
    return S_OK;
  }

  int Clone(out IStream result) {
    result = null;
    return E_NOTIMPL;
  }

}
//COMStream

class StreamFromCOMStream : Stream {

  private IStream stream_;

  this(IStream stream) {
    stream_ = stream;
  }

  ~this() {
    close();
  }

  override void close() {
    if (stream_ !is null) {
      try {
        stream_.Commit(0);
      }
      catch {
      }

      tryRelease(stream_);
      stream_ = null;
    }
  }

  override uint readBlock(void* buffer, uint size) {
    uint ret;
    stream_.Read(buffer, size, ret);
    return ret;
  }

  override uint writeBlock(void* buffer, uint size) {
    uint ret;
    stream_.Write(buffer, size, ret);
    return ret;
  }

  override ulong seek(long offset, SeekPos origin) {
    uint dwOrigin;
    if (origin == SeekPos.Set)
      dwOrigin = STREAM_SEEK_SET;
    else if (origin == SeekPos.Current)
      dwOrigin = STREAM_SEEK_CUR;
    else if (origin == SeekPos.End)
      dwOrigin = STREAM_SEEK_END;

    ulong ret;
    stream_.Seek(offset, dwOrigin, ret);
    return ret;
  }

  override void position(ulong value) {
    seek(cast(long)value, SeekPos.Set);
  }

  override ulong position() {
    return seek(0, SeekPos.Current);
  }

  override ulong size() {
    ulong oldPos = position;
    ulong newPos = seek(0, SeekPos.End);
    position = oldPos;
    return newPos - oldPos;
  }

}


DWINVARIANT invokeMemberById(int dispId, DispatchFlags flags, IDispatch target, DWINVARIANT[] args...) {
  args.reverse;

  DISPPARAMS params;
  if (args.length > 0) {
    params.rgvarg = args.ptr;
    params.cArgs = args.length;

    if (flags & DispatchFlags.PutProperty) {
      int dispIdNamed = DISPID_PROPERTYPUT;
      params.rgdispidNamedArgs = &dispIdNamed;
      params.cNamedArgs = 1;
    }
  }

  DWINVARIANT result;
  EXCEPINFO excep;
  int hr = target.Invoke(dispId, DWINGUID.empty, LOCALE_SYSTEM_DEFAULT, flags, &params, &result, &excep, null);

  for (uint i = 0; i < params.cArgs; i++) {
    params.rgvarg[i].clear();
  }

  if (FAILED(hr)) {
    throw new COMException(bstr.toString(excep.bstrDescription), hr);
  }

  return result;
}

DWINVARIANT invokeMember(string name, DispatchFlags flags, IDispatch target, DWINVARIANT[] args...) {
  int dispId = DISPID_UNKNOWN;
  wchar* bstrName = bstr.fromString(name);
  scope(exit) bstr.free(bstrName);

  if (SUCCEEDED(target.GetIDsOfNames(DWINGUID.empty, &bstrName, 1, LOCALE_SYSTEM_DEFAULT, &dispId)) && dispId != DISPID_UNKNOWN)
    return invokeMemberById(dispId, flags, target, args);

  string typeName;
  ITypeInfo typeInfo;
  if (SUCCEEDED(target.GetTypeInfo(0, 0, typeInfo))) {
    scope(exit) typeInfo.Release();

    wchar* bstrTypeName;
    typeInfo.GetDocumentation(-1, &bstrTypeName, null, null, null);
    typeName = bstr.toString(bstrTypeName);
  }

  throw new MissingMemberException(typeName, name);
}

private DWINVARIANT[] argsToVariants(TypeInfo[] types, va_list argptr) {
  DWINVARIANT[] list;

  foreach (type; types) {
    //debug writefln(type);
    if (type == typeid(bool)) list ~= DWINVARIANT(va_arg!(bool)(argptr));
    else if (type == typeid(ubyte)) list ~= DWINVARIANT(va_arg!(ubyte)(argptr));
    else if (type == typeid(byte)) list ~= DWINVARIANT(va_arg!(byte)(argptr));
    else if (type == typeid(ushort)) list ~= DWINVARIANT(va_arg!(ushort)(argptr));
    else if (type == typeid(short)) list ~= DWINVARIANT(va_arg!(short)(argptr));
    else if (type == typeid(uint)) list ~= DWINVARIANT(va_arg!(uint)(argptr));
    else if (type == typeid(int)) list ~= DWINVARIANT(va_arg!(int)(argptr));
    else if (type == typeid(ulong)) list ~= DWINVARIANT(va_arg!(ulong)(argptr));
    else if (type == typeid(long)) list ~= DWINVARIANT(va_arg!(long)(argptr));
    else if (type == typeid(float)) list ~= DWINVARIANT(va_arg!(float)(argptr));
    else if (type == typeid(double)) list ~= DWINVARIANT(va_arg!(double)(argptr));
    else if (type == typeid(string)) list ~= DWINVARIANT(va_arg!(string)(argptr));
    else if (type == typeid(IDispatch)) list ~= DWINVARIANT(va_arg!(IDispatch)(argptr));
    else if (type == typeid(IUnknown)) list ~= DWINVARIANT(va_arg!(IUnknown)(argptr));
    else if (type == typeid(DWINVARIANT*)) list ~= DWINVARIANT(va_arg!(DWINVARIANT*)(argptr));
    else if (type == typeid(DWINVARIANT)) list ~= va_arg!(DWINVARIANT)(argptr);
  }

  return list;
}

private void fixArgs(ref TypeInfo[] args, ref va_list argptr) {
  if (args[0] == typeid(TypeInfo[]) && args[1] == typeid(va_list)) {
    args = va_arg!(TypeInfo[])(argptr);
    argptr = *cast(va_list*)(argptr);
  }
}

R invokeMethod(R = DWINVARIANT)(IDispatch target, string name, ...) {
  auto args = _arguments;
  auto argptr = _argptr;
  if (args.length == 2) fixArgs(args, argptr);

  DWINVARIANT ret = invokeMember(name, DispatchFlags.InvokeMethod, target, argsToVariants(args, argptr));
  static if (is(R == DWINVARIANT))
    return ret;
  else
    return com_cast!(R)(ret);
}


R getProperty(R = DWINVARIANT)(IDispatch target, string name, ...) {
  auto args = _arguments;
  auto argptr = _argptr;
  if (args.length == 2) fixArgs(args, argptr);

  DWINVARIANT ret = invokeMember(name, DispatchFlags.GetProperty, target, argsToVariants(args, argptr));
  static if (is(R == DWINVARIANT))
    return ret;
  else
    return com_cast!(R)(ret);
}

void setProperty(IDispatch target, string name, ...) {
  auto args = _arguments;
  auto argptr = _argptr;
  if (args.length == 2) fixArgs(args, argptr);

  if (args.length > 1) {
    DWINVARIANT v = invokeMember(name, DispatchFlags.GetProperty, target);
    if (auto indexer = v.pdispVal) {
      scope(exit) indexer.Release();
      v = invokeMemberById(0, DispatchFlags.GetProperty, indexer, argsToVariants(args[0 .. 1], argptr));
      if (auto value = v.pdispVal) {
        scope(exit) value.Release();
        invokeMemberById(0, DispatchFlags.PutProperty, value, argsToVariants(args[1 .. $], argptr + args[0].tsize()));
        return;
      }
    }
  }
  else {
    invokeMember(name, DispatchFlags.PutProperty, target, argsToVariants(args, argptr));
  }
}
//


extern(Windows):

    interface IUnknown {
      mixin(uuid("00000000-0000-0000-c000-000000000046"));            
      //static DWINGUID IID = { 0x00000000, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int QueryInterface(ref DWINGUID riid, void** ppvObject);
      uint AddRef();
      uint Release();
    }
    
    interface IDispatch : IUnknown {
      mixin(uuid("00020400-0000-0000-c000-000000000046"));        
      //static DWINGUID IID = { 0x00020400, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int GetTypeInfoCount(out uint pctinfo);
      int GetTypeInfo(uint iTInfo, uint lcid, out ITypeInfo ppTInfo);
      int GetIDsOfNames(ref DWINGUID riid, wchar** rgszNames, uint cNames, uint lcid, int* rgDispId);
      int Invoke(int dispIdMember, ref DWINGUID riid, uint lcid, ushort wFlags, DISPPARAMS* pDispParams, DWINVARIANT* pVarResult, EXCEPINFO* pExcepInfo, uint* puArgErr);
    }    
    
    interface IRecordInfo : IUnknown {
      mixin(uuid("0000002f-0000-0000-c000-000000000046"));        
      // static DWINGUID IID = { 0x0000002F, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int RecordInit(void* pvNew);
      int RecordClear(void* pvExisting);
      int RecordCopy(void* pvExisting, void* pvNew);
      int GetGuid(out DWINGUID pguid);
      int GetName(out wchar* pbstrName);
      int GetSize(out uint pcbSize);
      int GetTypeInfo(out ITypeInfo ppTypeInfo);
      int GetField(void* pvData, wchar* szFieldName, out DWINVARIANT pvarField);
      int GetFieldNoCopy(void* pvData, wchar* szFieldName, out DWINVARIANT pvarField, void** ppvDataCArray);
      int PutField(uint wFlags, void* pvData, wchar* szFieldName, ref DWINVARIANT pvarField);
      int PutFieldNoCopy(uint wFlags, void* pvData, wchar* szFieldName, ref DWINVARIANT pvarField);
      int GetFieldNames(out uint pcNames, wchar** rgBstrNames);
      bool IsMatchingType(IRecordInfo pRecordInfo);
      void* RecordCreate();
      int RecordCreateCopy(void* pvSource, out void* ppvDest);
      int RecordDestroy(void* pvRecord);
    } 
    interface IStream : ISequentialStream {
      // static DWINGUID IID = { 0x0000000C, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      mixin(uuid("0000000c-0000-0000-c000-000000000046"));
      int Seek(long dlibMove, uint dwOrigin, ref ulong plibNewPosition);
      int SetSize(ulong libNewSize);
      int CopyTo(IStream stm, ulong cb, ref ulong pcbRead, ref ulong pcbWritten);
      int Commit(uint hrfCommitFlags);
      int Revert();
      int LockRegion(ulong libOffset, ulong cb, uint dwLockType);
      int UnlockRegion(ulong libOffset, ulong cb, uint dwLockType);
      int Stat(out STATSTG pstatstg, uint gfrStatFlag);
      int Clone(out IStream ppstm);
    }    
    interface IStorage : IUnknown {
       //static DWINGUID IID = { 0x0000000b, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };    
      mixin(uuid("0000000b-0000-0000-c000-000000000046"));
      int CreateStream(wchar* pwcsName, uint grfMode, uint reserved1, uint reserved2, out IStream ppstm);
      int OpenStream(wchar* pwcsName, void* reserved1, uint grfMode, uint reserved2, out IStream ppstm);
      int CreateStorage(wchar* pwcsName, uint grfMode, uint reserved1, uint reserved2, out IStorage ppstg);
      int OpenStorage(wchar* pwcsName, IStorage psrgPriority, uint grfMode, wchar** snbExclude, uint reserved, out IStorage ppstg);
      int CopyTo(uint ciidExclude, DWINGUID* rgiidExclude, wchar** snbExclude, IStorage pstgDest);
      int MoveElementTo(wchar* pwcsName, IStorage pstgDest, wchar* pwcsNewName, uint grfFlags);
      int Commit(uint grfCommitFlags);
      int Revert();
      int EnumElements(uint reserved1, void* reserved2, uint reserved3, out IEnumSTATSTG ppenum);
      int DestroyElement(wchar* pwcsName);
      int RenameElement(wchar* pwcsOldName, wchar* pwcsNewName);
      int SetElementTimes(wchar* pwcsName, FILETIME* pctime, FILETIME* patime, FILETIME* pmtime);
      int SetClass(DWINGUID* clsid);
      int SetStateBits(uint grfStateBits, uint grfMask);
      int Stat(out STATSTG pstatstg, uint grfStatFlag);
    }    
    /*
    class StorageImpl : Implements!(IStorage) {
      
       int CreateStream(wchar* pwcsName, uint grfMode, uint reserved1, uint reserved2, out IStream ppstm) { return E_NOTIMPL; }
       int OpenStream(wchar* pwcsName, void* reserved1, uint grfMode, uint reserved2, out IStream ppstm) { return E_NOTIMPL; }
       int CreateStorage(wchar* pwcsName, uint grfMode, uint reserved1, uint reserved2, out IStorage ppstg) { return E_NOTIMPL; }
       int OpenStorage(wchar* pwcsName, IStorage psrgPriority, uint grfMode, wchar** snbExclude, uint reserved, out IStorage ppstg) { return E_NOTIMPL; }
       int CopyTo(uint ciidExclude, DWINGUID* rgiidExclude, wchar** snbExclude, IStorage pstgDest) { return E_NOTIMPL; }
       int MoveElementTo(wchar* pwcsName, IStorage pstgDest, wchar* pwcsNewName, uint grfFlags) { return E_NOTIMPL; }
       int Commit(uint grfCommitFlags) { return E_NOTIMPL; }
       int Revert() { return E_NOTIMPL; }
       int EnumElements(uint reserved1, void* reserved2, uint reserved3, out IEnumSTATSTG ppenum) { return E_NOTIMPL; }
       int DestroyElement(wchar* pwcsName) { return E_NOTIMPL; }
       int RenameElement(wchar* pwcsOldName, wchar* pwcsNewName) { return E_NOTIMPL; }
       int SetElementTimes(wchar* pwcsName, FILETIME* pctime, FILETIME* patime, FILETIME* pmtime) { return E_NOTIMPL; }
       int SetClass(DWINGUID* clsid) { return S_OK; }
       int SetStateBits(uint grfStateBits, uint grfMask) { return E_NOTIMPL; }
       int Stat(out STATSTG pstatstg, uint grfStatFlag) { return E_NOTIMPL; }
    } 
    */
    
    interface ITypeInfo : IUnknown {
      mixin(uuid("00020401-0000-0000-c000-000000000046"));        
      // static DWINGUID IID = { 0x00020401, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int GetTypeAttr(out TYPEATTR* ppTypeAttr);
      int GetTypeComp(out ITypeComp ppTComp);
      int GetFuncDesc(uint index, out FUNCDESC* ppFuncDesc);
      int GetVarDesc(uint index, out VARDESC* ppVarDesc);
      int GetNames(int memid, wchar** rgBstrNames, uint cMaxNames, out uint pcNames);
      int GetRefTypeOfImplType(uint index, out uint pRefType);
      int GetImplTypeFlags(uint index, out int pImplTypeFlags);
      int GetIDsOfNames(wchar** rgszNames, uint cNames, int* pMemId);
      int Invoke(void* pvInstance, int memid, ushort wFlags, DISPPARAMS* pDispParams, DWINVARIANT* pVarResult, EXCEPINFO* pExcepInfo, uint* puArgErr);
      int GetDocumentation(int memid, wchar** pBstrName, wchar** pBstrDocString, uint* pdwHelpContext, wchar** pBstrHelpFile);
      int GetDllEntry(int memid, INVOKEKIND invKind, wchar** pBstrDllName, wchar** pBstrName, ushort* pwOrdinal);
      int GetRefTypeInfo(uint hRefType, out ITypeInfo ppTInfo);
      int AddressOfMember(int memid, INVOKEKIND invKind, void** ppv);
      int CreateInstance(IUnknown pUnkOuter, ref DWINGUID riid, void** ppvObj);
      int GetMops(int memid, wchar** pBstrMops);
      int GetContainingTypeLib(out ITypeLib ppTLib, out uint pIndex);
      int ReleaseTypeAttr(TYPEATTR* pTypeAttr);
      int ReleaseFuncDesc(FUNCDESC* pFuncDesc);
      int ReleaseVarDesc(VARDESC* pVarDesc);
    }    
    
    interface ITypeComp : IUnknown {
      mixin(uuid("00020403-0000-0000-c000-000000000046"));        
      // static DWINGUID IID = { 0x00020403, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int Bind(wchar* szName, uint lHashVal, ushort wFlags, out ITypeInfo ppTInfo, out DESCKIND pDescKind, out BINDPTR pBindPtr);
      int BindType(wchar* szName, uint lHashVal, out ITypeInfo ppTInfo, out ITypeComp ppTComp);
    }
    
    interface ISequentialStream : IUnknown {
      // static DWINGUID IID = { 0x0c733a30, 0x2a1c, 0x11ce, 0xad, 0xe5, 0x00, 0xaa, 0x00, 0x44, 0x77, 0x3d };
      mixin(uuid("0c733a30-2a1c-11ce-ade5-00aa0044773d"));
      int Read(void* pv, uint cb, ref uint pcbRead);
      int Write(void* pv, uint cb, ref uint pcbWritten);
    }    
    
    interface IEnumSTATSTG : IUnknown {
      mixin(uuid("0000000d-0000-0000-c000-000000000046"));
      // static DWINGUID IID = { 0x0000000d, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int Next(uint celt, STATSTG* rgelt, out uint pceltFetched);
      int Skip(uint celt);
      int Reset();
      int Clone(out IEnumSTATSTG ppenum);
    }
    
    interface ITypeLib : IUnknown {
      mixin(uuid("00020402-0000-0000-c000-000000000046"));
      uint GetTypeInfoCount();
      int GetTypeInfo(uint index, out ITypeInfo ppTInfo);
      int GetTypeInfoType(uint index, out TYPEKIND pTKind);
      int GetTypeInfoOfGuid(ref DWINGUID guid, out ITypeInfo ppTInfo);
      int GetLibAttr(out TLIBATTR* ppTLibAttr);
      int GetTypeComp(out ITypeComp ppTComp);
      int GetDocumentation(int index, wchar** pBstrName, wchar** pBstrDocString, uint* pBstrHelpContext, wchar** pBstrHelpFile);
      int IsName(wchar* szNameBuf, uint lHashVal, out bool pfName);
      int FindName(wchar* szNameBuf, uint lHashVal, ITypeInfo* ppTInfo, int* rgMemId, ref ushort pcFound);
      int ReleaseTLibAttr(TLIBATTR* pTLibAttr);
    }
    /*
    interface IEnumUnknown : IUnknown {
      mixin(uuid("00000100-0000-0000-c000-000000000046"));
      // static DWINGUID IID = { 0x00000100, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int Next(uint celt, IUnknown* rgelt, out uint pceltFetched);
      int Skip(uint celt);
      int Reset();
      int Clone(out IEnumUnknown ppenum);
    }   
    */
    


    
version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
