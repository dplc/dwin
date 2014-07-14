// Microsoft MIMEEDIT Type Library 1.0
// Version 1.0

/*[uuid("1c82ead8-508e-11d1-8dcf-00c04fb951f9")]*/
//module dwin.sys.win32.com.tlb.more.mimeedit;
module dwin.sys.win32.com.tlb.more.inetcomm;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// IMimeEdit
interface IMimeEdit : IDispatch {
  mixin(uuid("6a98b73e-8c4d-11d1-bdff-00c04fa31009"));
  // static DWINGUID IID = { 0x6a98b73e, 0x8c4d, 0x11d1, 0xbd, 0xff, 0x00, 0xc0, 0x4f, 0xa3, 0x10, 0x09 };
  /*[id(0x00000065)]*/ int set_src(wchar* pbstr);
  /*[id(0x00000065)]*/ int get_src(out wchar* pbstr);
  /*[id(0x00000066)]*/ int set_header(int plStyle);
  /*[id(0x00000066)]*/ int get_header(out int plStyle);
  /*[id(0x00000067)]*/ int set_editMode(short pbool);
  /*[id(0x00000067)]*/ int get_editMode(out short pbool);
  /*[id(0x00000068)]*/ int get_messageSource(out wchar* pbstr);
  /*[id(0x00000069)]*/ int get_text(out wchar* pbstr);
  /*[id(0x0000006A)]*/ int get_html(out wchar* pbstr);
  /*[id(0x0000006B)]*/ int clear();
  /*[id(0x0000006C)]*/ int get_doc(out IDispatch ppDoc);
}

// CoClasses

// MimeEdit
abstract class MIMEEDIT {
  mixin(uuid("6f5edc56-8c63-11d1-bdff-00c04fa31009"));
  // static DWINGUID CLSID = { 0x6f5edc56, 0x8c63, 0x11d1, 0xbd, 0xff, 0x00, 0xc0, 0x4f, 0xa3, 0x10, 0x09 };
  mixin Interfaces!(IMimeEdit);
}
