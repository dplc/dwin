
// Written in the D programming language.

/*******************************************************************************
        
        copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/



module dwin.sys.win32.Window;


private import dwin.sys.win32.Wrapper;
private import dwin.sys.win32.UserGdi;
private import dwin.sys.win32.headers.wincon : GetConsoleWindow;    
private import Math = tango.math.Math;
private import tango.sys.win32.UserGdi;
    
//pragma(lib, "kernel32.lib"); //GetConsoleWindow


HWND windowExists(char[] classname, char[] windowname, bool show = false)
{
    HWND hwnd = findWindow(classname, windowname);
    if( show && (hwnd !is null) )
    {
        ShowWindow(hwnd, SW_SHOWNORMAL);
        SetForegroundWindow(hwnd);
        //SetWindowPos(instance, HWND_TOPMOST, 0,0,0,0, SWP_NOSIZE | SWP_NOMOVE);
    }
    return hwnd;
}
//

/// Date: June 13, 2009
void standardConsoleWindow()
{        
    auto hwnd = GetConsoleWindow(); //Windows 2000+
    RECT rect;
    GetWindowRect(hwnd, &rect); //66 87 735 525
    
    int oldWidth = rect.right -rect.left;
    int oldHeight = rect.bottom - rect.top;
    int newWidth = cast(int) Math.ceil(oldHeight / 0.75);
    int newHeight = cast(int) Math.ceil(oldWidth * 0.75);
    
    if(oldHeight < newHeight)
        oldHeight = newHeight;
    else if(oldWidth < newWidth)
        oldWidth = newWidth;
            
    MoveWindow(hwnd, rect.left, rect.top, oldWidth, oldHeight, TRUE);      
}       



// RECT left top right bottom
//SPI_GETWORKAREA
RECT getWorkArea()
{
	RECT area;
	SystemParametersInfoA(SPI_GETWORKAREA, 0, &area, FALSE);	
	return area;
}
//

/**
标题栏  
          NONCLIENTMETRICS   ncm;  
          ncm.cbSize   =   sizeof(NONCLIENTMETRICS);  
   
          SystemParametersInfo(  
                  SPI_GETNONCLIENTMETRICS,  
                  sizeof(NONCLIENTMETRICS),  
                  &ncm,  
                  0);  
          ncm.iCaptionHeight   是标题栏高度；  
          ncm.iSmCaptionWidth是TOOLWINDOW样式窗口的标题栏高度。  
   
  工具条、状态栏  
          高度没有系统标准。  
    
*/

// title bar height
int cyCaption()
{
  return GetSystemMetrics(SM_CYCAPTION);  
}

/// get Menu bar height
int cyMenu()
{
  return GetSystemMetrics(SM_CYMENU);   
}

/// get screen width
int cxScreen()
{
    return GetSystemMetrics(SM_CXSCREEN);
}

/// get screen height
int cyScreen()
{
    return GetSystemMetrics(SM_CYSCREEN);
}


/*

    extern(Windows) //have not this cause Access Violation
    {
        alias void function(HWND, int) FUNC;
        static FUNC SwitchToThisWindow;
    }
    
    static this()
    {
        lib = SharedLib.load("user32.dll".dup);
        if(lib) 
        {
            void* ptr = lib.getSymbol("SwitchToThisWindow".ptr);
            if (ptr) 
                SwitchToThisWindow = cast(FUNC) ptr;   
            else 
                debug Trace.formatln("SwitchToThisWindow Symbol not found");
        }
        else 
            Trace.formatln("Could not load the library".dup);
    }
    static ~this()
    {
        if(this.lib)
        {
            this.lib.unload;
            debug Trace.formatln("lib unloaded");
        }
    }
    


    //http://blog.csdn.net/felixz/archive/2007/03/28/1544486.aspx
    //AttachThreadInput Function
    bool MyBringWindowToTop(HWND hWnd)
    {
        SwitchToThisWindow(hWnd, TRUE);
        //SetForegroundWindow(hWnd);
        //BringWindowToTop(hWnd);
        //SetFocus(hWnd);
        
        HWND hFrgWnd = GetForegroundWindow();
        if(hFrgWnd == hWnd)
        {
            //debug Trace.formatln("already ForegroundWindow");
            return true;
        }
        
        AttachThreadInput( GetWindowThreadProcessId(hFrgWnd, null), GetCurrentThreadId(), TRUE );
        
        if(!BringWindowToTop(hWnd))
            debug Trace.formatln("BringWindowToTop Error {}", SysError.lastMsg);
        else
            debug Trace.formatln("BringWindowToTop OK");
                
        if(!SetForegroundWindow(hWnd))
            debug Trace.formatln("SetForegroundWindow Error {}", SysError.lastMsg);
        else
           debug Trace.formatln("SetForegroundWindow OK");
               
        if(!SetFocus(hWnd))
            debug Trace.formatln("SetFocuns ok");
        else
            debug Trace.formatln("SetFocus falied", SysError.lastMsg);
       
       
        AttachThreadInput(GetWindowThreadProcessId(hFrgWnd, null),
            GetCurrentThreadId(), FALSE);
     
        return true;
    }
     






*/
version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
