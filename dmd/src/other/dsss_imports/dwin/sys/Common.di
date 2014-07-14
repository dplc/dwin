/*******************************************************************************

        copyright:      Copyright (c) 2004 yidabu at gmail.com . All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: November 2005

        author:         yidabu

*******************************************************************************/

module dwin.sys.Common;

public import tango.sys.Common;

version (Win32)
        {
            public import dwin.sys.win32.UserGdi;
        }
version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
