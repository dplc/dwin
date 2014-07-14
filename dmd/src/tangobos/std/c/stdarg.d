
/**
 * C's &lt;stdarg.h&gt;
 * Authors: Hauke Duden and Walter Bright, Digital Mars, www.digitalmars.com
 * License: Public Domain
 * Macros:
 *	WIKI=Phobos/StdCStdarg
 */

/* This is for use with extern(C) variable argument lists. */

/* NOTE: This file has been patched from the original DMD distribution to
   work with the GDC compiler.

   Modified by David Friedman, September 2004
*/

module std.c.stdarg;
public import tango.core.Vararg: va_start,va_end,va_copy,va_list;
