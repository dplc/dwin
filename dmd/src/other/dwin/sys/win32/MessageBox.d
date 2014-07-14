// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2008  (yidabu  gmail at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: Apr 2009

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/


module dwin.sys.win32.MessageBox;


private import dwin.sys.win32.Wrapper : messageBox;
private import tango.sys.win32.Types;
private import tango.sys.win32.UserGdi : GetActiveWindow;
    /*
private
{
    alias void* HWND;
    alias uint DWORD;

    extern(Windows)
    {
        HWND GetActiveWindow();
    }

    enum : DWORD {
        
        MB_USERICON = (0x80),
        MB_ICONASTERISK = (0x40),
        MB_ICONEXCLAMATION = (0x30),
        MB_ICONWARNING = (0x30),
        MB_ICONERROR = (0x10),
        MB_ICONHAND = (0x10),
        MB_ICONQUESTION = (0x20),
        MB_OK = (0),
        MB_ABORTRETRYIGNORE = (0x2),
        MB_APPLMODAL = (0),
        MB_DEFAULT_DESKTOP_ONLY = (0x20000),
        MB_HELP = (0x4000),
        MB_RIGHT = (0x80000),
        MB_RTLREADING = (0x100000),
        MB_TOPMOST = (0x40000),
        MB_DEFBUTTON1 = (0),
        MB_DEFBUTTON2 = (0x100),
        MB_DEFBUTTON3 = (0x200),
        MB_DEFBUTTON4 = (0x300),
        MB_ICONINFORMATION = (0x40),
        MB_ICONSTOP = (0x10),
        MB_OKCANCEL = (0x1),
        MB_RETRYCANCEL = (0x5),
        MB_SERVICE_NOTIFICATION = (0x40000),
        MB_SETFOREGROUND = (0x10000),
        MB_SYSTEMMODAL = (0x1000),
        MB_TASKMODAL = (0x2000),
        MB_YESNO = (0x4),
        MB_YESNOCANCEL = (0x3),
        IDABORT = (3),
        IDCANCEL = (2),
        IDCLOSE = (8),
        IDHELP = (9),
        IDIGNORE = (5),
        IDNO = (7),
        IDOK = (1),
        IDRETRY = (4),
        IDYES = (6)    
    }
}
*/
struct MessageBox
{

    static:
    // show information box
    public int showInformation(HWND hWnd, char[] str, char[] title = "") 
    {
        return messageBox(hWnd, str, title, MB_OK | MB_ICONINFORMATION );
    }

    public int showInformation(char[] str, char[] title = "") 
    {
        return messageBox(GetActiveWindow(), str, title, MB_OK | MB_ICONINFORMATION | MB_TOPMOST );
    }

    public int showInformationYesNo( char[] str, char[] title = "") 
    {
        return messageBox(GetActiveWindow(), str, title, MB_YESNO | MB_ICONINFORMATION | MB_TOPMOST );
    }
    
    public bool isShowInformationYesNo(char[] str, char[] title = "") 
    {
        return showInformationYesNo(str, title) == IDYES;
    }    

        
    // show warning box
    public int showWarning(HWND hWnd, char[] str, char[] title = "") 
    {
        return messageBox(hWnd, str, title, MB_OK | MB_ICONWARNING );
    }
    
    public int showWarning(char[] str, char[] title = "") 
    {
        return messageBox(GetActiveWindow(), str, title, MB_OK | MB_ICONWARNING | MB_TOPMOST );
    }    

    // show Error box
    public int showError(HWND hWnd, char[] str, char[] title = "") 
    {
        return messageBox(hWnd, str, title, MB_OK | MB_ICONERROR);
    }

    public int showError(char[] str, char[] title = "") 
    {
        return messageBox(GetActiveWindow(), str, title, MB_OK | MB_ICONERROR | MB_TOPMOST);
    }    
}