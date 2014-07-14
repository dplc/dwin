module dwin.sys.win32.headers.all;

public:
    
private import dwin.sys.win32.headers.comcat;
private import dwin.sys.win32.headers.exdisp;
private import dwin.sys.win32.headers.oaidl;
private import dwin.sys.win32.headers.objidl;
private import dwin.sys.win32.headers.ocidl;
private import dwin.sys.win32.headers.oleauto;
private import dwin.sys.win32.headers.oleidl;
private import dwin.sys.win32.headers.ole2;
private import dwin.sys.win32.headers.mshtmhst;
private import dwin.sys.win32.headers.docobj;
private import dwin.sys.win32.headers.objbase;
private import dwin.sys.win32.headers.unknwn;
private import dwin.sys.win32.headers.urlmon;
private import dwin.sys.win32.headers.shobjidl;
private import dwin.sys.win32.headers.shlguid;
private import dwin.sys.win32.headers.winerror;
version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
