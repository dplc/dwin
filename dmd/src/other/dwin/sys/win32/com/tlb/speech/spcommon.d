// Microsoft LTScommon Object Library
// Version 1.0

//mixin(uuid("9153ce57-f693-4a8e-8b7c-29c8486566d0"));
//module ltscommlib;
//C:\Program Files\Common Files\SpeechEngines\Microsoft\spcommon.dll
module dwin.sys.win32.com.tlb.speech.spcommon;

/*[importlib("stdole2.tlb")]*/
private import dwin.sys.win32.com.Core;

// Enums

enum SPLEXICONTYPE {
  eLEXTYPE_USER = 0x00000001,
  eLEXTYPE_APP = 0x00000002,
  eLEXTYPE_RESERVED1 = 0x00000004,
  eLEXTYPE_RESERVED2 = 0x00000008,
  eLEXTYPE_RESERVED3 = 0x00000010,
  eLEXTYPE_RESERVED4 = 0x00000020,
  eLEXTYPE_RESERVED5 = 0x00000040,
  eLEXTYPE_RESERVED6 = 0x00000080,
  eLEXTYPE_RESERVED7 = 0x00000100,
  eLEXTYPE_RESERVED8 = 0x00000200,
  eLEXTYPE_RESERVED9 = 0x00000400,
  eLEXTYPE_RESERVED10 = 0x00000800,
  eLEXTYPE_PRIVATE1 = 0x00001000,
  eLEXTYPE_PRIVATE2 = 0x00002000,
  eLEXTYPE_PRIVATE3 = 0x00004000,
  eLEXTYPE_PRIVATE4 = 0x00008000,
  eLEXTYPE_PRIVATE5 = 0x00010000,
  eLEXTYPE_PRIVATE6 = 0x00020000,
  eLEXTYPE_PRIVATE7 = 0x00040000,
  eLEXTYPE_PRIVATE8 = 0x00080000,
  eLEXTYPE_PRIVATE9 = 0x00100000,
  eLEXTYPE_PRIVATE10 = 0x00200000,
  eLEXTYPE_PRIVATE11 = 0x00400000,
  eLEXTYPE_PRIVATE12 = 0x00800000,
  eLEXTYPE_PRIVATE13 = 0x01000000,
  eLEXTYPE_PRIVATE14 = 0x02000000,
  eLEXTYPE_PRIVATE15 = 0x04000000,
  eLEXTYPE_PRIVATE16 = 0x08000000,
  eLEXTYPE_PRIVATE17 = 0x10000000,
  eLEXTYPE_PRIVATE18 = 0x20000000,
  eLEXTYPE_PRIVATE19 = 0x40000000,
  eLEXTYPE_PRIVATE20 = 0x80000000,
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

enum SPWORDTYPE {
  eWORDTYPE_ADDED = 0x00000001,
  eWORDTYPE_DELETED = 0x00000002,
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

struct SPWORDPRONUNCIATIONLIST {
  uint ulSize;
  ubyte* pvBuffer;
  SPWORDPRONUNCIATION* pFirstWordPronunciation;
}

struct SPWORDPRONUNCIATION {
  SPWORDPRONUNCIATION* pNextWordPronunciation;
  SPLEXICONTYPE eLexiconType;
  ushort LangID;
  ushort wReserved;
  SPPARTOFSPEECH ePartOfSpeech;
  ushort[1] szPronunciation;
}

struct SPWORDLIST {
  uint ulSize;
  ubyte* pvBuffer;
  SPWORD* pFirstWord;
}

struct SPWORD {
  SPWORD* pNextWord;
  ushort LangID;
  ushort wReserved;
  SPWORDTYPE eWordType;
  ushort* pszWord;
  SPWORDPRONUNCIATION* pFirstWordPronunciation;
}

struct _RemotableHandle {
  int fContext;
  __MIDL_IWinTypes_0009 u;
}

// Aliases

alias _RemotableHandle* wireHWND;

// Interfaces

// ISpLexicon Interface
interface ISpLexicon : IUnknown {
  mixin(uuid("da41a7c2-5383-4db2-916b-6c1719e3db58"));
  //static DWINGUID IID = { 0xda41a7c2, 0x5383, 0x4db2, 0x91, 0x6b, 0x6c, 0x17, 0x19, 0xe3, 0xdb, 0x58 };
  /*[id(0x60010000)]*/ int GetPronunciations(ushort* pszWord, ushort LangID, uint dwFlags, ref SPWORDPRONUNCIATIONLIST pWordPronunciationList);
  /*[id(0x60010001)]*/ int AddPronunciation(ushort* pszWord, ushort LangID, SPPARTOFSPEECH ePartOfSpeech, ushort* pszPronunciation);
  /*[id(0x60010002)]*/ int RemovePronunciation(ushort* pszWord, ushort LangID, SPPARTOFSPEECH ePartOfSpeech, ushort* pszPronunciation);
  /*[id(0x60010003)]*/ int GetGeneration(uint* pdwGeneration);
  /*[id(0x60010004)]*/ int GetGenerationChange(uint dwFlags, ref uint pdwGeneration, ref SPWORDLIST pWordList);
  /*[id(0x60010005)]*/ int GetWords(uint dwFlags, ref uint pdwGeneration, ref uint pdwCookie, ref SPWORDLIST pWordList);
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

// SpLTSLexicon Class
abstract class SpLTSLexicon {
  mixin(uuid("685879ba-3263-11d3-9c26-00c04f8ef87c"));
  //static DWINGUID CLSID = { 0x685879ba, 0x3263, 0x11d3, 0x9c, 0x26, 0x00, 0xc0, 0x4f, 0x8e, 0xf8, 0x7c };
  mixin Interfaces!(ISpLexicon, ISpObjectWithToken);
}
