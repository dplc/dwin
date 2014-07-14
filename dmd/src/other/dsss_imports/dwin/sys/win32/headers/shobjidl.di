
// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2009  (dyuyan  gmail at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: May 2009

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/
module dwin.sys.win32.headers.shobjidl;

private import dwin.sys.win32.com.Core;
private import tango.sys.win32.Types;

extern(Windows):

//  File: shobjidl.idl
//
//  Contents: This interface definition contains shell objects that can be remoted
//

/*
private import "objidl.idl";
private import "oleidl.idl";
private import "oaidl.idl";
private import "shtypes.idl";
private import "servprov.idl";
private import "comcat.idl";        // for IEnumGUID
private import "propidl.idl";
private import "prsht.idl";
private import "msxml.idl";

cpp_quote("#ifndef _WINRESRC_")
cpp_quote("#ifndef _WIN32_IE")
cpp_quote("#define _WIN32_IE 0x0501")
cpp_quote("#else")
cpp_quote("#if (_WIN32_IE < 0x0400) && defined(_WIN32_WINNT) && (_WIN32_WINNT >= 0x0500)")
cpp_quote("#error _WIN32_IE setting conflicts with _WIN32_WINNT setting")
cpp_quote("#endif")
cpp_quote("#endif")
cpp_quote("#endif")

// IPersistFolder
[
    object,
    uuid(000214EA-0000-0000-C000-000000000046),  // IID_IPersistFolder
    pointer_default(unique),
]
interface IPersistFolder : IPersist
{
    // IShellFolder::BindToObject when it is initializing a shell folder object.")
    // called when the explorer is initializing a shell folder object.
    // pidl -- Specifies the absolute location of the folder
    HRESULT Initialize([in] LPCITEMIDLIST pidl);
};

typedef IPersistFolder *LPPERSISTFOLDER;

cpp_quote("#if (_WIN32_IE >= 0x0400)")

// IPersistFolder2
[
    object,
    uuid(1AC3D9F0-175C-11d1-95BE-00609797EA4F),  // IID_IPersistFolder2
    pointer_default(unique),
]
interface IPersistFolder2 : IPersistFolder
{
    HRESULT GetCurFolder([out] LPITEMIDLIST *ppidl);
};

typedef IPersistFolder2 *LPPERSISTFOLDER2;

cpp_quote("#endif")

[
    object,
    uuid(1079acfc-29bd-11d3-8e0d-00c04f6837d5),  // IID_IPersistIDList
    pointer_default(unique),
]
interface IPersistIDList : IPersist
{
    // sets or gets a fully qualifed idlist for an object
    HRESULT SetIDList([in] LPCITEMIDLIST pidl);
    HRESULT GetIDList([out] LPITEMIDLIST *ppidl);
};
    
[
    helpstring("IEnumIDList "),
    uuid(000214F2-0000-0000-C000-000000000046),
    object,
    pointer_default(unique)
]
interface IEnumIDList : IUnknown
{
    HRESULT Next(
        [in] ULONG celt,
        [out, size_is(celt), length_is(*pceltFetched)] LPITEMIDLIST *rgelt,
        [out] ULONG *pceltFetched);
        
    HRESULT Skip([in] ULONG celt);
    HRESULT Reset();
    HRESULT Clone([out] IEnumIDList **ppenum);
};

typedef IEnumIDList *LPENUMIDLIST;

// IShellFolder::GetDisplayNameOf/SetNameOf uFlags                                      
cpp_quote("typedef enum tagSHGDN")
cpp_quote("{")
cpp_quote("    SHGDN_NORMAL             = 0x0000,  // default (display purpose)")
cpp_quote("    SHGDN_INFOLDER           = 0x0001,  // displayed under a folder (relative)")
cpp_quote("    SHGDN_FOREDITING         = 0x1000,  // for in-place editing")
cpp_quote("    SHGDN_FORADDRESSBAR      = 0x4000,  // UI friendly parsing name (remove ugly stuff)")
cpp_quote("    SHGDN_FORPARSING         = 0x8000,  // parsing name for ParseDisplayName()")
cpp_quote("} SHGNO;")

typedef DWORD SHGDNF;

// IShellFolder::EnumObjects grfFlags bits
cpp_quote("typedef enum tagSHCONTF")
cpp_quote("{")
cpp_quote("    SHCONTF_FOLDERS             = 0x0020,   // only want folders enumerated (SFGAO_FOLDER)")
cpp_quote("    SHCONTF_NONFOLDERS          = 0x0040,   // include non folders")
cpp_quote("    SHCONTF_INCLUDEHIDDEN       = 0x0080,   // show items normally hidden")
cpp_quote("    SHCONTF_INIT_ON_FIRST_NEXT  = 0x0100,   // allow EnumObject() to return before validating enum")
cpp_quote("    SHCONTF_NETPRINTERSRCH      = 0x0200,   // hint that client is looking for printers")
cpp_quote("    SHCONTF_SHAREABLE           = 0x0400,   // hint that client is looking sharable resources (remote shares)")
cpp_quote("    SHCONTF_STORAGE             = 0x0800,   // include all items with accessible storage and their ancestors")
cpp_quote("};")
typedef DWORD SHCONTF;

// IShellFolder::CompareIDs lParam flags
//
//  SHCIDS_ALLFIELDS is a mask for lParam indicating that the shell folder
//  should first compare on the lParam column, and if that proves equal,
//  then perform a full comparison on all fields.  This flag is supported
//  if the IShellFolder supports IShellFolder2.
//
//  SHCIDS_CANONICALONLY is a mask for lParam indicating that the shell folder
//  that the caller doesn't care about proper sort order -- only equality matters.
//  (Most CompareIDs test for equality first, and in the case of inequality do
//  a UI sort.  This bit allows for a more efficient sort in the inequality case.)
//
//

cpp_quote("#define SHCIDS_ALLFIELDS        0x80000000L")
cpp_quote("#define SHCIDS_CANONICALONLY    0x10000000L")
cpp_quote("#define SHCIDS_BITMASK          0xFFFF0000L")
cpp_quote("#define SHCIDS_COLUMNMASK       0x0000FFFFL")

// IShellFolder::GetAttributesOf flags
// SFGAO_CANLINK: If this bit is set on an item in the shell folder, a
//            'Create Shortcut' menu item will be added to the File
//            menu and context menus for the item.  If the user selects
//            that command, your IContextMenu::InvokeCommand() will be called
//            with 'link'.
//                 That flag will also be used to determine if 'Create Shortcut'
//            should be added when the item in your folder is dragged to another
//            folder.
cpp_quote("#define SFGAO_CANCOPY           DROPEFFECT_COPY // Objects can be copied    (0x1)")
cpp_quote("#define SFGAO_CANMOVE           DROPEFFECT_MOVE // Objects can be moved     (0x2)")
cpp_quote("#define SFGAO_CANLINK           DROPEFFECT_LINK // Objects can be linked    (0x4)")
cpp_quote("#define SFGAO_STORAGE           0x00000008L     // supports BindToObject(IID_IStorage)")
cpp_quote("#define SFGAO_CANRENAME         0x00000010L     // Objects can be renamed")
cpp_quote("#define SFGAO_CANDELETE         0x00000020L     // Objects can be deleted")
cpp_quote("#define SFGAO_HASPROPSHEET      0x00000040L     // Objects have property sheets")
//         unused                          0x00000080
cpp_quote("#define SFGAO_DROPTARGET        0x00000100L     // Objects are drop target")
cpp_quote("#define SFGAO_CAPABILITYMASK    0x00000177L")
//         unused                          0x00000200
//         unused                          0x00000400
//         unused                          0x00000800
//         unused                          0x00001000
cpp_quote("#define SFGAO_ENCRYPTED         0x00002000L     // object is encrypted (use alt color)")
cpp_quote("#define SFGAO_ISSLOW            0x00004000L     // 'slow' object")
cpp_quote("#define SFGAO_GHOSTED           0x00008000L     // ghosted icon")
cpp_quote("#define SFGAO_LINK              0x00010000L     // Shortcut (link)")
cpp_quote("#define SFGAO_SHARE             0x00020000L     // shared")
cpp_quote("#define SFGAO_READONLY          0x00040000L     // read-only")
cpp_quote("#define SFGAO_HIDDEN            0x00080000L     // hidden object")
cpp_quote("#define SFGAO_DISPLAYATTRMASK   0x000FC000L")
cpp_quote("#define SFGAO_FILESYSANCESTOR   0x10000000L     // may contain children with SFGAO_FILESYSTEM")
cpp_quote("#define SFGAO_FOLDER            0x20000000L     // support BindToObject(IID_IShellFolder)")
cpp_quote("#define SFGAO_FILESYSTEM        0x40000000L     // is a win32 file system object (file/folder/root)")
cpp_quote("#define SFGAO_HASSUBFOLDER      0x80000000L     // may contain children with SFGAO_FOLDER")
cpp_quote("#define SFGAO_CONTENTSMASK      0x80000000L")
cpp_quote("#define SFGAO_VALIDATE          0x01000000L     // invalidate cached information")
cpp_quote("#define SFGAO_REMOVABLE         0x02000000L     // is this removeable media?")
cpp_quote("#define SFGAO_COMPRESSED        0x04000000L     // Object is compressed (use alt color)")
cpp_quote("#define SFGAO_BROWSABLE         0x08000000L     // supports IShellFolder, but only implements CreateViewObject() (non-folder view)")
cpp_quote("#define SFGAO_NONENUMERATED     0x00100000L     // is a non-enumerated object")
cpp_quote("#define SFGAO_NEWCONTENT        0x00200000L     // should show bold in explorer tree")
cpp_quote("#define SFGAO_CANMONIKER        0x00400000L     // defunct")
cpp_quote("#define SFGAO_HASSTORAGE        0x00400000L     // defunct")
cpp_quote("#define SFGAO_STREAM            0x00400000L     // supports BindToObject(IID_IStream)")
cpp_quote("#define SFGAO_STORAGEANCESTOR   0x00800000L     // may contain children with SFGAO_STORAGE or SFGAO_STREAM")
cpp_quote("#define SFGAO_STORAGECAPMASK    0x70C50008L     // for determining storage capabilities, ie for open/save semantics")

typedef ULONG SFGAOF;

//      passed to ISF::ParseDisplayName() or ISF::BindToObject() via IBindCtx::RegisterObjectParam()
// * IPersist must be supported by the ObjectParam
// the CLSID returned by IPersist::GetCLSID() should be skipped
// in the binding process. used to avoid loops or to allow delegation to
// base name space functionality. see SHSkipJunction()
cpp_quote("#define STR_SKIP_BINDING_CLSID      L\"Skip Binding CLSID\"")

//      passed to SHGetDesktopFolder()->ParseDisplayName() via IBindCtx::RegisterObjectParam()
// * no interface support required on object param
// instructing to prefer folder support for URLs.  specifically used by the common
// dialog to make it use the DAV NP when parsing http: URLs.
cpp_quote("#define STR_PARSE_PREFER_FOLDER_BROWSING     L\"Parse Prefer Folder Browsing\"")

//      passed to SHGetDesktopFolder()->ParseDisplayName() via IBindCtx::RegisterObjectParam()
// instructing to fail parsing relative paths.  only succeeds for fully qualified paths/urls.
// * no interface support required on object param
// 
//      eg. even if "foo.txt" is a child of the desktop, it will still fail
//  but it will succeed for "C:\Documents and Settings\Username\Desktop\foo.txt"
cpp_quote("#define STR_DONT_PARSE_RELATIVE              L\"Don't Parse Relative\"")

//      passed to SHGetDesktopFolder()->ParseDisplayName() via IBindCtx::RegisterObjectParam()
// to try translate from a full file system pidl to a alias to that pidl, if available.  
// * no interface support required on object param
//
//      eg.  if you pass the following path "C:\Documents and Settings\Username\Desktop\foo.txt"
// if TRANSLATE is SET result is: [foo.txt] (the alias for the desktop being an empty pidl) 
// if TRANSLATE is NOT SET result is: [CLSID_MyComputer][c:\][Documents and Settings][Username][Desktop][foo.txt].
cpp_quote("#define STR_PARSE_TRANSLATE_ALIASES          L\"Parse Translate Aliases\"")

//      passed to SHGetDesktopFolder()->ParseDisplayName() via IBindCtx::RegisterObjectParam()
// * no interface support required on object param
// instructing to allow shell: parsing to non-SFGAO_FOLDER objects.
// Safe to set this for strings an end-user types, but do not set this in any binding
// path where untrusted callers control the contents of the string
cpp_quote("#define STR_PARSE_SHELL_PROTOCOL_TO_FILE_OBJECTS     L\"Parse Shell Protocol To File Objects\"")


interface IShellFolder;
[
    helpstring("IShellFolder"),
    uuid(000214E6-0000-0000-C000-000000000046),
    object,
    pointer_default(unique)
]

interface IShellFolder : IUnknown
{
    HRESULT ParseDisplayName(
        [in] HWND hwnd, 
        [in] LPBC pbc, 
        [in, string] LPOLESTR pszDisplayName,
        [out] ULONG *pchEaten, 
        [out] LPITEMIDLIST *ppidl, 
        [in, out, unique] ULONG *pdwAttributes);

    HRESULT EnumObjects(
        [in] HWND hwnd, 
        [in] SHCONTF grfFlags, 
        [out] IEnumIDList **ppenumIDList);

    //  returns an instance of a sub-folder which is specified by the IDList (pidl).
    HRESULT BindToObject(
        [in] LPCITEMIDLIST pidl, 
        [in] LPBC pbc, 
        [in] REFIID riid, 
        [out, iid_is(riid)] void **ppv);
        
    HRESULT BindToStorage(
        [in] LPCITEMIDLIST pidl, 
        [in] LPBC pbc, 
        [in] REFIID riid, 
        [out, iid_is(riid)] void **ppv);
        
    //  compares two IDLists and returns the result. The shell
    //  explorer always passes 0 as lParam, which indicates 'sort by name'.
    //  It should return 0 (as CODE of the scode), if two id indicates the
    //  same object; negative value if pidl1 should be placed before pidl2;
    //  positive value if pidl2 should be placed before pidl1.
    HRESULT CompareIDs(
        [in] LPARAM lParam, 
        [in] LPCITEMIDLIST pidl1, 
        [in] LPCITEMIDLIST pidl2);
    
    //  creates a view object of the folder itself. The view
    //  object is a difference instance from the shell folder object.
    //   'hwndOwner' can be used  as the owner window of its dialog box or
    //  menu during the lifetime of the view object.
    //  This member function should always create a new
    //  instance which has only one reference count. The explorer may create
    //  more than one instances of view object from one shell folder object
    //  and treat them as separate instances.
    HRESULT CreateViewObject(
        [in] HWND hwndOwner, 
        [in] REFIID riid, 
        [out, iid_is(riid)] void **ppv);

    //  returns the attributes of specified objects in that
    //  folder. 'cidl' and 'apidl' specifies objects. 'apidl' contains only
    //  simple IDLists. The explorer initializes *prgfInOut with a set of
    //  flags to be evaluated. The shell folder may optimize the operation
    //  by not returning unspecified flags.
    HRESULT GetAttributesOf(
        [in] UINT cidl, 
        [in, size_is(cidl)] LPCITEMIDLIST * apidl, 
        [in, out] SFGAOF * rgfInOut);

    //  creates a UI object to be used for specified objects.
    //  The shell explorer passes either IID_IDataObject (for transfer operation)
    //  or IID_IContextMenu (for context menu operation) as riid.
    HRESULT GetUIObjectOf(
        [in] HWND hwndOwner, 
        [in] UINT cidl, 
        [in, size_is(cidl)] LPCITEMIDLIST * apidl,
        [in] REFIID riid, 
        [in, out, unique] UINT * rgfReserved,
        [out, iid_is(riid)] void **ppv);

    //  returns the display name of the specified object.
    //  If the ID contains the display name (in the locale character set),
    //  it returns the offset to the name. Otherwise, it returns a pointer
    //  to the display name string (UNICODE), which is allocated by the
    //  task allocator, or fills in a buffer.
    HRESULT GetDisplayNameOf(
        [in] LPCITEMIDLIST pidl, 
        [in] SHGDNF uFlags, 
        [out] STRRET *pName);

    //  sets the display name of the specified object.
    //  If it changes the ID as well, it returns the new ID which is
    //  alocated by the task allocator.
    HRESULT SetNameOf(
        [in] HWND hwnd, 
        [in] LPCITEMIDLIST pidl, 
        [in, string] LPCOLESTR pszName, 
        [in] SHGDNF uFlags, 
        [out] LPITEMIDLIST *ppidlOut);
};

typedef IShellFolder * LPSHELLFOLDER;


cpp_quote("#if (_WIN32_IE >= 0x0500)")

typedef struct tagEXTRASEARCH
{
    GUID    guidSearch;
    WCHAR   wszFriendlyName[80];
    WCHAR   wszUrl[2084];
}EXTRASEARCH, *LPEXTRASEARCH;

typedef struct IEnumExtraSearch *LPENUMEXTRASEARCH;

interface IShellFolder2;    // forward

[
    helpstring("IEnumExtraSearch"),
    uuid(0E700BE1-9DB6-11d1-A1CE-00C04FD75D13),
    object,
    pointer_default(unique)
]
interface IEnumExtraSearch : IUnknown
{
    HRESULT Next(
        [in] ULONG celt,
        [out, size_is(celt), length_is(*pceltFetched)] EXTRASEARCH *rgelt,
        [out] ULONG *pceltFetched);

    HRESULT Skip([in] ULONG celt);
    HRESULT Reset();
    HRESULT Clone([out] IEnumExtraSearch **ppenum);
};

// IShellFolder2::GetDefaultColumnState values

typedef [v1_enum] enum {
    SHCOLSTATE_TYPE_STR      = 0x00000001,
    SHCOLSTATE_TYPE_INT      = 0x00000002,
    SHCOLSTATE_TYPE_DATE     = 0x00000003,
    SHCOLSTATE_TYPEMASK      = 0x0000000F,
    SHCOLSTATE_ONBYDEFAULT   = 0x00000010,   // should on by default in details view
    SHCOLSTATE_SLOW          = 0x00000020,   // will be slow to compute, do on a background thread
    SHCOLSTATE_EXTENDED      = 0x00000040,   // provided by a handler, not the folder
    SHCOLSTATE_SECONDARYUI   = 0x00000080,   // not displayed in context menu, but listed in the "More..." dialog
    SHCOLSTATE_HIDDEN        = 0x00000100,   // not displayed in the UI
    SHCOLSTATE_PREFER_VARCMP = 0x00000200,   // VarCmp() (with folderness test) produces same result as CompareIDs()
} SHCOLSTATE;

typedef DWORD SHCOLSTATEF; 

typedef struct {
    GUID fmtid;
    DWORD pid;
} SHCOLUMNID, *LPSHCOLUMNID;
typedef const SHCOLUMNID* LPCSHCOLUMNID;

[
    helpstring("IShellFolder2"),
    uuid(93F2F68C-1D1B-11d3-A30E-00C04F79ABD1),
    object,
    pointer_default(unique)
]
interface IShellFolder2 : IShellFolder
{
    // Returns the guid of the search that is to be invoked when user clicks 
    // on the search toolbar button
    HRESULT GetDefaultSearchGUID([out] GUID *pguid);
    // gives an enumerator of the searches to be added to the search menu
    HRESULT EnumSearches([out] IEnumExtraSearch **ppenum);
    HRESULT GetDefaultColumn([in] DWORD dwRes, [out] ULONG *pSort, [out] ULONG *pDisplay);
    // return SHCOLSTATE_ values
    HRESULT GetDefaultColumnState([in] UINT iColumn, [out] SHCOLSTATEF *pcsFlags);
    HRESULT GetDetailsEx([in] LPCITEMIDLIST pidl, [in] const SHCOLUMNID *pscid, [out] VARIANT *pv);
    HRESULT GetDetailsOf([in] LPCITEMIDLIST pidl, [in]UINT iColumn, [out] SHELLDETAILS *psd);
    HRESULT MapColumnToSCID([in] UINT iColumn, [in] SHCOLUMNID *pscid);
};

cpp_quote("#endif // _WIN32_IE >= 0x0500)")



//--------------------------------------------------------------------------
//
// FOLDERSETTINGS
//
//  FOLDERSETTINGS is a data structure that explorer passes from one folder
// view to another, when the user is browsing. It calls ISV::GetCurrentInfo
// member to get the current settings and pass it to ISV::CreateViewWindow
// to allow the next folder view 'inherit' it. These settings assumes a
// particular UI (which the shell's folder view has), and shell extensions
// may or may not use those settings.
//
//--------------------------------------------------------------------------
typedef char * LPVIEWSETTINGS;

// NB Bitfields.
// FWF_DESKTOP implies FWF_TRANSPARENT/NOCLIENTEDGE/NOSCROLL

typedef [v1_enum] enum
    {
    FWF_AUTOARRANGE =       0x00000001,
    FWF_ABBREVIATEDNAMES =  0x00000002,
    FWF_SNAPTOGRID =        0x00000004,
    FWF_OWNERDATA =         0x00000008,
    FWF_BESTFITWINDOW =     0x00000010,
    FWF_DESKTOP =           0x00000020,
    FWF_SINGLESEL =         0x00000040,
    FWF_NOSUBFOLDERS =      0x00000080,
    FWF_TRANSPARENT  =      0x00000100,
    FWF_NOCLIENTEDGE =      0x00000200,
    FWF_NOSCROLL     =      0x00000400,
    FWF_ALIGNLEFT    =      0x00000800,
    FWF_NOICONS      =      0x00001000,
    FWF_SHOWSELALWAYS =     0x00002000,
    FWF_NOVISIBLE    =      0X00004000,
    FWF_SINGLECLICKACTIVATE=0x00008000,     // TEMPORARY -- NO UI FOR THIS
    FWF_NOWEBVIEW =         0x00010000,
    FWF_HIDEFILENAMES =     0x00020000,
    FWF_CHECKSELECT =       0x00040000,
    } FOLDERFLAGS;

typedef [v1_enum] enum
    {
    FVM_FIRST =             1,
    FVM_ICON =              1,
    FVM_SMALLICON =         2,
    FVM_LIST =              3,
    FVM_DETAILS =           4,
    FVM_THUMBNAIL =         5,
    FVM_TILE =              6,
    FVM_THUMBSTRIP =        7,
    FVM_LAST =              7,
    } FOLDERVIEWMODE;

typedef struct
    {
    UINT ViewMode;       // View mode (FOLDERVIEWMODE values)
    UINT fFlags;         // View options (FOLDERFLAGS bits)
    } FOLDERSETTINGS;

typedef FOLDERSETTINGS *LPFOLDERSETTINGS;                
typedef const FOLDERSETTINGS * LPCFOLDERSETTINGS;
typedef FOLDERSETTINGS *PFOLDERSETTINGS;                

//==========================================================================
//
// Interface:   IShellView
//
// IShellView::GetWindow(phwnd)
//
//   Inherited from IOleWindow::GetWindow.
//
//
// IShellView::ContextSensitiveHelp(fEnterMode)
//
//   Inherited from IOleWindow::ContextSensitiveHelp.
//
//
// IShellView::TranslateAccelerator(lpmsg)
//
//   Similar to IOleInPlaceActiveObject::TranlateAccelerator. The explorer
//  calls this function BEFORE any other translation. Returning S_OK
//  indicates that the message was translated (eaten) and should not be
//  translated or dispatched by the explorer.
//
//
// IShellView::EnableModeless(fEnable)
//   Similar to IOleInPlaceActiveObject::EnableModeless.
//
//
// IShellView::UIActivate(uState)
//
//   The explorer calls this member function whenever the activation
//  state of the view window is changed by a certain event that is
//  NOT caused by the shell view itself.
//
//   SVUIA_DEACTIVATE will be passed when the explorer is about to
//  destroy the shell view window; the shell view is supposed to remove
//  all the extended UIs (typically merged menu and modeless popup windows).
//
//   SVUIA_ACTIVATE_NOFOCUS will be passsed when the shell view is losing
//  the input focus or the shell view has been just created without the
//  input focus; the shell view is supposed to set menuitems appropriate
//  for non-focused state (no selection specific items should be added).
//
//   SVUIA_ACTIVATE_FOCUS will be passed when the explorer has just
//  created the view window with the input focus; the shell view is
//  supposed to set menuitems appropriate for focused state.
//
//   SVUIA_INPLACEACTIVATE(new) will be passed when the shell view is opened
//  within an ActiveX control, which is not a UI active. In this case,
//  the shell view should not merge menus or put toolbas. To be compatible
//  with Win95 client, we don't pass this value unless the view supports
//  IShellView2.
//
//   The shell view should not change focus within this member function.
//  The shell view should not hook the WM_KILLFOCUS message to remerge
//  menuitems. However, the shell view typically hook the WM_SETFOCUS
//  message, and re-merge the menu after calling IShellBrowser::
//  OnViewWindowActivated.
//
//   One of the ACTIVATE / INPLACEACTIVATE messages will be sent when
//  the view window becomes the currently displayed view.  On Win95 systems,
//  this will happen immediately after the CreateViewWindow call.  On IE4, Win98,
//  and NT5 systems this may happen when the view reports it is ready (if the
//  IShellView supports async creation).  This can be used as a hint as to when
//  to make your view window visible.  Note: the Win95/Win98/NT4 common dialogs
//  do not send either of these on creation.
//
//
// IShellView::Refresh()
//
//   The explorer calls this member when the view needs to refresh its
//  contents (such as when the user hits F5 key).
//
//
// IShellView::CreateViewWindow
//
//   This member creates the view window (right-pane of the explorer or the
//  client window of the folder window).
//
//
// IShellView::DestroyViewWindow
//
//   This member destroys the view window.
//
//
// IShellView::GetCurrentInfo
//
//   This member returns the folder settings.
//
//
// IShellView::AddPropertySHeetPages
//
//   The explorer calls this member when it is opening the option property
//  sheet. This allows the view to add additional pages to it.
//
//
// IShellView::SaveViewState()
//
//   The explorer calls this member when the shell view is supposed to
//  store its view settings. The shell view is supposed to get a view
//  stream by calling IShellBrowser::GetViewStateStream and store the
//  current view state into that stream.
//
//
// IShellView::SelectItem(pidlItem, uFlags)
//
//   The explorer calls this member to change the selection state of
//  item(s) within the shell view window.  If pidlItem is NULL and uFlags
//  is SVSI_DESELECTOTHERS, all items should be deselected.
//
//-------------------------------------------------------------------------

//
// shellview select item flags
//
cpp_quote("#define SVSI_DESELECT       0x00000000")
cpp_quote("#define SVSI_SELECT         0x00000001")
cpp_quote("#define SVSI_EDIT           0x00000003  // includes select")
cpp_quote("#define SVSI_DESELECTOTHERS 0x00000004")
cpp_quote("#define SVSI_ENSUREVISIBLE  0x00000008")
cpp_quote("#define SVSI_FOCUSED        0x00000010")
cpp_quote("#define SVSI_TRANSLATEPT    0x00000020")
cpp_quote("#define SVSI_SELECTIONMARK  0x00000040")
cpp_quote("#define SVSI_POSITIONITEM   0x00000080")
cpp_quote("#define SVSI_CHECK          0x00000100")
cpp_quote("#define SVSI_NOSTATECHANGE  0x80000000")
typedef UINT SVSIF;

//
// shellview get item object flags
//
typedef [v1_enum] enum {
    SVGIO_BACKGROUND        = 0x00000000,
    SVGIO_SELECTION         = 0x00000001,
    SVGIO_ALLVIEW           = 0x00000002,
    SVGIO_CHECKED           = 0x00000003,
    SVGIO_TYPE_MASK         = 0x0000000F,
    SVGIO_FLAG_VIEWORDER    = 0x80000000,
} SVGIO;

//
// uState values for IShellView::UIActivate
//
typedef [v1_enum] enum {
    SVUIA_DEACTIVATE       = 0,
    SVUIA_ACTIVATE_NOFOCUS = 1,
    SVUIA_ACTIVATE_FOCUS   = 2,
    SVUIA_INPLACEACTIVATE  = 3          // new flag for IShellView2
} SVUIA_STATUS;

//  this is to handle name collisions 
cpp_quote("#ifdef _FIX_ENABLEMODELESS_CONFLICT")
cpp_quote("#define    EnableModeless EnableModelessSV")
cpp_quote("#endif")

//
//  this is so that all the implementations still get the function pointer.
//  and midl wont complain about the data type
//
cpp_quote("#ifdef _NEVER_")
typedef LPARAM LPFNSVADDPROPSHEETPAGE;
cpp_quote("#else //!_NEVER_")
cpp_quote("#include <prsht.h>")
cpp_quote("typedef LPFNADDPROPSHEETPAGE LPFNSVADDPROPSHEETPAGE;")
cpp_quote("#endif //_NEVER_")

interface IShellBrowser;

[
    helpstring("IShellView"),
    uuid(000214E3-0000-0000-C000-000000000046),
    object,
    pointer_default(unique)
]
interface IShellView : IOleWindow
{
    HRESULT TranslateAccelerator([in] MSG *pmsg);
    HRESULT EnableModeless([in] BOOL fEnable);
    HRESULT UIActivate([in] UINT uState);
    HRESULT Refresh();
    HRESULT CreateViewWindow(
        [in] IShellView *psvPrevious,
        [in] LPCFOLDERSETTINGS pfs, 
        [in] IShellBrowser *psb,
        [out] RECT *prcView, 
        [out] HWND *phWnd);
        
    HRESULT DestroyViewWindow();
    
    HRESULT GetCurrentInfo([out] LPFOLDERSETTINGS pfs);

    [local] HRESULT AddPropertySheetPages(
        [in] DWORD dwReserved,
        [in] LPFNSVADDPROPSHEETPAGE pfn, 
        [in] LPARAM lparam);

    HRESULT SaveViewState();
    
    HRESULT SelectItem(
        [in] LPCITEMIDLIST pidlItem, 
        [in] SVSIF uFlags);
        
    HRESULT GetItemObject(
        [in] UINT uItem, 
        [in] REFIID riid,
        [out, iid_is(riid)] void **ppv);

typedef IShellView *LPSHELLVIEW;
};

[
    helpstring("IShellView2"),
    uuid(88E39E80-3578-11CF-AE69-08002B2E1262),
    object,
    pointer_default(unique)
]
interface IShellView2 :  IShellView
{
typedef GUID SHELLVIEWID;

cpp_quote("#define SV2GV_CURRENTVIEW ((UINT)-1)")
cpp_quote("#define SV2GV_DEFAULTVIEW ((UINT)-2)")
//
//  NOTE if the cbSize param is ever updated,")
//  then there will have to be custom [wire_marshal]")
//  implementation to support it")
//
cpp_quote("#include <pshpack8.h>")
typedef struct _SV2CVW2_PARAMS
{
    DWORD cbSize;

    IShellView *psvPrev;
    LPCFOLDERSETTINGS pfs;
    IShellBrowser *psbOwner;
    RECT *prcView;
    SHELLVIEWID const *pvid;
    HWND hwndView;
} SV2CVW2_PARAMS, *LPSV2CVW2_PARAMS;
cpp_quote("#include <poppack.h>")   // Return to byte packing

    HRESULT GetView(
        [in, out] SHELLVIEWID* pvid, 
        [in] ULONG uView);
        
    HRESULT CreateViewWindow2(
        [in] LPSV2CVW2_PARAMS lpParams);
        
    HRESULT HandleRename(
        [in] LPCITEMIDLIST pidlNew);
        
    HRESULT SelectAndPositionItem(
        [in] LPCITEMIDLIST pidlItem,
        [in] UINT uFlags,
        [in] POINT *ppt);
};


[
    helpstring("IFolderView"),
    uuid(cde725b0-ccc9-4519-917e-325d72fab4ce),
    object,
    pointer_default(unique)
]
interface IFolderView : IUnknown
{
    HRESULT GetCurrentViewMode([in, out] UINT *pViewMode);
    HRESULT SetCurrentViewMode([in] UINT ViewMode);

    HRESULT GetFolder([in] REFIID riid, [out, iid_is(riid)] void **ppv);

    HRESULT Item([in] int iItemIndex, [out] LPITEMIDLIST *ppidl);

    HRESULT ItemCount([in] UINT uFlags,[out] int *pcItems);
    HRESULT Items([in] UINT uFlags,[in] REFIID riid, [out, iid_is(riid)] void **ppv);

    HRESULT GetSelectionMarkedItem([out] int *piItem);
    HRESULT GetFocusedItem([out] int *piItem);

    HRESULT GetItemPosition([in] LPCITEMIDLIST pidl, [out] POINT* ppt);
    HRESULT GetSpacing([in, out, ptr] POINT* ppt);
    HRESULT GetDefaultSpacing([out] POINT* ppt);
    HRESULT GetAutoArrange();

    // like IShellView::SelectItem() by index
    HRESULT SelectItem([in] int iItem, [in] DWORD dwFlags);
    HRESULT SelectAndPositionItems([in] UINT cidl, [in, size_is(cidl)] LPCITEMIDLIST* apidl, [in, ptr, size_is(cidl)] POINT* apt, [in] DWORD dwFlags);
};

cpp_quote("#define SID_SFolderView IID_IFolderView    // folder view, usuaally IFolderView")


//  this is to handle name collisions 
cpp_quote("#ifdef _FIX_ENABLEMODELESS_CONFLICT")
cpp_quote("#undef    EnableModeless ")
cpp_quote("#endif")


[
    helpstring("IFolderFilterSite"),
    uuid(C0A651F5-B48B-11d2-B5ED-006097C686F6), // IID_IFolderFilterSite
    object,
    pointer_default(unique)
]
interface IFolderFilterSite : IUnknown
{
    HRESULT SetFilter([in]IUnknown* punk);
};


[
    helpstring("IFolderFilter"),
    uuid(9CC22886-DC8E-11d2-B1D0-00C04F8EEB3E), // IID_IFolderFilter
    object,
    pointer_default(unique)
]
interface IFolderFilter : IUnknown
{
    HRESULT ShouldShow([in] IShellFolder* psf, [in] LPCITEMIDLIST pidlFolder, [in] LPCITEMIDLIST pidlItem);
    HRESULT GetEnumFlags([in] IShellFolder* psf, [in] LPCITEMIDLIST pidlFolder, [in] HWND *phwnd, [out] DWORD *pgrfFlags);
};


//--------------------------------------------------------------------------
//
// Interface:   IShellBrowser
//
//  IShellBrowser interface is the interface that is provided by the shell
// explorer/folder frame window. When it creates the 'contents pane' of
// a shell folder (which provides IShellFolder interface), it calls its
// CreateViewObject member function to create an IShellView object. Then,
// it calls its CreateViewWindow member to create the 'contents pane'
// window. The pointer to the IShellBrowser interface is passed to
// the IShellView object as a parameter to this CreateViewWindow member
// function call.
//
//    +--------------------------+  <-- Explorer window
//    | [] Explorer              |
//    |--------------------------+       IShellBrowser
//    | File Edit View ..        |
//    |--------------------------|
//    |        |                 |
//    |        |              <-------- Content pane
//    |        |                 |
//    |        |                 |       IShellView
//    |        |                 |
//    |        |                 |
//    +--------------------------+
//
//
//
// [Member functions]
//
//
// IShellBrowser::GetWindow(phwnd)
//
//   Inherited from IOleWindow::GetWindow.
//
//
// IShellBrowser::ContextSensitiveHelp(fEnterMode)
//
//   Inherited from IOleWindow::ContextSensitiveHelp.
//
//
// IShellBrowser::InsertMenusSB(hmenuShared, lpMenuWidths)
//
//   Similar to the IOleInPlaceFrame::InsertMenus. The explorer will put
//  'File' and 'Edit' pulldown in the File menu group, 'View' and 'Tools'
//  in the Container menu group and 'Help' in the Window menu group. Each
//  pulldown menu will have a uniqu ID, FCIDM_MENU_FILE/EDIT/VIEW/TOOLS/HELP
//  The view is allowed to insert menuitems into those sub-menus by those
//  IDs must be between FCIDM_SHVIEWFIRST and FCIDM_SHVIEWLAST.
//
//
// IShellBrowser::SetMenuSB(hmenuShared, holemenu, hwndActiveObject)
//
//   Similar to the IOleInPlaceFrame::SetMenu. The explorer ignores the
//  holemenu parameter (reserved for future enhancement)  and performs
//  menu-dispatch based on the menuitem IDs (see the description above).
//  It is important to note that the explorer will add different
//  set of menuitems depending on whether the view has a focus or not.
//  Therefore, it is very important to call ISB::OnViewWindowActivate
//  whenever the view window (or its children) gets the focus.
//
//
// IShellBrowser::RemoveMenusSB(hmenuShared)
//
//   Same as the IOleInPlaceFrame::RemoveMenus.
//
//
// IShellBrowser::SetStatusTextSB(pszStatusText)
//
//   Same as the IOleInPlaceFrame::SetStatusText. It is also possible to
//  send messages directly to the status window via SendControlMsg.
//
//
// IShellBrowser::EnableModelessSB(fEnable)
//
//   Same as the IOleInPlaceFrame::EnableModeless.
//
//
// IShellBrowser::TranslateAcceleratorSB(lpmsg, wID)
//
//   Same as the IOleInPlaceFrame::TranslateAccelerator, but will be
//  never called because we don't support EXEs (i.e., the explorer has
//  the message loop). This member function is defined here for possible
//  future enhancement.
//
//
// IShellBrowser::BrowseObject(pidl, wFlags)")
//
//   The view calls this member to let shell explorer browse to another")
//  folder. The pidl and wFlags specifies the folder to be browsed.")
//
//  Following three flags specifies whether it creates another window or not.
//   SBSP_SAMEBROWSER  -- Browse to another folder with the same window.
//   SBSP_NEWBROWSER   -- Creates another window for the specified folder.
//   SBSP_DEFBROWSER   -- Default behavior (respects the view option).
//
//  Following three flags specifies open, explore, or default mode. These   .
//  are ignored if SBSP_SAMEBROWSER or (SBSP_DEFBROWSER && (single window   .
//  browser || explorer)).                                                  .
//   SBSP_OPENMODE     -- Use a normal folder window
//   SBSP_EXPLOREMODE  -- Use an explorer window
//   SBSP_DEFMODE      -- Use the same as the current window
//
//  Following three flags specifies the pidl.
//   SBSP_ABSOLUTE -- pidl is an absolute pidl (relative from desktop)
//   SBSP_RELATIVE -- pidl is relative from the current folder.
//   SBSP_PARENT   -- Browse the parent folder (ignores the pidl)
//   SBSP_NAVIGATEBACK    -- Navigate back (ignores the pidl)
//   SBSP_NAVIGATEFORWARD -- Navigate forward (ignores the pidl)
//
//  Following two flags control history manipulation as result of navigate
//   SBSP_WRITENOHISTORY -- write no history (shell folder) entry
//   SBSP_NOAUTOSELECT -- suppress selection in history pane
//
// IShellBrowser::GetViewStateStream(grfMode, ppstm)
//
//   The browser returns an IStream interface as the storage for view
//  specific state information.
//
//   grfMode -- Specifies the read/write access (STGM_READ/WRITE/READWRITE)
//   ppstm   -- Specifies the IStream *variable to be filled.
//
//
// IShellBrowser::GetControlWindow(id, phwnd)
//
//   The shell view may call this member function to get the window handle
//  of Explorer controls (toolbar or status winodw -- FCW_TOOLBAR or
//  FCW_STATUS).
//
//
// IShellBrowser::SendControlMsg(id, uMsg, wParam, lParam, pret)
//
//   The shell view calls this member function to send control messages to
//  one of Explorer controls (toolbar or status window -- FCW_TOOLBAR or
//  FCW_STATUS).
//
//
// IShellBrowser::QueryActiveShellView(IShellView * ppshv)
//
//   This member returns currently activated (displayed) shellview object.
//  A shellview never need to call this member function.
//
//
// IShellBrowser::OnViewWindowActive(pshv)
//
//   The shell view window calls this member function when the view window
//  (or one of its children) got the focus. It MUST call this member before
//  calling IShellBrowser::InsertMenus, because it will insert different
//  set of menu items depending on whether the view has the focus or not.
//
//
// IShellBrowser::SetToolbarItems(lpButtons, nButtons, uFlags)
//
//   The view calls this function to add toolbar items to the exporer's
//  toolbar. 'lpButtons' and 'nButtons' specifies the array of toolbar
//  items. 'uFlags' must be one of FCT_MERGE, FCT_CONFIGABLE, FCT_ADDTOEND.
//
//-------------------------------------------------------------------------

//
// Values for wFlags parameter of ISB::BrowseObject() member.
//
cpp_quote("#define SBSP_DEFBROWSER         0x0000")
cpp_quote("#define SBSP_SAMEBROWSER        0x0001")
cpp_quote("#define SBSP_NEWBROWSER         0x0002")

cpp_quote("#define SBSP_DEFMODE            0x0000")
cpp_quote("#define SBSP_OPENMODE           0x0010")
cpp_quote("#define SBSP_EXPLOREMODE        0x0020")
cpp_quote("#define SBSP_HELPMODE           0x0040 // IEUNIX : Help window uses this.")
cpp_quote("#define SBSP_NOTRANSFERHIST     0x0080")

cpp_quote("#define SBSP_ABSOLUTE           0x0000")
cpp_quote("#define SBSP_RELATIVE           0x1000")
cpp_quote("#define SBSP_PARENT             0x2000")
cpp_quote("#define SBSP_NAVIGATEBACK       0x4000")
cpp_quote("#define SBSP_NAVIGATEFORWARD    0x8000")

cpp_quote("#define SBSP_ALLOW_AUTONAVIGATE 0x10000")

cpp_quote("#define SBSP_CALLERUNTRUSTED      0x00800000")
cpp_quote("#define SBSP_TRUSTFIRSTDOWNLOAD   0x01000000")
cpp_quote("#define SBSP_UNTRUSTEDFORDOWNLOAD 0x02000000")
cpp_quote("#define SBSP_NOAUTOSELECT         0x04000000")
cpp_quote("#define SBSP_WRITENOHISTORY       0x08000000")
cpp_quote("#define SBSP_TRUSTEDFORACTIVEX    0x10000000")

cpp_quote("#define SBSP_REDIRECT                     0x40000000")
cpp_quote("#define SBSP_INITIATEDBYHLINKFRAME        0x80000000")
//
// Values for id parameter of ISB::GetWindow/SendControlMsg members.
//
// WARNING:
//  Any shell extensions which sends messages to those control windows
// might not work in the future version of windows. If you really need
// to send messages to them, (1) don't assume that those control window
// always exist (i.e. GetControlWindow may fail) and (2) verify the window
// class of the window before sending any messages.
//
cpp_quote("#define FCW_STATUS      0x0001")
cpp_quote("#define FCW_TOOLBAR     0x0002")
cpp_quote("#define FCW_TREE        0x0003")
cpp_quote("#define FCW_INTERNETBAR 0x0006")
cpp_quote("#define FCW_PROGRESS    0x0008")


//
// Values for uFlags paremeter of ISB::SetToolbarItems member.
//
cpp_quote("#define FCT_MERGE       0x0001")
cpp_quote("#define FCT_CONFIGABLE  0x0002")
cpp_quote("#define FCT_ADDTOEND    0x0004")

cpp_quote("#ifdef _NEVER_")
typedef LPARAM LPTBBUTTONSB;
cpp_quote("#else //!_NEVER_")
cpp_quote("#include <commctrl.h>")
cpp_quote("typedef LPTBBUTTON LPTBBUTTONSB;")
cpp_quote("#endif //_NEVER_")

[
    helpstring("IShellBrowser"),
    uuid(000214E2-0000-0000-C000-000000000046),
    object,
    pointer_default(unique)
]
interface IShellBrowser : IOleWindow
{
    // same as IOleInPlaceFrame
    HRESULT InsertMenusSB(
        [in] HMENU hmenuShared, 
        [in, out] LPOLEMENUGROUPWIDTHS lpMenuWidths);
        
    HRESULT SetMenuSB(
        [in] HMENU hmenuShared, 
        [in] HOLEMENU holemenuRes, 
        [in] HWND hwndActiveObject);
        
    HRESULT RemoveMenusSB([in] HMENU hmenuShared);
    HRESULT SetStatusTextSB([in, unique] LPCOLESTR pszStatusText);
    HRESULT EnableModelessSB([in] BOOL fEnable);
    HRESULT TranslateAcceleratorSB([in] MSG *pmsg, [in] WORD wID);

    // IShellBrowser
    HRESULT BrowseObject(
        [in] LPCITEMIDLIST pidl, 
        [in] UINT wFlags);
        
    HRESULT GetViewStateStream(
        [in] DWORD grfMode, 
        [out] IStream **ppStrm);
        
    HRESULT GetControlWindow(
        [in] UINT id, 
        [out] HWND * phwnd);
        
    [local] HRESULT SendControlMsg(
        [in] UINT id, 
        [in] UINT uMsg, 
        [in] WPARAM wParam, 
        [in] LPARAM lParam, 
        [in] LRESULT *pret);
        
    HRESULT QueryActiveShellView([out] IShellView **ppshv);
    HRESULT OnViewWindowActive([in] IShellView *pshv);
    [local] HRESULT SetToolbarItems(
        [in] LPTBBUTTONSB lpButtons, 
        [in] UINT nButtons, 
        [in] UINT uFlags);
};

typedef IShellBrowser * LPSHELLBROWSER;


[
    helpstring("IProfferService"),
    uuid(cb728b20-f786-11ce-92ad-00aa00a74cd0), // IID_IProfferService
    object,
    pointer_default(unique)
]
interface IProfferService : IUnknown
{
    HRESULT ProfferService([in]REFGUID rguidService, [in] IServiceProvider *psp, [out] DWORD *pdwCookie);
    HRESULT RevokeService([in]DWORD dwCookie);
}

cpp_quote("#define SID_SProfferService IID_IProfferService    // nearest service that you can proffer to")

typedef [v1_enum] enum
{
    PUIFNF_DEFAULT          = 0x00000000,
    PUIFNF_MNEMONIC         = 0x00000001,   // include mnemonic in display name
} PROPERTYUI_NAME_FLAGS;

typedef [v1_enum] enum
{
    PUIF_DEFAULT            = 0x00000000,
    PUIF_RIGHTALIGN         = 0x00000001,   // this property should be right alligned
    PUIF_NOLABELININFOTIP   = 0x00000002,   // this property should not display a label in the infotip
} PROPERTYUI_FLAGS;

typedef [v1_enum] enum
{
    PUIFFDF_DEFAULT         = 0x00000000,
    PUIFFDF_RIGHTTOLEFT     = 0x00000001,   // BIDI support, right to left caller
    PUIFFDF_SHORTFORMAT     = 0x00000002,   // short format version of string
    PUIFFDF_NOTIME          = 0x00000004,   // truncate time to days, not hours/mins/sec
    PUIFFDF_FRIENDLYDATE    = 0x00000008,   // "Today", "Yesterday", etc
    PUIFFDF_NOUNITS         = 0x00000010,   // don't do "KB", "MB", "KHz"
} PROPERTYUI_FORMAT_FLAGS;

[
    helpstring("IPropertyUI - helper for dealing with properties ala IPropertySetStorage"),
    uuid(757a7d9f-919a-4118-99d7-dbb208c8cc66),
    object,
    pointer_default(unique)
]
interface IPropertyUI : IUnknown
{
    HRESULT ParsePropertyName([in] LPCWSTR pszName, [out] FMTID *pfmtid, [out] PROPID *ppid, [in, out] ULONG *pchEaten);
    HRESULT GetCannonicalName([in] REFFMTID fmtid, [in] PROPID pid, [out, size_is(cchText)] LPWSTR pwszText, [in] DWORD cchText);
    HRESULT GetDisplayName([in] REFFMTID fmtid, [in] PROPID pid, [in] PROPERTYUI_NAME_FLAGS flags, [out, size_is(cchText)] LPWSTR pwszText, [in] DWORD cchText);
    HRESULT GetPropertyDescription([in] REFFMTID fmtid, [in] PROPID pid, [out, size_is(cchText)] LPWSTR pwszText, [in] DWORD cchText);
    HRESULT GetDefaultWidth([in] REFFMTID fmtid, [in] PROPID pid, [out] ULONG *pcxChars);
    HRESULT GetFlags([in] REFFMTID fmtid, [in] PROPID pid, [out] PROPERTYUI_FLAGS *pFlags);
    HRESULT FormatForDisplay([in] REFFMTID fmtid, [in] PROPID pid, [in] const PROPVARIANT *pvar, [in] PROPERTYUI_FORMAT_FLAGS flags, [out, size_is(cchText)] LPWSTR pwszText, [in] DWORD cchText);
    HRESULT GetHelpInfo([in] REFFMTID fmtid, [in] PROPID pid, [out, size_is(cch)] LPWSTR pwszHelpFile, [in] DWORD cch, [out] UINT *puHelpID);
};

cpp_quote("#if (_WIN32_IE >= 0x0500)")

// Folder Category Support

[
    helpstring("ICategoryProvider - Provides a list of catagorizers registered on an IShellFolder"),
    uuid(9af64809-5864-4c26-a720-c1f78c086ee3),
    object,
    pointer_default(unique)
]
interface ICategoryProvider : IUnknown
{
    [helpstring("Returns S_OK if the view should display this column in category selection UI, or S_FALSE to remove it.")]
    HRESULT CanCategorizeOnSCID(SHCOLUMNID* pscid);
    [helpstring("Returns either a GUID to create in CreateCategory, or a SHCOLUNNID that is used by the default categorizer. Return S_FALSE if you do not support a default group. GUID_NULL returned in pguid indicates to the client to use pscid as the default category.")]
    HRESULT GetDefaultCategory(GUID* pguid, SHCOLUMNID* pscid);
    [helpstring("Returns either a GUID that represents the categoizer to use for the specified SHCOLUMNID.")]
    HRESULT GetCategoryForSCID(SHCOLUMNID* pscid, GUID* pguid);
    [helpstring("Returns an IEnumGUID that has a list of GUIDs that represent categories.")]
    HRESULT EnumCategories(IEnumGUID** penum);
    [helpstring("Returns the name of the given category.")]
    HRESULT GetCategoryName(GUID* pguid, LPWSTR pszName, UINT cch);
    [helpstring("Creates the category.")]
    HRESULT CreateCategory(GUID* pguid, REFIID riid, [iid_is(riid)]void** ppv);
}

typedef [v1_enum] enum
{
    CATINFO_NORMAL      = 0x00000000,   // Apply default properties to this category
    CATINFO_COLLAPSED   = 0x00000001,   // This category should appear collapsed. useful for the "None" category. 
    CATINFO_HIDDEN      = 0x00000002,   // This category should follow the "Hidden" files setting for being displayed
} CATEGORYINFO_FLAGS;

typedef [v1_enum] enum
{
    CATSORT_DEFAULT     = 0x00000000,   // Default Sort order
    CATSORT_NAME        = 0x00000001,   // Sort by name
} CATSORT_FLAGS;

typedef struct
{
    CATEGORYINFO_FLAGS cif;
    WCHAR wszName[260];
} CATEGORY_INFO;

[
    helpstring("ICategorizer - Categorizes pidls"),
    uuid(a3b14589-9174-49a8-89a3-06a1ae2b9ba7),
    object,
    pointer_default(unique)
]
interface ICategorizer : IUnknown
{
    [helpstring("Returns the description of this category that will be displayed in the UI")]
    HRESULT GetDescription(LPWSTR pszDesc, UINT cch);
    [helpstring("Returns a list of categories associated with a list of ID Lists. NOTE: -1 is an invalid Category ID, and they cannot be persisted")]
    HRESULT GetCategory([in] UINT cidl, 
                        [in, size_is(cidl)] LPCITEMIDLIST * apidl, 
                        [in, out, size_is(cidl)] DWORD* rgCategoryIds);

    [helpstring("Returns information about the category, such as default display and the text to display in the UI")]
    HRESULT GetCategoryInfo(DWORD dwCategoryId, CATEGORY_INFO* pci);
    [helpstring("Returns HRESULTFromShort. -1, 0, 1 indicate the comparison of the IDs. Used for sorting categories in the UI")]
    HRESULT CompareCategory(CATSORT_FLAGS csfFlags, DWORD dwCategoryId1, DWORD dwCategoryId2);
};
cpp_quote("#endif // (_WIN32_IE >= 0x0500)")


cpp_quote("#ifdef UNICODE")
cpp_quote("#define IShellLink      IShellLinkW")
cpp_quote("#else")
cpp_quote("#define IShellLink      IShellLinkA")
cpp_quote("#endif")

// IShellLink::Resolve fFlags
typedef enum 
{
    SLR_NO_UI               = 0x0001,   // don't post any UI durring the resolve operation, not msgs are pumped
    SLR_ANY_MATCH           = 0x0002,   // no longer used
    SLR_UPDATE              = 0x0004,   // save the link back to it's file if the track made it dirty
    SLR_NOUPDATE            = 0x0008,
    SLR_NOSEARCH            = 0x0010,   // don't execute the search heuristics
    SLR_NOTRACK             = 0x0020,   // don't use NT5 object ID to track the link
    SLR_NOLINKINFO          = 0x0040,   // don't use the net and volume relative info
    SLR_INVOKE_MSI          = 0x0080,   // if we have a darwin link, then call msi to fault in the applicaion
    SLR_NO_UI_WITH_MSG_PUMP = 0x0101,   // SLR_NO_UI + requires an enable modeless site or HWND
} SLR_FLAGS;

// IShellLink::GetPath fFlags
typedef enum 
{
    SLGP_SHORTPATH      = 0x0001,
    SLGP_UNCPRIORITY    = 0x0002,
    SLGP_RAWPATH        = 0x0004,
} SLGP_FLAGS;

[
    uuid(000214EE-0000-0000-C000-000000000046),
    object,
    pointer_default(unique)
]
interface IShellLinkA : IUnknown
{
    HRESULT GetPath([out, size_is(cch)] LPSTR pszFile, [in] int cch, [in, out, ptr] WIN32_FIND_DATAA *pfd, [in] DWORD fFlags);
    HRESULT GetIDList([out] LPITEMIDLIST * ppidl);
    HRESULT SetIDList([in] LPCITEMIDLIST pidl);
    HRESULT GetDescription([out, size_is(cch)] LPSTR pszName, [in] int cch);
    HRESULT SetDescription([in] LPCSTR pszName);
    HRESULT GetWorkingDirectory([out, size_is(cch)] LPSTR pszDir, [in] int cch);
    HRESULT SetWorkingDirectory([in] LPCSTR pszDir);
    HRESULT GetArguments([out, size_is(cch)] LPSTR pszArgs, [in] int cch);
    HRESULT SetArguments([in] LPCSTR pszArgs);
    HRESULT GetHotkey([out] WORD *pwHotkey);
    HRESULT SetHotkey([in] WORD wHotkey);
    HRESULT GetShowCmd([out] int *piShowCmd);
    HRESULT SetShowCmd([in] int iShowCmd);
    HRESULT GetIconLocation([out, size_is(cch)] LPSTR pszIconPath, [in] int cch, [out] int *piIcon);
    HRESULT SetIconLocation([in] LPCSTR pszIconPath, [in] int iIcon);
    HRESULT SetRelativePath([in] LPCSTR pszPathRel, [in] DWORD dwReserved);
    HRESULT Resolve([in] HWND hwnd, [in] DWORD fFlags);
    HRESULT SetPath([in] LPCSTR pszFile);
};
*/

    //from MS VS8 VC PlatformSDK shObjIdl.idl
    interface IShellLinkW : IUnknown
    {
        mixin(uuid("000214F9-0000-0000-C000-000000000046"));
        // static DWINGUID IID = { 0x000214F9, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
        
        int GetPath( wchar* pszFile, int cch, ref WIN32_FIND_DATAW pfd, uint fFlags);
        int GetIDList(out LPITEMIDLIST  ppidl);
        int SetIDList(LPCITEMIDLIST pidl);
        int GetDescription(wchar* pszName, int cch);
        int SetDescription(wchar* pszName);
        int GetWorkingDirectory(wchar* pszDir, int cch);
        int SetWorkingDirectory(wchar* pszDir);
        int GetArguments(wchar* pszArgs, int cch);
        int SetArguments(wchar* pszArgs);
        int GetHotkey(out ushort pwHotkey);
        int SetHotkey(ushort wHotkey);
        int GetShowCmd(out int piShowCmd);
        int SetShowCmd(int iShowCmd);
        int GetIconLocation(wchar* pszIconPath, int cch, out int piIcon);
        int SetIconLocation(wchar* pszIconPath, int iIcon);
        int SetRelativePath(wchar* pszPathRel, uint dwReserved);
        int Resolve(void* hwnd, uint fFlags);
        int SetPath(wchar* pszFile);
    };   

    /*
[
    uuid(000214F9-0000-0000-C000-000000000046),
    object,
    pointer_default(unique)
]
interface IShellLinkW : IUnknown
{
    HRESULT GetPath([out, size_is(cch)] LPWSTR pszFile, [in] int cch, [in, out, ptr] WIN32_FIND_DATAW *pfd, [in] DWORD fFlags);
    HRESULT GetIDList([out] LPITEMIDLIST * ppidl);
    HRESULT SetIDList([in] LPCITEMIDLIST pidl);
    HRESULT GetDescription([out, size_is(cch)] LPWSTR pszName, int cch);
    HRESULT SetDescription([in] LPCWSTR pszName);
    HRESULT GetWorkingDirectory([out, size_is(cch)] LPWSTR pszDir, int cch);
    HRESULT SetWorkingDirectory([in] LPCWSTR pszDir);
    HRESULT GetArguments([out, size_is(cch)] LPWSTR pszArgs, int cch);
    HRESULT SetArguments([in] LPCWSTR pszArgs);
    HRESULT GetHotkey([out] WORD *pwHotkey);
    HRESULT SetHotkey([in] WORD wHotkey);
    HRESULT GetShowCmd([out] int *piShowCmd);
    HRESULT SetShowCmd([in] int iShowCmd);
    HRESULT GetIconLocation([out, size_is(cch)] LPWSTR pszIconPath, [in] int cch, [out] int *piIcon);
    HRESULT SetIconLocation([in] LPCWSTR pszIconPath, [in] int iIcon);
    HRESULT SetRelativePath([in] LPCWSTR pszPathRel, [in] DWORD dwReserved);
    HRESULT Resolve([in] HWND hwnd, [in] DWORD fFlags);
    HRESULT SetPath([in] LPCWSTR pszFile);
};
*/


/*
[
    object,
    uuid(49ff1172-eadc-446d-9285-156453a6431c),
    helpstring("IActionProgressDialog Interface"),
    pointer_default(unique)
]
interface IActionProgressDialog : IUnknown
{
    [v1_enum] enum {
        SPINITF_NORMAL         = 0x00000000,      // default normal progress behavior
        SPINITF_MODAL          = 0x00000001,      // call punkSite->EnableModeless() or EnableWindow()
        SPINITF_NOMINIMIZE     = 0x00000008,      // Do not have a minimize button in the caption bar.
    };
    typedef DWORD SPINITF;
    
    HRESULT Initialize(
        [in] SPINITF flags, 
        [in, string] LPCWSTR pszTitle, 
        [in, string] LPCWSTR pszCancel);

    HRESULT Stop();
};

[
    object,
    uuid(C1FB73D0-EC3A-4ba2-B512-8CDB9187B6D1),
    helpstring("HW Event Handler Interface"),
    pointer_default(unique)
]
interface IHWEventHandler : IUnknown
{
    HRESULT Initialize([in, string] LPCWSTR pszParams);
    HRESULT HandleEvent([in, string] LPCWSTR pszDeviceID,
        [in, string] LPCWSTR pszAltDeviceID,
        [in, string] LPCWSTR pszEventType);
    HRESULT HandleEventWithContent([in, string] LPCWSTR pszDeviceID,
        [in, string] LPCWSTR pszAltDeviceID,
        [in, string] LPCWSTR pszEventType,
        [in, string] LPCWSTR pszContentTypeHandler,
        [in] IDataObject* pdataobject);
};

cpp_quote("#define ARCONTENT_AUTORUNINF         0x00000002") // That's the one we have today, and always had 
cpp_quote("#define ARCONTENT_AUDIOCD         0x00000004") // Audio CD (not MP3 and the like, the stuff you buy at the store) 
cpp_quote("#define ARCONTENT_DVDMOVIE        0x00000008") // DVD Movie (not MPEGs, the stuff you buy at the store) 
cpp_quote("#define ARCONTENT_BLANKCD         0x00000010") // Blank CD-R/CD-RW 
cpp_quote("#define ARCONTENT_BLANKDVD        0x00000020") // Blank DVD-R/DVD-RW 
cpp_quote("#define ARCONTENT_UNKNOWNCONTENT     0x00000040") // Whatever files.  Mean that it's formatted.
cpp_quote("#define ARCONTENT_AUTOPLAYPIX     0x00000080") // Whatever files.  Mean that it's formatted.
cpp_quote("#define ARCONTENT_AUTOPLAYMUSIC      0x00000100") // Whatever files.  Mean that it's formatted.
cpp_quote("#define ARCONTENT_AUTOPLAYVIDEO      0x00000200") // Whatever files.  Mean that it's formatted.

[
    object,
    uuid(DDEFE873-6997-4e68-BE26-39B633ADBE12),
    helpstring("HW Event Handler Interface"),
    pointer_default(unique)
]
interface IQueryCancelAutoPlay : IUnknown
{
    HRESULT AllowAutoPlay([in, string]LPCWSTR pszPath, [in]DWORD dwContentType,
      [in, string]LPCWSTR pszLabel, [in] DWORD dwSerialNumber);
};

[
    object,
    uuid(49ff1173-eadc-446d-9285-156453a6431c),
    helpstring("IActionProgress Interface"),
    pointer_default(unique)
]
interface IActionProgress : IUnknown
{
    [v1_enum] enum {
        SPBEGINF_NORMAL             = 0x00000000,      // default normal progress behavior
        SPBEGINF_AUTOTIME           = 0x00000002,      // automatically updates the "time remaining" text 
        SPBEGINF_NOPROGRESSBAR      = 0x00000010,      // Don't display the progress bar (SetProgress() wont be called)
        SPBEGINF_MARQUEEPROGRESS    = 0x00000020,      // use marquee progress (comctl32 v6 required)
    };
    typedef DWORD SPBEGINF;

    typedef [v1_enum] enum _SPACTION {
        SPACTION_NONE            = 0,      
        SPACTION_MOVING,
        SPACTION_COPYING,
        SPACTION_RECYCLING,
        SPACTION_APPLYINGATTRIBS,
        SPACTION_DOWNLOADING,
        SPACTION_SEARCHING_INTERNET,
        SPACTION_CALCULATING,
        SPACTION_UPLOADING,
        SPACTION_SEARCHING_FILES,
    } SPACTION;
    
    HRESULT Begin(
        [in] SPACTION action,
        [in] SPBEGINF flags);

    HRESULT UpdateProgress(
        [in] ULONGLONG ulCompleted, 
        [in] ULONGLONG ulTotal);

    typedef [v1_enum] enum _SPTEXT
    {
        SPTEXT_ACTIONDESCRIPTION        = 1,
        SPTEXT_ACTIONDETAIL,
    } SPTEXT;
    
    HRESULT UpdateText(
        [in] SPTEXT sptext, 
        [in, string] LPCWSTR pszText, 
        [in] BOOL fMayCompact);

    HRESULT QueryCancel([out] BOOL * pfCancelled);
    HRESULT ResetCancel();

    HRESULT End();

};

//  The IShellExtInit interface is used by the explorer to initialize shell
// extension objects. The explorer (1) calls CoCreateInstance (or equivalent)
// with the registered CLSID and IID_IShellExtInit, (2) calls its Initialize
// member, then (3) calls its QueryInterface to a particular interface (such
// as IContextMenu or IPropSheetExt and (4) performs the rest of operation.
//
// IShellExtInit::Initialize
//
//  This member function is called when the explorer is initializing either
// context menu extension, property sheet extension or non-default drag-drop
// extension.
//
//  Parameters: (context menu or property sheet extension)
//   pidlFolder -- Specifies the parent folder
//   lpdobj -- Spefifies the set of items selected in that folder.
//   hkeyProgID -- Specifies the type of the focused item in the selection.
//
//  Parameters: (non-default drag-and-drop extension)
//   pidlFolder -- Specifies the target (destination) folder
//   lpdobj -- Specifies the items that are dropped (see the description
//    about shell's clipboard below for clipboard formats).
//   hkeyProgID -- Specifies the folder type.

[
    uuid(000214E8-0000-0000-C000-000000000046),
    object,
    local,
    pointer_default(unique)
]
interface IShellExtInit : IUnknown
{
    HRESULT Initialize([in] LPCITEMIDLIST pidlFolder, [in] IDataObject *pdtobj, [in] HKEY hkeyProgID);
}
typedef IShellExtInit * LPSHELLEXTINIT;


//  The explorer uses the IShellPropSheetExt to allow property sheet
// extensions or control panel extensions to add additional property
// sheet pages.
//
// IShellPropSheetExt::AddPages
//
//  The explorer calls this member function when it finds a registered
// property sheet extension for a particular type of object. For each
// additional page, the extension creates a page object by calling
// CreatePropertySheetPage API and calls lpfnAddPage.
//
//  Parameters:
//   lpfnAddPage -- Specifies the callback function.
//   lParam -- Specifies the opaque handle to be passed to the callback function.
//
//
// IShellPropSheetExt::ReplacePage
//
//  The explorer never calls this member of property sheet extensions. The
// explorer calls this member of control panel extensions, so that they
// can replace some of default control panel pages (such as a page of
// mouse control panel).
//
//  Parameters:
//   uPageID -- Specifies the page to be replaced.
//   lpfnReplace Specifies the callback function.
//   lParam -- Specifies the opaque handle to be passed to the callback function.
//
[
    uuid(000214E9-0000-0000-C000-000000000046),
    object,
    local,
    pointer_default(unique)
]
interface IShellPropSheetExt : IUnknown
{
    HRESULT AddPages([in] LPFNSVADDPROPSHEETPAGE pfnAddPage, [in] LPARAM lParam);
    enum
    {
        EXPPS_FILETYPES     = 0x00000001,
    };
    typedef UINT EXPPS;
    HRESULT ReplacePage([in] EXPPS uPageID, [in] LPFNSVADDPROPSHEETPAGE pfnReplaceWith, [in] LPARAM lParam);
}
typedef IShellPropSheetExt * LPSHELLPROPSHEETEXT;


[
    helpstring("used to initialize an object on a remote computer (server)"),
    uuid(000214FE-0000-0000-C000-000000000046),
    object,
    pointer_default(unique)
]
interface IRemoteComputer : IUnknown
{
    // function is called when the explorer is initializing or
    // enumerating the name space extension. If failure is returned during
    // enumeration, the extension won't appear for this computer. Otherwise,
    // the extension will appear, and should target the given machine.
    //
    // pszMachine       Specifies the name of the machine to target. (\\server)
    // bEnumerationg    test to see if this object should be enumerated
    //                  on this server
    HRESULT Initialize([in] LPCWSTR pszMachine, [in] BOOL bEnumerating);
};

[
    uuid(7307055c-b24a-486b-9f25-163e597a28a9), object, pointer_default(unique)
]
interface IQueryContinue : IUnknown
{
    HRESULT QueryContinue();    // S_OK -> Continue, other 
};

[
    uuid(ba9711ba-5893-4787-a7e1-41277151550b), object, pointer_default(unique)
]
interface IUserNotification : IUnknown
{
    HRESULT SetBalloonInfo([in, string] LPCWSTR pszTitle, [in, string] LPCWSTR pszText, [in] DWORD dwInfoFlags);
    // times in msec
    HRESULT SetBalloonRetry([in] DWORD dwShowTime, [in] DWORD dwInterval, [in] UINT cRetryCount);
    HRESULT SetIconInfo([in] HICON hIcon, [in, string] LPCWSTR pszToolTip);
    HRESULT Show([in] IQueryContinue *pqc, [in] DWORD dwContinuePollInterval);
    HRESULT PlaySound([in, string] LPCWSTR pszSoundName);
};


// interface for describing the limits placed on a name, used for validation
// parsing and translation.

[
    uuid(1df0d7f1-b267-4d28-8b10-12e23202a5c4)
]
interface IItemNameLimits : IUnknown
{
    HRESULT GetValidCharacters([out] LPWSTR *ppwszValidChars, [out] LPWSTR *ppwszInvalidChars);
    HRESULT GetMaxLength([in] LPCWSTR pszName, [out] int *piMaxNameLen);
};


// INetCrawler interface
//
// [Member functions]
//
//   INetCrawler::Update
//   Causes an enumeration of the local workgroup and subsequent addition
//   of folder shortcut and printer objects.   As is a blocking call
//   which will potentially take a long time (seconds) it should be called
//   on a seperate thread

cpp_quote("#define SNCF_REFRESHLIST 0x00000001  // refresh the list (eg. from F5 or opening a folder)")

[
    helpstring("INetCrawler"),
    uuid(49c929ee-a1b7-4c58-b539-e63be392b6f3),
    object,
    pointer_default(unique)
]
interface INetCrawler : IUnknown
{
    HRESULT Update([in] DWORD dwFlags);
}



cpp_quote("#if (_WIN32_IE >= 0x0400)")

// --- IExtractImage
// this interface is provided for objects to provide a thumbnail image.
// IExtractImage::GetLocation()
//      Gets a path description of the image that is to be extracted. This is used to
//      identify the image in the view so that multiple instances of the same image can reuse the
//      original image. If *pdwFlags == IEIFLAG_ASYNC and the result is E_PENDING, then *pdwPriority
//      is used to return the priority of the item, this is usually a measure of how long it will take
//      to perform the extraction. *pdwFlags can return IEIFLAG_CACHE if the view should cache a copy
//      of the image for future reference and faster access. This flag is used to tell the difference
//      between file formats that cache a thumbnail image such as Flashpix or Office documents, and those
//      that don't cache one.
// IExtractImage::Extract()
//      Extract the thumbnail of the specified size. If GetLocation() returned the values indicating
//      it is free-threaded and can be placed on a background thread. If the object
//      supports IRunnableTask as well, then long extractions can be started and paused as appropriate.
//      At this point it is asssumed the object is free-threaded.
//      If dwRecClrDepth contains a recommended Colour depth
//      If *phBmpthumbnail is non NULL, then it contains the destination bitmap that should be used.

cpp_quote("#define IEI_PRIORITY_MAX        ITSAT_MAX_PRIORITY")
cpp_quote("#define IEI_PRIORITY_MIN        ITSAT_MIN_PRIORITY")
cpp_quote("#define IEIT_PRIORITY_NORMAL     ITSAT_DEFAULT_PRIORITY")

cpp_quote("#define IEIFLAG_ASYNC       0x0001      // ask the extractor if it supports ASYNC extract (free threaded)")
cpp_quote("#define IEIFLAG_CACHE       0x0002      // returned from the extractor if it does NOT cache the thumbnail")
cpp_quote("#define IEIFLAG_ASPECT      0x0004      // passed to the extractor to beg it to render to the aspect ratio of the supplied rect")
cpp_quote("#define IEIFLAG_OFFLINE     0x0008      // if the extractor shouldn't hit the net to get any content neede for the rendering")
cpp_quote("#define IEIFLAG_GLEAM       0x0010      // does the image have a gleam ? this will be returned if it does")
cpp_quote("#define IEIFLAG_SCREEN      0x0020      // render as if for the screen  (this is exlusive with IEIFLAG_ASPECT )")
cpp_quote("#define IEIFLAG_ORIGSIZE    0x0040      // render to the approx size passed, but crop if neccessary")
cpp_quote("#define IEIFLAG_NOSTAMP     0x0080      // returned from the extractor if it does NOT want an icon stamp on the thumbnail")
cpp_quote("#define IEIFLAG_NOBORDER    0x0100      // returned from the extractor if it does NOT want an a border around the thumbnail")
cpp_quote("#define IEIFLAG_QUALITY     0x0200      // passed to the Extract method to indicate that a slower, higher quality image is desired, re-compute the thumbnail")
cpp_quote("#define IEIFLAG_REFRESH     0x0400      // returned from the extractor if it would like to have Refresh Thumbnail available")

[
    helpstring("IExtractImage"),
    uuid(BB2E617C-0920-11d1-9A0B-00C04FC2D6C1),
    object,
    pointer_default(unique)
]
interface IExtractImage : IUnknown
{
    HRESULT GetLocation([out, size_is(cch)] LPWSTR pszPathBuffer,
                        [in] DWORD cch,
                        [in, out, unique] DWORD *pdwPriority,
                        [in] const SIZE * prgSize,
                        [in] DWORD dwRecClrDepth,
                        [in, out] DWORD *pdwFlags);

   HRESULT Extract([out] HBITMAP *phBmpThumbnail);
}
typedef IExtractImage * LPEXTRACTIMAGE;

cpp_quote("#endif")

cpp_quote("#if (_WIN32_IE >= 0x0500)")

// GetDateStamp : returns the date stamp associated with the image. If this image is already cached,
//                then it is easy to find out if the image is out of date.

[
    helpstring("IExtractImage2"),
    uuid(953BB1EE-93B4-11d1-98A3-00C04FB687DA),
    object,
    pointer_default(unique)
]
interface IExtractImage2 : IExtractImage
{
    HRESULT GetDateStamp([out] FILETIME *pDateStamp);
}
typedef IExtractImage2 * LPEXTRACTIMAGE2;

cpp_quote("#endif")



//-------------------------------------------------------------------------
//
// IUserEventTimerCallback interface
//
//-------------------------------------------------------------------------
interface IUserEventTimerCallback;
[
    helpstring("IUserEventTimerCallback "),
    uuid(e9ead8e6-2a25-410e-9b58-a9fbef1dd1a2),     // IID_IUserEventTimerCallback
    object,
    pointer_default(unique)
]

interface IUserEventTimerCallback : IUnknown
{
    HRESULT UserEventTimerProc(
        [in] ULONG uUserEventTimerID,
        [in] UINT uTimerElapse); 
};


//-------------------------------------------------------------------------
//
// IUserEventTimer interface
//
//  Timer to keep track of user presence at the machine
//
//-------------------------------------------------------------------------
interface IUserEventTimer;
[
    helpstring("IUserEventTimer "),
    uuid(0F504B94-6E42-42E6-99E0-E20FAFE52AB4),     // IID_IUserEventTimer
    object,
    pointer_default(unique)
]

interface IUserEventTimer : IUnknown
{
    HRESULT SetUserEventTimer
    (
        [in] HWND hWnd,
        [in] UINT uCallbackMessage,
        [in] UINT uTimerElapse,
        [in] IUserEventTimerCallback * pUserEventTimerCallback,
        [in, out] ULONG * puUserEventTimerID
    );

    HRESULT KillUserEventTimer 
    (    
        [in] HWND hWnd,
        [in] ULONG uUserEventTimerID 
    );

    HRESULT GetUserEventTimerElapsed
    (
        [in] HWND hWnd,
        [in] ULONG uUserEventTimerID,
        [out] UINT * puTimerElapsed 
    );

    HRESULT InitTimerTickInterval
    (
        [in] UINT uTimerTickIntervalMs
    );                            
};


//-------------------------------------------------------------------------
//
// IDockingWindow interface
//
//   An object (docking window) implements this interface so the site can
// communicate with it.  An example of a docking window is a toolbar.
//
// [Member functions]
//
// IDockingWindow::ShowDW(fShow)
//   Shows or hides the docking window.
//
// IDockingWindow::CloseDW(dwReserved)
//   Closes the docking window.  dwReserved must be 0.
//
// IDockingWindow::ResizeBorderDW(prcBorder, punkToolbarSite, fReserved)
//   Resizes the docking window's border to *prcBorder.  fReserved must
//   be 0.
//
// IObjectWithSite::SetSite(punkSite)
//   IDockingWindow usually paired with IObjectWithSite.
//   Provides the IUnknown pointer of the site to the docking window.
//
//-------------------------------------------------------------------------

[
    uuid(012dd920-7b26-11d0-8ca9-00a0c92dbfe8),
    object
]
interface IDockingWindow : IOleWindow
{
    HRESULT ShowDW([in] BOOL fShow);
    HRESULT CloseDW([in] DWORD dwReserved);
    HRESULT ResizeBorderDW([in] LPCRECT prcBorder, [in] IUnknown* punkToolbarSite, [in] BOOL fReserved);
};

//-------------------------------------------------------------------------
//
// IDeskBand interface
//
//
// [Member functions]
//
// IDeskBand::GetBandInfo(dwBandID, dwViewMode, pdbi)
//   Returns info on the given band in *pdbi, according to the mask
//   field in the DESKBANDINFO structure and the given viewmode.
//
//-------------------------------------------------------------------------


// Mask values for DESKBANDINFO
cpp_quote("#define DBIM_MINSIZE    0x0001")
cpp_quote("#define DBIM_MAXSIZE    0x0002")
cpp_quote("#define DBIM_INTEGRAL   0x0004")
cpp_quote("#define DBIM_ACTUAL     0x0008")
cpp_quote("#define DBIM_TITLE      0x0010")
cpp_quote("#define DBIM_MODEFLAGS  0x0020")
cpp_quote("#define DBIM_BKCOLOR    0x0040")

cpp_quote("#include <pshpack8.h>")

typedef struct {
    DWORD       dwMask;
    POINTL      ptMinSize;
    POINTL      ptMaxSize;
    POINTL      ptIntegral;
    POINTL      ptActual;
    WCHAR       wszTitle[256];
    DWORD       dwModeFlags;
    COLORREF    crBkgnd;
} DESKBANDINFO;

cpp_quote("#include <poppack.h>")   // Return to byte packing

// DESKBANDINFO dwModeFlags values
cpp_quote("#define DBIMF_NORMAL            0x0000")
cpp_quote("#define DBIMF_FIXED             0x0001")
cpp_quote("#define DBIMF_FIXEDBMP          0x0004   // a fixed background bitmap (if supported)")
cpp_quote("#define DBIMF_VARIABLEHEIGHT    0x0008")
cpp_quote("#define DBIMF_UNDELETEABLE      0x0010")
cpp_quote("#define DBIMF_DEBOSSED          0x0020")
cpp_quote("#define DBIMF_BKCOLOR           0x0040")
cpp_quote("#define DBIMF_USECHEVRON        0x0080")
cpp_quote("#define DBIMF_BREAK             0x0100")
cpp_quote("#define DBIMF_ADDTOFRONT        0x0200")
cpp_quote("#define DBIMF_TOPALIGN          0x0400")

// GetBandInfo view mode values
cpp_quote("#define DBIF_VIEWMODE_NORMAL         0x0000")
cpp_quote("#define DBIF_VIEWMODE_VERTICAL       0x0001")
cpp_quote("#define DBIF_VIEWMODE_FLOATING       0x0002")
cpp_quote("#define DBIF_VIEWMODE_TRANSPARENT    0x0004")

// Command Target IDs
enum {
    DBID_BANDINFOCHANGED    = 0,
    DBID_SHOWONLY           = 1,
    DBID_MAXIMIZEBAND       = 2,      // Maximize the specified band (VT_UI4 == dwID)
    DBID_PUSHCHEVRON        = 3,
    DBID_DELAYINIT          = 4,      // Note: _bandsite_ calls _band_ with this code
    DBID_FINISHINIT         = 5,      // Note: _bandsite_ calls _band_ with this code
    DBID_SETWINDOWTHEME     = 6,      // Note: _bandsite_ calls _band_ with this code
    DBID_PERMITAUTOHIDE     = 7,
};

cpp_quote("#define DBPC_SELECTFIRST    (DWORD)-1")
cpp_quote("#define DBPC_SELECTLAST     (DWORD)-2")

cpp_quote("#define CGID_DeskBand IID_IDeskBand")

[
    uuid(EB0FE172-1A3A-11D0-89B3-00A0C90A90AC),
    object,
]
interface IDeskBand : IDockingWindow
{
    HRESULT GetBandInfo([in] DWORD dwBandID, [in] DWORD dwViewMode, [in, out] DESKBANDINFO* pdbi);
};


//-------------------------------------------------------------------------
//
// ITaskbarList interface
//
//
// [Member functions]
//
// ITaskbarList::HrInit()
//   This function must be called first to validate use of other members.
//
// ITaskbarList::AddTab(hwnd)
//   This function adds a tab for hwnd to the taskbar.
//
// ITaskbarList::DeleteTab(hwnd)
//   This function deletes a tab for hwnd from the taskbar.
//
// ITaskbarList::ActivateTab(hwnd)
//   This function activates the tab associated with hwnd on the taskbar.
//
// ITaskbarList::SetActivateAlt(hwnd)
//   This function marks hwnd in the taskbar as the active tab
//
//-------------------------------------------------------------------------
[
    uuid(56FDF342-FD6D-11d0-958A-006097C9A090),
    object,
]
interface ITaskbarList : IUnknown
{
    HRESULT HrInit();
    HRESULT AddTab([in] HWND hwnd);
    HRESULT DeleteTab([in] HWND hwnd);
    HRESULT ActivateTab([in] HWND hwnd);
    HRESULT SetActiveAlt([in] HWND hwnd);
};

[
    uuid(602D4995-B13A-429b-A66E-1935E44F4317),
    object,
]
interface ITaskbarList2 : ITaskbarList
{
    HRESULT MarkFullscreenWindow([in] HWND hwnd, [in] BOOL fFullscreen);
};


[
    object,
    uuid(3d73a659-e5d0-4d42-afc0-5121ba425c8d),     // IID_ICDBurn
    pointer_default(unique)
]
interface ICDBurn : IUnknown
{
    HRESULT GetRecorderDriveLetter([out, size_is(cch)] LPWSTR pszDrive, [in] UINT cch);
    HRESULT Burn([in] HWND hwnd);
    HRESULT HasRecordableDrive([out] BOOL *pfHasRecorder);
};

// Wizard Extension objects.  These interfaces defined methods for extending 
// Win32 wizard in a progromatic way.

// Range of ID's that extensions can used, these mustn't clash with
// the existing wizards dialog IDS.  (That enables them to still
// do PropSheet_SetCurSelByID).

cpp_quote("#define IDD_WIZEXTN_FIRST    0x5000")
cpp_quote("#define IDD_WIZEXTN_LAST     0x5100")


// This site object is requested via a QueryService of the objects site,
// it allows the extension to navigate in/out out itself, eg. when the
// extension has shown all of its pages and wants to navigate to the
// next page it would call GetNextPage and select the specified HPAGE.

[
    uuid(88960f5b-422f-4e7b-8013-73415381c3c3),
    helpstring("Wizard Extension Site"),
    local
]
interface IWizardSite : IUnknown
{
    HRESULT GetPreviousPage([out] HPROPSHEETPAGE *phpage);
    HRESULT GetNextPage([out] HPROPSHEETPAGE *phpage);
    HRESULT GetCancelledPage([out] HPROPSHEETPAGE *phpage);
};

// A wizard extension is implemented using this object, the extension will declare the
// pages that it supports using the AddPages method, and then when its host needs to navigate
// into the extenion it will do so via GetFirstPage and selecting that.

[
    uuid(c02ea696-86cc-491e-9b23-74394a0444a8),
    helpstring("Wizard Extension"),
    local
]
interface IWizardExtension : IUnknown
{
    HRESULT AddPages([in, out] HPROPSHEETPAGE* aPages, [in] UINT cPages, [out] UINT *pnPagesAdded);
    HRESULT GetFirstPage([out] HPROPSHEETPAGE *phpage);
    HRESULT GetLastPage([out] HPROPSHEETPAGE *phpage);
};


// The Web Wizard is a HTML host for wizard pages, it allows you
// create a HTML wizard starting at the URL defined via SetInitialURL.

[
    helpstring("Web Wizard Page Extension"),
    uuid(0e6b3f66-98d1-48c0-a222-fbde74e2fbc5),
    object,
    pointer_default(unique)
]
interface IWebWizardExtension : IWizardExtension
{
    HRESULT SetInitialURL([in, string] LPCWSTR pszURL);
    HRESULT SetErrorURL([in, string] LPCWSTR pszErrorURL);
};

cpp_quote("#define SID_WebWizardHost IID_IWebWizardExtension")


// flags for the host to control the publishing wizard

cpp_quote ("#define SHPWHF_NORECOMPRESS             0x00000001  // don't allow/prompt for recompress of streams")
cpp_quote ("#define SHPWHF_NONETPLACECREATE         0x00000002  // don't create a network place when transfer is complete")
cpp_quote ("#define SHPWHF_NOFILESELECTOR           0x00000004  // don't show the file selector")
cpp_quote ("#define SHPWHF_VALIDATEVIAWEBFOLDERS    0x00010000  // enable web folders to validate network places (ANP support)")

[ 
    helpstring("Web Publishing Wizard"),
    uuid(aa9198bb-ccec-472d-beed-19a4f6733f7a),
    object,
    pointer_default(unique)
]
interface IPublishingWizard : IWizardExtension
{
    HRESULT Initialize([in] IDataObject *pdo, [in] DWORD dwOptions, [in, string] LPCWSTR pszServiceProvider);
    HRESULT GetTransferManifest([out] HRESULT *phrFromTransfer, [out] IXMLDOMDocument **pdocManifest);
}


// Object to host an IFolderView in a window.  This is used to build check mark selection
// UI for files.

[
    uuid(1ea58f02-d55a-411d-b09e-9e65ac21605b),
    helpstring("Shell Folder Host"),
    local,
]
interface IFolderViewHost : IUnknown
{
    HRESULT Initialize([in] HWND hwndParent, [in] IDataObject *pdo, [in] RECT *prc);
};


//
//  Flags for IAutoCompleteDropDown::GetDropDownStatus
//
cpp_quote("#define ACDD_VISIBLE        0x0001")

[
    uuid(3CD141F4-3C6A-11d2-BCAA-00C04FD929DB),
    object,
    pointer_default(unique)
]
interface IAutoCompleteDropDown : IUnknown
{
    HRESULT GetDropDownStatus([out] DWORD *pdwFlags, [out, string] LPWSTR *ppwszString);
    HRESULT ResetEnumerator();
};

cpp_quote("#define PPW_LAUNCHEDBYUSER       0x00000001      // The wizard was launch explicitly by the user, not on demand by the key manager")

[ 
    helpstring("Passport Wizard"),
    uuid(a09db586-9180-41ac-9114-460a7f362b76),
    object,
    pointer_default(unique)
]
interface IPassportWizard : IModalWindow
{
    HRESULT SetOptions([in] DWORD dwOptions);
};


// the cd burning wizard extension sets return codes through a property bag
// to tell the main wizard whether it should stop or keep going
cpp_quote("#define PROPSTR_EXTENSIONCOMPLETIONSTATE L\"ExtensionCompletionState\"")
enum
{
    CDBE_RET_DEFAULT          = 0x00000000,
    CDBE_RET_DONTRUNOTHEREXTS = 0x00000001,
    CDBE_RET_STOPWIZARD       = 0x00000002,
};
cpp_quote("#define SID_CDWizardHost IID_ICDBurnExt")

[
    uuid(2271dcca-74fc-4414-8fb7-c56b05ace2d7),
    helpstring("add-ons for cd burning"),
]
interface ICDBurnExt : IUnknown
{
    enum
    {
        CDBE_TYPE_MUSIC = 0x00000001,
        CDBE_TYPE_DATA  = 0x00000002,
        CDBE_TYPE_ALL   = 0xFFFFFFFF
    };
    HRESULT GetSupportedActionTypes([out] DWORD *pdwActions);
}

typedef void (*PFDVENUMREADYBALLBACK)(LPVOID pvData);

//
// interface for communication between the view and the Explorer band treeview control
//
[
    uuid(70F55181-5FEA-4900-B6B8-7343CB0A348C),
    helpstring("Private interface between CDefView and Explorer band"),
    local
]
interface IDVGetEnum : IUnknown
{
    HRESULT SetEnumReadyCallback([in] PFDVENUMREADYBALLBACK pfn, [in] LPVOID pvData);
    HRESULT CreateEnumIDListFromContents([in] LPCITEMIDLIST pidlFolder, [in] DWORD dwEnumFlags, [out] IEnumIDList **ppEnumIDList);
};

[
    helpstring("Interface to allow items to be inserted in FolderItems"),
    uuid(D2B57227-3D23-4b95-93C0-492BD454C356),
    object,
    local
]
interface IInsertItem : IUnknown
{
    HRESULT InsertItem([in] LPCITEMIDLIST pidl);
}

///// IDeskBar
[
    uuid(EB0FE173-1A3A-11D0-89B3-00A0C90A90AC),
    object,
    pointer_default(unique),
    local
]
interface IDeskBar : IOleWindow
{
    HRESULT SetClient([in] IUnknown* punkClient);
    HRESULT GetClient([out] IUnknown** ppunkClient);
    HRESULT OnPosRectChangeDB([in] LPRECT prc);
};

//-------------------------------------------------------------------------
//
// IMenuBand interface
//
//   This interface provides methods the menuband (CLSID_MenuBand)
//  to receive pertinent messages.
//
// [Member functions]
//
// IMenuBand::IsMenuMessage(pmsg)
//   A message pump calls this function to see if any messages need
//   to be redirected to this object.  If this returns S_OK, the
//   message loop should not call TranslateMessage or DispatchMessage.
//   If this returns E_FAIL, the menu has exited menu mode and is ready
//   to be destroyed.
//
// IMenuBand::TranslateMenuMessage(pmsg, plRet)
//   Offers the object an opportunity to translate messages.  The
//   parent window proc must call this method for every message (not
//   the message pump).  The message, wParam, and lParam should be
//   delivered to this method in *pmsg.  This method may change the
//   values of pmsg->wParam or pmsg->lParam, in which case these changes
//   should be forwarded on.
//
//   This method is required because some modal message pumps (like the one
//   in TrackPopupMenu) do not give an opportunity to call a custom
//   TranslateAccelerator method like IInputObject::TranslateAcceleratorIO.
//
//   TranslateMenuMessage returns S_OK if the message was handled and
//   should be eaten.  *plRet is not touched if this returns S_FALSE.
//
//
//-------------------------------------------------------------------------

[
    uuid(568804CD-CBD7-11d0-9816-00C04FD91972),
    object,
    pointer_default(unique),
    local
]
interface IMenuBand : IUnknown
{
    // CmdIDs for the IOleCommandTarget Group: CGID_MenuBandHandler (defined in shguidp.h)
    enum {
        MBHANDCID_PIDLSELECT    = 0,         // A PIDL from a menuband was selected
    };

    HRESULT IsMenuMessage([in] MSG * pmsg);
    HRESULT TranslateMenuMessage([in,out] MSG * pmsg, [out] LRESULT * plRet);
};

[
    object,
    uuid(47c01f95-e185-412c-b5c5-4f27df965aea),     // IID_IFolderBandPriv
    pointer_default(unique)
]
interface IFolderBandPriv : IUnknown
{
    HRESULT SetCascade([in] BOOL f);
    HRESULT SetAccelerators([in] BOOL f);
    HRESULT SetNoIcons([in] BOOL f);
    HRESULT SetNoText([in] BOOL f);
};

cpp_quote("#if _WIN32_IE >= 0x0400")

//-------------------------------------------------------------------------
//
// IBandSite interface
//
//   This interface provides methods to get or set bandsite information.
//
// [Member functions]
//
// IBandSite::AddBand(punk)
//   Add a band to the bandsite.  Returns the band ID in ShortFromResult(hres).
//
// IBandSite::EnumBands(uBand, *pdwBandID)
//   Enumerate the bands. If uBand is -1, pdwBandID is ignored and this
//   method returns the count of bands in the bandsite.  Call this method
//   with uBand starting at 0 to begin enumerating.  Returns S_OK and the
//   band ID in *pdwBandID of the next band.
//
// IBandSite::QueryBand(dwBandID, ppstb, pdwState, pszName, cchName)
//   Get info about a band.
//
// IBandSite::SetBandState(dwBandID, dwState)
//   Set the band's state.
//
// IBandSite::RemoveBand(dwBandID)
//   Remove the band.
//
// IBandSite::GetBandObject(dwBandID, riid, ppv)
//   Get an object that support riid for the band.
//
// IBandSite::GetBandSiteInfo(pbsinfo)
//   Get info about the bandsite.
//
// IBandSite::SetBandSiteInfo(pbsinfo)
//   Set info about the bandsite.
//
//-------------------------------------------------------------------------

cpp_quote("#include <pshpack8.h>")

typedef struct tagBANDSITEINFO {
    DWORD       dwMask;         // BSIM_* flags
    DWORD       dwState;        // BSSF_* flags
    DWORD       dwStyle;        // BSIS_* flags
} BANDSITEINFO;

cpp_quote("#include <poppack.h>")   // Return to byte packing


enum {
    BSID_BANDADDED,
    BSID_BANDREMOVED,
};

// Field mask
cpp_quote("#define BSIM_STATE          0x00000001")
cpp_quote("#define BSIM_STYLE          0x00000002")

// State flags
cpp_quote("#define BSSF_VISIBLE        0x00000001")
cpp_quote("#define BSSF_NOTITLE        0x00000002")
cpp_quote("#define BSSF_UNDELETEABLE   0x00001000")

// Style flags
cpp_quote("#define BSIS_AUTOGRIPPER    0x00000000")
cpp_quote("#define BSIS_NOGRIPPER      0x00000001")
cpp_quote("#define BSIS_ALWAYSGRIPPER  0x00000002")
cpp_quote("#define BSIS_LEFTALIGN      0x00000004")
cpp_quote("#define BSIS_SINGLECLICK    0x00000008")
cpp_quote("#define BSIS_NOCONTEXTMENU  0x00000010")
cpp_quote("#define BSIS_NODROPTARGET   0x00000020")
cpp_quote("#define BSIS_NOCAPTION      0x00000040")
cpp_quote("#define BSIS_PREFERNOLINEBREAK   0x00000080")
cpp_quote("#define BSIS_LOCKED         0x00000100")

cpp_quote("#define SID_SBandSite IID_IBandSite")
cpp_quote("#define CGID_BandSite IID_IBandSite")

[
    object,
    uuid(4CF504B0-DE96-11D0-8B3F-00A0C911E8E5)
]
interface IBandSite : IUnknown
{
    HRESULT AddBand([in] IUnknown* punk);
    HRESULT EnumBands([in] UINT uBand, [out] DWORD* pdwBandID);
    HRESULT QueryBand([in] DWORD dwBandID, [out] IDeskBand** ppstb, [out] DWORD* pdwState, [out, size_is(cchName)] LPWSTR pszName, [in] int cchName);
    HRESULT SetBandState([in] DWORD dwBandID, [in] DWORD dwMask, [in] DWORD dwState);
    HRESULT RemoveBand([in] DWORD dwBandID);
    HRESULT GetBandObject([in] DWORD dwBandID, [in] REFIID riid, [out, iid_is(riid)] void **ppv);
    HRESULT SetBandSiteInfo([in] const BANDSITEINFO *pbsinfo);
    HRESULT GetBandSiteInfo([in, out] BANDSITEINFO *pbsinfo);
};

cpp_quote("#endif // _WIN32_IE >= 0x0400")

[
    uuid(d92995f8-cf5e-4a76-bf59-ead39ea2b97e),
    helpstring("shell name space walking callback interface"),
]
interface INamespaceWalkCB : IUnknown
{
    HRESULT FoundItem([in] IShellFolder *psf, [in] LPCITEMIDLIST pidl);
    HRESULT EnterFolder([in] IShellFolder *psf, [in] LPCITEMIDLIST pidl);
    HRESULT LeaveFolder([in] IShellFolder *psf, [in] LPCITEMIDLIST pidl);
    HRESULT InitializeProgressDialog([out, string] LPWSTR *ppszTitle, [out, string] LPWSTR *ppszCancel);
};

[
    uuid(57ced8a7-3f4a-432c-9350-30f24483f74f),
    helpstring("shell name space walk, used to expand data objects, views or recurse folders"),
]
interface INamespaceWalk : IUnknown
{
    enum
    {
        NSWF_NONE_IMPLIES_ALL          = 0x00000001,
        NSWF_ONE_IMPLIES_ALL           = 0x00000002,
        NSWF_DONT_TRAVERSE_LINKS       = 0x00000004,
        NSWF_DONT_ACCUMULATE_RESULT    = 0x00000008,
        NSWF_TRAVERSE_STREAM_JUNCTIONS = 0x00000010,
        NSWF_FILESYSTEM_ONLY           = 0x00000020,
        NSWF_SHOW_PROGRESS             = 0x00000040,
        NSWF_FLAG_VIEWORDER            = 0x00000080,
        NSWF_IGNORE_AUTOPLAY_HIDA      = 0x00000100,
    };
    // punkToWalk can be an IShellView site, IShellFolder or IDataObject
    HRESULT Walk([in] IUnknown *punkToWalk, [in] DWORD dwFlags, [in] int cDepth, [in] INamespaceWalkCB *pnswcb);
    HRESULT GetIDArrayResult([out] UINT *pcItems, [out, size_is(sizeof(LPITEMIDLIST *)), length_is(*pcItems)] LPITEMIDLIST **pppidl);
};


[
    uuid(A9521922-0812-4d44-9EC3-7FD38C726F3D),
    helpstring("callback objects for CRegTreeOptions items"),
    local
]
interface IRegTreeItem : IUnknown
{
    HRESULT GetCheckState([out] BOOL *pbCheck);
    HRESULT SetCheckState([in] BOOL bCheck);
};



//-------------------------------------------------------------------------
//
// IMenuPopup interface
//
//   This interface provides methods to navigate thru a menu.
//
// [Member functions]
//
// IMenuPopup::Popup(ppt, prcExclude, dwFlags)
//   Invoke the menu, located at the point *ppt (in screen coordinates).
//   The optional prcExclude points to the rectangle to exclude when
//   positioning the menu, otherwise it should be NULL.  dwFlags may be:
//
//      MDBPU_SETFOCUS: the menu can take the focus.
//
//   Returns S_OK if the object implements the popup menu as a modeless
//   menu.  Otherwise it returns S_FALSE, and the menu is finished.
//
// IMenuPopup::OnSelect(dwSelectType)
//   This method handles selection notifications.
//
// IMenuPopup::SetSubMenu(pmp, fSet)
//   Sets the given menu bar interface to be the submenu of this
//   object's interface.  Set fSet == FALSE to remove the submenu.
//
//-------------------------------------------------------------------------

// Type values for IMenuPopup::OnSelect
enum
{
    MPOS_EXECUTE = 0,           // Execute the selected menu item
    MPOS_FULLCANCEL,            // Cancel the entire menu
    MPOS_CANCELLEVEL,           // Cancel the current cascaded menu
    MPOS_SELECTLEFT,            // select one to the left of the cur selection
    MPOS_SELECTRIGHT,           // select one to the right of the cur selection
    MPOS_CHILDTRACKING          // the child got a tracking select (mouse moved over)
};

// Flags for IMenuPopup::Popup
enum
{
    MPPF_SETFOCUS       = 0x00000001,    // Menu can take the focus
    MPPF_INITIALSELECT  = 0x00000002,    // Select the first item
    MPPF_NOANIMATE      = 0x00000004,    // Do not animate this show
    MPPF_KEYBOARD       = 0x00000010,    // The menu is activated by keyboard
    MPPF_REPOSITION     = 0x00000020,    // Resposition the displayed bar.
    MPPF_FORCEZORDER    = 0x00000040,    // internal: Tells menubar to ignore Submenu positions
    MPPF_FINALSELECT    = 0x00000080,    // Select the last item
    MPPF_TOP            = 0x20000000,    // Popup menu up from point
    MPPF_LEFT           = 0x40000000,    // Popup menu left from point
    MPPF_RIGHT          = 0x60000000,    // Popup menu right from point
    MPPF_BOTTOM         = 0x80000000,    // Popup menu below point
    MPPF_POS_MASK       = 0xE0000000     // Menu Position Mask
};

[
    uuid(D1E7AFEB-6A2E-11d0-8C78-00C04FD918B4),
    object,
    pointer_default(unique),
    local
]
interface IMenuPopup : IDeskBar
{
    HRESULT Popup([in] POINTL *ppt, [in] RECTL *prcExclude, DWORD dwFlags);
    HRESULT OnSelect(DWORD dwSelectType);
    HRESULT SetSubMenu([in] IMenuPopup* pmp, BOOL fSet);
};


//  BindHandler GUIDs for IShellItem::BindToHandler (defined in shlguid.h)")
//  BHID_SFObject            restricts usage to IShellFolder::BindToObject()")
//  BHID_SFUIObject          restricts usage to IShellFolder::GetUIObjectOf()")
//  BHID_SFViewObject        restricts usage to IShellFolder::CreateViewObject()")
//  BHID_LocalCopyHelper     creates and initializes CLSID_LocalCopyHelper")
//  BHID_LinkTargetItem      CLSID_ShellItem initialized with the target this item (SFGAO_LINK only)")
//  BHID_Storage             attempts to get the stg/stm riid from BTO, but defaults to shell implementations on failure")

[
    helpstring("Shell Namespace helper"),
    uuid(43826d1e-e718-42ee-bc55-a1e261c37bfe),
    object,
    pointer_default(unique)
]
interface IShellItem : IUnknown
{
    HRESULT BindToHandler(
        [in] IBindCtx *pbc, 
        [in] REFGUID rbhid,
        [in] REFIID riid, 
        [out, iid_is(riid)] void **ppvOut);

    HRESULT GetParent([out] IShellItem **ppsi);
    
    typedef [v1_enum] enum
    {
        SIGDN_NORMALDISPLAY             = 0x00000000,
        SIGDN_PARENTRELATIVEPARSING     = 0x80018001,
        SIGDN_PARENTRELATIVEFORADDRESSBAR = 0x8001c001,
        SIGDN_DESKTOPABSOLUTEPARSING    = 0x80028000,
        SIGDN_PARENTRELATIVEEDITING     = 0x80031001,
        SIGDN_DESKTOPABSOLUTEEDITING    = 0x8004c000,
        SIGDN_FILESYSPATH               = 0x80058000,
        SIGDN_URL                       = 0x80068000,
    } SIGDN;
    
    HRESULT GetDisplayName(
        [in] SIGDN sigdnName, 
        [out, string] LPOLESTR *ppszName);
        
    HRESULT GetAttributes(
        [in] SFGAOF sfgaoMask, 
        [out] SFGAOF *psfgaoAttribs);

    //  SICHINT_DISPLAY         iOrder based on display in a folder view 
    //  SICHINT_ALLFIELDS       exact instance compare 
    //  SICHINT_CANONICAL       iOrder based on canonical name (better performance)
    [v1_enum] enum
    {
        SICHINT_DISPLAY         = 0x00000000,   
        SICHINT_ALLFIELDS       = 0x80000000,   
        SICHINT_CANONICAL       = 0x10000000,   
    };
    typedef DWORD SICHINTF;
    
    HRESULT Compare(
        [in] IShellItem *psi, 
        [in] SICHINTF hint, 
        [out] int *piOrder);
};


// image recompression object, given the cx, cy and a quality that we need go through the steps
// of creating a stream that we can give to somebody containing an image that size.  if the
// image is < that size then return S_FALSE.

[
    uuid(505f1513-6b3e-4892-a272-59f8889a4d3e),
    helpstring("Image Recompression Object"),
    pointer_default(unique),
    object
]
interface IImageRecompress : IUnknown
{
    HRESULT RecompressImage(IShellItem *psi, int cx, int cy, int iQuality, IStorage *pstg, IStream **ppstrmOut);
}


[
    helpstring("IDefViewSafety"),
    uuid(9A93B3FB-4E75-4c74-871A-2CDA667F39A5),
    object,
    pointer_default(unique)
]
interface IDefViewSafety : IUnknown
{
    HRESULT IsSafePage();
};


[
    uuid(0811AEBE-0B87-4C54-9E72-548CF649016B),
    object,
    pointer_default(unique)
]
interface IContextMenuSite : IUnknown
{
    HRESULT DoContextMenuPopup([in] IUnknown* punkContextMenu, [in] UINT fFlags, [in] POINT pt);
};

[ 
    helpstring("Modal Window"),
    uuid(b4db1657-70d7-485e-8e3e-6fcb5a5c1802),
    object,
    pointer_default(unique)
]
interface IModalWindow : IUnknown
{
    HRESULT Show([in] HWND hwndParent);
};


//
// Delegate Item IDs are in a partially known format so the delegate (inner) and 
// delgating (outer) folders share the pidl contents. the inner folder allocates
// its pidls using the IMalloc provided by the outer folder via SetItemAlloc()
// that pidl must conform to the delegate item format.
//
cpp_quote("#include <pshpack1.h>")


typedef struct tagDELEGATEITEMID 
{
    WORD cbSize;                // size of entire item ID (points to the NULL or next item)
    WORD wOuter;                // Private data owned by the outer folder
    WORD cbInner;               // Size of delegate's data
    BYTE rgb[1];                // Inner folder's data (opaque to outer folder)
                                //   followed by outer folder's data.
} DELEGATEITEMID;

cpp_quote("#include <poppack.h>")

cpp_quote("typedef const UNALIGNED DELEGATEITEMID *PCDELEGATEITEMID;")
cpp_quote("typedef UNALIGNED DELEGATEITEMID *PDELEGATEITEMID;")

[ 
    helpstring("shell name space delegate folder interface"),
    uuid(ADD8BA80-002B-11D0-8F0F-00C04FD7D062),
    object,
    pointer_default(unique)
]
interface IDelegateFolder : IUnknown
{
    // use to give the delegate folder the IMalloc interface that it
    // needs to use to alloc and free item IDs.
    // These IDs are in the form of DELEGATEITEMIDs
    // and it is the delegates job to pack its data into the pidl
    // in the delegate format
    HRESULT SetItemAlloc([in] IMalloc *pmalloc);
};


cpp_quote("// INTERFACE: IBrowserFrameOptions")
cpp_quote("//")
cpp_quote("// This interface was implemented so a browser or host can ask a ShellView/ShelNameSpace what")
cpp_quote("// kind of 'Behavior' is appropriate for that view.")
cpp_quote("//")
cpp_quote("//    IBrowserFrameOptions::GetBrowserOptions()")
cpp_quote("//       dwMask is the logical OR of bits to look for.  pdwOptions is not optional and")
cpp_quote("//       it's return value will always equal or will be a subset of dwMask.")
cpp_quote("//       If the function succeeds, the return value must be S_OK and pdwOptions needs to be filled in.")
cpp_quote("//       If the function fails, pdwOptions needs to be filled in with BFO_NONE.")
cpp_quote("//")


[
    uuid(10DF43C8-1DBE-11d3-8B34-006097DF5BD4),
    object,
    local
]
interface IBrowserFrameOptions : IUnknown
{
    typedef [unique] IBrowserFrameOptions * LPBROWSERFRAMEOPTIONS;

    enum
    {
        BFO_NONE                            = 0x00000000,      // Do nothing.
        BFO_BROWSER_PERSIST_SETTINGS        = 0x00000001,      // Does this item want the browser stream? (Same window position as IE browser windows?)
        BFO_RENAME_FOLDER_OPTIONS_TOINTERNET = 0x00000002,     // Rename "Folder Options" to "Internet Options" in the Tools or View menu?
        BFO_BOTH_OPTIONS                    = 0x00000004,      // Keep both "Folder Options" and "Internet Options" in the Tools or View menu?
        BIF_PREFER_INTERNET_SHORTCUT        = 0x00000008,      // NSE would prefer a .url shortcut over a .lnk shortcut
        BFO_BROWSE_NO_IN_NEW_PROCESS        = 0x00000010,      // Specify this flag if you don't want the "Browse in New Process" via invoking a shortcut.
        BFO_ENABLE_HYPERLINK_TRACKING       = 0x00000020,      // Does this NSE want it's display name tracked to determine when hyperlinks should be tagged as previously used?
        BFO_USE_IE_OFFLINE_SUPPORT          = 0x00000040,      // Use "Internet Explorer"'s offline support?
        BFO_SUBSTITUE_INTERNET_START_PAGE   = 0x00000080,      // Does this NSE want to use the Start Page support?
        BFO_USE_IE_LOGOBANDING              = 0x00000100,      // Use the Brand block in the Toolbar.  (Spinning globe or whatever it is this year)
        BFO_ADD_IE_TOCAPTIONBAR             = 0x00000200,      // Should " - Internet Explorer" be appended to display name in the Captionbar
        BFO_USE_DIALUP_REF                  = 0x00000400,      // Should the DialUp ref count get a ref while the browse is navigated to this location?  This will also enable the ICW and Software update.
        BFO_USE_IE_TOOLBAR                  = 0x00000800,      // Should the IE toolbar be used?
        BFO_NO_PARENT_FOLDER_SUPPORT        = 0x00001000,      // Can you NOT navigate to a parent folder?  Used for Backspace button to parent folder or the View.GoTo.ParentFolder feature.
        BFO_NO_REOPEN_NEXT_RESTART          = 0x00002000,      // Browser windows are NOT reopened the next time the shell boots if the windows were left open on the previous logoff.  Does this NSE want the same feature?
        BFO_GO_HOME_PAGE                    = 0x00004000,      // Add "Home Page" to menu (Go).
        BFO_PREFER_IEPROCESS                = 0x00008000,      // prefers to use IEXPLORE.EXE over EXPLORER.EXE
        BFO_SHOW_NAVIGATION_CANCELLED       = 0x00010000,      // If navigation is aborted, show the "Action Cancelled" HTML page.
        BFO_USE_IE_STATUSBAR                = 0x00020000,      // Use the persisted IE status bar settings
        
        BFO_QUERY_ALL                       = 0xFFFFFFFF,      // Return all values set.
    };
    typedef DWORD BROWSERFRAMEOPTIONS;

    HRESULT GetFrameOptions([in] BROWSERFRAMEOPTIONS dwMask, [out] BROWSERFRAMEOPTIONS * pdwOptions);
}

typedef enum tagNWMF
{
    NWMF_UNLOADING        = 0x0001,  // The query is occuring during onBeforeUnload or onUnload
    NWMF_USERINITED       = 0x0002,  // The query is occuring in the context of what trident considers to be a user initiated action
    NWMF_FIRST            = 0x0004,  // This is the first query since the begining of the last user initiated action
    NWMF_OVERRIDEKEY      = 0x0008,  // The override key was pressed at the time the query was made
    NWMF_SHOWHELP         = 0x0010,  // New window is an HTML help window
    NWMF_HTMLDIALOG       = 0x0020,  // New window is an HTML dialog
    NWMF_FROMDIALOGCHILD  = 0x0040,  // Called from an HTML dialog - do not show UI in parent window
    NWMF_USERREQUESTED    = 0x0080,  // There is no doubt the user requested this window (from RClick->Open in New Window, or Shift+Clicked a link)
    NWMF_USERALLOWED      = 0x0100,  // This popup is the result of the user requesting a replay that resulted in a refresh
} NWMF;
// Popup manager interface for WebOC hosts and Trident.
cpp_quote("#define SID_SNewWindowManager IID_INewWindowManager")
[
    uuid(D2BC4C84-3F72-4a52-A604-7BCBF3982CBB), 
    object,
    pointer_default(unique)
]
interface INewWindowManager : IUnknown
{
    HRESULT EvaluateNewWindow([in] LPCWSTR pszUrl, [in] LPCWSTR pszName, 
                              [in] LPCWSTR pszUrlContext, [in] LPCWSTR pszFeatures, 
                              [in] BOOL fReplace, [in] DWORD dwFlags, [in] DWORD dwUserActionTime);
}

cpp_quote("#include <pshpack8.h>")

typedef struct tagSMDATA
{
    DWORD   dwMask;             // SMDM_* values
    DWORD   dwFlags;            // Not used
    HMENU   hmenu;              // Static HMENU portion.
    HWND    hwnd;               // HWND owning the HMENU
    UINT    uId;                // Id of the item in the menu (-1 for menu itself)
    UINT    uIdParent;          // Id of the item spawning this menu
    UINT    uIdAncestor;        // Id of the very top item in the chain of ShellFolders
    IUnknown*    punk;          // IUnkown of the menuband
    LPITEMIDLIST   pidlFolder;  // pidl of the ShellFolder portion
    LPITEMIDLIST   pidlItem;    // pidl of the item in the ShellFolder portion
    IShellFolder*   psf;        // IShellFolder for the shell folder portion

    void*   pvUserData;         // User defined Data associated with a pane.

} SMDATA, *LPSMDATA;

cpp_quote("// Mask")
cpp_quote("#define SMDM_SHELLFOLDER               0x00000001  // This is for an item in the band")
cpp_quote("#define SMDM_HMENU                     0x00000002  // This is for the Band itself")
cpp_quote("#define SMDM_TOOLBAR                   0x00000004  // Plain toolbar, not associated with a shell folder or hmenu")

cpp_quote("// Flags (bitmask)")
typedef struct tagSMINFO
{
    DWORD   dwMask;     // SMIM_*
    DWORD   dwType;     // SMIT_*
    DWORD   dwFlags;    // SMIF_*
    int     iIcon;
} SMINFO, * PSMINFO;

typedef struct tagSHCSCHANGENOTIFYSTRUCT
{
    LONG            lEvent;     // Change notify Event
    LPCITEMIDLIST   pidl1;      // Pidl 1 Passed in from the Change notify
    LPCITEMIDLIST   pidl2;      // Pidl 2 Passed in from the Change notify
} SMCSHCHANGENOTIFYSTRUCT, *PSMCSHCHANGENOTIFYSTRUCT;

cpp_quote("#include <poppack.h>") // Return to byte packing

// Mask flags
enum
{
    SMIM_TYPE           = 0x00000001,
    SMIM_FLAGS          = 0x00000002,
    SMIM_ICON           = 0x00000004
};

// Types for mbiinfo.dwType
enum
{
    SMIT_SEPARATOR      = 0x00000001,
    SMIT_STRING         = 0x00000002
};

// Flags for mbiinfo.dwFlags
enum
{
    SMIF_ICON           = 0x00000001,       // Show an icon
    SMIF_ACCELERATOR    = 0x00000002,       // Underline the character marked w/ '&'
    SMIF_DROPTARGET     = 0x00000004,       // Item is a drop target
    SMIF_SUBMENU        = 0x00000008,       // Item has a submenu
    SMIF_CHECKED        = 0x00000020,       // Item has a Checkmark
    SMIF_DROPCASCADE    = 0x00000040,       // Item can cascade out during drag/drop
    SMIF_HIDDEN         = 0x00000080,       // Don't display item
    SMIF_DISABLED       = 0x00000100,       // Should be unselectable. Gray.
    SMIF_TRACKPOPUP     = 0x00000200,       // Should be unselectable. Gray.
    SMIF_DEMOTED        = 0x00000400,       // Display item in "Demoted" state.
    SMIF_ALTSTATE       = 0x00000800,       // Displayed in "Altered State"
    SMIF_DRAGNDROP      = 0x00001000,       // If item that is being dragged hovers over an item for long enough then it SMC_EXECs that item
    SMIF_NEW            = 0x00002000,       // Item is newly-installed or otherwise attractive (XP)
};


cpp_quote("#define SMC_INITMENU            0x00000001  // The callback is called to init a menuband")
cpp_quote("#define SMC_CREATE              0x00000002")
cpp_quote("#define SMC_EXITMENU            0x00000003  // The callback is called when menu is collapsing")
cpp_quote("#define SMC_GETINFO             0x00000005  // The callback is called to return DWORD values")
cpp_quote("#define SMC_GETSFINFO           0x00000006  // The callback is called to return DWORD values")
cpp_quote("#define SMC_GETOBJECT           0x00000007  // The callback is called to get some object")
cpp_quote("#define SMC_GETSFOBJECT         0x00000008  // The callback is called to get some object")
cpp_quote("#define SMC_SFEXEC              0x00000009  // The callback is called to execute an shell folder item")
cpp_quote("#define SMC_SFSELECTITEM        0x0000000A  // The callback is called when an item is selected")
cpp_quote("#define SMC_REFRESH             0x00000010  // Menus have completely refreshed. Reset your state.")
cpp_quote("#define SMC_DEMOTE              0x00000011  // Demote an item")
cpp_quote("#define SMC_PROMOTE             0x00000012  // Promote an item, wParam = SMINV_* flag")
cpp_quote("#define SMC_DEFAULTICON         0x00000016  // Returns Default icon location in wParam, index in lParam")
cpp_quote("#define SMC_NEWITEM             0x00000017  // Notifies item is not in the order stream.")
cpp_quote("#define SMC_CHEVRONEXPAND       0x00000019  // Notifies of a expansion via the chevron")
cpp_quote("#define SMC_DISPLAYCHEVRONTIP   0x0000002A  // S_OK display, S_FALSE not.")
cpp_quote("#define SMC_SETSFOBJECT         0x0000002D  // Called to save the passed object")
cpp_quote("#define SMC_SHCHANGENOTIFY      0x0000002E  // Called when a Change notify is received. lParam points to SMCSHCHANGENOTIFYSTRUCT")
cpp_quote("#define SMC_CHEVRONGETTIP       0x0000002F  // Called to get the chevron tip text. wParam = Tip title, Lparam = TipText Both MAX_PATH")
cpp_quote("#define SMC_SFDDRESTRICTED      0x00000030  // Called requesting if it's ok to drop. wParam = IDropTarget.")

[
    uuid(4CA300A1-9B8D-11d1-8B22-00C04FD918D0),
    object,
    pointer_default(unique),
    local // cannot marshal because method has polymorphic parameters
]

interface IShellMenuCallback : IUnknown
{
    // psmd is [in,out] because SMC_MAPACCELERATOR returns a value in uId
    HRESULT CallbackSM([in,out] LPSMDATA psmd, UINT uMsg, WPARAM wParam, LPARAM lParam);
};

//-------------------------------------------------------------------------
// IAttachmentExecute
[
    object,
    uuid(73db1241-1e85-4581-8e4f-a81e1d0f8c57),  // IID_IAttachmentExecute
    local,
    pointer_default(unique),
]
interface IAttachmentExecute : IUnknown
{
    // 
    //  IAttachmentExecute - COM object designed to help client applications
    //      safely manage saving and opening attachments for users.
    //      clients are assumed to have some policy/settings already 
    //      to determine the support and behavior for attachments.
    //      this API assumes that the client is interactive with the user
    //
    //  ClientTitle - (optional) caller specific title for the prompt
    //    if unset, the prompts come with a default title of "File Download"
    HRESULT SetClientTitle([in, string] LPCWSTR pszTitle);
    
    //  ClientGuid - (optional) for storing user specific settings
    //      someprompts are allowed to be avoided in the future if the user
    //      chooses.  that choice is stored on per-client basis indexed by the ClientGuid
    //
    //      Specific Example: In the User Trust Prompt there is a check box that is checked
    //      by default, but may be unchecked by the user.  this option is stored under the ClientGuid
    //      based on the file type. 
    //
    //      ClearClientState() will reset any user options stored on the clients behalf.
    HRESULT SetClientGuid([in] REFGUID guid);


    //  EVIDENCE properties

    //  LocalPath - (REQUIRED) path that would be passed to ShellExecute()
    //      if FileName was already used for the Check() and Prompt() calls,
    //      and the LocalPath points to a different handler than predicted,
    //      previous trust may be revoked, and the Policy and User trust re-verified.
    HRESULT SetLocalPath([in, string] LPCWSTR pszLocalPath);

    //  FileName - (optional) proposed name (not path) to be used to construct LocalPath 
    //  optionally use this if the caller wants to perform Check() before copying 
    //  the file to the LocalPath.  (eg, Check() proposed download)
    HRESULT SetFileName([in, string] LPCWSTR pszFileName);

    //  Source - (optional) alternate identity path or URL for a file transfer
    //      used as the primary Zone determinant.  if this is NULL default to the Restricted Zone.
    //      may also be used in the Prompt() UI for the "From" field
    //      may also be sent to handlers that can process URLs
    HRESULT SetSource([in, string] LPCWSTR pszSource);

    //  Referrer - (optional) Zone determinant for container or link types 
    //      only used for Zone/Policy 
    //      container formats like ZIP and OLE packager use the Referrer to
    //      indicate indirect inheritance and avoid Zone elevation.
    //      Shortcuts can also use it to limit elevation based on parameters
    HRESULT SetReferrer([in, string] LPCWSTR pszReferrer);

    //  CheckPolicy() - examines available evidence and checks the resultant policy
    //      * requires FileName or LocalPath
    //
    //  Returns S_OK for enable
    //          S_FALSE for prompt
    //          FAILURE for disable
    //
    HRESULT CheckPolicy();

    typedef enum tagATTACHMENT_PROMPT
    {
        ATTACHMENT_PROMPT_NONE              = 0x0000,
        ATTACHMENT_PROMPT_SAVE              = 0x0001,
        ATTACHMENT_PROMPT_EXEC              = 0x0002,             
        ATTACHMENT_PROMPT_EXEC_OR_SAVE      = 0x0003,             
    }ATTACHMENT_PROMPT;
    
    typedef enum tagATTACHMENT_ACTION
    {
        ATTACHMENT_ACTION_CANCEL            = 0x0000, 
        ATTACHMENT_ACTION_SAVE              = 0x0001,
        ATTACHMENT_ACTION_EXEC              = 0x0002,             
    }ATTACHMENT_ACTION;
    
    //  Prompt() - application can force UI at an earlier point, 
    //      even before the file has been copied to disk
    //      * requires FileName or LocalPath
    HRESULT Prompt([in] HWND hwnd, [in] ATTACHMENT_PROMPT prompt, [out] ATTACHMENT_ACTION *paction);

    //  Save() - should always be called if LocalPath is in not in a temp dir
    //      * requires valid LocalPath
    //      * called after the file has been copied to LocalPath
    //      * may run virus scanners or other trust services to validate the file.
    //          these services may delete or alter the file
    //      * may attach evidence to the LocalPath
    HRESULT Save();

    //  Execute() - will call Prompt() if necessary, with the EXEC action
    //      * requires valid LocalPath
    //      * called after the file has been copied to LocalPath
    //      * may run virus scanners or other trust services to validate the file.
    //          these services may delete or alter the file
    //      * may attach evidence to the LocalPath
    //
    //      phProcess - if non-NULL Execute() will be synchronous and return an HPROCESS if available
    //                  if null Execute() will be async, implies that you have a message pump and a long lived window
    //
    HRESULT Execute([in] HWND hwnd, [in, string] LPCWSTR pszVerb, HANDLE *phProcess);

    //   SaveWithUI() - superset of Save() that can show modal error UI, but still does not call Prompt()
    //      * requires valid LocalPath
    //      * called after the file has been copied to LocalPath
    //      * may run virus scanners or other trust services to validate the file.
    //          these services may delete or alter the file
    //      * may attach evidence to the LocalPath
    HRESULT SaveWithUI(HWND hwnd);

    //  ClearClientState() - removes any state that is stored based on the ClientGuid
    //      * requires SetClientGuid() to be called first
    HRESULT ClearClientState();
};


//-------------------------------------------------------------------------
//
// IShellMenu interface
//
//-------------------------------------------------------------------------

cpp_quote("#define SMINIT_DEFAULT              0x00000000  // No Options")
cpp_quote("#define SMINIT_RESTRICT_DRAGDROP    0x00000002  // Don't allow Drag and Drop")
cpp_quote("#define SMINIT_TOPLEVEL             0x00000004  // This is the top band.")
cpp_quote("#define SMINIT_CACHED               0x00000010")

// These are mutually Exclusive
cpp_quote("#define SMINIT_VERTICAL             0x10000000  // This is a vertical menu")
cpp_quote("#define SMINIT_HORIZONTAL           0x20000000  // This is a horizontal menu    (does not inherit)")

cpp_quote("#define ANCESTORDEFAULT      (UINT)-1")

cpp_quote("#define SMSET_TOP                   0x10000000    // Bias this namespace to the top of the menu")
cpp_quote("#define SMSET_BOTTOM                0x20000000    // Bias this namespace to the bottom of the menu")
cpp_quote("#define SMSET_DONTOWN               0x00000001    // The Menuband doesn't own the non-ref counted object")
                                                  // and should not destroy it.

cpp_quote("#define SMINV_REFRESH        0x00000001")
cpp_quote("#define SMINV_ID             0x00000008")
*/



/+
[
    uuid(EE1F7637-E138-11d1-8379-00C04FD918D0),
    object,
    pointer_default(unique), // some of our pointers can be NULL (as noted)
    local
]
interface IShellMenu : IUnknown
{
    HRESULT Initialize([in] IShellMenuCallback* psmc, UINT uId, UINT uIdAncestor, DWORD dwFlags);
    HRESULT GetMenuInfo([out] IShellMenuCallback** ppsmc, [out] UINT* puId, [out] UINT* puIdAncestor, [out] DWORD* pdwFlags);
    HRESULT SetShellFolder(IShellFolder* psf, [in] LPCITEMIDLIST pidlFolder, HKEY hKey, DWORD dwFlags);
    HRESULT GetShellFolder([out] DWORD* pdwFlags, [out] LPITEMIDLIST* ppidl, [in] REFIID riid, [out, iid_is(riid)] void** ppv);
    HRESULT SetMenu([in] HMENU hmenu, [in] HWND hwnd, DWORD dwFlags);
    HRESULT GetMenu([out /* can be null */] HMENU* phmenu, [out /* can be null */] HWND* phwnd, [out /* can be null */] DWORD* pdwFlags);
    HRESULT InvalidateItem([in /* can be null */] LPSMDATA psmd, DWORD dwFlags);
    HRESULT GetState([out] LPSMDATA psmd);
    HRESULT SetMenuToolbar([in] IUnknown* punk, DWORD dwFlags);
};



//
//  NOTE - this typelib is never registered anywhere
//  objects that want their typelibs to be registered 
//  in shell32 should add their coclass to shldisp.idl
//
[
    uuid(50a7e9b1-70ef-11d1-b75a-00a0c90564fe), // LIBID_ShellObjects
    helpstring("Microsoft Shell Objects"),
    lcid(0x0000),
    version(1.0)
]
library ShellObjects
{    
    // CLSID_QueryCancelAutoPlay
    [ uuid(331F1768-05A9-4ddd-B86E-DAE34DDC998A) ] coclass QueryCancelAutoPlay { interface IQueryCancelAutoPlay; }

    // CLSID_DriveSizeCategorizer
    [ uuid(94357B53-CA29-4b78-83AE-E8FE7409134F) ] coclass DriveSizeCategorizer { interface ICategorizer; }

    // CLSID_DriveTypeCategorizer
    [ uuid(B0A8F3CF-4333-4bab-8873-1CCB1CADA48B) ] coclass DriveTypeCategorizer { interface ICategorizer; }

    // CLSID_FreeSpaceCategorizer
    [ uuid(B5607793-24AC-44c7-82E2-831726AA6CB7) ] coclass FreeSpaceCategorizer { interface ICategorizer; }

    // CLSID_TimeCategorizer
    [ uuid(3bb4118f-ddfd-4d30-a348-9fb5d6bf1afe) ] coclass TimeCategorizer { interface ICategorizer; }

    // CLSID_SizeCategorizer
    [ uuid(55d7b852-f6d1-42f2-aa75-8728a1b2d264) ] coclass SizeCategorizer { interface ICategorizer; }

    // CLSID_AlphabeticalCategorizer
    [ uuid(3c2654c6-7372-4f6b-b310-55d6128f49d2) ] coclass AlphabeticalCategorizer { interface ICategorizer; }

    // CLSID_MergedCategorizer
    [ uuid(8e827c11-33e7-4bc1-b242-8cd9a1c2b304) ] coclass MergedCategorizer { interface ICategorizer; }

    // CLSID_ImageProperties
    [ uuid(7ab770c7-0e23-4d7a-8aa2-19bfad479829) ] coclass ImageProperties { interface IPersistFile; }

    // CLSID_ImageProperties
    [ uuid(d912f8cf-0396-4915-884e-fb425d32943b) ] coclass PropertiesUI { interface IPropertyUI; }

    // CLSID_UserNotification
    [ uuid(0010890e-8789-413c-adbc-48f5b511b3af) ] coclass UserNotification { interface IUserNotification; }

    // CLSID_UserEventTimerCallback
    [ uuid(15fffd13-5140-41b8-b89a-c8d5759cd2b2) ] coclass UserEventTimerCallback { interface IUserEventTimerCallback; }

    // CLSID_UserEventTimer
    [ uuid(864A1288-354C-4D19-9D68-C2742BB14997) ] coclass UserEventTimer { interface IUserEventTimer; }

    // CLSID_NetCrawler
    [ uuid(601ac3dc-786a-4eb0-bf40-ee3521e70bfb) ] coclass NetCrawler { interface INetCrawler; }

    // CLSID_CDBurn
    [ uuid(fbeb8a05-beee-4442-804e-409d6c4515e9) ] coclass CDBurn { interface ICDBurn; }

    // CLSID_TaskbarList
    [ uuid(56FDF344-FD6D-11d0-958A-006097C9A090) ] coclass TaskbarList { interface ITaskbarList; }

    // For supporting HTML wizard extensions we provide this object, it implements the IWizardExtenion
    // and allows the site to specific via an IPropertyBag an URL which should be displayed.  The property
    // bag is requested from the SID_WebWizardHost, and it used inturn to return parameter information
    // back to the site (eg. any information that the displayed HTML would like to communicate).
    
    // CLSID_WebWizardHost
    [ uuid(c827f149-55c1-4d28-935e-57e47caed973) ] coclass WebWizardHost { interface IWebWizardExtension; }

    // CLSID_PublishDropTarget
    [ uuid(CC6EEFFB-43F6-46c5-9619-51D571967F7D) ] coclass PublishDropTarget { interface IDropTarget; }

    // CLSID_PublishingWizard
    [ uuid(6b33163c-76a5-4b6c-bf21-45de9cd503a1) ] coclass PublishingWizard { interface IPublishingWizard; }
    cpp_quote("#define SID_PublishingWizard CLSID_PublishingWizard")

    // CLSID_InternetPrintOrdering
    [ uuid(add36aa8-751a-4579-a266-d66f5202ccbb) ] coclass InternetPrintOrdering { interface IDropTarget; }

    // CLSID_FolderViewHost
    [ uuid(20b1cb23-6968-4eb9-b7d4-a66d00d07cee) ] coclass FolderViewHost { interface IFolderViewHost; }

    // CLSID_NamespaceWalker
    [ uuid(72eb61e0-8672-4303-9175-f2e4c68b2e7c) ] coclass NamespaceWalker { interface INamespaceWalk; }

    // CLSID_ImageRecompress
    [ uuid(6e33091c-d2f8-4740-b55e-2e11d1477a2c) ] coclass ImageRecompress { interface IImageRecompress; }

    // CLSID_TrayBandSiteService
    [ uuid(F60AD0A0-E5E1-45cb-B51A-E15B9F8B2934) ] coclass TrayBandSiteService { interface IBandSite; }

    // CLSID_PassportWizard
    [ uuid(58f1f272-9240-4f51-b6d4-fd63d1618591) ] coclass PassportWizard { interface IPassportWizard; }
    
    // CLSID_AttachmentServices
    [ uuid(4125dd96-e03a-4103-8f70-e0597d803b9c) ] coclass AttachmentServices { interface IAttachmentExecute; }

};

+/
version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
