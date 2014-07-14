
/*******************************************************************************

        copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: January 2011

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module dwin.sys.Process;

private import tango.sys.Environment;
private import  dwin.sys.win32.CodePage : toMbsz;
private import tango.stdc.stdlib : system ;
private import Path = tango.io.Path;
private import TextUtil = tango.text.Util;

void execCommand(char[] command) {
    system( toMbsz(command) );    
}

void execCommand(char[][] command) {
    foreach(ref c; command) {
        c = TextUtil.trim(c);
        if(c.length) system( toMbsz(c) );    
    }
}


/**
    usefule function to run .bat or .sh file when application starts or close
    Example:
    ---
    runSpecialFile(exeDir(), "onclose");
    runSpecialFile(exeDir(), "onstart");
    ---
**/
void runSpecialFile(char[] cwd,  char[] filename, char[][] suffix = [".bat", ".sh", ".exe"]) {
    cwd = Path.standard(cwd);
    if( cwd[$-1] != '/' ) cwd ~= '/';
    char[] oldcwd = Environment.cwd();
    Environment.cwd(cwd);
    scope(exit) Environment.cwd(oldcwd);
    foreach(s; suffix) {
        char[] fullpath = cwd ~ filename ~ s;
        if(Path.exists(fullpath))
        {
            execCommand(fullpath);
            break;
        }
    }    
}

version(Win32):

private import tango.sys.win32.UserGdi;
private import tango.sys.win32.Types;

bool doEvents()
{
    version(Win32)
    {
        
        MSG msg;			
        while(PeekMessageW(&msg, HWND.init, 0, 0, PM_REMOVE))
        {
            TranslateMessage(&msg);
            DispatchMessageW(&msg);            
            if(msg.message == WM_QUIT)
                return false;
        }                
        return true;
    }

}

bool doEvents(uint msDelay)
{
    version(Windows)
    {
        size_t begin = GetTickCount();
        while( (GetTickCount() - begin) < msDelay  )
        {                         
            //WaitMessage(); // wait a long time, is it necessary ?  
            if(!doEvents())
                return false;
        }
        return true;
    }
}

version(SWT):

    private import java.lang.all;
    private import org.eclipse.swt.widgets.Display;
    private import org.eclipse.swt.widgets.Shell;


bool doEvents(Display display, Shell shell, size_t msDelay)
{
    assert(display !is null);
    assert(shell !is null);
    
    size_t begin = GetTickCount();
    while( (GetTickCount() - begin) < msDelay  )
    {   
        //WaitMessage();          
        if(shell is null || shell.isDisposed() || !doEvents())
            return false;
    }            
        
    return true;
    
}

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
