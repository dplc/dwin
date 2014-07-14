// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2009  (dyuyan  gmail at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: May 2009

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/


module dwin.sys.win32.headers.ole2;
pragma(lib, "ole32.lib");

private import dwin.sys.win32.com.Core;
private import tango.sys.win32.Types;  
//private import dwin.sys.win32.headers.basetyps;    
private import dwin.sys.win32.headers.objidl;    
private import dwin.sys.win32.headers.oleidl;    

//const E_DRAW = VIEW_E_DRAW;

//const DATA_E_FORMATETC = DV_E_FORMATETC;

enum {
	OLEIVERB_PRIMARY = 0,
	OLEIVERB_SHOW = -1,
	OLEIVERB_OPEN = -2,
	OLEIVERB_HIDE = -3,
	OLEIVERB_UIACTIVATE = -4,
	OLEIVERB_INPLACEACTIVATE = -5,
	OLEIVERB_DISCARDUNDOSTATE = -6
}
/*
const EMBDHLP_INPROC_HANDLER = 0x0000L;
const EMBDHLP_INPROC_SERVER  = 0x0001L;
const EMBDHLP_CREATENOW      = 0x00000000L;
const EMBDHLP_DELAYCREATE    = 0x00010000L;

align(8):
struct OLESTREAM {
	LPOLESTREAMVTBL lpstbl;
}
alias OLESTREAM* LPOLESTREAM;

extern (Windows) {
	struct OLESTREAMVTBL {
		DWORD function (LPOLESTREAM, void*, DWORD) Get;
		DWORD function (LPOLESTREAM, void*, DWORD) Put;
	}
}
alias OLESTREAMVTBL* LPOLESTREAMVTBL;
*/
extern (Windows) {
/*    
	HRESULT CreateDataAdviseHolder(LPDATAADVISEHOLDER*);
	DWORD OleBuildVersion();
	HRESULT ReadClassStg(LPSTORAGE, CLSID*);
	HRESULT WriteClassStg(LPSTORAGE, REFCLSID);
	HRESULT ReadClassStm(LPSTREAM, CLSID*);
	HRESULT WriteClassStm(LPSTREAM, REFCLSID);
	HRESULT WriteFmtUserTypeStg(LPSTORAGE, CLIPFORMAT, wchar*);
	HRESULT ReadFmtUserTypeStg(LPSTORAGE, CLIPFORMAT*, wchar**);
*/    
	HRESULT OleInitialize(void*);
	void OleUninitialize();
/*
	HRESULT OleQueryLinkFromData(IDataObject);
	HRESULT OleQueryCreateFromData(IDataObject);
*/    
	HRESULT OleCreate(DWINGUID*, DWINGUID*, DWORD, FORMATETC*, IOleClientSite, IStorage, void**);
    /*
WINOLEAPI  OleCreate(IN REFCLSID rclsid, IN REFIID riid, IN DWORD renderopt,
                IN LPFORMATETC pFormatEtc, IN LPOLECLIENTSITE pClientSite,
                IN LPSTORAGE pStg, OUT LPVOID FAR* ppvObj);

WINOLEAPI  OleCreateEx(IN REFCLSID rclsid, IN REFIID riid, IN DWORD dwFlags,
                IN DWORD renderopt, IN ULONG cFormats, IN DWORD* rgAdvf,
                IN LPFORMATETC rgFormatEtc, IN IAdviseSink FAR* lpAdviseSink,
                OUT DWORD FAR* rgdwConnection, IN LPOLECLIENTSITE pClientSite,
                IN LPSTORAGE pStg, OUT LPVOID FAR* ppvObj);    
    */
/*    
	HRESULT OleCreateFromData(IDataObject, REFIID, DWORD, LPFORMATETC, IOleClientSite, LPSTORAGE, PVOID*);
	HRESULT OleCreateLinkFromData(IDataObject, REFIID, DWORD, LPFORMATETC, IOleClientSite, LPSTORAGE, PVOID*);
	HRESULT OleCreateStaticFromData(IDataObject, REFIID, DWORD, LPFORMATETC, IOleClientSite, LPSTORAGE, PVOID*);
	HRESULT OleCreateLink(IMoniker, REFIID, DWORD, LPFORMATETC, IOleClientSite, LPSTORAGE, PVOID*);
	HRESULT OleCreateLinkToFile(wchar*, REFIID, DWORD, LPFORMATETC, IOleClientSite, LPSTORAGE, PVOID*);
	HRESULT OleCreateFromFile(REFCLSID, wchar*, REFIID, DWORD, LPFORMATETC, IOleClientSite, LPSTORAGE, PVOID*);
	HRESULT OleLoad(LPSTORAGE, REFIID, IOleClientSite, PVOID*);
	HRESULT OleSave(LPPERSISTSTORAGE, LPSTORAGE, BOOL);
	HRESULT OleLoadFromStream(LPSTREAM, REFIID, PVOID*);
	HRESULT OleSaveToStream(LPPERSISTSTREAM, LPSTREAM);
*/    
    /*WINOLEAPI  OleSetContainedObject(IN LPUNKNOWN pUnknown, IN BOOL fContained);*/
    
	HRESULT OleSetContainedObject(IUnknown, BOOL);
    
	HRESULT OleNoteObjectVisible(IUnknown, BOOL);
	HRESULT RegisterDragDrop(HWND, IDropTarget);
	HRESULT RevokeDragDrop(HWND);
    int DoDragDrop(IDataObject pDataObject, IDropSource pDropSource, uint dwOKEffects, out uint pdwEffect);
	HRESULT OleSetClipboard(IDataObject);
	HRESULT OleGetClipboard(out IDataObject);
    /*
	HRESULT OleFlushClipboard();
	HRESULT OleIsCurrentClipboard(IDataObject);
	HOLEMENU OleCreateMenuDescriptor(void*, LPOLEMENUGROUPWIDTHS);
	HRESULT OleSetMenuDescriptor(HOLEMENU, HWND, HWND, LPOLEINPLACEFRAME, LPOLEINPLACEACTIVEOBJECT);
	HRESULT OleDestroyMenuDescriptor(HOLEMENU);
	HRESULT OleTranslateAccelerator(LPOLEINPLACEFRAME, LPOLEINPLACEFRAMEINFO, LPMSG);
	HANDLE OleDuplicateData(HANDLE, CLIPFORMAT, UINT);
	HRESULT OleDraw(LPUNKNOWN, DWORD, HDC, RECT*);
	HRESULT OleRun(LPUNKNOWN);
	BOOL OleIsRunning(LPOLEOBJECT);
	HRESULT OleLockRunning(LPUNKNOWN, BOOL, BOOL);
	void ReleaseStgMedium(LPSTGMEDIUM);
	HRESULT CreateOleAdviseHolder(LPOLEADVISEHOLDER*);
	HRESULT OleCreateDefaultHandler(REFCLSID, LPUNKNOWN, REFIID, PVOID*);
	HRESULT OleCreateEmbeddingHelper(REFCLSID, LPUNKNOWN, DWORD, LPCLASSFACTORY, REFIID, PVOID*);
	BOOL IsAccelerator(HACCEL, int, LPMSG, WORD*);
	HGLOBAL OleGetIconOfFile(wchar*, BOOL);
	HGLOBAL OleGetIconOfClass(REFCLSID, wchar*, BOOL);
	HGLOBAL OleMetafilePictFromIconAndLabel(HICON, wchar*, wchar*, UINT);
	HRESULT OleRegGetUserType(REFCLSID, DWORD, wchar**);
	HRESULT OleRegGetMiscStatus(REFCLSID, DWORD, DWORD*);
	HRESULT OleRegEnumFormatEtc (REFCLSID, DWORD, LPENUMFORMATETC*);
	HRESULT OleRegEnumVerbs (REFCLSID, LPENUMOLEVERB*);
	HRESULT OleConvertOLESTREAMToIStorage(LPOLESTREAM, LPSTORAGE, DVTARGETDEVICE*);
	HRESULT OleConvertIStorageToOLESTREAM(LPSTORAGE, LPOLESTREAM);
	HRESULT GetHGlobalFromILockBytes(LPLOCKBYTES, HGLOBAL*);
	HRESULT CreateILockBytesOnHGlobal(HGLOBAL, BOOL, LPLOCKBYTES*);
	HRESULT GetHGlobalFromStream(LPSTREAM, HGLOBAL*);
    */
    int CreateStreamOnHGlobal(HANDLE hGlobal, int fDeleteOnRelease, out IStream ppstm);    
	//HRESULT CreateStreamOnHGlobal(HGLOBAL, BOOL, LPSTREAM*);
    /*
	HRESULT OleDoAutoConvert(LPSTORAGE, LPCLSID);
	HRESULT OleGetAutoConvert(REFCLSID, LPCLSID);
	HRESULT OleSetAutoConvert(REFCLSID, REFCLSID);
	HRESULT GetConvertStg(LPSTORAGE);
	HRESULT SetConvertStg(LPSTORAGE, BOOL);
	HRESULT OleConvertIStorageToOLESTREAMEx(LPSTORAGE, CLIPFORMAT, LONG, LONG, DWORD, LPSTGMEDIUM, LPOLESTREAM);
	HRESULT OleConvertOLESTREAMToIStorageEx(LPOLESTREAM, LPSTORAGE, CLIPFORMAT*, LONG*, LONG*, DWORD*, LPSTGMEDIUM);
*/    
}

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
