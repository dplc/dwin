// Microsoft Internet Controls
// Version 1.1

/*[uuid("eab22ac0-30c1-11cf-a7eb-0000c05bae0b")]*/
module dwin.sys.win32.com.tlb.shdocvw;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

// Constants for WebBrowser CommandStateChange
enum CommandStateChangeConstants {
  CSC_UPDATECOMMANDS = 0xFFFFFFFF,
  CSC_NAVIGATEFORWARD = 0x00000001,
  CSC_NAVIGATEBACK = 0x00000002,
}

enum OLECMDID {
  OLECMDID_OPEN = 0x00000001,
  OLECMDID_NEW = 0x00000002,
  OLECMDID_SAVE = 0x00000003,
  OLECMDID_SAVEAS = 0x00000004,
  OLECMDID_SAVECOPYAS = 0x00000005,
  OLECMDID_PRINT = 0x00000006,
  OLECMDID_PRINTPREVIEW = 0x00000007,
  OLECMDID_PAGESETUP = 0x00000008,
  OLECMDID_SPELL = 0x00000009,
  OLECMDID_PROPERTIES = 0x0000000A,
  OLECMDID_CUT = 0x0000000B,
  OLECMDID_COPY = 0x0000000C,
  OLECMDID_PASTE = 0x0000000D,
  OLECMDID_PASTESPECIAL = 0x0000000E,
  OLECMDID_UNDO = 0x0000000F,
  OLECMDID_REDO = 0x00000010,
  OLECMDID_SELECTALL = 0x00000011,
  OLECMDID_CLEARSELECTION = 0x00000012,
  OLECMDID_ZOOM = 0x00000013,
  OLECMDID_GETZOOMRANGE = 0x00000014,
  OLECMDID_UPDATECOMMANDS = 0x00000015,
  OLECMDID_REFRESH = 0x00000016,
  OLECMDID_STOP = 0x00000017,
  OLECMDID_HIDETOOLBARS = 0x00000018,
  OLECMDID_SETPROGRESSMAX = 0x00000019,
  OLECMDID_SETPROGRESSPOS = 0x0000001A,
  OLECMDID_SETPROGRESSTEXT = 0x0000001B,
  OLECMDID_SETTITLE = 0x0000001C,
  OLECMDID_SETDOWNLOADSTATE = 0x0000001D,
  OLECMDID_STOPDOWNLOAD = 0x0000001E,
  OLECMDID_ONTOOLBARACTIVATED = 0x0000001F,
  OLECMDID_FIND = 0x00000020,
  OLECMDID_DELETE = 0x00000021,
  OLECMDID_HTTPEQUIV = 0x00000022,
  OLECMDID_HTTPEQUIV_DONE = 0x00000023,
  OLECMDID_ENABLE_INTERACTION = 0x00000024,
  OLECMDID_ONUNLOAD = 0x00000025,
  OLECMDID_PROPERTYBAG2 = 0x00000026,
  OLECMDID_PREREFRESH = 0x00000027,
  OLECMDID_SHOWSCRIPTERROR = 0x00000028,
  OLECMDID_SHOWMESSAGE = 0x00000029,
  OLECMDID_SHOWFIND = 0x0000002A,
  OLECMDID_SHOWPAGESETUP = 0x0000002B,
  OLECMDID_SHOWPRINT = 0x0000002C,
  OLECMDID_CLOSE = 0x0000002D,
  OLECMDID_ALLOWUILESSSAVEAS = 0x0000002E,
  OLECMDID_DONTDOWNLOADCSS = 0x0000002F,
  OLECMDID_UPDATEPAGESTATUS = 0x00000030,
  OLECMDID_PRINT2 = 0x00000031,
  OLECMDID_PRINTPREVIEW2 = 0x00000032,
  OLECMDID_SETPRINTTEMPLATE = 0x00000033,
  OLECMDID_GETPRINTTEMPLATE = 0x00000034,
  OLECMDID_PAGEACTIONBLOCKED = 0x00000037,
  OLECMDID_PAGEACTIONUIQUERY = 0x00000038,
  OLECMDID_FOCUSVIEWCONTROLS = 0x00000039,
  OLECMDID_FOCUSVIEWCONTROLSQUERY = 0x0000003A,
  OLECMDID_SHOWPAGEACTIONMENU = 0x0000003B,
}

enum OLECMDF {
  OLECMDF_SUPPORTED = 0x00000001,
  OLECMDF_ENABLED = 0x00000002,
  OLECMDF_LATCHED = 0x00000004,
  OLECMDF_NINCHED = 0x00000008,
  OLECMDF_INVISIBLE = 0x00000010,
  OLECMDF_DEFHIDEONCTXTMENU = 0x00000020,
}

enum OLECMDEXECOPT {
  OLECMDEXECOPT_DODEFAULT = 0x00000000,
  OLECMDEXECOPT_PROMPTUSER = 0x00000001,
  OLECMDEXECOPT_DONTPROMPTUSER = 0x00000002,
  OLECMDEXECOPT_SHOWHELP = 0x00000003,
}

enum tagREADYSTATE {
  READYSTATE_UNINITIALIZED = 0x00000000,
  READYSTATE_LOADING = 0x00000001,
  READYSTATE_LOADED = 0x00000002,
  READYSTATE_INTERACTIVE = 0x00000003,
  READYSTATE_COMPLETE = 0x00000004,
}

// Constants for WebBrowser security icon notification
enum SecureLockIconConstants {
  secureLockIconUnsecure = 0x00000000,
  secureLockIconMixed = 0x00000001,
  secureLockIconSecureUnknownBits = 0x00000002,
  secureLockIconSecure40Bit = 0x00000003,
  secureLockIconSecure56Bit = 0x00000004,
  secureLockIconSecureFortezza = 0x00000005,
  secureLockIconSecure128Bit = 0x00000006,
}

// Constants for ShellWindows registration
enum ShellWindowTypeConstants {
  SWC_EXPLORER = 0x00000000,
  SWC_BROWSER = 0x00000001,
  SWC_3RDPARTY = 0x00000002,
  SWC_CALLBACK = 0x00000004,
}

// Options for ShellWindows FindWindow
enum ShellWindowFindWindowOptions {
  SWFO_NEEDDISPATCH = 0x00000001,
  SWFO_INCLUDEPENDING = 0x00000002,
  SWFO_COOKIEPASSED = 0x00000004,
}

// Interfaces

// Web Browser interface
interface IWebBrowser : IDispatch {
  mixin(uuid("eab22ac1-30c1-11cf-a7eb-0000c05bae0b"));
  // static DWINGUID IID = { 0xeab22ac1, 0x30c1, 0x11cf, 0xa7, 0xeb, 0x00, 0x00, 0xc0, 0x5b, 0xae, 0x0b };
  // Navigates to the previous item in the history list.
  /*[id(0x00000064)]*/ int GoBack();
  // Navigates to the next item in the history list.
  /*[id(0x00000065)]*/ int GoForward();
  // Go home/start page.
  /*[id(0x00000066)]*/ int GoHome();
  // Go Search Page.
  /*[id(0x00000067)]*/ int GoSearch();
  // Navigates to a URL or file.
  /*[id(0x00000068)]*/ int Navigate(wchar* URL, DWINVARIANT* Flags, DWINVARIANT* TargetFrameName, DWINVARIANT* PostData, DWINVARIANT* Headers);
  // Refresh the currently viewed page.
  /*[id(0xFFFFFDDA)]*/ int Refresh();
  // Refresh the currently viewed page.
  /*[id(0x00000069)]*/ int Refresh2(DWINVARIANT* Level);
  // Stops opening a file.
  /*[id(0x0000006A)]*/ int Stop();
  // Returns the application automation object if accessible, this automation object otherwise..
  /*[id(0x000000C8)]*/ int get_Application(out IDispatch ppDisp);
  // Returns the automation object of the container/parent if one exists or this automation object.
  /*[id(0x000000C9)]*/ int get_Parent(out IDispatch ppDisp);
  // Returns the container/parent automation object, if any.
  /*[id(0x000000CA)]*/ int get_Container(out IDispatch ppDisp);
  // Returns the active Document automation object, if any.
  /*[id(0x000000CB)]*/ int get_Document(out IDispatch ppDisp);
  // Returns True if this is the top level object.
  /*[id(0x000000CC)]*/ int get_TopLevelContainer(out short pBool);
  // Returns the type of the contained document object.
  /*[id(0x000000CD)]*/ int get_Type(out wchar* Type);
  // The horizontal position (pixels) of the frame window relative to the screen/container.
  /*[id(0x000000CE)]*/ int get_Left(out int pl);
  // The horizontal position (pixels) of the frame window relative to the screen/container.
  /*[id(0x000000CE)]*/ int put_Left(int pl);
  // The vertical position (pixels) of the frame window relative to the screen/container.
  /*[id(0x000000CF)]*/ int get_Top(out int pl);
  // The vertical position (pixels) of the frame window relative to the screen/container.
  /*[id(0x000000CF)]*/ int put_Top(int pl);
  // The horizontal dimension (pixels) of the frame window/object.
  /*[id(0x000000D0)]*/ int get_Width(out int pl);
  // The horizontal dimension (pixels) of the frame window/object.
  /*[id(0x000000D0)]*/ int put_Width(int pl);
  // The vertical dimension (pixels) of the frame window/object.
  /*[id(0x000000D1)]*/ int get_Height(out int pl);
  // The vertical dimension (pixels) of the frame window/object.
  /*[id(0x000000D1)]*/ int put_Height(int pl);
  // Gets the short (UI-friendly) name of the URL/file currently viewed.
  /*[id(0x000000D2)]*/ int get_LocationName(out wchar* LocationName);
  // Gets the full URL/path currently viewed.
  /*[id(0x000000D3)]*/ int get_LocationURL(out wchar* LocationURL);
  // Query to see if something is still in progress.
  /*[id(0x000000D4)]*/ int get_Busy(out short pBool);
}

// Web Browser Control Events (old)
interface DWebBrowserEvents : IDispatch {
  mixin(uuid("eab22ac2-30c1-11cf-a7eb-0000c05bae0b"));
  // static DWINGUID IID = { 0xeab22ac2, 0x30c1, 0x11cf, 0xa7, 0xeb, 0x00, 0x00, 0xc0, 0x5b, 0xae, 0x0b };
  /+// Fired when a new hyperlink is being navigated to.
  /*[id(0x00000064)]*/ void BeforeNavigate(wchar* URL, int Flags, wchar* TargetFrameName, DWINVARIANT* PostData, wchar* Headers, ref short Cancel);+/
  /+// Fired when the document being navigated to becomes visible and enters the navigation stack.
  /*[id(0x00000065)]*/ void NavigateComplete(wchar* URL);+/
  /+// Statusbar text changed.
  /*[id(0x00000066)]*/ void StatusTextChange(wchar* Text);+/
  /+// Fired when download progress is updated.
  /*[id(0x0000006C)]*/ void ProgressChange(int Progress, int ProgressMax);+/
  /+// Download of page complete.
  /*[id(0x00000068)]*/ void DownloadComplete();+/
  /+// The enabled state of a command changed
  /*[id(0x00000069)]*/ void CommandStateChange(int Command, short Enable);+/
  /+// Download of a page started.
  /*[id(0x0000006A)]*/ void DownloadBegin();+/
  /+// Fired when a new window should be created.
  /*[id(0x0000006B)]*/ void NewWindow(wchar* URL, int Flags, wchar* TargetFrameName, DWINVARIANT* PostData, wchar* Headers, ref short Processed);+/
  /+// Document title changed.
  /*[id(0x00000071)]*/ void TitleChange(wchar* Text);+/
  /+// Fired when a new hyperlink is being navigated to in a frame.
  /*[id(0x000000C8)]*/ void FrameBeforeNavigate(wchar* URL, int Flags, wchar* TargetFrameName, DWINVARIANT* PostData, wchar* Headers, ref short Cancel);+/
  /+// Fired when a new hyperlink is being navigated to in a frame.
  /*[id(0x000000C9)]*/ void FrameNavigateComplete(wchar* URL);+/
  /+// Fired when a new window should be created.
  /*[id(0x000000CC)]*/ void FrameNewWindow(wchar* URL, int Flags, wchar* TargetFrameName, DWINVARIANT* PostData, wchar* Headers, ref short Processed);+/
  /+// Fired when application is quiting.
  /*[id(0x00000067)]*/ void Quit(ref short Cancel);+/
  /+// Fired when window has been moved.
  /*[id(0x0000006D)]*/ void WindowMove();+/
  /+// Fired when window has been sized.
  /*[id(0x0000006E)]*/ void WindowResize();+/
  /+// Fired when window has been activated.
  /*[id(0x0000006F)]*/ void WindowActivate();+/
  /+// Fired when the PutProperty method has been called.
  /*[id(0x00000070)]*/ void PropertyChange(wchar* Property);+/
}

// Web Browser Application Interface.
interface IWebBrowserApp : IWebBrowser {
  mixin(uuid("0002df05-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x0002df05, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  // Exits application and closes the open document.
  /*[id(0x0000012C)]*/ int Quit();
  // Converts client sizes into window sizes.
  /*[id(0x0000012D)]*/ int ClientToWindow(ref int pcx, ref int pcy);
  // Associates vtValue with the name szProperty in the context of the object.
  /*[id(0x0000012E)]*/ int PutProperty(wchar* Property, DWINVARIANT vtValue);
  // Retrieve the Associated value for the property vtValue in the context of the object.
  /*[id(0x0000012F)]*/ int GetProperty(wchar* Property, out DWINVARIANT pvtValue);
  // Returns name of the application.
  /*[id(0x00000000)]*/ int get_Name(out wchar* Name);
  // Returns the HWND of the current IE window.
  /*[id(0xFFFFFDFD)]*/ int get_HWND(out int pHWND);
  // Returns file specification of the application, including path.
  /*[id(0x00000190)]*/ int get_FullName(out wchar* FullName);
  // Returns the path to the application.
  /*[id(0x00000191)]*/ int get_Path(out wchar* Path);
  // Determines whether the application is visible or hidden.
  /*[id(0x00000192)]*/ int get_Visible(out short pBool);
  // Determines whether the application is visible or hidden.
  /*[id(0x00000192)]*/ int put_Visible(short pBool);
  // Turn on or off the statusbar.
  /*[id(0x00000193)]*/ int get_StatusBar(out short pBool);
  // Turn on or off the statusbar.
  /*[id(0x00000193)]*/ int put_StatusBar(short pBool);
  // Text of Status window.
  /*[id(0x00000194)]*/ int get_StatusText(out wchar* StatusText);
  // Text of Status window.
  /*[id(0x00000194)]*/ int put_StatusText(wchar* StatusText);
  // Controls which toolbar is shown.
  /*[id(0x00000195)]*/ int get_ToolBar(out int Value);
  // Controls which toolbar is shown.
  /*[id(0x00000195)]*/ int put_ToolBar(int Value);
  // Controls whether menubar is shown.
  /*[id(0x00000196)]*/ int get_MenuBar(out short Value);
  // Controls whether menubar is shown.
  /*[id(0x00000196)]*/ int put_MenuBar(short Value);
  // Maximizes window and turns off statusbar, toolbar, menubar, and titlebar.
  /*[id(0x00000197)]*/ int get_FullScreen(out short pbFullScreen);
  // Maximizes window and turns off statusbar, toolbar, menubar, and titlebar.
  /*[id(0x00000197)]*/ int put_FullScreen(short pbFullScreen);
}

// Web Browser Interface for IE4.
interface IWebBrowser2 : IWebBrowserApp {
  mixin(uuid("d30c1661-cdaf-11d0-8a3e-00c04fc9e26e"));
  // static DWINGUID IID = { 0xd30c1661, 0xcdaf, 0x11d0, 0x8a, 0x3e, 0x00, 0xc0, 0x4f, 0xc9, 0xe2, 0x6e };
  // Navigates to a URL or file or pidl.
  /*[id(0x000001F4)]*/ int Navigate2(DWINVARIANT* URL, DWINVARIANT* Flags, DWINVARIANT* TargetFrameName, DWINVARIANT* PostData, DWINVARIANT* Headers);
  // IOleCommandTarget::QueryStatus
  /*[id(0x000001F5)]*/ int QueryStatusWB(OLECMDID cmdID, out OLECMDF pcmdf);
  // IOleCommandTarget::Exec
  /*[id(0x000001F6)]*/ int ExecWB(OLECMDID cmdID, OLECMDEXECOPT cmdexecopt, DWINVARIANT* pvaIn, DWINVARIANT pvaOut);
  // Set BrowserBar to Clsid
  /*[id(0x000001F7)]*/ int ShowBrowserBar(DWINVARIANT* pvaClsid, DWINVARIANT* pvarShow, DWINVARIANT* pvarSize);
  /*[id(0xFFFFFDF3)]*/ int get_ReadyState(out tagREADYSTATE plReadyState);
  // Controls if the frame is offline (read from cache)
  /*[id(0x00000226)]*/ int get_Offline(out short pbOffline);
  // Controls if the frame is offline (read from cache)
  /*[id(0x00000226)]*/ int put_Offline(short pbOffline);
  // Controls if any dialog boxes can be shown
  /*[id(0x00000227)]*/ int get_Silent(out short pbSilent);
  // Controls if any dialog boxes can be shown
  /*[id(0x00000227)]*/ int put_Silent(short pbSilent);
  // Registers OC as a top-level browser (for target name resolution)
  /*[id(0x00000228)]*/ int get_RegisterAsBrowser(out short pbRegister);
  // Registers OC as a top-level browser (for target name resolution)
  /*[id(0x00000228)]*/ int put_RegisterAsBrowser(short pbRegister);
  // Registers OC as a drop target for navigation
  /*[id(0x00000229)]*/ int get_RegisterAsDropTarget(out short pbRegister);
  // Registers OC as a drop target for navigation
  /*[id(0x00000229)]*/ int put_RegisterAsDropTarget(short pbRegister);
  // Controls if the browser is in theater mode
  /*[id(0x0000022A)]*/ int get_TheaterMode(out short pbRegister);
  // Controls if the browser is in theater mode
  /*[id(0x0000022A)]*/ int put_TheaterMode(short pbRegister);
  // Controls whether address bar is shown
  /*[id(0x0000022B)]*/ int get_AddressBar(out short Value);
  // Controls whether address bar is shown
  /*[id(0x0000022B)]*/ int put_AddressBar(short Value);
  // Controls whether the window is resizable
  /*[id(0x0000022C)]*/ int get_Resizable(out short Value);
  // Controls whether the window is resizable
  /*[id(0x0000022C)]*/ int put_Resizable(short Value);
}

// Web Browser Control events interface
interface DWebBrowserEvents2 : IDispatch {
  mixin(uuid("34a715a0-6587-11d0-924a-0020afc7ac4d"));
  // static DWINGUID IID = { 0x34a715a0, 0x6587, 0x11d0, 0x92, 0x4a, 0x00, 0x20, 0xaf, 0xc7, 0xac, 0x4d };
  //~ void DownloadBegin();
  
  /+// Statusbar text changed.
  /*[id(0x00000066)]*/ void StatusTextChange(wchar* Text);+/
  /+// Fired when download progress is updated.
  /*[id(0x0000006C)]*/ void ProgressChange(int Progress, int ProgressMax);+/
  /+// The enabled state of a command changed.
  /*[id(0x00000069)]*/ void CommandStateChange(int Command, short Enable);+/
  /+// Download of a page started.
  /*[id(0x0000006A)]*/ void DownloadBegin();+/
  /+// Download of page complete.
  /*[id(0x00000068)]*/ void DownloadComplete();+/
  /+// Document title changed.
  /*[id(0x00000071)]*/ void TitleChange(wchar* Text);+/
  /+// Fired when the PutProperty method has been called.
  /*[id(0x00000070)]*/ void PropertyChange(wchar* szProperty);+/
  /+// Fired before navigate occurs in the given WebBrowser (window or frameset element). The processing of this navigation may be modified.
  /*[id(0x000000FA)]*/ void BeforeNavigate2(IDispatch pDisp, DWINVARIANT* URL, DWINVARIANT* Flags, DWINVARIANT* TargetFrameName, DWINVARIANT* PostData, DWINVARIANT* Headers, ref short Cancel);+/
  /+// A new, hidden, non-navigated WebBrowser window is needed.
  /*[id(0x000000FB)]*/ void NewWindow2(ref IDispatch ppDisp, ref short Cancel);+/
  /+// Fired when the document being navigated to becomes visible and enters the navigation stack.
  /*[id(0x000000FC)]*/ void NavigateComplete2(IDispatch pDisp, DWINVARIANT* URL);+/
  /+// Fired when the document being navigated to reaches ReadyState_Complete.
  /*[id(0x00000103)]*/ void DocumentComplete(IDispatch pDisp, DWINVARIANT* URL);+/
  /+// Fired when application is quiting.
  /*[id(0x000000FD)]*/ void OnQuit();+/
  /+// Fired when the window should be shown/hidden
  /*[id(0x000000FE)]*/ void OnVisible(short Visible);+/
  /+// Fired when the toolbar  should be shown/hidden
  /*[id(0x000000FF)]*/ void OnToolBar(short ToolBar);+/
  /+// Fired when the menubar should be shown/hidden
  /*[id(0x00000100)]*/ void OnMenuBar(short MenuBar);+/
  /+// Fired when the statusbar should be shown/hidden
  /*[id(0x00000101)]*/ void OnStatusBar(short StatusBar);+/
  /+// Fired when fullscreen mode should be on/off
  /*[id(0x00000102)]*/ void OnFullScreen(short FullScreen);+/
  /+// Fired when theater mode should be on/off
  /*[id(0x00000104)]*/ void OnTheaterMode(short TheaterMode);+/
  /+// Fired when the host window should allow/disallow resizing
  /*[id(0x00000106)]*/ void WindowSetResizable(short Resizable);+/
  /+// Fired when the host window should change its Left coordinate
  /*[id(0x00000108)]*/ void WindowSetLeft(int Left);+/
  /+// Fired when the host window should change its Top coordinate
  /*[id(0x00000109)]*/ void WindowSetTop(int Top);+/
  /+// Fired when the host window should change its width
  /*[id(0x0000010A)]*/ void WindowSetWidth(int Width);+/
  /+// Fired when the host window should change its height
  /*[id(0x0000010B)]*/ void WindowSetHeight(int Height);+/
  /+// Fired when the WebBrowser is about to be closed by script
  /*[id(0x00000107)]*/ void WindowClosing(short IsChildWindow, ref short Cancel);+/
  /+// Fired to request client sizes be converted to host window sizes
  /*[id(0x0000010C)]*/ void ClientToHostWindow(ref int CX, ref int CY);+/
  /+// Fired to indicate the security level of the current web page contents
  /*[id(0x0000010D)]*/ void SetSecureLockIcon(int SecureLockIcon);+/
  /+// Fired to indicate the File Download dialog is opening
  /*[id(0x0000010E)]*/ void FileDownload(ref short Cancel);+/
  /+// Fired when a binding error occurs (window or frameset element).
  /*[id(0x0000010F)]*/ void NavigateError(IDispatch pDisp, DWINVARIANT* URL, DWINVARIANT* Frame, DWINVARIANT* StatusCode, ref short Cancel);+/
  /+// Fired when a print template is instantiated.
  /*[id(0x000000E1)]*/ void PrintTemplateInstantiation(IDispatch pDisp);+/
  /+// Fired when a print template destroyed.
  /*[id(0x000000E2)]*/ void PrintTemplateTeardown(IDispatch pDisp);+/
  /+// Fired when a page is spooled. When it is fired can be changed by a custom template.
  /*[id(0x000000E3)]*/ void UpdatePageStatus(IDispatch pDisp, DWINVARIANT* nPage, DWINVARIANT* fDone);+/
  /+// Fired when the global privacy impacted state changes
  /*[id(0x00000110)]*/ void PrivacyImpactedStateChange(short bImpacted);+/
  /+// A new, hidden, non-navigated WebBrowser window is needed.
  /*[id(0x00000111)]*/ void NewWindow3(ref IDispatch ppDisp, ref short Cancel, uint dwFlags, wchar* bstrUrlContext, wchar* bstrUrl);+/
}

// Event interface for IShellWindows
interface DShellWindowsEvents : IDispatch {
  mixin(uuid("fe4106e0-399a-11d0-a48c-00a0c90a8f39"));
  // static DWINGUID IID = { 0xfe4106e0, 0x399a, 0x11d0, 0xa4, 0x8c, 0x00, 0xa0, 0xc9, 0x0a, 0x8f, 0x39 };
  /+// A new window was registered.
  /*[id(0x000000C8)]*/ void WindowRegistered(int lCookie);+/
  /+// A new window was revoked.
  /*[id(0x000000C9)]*/ void WindowRevoked(int lCookie);+/
}

// Definition of interface IShellWindows
interface IShellWindows : IDispatch {
  mixin(uuid("85cb6900-4d95-11cf-960c-0080c7f4ee85"));
  // static DWINGUID IID = { 0x85cb6900, 0x4d95, 0x11cf, 0x96, 0x0c, 0x00, 0x80, 0xc7, 0xf4, 0xee, 0x85 };
  // Get count of open Shell windows
  /*[id(0x60020000)]*/ int get_Count(out int Count);
  // Return the shell window for the given index
  /*[id(0x00000000)]*/ int Item(DWINVARIANT index, out IDispatch Folder);
  // Enumerates the figures
  /*[id(0xFFFFFFFC)]*/ int _NewEnum(out IUnknown ppunk);
  // Register a window with the list
  /*[id(0x60020003)]*/ int Register(IDispatch pid, int HWND, int swClass, out int plCookie);
  // Register a pending open with the list
  /*[id(0x60020004)]*/ int RegisterPending(int lThreadId, DWINVARIANT* pvarloc, DWINVARIANT* pvarlocRoot, int swClass, out int plCookie);
  // Remove a window from the list
  /*[id(0x60020005)]*/ int Revoke(int lCookie);
  // Notifies the new location
  /*[id(0x60020006)]*/ int OnNavigate(int lCookie, DWINVARIANT* pvarloc);
  // Notifies the activation
  /*[id(0x60020007)]*/ int OnActivated(int lCookie, short fActive);
  // Find the window based on the location
  /*[id(0x60020008)]*/ int FindWindowSW(DWINVARIANT* pvarloc, DWINVARIANT* pvarlocRoot, int swClass, out int pHWND, int swfwOptions, out IDispatch ppdispOut);
  // Notifies on creation and frame name set
  /*[id(0x60020009)]*/ int OnCreated(int lCookie, IUnknown punk);
  // Used by IExplore to register different processes
  /*[id(0x6002000A)]*/ int ProcessAttachDetach(short fAttach);
}

// Shell UI Helper Control Interface
interface IShellUIHelper : IDispatch {
  mixin(uuid("729fe2f8-1ea8-11d1-8f85-00c04fc2fbe1"));
  // static DWINGUID IID = { 0x729fe2f8, 0x1ea8, 0x11d1, 0x8f, 0x85, 0x00, 0xc0, 0x4f, 0xc2, 0xfb, 0xe1 };
  /*[id(0x00000001)]*/ int ResetFirstBootMode();
  /*[id(0x00000002)]*/ int ResetSafeMode();
  /*[id(0x00000003)]*/ int RefreshOfflineDesktop();
  /*[id(0x00000004)]*/ int AddFavorite(wchar* URL, DWINVARIANT* Title);
  /*[id(0x00000005)]*/ int AddChannel(wchar* URL);
  /*[id(0x00000006)]*/ int AddDesktopComponent(wchar* URL, wchar* Type, DWINVARIANT* Left, DWINVARIANT* Top, DWINVARIANT* Width, DWINVARIANT* Height);
  /*[id(0x00000007)]*/ int IsSubscribed(wchar* URL, out short pBool);
  /*[id(0x00000008)]*/ int NavigateAndFind(wchar* URL, wchar* strQuery, DWINVARIANT* varTargetFrame);
  /*[id(0x00000009)]*/ int ImportExportFavorites(short fImport, wchar* strImpExpPath);
  /*[id(0x0000000A)]*/ int AutoCompleteSaveForm(DWINVARIANT* Form);
  /*[id(0x0000000B)]*/ int AutoScan(wchar* strSearch, wchar* strFailureUrl, DWINVARIANT* pvarTargetFrame);
  /*[id(0x0000000C)]*/ int AutoCompleteAttach(DWINVARIANT* Reserved);
  /*[id(0x0000000D)]*/ int ShowBrowserUI(wchar* bstrName, DWINVARIANT* pvarIn, out DWINVARIANT pvarOut);
}

interface DShellNameSpaceEvents : IDispatch {
  mixin(uuid("55136806-b2de-11d1-b9f2-00a0c98bc547"));
  // static DWINGUID IID = { 0x55136806, 0xb2de, 0x11d1, 0xb9, 0xf2, 0x00, 0xa0, 0xc9, 0x8b, 0xc5, 0x47 };
  /+/*[id(0x00000001)]*/ void FavoritesSelectionChange(int cItems, int hItem, wchar* strName, wchar* strUrl, int cVisits, wchar* strDate, int fAvailableOffline);+/
  /+/*[id(0x00000002)]*/ void SelectionChange();+/
  /+/*[id(0x00000003)]*/ void DoubleClick();+/
  /+/*[id(0x00000004)]*/ void Initialized();+/
}

// IShellFavoritesNameSpace Interface
interface IShellFavoritesNameSpace : IDispatch {
  mixin(uuid("55136804-b2de-11d1-b9f2-00a0c98bc547"));
  // static DWINGUID IID = { 0x55136804, 0xb2de, 0x11d1, 0xb9, 0xf2, 0x00, 0xa0, 0xc9, 0x8b, 0xc5, 0x47 };
  // method MoveSelectionUp
  /*[id(0x00000001)]*/ int MoveSelectionUp();
  // method MoveSelectionDown
  /*[id(0x00000002)]*/ int MoveSelectionDown();
  // method ResetSort
  /*[id(0x00000003)]*/ int ResetSort();
  // method NewFolder
  /*[id(0x00000004)]*/ int NewFolder();
  // method Synchronize
  /*[id(0x00000005)]*/ int Synchronize();
  // method Import
  /*[id(0x00000006)]*/ int Import();
  // method Export
  /*[id(0x00000007)]*/ int Export();
  // method InvokeContextMenuCommand
  /*[id(0x00000008)]*/ int InvokeContextMenuCommand(wchar* strCommand);
  // method MoveSelectionTo
  /*[id(0x00000009)]*/ int MoveSelectionTo();
  // Query to see if subscriptions are enabled
  /*[id(0x0000000A)]*/ int get_SubscriptionsEnabled(out short pBool);
  // method CreateSubscriptionForSelection
  /*[id(0x0000000B)]*/ int CreateSubscriptionForSelection(out short pBool);
  // method DeleteSubscriptionForSelection
  /*[id(0x0000000C)]*/ int DeleteSubscriptionForSelection(out short pBool);
  // old, use put_Root() instead
  /*[id(0x0000000D)]*/ int SetRoot(wchar* bstrFullPath);
}

// IShellNameSpace Interface
interface IShellNameSpace : IShellFavoritesNameSpace {
  mixin(uuid("e572d3c9-37be-4ae2-825d-d521763e3108"));
  // static DWINGUID IID = { 0xe572d3c9, 0x37be, 0x4ae2, 0x82, 0x5d, 0xd5, 0x21, 0x76, 0x3e, 0x31, 0x08 };
  // options 
  /*[id(0x0000000E)]*/ int get_EnumOptions(out int pgrfEnumFlags);
  // options 
  /*[id(0x0000000E)]*/ int put_EnumOptions(int pgrfEnumFlags);
  // get the selected item
  /*[id(0x0000000F)]*/ int get_SelectedItem(out IDispatch pItem);
  // get the selected item
  /*[id(0x0000000F)]*/ int put_SelectedItem(IDispatch pItem);
  // get the root item
  /*[id(0x00000010)]*/ int get_Root(out DWINVARIANT pvar);
  // get the root item
  /*[id(0x00000010)]*/ int put_Root(DWINVARIANT pvar);
  /*[id(0x00000011)]*/ int get_Depth(out int piDepth);
  /*[id(0x00000011)]*/ int put_Depth(int piDepth);
  /*[id(0x00000012)]*/ int get_Mode(out uint puMode);
  /*[id(0x00000012)]*/ int put_Mode(uint puMode);
  /*[id(0x00000013)]*/ int get_Flags(out uint pdwFlags);
  /*[id(0x00000013)]*/ int put_Flags(uint pdwFlags);
  /*[id(0x00000014)]*/ int put_TVFlags(uint dwFlags);
  /*[id(0x00000014)]*/ int get_TVFlags(out uint dwFlags);
  /*[id(0x00000015)]*/ int get_Columns(out wchar* bstrColumns);
  /*[id(0x00000015)]*/ int put_Columns(wchar* bstrColumns);
  // number of view types
  /*[id(0x00000016)]*/ int get_CountViewTypes(out int piTypes);
  // set view type
  /*[id(0x00000017)]*/ int SetViewType(int iType);
  // collection of selected items
  /*[id(0x00000018)]*/ int SelectedItems(out IDispatch ppid);
  // expands item specified depth
  /*[id(0x00000019)]*/ int Expand(DWINVARIANT var, int iDepth);
  // unselects all items
  /*[id(0x0000001A)]*/ int UnselectAll();
}

// Script Error List Interface
interface IScriptErrorList : IDispatch {
  mixin(uuid("f3470f24-15fd-11d2-bb2e-00805ff7efca"));
  // static DWINGUID IID = { 0xf3470f24, 0x15fd, 0x11d2, 0xbb, 0x2e, 0x00, 0x80, 0x5f, 0xf7, 0xef, 0xca };
  /*[id(0x0000000A)]*/ int advanceError();
  /*[id(0x0000000B)]*/ int retreatError();
  /*[id(0x0000000C)]*/ int canAdvanceError(out int pfCanAdvance);
  /*[id(0x0000000D)]*/ int canRetreatError(out int pfCanRetreat);
  /*[id(0x0000000E)]*/ int getErrorLine(out int plLine);
  /*[id(0x0000000F)]*/ int getErrorChar(out int plChar);
  /*[id(0x00000010)]*/ int getErrorCode(out int plCode);
  /*[id(0x00000011)]*/ int getErrorMsg(out wchar* pstr);
  /*[id(0x00000012)]*/ int getErrorUrl(out wchar* pstr);
  /*[id(0x00000017)]*/ int getAlwaysShowLockState(out int pfAlwaysShowLocked);
  /*[id(0x00000013)]*/ int getDetailsPaneOpen(out int pfDetailsPaneOpen);
  /*[id(0x00000014)]*/ int setDetailsPaneOpen(int fDetailsPaneOpen);
  /*[id(0x00000015)]*/ int getPerErrorDisplay(out int pfPerErrorDisplay);
  /*[id(0x00000016)]*/ int setPerErrorDisplay(int fPerErrorDisplay);
}

// Enumerated Search
interface ISearch : IDispatch {
  mixin(uuid("ba9239a4-3dd5-11d2-bf8b-00c04fb93661"));
  // static DWINGUID IID = { 0xba9239a4, 0x3dd5, 0x11d2, 0xbf, 0x8b, 0x00, 0xc0, 0x4f, 0xb9, 0x36, 0x61 };
  // Get search title
  /*[id(0x60020000)]*/ int get_Title(out wchar* pbstrTitle);
  // Get search guid
  /*[id(0x60020001)]*/ int get_Id(out wchar* pbstrId);
  // Get search url
  /*[id(0x60020002)]*/ int get_URL(out wchar* pbstrUrl);
}

// Searches Enum
interface ISearches : IDispatch {
  mixin(uuid("47c922a2-3dd5-11d2-bf8b-00c04fb93661"));
  // static DWINGUID IID = { 0x47c922a2, 0x3dd5, 0x11d2, 0xbf, 0x8b, 0x00, 0xc0, 0x4f, 0xb9, 0x36, 0x61 };
  // Get the count of searches
  /*[id(0x60020000)]*/ int get_Count(out int plCount);
  // Get the default search name
  /*[id(0x60020001)]*/ int get_Default(out wchar* pbstrDefault);
  // Return the specified search
  /*[id(0x60020002)]*/ int Item(DWINVARIANT index, out ISearch ppid);
  // Enumerates the searches
  /*[id(0xFFFFFFFC)]*/ int _NewEnum(out IUnknown ppunk);
}

// ISearchAssistantOC Interface
interface ISearchAssistantOC : IDispatch {
  mixin(uuid("72423e8f-8011-11d2-be79-00a0c9a83da1"));
  // static DWINGUID IID = { 0x72423e8f, 0x8011, 0x11d2, 0xbe, 0x79, 0x00, 0xa0, 0xc9, 0xa8, 0x3d, 0xa1 };
  /*[id(0x00000001)]*/ int AddNextMenuItem(wchar* bstrText, int idItem);
  /*[id(0x00000002)]*/ int SetDefaultSearchUrl(wchar* bstrUrl);
  /*[id(0x00000003)]*/ int NavigateToDefaultSearch();
  /*[id(0x00000004)]*/ int IsRestricted(wchar* bstrGuid, out short pVal);
  // property ShellFeaturesEnabled
  /*[id(0x00000005)]*/ int get_ShellFeaturesEnabled(out short pVal);
  // property SearchAssistantDefault
  /*[id(0x00000006)]*/ int get_SearchAssistantDefault(out short pVal);
  // Get searches
  /*[id(0x00000007)]*/ int get_Searches(out ISearches ppid);
  // Returns true if the current folder is web folder
  /*[id(0x00000008)]*/ int get_InWebFolder(out short pVal);
  /*[id(0x00000009)]*/ int PutProperty(short bPerLocale, wchar* bstrName, wchar* bstrValue);
  /*[id(0x0000000A)]*/ int GetProperty(short bPerLocale, wchar* bstrName, out wchar* pbstrValue);
  /*[id(0x0000000B)]*/ int put_EventHandled(short value);
  /*[id(0x0000000C)]*/ int ResetNextMenu();
  /*[id(0x0000000D)]*/ int FindOnWeb();
  /*[id(0x0000000E)]*/ int FindFilesOrFolders();
  /*[id(0x0000000F)]*/ int FindComputer();
  /*[id(0x00000010)]*/ int FindPrinter();
  /*[id(0x00000011)]*/ int FindPeople();
  /*[id(0x00000012)]*/ int GetSearchAssistantURL(short bSubstitute, short bCustomize, out wchar* pbstrValue);
  /*[id(0x00000013)]*/ int NotifySearchSettingsChanged();
  /*[id(0x00000014)]*/ int put_ASProvider(wchar* pProvider);
  /*[id(0x00000014)]*/ int get_ASProvider(out wchar* pProvider);
  /*[id(0x00000015)]*/ int put_ASSetting(int pSetting);
  /*[id(0x00000015)]*/ int get_ASSetting(out int pSetting);
  /*[id(0x00000016)]*/ int NETDetectNextNavigate();
  /*[id(0x00000017)]*/ int PutFindText(wchar* FindText);
  /*[id(0x00000018)]*/ int get_Version(out int pVersion);
  /*[id(0x00000019)]*/ int EncodeString(wchar* bstrValue, wchar* bstrCharSet, short bUseUTF8, out wchar* pbstrResult);
}

// ISearchAssistantOC2 Interface
interface ISearchAssistantOC2 : ISearchAssistantOC {
  mixin(uuid("72423e8f-8011-11d2-be79-00a0c9a83da2"));
  // static DWINGUID IID = { 0x72423e8f, 0x8011, 0x11d2, 0xbe, 0x79, 0x00, 0xa0, 0xc9, 0xa8, 0x3d, 0xa2 };
  /*[id(0x0000001A)]*/ int get_ShowFindPrinter(out short pbShowFindPrinter);
}

// ISearchAssistantOC3 Interface
interface ISearchAssistantOC3 : ISearchAssistantOC2 {
  mixin(uuid("72423e8f-8011-11d2-be79-00a0c9a83da3"));
  // static DWINGUID IID = { 0x72423e8f, 0x8011, 0x11d2, 0xbe, 0x79, 0x00, 0xa0, 0xc9, 0xa8, 0x3d, 0xa3 };
  /*[id(0x0000001B)]*/ int get_SearchCompanionAvailable(out short pbAvailable);
  /*[id(0x0000001C)]*/ int put_UseSearchCompanion(short pbUseSC);
  /*[id(0x0000001C)]*/ int get_UseSearchCompanion(out short pbUseSC);
}

interface _SearchAssistantEvents : IDispatch {
  mixin(uuid("1611fdda-445b-11d2-85de-00c04fa35c89"));
  // static DWINGUID IID = { 0x1611fdda, 0x445b, 0x11d2, 0x85, 0xde, 0x00, 0xc0, 0x4f, 0xa3, 0x5c, 0x89 };
  /+/*[id(0x00000001)]*/ void OnNextMenuSelect(int idItem);+/
  /+/*[id(0x00000002)]*/ void OnNewSearch();+/
}

// CoClasses

// WebBrowser Control
abstract class WebBrowser_V1 {
  mixin(uuid("eab22ac3-30c1-11cf-a7eb-0000c05bae0b"));
  // static DWINGUID CLSID = { 0xeab22ac3, 0x30c1, 0x11cf, 0xa7, 0xeb, 0x00, 0x00, 0xc0, 0x5b, 0xae, 0x0b };
  mixin Interfaces!(IWebBrowser2, IWebBrowser);
}

// WebBrowser Control
abstract class WebBrowser {
  mixin(uuid("8856f961-340a-11d0-a96b-00c04fd705a2"));
  // static DWINGUID CLSID = { 0x8856f961, 0x340a, 0x11d0, 0xa9, 0x6b, 0x00, 0xc0, 0x4f, 0xd7, 0x05, 0xa2 };
  mixin Interfaces!(IWebBrowser2, IWebBrowser);
}

// Internet Explorer Application.
abstract class InternetExplorer {
  mixin(uuid("0002df01-0000-0000-c000-000000000046"));
  // static DWINGUID CLSID = { 0x0002df01, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  mixin Interfaces!(IWebBrowser2, IWebBrowserApp);
}

// Shell Browser Window.
abstract class ShellBrowserWindow {
  mixin(uuid("c08afd90-f2a1-11d1-8455-00a0c91f3880"));
  // static DWINGUID CLSID = { 0xc08afd90, 0xf2a1, 0x11d1, 0x84, 0x55, 0x00, 0xa0, 0xc9, 0x1f, 0x38, 0x80 };
  mixin Interfaces!(IWebBrowser2, IWebBrowserApp);
}

// ShellDispatch Load in Shell Context
abstract class ShellWindows {
  mixin(uuid("9ba05972-f6a8-11cf-a442-00a0c90a8f39"));
  // static DWINGUID CLSID = { 0x9ba05972, 0xf6a8, 0x11cf, 0xa4, 0x42, 0x00, 0xa0, 0xc9, 0x0a, 0x8f, 0x39 };
  mixin Interfaces!(IShellWindows);
}

abstract class ShellUIHelper {
  mixin(uuid("64ab4bb7-111e-11d1-8f79-00c04fc2fbe1"));
  // static DWINGUID CLSID = { 0x64ab4bb7, 0x111e, 0x11d1, 0x8f, 0x79, 0x00, 0xc0, 0x4f, 0xc2, 0xfb, 0xe1 };
  mixin Interfaces!(IShellUIHelper);
}

// Internet Explorer ShellNameSpace Class
abstract class ShellNameSpace {
  mixin(uuid("55136805-b2de-11d1-b9f2-00a0c98bc547"));
  // static DWINGUID CLSID = { 0x55136805, 0xb2de, 0x11d1, 0xb9, 0xf2, 0x00, 0xa0, 0xc9, 0x8b, 0xc5, 0x47 };
  mixin Interfaces!(IShellNameSpace);
}

// Shell ShellNameSpace Class
abstract class ShellShellNameSpace {
  mixin(uuid("2f2f1f96-2bc1-4b1c-be28-ea3774f4676a"));
  // static DWINGUID CLSID = { 0x2f2f1f96, 0x2bc1, 0x4b1c, 0xbe, 0x28, 0xea, 0x37, 0x74, 0xf4, 0x67, 0x6a };
  mixin Interfaces!(IShellNameSpace);
}

abstract class CScriptErrorList {
  mixin(uuid("efd01300-160f-11d2-bb2e-00805ff7efca"));
  // static DWINGUID CLSID = { 0xefd01300, 0x160f, 0x11d2, 0xbb, 0x2e, 0x00, 0x80, 0x5f, 0xf7, 0xef, 0xca };
  mixin Interfaces!(IScriptErrorList);
}

// Internet Explorer SearchAssistantOC Class
abstract class SearchAssistantOC {
  mixin(uuid("b45ff030-4447-11d2-85de-00c04fa35c89"));
  // static DWINGUID CLSID = { 0xb45ff030, 0x4447, 0x11d2, 0x85, 0xde, 0x00, 0xc0, 0x4f, 0xa3, 0x5c, 0x89 };
  mixin Interfaces!(ISearchAssistantOC3);
}

// Shell SearchAssistantOC Class
abstract class ShellSearchAssistantOC {
  mixin(uuid("2e71fd0f-aab1-42c0-9146-6d2c4edcf07d"));
  // static DWINGUID CLSID = { 0x2e71fd0f, 0xaab1, 0x42c0, 0x91, 0x46, 0x6d, 0x2c, 0x4e, 0xdc, 0xf0, 0x7d };
  mixin Interfaces!(ISearchAssistantOC3);
}

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
