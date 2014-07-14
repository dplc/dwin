// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2009  (dyuyan  gmail at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: May 2009

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module dwin.sys.win32.com.OleInit;

private import dwin.sys.win32.com.Util : SUCCEEDED;
private import dwin.sys.win32.headers.ole2: OleInitialize, OleUninitialize;
    
package bool isOleAlive;

static this() {
    startupOle();
}

static ~this() {
    if(isOleAlive)
        shutdownOle();
}

void startupOle() {
  isOleAlive = SUCCEEDED(OleInitialize(null));
}

void shutdownOle() {
    isOleAlive = false;
    OleUninitialize();
}

