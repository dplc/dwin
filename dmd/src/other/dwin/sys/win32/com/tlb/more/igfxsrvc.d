// igfxsrvc 1.0 Type Library
// Version 1.0

/*[uuid("0f195f92-ccf0-11d2-8b20-00a0c93cb1f4")]*/
//module dwin.sys.win32.com.tlb.more.igfxsrvc;
module dwin.sys.win32.com.tlb.more.igfxsrvc;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Unions

union __MIDL_IWinTypes_0003 {
  int hInproc;
  _FLAGGED_BYTE_BLOB* hRemote;
  int hGlobal;
}

// Structs

struct _userHGLOBAL {
  int fContext;
  __MIDL_IWinTypes_0003 u;
}

struct _FLAGGED_BYTE_BLOB {
  uint fFlags;
  uint clSize;
  ubyte* abData;
}

struct tagRECT {
  int left;
  int top;
  int right;
  int bottom;
}

struct _POINTL {
  int x;
  int y;
}

struct _RECTL {
  int left;
  int top;
  int right;
  int bottom;
}

struct tagPOINT {
  int x;
  int y;
}

// Aliases

alias _userHGLOBAL* wireHGLOBAL;

// Interfaces

// ICUIService Interface
interface ICUIService : IUnknown {
  mixin(uuid("0f1950af-ccf0-11d2-8b20-00a0c93cb1f4"));
  // static DWINGUID IID = { 0x0f1950af, 0xccf0, 0x11d2, 0x8b, 0x20, 0x00, 0xa0, 0xc9, 0x3c, 0xb1, 0xf4 };
  // property DeviceName
  /*[id(0x60010000)]*/ int get_DeviceName(out wchar* pVal);
  // property DeviceName
  /*[id(0x60010000)]*/ int set_DeviceName(wchar* pVal);
  // property Output
  /*[id(0x60010002)]*/ int get_Output(out int pVal);
  // property Output
  /*[id(0x60010002)]*/ int set_Output(int pVal);
}

// IWindowsData Interface
interface IWindowsData : IUnknown {
  mixin(uuid("0f195fa0-ccf0-11d2-8b20-00a0c93cb1f4"));
  // static DWINGUID IID = { 0x0f195fa0, 0xccf0, 0x11d2, 0x8b, 0x20, 0x00, 0xa0, 0xc9, 0x3c, 0xb1, 0xf4 };
  // property OSVersion
  /*[id(0x60010000)]*/ int get_OSVersion(out int pVal);
  // method IsOS
  /*[id(0x60010001)]*/ int IsOS(int osp);
  // method IsOS9X
  /*[id(0x60010002)]*/ int IsOS9X();
  // method IsOS95
  /*[id(0x60010003)]*/ int IsOS95();
  // method IsOSNT
  /*[id(0x60010004)]*/ int IsOSNT();
  // property IsActive
  /*[id(0x60010005)]*/ int get_IsActive(out int pbActive);
  // method ForceGraphicsMode
  /*[id(0x60010006)]*/ int ForceGraphicsMode();
  // property GraphicsMode
  /*[id(0x60010007)]*/ int get_GraphicsMode(out wchar* pVal);
  // property GraphicsMode
  /*[id(0x60010007)]*/ int set_GraphicsMode(wchar* pVal);
  // property IsGraphicsModeValid
  /*[id(0x60010009)]*/ int get_IsGraphicsModeValid(wchar* newVal, out int pVal);
  // property AvailableGraphicsModes
  /*[id(0x6001000A)]*/ int get_AvailableGraphicsModes(out wchar* pVal);
  // property Total Local Memory
  /*[id(0x6001000B)]*/ int get_VideoMemory(out int pVal);
  // property Available Local Memory
  /*[id(0x6001000C)]*/ int get_FreeVideoMemory(out int pVal);
  // property IsPCMonitorConnected
  /*[id(0x6001000D)]*/ int get_IsPCMonitorConnected(out int pVal);
  // property IsPCMonitorSupported
  /*[id(0x6001000E)]*/ int get_IsPCMonitorSupported(out int pVal);
  // property IsPCMonitorOn
  /*[id(0x6001000F)]*/ int get_IsPCMonitorOn(out int pVal);
  // property PCMonitorEnabled
  /*[id(0x60010010)]*/ int get_PCMonitorEnabled(out int pVal);
  // property PCMonitorEnabled
  /*[id(0x60010010)]*/ int set_PCMonitorEnabled(int pVal);
  // property AvailableRefreshRates
  /*[id(0x60010012)]*/ int get_AvailableRefreshRates(out wchar* pVal);
  // property RefreshRate
  /*[id(0x60010013)]*/ int get_RefreshRate(out int pVal);
  // property RefreshRate
  /*[id(0x60010013)]*/ int set_RefreshRate(int pVal);
  // method IsSchemeSupportedMode
  /*[id(0x60010015)]*/ int IsSchemeSupportedMode(wchar* bsMode, out int pVal);
  // property AvailableBinaryGraphicsMode
  /*[id(0x60010016)]*/ int get_AvailableBinaryGraphicsMode(int dwindex, out wireHGLOBAL pVal);
  // method ReDetectDevices
  /*[id(0x60010017)]*/ int ReDetectDevices();
  // property AvailableBinaryGraphicsModeEx
  /*[id(0x60010018)]*/ int get_AvailableBinaryGraphicsModeEx(int dwindex, int cb, out ubyte pVal);
  // property LegacyMonitorDetect
  /*[id(0x60010019)]*/ int set_LegacyMonitorDetect(int value);
}

// I3D Interface
interface I3D : IUnknown {
  mixin(uuid("4eaf1fa2-d552-11d2-b561-00a0c92e6848"));
  // static DWINGUID IID = { 0x4eaf1fa2, 0xd552, 0x11d2, 0xb5, 0x61, 0x00, 0xa0, 0xc9, 0x2e, 0x68, 0x48 };
  // property IsSupported
  /*[id(0x60010000)]*/ int get_IsSupported(out int pVal);
}

// ISettings Interface
interface ISettings : IUnknown {
  mixin(uuid("4eaf1fa0-d552-11d2-b561-00a0c92e6848"));
  // static DWINGUID IID = { 0x4eaf1fa0, 0xd552, 0x11d2, 0xb5, 0x61, 0x00, 0xa0, 0xc9, 0x2e, 0x68, 0x48 };
  // property IsSupported
  /*[id(0x60010000)]*/ int get_IsSupported(out int pVal);
  // property DisplayDriver
  /*[id(0x60010001)]*/ int get_DisplayDriver(out wchar* pVal);
  // property DisplayDriverVersion
  /*[id(0x60010002)]*/ int get_DisplayDriverVersion(out wchar* pVal);
  // property VBIOSVersion
  /*[id(0x60010003)]*/ int get_VBIOSVersion(out wchar* pVal);
  // property ChipManf
  /*[id(0x60010004)]*/ int get_ChipManf(out wchar* pVal);
  // property Drivers
  /*[id(0x60010005)]*/ int get_Drivers(out wchar* pVal);
  // property DisplayDriverDescription
  /*[id(0x60010006)]*/ int get_DisplayDriverDescription(out wchar* pVal);
  // property AcceleratorName
  /*[id(0x60010007)]*/ int get_AcceleratorName(out wchar* pVal);
  // property MemoryType
  /*[id(0x60010008)]*/ int get_MemoryType(out wchar* pVal);
  // property IsPortraitModeSupported
  /*[id(0x60010009)]*/ int get_IsPortraitModeSupported(out int pVal);
  // property PortraitMode
  /*[id(0x6001000A)]*/ int get_PortraitMode(out int pVal);
  // property PortraitMode
  /*[id(0x6001000A)]*/ int set_PortraitMode(int pVal);
  // property IsPanningModeSupported
  /*[id(0x6001000C)]*/ int get_IsPanningModeSupported(out int pVal);
  // property PanningMode
  /*[id(0x6001000D)]*/ int get_PanningMode(out int pVal);
  // property PanningMode
  /*[id(0x6001000D)]*/ int set_PanningMode(int pVal);
  // property IsSingleSimModeSupported
  /*[id(0x6001000F)]*/ int get_IsSingleSimModeSupported(out int pVal);
  // property SingleSimMode
  /*[id(0x60010010)]*/ int get_SingleSimMode(out int pVal);
  // property SingleSimMode
  /*[id(0x60010010)]*/ int set_SingleSimMode(int pVal);
  // property IsMosaicModeSupported
  /*[id(0x60010012)]*/ int get_IsMosaicModeSupported(out int pVal);
  // property MosaicMode
  /*[id(0x60010013)]*/ int get_MosaicMode(out int pVal);
  // property MosaicMode
  /*[id(0x60010013)]*/ int set_MosaicMode(int pVal);
  // property IsStandardModeSupported
  /*[id(0x60010015)]*/ int get_IsStandardModeSupported(out int pVal);
  // property StandardMode
  /*[id(0x60010016)]*/ int get_StandardMode(out int pVal);
  // property StandardMode
  /*[id(0x60010016)]*/ int set_StandardMode(int pVal);
  // property IsMultiSimModeSupported
  /*[id(0x60010018)]*/ int get_IsMultiSimModeSupported(out int pVal);
  // property MultiSimMode
  /*[id(0x60010019)]*/ int get_MultiSimMode(out int pVal);
  // property MultiSimMode
  /*[id(0x60010019)]*/ int set_MultiSimMode(int pVal);
  // property MaxActiveDevices
  /*[id(0x6001001B)]*/ int get_MaxActiveDevices(uint Output, out uint pVal);
  // property MaxActiveOutputs
  /*[id(0x6001001C)]*/ int get_MaxActiveOutputs(out uint pVal);
  // method ModeChangeComplete
  /*[id(0x6001001D)]*/ int ModeChangeComplete();
  // property ZoomModeSupported
  /*[id(0x6001001E)]*/ int get_ZoomModeSupported(out int pVal);
  // property ZoomModeEnabled
  /*[id(0x6001001F)]*/ int get_ZoomModeEnabled(out int pVal);
  // property ZoomModeEnabled
  /*[id(0x6001001F)]*/ int set_ZoomModeEnabled(int pVal);
  // property ZoomRect
  /*[id(0x60010021)]*/ int get_ZoomRect(out tagRECT r);
  // property ZoomRect
  /*[id(0x60010021)]*/ int set_ZoomRect(tagRECT r);
  // property HotKeysSupported
  /*[id(0x60010023)]*/ int get_HotKeysSupported(out int pVal);
  // property HotKeysEnabled
  /*[id(0x60010024)]*/ int get_HotKeysEnabled(out int pVal);
  // property HotKeysEnabled
  /*[id(0x60010024)]*/ int set_HotKeysEnabled(int pVal);
  // property PanelFitSupported
  /*[id(0x60010026)]*/ int get_PanelFitSupported(out int pVal);
  // property PanelFitEnabled
  /*[id(0x60010027)]*/ int get_PanelFitEnabled(out int pVal);
  // property PanelFitEnabled
  /*[id(0x60010027)]*/ int set_PanelFitEnabled(int pVal);
  // property ShowTrayIcon
  /*[id(0x60010029)]*/ int get_ShowTrayIcon(out int pVal);
  // property ShowTrayIcon
  /*[id(0x60010029)]*/ int set_ShowTrayIcon(int pVal);
  // method HotKey
  /*[id(0x6001002B)]*/ int GetHotKey(int iKeyIds, out wchar* pVal);
  // method HotKey
  /*[id(0x6001002C)]*/ int SetHotKey(int lKeyIds, wchar* newVal);
  // property DriverEventSupported
  /*[id(0x6001002D)]*/ int get_DriverEventSupported(out int pVal);
  // property DriverEvent
  /*[id(0x6001002E)]*/ int set_DriverEvent(uint value);
  // property IsMultiDualModeSupported
  /*[id(0x6001002F)]*/ int get_IsMultiDualModeSupported(out int pVal);
  // property MultiDualMode
  /*[id(0x60010030)]*/ int get_MultiDualMode(out int pVal);
  // property MultiDualMode
  /*[id(0x60010030)]*/ int set_MultiDualMode(int pVal);
  // property PowerPersist
  /*[id(0x60010032)]*/ int get_IsPowerPersistSupported(out int pVal);
  // property LidPersist
  /*[id(0x60010033)]*/ int get_IsLidPersistSupported(out int pVal);
  // property HotKeyPersist
  /*[id(0x60010034)]*/ int get_IsHotKeyPersistSupported(out int pVal);
  // property IsLidSwitchOrACPIHotkeyChange
  /*[id(0x60010035)]*/ int get_IsLidSwitchOrACPIHotkeyChange(out uint pVal);
  // property SMIHotkeyDisplayChanged
  /*[id(0x60010036)]*/ int set_SMIHotkeyDisplayChanged(int value);
  // method ResetLidSMIHotkeyValues
  /*[id(0x60010037)]*/ int ResetLidSMIHotkeyValues();
  // property ReverseCloneOrZoomDisplays
  /*[id(0x60010038)]*/ int set_ReverseCloneOrZoomDisplays(uint dwPrimary, uint value);
  // property DriverLidSwitchEventSupported
  /*[id(0x60010039)]*/ int get_DriverLidSwitchEventSupported(out int pVal);
  // property DriverLidSwitchEvent
  /*[id(0x6001003A)]*/ int set_DriverLidSwitchEvent(uint value);
  // property ZoomLockStatus
  /*[id(0x6001003B)]*/ int get_ZoomLockStatus(out int pVal);
  // property ZoomLockStatus
  /*[id(0x6001003B)]*/ int set_ZoomLockStatus(int pVal);
  // method IncreaseZoomSize
  /*[id(0x6001003D)]*/ int IncreaseZoomSize();
  // method DecreaseZoomSize
  /*[id(0x6001003E)]*/ int DecreaseZoomSize();
  // property PersistOptions
  /*[id(0x6001003F)]*/ int get_PersistOptions(uint dwOption, out uint pdwVal);
  // Method get Min Memory
  /*[id(0x60010040)]*/ int get_MinMemory(out int pVal);
  // Method get Max Memory
  /*[id(0x60010041)]*/ int get_MaxMemory(out int pVal);
  // Method get Curr Memory
  /*[id(0x60010042)]*/ int get_CurrMemory(out int pVal);
  // property DriverHotPlugEvent
  /*[id(0x60010043)]*/ int set_DriverHotPlugEvent(uint value);
  // property PowerStateChangeEvent
  /*[id(0x60010044)]*/ int set_PowerStateChangeEvent(uint value);
}

// IFlatPanel Interface
interface IFlatPanel : IUnknown {
  mixin(uuid("4eaf1fa1-d552-11d2-b561-00a0c92e6848"));
  // static DWINGUID IID = { 0x4eaf1fa1, 0xd552, 0x11d2, 0xb5, 0x61, 0x00, 0xa0, 0xc9, 0x2e, 0x68, 0x48 };
  // property IsOn
  /*[id(0x60010000)]*/ int get_IsOn(out int pVal);
  // property IsConnected
  /*[id(0x60010001)]*/ int get_IsConnected(out int pVal);
  // property IsSupported
  /*[id(0x60010002)]*/ int get_IsSupported(out int pVal);
  // property IsGraphicsModeValid
  /*[id(0x60010003)]*/ int get_IsGraphicsModeValid(wchar* newVal, out int pVal);
  // property Enabled
  /*[id(0x60010004)]*/ int get_Enabled(out int pVal);
  // property Enabled
  /*[id(0x60010004)]*/ int set_Enabled(int pVal);
}

// ICRT Interface
interface ICRT : IUnknown {
  mixin(uuid("9dbd8ee2-66d5-11d4-b561-00a0c92e6848"));
  // static DWINGUID IID = { 0x9dbd8ee2, 0x66d5, 0x11d4, 0xb5, 0x61, 0x00, 0xa0, 0xc9, 0x2e, 0x68, 0x48 };
  // property DeviceNumber
  /*[id(0x60010000)]*/ int get_DeviceNumber(out uint pVal);
  // property DeviceNumber
  /*[id(0x60010000)]*/ int set_DeviceNumber(uint pVal);
  // property GraphicsMode
  /*[id(0x60010002)]*/ int get_GraphicsMode(out wchar* pVal);
  // property GraphicsMode
  /*[id(0x60010002)]*/ int set_GraphicsMode(wchar* pVal);
  // property IsGraphicsModeValid
  /*[id(0x60010004)]*/ int get_IsGraphicsModeValid(wchar* newVal, out int pVal);
  // property AvailableGraphicsModes
  /*[id(0x60010005)]*/ int get_AvailableGraphicsModes(out wchar* pVal);
  // property IsConnected
  /*[id(0x60010006)]*/ int get_IsConnected(out int pVal);
  // property IsSupported
  /*[id(0x60010007)]*/ int get_IsSupported(out int pVal);
  // property IsOn
  /*[id(0x60010008)]*/ int get_IsOn(out int pVal);
  // property Enabled
  /*[id(0x60010009)]*/ int get_Enabled(out int pVal);
  // property Enabled
  /*[id(0x60010009)]*/ int set_Enabled(int pVal);
  // property AvailableRefreshRates
  /*[id(0x6001000B)]*/ int get_AvailableRefreshRates(out wchar* pVal);
  // property RefreshRate
  /*[id(0x6001000C)]*/ int get_RefreshRate(out int pVal);
  // property RefreshRate
  /*[id(0x6001000C)]*/ int set_RefreshRate(int pVal);
  // method ForceGraphicsMode
  /*[id(0x6001000E)]*/ int ForceGraphicsMode();
  // property AvailableBinaryGraphicsMode
  /*[id(0x6001000F)]*/ int get_AvailableBinaryGraphicsMode(int dwindex, out wireHGLOBAL pVal);
  // property GammaRamp
  /*[id(0x60010010)]*/ int get_GammaRamp(int cb, ref ubyte pVal);
  // property MainScreenGamma
  /*[id(0x60010011)]*/ int get_MainScreenGamma(uint color, out int pVal);
  // property MainScreenGamma
  /*[id(0x60010011)]*/ int set_MainScreenGamma(uint color, int pVal);
  // property MainScreenBrightness
  /*[id(0x60010013)]*/ int get_MainScreenBrightness(uint color, out int pVal);
  // property MainScreenBrightness
  /*[id(0x60010013)]*/ int set_MainScreenBrightness(uint color, int pVal);
  // property MainScreenContrast
  /*[id(0x60010015)]*/ int get_MainScreenContrast(uint color, out int pVal);
  // property MainScreenContrast
  /*[id(0x60010015)]*/ int set_MainScreenContrast(uint color, int pVal);
  // property MainScreenGammaMin
  /*[id(0x60010017)]*/ int get_MainScreenGammaMin(out int pVal);
  // property MainScreenGammaMax
  /*[id(0x60010018)]*/ int get_MainScreenGammaMax(out int pVal);
  // property MainScreenGammaDefault
  /*[id(0x60010019)]*/ int get_MainScreenGammaDefault(out int pVal);
  // property MainScreenBrightnessMin
  /*[id(0x6001001A)]*/ int get_MainScreenBrightnessMin(out int pVal);
  // property MainScreenBrightnessMax
  /*[id(0x6001001B)]*/ int get_MainScreenBrightnessMax(out int pVal);
  // property MainScreenBrightnessDefault
  /*[id(0x6001001C)]*/ int get_MainScreenBrightnessDefault(out int pVal);
  // property MainScreenContrastMin
  /*[id(0x6001001D)]*/ int get_MainScreenContrastMin(out int pVal);
  // property MainScreenContrastMax
  /*[id(0x6001001E)]*/ int get_MainScreenContrastMax(out int pVal);
  // property MainScreenContrastDefault
  /*[id(0x6001001F)]*/ int get_MainScreenContrastDefault(out int pVal);
}

// IFlatPanel2 Interface
interface IFlatPanel2 : IUnknown {
  mixin(uuid("9dbd8ee3-66d5-11d4-b561-00a0c92e6848"));
  // static DWINGUID IID = { 0x9dbd8ee3, 0x66d5, 0x11d4, 0xb5, 0x61, 0x00, 0xa0, 0xc9, 0x2e, 0x68, 0x48 };
  // property DeviceNumber
  /*[id(0x60010000)]*/ int get_DeviceNumber(out uint pVal);
  // property DeviceNumber
  /*[id(0x60010000)]*/ int set_DeviceNumber(uint pVal);
  // property GraphicsMode
  /*[id(0x60010002)]*/ int get_GraphicsMode(out wchar* pVal);
  // property GraphicsMode
  /*[id(0x60010002)]*/ int set_GraphicsMode(wchar* pVal);
  // property IsGraphicsModeValid
  /*[id(0x60010004)]*/ int get_IsGraphicsModeValid(wchar* newVal, out int pVal);
  // property AvailableGraphicsModes
  /*[id(0x60010005)]*/ int get_AvailableGraphicsModes(out wchar* pVal);
  // property IsConnected
  /*[id(0x60010006)]*/ int get_IsConnected(out int pVal);
  // property IsSupported
  /*[id(0x60010007)]*/ int get_IsSupported(out int pVal);
  // property IsOn
  /*[id(0x60010008)]*/ int get_IsOn(out int pVal);
  // property Enabled
  /*[id(0x60010009)]*/ int get_Enabled(out int pVal);
  // property Enabled
  /*[id(0x60010009)]*/ int set_Enabled(int pVal);
  // property AvailableRefreshRates
  /*[id(0x6001000B)]*/ int get_AvailableRefreshRates(out wchar* pVal);
  // property RefreshRate
  /*[id(0x6001000C)]*/ int get_RefreshRate(out int pVal);
  // property RefreshRate
  /*[id(0x6001000C)]*/ int set_RefreshRate(int pVal);
  // property PanelFit
  /*[id(0x6001000E)]*/ int get_PanelFit(out int pVal);
  // property PanelFit
  /*[id(0x6001000E)]*/ int set_PanelFit(int pVal);
  // method ForceGraphicsMode
  /*[id(0x60010010)]*/ int ForceGraphicsMode();
  // property AvailableBinaryGraphicsMode
  /*[id(0x60010011)]*/ int get_AvailableBinaryGraphicsMode(int dwindex, out wireHGLOBAL pVal);
  // property GammaRamp
  /*[id(0x60010012)]*/ int get_GammaRamp(int cb, ref ubyte pVal);
  // property MainScreenGamma
  /*[id(0x60010013)]*/ int get_MainScreenGamma(uint color, out int pVal);
  // property MainScreenGamma
  /*[id(0x60010013)]*/ int set_MainScreenGamma(uint color, int pVal);
  // property MainScreenBrightness
  /*[id(0x60010015)]*/ int get_MainScreenBrightness(uint color, out int pVal);
  // property MainScreenBrightness
  /*[id(0x60010015)]*/ int set_MainScreenBrightness(uint color, int pVal);
  // property MainScreenContrast
  /*[id(0x60010017)]*/ int get_MainScreenContrast(uint color, out int pVal);
  // property MainScreenContrast
  /*[id(0x60010017)]*/ int set_MainScreenContrast(uint color, int pVal);
  // property MainScreenGammaMin
  /*[id(0x60010019)]*/ int get_MainScreenGammaMin(out int pVal);
  // property MainScreenGammaMax
  /*[id(0x6001001A)]*/ int get_MainScreenGammaMax(out int pVal);
  // property MainScreenGammaDefault
  /*[id(0x6001001B)]*/ int get_MainScreenGammaDefault(out int pVal);
  // property MainScreenBrightnessMin
  /*[id(0x6001001C)]*/ int get_MainScreenBrightnessMin(out int pVal);
  // property MainScreenBrightnessMax
  /*[id(0x6001001D)]*/ int get_MainScreenBrightnessMax(out int pVal);
  // property MainScreenBrightnessDefault
  /*[id(0x6001001E)]*/ int get_MainScreenBrightnessDefault(out int pVal);
  // property MainScreenContrastMin
  /*[id(0x6001001F)]*/ int get_MainScreenContrastMin(out int pVal);
  // property MainScreenContrastMax
  /*[id(0x60010020)]*/ int get_MainScreenContrastMax(out int pVal);
  // property MainScreenContrastDefault
  /*[id(0x60010021)]*/ int get_MainScreenContrastDefault(out int pVal);
}

// IIntFlatPanel Interface
interface IIntFlatPanel : IUnknown {
  mixin(uuid("9dbd8ee4-66d5-11d4-b561-00a0c92e6848"));
  // static DWINGUID IID = { 0x9dbd8ee4, 0x66d5, 0x11d4, 0xb5, 0x61, 0x00, 0xa0, 0xc9, 0x2e, 0x68, 0x48 };
  // property DeviceNumber
  /*[id(0x60010000)]*/ int get_DeviceNumber(out uint pVal);
  // property DeviceNumber
  /*[id(0x60010000)]*/ int set_DeviceNumber(uint pVal);
  // property GraphicsMode
  /*[id(0x60010002)]*/ int get_GraphicsMode(out wchar* pVal);
  // property GraphicsMode
  /*[id(0x60010002)]*/ int set_GraphicsMode(wchar* pVal);
  // property IsGraphicsModeValid
  /*[id(0x60010004)]*/ int get_IsGraphicsModeValid(wchar* newVal, out int pVal);
  // property AvailableGraphicsModes
  /*[id(0x60010005)]*/ int get_AvailableGraphicsModes(out wchar* pVal);
  // property IsConnected
  /*[id(0x60010006)]*/ int get_IsConnected(out int pVal);
  // property IsSupported
  /*[id(0x60010007)]*/ int get_IsSupported(out int pVal);
  // property IsOn
  /*[id(0x60010008)]*/ int get_IsOn(out int pVal);
  // property Enabled
  /*[id(0x60010009)]*/ int get_Enabled(out int pVal);
  // property Enabled
  /*[id(0x60010009)]*/ int set_Enabled(int pVal);
  // property AvailableRefreshRates
  /*[id(0x6001000B)]*/ int get_AvailableRefreshRates(out wchar* pVal);
  // property RefreshRate
  /*[id(0x6001000C)]*/ int get_RefreshRate(out int pVal);
  // property RefreshRate
  /*[id(0x6001000C)]*/ int set_RefreshRate(int pVal);
  // property PanelFit
  /*[id(0x6001000E)]*/ int get_PanelFit(out int pVal);
  // property PanelFit
  /*[id(0x6001000E)]*/ int set_PanelFit(int pVal);
  // method ForceGraphicsMode
  /*[id(0x60010010)]*/ int ForceGraphicsMode();
  // property AvailableBinaryGraphicsMode
  /*[id(0x60010011)]*/ int get_AvailableBinaryGraphicsMode(int dwindex, out wireHGLOBAL pVal);
  // property GammaRamp
  /*[id(0x60010012)]*/ int get_GammaRamp(int cb, ref ubyte pVal);
  // property MainScreenGamma
  /*[id(0x60010013)]*/ int get_MainScreenGamma(uint color, out int pVal);
  // property MainScreenGamma
  /*[id(0x60010013)]*/ int set_MainScreenGamma(uint color, int pVal);
  // property MainScreenBrightness
  /*[id(0x60010015)]*/ int get_MainScreenBrightness(uint color, out int pVal);
  // property MainScreenBrightness
  /*[id(0x60010015)]*/ int set_MainScreenBrightness(uint color, int pVal);
  // property MainScreenContrast
  /*[id(0x60010017)]*/ int get_MainScreenContrast(uint color, out int pVal);
  // property MainScreenContrast
  /*[id(0x60010017)]*/ int set_MainScreenContrast(uint color, int pVal);
  // property MainScreenGammaMin
  /*[id(0x60010019)]*/ int get_MainScreenGammaMin(out int pVal);
  // property MainScreenGammaMax
  /*[id(0x6001001A)]*/ int get_MainScreenGammaMax(out int pVal);
  // property MainScreenGammaDefault
  /*[id(0x6001001B)]*/ int get_MainScreenGammaDefault(out int pVal);
  // property MainScreenBrightnessMin
  /*[id(0x6001001C)]*/ int get_MainScreenBrightnessMin(out int pVal);
  // property MainScreenBrightnessMax
  /*[id(0x6001001D)]*/ int get_MainScreenBrightnessMax(out int pVal);
  // property MainScreenBrightnessDefault
  /*[id(0x6001001E)]*/ int get_MainScreenBrightnessDefault(out int pVal);
  // property MainScreenContrastMin
  /*[id(0x6001001F)]*/ int get_MainScreenContrastMin(out int pVal);
  // property MainScreenContrastMax
  /*[id(0x60010020)]*/ int get_MainScreenContrastMax(out int pVal);
  // property MainScreenContrastDefault
  /*[id(0x60010021)]*/ int get_MainScreenContrastDefault(out int pVal);
}

// IScheme Interface
interface IScheme : IUnknown {
  mixin(uuid("2353b560-f964-11d2-b561-00a0c92e6848"));
  // static DWINGUID IID = { 0x2353b560, 0xf964, 0x11d2, 0xb5, 0x61, 0x00, 0xa0, 0xc9, 0x2e, 0x68, 0x48 };
  // property ReadOnly
  /*[id(0x60010000)]*/ int get_ReadOnly(out int pVal);
  // property ReadOnly
  /*[id(0x60010000)]*/ int set_ReadOnly(int pVal);
  // property DeviceName
  /*[id(0x60010002)]*/ int get_DeviceName(out wchar* pVal);
  // property DeviceName
  /*[id(0x60010002)]*/ int set_DeviceName(wchar* pVal);
  // property Display
  /*[id(0x60010004)]*/ int get_Display(out uint pVal);
  // property Display
  /*[id(0x60010004)]*/ int set_Display(uint pVal);
  // property TVFormat
  /*[id(0x60010006)]*/ int get_TVFormat(out int pVal);
  // property TVFormat
  /*[id(0x60010006)]*/ int set_TVFormat(int pVal);
  // property SchemeGraphicsMode
  /*[id(0x60010008)]*/ int get_SchemeGraphicsMode(out wchar* pVal);
  // property SchemeGraphicsMode
  /*[id(0x60010008)]*/ int set_SchemeGraphicsMode(wchar* pVal);
  // property AppToLaunch
  /*[id(0x6001000A)]*/ int get_AppToLaunch(out wchar* pVal);
  // property AppToLaunch
  /*[id(0x6001000A)]*/ int set_AppToLaunch(wchar* pVal);
  // property ResetOnExit
  /*[id(0x6001000C)]*/ int get_ResetOnExit(out int pVal);
  // property ResetOnExit
  /*[id(0x6001000C)]*/ int set_ResetOnExit(int pVal);
  // property Portrait
  /*[id(0x6001000E)]*/ int get_Portrait(out int pVal);
  // property Portrait
  /*[id(0x6001000E)]*/ int set_Portrait(int pVal);
  // property Panning
  /*[id(0x60010010)]*/ int get_Panning(out int pVal);
  // property Panning
  /*[id(0x60010010)]*/ int set_Panning(int pVal);
  // property Gamma
  /*[id(0x60010012)]*/ int get_Gamma(uint color, out int pVal);
  // property Gamma
  /*[id(0x60010012)]*/ int set_Gamma(uint color, int pVal);
  // property Brightness
  /*[id(0x60010014)]*/ int get_Brightness(uint color, out int pVal);
  // property Brightness
  /*[id(0x60010014)]*/ int set_Brightness(uint color, int pVal);
  // property Contrast
  /*[id(0x60010016)]*/ int get_Contrast(uint color, out int pVal);
  // property Contrast
  /*[id(0x60010016)]*/ int set_Contrast(uint color, int pVal);
}

// IColor Interface
interface IColor : IUnknown {
  mixin(uuid("86aa7f80-f7f3-11d2-b561-00a0c92e6848"));
  // static DWINGUID IID = { 0x86aa7f80, 0xf7f3, 0x11d2, 0xb5, 0x61, 0x00, 0xa0, 0xc9, 0x2e, 0x68, 0x48 };
  // property IsSupported
  /*[id(0x60010000)]*/ int get_IsSupported(out int pVal);
  // property MainScreenGamma
  /*[id(0x60010001)]*/ int get_MainScreenGamma(uint color, out int pVal);
  // property MainScreenGamma
  /*[id(0x60010001)]*/ int set_MainScreenGamma(uint color, int pVal);
  // property MainScreenBrightness
  /*[id(0x60010003)]*/ int get_MainScreenBrightness(uint color, out int pVal);
  // property MainScreenBrightness
  /*[id(0x60010003)]*/ int set_MainScreenBrightness(uint color, int pVal);
  // property MainScreenContrast
  /*[id(0x60010005)]*/ int get_MainScreenContrast(uint color, out int pVal);
  // property MainScreenContrast
  /*[id(0x60010005)]*/ int set_MainScreenContrast(uint color, int pVal);
  // property MainScreenGammaMin
  /*[id(0x60010007)]*/ int get_MainScreenGammaMin(out int pVal);
  // property MainScreenGammaMax
  /*[id(0x60010008)]*/ int get_MainScreenGammaMax(out int pVal);
  // property MainScreenGammaDefault
  /*[id(0x60010009)]*/ int get_MainScreenGammaDefault(out int pVal);
  // property MainScreenBrightnessMin
  /*[id(0x6001000A)]*/ int get_MainScreenBrightnessMin(out int pVal);
  // property MainScreenBrightnessMax
  /*[id(0x6001000B)]*/ int get_MainScreenBrightnessMax(out int pVal);
  // property MainScreenBrightnessDefault
  /*[id(0x6001000C)]*/ int get_MainScreenBrightnessDefault(out int pVal);
  // property MainScreenContrastMin
  /*[id(0x6001000D)]*/ int get_MainScreenContrastMin(out int pVal);
  // property MainScreenContrastMax
  /*[id(0x6001000E)]*/ int get_MainScreenContrastMax(out int pVal);
  // property MainScreenContrastDefault
  /*[id(0x6001000F)]*/ int get_MainScreenContrastDefault(out int pVal);
  // property OverlayGamma
  /*[id(0x60010010)]*/ int get_OverlayGamma(out int pVal);
  // property OverlayGamma
  /*[id(0x60010010)]*/ int set_OverlayGamma(int pVal);
  // property OverlayBrightness
  /*[id(0x60010012)]*/ int get_OverlayBrightness(out int pVal);
  // property OverlayBrightness
  /*[id(0x60010012)]*/ int set_OverlayBrightness(int pVal);
  // property OverlayContrast
  /*[id(0x60010014)]*/ int get_OverlayContrast(out int pVal);
  // property OverlayContrast
  /*[id(0x60010014)]*/ int set_OverlayContrast(int pVal);
  // property OverlaySaturation
  /*[id(0x60010016)]*/ int get_OverlaySaturation(out int pVal);
  // property OverlaySaturation
  /*[id(0x60010016)]*/ int set_OverlaySaturation(int pVal);
  // property OverlayGammaMin
  /*[id(0x60010018)]*/ int get_OverlayGammaMin(out int pVal);
  // property OverlayGammaMax
  /*[id(0x60010019)]*/ int get_OverlayGammaMax(out int pVal);
  // property OverlayGammaDefault
  /*[id(0x6001001A)]*/ int get_OverlayGammaDefault(out int pVal);
  // property OverlayBrightnessMin
  /*[id(0x6001001B)]*/ int get_OverlayBrightnessMin(out int pVal);
  // property OverlayBrightnessMax
  /*[id(0x6001001C)]*/ int get_OverlayBrightnessMax(out int pVal);
  // property OverlayBrightnessDefault
  /*[id(0x6001001D)]*/ int get_OverlayBrightnessDefault(out int pVal);
  // property OverlayContrastMin
  /*[id(0x6001001E)]*/ int get_OverlayContrastMin(out int pVal);
  // property OverlayContrastMax
  /*[id(0x6001001F)]*/ int get_OverlayContrastMax(out int pVal);
  // property OverlayContrastDefault
  /*[id(0x60010020)]*/ int get_OverlayContrastDefault(out int pVal);
  // property OverlayContrastMin
  /*[id(0x60010021)]*/ int get_OverlaySaturationMin(out int pVal);
  // property OverlayContrastMax
  /*[id(0x60010022)]*/ int get_OverlaySaturationMax(out int pVal);
  // property OverlayContrastDefault
  /*[id(0x60010023)]*/ int get_OverlaySaturationDefault(out int pVal);
  // property OverlaySurface
  /*[id(0x60010024)]*/ int get_OverlaySurface(IUnknown pddUnk, int cx, int cy, out IUnknown pVal);
  // method ReleaseOverlaySurface
  /*[id(0x60010025)]*/ int ReleaseOverlaySurface();
  // property Scheme
  /*[id(0x60010026)]*/ int get_Scheme(wchar* bsSchemeName, out IScheme pVal);
  // property Scheme
  /*[id(0x60010026)]*/ int set_Scheme(wchar* bsSchemeName, IScheme pVal);
  // method DeleteScheme
  /*[id(0x60010028)]*/ int DeleteScheme(wchar* bsSchemeName);
  // property AvailableSchemes
  /*[id(0x60010029)]*/ int get_AvailableSchemes(out wchar* pVal);
  // method ApplyScheme
  /*[id(0x6001002A)]*/ int ApplyScheme(IScheme pScheme, int bSyncMode);
  // property IsOverlaySupported
  /*[id(0x6001002B)]*/ int get_IsOverlaySupported(out int pVal);
  // property GammaRamp
  /*[id(0x6001002C)]*/ int get_GammaRamp(int cb, ref ubyte pVal);
}

// IVideoCapture Interface
interface IVideoCapture : IUnknown {
  mixin(uuid("3c670142-eccd-11d2-b561-00a0c92e6848"));
  // static DWINGUID IID = { 0x3c670142, 0xeccd, 0x11d2, 0xb5, 0x61, 0x00, 0xa0, 0xc9, 0x2e, 0x68, 0x48 };
  // property IsSupported
  /*[id(0x60010000)]*/ int get_IsSupported(out int pVal);
}

// IDVD Interface
interface IDVD : IUnknown {
  mixin(uuid("3c670141-eccd-11d2-b561-00a0c92e6848"));
  // static DWINGUID IID = { 0x3c670141, 0xeccd, 0x11d2, 0xb5, 0x61, 0x00, 0xa0, 0xc9, 0x2e, 0x68, 0x48 };
  // property IsSupported
  /*[id(0x60010000)]*/ int get_IsSupported(out int pVal);
}

// ITVTuner Interface
interface ITVTuner : IUnknown {
  mixin(uuid("3c670140-eccd-11d2-b561-00a0c92e6848"));
  // static DWINGUID IID = { 0x3c670140, 0xeccd, 0x11d2, 0xb5, 0x61, 0x00, 0xa0, 0xc9, 0x2e, 0x68, 0x48 };
  // property IsSupported
  /*[id(0x60010000)]*/ int get_IsSupported(out int pVal);
}

// ITVOut Interface
interface ITVOut : IUnknown {
  mixin(uuid("ed8f24c0-ddeb-11d2-b561-00a0c92e6848"));
  // static DWINGUID IID = { 0xed8f24c0, 0xddeb, 0x11d2, 0xb5, 0x61, 0x00, 0xa0, 0xc9, 0x2e, 0x68, 0x48 };
  // property IsOn
  /*[id(0x60010000)]*/ int get_IsOn(out int pVal);
  // property IsConnected
  /*[id(0x60010001)]*/ int get_IsConnected(out int pVal);
  // property IsSupported
  /*[id(0x60010002)]*/ int get_IsSupported(out int pVal);
  // property IsGraphicsModeValid
  /*[id(0x60010003)]*/ int get_IsGraphicsModeValid(wchar* newVal, out int pVal);
  // property Format
  /*[id(0x60010004)]*/ int get_Format(out int pVal);
  // property Format
  /*[id(0x60010004)]*/ int set_Format(int pVal);
  // property AvailableFormats
  /*[id(0x60010006)]*/ int get_AvailableFormats(out int pVal);
  // property DefaultFormat
  /*[id(0x60010007)]*/ int get_DefaultFormat(out int pVal);
  // property DefaultFormat
  /*[id(0x60010007)]*/ int set_DefaultFormat(int pVal);
  // property Enabled
  /*[id(0x60010009)]*/ int get_Enabled(out int pVal);
  // property Enabled
  /*[id(0x60010009)]*/ int set_Enabled(int pVal);
  // property FlickerFilter
  /*[id(0x6001000B)]*/ int get_FlickerFilter(out int pVal);
  // property FlickerFilter
  /*[id(0x6001000B)]*/ int set_FlickerFilter(int pVal);
  // property Brightness
  /*[id(0x6001000D)]*/ int get_Brightness(out int pVal);
  // property Brightness
  /*[id(0x6001000D)]*/ int set_Brightness(int pVal);
  // property Contrast
  /*[id(0x6001000F)]*/ int get_Contrast(out int pVal);
  // property Contrast
  /*[id(0x6001000F)]*/ int set_Contrast(int pVal);
  // property Saturation
  /*[id(0x60010011)]*/ int get_Saturation(out int pVal);
  // property Saturation
  /*[id(0x60010011)]*/ int set_Saturation(int pVal);
  // property FlickerFilterMin
  /*[id(0x60010013)]*/ int get_FlickerFilterMin(out int pVal);
  // property FlickerFilterMax
  /*[id(0x60010014)]*/ int get_FlickerFilterMax(out int pVal);
  // property BrightnessMin
  /*[id(0x60010015)]*/ int get_BrightnessMin(out int pVal);
  // property BrightnessMax
  /*[id(0x60010016)]*/ int get_BrightnessMax(out int pVal);
  // property ContrastMin
  /*[id(0x60010017)]*/ int get_ContrastMin(out int pVal);
  // property ContrastMax
  /*[id(0x60010018)]*/ int get_ContrastMax(out int pVal);
  // property SaturationMin
  /*[id(0x60010019)]*/ int get_SaturationMin(out int pVal);
  // property SaturationMax
  /*[id(0x6001001A)]*/ int get_SaturationMax(out int pVal);
  // property Pos
  /*[id(0x6001001B)]*/ int get_Pos(uint Pos, out int pVal);
  // property Pos
  /*[id(0x6001001B)]*/ int set_Pos(uint Pos, int pVal);
  // property PosPct
  /*[id(0x6001001D)]*/ int get_PosPct(uint Pos, out int pVal);
  // property PosPct
  /*[id(0x6001001D)]*/ int set_PosPct(uint Pos, int pVal);
  // property MinPos
  /*[id(0x6001001F)]*/ int get_MinPos(uint MinPos, out int pVal);
  // property MaxPos
  /*[id(0x60010020)]*/ int get_MaxPos(uint MaxPos, out int pVal);
  // property OverScan
  /*[id(0x60010021)]*/ int get_OverScan(out int pVal);
  // property OverScan
  /*[id(0x60010021)]*/ int set_OverScan(int pVal);
  // property Mode
  /*[id(0x60010023)]*/ int get_Mode(out int pVal);
  // property Mode
  /*[id(0x60010023)]*/ int set_Mode(int pVal);
  // property AvailableModes
  /*[id(0x60010025)]*/ int get_AvailableModes(out int pVal);
}

// ITVOut2 Interface
interface ITVOut2 : IUnknown {
  mixin(uuid("9dbd8ee5-66d5-11d4-b561-00a0c92e6848"));
  // static DWINGUID IID = { 0x9dbd8ee5, 0x66d5, 0x11d4, 0xb5, 0x61, 0x00, 0xa0, 0xc9, 0x2e, 0x68, 0x48 };
  // property DeviceNumber
  /*[id(0x60010000)]*/ int get_DeviceNumber(out uint pVal);
  // property DeviceNumber
  /*[id(0x60010000)]*/ int set_DeviceNumber(uint pVal);
  // property GraphicsMode
  /*[id(0x60010002)]*/ int get_GraphicsMode(out wchar* pVal);
  // property GraphicsMode
  /*[id(0x60010002)]*/ int set_GraphicsMode(wchar* pVal);
  // property IsGraphicsModeValid
  /*[id(0x60010004)]*/ int get_IsGraphicsModeValid(wchar* newVal, out int pVal);
  // property AvailableGraphicsModes
  /*[id(0x60010005)]*/ int get_AvailableGraphicsModes(out wchar* pVal);
  // property IsConnected
  /*[id(0x60010006)]*/ int get_IsConnected(out int pVal);
  // property IsSupported
  /*[id(0x60010007)]*/ int get_IsSupported(out int pVal);
  // property IsOn
  /*[id(0x60010008)]*/ int get_IsOn(out int pVal);
  // property Enabled
  /*[id(0x60010009)]*/ int get_Enabled(out int pVal);
  // property Enabled
  /*[id(0x60010009)]*/ int set_Enabled(int pVal);
  // property AvailableRefreshRates
  /*[id(0x6001000B)]*/ int get_AvailableRefreshRates(out wchar* pVal);
  // property RefreshRate
  /*[id(0x6001000C)]*/ int get_RefreshRate(out int pVal);
  // property RefreshRate
  /*[id(0x6001000C)]*/ int set_RefreshRate(int pVal);
  // property Format
  /*[id(0x6001000E)]*/ int get_Format(out int pVal);
  // property Format
  /*[id(0x6001000E)]*/ int set_Format(int pVal);
  // property AvailableFormats
  /*[id(0x60010010)]*/ int get_AvailableFormats(out int pVal);
  // property DefaultFormat
  /*[id(0x60010011)]*/ int get_DefaultFormat(out int pVal);
  // property DefaultFormat
  /*[id(0x60010011)]*/ int set_DefaultFormat(int pVal);
  // property FlickerFilter
  /*[id(0x60010013)]*/ int get_FlickerFilter(out int pVal);
  // property FlickerFilter
  /*[id(0x60010013)]*/ int set_FlickerFilter(int pVal);
  // property Brightness
  /*[id(0x60010015)]*/ int get_Brightness(out int pVal);
  // property Brightness
  /*[id(0x60010015)]*/ int set_Brightness(int pVal);
  // property Contrast
  /*[id(0x60010017)]*/ int get_Contrast(out int pVal);
  // property Contrast
  /*[id(0x60010017)]*/ int set_Contrast(int pVal);
  // property Saturation
  /*[id(0x60010019)]*/ int get_Saturation(out int pVal);
  // property Saturation
  /*[id(0x60010019)]*/ int set_Saturation(int pVal);
  // property FlickerFilterMin
  /*[id(0x6001001B)]*/ int get_FlickerFilterMin(out int pVal);
  // property FlickerFilterMax
  /*[id(0x6001001C)]*/ int get_FlickerFilterMax(out int pVal);
  // property BrightnessMin
  /*[id(0x6001001D)]*/ int get_BrightnessMin(out int pVal);
  // property BrightnessMax
  /*[id(0x6001001E)]*/ int get_BrightnessMax(out int pVal);
  // property ContrastMin
  /*[id(0x6001001F)]*/ int get_ContrastMin(out int pVal);
  // property ContrastMax
  /*[id(0x60010020)]*/ int get_ContrastMax(out int pVal);
  // property SaturationMin
  /*[id(0x60010021)]*/ int get_SaturationMin(out int pVal);
  // property SaturationMax
  /*[id(0x60010022)]*/ int get_SaturationMax(out int pVal);
  // property Pos
  /*[id(0x60010023)]*/ int get_Pos(uint Pos, out int pVal);
  // property Pos
  /*[id(0x60010023)]*/ int set_Pos(uint Pos, int pVal);
  // property PosPct
  /*[id(0x60010025)]*/ int get_PosPct(uint Pos, out int pVal);
  // property PosPct
  /*[id(0x60010025)]*/ int set_PosPct(uint Pos, int pVal);
  // property MinPos
  /*[id(0x60010027)]*/ int get_MinPos(uint MinPos, out int pVal);
  // property MaxPos
  /*[id(0x60010028)]*/ int get_MaxPos(uint MaxPos, out int pVal);
  // property OverScan
  /*[id(0x60010029)]*/ int get_OverScan(out int pVal);
  // property OverScan
  /*[id(0x60010029)]*/ int set_OverScan(int pVal);
  // property Mode
  /*[id(0x6001002B)]*/ int get_Mode(out int pVal);
  // property Mode
  /*[id(0x6001002B)]*/ int set_Mode(int pVal);
  // property AvailableModes
  /*[id(0x6001002D)]*/ int get_AvailableModes(out int pVal);
  // property Sharpness
  /*[id(0x6001002E)]*/ int set_Sharpness(int pVal);
  // property Sharpness
  /*[id(0x6001002E)]*/ int get_Sharpness(out int pVal);
  // property SharpnessMin
  /*[id(0x60010030)]*/ int get_SharpnessMin(out int pVal);
  // property SharpnessMax
  /*[id(0x60010031)]*/ int get_SharpnessMax(out int pVal);
  // property OverScanSize
  /*[id(0x60010032)]*/ int get_OverScanSize(uint Direction, out int pVal);
  // property OverScanSize
  /*[id(0x60010032)]*/ int set_OverScanSize(uint Direction, int pVal);
  // property OverScanSizeMin
  /*[id(0x60010034)]*/ int get_OverScanSizeMin(uint Direction, out int pVal);
  // property OverScanSizeMax
  /*[id(0x60010035)]*/ int get_OverScanSizeMax(uint Direction, out int newVal);
  // property SaturationStep
  /*[id(0x60010036)]*/ int get_SaturationStep(out int pVal);
  // property SaturationDefault
  /*[id(0x60010037)]*/ int get_SaturationDefault(out int pVal);
  // property Hue
  /*[id(0x60010038)]*/ int set_Hue(int pVal);
  // property Hue
  /*[id(0x60010038)]*/ int get_Hue(out int pVal);
  // property HueMin
  /*[id(0x6001003A)]*/ int get_HueMin(out int pVal);
  // property HueMax
  /*[id(0x6001003B)]*/ int get_HueMax(out int pVal);
  // property HueStep
  /*[id(0x6001003C)]*/ int get_HueStep(out int pVal);
  // property HueDefault
  /*[id(0x6001003D)]*/ int get_HueDefault(out int pVal);
  // property LumaFilter
  /*[id(0x6001003E)]*/ int set_LumaFilter(int pVal);
  // property LumaFilter
  /*[id(0x6001003E)]*/ int get_LumaFilter(out int pVal);
  // property LumaFilterMin
  /*[id(0x60010040)]*/ int get_LumaFilterMin(out int pVal);
  // property LumaFilterMax
  /*[id(0x60010041)]*/ int get_LumaFilterMax(out int pVal);
  // property LumaFilterStep
  /*[id(0x60010042)]*/ int get_LumaFilterStep(out int pVal);
  // property LumaFilterDefault
  /*[id(0x60010043)]*/ int get_LumaFilterDefault(out int pVal);
  // property ChromaFilter
  /*[id(0x60010044)]*/ int set_ChromaFilter(int pVal);
  // property ChromaFilter
  /*[id(0x60010044)]*/ int get_ChromaFilter(out int pVal);
  // property ChromaFilterMin
  /*[id(0x60010046)]*/ int get_ChromaFilterMin(out int pVal);
  // property ChromaFilterMax
  /*[id(0x60010047)]*/ int get_ChromaFilterMax(out int pVal);
  // property ChromaFilterStep
  /*[id(0x60010048)]*/ int get_ChromaFilterStep(out int pVal);
  // property ChromaFilterDefault
  /*[id(0x60010049)]*/ int get_ChromaFilterDefault(out int pVal);
  // property SharpnessStep
  /*[id(0x6001004A)]*/ int get_SharpnessStep(out int pVal);
  // property SharpnessDefault
  /*[id(0x6001004B)]*/ int get_SharpnessDefault(out int pVal);
  // property AdaptiveFlickerFilter
  /*[id(0x6001004C)]*/ int set_AdaptiveFlickerFilter(int pVal);
  // property AdaptiveFlickerFilter
  /*[id(0x6001004C)]*/ int get_AdaptiveFlickerFilter(out int pVal);
  // property AdaptiveFlickerFilterMin
  /*[id(0x6001004E)]*/ int get_AdaptiveFlickerFilterMin(out int pVal);
  // property AdaptiveFlickerFilterMax
  /*[id(0x6001004F)]*/ int get_AdaptiveFlickerFilterMax(out int pVal);
  // property AdaptiveFlickerFilterStep
  /*[id(0x60010050)]*/ int get_AdaptiveFlickerFilterStep(out int pVal);
  // property AdaptiveFlickerFilterDefault
  /*[id(0x60010051)]*/ int get_AdaptiveFlickerFilterDefault(out int pVal);
  // property DotCrawl
  /*[id(0x60010052)]*/ int set_DotCrawl(int pVal);
  // property DotCrawl
  /*[id(0x60010052)]*/ int get_DotCrawl(out int pVal);
  // property DotCrawlMin
  /*[id(0x60010054)]*/ int get_DotCrawlMin(out int pVal);
  // property DotCrawlMax
  /*[id(0x60010055)]*/ int get_DotCrawlMax(out int pVal);
  // property DotCrawlStep
  /*[id(0x60010056)]*/ int get_DotCrawlStep(out int pVal);
  // property DotCrawlDefault
  /*[id(0x60010057)]*/ int get_DotCrawlDefault(out int pVal);
  // property DACModeRGB
  /*[id(0x60010058)]*/ int set_DACModeRGB(int bActivate);
  // property DACModeYC
  /*[id(0x60010059)]*/ int set_DACModeYC(int bActivate);
  // property DACModeComposite
  /*[id(0x6001005A)]*/ int set_DACModeComposite(int bActivate);
  // property DACModeHDTV
  /*[id(0x6001005B)]*/ int set_DACModeHDTV(int bActivate);
  // property DACModeHDRGB
  /*[id(0x6001005C)]*/ int set_DACModeHDRGB(int bActivate);
  // property DACModeComponent
  /*[id(0x6001005D)]*/ int set_DACModeComponent(int bActivate);
  // property DefaultDACModeRGB
  /*[id(0x6001005E)]*/ int get_DefaultDACModeRGB(out int bActivate);
  // property DefaultDACModeYC
  /*[id(0x6001005F)]*/ int get_DefaultDACModeYC(out int bActivate);
  // property DefaultDACModeComposite
  /*[id(0x60010060)]*/ int get_DefaultDACModeComposite(out int bActivate);
  // property DefaultDACModeHDTV
  /*[id(0x60010061)]*/ int get_DefaultDACModeHDTV(out int bActivate);
  // property DefaultDACModeHDRGB
  /*[id(0x60010062)]*/ int get_DefaultDACModeHDRGB(out int bActivate);
  // property DefaultDACModeComponent
  /*[id(0x60010063)]*/ int get_DefaultDACModeComponent(out int bActivate);
  // property DACModeRGB
  /*[id(0x60010058)]*/ int get_DACModeRGB(out int bActivate);
  // property DACModeYC
  /*[id(0x60010059)]*/ int get_DACModeYC(out int bActivate);
  // property DACModeComposite
  /*[id(0x6001005A)]*/ int get_DACModeComposite(out int bActivate);
  // property DACModeHDTV
  /*[id(0x6001005B)]*/ int get_DACModeHDTV(out int bActivate);
  // property DACModeHDRGB
  /*[id(0x6001005C)]*/ int get_DACModeHDRGB(out int bActivate);
  // property DACModeComponent
  /*[id(0x6001005D)]*/ int get_DACModeComponent(out int bActivate);
  // property _2DFlickerFilter
  /*[id(0x6001006A)]*/ int set__2DFlickerFilter(int pVal);
  // property _2DFlickerFilter
  /*[id(0x6001006A)]*/ int get__2DFlickerFilter(out int pVal);
  // property _2DFlickerFilterMin
  /*[id(0x6001006C)]*/ int get__2DFlickerFilterMin(out int pVal);
  // property _2DFlickerFilterMax
  /*[id(0x6001006D)]*/ int get__2DFlickerFilterMax(out int pVal);
  // property _2DFlickerFilterStep
  /*[id(0x6001006E)]*/ int get__2DFlickerFilterStep(out int pVal);
  // property _2DFlickerFilterDefault
  /*[id(0x6001006F)]*/ int get__2DFlickerFilterDefault(out int pVal);
  // method ForceGraphicsMode
  /*[id(0x60010070)]*/ int ForceGraphicsMode();
  // method OverScanSizeXY
  /*[id(0x60010071)]*/ int GetOverScanSizeXY(ref int pX, ref int pY);
  // method OverScanSizeXY
  /*[id(0x60010072)]*/ int PutOverScanSizeXY(int x, int y);
  // property AvailableBinaryGraphicsMode
  /*[id(0x60010073)]*/ int get_AvailableBinaryGraphicsMode(int dwindex, out wireHGLOBAL pVal);
  // property GammaRamp
  /*[id(0x60010074)]*/ int get_GammaRamp(int cb, ref ubyte pVal);
  // property MainScreenGamma
  /*[id(0x60010075)]*/ int get_MainScreenGamma(uint color, out int pVal);
  // property MainScreenGamma
  /*[id(0x60010075)]*/ int set_MainScreenGamma(uint color, int pVal);
  // property MainScreenBrightness
  /*[id(0x60010077)]*/ int get_MainScreenBrightness(uint color, out int pVal);
  // property MainScreenBrightness
  /*[id(0x60010077)]*/ int set_MainScreenBrightness(uint color, int pVal);
  // property MainScreenContrast
  /*[id(0x60010079)]*/ int get_MainScreenContrast(uint color, out int pVal);
  // property MainScreenContrast
  /*[id(0x60010079)]*/ int set_MainScreenContrast(uint color, int pVal);
  // property MainScreenGammaMin
  /*[id(0x6001007B)]*/ int get_MainScreenGammaMin(out int pVal);
  // property MainScreenGammaMax
  /*[id(0x6001007C)]*/ int get_MainScreenGammaMax(out int pVal);
  // property MainScreenGammaDefault
  /*[id(0x6001007D)]*/ int get_MainScreenGammaDefault(out int pVal);
  // property MainScreenBrightnessMin
  /*[id(0x6001007E)]*/ int get_MainScreenBrightnessMin(out int pVal);
  // property MainScreenBrightnessMax
  /*[id(0x6001007F)]*/ int get_MainScreenBrightnessMax(out int pVal);
  // property MainScreenBrightnessDefault
  /*[id(0x60010080)]*/ int get_MainScreenBrightnessDefault(out int pVal);
  // property MainScreenContrastMin
  /*[id(0x60010081)]*/ int get_MainScreenContrastMin(out int pVal);
  // property MainScreenContrastMax
  /*[id(0x60010082)]*/ int get_MainScreenContrastMax(out int pVal);
  // property MainScreenContrastDefault
  /*[id(0x60010083)]*/ int get_MainScreenContrastDefault(out int pVal);
}

// IMCCS Interface
interface IMCCS : IUnknown {
  mixin(uuid("18f4eb60-91c7-11d3-b561-00a0c92e6848"));
  // static DWINGUID IID = { 0x18f4eb60, 0x91c7, 0x11d3, 0xb5, 0x61, 0x00, 0xa0, 0xc9, 0x2e, 0x68, 0x48 };
  // property Brightness
  /*[id(0x60010000)]*/ int get_Brightness(out int pVal);
  // property Brightness
  /*[id(0x60010000)]*/ int set_Brightness(int pVal);
  // method ResetBrightness
  /*[id(0x60010002)]*/ int ResetBrightness();
  // property BrightnessMin
  /*[id(0x60010003)]*/ int get_BrightnessMin(out int pVal);
  // property BrightnessMax
  /*[id(0x60010004)]*/ int get_BrightnessMax(out int pVal);
  // property Contrast
  /*[id(0x60010005)]*/ int get_Contrast(out int pVal);
  // property Contrast
  /*[id(0x60010005)]*/ int set_Contrast(int pVal);
  // method ResetContrast
  /*[id(0x60010007)]*/ int ResetContrast();
  // property ContrastMin
  /*[id(0x60010008)]*/ int get_ContrastMin(out int pVal);
  // property ContrastMax
  /*[id(0x60010009)]*/ int get_ContrastMax(out int pVal);
  // property Focus
  /*[id(0x6001000A)]*/ int get_Focus(out int pVal);
  // property Focus
  /*[id(0x6001000A)]*/ int set_Focus(int pVal);
  // method ResetFocus
  /*[id(0x6001000C)]*/ int ResetFocus();
  // property FocusMin
  /*[id(0x6001000D)]*/ int get_FocusMin(out int pVal);
  // property FocusMax
  /*[id(0x6001000E)]*/ int get_FocusMax(out int pVal);
  // property Pos
  /*[id(0x6001000F)]*/ int get_Pos(uint Pos, out int pVal);
  // property Pos
  /*[id(0x6001000F)]*/ int set_Pos(uint Pos, int pVal);
  // method ResetPos
  /*[id(0x60010011)]*/ int ResetPos(uint Pos);
  // property PosMin
  /*[id(0x60010012)]*/ int get_PosMin(uint Pos, out int pVal);
  // property PosMax
  /*[id(0x60010013)]*/ int get_PosMax(uint Pos, out int pVal);
  // property Size
  /*[id(0x60010014)]*/ int get_Size(uint Pos, out int pVal);
  // property Size
  /*[id(0x60010014)]*/ int set_Size(uint Pos, int pVal);
  // method ResetSize
  /*[id(0x60010016)]*/ int ResetSize(uint Pos);
  // property SizeMin
  /*[id(0x60010017)]*/ int get_SizeMin(uint Pos, out int pVal);
  // property SizeMax
  /*[id(0x60010018)]*/ int get_SizeMax(uint Pos, out int pVal);
  // property VideoGain
  /*[id(0x60010019)]*/ int get_VideoGain(uint color, out int pVal);
  // property VideoGain
  /*[id(0x60010019)]*/ int set_VideoGain(uint color, int pVal);
  // method ResetVideoGain
  /*[id(0x6001001B)]*/ int ResetVideoGain(uint color);
  // property VideoGainMin
  /*[id(0x6001001C)]*/ int get_VideoGainMin(uint color, out int pVal);
  // property VideoGainMax
  /*[id(0x6001001D)]*/ int get_VideoGainMax(uint color, out int pVal);
  // property Tilt
  /*[id(0x6001001E)]*/ int get_Tilt(out int pVal);
  // property Tilt
  /*[id(0x6001001E)]*/ int set_Tilt(int pVal);
  // method ResetTilt
  /*[id(0x60010020)]*/ int ResetTilt();
  // property TiltMin
  /*[id(0x60010021)]*/ int get_TiltMin(out int pVal);
  // property TiltMax
  /*[id(0x60010022)]*/ int get_TiltMax(out int pVal);
  // property VideoBlackLevel
  /*[id(0x60010023)]*/ int get_VideoBlackLevel(uint color, out int pVal);
  // property VideoBlackLevel
  /*[id(0x60010023)]*/ int set_VideoBlackLevel(uint color, int pVal);
  // method ResetVideoBlackLevel
  /*[id(0x60010025)]*/ int ResetVideoBlackLevel(uint color);
  // property VideoBlackLevelMin
  /*[id(0x60010026)]*/ int get_VideoBlackLevelMin(uint color, out int pVal);
  // property VideoBlackLevelMax
  /*[id(0x60010027)]*/ int get_VideoBlackLevelMax(uint color, out int pVal);
  // property Pincushion
  /*[id(0x60010028)]*/ int get_Pincushion(uint Pos, out int pVal);
  // property Pincushion
  /*[id(0x60010028)]*/ int set_Pincushion(uint Pos, int pVal);
  // method ResetPincushion
  /*[id(0x6001002A)]*/ int ResetPincushion(uint Pos);
  // property PincushionMin
  /*[id(0x6001002B)]*/ int get_PincushionMin(uint Pos, out int pVal);
  // property PincushionMax
  /*[id(0x6001002C)]*/ int get_PincushionMax(uint Pos, out int pVal);
  // property PincushionBal
  /*[id(0x6001002D)]*/ int get_PincushionBal(uint Pos, out int pVal);
  // property PincushionBal
  /*[id(0x6001002D)]*/ int set_PincushionBal(uint Pos, int pVal);
  // method ResetPincushionBal
  /*[id(0x6001002F)]*/ int ResetPincushionBal(uint Pos);
  // property PincushionBalMin
  /*[id(0x60010030)]*/ int get_PincushionBalMin(uint Pos, out int pVal);
  // property PincushionBalMax
  /*[id(0x60010031)]*/ int get_PincushionBalMax(uint Pos, out int pVal);
  // property Linearity
  /*[id(0x60010032)]*/ int get_Linearity(uint Pos, out int pVal);
  // property Linearity
  /*[id(0x60010032)]*/ int set_Linearity(uint Pos, int pVal);
  // method ResetLinearity
  /*[id(0x60010034)]*/ int ResetLinearity(uint Pos);
  // property LinearityMin
  /*[id(0x60010035)]*/ int get_LinearityMin(uint Pos, out int pVal);
  // property LinearityMax
  /*[id(0x60010036)]*/ int get_LinearityMax(uint Pos, out int pVal);
  // property LinearityBal
  /*[id(0x60010037)]*/ int get_LinearityBal(uint Pos, out int pVal);
  // property LinearityBal
  /*[id(0x60010037)]*/ int set_LinearityBal(uint Pos, int pVal);
  // method ResetLinearityBal
  /*[id(0x60010039)]*/ int ResetLinearityBal(uint Pos);
  // property LinearityBalMin
  /*[id(0x6001003A)]*/ int get_LinearityBalMin(uint Pos, out int pVal);
  // property LinearityBalMax
  /*[id(0x6001003B)]*/ int get_LinearityBalMax(uint Pos, out int pVal);
  // property TrapDist
  /*[id(0x6001003C)]*/ int get_TrapDist(out int pVal);
  // property TrapDist
  /*[id(0x6001003C)]*/ int set_TrapDist(int pVal);
  // method ResetTrapDist
  /*[id(0x6001003E)]*/ int ResetTrapDist();
  // property TrapDistMin
  /*[id(0x6001003F)]*/ int get_TrapDistMin(out int pVal);
  // property TrapDistMax
  /*[id(0x60010040)]*/ int get_TrapDistMax(out int pVal);
  // property ParalDist
  /*[id(0x60010041)]*/ int get_ParalDist(out int pVal);
  // property ParalDist
  /*[id(0x60010041)]*/ int set_ParalDist(int pVal);
  // method ResetParalDist
  /*[id(0x60010043)]*/ int ResetParalDist();
  // property ParalDistMin
  /*[id(0x60010044)]*/ int get_ParalDistMin(out int pVal);
  // property ParalDistMax
  /*[id(0x60010045)]*/ int get_ParalDistMax(out int pVal);
  // property Misconverg
  /*[id(0x60010046)]*/ int get_Misconverg(uint Pos, out int pVal);
  // property Misconverg
  /*[id(0x60010046)]*/ int set_Misconverg(uint Pos, int pVal);
  // method ResetMisconverg
  /*[id(0x60010048)]*/ int ResetMisconverg(uint Pos);
  // property MisconvergMin
  /*[id(0x60010049)]*/ int get_MisconvergMin(uint Pos, out int pVal);
  // property MisconvergMax
  /*[id(0x6001004A)]*/ int get_MisconvergMax(uint Pos, out int pVal);
  // property Frequency
  /*[id(0x6001004B)]*/ int get_Frequency(uint Pos, out int pVal);
  // property IsSupported
  /*[id(0x6001004C)]*/ int get_IsSupported(out int pVal);
  // method Degauss
  /*[id(0x6001004D)]*/ int Degauss();
  // property IsFeatureResetSupported
  /*[id(0x6001004E)]*/ int get_IsFeatureResetSupported(out int pVal);
}

// IConfigData Interface
interface IConfigData : IUnknown {
  mixin(uuid("298a0bc1-6950-11d4-b561-00a0c92e6848"));
  // static DWINGUID IID = { 0x298a0bc1, 0x6950, 0x11d4, 0xb5, 0x61, 0x00, 0xa0, 0xc9, 0x2e, 0x68, 0x48 };
  // property IsTestAble
  /*[id(0x60010000)]*/ int get_IsTestAble(out int pVal);
  // property AvailableOperatingModes
  /*[id(0x60010001)]*/ int get_AvailableOperatingModes(out uint pVal);
  // property AvailableDevices
  /*[id(0x60010002)]*/ int get_AvailableDevices(out uint pVal);
  // property CurrentDevices
  /*[id(0x60010003)]*/ int get_CurrentDevices(out uint pVal);
  // property AvailableOutputs
  /*[id(0x60010004)]*/ int get_AvailableOutputs(out uint pVal);
}

// ITestConfigData Interface
interface ITestConfigData : IUnknown {
  mixin(uuid("9dbd8ee1-66d5-11d4-b561-00a0c92e6848"));
  // static DWINGUID IID = { 0x9dbd8ee1, 0x66d5, 0x11d4, 0xb5, 0x61, 0x00, 0xa0, 0xc9, 0x2e, 0x68, 0x48 };
  // property IsInited
  /*[id(0x60010000)]*/ int get_IsInited(out int pVal);
  // property IsConfigValid
  /*[id(0x60010001)]*/ int get_IsConfigValid(out int pVal);
  // property OperatingMode
  /*[id(0x60010002)]*/ int get_OperatingMode(out uint pVal);
  // property OperatingMode
  /*[id(0x60010002)]*/ int set_OperatingMode(uint pVal);
  // property Devices
  /*[id(0x60010004)]*/ int get_Devices(out uint pVal);
  // property Devices
  /*[id(0x60010004)]*/ int set_Devices(uint pVal);
  // property Outputs
  /*[id(0x60010006)]*/ int get_Outputs(out uint pVal);
  // property Outputs
  /*[id(0x60010006)]*/ int set_Outputs(uint pVal);
}

// IMDS Interface
interface IMDS : IUnknown {
  mixin(uuid("cbcb305d-087f-4fc6-96cf-8fff9b6d782a"));
  // static DWINGUID IID = { 0xcbcb305d, 0x087f, 0x4fc6, 0x96, 0xcf, 0x8f, 0xff, 0x9b, 0x6d, 0x78, 0x2a };
  // property IsSupported
  /*[id(0x60010000)]*/ int get_IsSupported(out int pVal);
  // property NumberOfDisplays
  /*[id(0x60010001)]*/ int get_NumberOfDisplays(out uint pVal);
  // property ActiveNumberOfDisplays
  /*[id(0x60010002)]*/ int get_ActiveNumberOfDisplays(out uint pVal);
  // property DisplayName
  /*[id(0x60010003)]*/ int get_DisplayName(uint nDisplay, out wchar* pVal);
  // property MDSMode
  /*[id(0x60010004)]*/ int get_MDSMode(out int pVal);
  // property Enabled
  /*[id(0x60010005)]*/ int get_Enabled(uint nDisplay, out int pVal);
  // method Enable
  /*[id(0x60010006)]*/ int Enable(uint nDisplay, int newVal, _POINTL newPos);
  // property Primary
  /*[id(0x60010007)]*/ int get_Primary(out uint nDisplay);
  // property Primary
  /*[id(0x60010007)]*/ int set_Primary(uint nDisplay);
  // property Position
  /*[id(0x60010009)]*/ int get_Position(uint nDisplay, out _RECTL pPosition);
  // property Position
  /*[id(0x60010009)]*/ int set_Position(uint nDisplay, _RECTL pPosition);
  // property SelectedDisplay
  /*[id(0x6001000B)]*/ int get_SelectedDisplay(out uint nDisplay);
  // property SelectedDisplay
  /*[id(0x6001000B)]*/ int set_SelectedDisplay(uint nDisplay);
  // property SupportedPipeOfDevice
  /*[id(0x6001000D)]*/ int get_SupportedPipeOfDevice(uint nDevice, out wchar* pVal);
  // property VirtualPosition
  /*[id(0x6001000E)]*/ int get_VirtualPosition(out _RECTL pPosition);
  // property AvailableOperatingModes
  /*[id(0x6001000F)]*/ int get_AvailableOperatingModes(out uint pVal);
  // property AvailableDevices
  /*[id(0x60010010)]*/ int get_AvailableDevices(out uint pVal);
  // property CurrentDevices
  /*[id(0x60010011)]*/ int get_CurrentDevices(out uint pVal);
  // property AvailableOutputs
  /*[id(0x60010012)]*/ int get_AvailableOutputs(out uint pVal);
  // property CurrentOperatingMode
  /*[id(0x60010013)]*/ int get_CurrentOperatingMode(out uint pVal);
  // method GetDisplayDevices
  /*[id(0x60010014)]*/ int GetDisplayDevices(out uint pPrimaryDevices, out uint pSecondaryDevices);
  // method SetDisplayDevices
  /*[id(0x60010015)]*/ int SetDisplayDevices(uint dwPrimaryDevices, uint dwSecondaryDevices);
  // method Refresh
  /*[id(0x60010016)]*/ int Refresh();
}

// IRotation Interface
interface IRotation : IUnknown {
  mixin(uuid("ba1ae228-d780-4447-b999-d1598094578c"));
  // static DWINGUID IID = { 0xba1ae228, 0xd780, 0x4447, 0xb9, 0x99, 0xd1, 0x59, 0x80, 0x94, 0x57, 0x8c };
  // property IsSupported
  /*[id(0x60010000)]*/ int get_IsSupported(out int pVal);
  // property RotationCapability
  /*[id(0x60010001)]*/ int get_RotationCapability(out uint pVal);
  // property Rotation
  /*[id(0x60010002)]*/ int get_Rotation(out uint pVal);
  // property Rotation
  /*[id(0x60010002)]*/ int set_Rotation(uint pVal);
  // property Enabled
  /*[id(0x60010004)]*/ int get_Enabled(out int pVal);
  // property Enabled
  /*[id(0x60010004)]*/ int set_Enabled(int pVal);
  // property PortraitPolicy
  /*[id(0x60010006)]*/ int get_PortraitPolicy(out uint pVal);
  // property PortraitPolicy
  /*[id(0x60010006)]*/ int set_PortraitPolicy(uint pVal);
  // property LandscapePolicy
  /*[id(0x60010008)]*/ int get_LandscapePolicy(out uint pVal);
  // property LandscapePolicy
  /*[id(0x60010008)]*/ int set_LandscapePolicy(uint pVal);
}

// ISettings2 Interface
interface ISettings2 : ISettings {
  mixin(uuid("fc25aad6-62ef-4161-a48f-df3d47bd9455"));
  // static DWINGUID IID = { 0xfc25aad6, 0x62ef, 0x4161, 0xa4, 0x8f, 0xdf, 0x3d, 0x47, 0xbd, 0x94, 0x55 };
  // property PhysicalWidth
  /*[id(0x60020000)]*/ int get_PhysicalWidth(uint dwDisplayDevice, out uint pVal);
  // property PhysicalHeight
  /*[id(0x60020001)]*/ int get_PhysicalHeight(uint dwDisplayDevice, out uint pVal);
  // property DisplayWidth
  /*[id(0x60020002)]*/ int get_DisplayWidth(uint dwDisplayDevice, out uint pVal);
  // property DisplayHeight
  /*[id(0x60020003)]*/ int get_DisplayHeight(uint dwDisplayDevice, out uint pVal);
  // property Scaling
  /*[id(0x60020004)]*/ int get_Scaling(uint dwDisplayDevice, out int pVal);
  // property ViewPort
  /*[id(0x60020005)]*/ int get_ViewPort(uint dwDisplayDevice, out tagPOINT pVal);
}

// IGenerator Interface
interface IGenerator : IUnknown {
  mixin(uuid("97dc3662-693d-11d4-b561-00a0c92e6848"));
  // static DWINGUID IID = { 0x97dc3662, 0x693d, 0x11d4, 0xb5, 0x61, 0x00, 0xa0, 0xc9, 0x2e, 0x68, 0x48 };
  // property ICUIService
  /*[id(0x60010000)]*/ int set_ICUIService(ICUIService value);
  // method Generate
  /*[id(0x60010001)]*/ int Generate();
}

// ITestConfig Interface
interface ITestConfig : IUnknown {
  mixin(uuid("b390d3e1-66d4-11d4-b561-00a0c92e6848"));
  // static DWINGUID IID = { 0xb390d3e1, 0x66d4, 0x11d4, 0xb5, 0x61, 0x00, 0xa0, 0xc9, 0x2e, 0x68, 0x48 };
  // Get next celt CTestConfig objects
  /*[id(0x60010000)]*/ int Next(uint celt, out ITestConfigData ppTestConfig, out uint pCeltFetched);
  // Skip next celt Supported guid elements
  /*[id(0x60010001)]*/ int Skip(uint celt);
  // Reset the enumerator
  /*[id(0x60010002)]*/ int Reset();
  // Make a copy of the enumerator
  /*[id(0x60010003)]*/ int Clone(out ITestConfig ppEnum);
}

// CoClasses

// CUIService Class
abstract class CoCUIService {
  mixin(uuid("0f195fa1-ccf0-11d2-8b20-00a0c93cb1f4"));
  // static DWINGUID CLSID = { 0x0f195fa1, 0xccf0, 0x11d2, 0x8b, 0x20, 0x00, 0xa0, 0xc9, 0x3c, 0xb1, 0xf4 };
  mixin Interfaces!(ICUIService, IWindowsData, I3D, ISettings, IFlatPanel, ICRT, IFlatPanel2, IIntFlatPanel, IScheme, IColor, IVideoCapture, IDVD, ITVTuner, ITVOut, ITVOut2, IMCCS, IConfigData, ITestConfigData, IMDS, IRotation, ISettings2);
}

// CUITestConfig Class
abstract class CoTestConfig {
  mixin(uuid("97dc3661-693d-11d4-b561-00a0c92e6848"));
  // static DWINGUID CLSID = { 0x97dc3661, 0x693d, 0x11d4, 0xb5, 0x61, 0x00, 0xa0, 0xc9, 0x2e, 0x68, 0x48 };
  mixin Interfaces!(IGenerator, ITestConfig);
}
