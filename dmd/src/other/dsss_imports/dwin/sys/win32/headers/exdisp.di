// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2009  (dyuyan  gmail at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: 2009

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module dwin.sys.win32.headers.exdisp;
private import tango.sys.win32.Types;

/**
    See_Also:
    http://msdn2.microsoft.com/en-us/library/aa768360.aspx
    added by yidabu
    Header Exdisp.h 
*/
enum : DWORD
{
    navOpenInNewWindow = 0x1,
    navNoHistory = 0x2,
    navNoReadFromCache = 0x4,
    navNoWriteToCache = 0x8,
    navAllowAutosearch = 0x10,
    navBrowserBar = 0x20,
    navHyperlink = 0x40,
    navEnforceRestricted = 0x80,
    navNewWindowsManaged = 0x0100,
    navUntrustedForDownload = 0x0200,
    navTrustedForActiveX = 0x0400,
    navOpenInNewTab = 0x0800,
    navOpenInBackgroundTab = 0x1000,
    navKeepWordWheelText = 0x2000
} 

/*
enum BrowserNavConstants {
	navOpenInNewWindow = 0x01,
	navNoHistory       = 0x02,
	navNoReadFromCache = 0x04,
	navNoWriteTocache  = 0x08,
	navAllowAutosearch = 0x10,
	navBrowserBar      = 0x20,
	navHyperLink       = 0x40
}
*/

/*
interface IWebBrowser : public IDispatch {
	HRESULT GoBack();
	HRESULT GoForward();
	HRESULT GoHome();
	HRESULT GoSearch();
	HRESULT Navigate(BSTR, VARIANT*, VARIANT*, VARIANT*, VARIANT*);
	HRESULT Refresh();
	HRESULT Refresh2(VARIANT*);
	HRESULT Stop();
	HRESULT get_Application(IDispatch* ppDisp);
	HRESULT get_Parent(IDispatch* ppDisp);
	HRESULT get_Container(IDispatch* ppDisp);
	HRESULT get_Document(IDispatch* ppDisp);
	HRESULT get_TopLevelContainer(VARIANT_BOOL*);
	HRESULT get_Type(BSTR*);
	HRESULT get_Left(LONG*);
	HRESULT put_Left(LONG);
	HRESULT get_Top(LONG*);
	HRESULT put_Top(LONG);
	HRESULT get_Width(LONG*);
	HRESULT put_Width(LONG);
	HRESULT get_Height(LONG*);
	HRESULT put_Height(LONG);
	HRESULT get_LocationName(BSTR*);
	HRESULT get_LocationURL(BSTR*);
	HRESULT get_Busy(VARIANT_BOOL*);
}

interface IWebBrowserApp : public IWebBrowser {
	HRESULT Quit();
	HRESULT ClientToWindow(int*, int*);
	HRESULT PutProperty(BSTR, VARIANT);
	HRESULT GetProperty(BSTR, VARIANT*);
	HRESULT get_Name(BSTR*);
	HRESULT get_HWND(LONG*);
	HRESULT get_FullName(BSTR*);
	HRESULT get_Path(BSTR*);
	HRESULT get_Visible(VARIANT_BOOL*);
	HRESULT put_Visible(VARIANT_BOOL);
	HRESULT get_StatusBar(VARIANT_BOOL*);
	HRESULT put_StatusBar(VARIANT_BOOL);
	HRESULT get_StatusText(BSTR*);
	HRESULT put_StatusText(BSTR);
	HRESULT get_ToolBar(int*);
	HRESULT put_ToolBar(int);
	HRESULT get_MenuBar(VARIANT_BOOL*);
	HRESULT put_MenuBar(VARIANT_BOOL);
	HRESULT get_FullScreen(VARIANT_BOOL*);
	HRESULT put_FullScreen(VARIANT_BOOL);
}

interface IWebBrowser2 : public IWebBrowserApp {
	HRESULT Navigate2(VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*);
	HRESULT QueryStatusWB(OLECMDID, OLECMDF*);
	HRESULT ExecWB(OLECMDID, OLECMDEXECOPT, VARIANT*, VARIANT*);
	HRESULT ShowBrowserBar(VARIANT*, VARIANT*, VARIANT*);
	HRESULT get_ReadyState(READYSTATE*);
	HRESULT get_Offline(VARIANT_BOOL*);
	HRESULT put_Offline(VARIANT_BOOL);
	HRESULT get_Silent(VARIANT_BOOL*);
	HRESULT put_Silent(VARIANT_BOOL);
	HRESULT get_RegistaerAsBrowser(VARIANT_BOOL*);
	HRESULT put_RegisterAsBrowser(VARIANT_BOOL);
	HRESULT get_RegistaerAsDropTarget(VARIANT_BOOL*);
	HRESULT put_RegisterAsDropTarget(VARIANT_BOOL);
	HRESULT get_TheaterMode(VARIANT_BOOL*);
	HRESULT put_TheaterMode(VARIANT_BOOL);
	HRESULT get_AddressBar(VARIANT_BOOL*);
	HRESULT put_AddressBar(VARIANT_BOOL);
	HRESULT get_Resizable(VARIANT_BOOL*);
	HRESULT put_Resizable(VARIANT_BOOL);
}

interface DWebBrowserEvents2 : public IDispatch {
	void StatusTextChange(BSTR);
	void ProgressChange(LONG, LONG);
	void CommandStateChange(LONG, VARIANT_BOOL);
	void DownloadBegin();
	void DownloadComplete();
	void TitleChange(BSTR);
	void PropertyChange(BSTR);
	void BeforeNavigate2(IDispatch pDisp, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT_BOOL*);
	void NewWindow2(IDispatch* ppDisp, VARIANT_BOOL*);
	void NavigateComplete(IDispatch pDisp, VARIANT*);
	void DocumentComplete(IDispatch pDisp, VARIANT*);
	void OnQuit();
	void OnVisible(VARIANT_BOOL);
	void OnToolBar(VARIANT_BOOL);
	void OnMenuBar(VARIANT_BOOL);
	void OnStatusBar(VARIANT_BOOL);
	void OnFullScreen(VARIANT_BOOL);
	void OnTheaterMode(VARIANT_BOOL);
	void WindowSetResizable(VARIANT_BOOL);
	void WindowSetLeft(LONG);
	void WindowSetTop(LONG);
	void WindowSetWidth(LONG);
	void WindowSetHeight(LONG);
	void WindowClosing(VARIANT_BOOL, VARIANT_BOOL*);
	void ClientToHostWindow(LONG*, LONG*);
	void SetSecureLockIcon(LONG);
	void FileDownload(VARIANT_BOOL*);
}
*/
version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
