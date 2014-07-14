// SENS Events Type Library
// Version 2.0

/*[uuid("d597deed-5b9f-11d1-8dd2-00aa004abd5e")]*/
//module dwin.sys.win32.com.tlb.more.sensevents;
module dwin.sys.win32.com.tlb.more.sens;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Structs

struct SENS_QOCINFO {
  mixin(uuid("d597fad1-5b9f-11d1-8dd2-00aa004abd5e"));
  // static DWINGUID IID = { 0xd597fad1, 0x5b9f, 0x11d1, 0x8d, 0xd2, 0x00, 0xaa, 0x00, 0x4a, 0xbd, 0x5e };
  uint dwSize;
  uint dwFlags;
  uint dwOutSpeed;
  uint dwInSpeed;
}

// Interfaces

// SENS Network Events
interface ISensNetwork : IDispatch {
  mixin(uuid("d597bab1-5b9f-11d1-8dd2-00aa004abd5e"));
  // static DWINGUID IID = { 0xd597bab1, 0x5b9f, 0x11d1, 0x8d, 0xd2, 0x00, 0xaa, 0x00, 0x4a, 0xbd, 0x5e };
  /*[id(0x00000001)]*/ int ConnectionMade(wchar* bstrConnection, uint ulType, SENS_QOCINFO* lpQOCInfo);
  /*[id(0x00000002)]*/ int ConnectionMadeNoQOCInfo(wchar* bstrConnection, uint ulType);
  /*[id(0x00000003)]*/ int ConnectionLost(wchar* bstrConnection, uint ulType);
  /*[id(0x00000004)]*/ int DestinationReachable(wchar* bstrDestination, wchar* bstrConnection, uint ulType, SENS_QOCINFO* lpQOCInfo);
  /*[id(0x00000005)]*/ int DestinationReachableNoQOCInfo(wchar* bstrDestination, wchar* bstrConnection, uint ulType);
}

// SENS OnNow Events
interface ISensOnNow : IDispatch {
  mixin(uuid("d597bab2-5b9f-11d1-8dd2-00aa004abd5e"));
  // static DWINGUID IID = { 0xd597bab2, 0x5b9f, 0x11d1, 0x8d, 0xd2, 0x00, 0xaa, 0x00, 0x4a, 0xbd, 0x5e };
  /*[id(0x00000001)]*/ int OnACPower();
  /*[id(0x00000002)]*/ int OnBatteryPower(uint dwBatteryLifePercent);
  /*[id(0x00000003)]*/ int BatteryLow(uint dwBatteryLifePercent);
}

// SENS WinLogon Events
interface ISensLogon : IDispatch {
  mixin(uuid("d597bab3-5b9f-11d1-8dd2-00aa004abd5e"));
  // static DWINGUID IID = { 0xd597bab3, 0x5b9f, 0x11d1, 0x8d, 0xd2, 0x00, 0xaa, 0x00, 0x4a, 0xbd, 0x5e };
  /*[id(0x00000001)]*/ int Logon(wchar* bstrUserName);
  /*[id(0x00000002)]*/ int Logoff(wchar* bstrUserName);
  /*[id(0x00000003)]*/ int StartShell(wchar* bstrUserName);
  /*[id(0x00000004)]*/ int DisplayLock(wchar* bstrUserName);
  /*[id(0x00000005)]*/ int DisplayUnlock(wchar* bstrUserName);
  /*[id(0x00000006)]*/ int StartScreenSaver(wchar* bstrUserName);
  /*[id(0x00000007)]*/ int StopScreenSaver(wchar* bstrUserName);
}

// SENS WinLogon2 Events
interface ISensLogon2 : IDispatch {
  mixin(uuid("d597bab4-5b9f-11d1-8dd2-00aa004abd5e"));
  // static DWINGUID IID = { 0xd597bab4, 0x5b9f, 0x11d1, 0x8d, 0xd2, 0x00, 0xaa, 0x00, 0x4a, 0xbd, 0x5e };
  /*[id(0x00000001)]*/ int Logon(wchar* bstrUserName, uint dwSessionId);
  /*[id(0x00000002)]*/ int Logoff(wchar* bstrUserName, uint dwSessionId);
  /*[id(0x00000003)]*/ int SessionDisconnect(wchar* bstrUserName, uint dwSessionId);
  /*[id(0x00000004)]*/ int SessionReconnect(wchar* bstrUserName, uint dwSessionId);
  /*[id(0x00000005)]*/ int PostShell(wchar* bstrUserName, uint dwSessionId);
}

// CoClasses

// System Event Notification Service (SENS)
abstract class SENS {
  mixin(uuid("d597cafe-5b9f-11d1-8dd2-00aa004abd5e"));
  // static DWINGUID CLSID = { 0xd597cafe, 0x5b9f, 0x11d1, 0x8d, 0xd2, 0x00, 0xaa, 0x00, 0x4a, 0xbd, 0x5e };
  mixin Interfaces!();
}
