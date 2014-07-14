// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2009  (dyuyan  gmail at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: May 2009

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/



module dwin.sys.win32.headers.mshtmhst;

//private import win32.basetyps, win32.objidl, win32.unknwn, win32.windef,
  //win32.winuser, win32.wtypes;
private import dwin.sys.win32.com.Core;
private import tango.sys.win32.Types;
private import dwin.sys.win32.headers.docobj; // for IOleCommandTarget
private import dwin.sys.win32.headers.oleidl;
private import dwin.sys.win32.headers.objidl;
  
enum DOCHOSTUITYPE {
        DOCHOSTUITYPE_BROWSE    = 0,
        DOCHOSTUITYPE_AUTHOR    = 1,
        BROWSE    = 0,
        AUTHOR    = 1,
}

enum DOCHOSTUIDBLCLK {
        DOCHOSTUIDBLCLK_DEFAULT         = 0,
        DOCHOSTUIDBLCLK_SHOWPROPERTIES  = 1,
        DOCHOSTUIDBLCLK_SHOWCODE        = 2,

        DEFAULT         = 0,
        SHOWPROPERTIES  = 1,
        SHOWCODE        = 2,
}

enum DOCHOSTUIFLAG {
        DOCHOSTUIFLAG_DIALOG            = 1,
        DOCHOSTUIFLAG_DISABLE_HELP_MENU = 2,
        DOCHOSTUIFLAG_NO3DBORDER        = 4,
        DOCHOSTUIFLAG_SCROLL_NO         = 8,
        DOCHOSTUIFLAG_DISABLE_SCRIPT_INACTIVE = 16,
        DOCHOSTUIFLAG_OPENNEWWIN        = 32,
        DOCHOSTUIFLAG_DISABLE_OFFSCREEN = 64,
        DOCHOSTUIFLAG_FLAT_SCROLLBAR = 128,
        DOCHOSTUIFLAG_DIV_BLOCKDEFAULT = 256,
        DOCHOSTUIFLAG_ACTIVATE_CLIENTHIT_ONLY = 512,
        DOCHOSTUIFLAG_DISABLE_COOKIE = 1024,
	// DOCHOSTUIFLAG.name versions
        DIALOG            = 1,
        DISABLE_HELP_MENU = 2,
        NO3DBORDER        = 4,
        SCROLL_NO         = 8,
        DISABLE_SCRIPT_INACTIVE = 16,
        OPENNEWWIN        = 32,
        DISABLE_OFFSCREEN = 64,
        FLAT_SCROLLBAR = 128,
        DIV_BLOCKDEFAULT = 256,
        ACTIVATE_CLIENTHIT_ONLY = 512,
        DISABLE_COOKIE = 1024,
}
/* polute the global namespace */
enum {
        DOCHOSTUITYPE_BROWSE    = 0,
        DOCHOSTUITYPE_AUTHOR    = 1,
        
        DOCHOSTUIDBLCLK_DEFAULT         = 0,
        DOCHOSTUIDBLCLK_SHOWPROPERTIES  = 1,
        DOCHOSTUIDBLCLK_SHOWCODE        = 2,

        DOCHOSTUIFLAG_DIALOG            = 1,
        DOCHOSTUIFLAG_DISABLE_HELP_MENU = 2,
        DOCHOSTUIFLAG_NO3DBORDER        = 4,
        DOCHOSTUIFLAG_SCROLL_NO         = 8,
        DOCHOSTUIFLAG_DISABLE_SCRIPT_INACTIVE = 16,
        DOCHOSTUIFLAG_OPENNEWWIN        = 32,
        DOCHOSTUIFLAG_DISABLE_OFFSCREEN = 64,
        DOCHOSTUIFLAG_FLAT_SCROLLBAR = 128,
        DOCHOSTUIFLAG_DIV_BLOCKDEFAULT = 256,
        DOCHOSTUIFLAG_ACTIVATE_CLIENTHIT_ONLY = 512,
        DOCHOSTUIFLAG_DISABLE_COOKIE = 1024,
}

struct DOCHOSTUIINFO
{
        ULONG       cbSize;
        DWORD       dwFlags;
        DWORD       dwDoubleClick;
        wchar *   pchHostCss;
        wchar *   pchHostNS;
}

interface IDocHostUIHandler : IUnknown
{
    mixin(uuid("bd3f23c0-d43e-11cf-893b-00aa00bdce1a"));    
	HRESULT ShowContextMenu(DWORD, POINT* , IUnknown, IDispatch);
	HRESULT GetHostInfo( ref DOCHOSTUIINFO pInfo );
	HRESULT ShowUI(DWORD, IOleInPlaceActiveObject, IOleCommandTarget, IOleInPlaceFrame, IOleInPlaceUIWindow);
	HRESULT HideUI();
	HRESULT UpdateUI();
	HRESULT EnableModeless(BOOL);
	HRESULT OnDocWindowActivate(BOOL);
	HRESULT OnFrameWindowActivate(BOOL);
	HRESULT ResizeBorder(RECT*, IOleInPlaceUIWindow , BOOL);
	HRESULT TranslateAccelerator(LPMSG, DWINGUID* , DWORD);
	HRESULT GetOptionKeyPath(out wchar*, DWORD);
	HRESULT GetDropTarget(IDropTarget, out IDropTarget);
	HRESULT GetExternal(out IDispatch);
	HRESULT TranslateUrl(DWORD, wchar*, out wchar*);
	HRESULT FilterDataObject(IDataObject, out IDataObject);
}

/*

[
        object,
        uuid(bd3f23c0-d43e-11cf-893b-00aa00bdce1a),
        pointer_default(unique),
        local
]
interface IDocHostUIHandler : IUnknown
{

    typedef struct _DOCHOSTUIINFO
    {
        ULONG       cbSize;
        DWORD       dwFlags;
        DWORD       dwDoubleClick;
        wchar *   pchHostCss;
        wchar *   pchHostNS;
    } DOCHOSTUIINFO;

    HRESULT ShowContextMenu(
            [in] DWORD dwID,
            [in] POINT* ppt,
            [in] IUnknown* pcmdtReserved,
            [in] IDispatch* pdispReserved);
    HRESULT GetHostInfo([in, out] DOCHOSTUIINFO * pInfo);
    HRESULT ShowUI(
            [in] DWORD dwID,
            [in] IOleInPlaceActiveObject * pActiveObject,
            [in] IOleCommandTarget * pCommandTarget,
            [in] IOleInPlaceFrame * pFrame,
            [in] IOleInPlaceUIWindow * pDoc);
    HRESULT HideUI();
    HRESULT UpdateUI();
    HRESULT EnableModeless([in] BOOL fEnable);
    HRESULT OnDocWindowActivate([in] BOOL fActivate);
    HRESULT OnFrameWindowActivate([in] BOOL fActivate);
    HRESULT ResizeBorder(
            [in] RECT* prcBorder,
            [in] IOleInPlaceUIWindow * pUIWindow,
            [in] BOOL fRameWindow);
    HRESULT TranslateAccelerator(
            [in] LPMSG lpMsg,
            [in] const DWINGUID * pguidCmdGroup,
            [in] DWORD nCmdID);
    HRESULT GetOptionKeyPath([out] wchar* * pchKey, [in] DWORD dw);
    HRESULT GetDropTarget(
            [in] IDropTarget * pDropTarget,
            [out] IDropTarget ** ppDropTarget);
    HRESULT GetExternal([out] IDispatch **ppDispatch);
    HRESULT TranslateUrl([in]DWORD dwTranslate, [in]wchar *pchURLIn, [out]wchar **ppchURLOut);
    HRESULT FilterDataObject([in]IDataObject *pDO, [out]IDataObject **ppDORet);
}





*/

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
