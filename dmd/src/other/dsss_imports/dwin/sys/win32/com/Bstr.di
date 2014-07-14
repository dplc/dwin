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

module dwin.sys.win32.com.Bstr;

//private import std.utf : toUTF8, toUTF16z;
private static import tango.text.convert.Utf;
private static import dwin.sys.win32.CodePage;
    
alias char[] string;

pragma(lib, "oleaut32.lib");

extern(Windows):

wchar* SysAllocString(in wchar* psz);
int SysReAllocString(ref wchar* pbstr, wchar* psz);
wchar* SysAllocStringLen(in wchar* strIn, uint ui);
int SysReAllocStringLen(ref wchar* pbstr, wchar* psz, uint len);
void SysFreeString(in wchar* bstring);
uint SysStringLen(in wchar* bstring);
uint SysStringByteLen(in wchar* bstring);
wchar* SysAllocStringByteLen(in wchar* psz, uint len);

extern(D):

/**
 * Allocates a BSTR equivalent to s.
 * Params: s = The string with which to initialize the BSTR.
 * Returns: The BSTR equivalent to s.
 */
wchar* fromString(string s) {
  if (s == null)
    return null;

  //return SysAllocString(s.toUTF16z());
  return SysAllocString( dwin.sys.win32.CodePage.toString16z(s) );
}

uint getLength(wchar* s) {
  return SysStringLen(s);
}

/**
 * Converts a BSTR to a string, freeing the original BSTR.
 * Params: bstr = The BSTR to convert.
 * Returns: A string equivalent to bstr.
 */
string toString(wchar* s) {
  if (s == null)
    return null;

  uint len = SysStringLen(s);
  if (len == 0)
    return null;

  //string ret = s[0 .. len].toUTF8();
  string ret = tango.text.convert.Utf.toString(s[0 .. len]);
  SysFreeString(s);
  return ret;
}

/**
 * Frees the memory occupied by the specified BSTR.
 * Params: bstr = The BSTR to free.
 */
void free(wchar* s) {
  if (s != null)
    SysFreeString(s);
}
version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
