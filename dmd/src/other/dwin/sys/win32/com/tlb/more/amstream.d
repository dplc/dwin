// DirectShowStream 1.0 Type Library
// Version 1.0

/*[uuid("4e6cde29-c0c4-11d0-8ff1-00c04fd9189d")]*/
//module dwin.sys.win32.com.tlb.more.directshowstream;
module dwin.sys.win32.com.tlb.more.amstream;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum __MIDL___MIDL_itf_amstream_0000_0004 {
  Disabled = 0x00000000,
  ReadData = 0x00000001,
  RenderData = 0x00000002,
}

// Aliases

alias __MIDL___MIDL_itf_amstream_0000_0004 OUTPUT_STATE;

// Interfaces

// IDirectShowStream Interface
interface IDirectShowStream : IDispatch {
  mixin(uuid("7db01c96-c0c3-11d0-8ff1-00c04fd9189d"));
  // static DWINGUID IID = { 0x7db01c96, 0xc0c3, 0x11d0, 0x8f, 0xf1, 0x00, 0xc0, 0x4f, 0xd9, 0x18, 0x9d };
  // property FileName
  /*[id(0x00000001)]*/ int get_FileName(out wchar* pVal);
  // property FileName
  /*[id(0x00000001)]*/ int set_FileName(wchar* pVal);
  // property Video
  /*[id(0x00000002)]*/ int get_Video(out OUTPUT_STATE pVal);
  // property Video
  /*[id(0x00000002)]*/ int set_Video(OUTPUT_STATE pVal);
  // property Audio
  /*[id(0x00000003)]*/ int get_Audio(out OUTPUT_STATE pVal);
  // property Audio
  /*[id(0x00000003)]*/ int set_Audio(OUTPUT_STATE pVal);
}

// CoClasses

// DirectShow Multi Media Stream
abstract class AMMultiMediaStream {
  mixin(uuid("49c47ce5-9ba4-11d0-8212-00c04fc32c45"));
  // static DWINGUID CLSID = { 0x49c47ce5, 0x9ba4, 0x11d0, 0x82, 0x12, 0x00, 0xc0, 0x4f, 0xc3, 0x2c, 0x45 };
  mixin Interfaces!(IDirectShowStream);
}
