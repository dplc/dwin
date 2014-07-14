// ComExpS 1.0 Type Library
// Version 1.0

/*[uuid("99847c25-b1b4-11d1-8f10-00c04fc2c17b")]*/
//module dwin.sys.win32.com.tlb.more.comexps;
module dwin.sys.win32.com.tlb.more.comuid;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Unions

union __MIDL_IWinTypes_0009 {
  int hInproc;
  int hRemote;
}

union __MIDL_IWinTypes_0007 {
  int hInproc;
  _userBITMAP* hRemote;
  long hInproc64;
}

// Structs

struct _RemotableHandle {
  int fContext;
  __MIDL_IWinTypes_0009 u;
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

// Aliases

alias uint UINT_PTR;

alias _RemotableHandle* wireHMENU;

alias _RemotableHandle* wireHWND;

alias _userHBITMAP* wireHBITMAP;

// Interfaces

interface ICOMNSScope : IUnknown {
  mixin(uuid("1ce16ced-b1b5-11d1-8f10-00c04fc2c17b"));
  // static DWINGUID IID = { 0x1ce16ced, 0xb1b5, 0x11d1, 0x8f, 0x10, 0x00, 0xc0, 0x4f, 0xc2, 0xc1, 0x7b };
  /*[id(0x60010000)]*/ int Initialize(int bTracking, int bDAC, ICOMNSScopeSink piScopeSink);
  /*[id(0x60010001)]*/ int Destroy();
  /*[id(0x60010002)]*/ int GetRootItem(out UINT_PTR phItem);
  /*[id(0x60010003)]*/ int GetNewResult(out IUnknown ppUnknown);
  /*[id(0x60010004)]*/ int GetImageList(out wireHBITMAP phbmpSmall, out int pnSmallCount, out wireHBITMAP phbmpLarge, out int pnLargeCount, out uint pcrMask, out int pf8Bit);
  /*[id(0x60010005)]*/ int InvokeCommand(UINT_PTR hItem, int lCommandID);
  /*[id(0x60010006)]*/ int ExpandItem(UINT_PTR hItem, int bSync);
  /*[id(0x60010007)]*/ int DeleteItem(UINT_PTR hItem);
  /*[id(0x60010008)]*/ int GetDisplayNameForItem(UINT_PTR hItem, out wchar* szName);
  /*[id(0x60010009)]*/ int GetContextMenusForItem(UINT_PTR hItem, out wireHMENU phmenuCtxt, out wireHMENU phmenuNew, out wireHMENU phmenuTasks);
  /*[id(0x6001000A)]*/ int GetPropertyPagesForItem(UINT_PTR hItem, out int plNumPages, out UINT_PTR ppPageArray);
  /*[id(0x6001000B)]*/ int GetAttributesForItem(UINT_PTR hItem, int fScope, out int pAttrib);
  /*[id(0x6001000C)]*/ int GetWorkstationNameForItem(UINT_PTR hItem, out wchar* pbstrName);
  /*[id(0x6001000D)]*/ int GetObjectKeyForItem(UINT_PTR hItem, out wchar* pbstrKey);
  /*[id(0x6001000E)]*/ int SelectItem(UINT_PTR hItem, int fScope, int fSelected);
  /*[id(0x6001000F)]*/ int GetViewMenu(out wireHMENU phmenuView);
  /*[id(0x60010010)]*/ int Refresh(UINT_PTR hItem);
}

interface ICOMNSScopeSink : IUnknown {
  mixin(uuid("7e517149-b1a8-11d1-8f10-00c04fc2c17b"));
  // static DWINGUID IID = { 0x7e517149, 0xb1a8, 0x11d1, 0x8f, 0x10, 0x00, 0xc0, 0x4f, 0xc2, 0xc1, 0x7b };
  /*[id(0x60010000)]*/ int InsertItem(UINT_PTR hParent, UINT_PTR hPosition, UINT_PTR hNewItem, ref DWINGUID pguidNodeType, wchar* wszText, int nImage, int nOpenImage);
  /*[id(0x60010001)]*/ int DeleteItem(UINT_PTR hItem);
  /*[id(0x60010002)]*/ int SetItemImage(UINT_PTR hItem, int nImage, int nOpenImage);
  /*[id(0x60010003)]*/ int SetItemInfo(UINT_PTR hItem, wchar* szText, int nImage, int nOpenImage);
  /*[id(0x60010004)]*/ int SelectItem(UINT_PTR hItem);
  /*[id(0x60010005)]*/ int PopulationComplete(UINT_PTR hItem);
  /*[id(0x60010006)]*/ int CreatePropertySheet(UINT_PTR hItem, wchar* szTitle);
  /*[id(0x60010007)]*/ int CreatePropertySheetMulti(UINT_PTR hItem, wchar* szTitle, int bPropertySheet, int nPageCount, UINT_PTR* pMultiSelectPageArray);
  /*[id(0x60010008)]*/ int TrackPopupMenu(wireHMENU hmenu, wireHWND hwndParent, int xPos, int yPos, out int plSelected);
}

interface ITrkEvntObjControl : IUnknown {
  mixin(uuid("49c5b1ea-af68-438a-b26a-1d8495e24ca9"));
  // static DWINGUID IID = { 0x49c5b1ea, 0xaf68, 0x438a, 0xb2, 0x6a, 0x1d, 0x84, 0x95, 0xe2, 0x4c, 0xa9 };
  /*[id(0x60010000)]*/ int RemoveTSub();
  /*[id(0x60010001)]*/ int RegisterTSub(wchar* bstrMachine);
  /*[id(0x60010002)]*/ int GetTrackerCollection(out IUnknown pUnk);
  /*[id(0x60010003)]*/ int SetPostHWND(UINT_PTR hwnd);
}

// CoClasses

// CCOMNSScopeImpl Class
abstract class CCOMNSScopeImpl {
  mixin(uuid("99847c33-b1b4-11d1-8f10-00c04fc2c17b"));
  // static DWINGUID CLSID = { 0x99847c33, 0xb1b4, 0x11d1, 0x8f, 0x10, 0x00, 0xc0, 0x4f, 0xc2, 0xc1, 0x7b };
  mixin Interfaces!(ICOMNSScope);
}

// CTrkEvntListener Class
abstract class CTrkEvntListener {
  mixin(uuid("2c3e140b-7a0d-42d1-b2aa-d343500a90cf"));
  // static DWINGUID CLSID = { 0x2c3e140b, 0x7a0d, 0x42d1, 0xb2, 0xaa, 0xd3, 0x43, 0x50, 0x0a, 0x90, 0xcf };
  mixin Interfaces!(ITrkEvntObjControl);
}
