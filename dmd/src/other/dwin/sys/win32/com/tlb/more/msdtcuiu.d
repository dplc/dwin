// DacCom 1.0 Type Library
// Version 1.0

/*[uuid("f9a3f400-b068-11cf-858c-95a235c0163a")]*/
//module dwin.sys.win32.com.tlb.more.daccom;
module dwin.sys.win32.com.tlb.more.dsdtcuiu;

private import dwin.sys.win32.com.Core;

// Unions

union __MIDL_IWinTypes_0009 {
  int hInproc;
  int hRemote;
}

// Structs

struct __MIDL___MIDL_itf_daccom_0004_0001 {
  uint Data1;
  ushort Data2;
  ushort Data3;
  ubyte[8] Data4;
}

struct __MIDL___MIDL_itf_daccom_0012_0001 {
  int w;
}

struct _RemotableHandle {
  int fContext;
  __MIDL_IWinTypes_0009 u;
}

// Aliases

alias __MIDL___MIDL_itf_daccom_0004_0001 Guid;

alias __MIDL___MIDL_itf_daccom_0012_0001 CWnd;

alias _RemotableHandle* wireHWND;

alias __MIDL___MIDL_itf_daccom_0012_0001 CDialog;

// Interfaces

interface IDacCom : IUnknown {
  mixin(uuid("f9a3f401-b068-11cf-858c-95a235c0163a"));
  // static DWINGUID IID = { 0xf9a3f401, 0xb068, 0x11cf, 0x85, 0x8c, 0x95, 0xa2, 0x35, 0xc0, 0x16, 0x3a };
  /*[id(0x60010000)]*/ void* ValidateDAC(void** pDac, wchar* pszRemoteSvr);
  /*[id(0x60010001)]*/ int DoDACAdvanced(CWnd* pParentWnd, void** pDac, wchar* pszServerName);
  /*[id(0x60010002)]*/ int __MIDL_0001();
  /*[id(0x60010003)]*/ void InitDACDLL(IDacCom pfnInStarIntegrate);
  /*[id(0x60010004)]*/ void TermDACDLL();
  /*[id(0x60010005)]*/ IDacUic GetUicInit();
  /*[id(0x60010006)]*/ int Connect(wireHWND hwndStatusPost, INTServiceControl pNtSvc);
  /*[id(0x60010007)]*/ CWnd* CreateTransactionWnd(void* pExtnHelpers, CWnd* pCInWndParent);
  /*[id(0x60010008)]*/ CWnd* CreateTraceWnd(void* pExtnHelpers, CWnd* pCInWndParent);
  /*[id(0x60010009)]*/ CWnd* CreateStaticsticsWnd(void* pExtnHelpers, CWnd* pCInWndParent);
  /*[id(0x6001000A)]*/ int RegisterErrorSink(IDacErrorSink pErrorSink);
  /*[id(0x6001000B)]*/ CDialog* CreateAdvancedPropertySheet(CWnd* pInWndParent);
  /*[id(0x6001000C)]*/ void DeleteWindow(void* pCWnd);
}

interface IUnknown {
  mixin(uuid("00000000-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00000000, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60000000)]*/ int QueryInterface(ref DWINGUID riid, void *ppvObject);
  /*[id(0x60000001)]*/ uint AddRef();
  /*[id(0x60000002)]*/ uint Release();
}

interface IDacUic : IUnknown {
  mixin(uuid("7083a5e1-adc3-11ce-86e1-00aa004a541b"));
  // static DWINGUID IID = { 0x7083a5e1, 0xadc3, 0x11ce, 0x86, 0xe1, 0x00, 0xaa, 0x00, 0x4a, 0x54, 0x1b };
  /*[id(0x60010000)]*/ int Init(void* pContactDtc, void* pContactUis, char* pszSvcName, void* hResMod, uint dwLangId);
  /*[id(0x60010001)]*/ int Connect(void* hEventConnect);
  /*[id(0x60010002)]*/ int InitLog(char* pszLogPath, uint dwTimer, uint dwCheckpoint, uint dwFlush, uint dwSize, int fFailIfThere);
  /*[id(0x60010003)]*/ int Disconnect();
  /*[id(0x60010004)]*/ int IsConnected();
  /*[id(0x60010005)]*/ int SetViewUpdate(uint dwUpdateLevel);
  /*[id(0x60010006)]*/ int GetViewUpdate(uint* pulUpdLim);
  /*[id(0x60010007)]*/ int SetShowUpdate(uint dwUpdateLevel);
  /*[id(0x60010008)]*/ int GetShowUpdate(uint* pulShowLim);
  /*[id(0x60010009)]*/ int GetTraceLevel(uint* pulTraceLevel);
  /*[id(0x6001000A)]*/ int RegisterMessageHandler(void* __MIDL_0000);
}

interface INTServiceControl : IUnknown {
  mixin(uuid("7083a5e3-adc3-11ce-86e1-00aa004a541b"));
  // static DWINGUID IID = { 0x7083a5e3, 0xadc3, 0x11ce, 0x86, 0xe1, 0x00, 0xaa, 0x00, 0x4a, 0x54, 0x1b };
  /*[id(0x60010000)]*/ int QueryStatus(uint* pdwStat);
  /*[id(0x60010001)]*/ int Start();
  /*[id(0x60010002)]*/ int Pause();
  /*[id(0x60010003)]*/ int Continue();
  /*[id(0x60010004)]*/ int Stop();
}

interface IDacErrorSink : IUnknown {
  mixin(uuid("a09762b0-c401-11cf-85e1-00a024a55aef"));
  // static DWINGUID IID = { 0xa09762b0, 0xc401, 0x11cf, 0x85, 0xe1, 0x00, 0xa0, 0x24, 0xa5, 0x5a, 0xef };
  /*[id(0x60010000)]*/ int ErrorMessage(uint dwText, uint uType);
}

// CoClasses

// DacCom Class
abstract class DacCom {
  mixin(uuid("f9a3f405-b068-11cf-858c-95a235c0163a"));
  // static DWINGUID CLSID = { 0xf9a3f405, 0xb068, 0x11cf, 0x85, 0x8c, 0x95, 0xa2, 0x35, 0xc0, 0x16, 0x3a };
  mixin Interfaces!(IDacCom);
}
