// MSAAText 1.0 Type Library
// Version 1.0

/*[uuid("150e2d7a-dac1-4582-947d-2a8fd78b82cd")]*/
module dwin.sys.win32.com.tlb.more.msaatext;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Unions

union __MIDL_IWinTypes_0009 {
  int hInproc;
  int hRemote;
}

// Structs

struct _RemotableHandle {
  int fContext;
  __MIDL_IWinTypes_0009 u;
}

struct tagPOINT {
  int x;
  int y;
}

// Aliases

alias _RemotableHandle* wireHWND;

// Interfaces

interface ITfMSAAControl : IUnknown {
  mixin(uuid("b5f8fb3b-393f-4f7c-84cb-504924c2705a"));
  // static DWINGUID IID = { 0xb5f8fb3b, 0x393f, 0x4f7c, 0x84, 0xcb, 0x50, 0x49, 0x24, 0xc2, 0x70, 0x5a };
  /*[id(0x60010000)]*/ int SystemEnableMSAA();
  /*[id(0x60010001)]*/ int SystemDisableMSAA();
}

// IAccStore Interface
interface IAccStore : IUnknown {
  mixin(uuid("e2cd4a63-2b72-4d48-b739-95e4765195ba"));
  // static DWINGUID IID = { 0xe2cd4a63, 0x2b72, 0x4d48, 0xb7, 0x39, 0x95, 0xe4, 0x76, 0x51, 0x95, 0xba };
  /*[id(0x60010000)]*/ int Register(ref DWINGUID riid, IUnknown punk);
  /*[id(0x60010001)]*/ int Unregister(IUnknown punk);
  /*[id(0x60010002)]*/ int GetDocuments(out IEnumUnknown enumUnknown);
  /*[id(0x60010003)]*/ int LookupByHWND(wireHWND hWnd, ref DWINGUID riid, out IUnknown ppunk);
  /*[id(0x60010004)]*/ int LookupByPoint(tagPOINT pt, ref DWINGUID riid, out IUnknown ppunk);
  /*[id(0x60010005)]*/ int OnDocumentFocus(IUnknown punk);
  /*[id(0x60010006)]*/ int GetFocused(ref DWINGUID riid, out IUnknown ppunk);
}

interface IEnumUnknown : IUnknown {
  mixin(uuid("00000100-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00000100, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RemoteNext(uint celt, out IUnknown rgelt, out uint pceltFetched);
  /*[id(0x60010001)]*/ int Skip(uint celt);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IEnumUnknown ppenum);
}

interface IAccDictionary : IUnknown {
  mixin(uuid("1dc4cb5f-d737-474d-ade9-5ccfc9bc1cc9"));
  // static DWINGUID IID = { 0x1dc4cb5f, 0xd737, 0x474d, 0xad, 0xe9, 0x5c, 0xcf, 0xc9, 0xbc, 0x1c, 0xc9 };
  /*[id(0x60010000)]*/ int GetLocalizedString(ref DWINGUID Term, uint lcid, out wchar* pResult, out uint plcid);
  /*[id(0x60010001)]*/ int GetParentTerm(ref DWINGUID Term, out DWINGUID pParentTerm);
  /*[id(0x60010002)]*/ int GetMnemonicString(ref DWINGUID Term, out wchar* pResult);
  /*[id(0x60010003)]*/ int LookupMnemonicTerm(wchar* bstrMnemonic, out DWINGUID pTerm);
  /*[id(0x60010004)]*/ int ConvertValueToString(ref DWINGUID Term, uint lcid, DWINVARIANT varValue, out wchar* pbstrResult, out uint plcid);
}

// IAccServerDocMgr Interface
interface IAccServerDocMgr : IUnknown {
  mixin(uuid("ad7c73cf-6dd5-4855-abc2-b04bad5b9153"));
  // static DWINGUID IID = { 0xad7c73cf, 0x6dd5, 0x4855, 0xab, 0xc2, 0xb0, 0x4b, 0xad, 0x5b, 0x91, 0x53 };
  /*[id(0x60010000)]*/ int NewDocument(ref DWINGUID riid, IUnknown punk);
  /*[id(0x60010001)]*/ int RevokeDocument(IUnknown punk);
  /*[id(0x60010002)]*/ int OnDocumentFocus(IUnknown punk);
}

// IAccClientDocMgr Interface
interface IAccClientDocMgr : IUnknown {
  mixin(uuid("4c896039-7b6d-49e6-a8c1-45116a98292b"));
  // static DWINGUID IID = { 0x4c896039, 0x7b6d, 0x49e6, 0xa8, 0xc1, 0x45, 0x11, 0x6a, 0x98, 0x29, 0x2b };
  /*[id(0x60010000)]*/ int GetDocuments(out IEnumUnknown enumUnknown);
  /*[id(0x60010001)]*/ int LookupByHWND(wireHWND hWnd, ref DWINGUID riid, out IUnknown ppunk);
  /*[id(0x60010002)]*/ int LookupByPoint(tagPOINT pt, ref DWINGUID riid, out IUnknown ppunk);
  /*[id(0x60010003)]*/ int GetFocused(ref DWINGUID riid, out IUnknown ppunk);
}

// IDocWrap Interface
interface IDocWrap : IUnknown {
  mixin(uuid("dcd285fe-0be0-43bd-99c9-aaaec513c555"));
  // static DWINGUID IID = { 0xdcd285fe, 0x0be0, 0x43bd, 0x99, 0xc9, 0xaa, 0xae, 0xc5, 0x13, 0xc5, 0x55 };
  /*[id(0x60010000)]*/ int SetDoc(ref DWINGUID riid, IUnknown punk);
  /*[id(0x60010001)]*/ int GetWrappedDoc(ref DWINGUID riid, out IUnknown ppunk);
}

// CoClasses

// MSAAControl Class
abstract class MSAAControl {
  mixin(uuid("08cd963f-7a3e-4f5c-9bd8-d692bb043c5b"));
  // static DWINGUID CLSID = { 0x08cd963f, 0x7a3e, 0x4f5c, 0x9b, 0xd8, 0xd6, 0x92, 0xbb, 0x04, 0x3c, 0x5b };
  mixin Interfaces!(ITfMSAAControl);
}

// AccStore Class
abstract class AccStore {
  mixin(uuid("5440837f-4bff-4ae5-a1b1-7722ecc6332a"));
  // static DWINGUID CLSID = { 0x5440837f, 0x4bff, 0x4ae5, 0xa1, 0xb1, 0x77, 0x22, 0xec, 0xc6, 0x33, 0x2a };
  mixin Interfaces!(IAccStore);
}

// AccDictionary Class
abstract class AccDictionary {
  mixin(uuid("6572ee16-5fe5-4331-bb6d-76a49c56e423"));
  // static DWINGUID CLSID = { 0x6572ee16, 0x5fe5, 0x4331, 0xbb, 0x6d, 0x76, 0xa4, 0x9c, 0x56, 0xe4, 0x23 };
  mixin Interfaces!(IAccDictionary);
}

// AccServerDocMgr Class
abstract class AccServerDocMgr {
  mixin(uuid("6089a37e-eb8a-482d-bd6f-f9f46904d16d"));
  // static DWINGUID CLSID = { 0x6089a37e, 0xeb8a, 0x482d, 0xbd, 0x6f, 0xf9, 0xf4, 0x69, 0x04, 0xd1, 0x6d };
  mixin Interfaces!(IAccServerDocMgr);
}

// AccClientDocMgr Class
abstract class AccClientDocMgr {
  mixin(uuid("fc48cc30-4f3e-4fa1-803b-ad0e196a83b1"));
  // static DWINGUID CLSID = { 0xfc48cc30, 0x4f3e, 0x4fa1, 0x80, 0x3b, 0xad, 0x0e, 0x19, 0x6a, 0x83, 0xb1 };
  mixin Interfaces!(IAccClientDocMgr);
}

// DocWrap Class
abstract class DocWrap {
  mixin(uuid("bf426f7e-7a5e-44d6-830c-a390ea9462a3"));
  // static DWINGUID CLSID = { 0xbf426f7e, 0x7a5e, 0x44d6, 0x83, 0x0c, 0xa3, 0x90, 0xea, 0x94, 0x62, 0xa3 };
  mixin Interfaces!(IDocWrap);
}
