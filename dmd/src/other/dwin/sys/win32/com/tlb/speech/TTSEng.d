// Sample TTS Engine 1.0 Type Library
// Version 1.0
//TTSEng.dll
//mixin(uuid("7192aa2f-f759-43e9-91e7-226371ef6b2f"));
//module samplettsenglib;
module dwin.sys.win32.com.tlb.speech.TTSEng;

/*[importlib("stdole2.tlb")]*/
private import dwin.sys.win32.com.Core;

// Enums

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

enum SPDATAKEYLOCATION {
  SPDKL_DefaultLocation = 0x00000000,
  SPDKL_CurrentUser = 0x00000001,
  SPDKL_LocalMachine = 0x00000002,
  SPDKL_CurrentConfig = 0x00000005,
}

// Unions

union __MIDL_IWinTypes_0009 {
  int hInproc;
  int hRemote;
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

struct _RemotableHandle {
  int fContext;
  __MIDL_IWinTypes_0009 u;
}

// Aliases

alias uint UINT_PTR;

alias int LONG_PTR;

alias _RemotableHandle* wireHWND;

// Interfaces

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

// ISpObjectWithToken Interface
interface ISpObjectWithToken : IUnknown {
  mixin(uuid("5b559f40-e952-11d2-bb91-00c04f8ee6c0"));
  //static DWINGUID IID = { 0x5b559f40, 0xe952, 0x11d2, 0xbb, 0x91, 0x00, 0xc0, 0x4f, 0x8e, 0xe6, 0xc0 };
  /*[id(0x60010000)]*/ int SetObjectToken(ISpObjectToken pToken);
  /*[id(0x60010001)]*/ int GetObjectToken(ISpObjectToken* ppToken);
}

// ISpObjectToken Interface
interface ISpObjectToken : ISpDataKey {
  mixin(uuid("14056589-e16c-11d2-bb90-00c04f8ee6c0"));
  //static DWINGUID IID = { 0x14056589, 0xe16c, 0x11d2, 0xbb, 0x90, 0x00, 0xc0, 0x4f, 0x8e, 0xe6, 0xc0 };
  /*[id(0x60020000)]*/ int SetId(ushort* pszCategoryId, ushort* pszTokenId, int fCreateIfNotExist);
  /*[id(0x60020001)]*/ int GetId(ushort** ppszCoMemTokenId);
  /*[id(0x60020002)]*/ int GetCategory(ISpObjectTokenCategory* ppTokenCategory);
  /*[id(0x60020003)]*/ int CreateInstance(IUnknown pUnkOuter, uint dwClsContext, ref DWINGUID riid, void**  ppvObject);
  /*[id(0x60020004)]*/ int GetStorageFileName(ref DWINGUID clsidCaller, ushort* pszValueName, ushort* pszFileNameSpecifier, uint nFolder, out ushort ppszFilePath);
  /*[id(0x60020005)]*/ int RemoveStorageFileName(ref DWINGUID clsidCaller, ushort* pszKeyName, int fDeleteFile);
  /*[id(0x60020006)]*/ int Remove(ref DWINGUID pclsidCaller);
  /*[id(0x60020007)]*/ int IsUISupported(ushort* pszTypeOfUI, void* pvExtraData, uint cbExtraData, IUnknown punkObject, out int pfSupported);
  /*[id(0x60020008)]*/ int DisplayUI(wireHWND hwndParent, ushort* pszTitle, ushort* pszTypeOfUI, void* pvExtraData, uint cbExtraData, IUnknown punkObject);
  /*[id(0x60020009)]*/ int MatchesAttributes(ushort* pszAttributes, out int pfMatches);
}

// ISpDataKey Interface
interface ISpDataKey : IUnknown {
  mixin(uuid("14056581-e16c-11d2-bb90-00c04f8ee6c0"));
  //static DWINGUID IID = { 0x14056581, 0xe16c, 0x11d2, 0xbb, 0x90, 0x00, 0xc0, 0x4f, 0x8e, 0xe6, 0xc0 };
  /*[id(0x60010000)]*/ int SetData(ushort* pszValueName, uint cbData, ubyte* pData);
  /*[id(0x60010001)]*/ int GetData(ushort* pszValueName, uint* pcbData, ubyte* pData);
  /*[id(0x60010002)]*/ int SetStringValue(ushort* pszValueName, ushort* pszValue);
  /*[id(0x60010003)]*/ int GetStringValue(ushort* pszValueName, ushort** ppszValue);
  /*[id(0x60010004)]*/ int SetDWORD(ushort* pszValueName, uint dwValue);
  /*[id(0x60010005)]*/ int GetDWORD(ushort* pszValueName, uint* pdwValue);
  /*[id(0x60010006)]*/ int OpenKey(ushort* pszSubKeyName, ISpDataKey* ppSubKey);
  /*[id(0x60010007)]*/ int CreateKey(ushort* pszSubKey, ISpDataKey* ppSubKey);
  /*[id(0x60010008)]*/ int DeleteKey(ushort* pszSubKey);
  /*[id(0x60010009)]*/ int DeleteValue(ushort* pszValueName);
  /*[id(0x6001000A)]*/ int EnumKeys(uint Index, ushort** ppszSubKeyName);
  /*[id(0x6001000B)]*/ int EnumValues(uint Index, ushort** ppszValueName);
}

// ISpObjectTokenCategory
interface ISpObjectTokenCategory : ISpDataKey {
  mixin(uuid("2d3d3845-39af-4850-bbf9-40b49780011d"));
  //static DWINGUID IID = { 0x2d3d3845, 0x39af, 0x4850, 0xbb, 0xf9, 0x40, 0xb4, 0x97, 0x80, 0x01, 0x1d };
  /*[id(0x60020000)]*/ int SetId(ushort* pszCategoryId, int fCreateIfNotExist);
  /*[id(0x60020001)]*/ int GetId(out ushort ppszCoMemCategoryId);
  /*[id(0x60020002)]*/ int GetDataKey(SPDATAKEYLOCATION spdkl, ISpDataKey* ppDataKey);
  /*[id(0x60020003)]*/ int EnumTokens(wchar* pzsReqAttribs, wchar* pszOptAttribs, out IEnumSpObjectTokens ppEnum);
  /*[id(0x60020004)]*/ int SetDefaultTokenId(ushort* pszTokenId);
  /*[id(0x60020005)]*/ int GetDefaultTokenId(out ushort ppszCoMemTokenId);
}

// IEnumSpObjectTokens Interface
interface IEnumSpObjectTokens : IUnknown {
  mixin(uuid("06b64f9e-7fda-11d2-b4f2-00c04f797396"));
  //static DWINGUID IID = { 0x06b64f9e, 0x7fda, 0x11d2, 0xb4, 0xf2, 0x00, 0xc0, 0x4f, 0x79, 0x73, 0x96 };
  /*[id(0x60010000)]*/ int Next(uint celt, out ISpObjectToken pelt, out uint pceltFetched);
  /*[id(0x60010001)]*/ int Skip(uint celt);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IEnumSpObjectTokens ppEnum);
  /*[id(0x60010004)]*/ int Item(uint Index, out ISpObjectToken ppToken);
  /*[id(0x60010005)]*/ int GetCount(out uint pCount);
}

// CoClasses

// SampleTTSEngine Class
abstract class SampleTTSEngine {
  mixin(uuid("a832755e-9c2a-40b4-89b2-3a92ee705852"));
  //static DWINGUID CLSID = { 0xa832755e, 0x9c2a, 0x40b4, 0x89, 0xb2, 0x3a, 0x92, 0xee, 0x70, 0x58, 0x52 };
  mixin Interfaces!(ISpTTSEngine, ISpObjectWithToken);
}
