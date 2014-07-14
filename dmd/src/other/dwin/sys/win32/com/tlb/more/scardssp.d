// scardssp 1.0 Type Library
// Version 1.0

/*[uuid("82c38704-19f1-11d3-a11f-00c04f79f800")]*/
//module dwin.sys.win32.com.tlb.more.scardssp;
module dwin.sys.win32.com.tlb.more.scardssp;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

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

// ISO 7816-4 APDU Case types.
enum tagISO_APDU_TYPE {
  ISO_CASE_1 = 0x00000001,
  ISO_CASE_2 = 0x00000002,
  ISO_CASE_3 = 0x00000003,
  ISO_CASE_4 = 0x00000004,
}

// SCard Protocols
enum tagSCARD_PROTOCOLS {
  T0 = 0x00000001,
  T1 = 0x00000002,
  RAW = 0x000000FF,
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

// SCard Share Modes
enum tagSCARD_SHARE_MODES {
  EXCLUSIVE = 0x00000001,
  SHARED = 0x00000002,
}

// SCard Dispositions
enum tagSCARD_DISPOSITIONS {
  LEAVE = 0x00000000,
  RESET = 0x00000001,
  UNPOWER = 0x00000002,
  EJECT = 0x00000003,
}

// Unions

union __MIDL_IWinTypes_0003 {
  int hInproc;
  _FLAGGED_BYTE_BLOB* hRemote;
  long hInproc64;
}

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
  _wireSAFEARRAY*** ppArray;
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

// Helpful byte array.
struct tagBYTEARRAY {
  wireHGLOBAL hMem;
  uint dwSize;
  ubyte* pbyData;
}

struct _userHGLOBAL {
  int fContext;
  __MIDL_IWinTypes_0003 u;
}

struct _FLAGGED_BYTE_BLOB {
  uint fFlags;
  uint clSize;
  ubyte* abData;
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

// FindCard returned information structure.
struct tagSCARDINFO {
  uint hCard;
  uint hContext;
  tagSCARD_PROTOCOLS ActiveProtocol;
  tagSCARD_SHARE_MODES ShareMode;
  int hwndOwner;
  int lpfnConnectProc;
  int lpfnCheckProc;
  int lpfnDisconnectProc;
}

// Aliases

alias ubyte BYTE;

alias STATSTRUCT* LPSTATSTRUCT;

// Stream status structure.
alias tagSTATSTRUCT STATSTRUCT;

alias BYTE* LPBYTE;

alias BYTEARRAY* LPBYTEARRAY;

// Helpful byte array.
alias tagBYTEARRAY BYTEARRAY;

alias _userHGLOBAL* wireHGLOBAL;

alias _wireSAFEARRAY** wirePSAFEARRAY;

alias uint ULONG_PTR;

alias uint DWORD;

// ISO 7816-4 APDU Case types.
alias tagISO_APDU_TYPE ISO_APDU_TYPE;

alias ULONG_PTR HSCARD;

alias ULONG_PTR HSCARDCONTEXT;

// SCard Protocols
alias tagSCARD_PROTOCOLS SCARD_PROTOCOLS;

// SCard States
alias tagSCARD_STATES SCARD_STATES;

// SCard Share Modes
alias tagSCARD_SHARE_MODES SCARD_SHARE_MODES;

// SCard Dispositions
alias tagSCARD_DISPOSITIONS SCARD_DISPOSITIONS;

// FindCard returned information structure.
alias tagSCARDINFO SCARDINFO;

// Interfaces

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

// ISCardTypeConv Interface
interface ISCardTypeConv : IDispatch {
  mixin(uuid("53b6aa63-3f56-11d0-916b-00aa00c18068"));
  // static DWINGUID IID = { 0x53b6aa63, 0x3f56, 0x11d0, 0x91, 0x6b, 0x00, 0xaa, 0x00, 0xc1, 0x80, 0x68 };
  // Convert an array of bytes to an IByteBuffer
  /*[id(0x00000000)]*/ int ConvertByteArrayToByteBuffer(LPBYTE pbyArray, uint dwArraySize, out IByteBuffer ppbyBuffer);
  // Convert an IByteBuffer to an array of bytes
  /*[id(0x00000001)]*/ int ConvertByteBufferToByteArray(IByteBuffer pbyBuffer, out LPBYTEARRAY ppArray);
  // Convert an IByteBuffer to a SAFEARRAY(unsigned char)
  /*[id(0x00000002)]*/ int ConvertByteBufferToSafeArray(IByteBuffer pbyBuffer, out wirePSAFEARRAY ppbyArray);
  // Convert a SAFEARRAY(unsigned char) to an IByteBuffer
  /*[id(0x00000003)]*/ int ConvertSafeArrayToByteBuffer(wirePSAFEARRAY pbyArray, out IByteBuffer ppbyBuff);
  // Create an array of bytes
  /*[id(0x00000004)]*/ int CreateByteArray(uint dwAllocSize, out LPBYTE ppbyArray);
  // Create an IByteBuffer object
  /*[id(0x00000005)]*/ int CreateByteBuffer(uint dwAllocSize, out IByteBuffer ppbyBuff);
  // Create a SAFEARRAY(unsigned char)
  /*[id(0x00000006)]*/ int CreateSafeArray(uint nAllocSize, out wirePSAFEARRAY ppArray);
  // Free a pointer to the memory block managed by the IStream
  /*[id(0x00000007)]*/ int FreeIStreamMemoryPtr(IStream pStrm, LPBYTE pMem);
  // Get a pointer to the memory block managed by the IStream
  /*[id(0x00000008)]*/ int GetAtIStreamMemory(IStream pStrm, out LPBYTEARRAY ppMem);
  // How many bytes are in the given IStream
  /*[id(0x00000009)]*/ int SizeOfIStream(IStream pStrm, out _ULARGE_INTEGER puliSize);
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

// ISCardCmd Interface
interface ISCardCmd : IDispatch {
  mixin(uuid("d5778ae3-43de-11d0-9171-00aa00c18068"));
  // static DWINGUID IID = { 0xd5778ae3, 0x43de, 0x11d0, 0x91, 0x71, 0x00, 0xaa, 0x00, 0xc1, 0x80, 0x68 };
  // Get the raw ISO 7816 APDU string
  /*[id(0x00000000)]*/ int get_Apdu(out IByteBuffer ppApdu);
  // Get the raw ISO 7816 APDU string
  /*[id(0x00000000)]*/ int set_Apdu(IByteBuffer ppApdu);
  // Get the byte count (size) of the raw ISO 7816 APDU string
  /*[id(0x00000001)]*/ int get_ApduLength(out int plSize);
  // Get the raw reply ISO 7816 APDU string
  /*[id(0x00000002)]*/ int get_ApduReply(out IByteBuffer ppReplyApdu);
  // Get the raw reply ISO 7816 APDU string
  /*[id(0x00000002)]*/ int set_ApduReply(IByteBuffer ppReplyApdu);
  // Get the byte count (size) of the raw reply ISO 7816 APDU string
  /*[id(0x00000003)]*/ int get_ApduReplyLength(out int plSize);
  // Get the byte count (size) of the raw reply ISO 7816 APDU string
  /*[id(0x00000003)]*/ int set_ApduReplyLength(int plSize);
  // Get the current class ID of the ISO 7816 APDU header
  /*[id(0x00000004)]*/ int get_ClassId(out BYTE pbyClass);
  // Get the current class ID of the ISO 7816 APDU header
  /*[id(0x00000004)]*/ int set_ClassId(BYTE pbyClass);
  // Get the current data portion of the ISO 7816 APDU string
  /*[id(0x00000005)]*/ int get_Data(out IByteBuffer ppData);
  // Get the current data portion of the ISO 7816 APDU string
  /*[id(0x00000005)]*/ int set_Data(IByteBuffer ppData);
  // Get the current instruction ID of the ISO 7816 APDU header
  /*[id(0x00000006)]*/ int get_InstructionId(out BYTE pbyIns);
  // Get the current instruction ID of the ISO 7816 APDU header
  /*[id(0x00000006)]*/ int set_InstructionId(BYTE pbyIns);
  // Get the Le parameter (expected length of reply data) of the ISO 7816 APDU
  /*[id(0x00000007)]*/ int get_LeField(out int plSize);
  // Get the first parameter of the ISO 7816 APDU header
  /*[id(0x00000008)]*/ int get_P1(out BYTE pbyP1);
  // Get the first parameter of the ISO 7816 APDU header
  /*[id(0x00000008)]*/ int set_P1(BYTE pbyP1);
  // Get the second parameter of the ISO 7816 APDU header
  /*[id(0x00000009)]*/ int get_P2(out BYTE pbyP2);
  // Get the second parameter of the ISO 7816 APDU header
  /*[id(0x00000009)]*/ int set_P2(BYTE pbyP2);
  // Get the third parameter of the ISO 7816 APDU header
  /*[id(0x0000000A)]*/ int get_P3(out BYTE pbyP3);
  // Get the reply status word
  /*[id(0x0000000B)]*/ int get_ReplyStatus(out ushort pwStatus);
  // Get the reply status word
  /*[id(0x0000000B)]*/ int set_ReplyStatus(ushort pwStatus);
  // Get the reply status SW1 byte.
  /*[id(0x0000000C)]*/ int get_ReplyStatusSW1(out BYTE pbySW1);
  // Get the reply status SW2 byte.
  /*[id(0x0000000D)]*/ int get_ReplyStatusSW2(out BYTE pbySW2);
  // Get the current ISO 7816-4 type of the encapsulated APDU.
  /*[id(0x0000000E)]*/ int get_type(out ISO_APDU_TYPE pType);
  // Get the T=1 Node Address
  /*[id(0x00000012)]*/ int get_Nad(out BYTE pbNad);
  // Get the T=1 Node Address
  /*[id(0x00000012)]*/ int set_Nad(BYTE pbNad);
  // Get the T=1 Reply Node Address
  /*[id(0x00000013)]*/ int get_ReplyNad(out BYTE pbNad);
  // Get the T=1 Reply Node Address
  /*[id(0x00000013)]*/ int set_ReplyNad(BYTE pbNad);
  // Build a valid ISO 7816 APDU string
  /*[id(0x0000000F)]*/ int BuildCmd(BYTE byClassId, BYTE byInsId, BYTE byP1, BYTE byP2, IByteBuffer pbyData, int* plLe);
  // Clear the current APDU data
  /*[id(0x00000010)]*/ int Clear();
  // Encapsulate onother APDU into this one as data
  /*[id(0x00000011)]*/ int Encapsulate(IByteBuffer pApdu, ISO_APDU_TYPE ApduType);
  // Get the alternate class ID of the ISO 7816 APDU header
  /*[id(0x00000014)]*/ int get_AlternateClassId(out BYTE pbyClass);
  // Get the alternate class ID of the ISO 7816 APDU header
  /*[id(0x00000014)]*/ int set_AlternateClassId(BYTE pbyClass);
}

// ISCardISO7816 Interface
interface ISCardISO7816 : IDispatch {
  mixin(uuid("53b6aa68-3f56-11d0-916b-00aa00c18068"));
  // static DWINGUID IID = { 0x53b6aa68, 0x3f56, 0x11d0, 0x91, 0x6b, 0x00, 0xaa, 0x00, 0xc1, 0x80, 0x68 };
  // Write a record to the end of an EF of linear structure of location one of a cyclic structure
  /*[id(0x00000000)]*/ int AppendRecord(BYTE byRefCtrl, IByteBuffer pData, ref ISCardCmd ppCmd);
  // Set part of an EF file content to its erased state sequentially
  /*[id(0x00000001)]*/ int EraseBinary(BYTE byP1, BYTE byP2, IByteBuffer pData, ref ISCardCmd ppCmd);
  // Update the card after a GET CHALLENGE command serviced
  /*[id(0x00000002)]*/ int ExternalAuthenticate(BYTE byAlgorithmRef, BYTE bySecretRef, IByteBuffer pChallenge, ref ISCardCmd ppCmd);
  // Issue a challenge for use in a security related procedure
  /*[id(0x00000003)]*/ int GetChallenge(int lBytesExpected, ref ISCardCmd ppCmd);
  // Retrieve a primitive data object
  /*[id(0x00000004)]*/ int GetData(BYTE byP1, BYTE byP2, int lBytesToGet, ref ISCardCmd ppCmd);
  // Retrieve further data
  /*[id(0x00000005)]*/ int GetResponse(BYTE byP1, BYTE byP2, int lDataLength, ref ISCardCmd ppCmd);
  // Compute authentication data on card using challenge data sent to card
  /*[id(0x00000006)]*/ int InternalAuthenticate(BYTE byAlgorithmRef, BYTE bySecretRef, IByteBuffer pChallenge, int lReplyBytes, ref ISCardCmd ppCmd);
  // Open or close a logical channel
  /*[id(0x00000007)]*/ int ManageChannel(BYTE byChannelState, BYTE byChannel, ref ISCardCmd ppCmd);
  // Write a primitive data object
  /*[id(0x00000008)]*/ int PutData(BYTE byP1, BYTE byP2, IByteBuffer pData, ref ISCardCmd ppCmd);
  // Read part of the content of an EF with transparent structure
  /*[id(0x00000009)]*/ int ReadBinary(BYTE byP1, BYTE byP2, int lBytesToRead, ref ISCardCmd ppCmd);
  // Read contents of a specified record from an EF
  /*[id(0x0000000A)]*/ int ReadRecord(BYTE byRecordId, BYTE byRefCtrl, int lBytesToRead, ref ISCardCmd ppCmd);
  // Set a current file within a logical channel
  /*[id(0x0000000B)]*/ int SelectFile(BYTE byP1, BYTE byP2, IByteBuffer pData, int lBytesToRead, ref ISCardCmd ppCmd);
  // Change the default class ID used in command construction
  /*[id(0x0000000C)]*/ int SetDefaultClassId(BYTE byClass);
  // Update bits already present in an EF with command APDU bits
  /*[id(0x0000000D)]*/ int UpdateBinary(BYTE byP1, BYTE byP2, IByteBuffer pData, ref ISCardCmd ppCmd);
  // Update a specific record with the APDU bits
  /*[id(0x0000000E)]*/ int UpdateRecord(BYTE byRecordId, BYTE byRefCtrl, IByteBuffer pData, ref ISCardCmd ppCmd);
  // Compare the verification data sent to the card with its stored reference data
  /*[id(0x0000000F)]*/ int Verify(BYTE byRefCtrl, IByteBuffer pData, ref ISCardCmd ppCmd);
  // Write binary values into an EF
  /*[id(0x00000010)]*/ int WriteBinary(BYTE byP1, BYTE byP2, IByteBuffer pData, ref ISCardCmd ppCmd);
  // Write to the specified record in an EF
  /*[id(0x00000011)]*/ int WriteRecord(BYTE byRecordId, BYTE byRefCtrl, IByteBuffer pData, ref ISCardCmd ppCmd);
}

// ISCard Interface
interface ISCard : IDispatch {
  mixin(uuid("1461aac3-6810-11d0-918f-00aa00c18068"));
  // static DWINGUID IID = { 0x1461aac3, 0x6810, 0x11d0, 0x91, 0x8f, 0x00, 0xaa, 0x00, 0xc1, 0x80, 0x68 };
  // Retrieve the ATR string for the Smart Card
  /*[id(0x00000000)]*/ int get_Atr(out IByteBuffer ppAtr);
  // Retrieve the current card handle.
  /*[id(0x00000001)]*/ int get_CardHandle(out HSCARD pHandle);
  // Retrieve the current context handle.
  /*[id(0x00000002)]*/ int get_Context(out HSCARDCONTEXT pContext);
  // Retrieve the protocol in use on the Smart Card
  /*[id(0x00000003)]*/ int get_Protocol(out SCARD_PROTOCOLS pProtocol);
  // Retrieve the current state that the Smart Card is in
  /*[id(0x00000004)]*/ int get_Status(out SCARD_STATES pStatus);
  // Attach an open SCard handle to this object
  /*[id(0x00000005)]*/ int AttachByHandle(HSCARD hCard);
  // Open a connection to a card in the named reader
  /*[id(0x00000006)]*/ int AttachByReader(wchar* bstrReaderName, SCARD_SHARE_MODES ShareMode, SCARD_PROTOCOLS PrefProtocol);
  // Close a connection to an open card
  /*[id(0x00000007)]*/ int Detach(SCARD_DISPOSITIONS Disposition);
  // Acquire exclusive access and use of the open Smart Card
  /*[id(0x00000008)]*/ int LockSCard();
  // Reattach an existing connection to an in use Smart Card 
  /*[id(0x00000009)]*/ int ReAttach(SCARD_SHARE_MODES ShareMode, SCARD_DISPOSITIONS InitState);
  // Execute a card transaction with a card command interface
  /*[id(0x0000000A)]*/ int Transaction(ref ISCardCmd ppCmd);
  // Release the exclusive access lock on the Smart Card
  /*[id(0x0000000B)]*/ int UnlockSCard(SCARD_DISPOSITIONS Disposition);
}

// ISCardDatabase Interface
interface ISCardDatabase : IDispatch {
  mixin(uuid("1461aac8-6810-11d0-918f-00aa00c18068"));
  // static DWINGUID IID = { 0x1461aac8, 0x6810, 0x11d0, 0x91, 0x8f, 0x00, 0xaa, 0x00, 0xc1, 0x80, 0x68 };
  // Retrieve the provider ID for the named card
  /*[id(0x00000000)]*/ int GetProviderCardId(wchar* bstrCardName, out DWINGUID ppguidProviderId);
  // Retrieve a list of the interfaces (GUIDs) for the named card
  /*[id(0x00000001)]*/ int ListCardInterfaces(wchar* bstrCardName, out wirePSAFEARRAY ppInterfaceGuids);
  // Retrieve a list of the names of the defined cards
  /*[id(0x00000002)]*/ int ListCards(IByteBuffer pAtr, wirePSAFEARRAY pInterfaceGuids, int localeId, out wirePSAFEARRAY ppCardNames);
  // Retrieve a list of the names of the defined card reader groups
  /*[id(0x00000003)]*/ int ListReaderGroups(int localeId, out wirePSAFEARRAY ppReaderGroups);
  // Retrieve a list of the names of the defined card readers
  /*[id(0x00000004)]*/ int ListReaders(int localeId, out wirePSAFEARRAY ppReaders);
}

// ISCardLocate Interface
interface ISCardLocate : IDispatch {
  mixin(uuid("1461aacd-6810-11d0-918f-00aa00c18068"));
  // static DWINGUID IID = { 0x1461aacd, 0x6810, 0x11d0, 0x91, 0x8f, 0x00, 0xaa, 0x00, 0xc1, 0x80, 0x68 };
  // Configure the search based on the card GUIDs
  /*[id(0x00000000)]*/ int ConfigureCardGuidSearch(wirePSAFEARRAY pCardGuids, wirePSAFEARRAY pGroupNames, wchar* bstrTitle, int lFlags);
  // Configure the search based on card names
  /*[id(0x00000001)]*/ int ConfigureCardNameSearch(wirePSAFEARRAY pCardNames, wirePSAFEARRAY pGroupNames, wchar* bstrTitle, int lFlags);
  // Find and open a connection to the named Smart Card
  /*[id(0x00000002)]*/ int FindCard(SCARD_SHARE_MODES ShareMode, SCARD_PROTOCOLS Protocols, int lFlags, out SCARDINFO ppCardInfo);
}

// CoClasses

// ByteBuffer Class
abstract class CByteBuffer {
  mixin(uuid("e126f8ff-a7af-11d0-b88a-00c04fd424b9"));
  // static DWINGUID CLSID = { 0xe126f8ff, 0xa7af, 0x11d0, 0xb8, 0x8a, 0x00, 0xc0, 0x4f, 0xd4, 0x24, 0xb9 };
  mixin Interfaces!(IByteBuffer);
}

// SCardTypeConv Class
abstract class CSCardTypeConv {
  mixin(uuid("53b6aa67-3f56-11d0-916b-00aa00c18068"));
  // static DWINGUID CLSID = { 0x53b6aa67, 0x3f56, 0x11d0, 0x91, 0x6b, 0x00, 0xaa, 0x00, 0xc1, 0x80, 0x68 };
  mixin Interfaces!(ISCardTypeConv);
}

// SCardCmd Class
abstract class CSCardCmd {
  mixin(uuid("d5778ae7-43de-11d0-9171-00aa00c18068"));
  // static DWINGUID CLSID = { 0xd5778ae7, 0x43de, 0x11d0, 0x91, 0x71, 0x00, 0xaa, 0x00, 0xc1, 0x80, 0x68 };
  mixin Interfaces!(ISCardCmd);
}

// SCardISO7816 Class
abstract class CSCardISO7816 {
  mixin(uuid("53b6aa6c-3f56-11d0-916b-00aa00c18068"));
  // static DWINGUID CLSID = { 0x53b6aa6c, 0x3f56, 0x11d0, 0x91, 0x6b, 0x00, 0xaa, 0x00, 0xc1, 0x80, 0x68 };
  mixin Interfaces!(ISCardISO7816);
}

// SCard Class
abstract class CSCard {
  mixin(uuid("1461aac7-6810-11d0-918f-00aa00c18068"));
  // static DWINGUID CLSID = { 0x1461aac7, 0x6810, 0x11d0, 0x91, 0x8f, 0x00, 0xaa, 0x00, 0xc1, 0x80, 0x68 };
  mixin Interfaces!(ISCard);
}

// SCardDatabase Class
abstract class CSCardDatabase {
  mixin(uuid("1461aacc-6810-11d0-918f-00aa00c18068"));
  // static DWINGUID CLSID = { 0x1461aacc, 0x6810, 0x11d0, 0x91, 0x8f, 0x00, 0xaa, 0x00, 0xc1, 0x80, 0x68 };
  mixin Interfaces!(ISCardDatabase);
}

// SCardLocate Class
abstract class CSCardLocate {
  mixin(uuid("1461aad1-6810-11d0-918f-00aa00c18068"));
  // static DWINGUID CLSID = { 0x1461aad1, 0x6810, 0x11d0, 0x91, 0x8f, 0x00, 0xaa, 0x00, 0xc1, 0x80, 0x68 };
  mixin Interfaces!(ISCardLocate);
}
