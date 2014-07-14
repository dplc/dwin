// Version 1.0

/*[uuid("95cef0e5-a4ed-4703-b501-ae70a153697a")]*/
//module dwin.sys.win32.com.tlb.more.scriptsigner;
module dwin.sys.win32.com.tlb.more.wshext;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

interface IScriptSigningControl : IDispatch {
  mixin(uuid("97d8b206-3401-4006-b872-f95a679d7ca3"));
  // static DWINGUID IID = { 0x97d8b206, 0x3401, 0x4006, 0xb8, 0x72, 0xf9, 0x5a, 0x67, 0x9d, 0x7c, 0xa3 };
  /*[id(0x00000001)]*/ int Sign(wchar* FileExtension, wchar* Text, wchar* Certificate, wchar* Store, out wchar* Signed);
  /*[id(0x00000002)]*/ int SignFile(wchar* FileName, wchar* Certificate, wchar* Store);
  /*[id(0x00000003)]*/ int Verify(wchar* FileExtension, wchar* Text, short ShowUI, out short Verified);
  /*[id(0x00000004)]*/ int VerifyFile(wchar* FileName, short ShowUI, out short Verified);
}

// CoClasses

abstract class Signer {
  mixin(uuid("7e48c5cf-72f6-4c84-9f43-b04b87b31243"));
  // static DWINGUID CLSID = { 0x7e48c5cf, 0x72f6, 0x4c84, 0x9f, 0x43, 0xb0, 0x4b, 0x87, 0xb3, 0x12, 0x43 };
  mixin Interfaces!(IScriptSigningControl);
}
