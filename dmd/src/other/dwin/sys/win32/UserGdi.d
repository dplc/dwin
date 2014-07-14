
module dwin.sys.win32.UserGdi;

version(Win32)
{
    pragma (lib, "advapi32.lib"); //RegOpenKeyEx
    pragma (lib, "shell32.lib");
}

public import dwin.sys.win32.Types;
    
private import tango.sys.win32.Types;        
private import tango.stdc.string : memcpy;    



/**
    for use with dwin.sys.win32.Registry
    tango.sys.win32.UserGdi cause problem
*/
extern(Windows):
    
    /**
        tango.sys.win32.UserGdi int SHFileOperation(LPSHFILEOPSTRUCT) should be:
    fixed in tango 0.99.8
    */
    //int SHFileOperationA(LPSHFILEOPSTRUCTA);
    //int SHFileOperationW(LPSHFILEOPSTRUCTW);     

    
    int RegOpenKeyExW(HANDLE hKey, wchar* lpSubKey, uint ulOptions, uint samDesired, out HANDLE phkResult);
    alias RegOpenKeyExW RegOpenKeyEx;

    int RegQueryValueExW(HANDLE hKey, wchar* lpValueName, uint* lpReserved, uint* lpType, ubyte* lpData, uint* lpcbData);
    alias RegQueryValueExW RegQueryValueEx;

    int RegQueryInfoKeyW(HANDLE hKey, wchar* lpClass, uint* lpcchClass, uint* lpReserved, uint* lpcSubKeys, uint* lpcbMaxSubKeyLen, uint* lpcbMaxClassLen, uint* lpcValues, uint* lpcbMaxValueNameLen, uint* lpcMaxValueLen, uint* lpcbSecurityDescriptor, FILETIME* lpftLastWriteTime);
    alias RegQueryInfoKeyW RegQueryInfoKey;

    int RegEnumKeyExW(HANDLE hKey, uint dwIndex, wchar* lpName, uint* lpcchName, uint* lpReserved, wchar* lpClass, uint* lpcchClass, FILETIME* lpftLastWriteTime);
    alias RegEnumKeyExW RegEnumKeyEx;

    int RegEnumValueW(HANDLE hKey, uint dwIndex, wchar* lpValueName, uint* lpcchValueName, uint* lpReserved, uint* lpType, ubyte* lpData, uint* lpcbData);
    alias RegEnumValueW RegEnumValue;

    int RegCreateKeyExW(HANDLE hKey, wchar* lpSubKey, uint Reserved, wchar* lpClass, uint dwOptions, int samDesired, SECURITY_ATTRIBUTES* lpSecurityAttriubtes, out HANDLE phkResult, out uint lpsdwDisposition);
    alias RegCreateKeyExW RegCreateKeyEx;

    int RegCloseKey(HANDLE hKey);

    int RegFlushKey(HANDLE hKey);

    int RegDeleteKeyW(HANDLE hKey, wchar* lpName);
    alias RegDeleteKeyW RegDeleteKey;

    int RegDeleteValueW(HANDLE hKey, wchar* lpValueName);
    alias RegDeleteValueW RegDeleteValue;

    int RegSetValueExW(HANDLE hKey, wchar* lpValueName, uint Reserved, uint dwType, ubyte* lpData, uint cbData);
    alias RegSetValueExW RegSetValueEx;
    

//from juno.base.native
    
    BOOL SHGetSpecialFolderPathA(HWND,LPSTR,int,BOOL);
	BOOL SHGetSpecialFolderPathW(HWND,LPWSTR,int,BOOL);
    
    extern ushort SUBLANGID(uint lgid);

    /*
    struct LARGE_INTEGER {
      long QuadPart;
    }

    struct ULARGE_INTEGER {
      ulong QuadPart;
    }
    */

    int InterlockedCompareExchange(int* Destination, int ExChange, int Comparand);

    /* Tango's version used _Type, _CRITICAL_SECTION*
    struct CRITICAL_SECTION_DEBUG {
      ushort Type;
      ushort CreatorBackTraceIndex;
      CRITICAL_SECTION* CriticalSection;
      LIST_ENTRY ProcessLocksList;
      uint EntryCount;
      uint ContentionCount;
      uint Flags;
      ushort CreatorBackTraceIndexHigh;
      ushort SpareWORD;
    }
    */

    void DeleteCriticalSection(ref CRITICAL_SECTION lpCriticalSection);

 
    uint GetLongPathNameW(wchar* lpszShortPath, wchar* lpszLongPath, uint cchBuffer);
    alias int function(wchar*) LOCALE_ENUMPROCW;

    int GetCalendarInfoW(uint Locale, uint Calendar, uint CalType, wchar* lpCalData, int cchData, uint* lpValue);
    
    alias int function(wchar*, uint) CALINFO_ENUMPROCEXW;

    int EnumCalendarInfoExW(CALINFO_ENUMPROCEXW lpCalInfoEnumProcEx, uint Locale, uint Calendar, uint CalType);

    alias int function(wchar*, uint) DATEFMT_ENUMPROCEXW;

    int EnumDateFormatsExW(DATEFMT_ENUMPROCEXW lpDateFmtEnumProcEx, uint Locale, uint dwFlags);

    alias int function(wchar*) TIMEFMT_ENUMPROCW;

    struct REG_TIME_ZONE_INFORMATION {
      int Bias;
      int StandardBias;
      int DaylightBias;
      SYSTEMTIME StandardDate;
      SYSTEMTIME DaylightDate;

      static REG_TIME_ZONE_INFORMATION opCall(ubyte[] bytes) {
        REG_TIME_ZONE_INFORMATION value;
        memcpy(&value, bytes.ptr, REG_TIME_ZONE_INFORMATION.sizeof);
        return value;
      }

      static REG_TIME_ZONE_INFORMATION opCall(TIME_ZONE_INFORMATION timeZoneInfo) {
        REG_TIME_ZONE_INFORMATION value;
        value.Bias = timeZoneInfo.Bias;
        value.StandardBias = timeZoneInfo.StandardBias;
        value.DaylightBias = timeZoneInfo.DaylightBias;
        value.StandardDate = timeZoneInfo.StandardDate;
        value.DaylightDate = timeZoneInfo.DaylightDate;
        return value;
      }
    }

    int GetVersionInfoW(out OSVERSIONINFO lpVersionInformation);
    int VirtualFree(void* lpAddress, uint dwSize, uint dwFreeType);
    int EncryptFileW(wchar* lpFileName);
    int DecryptFileW(wchar* lpFileName, uint dwReserved);
    int ReplaceFileW(wchar* lpReplacedFileName, wchar* lpReplacementFileName, wchar* lpBackupFileName, uint dwReplaceFlags, void* lpExclude, void* lpReserved);
    alias void function(uint dwErrorCode, uint dwNumberOfBytesTransferred, OVERLAPPED* lpOverlapped) OVERLAPPED_COMPLETION_ROUTINE;
    int ReadDirectoryChangesW(HANDLE hDirectory, void* lpBuffer, uint nBufferLength, int bWatchSubtree, uint dwNotifyFilter, ref uint lpBytesReturned, OVERLAPPED* lpOverlapped, OVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine);

    wchar** CommandLineToArgvW(wchar* lpCmdLine, out int pNumArgs);
    int SHGetFolderPathW(HANDLE hwnd, int csidl, HANDLE hToken, uint dwFlags, wchar* pszPath);


    void keybd_event(ubyte, ubyte, uint, uint);
    
    // use by COMException
    int FormatMessageW(uint dwFlags, void* lpSource, uint dwMessageId, uint dwLanguageId, wchar* lpBuffer, uint nSize, void** Arguments);
    alias FormatMessageW FormatMessage;
    
    

