// igfxdiag 1.0 Type Library
// Version 1.0

/*[uuid("0ef91a80-03d5-11d3-b995-00a0c9ad54b5")]*/
//module dwin.sys.win32.com.tlb.more.igfxdiag;
module dwin.sys.win32.com.tlb.more.igfxdgps;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// IDiagServices Interface
interface IDiagServices : IUnknown {
  mixin(uuid("0ef91a8d-03d5-11d3-b995-00a0c9ad54b5"));
  // static DWINGUID IID = { 0x0ef91a8d, 0x03d5, 0x11d3, 0xb9, 0x95, 0x00, 0xa0, 0xc9, 0xad, 0x54, 0xb5 };
  // property DeviceName
  /*[id(0x60010000)]*/ int get_DeviceName(out wchar* pVal);
  // property DeviceName
  /*[id(0x60010000)]*/ int set_DeviceName(wchar* pVal);
}

// IDiagServices2 Interface
interface IDiagServices2 : IDiagServices {
  mixin(uuid("1d775861-25c6-11d4-aca5-00a0c9ad5629"));
  // static DWINGUID IID = { 0x1d775861, 0x25c6, 0x11d4, 0xac, 0xa5, 0x00, 0xa0, 0xc9, 0xad, 0x56, 0x29 };
  // property DeviceNumber
  /*[id(0x60020000)]*/ int get_DeviceNumber(out uint pVal);
  // property DeviceNumber
  /*[id(0x60020000)]*/ int set_DeviceNumber(uint pVal);
  // property Output
  /*[id(0x60020002)]*/ int get_Output(out int pVal);
  // property Output
  /*[id(0x60020002)]*/ int set_Output(int pVal);
  // property DeviceType
  /*[id(0x60020004)]*/ int get_DeviceType(out int pVal);
  // property DeviceType
  /*[id(0x60020004)]*/ int set_DeviceType(int pVal);
  // property NumberOfOutputs
  /*[id(0x60020006)]*/ int get_NumberOfOutputs(out int pVal);
  // property CurrentDevices
  /*[id(0x60020007)]*/ int get_CurrentDevices(out int pVal);
  // property SupportedDevices
  /*[id(0x60020008)]*/ int get_SupportedDevices(out int pVal);
  // property DDCLevelSupported
  /*[id(0x60020009)]*/ int get_DDCLevelSupported(out int pVal);
}

// ICUIPCI Interface
interface ICUIPCI : IUnknown {
  mixin(uuid("e0ba4ee1-03d5-11d3-b995-00a0c9ad54b5"));
  // static DWINGUID IID = { 0xe0ba4ee1, 0x03d5, 0x11d3, 0xb9, 0x95, 0x00, 0xa0, 0xc9, 0xad, 0x54, 0xb5 };
  // property DeviceID
  /*[id(0x60010000)]*/ int get_DeviceID(out short pVal);
  // property PCIRevision
  /*[id(0x60010001)]*/ int get_PCIRevision(out short pVal);
  // property PCIBaseMemoryAddress
  /*[id(0x60010002)]*/ int get_PCIBaseMemoryAddress(out int pVal);
  // property PCIMEMIOAddress
  /*[id(0x60010003)]*/ int get_PCIMEMIOAddress(out int pVal);
  // property IsSupported
  /*[id(0x60010004)]*/ int get_IsSupported(out int pVal);
  // property InitDeviceInfo
  /*[id(0x60010005)]*/ int get_InitDeviceInfo(out wchar* pVal);
  // property VendorIDStr
  /*[id(0x60010006)]*/ int get_VendorIDStr(out wchar* pVal);
  // property DeviceIdStr
  /*[id(0x60010007)]*/ int get_DeviceIDStr(out wchar* pVal);
  // property VendorID
  /*[id(0x60010008)]*/ int get_VendorID(out short pVal);
  // method WriteReport
  /*[id(0x60010009)]*/ int WriteReport(int fileHandle);
}

// ICUIAGP Interface
interface ICUIAGP : IUnknown {
  mixin(uuid("e0ba4ee2-03d5-11d3-b995-00a0c9ad54b5"));
  // static DWINGUID IID = { 0xe0ba4ee2, 0x03d5, 0x11d3, 0xb9, 0x95, 0x00, 0xa0, 0xc9, 0xad, 0x54, 0xb5 };
  // property MinorVersion
  /*[id(0x60010000)]*/ int get_MinorVersion(out short pVal);
  // property IsMasterTrafficEnabled
  /*[id(0x60010001)]*/ int get_IsMasterTrafficEnabled(out int pVal);
  // property MasterDataTrafficRate
  /*[id(0x60010002)]*/ int get_MasterDataTrafficRate(out short pVal);
  // property IsMaterSideBandAddrEnabled
  /*[id(0x60010003)]*/ int get_IsMaterSideBandAddrEnabled(out int pVal);
  // property AGPRequestQueueDepth
  /*[id(0x60010004)]*/ int get_AGPRequestQueueDepth(out short pVal);
  // property MajorVersion
  /*[id(0x60010005)]*/ int get_MajorVersion(out short pVal);
  // property MaxRequestsSupported
  /*[id(0x60010006)]*/ int get_MaxRequestsSupported(out short pVal);
  // property TargetDataTransferRate
  /*[id(0x60010007)]*/ int get_TargetDataTransferRate(out short pVal);
  // property IsTargetSidebandAddrEnabled
  /*[id(0x60010008)]*/ int get_IsTargetSidebandAddrEnabled(out int pVal);
  // property IsSupported
  /*[id(0x60010009)]*/ int get_IsSupported(out int pVal);
  // method WriteReport
  /*[id(0x6001000A)]*/ int WriteReport(int fileHandle);
}

// ICUIMonitor Interface
interface ICUIMonitor : IUnknown {
  mixin(uuid("e0ba4ee3-03d5-11d3-b995-00a0c9ad54b5"));
  // static DWINGUID IID = { 0xe0ba4ee3, 0x03d5, 0x11d3, 0xb9, 0x95, 0x00, 0xa0, 0xc9, 0xad, 0x54, 0xb5 };
  // property MonitorName
  /*[id(0x60010000)]*/ int get_MonitorName(out wchar* pVal);
  // property MonitorType
  /*[id(0x60010001)]*/ int get_MonitorType(out ubyte pVal);
  // property MonitorSerialNumber
  /*[id(0x60010002)]*/ int get_MonitorSerialNumber(out wchar* pVal);
  // property MonitorGammaValue
  /*[id(0x60010003)]*/ int get_MonitorGammaValue(out float pVal);
  // property MonitorHorzDimInInches
  /*[id(0x60010004)]*/ int get_MonitorHorzDimInInches(out float pVal);
  // property MonitorVertDimInInches
  /*[id(0x60010005)]*/ int get_MonitorVertDimInInches(out float pVal);
  // property DDCLevelSupported
  /*[id(0x60010006)]*/ int get_DDCLevelSupported(out int pVal);
  // property DPMS_StandByMode
  /*[id(0x60010007)]*/ int get_DPMS_StandByMode(out int pVal);
  // property DPMS_SuspendMode
  /*[id(0x60010008)]*/ int get_DPMS_SuspendMode(out int pVal);
  // property DPMS_ActiveMode
  /*[id(0x60010009)]*/ int get_DPMS_ActiveMode(out int pVal);
  // property MonitorSupportedModes
  /*[id(0x6001000A)]*/ int get_MonitorSupportedModes(out wchar* pVal);
  // property IsSupported
  /*[id(0x6001000B)]*/ int get_IsSupported(out int pVal);
  // method WriteReport
  /*[id(0x6001000C)]*/ int WriteReport(int fileHandle);
}

// ICUIMonitor Interface2
interface ICUIMonitor2 : ICUIMonitor {
  mixin(uuid("6e196803-c47a-11d4-903d-00d0b7680d87"));
  // static DWINGUID IID = { 0x6e196803, 0xc47a, 0x11d4, 0x90, 0x3d, 0x00, 0xd0, 0xb7, 0x68, 0x0d, 0x87 };
  // property WriteReport
  /*[id(0x60020000)]*/ int get_WriteReport(out wchar* pVal);
}

// ICUIReport Interface
interface ICUIReport : IUnknown {
  mixin(uuid("e0ba4ee5-03d5-11d3-b995-00a0c9ad54b5"));
  // static DWINGUID IID = { 0xe0ba4ee5, 0x03d5, 0x11d3, 0xb9, 0x95, 0x00, 0xa0, 0xc9, 0xad, 0x54, 0xb5 };
  // property IsSupported
  /*[id(0x60010000)]*/ int get_IsSupported(out int pVal);
}

// ICUITests Interface
interface ICUITests : IUnknown {
  mixin(uuid("e0ba4ee4-03d5-11d3-b995-00a0c9ad54b5"));
  // static DWINGUID IID = { 0xe0ba4ee4, 0x03d5, 0x11d3, 0xb9, 0x95, 0x00, 0xa0, 0xc9, 0xad, 0x54, 0xb5 };
  // property IsSupported
  /*[id(0x60010000)]*/ int get_IsSupported(out int pVal);
}

// ICUIDriverInfo Interface
interface ICUIDriverInfo : IUnknown {
  mixin(uuid("c562a581-4989-11d3-8ee0-00a0c984f371"));
  // static DWINGUID IID = { 0xc562a581, 0x4989, 0x11d3, 0x8e, 0xe0, 0x00, 0xa0, 0xc9, 0x84, 0xf3, 0x71 };
  // property IsSupported
  /*[id(0x60010000)]*/ int get_IsSupported(out int pVal);
  // property DriverName
  /*[id(0x60010001)]*/ int get_DriverDescription(out wchar* pVal);
  // property DriverFileList
  /*[id(0x60010002)]*/ int get_DriverFileList(out wchar* pVal);
  // method WriteReport
  /*[id(0x60010003)]*/ int WriteReport(int fileHandle);
}

// ICUIDriverInfo Interface2
interface ICUIDriverInfo2 : ICUIDriverInfo {
  mixin(uuid("6e196804-c47a-11d4-903d-00d0b7680d87"));
  // static DWINGUID IID = { 0x6e196804, 0xc47a, 0x11d4, 0x90, 0x3d, 0x00, 0xd0, 0xb7, 0x68, 0x0d, 0x87 };
  // property WriteReport
  /*[id(0x60020000)]*/ int get_WriteReport(out wchar* pVal);
}

// IDiagController Interface
interface ICUIDiagController : IUnknown {
  mixin(uuid("48e57d01-53bd-11d3-8ee0-00a0c984f371"));
  // static DWINGUID IID = { 0x48e57d01, 0x53bd, 0x11d3, 0x8e, 0xe0, 0x00, 0xa0, 0xc9, 0x84, 0xf3, 0x71 };
  // property AdapterName
  /*[id(0x60010000)]*/ int get_AdapterName(out wchar* pVal);
  // property VideoMemory
  /*[id(0x60010001)]*/ int get_VideoMemory(out int pVal);
  // property FreeVideoMemory
  /*[id(0x60010002)]*/ int get_FreeVideoMemory(out int pVal);
  // property MemoryType
  /*[id(0x60010003)]*/ int get_MemoryType(out wchar* pVal);
  // property VBIOSVersion
  /*[id(0x60010004)]*/ int get_VBIOSVersion(out wchar* pVal);
  // property SupportedGraphicsModes
  /*[id(0x60010005)]*/ int get_SupportedGraphicsModes(out wchar* pVal);
  // property IsSupported
  /*[id(0x60010006)]*/ int get_IsSupported(out int pVal);
  // property AGPMemory
  /*[id(0x60010007)]*/ int get_AGPMemory(out int pVal);
  // property AcceleratorName
  /*[id(0x60010008)]*/ int get_AcceleratorName(out wchar* pVal);
  // method WriteReport
  /*[id(0x60010009)]*/ int WriteReport(int fileHandle);
}

// IDiagController Interface2
interface ICUIDiagController2 : ICUIDiagController {
  mixin(uuid("6e196805-c47a-11d4-903d-00d0b7680d87"));
  // static DWINGUID IID = { 0x6e196805, 0xc47a, 0x11d4, 0x90, 0x3d, 0x00, 0xd0, 0xb7, 0x68, 0x0d, 0x87 };
  // property WriteReport
  /*[id(0x60020000)]*/ int get_WriteReport(out wchar* pVal);
}

// CoClasses

// DiagServices Class
abstract class DiagServices {
  mixin(uuid("0ef91a8e-03d5-11d3-b995-00a0c9ad54b5"));
  // static DWINGUID CLSID = { 0x0ef91a8e, 0x03d5, 0x11d3, 0xb9, 0x95, 0x00, 0xa0, 0xc9, 0xad, 0x54, 0xb5 };
  mixin Interfaces!(IDiagServices, IDiagServices2, ICUIPCI, ICUIAGP, ICUIMonitor, ICUIMonitor2, ICUIReport, ICUITests, ICUIDriverInfo, ICUIDriverInfo2, ICUIDiagController, ICUIDiagController2);
}
