/* Converted to D from mkdio.h by htod */
module ydb.text.markdown.c.mkdio;
//C     #ifndef _MKDIO_D
//C     #define _MKDIO_D

//C     #include <stdio.h>
private import tango.stdc.stdio;

version(Windows) pragma(lib, "libmarkdown.lib");


//C     typedef void MMIOT;
extern (C):
alias void MMIOT;

/* line builder for markdown()
 */
//C     MMIOT *mkd_in(FILE*,int);		/* assemble input from a file */
MMIOT * mkd_in(FILE *, int );
//C     MMIOT *mkd_string(char*,int,int);	/* assemble input from a buffer */
MMIOT * mkd_string(char *, int , int );

//C     void mkd_basename(MMIOT*,char*);
void  mkd_basename(MMIOT *, char *);

/* compilation, debugging, cleanup
 */
//C     int mkd_compile(MMIOT*, int);
int  mkd_compile(MMIOT *, int );
//C     int mkd_cleanup(MMIOT*);
int  mkd_cleanup(MMIOT *);

/* markup functions
 */
//C     int mkd_dump(MMIOT*, FILE*, int, char*);
int  mkd_dump(MMIOT *, FILE *, int , char *);
//C     int markdown(MMIOT*, FILE*, int);
int  markdown(MMIOT *, FILE *, int );
//C     int mkd_line(char *, int, char **, int);
int  mkd_line(char *, int , char **, int );
//C     void mkd_string_to_anchor(char *, int, int (*)(int,void*), void*);
void  mkd_string_to_anchor(char *, int , int  function(int , void *), void *);
//C     int mkd_xhtmlpage(MMIOT*,int,FILE*);
int  mkd_xhtmlpage(MMIOT *, int , FILE *);

/* header block access
 */
//C     char* mkd_doc_title(MMIOT*);
char * mkd_doc_title(MMIOT *);
//C     char* mkd_doc_author(MMIOT*);
char * mkd_doc_author(MMIOT *);
//C     char* mkd_doc_date(MMIOT*);
char * mkd_doc_date(MMIOT *);

/* compiled data access
 */
//C     int mkd_document(MMIOT*, char**);
int  mkd_document(MMIOT *, char **);
//C     int mkd_toc(MMIOT*, char**);
int  mkd_toc(MMIOT *, char **);
//C     int mkd_css(MMIOT*, char **);
int  mkd_css(MMIOT *, char **);
//C     int mkd_xml(char *, int, char **);
int  mkd_xml(char *, int , char **);

/* write-to-file functions
 */
//C     int mkd_generatehtml(MMIOT*,FILE*);
int  mkd_generatehtml(MMIOT *, FILE *);
//C     int mkd_generatetoc(MMIOT*,FILE*);
int  mkd_generatetoc(MMIOT *, FILE *);
//C     int mkd_generatexml(char *, int,FILE*);
int  mkd_generatexml(char *, int , FILE *);
//C     int mkd_generatecss(MMIOT*,FILE*);
int  mkd_generatecss(MMIOT *, FILE *);
//C     #define mkd_style mkd_generatecss
//C     int mkd_generateline(char *, int, FILE*, int);
alias mkd_generatecss mkd_style;
int  mkd_generateline(char *, int , FILE *, int );
//C     #define mkd_text mkd_generateline

alias mkd_generateline mkd_text;
/* version#.
 */
//C     extern char markdown_version[];
extern char []markdown_version;

/* special flags for markdown() and mkd_text()
 */
//C     #define MKD_NOLINKS	0x0001	/* don't do link processing, block <a> tags  */
//C     #define MKD_NOIMAGE	0x0002	/* don't do image processing, block <img> */
const MKD_NOLINKS = 0x0001;
//C     #define MKD_NOPANTS	0x0004	/* don't run smartypants() */
const MKD_NOIMAGE = 0x0002;
//C     #define MKD_NOHTML	0x0008	/* don't allow raw html through AT ALL */
const MKD_NOPANTS = 0x0004;
//C     #define MKD_STRICT	0x0010	/* disable SUPERSCRIPT, RELAXED_EMPHASIS */
const MKD_NOHTML = 0x0008;
//C     #define MKD_TAGTEXT	0x0020	
const MKD_STRICT = 0x0010;
/* process text inside an html tag; no
				 * <em>, no <bold>, no html or [] expansion */
//C     #define MKD_NO_EXT	0x0040	/* don't allow pseudo-protocols */
const MKD_TAGTEXT = 0x0020;
//C     #define MKD_CDATA	0x0080	/* generate code for xml ![CDATA[...]] */
const MKD_NO_EXT = 0x0040;
//C     #define MKD_TOC		0x1000	/* do table-of-contents processing */
const MKD_CDATA = 0x0080;
//C     #define MKD_1_COMPAT	0x2000	/* compatability with MarkdownTest_1.0 */
const MKD_TOC = 0x1000;
//C     #define MKD_EMBED	MKD_NOLINKS|MKD_NOIMAGE|MKD_TAGTEXT
const MKD_1_COMPAT = 0x2000;

/* special flags for mkd_in() and mkd_string()
 */
//C     #define MKD_NOHEADER	0x0100	/* don't process header blocks */
//C     #define MKD_TABSTOP	0x0200	/* expand tabs to 4 spaces */
const MKD_NOHEADER = 0x0100;

const MKD_TABSTOP = 0x0200;

//C     #endif/*_MKDIO_D*/

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
