// Version 1.1

/*[uuid("1ea4dbf0-3c3b-11cf-810c-00aa00389b71")]*/
//module dwin.sys.win32.com.tlb.more.accessibility;
module dwin.sys.win32.com.tlb.more.oleacc;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum AnnoScope {
  ANNO_THIS = 0x00000000,
  ANNO_CONTAINER = 0x00000001,
}

// Unions

union __MIDL_IWinTypes_0009 {
  int hInproc;
  int hRemote;
}

// Structs

struct _RemotableHandle {
  int fContext;
  __MIDL_IWinTypes_0009 u;
}

// Aliases

alias _RemotableHandle* wireHWND;

alias _RemotableHandle* wireHMENU;

// Interfaces

interface IAccessible : IDispatch {
  mixin(uuid("618736e0-3c3d-11cf-810c-00aa00389b71"));
  // static DWINGUID IID = { 0x618736e0, 0x3c3d, 0x11cf, 0x81, 0x0c, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71 };
  /*[id(0xFFFFEC78)]*/ int get_accParent(out IDispatch ppdispParent);
  /*[id(0xFFFFEC77)]*/ int get_accChildCount(out int pcountChildren);
  /*[id(0xFFFFEC76)]*/ int get_accChild(DWINVARIANT varChild, out IDispatch ppdispChild);
  /*[id(0xFFFFEC75)]*/ int get_accName(DWINVARIANT varChild, out wchar* pszName);
  /*[id(0xFFFFEC74)]*/ int get_accValue(DWINVARIANT varChild, out wchar* pszValue);
  /*[id(0xFFFFEC73)]*/ int get_accDescription(DWINVARIANT varChild, out wchar* pszDescription);
  /*[id(0xFFFFEC72)]*/ int get_accRole(DWINVARIANT varChild, out DWINVARIANT pvarRole);
  /*[id(0xFFFFEC71)]*/ int get_accState(DWINVARIANT varChild, out DWINVARIANT pvarState);
  /*[id(0xFFFFEC70)]*/ int get_accHelp(DWINVARIANT varChild, out wchar* pszHelp);
  /*[id(0xFFFFEC6F)]*/ int get_accHelpTopic(out wchar* pszHelpFile, DWINVARIANT varChild, out int pidTopic);
  /*[id(0xFFFFEC6E)]*/ int get_accKeyboardShortcut(DWINVARIANT varChild, out wchar* pszKeyboardShortcut);
  /*[id(0xFFFFEC6D)]*/ int get_accFocus(out DWINVARIANT pvarChild);
  /*[id(0xFFFFEC6C)]*/ int get_accSelection(out DWINVARIANT pvarChildren);
  /*[id(0xFFFFEC6B)]*/ int get_accDefaultAction(DWINVARIANT varChild, out wchar* pszDefaultAction);
  /*[id(0xFFFFEC6A)]*/ int accSelect(int flagsSelect, DWINVARIANT varChild);
  /*[id(0xFFFFEC69)]*/ int accLocation(out int pxLeft, out int pyTop, out int pcxWidth, out int pcyHeight, DWINVARIANT varChild);
  /*[id(0xFFFFEC68)]*/ int accNavigate(int navDir, DWINVARIANT varStart, out DWINVARIANT pvarEndUpAt);
  /*[id(0xFFFFEC67)]*/ int accHitTest(int xLeft, int yTop, out DWINVARIANT pvarChild);
  /*[id(0xFFFFEC66)]*/ int accDoDefaultAction(DWINVARIANT varChild);
  /*[id(0xFFFFEC75)]*/ int set_accName(DWINVARIANT varChild, wchar* pszName);
  /*[id(0xFFFFEC74)]*/ int set_accValue(DWINVARIANT varChild, wchar* pszValue);
}

interface IAccessibleHandler : IUnknown {
  mixin(uuid("03022430-abc4-11d0-bde2-00aa001a1953"));
  // static DWINGUID IID = { 0x03022430, 0xabc4, 0x11d0, 0xbd, 0xe2, 0x00, 0xaa, 0x00, 0x1a, 0x19, 0x53 };
  /*[id(0x60010000)]*/ int AccessibleObjectFromID(int hwnd, int lObjectID, out IAccessible pIAccessible);
}

interface IAccIdentity : IUnknown {
  mixin(uuid("7852b78d-1cfd-41c1-a615-9c0c85960b5f"));
  // static DWINGUID IID = { 0x7852b78d, 0x1cfd, 0x41c1, 0xa6, 0x15, 0x9c, 0x0c, 0x85, 0x96, 0x0b, 0x5f };
  /*[id(0x60010000)]*/ int GetIdentityString(uint dwIDChild, out ubyte ppIDString, out uint pdwIDStringLen);
}

interface IAccPropServer : IUnknown {
  mixin(uuid("76c0dbbb-15e0-4e7b-b61b-20eeea2001e0"));
  // static DWINGUID IID = { 0x76c0dbbb, 0x15e0, 0x4e7b, 0xb6, 0x1b, 0x20, 0xee, 0xea, 0x20, 0x01, 0xe0 };
  /*[id(0x60010000)]*/ int GetPropValue(ubyte* pIDString, uint dwIDStringLen, DWINGUID idProp, out DWINVARIANT pvarValue, out int pfHasProp);
}

interface IAccPropServices : IUnknown {
  mixin(uuid("6e26e776-04f0-495d-80e4-3330352e3169"));
  // static DWINGUID IID = { 0x6e26e776, 0x04f0, 0x495d, 0x80, 0xe4, 0x33, 0x30, 0x35, 0x2e, 0x31, 0x69 };
  /*[id(0x60010000)]*/ int SetPropValue(ubyte* pIDString, uint dwIDStringLen, DWINGUID idProp, DWINVARIANT var);
  /*[id(0x60010001)]*/ int SetPropServer(ubyte* pIDString, uint dwIDStringLen, ref DWINGUID paProps, int cProps, IAccPropServer pServer, AnnoScope AnnoScope);
  /*[id(0x60010002)]*/ int ClearProps(ubyte* pIDString, uint dwIDStringLen, ref DWINGUID paProps, int cProps);
  /*[id(0x60010003)]*/ int SetHwndProp(wireHWND hwnd, uint idObject, uint idChild, DWINGUID idProp, DWINVARIANT var);
  /*[id(0x60010004)]*/ int SetHwndPropStr(wireHWND hwnd, uint idObject, uint idChild, DWINGUID idProp, wchar* str);
  /*[id(0x60010005)]*/ int SetHwndPropServer(wireHWND hwnd, uint idObject, uint idChild, ref DWINGUID paProps, int cProps, IAccPropServer pServer, AnnoScope AnnoScope);
  /*[id(0x60010006)]*/ int ClearHwndProps(wireHWND hwnd, uint idObject, uint idChild, ref DWINGUID paProps, int cProps);
  /*[id(0x60010007)]*/ int ComposeHwndIdentityString(wireHWND hwnd, uint idObject, uint idChild, out ubyte ppIDString, out uint pdwIDStringLen);
  /*[id(0x60010008)]*/ int DecomposeHwndIdentityString(ubyte* pIDString, uint dwIDStringLen, out wireHWND phwnd, out uint pidObject, out uint pidChild);
  /*[id(0x60010009)]*/ int SetHmenuProp(wireHMENU hmenu, uint idChild, DWINGUID idProp, DWINVARIANT var);
  /*[id(0x6001000A)]*/ int SetHmenuPropStr(wireHMENU hmenu, uint idChild, DWINGUID idProp, wchar* str);
  /*[id(0x6001000B)]*/ int SetHmenuPropServer(wireHMENU hmenu, uint idChild, ref DWINGUID paProps, int cProps, IAccPropServer pServer, AnnoScope AnnoScope);
  /*[id(0x6001000C)]*/ int ClearHmenuProps(wireHMENU hmenu, uint idChild, ref DWINGUID paProps, int cProps);
  /*[id(0x6001000D)]*/ int ComposeHmenuIdentityString(wireHMENU hmenu, uint idChild, out ubyte ppIDString, out uint pdwIDStringLen);
  /*[id(0x6001000E)]*/ int DecomposeHmenuIdentityString(ubyte* pIDString, uint dwIDStringLen, out wireHMENU phmenu, out uint pidChild);
}

// CoClasses

abstract class CAccPropServices {
  mixin(uuid("b5f8350b-0548-48b1-a6ee-88bd00b4a5e7"));
  // static DWINGUID CLSID = { 0xb5f8350b, 0x0548, 0x48b1, 0xa6, 0xee, 0x88, 0xbd, 0x00, 0xb4, 0xa5, 0xe7 };
  mixin Interfaces!(IAccPropServices);
}
