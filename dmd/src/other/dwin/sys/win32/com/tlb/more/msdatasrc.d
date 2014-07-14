// Microsoft Data Source Interfaces
// Version 1.0

/*[uuid("7c0ffab0-cd84-11d0-949a-00a0c91110ed")]*/
module dwin.sys.win32.com.tlb.more.msdatasrc;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Aliases

alias wchar* DataMember;

// Interfaces

interface DataSourceListener : IUnknown {
  mixin(uuid("7c0ffab2-cd84-11d0-949a-00a0c91110ed"));
  // static DWINGUID IID = { 0x7c0ffab2, 0xcd84, 0x11d0, 0x94, 0x9a, 0x00, 0xa0, 0xc9, 0x11, 0x10, 0xed };
  /*[id(0x60010000)]*/ int dataMemberChanged(DataMember bstrDM);
  /*[id(0x60010001)]*/ int dataMemberAdded(DataMember bstrDM);
  /*[id(0x60010002)]*/ int dataMemberRemoved(DataMember bstrDM);
}

interface DataSource : IUnknown {
  mixin(uuid("7c0ffab3-cd84-11d0-949a-00a0c91110ed"));
  // static DWINGUID IID = { 0x7c0ffab3, 0xcd84, 0x11d0, 0x94, 0x9a, 0x00, 0xa0, 0xc9, 0x11, 0x10, 0xed };
  /*[id(0x60010000)]*/ int getDataMember(DataMember bstrDM, ref DWINGUID riid, out IUnknown ppunk);
  /*[id(0x60010001)]*/ int getDataMemberName(int lIndex, out DataMember pbstrDM);
  /*[id(0x60010002)]*/ int getDataMemberCount(out int plCount);
  /*[id(0x60010003)]*/ int addDataSourceListener(DataSourceListener pDSL);
  /*[id(0x60010004)]*/ int removeDataSourceListener(DataSourceListener pDSL);
}
