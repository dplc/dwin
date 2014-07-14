// oleprn 1.0 Type Library
// Version 1.0

/*[uuid("7586b340-ec08-11d0-a466-00c04fc30df6")]*/
module dwin.sys.win32.com.tlb.more.oleprn;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// Iprturl Interface
interface Iprturl : IDispatch {
  mixin(uuid("7586b34d-ec08-11d0-a466-00c04fc30df6"));
  // static DWINGUID IID = { 0x7586b34d, 0xec08, 0x11d0, 0xa4, 0x66, 0x00, 0xc0, 0x4f, 0xc3, 0x0d, 0xf6 };
  // property ClientInfo
  /*[id(0x00000001)]*/ int get_ClientInfo(out int lpdwInfo);
  // property SupportLinkName
  /*[id(0x00000005)]*/ int get_SupportLinkName(out wchar* pVal);
  // property SupportLink
  /*[id(0x00000006)]*/ int get_SupportLink(out wchar* pVal);
  // property PrinterName
  /*[id(0x00000007)]*/ int set_PrinterName(wchar* value);
  // property PrinterWebURL
  /*[id(0x00000008)]*/ int get_PrinterWebURL(out wchar* pVal);
  // property PrinterOemURL
  /*[id(0x00000009)]*/ int get_PrinterOemURL(out wchar* pVal);
  // property PrinterOemName
  /*[id(0x0000000A)]*/ int get_PrinterOemName(out wchar* pVal);
}

// ISNMP Interface
interface ISNMP : IDispatch {
  mixin(uuid("4f664f90-ff01-11d0-8aed-00c04fd7b597"));
  // static DWINGUID IID = { 0x4f664f90, 0xff01, 0x11d0, 0x8a, 0xed, 0x00, 0xc0, 0x4f, 0xd7, 0xb5, 0x97 };
  // method Open
  /*[id(0x00000001)]*/ int Open(wchar* bstrHost, wchar* bstrCommunity, DWINVARIANT varRetry, DWINVARIANT varTimeout);
  // method Get
  /*[id(0x00000002)]*/ int Get(wchar* bstrOID, out DWINVARIANT varValue);
  // method GetList
  /*[id(0x00000003)]*/ int GetList(DWINVARIANT* varList, out DWINVARIANT varValue);
  // method GetTree
  /*[id(0x00000004)]*/ int GetTree(wchar* varTree, out DWINVARIANT varValue);
  // method Close
  /*[id(0x00000005)]*/ int Close();
  // method OIDFromString
  /*[id(0x00000006)]*/ int OIDFromString(wchar* bstrOID, out DWINVARIANT varOID);
  // method Set
  /*[id(0x00000007)]*/ int Set(wchar* bstrOID, DWINVARIANT varValue);
  // method SetList
  /*[id(0x00000008)]*/ int SetList(DWINVARIANT* varName, DWINVARIANT* varValue);
  // method GetAsByte
  /*[id(0x00000009)]*/ int GetAsByte(wchar* bstrOID, out uint puValue);
}

// Iasphelp Interface
interface Iasphelp : IDispatch {
  mixin(uuid("3e4d4f1b-2aee-11d1-9d3d-00c04fc30df6"));
  // static DWINGUID IID = { 0x3e4d4f1b, 0x2aee, 0x11d1, 0x9d, 0x3d, 0x00, 0xc0, 0x4f, 0xc3, 0x0d, 0xf6 };
  /*[id(0x60020000)]*/ int OnStartPage(IUnknown piUnk);
  /*[id(0x60020001)]*/ int OnEndPage();
  // method Open
  /*[id(0x00000001)]*/ int Open(wchar* bstrPrinterName);
  // method Close
  /*[id(0x00000002)]*/ int Close();
  // property AspPage
  /*[id(0x00000003)]*/ int get_AspPage(uint dwPage, out wchar* pVal);
  // property Community
  /*[id(0x00000004)]*/ int get_Community(out wchar* pVal);
  // property SNMPDevice
  /*[id(0x00000005)]*/ int get_SNMPDevice(out uint pVal);
  // property SNMPSupported
  /*[id(0x00000006)]*/ int get_SNMPSupported(out int pVal);
  // property PageRateUnit
  /*[id(0x00000007)]*/ int get_PageRateUnit(out int pVal);
  // property IsHTTP
  /*[id(0x00000009)]*/ int get_IsHTTP(out int pVal);
  // property IPAddress
  /*[id(0x0000000A)]*/ int get_IPAddress(out wchar* pVal);
  // property IsTCPMonSupported
  /*[id(0x0000000B)]*/ int get_IsTCPMonSupported(out int pVal);
  // property Color
  /*[id(0x0000000C)]*/ int get_Color(out int pVal);
  // property Duplex
  /*[id(0x0000000D)]*/ int get_Duplex(out int pVal);
  // property MaximumResolution
  /*[id(0x0000000E)]*/ int get_MaximumResolution(out int pVal);
  // property MediaReady
  /*[id(0x0000000F)]*/ int get_MediaReady(out DWINVARIANT pVal);
  // property PaperNames
  /*[id(0x00000010)]*/ int get_PaperNames(out DWINVARIANT pVal);
  // property PageRate
  /*[id(0x00000011)]*/ int get_PageRate(out int pVal);
  // property ComputerName
  /*[id(0x00000012)]*/ int get_ComputerName(out wchar* pVal);
  // property LongPaperName
  /*[id(0x00000013)]*/ int get_LongPaperName(wchar* bstrShortName, out wchar* pVal);
  // property Portname
  /*[id(0x00000015)]*/ int get_PortName(out wchar* pVal);
  // property MibErrorDscp
  /*[id(0x00000016)]*/ int get_MibErrorDscp(uint dwError, out wchar* pVal);
  // method CalcJobETA
  /*[id(0x00000017)]*/ int CalcJobETA();
  // property PendingJobCount
  /*[id(0x00000018)]*/ int get_PendingJobCount(out int pVal);
  // property JobCompletionMinute
  /*[id(0x00000019)]*/ int get_JobCompletionMinute(out int pVal);
  // property AvgJobSizeUnit
  /*[id(0x0000001A)]*/ int get_AvgJobSizeUnit(out int pVal);
  // property AvgJobSize
  /*[id(0x0000001B)]*/ int get_AvgJobSize(out int pVal);
  // property Status
  /*[id(0x0000001C)]*/ int get_Status(out int pVal);
  // property ErrorDscp
  /*[id(0x0000001F)]*/ int get_ErrorDscp(int lErrCode, out wchar* pVal);
  // property Model
  /*[id(0x00000020)]*/ int get_DriverName(out wchar* pVal);
  // property ShareName
  /*[id(0x00000021)]*/ int get_ShareName(out wchar* pVal);
  // property IsCluster
  /*[id(0x00000022)]*/ int get_IsCluster(out int pVal);
}

// IAddPrint Interface
interface IAddPrint : IDispatch {
  mixin(uuid("b57467a5-50b5-11d1-bf97-0000f8773501"));
  // static DWINGUID IID = { 0xb57467a5, 0x50b5, 0x11d1, 0xbf, 0x97, 0x00, 0x00, 0xf8, 0x77, 0x35, 0x01 };
  // method AddPrinterConnection
  /*[id(0x00000001)]*/ int AddPrinterConnection(wchar* lpPrinterName);
  // method DeletePrinterConnection
  /*[id(0x00000002)]*/ int DeletePrinterConnection(wchar* lpPrinterName);
}

// IDSPrintQueue Interface
interface IDSPrintQueue : IDispatch {
  mixin(uuid("435899c8-44ab-11d1-af00-080036234103"));
  // static DWINGUID IID = { 0x435899c8, 0x44ab, 0x11d1, 0xaf, 0x00, 0x08, 0x00, 0x36, 0x23, 0x41, 0x03 };
  // property UNCName
  /*[id(0x00000001)]*/ int get_UNCName(out wchar* pVal);
  // property UNCName
  /*[id(0x00000001)]*/ int set_UNCName(wchar* pVal);
  // property Name
  /*[id(0x00000002)]*/ int get_Name(out wchar* pVal);
  // property Name
  /*[id(0x00000002)]*/ int set_Name(wchar* pVal);
  // property Container
  /*[id(0x00000003)]*/ int get_Container(out wchar* pVal);
  // property Container
  /*[id(0x00000003)]*/ int set_Container(wchar* pVal);
  // method Publish
  /*[id(0x00000004)]*/ int Publish(uint dwAction);
  // property Path
  /*[id(0x00000005)]*/ int get_Path(out wchar* pVal);
}

// IOleCvt Interface
interface IOleCvt : IDispatch {
  mixin(uuid("65303442-ad66-11d1-9d65-00c04fc30df6"));
  // static DWINGUID IID = { 0x65303442, 0xad66, 0x11d1, 0x9d, 0x65, 0x00, 0xc0, 0x4f, 0xc3, 0x0d, 0xf6 };
  /*[id(0x60020000)]*/ int OnStartPage(IUnknown piUnk);
  /*[id(0x60020001)]*/ int OnEndPage();
  // property ToUtf8
  /*[id(0x00000001)]*/ int get_ToUtf8(wchar* bstrUnicode, out wchar* pVal);
  // property EncodeUnicodeName
  /*[id(0x00000002)]*/ int get_EncodeUnicodeName(wchar* bstrSrcName, out wchar* pVal);
  // property DecodeUnicodeName
  /*[id(0x00000003)]*/ int get_DecodeUnicodeName(wchar* bstrSrcName, out wchar* pVal);
  // property ToUnicode
  /*[id(0x00000004)]*/ int get_ToUnicode(wchar* bstrString, int lCodePage, out wchar* pVal);
}

// Event interface for OleInstall
interface _InstallEvent : IDispatch {
  mixin(uuid("c3701885-b39b-11d1-9d68-00c04fc30df6"));
  // static DWINGUID IID = { 0xc3701885, 0xb39b, 0x11d1, 0x9d, 0x68, 0x00, 0xc0, 0x4f, 0xc3, 0x0d, 0xf6 };
  /+/*[id(0x00000001)]*/ void OnProgress(int lProgress);+/
  /+/*[id(0x00000002)]*/ void InstallError(int lErrCode);+/
}

// IOleInstall Interface
interface IOleInstall : IDispatch {
  mixin(uuid("c3701883-b39b-11d1-9d68-00c04fc30df6"));
  // static DWINGUID IID = { 0xc3701883, 0xb39b, 0x11d1, 0x9d, 0x68, 0x00, 0xc0, 0x4f, 0xc3, 0x0d, 0xf6 };
  // method InstallPrinter
  /*[id(0x00000002)]*/ int InstallPrinter(wchar* pbstrUncName, wchar* pbstrUrl);
  // method OpenPrintersFolder
  /*[id(0x00000005)]*/ int OpenPrintersFolder();
}

// CoClasses

// prturl Class
abstract class prturl {
  mixin(uuid("92337a8c-e11d-11d0-be48-00c04fc30df6"));
  // static DWINGUID CLSID = { 0x92337a8c, 0xe11d, 0x11d0, 0xbe, 0x48, 0x00, 0xc0, 0x4f, 0xc3, 0x0d, 0xf6 };
  mixin Interfaces!(Iprturl);
}

// SNMP Class
abstract class SNMP {
  mixin(uuid("4f664f91-ff01-11d0-8aed-00c04fd7b597"));
  // static DWINGUID CLSID = { 0x4f664f91, 0xff01, 0x11d0, 0x8a, 0xed, 0x00, 0xc0, 0x4f, 0xd7, 0xb5, 0x97 };
  mixin Interfaces!(ISNMP);
}

// asphelp Class
abstract class asphelp {
  mixin(uuid("3e4d4f1c-2aee-11d1-9d3d-00c04fc30df6"));
  // static DWINGUID CLSID = { 0x3e4d4f1c, 0x2aee, 0x11d1, 0x9d, 0x3d, 0x00, 0xc0, 0x4f, 0xc3, 0x0d, 0xf6 };
  mixin Interfaces!(Iasphelp);
}

// AddPrint Class
abstract class AddPrint {
  mixin(uuid("b57467a6-50b5-11d1-bf97-0000f8773501"));
  // static DWINGUID CLSID = { 0xb57467a6, 0x50b5, 0x11d1, 0xbf, 0x97, 0x00, 0x00, 0xf8, 0x77, 0x35, 0x01 };
  mixin Interfaces!(IAddPrint);
}

// DSPrintQueue Class
abstract class DSPrintQueue {
  mixin(uuid("435899c9-44ab-11d1-af00-080036234103"));
  // static DWINGUID CLSID = { 0x435899c9, 0x44ab, 0x11d1, 0xaf, 0x00, 0x08, 0x00, 0x36, 0x23, 0x41, 0x03 };
  mixin Interfaces!(IDSPrintQueue);
}

// OleCvt Class
abstract class OleCvt {
  mixin(uuid("65303443-ad66-11d1-9d65-00c04fc30df6"));
  // static DWINGUID CLSID = { 0x65303443, 0xad66, 0x11d1, 0x9d, 0x65, 0x00, 0xc0, 0x4f, 0xc3, 0x0d, 0xf6 };
  mixin Interfaces!(IOleCvt);
}

// OleInstall Class
abstract class OleInstall {
  mixin(uuid("c3701884-b39b-11d1-9d68-00c04fc30df6"));
  // static DWINGUID CLSID = { 0xc3701884, 0xb39b, 0x11d1, 0x9d, 0x68, 0x00, 0xc0, 0x4f, 0xc3, 0x0d, 0xf6 };
  mixin Interfaces!(IOleInstall);
}
