
/**
 * C's &lt;stdio.h&gt;
 * Authors: Walter Bright, Digital Mars, www.digitalmars.com
 * License: Public Domain
 * Macros:
 *	WIKI=Phobos/StdCStdio
 */

module std.c.stdio;

public import tango.stdc.stdio;

extern(C):
version (Win32)
{
    extern ubyte __fhnd_info[_NFILE];
    enum
    {
	FHND_APPEND	= 0x04,
	FHND_DEVICE	= 0x08,
	FHND_TEXT	= 0x10,
	FHND_BYTE	= 0x20,
	FHND_WCHAR	= 0x40,
    }
}

