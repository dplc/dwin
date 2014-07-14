// Windows Script Host (Ver 5.6)
// Version 5.6

/*[uuid("60254ca0-953b-11cf-8c96-00aa00b8708c")]*/
//module dwin.sys.win32.com.tlb.more.ihost;
module dwin.sys.win32.com.tlb.more.wshchs;

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

enum __MIDL___MIDL_itf_ihost_0094_0001 {
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

enum __MIDL___MIDL_itf_ihost_0094_0002 {
  UnknownType = 0x00000000,
  Removable = 0x00000001,
  Fixed = 0x00000002,
  Remote = 0x00000003,
  CDRom = 0x00000004,
  RamDisk = 0x00000005,
}

enum __MIDL___MIDL_itf_ihost_0094_0003 {
  WindowsFolder = 0x00000000,
  SystemFolder = 0x00000001,
  TemporaryFolder = 0x00000002,
}

enum __MIDL___MIDL_itf_ihost_0094_0004 {
  StdIn = 0x00000000,
  StdOut = 0x00000001,
  StdErr = 0x00000002,
}

// Aliases

alias __MIDL___MIDL_itf_ihost_0094_0001 FileAttribute;

alias __MIDL___MIDL_itf_ihost_0094_0002 DriveTypeConst;

alias __MIDL___MIDL_itf_ihost_0094_0003 SpecialFolderConst;

alias __MIDL___MIDL_itf_ihost_0094_0004 StandardStreamTypes;

// Interfaces

// Windows Script Host Application Interface
interface IHost : IDispatch {
  mixin(uuid("91afbd1b-5feb-43f5-b028-e2ca960617ec"));
  // static DWINGUID IID = { 0x91afbd1b, 0x5feb, 0x43f5, 0xb0, 0x28, 0xe2, 0xca, 0x96, 0x06, 0x17, 0xec };
  /*[id(0x00000000)]*/ int get_Name(out wchar* out_Name);
  /*[id(0x00000064)]*/ int get_Application(out IDispatch out_Dispatch);
  /*[id(0x00000065)]*/ int get_FullName(out wchar* out_Path);
  /*[id(0x00000066)]*/ int get_Path(out wchar* out_Path);
  /*[id(0x00000067)]*/ int get_Interactive(out short out_Interactive);
  /*[id(0x00000067)]*/ int set_Interactive(short out_Interactive);
  /*[id(0x000000C8)]*/ int Quit(int ExitCode);
  /*[id(0x000003E8)]*/ int get_ScriptName(out wchar* out_ScriptName);
  /*[id(0x000003E9)]*/ int get_ScriptFullName(out wchar* out_ScriptFullName);
  /*[id(0x000003EA)]*/ int get_Arguments(out IArguments2 out_Arguments);
  /*[id(0x000003EB)]*/ int get_Version(out wchar* out_Version);
  /*[id(0x000003EC)]*/ int get_BuildVersion(out int out_Build);
  /*[id(0x000003ED)]*/ int get_Timeout(out int out_Timeout);
  /*[id(0x000003ED)]*/ int set_Timeout(int out_Timeout);
  /*[id(0x000007D0)]*/ int CreateObject(wchar* ProgID, wchar* Prefix, out IDispatch out_Dispatch);
  /*[id(0x000007D1)]*/ int Echo(SAFEARRAY pArgs);
  /*[id(0x000007D2)]*/ int GetObject(wchar* Pathname, wchar* ProgID, wchar* Prefix, out IDispatch out_Dispatch);
  /*[id(0x000007D3)]*/ int DisconnectObject(IDispatch ObjectParam);
  /*[id(0x000007D4)]*/ int Sleep(int Time);
  /*[id(0x000007D5)]*/ int ConnectObject(IDispatch ObjectParam, wchar* Prefix);
  /*[id(0x000003EE)]*/ int get_StdIn(out ITextStream out_ppts);
  /*[id(0x000003EF)]*/ int get_StdOut(out ITextStream ppts);
  /*[id(0x000003F0)]*/ int get_StdErr(out ITextStream ppts);
}

// Arguments Collection Object Interface
interface IArguments2 : IArguments {
  mixin(uuid("2cc5a9d1-b1e5-11d3-a286-00104bd35090"));
  // static DWINGUID IID = { 0x2cc5a9d1, 0xb1e5, 0x11d3, 0xa2, 0x86, 0x00, 0x10, 0x4b, 0xd3, 0x50, 0x90 };
  /*[id(0x00000003)]*/ int get_Named(out IWSHNamedArguments out_ppnamed);
  /*[id(0x00000004)]*/ int get_Unnamed(out IWSHUnnamedArguments out_ppnamed);
  /*[id(0x00000005)]*/ int ShowUsage();
}

// Arguments Collection Object Interface
interface IArguments : IDispatch {
  mixin(uuid("60254ca3-953b-11cf-8c96-00aa00b8708c"));
  // static DWINGUID IID = { 0x60254ca3, 0x953b, 0x11cf, 0x8c, 0x96, 0x00, 0xaa, 0x00, 0xb8, 0x70, 0x8c };
  /*[id(0x00000000)]*/ int Item(int Index, out wchar* out_Value);
  /*[id(0x00000001)]*/ int Count(out int out_Count);
  /*[id(0x00000002)]*/ int get_length(out int out_Count);
  /*[id(0xFFFFFFFC)]*/ int _NewEnum(out IUnknown out_Enum);
}

// Named Arguments Collection Object Interface
interface IWSHNamedArguments : IDispatch {
  mixin(uuid("2cc5a9d0-b1e5-11d3-a286-00104bd35090"));
  // static DWINGUID IID = { 0x2cc5a9d0, 0xb1e5, 0x11d3, 0xa2, 0x86, 0x00, 0x10, 0x4b, 0xd3, 0x50, 0x90 };
  /*[id(0x00000000)]*/ int get_Item(wchar* Switch, out DWINVARIANT out_Value);
  /*[id(0x00000001)]*/ int get_Count(out int out_Count);
  /*[id(0x00000002)]*/ int get_length(out int out_Count);
  /*[id(0x00000003)]*/ int Exists(wchar* Switch, out short out_Exists);
  /*[id(0xFFFFFFFC)]*/ int _NewEnum(out IUnknown out_Enum);
}

// Unnamed Arguments Collection Object Interface
interface IWSHUnnamedArguments : IDispatch {
  mixin(uuid("bf64faf0-5906-426c-b4bc-7b753cbe819f"));
  // static DWINGUID IID = { 0xbf64faf0, 0x5906, 0x426c, 0xb4, 0xbc, 0x7b, 0x75, 0x3c, 0xbe, 0x81, 0x9f };
  /*[id(0x00000000)]*/ int get_Item(int Index, out DWINVARIANT out_Value);
  /*[id(0x00000001)]*/ int get_Count(out int out_Count);
  /*[id(0x00000002)]*/ int get_length(out int out_Count);
  /*[id(0xFFFFFFFC)]*/ int _NewEnum(out IUnknown out_Enum);
}

interface ITextStream : IDispatch {
  mixin(uuid("53bad8c1-e718-11cf-893d-00a0c9054228"));
  // static DWINGUID IID = { 0x53bad8c1, 0xe718, 0x11cf, 0x89, 0x3d, 0x00, 0xa0, 0xc9, 0x05, 0x42, 0x28 };
  /*[id(0x00002710)]*/ int get_Line(out int Line);
  /*[id(0xFFFFFDEF)]*/ int get_Column(out int Column);
  /*[id(0x00002712)]*/ int get_AtEndOfStream(out short EOS);
  /*[id(0x00002713)]*/ int get_AtEndOfLine(out short EOL);
  /*[id(0x00002714)]*/ int Read(int Characters, out wchar* Text);
  /*[id(0x00002715)]*/ int ReadLine(out wchar* Text);
  /*[id(0x00002716)]*/ int ReadAll(out wchar* Text);
  /*[id(0x00002717)]*/ int Write(wchar* Text);
  /*[id(0x00002718)]*/ int WriteLine(wchar* Text);
  /*[id(0x00002719)]*/ int WriteBlankLines(int Lines);
  /*[id(0x0000271A)]*/ int Skip(int Characters);
  /*[id(0x0000271B)]*/ int SkipLine();
  /*[id(0x0000271C)]*/ int Close();
}

interface IFileSystem : IDispatch {
  mixin(uuid("0ab5a3d0-e5b6-11d0-abf5-00a0c90fffc0"));
  // static DWINGUID IID = { 0x0ab5a3d0, 0xe5b6, 0x11d0, 0xab, 0xf5, 0x00, 0xa0, 0xc9, 0x0f, 0xff, 0xc0 };
  /*[id(0x0000271A)]*/ int get_Drives(out IDriveCollection ppdrives);
  /*[id(0x00002710)]*/ int BuildPath(wchar* Path, wchar* Name, out wchar* pbstrResult);
  /*[id(0x00002714)]*/ int GetDriveName(wchar* Path, out wchar* pbstrResult);
  /*[id(0x00002715)]*/ int GetParentFolderName(wchar* Path, out wchar* pbstrResult);
  /*[id(0x00002716)]*/ int GetFileName(wchar* Path, out wchar* pbstrResult);
  /*[id(0x00002717)]*/ int GetBaseName(wchar* Path, out wchar* pbstrResult);
  /*[id(0x00002718)]*/ int GetExtensionName(wchar* Path, out wchar* pbstrResult);
  /*[id(0x00002712)]*/ int GetAbsolutePathName(wchar* Path, out wchar* pbstrResult);
  /*[id(0x00002713)]*/ int GetTempName(out wchar* pbstrResult);
  /*[id(0x0000271F)]*/ int DriveExists(wchar* DriveSpec, out short pfExists);
  /*[id(0x00002720)]*/ int FileExists(wchar* FileSpec, out short pfExists);
  /*[id(0x00002721)]*/ int FolderExists(wchar* FolderSpec, out short pfExists);
  /*[id(0x0000271B)]*/ int GetDrive(wchar* DriveSpec, out IDrive ppdrive);
  /*[id(0x0000271C)]*/ int GetFile(wchar* FilePath, out IFile ppfile);
  /*[id(0x0000271D)]*/ int GetFolder(wchar* FolderPath, out IFolder ppfolder);
  /*[id(0x0000271E)]*/ int GetSpecialFolder(SpecialFolderConst SpecialFolder, out IFolder ppfolder);
  /*[id(0x000004B0)]*/ int DeleteFile(wchar* FileSpec, short Force);
  /*[id(0x000004B1)]*/ int DeleteFolder(wchar* FolderSpec, short Force);
  /*[id(0x000004B4)]*/ int MoveFile(wchar* Source, wchar* Destination);
  /*[id(0x000004B5)]*/ int MoveFolder(wchar* Source, wchar* Destination);
  /*[id(0x000004B2)]*/ int CopyFile(wchar* Source, wchar* Destination, short OverWriteFiles);
  /*[id(0x000004B3)]*/ int CopyFolder(wchar* Source, wchar* Destination, short OverWriteFiles);
  /*[id(0x00000460)]*/ int CreateFolder(wchar* Path, out IFolder ppfolder);
  /*[id(0x0000044D)]*/ int CreateTextFile(wchar* FileName, short Overwrite, short Unicode, out ITextStream ppts);
  /*[id(0x0000044C)]*/ int OpenTextFile(wchar* FileName, IOMode IOMode, short Create, Tristate Format, out ITextStream ppts);
}

interface IDriveCollection : IDispatch {
  mixin(uuid("c7c3f5a1-88a3-11d0-abcb-00a0c90fffc0"));
  // static DWINGUID IID = { 0xc7c3f5a1, 0x88a3, 0x11d0, 0xab, 0xcb, 0x00, 0xa0, 0xc9, 0x0f, 0xff, 0xc0 };
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT Key, out IDrive ppdrive);
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown ppenum);
  /*[id(0x00000001)]*/ int get_Count(out int plCount);
}

interface IDrive : IDispatch {
  mixin(uuid("c7c3f5a0-88a3-11d0-abcb-00a0c90fffc0"));
  // static DWINGUID IID = { 0xc7c3f5a0, 0x88a3, 0x11d0, 0xab, 0xcb, 0x00, 0xa0, 0xc9, 0x0f, 0xff, 0xc0 };
  /*[id(0x00000000)]*/ int get_Path(out wchar* pbstrPath);
  /*[id(0x00002710)]*/ int get_DriveLetter(out wchar* pbstrLetter);
  /*[id(0x00002711)]*/ int get_ShareName(out wchar* pbstrShareName);
  /*[id(0x00002712)]*/ int get_DriveType(out DriveTypeConst pdt);
  /*[id(0x00002713)]*/ int get_RootFolder(out IFolder ppfolder);
  /*[id(0x00002715)]*/ int get_AvailableSpace(out DWINVARIANT pvarAvail);
  /*[id(0x00002714)]*/ int get_FreeSpace(out DWINVARIANT pvarFree);
  /*[id(0x00002716)]*/ int get_TotalSize(out DWINVARIANT pvarTotal);
  /*[id(0x00002717)]*/ int get_VolumeName(out wchar* pbstrName);
  /*[id(0x00002717)]*/ int set_VolumeName(wchar* pbstrName);
  /*[id(0x00002718)]*/ int get_FileSystem(out wchar* pbstrFileSystem);
  /*[id(0x00002719)]*/ int get_SerialNumber(out int pulSerialNumber);
  /*[id(0x0000271A)]*/ int get_IsReady(out short pfReady);
}

interface IFolder : IDispatch {
  mixin(uuid("c7c3f5a2-88a3-11d0-abcb-00a0c90fffc0"));
  // static DWINGUID IID = { 0xc7c3f5a2, 0x88a3, 0x11d0, 0xab, 0xcb, 0x00, 0xa0, 0xc9, 0x0f, 0xff, 0xc0 };
  /*[id(0x00000000)]*/ int get_Path(out wchar* pbstrPath);
  /*[id(0x000003E8)]*/ int get_Name(out wchar* pbstrName);
  /*[id(0x000003E8)]*/ int set_Name(wchar* pbstrName);
  /*[id(0x000003EA)]*/ int get_ShortPath(out wchar* pbstrPath);
  /*[id(0x000003E9)]*/ int get_ShortName(out wchar* pbstrName);
  /*[id(0x000003EC)]*/ int get_Drive(out IDrive ppdrive);
  /*[id(0x000003ED)]*/ int get_ParentFolder(out IFolder ppfolder);
  /*[id(0x000003EB)]*/ int get_Attributes(out FileAttribute pfa);
  /*[id(0x000003EB)]*/ int set_Attributes(FileAttribute pfa);
  /*[id(0x000003EE)]*/ int get_DateCreated(out double pdate);
  /*[id(0x000003EF)]*/ int get_DateLastModified(out double pdate);
  /*[id(0x000003F0)]*/ int get_DateLastAccessed(out double pdate);
  /*[id(0x000003F2)]*/ int get_Type(out wchar* pbstrType);
  /*[id(0x000004B1)]*/ int Delete(short Force);
  /*[id(0x000004B3)]*/ int Copy(wchar* Destination, short OverWriteFiles);
  /*[id(0x000004B5)]*/ int Move(wchar* Destination);
  /*[id(0x00002710)]*/ int get_IsRootFolder(out short pfRootFolder);
  /*[id(0x000003F1)]*/ int get_Size(out DWINVARIANT pvarSize);
  /*[id(0x00002711)]*/ int get_SubFolders(out IFolderCollection ppfolders);
  /*[id(0x00002712)]*/ int get_Files(out IFileCollection ppfiles);
  /*[id(0x0000044D)]*/ int CreateTextFile(wchar* FileName, short Overwrite, short Unicode, out ITextStream ppts);
}

interface IFolderCollection : IDispatch {
  mixin(uuid("c7c3f5a3-88a3-11d0-abcb-00a0c90fffc0"));
  // static DWINGUID IID = { 0xc7c3f5a3, 0x88a3, 0x11d0, 0xab, 0xcb, 0x00, 0xa0, 0xc9, 0x0f, 0xff, 0xc0 };
  /*[id(0x00000002)]*/ int Add(wchar* Name, out IFolder ppfolder);
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT Key, out IFolder ppfolder);
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown ppenum);
  /*[id(0x00000001)]*/ int get_Count(out int plCount);
}

interface IFileCollection : IDispatch {
  mixin(uuid("c7c3f5a5-88a3-11d0-abcb-00a0c90fffc0"));
  // static DWINGUID IID = { 0xc7c3f5a5, 0x88a3, 0x11d0, 0xab, 0xcb, 0x00, 0xa0, 0xc9, 0x0f, 0xff, 0xc0 };
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT Key, out IFile ppfile);
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown ppenum);
  /*[id(0x00000001)]*/ int get_Count(out int plCount);
}

interface IFile : IDispatch {
  mixin(uuid("c7c3f5a4-88a3-11d0-abcb-00a0c90fffc0"));
  // static DWINGUID IID = { 0xc7c3f5a4, 0x88a3, 0x11d0, 0xab, 0xcb, 0x00, 0xa0, 0xc9, 0x0f, 0xff, 0xc0 };
  /*[id(0x00000000)]*/ int get_Path(out wchar* pbstrPath);
  /*[id(0x000003E8)]*/ int get_Name(out wchar* pbstrName);
  /*[id(0x000003E8)]*/ int set_Name(wchar* pbstrName);
  /*[id(0x000003EA)]*/ int get_ShortPath(out wchar* pbstrPath);
  /*[id(0x000003E9)]*/ int get_ShortName(out wchar* pbstrName);
  /*[id(0x000003EC)]*/ int get_Drive(out IDrive ppdrive);
  /*[id(0x000003ED)]*/ int get_ParentFolder(out IFolder ppfolder);
  /*[id(0x000003EB)]*/ int get_Attributes(out FileAttribute pfa);
  /*[id(0x000003EB)]*/ int set_Attributes(FileAttribute pfa);
  /*[id(0x000003EE)]*/ int get_DateCreated(out double pdate);
  /*[id(0x000003EF)]*/ int get_DateLastModified(out double pdate);
  /*[id(0x000003F0)]*/ int get_DateLastAccessed(out double pdate);
  /*[id(0x000003F1)]*/ int get_Size(out DWINVARIANT pvarSize);
  /*[id(0x000003F2)]*/ int get_Type(out wchar* pbstrType);
  /*[id(0x000004B0)]*/ int Delete(short Force);
  /*[id(0x000004B2)]*/ int Copy(wchar* Destination, short OverWriteFiles);
  /*[id(0x000004B4)]*/ int Move(wchar* Destination);
  /*[id(0x0000044C)]*/ int OpenAsTextStream(IOMode IOMode, Tristate Format, out ITextStream ppts);
}

interface IFileSystem3 : IFileSystem {
  mixin(uuid("2a0b9d10-4b87-11d3-a97a-00104b365c9f"));
  // static DWINGUID IID = { 0x2a0b9d10, 0x4b87, 0x11d3, 0xa9, 0x7a, 0x00, 0x10, 0x4b, 0x36, 0x5c, 0x9f };
  /*[id(0x00004E20)]*/ int GetStandardStream(StandardStreamTypes StandardStreamType, short Unicode, out ITextStream ppts);
  /*[id(0x00004E2A)]*/ int GetFileVersion(wchar* FileName, out wchar* FileVersion);
}

// CoClasses

abstract class FileSystemObject {
  mixin(uuid("0d43fe01-f093-11cf-8940-00a0c9054228"));
  // static DWINGUID CLSID = { 0x0d43fe01, 0xf093, 0x11cf, 0x89, 0x40, 0x00, 0xa0, 0xc9, 0x05, 0x42, 0x28 };
  mixin Interfaces!(IFileSystem3);
}

abstract class Drive {
  mixin(uuid("c7c3f5b1-88a3-11d0-abcb-00a0c90fffc0"));
  // static DWINGUID CLSID = { 0xc7c3f5b1, 0x88a3, 0x11d0, 0xab, 0xcb, 0x00, 0xa0, 0xc9, 0x0f, 0xff, 0xc0 };
  mixin Interfaces!(IDrive);
}

abstract class Drives {
  mixin(uuid("c7c3f5b2-88a3-11d0-abcb-00a0c90fffc0"));
  // static DWINGUID CLSID = { 0xc7c3f5b2, 0x88a3, 0x11d0, 0xab, 0xcb, 0x00, 0xa0, 0xc9, 0x0f, 0xff, 0xc0 };
  mixin Interfaces!(IDriveCollection);
}

abstract class Folder {
  mixin(uuid("c7c3f5b3-88a3-11d0-abcb-00a0c90fffc0"));
  // static DWINGUID CLSID = { 0xc7c3f5b3, 0x88a3, 0x11d0, 0xab, 0xcb, 0x00, 0xa0, 0xc9, 0x0f, 0xff, 0xc0 };
  mixin Interfaces!(IFolder);
}

abstract class Folders {
  mixin(uuid("c7c3f5b4-88a3-11d0-abcb-00a0c90fffc0"));
  // static DWINGUID CLSID = { 0xc7c3f5b4, 0x88a3, 0x11d0, 0xab, 0xcb, 0x00, 0xa0, 0xc9, 0x0f, 0xff, 0xc0 };
  mixin Interfaces!(IFolderCollection);
}

abstract class File {
  mixin(uuid("c7c3f5b5-88a3-11d0-abcb-00a0c90fffc0"));
  // static DWINGUID CLSID = { 0xc7c3f5b5, 0x88a3, 0x11d0, 0xab, 0xcb, 0x00, 0xa0, 0xc9, 0x0f, 0xff, 0xc0 };
  mixin Interfaces!(IFile);
}

abstract class Files {
  mixin(uuid("c7c3f5b6-88a3-11d0-abcb-00a0c90fffc0"));
  // static DWINGUID CLSID = { 0xc7c3f5b6, 0x88a3, 0x11d0, 0xab, 0xcb, 0x00, 0xa0, 0xc9, 0x0f, 0xff, 0xc0 };
  mixin Interfaces!(IFileCollection);
}

abstract class TextStream {
  mixin(uuid("0bb02ec0-ef49-11cf-8940-00a0c9054228"));
  // static DWINGUID CLSID = { 0x0bb02ec0, 0xef49, 0x11cf, 0x89, 0x40, 0x00, 0xa0, 0xc9, 0x05, 0x42, 0x28 };
  mixin Interfaces!(ITextStream);
}

// Windows Script Host Object
abstract class IHost_Class {
  mixin(uuid("60254ca2-953b-11cf-8c96-00aa00b8708c"));
  // static DWINGUID CLSID = { 0x60254ca2, 0x953b, 0x11cf, 0x8c, 0x96, 0x00, 0xaa, 0x00, 0xb8, 0x70, 0x8c };
  mixin Interfaces!(IHost);
}

// Arguments Collection Object
abstract class IArguments_Class {
  mixin(uuid("60254ca4-953b-11cf-8c96-00aa00b8708c"));
  // static DWINGUID CLSID = { 0x60254ca4, 0x953b, 0x11cf, 0x8c, 0x96, 0x00, 0xaa, 0x00, 0xb8, 0x70, 0x8c };
  mixin Interfaces!(IArguments2);
}

// Named Arguments Collection Object
abstract class IWSHNamedArguments_Class {
  mixin(uuid("54a24970-b1e6-11d3-a286-00104bd35090"));
  // static DWINGUID CLSID = { 0x54a24970, 0xb1e6, 0x11d3, 0xa2, 0x86, 0x00, 0x10, 0x4b, 0xd3, 0x50, 0x90 };
  mixin Interfaces!(IWSHNamedArguments);
}

// Unnamed Arguments Collection Object
abstract class IWSHUnnamedArguments_Class {
  mixin(uuid("2ac0525f-38ed-4b87-b9a7-78132d32d58f"));
  // static DWINGUID CLSID = { 0x2ac0525f, 0x38ed, 0x4b87, 0xb9, 0xa7, 0x78, 0x13, 0x2d, 0x32, 0xd5, 0x8f };
  mixin Interfaces!(IWSHUnnamedArguments);
}
