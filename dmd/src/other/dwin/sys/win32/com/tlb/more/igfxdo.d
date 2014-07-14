// igfxdo 1.0 Type Library
// Version 1.0

/*[uuid("d4fa3d41-be69-11d4-aa30-00902704c6bf")]*/
module dwin.sys.win32.com.tlb.more.igfxdo;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Unions

union __MIDL_IWinTypes_0001 {
  uint dwValue;
  wchar* pwszName;
}

union __MIDL_IAdviseSink_0003 {
  _userHMETAFILEPICT* hMetaFilePict;
  _userHENHMETAFILE* hHEnhMetaFile;
  _GDI_OBJECT* hGdiHandle;
  _userHGLOBAL* hGlobal;
  wchar* lpszFileName;
  _BYTE_BLOB* pstm;
  _BYTE_BLOB* pstg;
}

union __MIDL_IWinTypes_0005 {
  int hInproc;
  _remoteMETAFILEPICT* hRemote;
  int hGlobal;
}

union __MIDL_IWinTypes_0004 {
  int hInproc;
  _BYTE_BLOB* hRemote;
  int hGlobal;
}

union __MIDL_IWinTypes_0006 {
  int hInproc;
  _BYTE_BLOB* hRemote;
  int hGlobal;
}

union __MIDL_IAdviseSink_0002 {
  _userHBITMAP* hBitmap;
  _userHPALETTE* hPalette;
  _userHGLOBAL* hGeneric;
}

union __MIDL_IWinTypes_0007 {
  int hInproc;
  _userBITMAP* hRemote;
  int hGlobal;
}

union __MIDL_IWinTypes_0008 {
  int hInproc;
  tagrpcLOGPALETTE* hRemote;
  int hGlobal;
}

union __MIDL_IWinTypes_0003 {
  int hInproc;
  _FLAGGED_BYTE_BLOB* hRemote;
  int hGlobal;
}

// Structs

struct tagFORMATETC {
  wireCLIPFORMAT cfFormat;
  tagDVTARGETDEVICE* ptd;
  uint dwAspect;
  int lindex;
  uint tymed;
}

struct _userCLIPFORMAT {
  int fContext;
  __MIDL_IWinTypes_0001 u;
}

struct tagDVTARGETDEVICE {
  uint tdSize;
  ushort tdDriverNameOffset;
  ushort tdDeviceNameOffset;
  ushort tdPortNameOffset;
  ushort tdExtDevmodeOffset;
  ubyte* tdData;
}

struct _userSTGMEDIUM {
  _STGMEDIUM_UNION __MIDL_0003;
  IUnknown pUnkForRelease;
}

struct _STGMEDIUM_UNION {
  uint tymed;
  __MIDL_IAdviseSink_0003 u;
}

struct _userHMETAFILEPICT {
  int fContext;
  __MIDL_IWinTypes_0005 u;
}

struct _remoteMETAFILEPICT {
  int mm;
  int xExt;
  int yExt;
  _userHMETAFILE* hMF;
}

struct _userHMETAFILE {
  int fContext;
  __MIDL_IWinTypes_0004 u;
}

struct _BYTE_BLOB {
  uint clSize;
  ubyte* abData;
}

struct _userHENHMETAFILE {
  int fContext;
  __MIDL_IWinTypes_0006 u;
}

struct _GDI_OBJECT {
  uint ObjectType;
  __MIDL_IAdviseSink_0002 u;
}

struct _userHBITMAP {
  int fContext;
  __MIDL_IWinTypes_0007 u;
}

struct _userBITMAP {
  int bmType;
  int bmWidth;
  int bmHeight;
  int bmWidthBytes;
  ushort bmPlanes;
  ushort bmBitsPixel;
  uint cbSize;
  ubyte* pBuffer;
}

struct _userHPALETTE {
  int fContext;
  __MIDL_IWinTypes_0008 u;
}

struct tagrpcLOGPALETTE {
  ushort palVersion;
  ushort palNumEntries;
  tagPALETTEENTRY* palPalEntry;
}

struct tagPALETTEENTRY {
  ubyte peRed;
  ubyte peGreen;
  ubyte peBlue;
  ubyte peFlags;
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

struct _userFLAG_STGMEDIUM {
  int ContextFlags;
  int fPassOwnership;
  _userSTGMEDIUM Stgmed;
}

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

struct tagBIND_OPTS2 {
  uint cbStruct;
  uint grfFlags;
  uint grfMode;
  uint dwTickCountDeadline;
  uint dwTrackFlags;
  uint dwClassContext;
  uint locale;
  _COSERVERINFO* pServerInfo;
}

struct _COSERVERINFO {
  uint dwReserved1;
  wchar* pwszName;
  _COAUTHINFO* pAuthInfo;
  uint dwReserved2;
}

struct _COAUTHINFO {
  uint dwAuthnSvc;
  uint dwAuthzSvc;
  wchar* pwszServerPrincName;
  uint dwAuthnLevel;
  uint dwImpersonationLevel;
  _COAUTHIDENTITY* pAuthIdentityData;
  uint dwCapabilities;
}

struct _COAUTHIDENTITY {
  ushort* User;
  uint UserLength;
  ushort* Domain;
  uint DomainLength;
  ushort* Password;
  uint PasswordLength;
  uint Flags;
}

struct tagSTATDATA {
  tagFORMATETC formatetc;
  uint advf;
  IAdviseSink pAdvSink;
  uint dwConnection;
}

// Aliases

alias _userCLIPFORMAT* wireCLIPFORMAT;

alias _userSTGMEDIUM* wireSTGMEDIUM;

alias _userFLAG_STGMEDIUM* wireFLAG_STGMEDIUM;

alias _userSTGMEDIUM* wireASYNC_STGMEDIUM;

// Interfaces

interface IDataObject : IUnknown {
  mixin(uuid("0000010e-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x0000010e, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RemoteGetData(tagFORMATETC* pformatetcIn, out wireSTGMEDIUM pRemoteMedium);
  /*[id(0x60010001)]*/ int RemoteGetDataHere(tagFORMATETC* pformatetc, ref wireSTGMEDIUM pRemoteMedium);
  /*[id(0x60010002)]*/ int QueryGetData(tagFORMATETC* pformatetc);
  /*[id(0x60010003)]*/ int GetCanonicalFormatEtc(tagFORMATETC* pformatectIn, out tagFORMATETC pformatetcOut);
  /*[id(0x60010004)]*/ int RemoteSetData(tagFORMATETC* pformatetc, wireFLAG_STGMEDIUM* pmedium, int fRelease);
  /*[id(0x60010005)]*/ int EnumFormatEtc(uint dwDirection, out IEnumFORMATETC ppenumFormatEtc);
  /*[id(0x60010006)]*/ int DAdvise(tagFORMATETC* pformatetc, uint advf, IAdviseSink pAdvSink, out uint pdwConnection);
  /*[id(0x60010007)]*/ int DUnadvise(uint dwConnection);
  /*[id(0x60010008)]*/ int EnumDAdvise(out IEnumSTATDATA ppenumAdvise);
}

interface IEnumFORMATETC : IUnknown {
  mixin(uuid("00000103-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00000103, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RemoteNext(uint celt, out tagFORMATETC rgelt, out uint pceltFetched);
  /*[id(0x60010001)]*/ int Skip(uint celt);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IEnumFORMATETC ppenum);
}

interface IAdviseSink : IUnknown {
  mixin(uuid("0000010f-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x0000010f, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RemoteOnDataChange(IAsyncManager* ppIAM, tagFORMATETC* pformatetc, wireASYNC_STGMEDIUM* pStgmed);
  /*[id(0x60010001)]*/ int RemoteOnViewChange(IAsyncManager* ppIAM, uint dwAspect, int lindex);
  /*[id(0x60010002)]*/ int RemoteOnRename(IAsyncManager* ppIAM, IMoniker pmk);
  /*[id(0x60010003)]*/ int RemoteOnSave(IAsyncManager* ppIAM);
  /*[id(0x60010004)]*/ int RemoteOnClose();
}

interface IAsyncManager : IUnknown {
  mixin(uuid("0000002a-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x0000002a, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int CompleteCall(int Result);
  /*[id(0x60010001)]*/ int GetCallContext(ref DWINGUID riid, void *pInterface);
  /*[id(0x60010002)]*/ int GetState(out uint pulStateFlags);
}

interface IMoniker : IPersistStream {
  mixin(uuid("0000000f-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x0000000f, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60030000)]*/ int RemoteBindToObject(IBindCtx pbc, IMoniker pmkToLeft, ref DWINGUID riidResult, out IUnknown ppvResult);
  /*[id(0x60030001)]*/ int RemoteBindToStorage(IBindCtx pbc, IMoniker pmkToLeft, ref DWINGUID riid, out IUnknown ppvObj);
  /*[id(0x60030002)]*/ int Reduce(IBindCtx pbc, uint dwReduceHowFar, ref IMoniker ppmkToLeft, out IMoniker ppmkReduced);
  /*[id(0x60030003)]*/ int ComposeWith(IMoniker pmkRight, int fOnlyIfNotGeneric, out IMoniker ppmkComposite);
  /*[id(0x60030004)]*/ int Enum(int fForward, out IEnumMoniker ppenumMoniker);
  /*[id(0x60030005)]*/ int IsEqual(IMoniker pmkOtherMoniker);
  /*[id(0x60030006)]*/ int Hash(out uint pdwHash);
  /*[id(0x60030007)]*/ int IsRunning(IBindCtx pbc, IMoniker pmkToLeft, IMoniker pmkNewlyRunning);
  /*[id(0x60030008)]*/ int GetTimeOfLastChange(IBindCtx pbc, IMoniker pmkToLeft, out _FILETIME pfiletime);
  /*[id(0x60030009)]*/ int Inverse(out IMoniker ppmk);
  /*[id(0x6003000A)]*/ int CommonPrefixWith(IMoniker pmkOther, out IMoniker ppmkPrefix);
  /*[id(0x6003000B)]*/ int RelativePathTo(IMoniker pmkOther, out IMoniker ppmkRelPath);
  /*[id(0x6003000C)]*/ int GetDisplayName(IBindCtx pbc, IMoniker pmkToLeft, out wchar* ppszDisplayName);
  /*[id(0x6003000D)]*/ int ParseDisplayName(IBindCtx pbc, IMoniker pmkToLeft, wchar* pszDisplayName, out uint pchEaten, out IMoniker ppmkOut);
  /*[id(0x6003000E)]*/ int IsSystemMoniker(out uint pdwMksys);
}

interface IPersistStream : IPersist {
  mixin(uuid("00000109-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00000109, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60020000)]*/ int IsDirty();
  /*[id(0x60020001)]*/ int Load(IStream pstm);
  /*[id(0x60020002)]*/ int Save(IStream pstm, int fClearDirty);
  /*[id(0x60020003)]*/ int GetSizeMax(out _ULARGE_INTEGER pcbSize);
}

interface IPersist : IUnknown {
  mixin(uuid("0000010c-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x0000010c, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int GetClassID(out DWINGUID pClassID);
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

interface IBindCtx : IUnknown {
  mixin(uuid("0000000e-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x0000000e, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RegisterObjectBound(IUnknown punk);
  /*[id(0x60010001)]*/ int RevokeObjectBound(IUnknown punk);
  /*[id(0x60010002)]*/ int ReleaseBoundObjects();
  /*[id(0x60010003)]*/ int RemoteSetBindOptions(tagBIND_OPTS2* pbindopts);
  /*[id(0x60010004)]*/ int RemoteGetBindOptions(ref tagBIND_OPTS2 pbindopts);
  /*[id(0x60010005)]*/ int GetRunningObjectTable(out IRunningObjectTable pprot);
  /*[id(0x60010006)]*/ int RegisterObjectParam(wchar* pszKey, IUnknown punk);
  /*[id(0x60010007)]*/ int GetObjectParam(wchar* pszKey, out IUnknown ppunk);
  /*[id(0x60010008)]*/ int EnumObjectParam(out IEnumString ppenum);
  /*[id(0x60010009)]*/ int RevokeObjectParam(wchar* pszKey);
}

interface IRunningObjectTable : IUnknown {
  mixin(uuid("00000010-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00000010, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int Register(uint grfFlags, IUnknown punkObject, IMoniker pmkObjectName, out uint pdwRegister);
  /*[id(0x60010001)]*/ int Revoke(uint dwRegister);
  /*[id(0x60010002)]*/ int IsRunning(IMoniker pmkObjectName);
  /*[id(0x60010003)]*/ int GetObject(IMoniker pmkObjectName, out IUnknown ppunkObject);
  /*[id(0x60010004)]*/ int NoteChangeTime(uint dwRegister, _FILETIME* pfiletime);
  /*[id(0x60010005)]*/ int GetTimeOfLastChange(IMoniker pmkObjectName, out _FILETIME pfiletime);
  /*[id(0x60010006)]*/ int EnumRunning(out IEnumMoniker ppenumMoniker);
}

interface IEnumMoniker : IUnknown {
  mixin(uuid("00000102-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00000102, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RemoteNext(uint celt, out IMoniker rgelt, out uint pceltFetched);
  /*[id(0x60010001)]*/ int Skip(uint celt);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IEnumMoniker ppenum);
}

interface IEnumString : IUnknown {
  mixin(uuid("00000101-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00000101, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RemoteNext(uint celt, out wchar* rgelt, out uint pceltFetched);
  /*[id(0x60010001)]*/ int Skip(uint celt);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IEnumString ppenum);
}

interface IEnumSTATDATA : IUnknown {
  mixin(uuid("00000105-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00000105, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RemoteNext(uint celt, out tagSTATDATA rgelt, out uint pceltFetched);
  /*[id(0x60010001)]*/ int Skip(uint celt);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IEnumSTATDATA ppenum);
}

// IDataObjectInit Interface
interface IDataObjectInit : IUnknown {
  mixin(uuid("4501a902-bf07-11d4-aa30-00902704c6bf"));
  // static DWINGUID IID = { 0x4501a902, 0xbf07, 0x11d4, 0xaa, 0x30, 0x00, 0x90, 0x27, 0x04, 0xc6, 0xbf };
  // method SetDeviceName
  /*[id(0x60010000)]*/ int SetDeviceName(wchar* newVal);
}

// CoClasses

// DataObject Class
abstract class DataObject {
  mixin(uuid("d4fa3d4e-be69-11d4-aa30-00902704c6bf"));
  // static DWINGUID CLSID = { 0xd4fa3d4e, 0xbe69, 0x11d4, 0xaa, 0x30, 0x00, 0x90, 0x27, 0x04, 0xc6, 0xbf };
  mixin Interfaces!(IDataObject, IDataObjectInit);
}
