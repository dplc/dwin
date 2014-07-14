// SccCom 1.0 Type Library
// Version 1.0

/*[uuid("a80f1100-d1f8-11d0-b5c5-00a024297ed9")]*/
//module dwin.sys.win32.com.tlb.more.scccom;
module dwin.sys.win32.com.tlb.more.sccsccp;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

// Smart Card File Access Reference Types
enum tagREFTYPE {
  SC_TYPE_BY_NAME = 0x00000000,
  SC_TYPE_BY_ID = 0x00000001,
  SC_TYPE_BY_SHORT_ID = 0x00000002,
}

// Smart Card File/Verification Flags
enum tagSCARD_FLAGS {
  SC_FL_NO_FLAGS = 0x00000000,
  SC_FL_SECURE_MESSAGING = 0x00000001,
  SC_FL_REPLACE = 0x00000002,
  SC_FL_ERASE = 0x00000004,
  SC_FL_OR = 0x00000008,
  SC_FL_AND = 0x00000010,
  SC_FL_RECURSIVE = 0x00000020,
  SC_FL_NON_RECURSIVE = 0x00000040,
  SC_FL_IHV_GLOBAL = 0x00000080,
  SC_FL_IHV_LOCAL = 0x00000100,
  SC_FL_IHV_ENABLE = 0x00000200,
  SC_FL_IHV_DISABLE = 0x00000400,
  SC_FL_IHV_CHANGE = 0x00000800,
  SC_FL_PREALLOCATE = 0x00001000,
  SC_FL_GET_ALL_PROPERTIES = 0x00002000,
  SC_FL_STAT_DEFAULT = 0x00004000,
  SC_FL_IHV_CHECKONLY = 0x00008000,
}

// Smart Card File Access File Types
enum tagFILETYPE {
  SC_TYPE_DIRECTORIES = 0x00000000,
  SC_TYPE_FILES = 0x00000001,
  SC_TYPE_ALL_FILES = 0x00000002,
  SC_TYPE_DIRECTORY_FILE = 0x00000003,
  SC_TYPE_TRANSPARENT_EF = 0x00000004,
  SC_TYPE_FIXED_EF = 0x00000005,
  SC_TYPE_CYCLIC_EF = 0x00000006,
  SC_TYPE_VARIABLE_EF = 0x00000007,
}

enum tagTYPEKIND {
  TKIND_ENUM = 0x00000000,
  TKIND_RECORD = 0x00000001,
  TKIND_MODULE = 0x00000002,
  TKIND_INTERFACE = 0x00000003,
  TKIND_DISPATCH = 0x00000004,
  TKIND_COCLASS = 0x00000005,
  TKIND_ALIAS = 0x00000006,
  TKIND_UNION = 0x00000007,
  TKIND_MAX = 0x00000008,
}

enum tagDESCKIND {
  DESCKIND_NONE = 0x00000000,
  DESCKIND_FUNCDESC = 0x00000001,
  DESCKIND_VARDESC = 0x00000002,
  DESCKIND_TYPECOMP = 0x00000003,
  DESCKIND_IMPLICITAPPOBJ = 0x00000004,
  DESCKIND_MAX = 0x00000005,
}

enum tagFUNCKIND {
  FUNC_VIRTUAL = 0x00000000,
  FUNC_PUREVIRTUAL = 0x00000001,
  FUNC_NONVIRTUAL = 0x00000002,
  FUNC_STATIC = 0x00000003,
  FUNC_DISPATCH = 0x00000004,
}

enum tagINVOKEKIND {
  INVOKE_FUNC = 0x00000001,
  INVOKE_PROPERTYGET = 0x00000002,
  INVOKE_PROPERTYPUT = 0x00000004,
  INVOKE_PROPERTYPUTREF = 0x00000008,
}

enum tagCALLCONV {
  CC_FASTCALL = 0x00000000,
  CC_CDECL = 0x00000001,
  CC_MSCPASCAL = 0x00000002,
  CC_PASCAL = 0x00000002,
  CC_MACPASCAL = 0x00000003,
  CC_STDCALL = 0x00000004,
  CC_FPFASTCALL = 0x00000005,
  CC_SYSCALL = 0x00000006,
  CC_MPWCDECL = 0x00000007,
  CC_MPWPASCAL = 0x00000008,
  CC_MAX = 0x00000009,
}

enum tagVARKIND {
  VAR_PERINSTANCE = 0x00000000,
  VAR_STATIC = 0x00000001,
  VAR_CONST = 0x00000002,
  VAR_DISPATCH = 0x00000003,
}

enum tagSYSKIND {
  SYS_WIN16 = 0x00000000,
  SYS_WIN32 = 0x00000001,
  SYS_MAC = 0x00000002,
  SYS_WIN64 = 0x00000003,
}

// Smart Card File Access Seek Types
enum tagSEEKTYPE {
  SC_SEEK_FROM_BEGINNING = 0x00000000,
  SC_SEEK_FROM_END = 0x00000001,
  SC_SEEK_RELATIVE = 0x00000002,
}

// SCard Share Modes
enum tagSCARD_SHARE_MODES {
  EXCLUSIVE = 0x00000001,
  SHARED = 0x00000002,
}

// SCard States
enum tagSCARD_STATES {
  ABSENT = 0x00000001,
  PRESENT = 0x00000002,
  SWALLOWED = 0x00000003,
  POWERED = 0x00000004,
  NEGOTIABLEMODE = 0x00000005,
  SPECIFICMODE = 0x00000006,
}

// SCard Protocols
enum tagSCARD_PROTOCOLS {
  T0 = 0x00000001,
  T1 = 0x00000002,
  RAW = 0x000000FF,
}

// SCard Dispositions
enum tagSCARD_DISPOSITIONS {
  LEAVE = 0x00000000,
  RESET = 0x00000001,
  UNPOWER = 0x00000002,
  EJECT = 0x00000003,
}

// Unions

union __MIDL_IOleAutomationTypes_0001 {
  _wireSAFEARR_BSTR BstrStr;
  _wireSAFEARR_UNKNOWN UnknownStr;
  _wireSAFEARR_DISPATCH DispatchStr;
  _wireSAFEARR_VARIANT VariantStr;
  _wireSAFEARR_BRECORD RecordStr;
  _wireSAFEARR_HAVEIID HaveIidStr;
  _BYTE_SIZEDARR ByteStr;
  _SHORT_SIZEDARR WordStr;
  _LONG_SIZEDARR LongStr;
  _HYPER_SIZEDARR HyperStr;
}

union __MIDL_IOleAutomationTypes_0004 {
  long llVal;
  int lVal;
  ubyte bVal;
  short iVal;
  float fltVal;
  double dblVal;
  short boolVal;
  int scode;
  long cyVal;
  double date;
  _FLAGGED_WORD_BLOB* bstrVal;
  IUnknown punkVal;
  IDispatch pdispVal;
  _wireSAFEARRAY** parray;
  _wireBRECORD* brecVal;
  ubyte* pbVal;
  short* piVal;
  int* plVal;
  long* pllVal;
  float* pfltVal;
  double* pdblVal;
  short* pboolVal;
  int* pscode;
  long* pcyVal;
  double* pdate;
  _FLAGGED_WORD_BLOB** pbstrVal;
  IUnknown* ppunkVal;
  IDispatch* ppdispVal;
  _wireSAFEARRAY*** pparray;
  _wireVariant** pvarVal;
  ubyte cVal;
  ushort uiVal;
  uint ulVal;
  ulong ullVal;
  int intVal;
  uint uintVal;
  DECIMAL decVal;
  DECIMAL* pdecVal;
  ubyte* pcVal;
  ushort* puiVal;
  uint* pulVal;
  ulong* pullVal;
  int* pintVal;
  uint* puintVal;
}

union __MIDL_IOleAutomationTypes_0005 {
  tagTYPEDESC* lptdesc;
  tagARRAYDESC* lpadesc;
  uint hreftype;
}

union __MIDL_IOleAutomationTypes_0006 {
  uint oInst;
  DWINVARIANT* lpvarValue;
}

// Structs

struct _LARGE_INTEGER {
  long QuadPart;
}

struct _ULARGE_INTEGER {
  ulong QuadPart;
}

struct tagSTATSTG {
  wchar* pwcsName;
  uint type;
  _ULARGE_INTEGER cbSize;
  _FILETIME mtime;
  _FILETIME ctime;
  _FILETIME atime;
  uint grfMode;
  uint grfLocksSupported;
 DWINGUID clsid;
  uint grfStateBits;
  uint reserved;
}

struct _FILETIME {
  uint dwLowDateTime;
  uint dwHighDateTime;
}

// Stream status structure.
struct tagSTATSTRUCT {
  int type;
  int cbSize;
  int grfMode;
  int grfLocksSupported;
  int grfStateBits;
}

// TLV Structures
struct tagTLV_TABLE {
  int cbSize;
  ubyte* byData;
}

struct _wireSAFEARRAY {
  ushort cDims;
  ushort fFeatures;
  uint cbElements;
  uint cLocks;
  _wireSAFEARRAY_UNION uArrayStructs;
  tagSAFEARRAYBOUND* rgsabound;
}

struct _wireSAFEARRAY_UNION {
  uint sfType;
  __MIDL_IOleAutomationTypes_0001 u;
}

struct _wireSAFEARR_BSTR {
  uint Size;
  _FLAGGED_WORD_BLOB** aBstr;
}

struct _FLAGGED_WORD_BLOB {
  uint fFlags;
  uint clSize;
  ushort* asData;
}

struct _wireSAFEARR_UNKNOWN {
  uint Size;
  IUnknown* apUnknown;
}

struct _wireSAFEARR_DISPATCH {
  uint Size;
  IDispatch* apDispatch;
}

struct _wireSAFEARR_VARIANT {
  uint Size;
  _wireVariant** aVariant;
}

struct _wireVariant {
  uint clSize;
  uint rpcReserved;
  ushort vt;
  ushort wReserved1;
  ushort wReserved2;
  ushort wReserved3;
  __MIDL_IOleAutomationTypes_0004 __MIDL_0006;
}

struct _wireBRECORD {
  uint fFlags;
  uint clSize;
  IRecordInfo pRecInfo;
  ubyte* pRecord;
}

struct tagTYPEATTR {
 DWINGUID guid;
  uint lcid;
  uint dwReserved;
  int memidConstructor;
  int memidDestructor;
  wchar* lpstrSchema;
  uint cbSizeInstance;
  tagTYPEKIND typekind;
  ushort cFuncs;
  ushort cVars;
  ushort cImplTypes;
  ushort cbSizeVft;
  ushort cbAlignment;
  ushort wTypeFlags;
  ushort wMajorVerNum;
  ushort wMinorVerNum;
  tagTYPEDESC tdescAlias;
  tagIDLDESC idldescType;
}

struct tagTYPEDESC {
  __MIDL_IOleAutomationTypes_0005 __MIDL_0008;
  ushort vt;
}

struct tagARRAYDESC {
  tagTYPEDESC tdescElem;
  ushort cDims;
  tagSAFEARRAYBOUND* rgbounds;
}

struct tagSAFEARRAYBOUND {
  uint cElements;
  int lLbound;
}

struct tagIDLDESC {
  ULONG_PTR dwReserved;
  ushort wIDLFlags;
}

struct tagFUNCDESC {
  int memid;
  int* lprgscode;
  tagELEMDESC* lprgelemdescParam;
  tagFUNCKIND funckind;
  tagINVOKEKIND invkind;
  tagCALLCONV callconv;
  short cParams;
  short cParamsOpt;
  short oVft;
  short cScodes;
  tagELEMDESC elemdescFunc;
  ushort wFuncFlags;
}

struct tagELEMDESC {
  tagTYPEDESC tdesc;
  tagPARAMDESC paramdesc;
}

struct tagPARAMDESC {
  tagPARAMDESCEX* pparamdescex;
  ushort wParamFlags;
}

struct tagPARAMDESCEX {
  uint cBytes;
  DWINVARIANT varDefaultValue;
}

struct tagVARDESC {
  int memid;
  wchar* lpstrSchema;
  __MIDL_IOleAutomationTypes_0006 __MIDL_0009;
  tagELEMDESC elemdescVar;
  ushort wVarFlags;
  tagVARKIND varkind;
}

struct tagTLIBATTR {
 DWINGUID guid;
  uint lcid;
  tagSYSKIND syskind;
  ushort wMajorVerNum;
  ushort wMinorVerNum;
  ushort wLibFlags;
}

struct _wireSAFEARR_BRECORD {
  uint Size;
  _wireBRECORD** aRecord;
}

struct _wireSAFEARR_HAVEIID {
  uint Size;
  IUnknown* apUnknown;
 DWINGUID iid;
}

struct _BYTE_SIZEDARR {
  uint clSize;
  ubyte* pData;
}

struct _SHORT_SIZEDARR {
  uint clSize;
  ushort* pData;
}

struct _LONG_SIZEDARR {
  uint clSize;
  uint* pData;
}

struct _HYPER_SIZEDARR {
  uint clSize;
  long* pData;
}

// Aliases

alias ubyte BYTE;

alias STATSTRUCT* LPSTATSTRUCT;

// Stream status structure.
alias tagSTATSTRUCT STATSTRUCT;

// Smart Card File Access Reference Types
alias tagREFTYPE REFTYPE;

alias uint ULONG_PTR;

// TLV Structures
alias tagTLV_TABLE TLV_TABLE;

// Smart Card File/Verification Flags
alias tagSCARD_FLAGS SCARD_FLAGS;

// Smart Card File Access File Types
alias tagFILETYPE FILETYPE;

alias _wireSAFEARRAY** wirePSAFEARRAY;

alias uint DWORD;

// Smart Card File Access Seek Types
alias tagSEEKTYPE SEEKTYPE;

// SCard Share Modes
alias tagSCARD_SHARE_MODES SCARD_SHARE_MODES;

// SCard States
alias tagSCARD_STATES SCARD_STATES;

// SCard Protocols
alias tagSCARD_PROTOCOLS SCARD_PROTOCOLS;

// SCard Dispositions
alias tagSCARD_DISPOSITIONS SCARD_DISPOSITIONS;

// Interfaces

// ISCardAuth Interface
interface ISCardAuth : IDispatch {
  mixin(uuid("7b063d61-6e40-11d0-b858-00c04fd424b9"));
  // static DWINGUID IID = { 0x7b063d61, 0x6e40, 0x11d0, 0xb8, 0x58, 0x00, 0xc0, 0x4f, 0xd4, 0x24, 0xb9 };
  // Allows application to authenticate itself to the ICC
  /*[id(0x00000001)]*/ int APP_Auth(int lAlgoID, IByteBuffer pParam, IByteBuffer pBuffer);
  // Returns a challenge from ICC 
  /*[id(0x00000002)]*/ int GetChallenge(int lAlgoID, IByteBuffer pParam, ref int lpLengthOfChallenge, ref IByteBuffer ppBuffer);
  // Allows application to authenticate the ICC
  /*[id(0x00000003)]*/ int ICC_Auth(int lAlgoID, IByteBuffer pParam, ref int lpLength, ref IByteBuffer ppBuffer);
  // Called to initialize the object. This is an internal ONLY use function.
  /*[id(0x00000004)]*/ int Initialize(int* lp);
  // Allows a remote app to authenticate the Client
  /*[id(0x00000005)]*/ int User_Auth(int lAlgoID, IByteBuffer pParam, ref int lpLength, ref IByteBuffer ppBuffer);
}

// IByteBuffer Interface
interface IByteBuffer : IDispatch {
  mixin(uuid("e126f8fe-a7af-11d0-b88a-00c04fd424b9"));
  // static DWINGUID IID = { 0xe126f8fe, 0xa7af, 0x11d0, 0xb8, 0x8a, 0x00, 0xc0, 0x4f, 0xd4, 0x24, 0xb9 };
  // Returns a pointer to the internal IStream object.
  /*[id(0x00000000)]*/ int get_Stream(out IStream ppStream);
  // Returns a pointer to the internal IStream object.
  /*[id(0x00000000)]*/ int set_Stream(IStream ppStream);
  // Creates a new object with its own seek pointer that references the same bytes as the original.
  /*[id(0x00000001)]*/ int Clone(ref IByteBuffer ppByteBuffer);
  // Ensures that any changes made to an object open in transacted mode are reflected in the parent storage.
  /*[id(0x00000002)]*/ int Commit(int grfCommitFlags);
  // Copies a specified number of bytes from the current seek pointer in the object to the current seek pointer in another object.
  /*[id(0x00000003)]*/ int CopyTo(ref IByteBuffer ppByteBuffer, int cb, int pcbRead, int pcbWritten);
  // Initializes the object. This must be called prior to calling any other methods!
  /*[id(0x00000004)]*/ int Initialize(int lSize, BYTE* pData);
  // Restricts access to a specified range of bytes in the buffer object.
  /*[id(0x00000005)]*/ int LockRegion(int libOffset, int cb, int dwLockType);
  // Reads a specified number of bytes from the buffer object into memory starting at the current seek pointer.
  /*[id(0x00000006)]*/ int Read(ref BYTE pByte, int cb, int pcbRead);
  // Discards all changes that have been made to a transacted stream since the last IByteBuffer::Commit call.
  /*[id(0x00000007)]*/ int Revert();
  // Changes the seek pointer to a new location relative to the beginning of the buffer, to the end of the buffer, or to the current seek pointer.
  /*[id(0x00000008)]*/ int Seek(int dlibMove, int dwOrigin, int plibNewPosition);
  // Changes the size of the stream object.
  /*[id(0x00000009)]*/ int SetSize(int libNewSize);
  // Retrieves the STATSTG structure for this object.
  /*[id(0x0000000A)]*/ int Stat(ref LPSTATSTRUCT pstatstg, int grfStatFlag);
  // Removes the access restriction on a range of bytes previously restricted with IByteBuffer::LockRegion.
  /*[id(0x0000000B)]*/ int UnlockRegion(int libOffset, int cb, int dwLockType);
  // Writes a specified number from bytes into the stream object starting at the current seek pointer.
  /*[id(0x0000000C)]*/ int Write(ref BYTE pByte, int cb, ref int pcbWritten);
}

interface IStream : ISequentialStream {
  mixin(uuid("0000000c-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x0000000c, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60020000)]*/ int RemoteSeek(_LARGE_INTEGER dlibMove, uint dwOrigin, out _ULARGE_INTEGER plibNewPosition);
  /*[id(0x60020001)]*/ int SetSize(_ULARGE_INTEGER libNewSize);
  /*[id(0x60020002)]*/ int RemoteCopyTo(IStream pstm, _ULARGE_INTEGER cb, out _ULARGE_INTEGER pcbRead, out _ULARGE_INTEGER pcbWritten);
  /*[id(0x60020003)]*/ int Commit(uint grfCommitFlags);
  /*[id(0x60020004)]*/ int Revert();
  /*[id(0x60020005)]*/ int LockRegion(_ULARGE_INTEGER libOffset, _ULARGE_INTEGER cb, uint dwLockType);
  /*[id(0x60020006)]*/ int UnlockRegion(_ULARGE_INTEGER libOffset, _ULARGE_INTEGER cb, uint dwLockType);
  /*[id(0x60020007)]*/ int Stat(out tagSTATSTG pstatstg, uint grfStatFlag);
  /*[id(0x60020008)]*/ int Clone(out IStream ppstm);
}

interface ISequentialStream : IUnknown {
  mixin(uuid("0c733a30-2a1c-11ce-ade5-00aa0044773d"));
  // static DWINGUID IID = { 0x0c733a30, 0x2a1c, 0x11ce, 0xad, 0xe5, 0x00, 0xaa, 0x00, 0x44, 0x77, 0x3d };
  /*[id(0x60010000)]*/ int RemoteRead(out ubyte pv, uint cb, out uint pcbRead);
  /*[id(0x60010001)]*/ int RemoteWrite(ubyte* pv, uint cb, out uint pcbWritten);
}

// ISCardFileAccess Interface
interface ISCardFileAccess : IDispatch {
  mixin(uuid("4029dd8a-5902-11d0-b84c-00c04fd424b9"));
  // static DWINGUID IID = { 0x4029dd8a, 0x5902, 0x11d0, 0xb8, 0x4c, 0x00, 0xc0, 0x4f, 0xd4, 0x24, 0xb9 };
  // Change the currently selected directory to the specified directory
  /*[id(0x00000001)]*/ int ChangeDir(REFTYPE REFTYPE, wchar* bstrNewDir);
  // Closes the specified file
  /*[id(0x00000002)]*/ int Close(ULONG_PTR hFile);
  // Create a file of the specified type at a specified location
  /*[id(0x00000003)]*/ int Create(REFTYPE REFTYPE, wchar* bstrPathSpec, ref TLV_TABLE ppTLVs, ref int lpcTLVs, SCARD_FLAGS flags, IByteBuffer pDataBuffer);
  // Deletes the specified file
  /*[id(0x00000004)]*/ int Delete(REFTYPE REFTYPE, wchar* bstrPathSpec, SCARD_FLAGS flags);
  // Retrieve a list of the FileSpecs of the specified type
  /*[id(0x00000005)]*/ int Directory(FILETYPE FILETYPE, out wirePSAFEARRAY ppFileList);
  // Retrieve the absolute path to the currently selected directory
  /*[id(0x00000006)]*/ int GetCurrentDir(out wchar* pbstrPathSpec);
  // Retrieve list of file capabilites.
  /*[id(0x00000007)]*/ int GetFileCapabilities(ref TLV_TABLE ppProperties, ref int plProperties, SCARD_FLAGS flags);
  // Retrieve the primitive data referred by tags (TLV) for the specified object
  /*[id(0x00000008)]*/ int GetProperties(REFTYPE REFTYPE, wchar* bstrPathSpec, ref TLV_TABLE ppTLV, ref int plcTLV, SCARD_FLAGS flags);
  // Called to initialize the object. This is an internal ONLY use function.
  /*[id(0x00000009)]*/ int Initialize(int* lp);
  // Invalidate the specified file (EF or DF)
  /*[id(0x0000000A)]*/ int Invalidate(wchar* bstrPathSpec, SCARD_FLAGS flags);
  // Opens the specified file for further use
  /*[id(0x0000000B)]*/ int Open(REFTYPE REFTYPE, wchar* bstrPathSpec, out ULONG_PTR phFile);
  // Read data from the specified file
  /*[id(0x0000000C)]*/ int Read(ULONG_PTR hFile, ref int lBytesToRead, out IByteBuffer ppBuffer, SCARD_FLAGS flags);
  // Rehabilitate the specified file (EF or DF)
  /*[id(0x0000000D)]*/ int Rehabilitate(wchar* bstrPathSpec, SCARD_FLAGS flags);
  // Selects the object from which access (read or write) will be done
  /*[id(0x0000000E)]*/ int Seek(ULONG_PTR hFile, int lOffset, SEEKTYPE Seek);
  // Set the primitive data referred by tags (TLV) for the specified object (file or directory)
  /*[id(0x0000000F)]*/ int SetProperties(REFTYPE REFTYPE, wchar* bstrPathSpec, TLV_TABLE* pTLV, int lcTLV, SCARD_FLAGS flags);
  // Write data to the specified file
  /*[id(0x00000010)]*/ int Write(ULONG_PTR hFile, int lLength, IByteBuffer pData, SCARD_FLAGS flags);
}

interface IRecordInfo : IUnknown {
  mixin(uuid("0000002f-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x0000002f, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RecordInit(void *pvNew);
  /*[id(0x60010001)]*/ int RecordClear(void* pvExisting);
  /*[id(0x60010002)]*/ int RecordCopy(void* pvExisting, void *pvNew);
  /*[id(0x60010003)]*/ int GetGuid(out DWINGUID pguid);
  /*[id(0x60010004)]*/ int GetName(out wchar* pbstrName);
  /*[id(0x60010005)]*/ int GetSize(out uint pcbSize);
  /*[id(0x60010006)]*/ int GetTypeInfo(out ITypeInfo ppTypeInfo);
  /*[id(0x60010007)]*/ int GetField(void* pvData, wchar* szFieldName, out DWINVARIANT pvarField);
  /*[id(0x60010008)]*/ int GetFieldNoCopy(void* pvData, wchar* szFieldName, out DWINVARIANT pvarField, void *ppvDataCArray);
  /*[id(0x60010009)]*/ int PutField(uint wFlags, void * pvData, wchar* szFieldName, DWINVARIANT* pvarField);
  /*[id(0x6001000A)]*/ int PutFieldNoCopy(uint wFlags, void * pvData, wchar* szFieldName, DWINVARIANT* pvarField);
  /*[id(0x6001000B)]*/ int GetFieldNames(ref uint pcNames, out wchar* rgBstrNames);
  /*[id(0x6001000C)]*/ int IsMatchingType(IRecordInfo pRecordInfo);
  /*[id(0x6001000D)]*/ void* RecordCreate();
  /*[id(0x6001000E)]*/ int RecordCreateCopy(void* pvSource, void *ppvDest);
  /*[id(0x6001000F)]*/ int RecordDestroy(void* pvRecord);
}

interface ITypeInfo : IUnknown {
  mixin(uuid("00020401-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00020401, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RemoteGetTypeAttr(out tagTYPEATTR ppTypeAttr, out DWORD pDummy);
  /*[id(0x60010001)]*/ int GetTypeComp(out ITypeComp ppTComp);
  /*[id(0x60010002)]*/ int RemoteGetFuncDesc(uint index, out tagFUNCDESC ppFuncDesc, out DWORD pDummy);
  /*[id(0x60010003)]*/ int RemoteGetVarDesc(uint index, out tagVARDESC ppVarDesc, out DWORD pDummy);
  /*[id(0x60010004)]*/ int RemoteGetNames(int memid, out wchar* rgBstrNames, uint cMaxNames, out uint pcNames);
  /*[id(0x60010005)]*/ int GetRefTypeOfImplType(uint index, out uint pRefType);
  /*[id(0x60010006)]*/ int GetImplTypeFlags(uint index, out int pImplTypeFlags);
  /*[id(0x60010007)]*/ int LocalGetIDsOfNames();
  /*[id(0x60010008)]*/ int LocalInvoke();
  /*[id(0x60010009)]*/ int RemoteGetDocumentation(int memid, uint refPtrFlags, out wchar* pbstrName, out wchar* pBstrDocString, out uint pdwHelpContext, out wchar* pBstrHelpFile);
  /*[id(0x6001000A)]*/ int RemoteGetDllEntry(int memid, tagINVOKEKIND invkind, uint refPtrFlags, out wchar* pBstrDllName, out wchar* pbstrName, out ushort pwOrdinal);
  /*[id(0x6001000B)]*/ int GetRefTypeInfo(uint hreftype, out ITypeInfo ppTInfo);
  /*[id(0x6001000C)]*/ int LocalAddressOfMember();
  /*[id(0x6001000D)]*/ int RemoteCreateInstance(ref DWINGUID riid, out IUnknown ppvObj);
  /*[id(0x6001000E)]*/ int GetMops(int memid, out wchar* pBstrMops);
  /*[id(0x6001000F)]*/ int RemoteGetContainingTypeLib(out ITypeLib ppTLib, out uint pIndex);
  /*[id(0x60010010)]*/ int LocalReleaseTypeAttr();
  /*[id(0x60010011)]*/ int LocalReleaseFuncDesc();
  /*[id(0x60010012)]*/ int LocalReleaseVarDesc();
}

interface ITypeComp : IUnknown {
  mixin(uuid("00020403-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00020403, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RemoteBind(wchar* szName, uint lHashVal, ushort wFlags, out ITypeInfo ppTInfo, out tagDESCKIND pDescKind, out tagFUNCDESC ppFuncDesc, out tagVARDESC ppVarDesc, out ITypeComp ppTypeComp, out DWORD pDummy);
  /*[id(0x60010001)]*/ int RemoteBindType(wchar* szName, uint lHashVal, out ITypeInfo ppTInfo);
}

interface ITypeLib : IUnknown {
  mixin(uuid("00020402-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00020402, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RemoteGetTypeInfoCount(out uint pcTInfo);
  /*[id(0x60010001)]*/ int GetTypeInfo(uint index, out ITypeInfo ppTInfo);
  /*[id(0x60010002)]*/ int GetTypeInfoType(uint index, out tagTYPEKIND pTKind);
  /*[id(0x60010003)]*/ int GetTypeInfoOfGuid(ref DWINGUID guid, out ITypeInfo ppTInfo);
  /*[id(0x60010004)]*/ int RemoteGetLibAttr(out tagTLIBATTR ppTLibAttr, out DWORD pDummy);
  /*[id(0x60010005)]*/ int GetTypeComp(out ITypeComp ppTComp);
  /*[id(0x60010006)]*/ int RemoteGetDocumentation(int index, uint refPtrFlags, out wchar* pbstrName, out wchar* pBstrDocString, out uint pdwHelpContext, out wchar* pBstrHelpFile);
  /*[id(0x60010007)]*/ int RemoteIsName(wchar* szNameBuf, uint lHashVal, out int pfName, out wchar* pBstrLibName);
  /*[id(0x60010008)]*/ int RemoteFindName(wchar* szNameBuf, uint lHashVal, out ITypeInfo ppTInfo, out int rgMemId, ref ushort pcFound, out wchar* pBstrLibName);
  /*[id(0x60010009)]*/ int LocalReleaseTLibAttr();
}

// ISCardManage Interface
interface ISCardManage : IDispatch {
  mixin(uuid("5e586211-5a09-11d0-b84c-00c04fd424b9"));
  // static DWINGUID IID = { 0x5e586211, 0x5a09, 0x11d0, 0xb8, 0x4c, 0x00, 0xc0, 0x4f, 0xd4, 0x24, 0xb9 };
  // Allows application to start communication with an ICC
  /*[id(0x00000001)]*/ int AttachByHandle(ULONG_PTR hICC);
  // Allows application request establishment of a context for a specific IFD.
  /*[id(0x00000002)]*/ int AttachByIFD(wchar* bstrIFDName, SCARD_SHARE_MODES flags);
  // Creates instance of ISCardFileAccess interface.
  /*[id(0x00000003)]*/ int CreateFileAccess(ISCardFileAccess* ppISCardFileAccess);
  // Creates instance of ISCardAuth interface.
  /*[id(0x00000004)]*/ int CreateCardAuth(ISCardAuth* ppISCardAuth);
  // Creates instance of ISCardVerify interface.
  /*[id(0x00000005)]*/ int CreateCHVerification(ISCardVerify* ppISCardVerify);
  // Release the attachment to a particular ICC or IFD.
  /*[id(0x00000006)]*/ int Detach();
  // Lock for exclusive use the connected IFD/ICC.
  /*[id(0x00000007)]*/ int SCardLock();
  // Allows application to reconnect to an ICC or IFD.
  /*[id(0x00000008)]*/ int Reconnect();
  // Get status of ICC/IFD.
  /*[id(0x00000009)]*/ int Status(out SCARD_STATES pStatus, out SCARD_PROTOCOLS pProtocol);
  // Unlock/release exclusive use of the connected IFD/ICC.
  /*[id(0x0000000A)]*/ int SCardUnlock(SCARD_DISPOSITIONS Disposition);
  // Creates an instance of an interface by DWINGUID value or name.
  /*[id(0x0000000B)]*/ int CreateInterface(ref DWINGUID pguidInterface, wchar* bstrName, int* pUserData, out IUnknown ppInterface);
}

// ISCardVerify Interface
interface ISCardVerify : IDispatch {
  mixin(uuid("4029dd85-5902-11d0-b84c-00c04fd424b9"));
  // static DWINGUID IID = { 0x4029dd85, 0x5902, 0x11d0, 0xb8, 0x4c, 0x00, 0xc0, 0x4f, 0xd4, 0x24, 0xb9 };
  // Change the current user code
  /*[id(0x00000001)]*/ int ChangeCode(IByteBuffer pOldCode, IByteBuffer pNewCode, SCARD_FLAGS flags, int lRef);
  // Called to initialize the object. This is an internal ONLY use function.
  /*[id(0x00000002)]*/ int Initialize(int* lp);
  // Unblock a blocked IHV
  /*[id(0x00000003)]*/ int Unblock(int lData, SCARD_FLAGS flags, int lRef);
  // Resets the security context.
  /*[id(0x00000004)]*/ int ResetSecurityState(SCARD_FLAGS flags);
  // Authenticate the user.
  /*[id(0x00000005)]*/ int Verify(IByteBuffer pCode, SCARD_FLAGS flags, ref int lpRef);
}

// ISccDirect Interface
interface ISccDirect : IDispatch {
  mixin(uuid("a80f1107-d1f8-11d0-b5c5-00a024297ed9"));
  // static DWINGUID IID = { 0xa80f1107, 0xd1f8, 0x11d0, 0xb5, 0xc5, 0x00, 0xa0, 0x24, 0x29, 0x7e, 0xd9 };
  // get default value of APDU part 'expected length of response data'
  /*[id(0x00000001)]*/ int GetLe(out int plLe);
  // Write a record to the end of an EF of linear structure or location one of a cyclic structure
  /*[id(0x0000000B)]*/ int AppendRecord(BYTE byMode, IByteBuffer pRecord, out int plSW12);
  // Change the reference data in the card
  /*[id(0x0000000C)]*/ int Change(BYTE byRefCtrl, IByteBuffer pRefData, out int plSW12);
  // Create a new file in the card - under the current directory
  /*[id(0x0000000D)]*/ int CreateFile(BYTE byDir, BYTE byP2, IByteBuffer pData, out int plSW12);
  // Decrease a supplied record
  /*[id(0x0000000E)]*/ int Decrease(BYTE bySFI, BYTE byRecordId, BYTE byRecCtrl, int lLe, IByteBuffer pValue, out IByteBuffer ppResult, out int plSW12);
  // Delete a file in the card
  /*[id(0x0000000F)]*/ int DeleteFile(BYTE byDir, out int plSW12);
  // Derive a key from a master key using the supplied data
  /*[id(0x00000010)]*/ int DiversifyKey(BYTE byRFU, BYTE bySecretRef, int lLe, ref IByteBuffer ppData, out int plSW12);
  // Authenticate the external world after a GET CHALLENGE command serviced
  /*[id(0x00000011)]*/ int ExternalAuthenticate(BYTE byAlgorithmRef, BYTE bySecretRef, IByteBuffer pCrytogram, out int plSW12);
  // Update the ICC
  /*[id(0x00000012)]*/ int FWDownload(BYTE byLoadCtrl, IByteBuffer pData, out int plSW12);
  // Generate a master key and export it encrypted
  /*[id(0x00000013)]*/ int GenerateKey(BYTE byRFU, BYTE bySecretRef, int lLe, out IByteBuffer ppKeyEnc, out int plSW12);
  // Issue a challenge for use in a security related procedure - random number or sequence number
  /*[id(0x00000014)]*/ int GetChallenge(BYTE byRandom, int lChallengeLen, out IByteBuffer ppChallenge, out int plSW12);
  // Retrieve a primitive data object
  /*[id(0x00000015)]*/ int GetData(int lParameters, int lLe, out IByteBuffer ppData, out int plSW12);
  // Increase a supplied record
  /*[id(0x00000016)]*/ int Increase(BYTE bySFI, BYTE byRecordId, BYTE byRecCtrl, int lLe, IByteBuffer pValue, out IByteBuffer ppResult, out int plSW12);
  // Compute authentication data using challenge data sent to card
  /*[id(0x00000017)]*/ int InternalAuthenticate(BYTE byAlgorithmRef, BYTE bySecretRef, int lLe, ref IByteBuffer ppData, out int plSW12);
  // Load data to be signed / verified by a following SignData / VerifySignature
  /*[id(0x00000018)]*/ int LoadData(IByteBuffer pData, out int plSW12);
  // Load a (plain) key into a keyfile
  /*[id(0x00000019)]*/ int LoadExportKey(BYTE byRefCtrl, BYTE byKeyID, int lLe, IByteBuffer pKeyData, out IByteBuffer ppCRC, out int plSW12);
  // Load a (encrypted) key into a keyfile
  /*[id(0x0000001A)]*/ int LoadKeyFile(BYTE byKeyIDEnc, BYTE byKeyID, IByteBuffer pKeyData, out int plSW12);
  // Load a private key
  /*[id(0x0000001B)]*/ int LoadPrivateKey(BYTE byRefCtrl, BYTE byKeyID, IByteBuffer pKeyData, out int plSW12);
  // Load an external public key for a subsequent signature verification
  /*[id(0x0000001C)]*/ int LoadVerifyKey(BYTE byRefCtrl, IByteBuffer pKeyData, out int plSW12);
  // Load a challenge for use in a security related procedure
  /*[id(0x0000001D)]*/ int PutChallenge(IByteBuffer pChallenge, out int plSW12);
  // Write a primitive data object
  /*[id(0x0000001E)]*/ int PutData(int lParameters, IByteBuffer pData, out int plSW12);
  // Read part of the content of an EF with transparent structure
  /*[id(0x0000001F)]*/ int ReadBinary(BYTE bySFI, int lOffset, int lLe, out IByteBuffer ppData, out int plSW12);
  // Read contents of a specified record from an EF
  /*[id(0x00000020)]*/ int ReadRecord(BYTE bySFI, BYTE byRecordId, BYTE byRecCtrl, int lLe, out IByteBuffer ppData, out int plSW12);
  // Select a file
  /*[id(0x00000021)]*/ int SelectFile(BYTE bySelectCtrl, BYTE bySelectOption, int lLe, IByteBuffer pFile, out IByteBuffer ppFileInfo, out int plSW12);
  // Create a digital signature using the specified private key
  /*[id(0x00000022)]*/ int SignData(BYTE byAlgID, BYTE byKeyID, int lLe, out IByteBuffer ppSignature, out int plSW12);
  // Translate a key or password for different cryptographic domains
  /*[id(0x00000023)]*/ int TranslateSecret(BYTE bySecretCtrl, BYTE bySecretRef, int lLe, ref IByteBuffer ppSecret, out int plSW12);
  // Unblock the reference data in the card
  /*[id(0x00000024)]*/ int Unblock(BYTE byRefCtrl, IByteBuffer pRefData, out int plSW12);
  // Update bytes already present in an EF with transparent structure
  /*[id(0x00000025)]*/ int UpdateBinary(BYTE bySFI, int lOffset, IByteBuffer pData, out int plSW12);
  // Update a specified record of an EF
  /*[id(0x00000026)]*/ int UpdateRecord(BYTE bySFI, BYTE byRecordId, BYTE byRecCtrl, IByteBuffer pData, out int plSW12);
  // Compare the verification data sent to the card with its reference data
  /*[id(0x00000027)]*/ int Verify(BYTE byRefCtrl, IByteBuffer pData, out int plSW12);
  // Verify a digital signature using an external public key
  /*[id(0x00000028)]*/ int VerifySignature(BYTE byAlgID, BYTE byHashCtrl, IByteBuffer pSignature, out int plSW12);
  // General command to the SICRYPT ICC (SCC)
  /*[id(0x00000032)]*/ int Command(BYTE byClass, BYTE byInstr, BYTE byP1, BYTE byP2, int lLe, IByteBuffer pInData, out IByteBuffer ppOutData, out int plSW12);
  // Transmit a command using secure messaging to the SICRYPT ICC (SCC)
  /*[id(0x00000033)]*/ int SMTransmit(IByteBuffer pAPDUIn, out IByteBuffer ppAPDUOut, out int plSW12);
  // Load a keypair
  /*[id(0x00000034)]*/ int LoadKeyPair(BYTE byRefCtrl, BYTE byKeyID, IByteBuffer pKeyData, out int plSW12);
  // Delete a keypair
  /*[id(0x00000035)]*/ int DeleteKeyPair(BYTE byKeyID, out int plSW12);
  // Retrieve the public key part of a keypair
  /*[id(0x00000036)]*/ int GetPublicKey(BYTE byKeyID, int lLe, out IByteBuffer ppKeyData, out int plSW12);
  // Generate a keypair
  /*[id(0x00000037)]*/ int GenerateKeyPair(BYTE byRefCtrl, BYTE byKeyID, int lLe, IByteBuffer pPubKeyData, out IByteBuffer ppPrivKeyData, out int plSW12);
  // Called to initialize the object. This is an internal ONLY use function.
  /*[id(0x0000003C)]*/ int Initialize(int* lp);
}

// ISccManage Interface
interface ISccManage : IDispatch {
  mixin(uuid("a80f1106-d1f8-11d0-b5c5-00a024297ed9"));
  // static DWINGUID IID = { 0xa80f1106, 0xd1f8, 0x11d0, 0xb5, 0xc5, 0x00, 0xa0, 0x24, 0x29, 0x7e, 0xd9 };
  // Connect to the ICC which corresponds to this ICCSP
  /*[id(0x00000001)]*/ int AttachOwnICC(int lSearchParam, SCARD_SHARE_MODES flags, wchar* bstrTitle, out wchar* pbstrReader);
  // Get reader name and ATR of ICC previously attached to
  /*[id(0x00000002)]*/ int Status(out wchar* pbstrReader, out IByteBuffer ppATR);
}

// ISccRemoval Interface
interface ISccRemoval : IDispatch {
  mixin(uuid("a80f1108-d1f8-11d0-b5c5-00a024297ed9"));
  // static DWINGUID IID = { 0xa80f1108, 0xd1f8, 0x11d0, 0xb5, 0xc5, 0x00, 0xa0, 0x24, 0x29, 0x7e, 0xd9 };
  // Gets a notification when an ICC was removed from the monitored reader
  /*[id(0x00000001)]*/ int Removed(wchar* bstrReader);
}

// CoClasses

// SCardAuth Class
abstract class SCardAuth {
  mixin(uuid("a80f1102-d1f8-11d0-b5c5-00a024297ed9"));
  // static DWINGUID CLSID = { 0xa80f1102, 0xd1f8, 0x11d0, 0xb5, 0xc5, 0x00, 0xa0, 0x24, 0x29, 0x7e, 0xd9 };
  mixin Interfaces!(ISCardAuth);
}

// SCardFileAccess Class
abstract class SCardFileAccess {
  mixin(uuid("a80f1103-d1f8-11d0-b5c5-00a024297ed9"));
  // static DWINGUID CLSID = { 0xa80f1103, 0xd1f8, 0x11d0, 0xb5, 0xc5, 0x00, 0xa0, 0x24, 0x29, 0x7e, 0xd9 };
  mixin Interfaces!(ISCardFileAccess);
}

// SCardManage Class
abstract class SCardManage {
  mixin(uuid("a80f1101-d1f8-11d0-b5c5-00a024297ed9"));
  // static DWINGUID CLSID = { 0xa80f1101, 0xd1f8, 0x11d0, 0xb5, 0xc5, 0x00, 0xa0, 0x24, 0x29, 0x7e, 0xd9 };
  mixin Interfaces!(ISCardManage, ISccDirect, ISccManage);
}

// SCardVerify Class
abstract class SCardVerify {
  mixin(uuid("a80f1104-d1f8-11d0-b5c5-00a024297ed9"));
  // static DWINGUID CLSID = { 0xa80f1104, 0xd1f8, 0x11d0, 0xb5, 0xc5, 0x00, 0xa0, 0x24, 0x29, 0x7e, 0xd9 };
  mixin Interfaces!(ISCardVerify);
}
