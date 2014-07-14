// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2009  (dyuyan  gmail at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: May 2009

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/


module dwin.lab.BrowserSample;

version(LAB):

/**
    See_Also: http://svn.dsource.org/projects/core32/trunk/core32/win32/
              http://www.codeproject.com/KB/COM/cwebpage.aspx
              http://svn.dsource.org/projects/l8night/trunk/l8night/dfc/examples/browser/main.d
*/

private import org.eclipse.swt.SWT;
private import org.eclipse.swt.graphics.Color;
private import org.eclipse.swt.widgets.Composite;
private import org.eclipse.swt.widgets.Display;
private import org.eclipse.swt.widgets.Event;
private import org.eclipse.swt.widgets.Shell;
private import java.lang.all;

private import dwin.sys.win32.com.Core;
private import dwin.sys.win32.com.OleInit;
private import dwin.sys.win32.headers.all;
private import dwin.sys.win32.browser.StorageImpl;
private import dwin.sys.win32.browser.OleClientSiteImpl;
private import ComUtil = dwin.sys.win32.com.Util;
private import dwin.sys.win32.com.tlb.shdocvw : IWebBrowser2, WebBrowser;

private import tango.sys.win32.Types;
private import tango.sys.win32.UserGdi : GetClientRect;
private import dwin.sys.win32.MessageBox;
    
private import tango.io.Stdout;

pragma (lib, "ole32.lib");
pragma (lib, "uuid.lib");
pragma (lib, "oleaut32.lib");
pragma (lib, "dwin.lib");

char[] ClassName = " http://www.d-programming-language-china.org/ ";

//static const SAFEARRAYBOUND ArrayBound = {1, 0};
IOleObject browserOleObject = null; //oleidl


void main () {
    auto display = new Display ();
    auto shell = new Shell(display, SWT.SHELL_TRIM);
    auto composite = new Composite (shell, SWT.BORDER);
    composite.setSize (700, 600);
    EmbedBrowserObject(cast(HWND) composite.topHandle);
    scope(exit)
        UnEmbedBrowserObject();

    shell.open ();
    while (!shell.isDisposed()) {
        if (!display.readAndDispatch ()) display.sleep ();
    }
    display.dispose ();
}


long EmbedBrowserObject(HWND hwnd)
{
	IWebBrowser2	webBrowser2;
	RECT			rect;
	auto storage = new StorageImpl; //objidl
	IOleClientSite	oleClientSite = new OleClientSiteImpl(hwnd, &browserOleObject); //cast(GUID*) //oleidl
	
	if (ComUtil.FAILED(OleCreate(&WebBrowser.IID, &IOleObject.IID, OLERENDER_DRAW, cast(FORMATETC*)null, oleClientSite, cast(IStorage)storage, cast(void**)&browserOleObject)))
    {
		MessageBox.showWarning("OleCreate failed", "EmbedBrowserObject");
		return -2;
	}
    
	MessageBox.showInformation(null, "create ole object success", "EmbedBrowserObject");
	
	browserOleObject.SetHostNames(cast(wchar*)"My Host Name\0"w, null);
	GetClientRect(hwnd, &rect);
	if (ComUtil.FAILED(OleSetContainedObject(cast(IUnknown)browserOleObject, TRUE)))
    {
		MessageBox.showWarning(null, "set contained object failed", "EmbedBrowserObject");
		UnEmbedBrowserObject();
		return -3;
	}
	MessageBox.showInformation(null, "set contained object success", "EmbedBrowserObject");
	
	if(ComUtil.FAILED(browserOleObject.DoVerb(OLEIVERB_SHOW, null, oleClientSite, -1, hwnd, &rect)))    
    {
		MessageBox.showWarning(null, "do verb failed", "EmbedBrowserObject");
		UnEmbedBrowserObject();
		return -3;
	}
    
	MessageBox.showInformation(null, "do verb success", "EmbedBrowserObject");		
    webBrowser2 = com_cast!(IWebBrowser2)(browserOleObject);
    if(webBrowser2 is null)
    {
		MessageBox.showWarning(null, "query IID_IWebBrowser2 interface failed", "EmbedBrowserObject");
		UnEmbedBrowserObject();
		return -3;		        
    }
    scope(exit) 
        webBrowser2.Release();
    
    /*
	if(browserOleObject.QueryInterface(&IID_IWebBrowser2, cast(void**)&webBrowser2)){
		MessageBox.showWarning("query IID_IWebBrowser2 interface failed", "EmbedBrowserObject");
		UnEmbedBrowserObject();
		return -3;		
	}
    */
	MessageBox.showInformation(null, "query IID_IWebBrowser2 interface success", "EmbedBrowserObject");
	
	webBrowser2.put_Left(0);
	webBrowser2.put_Top(0);
	webBrowser2.put_Width(rect.right);
	webBrowser2.put_Height(rect.bottom);
    webBrowser2.Navigate2(&DWINVARIANT("http://www.d-programming-language-china.org/"), null, null, null, null);
	MessageBox.showInformation(null, "EmbedBrowserObject success", "EmbedBrowserObject");
	// Success
	return 0;
}


void UnEmbedBrowserObject()
{
	if ( !(browserOleObject is null) )
	{
		browserOleObject.Close(OLECLOSE_NOSAVE);
		browserOleObject.Release();
		return;
	}
	assert (false);
}

