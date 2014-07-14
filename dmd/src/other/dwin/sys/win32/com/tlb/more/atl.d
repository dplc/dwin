// ATL 2.0 Type Library
// Version 1.0

/*[uuid("44ec0535-400f-11d0-9dcd-00a0c90391d3")]*/
module dwin.sys.win32.com.tlb.more.atl;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;
private import dwin.sys.win32.com.tlb.stdole2;

// Interfaces

// IDocHostUIHandlerDispatch Interface
interface IDocHostUIHandlerDispatch : IDispatch {
  mixin(uuid("425b5af0-65f1-11d1-9611-0000f81e0d0d"));
  // static DWINGUID IID = { 0x425b5af0, 0x65f1, 0x11d1, 0x96, 0x11, 0x00, 0x00, 0xf8, 0x1e, 0x0d, 0x0d };
  /*[id(0x60020000)]*/ int ShowContextMenu(uint dwID, uint x, uint y, IUnknown pcmdtReserved, IDispatch pdispReserved, out int dwRetVal);
  /*[id(0x60020001)]*/ int GetHostInfo(ref uint pdwFlags, ref uint pdwDoubleClick);
  /*[id(0x60020002)]*/ int ShowUI(uint dwID, IUnknown pActiveObject, IUnknown pCommandTarget, IUnknown pFrame, IUnknown pDoc, out int dwRetVal);
  /*[id(0x60020003)]*/ int HideUI();
  /*[id(0x60020004)]*/ int UpdateUI();
  /*[id(0x60020005)]*/ int EnableModeless(short fEnable);
  /*[id(0x60020006)]*/ int OnDocWindowActivate(short fActivate);
  /*[id(0x60020007)]*/ int OnFrameWindowActivate(short fActivate);
  /*[id(0x60020008)]*/ int ResizeBorder(int left, int top, int right, int bottom, IUnknown pUIWindow, short fFrameWindow);
  /*[id(0x60020009)]*/ int TranslateAccelerator(uint hWnd, uint nMessage, uint wParam, uint lParam, wchar* bstrGuidCmdGroup, uint nCmdID, out int dwRetVal);
  /*[id(0x6002000A)]*/ int GetOptionKeyPath(out wchar* pbstrKey, uint dw);
  /*[id(0x6002000B)]*/ int GetDropTarget(IUnknown pDropTarget, out IUnknown ppDropTarget);
  /*[id(0x6002000C)]*/ int GetExternal(out IDispatch ppDispatch);
  /*[id(0x6002000D)]*/ int TranslateUrl(uint dwTranslate, wchar* bstrURLIn, out wchar* pbstrURLOut);
  /*[id(0x6002000E)]*/ int FilterDataObject(IUnknown pDO, out IUnknown ppDORet);
}

// IAxWinAmbientDispatch Interface
interface IAxWinAmbientDispatch : IDispatch {
  mixin(uuid("b6ea2051-048a-11d1-82b9-00c04fb9942e"));
  // static DWINGUID IID = { 0xb6ea2051, 0x048a, 0x11d1, 0x82, 0xb9, 0x00, 0xc0, 0x4f, 0xb9, 0x94, 0x2e };
  // Enable or disable windowless activation
  /*[id(0x60020000)]*/ int set_AllowWindowlessActivation(short pbCanWindowlessActivate);
  // Enable or disable windowless activation
  /*[id(0x60020000)]*/ int get_AllowWindowlessActivation(out short pbCanWindowlessActivate);
  // Set the background color
  /*[id(0xFFFFFD43)]*/ int set_BackColor(OLE_COLOR pclrBackground);
  // Set the background color
  /*[id(0xFFFFFD43)]*/ int get_BackColor(out OLE_COLOR pclrBackground);
  // Set the ambient foreground color
  /*[id(0xFFFFFD40)]*/ int set_ForeColor(OLE_COLOR pclrForeground);
  // Set the ambient foreground color
  /*[id(0xFFFFFD40)]*/ int get_ForeColor(out OLE_COLOR pclrForeground);
  // Set the ambient locale
  /*[id(0xFFFFFD3F)]*/ int set_LocaleID(uint plcidLocaleID);
  // Set the ambient locale
  /*[id(0xFFFFFD3F)]*/ int get_LocaleID(out uint plcidLocaleID);
  // Set the ambient user mode
  /*[id(0xFFFFFD3B)]*/ int set_UserMode(short pbUserMode);
  // Set the ambient user mode
  /*[id(0xFFFFFD3B)]*/ int get_UserMode(out short pbUserMode);
  // Enable or disable the control as default
  /*[id(0xFFFFFD37)]*/ int set_DisplayAsDefault(short pbDisplayAsDefault);
  // Enable or disable the control as default
  /*[id(0xFFFFFD37)]*/ int get_DisplayAsDefault(out short pbDisplayAsDefault);
  // Set the ambient font
  /*[id(0xFFFFFD41)]*/ int set_Font(IFontDisp* pFont);
  // Set the ambient font
  /*[id(0xFFFFFD41)]*/ int get_Font(out IFontDisp pFont);
  // Enable or disable message reflection
  /*[id(0xFFFFFD3E)]*/ int set_MessageReflect(short pbMsgReflect);
  // Enable or disable message reflection
  /*[id(0xFFFFFD3E)]*/ int get_MessageReflect(out short pbMsgReflect);
  // Show or hide grab handles
  /*[id(0xFFFFFD39)]*/ int get_ShowGrabHandles(short* pbShowGrabHandles);
  // Are grab handles enabled
  /*[id(0xFFFFFD38)]*/ int get_ShowHatching(short* pbShowHatching);
  // Set the DOCHOSTUIFLAG flags
  /*[id(0x60020012)]*/ int set_DocHostFlags(uint pdwDocHostFlags);
  // Set the DOCHOSTUIFLAG flags
  /*[id(0x60020012)]*/ int get_DocHostFlags(out uint pdwDocHostFlags);
  // Set the DOCHOSTUIDBLCLK flags
  /*[id(0x60020014)]*/ int set_DocHostDoubleClickFlags(uint pdwDocHostDoubleClickFlags);
  // Set the DOCHOSTUIDBLCLK flags
  /*[id(0x60020014)]*/ int get_DocHostDoubleClickFlags(out uint pdwDocHostDoubleClickFlags);
  // Enable or disable context menus
  /*[id(0x60020016)]*/ int set_AllowContextMenu(short pbAllowContextMenu);
  // Enable or disable context menus
  /*[id(0x60020016)]*/ int get_AllowContextMenu(out short pbAllowContextMenu);
  // Enable or disable UI
  /*[id(0x60020018)]*/ int set_AllowShowUI(short pbAllowShowUI);
  // Enable or disable UI
  /*[id(0x60020018)]*/ int get_AllowShowUI(out short pbAllowShowUI);
  // Set the option key path
  /*[id(0x6002001A)]*/ int set_OptionKeyPath(wchar* pbstrOptionKeyPath);
  // Set the option key path
  /*[id(0x6002001A)]*/ int get_OptionKeyPath(out wchar* pbstrOptionKeyPath);
}
