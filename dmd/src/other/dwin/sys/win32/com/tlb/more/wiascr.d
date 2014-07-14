// Microsoft Windows Image Acquisition 1.01 Type Library
// Version 1.0

/*[uuid("95cedd63-2e34-4b84-9fb3-f86af1d4bf7a")]*/
//module dwin.sys.win32.com.tlb.more.wia;
module dwin.sys.win32.com.tlb.more.wiascr;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

// WiaIntents
enum WiaIntent {
  ImageTypeColor = 0x00000001,
  ImageTypeGrayscale = 0x00000002,
  ImageTypeText = 0x00000004,
  MinimizeSize = 0x00010000,
  MaximizeQuality = 0x00020000,
  BestPreview = 0x00040000,
}

// WiaFlags
enum WiaFlag {
  SingleImage = 0x00000002,
  UseCommonUI = 0x00000004,
}

// WiaDeviceInfoPropertyIds
enum WiaDeviceInfoPropertyId {
  DeviceInfoDevId = 0x00000002,
  DeviceInfoVendDesc = 0x00000003,
  DeviceInfoDevDesc = 0x00000004,
  DeviceInfoDevType = 0x00000005,
  DeviceInfoPortName = 0x00000006,
  DeviceInfoDevName = 0x00000007,
  DeviceInfoServerName = 0x00000008,
  DeviceInfoRemoteDevId = 0x00000009,
  DeviceInfoUIClsid = 0x0000000A,
  DeviceInfoHwConfig = 0x0000000B,
  DeviceInfoBaudRate = 0x0000000C,
  DeviceInfoStiGenCapabilities = 0x0000000D,
  DeviceInfoWiaVersion = 0x0000000E,
  DeviceInfoDriverVersion = 0x0000000F,
}

// WiaDeviceItemPropertyIds
enum WiaItemPropertyId {
  DeviceFirmwareVersion = 0x00000402,
  DeviceConnectStatus = 0x00000403,
  DeviceDeviceTime = 0x00000404,
  CameraDevicePicturesTaken = 0x00000802,
  CameraDevicePicturesRemaining = 0x00000803,
  CameraDeviceExposureMode = 0x00000804,
  CameraDeviceExposureComp = 0x00000805,
  CameraDeviceExposureTime = 0x00000806,
  CameraDeviceFNumber = 0x00000807,
  CameraDeviceFlashMode = 0x00000808,
  CameraDeviceFocusMode = 0x00000809,
  CameraDevicePanPosition = 0x0000080C,
  CameraDeviceTiltPosition = 0x0000080D,
  CameraDeviceTimerMode = 0x0000080E,
  CameraDeviceTimerValue = 0x0000080F,
  CameraDevicePowerMode = 0x00000810,
  CameraDeviceBatteryStatus = 0x00000811,
  CameraDeviceThumbWidth = 0x00000812,
  CameraDeviceThumbHeight = 0x00000813,
  CameraDevicePictWidth = 0x00000814,
  CameraDevicePictHeight = 0x00000815,
  CameraDeviceCompressionSetting = 0x00000817,
  CameraDeviceTimelapseInterval = 0x00000819,
  CameraDeviceTimelapseNumber = 0x0000081A,
  CameraDeviceBurstInterval = 0x0000081B,
  CameraDeviceBurstNumber = 0x0000081C,
  CameraDeviceEffectMode = 0x0000081D,
  CameraDeviceDigitalZoom = 0x0000081E,
  CameraDeviceSharpness = 0x0000081F,
  CameraDeviceContrast = 0x00000820,
  CameraDeviceCaptureMode = 0x00000821,
  CameraDeviceCaptureDelay = 0x00000822,
  CameraDeviceExposureIndex = 0x00000823,
  CameraDeviceExposureMeteringMode = 0x00000824,
  CameraDeviceFocusMeteringMode = 0x00000825,
  CameraDeviceFocusDistance = 0x00000826,
  CameraDeviceFocalLength = 0x00000827,
  CameraDeviceRGBGain = 0x00000828,
  CameraDeviceWhiteBalance = 0x00000829,
  CameraDeviceUploadURL = 0x0000082A,
  CameraDeviceArtist = 0x0000082B,
  CameraDeviceCopyrightInfo = 0x0000082C,
  ScannerDeviceHorizontalBedSize = 0x00000C02,
  ScannerDeviceVerticalBedSize = 0x00000C03,
  ScannerDeviceHorizontalSheetFeedSize = 0x00000C04,
  ScannerDeviceVerticalSheetFeedSize = 0x00000C05,
  ScannerDeviceSheetFeederRegistration = 0x00000C06,
  ScannerDeviceHorizontalBedRegistration = 0x00000C07,
  ScannerDeviceVerticalBedRegistration = 0x00000C08,
  ScannerDevicePlatenColor = 0x00000C09,
  ScannerDevicePadColor = 0x00000C0A,
  ScannerDeviceDocumentHandlingCapabilities = 0x00000C0E,
  ScannerDeviceDocumentHandlingStatus = 0x00000C0F,
  ScannerDeviceDocumentHandlingSelect = 0x00000C10,
  ScannerDeviceDocumentHandlingCapacity = 0x00000C11,
  ScannerDeviceOpticalXres = 0x00000C12,
  ScannerDeviceOpticalYres = 0x00000C13,
  ScannerDeviceEndorserCharacters = 0x00000C14,
  ScannerDeviceEndorserString = 0x00000C15,
  ScannerDeviceScanAheadPages = 0x00000C16,
  ScannerDeviceMaxScanTime = 0x00000C17,
  ScannerDevicePages = 0x00000C18,
  ScannerDevicePageSize = 0x00000C19,
  ScannerDevicePageWidth = 0x00000C1A,
  ScannerDevicePageHeight = 0x00000C1B,
  ScannerDevicePreview = 0x00000C1C,
  ScannerDeviceTransparency = 0x00000C1D,
  ScannerDeviceTransparencySelect = 0x00000C1E,
  ScannerDeviceShowPreviewControl = 0x00000C1F,
  ScannerDeviceMinHorizontalSheetFeedSize = 0x00000C20,
  ScannerDeviceMinVerticalSheetFeedSize = 0x00000C21,
  FileDeviceMountPoint = 0x00000D02,
  VideoDeviceLastPictureTaken = 0x00000E02,
  VideoDeviceImagesDirectory = 0x00000E03,
  VideoDeviceDShowDevicePath = 0x00000E04,
  PictureItemName = 0x00001002,
  PictureFullItemName = 0x00001003,
  PictureItemTime = 0x00001004,
  PictureItemFlags = 0x00001005,
  PictureAccessRights = 0x00001006,
  PictureDatatype = 0x00001007,
  PictureDepth = 0x00001008,
  PicturePreferredFormat = 0x00001009,
  PictureFormat = 0x0000100A,
  PictureCompression = 0x0000100B,
  PictureTymed = 0x0000100C,
  PictureChannelsPerPixel = 0x0000100D,
  PictureBitsPerChannel = 0x0000100E,
  PicturePlanar = 0x0000100F,
  PicturePixelsPerLine = 0x00001010,
  PictureBytesPerLine = 0x00001011,
  PictureNumberOfLines = 0x00001012,
  PictureGammaCurves = 0x00001013,
  PictureItemSize = 0x00001014,
  PictureColorProfile = 0x00001015,
  PictureMinBufferSize = 0x00001016,
  PictureBufferSize = 0x00001016,
  PictureRegionType = 0x00001017,
  PictureIcmProfileName = 0x00001018,
  PictureAppColorMapping = 0x00001019,
  PicturePropStreamCompatId = 0x0000101A,
  PictureFilenameExtension = 0x0000101B,
  PictureSuppressPropertyPage = 0x0000101C,
  CameraPictureThumbnail = 0x00001402,
  CameraPictureThumbWidth = 0x00001403,
  CameraPictureThumbHeight = 0x00001404,
  CameraPictureAudioAvailable = 0x00001405,
  CameraPictureAudioDataFormat = 0x00001406,
  CameraPictureAudioData = 0x00001407,
  CameraPictureNumPictPerRow = 0x00001408,
  CameraPictureSequence = 0x00001409,
  CameraPictureTimedelay = 0x0000140A,
  ScannerPictureCurIntent = 0x00001802,
  ScannerPictureXres = 0x00001803,
  ScannerPictureYres = 0x00001804,
  ScannerPictureXpos = 0x00001805,
  ScannerPictureYpos = 0x00001806,
  ScannerPictureXextent = 0x00001807,
  ScannerPictureYextent = 0x00001808,
  ScannerPicturePhotometricInterp = 0x00001809,
  ScannerPictureBrightness = 0x0000180A,
  ScannerPictureContrast = 0x0000180B,
  ScannerPictureOrientation = 0x0000180C,
  ScannerPictureRotation = 0x0000180D,
  ScannerPictureMirror = 0x0000180E,
  ScannerPictureThreshold = 0x0000180F,
  ScannerPictureInvert = 0x00001810,
  ScannerPictureWarmUpTime = 0x00001811,
}

// Interfaces

// ICollection Interface
interface ICollection : IDispatch {
  mixin(uuid("c34c8ce7-b253-4f89-aa25-8a24ad71d0c0"));
  // static DWINGUID IID = { 0xc34c8ce7, 0xb253, 0x4f89, 0xaa, 0x25, 0x8a, 0x24, 0xad, 0x71, 0xd0, 0xc0 };
  // Returns the specified item in the collection
  /*[id(0x00000000)]*/ int get_Item(int Index, out IDispatch ppDispItem);
  // Returns the number of members in the collection
  /*[id(0x00000001)]*/ int get_Count(out int pCount);
  /*[id(0x00000002)]*/ int get_Length(out uint plLength);
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown ppEnum);
}

// IWiaDeviceItem interface
interface IWiaDispatchItem : IDispatch {
  mixin(uuid("d06d503f-4b71-40f3-94a7-66478f732bc9"));
  // static DWINGUID IID = { 0xd06d503f, 0x4b71, 0x40f3, 0x94, 0xa7, 0x66, 0x47, 0x8f, 0x73, 0x2b, 0xc9 };
  // Returns the current connection status
  /*[id(0x00000001)]*/ int get_ConnectStatus(out wchar* pbstrStatus);
  // Returns the current time on the device
  /*[id(0x00000002)]*/ int get_Time(out wchar* pbstrTime);
  // Returns the firmware version of the device
  /*[id(0x00000003)]*/ int get_FirmwareVersion(out wchar* pbstrVersion);
  // Displays the acquisition dialog box
  /*[id(0x00000004)]*/ int GetItemsFromUI(WiaFlag Flags, WiaIntent Intent, out ICollection ppCollection);
  // Transfers the item to a file, or clipboard if filename is clipboard
  /*[id(0x00000005)]*/ int Transfer(wchar* Filename, short AsyncTransfer);
  // Takes a Picture and returns it if successful
  /*[id(0x00000006)]*/ int TakePicture(out IWiaDispatchItem ppDispItem);
  // Returns the Name of the item
  /*[id(0x00000014)]*/ int get_Name(out wchar* pbstrName);
  // Returns the full name of the item
  /*[id(0x00000015)]*/ int get_FullName(out wchar* pbstrFullName);
  // Returns the type of this item
  /*[id(0x00000016)]*/ int get_ItemType(out wchar* pbstrType);
  // Returns the width of the item in pixels
  /*[id(0x00000017)]*/ int get_Width(out int plWidth);
  // Returns the height of the item in pixels
  /*[id(0x00000018)]*/ int get_Height(out int plHeight);
  // Returns the width of the the item's thumbnail
  /*[id(0x00000032)]*/ int get_ThumbWidth(out int plWidth);
  // Returns the height of the item's thumbnail
  /*[id(0x00000033)]*/ int get_ThumbHeight(out int plHeight);
  // Returns the path to the temporary image thumbnail
  /*[id(0x00000034)]*/ int get_Thumbnail(out wchar* pbstrPath);
  // Returns the height of the picture
  /*[id(0x00000035)]*/ int get_PictureHeight(out int plHeight);
  // Returns the width of the picture
  /*[id(0x00000036)]*/ int get_PictureWidth(out int plWidth);
  // Returns a collection of this items children
  /*[id(0x000001F4)]*/ int get_Children(out ICollection ppCollection);
  // Returns the value of the property with the given id
  /*[id(0x000003E8)]*/ int GetPropById(WiaItemPropertyId Id, out DWINVARIANT pvaOut);
}

// IWiaDeviceInfo Interface
interface IWiaDeviceInfo : IDispatch {
  mixin(uuid("5267ff5e-7caf-4769-865d-17a25968525e"));
  // static DWINGUID IID = { 0x5267ff5e, 0x7caf, 0x4769, 0x86, 0x5d, 0x17, 0xa2, 0x59, 0x68, 0x52, 0x5e };
  // Create an Item for this device
  /*[id(0x00000001)]*/ int Create(out IWiaDispatchItem ppDevice);
  // Returns the id of the device
  /*[id(0x00000002)]*/ int get_Id(out wchar* pbstrDeviceId);
  // Returns the name of the device
  /*[id(0x00000003)]*/ int get_Name(out wchar* pbstrName);
  // Returns the type of the device
  /*[id(0x00000004)]*/ int get_Type(out wchar* pbstrType);
  // Returns the port the device is connected to
  /*[id(0x00000005)]*/ int get_Port(out wchar* pbstrPort);
  // Returns the class id for the User Interface for this device
  /*[id(0x00000006)]*/ int get_UIClsid(out wchar* pbstrGuidUI);
  // Returns the name of the manufacturer of this device
  /*[id(0x00000007)]*/ int get_Manufacturer(out wchar* pbstrVendor);
  // Returns the value of the property with the given Id
  /*[id(0x000003E8)]*/ int GetPropById(WiaDeviceInfoPropertyId Id, out DWINVARIANT pvaOut);
}

// IWia Interface
interface IWia : IDispatch {
  mixin(uuid("b10ba1bc-3713-4ec0-8eea-690ebd2ced8a"));
  // static DWINGUID IID = { 0xb10ba1bc, 0x3713, 0x4ec0, 0x8e, 0xea, 0x69, 0x0e, 0xbd, 0x2c, 0xed, 0x8a };
  // Returns the DeviceInfo collection
  /*[id(0x00000001)]*/ int get_Devices(out ICollection ppCol);
  // Creates a connection to the specified DeviceInfo, Id or Index
  /*[id(0x00000002)]*/ int Create(DWINVARIANT* Device, out IWiaDispatchItem ppDevice);
  /*[id(0x0000271A)]*/ int _DebugDialog(int fWait);
}

// Events fired by the IWia interface
interface _IWiaEvents : IDispatch {
  mixin(uuid("e5f04d72-6c16-42e2-bcca-f8d0db4ade06"));
  // static DWINGUID IID = { 0xe5f04d72, 0x6c16, 0x42e2, 0xbc, 0xca, 0xf8, 0xd0, 0xdb, 0x4a, 0xde, 0x06 };
  /+// Occurs when a device is connected
  /*[id(0x00000001)]*/ void OnDeviceConnected(wchar* Id);+/
  /+// Occurs when a device is disconnected
  /*[id(0x00000002)]*/ void OnDeviceDisconnected(wchar* Id);+/
  /+// Occurs when a Transfer has completed
  /*[id(0x00000003)]*/ void OnTransferComplete(IWiaDispatchItem Item, wchar* Path);+/
}

// CoClasses

// WiaProtocol Class
abstract class WiaProtocol {
  mixin(uuid("13f3ea8b-91d7-4f0a-ad76-d2853ac8bece"));
  // static DWINGUID CLSID = { 0x13f3ea8b, 0x91d7, 0x4f0a, 0xad, 0x76, 0xd2, 0x85, 0x3a, 0xc8, 0xbe, 0xce };
  mixin Interfaces!(IUnknown);
}

// WiaItem Class
abstract class Item {
  mixin(uuid("e6c45109-442c-4585-be44-f5d2884e544a"));
  // static DWINGUID CLSID = { 0xe6c45109, 0x442c, 0x4585, 0xbe, 0x44, 0xf5, 0xd2, 0x88, 0x4e, 0x54, 0x4a };
  mixin Interfaces!(IWiaDispatchItem);
}

// DeviceInfo Class
abstract class DeviceInfo {
  mixin(uuid("34e1c006-99d2-4335-b0b1-ce7b9fe5396c"));
  // static DWINGUID CLSID = { 0x34e1c006, 0x99d2, 0x4335, 0xb0, 0xb1, 0xce, 0x7b, 0x9f, 0xe5, 0x39, 0x6c };
  mixin Interfaces!(IWiaDeviceInfo);
}

// Collection Class
abstract class Collection {
  mixin(uuid("6e27c0e7-1d45-4ca7-9bf7-bd6cddaa1adc"));
  // static DWINGUID CLSID = { 0x6e27c0e7, 0x1d45, 0x4ca7, 0x9b, 0xf7, 0xbd, 0x6c, 0xdd, 0xaa, 0x1a, 0xdc };
  mixin Interfaces!(ICollection);
}

// WIA Class
abstract class Wia {
  mixin(uuid("4ec4272e-2e6f-4eeb-91d0-ebc4d58e8dee"));
  // static DWINGUID CLSID = { 0x4ec4272e, 0x2e6f, 0x4eeb, 0x91, 0xd0, 0xeb, 0xc4, 0xd5, 0x8e, 0x8d, 0xee };
  mixin Interfaces!(IWia);
}

// WIA Class (Safe for Scripting)
abstract class SafeWia {
  mixin(uuid("0dad5531-bf31-43ac-a513-1f8926bbf5ec"));
  // static DWINGUID CLSID = { 0x0dad5531, 0xbf31, 0x43ac, 0xa5, 0x13, 0x1f, 0x89, 0x26, 0xbb, 0xf5, 0xec };
  mixin Interfaces!(IWia);
}
