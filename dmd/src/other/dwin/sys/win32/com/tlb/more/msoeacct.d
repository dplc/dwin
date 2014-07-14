// Microsoft Outlook Express Wizard Type Library
// Version 1.0

/*[uuid("79ca3712-8893-11d2-8c1f-00c04fa31009")]*/
//module dwin.sys.win32.com.tlb.more.hotwiz;
module dwin.sys.win32.com.tlb.more.msoeacct;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

interface IOEHotWizardOM : IDispatch {
  mixin(uuid("61a81654-75fb-11d2-8c0e-00c04fa31009"));
  // static DWINGUID IID = { 0x61a81654, 0x75fb, 0x11d2, 0x8c, 0x0e, 0x00, 0xc0, 0x4f, 0xa3, 0x10, 0x09 };
  /*[id(0x000003E9)]*/ int setPropSz(wchar* bstrProp, wchar* bstrVal);
  /*[id(0x000003EA)]*/ int getPropSz(wchar* bstrProp, out wchar* pbstrVal);
  /*[id(0x000003EB)]*/ int clearProps();
  /*[id(0x000003F2)]*/ int createAccount(wchar* bstrINS);
  /*[id(0x000003EC)]*/ int close(short fPrompt);
  /*[id(0x000003EE)]*/ int get_width(out int pl);
  /*[id(0x000003EE)]*/ int set_width(int pl);
  /*[id(0x000003EF)]*/ int get_height(out int pl);
  /*[id(0x000003EF)]*/ int set_height(int pl);
}
