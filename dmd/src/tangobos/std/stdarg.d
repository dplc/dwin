
/*
 * Placed in public domain.
 * Written by Hauke Duden and Walter Bright
 * Changed by Lars Ivar Igesund
 */

/* This is for use with variable argument lists with extern(D) linkage. */

/* NOTE: This file has been patched from the original DMD distribution to
   work with the GDC compiler.

   Modified by David Friedman, September 2004
*/
module std.stdarg;

version (GNU) {
    // va_list might be a pointer, but assuming so is not portable.
    private import gcc.builtins;
    alias __builtin_va_list va_list;
    
    // va_arg is handled magically by the compiler
} else {
    public import tango.core.Vararg: va_start,va_end,va_copy,va_list;
}

/**
 * This function is here because of gdc bug 1949
 * http://d.puremagic.com/issues/show_bug.cgi?id=1949
 * otherwise one should be able to just include Vararg here
 */
template va_arg(T)
{
    T va_arg(inout va_list _argptr)
    {
		version(DigitalMars){
			T arg = *cast(T*)_argptr;
			_argptr = _argptr + ((T.sizeof + int.sizeof - 1) & ~(int.sizeof - 1));
			return arg;
		} else {
			T t; return t;
	    }
    }
}

/* The existence of std.stdarg.va_copy isn't standard.  Prevent
   conflicts by using '__'. */
public import std.c.stdarg: __va_copy=va_copy;
