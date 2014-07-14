// wuaueng 1.0 Type Library
// Version 1.0

/*[uuid("d4d8199e-e376-4d57-8b08-bbf87e1f36b1")]*/
//module dwin.sys.win32.com.tlb.more.wuaueng;
module dwin.sys.win32.com.tlb.more.wuaueng1;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum tagClientNotifyCode {
  NOTIFY_STOP_CLIENT = 0x00000001,
  NOTIFY_ADD_TRAYICON = 0x00000002,
  NOTIFY_REMOVE_TRAYICON = 0x00000003,
  NOTIFY_STATE_CHANGE = 0x00000004,
  NOTIFY_SHOW_INSTALLWARNING = 0x00000005,
  NOTIFY_RESET = 0x00000006,
  NOTIFY_RELAUNCH_CLIENT = 0x00000007,
}

// Structs

struct _AUSTATE {
  uint dwState;
  int fDisconnected;
  uint dwCltAction;
}

struct _AUOPTION {
  uint dwOption;
  uint dwSchedInstallDay;
  uint dwSchedInstallTime;
  int fDomainPolicy;
}

struct _AUEVTHANDLES {
  int ulNotifyClient;
}

struct tagCLIENT_NOTIFY_DATA {
  tagClientNotifyCode actionCode;
}

// Interfaces

// IUpdates Interface
interface IUpdates : IClassFactory {
  mixin(uuid("11178075-25d2-4c9c-8087-4c36924091e1"));
  // static DWINGUID IID = { 0x11178075, 0x25d2, 0x4c9c, 0x80, 0x87, 0x4c, 0x36, 0x92, 0x40, 0x91, 0xe1 };
  // property State
  /*[id(0x00000001)]*/ int get_State(out _AUSTATE pAuState);
  // property Option
  /*[id(0x00000002)]*/ int get_Option(out _AUOPTION pVal);
  // property Option
  /*[id(0x00000002)]*/ int set_Option(_AUOPTION pVal);
  // method GetUpdatesList
  /*[id(0x00000004)]*/ int GetUpdatesList(out DWINVARIANT pUpdates);
  // method SaveSelections
  /*[id(0x00000005)]*/ int SaveSelections(DWINVARIANT vUpdates);
  // method StartDownload
  /*[id(0x00000006)]*/ int StartDownload();
  // method GetDownloadStatus
  /*[id(0x00000007)]*/ int GetDownloadStatus(out uint pPercentage, out uint pStatus);
  // method SetDownloadPaused
  /*[id(0x00000008)]*/ int SetDownloadPaused(int bPaused);
  // method ConfigureAU
  /*[id(0x0000000A)]*/ int ConfigureAU();
  // method AvailableSessions
  /*[id(0x0000000B)]*/ int AvailableSessions(uint* pcSess);
  // method get_GetEvtHandles
  /*[id(0x0000000D)]*/ int get_EvtHandles(uint dwCltProcId, out _AUEVTHANDLES pauevtHandles);
  // method ClientMessage
  /*[id(0x0000000E)]*/ int ClientMessage(uint msg);
  // method GetNotifyData
  /*[id(0x00000010)]*/ int GetNotifyData(out tagCLIENT_NOTIFY_DATA pNotifyData);
  // method GetInstallXML
  /*[id(0x00000011)]*/ int GetInstallXML(out wchar* pbstrCatalogXML, out wchar* pbstrDownloadXML);
  // method LogEvent
  /*[id(0x00000012)]*/ int LogEvent(ushort wType, ushort wCategory, uint dwEventID, DWINVARIANT vItems);
}

interface IClassFactory : IUnknown {
  mixin(uuid("00000001-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00000001, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RemoteCreateInstance(ref DWINGUID riid, out IUnknown ppvObject);
  /*[id(0x60010001)]*/ int RemoteLockServer(int fLock);
}

// CoClasses

// Updates Class
abstract class Updates {
  mixin(uuid("e9376cc6-121a-447e-81cf-d8bcc200007c"));
  // static DWINGUID CLSID = { 0xe9376cc6, 0x121a, 0x447e, 0x81, 0xcf, 0xd8, 0xbc, 0xc2, 0x00, 0x00, 0x7c };
  mixin Interfaces!(IUpdates);
}
