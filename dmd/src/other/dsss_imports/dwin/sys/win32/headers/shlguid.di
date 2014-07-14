// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2009  (dyuyan  gmail at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: May 2009

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/


module dwin.sys.win32.headers.shlguid;

private import dwin.sys.win32.com.Core;

extern (C):
	extern const DWINGUID CLSID_ShellLink;
/*
#ifndef _SHLGUID_H_
#define _SHLGUID_H_


#ifndef _WIN32_IE
#define _WIN32_IE 0x0501
#else
#if (_WIN32_IE < 0x0400) && defined(_WIN32_WINNT) && (_WIN32_WINNT >= 0x0500)
#error _WIN32_IE setting conflicts with _WIN32_WINNT setting
#endif
#endif


#define DEFINE_SHLGUID(name, l, w1, w2) DEFINE_GUID(name, l, w1, w2, 0xC0,0,0,0,0,0,0,0x46)

DEFINE_SHLGUID(CLSID_ShellDesktop,      0x00021400L, 0, 0); // 00021400-0000-0000-C000-000000000046
DEFINE_SHLGUID(CLSID_ShellLink,         0x00021401L, 0, 0); // 00021401-0000-0000-C000-000000000046
*/
/*
DEFINE_GUID(CLSID_NetworkPlaces,        0x208D2C60, 0x3AEA, 0x1069, 0xA2,0xD7,0x08,0x00,0x2B,0x30,0x30,0x9D);//208D2C60-3AEA-1069-A2D7-08002B30309D
DEFINE_GUID(CLSID_NetworkDomain,        0x46e06680, 0x4bf0, 0x11d1, 0x83,0xee,0x00,0xa0,0xc9,0x0d,0xc8,0x49);//46e06680-4bf0-11d1-83ee-00a0c90dc849
DEFINE_GUID(CLSID_NetworkServer,        0xc0542a90, 0x4bf0, 0x11d1, 0x83,0xee,0x00,0xa0,0xc9,0x0d,0xc8,0x49);//c0542a90-4bf0-11d1-83ee-00a0c90dc849
DEFINE_GUID(CLSID_NetworkShare,         0x54a754c0, 0x4bf0, 0x11d1, 0x83,0xee,0x00,0xa0,0xc9,0x0d,0xc8,0x49);//54a754c0-4bf1-11d1-83ee-00a0c90dc849
DEFINE_GUID(CLSID_MyComputer,           0x20D04FE0, 0x3AEA, 0x1069, 0xA2,0xD8,0x08,0x00,0x2B,0x30,0x30,0x9D);//20D04FE0-3AEA-1069-A2D8-08002B30309D
DEFINE_GUID(CLSID_Internet,             0x871C5380, 0x42A0, 0x1069, 0xA2,0xEA,0x08,0x00,0x2B,0x30,0x30,0x9D);//871C5380-42A0-1069-A2EA-08002B30309D
DEFINE_GUID(CLSID_ShellFSFolder,        0xF3364BA0, 0x65B9, 0x11CE, 0xA9,0xBA,0x00,0xAA,0x00,0x4A,0xE8,0x37);//F3364BA0-65B9-11CE-A9BA-00AA004AE837
DEFINE_GUID(CLSID_RecycleBin,           0x645FF040, 0x5081, 0x101B, 0x9F,0x08,0x00,0xAA,0x00,0x2F,0x95,0x4E);//645FF040-5081-101B-9F08-00AA002F954E
DEFINE_GUID(CLSID_ControlPanel,         0x21EC2020, 0x3AEA, 0x1069, 0xA2,0xDD,0x08,0x00,0x2B,0x30,0x30,0x9D);//21EC2020-3AEA-1069-A2DD-08002B30309D
DEFINE_GUID(CLSID_Printers,             0x2227A280, 0x3AEA, 0x1069, 0xA2,0xDE,0x08,0x00,0x2B,0x30,0x30,0x9D);
DEFINE_GUID(CLSID_MyDocuments,          0x450d8fba, 0xad25, 0x11d0, 0x98,0xa8,0x08,0x00,0x36,0x1b,0x11,0x03);//450D8FBA-AD25-11D0-98A8-0800361B1103

// string version of above CLSIDs
// useful for doing psfDesktop->ParseDisplayName( L"::" L STR_MYDOCS_CLSID, ...);

#define STR_MYDOCS_CLSID   "{450D8FBA-AD25-11D0-98A8-0800361B1103}"

#if (_WIN32_IE >= 0x0400)
DEFINE_SHLGUID(CATID_BrowsableShellExt, 0x00021490L, 0, 0);
DEFINE_SHLGUID(CATID_BrowseInPlace,     0x00021491L, 0, 0);
DEFINE_SHLGUID(CATID_DeskBand,          0x00021492L, 0, 0);
DEFINE_SHLGUID(CATID_InfoBand,          0x00021493L, 0, 0);
DEFINE_SHLGUID(CATID_CommBand,          0x00021494L, 0, 0);

#endif

#define PSGUID_INTERNETSHORTCUT {0x000214A0, 0, 0, 0xC0,0,0,0,0,0,0,0x46}
DEFINE_SHLGUID(FMTID_Intshcut,          0x000214A0L, 0, 0);

#define PSGUID_INTERNETSITE {0x000214A1L, 0, 0, 0xC0,0,0,0,0,0,0,0x46}
DEFINE_SHLGUID(FMTID_InternetSite,      0x000214A1L, 0, 0);

DEFINE_SHLGUID(CGID_Explorer,           0x000214D0L, 0, 0);
DEFINE_SHLGUID(CGID_ShellDocView,       0x000214D1L, 0, 0);

#if (_WIN32_IE >= 0x0400)
DEFINE_SHLGUID(CGID_ShellServiceObject, 0x000214D2L, 0, 0);
DEFINE_SHLGUID(CGID_ExplorerBarDoc,     0x000214D3L, 0, 0);
#endif


DEFINE_SHLGUID(IID_INewShortcutHookA,   0x000214E1L, 0, 0);
DEFINE_SHLGUID(IID_IShellBrowser,       0x000214E2L, 0, 0);
DEFINE_SHLGUID(IID_IShellView,          0x000214E3L, 0, 0);
DEFINE_SHLGUID(IID_IContextMenu,        0x000214E4L, 0, 0);
DEFINE_SHLGUID(IID_IShellIcon,          0x000214E5L, 0, 0);
DEFINE_SHLGUID(IID_IShellFolder,        0x000214E6L, 0, 0);
DEFINE_SHLGUID(IID_IShellExtInit,       0x000214E8L, 0, 0);
DEFINE_SHLGUID(IID_IShellPropSheetExt,  0x000214E9L, 0, 0);
DEFINE_SHLGUID(IID_IPersistFolder,      0x000214EAL, 0, 0);
DEFINE_SHLGUID(IID_IExtractIconA,       0x000214EBL, 0, 0);
DEFINE_SHLGUID(IID_IShellDetails,       0x000214ECL, 0, 0);
DEFINE_SHLGUID(IID_IDelayedRelease,     0x000214EDL, 0, 0);
DEFINE_SHLGUID(IID_IShellLinkA,         0x000214EEL, 0, 0);
DEFINE_SHLGUID(IID_IShellCopyHookA,     0x000214EFL, 0, 0);
DEFINE_SHLGUID(IID_IFileViewerA,        0x000214F0L, 0, 0);
DEFINE_SHLGUID(IID_ICommDlgBrowser,     0x000214F1L, 0, 0);
DEFINE_SHLGUID(IID_IEnumIDList,         0x000214F2L, 0, 0);
DEFINE_SHLGUID(IID_IFileViewerSite,     0x000214F3L, 0, 0);
DEFINE_SHLGUID(IID_IContextMenu2,       0x000214F4L, 0, 0);
DEFINE_SHLGUID(IID_IShellExecuteHookA,  0x000214F5L, 0, 0);
DEFINE_SHLGUID(IID_IPropSheetPage,      0x000214F6L, 0, 0);
DEFINE_SHLGUID(IID_INewShortcutHookW,   0x000214F7L, 0, 0);
DEFINE_SHLGUID(IID_IFileViewerW,        0x000214F8L, 0, 0);
DEFINE_SHLGUID(IID_IShellLinkW,         0x000214F9L, 0, 0);
DEFINE_SHLGUID(IID_IExtractIconW,       0x000214FAL, 0, 0);
DEFINE_SHLGUID(IID_IShellExecuteHookW,  0x000214FBL, 0, 0);
DEFINE_SHLGUID(IID_IShellCopyHookW,     0x000214FCL, 0, 0);

DEFINE_SHLGUID(IID_IRemoteComputer,     0x000214FEL, 0, 0);

#define IID_ICopyHookA                  IID_IShellCopyHookA
#define IID_ICopyHookW                  IID_IShellCopyHookW

#define SID_LinkSite    IID_IShellLinkW     // IServiceProvider::QueryService() access the link object that is defering to you 

#if (_WIN32_IE >= 0x0400)
DEFINE_SHLGUID(IID_IQueryInfo,          0x00021500L, 0, 0);
#endif

DEFINE_GUID(IID_IBriefcaseStg,          0x8BCE1FA1L, 0x0921, 0x101B, 0xB1, 0xFF, 0x00, 0xDD, 0x01, 0x0C, 0xCC, 0x48);
DEFINE_GUID(IID_IShellView2,            0x88E39E80L, 0x3578, 0x11CF, 0xAE, 0x69, 0x08, 0x00, 0x2B, 0x2E, 0x12, 0x62);
DEFINE_GUID(IID_IShellLinkDataList,     0x45e2b4ae, 0xb1c3, 0x11d0, 0xb9, 0x2f, 0x0, 0xa0, 0xc9, 0x3, 0x12, 0xe1);
#if (_WIN32_IE >= 0x0500)
DEFINE_GUID(IID_IResolveShellLink,      0x5cd52983, 0x9449, 0x11d2, 0x96, 0x3a, 0x00, 0xc0, 0x4f, 0x79, 0xad, 0xf0);
#endif // _WIN32_IE >= 0x0500

#if (_WIN32_IE >= 0x0400)
DEFINE_GUID(IID_IURLSearchHook,         0xAC60F6A0L, 0x0FD9, 0x11D0, 0x99, 0xCB, 0x00, 0xC0, 0x4F, 0xD6, 0x44, 0x97);
DEFINE_GUID(IID_ISearchContext,         0x09F656A2L, 0x41AF, 0x480C, 0x88, 0xF7, 0x16, 0xCC, 0x0D, 0x16, 0x46, 0x15);
DEFINE_GUID(IID_IURLSearchHook2,        0x5ee44da4L, 0x6d32, 0x46e3, 0x86, 0xbc, 0x07, 0x54, 0x0d, 0xed, 0xd0, 0xe0);
DEFINE_GUID(IID_IDefViewID,             0x985F64F0L, 0xD410, 0x4E02, 0xBE, 0x22, 0xDA, 0x07, 0xF2, 0xB5, 0xC5, 0xE1);

// {603D3800-BD81-11d0-A3A5-00C04FD706EC}
DEFINE_GUID(CLSID_ShellTaskScheduler,   0x603d3800L, 0xbd81, 0x11d0, 0xa3, 0xa5, 0x00, 0xc0, 0x4f, 0xd7, 0x06, 0xec);
// {6CCB7BE0-6807-11d0-B810-00C04FD706EC}
DEFINE_GUID(IID_IShellTaskScheduler,    0x6ccb7be0L, 0x6807, 0x11d0, 0xb8, 0x10, 0x00, 0xc0, 0x4f, 0xd7, 0x06, 0xec);

#define IDefViewID   IUnknown

#if (_WIN32_IE >= 0x0500)
// CLSID_FolderShortcut {0AFACED1-E828-11D1-9187-B532F1E9575D}
DEFINE_GUID(CLSID_FolderShortcut,       0x0AFACED1L, 0xE828, 0x11D1, 0x91, 0x87, 0xB5, 0x32, 0xF1, 0xE9, 0x57, 0x5D);

// CLSID_StorageFolder {E773F1AF-3A65-4866-857D-846FC9C4598A}
DEFINE_GUID(CLSID_StgFolder,            0xE773F1AFL, 0x3A65, 0x4866, 0x85, 0x7D, 0x84, 0x6F, 0xC9, 0xC4, 0x59, 0x8A);
#endif


DEFINE_GUID(IID_IInputObject,           0x68284faa, 0x6a48, 0x11d0, 0x8c, 0x78, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xb4);
DEFINE_GUID(IID_IInputObjectSite,       0xf1db8392, 0x7331, 0x11d0, 0x8c, 0x99, 0x0, 0xa0, 0xc9, 0x2d, 0xbf, 0xe8);

DEFINE_GUID(IID_IDockingWindowSite,     0x2a342fc2, 0x7b26, 0x11d0, 0x8c, 0xa9, 0x0, 0xa0, 0xc9, 0x2d, 0xbf, 0xe8);
DEFINE_GUID(IID_IDockingWindowFrame,    0x47d2657a, 0x7b27, 0x11d0, 0x8c, 0xa9, 0x0, 0xa0, 0xc9, 0x2d, 0xbf, 0xe8);

DEFINE_GUID(IID_IShellIconOverlay,      0x7D688A70L, 0xC613, 0x11D0, 0x99, 0x9B, 0x00, 0xC0, 0x4F, 0xD6, 0x55, 0xE1);
DEFINE_GUID(IID_IShellIconOverlayIdentifier,  0x0C6C4200L, 0xC589, 0x11D0, 0x99, 0x9A, 0x00, 0xC0, 0x4F, 0xD6, 0x55, 0xE1);

// {10339516-2894-11d2-9039-00C04F8EEB3E}
DEFINE_GUID(IID_ICommDlgBrowser2,       0x10339516, 0x2894, 0x11d2, 0x90, 0x39, 0x0, 0xc0, 0x4f, 0x8e, 0xeb, 0x3e);

// 2047E320-F2A9-11CE-AE65-08002B2E1262
DEFINE_GUID(IID_IShellFolderViewCB, 0x2047E320L, 0xF2A9, 0x11CE, 0xAE, 0x65, 0x08, 0x00, 0x2B, 0x2E, 0x12, 0x62);
#define SID_ShellFolderViewCB IID_IShellFolderViewCB

// {CEF04FDF-FE72-11d2-87A5-00C04F6837CF}
DEFINE_GUID(IID_IPersistFolder3,        0xcef04fdf, 0xfe72, 0x11d2, 0x87, 0xa5, 0x0, 0xc0, 0x4f, 0x68, 0x37, 0xcf);

// {63B51F81-C868-11D0-999C-00C04FD655E1}
DEFINE_GUID(CLSID_CFSIconOverlayManager, 0x63B51F81L, 0xC868, 0x11D0, 0x99, 0x9C, 0x00, 0xC0, 0x4F, 0xD6, 0x55, 0xE1);


// f10b5e34-dd3b-42a7-aa7d-2f4ec54bb09b
DEFINE_GUID(IID_IShellIconOverlayManager, 0xf10b5e34L, 0xdd3b, 0x42a7, 0xaa, 0x7d, 0x2f, 0x4e, 0xc5, 0x4b, 0xb0, 0x9b);


// {85788D00-6807-11d0-B810-00C04FD706EC}
DEFINE_GUID(IID_IRunnableTask,               0x85788d00, 0x6807, 0x11d0, 0xb8, 0x10, 0x0, 0xc0, 0x4f, 0xd7, 0x6, 0xec);


// {4ea39266-7211-409f-b622-f63dbd16c533}
DEFINE_GUID(IID_IThumbnailCapture,           0x4ea39266, 0x7211, 0x409f, 0xb6, 0x22, 0xf6, 0x3d, 0xbd, 0x16, 0xc5, 0x33);


#if (_WIN32_IE >= 0x0500)
// {48C8118C-B924-11d1-98D5-00C04FB687DA}
DEFINE_GUID(IID_IShellImageStore,            0x48c8118c, 0xb924, 0x11d1, 0x98, 0xd5, 0x0, 0xc0, 0x4f, 0xb6, 0x87, 0xda);

// {6DFD582B-92E3-11d1-98A3-00C04FB687DA}
DEFINE_GUID(IID_IEnumShellImageStore,        0x6dfd582b, 0x92e3, 0x11d1, 0x98, 0xa3, 0x0, 0xc0, 0x4f, 0xb6, 0x87, 0xda);

// {1EBDCF80-A200-11d0-A3A4-00C04FD706EC}
DEFINE_GUID(CLSID_ShellThumbnailDiskCache,   0x1ebdcf80, 0xa200, 0x11d0, 0xa3, 0xa4, 0x0, 0xc0, 0x4f, 0xd7, 0x6, 0xec);

#endif


// {BCFCE0A0-EC17-11d0-8D10-00A0C90F2719}
DEFINE_GUID(IID_IContextMenu3,          0xbcfce0a0, 0xec17, 0x11d0, 0x8d, 0x10, 0x0, 0xa0, 0xc9, 0xf, 0x27, 0x19);


#endif // _WIN32_IE >= 0x0400

DEFINE_GUID(SID_DefView,                0x6D12FE80, 0x7911, 0x11CF, 0x95, 0x34, 0x00, 0x00, 0xC0, 0x5B, 0xAE, 0x0B);

DEFINE_GUID(CGID_DefView,               0x4af07f10, 0xd231, 0x11d0, 0xb9, 0x42, 0x0, 0xa0, 0xc9, 0x3, 0x12, 0xe1);

DEFINE_GUID(CLSID_MenuBand,             0x5b4dae26, 0xb807, 0x11d0, 0x98, 0x15, 0x0, 0xc0, 0x4f, 0xd9, 0x19, 0x72);

// IShellFolderBand stuff
// {7FE80CC8-C247-11d0-B93A-00A0C90312E1}
DEFINE_GUID(IID_IShellFolderBand, 0x7fe80cc8, 0xc247, 0x11d0, 0xb9, 0x3a, 0x0, 0xa0, 0xc9, 0x3, 0x12, 0xe1);
// 710EB7A0-45ED-11D0-924A-0020AFC7AC4D
DEFINE_GUID(IID_IDefViewFrame, 0x710EB7A0L, 0x45ED, 0x11D0, 0x92, 0x4A, 0x00, 0x20, 0xAF, 0xC7, 0xAC, 0x4D);


// 0057D0E0-3573-11CF-AE69-08002B2E1262
DEFINE_GUID(VID_LargeIcons, 0x0057D0E0L, 0x3573, 0x11CF, 0xAE, 0x69, 0x08, 0x00, 0x2B, 0x2E, 0x12, 0x62);
// 089000C0-3573-11CF-AE69-08002B2E1262
DEFINE_GUID(VID_SmallIcons, 0x089000C0L, 0x3573, 0x11CF, 0xAE, 0x69, 0x08, 0x00, 0x2B, 0x2E, 0x12, 0x62);
// 0E1FA5E0-3573-11CF-AE69-08002B2E1262
DEFINE_GUID(VID_List      , 0x0E1FA5E0L, 0x3573, 0x11CF, 0xAE, 0x69, 0x08, 0x00, 0x2B, 0x2E, 0x12, 0x62);
// 137E7700-3573-11CF-AE69-08002B2E1262
DEFINE_GUID(VID_Details   , 0x137E7700L, 0x3573, 0x11CF, 0xAE, 0x69, 0x08, 0x00, 0x2B, 0x2E, 0x12, 0x62);
// 5984FFE0-28D4-11CF-AE66-08002B2E1262
DEFINE_GUID(VID_Tile      , 0x65f125e5L, 0x7be1, 0x4810, 0xba, 0x9d, 0xd2, 0x71, 0xc8, 0x43, 0x2c, 0xe3);
// 65F125E5-7BE1-4810-BA9D-D271C8432CE3


// NOTE: This has to be the same as the old CLSID_Thumbnails
// {8BEBB290-52D0-11d0-B7F4-00C04FD706EC}
DEFINE_GUID(VID_Thumbnails,     0x8bebb290, 0x52d0, 0x11d0, 0xb7, 0xf4, 0x0, 0xc0, 0x4f, 0xd7, 0x6, 0xec);

// ThumbStrip
// {8EEFA624-D1E9-445B-94B7-74FBCE2EA11A}
DEFINE_GUID(VID_ThumbStrip, 0x8EEFA624, 0xD1E9, 0x445B, 0x94, 0xB7, 0x74, 0xFB, 0xCE, 0x2E, 0xA1, 0x1A);


#define SID_SShellBrowser IID_IShellBrowser
#if (_WIN32_IE >= 0x0400)
#define SID_SShellDesktop CLSID_ShellDesktop
#endif

#if (_WIN32_IE >= 0x0400)
//
//  IShellDiscardable is an IID-only interface. If the object supports this
// interface it can be discarded anytime. IWebBrowser::PutProperty QI's for
// this interface to detect discardable properties. 
//
DEFINE_GUID(IID_IDiscardableBrowserProperty, 0x49c3de7c, 0xd329, 0x11d0, 0xab, 0x73, 0x00, 0xc0, 0x4f, 0xc3, 0x3e, 0x80);

// IShellChangeNotify is a sink of LPCITEMIDLIST notification events
//
// D82BE2B1-5764-11D0-A96E-00C04FD705A2
DEFINE_GUID(IID_IShellChangeNotify, 0xD82BE2B1L, 0x5764, 0x11D0, 0xA9, 0x6E, 0x00, 0xC0, 0x4F, 0xD7, 0x05, 0xA2);

#endif // _WIN32_IE >= 0x0400

#ifdef UNICODE
#define IID_IFileViewer         IID_IFileViewerW
#define IID_IShellLink          IID_IShellLinkW
#define IID_IExtractIcon        IID_IExtractIconW
#define IID_IShellCopyHook      IID_IShellCopyHookW
#define IID_IShellExecuteHook   IID_IShellExecuteHookW
#define IID_INewShortcutHook    IID_INewShortcutHookW
#else
#define IID_IFileViewer         IID_IFileViewerA
#define IID_IShellLink          IID_IShellLinkA
#define IID_IExtractIcon        IID_IExtractIconA
#define IID_IShellCopyHook      IID_IShellCopyHookA
#define IID_IShellExecuteHook   IID_IShellExecuteHookA
#define IID_INewShortcutHook    IID_INewShortcutHookA
#endif


#ifndef NO_INTSHCUT_GUIDS
#include <isguids.h>            // internet shortcut GUIDs
#endif

#ifndef NO_SHDOCVW_GUIDS

#ifndef GUID_DEFS_ONLY
#include <exdisp.h>
#include <shldisp.h>
#endif


#if (_WIN32_IE >= 0x0400)
// UrlHistory Guids
DEFINE_GUID(CLSID_CUrlHistory,          0x3C374A40L, 0xBAE4, 0x11CF, 0xBF, 0x7D, 0x00, 0xAA, 0x00, 0x69, 0x46, 0xEE);
#define SID_SUrlHistory         CLSID_CUrlHistory

//UrlSearchHook Guids
DEFINE_GUID(CLSID_CURLSearchHook,       0xCFBFAE00L, 0x17A6, 0x11D0, 0x99, 0xCB, 0x00, 0xC0, 0x4F, 0xD6, 0x44, 0x97);


#define SID_SInternetExplorer IID_IWebBrowserApp
#define SID_SWebBrowserApp    IID_IWebBrowserApp

// AutoComplete Guids
DEFINE_GUID(IID_IAutoCompList,          0x00BB2760L, 0x6A77, 0x11D0, 0xA5, 0x35, 0x00, 0xC0, 0x4F, 0xD7, 0xD0, 0x62);
DEFINE_GUID(IID_IObjMgr,                0x00BB2761L, 0x6A77, 0x11D0, 0xA5, 0x35, 0x00, 0xC0, 0x4F, 0xD7, 0xD0, 0x62);
DEFINE_GUID(IID_IACList,                0x77A130B0L, 0x94FD, 0x11D0, 0xA5, 0x44, 0x00, 0xC0, 0x4F, 0xD7, 0xd0, 0x62);
DEFINE_GUID(IID_IACList2,               0x470141a0L, 0x5186, 0x11d2, 0xbb, 0xb6, 0x00, 0x60, 0x97, 0x7b, 0x46, 0x4c);
DEFINE_GUID(IID_ICurrentWorkingDirectory, 0x91956d21L, 0x9276, 0x11d1, 0x92, 0x1a, 0x00, 0x60, 0x97, 0xdf, 0x5b, 0xd4);     // {91956D21-9276-11d1-921A-006097DF5BD4}
DEFINE_GUID(CLSID_AutoComplete,         0x00BB2763L, 0x6A77, 0x11D0, 0xA5, 0x35, 0x00, 0xC0, 0x4F, 0xD7, 0xD0, 0x62);
DEFINE_GUID(CLSID_ACLHistory,           0x00BB2764L, 0x6A77, 0x11D0, 0xA5, 0x35, 0x00, 0xC0, 0x4F, 0xD7, 0xD0, 0x62);
DEFINE_GUID(CLSID_ACListISF,            0x03C036F1L, 0xA186, 0x11D0, 0x82, 0x4A, 0x00, 0xAA, 0x00, 0x5B, 0x43, 0x83);
DEFINE_GUID(CLSID_ACLMRU,               0x6756a641L, 0xde71, 0x11d0, 0x83, 0x1b, 0x0, 0xaa, 0x0, 0x5b, 0x43, 0x83);          // {6756A641-DE71-11d0-831B-00AA005B4383}
DEFINE_GUID(CLSID_ACLMulti,             0x00BB2765L, 0x6A77, 0x11D0, 0xA5, 0x35, 0x00, 0xC0, 0x4F, 0xD7, 0xD0, 0x62);
#if (_WIN32_IE >= 0x0600)
DEFINE_GUID(CLSID_ACLCustomMRU,      0x6935db93, 0x21e8, 0x4ccc, 0xbe, 0xb9, 0x9f, 0xe3, 0xc7, 0x7a, 0x29, 0x7a);
#endif


#if (_WIN32_IE >= 0x0500)
/// IProgressDialog
// {F8383852-FCD3-11d1-A6B9-006097DF5BD4}
DEFINE_GUID(CLSID_ProgressDialog,       0xf8383852, 0xfcd3, 0x11d1, 0xa6, 0xb9, 0x0, 0x60, 0x97, 0xdf, 0x5b, 0xd4);
// {EBBC7C04-315E-11d2-B62F-006097DF5BD4}
DEFINE_GUID(IID_IProgressDialog,        0xebbc7c04, 0x315e, 0x11d2, 0xb6, 0x2f, 0x0, 0x60, 0x97, 0xdf, 0x5b, 0xd4);
#endif // _WIN32_IE >= 0x0500

// 
// Progress objects exposed via QueryService
//
#define SID_SProgressUI CLSID_ProgressDialog


//
// Top-most browser implementation in the heirarchy. use IServiceProvider::QueryService()
// to get to interfaces (IID_IShellBrowser, IID_IBrowserService, etc.)
//
DEFINE_GUID(SID_STopLevelBrowser,       0x4C96BE40L, 0x915C, 0x11CF, 0x99, 0xD3, 0x00, 0xAA, 0x00, 0x4A, 0xE8, 0x37);

#endif // _WIN32_IE >= 0x0400

#endif // !NO_SHDOCVW_GUIDS


//B091E540-83E3-11CF-A713-0020AFD79762
DEFINE_GUID(CLSID_FileTypes, 0xB091E540, 0x83E3, 0x11CF, 0xA7,0x13,0x00,0x20,0xAF,0xD7,0x97,0x62);


#if (_WIN32_IE >= 0x0400)

// {75048700-EF1F-11D0-9888-006097DEACF9}
DEFINE_GUID( CLSID_ActiveDesktop, 0x75048700L, 0xEF1F, 0x11D0, 0x98, 0x88, 0x00, 0x60, 0x97, 0xDE, 0xAC, 0xF9);

// {F490EB00-1240-11D1-9888-006097DEACF9}
DEFINE_GUID(IID_IActiveDesktop, 0xF490EB00L, 0x1240, 0x11D1, 0x98, 0x88, 0x00, 0x60, 0x97, 0xDE, 0xAC, 0xF9);

// {52502EE0-EC80-11D0-89AB-00C04FC2972D}
DEFINE_GUID(IID_IActiveDesktopP, 0x52502EE0L, 0xEC80, 0x11D0, 0x89, 0xAB, 0x00, 0xC0, 0x4F, 0xC2, 0x97, 0x2D);

// {B22754E2-4574-11d1-9888-006097DEACF9}
DEFINE_GUID(IID_IADesktopP2, 0xb22754e2, 0x4574, 0x11d1, 0x98, 0x88, 0x0, 0x60, 0x97, 0xde, 0xac, 0xf9);


// {74C26041-70D1-11d1-B75A-00A0C90564FE}
DEFINE_GUID(IID_ISynchronizedCallBack, 0x74c26041, 0x70d1, 0x11d1, 0xb7, 0x5a, 0x0, 0xa0, 0xc9, 0x5, 0x64, 0xfe);

// Extended column handler interfaces
// {D2A105C0-87D5-11d1-8391-0000F80461CF}
DEFINE_GUID(IID_IShellDetails3,        0xd2a105c0, 0x87d5, 0x11d1, 0x83, 0x91, 0x0, 0x0, 0xf8, 0x4, 0x61, 0xcf);

//  {c46ca590-3c3f-11d2-bee6-0000f805ca57}
DEFINE_GUID(IID_IQueryAssociations,          0xc46ca590, 0x3c3f, 0x11d2, 0xbe, 0xe6, 0x00, 0x00, 0xf8, 0x05, 0xca, 0x57);

// {a07034fd-6caa-4954-ac3f-97a27216f98a}
DEFINE_GUID(CLSID_QueryAssociations, 0xa07034fd, 0x6caa, 0x4954, 0xac, 0x3f, 0x97, 0xa2, 0x72, 0x16, 0xf9, 0x8a);


// {E8025004-1C42-11d2-BE2C-00A0C9A83DA1}
DEFINE_GUID(IID_IColumnProvider,        0xe8025004, 0x1c42, 0x11d2, 0xbe, 0x2c, 0x0, 0xa0, 0xc9, 0xa8, 0x3d, 0xa1);

// {24F14F01-7B1C-11d1-838f-0000F80461CF}
DEFINE_GUID(CLSID_DocFileColumnProvider, 0x24f14f01, 0x7b1c, 0x11d1, 0x83, 0x8f, 0x0, 0x0, 0xf8, 0x4, 0x61, 0xcf);

// {24F14F02-7B1C-11d1-838f-0000F80461CF}
DEFINE_GUID(CLSID_LinkColumnProvider,    0x24f14f02, 0x7b1c, 0x11d1, 0x83, 0x8f, 0x0, 0x0, 0xf8, 0x4, 0x61, 0xcf);

// {0D2E74C4-3C34-11d2-A27E-00C04FC30871}
DEFINE_GUID(CLSID_FileSysColumnProvider, 0xd2e74c4, 0x3c34, 0x11d2, 0xa2, 0x7e, 0x0, 0xc0, 0x4f, 0xc3, 0x8, 0x71);

// For Internet Shortcut Creation Command
// The shell uses this command to allow trident to save off it's per frame data in the shortcut
// and to allow it to fire the OnPersist() event on every frame
// {93A68750-951A-11d1-946F-000000000000}
DEFINE_GUID(CGID_ShortCut, 0x93a68750, 0x951a, 0x11d1, 0x94, 0x6f, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0);


// {FB700430-952C-11d1-946F-000000000000}
DEFINE_GUID(IID_INamedPropertyBag, 0xfb700430, 0x952c, 0x11d1, 0x94, 0x6f, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0);

// {1E796980-9CC5-11D1-A83F-00C04FC99D61}
DEFINE_GUID(CLSID_InternetButtons, 0x1E796980L, 0x9CC5, 0x11D1, 0xA8, 0x3F, 0x00, 0xC0, 0x4F, 0xC9, 0x9D, 0x61);

#if (_WIN32_IE >= 0x0500)
// {178F34B8-A282-11d2-86C5-00C04F8EEA99}
DEFINE_GUID(CLSID_MSOButtons, 0x178f34b8, 0xa282, 0x11d2, 0x86, 0xc5, 0x0, 0xc0, 0x4f, 0x8e, 0xea, 0x99);

// {2CE4B5D8-A28F-11d2-86C5-00C04F8EEA99}
DEFINE_GUID(CLSID_ToolbarExtButtons, 0x2ce4b5d8, 0xa28f, 0x11d2, 0x86, 0xc5, 0x0, 0xc0, 0x4f, 0x8e, 0xea, 0x99);
#endif // _WIN32_IE >= 0x0500

// {CFCCC7A0-A282-11D1-9082-006008059382}
DEFINE_GUID(CLSID_DarwinAppPublisher, 0xCFCCC7A0L, 0xA282, 0x11D1, 0x90, 0x82, 0x00, 0x60, 0x08, 0x05, 0x93, 0x82);

// {7057E952-BD1B-11d1-8919-00C04FC2C836}
DEFINE_GUID(CLSID_DocHostUIHandler, 0x7057e952, 0xbd1b, 0x11d1, 0x89, 0x19, 0x0, 0xc0, 0x4f, 0xc2, 0xc8, 0x36);
#endif  // _WIN32_IE >= 0x0400

#if (_WIN32_IE >= 0x0500)

// {93F2F68C-1D1B-11d3-A30E-00C04F79ABD1}
DEFINE_GUID(IID_IShellFolder2,  0x93f2f68c, 0x1d1b, 0x11d3, 0xa3, 0xe, 0x0, 0xc0, 0x4f, 0x79, 0xab, 0xd1);

#define PSGUID_SHELLDETAILS     {0x28636aa6, 0x953d, 0x11d2, 0xb5, 0xd6, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xd0}
DEFINE_GUID(FMTID_ShellDetails,  0x28636aa6, 0x953d, 0x11d2, 0xb5, 0xd6, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xd0);
#define PID_FINDDATA        0
#define PID_NETRESOURCE     1
#define PID_DESCRIPTIONID   2
#define PID_WHICHFOLDER     3
#define PID_NETWORKLOCATION 4
#define PID_COMPUTERNAME    5

// PSGUID_STORAGE comes from ntquery.h
//#define PSGUID_STORAGE    {0xb725f130, 0x47ef, 0x101a, 0xa5, 0xf1, 0x02, 0x60, 0x8c, 0x9e, 0xeb, 0xac}
DEFINE_GUID(FMTID_Storage,   0xb725f130, 0x47ef, 0x101a, 0xa5, 0xf1, 0x02, 0x60, 0x8c, 0x9e, 0xeb, 0xac);

// Image properties 
#define PSGUID_IMAGEPROPERTIES {0x14b81da1, 0x0135, 0x4d31, 0x96, 0xd9, 0x6c, 0xbf, 0xc9, 0x67, 0x1a, 0x99}
DEFINE_GUID(FMTID_ImageProperties, 0x14b81da1, 0x0135, 0x4d31, 0x96, 0xd9, 0x6c, 0xbf, 0xc9, 0x67, 0x1a, 0x99);

// The GUIDs used to identify shell item attributes (columns). See IShellFolder2::GetDetailsEx implementations...

// {9B174B33-40FF-11d2-A27E-00C04FC30871}
#define PSGUID_DISPLACED    {0x9b174b33, 0x40ff, 0x11d2, 0xa2, 0x7e, 0x0, 0xc0, 0x4f, 0xc3, 0x8, 0x71}
DEFINE_GUID(FMTID_Displaced, 0x9b174b33, 0x40ff, 0x11d2, 0xa2, 0x7e, 0x0, 0xc0, 0x4f, 0xc3, 0x8, 0x71);
#define PID_DISPLACED_FROM  2
#define PID_DISPLACED_DATE  3

// {328D8B21-7729-4bfc-954C-902B329D56B0}
#define PSGUID_BRIEFCASE    {0x328d8b21, 0x7729, 0x4bfc, 0x95, 0x4c, 0x90, 0x2b, 0x32, 0x9d, 0x56, 0xb0}
DEFINE_GUID(FMTID_Briefcase, 0x328d8b21, 0x7729, 0x4bfc, 0x95, 0x4c, 0x90, 0x2b, 0x32, 0x9d, 0x56, 0xb0);
#define PID_SYNC_COPY_IN    2


// {9B174B34-40FF-11d2-A27E-00C04FC30871}
#define PSGUID_MISC    {0x9b174b34, 0x40ff, 0x11d2, 0xa2, 0x7e, 0x0, 0xc0, 0x4f, 0xc3, 0x8, 0x71}
DEFINE_GUID(FMTID_Misc, 0x9b174b34, 0x40ff, 0x11d2, 0xa2, 0x7e, 0x0, 0xc0, 0x4f, 0xc3, 0x8, 0x71);
#define PID_MISC_STATUS         2
#define PID_MISC_ACCESSCOUNT    3
#define PID_MISC_OWNER          4
#define PID_HTMLINFOTIPFILE     5
#define PID_MISC_PICS           6

// {F2275480-F782-4291-BD94-F13693513AEC}
#define PSGUID_WEBVIEW  {0xf2275480, 0xf782, 0x4291, 0xbd, 0x94, 0xf1, 0x36, 0x93, 0x51, 0x3a, 0xec}
DEFINE_GUID(FMTID_WebView, 0xf2275480, 0xf782, 0x4291, 0xbd, 0x94, 0xf1, 0x36, 0x93, 0x51, 0x3a, 0xec);
#define PID_DISPLAY_PROPERTIES  0
#define PID_INTROTEXT           1

// {56A3372E-CE9C-11d2-9F0E-006097C686F6}
#define PSGUID_MUSIC    {0x56a3372e, 0xce9c, 0x11d2, 0x9f, 0xe, 0x0, 0x60, 0x97, 0xc6, 0x86, 0xf6}
DEFINE_GUID(FMTID_MUSIC, 0x56a3372e, 0xce9c, 0x11d2, 0x9f, 0xe, 0x0, 0x60, 0x97, 0xc6, 0x86, 0xf6);
#define PIDSI_ARTIST    2
#define PIDSI_SONGTITLE 3
#define PIDSI_ALBUM     4
#define PIDSI_YEAR      5
#define PIDSI_COMMENT   6
#define PIDSI_TRACK     7
#define PIDSI_GENRE     11
#define PIDSI_LYRICS    12

// {AEAC19E4-89AE-4508-B9B7-BB867ABEE2ED}
#define PSGUID_DRM    {0xaeac19e4, 0x89ae, 0x4508, 0xb9, 0xb7, 0xbb, 0x86, 0x7a, 0xbe, 0xe2, 0xed}
DEFINE_GUID(FMTID_DRM, 0xaeac19e4, 0x89ae, 0x4508, 0xb9, 0xb7, 0xbb, 0x86, 0x7a, 0xbe, 0xe2, 0xed);
#define PIDDRSI_PROTECTED    2
#define PIDDRSI_DESCRIPTION  3
#define PIDDRSI_PLAYCOUNT    4
#define PIDDRSI_PLAYSTARTS   5
#define PIDDRSI_PLAYEXPIRES  6


#define PSGUID_VIDEO   {0x64440491, 0x4c8b, 0x11d1, 0x8b, 0x70, 0x8, 0x0, 0x36, 0xb1, 0x1a, 0x3}
//  FMTID_VideoSummaryInformation property identifiers
#define PIDVSI_STREAM_NAME      0x00000002 // "StreamName", VT_LPWSTR
#define PIDVSI_FRAME_WIDTH      0x00000003 // "FrameWidth", VT_UI4
#define PIDVSI_FRAME_HEIGHT     0x00000004 // "FrameHeight", VT_UI4
#define PIDVSI_TIMELENGTH       0x00000007 // "TimeLength", VT_UI4, milliseconds
#define PIDVSI_FRAME_COUNT      0x00000005 // "FrameCount". VT_UI4
#define PIDVSI_FRAME_RATE       0x00000006 // "FrameRate", VT_UI4, frames/millisecond
#define PIDVSI_DATA_RATE        0x00000008 // "DataRate", VT_UI4, bytes/second
#define PIDVSI_SAMPLE_SIZE      0x00000009 // "SampleSize", VT_UI4
#define PIDVSI_COMPRESSION      0x0000000A // "Compression", VT_LPWSTR
#define PIDVSI_STREAM_NUMBER    0x0000000B // "StreamNumber", VT_UI2

#define PSGUID_AUDIO   {0x64440490, 0x4c8b, 0x11d1, 0x8b, 0x70, 0x8, 0x0, 0x36, 0xb1, 0x1a, 0x3}
//  FMTID_AudioSummaryInformation property identifiers
#define PIDASI_FORMAT           0x00000002 // VT_BSTR
#define PIDASI_TIMELENGTH       0x00000003 // VT_UI4, milliseconds
#define PIDASI_AVG_DATA_RATE    0x00000004 // VT_UI4,  Hz
#define PIDASI_SAMPLE_RATE      0x00000005 // VT_UI4,  bits
#define PIDASI_SAMPLE_SIZE      0x00000006 // VT_UI4,  bits
#define PIDASI_CHANNEL_COUNT    0x00000007 // VT_UI4
#define PIDASI_STREAM_NUMBER    0x00000008 // VT_UI2
#define PIDASI_STREAM_NAME      0x00000009 // VT_LPWSTR
#define PIDASI_COMPRESSION      0x0000000A // VT_LPWSTR

// {305CA226-D286-468e-B848-2B2E8E697B74}
#define PSGUID_CONTROLPANEL {0x305ca226, 0xd286, 0x468e, 0xb8, 0x48, 0x2b, 0x2e, 0x8e, 0x69, 0x7b, 0x74}
#define PID_CONTROLPANEL_CATEGORY 2

// {9B174B35-40FF-11d2-A27E-00C04FC30871}
#define PSGUID_VOLUME    {0x9b174b35, 0x40ff, 0x11d2, 0xa2, 0x7e, 0x0, 0xc0, 0x4f, 0xc3, 0x8, 0x71}
DEFINE_GUID(FMTID_Volume, 0x9b174b35, 0x40ff, 0x11d2, 0xa2, 0x7e, 0x0, 0xc0, 0x4f, 0xc3, 0x8, 0x71);
#define PID_VOLUME_FREE         2
#define PID_VOLUME_CAPACITY     3
#define PID_VOLUME_FILESYSTEM   4

// {D8C3986F-813B-449c-845D-87B95D674ADE}
#define PSGUID_SHARE    {0xd8c3986f, 0x813b, 0x449c, 0x84, 0x5d, 0x87, 0xb9, 0x5d, 0x67, 0x4a, 0xde}
#define PID_SHARE_CSC_STATUS    2

// {B9B4B3FC-2B51-4a42-B5D8-324146AFCF25}
#define PSGUID_LINK     {0xb9b4b3fc, 0x2b51, 0x4a42, 0xb5, 0xd8, 0x32, 0x41, 0x46, 0xaf, 0xcf, 0x25}
#define PID_LINK_TARGET         2

#define PSGUID_QUERY_D {0x49691c90,0x7e17,0x101a, 0xa9,0x1c,0x08,0x00,0x2b,0x2e,0xcd,0xa9}
DEFINE_GUID(FMTID_Query, 0x49691c90,0x7e17,0x101a, 0xa9,0x1c,0x08,0x00,0x2b,0x2e,0xcd,0xa9);
#define PID_QUERY_RANK  2

// FMTID_SummaryInformation, see OLE docs for PID_ values for these
#define PSGUID_SUMMARYINFORMATION       {0xf29f85e0L, 0x4ff9, 0x1068, 0xab, 0x91, 0x08, 0x00, 0x2b, 0x27, 0xb3, 0xd9}
// FMTID_DocumentSummaryInformation, see OLE docs on the PID_ values for this
#define PSGUID_DOCUMENTSUMMARYINFORMATION {0xd5cdd502L, 0x2e9c, 0x101b, 0x93, 0x97, 0x08, 0x00, 0x2b, 0x2c, 0xf9, 0xae}

// FMTID_MediaFileSummaryInformation, see propidl.h PID_ values for this
#define PSGUID_MEDIAFILESUMMARYINFORMATION {0x64440492L, 0x4c8b, 0x11d1, 0x8b, 0x70, 0x08, 0x00, 0x36, 0xb1, 0x1a, 0x03}

// FMTID_ImageSummaryInformation,, see propidl.h PID_ values for this
#define PSGUID_IMAGESUMMARYINFORMATION {0x6444048fL, 0x4c8b, 0x11d1, 0x8b, 0x70, 0x8, 0x00, 0x36, 0xb1, 0x1a, 0x03}

// {0E700BE1-9DB6-11d1-A1CE-00C04FD75D13}
DEFINE_GUID(IID_IEnumExtraSearch,  0xe700be1, 0x9db6, 0x11d1, 0xa1, 0xce, 0x0, 0xc0, 0x4f, 0xd7, 0x5d, 0x13);

// {12518493-00B2-11d2-9FA5-9E3420524153}
DEFINE_GUID(CLSID_MountedVolume, 0x12518493, 0x00B2, 0x11d2, 0x9F, 0xA5, 0x9E, 0x34, 0x20, 0x52, 0x41, 0x53);

// {FFB8655F-81B9-4fce-B89C-9A6BA76D13E7}
DEFINE_GUID(CLSID_HWShellExecute, 0xffb8655f, 0x81b9, 0x4fce, 0xb8, 0x9c, 0x9a, 0x6b, 0xa7, 0x6d, 0x13, 0xe7);

// {12518492-00B2-11d2-9FA5-9E3420524153}
DEFINE_GUID(IID_IMountedVolume, 0x12518492, 0x00B2, 0x11d2, 0x9F, 0xA5, 0x9E, 0x34, 0x20, 0x52, 0x41, 0x53);

// {4657278A-411B-11d2-839A-00C04FD918D0}
DEFINE_GUID(CLSID_DragDropHelper,   0x4657278a, 0x411b, 0x11d2, 0x83, 0x9a, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xd0);

// {4657278B-411B-11d2-839A-00C04FD918D0}
DEFINE_GUID(IID_IDropTargetHelper,  0x4657278b, 0x411b, 0x11d2, 0x83, 0x9a, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xd0);

// {DE5BF786-477A-11d2-839D-00C04FD918D0}
DEFINE_GUID(IID_IDragSourceHelper,  0xde5bf786, 0x477a, 0x11d2, 0x83, 0x9d, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xd0);

// {3050f3BB-98b5-11cf-bb82-00aa00bdce0b}
DEFINE_GUID(CLSID_CAnchorBrowsePropertyPage, 0x3050f3BB, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b);

// {3050f3B3-98b5-11cf-bb82-00aa00bdce0b}
DEFINE_GUID(CLSID_CImageBrowsePropertyPage, 0x3050f3B3, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b);

// {3050f3B4-98b5-11cf-bb82-00aa00bdce0b}
DEFINE_GUID(CLSID_CDocBrowsePropertyPage, 0x3050f3B4, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b);

// {01E18D10-4D8B-11d2-855D-006008059367}
DEFINE_GUID(IID_IFileSystemBindData, 0x1e18d10, 0x4d8b, 0x11d2, 0x85, 0x5d, 0x0, 0x60, 0x8, 0x5, 0x93, 0x67);

// {49E1B500-4636-11d3-97F7-00C04F45D0B3}
DEFINE_GUID(SID_STopWindow, 0x49e1b500, 0x4636, 0x11d3, 0x97, 0xf7, 0x0, 0xc0, 0x4f, 0x45, 0xd0, 0xb3);

// {889A935D-971E-4B12-B90C-24DFC9E1E5E8}
DEFINE_GUID(SID_SGetViewFromViewDual, 0x889A935D, 0x971E, 0x4B12, 0xB9, 0x0C, 0x24, 0xDF, 0xC9, 0xE1, 0xE5, 0xE8);


// {FEF10FA2-355E-4e06-9381-9B24D7F7CC88}
DEFINE_GUID(CLSID_FolderItem, 0xfef10fa2, 0x355e, 0x4e06, 0x93, 0x81, 0x9b, 0x24, 0xd7, 0xf7, 0xcc, 0x88);

// {53C74826-AB99-4d33-ACA4-3117F51D3788}
DEFINE_GUID(CLSID_FolderItemsFDF, 0x53c74826, 0xab99, 0x4d33, 0xac, 0xa4, 0x31, 0x17, 0xf5, 0x1d, 0x37, 0x88);

// {D969A300-E7FF-11d0-A93B-00A0C90F2719}
DEFINE_GUID(CLSID_NewMenu,0xd969a300, 0xe7ff, 0x11d0, 0xa9, 0x3b, 0x0, 0xa0, 0xc9, 0xf, 0x27, 0x19);


//  BHIDs for IShellItem::BindToHandler()
#define BHID_LocalCopyHelper     CLSID_LocalCopyHelper
//  {3981e224-f559-11d3-8e3a-00c04f6837d5}
DEFINE_GUID(BHID_SFObject, 0x3981e224, 0xf559, 0x11d3, 0x8e, 0x3a, 0x00, 0xc0, 0x4f, 0x68, 0x37, 0xd5);
//  {3981e225-f559-11d3-8e3a-00c04f6837d5}
DEFINE_GUID(BHID_SFUIObject, 0x3981e225, 0xf559, 0x11d3, 0x8e, 0x3a, 0x00, 0xc0, 0x4f, 0x68, 0x37, 0xd5);
//  {3981e226-f559-11d3-8e3a-00c04f6837d5}
DEFINE_GUID(BHID_SFViewObject, 0x3981e226, 0xf559, 0x11d3, 0x8e, 0x3a, 0x00, 0xc0, 0x4f, 0x68, 0x37, 0xd5);
//  {3981e227-f559-11d3-8e3a-00c04f6837d5}
DEFINE_GUID(BHID_Storage, 0x3981e227, 0xf559, 0x11d3, 0x8e, 0x3a, 0x00, 0xc0, 0x4f, 0x68, 0x37, 0xd5);
// {1CEBB3AB-7C10-499a-A417-92CA16C4CB83}
DEFINE_GUID(BHID_Stream, 0x1cebb3ab, 0x7c10, 0x499a, 0xa4, 0x17, 0x92, 0xca, 0x16, 0xc4, 0xcb, 0x83);
//  {3981e228-f559-11d3-8e3a-00c04f6837d5}
DEFINE_GUID(BHID_LinkTargetItem, 0x3981e228, 0xf559, 0x11d3, 0x8e, 0x3a, 0x00, 0xc0, 0x4f, 0x68, 0x37, 0xd5);
// {4621A4E3-F0D6-4773-8A9C-46E77B174840}
DEFINE_GUID(BHID_StorageEnum, 0x4621a4e3, 0xf0d6, 0x4773, 0x8a, 0x9c, 0x46, 0xe7, 0x7b, 0x17, 0x48, 0x40);


#endif // _WIN32_IE >= 0x0500


#if _WIN32_IE >= 0x0600


// {faadfc40-b777-4b69-aa81-77035ef0e6e8}
DEFINE_GUID(SID_CtxQueryAssociations, 0xfaadfc40, 0xb777, 0x4b69, 0xaa, 0x81, 0x77, 0x03, 0x5e, 0xf0, 0xe6, 0xe8);

#endif // _WIN32_IE >= 0x0600


// {0x87D605E0L, 0xC511, 0x11CF, 0x89, 0xA9, 0x00, 0xA0, 0xC9, 0x05, 0x41, 0x29};
DEFINE_GUID(IID_IDocViewSite,     0x87D605E0, 0xC511, 0x11CF, 0x89, 0xA9, 0x00, 0xA0, 0xC9, 0x05, 0x41, 0x29);

// {0E5CBF21-D15F-11d0-8301-00AA005B4383}
DEFINE_GUID(CLSID_QuickLinks, 0xe5cbf21, 0xd15f, 0x11d0, 0x83, 0x1, 0x0, 0xaa, 0x0, 0x5b, 0x43, 0x83);

// The IShellFolder band
// D82BE2B0-5764-11D0-A96E-00C04FD705A2
DEFINE_GUID(CLSID_ISFBand,              0xD82BE2B0L, 0x5764, 0x11D0, 0xA9, 0x6E, 0x00, 0xC0, 0x4F, 0xD7, 0x05, 0xA2);

// { 0x4434FF80L, 0xEF4C, 0x11CE, { 0xAE, 0x65, 0x08, 0x00, 0x2B, 0x2E, 0x12, 0x62 } };
DEFINE_GUID(IID_CDefView,               0x4434FF80, 0xEF4C, 0x11CE, 0xAE, 0x65, 0x08, 0x00, 0x2B, 0x2E, 0x12, 0x62 );

// {6D5313C0-8C62-11D1-B2CD-006097DF8C11}
DEFINE_GUID(CLSID_ShellFldSetExt,       0x6D5313C0, 0x8C62, 0x11D1, 0xB2,0xCD,0x00,0x60,0x97,0xDF,0x8C,0x11);

DEFINE_GUID(SID_SMenuBandChild,         0xed9cc020, 0x8b9, 0x11d1, 0x98, 0x23, 0x0, 0xc0, 0x4f, 0xd9, 0x19, 0x72);

DEFINE_GUID(SID_SMenuBandParent,        0x8c278eec, 0x3eab, 0x11d1, 0x8c, 0xb0, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xd0);

// D1E7AFEB-6A2E-11d0-8C78-00C04FD918B4
DEFINE_GUID(SID_SMenuPopup,             0xD1E7AFEB, 0x6A2E, 0x11d0, 0x8C, 0x78, 0x0, 0xC0, 0x4F, 0xD9, 0x18, 0xB4);

// {165EBAF4-6D51-11d2-83AD-00C04FD918D0}
DEFINE_GUID(SID_SMenuBandBottomSelected, 0x165ebaf4, 0x6d51, 0x11d2, 0x83, 0xad, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xd0);

DEFINE_GUID(SID_SMenuBandBottom,        0x743ca664, 0xdeb, 0x11d1, 0x98, 0x25, 0x0, 0xc0, 0x4f, 0xd9, 0x19, 0x72);

// {A6C17EB4-2D65-11d2-838F-00C04FD918D0}
DEFINE_GUID(SID_MenuShellFolder,   0xa6c17eb4, 0x2d65, 0x11d2, 0x83, 0x8f, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xd0);

//Command Group ID for MenuDeskBar
// {5C9F0A12-959E-11d0-A3A4-00A0C9082636}
DEFINE_GUID(CGID_MENUDESKBAR,0x5c9f0a12, 0x959e, 0x11d0, 0xa3, 0xa4, 0x0, 0xa0, 0xc9, 0x8, 0x26, 0x36);

DEFINE_GUID(SID_SMenuBandTop,           0x9493a810, 0xec38, 0x11d0, 0xbc, 0x46, 0x0, 0xaa, 0x0, 0x6c, 0xe2, 0xf5);

// {40B96610-B522-11d1-B3B4-00AA006EFDE7}
DEFINE_GUID(CLSID_MenuToolbarBase,      0x40b96610, 0xb522, 0x11d1, 0xb3, 0xb4, 0x0, 0xaa, 0x0, 0x6e, 0xfd, 0xe7);

// {596A9A94-013E-11d1-8D34-00A0C90F2719}
DEFINE_GUID(IID_IBanneredBar,0x596a9a94, 0x13e, 0x11d1, 0x8d, 0x34, 0x0, 0xa0, 0xc9, 0xf, 0x27, 0x19);

// {E13EF4E4-D2F2-11d0-9816-00C04FD91972}
DEFINE_GUID(CLSID_MenuBandSite,             0xe13ef4e4, 0xd2f2, 0x11d0, 0x98, 0x16, 0x0, 0xc0, 0x4f, 0xd9, 0x19, 0x72);

// {80F30233-B7DF-11d2-A33B-006097DF5BD4}
DEFINE_GUID(SID_SCommDlgBrowser, 0x80f30233, 0xb7df, 0x11d2, 0xa3, 0x3b, 0x0, 0x60, 0x97, 0xdf, 0x5b, 0xd4);



#endif // _SHLGUID_H_
*/
version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
