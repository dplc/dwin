module ydb.TopWindow;

private import dwin.sys.Common;
private import tango.sys.SharedLib;

debug import tango.util.log.Trace;


static SharedLib lib_user32;
extern(Windows) //have not this cause Access Violation
{
    alias void function(HWND, int) SwitchToThisWindow_;
    static SwitchToThisWindow_ SwitchToThisWindow;
}

static this()
{
    lib_user32 = SharedLib.load("user32.dll");
    if(lib_user32)
    {
        void* ptr = lib_user32.getSymbol("SwitchToThisWindow".ptr);
        if (ptr)
            SwitchToThisWindow = cast(SwitchToThisWindow_) ptr;
        else
            debug Trace.formatln("SwitchToThisWindow Symbol not found");
    }
    else
        debug Trace.formatln("failed to load the library");
}

static ~this()
{
    if(lib_user32)
        lib_user32.unload();
}


bool topWindow(HWND hwnd)
{
    SetWindowPos(hwnd,  HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE | SWP_NOSIZE);
    SwitchToThisWindow(hwnd, TRUE);
    return true;
}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
