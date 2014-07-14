// Performance Logs and Alerts 1.0 Type Library
// Version 1.0

/*[uuid("7478ef60-8c46-11d1-8d99-00a0c913cad4")]*/
//module dwin.sys.win32.com.tlb.more.smlogcfg;
module dwin.sys.win32.com.tlb.more.smlogcfg;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum _MMC_BUTTON_STATE {
  ENABLED = 0x00000001,
  CHECKED = 0x00000002,
  HIDDEN = 0x00000004,
  INDETERMINATE = 0x00000008,
  BUTTONPRESSED = 0x00000010,
}

enum _MMC_CONSOLE_VERB {
  MMC_VERB_NONE = 0x00000000,
  MMC_VERB_OPEN = 0x00008000,
  MMC_VERB_COPY = 0x00008001,
  MMC_VERB_PASTE = 0x00008002,
  MMC_VERB_DELETE = 0x00008003,
  MMC_VERB_PROPERTIES = 0x00008004,
  MMC_VERB_RENAME = 0x00008005,
  MMC_VERB_REFRESH = 0x00008006,
  MMC_VERB_PRINT = 0x00008007,
}

enum _MMC_NOTIFY_TYPE {
  MMCN_ACTIVATE = 0x00008001,
  MMCN_ADD_IMAGES = 0x00008002,
  MMCN_BTN_CLICK = 0x00008003,
  MMCN_CLICK = 0x00008004,
  MMCN_COLUMN_CLICK = 0x00008005,
  MMCN_CONTEXTMENU = 0x00008006,
  MMCN_CUTORMOVE = 0x00008007,
  MMCN_DBLCLICK = 0x00008008,
  MMCN_DELETE = 0x00008009,
  MMCN_DESELECT_ALL = 0x0000800A,
  MMCN_EXPAND = 0x0000800B,
  MMCN_HELP = 0x0000800C,
  MMCN_MENU_BTNCLICK = 0x0000800D,
  MMCN_MINIMIZED = 0x0000800E,
  MMCN_PASTE = 0x0000800F,
  MMCN_PROPERTY_CHANGE = 0x00008010,
  MMCN_QUERY_PASTE = 0x00008011,
  MMCN_REFRESH = 0x00008012,
  MMCN_REMOVE_CHILDREN = 0x00008013,
  MMCN_RENAME = 0x00008014,
  MMCN_SELECT = 0x00008015,
  MMCN_SHOW = 0x00008016,
  MMCN_VIEW_CHANGE = 0x00008017,
  MMCN_SNAPINHELP = 0x00008018,
  MMCN_CONTEXTHELP = 0x00008019,
  MMCN_INITOCX = 0x0000801A,
}

enum _DATA_OBJECT_TYPES {
  CCT_SCOPE = 0x00008000,
  CCT_RESULT = 0x00008001,
  CCT_SNAPIN_MANAGER = 0x00008002,
  CCT_UNINITIALIZED = 0x0000FFFF,
}

// Unions

union __MIDL_IWinTypes_0007 {
  int hInproc;
  _userBITMAP* hRemote;
  long hInproc64;
}

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
  long hInproc64;
}

union __MIDL_IWinTypes_0004 {
  int hInproc;
  _BYTE_BLOB* hRemote;
  long hInproc64;
}

union __MIDL_IWinTypes_0006 {
  int hInproc;
  _BYTE_BLOB* hRemote;
  long hInproc64;
}

union __MIDL_IAdviseSink_0002 {
  _userHBITMAP* hBitmap;
  _userHPALETTE* hPalette;
  _userHGLOBAL* hGeneric;
}

union __MIDL_IWinTypes_0008 {
  int hInproc;
  tagLOGPALETTE* hRemote;
  long hInproc64;
}

union __MIDL_IWinTypes_0003 {
  int hInproc;
  _FLAGGED_BYTE_BLOB* hRemote;
  long hInproc64;
}

union __MIDL_IWinTypes_0009 {
  int hInproc;
  int hRemote;
}

// Structs

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

struct _MMCButton {
  int nBitmap;
  int idCommand;
  ubyte fsState;
  ubyte fsType;
  wchar* lpButtonText;
  wchar* lpTooltipText;
}

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

struct _userHPALETTE {
  int fContext;
  __MIDL_IWinTypes_0008 u;
}

struct tagLOGPALETTE {
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

struct _RemotableHandle {
  int fContext;
  __MIDL_IWinTypes_0009 u;
}

struct _RESULTDATAITEM {
  uint mask;
  int bScopeItem;
  int itemID;
  int nIndex;
  int nCol;
  wchar* str;
  int nImage;
  uint nState;
  LONG_PTR lParam;
  int iIndent;
}

struct _SCOPEDATAITEM {
  uint mask;
  wchar* displayname;
  int nImage;
  int nOpenImage;
  uint nState;
  int cChildren;
  LONG_PTR lParam;
  int relativeID;
  int ID;
}

// Aliases

alias _userHBITMAP* wireHBITMAP;

alias _userCLIPFORMAT* wireCLIPFORMAT;

alias _userSTGMEDIUM* wireSTGMEDIUM;

alias _userFLAG_STGMEDIUM* wireFLAG_STGMEDIUM;

alias _userSTGMEDIUM* wireASYNC_STGMEDIUM;

alias _RemotableHandle* wireHWND;

alias int LONG_PTR;

alias _RemotableHandle* wireHICON;

// Interfaces

// IComponentData Interface
interface IComponentData : IUnknown {
  mixin(uuid("955ab28a-5218-11d0-a985-00c04fd8d565"));
  // static DWINGUID IID = { 0x955ab28a, 0x5218, 0x11d0, 0xa9, 0x85, 0x00, 0xc0, 0x4f, 0xd8, 0xd5, 0x65 };
  // Snap-in entry point. Can QI for IConsole & IConsoleNameSpace
  /*[id(0x60010000)]*/ int Initialize(IUnknown pUnknown);
  // Create a Componet for this ComponetData
  /*[id(0x60010001)]*/ int CreateComponent(out IComponent ppComponent);
  // User actions
  /*[id(0x60010002)]*/ int Notify(IDataObject lpDataObject, _MMC_NOTIFY_TYPE event, int arg, int param);
  // Release cookies associated with the children of a specific node
  /*[id(0x60010003)]*/ int Destroy();
  // Returns a data object which may be used to retrieve the context information for the specified cookie
  /*[id(0x60010004)]*/ int QueryDataObject(int cookie, _DATA_OBJECT_TYPES type, out IDataObject ppDataObject);
  // Get display info for the name space item
  /*[id(0x60010005)]*/ int GetDisplayInfo(ref _SCOPEDATAITEM pScopeDataItem);
  // The snap-in's compare function for two data objects
  /*[id(0x60010006)]*/ int CompareObjects(IDataObject lpDataObjectA, IDataObject lpDataObjectB);
}

// IComponent Interface
interface IComponent : IUnknown {
  mixin(uuid("43136eb2-d36c-11cf-adbc-00aa00a80033"));
  // static DWINGUID IID = { 0x43136eb2, 0xd36c, 0x11cf, 0xad, 0xbc, 0x00, 0xaa, 0x00, 0xa8, 0x00, 0x33 };
  // Snap-in entry point
  /*[id(0x60010000)]*/ int Initialize(IConsole lpConsole);
  // User actions
  /*[id(0x60010001)]*/ int Notify(IDataObject lpDataObject, _MMC_NOTIFY_TYPE event, int arg, int param);
  // Release cookies associated with the children of a specific node
  /*[id(0x60010002)]*/ int Destroy(int cookie);
  // Returns a data object which may be used to retrieve the context information for the specified cookie
  /*[id(0x60010003)]*/ int QueryDataObject(int cookie, _DATA_OBJECT_TYPES type, out IDataObject ppDataObject);
  // Returns the result view type for the specified cookie
  /*[id(0x60010004)]*/ int GetResultViewType(int cookie, out wchar* ppViewType, out int pViewOptions);
  // Get display info for the result item
  /*[id(0x60010005)]*/ int GetDisplayInfo(ref _RESULTDATAITEM pResultDataItem);
  // The snap-in's compare function for two data objects
  /*[id(0x60010006)]*/ int CompareObjects(IDataObject lpDataObjectA, IDataObject lpDataObjectB);
}

// IConsole Interface
interface IConsole : IUnknown {
  mixin(uuid("43136eb1-d36c-11cf-adbc-00aa00a80033"));
  // static DWINGUID IID = { 0x43136eb1, 0xd36c, 0x11cf, 0xad, 0xbc, 0x00, 0xaa, 0x00, 0xa8, 0x00, 0x33 };
  // Sets IConsoles header interface
  /*[id(0x60010000)]*/ int SetHeader(IHeaderCtrl pHeader);
  // Sets IConsoles toolbar interface
  /*[id(0x60010001)]*/ int SetToolbar(IToolbar pToolbar);
  // Queries IConsoles user provided IUnknown
  /*[id(0x60010002)]*/ int QueryResultView(out IUnknown pUnknown);
  // Queries the IConsole provided image list for the scope pane.
  /*[id(0x60010003)]*/ int QueryScopeImageList(out IImageList ppImageList);
  // Queries the IConsole provided image list for the result pane.
  /*[id(0x60010004)]*/ int QueryResultImageList(out IImageList ppImageList);
  // Generates a notification to update view(s) because of content change
  /*[id(0x60010005)]*/ int UpdateAllViews(IDataObject lpDataObject, int data, int hint);
  // Displays a message box
  /*[id(0x60010006)]*/ int MessageBox(wchar* lpszText, wchar* lpszTitle, uint fuStyle, out int piRetval);
  // Query for the IConsoleVerb.
  /*[id(0x60010007)]*/ int QueryConsoleVerb(out IConsoleVerb ppConsoleVerb);
  // Selects the given scope item.
  /*[id(0x60010008)]*/ int SelectScopeItem(int hScopeItem);
  // Returns handle to the main frame window.
  /*[id(0x60010009)]*/ int GetMainWindow(out wireHWND phwnd);
  // Returns handle to the main frame window.
  /*[id(0x6001000A)]*/ int NewWindow(int hScopeItem, uint lOptions);
}

// INodeInit Interface
interface IHeaderCtrl : IUnknown {
  mixin(uuid("43136eb3-d36c-11cf-adbc-00aa00a80033"));
  // static DWINGUID IID = { 0x43136eb3, 0xd36c, 0x11cf, 0xad, 0xbc, 0x00, 0xaa, 0x00, 0xa8, 0x00, 0x33 };
  // Add a column to a Default Result view
  /*[id(0x60010000)]*/ int InsertColumn(int nCol, wchar* title, int nFormat, int nWidth);
  // Remove a column to a Default Result view
  /*[id(0x60010001)]*/ int DeleteColumn(int nCol);
  // Set a columns text
  /*[id(0x60010002)]*/ int SetColumnText(int nCol, wchar* title);
  // Gets a columns text
  /*[id(0x60010003)]*/ int GetColumnText(int nCol, out wchar* pText);
  // Set a columns width
  /*[id(0x60010004)]*/ int SetColumnWidth(int nCol, int nWidth);
  // Gets a columns width
  /*[id(0x60010005)]*/ int GetColumnWidth(int nCol, out int pWidth);
}

interface IToolbar : IUnknown {
  mixin(uuid("43136eb9-d36c-11cf-adbc-00aa00a80033"));
  // static DWINGUID IID = { 0x43136eb9, 0xd36c, 0x11cf, 0xad, 0xbc, 0x00, 0xaa, 0x00, 0xa8, 0x00, 0x33 };
  // Add and image to the toolbar
  /*[id(0x60010000)]*/ int AddBitmap(int nImages, wireHBITMAP hbmp, int cxSize, int cySize, uint crMask);
  // Add an array of buttons to the toolbar
  /*[id(0x60010001)]*/ int AddButtons(int nButtons, _MMCButton* lpButtons);
  // Add a single button to the toolbar at position nIndex
  /*[id(0x60010002)]*/ int InsertButton(int nIndex, _MMCButton* lpButton);
  // Remove a button at the index
  /*[id(0x60010003)]*/ int DeleteButton(int nIndex);
  // Get an attribute of a button
  /*[id(0x60010004)]*/ int GetButtonState(int idCommand, _MMC_BUTTON_STATE nState, out int pState);
  // Set an attribute of a button
  /*[id(0x60010005)]*/ int SetButtonState(int idCommand, _MMC_BUTTON_STATE nState, int bState);
}

// IImageList Interface
interface IImageList : IUnknown {
  mixin(uuid("43136eb8-d36c-11cf-adbc-00aa00a80033"));
  // static DWINGUID IID = { 0x43136eb8, 0xd36c, 0x11cf, 0xad, 0xbc, 0x00, 0xaa, 0x00, 0xa8, 0x00, 0x33 };
  // Sets an Icon in the image list, creates it if it is not there.
  /*[id(0x60010000)]*/ int ImageListSetIcon(int* pIcon, int nLoc);
  // Sets a strip in the image list, starting at nLoc using a pair of bitmaps.
  /*[id(0x60010001)]*/ int ImageListSetStrip(int* pBMapSm, int* pBMapLg, int nStartLoc, uint cMask);
}

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
  /*[id(0x60010000)]*/ int RemoteOnDataChange(tagFORMATETC* pformatetc, wireASYNC_STGMEDIUM* pStgmed);
  /*[id(0x60010001)]*/ int RemoteOnViewChange(uint dwAspect, int lindex);
  /*[id(0x60010002)]*/ int RemoteOnRename(IMoniker pmk);
  /*[id(0x60010003)]*/ int RemoteOnSave();
  /*[id(0x60010004)]*/ int RemoteOnClose();
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

interface IConsoleVerb : IUnknown {
  mixin(uuid("e49f7a60-74af-11d0-a286-00c04fd8fe93"));
  // static DWINGUID IID = { 0xe49f7a60, 0x74af, 0x11d0, 0xa2, 0x86, 0x00, 0xc0, 0x4f, 0xd8, 0xfe, 0x93 };
  // Get verb state
  /*[id(0x60010000)]*/ int GetVerbState(_MMC_CONSOLE_VERB eCmdID, _MMC_BUTTON_STATE nState, out int pState);
  // Set verb state
  /*[id(0x60010001)]*/ int SetVerbState(_MMC_CONSOLE_VERB eCmdID, _MMC_BUTTON_STATE nState, int bState);
  // Set default verb
  /*[id(0x60010002)]*/ int SetDefaultVerb(_MMC_CONSOLE_VERB eCmdID);
  // Get default verb
  /*[id(0x60010003)]*/ int GetDefaultVerb(out _MMC_CONSOLE_VERB peCmdID);
}

interface ISnapinAbout : IUnknown {
  mixin(uuid("1245208c-a151-11d0-a7d7-00c04fd909dd"));
  // static DWINGUID IID = { 0x1245208c, 0xa151, 0x11d0, 0xa7, 0xd7, 0x00, 0xc0, 0x4f, 0xd9, 0x09, 0xdd };
  // Text for the snap-in description box
  /*[id(0x60010000)]*/ int GetSnapinDescription(out wchar* lpDescription);
  // Provider name
  /*[id(0x60010001)]*/ int GetProvider(out wchar* lpName);
  // Version number for the snap-in
  /*[id(0x60010002)]*/ int GetSnapinVersion(out wchar* lpVersion);
  // Main icon for about box
  /*[id(0x60010003)]*/ int GetSnapinImage(out wireHICON hAppIcon);
  // Static folder images for scope and result panes
  /*[id(0x60010004)]*/ int GetStaticFolderImage(out wireHBITMAP hSmallImage, out wireHBITMAP hSmallImageOpen, out wireHBITMAP hLargeImage, out uint cMask);
}

// CoClasses

// ComponentData Class
abstract class ComponentData {
  mixin(uuid("7478ef61-8c46-11d1-8d99-00a0c913cad4"));
  // static DWINGUID CLSID = { 0x7478ef61, 0x8c46, 0x11d1, 0x8d, 0x99, 0x00, 0xa0, 0xc9, 0x13, 0xca, 0xd4 };
  mixin Interfaces!(IComponentData);
}

// Component Class
abstract class Component {
  mixin(uuid("7478ef62-8c46-11d1-8d99-00a0c913cad4"));
  // static DWINGUID CLSID = { 0x7478ef62, 0x8c46, 0x11d1, 0x8d, 0x99, 0x00, 0xa0, 0xc9, 0x13, 0xca, 0xd4 };
  mixin Interfaces!(IComponent);
}

// ComponentData Class
abstract class ExtensionSnapin {
  mixin(uuid("7478ef65-8c46-11d1-8d99-00a0c913cad4"));
  // static DWINGUID CLSID = { 0x7478ef65, 0x8c46, 0x11d1, 0x8d, 0x99, 0x00, 0xa0, 0xc9, 0x13, 0xca, 0xd4 };
  mixin Interfaces!(IComponentData);
}

// PerformanceAbout Class
abstract class PerformanceAbout {
  mixin(uuid("7478ef69-8c46-11d1-8d99-00a0c913cad4"));
  // static DWINGUID CLSID = { 0x7478ef69, 0x8c46, 0x11d1, 0x8d, 0x99, 0x00, 0xa0, 0xc9, 0x13, 0xca, 0xd4 };
  mixin Interfaces!(ISnapinAbout);
}
