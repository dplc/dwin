/*
ftpparse
ftpparse is discussed on the ftpparse mailing list.

The ftpparse package consists of ftpparse.c and ftpparse.h. The latest version is 20001223.

What is it?
ftpparse is a library for parsing FTP LIST responses.

ftpparse currently understands the LIST output from any UNIX server, Microsoft FTP Service, Windows NT FTP Server, VMS, WFTPD, NetPresenz, NetWare, and MSDOS. It also supports EPLF, a solution to the LIST-parsing mess.

ftpparse parses file modification times into time_t, so you can easily compare them and display them in your favorite format. It lets you know how precise the time_t is: LOCAL meaning exact with known time zone (available from EPLF), REMOTEMINUTE meaning unknown time zone and seconds, or REMOTEDAY meaning unknown time zone and time of day.

To use ftpparse, simply feed each line of LIST output to the ftpparse() routine, along with a pointer to a struct ftpparse. If ftpparse() returns 1, you can find a filename and various other useful information inside the struct ftpparse.

Commercial use of ftpparse is fine, as long as you let me know what programs you're using it in.
ftpparse has been reported to work under UNIX, under Win32 with Visual C++ 5.0, and under Win16 with Borland C++ 4.52. 


*/


/* Converted to D from ftpparse.h by htod */
module dwin.net.ftp.c.ftpparse;


// Written in the D programming language.

/*******************************************************************************        
        Version:        Initial release: Apr 2009

*******************************************************************************/

/**
    
    building lib on Windows:
    1. download and install MinGw and MSYS
    2. download ftpparse.c and ftpparse.h from http://cr.yp.to/ftpparse.html
    3. rename struct ftpparse to struct ftplistinfo that conflicts with function ftpparse(...)
    4. run MSYS
    5. run command make to generate ftpparse.a, then rename ftpparse.a to ftpparse.lib
    6. run command: coff2omf ftpparse.lib
    7. run command: htod.exe ftpparse.h -hi

*/


//C     #ifndef FTPPARSE_H
//C     #define FTPPARSE_H

/*
ftpparse(&fp,buf,len) tries to parse one line of LIST output.

The line is an array of len characters stored in buf.
It should not include the terminating CR LF; so buf[len] is typically CR.

If ftpparse() can't find a filename, it returns 0.

If ftpparse() can find a filename, it fills in fp and returns 1.
fp is a struct ftpparse, defined below.
The name is an array of fp.namelen characters stored in fp.name;
fp.name points somewhere within buf.
*/

//C     struct ftplistinfo {
//C       char *name; /* not necessarily 0-terminated */
//C       int namelen;
//C       int flagtrycwd; /* 0 if cwd is definitely pointless, 1 otherwise */
//C       int flagtryretr; /* 0 if retr is definitely pointless, 1 otherwise */
//C       int sizetype;
//C       long size; /* number of octets */
//C       int mtimetype;
//C       time_t mtime; /* modification time */
//C       int idtype;
//C       char *id; /* not necessarily 0-terminated */
//C       int idlen;
//C     } ;
struct ftplistinfo
{
    char *name;
    int namelen;
    int flagtrycwd;
    int flagtryretr;
    int sizetype;
    int size;
    int mtimetype;
    int mtime;
    int idtype;
    char *id;
    int idlen;
}

//C     #define FTPPARSE_SIZE_UNKNOWN 0
//C     #define FTPPARSE_SIZE_BINARY 1 /* size is the number of octets in TYPE I */
const FTPPARSE_SIZE_UNKNOWN = 0;
//C     #define FTPPARSE_SIZE_ASCII 2 /* size is the number of octets in TYPE A */
const FTPPARSE_SIZE_BINARY = 1;

const FTPPARSE_SIZE_ASCII = 2;
//C     #define FTPPARSE_MTIME_UNKNOWN 0
//C     #define FTPPARSE_MTIME_LOCAL 1 /* time is correct */
const FTPPARSE_MTIME_UNKNOWN = 0;
//C     #define FTPPARSE_MTIME_REMOTEMINUTE 2 /* time zone and secs are unknown */
const FTPPARSE_MTIME_LOCAL = 1;
//C     #define FTPPARSE_MTIME_REMOTEDAY 3 /* time zone and time of day are unknown */
const FTPPARSE_MTIME_REMOTEMINUTE = 2;

const FTPPARSE_MTIME_REMOTEDAY = 3;
/*
When a time zone is unknown, it is assumed to be GMT. You may want
to use localtime() for LOCAL times, along with an indication that the
time is correct in the local time zone, and gmtime() for REMOTE* times.
*/

//C     #define FTPPARSE_ID_UNKNOWN 0
//C     #define FTPPARSE_ID_FULL 1 /* unique identifier for files on this FTP server */
const FTPPARSE_ID_UNKNOWN = 0;

const FTPPARSE_ID_FULL = 1;
//C     extern int ftpparse(struct ftplistinfo *,char *,int);
extern (C):
int  ftpparse(ftplistinfo *, char *, int );

//C     #endif

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
