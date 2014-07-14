// Standard OLE Types
// Version 2.0

/*[uuid("bef6e001-a874-101a-8bba-00aa00300cab")]*/
//module dwin.sys.win32.com.tlb.stdtype;
module dwin.sys.win32.com.tlb.olepro32;

/*[importlib("stdole32.tlb")]*/
private import dwin.sys.win32.com.Core;
private import dwin.sys.win32.com.tlb.stdole2;

// Enums

enum OLE_TRISTATE {
  Unchecked = 0x00000000,
  Checked = 0x00000001,
  Gray = 0x00000002,
}

// Aliases

alias uint OLE_COLOR;

alias int OLE_XPOS_PIXELS;

alias int OLE_YPOS_PIXELS;

alias int OLE_XSIZE_PIXELS;

alias int OLE_YSIZE_PIXELS;

alias int OLE_XPOS_HIMETRIC;

alias int OLE_YPOS_HIMETRIC;

alias int OLE_XSIZE_HIMETRIC;

alias int OLE_YSIZE_HIMETRIC;

alias float OLE_XPOS_CONTAINER;

alias float OLE_YPOS_CONTAINER;

alias float OLE_XSIZE_CONTAINER;

alias float OLE_YSIZE_CONTAINER;

alias int OLE_HANDLE;

alias short OLE_OPTEXCLUSIVE;

alias short OLE_CANCELBOOL;

alias short OLE_ENABLEDEFAULTBOOL;

alias wchar* FONTNAME;

alias long FONTSIZE;

alias short FONTBOLD;

alias short FONTITALIC;

alias short FONTUNDERSCORE;

alias short FONTSTRIKETHROUGH;

alias Font IFontDisp;

alias Picture IPictureDisp;

// Interfaces

// Font Object
interface IFont : IUnknown {
  mixin(uuid("bef6e002-a874-101a-8bba-00aa00300cab"));
  // static DWINGUID IID = { 0xbef6e002, 0xa874, 0x101a, 0x8b, 0xba, 0x00, 0xaa, 0x00, 0x30, 0x0c, 0xab };
  /*[id(0x60010000)]*/ int get_Name(out wchar* pname);
  /*[id(0x60010000)]*/ int set_Name(wchar* pname);
  /*[id(0x60010002)]*/ int get_Size(out long psize);
  /*[id(0x60010002)]*/ int set_Size(long psize);
  /*[id(0x60010004)]*/ int get_Bold(out short pbold);
  /*[id(0x60010004)]*/ int set_Bold(short pbold);
  /*[id(0x60010006)]*/ int get_Italic(out short pitalic);
  /*[id(0x60010006)]*/ int set_Italic(short pitalic);
  /*[id(0x60010008)]*/ int get_Underline(out short punderline);
  /*[id(0x60010008)]*/ int set_Underline(short punderline);
  /*[id(0x6001000A)]*/ int get_Strikethrough(out short pstrikethrough);
  /*[id(0x6001000A)]*/ int set_Strikethrough(short pstrikethrough);
  /*[id(0x6001000C)]*/ int get_Weight(out short pweight);
  /*[id(0x6001000C)]*/ int set_Weight(short pweight);
  /*[id(0x6001000E)]*/ int get_Charset(out short pcharset);
  /*[id(0x6001000E)]*/ int set_Charset(short pcharset);
  /*[id(0x60010010)]*/ int get_hFont(out OLE_HANDLE phfont);
  /*[id(0x60010011)]*/ int Clone(out IFont lplpfont);
  /*[id(0x60010012)]*/ int IsEqual(IFont lpFontOther);
  /*[id(0x60010013)]*/ int SetRatio(int cyLogical, int cyHimetric);
  /*[id(0x60010014)]*/ int AddRefHfont(OLE_HANDLE hFont);
  /*[id(0x60010015)]*/ int ReleaseHfont(OLE_HANDLE hFont);
}

interface Font {
  mixin(uuid("bef6e003-a874-101a-8bba-00aa00300cab"));
  // static DWINGUID IID = { 0xbef6e003, 0xa874, 0x101a, 0x8b, 0xba, 0x00, 0xaa, 0x00, 0x30, 0x0c, 0xab };
  /+const wchar* Name;+/
  /+const long Size;+/
  /+const short Bold;+/
  /+const short Italic;+/
  /+const short Underline;+/
  /+const short Strikethrough;+/
  /+const short Weight;+/
  /+const short Charset;+/
}

// Picture Object
interface IPicture : IUnknown {
  mixin(uuid("7bf80980-bf32-101a-8bbb-00aa00300cab"));
  // static DWINGUID IID = { 0x7bf80980, 0xbf32, 0x101a, 0x8b, 0xbb, 0x00, 0xaa, 0x00, 0x30, 0x0c, 0xab };
  /*[id(0x60010000)]*/ int get_Handle(out OLE_HANDLE phandle);
  /*[id(0x60010001)]*/ int get_hPal(out OLE_HANDLE phpal);
  /*[id(0x60010002)]*/ int get_Type(out short ptype);
  /*[id(0x60010003)]*/ int get_Width(out OLE_XSIZE_HIMETRIC pwidth);
  /*[id(0x60010004)]*/ int get_Height(out OLE_YSIZE_HIMETRIC pheight);
  /*[id(0x60010005)]*/ int Render(int hdc, int x, int y, int cx, int cy, OLE_XPOS_HIMETRIC xSrc, OLE_YPOS_HIMETRIC ySrc, OLE_XSIZE_HIMETRIC cxSrc, OLE_YSIZE_HIMETRIC cySrc, void* lprcWBounds);
  /*[id(0x60010001)]*/ int set_hPal(OLE_HANDLE phpal);
  /*[id(0x60010007)]*/ int get_CurDC(out int phdcOut);
  /*[id(0x60010008)]*/ int SelectPicture(int hdcIn, out int phdcOut, out OLE_HANDLE phbmpOut);
  /*[id(0x60010009)]*/ int get_KeepOriginalFormat(out short pfkeep);
  /*[id(0x60010009)]*/ int set_KeepOriginalFormat(short pfkeep);
  /*[id(0x6001000B)]*/ int PictureChanged();
  /*[id(0x6001000C)]*/ int SaveAsFile(void* lpstream, short fSaveMemCopy, out int lpcbSize);
  /*[id(0x6001000D)]*/ int get_Attributes(out int lpdwAttr);
  /*[id(0x6001000E)]*/ int SetHdc(OLE_HANDLE hdc);
}

interface Picture {
  mixin(uuid("7bf80981-bf32-101a-8bbb-00aa00300cab"));
  // static DWINGUID IID = { 0x7bf80981, 0xbf32, 0x101a, 0x8b, 0xbb, 0x00, 0xaa, 0x00, 0x30, 0x0c, 0xab };
  /+/*[id(0x00000006)]*/ void Render(int hdc, int x, int y, int cx, int cy, OLE_XPOS_HIMETRIC xSrc, OLE_YPOS_HIMETRIC ySrc, OLE_XSIZE_HIMETRIC cxSrc, OLE_YSIZE_HIMETRIC cySrc, void* lprcWBounds);+/
  /+const OLE_HANDLE Handle;+/
  /+const OLE_HANDLE hPal;+/
  /+const short Type;+/
  /+const OLE_XSIZE_HIMETRIC Width;+/
  /+const OLE_YSIZE_HIMETRIC Height;+/
}

// CoClasses

abstract class StdFont {
  mixin(uuid("0be35203-8f91-11ce-9de3-00aa004bb851"));
  // static DWINGUID CLSID = { 0x0be35203, 0x8f91, 0x11ce, 0x9d, 0xe3, 0x00, 0xaa, 0x00, 0x4b, 0xb8, 0x51 };
  mixin Interfaces!(Font, IFont);
}

abstract class StdPicture {
  mixin(uuid("0be35204-8f91-11ce-9de3-00aa004bb851"));
  // static DWINGUID CLSID = { 0x0be35204, 0x8f91, 0x11ce, 0x9d, 0xe3, 0x00, 0xaa, 0x00, 0x4b, 0xb8, 0x51 };
  mixin Interfaces!(Picture, IPicture);
}

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
