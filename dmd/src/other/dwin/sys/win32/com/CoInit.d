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

module dwin.sys.win32.com.CoInit;

//private import dwin.sys.win32.com.Core;
private import tango.core.Memory;
private import dwin.sys.win32.com.Util : SUCCEEDED;
private import dwin.sys.win32.headers.objbase; //COINIT_APARTMENTTHREADED, CoInitializeEx, CoUninitialize;
    
package bool isCOMAlive;

static this() {
    startupCOM();
}

static ~this() {
    shutdownCOM();
}

//public startupCOM and shutdwonCOM for run this in thread
void startupCOM() {
  isCOMAlive = SUCCEEDED(CoInitializeEx(null, COINIT_APARTMENTTHREADED));
}

void shutdownCOM() {
  // Before we shut down COM, give classes a chance to release any COM resources.
  try {
      
    //std.gc.fullCollect();
    GC.collect();
  }
  finally {
    isCOMAlive = false;
    CoUninitialize();
  }
}

