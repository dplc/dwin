// Not Public.  Internal interface used by Windows Media Player.
// Version 1.0

/*[uuid("149e2513-f9f3-464d-88f2-a0715157f3d7")]*/
//module dwin.sys.win32.com.tlb.more.wmencoder;
module dwin.sys.win32.com.tlb.more.WMPEncEn;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

// Not Public.  Internal interface used by Windows Media Player.
enum WMENC_SOURCE_TYPE {
  WMENC_AUDIO = 0x00000001,
  WMENC_VIDEO = 0x00000002,
  WMENC_SCRIPT = 0x00000004,
  WMENC_FILETRANSFER = 0x00000008,
}

// Not Public.  Internal interface used by Windows Media Player.
enum WMENC_CROPPING_MODE {
  WMENC_CROPPING_ABSOLUTE = 0x00000000,
}

// Not Public.  Internal interface used by Windows Media Player.
enum WMENC_VIDEO_OPTIMIZATION {
  WMENC_VIDEO_STANDARD = 0x00000001,
  WMENC_VIDEO_DEINTERLACE = 0x00000002,
  WMENC_VIDEO_INVERSETELECINE = 0x00000003,
  WMENC_VIDEO_PROCESS_INTERLACED = 0x00000004,
  WMENC_VIDEO_TELECINE_AUTO = 0x00000010,
  WMENC_VIDEO_TELECINE_AA_TOP = 0x00000020,
  WMENC_VIDEO_TELECINE_BB_TOP = 0x00000030,
  WMENC_VIDEO_TELECINE_BC_TOP = 0x00000040,
  WMENC_VIDEO_TELECINE_CD_TOP = 0x00000050,
  WMENC_VIDEO_TELECINE_DD_TOP = 0x00000060,
  WMENC_VIDEO_TELECINE_AA_BOTTOM = 0x00000070,
  WMENC_VIDEO_TELECINE_BB_BOTTOM = 0x00000080,
  WMENC_VIDEO_TELECINE_BC_BOTTOM = 0x00000090,
  WMENC_VIDEO_TELECINE_CD_BOTTOM = 0x000000A0,
  WMENC_VIDEO_TELECINE_DD_BOTTOM = 0x000000B0,
  WMENC_VIDEO_FLIPPING_VERTICAL = 0x00000100,
  WMENC_VIDEO_INTERLACED_AUTO = 0x00001000,
  WMENC_VIDEO_INTERLACED_TOP_FIRST = 0x00002000,
  WMENC_VIDEO_INTERLACED_BOTTOM_FIRST = 0x00003000,
}

// Not Public.  Internal interface used by Windows Media Player.
enum WMENC_PIXELFORMAT_VIDEO {
  WMENC_PIXELFORMAT_AUTO = 0x00000001,
  WMENC_PIXELFORMAT_IYUV = 0x56555949,
  WMENC_PIXELFORMAT_I420 = 0x30323449,
  WMENC_PIXELFORMAT_YV12 = 0x32315659,
  WMENC_PIXELFORMAT_YUY2 = 0x32595559,
  WMENC_PIXELFORMAT_UYVY = 0x59565955,
  WMENC_PIXELFORMAT_YVYU = 0x55595659,
  WMENC_PIXELFORMAT_YVU9 = 0x39555659,
  WMENC_PIXELFORMAT_RGB24 = 0xE436EB7D,
  WMENC_PIXELFORMAT_RGB32 = 0xE436EB7E,
  WMENC_PIXELFORMAT_RGB555 = 0xE436EB7C,
  WMENC_PIXELFORMAT_RGB565 = 0xE436EB7B,
  WMENC_PIXELFORMAT_RGB8 = 0xE436EB7A,
  WMENC_PIXELFORMAT_RGB4 = 0xE436EB79,
  WMENC_PIXELFORMAT_RGB1 = 0xE436EB78,
}

// Not Public.  Internal interface used by Windows Media Player.
enum WMENC_BROADCAST_PROTOCOL {
  WMENC_PROTOCOL_HTTP = 0x00000001,
  WMENC_PROTOCOL_PUSH_DISTRIBUTION = 0x00000002,
}

// Not Public.  Internal interface used by Windows Media Player.
enum WMENC_ARCHIVE_TYPE {
  WMENC_ARCHIVE_LOCAL = 0x00000001,
}

// Not Public.  Internal interface used by Windows Media Player.
enum WMENC_ARCHIVE_OPERATION {
  WMENC_ARCHIVE_START = 0x00000001,
  WMENC_ARCHIVE_STOP = 0x00000002,
  WMENC_ARCHIVE_PAUSE = 0x00000003,
}

// Not Public.  Internal interface used by Windows Media Player.
enum WMENC_AUDIOLEVEL_UNITS {
  WMENC_AUDIOLEVEL_DB = 0x00000001,
  WMENC_AUDIOLEVEL_LINEAR = 0x00000002,
}

// Not Public.  Internal interface used by Windows Media Player.
enum WMENC_PLUGIN_TYPE {
  WMENC_PLUGIN_SOURCE = 0x00000001,
  WMENC_PLUGIN_TRANSFORM = 0x00000002,
  WMENC_PLUGIN_DEVICECONTROL = 0x00000003,
}

// Not Public.  Internal interface used by Windows Media Player.
enum WMENC_ENCODER_STATE {
  WMENC_ENCODER_STARTING = 0x00000001,
  WMENC_ENCODER_RUNNING = 0x00000002,
  WMENC_ENCODER_PAUSED = 0x00000003,
  WMENC_ENCODER_STOPPING = 0x00000004,
  WMENC_ENCODER_STOPPED = 0x00000005,
  WMENC_ENCODER_END_PREPROCESS = 0x00000006,
  WMENC_ENCODER_PAUSING = 0x00000007,
}

// Not Public.  Internal interface used by Windows Media Player.
enum WMENC_ARCHIVE_STATE {
  WMENC_ARCHIVE_RUNNING = 0x00000001,
  WMENC_ARCHIVE_PAUSED = 0x00000002,
  WMENC_ARCHIVE_STOPPED = 0x00000003,
}

// Not Public.  Internal interface used by Windows Media Player.
enum WMENC_INDEXER_STATE {
  WMENC_INDEXER_RUNNING = 0x00000001,
  WMENC_INDEXER_STOPPED = 0x00000002,
}

// Not Public.  Internal interface used by Windows Media Player.
enum WMENC_INDEXER_OPERATION {
  WMENC_INDEXER_STOP = 0x00000001,
}

// Not Public.  Internal interface used by Windows Media Player.
enum WMENC_VIDEOCOMPLEXITY {
  WMENC_DEFAULT_COMPLEXITY = 0xFFFFFFFF,
  WMENC_COMPLEXITY_LEVEL0 = 0x00000000,
  WMENC_COMPLEXITY_LEVEL20 = 0x00000014,
  WMENC_COMPLEXITY_LEVEL40 = 0x00000028,
  WMENC_COMPLEXITY_LEVEL50 = 0x00000032,
  WMENC_COMPLEXITY_LEVEL60 = 0x0000003C,
  WMENC_COMPLEXITY_LEVEL80 = 0x00000050,
  WMENC_COMPLEXITY_LEVEL100 = 0x00000064,
}

// Not Public.  Internal interface used by Windows Media Player.
enum WMENC_CONTENT_MODE {
  WMENC_AUDIOCONTENT_NO_MODE = 0x00000000,
  WMENC_AUDIOCONTENT_SPEECH_MODE = 0x00000001,
  WMENC_AUDIOCONTENT_MIXED_MODE = 0x00000002,
}

// Not Public.  Internal interface used by Windows Media Player.
enum WMENC_SOURCE_STATE {
  WMENC_SOURCE_START = 0x00000001,
  WMENC_SOURCE_STOP = 0x00000002,
  WMENC_SOURCE_PREPARE = 0x00000003,
  WMENC_SOURCE_UNPREPARE = 0x00000004,
  WMENC_START_FILETRANSFER = 0x00000005,
  WMENC_STOP_FILETRANSFER = 0x00000006,
}

// Not Public.  Internal interface used by Windows Media Player.
enum WMENC_DEVICECONTROL_STATE {
  WMENC_DEVICECONTROL_PLAYING = 0x00000001,
  WMENC_DEVICECONTROL_PAUSED = 0x00000002,
  WMENC_DEVICECONTROL_STOPPED = 0x00000003,
  WMENC_DEVICECONTROL_FASTFORWARDING = 0x00000004,
  WMENC_DEVICECONTROL_REWINDING = 0x00000005,
  WMENC_DEVICECONTROL_CUEING = 0x00000006,
  WMENC_DEVICECONTROL_PREROLLING = 0x00000007,
  WMENC_DEVICECONTROL_UNSTABLE = 0x00000009,
  WMENC_DEVICECONTROL_EJECT = 0x0000000A,
  WMENC_DEVICECONTROL_VAR_FORWARD = 0x0000000B,
  WMENC_DEVICECONTROL_VAR_REVERSE = 0x0000000C,
  WMENC_DEVICECONTROL_ENDOFTAPE = 0x0000000D,
}

// Not Public.  Internal interface used by Windows Media Player.
enum WMENC_BASICEDIT_STATE {
  WMENC_BASICEDIT_RUNNING = 0x00000001,
  WMENC_BASICEDIT_STOPPED = 0x00000002,
}

// Not Public.  Internal interface used by Windows Media Player.
enum WMENCAPP_PROP_CLASS {
  WMENCAPP_PROP_USER = 0x00000001,
}

// Not Public.  Internal interface used by Windows Media Player.
enum WMENC_MEDIA_FILTER {
  WMENC_FILTER_NONE = 0x00000000,
  WMENC_FILTER_A = 0x00000001,
  WMENC_FILTER_AV = 0x00000011,
  WMENC_FILTER_AS = 0x00000101,
  WMENC_FILTER_AVS = 0x00000111,
}

// Not Public.  Internal interface used by Windows Media Player.
enum WMENC_PROFILE_COMPATIBILITY {
  WMENC_ENCODER_V8 = 0x00000000,
  WMENC_ENCODER_V9 = 0x00000001,
}

// Not Public.  Internal interface used by Windows Media Player.
enum WMENC_PROFILE_VBR_MODE {
  WMENC_PVM_NONE = 0x00000001,
  WMENC_PVM_PEAK = 0x00000002,
  WMENC_PVM_UNCONSTRAINED = 0x00000003,
  WMENC_PVM_BITRATE_BASED = 0x00000004,
}

// Not Public.  Internal interface used by Windows Media Player.
enum WMENC_PROFILE_BROADCAST_MODE {
  WMENC_PFM_CUSTOM = 0x00000001,
  WMENC_PFM_NTSC = 0x00000002,
  WMENC_PFM_PAL = 0x00000003,
}

// Aliases

// Not Public.  Internal interface used by Windows Media Player.
alias long WMENC_LONGLONG;

// Interfaces

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncSource : IDispatch {
  mixin(uuid("3458385a-ce80-4a3b-be5a-6374c204e3fa"));
  // static DWINGUID IID = { 0x3458385a, 0xce80, 0x4a3b, 0xbe, 0x5a, 0x63, 0x74, 0xc2, 0x04, 0xe3, 0xfa };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000096)]*/ int get_Type(out WMENC_SOURCE_TYPE enumType);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000097)]*/ int SetInput(wchar* bstrInput, wchar* bstrScheme, wchar* bstrStreamName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000098)]*/ int GetInput(out wchar* bstrStreamName, out wchar* bstrScheme, out wchar* pbstrInput);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000099)]*/ int set_Repeat(short pbRepeat);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000099)]*/ int get_Repeat(out short pbRepeat);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000009A)]*/ int get_MarkIn(out int plMarkIn);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000009A)]*/ int set_MarkIn(int plMarkIn);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000009B)]*/ int get_MarkOut(out int plMarkOut);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000009B)]*/ int set_MarkOut(int plMarkOut);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000009C)]*/ int get_TransformCollection(out IWMEncTransformCollection ppTransformCollection);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000A0)]*/ int GetTransformPluginCount(out uint pdwCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000A1)]*/ int GetTransformPlugin(uint dwIndex, out IUnknown ppUnkTransformPlugin);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000009D)]*/ int get_PreviewCollection(out IWMEncDataViewCollection ppDataViewCollection);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000009E)]*/ int get_PostviewCollection(out IWMEncDataViewCollection ppDataViewCollection);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000009F)]*/ int GetSourcePlugin(out IUnknown ppUnkPlugin);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncTransformCollection : IDispatch {
  mixin(uuid("27b06fe5-86d2-4a9d-97cb-772299819f29"));
  // static DWINGUID IID = { 0x27b06fe5, 0x86d2, 0x4a9d, 0x97, 0xcb, 0x77, 0x22, 0x99, 0x81, 0x9f, 0x29 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000009)]*/ int get_length(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000000A)]*/ int get_Count(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown pIUnknown);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000000)]*/ int Item(int lIndex, out IWMEncTransform ppTransform);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000017C)]*/ int Add(out IWMEncTransform ppTransform);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000017D)]*/ int Remove(int lIndex);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000017E)]*/ int RemoveAll();
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000017F)]*/ int Move(int lMove, int lInFrontOf);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncTransform : IDispatch {
  mixin(uuid("717c9416-06c3-449a-b030-9947146c2142"));
  // static DWINGUID IID = { 0x717c9416, 0x06c3, 0x449a, 0xb0, 0x30, 0x99, 0x47, 0x14, 0x6c, 0x21, 0x42 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000180)]*/ int SetInput(wchar* bstrInput, wchar* bstrScheme, wchar* bstrInitData);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000181)]*/ int GetInput(out wchar* pbstrScheme, out wchar* pbstrInitData, out wchar* pbstrInput);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000182)]*/ int GetTransformPlugin(out IUnknown ppUnkPlugin);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncDataViewCollection : IDispatch {
  mixin(uuid("0b18559a-1d1b-486f-a178-d3a0dc814b9e"));
  // static DWINGUID IID = { 0x0b18559a, 0x1d1b, 0x486f, 0xa1, 0x78, 0xd3, 0xa0, 0xdc, 0x81, 0x4b, 0x9e };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000009)]*/ int get_length(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000000A)]*/ int get_Count(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000000)]*/ int Item(int Index, out IUnknown ppDataView, out int plStreamCookie);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000AA)]*/ int Add(IUnknown pDataView, out int plStreamCookie);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000AB)]*/ int Remove(int lStreamCookie);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000AC)]*/ int RemoveAll();
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncVideoSource : IWMEncSource {
  mixin(uuid("ddb5a2a4-af08-4942-90f3-d46c36db7731"));
  // static DWINGUID IID = { 0xddb5a2a4, 0xaf08, 0x4942, 0x90, 0xf3, 0xd4, 0x6c, 0x36, 0xdb, 0x77, 0x31 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000A4)]*/ int get_CroppingMode(out WMENC_CROPPING_MODE penumCroppingMode);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000A4)]*/ int set_CroppingMode(WMENC_CROPPING_MODE penumCroppingMode);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000A5)]*/ int get_CroppingLeftMargin(out int plLeft);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000A5)]*/ int set_CroppingLeftMargin(int plLeft);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000A6)]*/ int get_CroppingTopMargin(out int plTop);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000A6)]*/ int set_CroppingTopMargin(int plTop);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000A7)]*/ int get_CroppingRightMargin(out int plRight);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000A7)]*/ int set_CroppingRightMargin(int plRight);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000A8)]*/ int get_CroppingBottomMargin(out int plBottom);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000A8)]*/ int set_CroppingBottomMargin(int plBottom);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000A9)]*/ int get_Optimization(out WMENC_VIDEO_OPTIMIZATION penumOptimization);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000A9)]*/ int set_Optimization(WMENC_VIDEO_OPTIMIZATION penumOptimization);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000A3)]*/ int get_PixelFormat(out WMENC_PIXELFORMAT_VIDEO penumPixelFormat);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000A3)]*/ int set_PixelFormat(WMENC_PIXELFORMAT_VIDEO penumPixelFormat);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncNetConnectionStats : IDispatch {
  mixin(uuid("26a40bf9-f833-494f-a69c-b954c0bb7e63"));
  // static DWINGUID IID = { 0x26a40bf9, 0xf833, 0x494f, 0xa6, 0x9c, 0xb9, 0x54, 0xc0, 0xbb, 0x7e, 0x63 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004EC)]*/ int get_ClientCount(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004ED)]*/ int get_ClientInfo(int lIndex, out WMENC_BROADCAST_PROTOCOL pProtocol, out wchar* pbstrIP);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncOutputStats : IDispatch {
  mixin(uuid("9080ad4e-d4d6-4b85-a4cd-d918949ac7d9"));
  // static DWINGUID IID = { 0x9080ad4e, 0xd4d6, 0x4b85, 0xa4, 0xcd, 0xd9, 0x18, 0x94, 0x9a, 0xc7, 0xd9 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004F6)]*/ int get_SampleCount(out WMENC_LONGLONG pqwSampleCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004F7)]*/ int get_ByteCount(out WMENC_LONGLONG pqwByteCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004F8)]*/ int get_DroppedSampleCount(out WMENC_LONGLONG pqwDroppedSampleCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004F9)]*/ int get_DroppedByteCount(out WMENC_LONGLONG pqwDroppedByteCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004FA)]*/ int get_CurrentBitrate(out int plCurrentBitrate);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004FB)]*/ int get_AverageBitrate(out int plAverageBitrate);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004FC)]*/ int get_ExpectedBitrate(out int plExpectedBitrate);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004FD)]*/ int get_CurrentSampleRate(out int plCurrentSampleRate);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004FE)]*/ int get_AverageSampleRate(out int plAverageSampleRate);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004FF)]*/ int get_ExpectedSampleRate(out int plExpectedSampleRate);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncFileArchiveStats : IDispatch {
  mixin(uuid("7818f8ef-1c2a-4f73-b9f6-2f351c58527e"));
  // static DWINGUID IID = { 0x7818f8ef, 0x1c2a, 0x4f73, 0xb9, 0xf6, 0x2f, 0x35, 0x1c, 0x58, 0x52, 0x7e };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000500)]*/ int get_FileSize(out WMENC_LONGLONG pqwOutputFileSize);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000501)]*/ int get_FileDuration(out WMENC_LONGLONG pqwOutputFileDuration);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncIndexerStats : IDispatch {
  mixin(uuid("73647341-60cc-4d0a-b6f0-04d5ba7bba52"));
  // static DWINGUID IID = { 0x73647341, 0x60cc, 0x4d0a, 0xb6, 0xf0, 0x04, 0xd5, 0xba, 0x7b, 0xba, 0x52 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000050A)]*/ int get_FileCount(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000050B)]*/ int get_FileName(int lIndex, out wchar* pbstrFileName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000050C)]*/ int get_PercentComplete(out int plPercent);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncPostViewCollection : IWMEncDataViewCollection {
  mixin(uuid("d110dabc-b68f-47cf-b045-47b2ebd7b396"));
  // static DWINGUID IID = { 0xd110dabc, 0xb68f, 0x47cf, 0xb0, 0x45, 0x47, 0xb2, 0xeb, 0xd7, 0xb3, 0x96 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000AD)]*/ int get_ViewBandwidth(out int plBandwidth);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000AD)]*/ int set_ViewBandwidth(int plBandwidth);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncBroadcast : IDispatch {
  mixin(uuid("3ec0a43f-5241-4960-9d6b-7400c9240ad8"));
  // static DWINGUID IID = { 0x3ec0a43f, 0x5241, 0x4960, 0x9d, 0x6b, 0x74, 0x00, 0xc9, 0x24, 0x0a, 0xd8 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004B0)]*/ int get_PortNumber(WMENC_BROADCAST_PROTOCOL enumProtocol, out int piPort);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004B0)]*/ int set_PortNumber(WMENC_BROADCAST_PROTOCOL enumProtocol, int piPort);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncPushDistribution : IWMEncBroadcast {
  mixin(uuid("2ecaae47-de28-4b25-b5ed-da468cc6b058"));
  // static DWINGUID IID = { 0x2ecaae47, 0xde28, 0x4b25, 0xb5, 0xed, 0xda, 0x46, 0x8c, 0xc6, 0xb0, 0x58 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004BA)]*/ int get_ServerName(out wchar* pbstrServerName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004BA)]*/ int set_ServerName(wchar* pbstrServerName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004BB)]*/ int get_PublishingPoint(out wchar* pbstrPublishingPoint);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004BB)]*/ int set_PublishingPoint(wchar* pbstrPublishingPoint);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004BC)]*/ int get_Template(out wchar* pbstrTemplate);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004BC)]*/ int set_Template(wchar* pbstrTemplate);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004BD)]*/ int get_AutoRemovePublishingPoint(out short pbAutoRemove);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004BD)]*/ int set_AutoRemovePublishingPoint(short pbAutoRemove);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004BE)]*/ int GenerateMulticastInfoFile(wchar* bstrNSCFileName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004BF)]*/ int GenerateAnnouncementFile(wchar* bstrNSCURL, wchar* bstrASXFileName);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncoder : IDispatch {
  mixin(uuid("fb329611-55a5-40cb-b0eb-de087430c40a"));
  // static DWINGUID IID = { 0xfb329611, 0x55a5, 0x40cb, 0xb0, 0xeb, 0xde, 0x08, 0x74, 0x30, 0xc4, 0x0a };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000468)]*/ int SetLocaleID(int lLocaleID);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000044D)]*/ int Load(wchar* bstrFileName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000044E)]*/ int Save(wchar* bstrFileName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000044F)]*/ int Start();
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000450)]*/ int Stop();
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000469)]*/ int get_AutoStop(out short pbStop);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000469)]*/ int set_AutoStop(short pbStop);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000461)]*/ int Pause();
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000463)]*/ int PrepareToEncode(short bPrepare);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000465)]*/ int Reset();
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000451)]*/ int Archive(WMENC_ARCHIVE_TYPE enumArchiveType, WMENC_ARCHIVE_OPERATION enumArchiveOp);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000452)]*/ int SendScript(short iIndex, wchar* bstrType, wchar* bstrData);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000453)]*/ int get_EnableAutoArchive(out short pbEnableAutoArchive);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000453)]*/ int set_EnableAutoArchive(short pbEnableAutoArchive);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000454)]*/ int get_RecordingLevel(short iIndex, out int lLevel);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000454)]*/ int set_RecordingLevel(short iIndex, int lLevel);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000455)]*/ int get_RecordingMute(short iIndex, out short pbRecordMute);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000455)]*/ int set_RecordingMute(short iIndex, short pbRecordMute);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000046E)]*/ int GetAudioLevel(WMENC_AUDIOLEVEL_UNITS units, short iIndex, ref int plDuration, out double pdLMin, out double pdLAvg, out double pdLMax, out double pdRMin, out double pdRAvg, out double pdRMax);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000456)]*/ int get_SourceGroupCollection(out IWMEncSourceGroupCollection ppSourceGroupCollection);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000466)]*/ int get_SourcePluginInfoManager(out IWMEncSourcePluginInfoManager ppSourcePluginInfoManager);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000467)]*/ int get_TransformPluginInfoManager(out IWMEncTransformPluginInfoManager ppTransformPluginInfoManager);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000459)]*/ int get_DisplayInfo(out IWMEncDisplayInfo ppDisplayInfo);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000045A)]*/ int get_Attributes(out IWMEncAttributes ppAttributes);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000045B)]*/ int get_Broadcast(out IWMEncBroadcast ppBroadcast);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000045C)]*/ int get_File(out IWMEncFile ppFile);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000462)]*/ int get_Statistics(out IWMEncStatistics ppStatistics);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000464)]*/ int get_ProfileCollection(out IWMEncProfileCollection ppProfileCollection);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000045E)]*/ int get_RunState(out WMENC_ENCODER_STATE penumState);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000045F)]*/ int get_ErrorState(out int plResult);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000460)]*/ int get_ArchiveState(WMENC_ARCHIVE_TYPE enumType, out WMENC_ARCHIVE_STATE penumArchiveState);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000046A)]*/ int get_Name(out wchar* pbstrName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000046A)]*/ int set_Name(wchar* pbstrName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000046B)]*/ int get_RemoteAdmin(out short pbRemoteAdmin);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000046B)]*/ int set_RemoteAdmin(short pbRemoteAdmin);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000046C)]*/ int GenerateBroadcastInfo(wchar* bstrFileName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000046D)]*/ int get_IndexerState(out WMENC_INDEXER_STATE penumIndexerState);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000046F)]*/ int get_AutoIndex(out short pbAutoIndex);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000046F)]*/ int set_AutoIndex(short pbAutoIndex);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000470)]*/ int Indexer(WMENC_INDEXER_OPERATION enumIndexerOp);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncSourceGroupCollection : IDispatch {
  mixin(uuid("0d3848ae-7633-4a8a-bf17-d91e3c3df36b"));
  // static DWINGUID IID = { 0x0d3848ae, 0x7633, 0x4a8a, 0xbf, 0x17, 0xd9, 0x1e, 0x3c, 0x3d, 0xf3, 0x6b };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000009)]*/ int get_length(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000000A)]*/ int get_Count(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown pIUnknown);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000000)]*/ int Item(DWINVARIANT var, out IWMEncSourceGroup ppSourceGroup);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000066)]*/ int Add(wchar* bstrName, out IWMEncSourceGroup ppSourceGroup);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000067)]*/ int Remove(DWINVARIANT var);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000064)]*/ int Move(IWMEncSourceGroup pSourceGroup, IWMEncSourceGroup pSourceGroupInfront);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000065)]*/ int get_Active(out IWMEncSourceGroup ppSourceGroup);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000065)]*/ int set_Active(IWMEncSourceGroup ppSourceGroup);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncSourceGroup : IDispatch {
  mixin(uuid("5edca4f2-1533-47b6-a090-3000ce270313"));
  // static DWINGUID IID = { 0x5edca4f2, 0x1533, 0x47b6, 0xa0, 0x90, 0x30, 0x00, 0xce, 0x27, 0x03, 0x13 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000006E)]*/ int get_Name(out wchar* pbstrName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000006E)]*/ int set_Name(wchar* pbstrName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000006F)]*/ int get_SourceCount(WMENC_SOURCE_TYPE enumType, out short iSourceCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000070)]*/ int get_Source(WMENC_SOURCE_TYPE enumType, short iIndex, out IWMEncSource ppSource);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000071)]*/ int AddSource(WMENC_SOURCE_TYPE enumType, out IWMEncSource ppSource);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000072)]*/ int RemoveSource(WMENC_SOURCE_TYPE enumType, DWINVARIANT var);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000074)]*/ int get_Profile(out IWMEncProfile ppProfile);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000074)]*/ int set_Profile(DWINVARIANT ppProfile);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000076)]*/ int get_AudienceCollection(out IDispatch ppAudienceCollection);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000077)]*/ int get_AutoArchive(WMENC_ARCHIVE_TYPE enumArchiveType, out WMENC_ARCHIVE_OPERATION penumArchiveOp);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000077)]*/ int set_AutoArchive(WMENC_ARCHIVE_TYPE enumArchiveType, WMENC_ARCHIVE_OPERATION penumArchiveOp);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000078)]*/ int AutoSetFileSource(wchar* bstrFileName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000079)]*/ int PrepareToEncode(short bPrepare);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000007A)]*/ int get_GroupTransformCollection(out IWMEncTransformCollection ppTransformCollection);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000007C)]*/ int GetGroupTransformPluginCount(out uint pdwCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000007D)]*/ int GetGroupTransformPlugin(uint dwIndex, out IUnknown ppUnkPlugin);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncProfile : IDispatch {
  mixin(uuid("e39eb002-1d73-46c7-8016-8db03cf2d7b7"));
  // static DWINGUID IID = { 0xe39eb002, 0x1d73, 0x46c7, 0x80, 0x16, 0x8d, 0xb0, 0x3c, 0xf2, 0xd7, 0xb7 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000015E)]*/ int get_Name(out wchar* bstrName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000015F)]*/ int get_Description(out wchar* bstrDescription);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000160)]*/ int get_MediaCount(WMENC_SOURCE_TYPE enumType, out short piCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000162)]*/ int get_MultipleBitrate(out short pbMBR);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000161)]*/ int get_AudienceCollection(out IDispatch ppAudienceCollection);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000163)]*/ int get_MaxPacketSize(out int plMaxPacketSize);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000163)]*/ int set_MaxPacketSize(int plMaxPacketSize);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncSourcePluginInfoManager : IDispatch {
  mixin(uuid("656ff2ae-50b5-47fa-a14f-ad0262d104b4"));
  // static DWINGUID IID = { 0x656ff2ae, 0x50b5, 0x47fa, 0xa1, 0x4f, 0xad, 0x02, 0x62, 0xd1, 0x04, 0xb4 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000009)]*/ int get_length(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000000A)]*/ int get_Count(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown pIUnknown);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000000)]*/ int Item(int iIndex, out IWMEncPluginInfo ppPluginInfo);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000002DB)]*/ int Refresh();
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncPluginInfo : IDispatch {
  mixin(uuid("04d7282a-7321-482b-997d-65684d805b16"));
  // static DWINGUID IID = { 0x04d7282a, 0x7321, 0x482b, 0x99, 0x7d, 0x65, 0x68, 0x4d, 0x80, 0x5b, 0x16 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000002BC)]*/ int get_SchemeType(out wchar* pbstrSchemeType);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000002BD)]*/ int get_CLSID(out wchar* pbstrCLSID);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000002BE)]*/ int get_Name(out wchar* pbstrName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000002BF)]*/ int get_MediaType(out WMENC_SOURCE_TYPE penumMediaType);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000002C0)]*/ int get_PluginType(out WMENC_PLUGIN_TYPE penumType);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000002C1)]*/ int get_Copyright(out wchar* pbstrCopyright);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000002C2)]*/ int get_InfoURL(out wchar* pbstrInfoURL);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000002C3)]*/ int get_Resources(out short pbResources);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000002C8)]*/ int get_Exclusive(out short pbExclusive);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000002C4)]*/ int get_PropertyPage(out short pbProppage);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000002CA)]*/ int get_TransformFlags(out short piFlags);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000002C9)]*/ int get_Hidden(out short pbHidden);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000000A)]*/ int get_Count(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000000)]*/ int Item(int lIndex, out wchar* pbstrResource);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncTransformPluginInfoManager : IDispatch {
  mixin(uuid("fea6ccff-ef5a-4177-9967-7f1998954b9a"));
  // static DWINGUID IID = { 0xfea6ccff, 0xef5a, 0x4177, 0x99, 0x67, 0x7f, 0x19, 0x98, 0x95, 0x4b, 0x9a };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000009)]*/ int get_length(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000000A)]*/ int get_Count(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown pIUnknown);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000000)]*/ int Item(int iIndex, out IWMEncPluginInfo ppPluginInfo);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000002DA)]*/ int Refresh();
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncDisplayInfo : IDispatch {
  mixin(uuid("f5d0de6a-e71a-48b3-8c7a-349441af20e2"));
  // static DWINGUID IID = { 0xf5d0de6a, 0xe71a, 0x48b3, 0x8c, 0x7a, 0x34, 0x94, 0x41, 0xaf, 0x20, 0xe2 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000001F4)]*/ int get_Title(out wchar* pbstrTitle);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000001F4)]*/ int set_Title(wchar* pbstrTitle);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000001F5)]*/ int get_Author(out wchar* pbstrAuthor);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000001F5)]*/ int set_Author(wchar* pbstrAuthor);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000001F6)]*/ int get_Copyright(out wchar* pbstrCopyright);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000001F6)]*/ int set_Copyright(wchar* pbstrCopyright);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000001F7)]*/ int get_Rating(out wchar* pbstrRating);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000001F7)]*/ int set_Rating(wchar* pbstrRating);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000001F8)]*/ int get_Description(out wchar* pbstrDesc);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000001F8)]*/ int set_Description(wchar* pbstrDesc);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncAttributes : IDispatch {
  mixin(uuid("2600bcce-c01b-4d57-a478-671ba800622b"));
  // static DWINGUID IID = { 0x2600bcce, 0xc01b, 0x4d57, 0xa4, 0x78, 0x67, 0x1b, 0xa8, 0x00, 0x62, 0x2b };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000000A)]*/ int get_Count(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000000)]*/ int Item(int Index, out wchar* pbstrName, out DWINVARIANT pVarValue);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000001FF)]*/ int Add(wchar* bstrName, DWINVARIANT varValue);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000200)]*/ int Remove(DWINVARIANT var);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000201)]*/ int RemoveAll();
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncFile : IDispatch {
  mixin(uuid("08b41711-6a27-45cd-a6b4-3e58c7229541"));
  // static DWINGUID IID = { 0x08b41711, 0x6a27, 0x45cd, 0xa6, 0xb4, 0x3e, 0x58, 0xc7, 0x22, 0x95, 0x41 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000258)]*/ int get_LocalFileName(out wchar* pbstrFileName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000258)]*/ int set_LocalFileName(wchar* pbstrFileName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000259)]*/ int get_RemoteFileName(out wchar* pbstrFileName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000259)]*/ int set_RemoteFileName(wchar* pbstrFileName);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncStatistics : IDispatch {
  mixin(uuid("236ec4a7-0694-47ee-a5df-cfce6f649ef0"));
  // static DWINGUID IID = { 0x236ec4a7, 0x0694, 0x47ee, 0xa5, 0xdf, 0xcf, 0xce, 0x6f, 0x64, 0x9e, 0xf0 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004E4)]*/ int get_EncodingTime(out WMENC_LONGLONG plTime);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004E2)]*/ int get_WMFOutputStats(out IDispatch ppStats);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004E3)]*/ int get_StreamOutputStats(WMENC_SOURCE_TYPE enumType, short iMediaIndex, short iStreamIndex, out IDispatch pStats);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004E5)]*/ int get_NetConnectionStats(out IDispatch ppDispNetConnectionStats);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004E6)]*/ int get_FileArchiveStats(out IDispatch ppFileArchiveStats);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004E7)]*/ int get_StreamOutputCount(WMENC_SOURCE_TYPE enumType, short iMediaIndex, out short pStreamOutputCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004E8)]*/ int get_IndexerStats(out IDispatch ppIndexerStats);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncProfileCollection : IDispatch {
  mixin(uuid("e8ac8522-9108-4de1-9cfd-3d169380ad66"));
  // static DWINGUID IID = { 0xe8ac8522, 0x9108, 0x4de1, 0x9c, 0xfd, 0x3d, 0x16, 0x93, 0x80, 0xad, 0x66 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000009)]*/ int get_length(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000000A)]*/ int get_Count(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000000D)]*/ int get_ProfileDirectory(out wchar* bstrDirectory);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000000D)]*/ int set_ProfileDirectory(wchar* bstrDirectory);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown pIUnknown);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000000)]*/ int Item(int Index, out IWMEncProfile ppProfile);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000014A)]*/ int Refresh();
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncoder2 : IWMEncoder {
  mixin(uuid("f44cf135-76fd-482a-93ea-a2f186fc26e8"));
  // static DWINGUID IID = { 0xf44cf135, 0x76fd, 0x482a, 0x93, 0xea, 0xa2, 0xf1, 0x86, 0xfc, 0x26, 0xe8 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000472)]*/ int get_DeviceControlPluginInfoManager(out IWMEncDeviceControlPluginInfoManager ppDeviceControlPluginInfoManager);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000473)]*/ int get_ContentAnalyzer(out IWMEncContentAnalyzer ppContentAnalyzer);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000474)]*/ int InsertCleanpoint();
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000478)]*/ int get_SynchronizeOperation(out short pbSyncOp);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000478)]*/ int set_SynchronizeOperation(short pbSyncOp);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000471)]*/ int get_EncoderDRMContentAuthor(out IWMDRMContentAuthor ppEncoderDRMAuthor);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000475)]*/ int get_WatermarkCollection(WMENC_SOURCE_TYPE enumSourceType, out IWMEncWatermarkCollection ppWatermarks);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000476)]*/ int GetWatermark(WMENC_SOURCE_TYPE enumSourceType, short iIndex, out DWINVARIANT pvarConfigFile, out DWINVARIANT pvarCLSID, out wchar* pbstrWatermarkName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000477)]*/ int SetWatermark(WMENC_SOURCE_TYPE enumSourceType, short iIndex, wchar* bstrWaterMarkName, wchar* bstrCLSID, wchar* bstrConfigFile);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000479)]*/ int Flush();
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000047A)]*/ int get_EnableTimecode(out short pfTimecode);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000047A)]*/ int set_EnableTimecode(short pfTimecode);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000047B)]*/ int get_PreserveSourceTimecode(out short pfSourceTimecode);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000047B)]*/ int set_PreserveSourceTimecode(short pfSourceTimecode);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000047C)]*/ int get_StartingTimecode(out int plTimecode);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000047C)]*/ int set_StartingTimecode(int plTimecode);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000047E)]*/ int get_TimecodeFrameRate(out int plFrameRate);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000047E)]*/ int set_TimecodeFrameRate(int plFrameRate);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000047D)]*/ int get_VideoComplexity(out WMENC_VIDEOCOMPLEXITY penumVideoComplexity);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000047D)]*/ int set_VideoComplexity(WMENC_VIDEOCOMPLEXITY penumVideoComplexity);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncDeviceControlPluginInfoManager : IDispatch {
  mixin(uuid("79278b82-499c-47ca-ae05-7620444cb4a4"));
  // static DWINGUID IID = { 0x79278b82, 0x499c, 0x47ca, 0xae, 0x05, 0x76, 0x20, 0x44, 0x4c, 0xb4, 0xa4 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000009)]*/ int get_length(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000000A)]*/ int get_Count(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown pIUnknown);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000000)]*/ int Item(int iIndex, out IWMEncPluginInfo ppPluginInfo);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000186)]*/ int Refresh();
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncContentAnalyzer : IDispatch {
  mixin(uuid("578dd4cd-0fe4-4fa8-8363-768bb183434d"));
  // static DWINGUID IID = { 0x578dd4cd, 0x0fe4, 0x4fa8, 0x83, 0x63, 0x76, 0x8b, 0xb1, 0x83, 0x43, 0x4d };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000060E)]*/ int get_SourceGroup(out IWMEncSourceGroup ppSourceGroup);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000060E)]*/ int set_SourceGroup(IWMEncSourceGroup ppSourceGroup);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000060F)]*/ int Start();
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000610)]*/ int Stop();
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000611)]*/ int Property(WMENC_SOURCE_TYPE enumType, short iIndex, wchar* bstrProperty, out DWINVARIANT pVarValue);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMDRMContentAuthor : IDispatch {
  mixin(uuid("ef015de4-52be-464a-922e-9d72318b4b3b"));
  // static DWINGUID IID = { 0xef015de4, 0x52be, 0x464a, 0x92, 0x2e, 0x9d, 0x72, 0x31, 0x8b, 0x4b, 0x3b };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005DC)]*/ int SetSessionDRMProfile(wchar* bstrProfileID, ref DWINVARIANT pvartrKID);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005DD)]*/ int GetSessionDRMProfile(out DWINVARIANT pvar, out wchar* pbstrKID);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005E4)]*/ int get_ContentID(out wchar* pbstrCID);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005E4)]*/ int set_ContentID(wchar* pbstrCID);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005DE)]*/ int get_Attributes(out IWMDRMAttributes ppAttributes);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005E3)]*/ int CreateDRMProfile(wchar* bstrProviderURL, wchar* bstrSignaturePrivKey, wchar* bstrSignatureCrt, wchar* bstrSignatureLicSrvCert, wchar* bstrSignatureRootCert, out DWINVARIANT pbstrProfileID, out DWINVARIANT pvarSeed, out wchar* pbstrPubKey);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005DF)]*/ int GetDRMProfile(wchar* bstrProfileID, out IWMDRMProfile ppDRMProfile);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005E0)]*/ int RemoveDRMProfile(wchar* bstrProfileID);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005E1)]*/ int ImportDRMProfile(wchar* bstrPassword, wchar* bstrFile);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005E2)]*/ int ExportDRMProfile(wchar* bstrProfileID, wchar* bstrPassword, wchar* bstrFile);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005E5)]*/ int GenerateKeyID(out wchar* pbstrKID);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005E6)]*/ int GenerateContentID(out wchar* pbstrCID);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005E7)]*/ int get_DRMProfileCollection(out IWMDRMProfileCollection ppUnkDRMProfiles);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMDRMAttributes : IDispatch {
  mixin(uuid("fd1ad79c-ba8c-4772-b367-6d2826f8ddf3"));
  // static DWINGUID IID = { 0xfd1ad79c, 0xba8c, 0x4772, 0xb3, 0x67, 0x6d, 0x28, 0x26, 0xf8, 0xdd, 0xf3 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000000A)]*/ int get_Count(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000000)]*/ int Item(int Index, out DWINVARIANT pvarName, out DWINVARIANT pVarValue);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005FD)]*/ int get_Name(int lIndex, out wchar* pbstrName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005FE)]*/ int get_Value(DWINVARIANT var, out DWINVARIANT pVarValue);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005FA)]*/ int Add(wchar* bstrName, DWINVARIANT varValue);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005FB)]*/ int Remove(DWINVARIANT var);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005FC)]*/ int RemoveAll();
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMDRMProfile : IDispatch {
  mixin(uuid("dd358d0c-fe25-438f-9164-0b92a639a954"));
  // static DWINGUID IID = { 0xdd358d0c, 0xfe25, 0x438f, 0x91, 0x64, 0x0b, 0x92, 0xa6, 0x39, 0xa9, 0x54 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005F0)]*/ int get_ID(out wchar* pbstrProfileID);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005F1)]*/ int get_ProviderURL(out wchar* pbstrProviderURL);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005F2)]*/ int get_Name(out wchar* pbstrProfileName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005F2)]*/ int set_Name(wchar* pbstrProfileName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005F3)]*/ int get_Description(out wchar* pbstrProfileDesc);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005F3)]*/ int set_Description(wchar* pbstrProfileDesc);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005F4)]*/ int get_LicenseAcquisitionURL(out wchar* pbstrLAINFO);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005F4)]*/ int set_LicenseAcquisitionURL(wchar* pbstrLAINFO);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005F5)]*/ int get_V1LicenseAcquisitionURL(out wchar* pbstrLAINFO);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005F5)]*/ int set_V1LicenseAcquisitionURL(wchar* pbstrLAINFO);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005F6)]*/ int get_Attributes(out IWMDRMAttributes ppAttributes);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005F7)]*/ int Update();
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000005F8)]*/ int get_ContentRevocation(out wchar* pbstrContentRevocation);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMDRMProfileCollection : IDispatch {
  mixin(uuid("04cbdd29-d4af-4d0b-b822-bfa2fc0f2fee"));
  // static DWINGUID IID = { 0x04cbdd29, 0xd4af, 0x4d0b, 0xb8, 0x22, 0xbf, 0xa2, 0xfc, 0x0f, 0x2f, 0xee };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000009)]*/ int get_length(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000000A)]*/ int get_Count(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown pIUnknown);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000000)]*/ int Item(DWINVARIANT var, out IWMDRMProfile ppDRMProfile);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncWatermarkCollection : IDispatch {
  mixin(uuid("b9820836-aafa-4a76-9693-97de06f204f0"));
  // static DWINGUID IID = { 0xb9820836, 0xaafa, 0x4a76, 0x96, 0x93, 0x97, 0xde, 0x06, 0xf2, 0x04, 0xf0 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000009)]*/ int get_length(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000000A)]*/ int get_Count(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000000)]*/ int Item(int iIndex, out DWINVARIANT pvarCLSID, out wchar* pbstrName);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncFile2 : IWMEncFile {
  mixin(uuid("272fe476-bd07-40d1-9fe3-320cf4c2910e"));
  // static DWINGUID IID = { 0x272fe476, 0xbd07, 0x40d1, 0x9f, 0xe3, 0x32, 0x0c, 0xf4, 0xc2, 0x91, 0x0e };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000025A)]*/ int get_FileDuration(out WMENC_LONGLONG plTime);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000025A)]*/ int set_FileDuration(WMENC_LONGLONG plTime);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000025B)]*/ int get_FileSize(out WMENC_LONGLONG pqwOutputFileSize);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000025B)]*/ int set_FileSize(WMENC_LONGLONG pqwOutputFileSize);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncSourceGroup2 : IWMEncSourceGroup {
  mixin(uuid("efd3a9f8-8e22-40f7-9896-031a6ec3f486"));
  // static DWINGUID IID = { 0xefd3a9f8, 0x8e22, 0x40f7, 0x98, 0x96, 0x03, 0x1a, 0x6e, 0xc3, 0xf4, 0x86 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000007E)]*/ int get_DeviceControlCollection(out IWMEncDeviceControlCollection ppDeviceControlCollection);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000007F)]*/ int GetAutoRollover(out DWINVARIANT pvar, out wchar* pbstrSourceGroupName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000080)]*/ int SetAutoRollover(int lRolloverTime, wchar* bstrSourceGroupName);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncDeviceControlCollection : IDispatch {
  mixin(uuid("c40aa274-56ed-4bd2-9a52-9b0475d7ec71"));
  // static DWINGUID IID = { 0xc40aa274, 0x56ed, 0x4bd2, 0x9a, 0x52, 0x9b, 0x04, 0x75, 0xd7, 0xec, 0x71 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000009)]*/ int get_length(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000000A)]*/ int get_Count(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown pIUnknown);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000000)]*/ int Item(int lIndex, out IWMEncDeviceControl ppDeviceControl);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000018B)]*/ int Add(out IWMEncDeviceControl ppDeviceControl);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000018C)]*/ int Remove(int lIndex);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000018D)]*/ int RemoveAll();
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncDeviceControl : IDispatch {
  mixin(uuid("6cd3861f-a4a4-4e32-8307-8b1630ef6bc4"));
  // static DWINGUID IID = { 0x6cd3861f, 0xa4a4, 0x4e32, 0x83, 0x07, 0x8b, 0x16, 0x30, 0xef, 0x6b, 0xc4 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000187)]*/ int SetInput(wchar* bstrInput, wchar* bstrScheme, wchar* bstrInitData);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000188)]*/ int GetInput(out DWINVARIANT pbstrScheme, out DWINVARIANT pbstrInitData, out wchar* pbstrInput);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000189)]*/ int GetDeviceControlPlugin(out IUnknown ppUnkPlugin);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncOutputStats2 : IWMEncOutputStats {
  mixin(uuid("992977ec-add6-4be4-87c2-ac029deb82e9"));
  // static DWINGUID IID = { 0x992977ec, 0xadd6, 0x4be4, 0x87, 0xc2, 0xac, 0x02, 0x9d, 0xeb, 0x82, 0xe9 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000503)]*/ int get_Property(wchar* bstrProperty, out DWINVARIANT pvValue);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncVideoSource2 : IWMEncVideoSource {
  mixin(uuid("7b4d2729-e961-4626-90bc-6b5a5593f4eb"));
  // static DWINGUID IID = { 0x7b4d2729, 0xe961, 0x4626, 0x90, 0xbc, 0x6b, 0x5a, 0x55, 0x93, 0xf4, 0xeb };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000B7)]*/ int get_Width(out int plWidth);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000B7)]*/ int set_Width(int plWidth);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000B8)]*/ int get_Height(out int plHeight);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000B8)]*/ int set_Height(int plHeight);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000B9)]*/ int get_PixelAspectRatioX(out short piRatioX);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000B9)]*/ int set_PixelAspectRatioX(short piRatioX);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000BA)]*/ int get_PixelAspectRatioY(out short piRatioY);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000BA)]*/ int set_PixelAspectRatioY(short piRatioY);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000BB)]*/ int get_PreProcessPass(out short piPassesCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000BB)]*/ int set_PreProcessPass(short piPassesCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000AF)]*/ int EnumerateInputs(out IWMEncInputCollection ppInputCol);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000B0)]*/ int set_Input(short piSourceID);
  // Specifies and retrieves a TV Channel.
  /*[id(0x000000B1)]*/ int set_Channel(short piChannelNum);
  // Specifies and retrieves the Country to the TV Tuner.
  /*[id(0x000000B2)]*/ int set_Country(int plCountry);
  // Specifies and retrieves the TV Type to be either Cable or Antenna.
  /*[id(0x000000B3)]*/ int set_TVType(short piTunerInputType);
  // Specifies and retrieves the TV Format to NTSC or PAL , etc...
  /*[id(0x000000B4)]*/ int set_TVFormat(int plAnalogVideoStandard);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000B0)]*/ int get_Input(out short piSourceID);
  // Specifies and retrieves a TV Channel.
  /*[id(0x000000B1)]*/ int get_Channel(out short piChannelNum);
  // Specifies and retrieves the Country to the TV Tuner.
  /*[id(0x000000B2)]*/ int get_Country(out int plCountry);
  // Specifies and retrieves the TV Type to be either Cable or Antenna.
  /*[id(0x000000B3)]*/ int get_TVType(out short piTunerInputType);
  // Specifies and retrieves the TV Format to NTSC or PAL , etc...
  /*[id(0x000000B4)]*/ int get_TVFormat(out int plAnalogVideoStandard);
  // Retrieves the lowest channel available on the TV Tuner.
  /*[id(0x000000C1)]*/ int get_ChannelMin(out int plChannelMin);
  // Retrieves the highest channel available on the TV Tuner.
  /*[id(0x000000C2)]*/ int get_ChannelMax(out int plChannelMax);
  // Retrieves the duration of the source in milliseconds
  /*[id(0x000000BC)]*/ int get_Duration(out int plDuration);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncInputCollection : IDispatch {
  mixin(uuid("5c32008d-7940-4f6c-94a8-9fd2f8c285b1"));
  // static DWINGUID IID = { 0x5c32008d, 0x7940, 0x4f6c, 0x94, 0xa8, 0x9f, 0xd2, 0xf8, 0xc2, 0x85, 0xb1 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000000)]*/ int Item(int lIndex, out wchar* pretval);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000009)]*/ int get_length(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000000A)]*/ int get_Count(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown pIUnknown);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncAudioSource : IWMEncSource {
  mixin(uuid("e15ee1ca-b248-4d6c-a90b-f117197e9ef0"));
  // static DWINGUID IID = { 0xe15ee1ca, 0xb248, 0x4d6c, 0xa9, 0x0b, 0xf1, 0x17, 0x19, 0x7e, 0x9e, 0xf0 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000BF)]*/ int get_ContentMode(out WMENC_CONTENT_MODE penumMode);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000BF)]*/ int set_ContentMode(WMENC_CONTENT_MODE penumMode);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000BE)]*/ int get_ContentEDL(out wchar* pbstrEDL);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000BE)]*/ int set_ContentEDL(wchar* pbstrEDL);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000C0)]*/ int get_PreProcessPass(out short piPassesCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000000C0)]*/ int set_PreProcessPass(short piPassesCount);
  // Retrieves the duration of the source in milliseconds
  /*[id(0x000000BC)]*/ int get_Duration(out int plDuration);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncPushDistributionStats : IDispatch {
  mixin(uuid("7b44f3df-772c-49d6-acb2-0603f1c11930"));
  // static DWINGUID IID = { 0x7b44f3df, 0x772c, 0x49d6, 0xac, 0xb2, 0x06, 0x03, 0xf1, 0xc1, 0x19, 0x30 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000050F)]*/ int get_Property(wchar* bstrProperty, out DWINVARIANT pvarProperty);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncStatistics2 : IWMEncStatistics {
  mixin(uuid("cf213fd7-bd24-4902-b9e4-cf7702c5d105"));
  // static DWINGUID IID = { 0xcf213fd7, 0xbd24, 0x4902, 0xb9, 0xe4, 0xcf, 0x77, 0x02, 0xc5, 0xd1, 0x05 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004E9)]*/ int get_PushDistributionStats(out IDispatch ppDispPushDistributionStats);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncAudienceObj : IDispatch {
  mixin(uuid("87f5bfb1-71a8-4f83-9431-b7129973b8f8"));
  // static DWINGUID IID = { 0x87f5bfb1, 0x71a8, 0x4f83, 0x94, 0x31, 0xb7, 0x12, 0x99, 0x73, 0xb8, 0xf8 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BB8)]*/ int get_Selected(out short pfSelected);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BB8)]*/ int set_Selected(short pfSelected);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BB9)]*/ int get_TotalBitrate(out int plBitrate);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BCE)]*/ int get_TotalPeakBitrate(out int plPeakBitrate);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BBA)]*/ int get_AudioCodec(short iRenderSiteIndex, out int plCodecIndex);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BBA)]*/ int set_AudioCodec(short iRenderSiteIndex, int plCodecIndex);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BBB)]*/ int get_AudioBitrate(short iRenderSiteIndex, out int plBitrate);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BBC)]*/ int get_AudioFormat(short iRenderSiteIndex, out int plFormatIndex);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BBC)]*/ int set_AudioFormat(short iRenderSiteIndex, int plFormatIndex);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BBD)]*/ int SetAudioConfig(short iRenderSiteIndex, short nChannels, int nSamplesPerSec, int lBitrate, short wBitsPerSample);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BCC)]*/ int get_AudioPeakBitrate(short iRenderSiteIndex, out int plBitrate);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BCC)]*/ int set_AudioPeakBitrate(short iRenderSiteIndex, int plBitrate);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BCD)]*/ int get_AudioBufferMax(short iRenderSiteIndex, out int plBMax);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BCD)]*/ int set_AudioBufferMax(short iRenderSiteIndex, int plBMax);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BBE)]*/ int get_VideoCodec(short iRenderSiteIndex, out int plCodecIndex);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BBE)]*/ int set_VideoCodec(short iRenderSiteIndex, int plCodecIndex);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BBF)]*/ int get_VideoBitrate(short iRenderSiteIndex, out int plBitrate);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BBF)]*/ int set_VideoBitrate(short iRenderSiteIndex, int plBitrate);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BC0)]*/ int get_VideoPeakBitrate(short iRenderSiteIndex, out int plBitrate);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BC0)]*/ int set_VideoPeakBitrate(short iRenderSiteIndex, int plBitrate);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BC1)]*/ int get_VideoWidth(short iRenderSiteIndex, out int plWidth);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BC1)]*/ int set_VideoWidth(short iRenderSiteIndex, int plWidth);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BC2)]*/ int get_VideoHeight(short iRenderSiteIndex, out int plHeight);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BC2)]*/ int set_VideoHeight(short iRenderSiteIndex, int plHeight);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BC3)]*/ int get_VideoFPS(short iRenderSiteIndex, out int plFPS);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BC3)]*/ int set_VideoFPS(short iRenderSiteIndex, int plFPS);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BC4)]*/ int get_VideoKeyFrameDistance(short iRenderSiteIndex, out WMENC_LONGLONG pllKFS);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BC4)]*/ int set_VideoKeyFrameDistance(short iRenderSiteIndex, WMENC_LONGLONG pllKFS);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BC5)]*/ int get_VideoImageSharpness(short iRenderSiteIndex, out int plIQuality);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BC5)]*/ int set_VideoImageSharpness(short iRenderSiteIndex, int plIQuality);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BC6)]*/ int get_VideoCompressionQuality(short iRenderSiteIndex, out int plCQuality);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BC6)]*/ int set_VideoCompressionQuality(short iRenderSiteIndex, int plCQuality);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BC7)]*/ int get_VideoBufferSize(short iRenderSiteIndex, out int plBS);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BC7)]*/ int set_VideoBufferSize(short iRenderSiteIndex, int plBS);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BC8)]*/ int get_VideoBufferMax(short iRenderSiteIndex, out int plBMax);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BC8)]*/ int set_VideoBufferMax(short iRenderSiteIndex, int plBMax);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BC9)]*/ int get_ScriptBitrate(short iRenderSiteIndex, out int plBitrate);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BC9)]*/ int set_ScriptBitrate(short iRenderSiteIndex, int plBitrate);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BCA)]*/ int get_StreamBitrate(WMENC_SOURCE_TYPE enumSrcType, short iRenderSiteIndex, out int plBitrate);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BCA)]*/ int set_StreamBitrate(WMENC_SOURCE_TYPE enumSrcType, short iRenderSiteIndex, int plBitrate);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BCB)]*/ int get_Property(WMENC_SOURCE_TYPE enumSrcType, short iRenderSiteIndex, wchar* bstrProperty, out DWINVARIANT pvarProperty);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BCB)]*/ int set_Property(WMENC_SOURCE_TYPE enumSrcType, short iRenderSiteIndex, wchar* bstrProperty, DWINVARIANT pvarProperty);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncFileSet : IDispatch {
  mixin(uuid("0c92143f-e5e7-4b7c-8f4f-9ba6ed370410"));
  // static DWINGUID IID = { 0x0c92143f, 0xe5e7, 0x4b7c, 0x8f, 0x4f, 0x9b, 0xa6, 0xed, 0x37, 0x04, 0x10 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000000A)]*/ int get_Count(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000000)]*/ int Item(int lIndex, out DWINVARIANT pvarFileName, out wchar* pbstrFileURL);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000A28)]*/ int Add(wchar* bstrFileName, wchar* bstrFileURL);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000A29)]*/ int Remove(int lIndex);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000A2A)]*/ int RemoveAll();
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000A3A)]*/ int Move(int lMove, int lInFrontOf);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000A3B)]*/ int SetInput(int lIndex, wchar* bstrFileName, wchar* bstrURL);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000A2C)]*/ int get_Time(out WMENC_LONGLONG pllSendTime);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000A2C)]*/ int set_Time(WMENC_LONGLONG pllSendTime);
}

// IWMEncFileTransferSource Interface
interface IWMEncFileTransferSource : IDispatch {
  mixin(uuid("2cc1a314-08b6-4cc2-8913-62da2b05173f"));
  // static DWINGUID IID = { 0x2cc1a314, 0x08b6, 0x4cc2, 0x89, 0x13, 0x62, 0xda, 0x2b, 0x05, 0x17, 0x3f };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000000A)]*/ int get_Count(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000000)]*/ int Item(int lIndex, out IWMEncFileSet ppEntry);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000A32)]*/ int Add(out IWMEncFileSet ppHTMLDataGroup);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000A33)]*/ int Remove(int lIndex);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000A34)]*/ int RemoveAll();
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000A35)]*/ int Move(int lMove, int lInFrontOf);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000A36)]*/ int get_UserDrivenMode(out short pfSendMode);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000A36)]*/ int set_UserDrivenMode(short pfSendMode);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000A37)]*/ int Send(IWMEncFileSet pIWMEncFileSet);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000A38)]*/ int Abort();
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000A39)]*/ int get_State(out WMENC_SOURCE_STATE penumSourceState);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000A3C)]*/ int get_Active(out IWMEncFileSet ppIWMEncFileSet);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncNetConnectionStats2 : IWMEncNetConnectionStats {
  mixin(uuid("5dd6f6bf-e691-4143-bad1-0ad72b02f1a2"));
  // static DWINGUID IID = { 0x5dd6f6bf, 0xe691, 0x4143, 0xba, 0xd1, 0x0a, 0xd7, 0x2b, 0x02, 0xf1, 0xa2 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000004EE)]*/ int get_HostURL(out wchar* pbstrHostURL);
}

// Not Public.  Internal interface used by Windows Media Player.
interface _IWMEncoderEvents : IDispatch {
  mixin(uuid("d053a996-2652-41da-95f4-225493f338f1"));
  // static DWINGUID IID = { 0xd053a996, 0x2652, 0x41da, 0x95, 0xf4, 0x22, 0x54, 0x93, 0xf3, 0x38, 0xf1 };
  /+// Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000047E)]*/ int OnStateChange(WMENC_ENCODER_STATE enumState);+/
  /+// Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000047F)]*/ int OnError(int hResult);+/
  /+// Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000480)]*/ int OnArchiveStateChange(WMENC_ARCHIVE_TYPE enumArchive, WMENC_ARCHIVE_STATE enumState);+/
  /+// Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000481)]*/ int OnConfigChange(int hResult, wchar* bstring);+/
  /+// Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000482)]*/ int OnClientConnect(WMENC_BROADCAST_PROTOCOL protocol, wchar* bstring);+/
  /+// Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000483)]*/ int OnClientDisconnect(WMENC_BROADCAST_PROTOCOL protocol, wchar* bstring);+/
  /+// Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000484)]*/ int OnSourceStateChange(WMENC_SOURCE_STATE enumState, WMENC_SOURCE_TYPE enumType, short iIndex, wchar* bstrSourceGroup);+/
  /+// Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000487)]*/ int OnDeviceControlStateChange(WMENC_DEVICECONTROL_STATE enumState, wchar* bstrName, wchar* bstrScheme);+/
  /+// Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000485)]*/ int OnIndexerStateChange(WMENC_INDEXER_STATE enumIndexerState, wchar* bstrFile);+/
  /+// Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000486)]*/ int OnAcquireCredentials(wchar* bstrRealm, wchar* bstrSite, ref DWINVARIANT pvarUser, ref DWINVARIANT pvarPassword, ref DWINVARIANT plFlags);+/
  /+// Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000488)]*/ int OnClientDNSNameResolved(wchar* bstrIpAddr, wchar* bstrDNSName);+/
}

// Not Public.  Internal interface used by Windows Media Player.
interface _IWMEncBasicEditEvents : IDispatch {
  mixin(uuid("6219711d-f686-43ca-ae1e-cfc8ec2a94d2"));
  // static DWINGUID IID = { 0x6219711d, 0xf686, 0x43ca, 0xae, 0x1e, 0xcf, 0xc8, 0xec, 0x2a, 0x94, 0xd2 };
  /+// Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000009D8)]*/ int OnStateChange(WMENC_BASICEDIT_STATE enumState);+/
  /+// Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000009D9)]*/ int OnError(int hResult);+/
}

// Not Public.  Internal interface used by Windows Media Player.
interface _IWMEncoderAppEvents : IDispatch {
  mixin(uuid("32b8ecc9-2901-11d3-8fb8-00c04f6109b7"));
  // static DWINGUID IID = { 0x32b8ecc9, 0x2901, 0x11d3, 0x8f, 0xb8, 0x00, 0xc0, 0x4f, 0x61, 0x09, 0xb7 };
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncoderApp : IDispatch {
  mixin(uuid("9d69fdda-2b78-4bb2-93d9-1dda6a6ad968"));
  // static DWINGUID IID = { 0x9d69fdda, 0x2b78, 0x4bb2, 0x93, 0xd9, 0x1d, 0xda, 0x6a, 0x6a, 0xd9, 0x68 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000514)]*/ int get_Encoder(out IWMEncoder ppEncoder);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000515)]*/ int get_Visible(out short pVal);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000515)]*/ int set_Visible(short pVal);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000516)]*/ int get_Top(out int pVal);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000516)]*/ int set_Top(int pVal);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000517)]*/ int get_Left(out int pVal);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000517)]*/ int set_Left(int pVal);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000518)]*/ int get_Width(out int pVal);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000518)]*/ int set_Width(int pVal);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000519)]*/ int get_Height(out int pVal);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000519)]*/ int set_Height(int pVal);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000051A)]*/ int get_UILock(out short pVal);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000051A)]*/ int set_UILock(short pVal);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000051B)]*/ int get_DisplayWidth(short iIndex, out int pVal);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000051C)]*/ int get_DisplayHeight(short iIndex, out int pVal);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000051D)]*/ int GetProperty(WMENCAPP_PROP_CLASS enumClass, wchar* bstrProperty, out DWINVARIANT pValue);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000051E)]*/ int SetProperty(WMENCAPP_PROP_CLASS enumClass, wchar* bstrProperty, DWINVARIANT Value);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x0000051F)]*/ int SaveProperties(WMENCAPP_PROP_CLASS enumClass);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncProfileManager : IDispatch {
  mixin(uuid("d88a5969-1c9b-45d6-86e8-dc46508cb981"));
  // static DWINGUID IID = { 0xd88a5969, 0x1c9b, 0x45d6, 0x86, 0xe8, 0xdc, 0x46, 0x50, 0x8c, 0xb9, 0x81 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000001)]*/ int WMEncProfileList(WMENC_MEDIA_FILTER filter, int lcid);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000002)]*/ int WMEncProfileListEx(WMENC_MEDIA_FILTER filter, WMENC_MEDIA_FILTER newDefault, int lcid);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000003)]*/ int WMEncProfileEdit(wchar* bstrProfileName, WMENC_MEDIA_FILTER lfilter, int lcid);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000004)]*/ int GetDetailsString(wchar* bstrProfileName, int lcid, out wchar* bstrDetailsString);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000005)]*/ int get_ProfileDirectory(out wchar* bstrDirectory);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000005)]*/ int set_ProfileDirectory(wchar* bstrDirectory);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000006)]*/ int get_LastCreatedProfile(out wchar* bstrProfile);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000007)]*/ int get_LastEditedProfile(out wchar* bstrProfile);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncBasicEdit : IDispatch {
  mixin(uuid("ed6a5f34-b618-4dda-9a1e-90bc0b600c20"));
  // static DWINGUID IID = { 0xed6a5f34, 0xb618, 0x4dda, 0x9a, 0x1e, 0x90, 0xbc, 0x0b, 0x60, 0x0c, 0x20 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000009C4)]*/ int get_MediaFile(out wchar* pbstrMediaFileName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000009C4)]*/ int set_MediaFile(wchar* pbstrMediaFileName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000009CF)]*/ int get_OutputFile(out wchar* pbstrOutputFileName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000009CF)]*/ int set_OutputFile(wchar* pbstrOutputFileName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000009C5)]*/ int get_ConfigFile(out wchar* pbstrConfigXMLFileName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000009C5)]*/ int set_ConfigFile(wchar* pbstrConfigXMLFileName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000009C6)]*/ int get_MarkIn(out WMENC_LONGLONG pllMarkIn);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000009C6)]*/ int set_MarkIn(WMENC_LONGLONG pllMarkIn);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000009C7)]*/ int get_MarkOut(out WMENC_LONGLONG pllMarkOut);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000009C7)]*/ int set_MarkOut(WMENC_LONGLONG pllMarkOut);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000009CD)]*/ int get_Index(out short pfIndex);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000009CD)]*/ int set_Index(short pfIndex);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000009C8)]*/ int SaveConfigFile(wchar* bstrConfigXMLFileName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000009C9)]*/ int SaveProfile(wchar* bstrProfileFileName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000009D0)]*/ int get_Profile(out IWMEncProfile2 ppIWMEncProfile2);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000009CA)]*/ int Start();
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000009CB)]*/ int Stop();
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000009CC)]*/ int get_RunState(out WMENC_BASICEDIT_STATE penumState);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000009CE)]*/ int get_Duration(out WMENC_LONGLONG pllDuration);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000009D1)]*/ int get_ErrorState(out int plResult);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x000009D2)]*/ int get_ProgressPercent(out int plProgressPercent);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncProfile2 : IWMEncProfile {
  mixin(uuid("34995131-427c-40b5-877b-4a9b6f3ca758"));
  // static DWINGUID IID = { 0x34995131, 0x427c, 0x40b5, 0x87, 0x7b, 0x4a, 0x9b, 0x6f, 0x3c, 0xa7, 0x58 };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BEB)]*/ int get_ContentType(out int plSrcType);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BEB)]*/ int set_ContentType(int plSrcType);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BEC)]*/ int LoadFromIWMProfile(IUnknown pUnkProfile);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BED)]*/ int LoadFromFile(wchar* bstrFileName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BEE)]*/ int LoadFromMemory(wchar* bstrData);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BEF)]*/ int SaveToIWMProfile(out IUnknown pUnkProfile);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BF0)]*/ int SaveToFile(wchar* bstrFileName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BF1)]*/ int SaveToMemory(out wchar* pbstrData);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BF2)]*/ int Clone(IWMEncProfile2 pObj);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BF3)]*/ int Clear();
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BF4)]*/ int get_AudienceCount(out int plCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BF5)]*/ int get_Audience(int lIndex, out IWMEncAudienceObj ppAudience);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BF6)]*/ int AddAudience(int lBitrate, out IWMEncAudienceObj ppAudience);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BF7)]*/ int DeleteAudience(int lIndex);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BF9)]*/ int get_ValidateMode(out short pfValidate);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BF9)]*/ int set_ValidateMode(short pfValidate);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BFA)]*/ int Validate();
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BFB)]*/ int get_CompatibilityMode(out WMENC_PROFILE_COMPATIBILITY penumCompat);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BFB)]*/ int set_CompatibilityMode(WMENC_PROFILE_COMPATIBILITY penumCompat);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BFC)]*/ int get_VBRMode(WMENC_SOURCE_TYPE enumSrcType, short iRenderSite, out WMENC_PROFILE_VBR_MODE penumVBR);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BFC)]*/ int set_VBRMode(WMENC_SOURCE_TYPE enumSrcType, short iRenderSite, WMENC_PROFILE_VBR_MODE penumVBR);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BFD)]*/ int set_ProfileName(wchar* pbstrName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BFD)]*/ int get_ProfileName(out wchar* pbstrName);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BFE)]*/ int set_ProfileDescription(wchar* pbstrDescription);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BFE)]*/ int get_ProfileDescription(out wchar* pbstrDescription);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000C08)]*/ int get_AudioCodecCount(out int plAudioCodecCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000BFF)]*/ int EnumAudioCodec(int lCodecIndex, out DWINVARIANT pvarName, out int lFormatTag);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000C09)]*/ int get_AudioFormatCount(int lCodecIndex, out int plAudioFormatCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000C00)]*/ int EnumAudioFormat(int lCodecIndex, int lFormatIndex, out DWINVARIANT pvarName, out DWINVARIANT pvarSamplingRate, out DWINVARIANT pvarNChannels, out DWINVARIANT pvarBitsPerSample, out int plBitrate);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000C0A)]*/ int get_VideoCodecCount(out int plVideoCodecCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000C01)]*/ int EnumVideoCodec(int lCodecIndex, out DWINVARIANT pvarName, out int lFourCC);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000C02)]*/ int GetCodecIndexFromFourCC(WMENC_SOURCE_TYPE enumSrcType, int lFourCC, out int plIndex);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000C03)]*/ int GetCodecFourCCFromIndex(WMENC_SOURCE_TYPE enumSrcType, int lIndex, out int plFourCC);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000C0D)]*/ int get_LanguageCount(WMENC_SOURCE_TYPE enumSrcType, short iRenderSite, out int plLanguageCount);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000C0E)]*/ int get_Language(WMENC_SOURCE_TYPE enumSrcType, short iRenderSite, int lLanguageIndex, out int lcidLanguage);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000C0F)]*/ int AddLanguage(WMENC_SOURCE_TYPE enumSrcType, short iRenderSite, int lcidLanguage);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000C10)]*/ int RemoveLanguage(WMENC_SOURCE_TYPE enumSrcType, short iRenderSite, int lcidLanguage);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000C04)]*/ int get_BroadcastMode(out WMENC_PROFILE_BROADCAST_MODE penumBroadcastMode);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000C04)]*/ int set_BroadcastMode(WMENC_PROFILE_BROADCAST_MODE penumBroadcastMode);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000C05)]*/ int DetectCompatibility(out WMENC_PROFILE_COMPATIBILITY penumCompat);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000C06)]*/ int Merge(IWMEncProfile2 pWMEncProfileObj);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000C07)]*/ int Compare(IWMEncProfile2 pCompObj, out short pfSubset, out short pfEqual);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000C0B)]*/ int get_InterlaceMode(short iRenderSiteIndex, out short pfInterlaceMode);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000C0B)]*/ int set_InterlaceMode(short iRenderSiteIndex, short pfInterlaceMode);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000C0C)]*/ int get_NonSquarePixelMode(short iRenderSiteIndex, out short pfNonSquarePixelMode);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000C0C)]*/ int set_NonSquarePixelMode(short iRenderSiteIndex, short pfNonSquarePixelMode);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000C11)]*/ int get_EnableTimecode(short iRenderSiteIndex, out short pfTimecode);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000C11)]*/ int set_EnableTimecode(short iRenderSiteIndex, short pfTimecode);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000C12)]*/ int get_MinPacketSize(out int plMinPacketSize);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000C12)]*/ int set_MinPacketSize(int plMinPacketSize);
}

// Not Public.  Internal interface used by Windows Media Player.
interface IWMEncStreamEdit : IDispatch {
  mixin(uuid("fbbc528b-d265-414e-b584-84a15ff8cf8b"));
  // static DWINGUID IID = { 0xfbbc528b, 0xd265, 0x414e, 0xb5, 0x84, 0x84, 0xa1, 0x5f, 0xf8, 0xcf, 0x8b };
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000A78)]*/ int get_OutputFile(out wchar* pbstrOutputFile);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000A78)]*/ int set_OutputFile(wchar* pbstrOutputFile);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000A79)]*/ int AddStream(wchar* bstrInputFile, WMENC_SOURCE_TYPE enumSrcType, int lInputAudienceIndex, short iInputRenderSite, int lInputLangId, int lOutputAudienceIndex, short iOutputRenderSite);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000A7A)]*/ int RemoveAllStreams();
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000A7B)]*/ int Validate();
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000A7C)]*/ int Start();
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000A7D)]*/ int Stop();
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000A7F)]*/ int get_OutputProfile(out IWMEncProfile2 ppIWMEncProfile2);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000A7E)]*/ int get_RunState(out WMENC_BASICEDIT_STATE penumState);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000A80)]*/ int GetStream(WMENC_SOURCE_TYPE enumSrcType, int lOutputAudienceIndex, short iOutputRenderSite, int lcidLang, out DWINVARIANT pvarInputFile, out DWINVARIANT pvarInputAudienceIndex, out short piInputRenderSite);
  // Not Public.  Internal interface used by Windows Media Player.
  /*[id(0x00000A81)]*/ int get_ProgressPercent(out int plProgressPercent);
}

// CoClasses

// Not Public.  Internal interface used by Windows Media Player.
abstract class WMEncoder {
  mixin(uuid("52e4e90a-f4af-460a-9e60-fdfb86c9dd5d"));
  // static DWINGUID CLSID = { 0x52e4e90a, 0xf4af, 0x460a, 0x9e, 0x60, 0xfd, 0xfb, 0x86, 0xc9, 0xdd, 0x5d };
  mixin Interfaces!(IWMEncoder2);
}

// Not Public.  Internal interface used by Windows Media Player.
abstract class WMEncoderApp {
  mixin(uuid("133581e6-2c1a-4520-b0dd-a5fb44adcf2d"));
  // static DWINGUID CLSID = { 0x133581e6, 0x2c1a, 0x4520, 0xb0, 0xdd, 0xa5, 0xfb, 0x44, 0xad, 0xcf, 0x2d };
  mixin Interfaces!(IWMEncoderApp);
}

// Not Public.  Internal interface used by Windows Media Player.
abstract class WMEncSourcesPage {
  mixin(uuid("f1ce3c61-4017-436c-89ac-750ba9df8b0a"));
  // static DWINGUID CLSID = { 0xf1ce3c61, 0x4017, 0x436c, 0x89, 0xac, 0x75, 0x0b, 0xa9, 0xdf, 0x8b, 0x0a };
  mixin Interfaces!(IUnknown);
}

// Not Public.  Internal interface used by Windows Media Player.
abstract class WMEncSourcesAltPage {
  mixin(uuid("f371080f-43d7-4b45-9a96-d6fe3cf6f17a"));
  // static DWINGUID CLSID = { 0xf371080f, 0x43d7, 0x4b45, 0x9a, 0x96, 0xd6, 0xfe, 0x3c, 0xf6, 0xf1, 0x7a };
  mixin Interfaces!(IUnknown);
}

// Not Public.  Internal interface used by Windows Media Player.
abstract class WMEncDisplayInfoPage {
  mixin(uuid("2dd6c3ab-8205-4dad-8a51-32631d7c3de2"));
  // static DWINGUID CLSID = { 0x2dd6c3ab, 0x8205, 0x4dad, 0x8a, 0x51, 0x32, 0x63, 0x1d, 0x7c, 0x3d, 0xe2 };
  mixin Interfaces!(IUnknown);
}

// Not Public.  Internal interface used by Windows Media Player.
abstract class WMEncAttributesPage {
  mixin(uuid("ace22514-37ca-4f58-a37f-39ca452a0e9d"));
  // static DWINGUID CLSID = { 0xace22514, 0x37ca, 0x4f58, 0xa3, 0x7f, 0x39, 0xca, 0x45, 0x2a, 0x0e, 0x9d };
  mixin Interfaces!(IUnknown);
}

// Not Public.  Internal interface used by Windows Media Player.
abstract class WMEncProfilePage {
  mixin(uuid("b5c8f9f3-e77b-4eb2-8e2b-db2a30e88ab5"));
  // static DWINGUID CLSID = { 0xb5c8f9f3, 0xe77b, 0x4eb2, 0x8e, 0x2b, 0xdb, 0x2a, 0x30, 0xe8, 0x8a, 0xb5 };
  mixin Interfaces!(IUnknown);
}

// Not Public.  Internal interface used by Windows Media Player.
abstract class WMEncOutputPage {
  mixin(uuid("45ff5732-32c3-43fe-a197-f6ac874150cd"));
  // static DWINGUID CLSID = { 0x45ff5732, 0x32c3, 0x43fe, 0xa1, 0x97, 0xf6, 0xac, 0x87, 0x41, 0x50, 0xcd };
  mixin Interfaces!(IUnknown);
}

// Not Public.  Internal interface used by Windows Media Player.
abstract class WMEncAdvancedPage {
  mixin(uuid("83edbfb5-d648-414d-80a1-128e7ae76a0c"));
  // static DWINGUID CLSID = { 0x83edbfb5, 0xd648, 0x414d, 0x80, 0xa1, 0x12, 0x8e, 0x7a, 0xe7, 0x6a, 0x0c };
  mixin Interfaces!(IUnknown);
}

// Not Public.  Internal interface used by Windows Media Player.
abstract class WMEncVideoSizePage {
  mixin(uuid("3781586e-438c-45ae-a4da-e26884a7f31a"));
  // static DWINGUID CLSID = { 0x3781586e, 0x438c, 0x45ae, 0xa4, 0xda, 0xe2, 0x68, 0x84, 0xa7, 0xf3, 0x1a };
  mixin Interfaces!(IUnknown);
}

// Not Public.  Internal interface used by Windows Media Player.
abstract class WMEncProcessingPage {
  mixin(uuid("7983f829-4d24-479d-9377-a02c7df269b0"));
  // static DWINGUID CLSID = { 0x7983f829, 0x4d24, 0x479d, 0x93, 0x77, 0xa0, 0x2c, 0x7d, 0xf2, 0x69, 0xb0 };
  mixin Interfaces!(IUnknown);
}

// Not Public.  Internal interface used by Windows Media Player.
abstract class WMEncPluginsPage {
  mixin(uuid("665fc957-a64d-4161-8a64-46271a210379"));
  // static DWINGUID CLSID = { 0x665fc957, 0xa64d, 0x4161, 0x8a, 0x64, 0x46, 0x27, 0x1a, 0x21, 0x03, 0x79 };
  mixin Interfaces!(IUnknown);
}

// Not Public.  Internal interface used by Windows Media Player.
abstract class WMEncDRMPage {
  mixin(uuid("3de26a29-7549-47ba-884e-0e5cb3c4c1ce"));
  // static DWINGUID CLSID = { 0x3de26a29, 0x7549, 0x47ba, 0x88, 0x4e, 0x0e, 0x5c, 0xb3, 0xc4, 0xc1, 0xce };
  mixin Interfaces!(IUnknown);
}

// Not Public.  Internal interface used by Windows Media Player.
abstract class WMEncMonMainPage {
  mixin(uuid("ed9aec34-9c96-4be9-85ef-e34bf5fa8e7f"));
  // static DWINGUID CLSID = { 0xed9aec34, 0x9c96, 0x4be9, 0x85, 0xef, 0xe3, 0x4b, 0xf5, 0xfa, 0x8e, 0x7f };
  mixin Interfaces!(IUnknown);
}

// Not Public.  Internal interface used by Windows Media Player.
abstract class WMEncMonDisplayInfoPage {
  mixin(uuid("03862962-41bd-458e-8a0b-3c3997e08ce6"));
  // static DWINGUID CLSID = { 0x03862962, 0x41bd, 0x458e, 0x8a, 0x0b, 0x3c, 0x39, 0x97, 0xe0, 0x8c, 0xe6 };
  mixin Interfaces!(IUnknown);
}

// Not Public.  Internal interface used by Windows Media Player.
abstract class WMEncMonConnectionsPage {
  mixin(uuid("36d8f093-b3ac-4886-b904-46f546f5f067"));
  // static DWINGUID CLSID = { 0x36d8f093, 0xb3ac, 0x4886, 0xb9, 0x04, 0x46, 0xf5, 0x46, 0xf5, 0xf0, 0x67 };
  mixin Interfaces!(IUnknown);
}

// Not Public.  Internal interface used by Windows Media Player.
abstract class WMEncProfileManager {
  mixin(uuid("78cbd089-29ee-4fd6-97ae-ba1a25ea0b8a"));
  // static DWINGUID CLSID = { 0x78cbd089, 0x29ee, 0x4fd6, 0x97, 0xae, 0xba, 0x1a, 0x25, 0xea, 0x0b, 0x8a };
  mixin Interfaces!(IWMEncProfileManager);
}

// Not Public.  Internal interface used by Windows Media Player.
abstract class WMEncBasicEdit {
  mixin(uuid("f9f4d292-87f5-4e2d-98a1-590391932490"));
  // static DWINGUID CLSID = { 0xf9f4d292, 0x87f5, 0x4e2d, 0x98, 0xa1, 0x59, 0x03, 0x91, 0x93, 0x24, 0x90 };
  mixin Interfaces!(IWMEncBasicEdit);
}

// Not Public.  Internal interface used by Windows Media Player.
abstract class WMEncStreamEdit {
  mixin(uuid("1bf18d30-223c-4e0f-9074-c78c1256fd43"));
  // static DWINGUID CLSID = { 0x1bf18d30, 0x223c, 0x4e0f, 0x90, 0x74, 0xc7, 0x8c, 0x12, 0x56, 0xfd, 0x43 };
  mixin Interfaces!(IWMEncStreamEdit);
}

// Not Public.  Internal interface used by Windows Media Player.
abstract class WMEncProfile2 {
  mixin(uuid("baa94581-c092-425c-b4d3-7b5ee0bac3c4"));
  // static DWINGUID CLSID = { 0xbaa94581, 0xc092, 0x425c, 0xb4, 0xd3, 0x7b, 0x5e, 0xe0, 0xba, 0xc3, 0xc4 };
  mixin Interfaces!(IWMEncProfile2);
}
