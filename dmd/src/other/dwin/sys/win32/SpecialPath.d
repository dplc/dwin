
// Written in the D programming language.

/*******************************************************************************

        copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module dwin.sys.win32.SpecialPath;

private import dwin.sys.win32.Wrapper : getModuleFileName;
private import dwin.sys.win32.Registry;
    
private static import tango.sys.win32.SpecialPath; //lacks some CSIDL
private import TextUtil = tango.text.Util;
private import tango.io.FilePath;

pragma(lib, "shell32.lib");

    
// for use with SHGetSpecialFolderPathW
enum 
{        
    CSIDL_DESKTOP                   = 0x0000,        // <desktop>
    CSIDL_INTERNET                  = 0x0001,        // Internet Explorer (icon on desktop)
    CSIDL_PROGRAMS                  = 0x0002,        // Start Menu\Programs
    CSIDL_CONTROLS                  = 0x0003,        // My Computer\Control Panel
    CSIDL_PRINTERS                  = 0x0004,        // My Computer\Printers
    CSIDL_PERSONAL                  = 0x0005,        // My Documents
    CSIDL_FAVORITES                 = 0x0006,        // <user name>\Favorites
    CSIDL_STARTUP                   = 0x0007,        // Start Menu\Programs\Startup
    CSIDL_RECENT                    = 0x0008,        // <user name>\Recent
    CSIDL_SENDTO                    = 0x0009,        // <user name>\SendTo
    CSIDL_BITBUCKET                 = 0x000a,        // <desktop>\Recycle Bin
    CSIDL_STARTMENU                 = 0x000b,        // <user name>\Start Menu
    CSIDL_MYDOCUMENTS               = 0x000c,        // logical "My Documents" desktop icon
    CSIDL_MYMUSIC                   = 0x000d,        // "My Music" folder
    CSIDL_MYVIDEO                   = 0x000e,        // "My Videos" folder
    CSIDL_DESKTOPDIRECTORY          = 0x0010,        // <user name>\Desktop
    CSIDL_DRIVES                    = 0x0011,        // My Computer
    CSIDL_NETWORK                   = 0x0012,        // Network Neighborhood (My Network Places)
    CSIDL_NETHOOD                   = 0x0013,        // <user name>\nethood
    CSIDL_FONTS                     = 0x0014,        // windows\fonts
    CSIDL_TEMPLATES                 = 0x0015,
    CSIDL_COMMON_STARTMENU          = 0x0016,        // All Users\Start Menu
    CSIDL_COMMON_PROGRAMS           = 0X0017,        // All Users\Start Menu\Programs
    CSIDL_COMMON_STARTUP            = 0x0018,        // All Users\Startup
    CSIDL_COMMON_DESKTOPDIRECTORY   = 0x0019,        // All Users\Desktop
    CSIDL_APPDATA                   = 0x001a,        // <user name>\Application Data
    CSIDL_PRINTHOOD                 = 0x001b,        // <user name>\PrintHood

    //#ifndef CSIDL_LOCAL_APPDATA
    CSIDL_LOCAL_APPDATA             = 0x001c,        // <user name>\Local Settings\Applicaiton Data (non roaming)
    //#endif // CSIDL_LOCAL_APPDATA

    CSIDL_ALTSTARTUP                = 0x001d,        // non localized startup
    CSIDL_COMMON_ALTSTARTUP         = 0x001e,        // non localized common startup
    CSIDL_COMMON_FAVORITES          = 0x001f,

    //#ifndef _SHFOLDER_H_
    CSIDL_INTERNET_CACHE            = 0x0020,
    CSIDL_COOKIES                   = 0x0021,
    CSIDL_HISTORY                   = 0x0022,
    CSIDL_COMMON_APPDATA            = 0x0023,        // All Users\Application Data
    CSIDL_WINDOWS                   = 0x0024,        // GetWindowsDirectory()
    CSIDL_SYSTEM                    = 0x0025,        // GetSystemDirectory()
    CSIDL_PROGRAM_FILES             = 0x0026,        // C:\Program Files
    CSIDL_MYPICTURES                = 0x0027,        // C:\Program Files\My Pictures
    //#endif // _SHFOLDER_H_

    CSIDL_PROFILE                   = 0x0028,        // USERPROFILE
    CSIDL_SYSTEMX86                 = 0x0029,        // x86 system directory on RISC
    CSIDL_PROGRAM_FILESX86          = 0x002a,        // x86 C:\Program Files on RISC

    //#ifndef _SHFOLDER_H_
    CSIDL_PROGRAM_FILES_COMMON      = 0x002b,        // C:\Program Files\Common
    //#endif // _SHFOLDER_H_

    CSIDL_PROGRAM_FILES_COMMONX86   = 0x002c,        // x86 Program Files\Common on RISC
    CSIDL_COMMON_TEMPLATES          = 0x002d,        // All Users\Templates

    //#ifndef _SHFOLDER_H_
    CSIDL_COMMON_DOCUMENTS          = 0x002e,        // All Users\Documents
    CSIDL_COMMON_ADMINTOOLS         = 0x002f,        // All Users\Start Menu\Programs\Administrative Tools
    CSIDL_ADMINTOOLS                = 0x0030,        // <user name>\Start Menu\Programs\Administrative Tools
    //#endif // _SHFOLDER_H_

    CSIDL_CONNECTIONS               = 0x0031,        // Network and Dial-up Connections
    CSIDL_COMMON_MUSIC              = 0x0035,        // All Users\My Music
    CSIDL_COMMON_PICTURES           = 0x0036,        // All Users\My Pictures
    CSIDL_COMMON_VIDEO              = 0x0037,        // All Users\My Video
    CSIDL_RESOURCES                 = 0x0038,        // Resource Direcotry

    //#ifndef _SHFOLDER_H_
    CSIDL_RESOURCES_LOCALIZED       = 0x0039,        // Localized Resource Direcotry
    //#endif // _SHFOLDER_H_

    CSIDL_COMMON_OEM_LINKS          = 0x003a,        // Links to All Users OEM specific apps
    CSIDL_CDBURN_AREA               = 0x003b,        // USERPROFILE\Local Settings\Application Data\Microsoft\CD Burning
    // unused                               = 0x003c,
    CSIDL_COMPUTERSNEARME           = 0x003d,        // Computers Near Me (computered from Workgroup membership)

    //#ifndef _SHFOLDER_H_
    CSIDL_FLAG_CREATE               = 0x8000,        // combine with CSIDL_ value to force folder creation in SHGetFolderPath()
    //#endif // _SHFOLDER_H_

    CSIDL_FLAG_DONT_VERIFY          = 0x4000,        // combine with CSIDL_ value to return an unverified folder path
    CSIDL_FLAG_NO_ALIAS             = 0x1000,        // combine with CSIDL_ value to insure non-alias versions of the pidl
    CSIDL_FLAG_PER_USER_INIT        = 0x0800,        // combine with CSIDL_ value to indicate per-user init (eg. upgrade)
    CSIDL_FLAG_MASK                 = 0xFF00        // mask for all possible flag values
}



/**
    C:\Documents and Settings\Administrator\desktop
*/
char[] desktopPath()
{
    return tango.sys.win32.SpecialPath.getSpecialPath(CSIDL_DESKTOP);
}

/**
    Version 6.0. The file system directory that serves as a repository for music files common to all users. A typical path is C:\Documents and Settings\All Users\Documents\My Music.
*/
char[] commonMusicPath()
{
    return tango.sys.win32.SpecialPath.getSpecialPath(CSIDL_COMMON_MUSIC);
}


/**
    Version 6.0. The file system directory that serves as a repository for image files common to all users. A typical path is C:\Documents and Settings\All Users\Documents\My Pictures.
*/
char[] commonPicturesPath()
{
    return tango.sys.win32.SpecialPath.getSpecialPath(CSIDL_COMMON_PICTURES);
}

/**
    The file system directory that serves as a common repository for music files. A typical path is C:\Documents and Settings\User\My Documents\My Music.

*/
char[] myMusicPath()
{
    return tango.sys.win32.SpecialPath.getSpecialPath(CSIDL_MYMUSIC);
}


/**
    D:\Favorites
*/
char[] favoritesPath()
{
    return tango.sys.win32.SpecialPath.getSpecialPath(CSIDL_FAVORITES);
}

/**
    C:\Documents and Settings\Administrator\「开始」菜单\程序
*/
char[] programsPath()
{
    return tango.sys.win32.SpecialPath.getSpecialPath(CSIDL_PROGRAMS);
}

/**
    C:\Documents and Settings\Administrator\「开始」菜单
*/
char[] startmenuPath()
{
    return tango.sys.win32.SpecialPath.getSpecialPath(CSIDL_STARTMENU);
}

/**
    C:\Documents and Settings\Administrator\「开始」菜单\程序\启动
    C:\Documents and Settings\Administrator\Start Menu\Programs\Startup
    Windows 7:
    C:\Users\username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
*/
char[] startupPath()
{
    return tango.sys.win32.SpecialPath.getSpecialPath(CSIDL_STARTUP);
}

/**
    C:\Program Files
*/
char[] programFilesPath()
{
    return tango.sys.win32.SpecialPath.getSpecialPath(CSIDL_PROGRAM_FILES);
}

/**
    C:\Documents and Settings\Administrator
*/
char[] profilePath()
{
    return tango.sys.win32.SpecialPath.getSpecialPath(CSIDL_PROFILE);
}

/// <user name>\Application Data
char[] applicationDataPath()
{
    return tango.sys.win32.SpecialPath.getSpecialPath(CSIDL_APPDATA );
}

char[] windowsPath()
{
    return tango.sys.win32.SpecialPath.getSpecialPath(CSIDL_WINDOWS);
}
//

char[] systemPath()
{
    return tango.sys.win32.SpecialPath.getSpecialPath(CSIDL_SYSTEM);
}
//

char[] exePath()
{
    return getModuleFileName();
}

/**
    Example:
    ---
        on Windows:
        D:\path\test\
    ---
*/
char[] exeDir()
{
    return FilePath(exePath()).native.path;
}



//  how to get IE path
//  http://groups.google.com/group/microsoft.public.dotnet.languages.csharp/browse_thread/thread/b811a0acc2cb1bbd/b3da48ac525436dc?lnk=st&q=ie+path&rnum=18#b3da48ac525436dc
/+
I just stumbled onto your question and I think I can help. I implemented
this a while back. Unfortunately, I cannot remember all the detailed reasons
as to why this needed to be done this way, but here it goes.


1) Determine the path of the default registered browser. Unfortunately, this
is not obvious & not very robust.  In my case, I could not always assume IE
had the same installation settings. Also, diffferent systems appear to have
different settings in the registry. So in an effort to make it more robuts,
I decided to look at the following registry keys by retrieving their
respective values:


char[] HTTP_KEY = @"Http\Shell\Open\Command";
char[] XML_KEY = @"XMLFile\Shell\Open\Command";
char[] IE_KEY = @"Applications\IExplore.exe\Shell\Open\Command";


1st I get the HTTP_KEY, then parse from it the actual path portion to the IE
exe and then test for the exe to be in existence in that location. If true,
that's my IE exe path. Else I then check the XML_KEY using the same
approach, if true that's the IE exe path, else I finally try the IE_KEY,
again using the same technique. If true, that's my IE path. In my case if
this last attempt failed, it was acceptible to not continue w/ loading the
browser. So, in pseudo code it sort of looked like this:
if(extracted path of HTTP_KEY exists == true)
{
    IEPath = HTTP_KEY path value;
}
else
{
    if(extracted path of XML_KEY exists == true)
    {
        IEPath = XML_KEY path value;
    }
    else
    {
        if(extracted path of IE_KEY exists == true)
        {
            IEPath = IE_KEY path value;
        }
        else
        {
            IEPath = "";
        }
    }
}

2) Launch the browser with the file spec of the file in question as a
process (look at the Process & ProcessStartInfo class members):
if(IEPath != "")
{
    ProcessStartInfo psi = new ProcessStartInfo(IEPath, XMLFileSpec);
    Process prcBrowser = Process.Start(psi);
    if(prcBroswer !is null)
    {
        ....// wiat for the browser to close... or whatever...
    }
else
{
    MessageBox.Show("Unable to find IE ");
}
Note: this approach loads IE asynchronously and therefore does not wait for
it to close before your application continues executing. So, if you need to
wait for the process to complete, you'll need to sit and wait for the
process to no longer be running.

+/
char[] InternetExplorerPath()
{
    char[] result = r"C:\Program Files\Internet Explorer\IEXPLORE.EXE";
    if(FilePath(result).exists) return result;

    result = r"D:\Program Files\Internet Explorer\IEXPLORE.EXE";
    if(FilePath(result).exists) return result;

    scope httpkey = RegistryKey.classesRoot.openSubKey(r"HTTP\shell\open\command");
    if(httpkey !is null)
    {
        result = httpkey.getValue!(char[])(null);
        if(result.length)
            result = TextUtil.strip(result, '"'); // strip begining or ending "
    }

    // too tedious 20080409 yidabu
    /*
    if(!result)
    {
        scope xmlkey = RegistryKey.classesRoot.openSubKey(r"xmlfile\shell\Open\command");
        if(xmlkey !is null)
        {
            result = xmlkey.getValue!(char[])(null);
        }

    }

    if(!result)
    {
        scope iekey = RegistryKey.classesRoot.openSubKey(r"Applications\iexplore.exe\shell\open\command");
        if(iekey !is null)
        {
            result = iekey.getValue!(char[])(null);
        }
    }
    */

    return (result.length && FilePath(result).exists) ? result : null;
}
//iePath

/**


*/
char[] windowsMediaPlayerPath()
{
    char[] result;
    result = r"C:\Program Files\Windows Media Player\wmplayer.exe";
    if( FilePath(result).exists ) return result;

    result = r"D:\Program Files\Windows Media Player\wmplayer.exe";
    if( FilePath(result).exists ) return result;

    auto key = dwin.sys.win32.Registry.RegistryKey.localMachine.openSubKey(r"SOFTWARE\Microsoft\MediaPlayer\");
    if(key !is null)
        if( auto dir = key.getValue!(char[])("Installation Directory") )
            return dir ~ r"\wmplayer.exe";

    return null;
}

char[] shellPath(char[] name)
{
    scope rkey = RegistryKey.localMachine.openSubKey(r"SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders");
    if(rkey)
        return rkey.getValue!(char[])(name);
    return null;
}
//shellPath

