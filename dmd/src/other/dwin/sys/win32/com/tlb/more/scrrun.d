// Microsoft Scripting Runtime
// Version 1.0

/*[uuid("420b2830-e718-11cf-893d-00a0c9054228")]*/
//module dwin.sys.win32.com.tlb.more.scripting;
module dwin.sys.win32.com.tlb.more.scrrun;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum CompareMethod {
  BinaryCompare = 0x00000000,
  TextCompare = 0x00000001,
  DatabaseCompare = 0x00000002,
}

enum IOMode {
  ForReading = 0x00000001,
  ForWriting = 0x00000002,
  ForAppending = 0x00000008,
}

enum Tristate {
  TristateTrue = 0xFFFFFFFF,
  TristateFalse = 0x00000000,
  TristateUseDefault = 0xFFFFFFFE,
  TristateMixed = 0xFFFFFFFE,
}

enum __MIDL___MIDL_itf_scrrun_0000_0001 {
  Normal = 0x00000000,
  ReadOnly = 0x00000001,
  Hidden = 0x00000002,
  System = 0x00000004,
  Volume = 0x00000008,
  Directory = 0x00000010,
  Archive = 0x00000020,
  Alias = 0x00000400,
  Compressed = 0x00000800,
}

enum __MIDL___MIDL_itf_scrrun_0111_0001 {
  UnknownType = 0x00000000,
  Removable = 0x00000001,
  Fixed = 0x00000002,
  Remote = 0x00000003,
  CDRom = 0x00000004,
  RamDisk = 0x00000005,
}

enum __MIDL___MIDL_itf_scrrun_0111_0002 {
  WindowsFolder = 0x00000000,
  SystemFolder = 0x00000001,
  TemporaryFolder = 0x00000002,
}

enum __MIDL___MIDL_itf_scrrun_0111_0003 {
  StdIn = 0x00000000,
  StdOut = 0x00000001,
  StdErr = 0x00000002,
}

// Aliases

alias __MIDL___MIDL_itf_scrrun_0000_0001 FileAttribute;

alias __MIDL___MIDL_itf_scrrun_0111_0001 DriveTypeConst;

alias __MIDL___MIDL_itf_scrrun_0111_0002 SpecialFolderConst;

alias __MIDL___MIDL_itf_scrrun_0111_0003 StandardStreamTypes;

// Interfaces

// Scripting.Dictionary Interface
interface IDictionary : IDispatch {
  mixin(uuid("42c642c1-97e1-11cf-978f-00a02463e06f"));
  // static DWINGUID IID = { 0x42c642c1, 0x97e1, 0x11cf, 0x97, 0x8f, 0x00, 0xa0, 0x24, 0x63, 0xe0, 0x6f };
  // Set or get the item for a given key
  /*[id(0x00000000)]*/ int setref_Item(DWINVARIANT* Key, DWINVARIANT* pRetItem);
  // Set or get the item for a given key
  /*[id(0x00000000)]*/ int set_Item(DWINVARIANT* Key, DWINVARIANT* pRetItem);
  // Set or get the item for a given key
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT* Key, out DWINVARIANT pRetItem);
  // Add a new key and item to the dictionary.
  /*[id(0x00000001)]*/ int Add(DWINVARIANT* Key, DWINVARIANT* Item);
  // Get the number of items in the dictionary.
  /*[id(0x00000002)]*/ int get_Count(out int pCount);
  // Determine if a given key is in the dictionary.
  /*[id(0x00000003)]*/ int Exists(DWINVARIANT* Key, out short pExists);
  // Get an array containing all items in the dictionary.
  /*[id(0x00000004)]*/ int Items(out DWINVARIANT pItemsArray);
  // Change a key to a different key.
  /*[id(0x00000005)]*/ int set_Key(DWINVARIANT* Key, DWINVARIANT* value);
  // Get an array containing all keys in the dictionary.
  /*[id(0x00000006)]*/ int Keys(out DWINVARIANT pKeysArray);
  // Remove a given key from the dictionary.
  /*[id(0x00000007)]*/ int Remove(DWINVARIANT* Key);
  // Remove all information from the dictionary.
  /*[id(0x00000008)]*/ int RemoveAll();
  // Set or get the string comparison method.
  /*[id(0x00000009)]*/ int set_CompareMode(CompareMethod pcomp);
  // Set or get the string comparison method.
  /*[id(0x00000009)]*/ int get_CompareMode(out CompareMethod pcomp);
  /*[id(0xFFFFFFFC)]*/ int _NewEnum(out IUnknown ppunk);
  /*[id(0x0000000A)]*/ int get_HashVal(DWINVARIANT* Key, out DWINVARIANT HashVal);
}

// FileSystemObject
interface IFileSystem : IDispatch {
  mixin(uuid("0ab5a3d0-e5b6-11d0-abf5-00a0c90fffc0"));
  // static DWINGUID IID = { 0x0ab5a3d0, 0xe5b6, 0x11d0, 0xab, 0xf5, 0x00, 0xa0, 0xc9, 0x0f, 0xff, 0xc0 };
  // Get drives collection
  /*[id(0x0000271A)]*/ int get_Drives(out IDriveCollection ppdrives);
  // Generate a path from an existing path and a name
  /*[id(0x00002710)]*/ int BuildPath(wchar* Path, wchar* Name, out wchar* pbstrResult);
  // Return drive from a path
  /*[id(0x00002714)]*/ int GetDriveName(wchar* Path, out wchar* pbstrResult);
  // Return path to the parent folder
  /*[id(0x00002715)]*/ int GetParentFolderName(wchar* Path, out wchar* pbstrResult);
  // Return the file name from a path
  /*[id(0x00002716)]*/ int GetFileName(wchar* Path, out wchar* pbstrResult);
  // Return base name from a path
  /*[id(0x00002717)]*/ int GetBaseName(wchar* Path, out wchar* pbstrResult);
  // Return extension from path
  /*[id(0x00002718)]*/ int GetExtensionName(wchar* Path, out wchar* pbstrResult);
  // Return the canonical representation of the path
  /*[id(0x00002712)]*/ int GetAbsolutePathName(wchar* Path, out wchar* pbstrResult);
  // Generate name that can be used to name a temporary file
  /*[id(0x00002713)]*/ int GetTempName(out wchar* pbstrResult);
  // Check if a drive or a share exists
  /*[id(0x0000271F)]*/ int DriveExists(wchar* DriveSpec, out short pfExists);
  // Check if a file exists
  /*[id(0x00002720)]*/ int FileExists(wchar* FileSpec, out short pfExists);
  // Check if a path exists
  /*[id(0x00002721)]*/ int FolderExists(wchar* FolderSpec, out short pfExists);
  // Get drive or UNC share
  /*[id(0x0000271B)]*/ int GetDrive(wchar* DriveSpec, out IDrive ppdrive);
  // Get file
  /*[id(0x0000271C)]*/ int GetFile(wchar* FilePath, out IFile ppfile);
  // Get folder
  /*[id(0x0000271D)]*/ int GetFolder(wchar* FolderPath, out IFolder ppfolder);
  // Get location of various system folders
  /*[id(0x0000271E)]*/ int GetSpecialFolder(SpecialFolderConst SpecialFolder, out IFolder ppfolder);
  // Delete a file
  /*[id(0x000004B0)]*/ int DeleteFile(wchar* FileSpec, short Force);
  // Delete a folder
  /*[id(0x000004B1)]*/ int DeleteFolder(wchar* FolderSpec, short Force);
  // Move a file
  /*[id(0x000004B4)]*/ int MoveFile(wchar* Source, wchar* Destination);
  // Move a folder
  /*[id(0x000004B5)]*/ int MoveFolder(wchar* Source, wchar* Destination);
  // Copy a file
  /*[id(0x000004B2)]*/ int CopyFile(wchar* Source, wchar* Destination, short OverWriteFiles);
  // Copy a folder
  /*[id(0x000004B3)]*/ int CopyFolder(wchar* Source, wchar* Destination, short OverWriteFiles);
  // Create a folder
  /*[id(0x00000460)]*/ int CreateFolder(wchar* Path, out IFolder ppfolder);
  // Create a file as a TextStream
  /*[id(0x0000044D)]*/ int CreateTextFile(wchar* FileName, short Overwrite, short Unicode, out ITextStream ppts);
  // Open a file as a TextStream
  /*[id(0x0000044C)]*/ int OpenTextFile(wchar* FileName, IOMode IOMode, short Create, Tristate Format, out ITextStream ppts);
}

// Drive Collection Interface
interface IDriveCollection : IDispatch {
  mixin(uuid("c7c3f5a1-88a3-11d0-abcb-00a0c90fffc0"));
  // static DWINGUID IID = { 0xc7c3f5a1, 0x88a3, 0x11d0, 0xab, 0xcb, 0x00, 0xa0, 0xc9, 0x0f, 0xff, 0xc0 };
  // Get drive
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT Key, out IDrive ppdrive);
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown ppenum);
  // Number of drives
  /*[id(0x00000001)]*/ int get_Count(out int plCount);
}

// Drive Interface
interface IDrive : IDispatch {
  mixin(uuid("c7c3f5a0-88a3-11d0-abcb-00a0c90fffc0"));
  // static DWINGUID IID = { 0xc7c3f5a0, 0x88a3, 0x11d0, 0xab, 0xcb, 0x00, 0xa0, 0xc9, 0x0f, 0xff, 0xc0 };
  // Path
  /*[id(0x00000000)]*/ int get_Path(out wchar* pbstrPath);
  // Drive letter
  /*[id(0x00002710)]*/ int get_DriveLetter(out wchar* pbstrLetter);
  // Share name
  /*[id(0x00002711)]*/ int get_ShareName(out wchar* pbstrShareName);
  // Drive type
  /*[id(0x00002712)]*/ int get_DriveType(out DriveTypeConst pdt);
  // Root folder
  /*[id(0x00002713)]*/ int get_RootFolder(out IFolder ppfolder);
  // Get available space
  /*[id(0x00002715)]*/ int get_AvailableSpace(out DWINVARIANT pvarAvail);
  // Get drive free space
  /*[id(0x00002714)]*/ int get_FreeSpace(out DWINVARIANT pvarFree);
  // Get total drive size
  /*[id(0x00002716)]*/ int get_TotalSize(out DWINVARIANT pvarTotal);
  // Name of volume
  /*[id(0x00002717)]*/ int get_VolumeName(out wchar* pbstrName);
  // Name of volume
  /*[id(0x00002717)]*/ int set_VolumeName(wchar* pbstrName);
  // Filesystem type
  /*[id(0x00002718)]*/ int get_FileSystem(out wchar* pbstrFileSystem);
  // Serial number
  /*[id(0x00002719)]*/ int get_SerialNumber(out int pulSerialNumber);
  // Check if disk is available
  /*[id(0x0000271A)]*/ int get_IsReady(out short pfReady);
}

// Folder Interface
interface IFolder : IDispatch {
  mixin(uuid("c7c3f5a2-88a3-11d0-abcb-00a0c90fffc0"));
  // static DWINGUID IID = { 0xc7c3f5a2, 0x88a3, 0x11d0, 0xab, 0xcb, 0x00, 0xa0, 0xc9, 0x0f, 0xff, 0xc0 };
  // Path to folder
  /*[id(0x00000000)]*/ int get_Path(out wchar* pbstrPath);
  // Get name of folder
  /*[id(0x000003E8)]*/ int get_Name(out wchar* pbstrName);
  // Get name of folder
  /*[id(0x000003E8)]*/ int set_Name(wchar* pbstrName);
  // Short path
  /*[id(0x000003EA)]*/ int get_ShortPath(out wchar* pbstrPath);
  // Short name
  /*[id(0x000003E9)]*/ int get_ShortName(out wchar* pbstrName);
  // Get drive that contains folder
  /*[id(0x000003EC)]*/ int get_Drive(out IDrive ppdrive);
  // Get parent folder
  /*[id(0x000003ED)]*/ int get_ParentFolder(out IFolder ppfolder);
  // Folder attributes
  /*[id(0x000003EB)]*/ int get_Attributes(out FileAttribute pfa);
  // Folder attributes
  /*[id(0x000003EB)]*/ int set_Attributes(FileAttribute pfa);
  // Date folder was created
  /*[id(0x000003EE)]*/ int get_DateCreated(out double pdate);
  // Date folder was last modified
  /*[id(0x000003EF)]*/ int get_DateLastModified(out double pdate);
  // Date folder was last accessed
  /*[id(0x000003F0)]*/ int get_DateLastAccessed(out double pdate);
  // Type description
  /*[id(0x000003F2)]*/ int get_Type(out wchar* pbstrType);
  // Delete this folder
  /*[id(0x000004B1)]*/ int Delete(short Force);
  // Copy this folder
  /*[id(0x000004B3)]*/ int Copy(wchar* Destination, short OverWriteFiles);
  // Move this folder
  /*[id(0x000004B5)]*/ int Move(wchar* Destination);
  // True if folder is root
  /*[id(0x00002710)]*/ int get_IsRootFolder(out short pfRootFolder);
  // Sum of files and subfolders
  /*[id(0x000003F1)]*/ int get_Size(out DWINVARIANT pvarSize);
  // Get folders collection
  /*[id(0x00002711)]*/ int get_SubFolders(out IFolderCollection ppfolders);
  // Get files collection
  /*[id(0x00002712)]*/ int get_Files(out IFileCollection ppfiles);
  // Create a file as a TextStream
  /*[id(0x0000044D)]*/ int CreateTextFile(wchar* FileName, short Overwrite, short Unicode, out ITextStream ppts);
}

// Folder Collection Interface
interface IFolderCollection : IDispatch {
  mixin(uuid("c7c3f5a3-88a3-11d0-abcb-00a0c90fffc0"));
  // static DWINGUID IID = { 0xc7c3f5a3, 0x88a3, 0x11d0, 0xab, 0xcb, 0x00, 0xa0, 0xc9, 0x0f, 0xff, 0xc0 };
  // Create a new folder
  /*[id(0x00000002)]*/ int Add(wchar* Name, out IFolder ppfolder);
  // Get folder
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT Key, out IFolder ppfolder);
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown ppenum);
  // Number of folders
  /*[id(0x00000001)]*/ int get_Count(out int plCount);
}

// File Collection Interface
interface IFileCollection : IDispatch {
  mixin(uuid("c7c3f5a5-88a3-11d0-abcb-00a0c90fffc0"));
  // static DWINGUID IID = { 0xc7c3f5a5, 0x88a3, 0x11d0, 0xab, 0xcb, 0x00, 0xa0, 0xc9, 0x0f, 0xff, 0xc0 };
  // Get file
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT Key, out IFile ppfile);
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown ppenum);
  // Number of folders
  /*[id(0x00000001)]*/ int get_Count(out int plCount);
}

// File Interface
interface IFile : IDispatch {
  mixin(uuid("c7c3f5a4-88a3-11d0-abcb-00a0c90fffc0"));
  // static DWINGUID IID = { 0xc7c3f5a4, 0x88a3, 0x11d0, 0xab, 0xcb, 0x00, 0xa0, 0xc9, 0x0f, 0xff, 0xc0 };
  // Path to the file
  /*[id(0x00000000)]*/ int get_Path(out wchar* pbstrPath);
  // Get name of file
  /*[id(0x000003E8)]*/ int get_Name(out wchar* pbstrName);
  // Get name of file
  /*[id(0x000003E8)]*/ int set_Name(wchar* pbstrName);
  // Short path
  /*[id(0x000003EA)]*/ int get_ShortPath(out wchar* pbstrPath);
  // Short name
  /*[id(0x000003E9)]*/ int get_ShortName(out wchar* pbstrName);
  // Get drive that contains file
  /*[id(0x000003EC)]*/ int get_Drive(out IDrive ppdrive);
  // Get folder that contains file
  /*[id(0x000003ED)]*/ int get_ParentFolder(out IFolder ppfolder);
  // File attributes
  /*[id(0x000003EB)]*/ int get_Attributes(out FileAttribute pfa);
  // File attributes
  /*[id(0x000003EB)]*/ int set_Attributes(FileAttribute pfa);
  // Date file was created
  /*[id(0x000003EE)]*/ int get_DateCreated(out double pdate);
  // Date file was last modified
  /*[id(0x000003EF)]*/ int get_DateLastModified(out double pdate);
  // Date file was last accessed
  /*[id(0x000003F0)]*/ int get_DateLastAccessed(out double pdate);
  // File size
  /*[id(0x000003F1)]*/ int get_Size(out DWINVARIANT pvarSize);
  // Type description
  /*[id(0x000003F2)]*/ int get_Type(out wchar* pbstrType);
  // Delete this file
  /*[id(0x000004B0)]*/ int Delete(short Force);
  // Copy this file
  /*[id(0x000004B2)]*/ int Copy(wchar* Destination, short OverWriteFiles);
  // Move this file
  /*[id(0x000004B4)]*/ int Move(wchar* Destination);
  // Open a file as a TextStream
  /*[id(0x0000044C)]*/ int OpenAsTextStream(IOMode IOMode, Tristate Format, out ITextStream ppts);
}

// Scripting.TextStream Interface
interface ITextStream : IDispatch {
  mixin(uuid("53bad8c1-e718-11cf-893d-00a0c9054228"));
  // static DWINGUID IID = { 0x53bad8c1, 0xe718, 0x11cf, 0x89, 0x3d, 0x00, 0xa0, 0xc9, 0x05, 0x42, 0x28 };
  // Current line number
  /*[id(0x00002710)]*/ int get_Line(out int Line);
  // Current column number
  /*[id(0xFFFFFDEF)]*/ int get_Column(out int Column);
  // Is the current position at the end of the stream?
  /*[id(0x00002712)]*/ int get_AtEndOfStream(out short EOS);
  // Is the current position at the end of a line?
  /*[id(0x00002713)]*/ int get_AtEndOfLine(out short EOL);
  // Read a specific number of characters into a string
  /*[id(0x00002714)]*/ int Read(int Characters, out wchar* Text);
  // Read an entire line into a string
  /*[id(0x00002715)]*/ int ReadLine(out wchar* Text);
  // Read the entire stream into a string
  /*[id(0x00002716)]*/ int ReadAll(out wchar* Text);
  // Write a string to the stream
  /*[id(0x00002717)]*/ int Write(wchar* Text);
  // Write a string and an end of line to the stream
  /*[id(0x00002718)]*/ int WriteLine(wchar* Text);
  // Write a number of blank lines to the stream
  /*[id(0x00002719)]*/ int WriteBlankLines(int Lines);
  // Skip a specific number of characters
  /*[id(0x0000271A)]*/ int Skip(int Characters);
  // Skip a line
  /*[id(0x0000271B)]*/ int SkipLine();
  // Close a text stream
  /*[id(0x0000271C)]*/ int Close();
}

// FileSystemObject
interface IFileSystem3 : IFileSystem {
  mixin(uuid("2a0b9d10-4b87-11d3-a97a-00104b365c9f"));
  // static DWINGUID IID = { 0x2a0b9d10, 0x4b87, 0x11d3, 0xa9, 0x7a, 0x00, 0x10, 0x4b, 0x36, 0x5c, 0x9f };
  // Retrieve the standard input, output or error stream
  /*[id(0x00004E20)]*/ int GetStandardStream(StandardStreamTypes StandardStreamType, short Unicode, out ITextStream ppts);
  // Retrieve the file version of the specified file into a string
  /*[id(0x00004E2A)]*/ int GetFileVersion(wchar* FileName, out wchar* FileVersion);
}

// Script Encoder Interface
interface IScriptEncoder : IDispatch {
  mixin(uuid("aadc65f6-cff1-11d1-b747-00c04fc2b085"));
  // static DWINGUID IID = { 0xaadc65f6, 0xcff1, 0x11d1, 0xb7, 0x47, 0x00, 0xc0, 0x4f, 0xc2, 0xb0, 0x85 };
  // Call the Encoder determined by szExt, passing bstrStreamIn and optional arguments
  /*[id(0x00000000)]*/ int EncodeScriptFile(wchar* szExt, wchar* bstrStreamIn, int cFlags, wchar* bstrDefaultLang, out wchar* pbstrStreamOut);
}

// CoClasses

// Scripting.Dictionary
abstract class Dictionary {
  mixin(uuid("ee09b103-97e0-11cf-978f-00a02463e06f"));
  // static DWINGUID CLSID = { 0xee09b103, 0x97e0, 0x11cf, 0x97, 0x8f, 0x00, 0xa0, 0x24, 0x63, 0xe0, 0x6f };
  mixin Interfaces!(IDictionary);
}

// FileSystem Object
abstract class FileSystemObject {
  mixin(uuid("0d43fe01-f093-11cf-8940-00a0c9054228"));
  // static DWINGUID CLSID = { 0x0d43fe01, 0xf093, 0x11cf, 0x89, 0x40, 0x00, 0xa0, 0xc9, 0x05, 0x42, 0x28 };
  mixin Interfaces!(IFileSystem3);
}

// Drive Object
abstract class Drive {
  mixin(uuid("c7c3f5b1-88a3-11d0-abcb-00a0c90fffc0"));
  // static DWINGUID CLSID = { 0xc7c3f5b1, 0x88a3, 0x11d0, 0xab, 0xcb, 0x00, 0xa0, 0xc9, 0x0f, 0xff, 0xc0 };
  mixin Interfaces!(IDrive);
}

// Collection of drives associated with drive letters
abstract class Drives {
  mixin(uuid("c7c3f5b2-88a3-11d0-abcb-00a0c90fffc0"));
  // static DWINGUID CLSID = { 0xc7c3f5b2, 0x88a3, 0x11d0, 0xab, 0xcb, 0x00, 0xa0, 0xc9, 0x0f, 0xff, 0xc0 };
  mixin Interfaces!(IDriveCollection);
}

// Folder object
abstract class Folder {
  mixin(uuid("c7c3f5b3-88a3-11d0-abcb-00a0c90fffc0"));
  // static DWINGUID CLSID = { 0xc7c3f5b3, 0x88a3, 0x11d0, 0xab, 0xcb, 0x00, 0xa0, 0xc9, 0x0f, 0xff, 0xc0 };
  mixin Interfaces!(IFolder);
}

// Collection of subfolders in a folder
abstract class Folders {
  mixin(uuid("c7c3f5b4-88a3-11d0-abcb-00a0c90fffc0"));
  // static DWINGUID CLSID = { 0xc7c3f5b4, 0x88a3, 0x11d0, 0xab, 0xcb, 0x00, 0xa0, 0xc9, 0x0f, 0xff, 0xc0 };
  mixin Interfaces!(IFolderCollection);
}

// File object
abstract class File {
  mixin(uuid("c7c3f5b5-88a3-11d0-abcb-00a0c90fffc0"));
  // static DWINGUID CLSID = { 0xc7c3f5b5, 0x88a3, 0x11d0, 0xab, 0xcb, 0x00, 0xa0, 0xc9, 0x0f, 0xff, 0xc0 };
  mixin Interfaces!(IFile);
}

// Collection of files in a folder
abstract class Files {
  mixin(uuid("c7c3f5b6-88a3-11d0-abcb-00a0c90fffc0"));
  // static DWINGUID CLSID = { 0xc7c3f5b6, 0x88a3, 0x11d0, 0xab, 0xcb, 0x00, 0xa0, 0xc9, 0x0f, 0xff, 0xc0 };
  mixin Interfaces!(IFileCollection);
}

// TextStream object
abstract class TextStream {
  mixin(uuid("0bb02ec0-ef49-11cf-8940-00a0c9054228"));
  // static DWINGUID CLSID = { 0x0bb02ec0, 0xef49, 0x11cf, 0x89, 0x40, 0x00, 0xa0, 0xc9, 0x05, 0x42, 0x28 };
  mixin Interfaces!(ITextStream);
}

// Script Encoder Object
abstract class Encoder {
  mixin(uuid("32da2b15-cfed-11d1-b747-00c04fc2b085"));
  // static DWINGUID CLSID = { 0x32da2b15, 0xcfed, 0x11d1, 0xb7, 0x47, 0x00, 0xc0, 0x4f, 0xc2, 0xb0, 0x85 };
  mixin Interfaces!(IScriptEncoder);
}
