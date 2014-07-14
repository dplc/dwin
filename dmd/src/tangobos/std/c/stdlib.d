/**
 * C's &lt;stdlib.h&gt;
 * Authors: Walter Bright, Digital Mars, www.digitalmars.com
 * License: Public Domain
 * Macros:
 *	WIKI=Phobos/StdCStdlib
 */


/* NOTE: This file has been patched from the original DMD distribution to
   work with the GDC compiler.

   Modified by David Friedman, February 2007
*/

module std.c.stdlib;
import std.compat;
import std.stdint: Clong_t;
private import std.c.stddef;
public import tango.stdc.errno:EPERM, ENOENT, ESRCH, EINTR, EIO, ENXIO, E2BIG, 
    ENOEXEC, EBADF, ECHILD, ENOMEM, EACCES, EFAULT, EBUSY, EEXIST, EXDEV, ENODEV,
    ENOTDIR, EISDIR, ENFILE, ENOTTY, EFBIG, ESPIPE, EROFS, EMLINK, EPIPE, EDOM,
    ERANGE, EDEADLK, ENAMETOOLONG, ENOLCK, ENOSYS, EILSEQ;

extern (C):

enum
{
    _MAX_PATH   = 260,
    _MAX_DRIVE  = 3,
    _MAX_DIR    = 256,
    _MAX_FNAME  = 256,
    _MAX_EXT    = 256,
}

///
struct div_t { int  quot,rem; }
///
struct ldiv_t { Clong_t quot,rem; }
///
struct lldiv_t { long quot,rem; }

    div_t div(int,int);	///
    ldiv_t ldiv(Clong_t, Clong_t); /// ditto
    lldiv_t lldiv(long, long); /// ditto

    extern(D) const int EXIT_SUCCESS = 0;	///
    extern(D) const int EXIT_FAILURE = 1;	/// ditto

    int    atexit(void (*)());	///
    void   exit(int);	/// ditto
    void   _exit(int);	/// ditto

    int system(char *);

    version (GNU)
    {
	public import gcc.builtins: alloca=__builtin_alloca;
    } else {
	void *alloca(size_t);	///
    }

    void *calloc(size_t, size_t);	///
    void *malloc(size_t);	/// ditto
    void *realloc(void *, size_t);	/// ditto
    void free(void *);	/// ditto

    void *bsearch(void *,void *,size_t,size_t,
       int function(void *,void *));	///
    void qsort(void *base, size_t nelems, size_t elemsize,
	int (*compare)(void *elem1, void *elem2));	/// ditto

    char* getenv(char*);	///
    int   setenv(char*, char*, int); /// extension to ISO C standard, not available on all platforms
    void  unsetenv(char*); /// extension to ISO C standard, not available on all platforms

    version (GNU)
    {
	public import gcc.config.libc: RAND_MAX;
    }

    int    rand();	///
    void   srand(uint);	/// ditto
    Clong_t random(int num);	/// ditto
    void   randomize();	/// ditto

    int getErrno();    /// ditto
    int setErrno(int); /// ditto

double atof(char *);	///
int    atoi(char *);	/// ditto
Clong_t atol(char *);	/// ditto
float  strtof(char *,char **);	/// ditto
double strtod(char *,char **);	/// ditto
real   strtold(char *,char **);	/// ditto
long   strtol(char *,char **,int);	/// ditto
uint   strtoul(char *,char **,int);	/// ditto
long   atoll(char *);	/// ditto
long   strtoll(char *,char **,int);	/// ditto
ulong  strtoull(char *,char **,int);	/// ditto

char* itoa(int, char*, int);	///
char* ultoa(uint, char*, int);	/// ditto

int mblen(char *s, size_t n);	///
int mbtowc(wchar_t *pwc, char *s, size_t n);	/// ditto
int wctomb(char *s, wchar_t wc);	/// ditto
size_t mbstowcs(wchar_t *pwcs, char *s, size_t n);	/// ditto
size_t wcstombs(char *s, wchar_t *pwcs, size_t n);	/// ditto
