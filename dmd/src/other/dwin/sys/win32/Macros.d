module dwin.sys.win32.Macros;

//private import tango.sys.win32.Macros;
//private import dwin.sys.win32.Types;
    

    int SignedLOWORD(int n) {
      return cast(short)(n & 0xffff);
    }

    int SignedHIWORD(int n) {
      return cast(short)((n >> 16) & 0xffff);
    }



