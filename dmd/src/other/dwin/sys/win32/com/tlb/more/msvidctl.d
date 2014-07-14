// MS Video Control 1.0 Type Library
// Version 1.0

/*[uuid("b0edf154-910a-11d2-b632-00c04f79498e")]*/
//module dwin.sys.win32.com.tlb.more.msvidctl;
module dwin.sys.win32.com.tlb.more.msvidctl;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;
private import dwin.sys.win32.com.tlb.stdole2;
// Enums

enum __MIDL___MIDL_itf_msvidctl_0000_0003 {
  STATE_UNBUILT = 0xFFFFFFFF,
  STATE_STOP = 0x00000000,
  STATE_PAUSE = 0x00000001,
  STATE_PLAY = 0x00000002,
}

enum ComponentCategory {
  CategoryNotSet = 0xFFFFFFFF,
  CategoryOther = 0x00000000,
  CategoryVideo = 0x00000001,
  CategoryAudio = 0x00000002,
  CategoryText = 0x00000003,
  CategoryData = 0x00000004,
}

enum FECMethod {
  BDA_FEC_METHOD_NOT_SET = 0xFFFFFFFF,
  BDA_FEC_METHOD_NOT_DEFINED = 0x00000000,
  BDA_FEC_VITERBI = 0x00000001,
  BDA_FEC_RS_204_188 = 0x00000002,
  BDA_FEC_MAX = 0x00000003,
}

enum BinaryConvolutionCodeRate {
  BDA_BCC_RATE_NOT_SET = 0xFFFFFFFF,
  BDA_BCC_RATE_NOT_DEFINED = 0x00000000,
  BDA_BCC_RATE_1_2 = 0x00000001,
  BDA_BCC_RATE_2_3 = 0x00000002,
  BDA_BCC_RATE_3_4 = 0x00000003,
  BDA_BCC_RATE_3_5 = 0x00000004,
  BDA_BCC_RATE_4_5 = 0x00000005,
  BDA_BCC_RATE_5_6 = 0x00000006,
  BDA_BCC_RATE_5_11 = 0x00000007,
  BDA_BCC_RATE_7_8 = 0x00000008,
  BDA_BCC_RATE_MAX = 0x00000009,
}

enum ModulationType {
  BDA_MOD_NOT_SET = 0xFFFFFFFF,
  BDA_MOD_NOT_DEFINED = 0x00000000,
  BDA_MOD_16QAM = 0x00000001,
  BDA_MOD_32QAM = 0x00000002,
  BDA_MOD_64QAM = 0x00000003,
  BDA_MOD_80QAM = 0x00000004,
  BDA_MOD_96QAM = 0x00000005,
  BDA_MOD_112QAM = 0x00000006,
  BDA_MOD_128QAM = 0x00000007,
  BDA_MOD_160QAM = 0x00000008,
  BDA_MOD_192QAM = 0x00000009,
  BDA_MOD_224QAM = 0x0000000A,
  BDA_MOD_256QAM = 0x0000000B,
  BDA_MOD_320QAM = 0x0000000C,
  BDA_MOD_384QAM = 0x0000000D,
  BDA_MOD_448QAM = 0x0000000E,
  BDA_MOD_512QAM = 0x0000000F,
  BDA_MOD_640QAM = 0x00000010,
  BDA_MOD_768QAM = 0x00000011,
  BDA_MOD_896QAM = 0x00000012,
  BDA_MOD_1024QAM = 0x00000013,
  BDA_MOD_QPSK = 0x00000014,
  BDA_MOD_BPSK = 0x00000015,
  BDA_MOD_OQPSK = 0x00000016,
  BDA_MOD_8VSB = 0x00000017,
  BDA_MOD_16VSB = 0x00000018,
  BDA_MOD_ANALOG_AMPLITUDE = 0x00000019,
  BDA_MOD_ANALOG_FREQUENCY = 0x0000001A,
  BDA_MOD_MAX = 0x0000001B,
}

enum ComponentStatus {
  StatusActive = 0x00000000,
  StatusInactive = 0x00000001,
  StatusUnavailable = 0x00000002,
}

enum _FilterState {
  State_Stopped = 0x00000000,
  State_Paused = 0x00000001,
  State_Running = 0x00000002,
}

enum _PinDirection {
  PINDIR_INPUT = 0x00000000,
  PINDIR_OUTPUT = 0x00000001,
}

enum MSVidSegmentType {
  MSVidSEG_SOURCE = 0x00000000,
  MSVidSEG_XFORM = 0x00000001,
  MSVidSEG_DEST = 0x00000002,
}

enum __MIDL___MIDL_itf_msvidctl_0690_0003 {
  FrameMode = 0x00000000,
  TenthsSecondsMode = 0x00000001,
}

enum __MIDL___MIDL_itf_msvidctl_0927_0001 {
  dvdMenu_Title = 0x00000002,
  dvdMenu_Root = 0x00000003,
  dvdMenu_Subpicture = 0x00000004,
  dvdMenu_Audio = 0x00000005,
  dvdMenu_Angle = 0x00000006,
  dvdMenu_Chapter = 0x00000007,
}

enum __MIDL___MIDL_itf_msvidctl_0927_0003 {
  dvdStruct_Volume = 0x00000001,
  dvdStruct_Title = 0x00000002,
  dvdStruct_ParentalID = 0x00000003,
  dvdStruct_PartOfTitle = 0x00000004,
  dvdStruct_Cell = 0x00000005,
  dvdStream_Audio = 0x00000010,
  dvdStream_Subpicture = 0x00000011,
  dvdStream_Angle = 0x00000012,
  dvdChannel_Audio = 0x00000020,
  dvdGeneral_Name = 0x00000030,
  dvdGeneral_Comments = 0x00000031,
  dvdTitle_Series = 0x00000038,
  dvdTitle_Movie = 0x00000039,
  dvdTitle_Video = 0x0000003A,
  dvdTitle_Album = 0x0000003B,
  dvdTitle_Song = 0x0000003C,
  dvdTitle_Other = 0x0000003F,
  dvdTitle_Sub_Series = 0x00000040,
  dvdTitle_Sub_Movie = 0x00000041,
  dvdTitle_Sub_Video = 0x00000042,
  dvdTitle_Sub_Album = 0x00000043,
  dvdTitle_Sub_Song = 0x00000044,
  dvdTitle_Sub_Other = 0x00000047,
  dvdTitle_Orig_Series = 0x00000048,
  dvdTitle_Orig_Movie = 0x00000049,
  dvdTitle_Orig_Video = 0x0000004A,
  dvdTitle_Orig_Album = 0x0000004B,
  dvdTitle_Orig_Song = 0x0000004C,
  dvdTitle_Orig_Other = 0x0000004F,
  dvdOther_Scene = 0x00000050,
  dvdOther_Cut = 0x00000051,
  dvdOther_Take = 0x00000052,
}

enum __MIDL___MIDL_itf_msvidctl_0927_0004 {
  dvdSPExt_NotSpecified = 0x00000000,
  dvdSPExt_Caption_Normal = 0x00000001,
  dvdSPExt_Caption_Big = 0x00000002,
  dvdSPExt_Caption_Children = 0x00000003,
  dvdSPExt_CC_Normal = 0x00000005,
  dvdSPExt_CC_Big = 0x00000006,
  dvdSPExt_CC_Children = 0x00000007,
  dvdSPExt_Forced = 0x00000009,
  dvdSPExt_DirectorComments_Normal = 0x0000000D,
  dvdSPExt_DirectorComments_Big = 0x0000000E,
  dvdSPExt_DirectorComments_Children = 0x0000000F,
}

enum __MIDL___MIDL_itf_msvidctl_0941_0001 {
  sslFullSize = 0x00000000,
  sslClipByOverScan = 0x00000001,
  sslClipByClipRect = 0x00000002,
}

enum __MIDL___MIDL_itf_msvidctl_0690_0006 {
  Video = 0x00000001,
  Audio = 0x00000002,
  Other = 0x00000004,
}

enum __MIDL___MIDL_itf_msvidctl_0690_0004 {
  CONTENT = 0x00000000,
  REFERENCE = 0x00000001,
}

enum __MIDL___MIDL_itf_msvidctl_0902_0001 {
  MPAA = 0x00000000,
  US_TV = 0x00000001,
  Canadian_English = 0x00000002,
  Canadian_French = 0x00000003,
  Reserved4 = 0x00000004,
  System5 = 0x00000005,
  System6 = 0x00000006,
  Reserved7 = 0x00000007,
  TvRat_kSystems = 0x00000008,
  TvRat_SystemDontKnow = 0x000000FF,
}

enum __MIDL___MIDL_itf_msvidctl_0902_0002 {
  TvRat_0 = 0x00000000,
  TvRat_1 = 0x00000001,
  TvRat_2 = 0x00000002,
  TvRat_3 = 0x00000003,
  TvRat_4 = 0x00000004,
  TvRat_5 = 0x00000005,
  TvRat_6 = 0x00000006,
  TvRat_7 = 0x00000007,
  TvRat_kLevels = 0x00000008,
  TvRat_LevelDontKnow = 0x000000FF,
}

enum __MIDL___MIDL_itf_msvidctl_0690_0005 {
  None = 0x00000000,
  Caption1 = 0x00000001,
  Caption2 = 0x00000002,
  Text1 = 0x00000003,
  Text2 = 0x00000004,
  XDS = 0x00000005,
}

enum __MIDL___MIDL_itf_msvidctl_0000_0002 {
  dslDefaultSize = 0x00000000,
  dslSourceSize = 0x00000000,
  dslHalfSourceSize = 0x00000001,
  dslDoubleSourceSize = 0x00000002,
  dslFullScreen = 0x00000003,
  dslHalfScreen = 0x00000004,
  dslQuarterScreen = 0x00000005,
  dslSixteenthScreen = 0x00000006,
}

// Unions

union __MIDL_IWinTypes_0009 {
  int hInproc;
  int hRemote;
}

// Structs

struct _LARGE_INTEGER {
  long QuadPart;
}

struct _ULARGE_INTEGER {
  ulong QuadPart;
}

struct tagSTATSTG {
  wchar* pwcsName;
  uint type;
  _ULARGE_INTEGER cbSize;
  _FILETIME mtime;
  _FILETIME ctime;
  _FILETIME atime;
  uint grfMode;
  uint grfLocksSupported;
 DWINGUID Clsid;
  uint grfStateBits;
  uint reserved;
}

struct _FILETIME {
  uint dwLowDateTime;
  uint dwHighDateTime;
}

struct tagBIND_OPTS2 {
  uint cbStruct;
  uint grfFlags;
  uint grfMode;
  uint dwTickCountDeadline;
  uint dwTrackFlags;
  uint dwClassContext;
  uint locale;
  _COSERVERINFO* pServerInfo;
}

struct _COSERVERINFO {
  uint dwReserved1;
  wchar* pwszName;
  _COAUTHINFO* pAuthInfo;
  uint dwReserved2;
}

struct _COAUTHINFO {
  uint dwAuthnSvc;
  uint dwAuthzSvc;
  wchar* pwszServerPrincName;
  uint dwAuthnLevel;
  uint dwImpersonationLevel;
  _COAUTHIDENTITY* pAuthIdentityData;
  uint dwCapabilities;
}

struct _COAUTHIDENTITY {
  ushort* User;
  uint UserLength;
  ushort* Domain;
  uint DomainLength;
  ushort* Password;
  uint PasswordLength;
  uint Flags;
}

struct _AMMediaType {
 DWINGUID majortype;
 DWINGUID subtype;
  int bFixedSizeSamples;
  int bTemporalCompression;
  uint lSampleSize;
 DWINGUID formattype;
  IUnknown punk;
  uint cbFormat;
  ubyte* pbFormat;
}

struct _PinInfo {
  IBaseFilter pFilter;
  _PinDirection dir;
  ushort[128] achName;
}

struct _FilterInfo {
  ushort[128] achName;
  IFilterGraph pGraph;
}

struct _RemotableHandle {
  int fContext;
  __MIDL_IWinTypes_0009 u;
}

struct _VMRVIDEOSTREAMINFO {
  uint* pddsVideoSurface;
  uint dwWidth;
  uint dwHeight;
  uint dwStrmID;
  float fAlpha;
  DDCOLORKEY ddClrKey;
  _NORMALIZEDRECT rNormal;
}

struct __MIDL___MIDL_itf_msvidctl_0831_0001 {
  uint dw1;
  uint dw2;
}

struct _NORMALIZEDRECT {
  float Left;
  float Top;
  float right;
  float bottom;
}

struct _VMRALPHABITMAP {
  uint dwFlags;
  wireHDC hdc;
  uint* pDDS;
  tagRECT rSrc;
  _NORMALIZEDRECT rDest;
  float fAlpha;
  uint clrSrcKey;
}

struct tagRECT {
  int Left;
  int Top;
  int right;
  int bottom;
}

struct tagVMRALLOCATIONINFO {
  uint dwFlags;
  uint* lpHdr;
  uint* lpPixFmt;
  tagSIZE szAspectRatio;
  uint dwMinBuffers;
  uint dwMaxBuffers;
  uint dwInterlaceFlags;
  tagSIZE szNativeSize;
}

struct tagSIZE {
  int cx;
  int cy;
}

// Aliases

alias __MIDL___MIDL_itf_msvidctl_0000_0003 MSVidCtlStateList;

alias uint ULONG_PTR;

alias int LONG_PTR;

alias __MIDL___MIDL_itf_msvidctl_0690_0003 PositionModeList;

alias __MIDL___MIDL_itf_msvidctl_0927_0001 DVDMenuIDConstants;

alias __MIDL___MIDL_itf_msvidctl_0927_0003 DVDTextStringType;

alias __MIDL___MIDL_itf_msvidctl_0927_0004 DVDSPExt;

alias _RemotableHandle* wireHWND;

alias __MIDL___MIDL_itf_msvidctl_0831_0001 DDCOLORKEY;

alias _RemotableHandle* wireHDC;

alias __MIDL___MIDL_itf_msvidctl_0941_0001 SourceSizeList;

alias __MIDL___MIDL_itf_msvidctl_0690_0006 MSVidSinkStreams;

alias __MIDL___MIDL_itf_msvidctl_0690_0004 RecordingType;

alias __MIDL___MIDL_itf_msvidctl_0902_0001 EnTvRat_System;

alias __MIDL___MIDL_itf_msvidctl_0902_0002 EnTvRat_GenericLevel;

alias __MIDL___MIDL_itf_msvidctl_0690_0005 MSVidCCService;

alias __MIDL___MIDL_itf_msvidctl_0000_0002 DisplaySizeList;

// Interfaces

// MS Video Control Events Interface
interface _IMSVidCtlEvents : IDispatch {
  mixin(uuid("b0edf164-910a-11d2-b632-00c04f79498e"));
  // static DWINGUID IID = { 0xb0edf164, 0x910a, 0x11d2, 0xb6, 0x32, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  /+/*[id(0xFFFFFDA8)]*/ void Click();+/
  /+/*[id(0xFFFFFDA7)]*/ void DblClick();+/
  /+/*[id(0xFFFFFDA6)]*/ void KeyDown(short* KeyCode, short Shift);+/
  /+/*[id(0xFFFFFDA5)]*/ void KeyPress(short* KeyAscii);+/
  /+/*[id(0xFFFFFDA4)]*/ void KeyUp(short* KeyCode, short Shift);+/
  /+/*[id(0xFFFFFDA3)]*/ void MouseDown(short Button, short Shift, OLE_XPOS_PIXELS x, OLE_YPOS_PIXELS y);+/
  /+/*[id(0xFFFFFDA2)]*/ void MouseMove(short Button, short Shift, OLE_XPOS_PIXELS x, OLE_YPOS_PIXELS y);+/
  /+/*[id(0xFFFFFDA1)]*/ void MouseUp(short Button, short Shift, OLE_XPOS_PIXELS x, OLE_YPOS_PIXELS y);+/
  /+/*[id(0xFFFFFDA0)]*/ void Error(short Number, wchar** Description, int Scode, wchar* Source, wchar* HelpFile, int HelpContext, byte* CancelDisplay);+/
  /+/*[id(0x00000015)]*/ void StateChange(MSVidCtlStateList PrevState, MSVidCtlStateList CurrState);+/
}

// MS Video TV Tuner Interface2
interface IMSVidAnalogTuner2 : IMSVidAnalogTuner {
  mixin(uuid("37647bf7-3dde-4cc8-a4dc-0d534d3d0037"));
  // static DWINGUID IID = { 0x37647bf7, 0x3dde, 0x4cc8, 0xa4, 0xdc, 0x0d, 0x53, 0x4d, 0x3d, 0x00, 0x37 };
  /*[id(0x000000C1)]*/ int get_TVFormats(out int Formats);
  /*[id(0x000000C2)]*/ int get_TunerModes(out int Modes);
  /*[id(0x000000C3)]*/ int get_NumAuxInputs(out int Inputs);
}

// MS Video TV Tuner Interface
interface IMSVidAnalogTuner : IMSVidTuner {
  mixin(uuid("1c15d47e-911d-11d2-b632-00c04f79498e"));
  // static DWINGUID IID = { 0x1c15d47e, 0x911d, 0x11d2, 0xb6, 0x32, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  /*[id(0x0000000A)]*/ int get_Channel(out int Channel);
  /*[id(0x0000000A)]*/ int set_Channel(int Channel);
  /*[id(0x0000000E)]*/ int get_VideoFrequency(out int lcc);
  /*[id(0x0000000F)]*/ int get_AudioFrequency(out int lcc);
  /*[id(0x00000004)]*/ int get_CountryCode(out int lcc);
  /*[id(0x00000004)]*/ int set_CountryCode(int lcc);
  /*[id(0x0000001D)]*/ int get_SAP(out short pfSapOn);
  /*[id(0x0000001D)]*/ int set_SAP(short pfSapOn);
  /*[id(0x0000000D)]*/ int ChannelAvailable(int nChannel, out int SignalStrength, out short fSignalPresent);
}

// MS Video Tuner Interface
interface IMSVidTuner : IMSVidVideoInputDevice {
  mixin(uuid("1c15d47d-911d-11d2-b632-00c04f79498e"));
  // static DWINGUID IID = { 0x1c15d47d, 0x911d, 0x11d2, 0xb6, 0x32, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  /*[id(0x0000001B)]*/ int get_Tune(out ITuneRequest ppTR);
  /*[id(0x0000001B)]*/ int set_Tune(ITuneRequest ppTR);
  /*[id(0x0000001C)]*/ int get_TuningSpace(out ITuningSpace plTS);
  /*[id(0x0000001C)]*/ int set_TuningSpace(ITuningSpace plTS);
}

// MS Video Control Video Device Interface
interface IMSVidVideoInputDevice : IMSVidInputDevice {
  mixin(uuid("1c15d47f-911d-11d2-b632-00c04f79498e"));
  // static DWINGUID IID = { 0x1c15d47f, 0x911d, 0x11d2, 0xb6, 0x32, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
}

// MS Video Control Input Device Interface
interface IMSVidInputDevice : IMSVidDevice {
  mixin(uuid("37b0353d-a4c8-11d2-b634-00c04f79498e"));
  // static DWINGUID IID = { 0x37b0353d, 0xa4c8, 0x11d2, 0xb6, 0x34, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  /*[id(0x00000015)]*/ int IsViewable(DWINVARIANT* v, out short pfViewable);
  /*[id(0x00000016)]*/ int View(DWINVARIANT* v);
}

// MS Video Control Device Interface
interface IMSVidDevice : IDispatch {
  mixin(uuid("1c15d47c-911d-11d2-b632-00c04f79498e"));
  // static DWINGUID IID = { 0x1c15d47c, 0x911d, 0x11d2, 0xb6, 0x32, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  /*[id(0x00000000)]*/ int get_Name(out wchar* Name);
  /*[id(0x00000001)]*/ int get_Status(out int Status);
  /*[id(0x00000009)]*/ int set_Power(short Power);
  /*[id(0x00000009)]*/ int get_Power(out short Power);
  /*[id(0x00000017)]*/ int get_Category(out wchar* DWINGUID);
  /*[id(0x00000018)]*/ int get_ClassID(out wchar* Clsid);
  /*[id(0x00000019)]*/ int get__Category(out DWINGUID Guid);
  /*[id(0x0000001A)]*/ int get__ClassID(out DWINGUID Clsid);
  // does the passed in device represent the same underlying hardware
  /*[id(0x00000090)]*/ int IsEqualDevice(IMSVidDevice Device, out short IsEqual);
}

// Tune Request Interface
interface ITuneRequest : IDispatch {
  mixin(uuid("07ddc146-fc3d-11d2-9d8c-00c04f72d980"));
  // static DWINGUID IID = { 0x07ddc146, 0xfc3d, 0x11d2, 0x9d, 0x8c, 0x00, 0xc0, 0x4f, 0x72, 0xd9, 0x80 };
  // Tuning Space object
  /*[id(0x00000001)]*/ int get_TuningSpace(out ITuningSpace TuningSpace);
  // Components collection
  /*[id(0x00000002)]*/ int get_Components(out IComponents Components);
  // Create a new copy of this tune request
  /*[id(0x00000003)]*/ int Clone(out ITuneRequest NewTuneRequest);
  // Locator Object
  /*[id(0x00000004)]*/ int get_Locator(out ILocator Locator);
  // Locator Object
  /*[id(0x00000004)]*/ int set_Locator(ILocator Locator);
}

// Tuning Space Interface
interface ITuningSpace : IDispatch {
  mixin(uuid("061c6e30-e622-11d2-9493-00c04f72d980"));
  // static DWINGUID IID = { 0x061c6e30, 0xe622, 0x11d2, 0x94, 0x93, 0x00, 0xc0, 0x4f, 0x72, 0xd9, 0x80 };
  // Unique name of the Tuning Space
  /*[id(0x00000001)]*/ int get_UniqueName(out wchar* Name);
  // Unique name of the Tuning Space
  /*[id(0x00000001)]*/ int set_UniqueName(wchar* Name);
  // User-friendly name of the Tuning Space
  /*[id(0x00000002)]*/ int get_FriendlyName(out wchar* Name);
  // User-friendly name of the Tuning Space
  /*[id(0x00000002)]*/ int set_FriendlyName(wchar* Name);
  // Returns the clsid of the tuning space implementation.  provides script access to IPersist:GetClassID
  /*[id(0x00000003)]*/ int get_Clsid(out wchar* SpaceCLSID);
  // Network Type (Network Proivder CLSID)
  /*[id(0x00000004)]*/ int get_NetworkType(out wchar* NetworkTypeGuid);
  // Network Type (Network Proivder CLSID)
  /*[id(0x00000004)]*/ int set_NetworkType(wchar* NetworkTypeGuid);
  // Network Type (Network Proivder CLSID)
  /*[id(0x00000005)]*/ int get__NetworkType(out DWINGUID NetworkTypeGuid);
  // Network Type (Network Proivder CLSID)
  /*[id(0x00000005)]*/ int set__NetworkType(ref DWINGUID NetworkTypeGuid);
  // Create a Tune Request object
  /*[id(0x00000006)]*/ int CreateTuneRequest(out ITuneRequest TuneRequest);
  /*[id(0x00000007)]*/ int EnumCategoryGUIDs(out IEnumGUID ppenum);
  /*[id(0x00000008)]*/ int EnumDeviceMonikers(out IEnumMoniker ppenum);
  /*[id(0x00000009)]*/ int get_DefaultPreferredComponentTypes(out IComponentTypes ComponentTypes);
  /*[id(0x00000009)]*/ int set_DefaultPreferredComponentTypes(IComponentTypes ComponentTypes);
  /*[id(0x0000000A)]*/ int get_FrequencyMapping(out wchar* pMapping);
  /*[id(0x0000000A)]*/ int set_FrequencyMapping(wchar* pMapping);
  /*[id(0x0000000B)]*/ int get_DefaultLocator(out ILocator LocatorVal);
  /*[id(0x0000000B)]*/ int set_DefaultLocator(ILocator LocatorVal);
  /*[id(0x60020012)]*/ int Clone(out ITuningSpace NewTS);
}

interface IEnumGUID : IUnknown {
  mixin(uuid("0002e000-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x0002e000, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int Next(uint celt, out DWINGUID rgelt, out uint pceltFetched);
  /*[id(0x60010001)]*/ int Skip(uint celt);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IEnumGUID ppenum);
}

interface IEnumMoniker : IUnknown {
  mixin(uuid("00000102-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00000102, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RemoteNext(uint celt, out IMoniker rgelt, out uint pceltFetched);
  /*[id(0x60010001)]*/ int Skip(uint celt);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IEnumMoniker ppenum);
}

interface IMoniker : IPersistStream {
  mixin(uuid("0000000f-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x0000000f, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60030000)]*/ int RemoteBindToObject(IBindCtx pbc, IMoniker pmkToLeft, ref DWINGUID riidResult, out IUnknown ppvResult);
  /*[id(0x60030001)]*/ int RemoteBindToStorage(IBindCtx pbc, IMoniker pmkToLeft, ref DWINGUID riid, out IUnknown ppvObj);
  /*[id(0x60030002)]*/ int Reduce(IBindCtx pbc, uint dwReduceHowFar, ref IMoniker ppmkToLeft, out IMoniker ppmkReduced);
  /*[id(0x60030003)]*/ int ComposeWith(IMoniker pmkRight, int fOnlyIfNotGeneric, out IMoniker ppmkComposite);
  /*[id(0x60030004)]*/ int Enum(int fForward, out IEnumMoniker ppenumMoniker);
  /*[id(0x60030005)]*/ int IsEqual(IMoniker pmkOtherMoniker);
  /*[id(0x60030006)]*/ int Hash(out uint pdwHash);
  /*[id(0x60030007)]*/ int IsRunning(IBindCtx pbc, IMoniker pmkToLeft, IMoniker pmkNewlyRunning);
  /*[id(0x60030008)]*/ int GetTimeOfLastChange(IBindCtx pbc, IMoniker pmkToLeft, out _FILETIME pfiletime);
  /*[id(0x60030009)]*/ int Inverse(out IMoniker ppmk);
  /*[id(0x6003000A)]*/ int CommonPrefixWith(IMoniker pmkOther, out IMoniker ppmkPrefix);
  /*[id(0x6003000B)]*/ int RelativePathTo(IMoniker pmkOther, out IMoniker ppmkRelPath);
  /*[id(0x6003000C)]*/ int GetDisplayName(IBindCtx pbc, IMoniker pmkToLeft, out wchar* ppszDisplayName);
  /*[id(0x6003000D)]*/ int ParseDisplayName(IBindCtx pbc, IMoniker pmkToLeft, wchar* pszDisplayName, out uint pchEaten, out IMoniker ppmkOut);
  /*[id(0x6003000E)]*/ int IsSystemMoniker(out uint pdwMksys);
}

interface IPersistStream : IPersist {
  mixin(uuid("00000109-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00000109, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60020000)]*/ int IsDirty();
  /*[id(0x60020001)]*/ int Load(IStream pstm);
  /*[id(0x60020002)]*/ int Save(IStream pstm, int fClearDirty);
  /*[id(0x60020003)]*/ int GetSizeMax(out _ULARGE_INTEGER pcbSize);
}

interface IPersist : IUnknown {
  mixin(uuid("0000010c-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x0000010c, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int GetClassID(out DWINGUID pClassID);
}

interface IStream : ISequentialStream {
  mixin(uuid("0000000c-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x0000000c, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60020000)]*/ int RemoteSeek(_LARGE_INTEGER dlibMove, uint dwOrigin, out _ULARGE_INTEGER plibNewPosition);
  /*[id(0x60020001)]*/ int SetSize(_ULARGE_INTEGER libNewSize);
  /*[id(0x60020002)]*/ int RemoteCopyTo(IStream pstm, _ULARGE_INTEGER cb, out _ULARGE_INTEGER pcbRead, out _ULARGE_INTEGER pcbWritten);
  /*[id(0x60020003)]*/ int Commit(uint grfCommitFlags);
  /*[id(0x60020004)]*/ int Revert();
  /*[id(0x60020005)]*/ int LockRegion(_ULARGE_INTEGER libOffset, _ULARGE_INTEGER cb, uint dwLockType);
  /*[id(0x60020006)]*/ int UnlockRegion(_ULARGE_INTEGER libOffset, _ULARGE_INTEGER cb, uint dwLockType);
  /*[id(0x60020007)]*/ int Stat(out tagSTATSTG pstatstg, uint grfStatFlag);
  /*[id(0x60020008)]*/ int Clone(out IStream ppstm);
}

interface ISequentialStream : IUnknown {
  mixin(uuid("0c733a30-2a1c-11ce-ade5-00aa0044773d"));
  // static DWINGUID IID = { 0x0c733a30, 0x2a1c, 0x11ce, 0xad, 0xe5, 0x00, 0xaa, 0x00, 0x44, 0x77, 0x3d };
  /*[id(0x60010000)]*/ int RemoteRead(out ubyte pv, uint cb, out uint pcbRead);
  /*[id(0x60010001)]*/ int RemoteWrite(ubyte* pv, uint cb, out uint pcbWritten);
}

interface IBindCtx : IUnknown {
  mixin(uuid("0000000e-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x0000000e, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RegisterObjectBound(IUnknown punk);
  /*[id(0x60010001)]*/ int RevokeObjectBound(IUnknown punk);
  /*[id(0x60010002)]*/ int ReleaseBoundObjects();
  /*[id(0x60010003)]*/ int RemoteSetBindOptions(tagBIND_OPTS2* pbindopts);
  /*[id(0x60010004)]*/ int RemoteGetBindOptions(ref tagBIND_OPTS2 pbindopts);
  /*[id(0x60010005)]*/ int GetRunningObjectTable(out IRunningObjectTable pprot);
  /*[id(0x60010006)]*/ int RegisterObjectParam(wchar* pszKey, IUnknown punk);
  /*[id(0x60010007)]*/ int GetObjectParam(wchar* pszKey, out IUnknown ppunk);
  /*[id(0x60010008)]*/ int EnumObjectParam(out IEnumString ppenum);
  /*[id(0x60010009)]*/ int RevokeObjectParam(wchar* pszKey);
}

interface IRunningObjectTable : IUnknown {
  mixin(uuid("00000010-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00000010, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int Register(uint grfFlags, IUnknown punkObject, IMoniker pmkObjectName, out uint pdwRegister);
  /*[id(0x60010001)]*/ int Revoke(uint dwRegister);
  /*[id(0x60010002)]*/ int IsRunning(IMoniker pmkObjectName);
  /*[id(0x60010003)]*/ int GetObject(IMoniker pmkObjectName, out IUnknown ppunkObject);
  /*[id(0x60010004)]*/ int NoteChangeTime(uint dwRegister, _FILETIME* pfiletime);
  /*[id(0x60010005)]*/ int GetTimeOfLastChange(IMoniker pmkObjectName, out _FILETIME pfiletime);
  /*[id(0x60010006)]*/ int EnumRunning(out IEnumMoniker ppenumMoniker);
}

interface IEnumString : IUnknown {
  mixin(uuid("00000101-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00000101, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RemoteNext(uint celt, out wchar* rgelt, out uint pceltFetched);
  /*[id(0x60010001)]*/ int Skip(uint celt);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IEnumString ppenum);
}

// ComponentType Collection Interface
interface IComponentTypes : IDispatch {
  mixin(uuid("0dc13d4a-0313-11d3-9d8e-00c04f72d980"));
  // static DWINGUID IID = { 0x0dc13d4a, 0x0313, 0x11d3, 0x9d, 0x8e, 0x00, 0xc0, 0x4f, 0x72, 0xd9, 0x80 };
  // Number of items in the collection
  /*[id(0x60020000)]*/ int get_Count(out int Count);
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IEnumVARIANT ppNewEnum);
  // Convenience Function for Use with C
  /*[id(0x60020002)]*/ int EnumComponentTypes(out IEnumComponentTypes ppNewEnum);
  // Get the ComponentType at the specified index
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT Index, out IComponentType ComponentType);
  // Get the ComponentType at the specified index
  /*[id(0x00000000)]*/ int set_Item(DWINVARIANT Index, IComponentType ComponentType);
  // Append the ComponentType to the collection
  /*[id(0xFFFFFDD7)]*/ int Add(IComponentType ComponentType, out DWINVARIANT NewIndex);
  // Clear the collection
  /*[id(0xFFFFFDD5)]*/ int Remove(DWINVARIANT Index);
  // Copy the collection
  /*[id(0x60020007)]*/ int Clone(out IComponentTypes NewList);
}

interface IEnumComponentTypes : IUnknown {
  mixin(uuid("8a674b4a-1f63-11d3-b64c-00c04f79498e"));
  // static DWINGUID IID = { 0x8a674b4a, 0x1f63, 0x11d3, 0xb6, 0x4c, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  /*[id(0x60010000)]*/ int Next(uint celt, out IComponentType rgelt, out uint pceltFetched);
  /*[id(0x60010001)]*/ int Skip(uint celt);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IEnumComponentTypes ppenum);
}

// Component Type Interface
interface IComponentType : IDispatch {
  mixin(uuid("6a340dc0-0311-11d3-9d8e-00c04f72d980"));
  // static DWINGUID IID = { 0x6a340dc0, 0x0311, 0x11d3, 0x9d, 0x8e, 0x00, 0xc0, 0x4f, 0x72, 0xd9, 0x80 };
  // General category of component
  /*[id(0x00000001)]*/ int get_Category(out ComponentCategory Category);
  // General category of component
  /*[id(0x00000001)]*/ int set_Category(ComponentCategory Category);
  // DirectShow MediaType Major Type Guid
  /*[id(0x00000002)]*/ int get_MediaMajorType(out wchar* MediaMajorType);
  // DirectShow MediaType Major Type Guid
  /*[id(0x00000002)]*/ int set_MediaMajorType(wchar* MediaMajorType);
  // DirectShow MediaType Major Type Guid
  /*[id(0x00000003)]*/ int get__MediaMajorType(out DWINGUID MediaMajorTypeGuid);
  // DirectShow MediaType Major Type Guid
  /*[id(0x00000003)]*/ int set__MediaMajorType(ref DWINGUID MediaMajorTypeGuid);
  // DirectShow MediaType Sub Type Guid
  /*[id(0x00000004)]*/ int get_MediaSubType(out wchar* MediaSubType);
  // DirectShow MediaType Sub Type Guid
  /*[id(0x00000004)]*/ int set_MediaSubType(wchar* MediaSubType);
  // DirectShow MediaType Sub Type Guid
  /*[id(0x00000005)]*/ int get__MediaSubType(out DWINGUID MediaSubTypeGuid);
  // DirectShow MediaType Sub Type Guid
  /*[id(0x00000005)]*/ int set__MediaSubType(ref DWINGUID MediaSubTypeGuid);
  // DirectShow MediaType Format Guid
  /*[id(0x00000006)]*/ int get_MediaFormatType(out wchar* MediaFormatType);
  // DirectShow MediaType Format Guid
  /*[id(0x00000006)]*/ int set_MediaFormatType(wchar* MediaFormatType);
  // DirectShow MediaType Format Guid
  /*[id(0x00000007)]*/ int get__MediaFormatType(out DWINGUID MediaFormatTypeGuid);
  // DirectShow MediaType Format Guid
  /*[id(0x00000007)]*/ int set__MediaFormatType(ref DWINGUID MediaFormatTypeGuid);
  // DirectShow MediaType DWINGUID, this only retrieves major, sub, format guids not the entire struct
  /*[id(0x00000008)]*/ int get_MediaType(out _AMMediaType MediaType);
  // DirectShow MediaType DWINGUID, this only retrieves major, sub, format guids not the entire struct
  /*[id(0x00000008)]*/ int set_MediaType(_AMMediaType* MediaType);
  // Create a copy of this component type
  /*[id(0x00000009)]*/ int Clone(out IComponentType NewCT);
}

// Generic Locator Information
interface ILocator : IDispatch {
  mixin(uuid("286d7f89-760c-4f89-80c4-66841d2507aa"));
  // static DWINGUID IID = { 0x286d7f89, 0x760c, 0x4f89, 0x80, 0xc4, 0x66, 0x84, 0x1d, 0x25, 0x07, 0xaa };
  // Carrier Frequency(KHz)
  /*[id(0x00000001)]*/ int get_CarrierFrequency(out int Frequency);
  // Carrier Frequency(KHz)
  /*[id(0x00000001)]*/ int set_CarrierFrequency(int Frequency);
  // Inner Fec Type
  /*[id(0x00000002)]*/ int get_InnerFEC(out FECMethod FEC);
  // Inner Fec Type
  /*[id(0x00000002)]*/ int set_InnerFEC(FECMethod FEC);
  // Inner Fec Rate
  /*[id(0x00000003)]*/ int get_InnerFECRate(out BinaryConvolutionCodeRate FEC);
  // Inner Fec Rate
  /*[id(0x00000003)]*/ int set_InnerFECRate(BinaryConvolutionCodeRate FEC);
  // Outer Fec Type
  /*[id(0x00000004)]*/ int get_OuterFEC(out FECMethod FEC);
  // Outer Fec Type
  /*[id(0x00000004)]*/ int set_OuterFEC(FECMethod FEC);
  // Outer Fec Rate
  /*[id(0x00000005)]*/ int get_OuterFECRate(out BinaryConvolutionCodeRate FEC);
  // Outer Fec Rate
  /*[id(0x00000005)]*/ int set_OuterFECRate(BinaryConvolutionCodeRate FEC);
  // Modulation Type
  /*[id(0x00000006)]*/ int get_Modulation(out ModulationType Modulation);
  // Modulation Type
  /*[id(0x00000006)]*/ int set_Modulation(ModulationType Modulation);
  // Modulation Symbol Rate
  /*[id(0x00000007)]*/ int get_SymbolRate(out int Rate);
  // Modulation Symbol Rate
  /*[id(0x00000007)]*/ int set_SymbolRate(int Rate);
  // Copy the Locator
  /*[id(0x00000008)]*/ int Clone(out ILocator NewLocator);
}

// Component Collection Interface
interface IComponents : IDispatch {
  mixin(uuid("fcd01846-0e19-11d3-9d8e-00c04f72d980"));
  // static DWINGUID IID = { 0xfcd01846, 0x0e19, 0x11d3, 0x9d, 0x8e, 0x00, 0xc0, 0x4f, 0x72, 0xd9, 0x80 };
  // Number of items in the collection
  /*[id(0x60020000)]*/ int get_Count(out int Count);
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IEnumVARIANT ppNewEnum);
  // Convenience Function for Use with C
  /*[id(0x60020002)]*/ int EnumComponents(out IEnumComponents ppNewEnum);
  // Get the Component at the specified index
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT Index, out IComponent ppComponent);
  // Add the Component to the collection
  /*[id(0xFFFFFDD7)]*/ int Add(IComponent Component, out DWINVARIANT NewIndex);
  // Remove the Component at the specified index
  /*[id(0xFFFFFDD5)]*/ int Remove(DWINVARIANT Index);
  // Copy the collection
  /*[id(0x60020006)]*/ int Clone(out IComponents NewList);
}

interface IEnumComponents : IUnknown {
  mixin(uuid("2a6e2939-2595-11d3-b64c-00c04f79498e"));
  // static DWINGUID IID = { 0x2a6e2939, 0x2595, 0x11d3, 0xb6, 0x4c, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  /*[id(0x60010000)]*/ int Next(uint celt, out IComponent rgelt, out uint pceltFetched);
  /*[id(0x60010001)]*/ int Skip(uint celt);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IEnumComponents ppenum);
}

// Component Interface
interface IComponent : IDispatch {
  mixin(uuid("1a5576fc-0e19-11d3-9d8e-00c04f72d980"));
  // static DWINGUID IID = { 0x1a5576fc, 0x0e19, 0x11d3, 0x9d, 0x8e, 0x00, 0xc0, 0x4f, 0x72, 0xd9, 0x80 };
  // Component Type
  /*[id(0x00000001)]*/ int get_type(out IComponentType CT);
  // Component Type
  /*[id(0x00000001)]*/ int set_type(IComponentType CT);
  // Language Identifier for Description Language
  /*[id(0x00000003)]*/ int get_DescLangID(out int LangID);
  // Language Identifier for Description Language
  /*[id(0x00000003)]*/ int set_DescLangID(int LangID);
  // Component Status
  /*[id(0x00000002)]*/ int get_Status(out ComponentStatus Status);
  // Component Status
  /*[id(0x00000002)]*/ int set_Status(ComponentStatus Status);
  // Component Description
  /*[id(0x00000004)]*/ int get_Description(out wchar* Description);
  // Component Description
  /*[id(0x00000004)]*/ int set_Description(wchar* Description);
  // Copy Component
  /*[id(0x00000005)]*/ int Clone(out IComponent NewComponent);
}

// MS Video Control TV Tuner Device Event Interface
interface IMSVidAnalogTunerEvent : IMSVidTunerEvent {
  mixin(uuid("1c15d486-911d-11d2-b632-00c04f79498e"));
  // static DWINGUID IID = { 0x1c15d486, 0x911d, 0x11d2, 0xb6, 0x32, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
}

// MS Video Control Tuner Device Event Interface
interface IMSVidTunerEvent : IMSVidInputDeviceEvent {
  mixin(uuid("1c15d485-911d-11d2-b632-00c04f79498e"));
  // static DWINGUID IID = { 0x1c15d485, 0x911d, 0x11d2, 0xb6, 0x32, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  /*[id(0x00000001)]*/ int TuneChanged(IMSVidTuner lpd);
}

// MS Video Control Input Device Event Interface
interface IMSVidInputDeviceEvent : IDispatch {
  mixin(uuid("37b0353e-a4c8-11d2-b634-00c04f79498e"));
  // static DWINGUID IID = { 0x37b0353e, 0xa4c8, 0x11d2, 0xb6, 0x34, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
}

// DShow Graph Segment Builder Interface
interface IMSVidGraphSegment : IPersist {
  mixin(uuid("1c15d482-911d-11d2-b632-00c04f79498e"));
  // static DWINGUID IID = { 0x1c15d482, 0x911d, 0x11d2, 0xb6, 0x32, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  /*[id(0x60020000)]*/ int get_Init(out IUnknown pInit);
  /*[id(0x60020000)]*/ int set_Init(IUnknown pInit);
  /*[id(0x60020002)]*/ int EnumFilters(out IEnumFilters pNewEnum);
  // Graph that contains this segment
  /*[id(0x60020003)]*/ int get_Container(out IMSVidGraphSegmentContainer ppCtl);
  // Graph that contains this segment
  /*[id(0x60020003)]*/ int set_Container(IMSVidGraphSegmentContainer ppCtl);
  // Type of Segment
  /*[id(0x60020005)]*/ int get_type(out MSVidSegmentType pType);
  // Category this segment is for
  /*[id(0x60020006)]*/ int get_Category(out DWINGUID pGuid);
  /*[id(0x60020007)]*/ int Build();
  /*[id(0x60020008)]*/ int PreRun();
  /*[id(0x60020009)]*/ int PostRun();
  /*[id(0x6002000A)]*/ int PreStop();
  /*[id(0x6002000B)]*/ int PostStop();
  /*[id(0x6002000C)]*/ int OnEventNotify(int lEventCode, LONG_PTR lEventParm1, LONG_PTR lEventParm2);
  /*[id(0x6002000D)]*/ int Decompose();
}

interface IEnumFilters : IUnknown {
  mixin(uuid("56a86893-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a86893, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60010000)]*/ int Next(uint cFilters, out IBaseFilter ppFilter, out uint pcFetched);
  /*[id(0x60010001)]*/ int Skip(uint cFilters);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IEnumFilters ppenum);
}

interface IBaseFilter : IMediaFilter {
  mixin(uuid("56a86895-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a86895, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60030000)]*/ int EnumPins(out IEnumPins ppenum);
  /*[id(0x60030001)]*/ int FindPin(wchar* Id, out IPin ppPin);
  /*[id(0x60030002)]*/ int QueryFilterInfo(out _FilterInfo pInfo);
  /*[id(0x60030003)]*/ int JoinFilterGraph(IFilterGraph pGraph, wchar* pName);
  /*[id(0x60030004)]*/ int QueryVendorInfo(out wchar* pVendorInfo);
}

interface IMediaFilter : IPersist {
  mixin(uuid("56a86899-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a86899, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60020000)]*/ int Stop();
  /*[id(0x60020001)]*/ int Pause();
  /*[id(0x60020002)]*/ int Run(long tStart);
  /*[id(0x60020003)]*/ int GetState(uint dwMilliSecsTimeout, out _FilterState State);
  /*[id(0x60020004)]*/ int SetSyncSource(IReferenceClock pClock);
  /*[id(0x60020005)]*/ int GetSyncSource(out IReferenceClock pClock);
}

interface IReferenceClock : IUnknown {
  mixin(uuid("56a86897-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a86897, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60010000)]*/ int GetTime(out long pTime);
  /*[id(0x60010001)]*/ int AdviseTime(long baseTime, long streamTime, ULONG_PTR hEvent, out ULONG_PTR pdwAdviseCookie);
  /*[id(0x60010002)]*/ int AdvisePeriodic(long startTime, long periodTime, ULONG_PTR hSemaphore, out ULONG_PTR pdwAdviseCookie);
  /*[id(0x60010003)]*/ int Unadvise(ULONG_PTR dwAdviseCookie);
}

interface IEnumPins : IUnknown {
  mixin(uuid("56a86892-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a86892, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60010000)]*/ int Next(uint cPins, out IPin ppPins, out uint pcFetched);
  /*[id(0x60010001)]*/ int Skip(uint cPins);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IEnumPins ppenum);
}

interface IPin : IUnknown {
  mixin(uuid("56a86891-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a86891, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60010000)]*/ int Connect(IPin pReceivePin, _AMMediaType* pmt);
  /*[id(0x60010001)]*/ int ReceiveConnection(IPin pConnector, _AMMediaType* pmt);
  /*[id(0x60010002)]*/ int Disconnect();
  /*[id(0x60010003)]*/ int ConnectedTo(out IPin pPin);
  /*[id(0x60010004)]*/ int ConnectionMediaType(out _AMMediaType pmt);
  /*[id(0x60010005)]*/ int QueryPinInfo(out _PinInfo pInfo);
  /*[id(0x60010006)]*/ int QueryDirection(out _PinDirection pPinDir);
  /*[id(0x60010007)]*/ int QueryId(out wchar* Id);
  /*[id(0x60010008)]*/ int QueryAccept(_AMMediaType* pmt);
  /*[id(0x60010009)]*/ int EnumMediaTypes(out IEnumMediaTypes ppenum);
  /*[id(0x6001000A)]*/ int QueryInternalConnections(out IPin apPin, ref uint nPin);
  /*[id(0x6001000B)]*/ int EndOfStream();
  /*[id(0x6001000C)]*/ int BeginFlush();
  /*[id(0x6001000D)]*/ int EndFlush();
  /*[id(0x6001000E)]*/ int NewSegment(long tStart, long tStop, double dRate);
}

interface IEnumMediaTypes : IUnknown {
  mixin(uuid("89c31040-846b-11ce-97d3-00aa0055595a"));
  // static DWINGUID IID = { 0x89c31040, 0x846b, 0x11ce, 0x97, 0xd3, 0x00, 0xaa, 0x00, 0x55, 0x59, 0x5a };
  /*[id(0x60010000)]*/ int Next(uint cMediaTypes, out _AMMediaType ppMediaTypes, out uint pcFetched);
  /*[id(0x60010001)]*/ int Skip(uint cMediaTypes);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IEnumMediaTypes ppenum);
}

interface IFilterGraph : IUnknown {
  mixin(uuid("56a8689f-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a8689f, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60010000)]*/ int AddFilter(IBaseFilter pFilter, wchar* pName);
  /*[id(0x60010001)]*/ int RemoveFilter(IBaseFilter pFilter);
  /*[id(0x60010002)]*/ int EnumFilters(out IEnumFilters ppenum);
  /*[id(0x60010003)]*/ int FindFilterByName(wchar* pName, out IBaseFilter ppFilter);
  /*[id(0x60010004)]*/ int ConnectDirect(IPin ppinOut, IPin ppinIn, _AMMediaType* pmt);
  /*[id(0x60010005)]*/ int Reconnect(IPin pPin);
  /*[id(0x60010006)]*/ int Disconnect(IPin pPin);
  /*[id(0x60010007)]*/ int SetDefaultSyncSource();
}

// DShow Graph Segment Container
interface IMSVidGraphSegmentContainer : IUnknown {
  mixin(uuid("3dd2903d-e0aa-11d2-b63a-00c04f79498e"));
  // static DWINGUID IID = { 0x3dd2903d, 0xe0aa, 0x11d2, 0xb6, 0x3a, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  // Graph
  /*[id(0x60010000)]*/ int get_Graph(out IGraphBuilder ppGraph);
  // Input Segment
  /*[id(0x60010001)]*/ int get_Input(out IMSVidGraphSegment pInput);
  // Output Segment
  /*[id(0x60010002)]*/ int get_Outputs(out IEnumMSVidGraphSegment pOutputs);
  // Video Renderer
  /*[id(0x60010003)]*/ int get_VideoRenderer(out IMSVidGraphSegment pVR);
  // Audio Renderer
  /*[id(0x60010004)]*/ int get_AudioRenderer(out IMSVidGraphSegment pAR);
  // Features
  /*[id(0x60010005)]*/ int get_Features(out IEnumMSVidGraphSegment pOutputs);
  // Composites
  /*[id(0x60010006)]*/ int get_Composites(out IEnumMSVidGraphSegment pComposites);
  // Container
  /*[id(0x60010007)]*/ int get_ParentContainer(out IUnknown ppContainer);
  /*[id(0x60010008)]*/ int Decompose(IMSVidGraphSegment pSegment);
  /*[id(0x60010009)]*/ int IsWindowless();
  /*[id(0x6001000A)]*/ int GetFocus();
}

interface IGraphBuilder : IFilterGraph {
  mixin(uuid("56a868a9-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a868a9, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60020000)]*/ int Connect(IPin ppinOut, IPin ppinIn);
  /*[id(0x60020001)]*/ int Render(IPin ppinOut);
  /*[id(0x60020002)]*/ int RenderFile(wchar* lpcwstrFile, wchar* lpcwstrPlayList);
  /*[id(0x60020003)]*/ int AddSourceFilter(wchar* lpcwstrFileName, wchar* lpcwstrFilterName, out IBaseFilter ppFilter);
  /*[id(0x60020004)]*/ int SetLogFile(ULONG_PTR hFile);
  /*[id(0x60020005)]*/ int Abort();
  /*[id(0x60020006)]*/ int ShouldOperationContinue();
}

// DShow Graph Segment Enumerator
interface IEnumMSVidGraphSegment : IUnknown {
  mixin(uuid("3dd2903e-e0aa-11d2-b63a-00c04f79498e"));
  // static DWINGUID IID = { 0x3dd2903e, 0xe0aa, 0x11d2, 0xb6, 0x3a, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  /*[id(0x60010000)]*/ int Next(uint celt, out IMSVidGraphSegment rgelt, out uint pceltFetched);
  /*[id(0x60010001)]*/ int Skip(uint celt);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IEnumMSVidGraphSegment ppenum);
}

// MS Video Control File Playback Device Interface
interface IMSVidFilePlayback : IMSVidPlayback {
  mixin(uuid("37b03539-a4c8-11d2-b634-00c04f79498e"));
  // static DWINGUID IID = { 0x37b03539, 0xa4c8, 0x11d2, 0xb6, 0x34, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  /*[id(0x00000011)]*/ int get_FileName(out wchar* FileName);
  /*[id(0x00000011)]*/ int set_FileName(wchar* FileName);
}

// MS Video Control Playback Device Interface
interface IMSVidPlayback : IMSVidInputDevice {
  mixin(uuid("37b03538-a4c8-11d2-b634-00c04f79498e"));
  // static DWINGUID IID = { 0x37b03538, 0xa4c8, 0x11d2, 0xb6, 0x34, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  // EnableResetOnStop
  /*[id(0x00000060)]*/ int get_EnableResetOnStop(out short pVal);
  // EnableResetOnStop
  /*[id(0x00000060)]*/ int set_EnableResetOnStop(short pVal);
  /*[id(0x00000023)]*/ int Run();
  /*[id(0x00000024)]*/ int Pause();
  /*[id(0x00000025)]*/ int Stop();
  /*[id(0x00000028)]*/ int get_CanStep(short fBackwards, out short pfCan);
  /*[id(0x00000027)]*/ int Step(int lStep);
  // Rate
  /*[id(0x00000091)]*/ int set_Rate(double plRate);
  // Rate
  /*[id(0x00000091)]*/ int get_Rate(out double plRate);
  // Position
  /*[id(0x00000092)]*/ int set_CurrentPosition(int lPosition);
  // Position
  /*[id(0x00000092)]*/ int get_CurrentPosition(out int lPosition);
  // PositionMode
  /*[id(0x00000093)]*/ int set_PositionMode(PositionModeList lPositionMode);
  // PositionMode
  /*[id(0x00000093)]*/ int get_PositionMode(out PositionModeList lPositionMode);
  // Length
  /*[id(0x00000094)]*/ int get_Length(out int lLength);
}

// MS Video Control File Playback Device Event Interface
interface IMSVidFilePlaybackEvent : IMSVidPlaybackEvent {
  mixin(uuid("37b0353a-a4c8-11d2-b634-00c04f79498e"));
  // static DWINGUID IID = { 0x37b0353a, 0xa4c8, 0x11d2, 0xb6, 0x34, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
}

// MS Video Control Playback Device Event Interface
interface IMSVidPlaybackEvent : IMSVidInputDeviceEvent {
  mixin(uuid("37b0353b-a4c8-11d2-b634-00c04f79498e"));
  // static DWINGUID IID = { 0x37b0353b, 0xa4c8, 0x11d2, 0xb6, 0x34, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  /*[id(0x00000002)]*/ int EndOfMedia(IMSVidPlayback lpd);
}

// IMSVidWebDVD Interface
interface IMSVidWebDVD : IMSVidPlayback {
  mixin(uuid("cf45f88b-ac56-4ee2-a73a-ed04e2885d3c"));
  // static DWINGUID IID = { 0xcf45f88b, 0xac56, 0x4ee2, 0xa7, 0x3a, 0xed, 0x04, 0xe2, 0x88, 0x5d, 0x3c };
  /*[id(0x60050000)]*/ int OnDVDEvent(int lEvent, LONG_PTR lParam1, LONG_PTR lParam2);
  // method PlayTitle
  /*[id(0x0000002A)]*/ int PlayTitle(int lTitle);
  // method PlayChapterInTitle
  /*[id(0x0000002B)]*/ int PlayChapterInTitle(int lTitle, int lChapter);
  // method PlayChapter
  /*[id(0x0000002C)]*/ int PlayChapter(int lChapter);
  // method PlayChaptersAutoStop
  /*[id(0x0000002D)]*/ int PlayChaptersAutoStop(int lTitle, int lstrChapter, int lChapterCount);
  // method PlayAtTime
  /*[id(0x0000002E)]*/ int PlayAtTime(wchar* strTime);
  // method PlayAtTimeInTitle
  /*[id(0x0000002F)]*/ int PlayAtTimeInTitle(int lTitle, wchar* strTime);
  // method PlayPeriodInTitleAutoStop
  /*[id(0x00000030)]*/ int PlayPeriodInTitleAutoStop(int lTitle, wchar* strStartTime, wchar* strEndTime);
  // method ReplayChapter
  /*[id(0x00000031)]*/ int ReplayChapter();
  // method PlayPrevChapter
  /*[id(0x00000032)]*/ int PlayPrevChapter();
  // method PlayNextChapter
  /*[id(0x00000033)]*/ int PlayNextChapter();
  // method StillOff
  /*[id(0x00000036)]*/ int StillOff();
  // AudioLanguage
  /*[id(0x00000037)]*/ int get_AudioLanguage(int lStream, short fFormat, out wchar* strAudioLang);
  // method ShowMenu
  /*[id(0x00000038)]*/ int ShowMenu(DVDMenuIDConstants MenuID);
  // method Resume
  /*[id(0x00000039)]*/ int Resume();
  // method ReturnFromSubmenu
  /*[id(0x0000003A)]*/ int ReturnFromSubmenu();
  // ButtonsAvailable
  /*[id(0x0000003B)]*/ int get_ButtonsAvailable(out int pVal);
  // CurrentButton
  /*[id(0x0000003C)]*/ int get_CurrentButton(out int pVal);
  // method SelectAndActivateButton
  /*[id(0x0000003D)]*/ int SelectAndActivateButton(int lButton);
  // method ActivateButton
  /*[id(0x0000003E)]*/ int ActivateButton();
  // method SelectRightButton
  /*[id(0x0000003F)]*/ int SelectRightButton();
  // method SelectLeftButton
  /*[id(0x00000040)]*/ int SelectLeftButton();
  // method SelectLowerButton
  /*[id(0x00000041)]*/ int SelectLowerButton();
  // method SelectUpperButton
  /*[id(0x00000042)]*/ int SelectUpperButton();
  // method ActivateAtPosition
  /*[id(0x00000043)]*/ int ActivateAtPosition(int xPos, int yPos);
  // method SelectAtPosition
  /*[id(0x00000044)]*/ int SelectAtPosition(int xPos, int yPos);
  // ButtonAtPosition
  /*[id(0x00000045)]*/ int get_ButtonAtPosition(int xPos, int yPos, out int plButton);
  // NumberOfChapters
  /*[id(0x00000046)]*/ int get_NumberOfChapters(int lTitle, out int pVal);
  // TotalTitleTime
  /*[id(0x00000047)]*/ int get_TotalTitleTime(out wchar* pVal);
  // TitlesAvailable
  /*[id(0x00000048)]*/ int get_TitlesAvailable(out int pVal);
  // VolumesAvailable
  /*[id(0x00000049)]*/ int get_VolumesAvailable(out int pVal);
  // CurrentVolume
  /*[id(0x0000004A)]*/ int get_CurrentVolume(out int pVal);
  // CurrentDiscSide
  /*[id(0x0000004B)]*/ int get_CurrentDiscSide(out int pVal);
  // CurrentDomain
  /*[id(0x0000004C)]*/ int get_CurrentDomain(out int pVal);
  // CurrentChapter
  /*[id(0x0000004D)]*/ int get_CurrentChapter(out int pVal);
  // CurrentTitle
  /*[id(0x0000004E)]*/ int get_CurrentTitle(out int pVal);
  // CurrentTime
  /*[id(0x0000004F)]*/ int get_CurrentTime(out wchar* pVal);
  // method DVDTimeCode2bstr
  /*[id(0x00000051)]*/ int DVDTimeCode2bstr(int timeCode, out wchar* pTimeStr);
  // DVDDirectory
  /*[id(0x00000052)]*/ int get_DVDDirectory(out wchar* pVal);
  // DVDDirectory
  /*[id(0x00000052)]*/ int set_DVDDirectory(wchar* pVal);
  // method IsSubpictureStreamEnabled
  /*[id(0x00000053)]*/ int IsSubpictureStreamEnabled(int lStream, out short fEnabled);
  // method IsAudioStreamEnabled
  /*[id(0x00000054)]*/ int IsAudioStreamEnabled(int lStream, out short fEnabled);
  // CurrentSubpictureStream
  /*[id(0x00000055)]*/ int get_CurrentSubpictureStream(out int pVal);
  // CurrentSubpictureStream
  /*[id(0x00000055)]*/ int set_CurrentSubpictureStream(int pVal);
  // SubpictureLanguage
  /*[id(0x00000056)]*/ int get_SubpictureLanguage(int lStream, out wchar* strLanguage);
  // CurrentAudioStream
  /*[id(0x00000057)]*/ int get_CurrentAudioStream(out int pVal);
  // CurrentAudioStream
  /*[id(0x00000057)]*/ int set_CurrentAudioStream(int pVal);
  // AudioStreamsAvailable
  /*[id(0x00000058)]*/ int get_AudioStreamsAvailable(out int pVal);
  // AnglesAvailable
  /*[id(0x00000059)]*/ int get_AnglesAvailable(out int pVal);
  // CurrentAngle
  /*[id(0x0000005A)]*/ int get_CurrentAngle(out int pVal);
  // CurrentAngle
  /*[id(0x0000005A)]*/ int set_CurrentAngle(int pVal);
  // SubpictureStreamsAvailable
  /*[id(0x0000005D)]*/ int get_SubpictureStreamsAvailable(out int pVal);
  // SubpictureOn
  /*[id(0x0000005E)]*/ int get_SubpictureOn(out short pVal);
  // SubpictureOn
  /*[id(0x0000005E)]*/ int set_SubpictureOn(short pVal);
  // DVDUniqueID
  /*[id(0x0000005F)]*/ int get_DVDUniqueID(out wchar* pVal);
  // method AcceptParentalLevelChange
  /*[id(0x00000061)]*/ int AcceptParentalLevelChange(short fAccept, wchar* strUserName, wchar* strPassword);
  // method NotifyParentalLevelChange
  /*[id(0x00000062)]*/ int NotifyParentalLevelChange(short newVal);
  // method SelectParentalCountry
  /*[id(0x00000063)]*/ int SelectParentalCountry(int lCountry, wchar* strUserName, wchar* strPassword);
  // method SelectParentalLevel
  /*[id(0x00000064)]*/ int SelectParentalLevel(int lParentalLevel, wchar* strUserName, wchar* strPassword);
  // TitleParentalLevels
  /*[id(0x00000065)]*/ int get_TitleParentalLevels(int lTitle, out int plParentalLevels);
  // PlayerParentalCountry
  /*[id(0x00000066)]*/ int get_PlayerParentalCountry(out int plCountryCode);
  // PlayerParentalLevel
  /*[id(0x00000067)]*/ int get_PlayerParentalLevel(out int plParentalLevel);
  // method Eject
  /*[id(0x00000068)]*/ int Eject();
  // method UOPValid
  /*[id(0x00000069)]*/ int UOPValid(int lUOP, out short pfValid);
  // SPRM
  /*[id(0x0000006A)]*/ int get_SPRM(int lIndex, out short psSPRM);
  // GPRM
  /*[id(0x0000006B)]*/ int get_GPRM(int lIndex, out short psSPRM);
  // GPRM
  /*[id(0x0000006B)]*/ int set_GPRM(int lIndex, short psSPRM);
  // DVDTextStringType
  /*[id(0x0000006C)]*/ int get_DVDTextStringType(int lLangIndex, int lStringIndex, out DVDTextStringType pType);
  // DVDTextString
  /*[id(0x0000006D)]*/ int get_DVDTextString(int lLangIndex, int lStringIndex, out wchar* pstrText);
  // DVDTextNumberOfStrings
  /*[id(0x0000006E)]*/ int get_DVDTextNumberOfStrings(int lLangIndex, out int plNumOfStrings);
  // DVDTextNumberOfLanguages
  /*[id(0x0000006F)]*/ int get_DVDTextNumberOfLanguages(out int plNumOfLangs);
  // DVDTextLanguageLCID
  /*[id(0x00000070)]*/ int get_DVDTextLanguageLCID(int lLangIndex, out int lcid);
  // method RegionChange
  /*[id(0x00000071)]*/ int RegionChange();
  // DVDAdm
  /*[id(0x00000072)]*/ int get_DVDAdm(out IDispatch pVal);
  // method DeleteBookmark
  /*[id(0x00000073)]*/ int DeleteBookmark();
  // method RestoreBookmark
  /*[id(0x00000074)]*/ int RestoreBookmark();
  // method SaveBookmark
  /*[id(0x00000075)]*/ int SaveBookmark();
  // method SelectDefaultAudioLanguage
  /*[id(0x00000076)]*/ int SelectDefaultAudioLanguage(int lang, int ext);
  // method SelectDefaultSubpictureLanguage
  /*[id(0x00000077)]*/ int SelectDefaultSubpictureLanguage(int lang, DVDSPExt ext);
  // PreferredSubpictureStream
  /*[id(0x00000078)]*/ int get_PreferredSubpictureStream(out int pVal);
  // DefaultMenuLanguage
  /*[id(0x00000079)]*/ int get_DefaultMenuLanguage(out int lang);
  // DefaultMenuLanguage
  /*[id(0x00000079)]*/ int set_DefaultMenuLanguage(int lang);
  // DefaultSubpictureLanguage
  /*[id(0x0000007A)]*/ int get_DefaultSubpictureLanguage(out int lang);
  // DefaultAudioLanguage
  /*[id(0x0000007B)]*/ int get_DefaultAudioLanguage(out int lang);
  // DefaultSubpictureLanguageExt
  /*[id(0x0000007C)]*/ int get_DefaultSubpictureLanguageExt(out DVDSPExt ext);
  // DefaultAudioLanguageExt
  /*[id(0x0000007D)]*/ int get_DefaultAudioLanguageExt(out int ext);
  // LanguageFromLCID
  /*[id(0x0000007E)]*/ int get_LanguageFromLCID(int lcid, out wchar* lang);
  // KaraokeAudioPresentationMode
  /*[id(0x0000007F)]*/ int get_KaraokeAudioPresentationMode(out int pVal);
  // KaraokeAudioPresentationMode
  /*[id(0x0000007F)]*/ int set_KaraokeAudioPresentationMode(int pVal);
  // KaraokeChannelContent
  /*[id(0x00000080)]*/ int get_KaraokeChannelContent(int lStream, int lChan, out int lContent);
  // KaraokeChannelAssignment
  /*[id(0x00000081)]*/ int get_KaraokeChannelAssignment(int lStream, out int lChannelAssignment);
  // method RestorePreferredSettings
  /*[id(0x00000082)]*/ int RestorePreferredSettings();
  // ButtonRect
  /*[id(0x00000083)]*/ int get_ButtonRect(int lButton, out IMSVidRect pRect);
  // DVDScreenInMouseCoordinates
  /*[id(0x00000084)]*/ int get_DVDScreenInMouseCoordinates(out IMSVidRect ppRect);
  // DVDScreenInMouseCoordinates
  /*[id(0x00000084)]*/ int set_DVDScreenInMouseCoordinates(IMSVidRect ppRect);
}

// Automation Compliant GDI Rect with Automatic HWND Scaling
interface IMSVidRect : IDispatch {
  mixin(uuid("7f5000a6-a440-47ca-8acc-c0e75531a2c2"));
  // static DWINGUID IID = { 0x7f5000a6, 0xa440, 0x47ca, 0x8a, 0xcc, 0xc0, 0xe7, 0x55, 0x31, 0xa2, 0xc2 };
  // Rectangle Top
  /*[id(0x60020000)]*/ int get_Top(out int TopVal);
  // Rectangle Top
  /*[id(0x60020000)]*/ int set_Top(int TopVal);
  // Rectangle Left
  /*[id(0x60020002)]*/ int get_Left(out int LeftVal);
  // Rectangle Left
  /*[id(0x60020002)]*/ int set_Left(int LeftVal);
  // Rectangle Width
  /*[id(0x60020004)]*/ int get_Width(out int WidthVal);
  // Rectangle Width
  /*[id(0x60020004)]*/ int set_Width(int WidthVal);
  // Rectangle Height
  /*[id(0x60020006)]*/ int get_Height(out int HeightVal);
  // Rectangle Height
  /*[id(0x60020006)]*/ int set_Height(int HeightVal);
  // Coordinates relative to HWnd
  /*[id(0x60020008)]*/ int get_HWnd(out wireHWND HWndVal);
  // Coordinates relative to HWnd
  /*[id(0x60020008)]*/ int set_HWnd(wireHWND HWndVal);
  // New Rectangle Values
  /*[id(0x6002000A)]*/ int set_Rect(IMSVidRect value);
}

// MS Video Control File Playback Device Event Interface
interface IMSVidWebDVDEvent : IMSVidPlaybackEvent {
  mixin(uuid("b4f7a674-9b83-49cb-a357-c63b871be958"));
  // static DWINGUID IID = { 0xb4f7a674, 0x9b83, 0x49cb, 0xa3, 0x57, 0xc6, 0x3b, 0x87, 0x1b, 0xe9, 0x58 };
  // Notifies the client about DVD Code
  /*[id(0x00000003)]*/ int DVDNotify(int lEventCode, DWINVARIANT lParam1, DWINVARIANT lParam2);
  // Notifies the client
  /*[id(0x00000004)]*/ int PlayForwards(short bEnabled);
  // Notifies the client
  /*[id(0x00000005)]*/ int PlayBackwards(short bEnabled);
  // Notifies the client
  /*[id(0x00000006)]*/ int ShowMenu(DVDMenuIDConstants __MIDL_0021, short bEnabled);
  // Notifies the client
  /*[id(0x00000007)]*/ int Resume(short bEnabled);
  // Notifies the client
  /*[id(0x00000008)]*/ int SelectOrActivateButton(short bEnabled);
  // Notifies the client
  /*[id(0x00000009)]*/ int StillOff(short bEnabled);
  // Notifies the client
  /*[id(0x0000000A)]*/ int PauseOn(short bEnabled);
  // Notifies the client
  /*[id(0x0000000B)]*/ int ChangeCurrentAudioStream(short bEnabled);
  // Notifies the client
  /*[id(0x0000000C)]*/ int ChangeCurrentSubpictureStream(short bEnabled);
  // Notifies the client
  /*[id(0x0000000D)]*/ int ChangeCurrentAngle(short bEnabled);
  // Notifies the client
  /*[id(0x0000000E)]*/ int PlayAtTimeInTitle(short bEnabled);
  // Notifies the client
  /*[id(0x0000000F)]*/ int PlayAtTime(short bEnabled);
  // Notifies the client
  /*[id(0x00000010)]*/ int PlayChapterInTitle(short bEnabled);
  // Notifies the client
  /*[id(0x00000011)]*/ int PlayChapter(short bEnabled);
  // Notifies the client
  /*[id(0x00000012)]*/ int ReplayChapter(short bEnabled);
  // Notifies the client
  /*[id(0x00000013)]*/ int PlayNextChapter(short bEnabled);
  // Notifies the client
  /*[id(0x00000014)]*/ int Stop(short bEnabled);
  // Notifies the client
  /*[id(0x00000015)]*/ int ReturnFromSubmenu(short bEnabled);
  // Notifies the client
  /*[id(0x00000016)]*/ int PlayTitle(short bEnabled);
  // Notifies the client
  /*[id(0x00000017)]*/ int PlayPrevChapter(short bEnabled);
  // Notifies the client
  /*[id(0x00000018)]*/ int ChangeKaraokePresMode(short bEnabled);
  // Notifies the client
  /*[id(0x00000019)]*/ int ChangeVideoPresMode(short bEnabled);
}

// IMSVidWebDVDAdm Interface
interface IMSVidWebDVDAdm : IDispatch {
  mixin(uuid("b8be681a-eb2c-47f0-b415-94d5452f0e05"));
  // static DWINGUID IID = { 0xb8be681a, 0xeb2c, 0x47f0, 0xb4, 0x15, 0x94, 0xd5, 0x45, 0x2f, 0x0e, 0x05 };
  // method ChangePassword
  /*[id(0x00000095)]*/ int ChangePassword(wchar* strUserName, wchar* strOld, wchar* strNew);
  // method SaveParentalLevel
  /*[id(0x00000096)]*/ int SaveParentalLevel(int level, wchar* strUserName, wchar* strPassword);
  // method SaveParentalCountry
  /*[id(0x00000097)]*/ int SaveParentalCountry(int country, wchar* strUserName, wchar* strPassword);
  // method ConfirmPassword
  /*[id(0x00000098)]*/ int ConfirmPassword(wchar* strUserName, wchar* strPassword, out short pVal);
  // method GetParentalLevel
  /*[id(0x00000099)]*/ int GetParentalLevel(out int lLevel);
  // method GetParentalCountry
  /*[id(0x0000009A)]*/ int GetParentalCountry(out int lCountry);
  // property DefaultAudioLCID
  /*[id(0x0000009B)]*/ int get_DefaultAudioLCID(out int pVal);
  // property DefaultAudioLCID
  /*[id(0x0000009B)]*/ int set_DefaultAudioLCID(int pVal);
  // property DefaultSubpictureLCID
  /*[id(0x0000009C)]*/ int get_DefaultSubpictureLCID(out int pVal);
  // property DefaultSubpictureLCID
  /*[id(0x0000009C)]*/ int set_DefaultSubpictureLCID(int pVal);
  // property DefaultMenuLCID
  /*[id(0x0000009D)]*/ int get_DefaultMenuLCID(out int pVal);
  // property DefaultMenuLCID
  /*[id(0x0000009D)]*/ int set_DefaultMenuLCID(int pVal);
  // property BookmarkOnStop
  /*[id(0x0000009E)]*/ int get_BookmarkOnStop(out short pVal);
  // property BookmarkOnStop
  /*[id(0x0000009E)]*/ int set_BookmarkOnStop(short pVal);
}

// MS Video Control Video Renderer Device Interface
interface IMSVidVideoRenderer2 : IMSVidVideoRenderer {
  mixin(uuid("6bdd5c1e-2810-4159-94bc-05511ae8549b"));
  // static DWINGUID IID = { 0x6bdd5c1e, 0x2810, 0x4159, 0x94, 0xbc, 0x05, 0x51, 0x1a, 0xe8, 0x54, 0x9b };
  /*[id(0x000000A3)]*/ int get_Allocator(out IUnknown AllocPresent);
  /*[id(0x000000A4)]*/ int get__Allocator(out IVMRSurfaceAllocator AllocPresent);
  /*[id(0x000000A5)]*/ int get_Allocator_ID(out int Id);
  /*[id(0x000000A6)]*/ int SetAllocator(IUnknown AllocPresent, int Id);
  /*[id(0x000000A7)]*/ int _SetAllocator(IVMRSurfaceAllocator AllocPresent, int Id);
  /*[id(0x000000BD)]*/ int set_SuppressEffects(short bSuppress);
  /*[id(0x000000BD)]*/ int get_SuppressEffects(out short bSuppress);
}

// MS Video Control Video Renderer Device Interface
interface IMSVidVideoRenderer : IMSVidOutputDevice {
  mixin(uuid("37b03540-a4c8-11d2-b634-00c04f79498e"));
  // static DWINGUID IID = { 0x37b03540, 0xa4c8, 0x11d2, 0xb6, 0x34, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  /*[id(0x00000086)]*/ int get_CustomCompositorClass(out wchar* CompositorCLSID);
  /*[id(0x00000086)]*/ int set_CustomCompositorClass(wchar* CompositorCLSID);
  /*[id(0x00000085)]*/ int get__CustomCompositorClass(out DWINGUID CompositorCLSID);
  /*[id(0x00000085)]*/ int set__CustomCompositorClass(ref DWINGUID CompositorCLSID);
  /*[id(0x00000087)]*/ int get__CustomCompositor(out IVMRImageCompositor Compositor);
  /*[id(0x00000087)]*/ int set__CustomCompositor(IVMRImageCompositor Compositor);
  /*[id(0x00000088)]*/ int get_MixerBitmap(out IPictureDisp MixerPictureDisp);
  /*[id(0x00000089)]*/ int get__MixerBitmap(out IVMRMixerBitmap MixerPicture);
  /*[id(0x00000088)]*/ int set_MixerBitmap(IPictureDisp* MixerPictureDisp);
  /*[id(0x00000089)]*/ int set__MixerBitmap(_VMRALPHABITMAP* MixerPicture);
  /*[id(0x0000008B)]*/ int get_MixerBitmapPositionRect(out IMSVidRect rDest);
  /*[id(0x0000008B)]*/ int set_MixerBitmapPositionRect(IMSVidRect rDest);
  /*[id(0x0000008A)]*/ int get_MixerBitmapOpacity(out int opacity);
  /*[id(0x0000008A)]*/ int set_MixerBitmapOpacity(int opacity);
  /*[id(0x0000008C)]*/ int SetupMixerBitmap(IPictureDisp* MixerPictureDisp, int opacity, IMSVidRect rDest);
  /*[id(0x00000029)]*/ int get_SourceSize(out SourceSizeList CurrentSize);
  /*[id(0x00000029)]*/ int set_SourceSize(SourceSizeList CurrentSize);
  // trim each source edge by this amount(in hundredths of percent, e.g. 1.75% == 175)
  /*[id(0x00000005)]*/ int get_OverScan(out int plPercent);
  // trim each source edge by this amount(in hundredths of percent, e.g. 1.75% == 175)
  /*[id(0x00000005)]*/ int set_OverScan(int plPercent);
  /*[id(0x00000021)]*/ int get_AvailableSourceRect(out IMSVidRect pRect);
  /*[id(0x0000009F)]*/ int get_MaxVidRect(out IMSVidRect ppVidRect);
  /*[id(0x000000A0)]*/ int get_MinVidRect(out IMSVidRect ppVidRect);
  /*[id(0x00000020)]*/ int get_ClippedSourceRect(out IMSVidRect pRect);
  /*[id(0x00000020)]*/ int set_ClippedSourceRect(IMSVidRect pRect);
  /*[id(0x0000008D)]*/ int get_UsingOverlay(out short UseOverlayVal);
  /*[id(0x0000008D)]*/ int set_UsingOverlay(short UseOverlayVal);
  /*[id(0x000000A1)]*/ int Capture(out IPictureDisp currentImage);
  // FramesPerSecond
  /*[id(0x00000050)]*/ int get_FramesPerSecond(out int pVal);
  // DecimateInput
  /*[id(0x000000A2)]*/ int get_DecimateInput(out short pDeci);
  // DecimateInput
  /*[id(0x000000A2)]*/ int set_DecimateInput(short pDeci);
}

// MS Video Control Output Device Interface
interface IMSVidOutputDevice : IMSVidDevice {
  mixin(uuid("37b03546-a4c8-11d2-b634-00c04f79498e"));
  // static DWINGUID IID = { 0x37b03546, 0xa4c8, 0x11d2, 0xb6, 0x34, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
}

// IVMRImageCompositor Interface
interface IVMRImageCompositor : IUnknown {
  mixin(uuid("7a4fb5af-479f-4074-bb40-ce6722e43c82"));
  // static DWINGUID IID = { 0x7a4fb5af, 0x479f, 0x4074, 0xbb, 0x40, 0xce, 0x67, 0x22, 0xe4, 0x3c, 0x82 };
  /*[id(0x60010000)]*/ int InitCompositionTarget(IUnknown pD3DDevice, uint* pddsRenderTarget);
  /*[id(0x60010001)]*/ int TermCompositionTarget(IUnknown pD3DDevice, uint* pddsRenderTarget);
  /*[id(0x60010002)]*/ int SetStreamMediaType(uint dwStrmID, _AMMediaType* pmt, int fTexture);
  /*[id(0x60010003)]*/ int CompositeImage(IUnknown pD3DDevice, uint* pddsRenderTarget, _AMMediaType* pmtRenderTarget, long rtStart, long rtEnd, uint dwClrBkGnd, _VMRVIDEOSTREAMINFO* pVideoStreamInfo, uint cStreams);
}

// IVMRMixerBitmap Interface
interface IVMRMixerBitmap : IUnknown {
  mixin(uuid("1e673275-0257-40aa-af20-7c608d4a0428"));
  // static DWINGUID IID = { 0x1e673275, 0x0257, 0x40aa, 0xaf, 0x20, 0x7c, 0x60, 0x8d, 0x4a, 0x04, 0x28 };
  /*[id(0x60010000)]*/ int SetAlphaBitmap(_VMRALPHABITMAP* pBmpParms);
  /*[id(0x60010001)]*/ int UpdateAlphaBitmapParameters(_VMRALPHABITMAP* pBmpParms);
  /*[id(0x60010002)]*/ int GetAlphaBitmapParameters(out _VMRALPHABITMAP pBmpParms);
}

// IVMRSurfaceAllocator Interface
interface IVMRSurfaceAllocator : IUnknown {
  mixin(uuid("31ce832e-4484-458b-8cca-f4d7e3db0b52"));
  // static DWINGUID IID = { 0x31ce832e, 0x4484, 0x458b, 0x8c, 0xca, 0xf4, 0xd7, 0xe3, 0xdb, 0x0b, 0x52 };
  /*[id(0x60010000)]*/ int AllocateSurface(ULONG_PTR dwUserID, tagVMRALLOCATIONINFO* lpAllocInfo, ref uint lpdwActualBuffers, out uint lplpSurface);
  /*[id(0x60010001)]*/ int FreeSurface(ULONG_PTR dwID);
  /*[id(0x60010002)]*/ int PrepareSurface(ULONG_PTR dwUserID, uint* lpSurface, uint dwSurfaceFlags);
  /*[id(0x60010003)]*/ int AdviseNotify(IVMRSurfaceAllocatorNotify lpIVMRSurfAllocNotify);
}

// IVMRSurfaceAllocatorNotify Interface
interface IVMRSurfaceAllocatorNotify : IUnknown {
  mixin(uuid("aada05a8-5a4e-4729-af0b-cea27aed51e2"));
  // static DWINGUID IID = { 0xaada05a8, 0x5a4e, 0x4729, 0xaf, 0x0b, 0xce, 0xa2, 0x7a, 0xed, 0x51, 0xe2 };
  /*[id(0x60010000)]*/ int AdviseSurfaceAllocator(ULONG_PTR dwUserID, IVMRSurfaceAllocator lpIVRMSurfaceAllocator);
  /*[id(0x60010001)]*/ int SetDDrawDevice(uint* lpDDrawDevice, void* hMonitor);
  /*[id(0x60010002)]*/ int ChangeDDrawDevice(uint* lpDDrawDevice, void* hMonitor);
  /*[id(0x60010003)]*/ int RestoreDDrawSurfaces();
  /*[id(0x60010004)]*/ int NotifyEvent(int EventCode, LONG_PTR Param1, LONG_PTR Param2);
  /*[id(0x60010005)]*/ int SetBorderColor(uint clrBorder);
}

// MS Video Control Video Renderer Device Event Interface
interface IMSVidVideoRendererEvent : IMSVidOutputDeviceEvent {
  mixin(uuid("37b03545-a4c8-11d2-b634-00c04f79498e"));
  // static DWINGUID IID = { 0x37b03545, 0xa4c8, 0x11d2, 0xb6, 0x34, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  // HW Overlay surface in use or not present
  /*[id(0x0000001A)]*/ int OverlayUnavailable();
}

// MS Video Control Output Device Event Interface
interface IMSVidOutputDeviceEvent : IMSVidDeviceEvent {
  mixin(uuid("2e6a14e2-571c-11d3-b652-00c04f79498e"));
  // static DWINGUID IID = { 0x2e6a14e2, 0x571c, 0x11d3, 0xb6, 0x52, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
}

// MS Video Control Device Event Interface
interface IMSVidDeviceEvent : IDispatch {
  mixin(uuid("1c15d480-911d-11d2-b632-00c04f79498e"));
  // static DWINGUID IID = { 0x1c15d480, 0x911d, 0x11d2, 0xb6, 0x32, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  /*[id(0x00000000)]*/ int StateChange(IMSVidDevice lpd, int oldState, int newState);
}

// MS Video Control Audio Renderer Device Interface
interface IMSVidAudioRenderer : IMSVidOutputDevice {
  mixin(uuid("37b0353f-a4c8-11d2-b634-00c04f79498e"));
  // static DWINGUID IID = { 0x37b0353f, 0xa4c8, 0x11d2, 0xb6, 0x34, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  /*[id(0x00000007)]*/ int set_Volume(int lVol);
  /*[id(0x00000007)]*/ int get_Volume(out int lVol);
  /*[id(0x00000008)]*/ int set_Balance(int lBal);
  /*[id(0x00000008)]*/ int get_Balance(out int lBal);
}

// MS Video Control Audio Renderer Device Event Interface
interface IMSVidAudioRendererEvent : IMSVidOutputDeviceEvent {
  mixin(uuid("37b03541-a4c8-11d2-b634-00c04f79498e"));
  // static DWINGUID IID = { 0x37b03541, 0xa4c8, 0x11d2, 0xb6, 0x34, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
}

// MS Video Control Generic Sink Output Device
interface IMSVidGenericSink : IMSVidOutputDevice {
  mixin(uuid("6c29b41d-455b-4c33-963a-0d28e5e555ea"));
  // static DWINGUID IID = { 0x6c29b41d, 0x455b, 0x4c33, 0x96, 0x3a, 0x0d, 0x28, 0xe5, 0xe5, 0x55, 0xea };
  // Set the sink filter (CLSID)
  /*[id(0x000000BF)]*/ int SetSinkFilter(wchar* bstrName);
  // SinkPaths
  /*[id(0x000000C0)]*/ int get_SinkStreams(out MSVidSinkStreams pStreams);
  // SinkPaths
  /*[id(0x000000C0)]*/ int set_SinkStreams(MSVidSinkStreams pStreams);
}

// MS Video Control Stream Buffer Sink 2 Output Device Interface
interface IMSVidStreamBufferSink2 : IMSVidStreamBufferSink {
  mixin(uuid("2ca9fc63-c131-4e5a-955a-544a47c67146"));
  // static DWINGUID IID = { 0x2ca9fc63, 0xc131, 0x4e5a, 0x95, 0x5a, 0x54, 0x4a, 0x47, 0xc6, 0x71, 0x46 };
  // Unlock Sink Filename
  /*[id(0x000000C6)]*/ int UnlockProfile();
}

// MS Video Control Stream Buffer Sink Output Device Interface
interface IMSVidStreamBufferSink : IMSVidOutputDevice {
  mixin(uuid("159dbb45-cd1b-4dab-83ea-5cb1f4f21d07"));
  // static DWINGUID IID = { 0x159dbb45, 0xcd1b, 0x4dab, 0x83, 0xea, 0x5c, 0xb1, 0xf4, 0xf2, 0x1d, 0x07 };
  // New Recording Object
  /*[id(0x000000AA)]*/ int get_ContentRecorder(wchar* pszFilename, out IMSVidStreamBufferRecordingControl pRecordingIUnknown);
  // New Recording Object
  /*[id(0x000000AB)]*/ int get_ReferenceRecorder(wchar* pszFilename, out IMSVidStreamBufferRecordingControl pRecordingIUnknown);
  // Sink Name
  /*[id(0x000000A8)]*/ int get_SinkName(out wchar* pName);
  // Sink Name
  /*[id(0x000000A8)]*/ int set_SinkName(wchar* pName);
  // Name Set Lock
  /*[id(0x000000B0)]*/ int NameSetLock();
  // SBE Sink Interface
  /*[id(0x000000B5)]*/ int get_SBESink(out IUnknown sbeConfig);
}

// IMSVidStreamBufferRecordingControl Interface
interface IMSVidStreamBufferRecordingControl : IDispatch {
  mixin(uuid("160621aa-bbbc-4326-a824-c395aebc6e74"));
  // static DWINGUID IID = { 0x160621aa, 0xbbbc, 0x4326, 0xa8, 0x24, 0xc3, 0x95, 0xae, 0xbc, 0x6e, 0x74 };
  // method StartTime, values in milliseconds
  /*[id(0x000000AC)]*/ int get_startTime(out int rtStart);
  // method StartTime, values in milliseconds
  /*[id(0x000000AC)]*/ int set_startTime(int rtStart);
  // method StopTime, values in milliseconds
  /*[id(0x000000AD)]*/ int get_StopTime(out int rtStop);
  // method StopTime, values in milliseconds
  /*[id(0x000000AD)]*/ int set_StopTime(int rtStop);
  // method RecordingStopped
  /*[id(0x000000AE)]*/ int get_RecordingStopped(out short phResult);
  // method RecordingStarted
  /*[id(0x000000AF)]*/ int get_RecordingStarted(out short phResult);
  // property returns type of recording object
  /*[id(0x000000B1)]*/ int get_RecordingType(out RecordingType dwType);
  // get Recording Attribute interface
  /*[id(0x000000B3)]*/ int get_RecordingAttribute(out IUnknown pRecordingAttribute);
}

// MS Video Control Stream Buffer Sink 2 Device Event Interface
interface IMSVidStreamBufferSinkEvent2 : IMSVidStreamBufferSinkEvent {
  mixin(uuid("3d7a5166-72d7-484b-a06f-286187b80ca1"));
  // static DWINGUID IID = { 0x3d7a5166, 0x72d7, 0x484b, 0xa0, 0x6f, 0x28, 0x61, 0x87, 0xb8, 0x0c, 0xa1 };
  // Source Encryption On
  /*[id(0x00000027)]*/ int EncryptionOn();
  // Source Encryption Off
  /*[id(0x00000028)]*/ int EncryptionOff();
}

// MS Video Control Stream Buffer Sink Output Device Event Interface
interface IMSVidStreamBufferSinkEvent : IMSVidOutputDeviceEvent {
  mixin(uuid("f798a36b-b05b-4bbe-9703-eaea7d61cd51"));
  // static DWINGUID IID = { 0xf798a36b, 0xb05b, 0x4bbe, 0x97, 0x03, 0xea, 0xea, 0x7d, 0x61, 0xcd, 0x51 };
  // Sink Certificate Failure
  /*[id(0x0000001B)]*/ int CertificateFailure();
  // Sink Certificate Success
  /*[id(0x0000001C)]*/ int CertificateSuccess();
  // Sink Write Failure
  /*[id(0x00000022)]*/ int WriteFailure();
}

// MS Video Control Stream Buffer Source Device Interface
interface IMSVidStreamBufferSource : IMSVidFilePlayback {
  mixin(uuid("eb0c8cf9-6950-4772-87b1-47d11cf3a02f"));
  // static DWINGUID IID = { 0xeb0c8cf9, 0x6950, 0x4772, 0x87, 0xb1, 0x47, 0xd1, 0x1c, 0xf3, 0xa0, 0x2f };
  // Start
  /*[id(0x000000B2)]*/ int get_Start(out int lStart);
  // get Recording Attribute interface
  /*[id(0x000000B4)]*/ int get_RecordingAttribute(out IUnknown pRecordingAttribute);
  // Current Ratings for SBE playback
  /*[id(0x000000B6)]*/ int CurrentRatings(out EnTvRat_System pEnSystem, out EnTvRat_GenericLevel pEnRating, out int pBfEnAttr);
  // Maximum Ratings Level for SBE playback
  /*[id(0x000000B7)]*/ int MaxRatingsLevel(EnTvRat_System enSystem, EnTvRat_GenericLevel enRating, int lbfEnAttr);
  // Block unrated content
  /*[id(0x000000BB)]*/ int set_BlockUnrated(short value);
  // Maximum Ratings Level for SBE playback
  /*[id(0x000000BC)]*/ int set_UnratedDelay(int value);
  // Stream Buffer Source Interface
  /*[id(0x000000BE)]*/ int get_SBESource(out IUnknown sbeFilter);
}

// MS Video Control Stream Buffer Source Device Event Interface
interface IMSVidStreamBufferSourceEvent : IMSVidFilePlaybackEvent {
  mixin(uuid("50ce8a7d-9c28-4da8-9042-cdfa7116f979"));
  // static DWINGUID IID = { 0x50ce8a7d, 0x9c28, 0x4da8, 0x90, 0x42, 0xcd, 0xfa, 0x71, 0x16, 0xf9, 0x79 };
  // Source Certificate Failure
  /*[id(0x0000001D)]*/ int CertificateFailure();
  // Source Certificate Success
  /*[id(0x0000001E)]*/ int CertificateSuccess();
  // Ratings Blocked
  /*[id(0x0000001F)]*/ int RatingsBlocked();
  // Ratings Unblocked
  /*[id(0x00000020)]*/ int RatingsUnblocked();
  // Ratings Changed
  /*[id(0x00000021)]*/ int RatingsChanged();
  // Source Time Hole
  /*[id(0x00000023)]*/ int TimeHole(int StreamOffsetMS, int SizeMS);
  // Source Stale Data Read
  /*[id(0x00000024)]*/ int StaleDataRead();
  // Source Content Becoming Stale
  /*[id(0x00000025)]*/ int ContentBecomingStale();
  // Source Stale File Deleted
  /*[id(0x00000026)]*/ int StaleFileDeleted();
}

// MS Video Control Stream Buffer Source Device Event2 Interface
interface IMSVidStreamBufferSourceEvent2 : IMSVidStreamBufferSourceEvent {
  mixin(uuid("7aef50ce-8e22-4ba8-bc06-a92a458b4ef2"));
  // static DWINGUID IID = { 0x7aef50ce, 0x8e22, 0x4ba8, 0xbc, 0x06, 0xa9, 0x2a, 0x45, 0x8b, 0x4e, 0xf2 };
  // Rate has changed
  /*[id(0x00000029)]*/ int RateChange(double qwNewRate, double qwOldRate);
}

// MS Video Control Data Services Feature Interface
interface IMSVidDataServices : IMSVidFeature {
  mixin(uuid("334125c1-77e5-11d3-b653-00c04f79498e"));
  // static DWINGUID IID = { 0x334125c1, 0x77e5, 0x11d3, 0xb6, 0x53, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
}

// MS Video Control Feature Interface
interface IMSVidFeature : IMSVidDevice {
  mixin(uuid("37b03547-a4c8-11d2-b634-00c04f79498e"));
  // static DWINGUID IID = { 0x37b03547, 0xa4c8, 0x11d2, 0xb6, 0x34, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
}

// MS Video Control Encoder Feature Interface
interface IMSVidEncoder : IMSVidFeature {
  mixin(uuid("c0020fd4-bee7-43d9-a495-9f213117103d"));
  // static DWINGUID IID = { 0xc0020fd4, 0xbee7, 0x43d9, 0xa4, 0x95, 0x9f, 0x21, 0x31, 0x17, 0x10, 0x3d };
  /*[id(0x000000B9)]*/ int get_VideoEncoderInterface(out IUnknown ppEncInt);
  /*[id(0x000000B8)]*/ int get_AudioEncoderInterface(out IUnknown ppEncInt);
}

// MS Video Control XDS Feature Interface
interface IMSVidXDS : IMSVidFeature {
  mixin(uuid("11ebc158-e712-4d1f-8bb3-01ed5274c4ce"));
  // static DWINGUID IID = { 0x11ebc158, 0xe712, 0x4d1f, 0x8b, 0xb3, 0x01, 0xed, 0x52, 0x74, 0xc4, 0xce };
  /*[id(0x000000C5)]*/ int get_ChannelChangeInterface(out IUnknown punkCC);
}

// MS Video Control Closed Captioning Feature Interface 3
interface IMSVidClosedCaptioning3 : IMSVidClosedCaptioning2 {
  mixin(uuid("c8638e8a-7625-4c51-9366-2f40a9831fc0"));
  // static DWINGUID IID = { 0xc8638e8a, 0x7625, 0x4c51, 0x93, 0x66, 0x2f, 0x40, 0xa9, 0x83, 0x1f, 0xc0 };
  /*[id(0x000000C4)]*/ int get_TeleTextFilter(out IUnknown punkTTFilter);
}

// MS Video Control Closed Captioning Feature Interface 2
interface IMSVidClosedCaptioning2 : IMSVidClosedCaptioning {
  mixin(uuid("e00cb864-a029-4310-9987-a873f5887d97"));
  // static DWINGUID IID = { 0xe00cb864, 0xa029, 0x4310, 0x99, 0x87, 0xa8, 0x73, 0xf5, 0x88, 0x7d, 0x97 };
  /*[id(0x000000BA)]*/ int get_Service(out MSVidCCService On);
  /*[id(0x000000BA)]*/ int set_Service(MSVidCCService On);
}

// MS Video Control Closed Captioning Feature Interface
interface IMSVidClosedCaptioning : IMSVidFeature {
  mixin(uuid("99652ea1-c1f7-414f-bb7b-1c967de75983"));
  // static DWINGUID IID = { 0x99652ea1, 0xc1f7, 0x414f, 0xbb, 0x7b, 0x1c, 0x96, 0x7d, 0xe7, 0x59, 0x83 };
  /*[id(0x00000026)]*/ int get_Enable(out short On);
  /*[id(0x00000026)]*/ int set_Enable(short On);
}

// MS Video Control Interface
interface IMSVidCtl : IDispatch {
  mixin(uuid("b0edf162-910a-11d2-b632-00c04f79498e"));
  // static DWINGUID IID = { 0xb0edf162, 0x910a, 0x11d2, 0xb6, 0x32, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  /*[id(0xFFFFFE0C)]*/ int get_AutoSize(out short pbool);
  /*[id(0xFFFFFE0C)]*/ int set_AutoSize(short pbool);
  /*[id(0xFFFFFE0B)]*/ int get_BackColor(out OLE_COLOR BackColor);
  /*[id(0xFFFFFE0B)]*/ int set_BackColor(OLE_COLOR BackColor);
  /*[id(0xFFFFFDFE)]*/ int get_Enabled(out short pbool);
  /*[id(0xFFFFFDFE)]*/ int set_Enabled(short pbool);
  /*[id(0xFFFFFDFC)]*/ int get_TabStop(out short pbool);
  /*[id(0xFFFFFDFC)]*/ int set_TabStop(short pbool);
  /*[id(0xFFFFFDFD)]*/ int get_Window(out wireHWND phwnd);
  /*[id(0xFFFFFDDA)]*/ int Refresh();
  /*[id(0x00000012)]*/ int get_DisplaySize(out DisplaySizeList CurrentValue);
  /*[id(0x00000012)]*/ int set_DisplaySize(DisplaySizeList CurrentValue);
  /*[id(0x00000013)]*/ int get_MaintainAspectRatio(out short CurrentValue);
  /*[id(0x00000013)]*/ int set_MaintainAspectRatio(short CurrentValue);
  /*[id(0x00000014)]*/ int get_ColorKey(out OLE_COLOR CurrentValue);
  /*[id(0x00000014)]*/ int set_ColorKey(OLE_COLOR CurrentValue);
  // Available Input Devices
  /*[id(0x00000000)]*/ int get_InputsAvailable(wchar* CategoryGuid, out IMSVidInputDevices pVal);
  // Available Output Devices
  /*[id(0x00000001)]*/ int get_OutputsAvailable(wchar* CategoryGuid, out IMSVidOutputDevices pVal);
  // Available Input Devices
  /*[id(0x00000002)]*/ int get__InputsAvailable(ref DWINGUID CategoryGuid, out IMSVidInputDevices pVal);
  // Available Output Devices
  /*[id(0x00000003)]*/ int get__OutputsAvailable(ref DWINGUID CategoryGuid, out IMSVidOutputDevices pVal);
  // Available Video Renderers
  /*[id(0x00000004)]*/ int get_VideoRenderersAvailable(out IMSVidVideoRendererDevices pVal);
  // Available Audio Renderers
  /*[id(0x00000005)]*/ int get_AudioRenderersAvailable(out IMSVidAudioRendererDevices pVal);
  // Available Features
  /*[id(0x00000006)]*/ int get_FeaturesAvailable(out IMSVidFeatures pVal);
  // Currently Selected Input Device
  /*[id(0x00000007)]*/ int get_InputActive(out IMSVidInputDevice pVal);
  // Currently Selected Input Device
  /*[id(0x00000007)]*/ int set_InputActive(IMSVidInputDevice pVal);
  // Currently Selected Output Devices
  /*[id(0x00000008)]*/ int get_OutputsActive(out IMSVidOutputDevices pVal);
  // Currently Selected Output Devices
  /*[id(0x00000008)]*/ int set_OutputsActive(IMSVidOutputDevices pVal);
  // Currently Selected Video Renderer
  /*[id(0x00000009)]*/ int get_VideoRendererActive(out IMSVidVideoRenderer pVal);
  // Currently Selected Video Renderer
  /*[id(0x00000009)]*/ int set_VideoRendererActive(IMSVidVideoRenderer pVal);
  // Currently Selected Audio Renderer
  /*[id(0x0000000A)]*/ int get_AudioRendererActive(out IMSVidAudioRenderer pVal);
  // Currently Selected Audio Renderer
  /*[id(0x0000000A)]*/ int set_AudioRendererActive(IMSVidAudioRenderer pVal);
  // Currently Selected Features
  /*[id(0x0000000B)]*/ int get_FeaturesActive(out IMSVidFeatures pVal);
  // Currently Selected Features
  /*[id(0x0000000B)]*/ int set_FeaturesActive(IMSVidFeatures pVal);
  // Check the current MSVidCtl state.
  /*[id(0x00000016)]*/ int get_State(out MSVidCtlStateList lState);
  // Find an input device for viewing the specified item. This may be a string(VT_BSTR) or an object(VT_UNKNOWN).
  /*[id(0x0000000C)]*/ int View(DWINVARIANT* v);
  // Compose the graph
  /*[id(0x0000000D)]*/ int Build();
  // Stop the graph
  /*[id(0x0000000E)]*/ int Pause();
  // Compose the graph if necessary and start it running
  /*[id(0x0000000F)]*/ int Run();
  // Stop the graph
  /*[id(0x00000010)]*/ int Stop();
  // Disassemble the graph(Inverse of Build)
  /*[id(0x00000011)]*/ int Decompose();
  // set active video renderer to nothing
  /*[id(0x00000019)]*/ int DisableVideo();
  // set active Audio renderer to nothing
  /*[id(0x0000001A)]*/ int DisableAudio();
  // Find another input device for viewing the specified item. Works like View except skips current input
  /*[id(0x0000001B)]*/ int ViewNext(DWINVARIANT* v);
  // Set Service Provider
  /*[id(0x0000001C)]*/ int set_ServiceProvider(IUnknown value);
}

// MS Video Control Input Device Writable Collection Interface
interface IMSVidInputDevices : IDispatch {
  mixin(uuid("c5702cd1-9b79-11d3-b654-00c04f79498e"));
  // static DWINGUID IID = { 0xc5702cd1, 0x9b79, 0x11d3, 0xb6, 0x54, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  /*[id(0x00000010)]*/ int get_Count(out int lCount);
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IEnumVARIANT pD);
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT v, out IMSVidInputDevice pDB);
  /*[id(0xFFFFFDD7)]*/ int Add(IMSVidInputDevice pDB);
  /*[id(0xFFFFFDD5)]*/ int Remove(DWINVARIANT v);
}

// MS Video Control Output Device Writable Collection Interface
interface IMSVidOutputDevices : IDispatch {
  mixin(uuid("c5702cd2-9b79-11d3-b654-00c04f79498e"));
  // static DWINGUID IID = { 0xc5702cd2, 0x9b79, 0x11d3, 0xb6, 0x54, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  /*[id(0x00000010)]*/ int get_Count(out int lCount);
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IEnumVARIANT pD);
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT v, out IMSVidOutputDevice pDB);
  /*[id(0xFFFFFDD7)]*/ int Add(IMSVidOutputDevice pDB);
  /*[id(0xFFFFFDD5)]*/ int Remove(DWINVARIANT v);
}

// MS Video Control Video Renderer Device Writable Collection Interface
interface IMSVidVideoRendererDevices : IDispatch {
  mixin(uuid("c5702cd3-9b79-11d3-b654-00c04f79498e"));
  // static DWINGUID IID = { 0xc5702cd3, 0x9b79, 0x11d3, 0xb6, 0x54, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  /*[id(0x00000010)]*/ int get_Count(out int lCount);
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IEnumVARIANT pD);
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT v, out IMSVidVideoRenderer pDB);
  /*[id(0xFFFFFDD7)]*/ int Add(IMSVidVideoRenderer pDB);
  /*[id(0xFFFFFDD5)]*/ int Remove(DWINVARIANT v);
}

// MS Video Control Audio Renderer Device Writable Collection Interface
interface IMSVidAudioRendererDevices : IDispatch {
  mixin(uuid("c5702cd4-9b79-11d3-b654-00c04f79498e"));
  // static DWINGUID IID = { 0xc5702cd4, 0x9b79, 0x11d3, 0xb6, 0x54, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  /*[id(0x00000010)]*/ int get_Count(out int lCount);
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IEnumVARIANT pD);
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT v, out IMSVidAudioRenderer pDB);
  /*[id(0xFFFFFDD7)]*/ int Add(IMSVidAudioRenderer pDB);
  /*[id(0xFFFFFDD5)]*/ int Remove(DWINVARIANT v);
}

// MS Video Control Features Writable Collection Interface
interface IMSVidFeatures : IDispatch {
  mixin(uuid("c5702cd5-9b79-11d3-b654-00c04f79498e"));
  // static DWINGUID IID = { 0xc5702cd5, 0x9b79, 0x11d3, 0xb6, 0x54, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  /*[id(0x00000010)]*/ int get_Count(out int lCount);
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IEnumVARIANT pD);
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT v, out IMSVidFeature pDB);
  /*[id(0xFFFFFDD7)]*/ int Add(IMSVidFeature pDB);
  /*[id(0xFFFFFDD5)]*/ int Remove(DWINVARIANT v);
}

// DShow Graph Segment Composition Interface
interface IMSVidCompositionSegment : IMSVidGraphSegment {
  mixin(uuid("1c15d483-911d-11d2-b632-00c04f79498e"));
  // static DWINGUID IID = { 0x1c15d483, 0x911d, 0x11d2, 0xb6, 0x32, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  /*[id(0x60030000)]*/ int Compose(IMSVidGraphSegment upstream, IMSVidGraphSegment downstream);
  // The upstream segment being composed by this composition segment
  /*[id(0x60030001)]*/ int get_Up(out IMSVidGraphSegment upstream);
  // The downstream segment being composed by this composition segment
  /*[id(0x60030002)]*/ int get_Down(out IMSVidGraphSegment downstream);
}

// IMSEventBinder Interface
interface IMSEventBinder : IDispatch {
  mixin(uuid("c3a9f406-2222-436d-86d5-ba3229279efb"));
  // static DWINGUID IID = { 0xc3a9f406, 0x2222, 0x436d, 0x86, 0xd5, 0xba, 0x32, 0x29, 0x27, 0x9e, 0xfb };
  // method Bind
  /*[id(0x00000018)]*/ int Bind(IDispatch pEventObject, wchar* EventName, wchar* EventHandler, out int CancelID);
  // method Unbind
  /*[id(0x00000017)]*/ int Unbind(uint CancelCookie);
}

// CoClasses

// MS Video Control Analog TV Tuner Device Class
abstract class MSVidAnalogTunerDevice {
  mixin(uuid("1c15d484-911d-11d2-b632-00c04f79498e"));
  // static DWINGUID CLSID = { 0x1c15d484, 0x911d, 0x11d2, 0xb6, 0x32, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  mixin Interfaces!(IMSVidAnalogTuner2, IMSVidAnalogTuner, IMSVidGraphSegment);
}

// MS Video Control BDA Tuner Device Class
abstract class MSVidBDATunerDevice {
  mixin(uuid("a2e3074e-6c3d-11d3-b653-00c04f79498e"));
  // static DWINGUID CLSID = { 0xa2e3074e, 0x6c3d, 0x11d3, 0xb6, 0x53, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  mixin Interfaces!(IMSVidTuner, IMSVidGraphSegment);
}

// MS Video Control File Playback Device Class
abstract class MSVidFilePlaybackDevice {
  mixin(uuid("37b0353c-a4c8-11d2-b634-00c04f79498e"));
  // static DWINGUID CLSID = { 0x37b0353c, 0xa4c8, 0x11d2, 0xb6, 0x34, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  mixin Interfaces!(IMSVidFilePlayback, IMSVidGraphSegment);
}

// MSVidWebDVD Class
abstract class MSVidWebDVD {
  mixin(uuid("011b3619-fe63-4814-8a84-15a194ce9ce3"));
  // static DWINGUID CLSID = { 0x011b3619, 0xfe63, 0x4814, 0x8a, 0x84, 0x15, 0xa1, 0x94, 0xce, 0x9c, 0xe3 };
  mixin Interfaces!(IMSVidWebDVD, IMSVidGraphSegment);
}

// MSVidWebDVDAdm Class
abstract class MSVidWebDVDAdm {
  mixin(uuid("fa7c375b-66a7-4280-879d-fd459c84bb02"));
  // static DWINGUID CLSID = { 0xfa7c375b, 0x66a7, 0x4280, 0x87, 0x9d, 0xfd, 0x45, 0x9c, 0x84, 0xbb, 0x02 };
  mixin Interfaces!(IMSVidWebDVDAdm);
}

// MS Video Control Video Renderer Class
abstract class MSVidVideoRenderer {
  mixin(uuid("37b03543-a4c8-11d2-b634-00c04f79498e"));
  // static DWINGUID CLSID = { 0x37b03543, 0xa4c8, 0x11d2, 0xb6, 0x34, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  mixin Interfaces!(IMSVidVideoRenderer2, IMSVidVideoRenderer, IMSVidGraphSegment);
}

// MS Video Control Audio Renderer Class
abstract class MSVidAudioRenderer {
  mixin(uuid("37b03544-a4c8-11d2-b634-00c04f79498e"));
  // static DWINGUID CLSID = { 0x37b03544, 0xa4c8, 0x11d2, 0xb6, 0x34, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  mixin Interfaces!(IMSVidAudioRenderer, IMSVidGraphSegment);
}

// MS Video Control Stream Buffer Engine Sink Class
abstract class MSVidGenericSink {
  mixin(uuid("4a5869cf-929d-4040-ae03-fcafc5b9cd42"));
  // static DWINGUID CLSID = { 0x4a5869cf, 0x929d, 0x4040, 0xae, 0x03, 0xfc, 0xaf, 0xc5, 0xb9, 0xcd, 0x42 };
  mixin Interfaces!(IMSVidGenericSink, IMSVidGraphSegment);
}

// MS Video Control Stream Buffer Engine Sink Class
abstract class MSVidStreamBufferSink {
  mixin(uuid("9e77aac4-35e5-42a1-bdc2-8f3ff399847c"));
  // static DWINGUID CLSID = { 0x9e77aac4, 0x35e5, 0x42a1, 0xbd, 0xc2, 0x8f, 0x3f, 0xf3, 0x99, 0x84, 0x7c };
  mixin Interfaces!(IMSVidStreamBufferSink2, IMSVidStreamBufferSink, IMSVidGraphSegment);
}

// MS Video Control Stream Buffer Engine Playback Device Class
abstract class MSVidStreamBufferSource {
  mixin(uuid("ad8e510d-217f-409b-8076-29c5e73b98e8"));
  // static DWINGUID CLSID = { 0xad8e510d, 0x217f, 0x409b, 0x80, 0x76, 0x29, 0xc5, 0xe7, 0x3b, 0x98, 0xe8 };
  mixin Interfaces!(IMSVidStreamBufferSource, IMSVidGraphSegment);
}

// MS Video Control Standard Data Services for Broadcast IP through NDIS stack
abstract class MSVidDataServices {
  mixin(uuid("334125c0-77e5-11d3-b653-00c04f79498e"));
  // static DWINGUID CLSID = { 0x334125c0, 0x77e5, 0x11d3, 0xb6, 0x53, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  mixin Interfaces!(IMSVidDataServices);
}

// MS Video Control Encoder
abstract class MSVidEncoder {
  mixin(uuid("bb530c63-d9df-4b49-9439-63453962e598"));
  // static DWINGUID CLSID = { 0xbb530c63, 0xd9df, 0x4b49, 0x94, 0x39, 0x63, 0x45, 0x39, 0x62, 0xe5, 0x98 };
  mixin Interfaces!(IMSVidEncoder);
}

// MS Video Control Encoder
abstract class MSVidXDS {
  mixin(uuid("0149eedf-d08f-4142-8d73-d23903d21e90"));
  // static DWINGUID CLSID = { 0x0149eedf, 0xd08f, 0x4142, 0x8d, 0x73, 0xd2, 0x39, 0x03, 0xd2, 0x1e, 0x90 };
  mixin Interfaces!(IMSVidXDS);
}

// MS Video Control Standard Closed Captioning
abstract class MSVidClosedCaptioning {
  mixin(uuid("7f9cb14d-48e4-43b6-9346-1aebc39c64d3"));
  // static DWINGUID CLSID = { 0x7f9cb14d, 0x48e4, 0x43b6, 0x93, 0x46, 0x1a, 0xeb, 0xc3, 0x9c, 0x64, 0xd3 };
  mixin Interfaces!(IMSVidClosedCaptioning3, IMSVidClosedCaptioning2, IMSVidClosedCaptioning);
}

// MS Video Control Class
abstract class MSVidCtl {
  mixin(uuid("b0edf163-910a-11d2-b632-00c04f79498e"));
  // static DWINGUID CLSID = { 0xb0edf163, 0x910a, 0x11d2, 0xb6, 0x32, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  mixin Interfaces!(IMSVidCtl, IMSVidGraphSegmentContainer);
}

// MS Video Control Input Device Collection Class
abstract class MSVidInputDevices {
  mixin(uuid("c5702ccc-9b79-11d3-b654-00c04f79498e"));
  // static DWINGUID CLSID = { 0xc5702ccc, 0x9b79, 0x11d3, 0xb6, 0x54, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  mixin Interfaces!(IMSVidInputDevices);
}

// MS Video Control Output Device Collection Class
abstract class MSVidOutputDevices {
  mixin(uuid("c5702ccd-9b79-11d3-b654-00c04f79498e"));
  // static DWINGUID CLSID = { 0xc5702ccd, 0x9b79, 0x11d3, 0xb6, 0x54, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  mixin Interfaces!(IMSVidOutputDevices);
}

// MS Video Control Video Renderer Device Collection Class
abstract class MSVidVideoRendererDevices {
  mixin(uuid("c5702cce-9b79-11d3-b654-00c04f79498e"));
  // static DWINGUID CLSID = { 0xc5702cce, 0x9b79, 0x11d3, 0xb6, 0x54, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  mixin Interfaces!(IMSVidVideoRendererDevices);
}

// MS Video Control Audio Renderer Device Collection Class
abstract class MSVidAudioRendererDevices {
  mixin(uuid("c5702ccf-9b79-11d3-b654-00c04f79498e"));
  // static DWINGUID CLSID = { 0xc5702ccf, 0x9b79, 0x11d3, 0xb6, 0x54, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  mixin Interfaces!(IMSVidAudioRendererDevices);
}

// MS Video Control Feature Collection Class
abstract class MSVidFeatures {
  mixin(uuid("c5702cd0-9b79-11d3-b654-00c04f79498e"));
  // static DWINGUID CLSID = { 0xc5702cd0, 0x9b79, 0x11d3, 0xb6, 0x54, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  mixin Interfaces!(IMSVidFeatures);
}

// MS Video Control Generic Composition Class
abstract class MSVidGenericComposite {
  mixin(uuid("2764bce5-cc39-11d2-b639-00c04f79498e"));
  // static DWINGUID CLSID = { 0x2764bce5, 0xcc39, 0x11d2, 0xb6, 0x39, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  mixin Interfaces!(IMSVidCompositionSegment);
}

// MS Video Control Custom Composition for Analog Capture to Overlay Mixer
abstract class MSVidAnalogCaptureToOverlayMixer {
  mixin(uuid("e18af75a-08af-11d3-b64a-00c04f79498e"));
  // static DWINGUID CLSID = { 0xe18af75a, 0x08af, 0x11d3, 0xb6, 0x4a, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  mixin Interfaces!(IMSVidCompositionSegment);
}

// MS Video Control Custom Composition for Analog Capture to Data Services
abstract class MSVidAnalogCaptureToDataServices {
  mixin(uuid("c5702cd6-9b79-11d3-b654-00c04f79498e"));
  // static DWINGUID CLSID = { 0xc5702cd6, 0x9b79, 0x11d3, 0xb6, 0x54, 0x00, 0xc0, 0x4f, 0x79, 0x49, 0x8e };
  mixin Interfaces!(IMSVidCompositionSegment);
}

// MS Video Control Custom Composition for WebDVD to Overlay Mixer
abstract class MSVidWebDVDToVideoRenderer {
  mixin(uuid("267db0b3-55e3-4902-949b-df8f5cec0191"));
  // static DWINGUID CLSID = { 0x267db0b3, 0x55e3, 0x4902, 0x94, 0x9b, 0xdf, 0x8f, 0x5c, 0xec, 0x01, 0x91 };
  mixin Interfaces!(IMSVidCompositionSegment);
}

// MS Video Control Custom Composition for WebDVD to Audio Renderer
abstract class MSVidWebDVDToAudioRenderer {
  mixin(uuid("8d04238e-9fd1-41c6-8de3-9e1ee309e935"));
  // static DWINGUID CLSID = { 0x8d04238e, 0x9fd1, 0x41c6, 0x8d, 0xe3, 0x9e, 0x1e, 0xe3, 0x09, 0xe9, 0x35 };
  mixin Interfaces!(IMSVidCompositionSegment);
}

// MS Video Control Custom Composition for Mpeg2 Decoder to Closed Captioning
abstract class MSVidMPEG2DecoderToClosedCaptioning {
  mixin(uuid("6ad28ee1-5002-4e71-aaf7-bd077907b1a4"));
  // static DWINGUID CLSID = { 0x6ad28ee1, 0x5002, 0x4e71, 0xaa, 0xf7, 0xbd, 0x07, 0x79, 0x07, 0xb1, 0xa4 };
  mixin Interfaces!(IMSVidCompositionSegment);
}

// MS Video Control Custom Composition for Analog Capture to Stream Buffer Sink
abstract class MSVidAnalogCaptureToStreamBufferSink {
  mixin(uuid("9f50e8b1-9530-4ddc-825e-1af81d47aed6"));
  // static DWINGUID CLSID = { 0x9f50e8b1, 0x9530, 0x4ddc, 0x82, 0x5e, 0x1a, 0xf8, 0x1d, 0x47, 0xae, 0xd6 };
  mixin Interfaces!(IMSVidCompositionSegment);
}

// MS Video Control Custom Composition for Digital Capture to Stream Buffer Sink
abstract class MSVidDigitalCaptureToStreamBufferSink {
  mixin(uuid("abe40035-27c3-4a2f-8153-6624471608af"));
  // static DWINGUID CLSID = { 0xabe40035, 0x27c3, 0x4a2f, 0x81, 0x53, 0x66, 0x24, 0x47, 0x16, 0x08, 0xaf };
  mixin Interfaces!(IMSVidCompositionSegment);
}

// MS Video Control Custom Composition for Data Services to Stream Buffer Sink
abstract class MSVidDataServicesToStreamBufferSink {
  mixin(uuid("38f03426-e83b-4e68-b65b-dcae73304838"));
  // static DWINGUID CLSID = { 0x38f03426, 0xe83b, 0x4e68, 0xb6, 0x5b, 0xdc, 0xae, 0x73, 0x30, 0x48, 0x38 };
  mixin Interfaces!(IMSVidCompositionSegment);
}

// MS Video Control Custom Composition for DataServices To XDS
abstract class MSVidDataServicesToXDS {
  mixin(uuid("0429ec6e-1144-4bed-b88b-2fb9899a4a3d"));
  // static DWINGUID CLSID = { 0x0429ec6e, 0x1144, 0x4bed, 0xb8, 0x8b, 0x2f, 0xb9, 0x89, 0x9a, 0x4a, 0x3d };
  mixin Interfaces!(IMSVidCompositionSegment);
}

// MS Video Control Custom Composition for Encoder to Stream Buffer Sink
abstract class MSVidEncoderToStreamBufferSink {
  mixin(uuid("a0b9b497-afbc-45ad-a8a6-9b077c40d4f2"));
  // static DWINGUID CLSID = { 0xa0b9b497, 0xafbc, 0x45ad, 0xa8, 0xa6, 0x9b, 0x07, 0x7c, 0x40, 0xd4, 0xf2 };
  mixin Interfaces!(IMSVidCompositionSegment);
}

// MS Video Control Custom Composition for File Playback to Video Renderer
abstract class MSVidFilePlaybackToVideoRenderer {
  mixin(uuid("b401c5eb-8457-427f-84ea-a4d2363364b0"));
  // static DWINGUID CLSID = { 0xb401c5eb, 0x8457, 0x427f, 0x84, 0xea, 0xa4, 0xd2, 0x36, 0x33, 0x64, 0xb0 };
  mixin Interfaces!(IMSVidCompositionSegment);
}

// MS Video Control Custom Composition for File Playback to Audio Renderer
abstract class MSVidFilePlaybackToAudioRenderer {
  mixin(uuid("cc23f537-18d4-4ece-93bd-207a84726979"));
  // static DWINGUID CLSID = { 0xcc23f537, 0x18d4, 0x4ece, 0x93, 0xbd, 0x20, 0x7a, 0x84, 0x72, 0x69, 0x79 };
  mixin Interfaces!(IMSVidCompositionSegment);
}

// MS Video Control Custom Composition for TV Tuner to Encoder
abstract class MSVidAnalogTVToEncoder {
  mixin(uuid("28953661-0231-41db-8986-21ff4388ee9b"));
  // static DWINGUID CLSID = { 0x28953661, 0x0231, 0x41db, 0x89, 0x86, 0x21, 0xff, 0x43, 0x88, 0xee, 0x9b };
  mixin Interfaces!(IMSVidCompositionSegment);
}

// MS Video Control Custom Composition for SBE Source to Video renderer
abstract class MSVidStreamBufferSourceToVideoRenderer {
  mixin(uuid("3c4708dc-b181-46a8-8da8-4ab0371758cd"));
  // static DWINGUID CLSID = { 0x3c4708dc, 0xb181, 0x46a8, 0x8d, 0xa8, 0x4a, 0xb0, 0x37, 0x17, 0x58, 0xcd };
  mixin Interfaces!(IMSVidCompositionSegment);
}

// MS Video Control Custom Composition for TV Tuner to XDS
abstract class MSVidAnalogCaptureToXDS {
  mixin(uuid("3540d440-5b1d-49cb-821a-e84b8cf065a7"));
  // static DWINGUID CLSID = { 0x3540d440, 0x5b1d, 0x49cb, 0x82, 0x1a, 0xe8, 0x4b, 0x8c, 0xf0, 0x65, 0xa7 };
  mixin Interfaces!(IMSVidCompositionSegment);
}

// MS Video Control Custom Composition for Stream Buffer Source to CC
abstract class MSVidSBESourceToCC {
  mixin(uuid("9193a8f9-0cba-400e-aa97-eb4709164576"));
  // static DWINGUID CLSID = { 0x9193a8f9, 0x0cba, 0x400e, 0xaa, 0x97, 0xeb, 0x47, 0x09, 0x16, 0x45, 0x76 };
  mixin Interfaces!(IMSVidCompositionSegment);
}

// MSEventBinder Class
abstract class MSEventBinder {
  mixin(uuid("577faa18-4518-445e-8f70-1473f8cf4ba4"));
  // static DWINGUID CLSID = { 0x577faa18, 0x4518, 0x445e, 0x8f, 0x70, 0x14, 0x73, 0xf8, 0xcf, 0x4b, 0xa4 };
  mixin Interfaces!(IMSEventBinder);
}

// MSVidStreamBufferRecordingControl
abstract class MSVidStreamBufferRecordingControl {
  mixin(uuid("caafdd83-cefc-4e3d-ba03-175f17a24f91"));
  // static DWINGUID CLSID = { 0xcaafdd83, 0xcefc, 0x4e3d, 0xba, 0x03, 0x17, 0x5f, 0x17, 0xa2, 0x4f, 0x91 };
  mixin Interfaces!(IMSVidStreamBufferRecordingControl);
}

// Automation compliant scalable rectangle Class
abstract class MSVidRect {
  mixin(uuid("cb4276e6-7d5f-4cf1-9727-629c5e6db6ae"));
  // static DWINGUID CLSID = { 0xcb4276e6, 0x7d5f, 0x4cf1, 0x97, 0x27, 0x62, 0x9c, 0x5e, 0x6d, 0xb6, 0xae };
  mixin Interfaces!(IMSVidRect);
}

// dummy class to expose base interface to VB
abstract class MSVidDevice {
  mixin(uuid("6e40476f-9c49-4c3e-8bb9-8587958eff74"));
  // static DWINGUID CLSID = { 0x6e40476f, 0x9c49, 0x4c3e, 0x8b, 0xb9, 0x85, 0x87, 0x95, 0x8e, 0xff, 0x74 };
  mixin Interfaces!(IMSVidDevice);
}

// dummy class to expose base interface to VB
abstract class MSVidInputDevice {
  mixin(uuid("ac1972f2-138a-4ca3-90da-ae51112eda28"));
  // static DWINGUID CLSID = { 0xac1972f2, 0x138a, 0x4ca3, 0x90, 0xda, 0xae, 0x51, 0x11, 0x2e, 0xda, 0x28 };
  mixin Interfaces!(IMSVidInputDevice);
}

// dummy class to expose base interface to VB
abstract class MSVidVideoInputDevice {
  mixin(uuid("95f4820b-bb3a-4e2d-bc64-5b817bc2c30e"));
  // static DWINGUID CLSID = { 0x95f4820b, 0xbb3a, 0x4e2d, 0xbc, 0x64, 0x5b, 0x81, 0x7b, 0xc2, 0xc3, 0x0e };
  mixin Interfaces!(IMSVidVideoInputDevice);
}

// dummy class to expose base interface to VB
abstract class MSVidVideoPlaybackDevice {
  mixin(uuid("1990d634-1a5e-4071-a34a-53aaffce9f36"));
  // static DWINGUID CLSID = { 0x1990d634, 0x1a5e, 0x4071, 0xa3, 0x4a, 0x53, 0xaa, 0xff, 0xce, 0x9f, 0x36 };
  mixin Interfaces!(IMSVidPlayback);
}

// dummy class to expose base interface to VB
abstract class MSVidFeature {
  mixin(uuid("7748530b-c08a-47ea-b24c-be8695ff405f"));
  // static DWINGUID CLSID = { 0x7748530b, 0xc08a, 0x47ea, 0xb2, 0x4c, 0xbe, 0x86, 0x95, 0xff, 0x40, 0x5f };
  mixin Interfaces!(IMSVidFeature);
}

// dummy class to expose base interface to VB
abstract class MSVidOutput {
  mixin(uuid("87eb890d-03ad-4e9d-9866-376e5ec572ed"));
  // static DWINGUID CLSID = { 0x87eb890d, 0x03ad, 0x4e9d, 0x98, 0x66, 0x37, 0x6e, 0x5e, 0xc5, 0x72, 0xed };
  mixin Interfaces!(IMSVidOutputDevice);
}
