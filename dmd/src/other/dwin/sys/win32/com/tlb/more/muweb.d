// Version 1.0

/*[uuid("5ccfc82e-2648-445e-9925-6e3e8d33f4e1")]*/
//module dwin.sys.win32.com.tlb.more.update;
module dwin.sys.win32.com.tlb.more.muweb;

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
  mixin(uuid("3e66a773-125e-459b-ae16-07eaad78a6a8"));
  // static DWINGUID IID = { 0x3e66a773, 0x125e, 0x459b, 0xae, 0x16, 0x07, 0xea, 0xad, 0x78, 0xa6, 0xa8 };
  /*[id(0x60020001)]*/ int get_IsWindowsUpdateDisabled(out short pVal);
  /*[id(0x60020002)]*/ int get_UserLocale(out uint pVal);
  /*[id(0x60020003)]*/ int get_IsRebootRequired(out short pVal);
  /*[id(0x60020004)]*/ int CreateObject(wchar* progID, out IDispatch dispatch);
  /*[id(0x60020005)]*/ int GetOSVersionInfo(OSVersionField osField, int systemMetric, out DWINVARIANT osVersionInfo);
  /*[id(0x60020006)]*/ int CheckIfClientUpdateNeeded(out ClientUpdateStatus updateRequiredStatus);
  /*[id(0x60020009)]*/ int GetUserType(out UserType UserType);
  /*[id(0x6002000B)]*/ int GetDownloadSpeed(out uint pVal);
  /*[id(0x6002000C)]*/ int DownloadAuthCab(out wchar* LocalPathToCab);
  /*[id(0x6002000D)]*/ int CheckIfWUClientUpdateNeeded(out ClientUpdateStatus updateRequiredStatus);
  /*[id(0x6002000E)]*/ int AddMUShortcut();
  /*[id(0x6002000F)]*/ int RemoveMUShortcut();
}

// CoClasses

abstract class WUWebControl {
  mixin(uuid("6e32070a-766d-4ee6-879c-dc1fa91d2fc3"));
  // static DWINGUID CLSID = { 0x6e32070a, 0x766d, 0x4ee6, 0x87, 0x9c, 0xdc, 0x1f, 0xa9, 0x1d, 0x2f, 0xc3 };
  mixin Interfaces!(IWUWebControl);
}
