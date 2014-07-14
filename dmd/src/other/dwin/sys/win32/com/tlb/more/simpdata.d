// Microsoft OLE DB Simple Provider 1.5 Library
// Version 1.5

/*[uuid("e0e270c2-c0be-11d0-8fe4-00a0c90a6341")]*/
//module dwin.sys.win32.com.tlb.more.msdaosp;
module dwin.sys.win32.com.tlb.more.simpdata;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum OSPFORMAT {
  OSPFORMAT_RAW = 0x00000000,
  OSPFORMAT_DEFAULT = 0x00000000,
  OSPFORMAT_FORMATTED = 0x00000001,
  OSPFORMAT_HTML = 0x00000002,
}

enum OSPRW {
  OSPRW_DEFAULT = 0x00000001,
  OSPRW_READONLY = 0x00000000,
  OSPRW_READWRITE = 0x00000001,
  OSPRW_MIXED = 0x00000002,
}

enum OSPFIND {
  OSPFIND_DEFAULT = 0x00000000,
  OSPFIND_UP = 0x00000001,
  OSPFIND_CASESENSITIVE = 0x00000002,
  OSPFIND_UPCASESENSITIVE = 0x00000003,
}

enum OSPCOMP {
  OSPCOMP_EQ = 0x00000001,
  OSPCOMP_DEFAULT = 0x00000001,
  OSPCOMP_LT = 0x00000002,
  OSPCOMP_LE = 0x00000003,
  OSPCOMP_GE = 0x00000004,
  OSPCOMP_GT = 0x00000005,
  OSPCOMP_NE = 0x00000006,
}

enum OSPXFER {
  OSPXFER_COMPLETE = 0x00000000,
  OSPXFER_ABORT = 0x00000001,
  OSPXFER_ERROR = 0x00000002,
}

// Interfaces

interface OLEDBSimpleProviderListener : IUnknown {
  mixin(uuid("e0e270c1-c0be-11d0-8fe4-00a0c90a6341"));
  // static DWINGUID IID = { 0xe0e270c1, 0xc0be, 0x11d0, 0x8f, 0xe4, 0x00, 0xa0, 0xc9, 0x0a, 0x63, 0x41 };
  /*[id(0x60010000)]*/ int aboutToChangeCell(int iRow, int iColumn);
  /*[id(0x60010001)]*/ int cellChanged(int iRow, int iColumn);
  /*[id(0x60010002)]*/ int aboutToDeleteRows(int iRow, int cRows);
  /*[id(0x60010003)]*/ int deletedRows(int iRow, int cRows);
  /*[id(0x60010004)]*/ int aboutToInsertRows(int iRow, int cRows);
  /*[id(0x60010005)]*/ int insertedRows(int iRow, int cRows);
  /*[id(0x60010006)]*/ int rowsAvailable(int iRow, int cRows);
  /*[id(0x60010007)]*/ int transferComplete(OSPXFER xfer);
}

interface OLEDBSimpleProvider : IUnknown {
  mixin(uuid("e0e270c0-c0be-11d0-8fe4-00a0c90a6341"));
  // static DWINGUID IID = { 0xe0e270c0, 0xc0be, 0x11d0, 0x8f, 0xe4, 0x00, 0xa0, 0xc9, 0x0a, 0x63, 0x41 };
  /*[id(0x60010000)]*/ int getRowCount(out int pcRows);
  /*[id(0x60010001)]*/ int getColumnCount(out int pcColumns);
  /*[id(0x60010002)]*/ int getRWStatus(int iRow, int iColumn, out OSPRW prwStatus);
  /*[id(0x60010003)]*/ int getVariant(int iRow, int iColumn, OSPFORMAT format, out DWINVARIANT pVar);
  /*[id(0x60010004)]*/ int setVariant(int iRow, int iColumn, OSPFORMAT format, DWINVARIANT Var);
  /*[id(0x60010005)]*/ int getLocale(out wchar* pbstrLocale);
  /*[id(0x60010006)]*/ int deleteRows(int iRow, int cRows, out int pcRowsDeleted);
  /*[id(0x60010007)]*/ int insertRows(int iRow, int cRows, out int pcRowsInserted);
  /*[id(0x60010008)]*/ int find(int iRowStart, int iColumn, DWINVARIANT val, OSPFIND findFlags, OSPCOMP compType, out int piRowFound);
  /*[id(0x60010009)]*/ int addOLEDBSimpleProviderListener(OLEDBSimpleProviderListener pospIListener);
  /*[id(0x6001000A)]*/ int removeOLEDBSimpleProviderListener(OLEDBSimpleProviderListener pospIListener);
  /*[id(0x6001000B)]*/ int isAsync(out int pbAsynch);
  /*[id(0x6001000C)]*/ int getEstimatedRows(out int piRows);
  /*[id(0x6001000D)]*/ int stopTransfer();
}
