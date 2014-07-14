// MS TTS Engine 1.0 Type Library
// Version 1.0

//mixin(uuid("3f7c4d29-d007-11d2-b503-00c04f797396"));
//C:\Program Files\Common Files\SpeechEngines\Microsoft\TTS\1033\spttseng.dll
module dwin.sys.win32.com.tlb.speech.spttseng;
//module msttsenginelib;

/*[importlib("stdole2.tlb")]*/
private import dwin.sys.win32.com.Core;

// Enums

enum REVERBTYPE {
  REVERB_TYPE_OFF = 0x00000000,
  REVERB_TYPE_BATHTUB = 0x00000001,
  REVERB_TYPE_ROOM = 0x00000002,
  REVERB_TYPE_HALL = 0x00000003,
  REVERB_TYPE_CHURCH = 0x00000004,
  REVERB_TYPE_STADIUM = 0x00000005,
  REVERB_TYPE_ECHO = 0x00000006,
  REVERB_TYPE_ROBOSEQ = 0x00000007,
}

enum SPVACTIONS {
  SPVA_Speak = 0x00000000,
  SPVA_Silence = 0x00000001,
  SPVA_Pronounce = 0x00000002,
  SPVA_Bookmark = 0x00000003,
  SPVA_SpellOut = 0x00000004,
  SPVA_Section = 0x00000005,
  SPVA_ParseUnknownTag = 0x00000006,
}

enum SPPARTOFSPEECH {
  SPPS_NotOverriden = 0xFFFFFFFF,
  SPPS_Unknown = 0x00000000,
  SPPS_Noun = 0x00001000,
  SPPS_Verb = 0x00002000,
  SPPS_Modifier = 0x00003000,
  SPPS_Function = 0x00004000,
  SPPS_Interjection = 0x00005000,
}

enum SPVSKIPTYPE {
  SPVST_SENTENCE = 0x00000001,
}

// Structs
struct WAVEFORMATEX {
  ushort wFormatTag;
  ushort nChannels;
  uint nSamplesPerSec;
  uint nAvgBytesPerSec;
  ushort nBlockAlign;
  ushort wBitsPerSample;
  ushort cbSize;
}

struct MSVOICEINFO {
  //WAVEFORMATEX WAVEFORMATEX;
  WAVEFORMATEX pcmWaveFormat;
  uint LangID;
  uint Rate;
  uint Pitch;
  REVERBTYPE eReverbType;
  uint ProsodyGain;
  uint NumOfTaps;
  float[8] TapCoefficients;
  float VibratoFreq;
  uint VibratoDepth;
  uint SampleRate;
  uint LPCOrder;
  uint FFTSize;
  float* pWindow;
}



struct UNIT_CVT {
  uint PhonID;
  uint flags;
  uint UnitID;
  uint SenoneID;
  float Dur;
  float Amp;
  float AmpRatio;
  ubyte[15] szUnitName;
}

struct MSUNITDATA {
  uint cNumEpochs;
  uint cNumSamples;
  uint cOrder;
  float* pEpoch;
  float* pLPC;
  float* pRes;
  float* pGain;
}

struct SPVTEXTFRAG {
  SPVTEXTFRAG* pNext;
  SPVSTATE State;
  wchar* pTextStart;
  uint ulTextLen;
  uint ulTextSrcOffset;
}

struct SPVSTATE {
  SPVACTIONS eAction;
  ushort LangID;
  ushort wReserved;
  int EmphAdj;
  int RateAdj;
  uint Volume;
  SPVPITCH PitchAdj;
  uint SilenceMSecs;
  ushort* pPhoneIds;
  SPPARTOFSPEECH ePartOfSpeech;
  SPVCONTEXT Context;
}

struct SPVPITCH {
  int MiddleAdj;
  int RangeAdj;
}

struct SPVCONTEXT {
  wchar* pCategory;
  wchar* pBefore;
  wchar* pAfter;
}

struct SPEVENT {
  ushort eEventId;
  ushort elParamType;
  uint ulStreamNum;
  ulong ullAudioStreamOffset;
  UINT_PTR wParam;
  LONG_PTR lParam;
}

// Aliases

alias uint UINT_PTR;

alias int LONG_PTR;

// Interfaces

// IMSVoiceData Interface
interface IMSVoiceData : IUnknown {
  mixin(uuid("6265b7e1-0340-11d3-b50c-00c04f797396"));
  //static DWINGUID IID = { 0x6265b7e1, 0x0340, 0x11d3, 0xb5, 0x0c, 0x00, 0xc0, 0x4f, 0x79, 0x73, 0x96 };
  /*[id(0x60010000)]*/ int GetVoiceInfo(out MSVOICEINFO pVoiceInfo);
  /*[id(0x60010001)]*/ int GetUnitIDs(ref UNIT_CVT pUnits, uint cUnits);
  /*[id(0x60010002)]*/ int GetUnitData(uint UnitID, out MSUNITDATA pUnitData);
  /*[id(0x60010003)]*/ int AlloToUnit(short allo, int attributes, out int pUnitID);
}

// ISpTTSEngine Interface
interface ISpTTSEngine : IUnknown {
  mixin(uuid("a74d7c8e-4cc5-4f2f-a6eb-804dee18500e"));
  //static DWINGUID IID = { 0xa74d7c8e, 0x4cc5, 0x4f2f, 0xa6, 0xeb, 0x80, 0x4d, 0xee, 0x18, 0x50, 0x0e };
  /*[id(0x60010000)]*/ int Speak(uint dwSpeakFlags, ref DWINGUID rguidFormatId, WAVEFORMATEX* pWaveFormatEx, SPVTEXTFRAG* pTextFragList, ISpTTSEngineSite pOutputSite);
  /*[id(0x60010001)]*/ int GetOutputFormat(ref DWINGUID pTargetFmtId, WAVEFORMATEX* pTargetWaveFormatEx, out DWINGUID pOutputFormatId, out WAVEFORMATEX ppCoMemOutputWaveFormatEx);
}

// ISpTTSEngineSite Interface
interface ISpTTSEngineSite : ISpEventSink {
  mixin(uuid("9880499b-cce9-11d2-b503-00c04f797396"));
  //static DWINGUID IID = { 0x9880499b, 0xcce9, 0x11d2, 0xb5, 0x03, 0x00, 0xc0, 0x4f, 0x79, 0x73, 0x96 };
  /*[id(0x60020000)]*/ uint GetActions();
  /*[id(0x60020001)]*/ int Write(void* pBuff, uint cb, out uint pcbWritten);
  /*[id(0x60020002)]*/ int GetRate(out int pRateAdjust);
  /*[id(0x60020003)]*/ int GetVolume(out ushort pusVolume);
  /*[id(0x60020004)]*/ int GetSkipInfo(out SPVSKIPTYPE peType, out int plNumItems);
  /*[id(0x60020005)]*/ int CompleteSkip(int ulNumSkipped);
}

// ISpEventSink Interface
interface ISpEventSink : IUnknown {
  mixin(uuid("be7a9cc9-5f9e-11d2-960f-00c04f8ee628"));
  //static DWINGUID IID = { 0xbe7a9cc9, 0x5f9e, 0x11d2, 0x96, 0x0f, 0x00, 0xc0, 0x4f, 0x8e, 0xe6, 0x28 };
  /*[id(0x60010000)]*/ int AddEvents(SPEVENT* pEventArray, uint ulCount);
  /*[id(0x60010001)]*/ int GetEventInterest(out ulong pullEventInterest);
}

// IMSTTSEngineInit Interface
interface IMSTTSEngineInit : IUnknown {
  mixin(uuid("8a7c38eb-d8b0-11d2-b504-00c04f797396"));
  //static DWINGUID IID = { 0x8a7c38eb, 0xd8b0, 0x11d2, 0xb5, 0x04, 0x00, 0xc0, 0x4f, 0x79, 0x73, 0x96 };
  /*[id(0x60010000)]*/ int VoiceInit(IMSVoiceData pVoiceData);
}

// CoClasses

// MSVoiceData Class
abstract class MSVoiceData {
  mixin(uuid("65dbddef-0725-11d3-b50c-00c04f797396"));
  //static DWINGUID CLSID = { 0x65dbddef, 0x0725, 0x11d3, 0xb5, 0x0c, 0x00, 0xc0, 0x4f, 0x79, 0x73, 0x96 };
  mixin Interfaces!(IMSVoiceData);
}

// MSTTSEngine Class
abstract class MSTTSEngine {
  mixin(uuid("b93ae09f-d033-11d2-b503-00c04f797396"));
  //static DWINGUID CLSID = { 0xb93ae09f, 0xd033, 0x11d2, 0xb5, 0x03, 0x00, 0xc0, 0x4f, 0x79, 0x73, 0x96 };
  mixin Interfaces!(ISpTTSEngine, IMSTTSEngineInit);
}
