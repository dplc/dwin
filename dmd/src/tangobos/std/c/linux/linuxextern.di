
/* Written by Walter Bright.
 * www.digitalmars.com
 * Placed into public domain.
 * Linux(R) is the registered trademark of Linus Torvalds in the U.S. and other
 * countries.
 */

/* These are all the globals defined by the linux C runtime library.
 * Put them separate so they'll be externed - do not link in linuxextern.o
 */

module std.c.linux.linuxextern;
import std.compat;

extern (C)
{
    void* __libc_stack_end;
    int __data_start;
    int _end;
    int timezone;

    void *_deh_beg;
    void *_deh_end;
}

