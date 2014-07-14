// Microsoft H323 Service Provider 1.0 Type Library
// Version 1.0

/*[uuid("e36489bc-45c9-11d2-831f-00a0244d2298")]*/
module dwin.sys.win32.com.tlb.more.h323msp;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum __MIDL___MIDL_itf_h323msp_0001_0004 {
  ME_ADDRESS_EVENT = 0x00000000,
  ME_CALL_EVENT = 0x00000001,
  ME_TSP_DATA = 0x00000002,
  ME_PRIVATE_EVENT = 0x00000003,
  ME_ASR_TERMINAL_EVENT = 0x00000004,
  ME_TTS_TERMINAL_EVENT = 0x00000005,
  ME_FILE_TERMINAL_EVENT = 0x00000006,
  ME_TONE_TERMINAL_EVENT = 0x00000007,
}

enum __MIDL___MIDL_itf_h323msp_0001_0001 {
  ADDRESS_TERMINAL_AVAILABLE = 0x00000000,
  ADDRESS_TERMINAL_UNAVAILABLE = 0x00000001,
}

enum TERMINAL_STATE {
  TS_INUSE = 0x00000000,
  TS_NOTINUSE = 0x00000001,
}

enum TERMINAL_TYPE {
  TT_STATIC = 0x00000000,
  TT_DYNAMIC = 0x00000001,
}

enum TERMINAL_DIRECTION {
  TD_CAPTURE = 0x00000000,
  TD_RENDER = 0x00000001,
  TD_BIDIRECTIONAL = 0x00000002,
  TD_MULTITRACK_MIXED = 0x00000003,
  TD_NONE = 0x00000004,
}

enum __MIDL___MIDL_itf_h323msp_0001_0002 {
  CALL_NEW_STREAM = 0x00000000,
  CALL_STREAM_FAIL = 0x00000001,
  CALL_TERMINAL_FAIL = 0x00000002,
  CALL_STREAM_NOT_USED = 0x00000003,
  CALL_STREAM_ACTIVE = 0x00000004,
  CALL_STREAM_INACTIVE = 0x00000005,
}

enum __MIDL___MIDL_itf_h323msp_0001_0003 {
  CALL_CAUSE_UNKNOWN = 0x00000000,
  CALL_CAUSE_BAD_DEVICE = 0x00000001,
  CALL_CAUSE_CONNECT_FAIL = 0x00000002,
  CALL_CAUSE_LOCAL_REQUEST = 0x00000003,
  CALL_CAUSE_REMOTE_REQUEST = 0x00000004,
  CALL_CAUSE_MEDIA_TIMEOUT = 0x00000005,
  CALL_CAUSE_MEDIA_RECOVERED = 0x00000006,
  CALL_CAUSE_QUALITY_OF_SERVICE = 0x00000007,
}

enum TERMINAL_MEDIA_STATE {
  TMS_IDLE = 0x00000000,
  TMS_ACTIVE = 0x00000001,
  TMS_PAUSED = 0x00000002,
  TMS_LASTITEM = 0x00000002,
}

enum FT_STATE_EVENT_CAUSE {
  FTEC_NORMAL = 0x00000000,
  FTEC_END_OF_FILE = 0x00000001,
  FTEC_READ_ERROR = 0x00000002,
  FTEC_WRITE_ERROR = 0x00000003,
}

enum tagStreamConfigCapsType {
  AudioStreamConfigCaps = 0x00000000,
  VideoStreamConfigCaps = 0x00000001,
}

enum tagStreamQualityProperty {
  StreamQuality_MaxBitrate = 0x00000000,
  StreamQuality_CurrBitrate = 0x00000001,
  StreamQuality_MinFrameInterval = 0x00000002,
  StreamQuality_AvgFrameInterval = 0x00000003,
}

enum tagTAPIControlFlags {
  TAPIControl_Flags_None = 0x00000000,
  TAPIControl_Flags_Auto = 0x00000001,
  TAPIControl_Flags_Manual = 0x00000002,
}

enum tagCallQualityProperty {
  CallQuality_ControlInterval = 0x00000000,
  CallQuality_ConfBitrate = 0x00000001,
  CallQuality_MaxInputBitrate = 0x00000002,
  CallQuality_CurrInputBitrate = 0x00000003,
  CallQuality_MaxOutputBitrate = 0x00000004,
  CallQuality_CurrOutputBitrate = 0x00000005,
  CallQuality_MaxCPULoad = 0x00000006,
  CallQuality_CurrCPULoad = 0x00000007,
}

enum tagAudioDeviceProperty {
  AudioDevice_DuplexMode = 0x00000000,
  AudioDevice_AutomaticGainControl = 0x00000001,
  AudioDevice_AcousticEchoCancellation = 0x00000002,
}

enum tagAudioSettingsProperty {
  AudioSettings_SignalLevel = 0x00000000,
  AudioSettings_SilenceThreshold = 0x00000001,
  AudioSettings_Volume = 0x00000002,
  AudioSettings_Balance = 0x00000003,
  AudioSettings_Loudness = 0x00000004,
  AudioSettings_Treble = 0x00000005,
  AudioSettings_Bass = 0x00000006,
  AudioSettings_Mono = 0x00000007,
}

enum H245_CAPABILITY {
  HC_G711 = 0x00000000,
  HC_G723 = 0x00000001,
  HC_H263QCIF = 0x00000002,
  HC_H261QCIF = 0x00000003,
}

// Unions

union __MIDL___MIDL_itf_h323msp_0001_0006 {
  __MIDL___MIDL_itf_h323msp_0001_0007 MSP_ADDRESS_EVENT_INFO;
  __MIDL___MIDL_itf_h323msp_0001_0008 MSP_CALL_EVENT_INFO;
  __MIDL___MIDL_itf_h323msp_0001_0009 MSP_TSP_DATA;
  __MIDL___MIDL_itf_h323msp_0001_0010 MSP_PRIVATE_EVENT_INFO;
  __MIDL___MIDL_itf_h323msp_0001_0011 MSP_FILE_TERMINAL_EVENT_INFO;
  __MIDL___MIDL_itf_h323msp_0001_0012 MSP_ASR_TERMINAL_EVENT_INFO;
  __MIDL___MIDL_itf_h323msp_0001_0013 MSP_TTS_TERMINAL_EVENT_INFO;
  __MIDL___MIDL_itf_h323msp_0001_0014 MSP_TONE_TERMINAL_EVENT_INFO;
}

union __MIDL___MIDL_itf_h323msp_0503_0001 {
  _TAPI_VIDEO_STREAM_CONFIG_CAPS VideoCap;
  _TAPI_AUDIO_STREAM_CONFIG_CAPS AudioCap;
}

// Structs

struct __MIDL___MIDL_itf_h323msp_0001_0005 {
  uint dwSize;
  MSP_EVENT Event;
  int* hCall;
  __MIDL___MIDL_itf_h323msp_0001_0006 __MIDL_0019;
}

struct __MIDL___MIDL_itf_h323msp_0001_0007 {
  MSP_ADDRESS_EVENT Type;
  ITTerminal pTerminal;
}

struct __MIDL___MIDL_itf_h323msp_0001_0008 {
  MSP_CALL_EVENT Type;
  MSP_CALL_EVENT_CAUSE Cause;
  ITStream pStream;
  ITTerminal pTerminal;
  int hrError;
}

struct __MIDL___MIDL_itf_h323msp_0001_0009 {
  uint dwBufferSize;
  ubyte[1] pBuffer;
}

struct __MIDL___MIDL_itf_h323msp_0001_0010 {
  IDispatch pEvent;
  int lEventCode;
}

struct __MIDL___MIDL_itf_h323msp_0001_0011 {
  ITTerminal pParentFileTerminal;
  ITFileTrack pFileTrack;
  TERMINAL_MEDIA_STATE TerminalMediaState;
  FT_STATE_EVENT_CAUSE ftecEventCause;
  int hrErrorCode;
}

struct _AMMediaType {
 DWINGUID majortype;
 DWINGUID subtype;
  int bFixedSizeSamples;
  int bTemporalCompression;
  uint lSampleSize;
 DWINGUID formattype;
  IUnknown pUnk;
  uint cbFormat;
  ubyte* pbFormat;
}

struct __MIDL___MIDL_itf_h323msp_0001_0012 {
  ITTerminal pASRTerminal;
  int hrErrorCode;
}

struct __MIDL___MIDL_itf_h323msp_0001_0013 {
  ITTerminal pTTSTerminal;
  int hrErrorCode;
}

struct __MIDL___MIDL_itf_h323msp_0001_0014 {
  ITTerminal pToneTerminal;
  int hrErrorCode;
}

struct tagTAPI_STREAM_CONFIG_CAPS {
  tagStreamConfigCapsType CapsType;
  __MIDL___MIDL_itf_h323msp_0503_0001 __MIDL_0020;
}

struct _TAPI_VIDEO_STREAM_CONFIG_CAPS {
  ushort[256] Description;
  uint VideoStandard;
  tagSIZE InputSize;
  tagSIZE MinCroppingSize;
  tagSIZE MaxCroppingSize;
  int CropGranularityX;
  int CropGranularityY;
  int CropAlignX;
  int CropAlignY;
  tagSIZE MinOutputSize;
  tagSIZE MaxOutputSize;
  int OutputGranularityX;
  int OutputGranularityY;
  int StretchTapsX;
  int StretchTapsY;
  int ShrinkTapsX;
  int ShrinkTapsY;
  long MinFrameInterval;
  long MaxFrameInterval;
  int MinBitsPerSecond;
  int MaxBitsPerSecond;
}

struct tagSIZE {
  int cx;
  int cy;
}

struct _TAPI_AUDIO_STREAM_CONFIG_CAPS {
  ushort[256] Description;
  uint MinimumChannels;
  uint MaximumChannels;
  uint ChannelsGranularity;
  uint MinimumBitsPerSample;
  uint MaximumBitsPerSample;
  uint BitsPerSampleGranularity;
  uint MinimumSampleFrequency;
  uint MaximumSampleFrequency;
  uint SampleFrequencyGranularity;
  uint MinimumAvgBytesPerSec;
  uint MaximumAvgBytesPerSec;
  uint AvgBytesPerSecGranularity;
}

// Aliases

alias __MIDL___MIDL_itf_h323msp_0001_0005 MSP_EVENT_INFO;

alias __MIDL___MIDL_itf_h323msp_0001_0004 MSP_EVENT;

alias __MIDL___MIDL_itf_h323msp_0001_0001 MSP_ADDRESS_EVENT;

alias __MIDL___MIDL_itf_h323msp_0001_0002 MSP_CALL_EVENT;

alias __MIDL___MIDL_itf_h323msp_0001_0003 MSP_CALL_EVENT_CAUSE;

// Interfaces

// ITPluggableTerminalEventSink
interface ITPluggableTerminalEventSink : IUnknown {
  mixin(uuid("6e0887be-ba1a-492e-bd10-4020ec5e33e0"));
  // static DWINGUID IID = { 0x6e0887be, 0xba1a, 0x492e, 0xbd, 0x10, 0x40, 0x20, 0xec, 0x5e, 0x33, 0xe0 };
  /*[id(0x60010000)]*/ int FireEvent(MSP_EVENT_INFO* pMspEventInfo);
}

// TAPI 3.0 ITTerminal interface
interface ITTerminal : IDispatch {
  mixin(uuid("b1efc38a-9355-11d0-835c-00aa003ccabd"));
  // static DWINGUID IID = { 0xb1efc38a, 0x9355, 0x11d0, 0x83, 0x5c, 0x00, 0xaa, 0x00, 0x3c, 0xca, 0xbd };
  // property Name
  /*[id(0x00000001)]*/ int get_Name(out wchar* ppName);
  // property State
  /*[id(0x00000002)]*/ int get_State(out TERMINAL_STATE pTerminalState);
  // property TerminalType
  /*[id(0x00000003)]*/ int get_TerminalType(out TERMINAL_TYPE pType);
  // property TerminalClass
  /*[id(0x00000004)]*/ int get_TerminalClass(out wchar* ppTerminalClass);
  // property MediaType
  /*[id(0x00000005)]*/ int get_MediaType(out int plMediaType);
  // property Direction
  /*[id(0x00000006)]*/ int get_Direction(out TERMINAL_DIRECTION pDirection);
}

// ITStream interface
interface ITStream : IDispatch {
  mixin(uuid("ee3bd605-3868-11d2-a045-00c04fb6809f"));
  // static DWINGUID IID = { 0xee3bd605, 0x3868, 0x11d2, 0xa0, 0x45, 0x00, 0xc0, 0x4f, 0xb6, 0x80, 0x9f };
  // property MediaType
  /*[id(0x00000001)]*/ int get_MediaType(out int plMediaType);
  // property Direction
  /*[id(0x00000002)]*/ int get_Direction(out TERMINAL_DIRECTION pTD);
  // property Name
  /*[id(0x00000003)]*/ int get_Name(out wchar* ppName);
  // method StartStream
  /*[id(0x00000004)]*/ int StartStream();
  // method PauseStream
  /*[id(0x00000005)]*/ int PauseStream();
  // method StopStream
  /*[id(0x00000006)]*/ int StopStream();
  // method SelectTerminal
  /*[id(0x00000007)]*/ int SelectTerminal(ITTerminal pTerminal);
  // method UnselectTerminal
  /*[id(0x00000008)]*/ int UnselectTerminal(ITTerminal pTerminal);
  /*[id(0x00000009)]*/ int EnumerateTerminals(out IEnumTerminal ppEnumTerminal);
  // property Terminals
  /*[id(0x0000000A)]*/ int get_Terminals(out DWINVARIANT pTerminals);
}

// TAPI 3.0 IEnumTerminal Interface
interface IEnumTerminal : IUnknown {
  mixin(uuid("ae269cf4-935e-11d0-835c-00aa003ccabd"));
  // static DWINGUID IID = { 0xae269cf4, 0x935e, 0x11d0, 0x83, 0x5c, 0x00, 0xaa, 0x00, 0x3c, 0xca, 0xbd };
  /*[id(0x60010000)]*/ int Next(uint celt, out ITTerminal ppElements, ref uint pceltFetched);
  /*[id(0x60010001)]*/ int Reset();
  /*[id(0x60010002)]*/ int Skip(uint celt);
  /*[id(0x60010003)]*/ int Clone(out IEnumTerminal ppEnum);
}

// ITFileTrack Interface
interface ITFileTrack : IDispatch {
  mixin(uuid("31ca6ea9-c08a-4bea-8811-8e9c1ba3ea3a"));
  // static DWINGUID IID = { 0x31ca6ea9, 0xc08a, 0x4bea, 0x88, 0x11, 0x8e, 0x9c, 0x1b, 0xa3, 0xea, 0x3a };
  // property Format
  /*[id(0x00010001)]*/ int get_Format(out _AMMediaType ppmt);
  // property Format
  /*[id(0x00010001)]*/ int set_Format(_AMMediaType* ppmt);
  // property ControllingTerminal
  /*[id(0x00010002)]*/ int get_ControllingTerminal(out ITTerminal ppControllingTerminal);
  // property AudioFormatForScripting
  /*[id(0x00010003)]*/ int get_AudioFormatForScripting(out ITScriptableAudioFormat ppAudioFormat);
  // property AudioFormatForScripting
  /*[id(0x00010003)]*/ int set_AudioFormatForScripting(ITScriptableAudioFormat ppAudioFormat);
  // property EmptyAudioFormatForScripting
  /*[id(0x00010005)]*/ int get_EmptyAudioFormatForScripting(out ITScriptableAudioFormat ppAudioFormat);
}

// TAPI 3.0 ITScriptableAudioFormat Interface
interface ITScriptableAudioFormat : IDispatch {
  mixin(uuid("b87658bd-3c59-4f64-be74-aede3e86a81e"));
  // static DWINGUID IID = { 0xb87658bd, 0x3c59, 0x4f64, 0xbe, 0x74, 0xae, 0xde, 0x3e, 0x86, 0xa8, 0x1e };
  // property Channels
  /*[id(0x00000001)]*/ int get_Channels(out int pVal);
  // property Channels
  /*[id(0x00000001)]*/ int set_Channels(int pVal);
  // property SamplesPerSec
  /*[id(0x00000002)]*/ int get_SamplesPerSec(out int pVal);
  // property SamplesPerSec
  /*[id(0x00000002)]*/ int set_SamplesPerSec(int pVal);
  // property AvgBytesPerSec
  /*[id(0x00000003)]*/ int get_AvgBytesPerSec(out int pVal);
  // property AvgBytesPerSec
  /*[id(0x00000003)]*/ int set_AvgBytesPerSec(int pVal);
  // property BlockAlign
  /*[id(0x00000004)]*/ int get_BlockAlign(out int pVal);
  // property BlockAlign
  /*[id(0x00000004)]*/ int set_BlockAlign(int pVal);
  // property BitsPerSample
  /*[id(0x00000005)]*/ int get_BitsPerSample(out int pVal);
  // property BitsPerSample
  /*[id(0x00000005)]*/ int set_BitsPerSample(int pVal);
  // property FormatTag
  /*[id(0x00000006)]*/ int get_FormatTag(out int pVal);
  // property FormatTag
  /*[id(0x00000006)]*/ int set_FormatTag(int pVal);
}

// ITPluggableTerminalEventSinkRegistration
interface ITPluggableTerminalEventSinkRegistration : IUnknown {
  mixin(uuid("f7115709-a216-4957-a759-060ab32a90d1"));
  // static DWINGUID IID = { 0xf7115709, 0xa216, 0x4957, 0xa7, 0x59, 0x06, 0x0a, 0xb3, 0x2a, 0x90, 0xd1 };
  /*[id(0x60010000)]*/ int RegisterSink(ITPluggableTerminalEventSink pEventSink);
  /*[id(0x60010001)]*/ int UnregisterSink();
}

// ITMSPAddress Interface
interface ITMSPAddress : IUnknown {
  mixin(uuid("ee3bd600-3868-11d2-a045-00c04fb6809f"));
  // static DWINGUID IID = { 0xee3bd600, 0x3868, 0x11d2, 0xa0, 0x45, 0x00, 0xc0, 0x4f, 0xb6, 0x80, 0x9f };
  /*[id(0x60010000)]*/ int Initialize(int* hEvent);
  /*[id(0x60010001)]*/ int Shutdown();
  /*[id(0x60010002)]*/ int CreateMSPCall(int* hCall, uint dwReserved, uint dwMediaType, IUnknown pOuterUnknown, out IUnknown ppStreamControl);
  /*[id(0x60010003)]*/ int ShutdownMSPCall(IUnknown pStreamControl);
  /*[id(0x60010004)]*/ int ReceiveTSPData(IUnknown pMSPCall, ubyte* pBuffer, uint dwSize);
  /*[id(0x60010005)]*/ int GetEvent(ref uint pdwSize, ref ubyte pEventBuffer);
}

interface ITFormatControl : IUnknown {
  mixin(uuid("6c0ab6c1-21e3-11d3-a577-00c04f8ef6e3"));
  // static DWINGUID IID = { 0x6c0ab6c1, 0x21e3, 0x11d3, 0xa5, 0x77, 0x00, 0xc0, 0x4f, 0x8e, 0xf6, 0xe3 };
  /*[id(0x60010000)]*/ int GetCurrentFormat(out _AMMediaType ppMediaType);
  /*[id(0x60010001)]*/ int ReleaseFormat(_AMMediaType* pMediaType);
  /*[id(0x60010002)]*/ int GetNumberOfCapabilities(out uint pdwCount);
  /*[id(0x60010003)]*/ int GetStreamCaps(uint dwIndex, out _AMMediaType ppMediaType, out tagTAPI_STREAM_CONFIG_CAPS pStreamConfigCaps, out int pfEnabled);
  /*[id(0x60010004)]*/ int ReOrderCapabilities(uint* pdwIndices, int* pfEnabled, int* pfPublicize, uint dwNumIndices);
}

interface ITStreamQualityControl : IUnknown {
  mixin(uuid("6c0ab6c2-21e3-11d3-a577-00c04f8ef6e3"));
  // static DWINGUID IID = { 0x6c0ab6c2, 0x21e3, 0x11d3, 0xa5, 0x77, 0x00, 0xc0, 0x4f, 0x8e, 0xf6, 0xe3 };
  /*[id(0x60010000)]*/ int GetRange(tagStreamQualityProperty Property, out int plMin, out int plMax, out int plSteppingDelta, out int plDefault, out tagTAPIControlFlags plFlags);
  /*[id(0x60010001)]*/ int Get(tagStreamQualityProperty Property, out int plValue, out tagTAPIControlFlags plFlags);
  /*[id(0x60010002)]*/ int Set(tagStreamQualityProperty Property, int lValue, tagTAPIControlFlags lFlags);
}

interface ITCallQualityControl : IUnknown {
  mixin(uuid("fe1d8ae0-edc4-49b5-8f8c-4de40f9cdfaf"));
  // static DWINGUID IID = { 0xfe1d8ae0, 0xedc4, 0x49b5, 0x8f, 0x8c, 0x4d, 0xe4, 0x0f, 0x9c, 0xdf, 0xaf };
  /*[id(0x60010000)]*/ int GetRange(tagCallQualityProperty Property, out int plMin, out int plMax, out int plSteppingDelta, out int plDefault, out tagTAPIControlFlags plFlags);
  /*[id(0x60010001)]*/ int Get(tagCallQualityProperty Property, out int plValue, out tagTAPIControlFlags plFlags);
  /*[id(0x60010002)]*/ int Set(tagCallQualityProperty Property, int lValue, tagTAPIControlFlags lFlags);
}

interface ITAudioDeviceControl : IUnknown {
  mixin(uuid("6c0ab6c5-21e3-11d3-a577-00c04f8ef6e3"));
  // static DWINGUID IID = { 0x6c0ab6c5, 0x21e3, 0x11d3, 0xa5, 0x77, 0x00, 0xc0, 0x4f, 0x8e, 0xf6, 0xe3 };
  /*[id(0x60010000)]*/ int GetRange(tagAudioDeviceProperty Property, out int plMin, out int plMax, out int plSteppingDelta, out int plDefault, out tagTAPIControlFlags plFlags);
  /*[id(0x60010001)]*/ int Get(tagAudioDeviceProperty Property, out int plValue, out tagTAPIControlFlags plFlags);
  /*[id(0x60010002)]*/ int Set(tagAudioDeviceProperty Property, int lValue, tagTAPIControlFlags lFlags);
}

interface ITAudioSettings : IUnknown {
  mixin(uuid("6c0ab6c6-21e3-11d3-a577-00c04f8ef6e3"));
  // static DWINGUID IID = { 0x6c0ab6c6, 0x21e3, 0x11d3, 0xa5, 0x77, 0x00, 0xc0, 0x4f, 0x8e, 0xf6, 0xe3 };
  /*[id(0x60010000)]*/ int GetRange(tagAudioSettingsProperty Property, out int plMin, out int plMax, out int plSteppingDelta, out int plDefault, out tagTAPIControlFlags plFlags);
  /*[id(0x60010001)]*/ int Get(tagAudioSettingsProperty Property, out int plValue, out tagTAPIControlFlags plFlags);
  /*[id(0x60010002)]*/ int Set(tagAudioSettingsProperty Property, int lValue, tagTAPIControlFlags lFlags);
}

// ITQOSApplicationID interface
interface ITQOSApplicationID : IDispatch {
  mixin(uuid("e8c89d27-a3bd-47d5-a6fc-d2ae40cdbc6e"));
  // static DWINGUID IID = { 0xe8c89d27, 0xa3bd, 0x47d5, 0xa6, 0xfc, 0xd2, 0xae, 0x40, 0xcd, 0xbc, 0x6e };
  /*[id(0x60020000)]*/ int SetQOSApplicationID(wchar* pApplicationID, wchar* pApplicationGUID, wchar* pSubIDs);
}

interface IH323LineEx : IUnknown {
  mixin(uuid("44cf6a9d-cb40-4bbc-b2d3-b6aa93322c71"));
  // static DWINGUID IID = { 0x44cf6a9d, 0xcb40, 0x4bbc, 0xb2, 0xd3, 0xb6, 0xaa, 0x93, 0x32, 0x2c, 0x71 };
  /*[id(0x60010000)]*/ int SetExternalT120Address(int fEnable, uint dwIP, ushort wPort);
  /*[id(0x60010001)]*/ int SetDefaultCapabilityPreferrence(uint dwNumCaps, H245_CAPABILITY* pCapabilities, uint* pWeights);
  /*[id(0x60010002)]*/ int SetAlias(ushort* strAlias, uint dwLength);
}

interface IKeyFrameControl : IUnknown {
  mixin(uuid("c3341386-af91-4ef9-83b6-be3762e42ecb"));
  // static DWINGUID IID = { 0xc3341386, 0xaf91, 0x4ef9, 0x83, 0xb6, 0xbe, 0x37, 0x62, 0xe4, 0x2e, 0xcb };
  /*[id(0x60010000)]*/ int UpdatePicture();
  /*[id(0x60010001)]*/ int PeriodicUpdatePicture(int fEnable, uint dwInterval);
}
