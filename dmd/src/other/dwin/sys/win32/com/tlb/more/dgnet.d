// Dglogs 1.0 Type Library
// Version 1.0

/*[uuid("01d0a772-4346-4186-94f5-a1a120bc3401")]*/
//module dwin.sys.win32.com.tlb.more.dglogs;
module dwin.sys.win32.com.tlb.more.dgnet;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// _IDglogsComEvents Interface
interface _IDglogsComEvents : IDispatch {
  mixin(uuid("453772ff-f902-41ff-9073-bb16408b243a"));
  // static DWINGUID IID = { 0x453772ff, 0xf902, 0x41ff, 0x90, 0x73, 0xbb, 0x16, 0x40, 0x8b, 0x24, 0x3a };
  /+// method ProgressReport
  /*[id(0x00000001)]*/ void ProgressReport(wchar** pbstrMsg, int nPercentDone);+/
}

// IDglogsCom Interface
interface IDglogsCom : IDispatch {
  mixin(uuid("0c66d9b8-26c0-4110-bea4-5afa4848585c"));
  // static DWINGUID IID = { 0x0c66d9b8, 0x26c0, 0x4110, 0xbe, 0xa4, 0x5a, 0xfa, 0x48, 0x48, 0x58, 0x5c };
  // method ExecQuery
  /*[id(0x00000001)]*/ int ExecQuery(wchar* bstrCatagory, int bFlag, out wchar* pbstrResult);
  // method Initialize
  /*[id(0x00000002)]*/ int Initialize(out wchar* pbstrResult);
  // method StopQuery
  /*[id(0x00000003)]*/ int StopQuery();
}

// CoClasses

// DglogsCom Class
abstract class DglogsCom {
  mixin(uuid("76ff3452-e474-4032-bed5-bbe4e96b6d2f"));
  // static DWINGUID CLSID = { 0x76ff3452, 0xe474, 0x4032, 0xbe, 0xd5, 0xbb, 0xe4, 0xe9, 0x6b, 0x6d, 0x2f };
  mixin Interfaces!(IDglogsCom);
}
