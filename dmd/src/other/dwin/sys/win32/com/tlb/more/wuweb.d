// Version 1.0

/*[uuid("62488c27-257d-4e5d-ab1a-6e89f9429e15")]*/
//module dwin.sys.win32.com.tlb.more.update;
module dwin.sys.win32.com.tlb.more.wuweb;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum tagOSVersionField {
  e_majorVer = 0x00000000,
  e_minorVer = 0x00000001,
  e_buildNumber = 0x00000002,
  e_platform = 0x00000003,
  e_SPMajor = 0x00000004,
  e_SPMinor = 0x00000005,
  e_productSuite = 0x00000006,
  e_productType = 0x00000007,
  e_systemMetric = 0x00000008,
  e_SPVersionString = 0x00000009,
  e_controlVersionString = 0x0000000A,
  e_maxOSVersionFieldValue = 0x0000000A,
}

enum tagClientUpdateStatus {
  e_updateNotNeeded = 0x00000000,
  e_updateNeeded = 0x00000001,
}

enum tagUserType {
  e_nonAdmin = 0x00000000,
  e_admin = 0x00000002,
}

// Aliases

alias tagOSVersionField OSVersionField;

alias tagClientUpdateStatus ClientUpdateStatus;

alias tagUserType UserType;

// Interfaces

interface IWUWebControl : IDispatch {
  mixin(uuid("e3420342-801f-4535-ab63-3a3bcaced986"));
  // static DWINGUID IID = { 0xe3420342, 0x801f, 0x4535, 0xab, 0x63, 0x3a, 0x3b, 0xca, 0xce, 0xd9, 0x86 };
  /*[id(0x60020001)]*/ int get_IsWindowsUpdateDisabled(out short pVal);
  /*[id(0x60020002)]*/ int get_UserLocale(out uint pVal);
  /*[id(0x60020003)]*/ int get_IsRebootRequired(out short pVal);
  /*[id(0x60020004)]*/ int CreateObject(wchar* progID, out IDispatch dispatch);
  /*[id(0x60020005)]*/ int GetOSVersionInfo(OSVersionField osField, int systemMetric, out DWINVARIANT osVersionInfo);
  /*[id(0x60020006)]*/ int CheckIfClientUpdateNeeded(out ClientUpdateStatus updateRequiredStatus);
  /*[id(0x60020007)]*/ int CheckIfClientUpdateNeeded2(DWINVARIANT varOpIdentifier, out ClientUpdateStatus updateRequiredStatus);
  /*[id(0x60020008)]*/ int UpdateClient(IDispatch clientUpdateListener);
  /*[id(0x60020009)]*/ int GetUserType(out UserType UserType);
  /*[id(0x6002000A)]*/ int CancelClientUpdate();
  /*[id(0x6002000B)]*/ int GetDownloadSpeed(out uint pVal);
}

// CoClasses

abstract class WUWebControl {
  mixin(uuid("6414512b-b978-451d-a0d8-fcfdf33e833c"));
  // static DWINGUID CLSID = { 0x6414512b, 0xb978, 0x451d, 0xa0, 0xd8, 0xfc, 0xfd, 0xf3, 0x3e, 0x83, 0x3c };
  mixin Interfaces!(IWUWebControl);
}
