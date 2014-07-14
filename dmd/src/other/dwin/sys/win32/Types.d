module dwin.sys.win32.Types;

private import tango.sys.win32.Types;
    
    
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// API Types Begin
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////    
    
        
/// incorrect definitions in tango.sys.win32.Types 
/// http://www.dsource.org/forums/viewtopic.php?t=3440
const HKEY 
   HKEY_CLASSES_ROOT     = cast(HKEY) 0x80000000, 
   HKEY_CURRENT_USER     = cast(HKEY) 0x80000001, 
   HKEY_LOCAL_MACHINE    = cast(HKEY) 0x80000002, 
   HKEY_USERS            = cast(HKEY) 0x80000003, 
   HKEY_PERFORMANCE_DATA = cast(HKEY) 0x80000004, 
   HKEY_CURRENT_CONFIG   = cast(HKEY) 0x80000005, 
   HKEY_DYN_DATA         = cast(HKEY) 0x80000006;     
    
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


/*
// lacks somethings, by yidabu 20080409
enum {
	CSIDL_DESKTOP = 0,
	CSIDL_INTERNET,
	CSIDL_PROGRAMS,
	CSIDL_CONTROLS,
	CSIDL_PRINTERS,
	CSIDL_PERSONAL,
	CSIDL_FAVORITES,
	CSIDL_STARTUP,
	CSIDL_RECENT,
	CSIDL_SENDTO,
	CSIDL_BITBUCKET,
	CSIDL_STARTMENU, // = 11
	CSIDL_DESKTOPDIRECTORY = 16,
	CSIDL_DRIVES,
	CSIDL_NETWORK,
	CSIDL_NETHOOD,
	CSIDL_FONTS,
	CSIDL_TEMPLATES,
	CSIDL_COMMON_STARTMENU,
	CSIDL_COMMON_PROGRAMS,
	CSIDL_COMMON_STARTUP,
	CSIDL_COMMON_DESKTOPDIRECTORY,
	CSIDL_APPDATA,
	CSIDL_PRINTHOOD,
	CSIDL_LOCAL_APPDATA,
	CSIDL_ALTSTARTUP,
	CSIDL_COMMON_ALTSTARTUP,
	CSIDL_COMMON_FAVORITES,
	CSIDL_INTERNET_CACHE,
	CSIDL_COOKIES,
	CSIDL_HISTORY,
	CSIDL_COMMON_APPDATA,
	CSIDL_WINDOWS,
	CSIDL_SYSTEM,
	CSIDL_PROGRAM_FILES,
	CSIDL_MYPICTURES,
	CSIDL_PROFILE,
	CSIDL_SYSTEMX86,
	CSIDL_PROGRAM_FILESX86,
	CSIDL_PROGRAM_FILES_COMMON,
	CSIDL_PROGRAM_FILES_COMMONX86,
	CSIDL_COMMON_TEMPLATES,
	CSIDL_COMMON_DOCUMENTS,
	CSIDL_COMMON_ADMINTOOLS,
	CSIDL_ADMINTOOLS,
	CSIDL_CONNECTIONS, // =49
	CSIDL_COMMON_MUSIC = 53,
	CSIDL_COMMON_PICTURES,
	CSIDL_COMMON_VIDEO,
	CSIDL_RESOURCES,
	CSIDL_RESOURCES_LOCALIZED,
	CSIDL_COMMON_OEM_LINKS,
	CSIDL_CDBURN_AREA, // = 59
	CSIDL_COMPUTERSNEARME = 61,
	CSIDL_FLAG_DONT_VERIFY = 0x4000,
	CSIDL_FLAG_CREATE = 0x8000,
	CSIDL_FLAG_MASK = 0xFF00
}
*/
    
    template MAKE_SCODE_T(uint sev, uint fac, uint code) {
      const MAKE_SCODE_T = ((sev << 31) | (fac << 16) | code);
    }

    template MAKELANGID_T(ushort p, ushort s) {
      const MAKELANGID_T = cast(ushort)((s << 10) | p);
    }

    template PRIMARYLANGID_T(ushort lgid) {
      const PRIMARYLANGID_T = cast(ushort)(lgid & 0x3ff);
    }

    template SUBLANGID_T(ushort lgid) {
      const SUBLANGID_T = cast(ushort)(lgid >> 10);
    }

    template MAKELCID_T(ushort lgid, ushort srtid) {
      const MAKELCID_T = cast(uint)((srtid << 16) | lgid);
    }
    
    enum : ushort {
      //LANG_NEUTRAL = 0x0,
      LANG_INVARIANT = 0x7f
    }

    enum : ushort {
      SORT_DEFAULT = 0x0
    }

    enum : ushort {
      LANG_SYSTEM_DEFAULT = MAKELANGID_T!(LANG_NEUTRAL, SUBLANG_SYS_DEFAULT),
      LANG_USER_DEFAULT = MAKELANGID_T!(LANG_NEUTRAL, SUBLANG_NEUTRAL)
    }
    
    
    enum : uint {
      //LOCALE_SYSTEM_DEFAULT = MAKELCID_T!(LANG_SYSTEM_DEFAULT, SORT_DEFAULT),
      //LOCALE_USER_DEFAULT = MAKELCID_T!(LANG_USER_DEFAULT, SORT_DEFAULT),
      LOCALE_NEUTRAL = MAKELCID_T!(MAKELANGID_T!(LANG_NEUTRAL, SUBLANG_NEUTRAL), SORT_DEFAULT),
      LOCALE_INVARIANT = MAKELCID_T!(MAKELANGID_T!(LANG_INVARIANT, SUBLANG_NEUTRAL), SORT_DEFAULT)
    }
    

    enum : uint {
      CP_ACP                   = 0,
      CP_OEMCP                 = 1,
      CP_MACCP                 = 2,
      CP_THREAD_ACP            = 3,
      CP_UTF7                  = 65000,
      CP_UTF8                  = 65001
    }

    enum : uint {
      STD_INPUT_HANDLE = -10,
      STD_OUTPUT_HANDLE = -11,
      STD_ERROR_HANDLE = -12
    }



    struct SIZE {
      int cx;
      int cy;
    }
    /*
    struct RECT {
      int left;
      int top;
      int right;
      int bottom;

      static RECT fromXYWH(int x, int y, int width, int height) {
        return RECT(x, y, x + width, y + height);
      }
    }
    */

    struct OSVERSIONINFOW {
      uint dwOSVersionInfoSize = OSVERSIONINFOW.sizeof;
      uint dwMajorVersion;
      uint dwMinorVersion;
      uint dwBuildNumber;
      uint dwPlatformId;
      wchar[128] szCDVersion;
    }

    //alias OSVERSIONINFOW OSVERSIONINFO;

    enum : uint {
      VER_PLATFORM_WIN32s            = 0,
      VER_PLATFORM_WIN32_WINDOWS     = 1,
      VER_PLATFORM_WIN32_NT          = 2
    }  
    
    enum : uint {
      DELETE                          = 0x00010000,
      READ_CONTROL                    = 0x00020000,
      WRITE_DAC                       = 0x00040000,
      WRITE_OWNER                     = 0x00080000,
      SYNCHRONIZE                     = 0x00100000,
      STANDARD_RIGHTS_REQUIRED        = 0x000F0000,
      STANDARD_RIGHTS_READ            = READ_CONTROL,
      STANDARD_RIGHTS_WRITE           = READ_CONTROL,
      STANDARD_RIGHTS_EXECUTE         = READ_CONTROL,
      STANDARD_RIGHTS_ALL             = 0x001F0000,
      SPECIFIC_RIGHTS_ALL             = 0x0000FFFF
    }    
    

    enum : uint {
      CAL_GREGORIAN                 = 1,
      CAL_GREGORIAN_US              = 2,
      CAL_JAPAN                     = 3,
      CAL_TAIWAN                    = 4,
      CAL_KOREA                     = 5,
      CAL_HIJRI                     = 6,
      CAL_THAI                      = 7,
      CAL_HEBREW                    = 8,
      CAL_GREGORIAN_ME_FRENCH       = 9,
      CAL_GREGORIAN_ARABIC          = 10,
      CAL_GREGORIAN_XLIT_ENGLISH    = 11,
      CAL_GREGORIAN_XLIT_FRENCH     = 12,
      CAL_UMALQURA                  = 23
    }

    
    enum : uint {
      GEO_NATION = 0x1,
      GEO_LATITUDE = 0x2,
      GEO_LONGITUDE = 0x3,
      GEO_ISO2 = 0x4,
      GEO_ISO3 = 0x5,
      GEO_RFC1766 = 0x6,
      GEO_LCID = 0x7,
      GEO_FRIENDLYNAME = 0x8,
      GEO_OFFICIALNAME = 0x9,
      GEO_TIMEZONES = 0xA,
      GEO_OFFICALLANGUAGES = 0xB
    }    
    struct DYNAMIC_TIME_ZONE_INFORMATION {
      int Bias;
      wchar[32] StandardName;
      SYSTEMTIME StandardDate;
      int StandardBias;
      wchar[32] DaylightName;
      SYSTEMTIME DaylightDate;
      int DaylightBias;
      wchar[128] TimeZoneKeyName;
      int DynamicDaylightTimeDisabled;
    }

    enum : uint {
      REPLACEFILE_WRITE_THROUGH       = 0x00000001,
      REPLACEFILE_IGNORE_MERGE_ERRORS = 0x00000002
    }
    enum : uint {
      SHGFP_TYPE_CURRENT = 0,
      SHGFP_TYPE_DEFAULT = 1
    }    
    enum : uint {
      MUTANT_QUERY_STATE = 0x0001,
      MUTEX_MODIFY_STATE = MUTANT_QUERY_STATE
    }    
    


// from binding win32 winuser.d
enum 
{
    INPUT_MOUSE=0x00000000,
    INPUT_KEYBOARD=0x00000001,
    INPUT_HARDWARE=0x00000002
}

/*
const _WIN32_WINNT = 0x500;
enum
{
    VK_LBUTTON=1,
    VK_RBUTTON=2,
    VK_CANCEL=3,
    VK_MBUTTON=4,
    //static if (_WIN32_WINNT >= 0x500) {
    VK_XBUTTON1=5,
    VK_XBUTTON2=6,
    //}
    VK_BACK=8,
    VK_TAB=9,
    VK_CLEAR=12,
    VK_RETURN=13,
    VK_SHIFT=16,
    VK_CONTROL=17,
    VK_MENU=18,
    VK_PAUSE=19,
    VK_CAPITAL=20,
    VK_KANA=0x15,
    VK_HANGEUL=0x15,
    VK_HANGUL=0x15,
    VK_JUNJA=0x17,
    VK_FINAL=0x18,
    VK_HANJA=0x19,
    VK_KANJI=0x19,
    VK_ESCAPE=0x1B,
    VK_CONVERT=0x1C,
    VK_NONCONVERT=0x1D,
    VK_ACCEPT=0x1E,
    VK_MODECHANGE=0x1F,
    VK_SPACE=32,
    VK_PRIOR=33,
    VK_NEXT=34,
    VK_END=35,
    VK_HOME=36,
    VK_LEFT=37,
    VK_UP=38,
    VK_RIGHT=39,
    VK_DOWN=40,
    VK_SELECT=41,
    VK_PRINT=42,
    VK_EXECUTE=43,
    VK_SNAPSHOT=44,
    VK_INSERT=45,
    VK_DELETE=46,
    VK_HELP=47,
    VK_LWIN=0x5B,
    VK_RWIN=0x5C,
    VK_APPS=0x5D,
    VK_SLEEP=0x5F,
    VK_NUMPAD0=0x60,
    VK_NUMPAD1=0x61,
    VK_NUMPAD2=0x62,
    VK_NUMPAD3=0x63,
    VK_NUMPAD4=0x64,
    VK_NUMPAD5=0x65,
    VK_NUMPAD6=0x66,
    VK_NUMPAD7=0x67,
    VK_NUMPAD8=0x68,
    VK_NUMPAD9=0x69,
    VK_MULTIPLY=0x6A,
    VK_ADD=0x6B,
    VK_SEPARATOR=0x6C,
    VK_SUBTRACT=0x6D,
    VK_DECIMAL=0x6E,
    VK_DIVIDE=0x6F,
    VK_F1=0x70,
    VK_F2=0x71,
    VK_F3=0x72,
    VK_F4=0x73,
    VK_F5=0x74,
    VK_F6=0x75,
    VK_F7=0x76,
    VK_F8=0x77,
    VK_F9=0x78,
    VK_F10=0x79,
    VK_F11=0x7A,
    VK_F12=0x7B,
    VK_F13=0x7C,
    VK_F14=0x7D,
    VK_F15=0x7E,
    VK_F16=0x7F,
    VK_F17=0x80,
    VK_F18=0x81,
    VK_F19=0x82,
    VK_F20=0x83,
    VK_F21=0x84,
    VK_F22=0x85,
    VK_F23=0x86,
    VK_F24=0x87,
    VK_NUMLOCK=0x90,
    VK_SCROLL=0x91,
    VK_LSHIFT=0xA0,
    VK_RSHIFT=0xA1,
    VK_LCONTROL=0xA2,
    VK_RCONTROL=0xA3,
    VK_LMENU=0xA4,
    VK_RMENU=0xA5,
    //static if (_WIN32_WINNT >= 0x500) {
    VK_BROWSER_BACK=0xA6,
    VK_BROWSER_FORWARD=0xA7,
    VK_BROWSER_REFRESH=0xA8,
    VK_BROWSER_STOP=0xA9,
    VK_BROWSER_SEARCH=0xAA,
    VK_BROWSER_FAVORITES=0xAB,
    VK_BROWSER_HOME=0xAC,
    VK_VOLUME_MUTE=0xAD,
    VK_VOLUME_DOWN=0xAE,
    VK_VOLUME_UP=0xAF,
    VK_MEDIA_NEXT_TRACK=0xB0,
    VK_MEDIA_PREV_TRACK=0xB1,
    VK_MEDIA_STOP=0xB2,
    VK_MEDIA_PLAY_PAUSE=0xB3,
    VK_LAUNCH_MAIL=0xB4,
    VK_LAUNCH_MEDIA_SELECT=0xB5,
    VK_LAUNCH_APP1=0xB6,
    VK_LAUNCH_APP2=0xB7,
    //}
    VK_OEM_1=0xBA,
    //static if (_WIN32_WINNT >= 0x500) {
    VK_OEM_PLUS=0xBB,
    VK_OEM_COMMA=0xBC,
    VK_OEM_MINUS=0xBD,
    VK_OEM_PERIOD=0xBE,
    //}
    VK_OEM_2=0xBF,
    VK_OEM_3=0xC0,
    VK_OEM_4=0xDB,
    VK_OEM_5=0xDC,
    VK_OEM_6=0xDD,
    VK_OEM_7=0xDE,
    VK_OEM_8=0xDF,
    //static if (_WIN32_WINNT >= 0x500) {
    VK_OEM_102=0xE2,
    //}
    VK_PROCESSKEY=0xE5,
    //static if (_WIN32_WINNT >= 0x500) {
    VK_PACKET=0xE7,
    //}
    VK_ATTN=0xF6,
    VK_CRSEL=0xF7,
    VK_EXSEL=0xF8,
    VK_EREOF=0xF9,
    VK_PLAY=0xFA,
    VK_ZOOM=0xFB,
    VK_NONAME=0xFC,
    VK_PA1=0xFD,
    VK_OEM_CLEAR=0xFE    
}    
*/    
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// API Types End
///////////////////////////////////////////////////////////////////////////////////////////////////////////////// 

