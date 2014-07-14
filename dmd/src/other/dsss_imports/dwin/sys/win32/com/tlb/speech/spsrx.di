// msasrx 1.0 Type Library
// Version 1.0
//C:\Program Files\Common Files\SpeechEngines\Microsoft\SR\spsrx.dll
//mixin(uuid("1a6f5c25-45f4-11d3-9a67-00c04f8ef48f"));
//module msasrxlib;
module dwin.sys.win32.com.tlb.speech.spsrx;

/*[importlib("stdole2.tlb")]*/
private import dwin.sys.win32.com.Core;

// Enums

enum MSAM_GENDER {
  MSAM_GENDER_UNKNOWN = 0x00000000,
  MSAM_GENDER_FEMALE = 0x00000001,
  MSAM_GENDER_MALE = 0x00000002,
}

enum MSAM_AGE {
  MSAM_AGE_UNKNOWN = 0x00000000,
  MSAM_AGE_CHILD = 0x00000001,
  MSAM_AGE_ADULT = 0x00000002,
}

enum __MIDL___MIDL_itf_msasrx_0366_0001 {
  SPSRXUP_TEMP_REJECTION_THRESHOLD = 0x00000000,
  SPSRXUP_REJECTION_THRESHOLD = 0x00000001,
  SPSRXUP_ACCURACY = 0x00000002,
  SPSRXUP_BACKGROUND_ADAPTATION = 0x00000003,
  SPSRXUP_ADAPT_IN_FOREGROUND = 0x00000004,
  SPSRXUP_BA_COLLECT_ONLY = 0x00000005,
}

enum SPDATAKEYLOCATION {
  SPDKL_DefaultLocation = 0x00000000,
  SPDKL_CurrentUser = 0x00000001,
  SPDKL_LocalMachine = 0x00000002,
  SPDKL_CurrentConfig = 0x00000005,
}

enum SPRECOSTATE {
  SPRST_INACTIVE = 0x00000000,
  SPRST_ACTIVE = 0x00000001,
  SPRST_ACTIVE_ALWAYS = 0x00000002,
  SPRST_INACTIVE_WITH_PURGE = 0x00000003,
  SPRST_NUM_STATES = 0x00000004,
}

enum _SPAUDIOSTATE {
  SPAS_CLOSED = 0x00000000,
  SPAS_STOP = 0x00000001,
  SPAS_PAUSE = 0x00000002,
  SPAS_RUN = 0x00000003,
}

enum SPWAVEFORMATTYPE {
  SPWF_INPUT = 0x00000000,
  SPWF_SRENGINE = 0x00000001,
}

enum SPGRAMMARWORDTYPE {
  SPWT_DISPLAY = 0x00000000,
  SPWT_LEXICAL = 0x00000001,
  SPWT_PRONUNCIATION = 0x00000002,
}

enum SPLOADOPTIONS {
  SPLO_STATIC = 0x00000000,
  SPLO_DYNAMIC = 0x00000001,
}

enum SPRULESTATE {
  SPRS_INACTIVE = 0x00000000,
  SPRS_ACTIVE = 0x00000001,
  SPRS_ACTIVE_WITH_AUTO_PAUSE = 0x00000003,
}

enum SPWORDPRONOUNCEABLE {
  SPWP_UNKNOWN_WORD_UNPRONOUNCEABLE = 0x00000000,
  SPWP_UNKNOWN_WORD_PRONOUNCEABLE = 0x00000001,
  SPWP_KNOWN_WORD_PRONOUNCEABLE = 0x00000002,
}

enum SPGRAMMARSTATE {
  SPGS_DISABLED = 0x00000000,
  SPGS_ENABLED = 0x00000001,
  SPGS_EXCLUSIVE = 0x00000003,
}

enum SPINTERFERENCE {
  SPINTERFERENCE_NONE = 0x00000000,
  SPINTERFERENCE_NOISE = 0x00000001,
  SPINTERFERENCE_NOSIGNAL = 0x00000002,
  SPINTERFERENCE_TOOLOUD = 0x00000003,
  SPINTERFERENCE_TOOQUIET = 0x00000004,
  SPINTERFERENCE_TOOFAST = 0x00000005,
  SPINTERFERENCE_TOOSLOW = 0x00000006,
}

enum SPAUDIOOPTIONS {
  SPAO_NONE = 0x00000000,
  SPAO_RETAIN_AUDIO = 0x00000001,
}

enum SPBOOKMARKOPTIONS {
  SPBO_NONE = 0x00000000,
  SPBO_PAUSE = 0x00000001,
}

enum SPVISEMES {
  SP_VISEME_0 = 0x00000000,
  SP_VISEME_1 = 0x00000001,
  SP_VISEME_2 = 0x00000002,
  SP_VISEME_3 = 0x00000003,
  SP_VISEME_4 = 0x00000004,
  SP_VISEME_5 = 0x00000005,
  SP_VISEME_6 = 0x00000006,
  SP_VISEME_7 = 0x00000007,
  SP_VISEME_8 = 0x00000008,
  SP_VISEME_9 = 0x00000009,
  SP_VISEME_10 = 0x0000000A,
  SP_VISEME_11 = 0x0000000B,
  SP_VISEME_12 = 0x0000000C,
  SP_VISEME_13 = 0x0000000D,
  SP_VISEME_14 = 0x0000000E,
  SP_VISEME_15 = 0x0000000F,
  SP_VISEME_16 = 0x00000010,
  SP_VISEME_17 = 0x00000011,
  SP_VISEME_18 = 0x00000012,
  SP_VISEME_19 = 0x00000013,
  SP_VISEME_20 = 0x00000014,
  SP_VISEME_21 = 0x00000015,
}

enum SPVPRIORITY {
  SPVPRI_NORMAL = 0x00000000,
  SPVPRI_ALERT = 0x00000001,
  SPVPRI_OVER = 0x00000002,
}

enum SPEVENTENUM {
  SPEI_UNDEFINED = 0x00000000,
  SPEI_START_INPUT_STREAM = 0x00000001,
  SPEI_END_INPUT_STREAM = 0x00000002,
  SPEI_VOICE_CHANGE = 0x00000003,
  SPEI_TTS_BOOKMARK = 0x00000004,
  SPEI_WORD_BOUNDARY = 0x00000005,
  SPEI_PHONEME = 0x00000006,
  SPEI_SENTENCE_BOUNDARY = 0x00000007,
  SPEI_VISEME = 0x00000008,
  SPEI_TTS_AUDIO_LEVEL = 0x00000009,
  SPEI_TTS_PRIVATE = 0x0000000F,
  SPEI_MIN_TTS = 0x00000001,
  SPEI_MAX_TTS = 0x0000000F,
  SPEI_END_SR_STREAM = 0x00000022,
  SPEI_SOUND_START = 0x00000023,
  SPEI_SOUND_END = 0x00000024,
  SPEI_PHRASE_START = 0x00000025,
  SPEI_RECOGNITION = 0x00000026,
  SPEI_HYPOTHESIS = 0x00000027,
  SPEI_SR_BOOKMARK = 0x00000028,
  SPEI_PROPERTY_NUM_CHANGE = 0x00000029,
  SPEI_PROPERTY_STRING_CHANGE = 0x0000002A,
  SPEI_FALSE_RECOGNITION = 0x0000002B,
  SPEI_INTERFERENCE = 0x0000002C,
  SPEI_REQUEST_UI = 0x0000002D,
  SPEI_RECO_STATE_CHANGE = 0x0000002E,
  SPEI_ADAPTATION = 0x0000002F,
  SPEI_START_SR_STREAM = 0x00000030,
  SPEI_RECO_OTHER_CONTEXT = 0x00000031,
  SPEI_SR_AUDIO_LEVEL = 0x00000032,
  SPEI_SR_PRIVATE = 0x00000034,
  SPEI_MIN_SR = 0x00000022,
  SPEI_MAX_SR = 0x00000034,
  SPEI_RESERVED1 = 0x0000001E,
  SPEI_RESERVED2 = 0x00000021,
  SPEI_RESERVED3 = 0x0000003F,
}

enum SPCONTEXTSTATE {
  SPCS_DISABLED = 0x00000000,
  SPCS_ENABLED = 0x00000001,
}

// Unions

union __MIDL_IWinTypes_0009 {
  int hInproc;
  int hRemote;
}

// Structs

struct ACOUSTICMODELHEADER_5 {
  DWINGUID guidMagic;
  DWINGUID guidModelId;
  uint dwSampleRates;
  uint lcid;
  MSAM_GENDER Gender;
  MSAM_AGE AgeClass;
  uint dwFlags;
  float flAdaptFrameCount;
  uint dwNumArticlesTrained;
  uint dwRejectionThreshold;
  DWINGUID guidCurrentArticle;
}

struct _RemotableHandle {
  int fContext;
  __MIDL_IWinTypes_0009 u;
}

struct tagAMSCORE {
  uint dwWordId;
  uint dwAcousticScore;
}

struct tagSPPHRASEALTREQUEST {
  uint ulStartElement;
  uint cElements;
  uint ulRequestAltCount;
  void* pvResultExtra;
  uint cbResultExtra;
  ISpPhrase pPhrase;
  ISpRecoContext pRecoContext;
}

struct SPPHRASE {
  uint cbSize;
  ushort LangID;
  ushort wReserved;
  ulong ullGrammarID;
  ulong ftStartTime;
  ulong ullAudioStreamPosition;
  uint ulAudioSizeBytes;
  uint ulRetainedSizeBytes;
  uint ulAudioSizeTime;
  SPPHRASERULE Rule;
  SPPHRASEPROPERTY* pProperties;
  SPPHRASEELEMENT* pElements;
  uint cReplacements;
  SPPHRASEREPLACEMENT* pReplacements;
  DWINGUID SREngineID;
  uint ulSREnginePrivateDataSize;
  ubyte* pSREnginePrivateData;
}

struct SPPHRASERULE {
  ushort* pszName;
  uint ulId;
  uint ulFirstElement;
  uint ulCountOfElements;
  SPPHRASERULE* pNextSibling;
  SPPHRASERULE* pFirstChild;
  float SREngineConfidence;
  byte Confidence;
}

struct SPPHRASEPROPERTY {
  ushort* pszName;
  uint ulId;
  ushort* pszValue;
  DWINVARIANT vValue;
  uint ulFirstElement;
  uint ulCountOfElements;
  SPPHRASEPROPERTY* pNextSibling;
  SPPHRASEPROPERTY* pFirstChild;
  float SREngineConfidence;
  byte Confidence;
}

struct SPPHRASEELEMENT {
  uint ulAudioTimeOffset;
  uint ulAudioSizeTime;
  uint ulAudioStreamOffset;
  uint ulAudioSizeBytes;
  uint ulRetainedStreamOffset;
  uint ulRetainedSizeBytes;
  ushort* pszDisplayText;
  ushort* pszLexicalForm;
  ushort* pszPronunciation;
  ubyte bDisplayAttributes;
  byte RequiredConfidence;
  byte ActualConfidence;
  ubyte Reserved;
  float SREngineConfidence;
}

struct SPPHRASEREPLACEMENT {
  ubyte bDisplayAttributes;
  ushort* pszReplacementText;
  uint ulFirstElement;
  uint ulCountOfElements;
}

struct SPSERIALIZEDPHRASE {
  uint ulSerializedSize;
}

struct SPEVENT {
  ushort eEventId;
  ushort elParamType;
  uint ulStreamNum;
  ulong ullAudioStreamOffset;
  UINT_PTR wParam;
  LONG_PTR lParam;
}

struct SPEVENTSOURCEINFO {
  ulong ullEventInterest;
  ulong ullQueuedInterest;
  uint ulCount;
}

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
  DWINGUID clsid;
  uint grfStateBits;
  uint Reserved;
}

struct _FILETIME {
  uint dwLowDateTime;
  uint dwHighDateTime;
}

struct WAVEFORMATEX {
  ushort wFormatTag;
  ushort nChannels;
  uint nSamplesPerSec;
  uint nAvgBytesPerSec;
  ushort nBlockAlign;
  ushort wBitsPerSample;
  ushort cbSize;
}

struct SPRECOGNIZERSTATUS {
  SPAUDIOSTATUS AudioStatus;
  ulong ullRecognitionStreamPos;
  uint ulStreamNumber;
  uint ulNumActive;
  DWINGUID clsidEngine;
  uint cLangIDs;
  ushort[20] aLangID;
  uint dwReserved1;
  uint dwReserved2;
}

struct SPAUDIOSTATUS {
  int cbFreeBuffSpace;
  uint cbNonBlockingIO;
  SPAUDIOSTATE State;
  ulong CurSeekPos;
  ulong CurDevicePos;
  uint dwReserved1;
  uint dwReserved2;
}

struct tagSPPROPERTYINFO {
  ushort* pszName;
  uint ulId;
  ushort* pszValue;
  DWINVARIANT vValue;
}

struct SPBINARYGRAMMAR {
  uint ulTotalSerializedSize;
}

struct tagSPTEXTSELECTIONINFO {
  uint ulStartActiveOffset;
  uint cchActiveChars;
  uint ulStartSelection;
  uint cchSelection;
}

struct SPRECOCONTEXTSTATUS {
  SPINTERFERENCE eInterference;
  ushort[255] szRequestTypeOfUI;
  uint dwReserved1;
  uint dwReserved2;
}

struct SPSERIALIZEDRESULT {
  uint ulSerializedSize;
}

struct SPRECORESULTTIMES {
  _FILETIME ftStreamTime;
  ulong ullLength;
  uint dwTickCount;
  ulong ullStart;
}

struct SPVOICESTATUS {
  uint ulCurrentStream;
  uint ulLastStreamQueued;
  int hrLastResult;
  uint dwRunningState;
  uint ulInputWordPos;
  uint ulInputWordLen;
  uint ulInputSentPos;
  uint ulInputSentLen;
  int lBookmarkId;
  ushort PhonemeId;
  SPVISEMES VisemeId;
  uint dwReserved1;
  uint dwReserved2;
}

struct tagSPPHRASEALT {
  ISpPhraseBuilder pPhrase;
  uint ulStartElementInParent;
  uint cElementsInParent;
  uint cElementsInAlternate;
  void* pvAltExtra;
  uint cbAltExtra;
}

// Aliases

alias __MIDL___MIDL_itf_msasrx_0366_0001 SPSRX_USER_PARAM;

alias _RemotableHandle* wireHWND;

alias uint UINT_PTR;

alias int LONG_PTR;

alias _SPAUDIOSTATE SPAUDIOSTATE;

alias SPWAVEFORMATTYPE SPSTREAMFORMATTYPE;

alias tagSPPROPERTYINFO SPPROPERTYINFO;

alias tagSPTEXTSELECTIONINFO SPTEXTSELECTIONINFO;

// Interfaces

// IMsasrRecoExt Interface
interface IMsasrRecoExt : IUnknown {
  mixin(uuid("9b8af5ff-d8db-49d8-a5fd-fa7e0fd86bb1"));
  //static DWINGUID IID = { 0x9b8af5ff, 0xd8db, 0x49d8, 0xa5, 0xfd, 0xfa, 0x7e, 0x0f, 0xd8, 0x6b, 0xb1 };
  /*[id(0x60010000)]*/ int GetAcousticModelInfo(out ACOUSTICMODELHEADER_5 pAcousticModelInfo);
  /*[id(0x60010001)]*/ int SetAcousticModelInfo(ACOUSTICMODELHEADER_5* pAcousticModelInfo);
  /*[id(0x60010002)]*/ int GetProfileInfo(out MSAM_AGE pAge, out MSAM_GENDER pGender);
  /*[id(0x60010003)]*/ int SetProfileInfo(MSAM_AGE Age, MSAM_GENDER Gender);
  /*[id(0x60010004)]*/ int GetProfileParameter(SPSRX_USER_PARAM param, out uint pdwValue);
  /*[id(0x60010005)]*/ int SetProfileParameter(SPSRX_USER_PARAM param, uint dwValue);
  /*[id(0x60010006)]*/ int GetProfileName(out ushort pszSpeechUserName);
  /*[id(0x60010007)]*/ int LoadAcousticModel(MSAM_AGE Age, MSAM_GENDER Gender);
  /*[id(0x60010008)]*/ int SkipNextTrainingWord();
  /*[id(0x60010009)]*/ int EnterAdaptationDatasetCollectionMode();
  /*[id(0x6001000A)]*/ int LeaveAdaptationDatasetCollectionMode();
  /*[id(0x6001000B)]*/ int DiscardAdaptationDataSet();
  /*[id(0x6001000C)]*/ int ProcessAdaptationDataSet(wireHWND hWnd, uint uMessage);
  /*[id(0x6001000D)]*/ int AccumulateTranscriptedWaveFile(out ushort pszWavFile);
  /*[id(0x6001000E)]*/ int ResetEngine();
  /*[id(0x6001000F)]*/ int GetModelPathName(out ushort pszModelPathName);
  /*[id(0x60010010)]*/ int GetProfileAcousticPathName(out ushort ppsz);
  /*[id(0x60010011)]*/ int GetProfileID(out ushort ppsz);
  /*[id(0x60010012)]*/ int GetLanguageModel(ushort* pwchModelKey, out uint pdwLMCookie);
  /*[id(0x60010013)]*/ int ReleaseLanguageModel(uint dwLMCookie);
  /*[id(0x60010014)]*/ int GetLanguageIdFromWord(uint dwLMCookie, ushort* pszEngineWord, ref uint pwid);
  /*[id(0x60010015)]*/ int GetLanguageModelScore(uint dwLMCookie, uint wid1, uint wid2, uint wid3, out uint pdwScore);
  /*[id(0x60010016)]*/ int AdjustCacheUnigram(uint dwLMCookie, uint cOld, tagAMSCORE* aOld, uint cNew, tagAMSCORE* aNew, uint iFirst, uint cInOld, uint cInNew, uint dwStartContext);
  /*[id(0x60010017)]*/ int DisableITN(int fDisable);
  /*[id(0x60010018)]*/ int GetAlternates(tagSPPHRASEALTREQUEST* pAltRequest, void**  ppvMem, out uint pcbMem);
  /*[id(0x60010019)]*/ int Commit(tagSPPHRASEALTREQUEST* pAltRequest, tagSPPHRASEALT* pAlt, void**  ppvMem, out uint pcbMem);
  /*[id(0x6001001A)]*/ int NormalizeText(ushort* pszInputText, out ushort ppszNormalizedText);
  /*[id(0x6001001B)]*/ int SetAddDeleteMode(uint dwStatus, LONG_PTR lLTS_CFG, LONG_PTR lPron_CFG);
  /*[id(0x6001001C)]*/ int GetAdaptedWords(out ushort ppwcsWords);
  /*[id(0x6001001D)]*/ int GetVocabularyList(out ushort ppwcsVocabList);
  /*[id(0x6001001E)]*/ int GetPronunciations(ushort* pwcsWord, out ushort ppwcsProns);
}

// ISpPhrase Interface
interface ISpPhrase : IUnknown {
  mixin(uuid("1a5c0354-b621-4b5a-8791-d306ed379e53"));
  //static DWINGUID IID = { 0x1a5c0354, 0xb621, 0x4b5a, 0x87, 0x91, 0xd3, 0x06, 0xed, 0x37, 0x9e, 0x53 };
  /*[id(0x60010000)]*/ int GetPhrase(out SPPHRASE ppCoMemPhrase);
  /*[id(0x60010001)]*/ int GetSerializedPhrase(out SPSERIALIZEDPHRASE ppCoMemPhrase);
  /*[id(0x60010002)]*/ int GetText(uint ulStart, uint ulCount, int fUseTextReplacements, out ushort ppszCoMemText, out ubyte pbDisplayAttributes);
  /*[id(0x60010003)]*/ int Discard(uint dwValueTypes);
}

// ISpRecoContext Interface
interface ISpRecoContext : ISpEventSource {
  mixin(uuid("f740a62f-7c15-489e-8234-940a33d9272d"));
  //static DWINGUID IID = { 0xf740a62f, 0x7c15, 0x489e, 0x82, 0x34, 0x94, 0x0a, 0x33, 0xd9, 0x27, 0x2d };
  /*[id(0x60030000)]*/ int GetRecognizer(out ISpRecognizer ppRecognizer);
  /*[id(0x60030001)]*/ int CreateGrammar(ulong ullGrammarID, out ISpRecoGrammar ppGrammar);
  /*[id(0x60030002)]*/ int GetStatus(out SPRECOCONTEXTSTATUS pStatus);
  /*[id(0x60030003)]*/ int GetMaxAlternates(uint* pcAlternates);
  /*[id(0x60030004)]*/ int SetMaxAlternates(uint cAlternates);
  /*[id(0x60030005)]*/ int SetAudioOptions(SPAUDIOOPTIONS Options, ref DWINGUID pAudioFormatId, WAVEFORMATEX* pWaveFormatEx);
  /*[id(0x60030006)]*/ int GetAudioOptions(SPAUDIOOPTIONS* pOptions, out DWINGUID pAudioFormatId, out WAVEFORMATEX ppCoMemWFEX);
  /*[id(0x60030007)]*/ int DeserializeResult(SPSERIALIZEDRESULT* pSerializedResult, out ISpRecoResult ppResult);
  /*[id(0x60030008)]*/ int Bookmark(SPBOOKMARKOPTIONS Options, ulong ullStreamPosition, LONG_PTR lparamEvent);
  /*[id(0x60030009)]*/ int SetAdaptationData(wchar* pAdaptationData, uint cch);
  /*[id(0x6003000A)]*/ int Pause(uint dwReserved);
  /*[id(0x6003000B)]*/ int Resume(uint dwReserved);
  /*[id(0x6003000C)]*/ int SetVoice(ISpVoice pVoice, int fAllowFormatChanges);
  /*[id(0x6003000D)]*/ int GetVoice(out ISpVoice ppVoice);
  /*[id(0x6003000E)]*/ int SetVoicePurgeEvent(ulong ullEventInterest);
  /*[id(0x6003000F)]*/ int GetVoicePurgeEvent(out ulong pullEventInterest);
  /*[id(0x60030010)]*/ int SetContextState(SPCONTEXTSTATE eContextState);
  /*[id(0x60030011)]*/ int GetContextState(SPCONTEXTSTATE* peContextState);
}

// ISpEventSource Interface
interface ISpEventSource : ISpNotifySource {
  mixin(uuid("be7a9cce-5f9e-11d2-960f-00c04f8ee628"));
  //static DWINGUID IID = { 0xbe7a9cce, 0x5f9e, 0x11d2, 0x96, 0x0f, 0x00, 0xc0, 0x4f, 0x8e, 0xe6, 0x28 };
  /*[id(0x60020000)]*/ int SetInterest(ulong ullEventInterest, ulong ullQueuedInterest);
  /*[id(0x60020001)]*/ int GetEvents(uint ulCount, out SPEVENT pEventArray, out uint pulFetched);
  /*[id(0x60020002)]*/ int GetInfo(out SPEVENTSOURCEINFO pInfo);
}

// ISpNotifySource Interface
interface ISpNotifySource : IUnknown {
  mixin(uuid("5eff4aef-8487-11d2-961c-00c04f8ee628"));
  //static DWINGUID IID = { 0x5eff4aef, 0x8487, 0x11d2, 0x96, 0x1c, 0x00, 0xc0, 0x4f, 0x8e, 0xe6, 0x28 };
  /*[id(0x60010000)]*/ int SetNotifySink(ISpNotifySink pNotifySink);
  /*[id(0x60010001)]*/ int SetNotifyWindowMessage(wireHWND hWnd, uint Msg, UINT_PTR wParam, LONG_PTR lParam);
  /*[id(0x60010002)]*/ int SetNotifyCallbackFunction(void** pfnCallback, UINT_PTR wParam, LONG_PTR lParam);
  /*[id(0x60010003)]*/ int SetNotifyCallbackInterface(void** pSpCallback, UINT_PTR wParam, LONG_PTR lParam);
  /*[id(0x60010004)]*/ int SetNotifyWin32Event();
  /*[id(0x60010005)]*/ int WaitForNotifyEvent(uint dwMilliseconds);
  /*[id(0x60010006)]*/ void* GetNotifyEventHandle();
}

// ISpNotifySink Interface
interface ISpNotifySink : IUnknown {
  mixin(uuid("259684dc-37c3-11d2-9603-00c04f8ee628"));
  //static DWINGUID IID = { 0x259684dc, 0x37c3, 0x11d2, 0x96, 0x03, 0x00, 0xc0, 0x4f, 0x8e, 0xe6, 0x28 };
  /*[id(0x60010000)]*/ int Notify();
}

// ISpRecognizer Interface
interface ISpRecognizer : ISpProperties {
  mixin(uuid("c2b5f241-daa0-4507-9e16-5a1eaa2b7a5c"));
  //static DWINGUID IID = { 0xc2b5f241, 0xdaa0, 0x4507, 0x9e, 0x16, 0x5a, 0x1e, 0xaa, 0x2b, 0x7a, 0x5c };
  /*[id(0x60020000)]*/ int SetRecognizer(ISpObjectToken pRecognizer);
  /*[id(0x60020001)]*/ int GetRecognizer(out ISpObjectToken ppRecognizer);
  /*[id(0x60020002)]*/ int SetInput(IUnknown pUnkInput, int fAllowFormatChanges);
  /*[id(0x60020003)]*/ int GetInputObjectToken(out ISpObjectToken ppToken);
  /*[id(0x60020004)]*/ int GetInputStream(out ISpStreamFormat ppStream);
  /*[id(0x60020005)]*/ int CreateRecoContext(out ISpRecoContext ppNewCtxt);
  /*[id(0x60020006)]*/ int GetRecoProfile(out ISpObjectToken ppToken);
  /*[id(0x60020007)]*/ int SetRecoProfile(ISpObjectToken pToken);
  /*[id(0x60020008)]*/ int IsSharedInstance();
  /*[id(0x60020009)]*/ int GetRecoState(out SPRECOSTATE pState);
  /*[id(0x6002000A)]*/ int SetRecoState(SPRECOSTATE NewState);
  /*[id(0x6002000B)]*/ int GetStatus(out SPRECOGNIZERSTATUS pStatus);
  /*[id(0x6002000C)]*/ int GetFormat(SPSTREAMFORMATTYPE WaveFormatType, out DWINGUID pFormatId, out WAVEFORMATEX ppCoMemWFEX);
  /*[id(0x6002000D)]*/ int IsUISupported(ushort* pszTypeOfUI, void* pvExtraData, uint cbExtraData, out int pfSupported);
  /*[id(0x6002000E)]*/ int DisplayUI(wireHWND hwndParent, ushort* pszTitle, ushort* pszTypeOfUI, void* pvExtraData, uint cbExtraData);
  /*[id(0x6002000F)]*/ int EmulateRecognition(ISpPhrase pPhrase);
}

// ISpProperties Interface
interface ISpProperties : IUnknown {
  mixin(uuid("5b4fb971-b115-4de1-ad97-e482e3bf6ee4"));
  //static DWINGUID IID = { 0x5b4fb971, 0xb115, 0x4de1, 0xad, 0x97, 0xe4, 0x82, 0xe3, 0xbf, 0x6e, 0xe4 };
  /*[id(0x60010000)]*/ int SetPropertyNum(ushort* pName, int lValue);
  /*[id(0x60010001)]*/ int GetPropertyNum(ushort* pName, out int plValue);
  /*[id(0x60010002)]*/ int SetPropertyString(ushort* pName, ushort* pValue);
  /*[id(0x60010003)]*/ int GetPropertyString(ushort* pName, out ushort ppCoMemValue);
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

// ISpStreamFormat Interface
interface ISpStreamFormat : IStream {
  mixin(uuid("bed530be-2606-4f4d-a1c0-54c5cda5566f"));
  //static DWINGUID IID = { 0xbed530be, 0x2606, 0x4f4d, 0xa1, 0xc0, 0x54, 0xc5, 0xcd, 0xa5, 0x56, 0x6f };
  /*[id(0x60030000)]*/ int GetFormat(ref DWINGUID pguidFormatId, WAVEFORMATEX** ppCoMemWaveFormatEx);
}

interface IStream : ISequentialStream {
  mixin(uuid("0000000c-0000-0000-c000-000000000046"));
  //static DWINGUID IID = { 0x0000000c, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
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
  //static DWINGUID IID = { 0x0c733a30, 0x2a1c, 0x11ce, 0xad, 0xe5, 0x00, 0xaa, 0x00, 0x44, 0x77, 0x3d };
  /*[id(0x60010000)]*/ int RemoteRead(out ubyte pv, uint cb, out uint pcbRead);
  /*[id(0x60010001)]*/ int RemoteWrite(ubyte* pv, uint cb, out uint pcbWritten);
}

// ISpRecoGrammar Interface
interface ISpRecoGrammar : ISpGrammarBuilder {
  mixin(uuid("2177db29-7f45-47d0-8554-067e91c80502"));
  //static DWINGUID IID = { 0x2177db29, 0x7f45, 0x47d0, 0x85, 0x54, 0x06, 0x7e, 0x91, 0xc8, 0x05, 0x02 };
  /*[id(0x60020000)]*/ int GetGrammarId(out ulong pullGrammarId);
  /*[id(0x60020001)]*/ int GetRecoContext(out ISpRecoContext ppRecoCtxt);
  /*[id(0x60020002)]*/ int LoadCmdFromFile(wchar* pszFileName, SPLOADOPTIONS Options);
  /*[id(0x60020003)]*/ int LoadCmdFromObject(ref DWINGUID rcid, wchar* pszGrammarName, SPLOADOPTIONS Options);
  /*[id(0x60020004)]*/ int LoadCmdFromResource(void* hModule, wchar* pszResourceName, wchar* pszResourceType, ushort wLanguage, SPLOADOPTIONS Options);
  /*[id(0x60020005)]*/ int LoadCmdFromMemory(SPBINARYGRAMMAR* pGrammar, SPLOADOPTIONS Options);
  /*[id(0x60020006)]*/ int LoadCmdFromProprietaryGrammar(ref DWINGUID rguidParam, wchar* pszStringParam, void* pvDataPrarm, uint cbDataSize, SPLOADOPTIONS Options);
  /*[id(0x60020007)]*/ int SetRuleState(wchar* pszName, void* pReserved, SPRULESTATE NewState);
  /*[id(0x60020008)]*/ int SetRuleIdState(uint ulRuleId, SPRULESTATE NewState);
  /*[id(0x60020009)]*/ int LoadDictation(wchar* pszTopicName, SPLOADOPTIONS Options);
  /*[id(0x6002000A)]*/ int UnloadDictation();
  /*[id(0x6002000B)]*/ int SetDictationState(SPRULESTATE NewState);
  /*[id(0x6002000C)]*/ int SetWordSequenceData(ushort* pText, uint cchText, SPTEXTSELECTIONINFO* pInfo);
  /*[id(0x6002000D)]*/ int SetTextSelection(SPTEXTSELECTIONINFO* pInfo);
  /*[id(0x6002000E)]*/ int IsPronounceable(wchar* pszWord, out SPWORDPRONOUNCEABLE pWordPronounceable);
  /*[id(0x6002000F)]*/ int SetGrammarState(SPGRAMMARSTATE eGrammarState);
  /*[id(0x60020010)]*/ int SaveCmd(IStream pStream, ushort* ppszCoMemErrorText);
  /*[id(0x60020011)]*/ int GetGrammarState(out SPGRAMMARSTATE peGrammarState);
}

// ISpGrammarBuilder Interface
interface ISpGrammarBuilder : IUnknown {
  mixin(uuid("8137828f-591a-4a42-be58-49ea7ebaac68"));
  //static DWINGUID IID = { 0x8137828f, 0x591a, 0x4a42, 0xbe, 0x58, 0x49, 0xea, 0x7e, 0xba, 0xac, 0x68 };
  /*[id(0x60010000)]*/ int ResetGrammar(ushort NewLanguage);
  /*[id(0x60010001)]*/ int GetRule(ushort* pszRuleName, uint dwRuleId, uint dwAttributes, int fCreateIfNotExist, void**  phInitialState);
  /*[id(0x60010002)]*/ int ClearRule(void* hState);
  /*[id(0x60010003)]*/ int CreateNewState(void* hState, void** phState);
  /*[id(0x60010004)]*/ int AddWordTransition(void* hFromState, void* hToState, ushort* psz, ushort* pszSeparators, SPGRAMMARWORDTYPE eWordType, float Weight, SPPROPERTYINFO* pPropInfo);
  /*[id(0x60010005)]*/ int AddRuleTransition(void* hFromState, void* hToState, void* hRule, float Weight, SPPROPERTYINFO* pPropInfo);
  /*[id(0x60010006)]*/ int AddResource(void* hRuleState, ushort* pszResourceName, ushort* pszResourceValue);
  /*[id(0x60010007)]*/ int Commit(uint dwReserved);
}

// ISpRecoResult Interface
interface ISpRecoResult : ISpPhrase {
  mixin(uuid("20b053be-e235-43cd-9a2a-8d17a48b7842"));
  //static DWINGUID IID = { 0x20b053be, 0xe235, 0x43cd, 0x9a, 0x2a, 0x8d, 0x17, 0xa4, 0x8b, 0x78, 0x42 };
  /*[id(0x60020000)]*/ int GetResultTimes(out SPRECORESULTTIMES pTimes);
  /*[id(0x60020001)]*/ int GetAlternates(uint ulStartElement, uint cElements, uint ulRequestCount, out ISpPhraseAlt ppPhrases, out uint pcPhrasesReturned);
  /*[id(0x60020002)]*/ int GetAudio(uint ulStartElement, uint cElements, out ISpStreamFormat ppStream);
  /*[id(0x60020003)]*/ int SpeakAudio(uint ulStartElement, uint cElements, uint dwFlags, out uint pulStreamNumber);
  /*[id(0x60020004)]*/ int Serialize(out SPSERIALIZEDRESULT ppCoMemSerializedResult);
  /*[id(0x60020005)]*/ int ScaleAudio(ref DWINGUID pAudioFormatId, WAVEFORMATEX* pWaveFormatEx);
  /*[id(0x60020006)]*/ int GetRecoContext(out ISpRecoContext ppRecoContext);
}

// ISpPhraseAlt Interface
interface ISpPhraseAlt : ISpPhrase {
  mixin(uuid("8fcebc98-4e49-4067-9c6c-d86a0e092e3d"));
  //static DWINGUID IID = { 0x8fcebc98, 0x4e49, 0x4067, 0x9c, 0x6c, 0xd8, 0x6a, 0x0e, 0x09, 0x2e, 0x3d };
  /*[id(0x60020000)]*/ int GetAltInfo(ISpPhrase* ppParent, uint* pulStartElementInParent, uint* pcElementsInParent, uint* pcElementsInAlt);
  /*[id(0x60020001)]*/ int Commit();
}

// ISpVoice Interface
interface ISpVoice : ISpEventSource {
  mixin(uuid("6c44df74-72b9-4992-a1ec-ef996e0422d4"));
  //static DWINGUID IID = { 0x6c44df74, 0x72b9, 0x4992, 0xa1, 0xec, 0xef, 0x99, 0x6e, 0x04, 0x22, 0xd4 };
  /*[id(0x60030000)]*/ int SetOutput(IUnknown pUnkOutput, int fAllowFormatChanges);
  /*[id(0x60030001)]*/ int GetOutputObjectToken(out ISpObjectToken ppObjectToken);
  /*[id(0x60030002)]*/ int GetOutputStream(out ISpStreamFormat ppStream);
  /*[id(0x60030003)]*/ int Pause();
  /*[id(0x60030004)]*/ int Resume();
  /*[id(0x60030005)]*/ int SetVoice(ISpObjectToken pToken);
  /*[id(0x60030006)]*/ int GetVoice(out ISpObjectToken ppToken);
  /*[id(0x60030007)]*/ int Speak(wchar* pwcs, uint dwFlags, out uint pulStreamNumber);
  /*[id(0x60030008)]*/ int SpeakStream(IStream pStream, uint dwFlags, out uint pulStreamNumber);
  /*[id(0x60030009)]*/ int GetStatus(out SPVOICESTATUS pStatus, out wchar* ppszLastBookmark);
  /*[id(0x6003000A)]*/ int Skip(wchar* pItemType, int lNumItems, out uint pulNumSkipped);
  /*[id(0x6003000B)]*/ int SetPriority(SPVPRIORITY ePriority);
  /*[id(0x6003000C)]*/ int GetPriority(out SPVPRIORITY pePriority);
  /*[id(0x6003000D)]*/ int SetAlertBoundary(SPEVENTENUM eBoundary);
  /*[id(0x6003000E)]*/ int GetAlertBoundary(out SPEVENTENUM peBoundary);
  /*[id(0x6003000F)]*/ int SetRate(int RateAdjust);
  /*[id(0x60030010)]*/ int GetRate(out int pRateAdjust);
  /*[id(0x60030011)]*/ int SetVolume(ushort usVolume);
  /*[id(0x60030012)]*/ int GetVolume(out ushort pusVolume);
  /*[id(0x60030013)]*/ int WaitUntilDone(uint msTimeout);
  /*[id(0x60030014)]*/ int SetSyncSpeakTimeout(uint msTimeout);
  /*[id(0x60030015)]*/ int GetSyncSpeakTimeout(out uint pmsTimeout);
  /*[id(0x60030016)]*/ void* SpeakCompleteEvent();
  /*[id(0x60030017)]*/ int IsUISupported(ushort* pszTypeOfUI, void* pvExtraData, uint cbExtraData, out int pfSupported);
  /*[id(0x60030018)]*/ int DisplayUI(wireHWND hwndParent, ushort* pszTitle, ushort* pszTypeOfUI, void* pvExtraData, uint cbExtraData);
}

// ISpPhraseBuilder Interface
interface ISpPhraseBuilder : ISpPhrase {
  mixin(uuid("88a3342a-0bed-4834-922b-88d43173162f"));
  //static DWINGUID IID = { 0x88a3342a, 0x0bed, 0x4834, 0x92, 0x2b, 0x88, 0xd4, 0x31, 0x73, 0x16, 0x2f };
  /*[id(0x60020000)]*/ int InitFromPhrase(SPPHRASE* pPhrase);
  /*[id(0x60020001)]*/ int InitFromSerializedPhrase(SPSERIALIZEDPHRASE* pPhrase);
  /*[id(0x60020002)]*/ int AddElements(uint cElements, SPPHRASEELEMENT* pElement);
  /*[id(0x60020003)]*/ int AddRules(void* hParent, SPPHRASERULE* pRule, void** phNewRule);
  /*[id(0x60020004)]*/ int AddProperties(void* hParent, SPPHRASEPROPERTY* pProperty, void** phNewProperty);
  /*[id(0x60020005)]*/ int AddReplacements(uint cReplacements, SPPHRASEREPLACEMENT* pReplacements);
}

// ISpTokenUI Interface
interface ISpTokenUI : IUnknown {
  mixin(uuid("f8e690f0-39cb-4843-b8d7-c84696e1119d"));
  //static DWINGUID IID = { 0xf8e690f0, 0x39cb, 0x4843, 0xb8, 0xd7, 0xc8, 0x46, 0x96, 0xe1, 0x11, 0x9d };
  /*[id(0x60010000)]*/ int IsUISupported(ushort* pszTypeOfUI, void* pvExtraData, uint cbExtraData, IUnknown punkObject, out int pfSupported);
  /*[id(0x60010001)]*/ int DisplayUI(wireHWND hwndParent, ushort* pszTitle, ushort* pszTypeOfUI, void* pvExtraData, uint cbExtraData, ISpObjectToken pToken, IUnknown punkObject);
}

// CoClasses

// RecoExt Class
abstract class RecoExt {
  mixin(uuid("1a6f5c32-45f4-11d3-9a67-00c04f8ef48f"));
  //static DWINGUID CLSID = { 0x1a6f5c32, 0x45f4, 0x11d3, 0x9a, 0x67, 0x00, 0xc0, 0x4f, 0x8e, 0xf4, 0x8f };
  mixin Interfaces!(IMsasrRecoExt);
}

// MsasrUI Class
abstract class MsasrUI {
  mixin(uuid("0cfa3fb2-47f4-4157-a162-648caa980de2"));
  //static DWINGUID CLSID = { 0x0cfa3fb2, 0x47f4, 0x4157, 0xa1, 0x62, 0x64, 0x8c, 0xaa, 0x98, 0x0d, 0xe2 };
  mixin Interfaces!(ISpTokenUI);
}

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
