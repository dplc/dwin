
// Written in the D programming language.

/*******************************************************************************

        simple wrapper of Windows APIs.

        copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/


module dwin.sys.win32.Wrapper;

private import dwin.sys.win32.UserGdi;
private import dwin.sys.win32.CodePage;
private import dwin.text.convert.Utf : toString;
    
private import tango.text.Util : delimit;    
private import tango.sys.win32.UserGdi;
    
version(Win32)
    pragma(lib, "shell32.lib");


HWND findWindow(char[] classname, char[] windowname)
{
    wchar* zclassname = classname ? toString16z(classname) : null;
    wchar* zwindowname = windowname ? toString16z(windowname) : null;
    return FindWindowW(zclassname, zwindowname);    
}
//findwindow


/**
    Example:
    ---
        char[] src = "os= %os%    windir = %windir%";
        char[] result = expandEnvironmentStringsW( src );
        Stdout(result).newline;
    ---
*/
char[] expandEnvironmentStrings(char[] src) 
{
    wchar* strz, dest;
    uint len;
    
    strz = src.toString16z();
    len = ExpandEnvironmentStringsW(strz, null, 0);
    if(!len)
        return null;
    dest = (new wchar[len]).ptr;
    len = ExpandEnvironmentStringsW(strz, dest, len);
    
    return toString(dest);
}
//

uint getFileAttributesW(char[] name)
{
    return GetFileAttributesW( toString16z(name) );
}


char[] getCommandLine() 
{
  return toString( GetCommandLineW() );
}
//

char[] getComputerName()
{
    wchar[] buf;
    uint len = MAX_COMPUTERNAME_LENGTH + 1;
    buf = new wchar[len];
    if(!GetComputerNameW(buf.ptr, &len))
        return null;
    return toString(buf.ptr);
}
//


/**
    Retrieves the current directory for the current process
    http://msdn2.microsoft.com/en-us/library/aa364934.aspx
*/
char[] getCurrentDirectory()
{
    wchar* buf;
    int len;
    len = GetCurrentDirectoryW(0, null);
    if(!len)
        return null;
    
    buf = (new wchar[len]).ptr;
    len = GetCurrentDirectoryW(len, buf);
    return toString(buf);
}
//


/**
    see tango.sys.Environment.get();
    Example:
    ---
        Stdout( getEnvironmentVariable("include") ).newline;
        Stdout( getEnvironmentVariable("windir") ).newline;
        Stdout( getEnvironmentVariable("tmp") ).newline;
        Stdout( getEnvironmentVariable("temp") ).newline;
        Stdout( getEnvironmentVariable("path") ).newline;
    ---
*/
char[] getEnvironmentVariable(char[] src)
{
    wchar* strz, dest;
    uint len;
    
    strz = src.toString16z();
    len = GetEnvironmentVariableW(strz, null, 0);
    if(!len)
        return null;
    dest = (new wchar[len]).ptr;
    len = GetEnvironmentVariableW(strz, dest, len);
    
    return toString(dest);    
}
//


/**
    Retrieves the full path and file name of the specified file.
    http://msdn2.microsoft.com/en-us/library/aa364963.aspx
*/
char[] getFullPathName(char[] fileName)
{
	uint len;
    wchar* fnw;
    fnw = fileName.toString16z();
    len = GetFullPathNameW(fnw, 0, null, null);
    if(!len)
        return null;
    wchar[260] _wbuf;
    wchar[] wbuf = _wbuf;
    if(len > _wbuf.sizeof)
        wbuf = new wchar[len];
    len = GetFullPathNameW(fnw, wbuf.length, wbuf.ptr, null);
    assert(len < wbuf.length);
    return toString(wbuf.ptr);
}
//

char[] getModuleFileName(HINST hmod = HINST.init)
{
    wchar[] s;
    DWORD len;
    s = new wchar[MAX_PATH];
    len = GetModuleFileNameW(hmod, s.ptr, s.length);
    return dwin.text.convert.Utf.toString( s[0..len] );    
}
//

/*
    DWORD GetLogicalDrives();
    UINT GetDriveTypeA(LPCSTR lpRootPathName);
    UINT GetDriveTypeW(LPCWSTR lpRootPathName);
    const UINT DRIVE_UNKNOWN     = 0; //The drive type cannot be determined. 
    const UINT DRIVE_NO_ROOT_DIR = 1; //The root path is invalid; for example, there is no volume is mounted at the path. 
    const UINT DRIVE_REMOVABLE   = 2; //The drive has removable media; for example, a floppy drive, thumb drive, or flash card reader. 
    const UINT DRIVE_FIXED       = 3; //The drive has fixed media; for example, a hard drive or flash drive. 
    const UINT DRIVE_REMOTE      = 4; //The drive is a remote (network) drive. 
    const UINT DRIVE_CDROM       = 5; //The drive is a CD-ROM drive. 
    const UINT DRIVE_RAMDISK     = 6; //The drive is a RAM disk.

*/
char[][] getLogicalDrives()
{
	uint mask = GetLogicalDrives();
	char[] drive = new char[3];
	char[][] list;	
	
	drive[1..3] = ":\\";	
	for(size_t i= 0; i < 26; i++)
	{
		if (mask & 0x1<<i)
		{
			drive[0] = 'A'+i;
			list ~= drive.dup;
		}		
	}
	
	return list;
}
//



char[] getUserName()
{	
    wchar[256 + 1] buf;
    auto len = buf.length;
    if(!GetUserNameW(buf.ptr, &len) || !len || !--len) // Also remove null-terminator.
        return null;
    return toString(buf.ptr);
}
//


char[] getSystemDirectory()
{
    wchar[] buf;
    uint len;
    buf = new wchar[MAX_PATH];
    len = GetSystemDirectoryW(buf.ptr, buf.length);
    if(!len)
        return null;
    return toString(buf.ptr);

}
//

int messageBox(HWND hWnd, char[] text, char[] caption, UINT uType)
{
	// Windows 9x supports MessageBoxW().
	return MessageBoxW(hWnd, toString16z(text), toString16z(caption), uType);    
}


bool setCurrentDirectory(char[] pathName)
{
    return SetCurrentDirectoryW( pathName.toString16z() ) is 0 ;
}
//

bool setFileAttributes(char[] fileName, uint attributes)
{    
    return SetFileAttributesW(fileName.toString16z(), attributes) is 0;
}

/* 

Parameters

hwnd
[in] A handle to the owner window used for displaying a user interface (UI) or error messages. This value can be NULL if the operation is not associated with a window.
lpOperation
[in] A pointer to a null-terminated char[], referred to in this case as a verb, that specifies the action to be performed. The set of available verbs depends on the particular file or folder. Generally, the actions available from an object's shortcut menu are available verbs. The following verbs are commonly used.
    edit
    Launches an editor and opens the document for editing. If lpFile is not a document file, the function will fail.
    explore
    Explores a folder specified by lpFile.
    find
    Initiates a search beginning in the directory specified by lpDirectory.
    open
    Opens the item specified by the lpFile parameter. The item can be a file or folder.
    print
    Prints the file specified by lpFile. If lpFile is not a document file, the function fails.
    NULL
    In systems prior to Microsoft Windows 2000, the default verb is used if it is valid and available in the registry. If not, the "open" verb is used.

    In Windows 2000 and later, the default verb is used if available. If not, the "open" verb is used. If neither verb is available, the system uses the first verb listed in the registry.

lpFile
[in] A pointer to a null-terminated char[] that specifies the file or object on which to execute the specified verb. To specify a Shell namespace object, pass the fully qualified parse name. Note that not all verbs are supported on all objects. For example, not all document types support the "print" verb. If a relative path is used for the lpDirectory parameter do not use a relative path for lpFile.

lpParameters
[in] If lpFile specifies an executable file, this parameter is a pointer to a null-terminated char[] that specifies the parameters to be passed to the application. The format of this char[] is determined by the verb that is to be invoked. If lpFile specifies a document file, lpParameters should be NULL.

lpDirectory
[in] A pointer to a null-terminated char[] that specifies the default (working) directory for the action. If this value is NULL, the current working directory is used. If a relative path is provided at lpFile, do not use a relative path for lpDirectory.

nShowCmd
[in] The flags that specify how an application is to be displayed when it is opened. If lpFile specifies a document file, the flag is simply passed to the associated application. It is up to the application to decide how to handle it.

    SW_HIDE
    Hides the window and activates another window.
    SW_MAXIMIZE
    Maximizes the specified window.
    SW_MINIMIZE
    Minimizes the specified window and activates the next top-level window in the z-order.
    SW_RESTORE
    Activates and displays the window. If the window is minimized or maximized, Windows restores it to its original size and position. An application should specify this flag when restoring a minimized window.
    SW_SHOW
    Activates the window and displays it in its current size and position.
    SW_SHOWDEFAULT
    Sets the show state based on the SW_ flag specified in the STARTUPINFO structure passed to the CreateProcess function by the program that started the application. An application should call ShowWindow with this flag to set the initial show state of its main window.
    SW_SHOWMAXIMIZED
    Activates the window and displays it as a maximized window.
    SW_SHOWMINIMIZED
    Activates the window and displays it as a minimized window.
    SW_SHOWMINNOACTIVE
    Displays the window as a minimized window. The active window remains active.
    SW_SHOWNA
    Displays the window in its current state. The active window remains active.
    SW_SHOWNOACTIVATE
    Displays a window in its most recent size and position. The active window remains active.
    SW_SHOWNORMAL
    Activates and displays a window. If the window is minimized or maximized, Windows restores it to its original size and position. An application should specify this flag when displaying the window for the first time.
    Return Value

Returns a value greater than 32 if successful, or an error value that is less than or equal to 32 otherwise. The following table lists the error values. The return value is cast as an HINSTANCE for backward compatibility with 16-bit Windows applications. It is not a true HINSTANCE, however. The only thing that can be done with the returned HINSTANCE is to cast it to an int and compare it with the value 32 or one of the error codes below.

    0 The operating system is out of memory or resources. 
    ERROR_FILE_NOT_FOUND The specified file was not found. 
    ERROR_PATH_NOT_FOUND The specified path was not found. 
    ERROR_BAD_FORMAT The .exe file is invalid (non-Microsoft Win32 .exe or error in .exe image). 
    SE_ERR_ACCESSDENIED The operating system denied access to the specified file. 
    SE_ERR_ASSOCINCOMPLETE The file name association is incomplete or invalid. 
    SE_ERR_DDEBUSY The Dynamic Data Exchange (DDE) transaction could not be completed because other DDE transactions were being processed. 
    SE_ERR_DDEFAIL The DDE transaction failed. 
    SE_ERR_DDETIMEOUT The DDE transaction could not be completed because the request timed out. 
    SE_ERR_DLLNOTFOUND The specified DLL was not found. 
    SE_ERR_FNF The specified file was not found. 
    SE_ERR_NOASSOC There is no application associated with the given file name extension. This error will also be returned if you attempt to print a file that is not printable. 
    SE_ERR_OOM There was not enough memory to complete the operation. 
    SE_ERR_PNF The specified path was not found. 
    SE_ERR_SHARE A sharing violation occurred. 


Remarks

This method allows you to execute any commands in a folder's shortcut menu or stored in the registry.

To open a folder, use either of the following calls: 
ShellExecute(handle, NULL, <fully_qualified_path_to_folder>, NULL, NULL, SW_SHOWNORMAL);
or
ShellExecute(handle, "open", <fully_qualified_path_to_folder>, NULL, NULL, SW_SHOWNORMAL);

To explore a folder, use the following call: 
ShellExecute(handle, "explore", <fully_qualified_path_to_folder>, NULL, NULL, SW_SHOWNORMAL);
To launch the Shell's Find utility for a directory, use the following call. 
ShellExecute(handle, "find", <fully_qualified_path_to_folder>, NULL, NULL, 0);
If lpOperation is NULL, the function opens the file specified by lpFile. If lpOperation is "open" or "explore", the function attempts to open or explore the folder.

To obtain information about the application that is launched as a result of calling ShellExecute, use ShellExecuteEx.

Note  The Launch folder windows in a separate process setting in Folder Options affects ShellExecute. If that option is disabled (the default setting), ShellExecute uses an open Explorer window rather than launch a new one. If no Explorer window is open, ShellExecute launches a new one.
Windows 95/98/Me: ShellExecute is supported by the Microsoft Layer for Unicode. To use this, you must add certain files to your application, as outlined in Microsoft Layer for Unicode on Windows Me/98/95 Systems.

*/
//
HINSTANCE shellExecute(HWND hwnd, char[] operation, char[] exepath, char[] parameters = null, char[] directory = null, int showcmd = SW_SHOWMAXIMIZED )
{
	return ShellExecuteW(hwnd, toString16z(operation), toString16z(exepath), toString16z(parameters), toString16z(directory), showcmd);	
}

//


//
char[] shGetSpecialFolderPath(int csidl)
{
    wchar[]  spath = new wchar[MAX_PATH];
    if ( !SHGetSpecialFolderPathW(null, spath.ptr ,csidl,true) ) 
        return null;	
    return toString(spath.ptr);
}
//


uint winExec( char[] cmdline, uint show = SW_SHOWMAXIMIZED )
{
    return WinExec( toMbsz(cmdline), show );
}


version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
