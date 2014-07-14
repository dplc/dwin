/**
 * Macros:
 *	WIKI=Phobos/StdOutOfMemory
 * Copyright:
 *	Placed into public domain.
 *	www.digitalmars.com
 */


module std.outofmemory;
import std.compat;

public import tango.core.Exception;

extern (C) void _d_OutOfMemory()
{
    throw cast(OutOfMemoryException)
    cast(void *)
    OutOfMemoryException.classinfo.init;
}
