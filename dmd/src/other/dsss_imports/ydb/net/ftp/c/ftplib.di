/* Converted to D from ftplib.h by htod */
module ydb.net.ftp.c.ftplib;

private import  tango.io.selector.AbstractSelector : timeval;
pragma(lib, "ftplib.lib");

/**
    Date: May 31, 2009
    how to build:
    1. download from 
        http://nbpfaus.net/~pfau/ftplib/
    2. added to ftplib.c
        #define _WIN32 1
    
    3. 
    ftplib.h
#elif defined(_WIN32)
#if defined BUILDING_LIBRARY
#define GLOBALDEF __declspec(dllexport)
#define GLOBALREF __declspec(dllexport)

    changed to:
#elif defined(_WIN32)
#if defined BUILDING_LIBRARY
#define GLOBALDEF __cdecl
#define GLOBALREF __cdecl    

    added:
GLOBALREF int FtpSendCmd(const char *cmd, char expresp, netbuf *nControl);
    
    ftplib.c:
    
static int FtpSendCmd(const char *cmd, char expresp, netbuf *nControl)
    changed to:
GLOBALDEF int FtpSendCmd(const char *cmd, char expresp, netbuf *nControl)

static int FtpXfer(const char *localfile, const char *path,
	netbuf *nControl, int typ, int mode)

changed to:
static int FtpXfer(const char *localfile, const char *path,
	netbuf *nControl, int typ, int mode)

    4. run
    msys
    make
    
    5. coff2omf ftplib.lib
    
    6. D:\d\dm\bin\htod.exe ftplib.h -hi
    
    7. added to ftplib.d:
    
private import tango.net.Socket : timeval;    
struct NetBuf {
    char* cput;
    char* cget;
    int handle;
    int cavail,cleft;
    char* buf;
    int dir;
    NetBuf* ctrl;
    NetBuf* data;    
    int cmode;
    timeval idletime;
    FtpCallback idlecb;
    void* idlearg;
    int xfered;
    int cbbytes;
    int xfered1;
    char[256] response;
}
int FtpSendCmd(char *cmd, char expresp, netbuf* nControl);

    

*/

/***************************************************************************/
/*									   */
/* ftplib.h - header file for callable ftp access routines                 */
/* Copyright (C) 1996, 1997 Thomas Pfau, pfau@cnj.digex.net                */
/*	73 Catherine Street, South Bound Brook, NJ, 08880		   */
/*									   */
/* This library is free software; you can redistribute it and/or	   */
/* modify it under the terms of the GNU Library General Public		   */
/* License as published by the Free Software Foundation; either		   */
/* version 2 of the License, or (at your option) any later version.	   */
/* 									   */
/* This library is distributed in the hope that it will be useful,	   */
/* but WITHOUT ANY WARRANTY; without even the implied warranty of	   */
/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU	   */
/* Library General Public License for more details.			   */
/* 									   */
/* You should have received a copy of the GNU Library General Public	   */
/* License along with this progam; if not, write to the			   */
/* Free Software Foundation, Inc., 59 Temple Place - Suite 330,		   */
/* Boston, MA 02111-1307, USA.						   */
/*									   */
/***************************************************************************/

//C     #if !defined(__FTPLIB_H)
//C     #define __FTPLIB_H

//C     #if defined(__unix__) || defined(VMS)
//C     #define GLOBALDEF
//C     #define GLOBALREF extern
//C     #elif defined(_WIN32)
//C     #if defined BUILDING_LIBRARY
//C     #define GLOBALDEF __declspec(dllexport)
//C     #define GLOBALREF __declspec(dllexport)
//C     #else
//C     #define GLOBALREF __declspec(dllimport)
//C     #endif
//C     #endif

/* FtpAccess() type codes */
//C     #define FTPLIB_DIR 1
//C     #define FTPLIB_DIR_VERBOSE 2
const FTPLIB_DIR = 1;
//C     #define FTPLIB_FILE_READ 3
const FTPLIB_DIR_VERBOSE = 2;
//C     #define FTPLIB_FILE_WRITE 4
const FTPLIB_FILE_READ = 3;

const FTPLIB_FILE_WRITE = 4;

/* FtpAccess() mode codes */
//C     #define FTPLIB_ASCII 'A'
//C     #define FTPLIB_IMAGE 'I'
//C     #define FTPLIB_TEXT FTPLIB_ASCII
//C     #define FTPLIB_BINARY FTPLIB_IMAGE
const FTPLIB_ASCII = 'A';
const FTPLIB_IMAGE = 'I';
const  FTPLIB_TEXT = FTPLIB_ASCII;

const FTPLIB_BINARY = FTPLIB_IMAGE;
/* connection modes */
//C     #define FTPLIB_PASSIVE 1
//C     #define FTPLIB_PORT 2
const FTPLIB_PASSIVE = 1;

const FTPLIB_PORT = 2;
/* connection option names */
//C     #define FTPLIB_CONNMODE 1
//C     #define FTPLIB_CALLBACK 2
const FTPLIB_CONNMODE = 1;
//C     #define FTPLIB_IDLETIME 3
const FTPLIB_CALLBACK = 2;
//C     #define FTPLIB_CALLBACKARG 4
const FTPLIB_IDLETIME = 3;
//C     #define FTPLIB_CALLBACKBYTES 5
const FTPLIB_CALLBACKARG = 4;

const FTPLIB_CALLBACKBYTES = 5;
//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     typedef struct NetBuf netbuf;
extern (C):


struct NetBuf {
    char* cput;
    char* cget;
    int handle;
    int cavail;
    int cleft;
    char* buf;
    int dir;
    NetBuf* ctrl;
    NetBuf* data;    
    int cmode;
    timeval idletime;
    FtpCallback idlecb;
    void* idlearg;
    int xfered;
    int cbbytes;
    int xfered1;
    char[256] response;
}


alias NetBuf netbuf;
//C     typedef int (*FtpCallback)(netbuf *nControl, int xfered, void *arg);
alias int  function(netbuf *nControl, int xfered, void *arg)FtpCallback;

/* v1 compatibility stuff */
//C     #if !defined(_FTPLIB_NO_COMPAT)
//C     netbuf *DefaultNetbuf;
netbuf *DefaultNetbuf;

//C     #define ftplib_lastresp FtpLastResponse(DefaultNetbuf)
//C     #define ftpInit FtpInit
//C     #define ftpOpen(x) FtpConnect(x, &DefaultNetbuf)
alias FtpInit ftpInit;
//C     #define ftpLogin(x,y) FtpLogin(x, y, DefaultNetbuf)
//C     #define ftpSite(x) FtpSite(x, DefaultNetbuf)
//C     #define ftpMkdir(x) FtpMkdir(x, DefaultNetbuf)
//C     #define ftpChdir(x) FtpChdir(x, DefaultNetbuf)
//C     #define ftpRmdir(x) FtpRmdir(x, DefaultNetbuf)
//C     #define ftpNlst(x, y) FtpNlst(x, y, DefaultNetbuf)
//C     #define ftpDir(x, y) FtpDir(x, y, DefaultNetbuf)
//C     #define ftpGet(x, y, z) FtpGet(x, y, z, DefaultNetbuf)
//C     #define ftpPut(x, y, z) FtpPut(x, y, z, DefaultNetbuf)
//C     #define ftpRename(x, y) FtpRename(x, y, DefaultNetbuf)
//C     #define ftpDelete(x) FtpDelete(x, DefaultNetbuf)
//C     #define ftpQuit() FtpQuit(DefaultNetbuf)
//C     #endif /* (_FTPLIB_NO_COMPAT) */
/* end v1 compatibility stuff */

//C     GLOBALREF int ftplib_debug;
extern int ftplib_debug;
//C     GLOBALREF void FtpInit(void);
void  FtpInit();
//C     GLOBALREF char *FtpLastResponse(netbuf *nControl);
char * FtpLastResponse(netbuf *nControl);
//C     GLOBALREF int FtpConnect(const char *host, netbuf **nControl);
int  FtpConnect(char *host, netbuf **nControl);
//C     GLOBALREF int FtpOptions(int opt, long val, netbuf *nControl);
int  FtpOptions(int opt, int val, netbuf *nControl);
//C     GLOBALREF int FtpLogin(const char *user, const char *pass, netbuf *nControl);
int  FtpLogin(char *user, char *pass, netbuf *nControl);
//C     GLOBALREF int FtpAccess(const char *path, int typ, int mode, netbuf *nControl,
//C         netbuf **nData);
int  FtpAccess(char *path, int typ, int mode, netbuf *nControl, netbuf **nData);
//C     GLOBALREF int FtpRead(void *buf, int max, netbuf *nData);
int  FtpRead(void *buf, int max, netbuf *nData);
//C     GLOBALREF int FtpWrite(void *buf, int len, netbuf *nData);
int  FtpWrite(void *buf, int len, netbuf *nData);
//C     GLOBALREF int FtpClose(netbuf *nData);
int  FtpClose(netbuf *nData);
//C     GLOBALREF int FtpSite(const char *cmd, netbuf *nControl);
int  FtpSite(char *cmd, netbuf *nControl);
//C     GLOBALREF int FtpSysType(char *buf, int max, netbuf *nControl);
int  FtpSysType(char *buf, int max, netbuf *nControl);
//C     GLOBALREF int FtpMkdir(const char *path, netbuf *nControl);
int  FtpMkdir(char *path, netbuf *nControl);
//C     GLOBALREF int FtpChdir(const char *path, netbuf *nControl);
int  FtpChdir(char *path, netbuf *nControl);
//C     GLOBALREF int FtpCDUp(netbuf *nControl);
int  FtpCDUp(netbuf *nControl);
//C     GLOBALREF int FtpRmdir(const char *path, netbuf *nControl);
int  FtpRmdir(char *path, netbuf *nControl);
//C     GLOBALREF int FtpPwd(char *path, int max, netbuf *nControl);
int  FtpPwd(char *path, int max, netbuf *nControl);
//C     GLOBALREF int FtpNlst(const char *output, const char *path, netbuf *nControl);
int  FtpNlst(char *output, char *path, netbuf *nControl);
//C     GLOBALREF int FtpDir(const char *output, const char *path, netbuf *nControl);
int  FtpDir(char *output, char *path, netbuf *nControl);
//C     GLOBALREF int FtpSize(const char *path, int *size, char mode, netbuf *nControl);
int  FtpSize(char *path, int *size, char mode, netbuf *nControl);
//C     GLOBALREF int FtpModDate(const char *path, char *dt, int max, netbuf *nControl);
int  FtpModDate(char *path, char *dt, int max, netbuf *nControl);
//C     GLOBALREF int FtpGet(const char *output, const char *path, char mode,
//C     	netbuf *nControl);
int  FtpGet(char *output, char *path, char mode, netbuf *nControl);
//C     GLOBALREF int FtpPut(const char *input, const char *path, char mode,
//C     	netbuf *nControl);
int  FtpPut(char *input, char *path, char mode, netbuf *nControl);
//C     GLOBALREF int FtpRename(const char *src, const char *dst, netbuf *nControl);
int  FtpRename(char *src, char *dst, netbuf *nControl);
//C     GLOBALREF int FtpDelete(const char *fnm, netbuf *nControl);
int  FtpDelete(char *fnm, netbuf *nControl);
//C     GLOBALREF void FtpQuit(netbuf *nControl);
void  FtpQuit(netbuf *nControl);

int FtpSendCmd(char *cmd, char expresp, netbuf* nControl);
//C     #ifdef __cplusplus
//C     };
//C     #endif

//C     #endif /* __FTPLIB_H */

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
