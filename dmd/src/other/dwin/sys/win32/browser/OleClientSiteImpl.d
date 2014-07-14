// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2009  (dyuyan  gmail at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: May 2009

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module dwin.sys.win32.browser.OleClientSiteImpl;

private import dwin.sys.win32.headers.oleidl; //for IOleInPlaceSite , IOleInPlaceFrame , IOleClientSite
private import dwin.sys.win32.headers.objidl : IMoniker;   
private import dwin.sys.win32.com.Core;    

private import tango.sys.win32.Types;       


class OleClientSiteImpl : IOleClientSite, IOleInPlaceSite , IOleInPlaceFrame
{
	/*
		IOleInPlaceSite	: IOleWindow : IUnknown
		IOleInPlaceFrame : IOleInPlaceUIWindow : IOleWindow : IUnknown
		IOleClientSite : IUnknown
		IDocHostUIHandler : IUnknown
	*/
	
	private HWND hWnd;
	private IOleObject* oObj;

    //must IOleObject*, not ref
	this (HWND hwnd, IOleObject* obj){
		this.hWnd = hwnd;
		this.oObj = obj;
	}
	
	~this(){
		
	}
    
    mixin IUnknownImpl!(IOleInPlaceSite , IOleInPlaceFrame , IOleClientSite);
    /*
	HRESULT QueryInterface(ref DWINGUID riid, void** ppvObject){
		if (IsEqualGUID(&riid, &IID_IUnknown)) {
            pin("IUnknown");
			*ppvObject = cast(void*)cast(IUnknown)this;
		}else if (IsEqualGUID(&riid, &IID_IOleClientSite)) {
            pin("IOleClientSite");
			*ppvObject = cast(void*)cast(IOleClientSite)this;
		}else if (IsEqualGUID(&riid, &IID_IOleInPlaceSite)) {
            pin("pinOleInPlaceSite");
			*ppvObject = cast(void*)cast(IOleInPlaceSite)this;
		}else if (IsEqualGUID(&riid, &IID_IOleInPlaceFrame)) {
            pin("OleInPlaceFrame");
			*ppvObject = cast(void*)cast(IOleInPlaceFrame)this;
		}else if (IsEqualGUID(&riid, &IID_IDocHostUIHandler)) {
            pin("DocHostUIHandler");
			*ppvObject = cast(void*)cast(IDocHostUIHandler)this;
		}else{
            
			return E_NOINTERFACE;
		}
		return S_OK;
	}
	ULONG AddRef (){
		return 1;
	}
	ULONG Release (){
		return 1;
	}
	*/
    
	// IOleClientSite
	HRESULT SaveObject() {
        pin("SaveObject");
		return E_NOTIMPL;
	}
	HRESULT GetMoniker( DWORD dwAssign, DWORD dwWhichMoniker, out IMoniker ppmk ){
        pin("GetMoniker");
		return E_NOTIMPL;
	}
    // #1
	HRESULT GetContainer(out LPOLECONTAINER ppContainer ){
        pin("GectContainer");
		ppContainer = null;
		return E_NOINTERFACE;
	}
	HRESULT ShowObject(){
        pin("ShowObject");
		return S_OK;
	}
	HRESULT OnShowWindow( BOOL fShow ){
        pin("OnShowWindow");
		return E_NOTIMPL;
	}
	HRESULT RequestNewObjectLayout(){
        pin("RequestNewObjectLayout");
		return E_NOTIMPL;
	}    
    
	// IOleWindow 
    //#2
	HRESULT GetWindow(out HWND  phwnd ){
        pin("getWindow");
		phwnd = hWnd;
		return S_OK;
	}
	HRESULT ContextSensitiveHelp( BOOL fEnterMode ){
        pin("ContextSensitiveHelp");
		return E_NOTIMPL;
	}
	
	// IOleInPlaceSite
    // #3
	HRESULT CanInPlaceActivate(){
        pin("CanInPlaceActivate");
		return S_OK;
	}
	HRESULT OnInPlaceActivate(){
        pin("OnInPlaceActivate");
		return S_OK;
	}
	HRESULT OnUIActivate(){
        pin("OnUIActivate");
		return S_OK;
	}
    
	HRESULT GetWindowContext(out IOleInPlaceFrame ppFrame, out IOleInPlaceUIWindow ppDoc, out RECT lprcPosRect, out RECT lprcClipRect, ref OLEINPLACEFRAMEINFO lpFrameInfo ){
        pin("GetWIndowContext");
		ppFrame = cast(IOleInPlaceFrame) this;
		ppDoc = null;
		// Fill in some other info for the browser
		lpFrameInfo.cb = lpFrameInfo.sizeof;
		lpFrameInfo.fMDIApp = FALSE;
		lpFrameInfo.hwndFrame = hWnd;
		lpFrameInfo.haccel = null;
		lpFrameInfo.cAccelEntries = 0;
		return S_OK;
	}
	HRESULT Scroll( SIZE scrollExtant ){
        pin("Scroll");
		return E_NOTIMPL;
	}
    // last #2
	HRESULT OnUIDeactivate( BOOL fUndoable ){
        pin("OnUIDeactivate");
		return S_OK;
	}
    // last #1
	HRESULT OnInPlaceDeactivate(){
        pin("OnInPlaceDeactivate");
		return S_OK;
	}
	HRESULT DiscardUndoState(){
        pin("DiscardUndoState");
		return E_NOTIMPL;
	}
	HRESULT DeactivateAndUndo(){
        pin("DeactivateAndUndo");
		return E_NOTIMPL;
	}
	HRESULT OnPosRectChange(LPCRECT lprcPosRect ){
        pin("OnPosRectChange");
		IOleInPlaceObject	inplace;
        
        inplace = com_cast!(IOleInPlaceObject)(*oObj);		
        if(inplace)
        {
            inplace.SetObjectRects(lprcPosRect, lprcPosRect);
			inplace.Release();            
        }
        else
        {
            pin("onPostRectChange failed");
        }
        
        
		//IID_IOleInPlaceObject at olectlid.d(89) conflicts with oleidl.d(125) 
        /*
		if (!(*oObj).QueryInterface(IID_IOleInPlaceObject, cast(void**)&inplace) )
		{
			// Give the browser the dimensions of where it can draw.
			inplace.SetObjectRects(lprcPosRect, lprcPosRect);
			inplace.Release();
		}
        else
            Stdout.formatln("onPostRectChange failed");
        */
		return S_OK;
	}
	
	//IOleInPlaceUIWindow
	HRESULT GetBorder( out RECT lprectBorder ){
        pin("GetBorder");
		return E_NOTIMPL;
	}
	HRESULT RequestBorderSpace( LPCBORDERWIDTHS pborderwidths ){
        pin("RequestBorderSpace");
		return E_NOTIMPL;
	}
	HRESULT SetBorderSpace( LPCBORDERWIDTHS pborderwidths ) {
        pin("SetBorderSpace");
		return E_NOTIMPL;
	}
	//HRESULT SetActiveObject(LPOLEINPLACEACTIVEOBJECT,wchar*);
	HRESULT SetActiveObject( LPOLEINPLACEACTIVEOBJECT pActiveObject, wchar* pszObjName ){
        pin("SetActiveObject");
		return S_OK;
	}

	//IOleInPlaceFrame
	HRESULT InsertMenus( HMENU hmenuShared, ref OLEMENUGROUPWIDTHS lpMenuWidths ){
        pin("INsertMenus");
		return E_NOTIMPL;
	}
	HRESULT SetMenu( HMENU hmenuShared, HOLEMENU holemenu, HWND hwndActiveObject ){
        pin("SetMenu");
		return S_OK;
	}
	HRESULT RemoveMenus( HMENU hmenuShared ){
        pin("RemoveMenu");
		return E_NOTIMPL;
	}
	HRESULT SetStatusText( wchar* pszStatusText ){
        pin("SetStatusText");
		return S_OK;
	}
	HRESULT EnableModeless(BOOL b){
        pin("EnableModeless");
		return E_NOTIMPL;
	}
    //HRESULT TranslateAccelerator(LPMSG lpmsg, DWINGUID* pguid , DWORD wID) {
	HRESULT TranslateAccelerator( LPMSG lpmsg, WORD wID ){
        pin("TranslateAccelerator");
		return E_NOTIMPL;
	}

	
    /*
	//IDocHostUIHandler	
	HRESULT ShowContextMenu( DWORD dwID, POINT* ppt, IUnknown pcmdtReserved, IDispatch pdispReserved){
        pin("ShoContextMenu");
		return S_OK;
	}
	HRESULT GetHostInfo( ref DOCHOSTUIINFO pInfo ){
        pin("GetHostInfo");
		pInfo.cbSize = DOCHOSTUIINFO.sizeof;
		pInfo.dwFlags = DOCHOSTUIFLAG_NO3DBORDER;
		pInfo.dwDoubleClick = DOCHOSTUIDBLCLK_DEFAULT;   
		return S_OK;
	}
	
	HRESULT ShowUI(DWORD dwID, IOleInPlaceActiveObject pActiveObject, IOleCommandTarget pCommandTarget, IOleInPlaceFrame pFrame, IOleInPlaceUIWindow pDoc ){
        pin("ShowUI");
		return S_OK;
	}
	HRESULT HideUI(){
        pin("HideUI");
		return S_OK;
	}
	HRESULT UpdateUI(){
        pin("UpdateUI");
		return S_OK;
	}
	
	//HRESULT EnableModeless(BOOL fEnable ){
		//return S_OK;
	//}
	
	HRESULT OnDocWindowActivate( BOOL fActivate ){ 
        pin("OnDocWindowActivate");
		return S_OK;
	}
	HRESULT OnFrameWindowActivate( BOOL fActivate ){
        pin("OnFrameWindowActivate");
		return S_OK;
	}
	HRESULT ResizeBorder( LPCRECT prcBorder, IOleInPlaceUIWindow pUIWindow, BOOL fRameWindow ) {
		return S_OK;
	}   
	HRESULT TranslateAccelerator( LPMSG lpMsg, DWINGUID* pguidCmdGroup, DWORD nCmdID ) {
		return S_FALSE;
	}
	HRESULT GetOptionKeyPath( out wchar* pchKey, DWORD dw ){
		return S_FALSE;
	}
	HRESULT GetDropTarget( IDropTarget pDropTarget, out IDropTarget ppDropTarget ) {
		return S_FALSE;
	}
	HRESULT GetExternal(out IDispatch ppDispatch ){ 
		ppDispatch = null;
		return S_FALSE;
	}
	HRESULT TranslateUrl(DWORD dwTranslate, wchar* pchURLIn, out wchar* ppchURLOut ){
        
		ppchURLOut = null;
		return S_FALSE;
	}
	HRESULT FilterDataObject(IDataObject pDO, out IDataObject ppDORet ){
        pin("FilterDataObject");
		ppDORet = null;
		return S_FALSE;
	}
    */    
}




debug private import tango.io.Stdout;
    
private void pin(char[] func)
{
    debug Stdout.formatln("{} in", func);
}