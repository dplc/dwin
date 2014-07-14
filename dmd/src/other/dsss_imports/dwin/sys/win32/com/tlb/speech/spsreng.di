// srdrv1 1.0 Type Library
// Version 1.0
//C:\Program Files\Common Files\SpeechEngines\Microsoft\SR\spsreng.dll
//mixin(uuid("ec46813c-6916-11d2-9427-00c04f8ef48f"));
//module srdrv1lib;
module dwin.sys.win32.com.tlb.speech.spsreng;

/*[importlib("stdole2.tlb")]*/
private import dwin.sys.win32.com.Core;

// Enums

enum SPRESULTTYPE {
  SPRT_CFG = 0x00000000,
  SPRT_SLM = 0x00000001,
  SPRT_PROPRIETARY = 0x00000002,
  SPRT_FALSE_RECOGNITION = 0x00000004,
}

enum SPWORDINFOOPT {
  SPWIO_NONE = 0x00000000,
  SPWIO_WANT_TEXT = 0x00000001,
}

enum SPRULEINFOOPT {
  SPRIO_NONE = 0x00000000,
}

enum SPDATAKEYLOCATION {
  SPDKL_DefaultLocation = 0x00000000,
  SPDKL_CurrentUser = 0x00000001,
  SPDKL_LocalMachine = 0x00000002,
  SPDKL_CurrentConfig = 0x00000005,
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

enum SPPROPSRC {
  SPPROPSRC_RECO_INST = 0x00000000,
  SPPROPSRC_RECO_CTX = 0x00000001,
  SPPROPSRC_RECO_GRAMMAR = 0x00000002,
}

enum SPGRAMMARSTATE {
  SPGS_DISABLED = 0x00000000,
  SPGS_ENABLED = 0x00000001,
  SPGS_EXCLUSIVE = 0x00000003,
}

enum SPCFGNOTIFY {
  SPCFGN_ADD = 0x00000000,
  SPCFGN_REMOVE = 0x00000001,
  SPCFGN_INVALIDATE = 0x00000002,
  SPCFGN_ACTIVATE = 0x00000003,
  SPCFGN_DEACTIVATE = 0x00000004,
}

enum SPCONTEXTSTATE {
  SPCS_DISABLED = 0x00000000,
  SPCS_ENABLED = 0x00000001,
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

// Unions

union __MIDL___MIDL_itf_srdrv1_0351_0002 {
  __MIDL___MIDL_itf_srdrv1_0351_0003 __MIDL_0012;
  __MIDL___MIDL_itf_srdrv1_0351_0004 __MIDL_0013;
  __MIDL___MIDL_itf_srdrv1_0351_0005 __MIDL_0014;
}

union __MIDL_IWinTypes_0009 {
  int hInproc;
  int hRemote;
}

// Structs

struct SPPARSEINFO {
  uint cbSize;
  void* hRule;
  ulong ullAudioStreamPosition;
  uint ulAudioSize;
  uint cTransitions;
  SPPATHENTRY* pPath;
  DWINGUID SREngineID;
  uint ulSREnginePrivateDataSize;
  ubyte* pSREnginePrivateData;
  int fHypothesis;
}

struct SPPATHENTRY {
  void* hTransition;
  SPPHRASEELEMENT elem;
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

struct SPPHRASEREPLACEMENT {
  ubyte bDisplayAttributes;
  ushort* pszReplacementText;
  uint ulFirstElement;
  uint ulCountOfElements;
}

struct SPSERIALIZEDPHRASE {
  uint ulSerializedSize;
}

struct SPRECORESULTINFO {
  uint cbSize;
  SPRESULTTYPE eResultType;
  int fHypothesis;
  int fProprietaryAutoPause;
  ulong ullStreamPosStart;
  ulong ullStreamPosEnd;
  void* hGrammar;
  uint ulSizeEngineData;
  void* pvEngineData;
  ISpPhraseBuilder pPhrase;
  tagSPPHRASEALT* aPhraseAlts;
  uint ulNumAlts;
}

struct tagSPPHRASEALT {
  ISpPhraseBuilder pPhrase;
  uint ulStartElementInParent;
  uint cElementsInParent;
  uint cElementsInAlternate;
  void* pvAltExtra;
  uint cbAltExtra;
}

struct SPEVENT {
  ushort eEventId;
  ushort elParamType;
  uint ulStreamNum;
  ulong ullAudioStreamOffset;
  UINT_PTR wParam;
  LONG_PTR lParam;
}

struct SPWORDENTRY {
  void* hWord;
  ushort LangID;
  ushort* pszDisplayText;
  ushort* pszLexicalForm;
  ushort* aPhoneId;
  void* pvClientContext;
}

struct SPRULEENTRY {
  void* hRule;
  void* hInitialState;
  uint Attributes;
  void* pvClientRuleContext;
  void* pvClientGrammarContext;
}

struct SPSTATEINFO {
  uint cAllocatedEntries;
  SPTRANSITIONENTRY* pTransitions;
  uint cEpsilons;
  uint cRules;
  uint cWords;
  uint cSpecialTransitions;
}

struct SPTRANSITIONENTRY {
  void* ID;
  void* hNextState;
  ubyte Type;
  ubyte RequiredConfidence;
  __MIDL___MIDL_itf_srdrv1_0351_0001 __MIDL_0011;
  float Weight;
  __MIDL___MIDL_itf_srdrv1_0351_0002 __MIDL_0015;
}

struct __MIDL___MIDL_itf_srdrv1_0351_0001 {
  uint fHasProperty;
}

struct __MIDL___MIDL_itf_srdrv1_0351_0003 {
  void* hRuleInitialState;
  void* hRule;
  void* pvClientRuleContext;
}

struct __MIDL___MIDL_itf_srdrv1_0351_0004 {
  void* hWord;
  void* pvClientWordContext;
}

struct __MIDL___MIDL_itf_srdrv1_0351_0005 {
  void* pvGrammarCookie;
}

struct SPTRANSITIONPROPERTY {
  ushort* pszName;
  uint ulId;
  ushort* pszValue;
  DWINVARIANT vValue;
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

struct _RemotableHandle {
  int fContext;
  __MIDL_IWinTypes_0009 u;
}

struct tagSPTEXTSELECTIONINFO {
  uint ulStartActiveOffset;
  uint cchActiveChars;
  uint ulStartSelection;
  uint cchSelection;
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
  uint Type;
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

// Aliases

alias uint UINT_PTR;

alias int LONG_PTR;

alias _RemotableHandle* wireHWND;

alias tagSPTEXTSELECTIONINFO SPTEXTSELECTIONINFO;

alias _SPAUDIOSTATE SPAUDIOSTATE;

alias SPWAVEFORMATTYPE SPSTREAMFORMATTYPE;

alias tagSPPROPERTYINFO SPPROPERTYINFO;

// Interfaces

// ISpSREngine Interface
interface ISpSREngine : IUnknown {
  mixin(uuid("2f472991-854b-4465-b613-fbafb3ad8ed8"));
  //static DWINGUID IID = { 0x2f472991, 0x854b, 0x4465, 0xb6, 0x13, 0xfb, 0xaf, 0xb3, 0xad, 0x8e, 0xd8 };
  /*[id(0x60010000)]*/ int SetSite(ISpSREngineSite pSite);
  /*[id(0x60010001)]*/ int GetInputAudioFormat(ref DWINGUID pguidSourceFormatId, WAVEFORMATEX* pSourceWaveFormatEx, out DWINGUID pguidDesiredFormatId, out WAVEFORMATEX* ppCoMemDesiredWaveFormatEx);
  /*[id(0x60010002)]*/ int RecognizeStream(ref DWINGUID rguidFmtId, WAVEFORMATEX* pWaveFormatEx, void* hRequestSync, void* hDataAvailable, void* hExit, int fNewAudioStream, int fRealTimeAudio, ISpObjectToken pAudioObjectToken);
  /*[id(0x60010003)]*/ int SetRecoProfile(ISpObjectToken pProfile);
  /*[id(0x60010004)]*/ int OnCreateGrammar(void* pvEngineRecoContext, void* hSAPIGrammar, void**  ppvEngineGrammarContext);
  /*[id(0x60010005)]*/ int OnDeleteGrammar(void* pvEngineGrammar);
  /*[id(0x60010006)]*/ int LoadProprietaryGrammar(void* pvEngineGrammar, ref DWINGUID rguidParam, wchar* pszStringParam, void* pvDataParam, uint ulDataSize, SPLOADOPTIONS Options);
  /*[id(0x60010007)]*/ int UnloadProprietaryGrammar(void* pvEngineGrammar);
  /*[id(0x60010008)]*/ int SetProprietaryRuleState(void* pvEngineGrammar, wchar* pszName, void* pReserved, SPRULESTATE NewState, out uint pcRulesChanged);
  /*[id(0x60010009)]*/ int SetProprietaryRuleIdState(void* pvEngineGrammar, uint dwRuleId, SPRULESTATE NewState);
  /*[id(0x6001000A)]*/ int LoadSLM(void* pvEngineGrammar, wchar* pszTopicName);
  /*[id(0x6001000B)]*/ int UnloadSLM(void* pvEngineGrammar);
  /*[id(0x6001000C)]*/ int SetSLMState(void* pvEngineGrammar, SPRULESTATE NewState);
  /*[id(0x6001000D)]*/ int SetWordSequenceData(void* pvEngineGrammar, ushort* pText, uint cchText, SPTEXTSELECTIONINFO* pInfo);
  /*[id(0x6001000E)]*/ int SetTextSelection(void* pvEngineGrammar, SPTEXTSELECTIONINFO* pInfo);
  /*[id(0x6001000F)]*/ int IsPronounceable(void* pvEngineGrammar, wchar* pszWord, out SPWORDPRONOUNCEABLE pWordPronounceable);
  /*[id(0x60010010)]*/ int OnCreateRecoContext(void* hSAPIRecoContext, void**  ppvEngineContext);
  /*[id(0x60010011)]*/ int OnDeleteRecoContext(void* pvEngineContext);
  /*[id(0x60010012)]*/ //int PrivateCall(void* pvEngineContext, ref void pCallFrame, uint ulCallFrameSize);
  /*[id(0x60010012)]*/ int PrivateCall(void* pvEngineContext, void* pCallFrame, uint ulCallFrameSize);
  /*[id(0x60010013)]*/ int SetAdaptationData(void* pvEngineContext, ushort* pAdaptationData, uint cch);
  /*[id(0x60010014)]*/ int SetPropertyNum(SPPROPSRC eSrc, void* pvSrcObj, ushort* pName, int lValue);
  /*[id(0x60010015)]*/ int GetPropertyNum(SPPROPSRC eSrc, void* pvSrcObj, ushort* pName, out int lValue);
  /*[id(0x60010016)]*/ int SetPropertyString(SPPROPSRC eSrc, void* pvSrcObj, ushort* pName, ushort* pValue);
  /*[id(0x60010017)]*/ int GetPropertyString(SPPROPSRC eSrc, void* pvSrcObj, ushort* pName, out ushort ppCoMemValue);
  /*[id(0x60010018)]*/ int SetGrammarState(void* pvEngineGrammar, SPGRAMMARSTATE eGrammarState);
  /*[id(0x60010019)]*/ int WordNotify(SPCFGNOTIFY Action, uint cWords, SPWORDENTRY* pWords);
  /*[id(0x6001001A)]*/ int RuleNotify(SPCFGNOTIFY Action, uint cRules, SPRULEENTRY* pRules);
  /*[id(0x6001001B)]*/ int PrivateCallEx(void* pvEngineContext, void* pInCallFrame, uint ulInCallFrameSize, void**  ppvCoMemResponse, out uint pulResponseSize);
  /*[id(0x6001001C)]*/ int SetContextState(void* pvEngineContext, SPCONTEXTSTATE eContextState);
}

/*
//from sapiddk.idl
[
    object,
    uuid(2F472991-854B-4465-B613-FBAFB3AD8ED8),
    helpstring("ISpSREngine Interface"),
    pointer_default(unique),
    local
]
interface ISpSREngine : IUnknown
{
    HRESULT SetSite([in] ISpSREngineSite *pSite);

    HRESULT GetInputAudioFormat(
                [in] const GUID * pguidSourceFormatId,
                [in] const WAVEFORMATEX * pSourceWaveFormatEx,
                [out] GUID * pguidDesiredFormatId, 
                [out] WAVEFORMATEX ** ppCoMemDesiredWaveFormatEx);

    HRESULT RecognizeStream([in] REFGUID rguidFmtId, [in] const WAVEFORMATEX * pWaveFormatEx,
                            [in] HANDLE hRequestSync, [in] HANDLE hDataAvailable,
                            [in] HANDLE hExit, [in] BOOL fNewAudioStream, [in] BOOL fRealTimeAudio,
                            [in] ISpObjectToken * pAudioObjectToken);

    HRESULT SetRecoProfile(ISpObjectToken * pProfile);

	HRESULT OnCreateGrammar([in] void * pvEngineRecoContext,
                            [in] SPGRAMMARHANDLE hSAPIGrammar,
                            [out] void ** ppvEngineGrammarContext);

    HRESULT OnDeleteGrammar([in] void * pvEngineGrammar);

    HRESULT LoadProprietaryGrammar(
                [in] void * pvEngineGrammar,
                [in] REFGUID rguidParam,
                [in, string] const WCHAR * pszStringParam,
                [in] const void * pvDataParam,
                [in] ULONG ulDataSize,
                [in] SPLOADOPTIONS Options);    // Note for SAPI 5.0 this is always SPLO_NONE

    HRESULT UnloadProprietaryGrammar([in] void * pvEngineGrammar);

    HRESULT SetProprietaryRuleState([in] void * pvEngineGrammar, 
                                    [in, string] const WCHAR * pszName,
                                    [in] void * pReserved,
                                    [in] SPRULESTATE NewState,
                                    [out] ULONG * pcRulesChanged);
    HRESULT SetProprietaryRuleIdState([in] void * pvEngineGrammar, 
                                      [in] DWORD dwRuleId,
                                      [in] SPRULESTATE NewState);
    HRESULT LoadSLM([in] void * pvEngineGrammar, [in, string] const WCHAR * pszTopicName);
    HRESULT UnloadSLM([in] void * pvEngineGrammar);
    HRESULT SetSLMState([in] void * pvEngineGrammar, [in] SPRULESTATE NewState);
    HRESULT SetWordSequenceData([in] void * pvEngineGrammar, [in] const WCHAR * pText, [in] ULONG cchText, [in] const SPTEXTSELECTIONINFO * pInfo);
    HRESULT SetTextSelection([in] void * pvEngineGrammar, [in] const SPTEXTSELECTIONINFO * pInfo);
    HRESULT IsPronounceable([in] void * pvEngineGrammar, [in, string] const WCHAR * pszWord, [out] SPWORDPRONOUNCEABLE *pWordPronounceable);

    HRESULT OnCreateRecoContext(
                [in] SPRECOCONTEXTHANDLE hSAPIRecoContext, 
                [out] void ** ppvEngineContext);
    HRESULT OnDeleteRecoContext([in] void * pvEngineContext);

    HRESULT PrivateCall([in] void * pvEngineContext, [in, out] PVOID pCallFrame, [in] ULONG ulCallFrameSize);

    HRESULT SetAdaptationData([in] void * pvEngineContext, const WCHAR *pAdaptationData, const ULONG cch);

    HRESULT SetPropertyNum( [in]SPPROPSRC eSrc, [in]void* pvSrcObj,
                            [in]const WCHAR* pName, [in]LONG lValue );
    HRESULT GetPropertyNum( [in]SPPROPSRC eSrc, [in]void* pvSrcObj,
                            [in]const WCHAR* pName, [out]LONG* lValue );
    HRESULT SetPropertyString( [in]SPPROPSRC eSrc, [in]void* pvSrcObj,
                       [in]const WCHAR* pName, [in]const WCHAR* pValue );
    HRESULT GetPropertyString( [in]SPPROPSRC eSrc, [in]void* pvSrcObj,
                       [in]const WCHAR* pName, [out]WCHAR** ppCoMemValue );

    HRESULT SetGrammarState([in] void * pvEngineGrammar, [in] SPGRAMMARSTATE eGrammarState);

    HRESULT WordNotify(SPCFGNOTIFY Action, ULONG cWords, const SPWORDENTRY * pWords);
    HRESULT RuleNotify(SPCFGNOTIFY Action, ULONG cRules, const SPRULEENTRY * pRules);

    HRESULT PrivateCallEx([in] void * pvEngineContext, [in] const void * pInCallFrame, [in] ULONG ulInCallFrameSize,
                          [out] void ** ppvCoMemResponse, [out] ULONG * pulResponseSize);

    HRESULT SetContextState([in] void * pvEngineContext, [in] SPCONTEXTSTATE eContextState);
};
*/


// ISpSREngineSite Interface
interface ISpSREngineSite : IUnknown {
  mixin(uuid("3b414aec-720c-4883-b9ef-178cd394fb3a"));
  //static DWINGUID IID = { 0x3b414aec, 0x720c, 0x4883, 0xb9, 0xef, 0x17, 0x8c, 0xd3, 0x94, 0xfb, 0x3a };
  /*[id(0x60010000)]*/ int Read(void* pv, uint cb, out uint pcbRead);
  /*[id(0x60010001)]*/ int DataAvailable(uint* pcb);
  /*[id(0x60010002)]*/ int SetBufferNotifySize(uint cbSize);
  /*[id(0x60010003)]*/ int ParseFromTransitions(SPPARSEINFO* pParseInfo, out ISpPhraseBuilder ppNewPhrase);
  /*[id(0x60010004)]*/ int Recognition(SPRECORESULTINFO* pResultInfo);
  /*[id(0x60010005)]*/ int AddEvent(SPEVENT* pEvent, void* hSAPIRecoContext);
  /*[id(0x60010006)]*/ int Synchronize(ulong ullProcessedThruPos);
  /*[id(0x60010007)]*/ int GetWordInfo(ref SPWORDENTRY pWordEntry, SPWORDINFOOPT Options);
  /*[id(0x60010008)]*/ int SetWordClientContext(void* hWord, void* pvClientContext);
  /*[id(0x60010009)]*/ int GetRuleInfo(ref SPRULEENTRY pRuleEntry, SPRULEINFOOPT Options);
  /*[id(0x6001000A)]*/ int SetRuleClientContext(void* hRule, void* pvClientContext);
  /*[id(0x6001000B)]*/ int GetStateInfo(void* hState, SPSTATEINFO* pStateInfo);
  /*[id(0x6001000C)]*/ int GetResource(void* hRule, ushort* pszResourceName, out ushort ppCoMemResource);
  /*[id(0x6001000D)]*/ int GetTransitionProperty(void* ID, out SPTRANSITIONPROPERTY ppCoMemProperty);
  /*[id(0x6001000E)]*/ int IsAlternate(void* hRule, void* hAltRule);
  /*[id(0x6001000F)]*/ int GetMaxAlternates(void* hRule, out uint pulNumAlts);
  /*[id(0x60010010)]*/ int GetContextMaxAlternates(void* hContext, out uint pulNumAlts);
  /*[id(0x60010011)]*/ int UpdateRecoPos(ulong ullCurrentRecoPos);
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

// ISpPhrase Interface
interface ISpPhrase : IUnknown {
  mixin(uuid("1a5c0354-b621-4b5a-8791-d306ed379e53"));
  //static DWINGUID IID = { 0x1a5c0354, 0xb621, 0x4b5a, 0x87, 0x91, 0xd3, 0x06, 0xed, 0x37, 0x9e, 0x53 };
  /*[id(0x60010000)]*/ int GetPhrase(out SPPHRASE ppCoMemPhrase);
  /*[id(0x60010001)]*/ int GetSerializedPhrase(out SPSERIALIZEDPHRASE ppCoMemPhrase);
  /*[id(0x60010002)]*/ int GetText(uint ulStart, uint ulCount, int fUseTextReplacements, out ushort ppszCoMemText, out ubyte pbDisplayAttributes);
  /*[id(0x60010003)]*/ int Discard(uint dwValueTypes);
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

// ISpSRAlternates Interface
interface ISpSRAlternates : IUnknown {
  mixin(uuid("fece8294-2be1-408f-8e68-2de377092f0e"));
  //static DWINGUID IID = { 0xfece8294, 0x2be1, 0x408f, 0x8e, 0x68, 0x2d, 0xe3, 0x77, 0x09, 0x2f, 0x0e };
  /*[id(0x60010000)]*/ int GetAlternates(tagSPPHRASEALTREQUEST* pAltRequest, out tagSPPHRASEALT ppAlts, out uint pcAlts);
  /*[id(0x60010001)]*/ int Commit(tagSPPHRASEALTREQUEST* pAltRequest, tagSPPHRASEALT* pAlt, void**  ppvResultExtra, out uint pcbResultExtra);
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
  /*[id(0x60010001)]*/ int GetRule(wchar* pszRuleName, uint dwRuleId, uint dwAttributes, int fCreateIfNotExist, void**  phInitialState);
  /*[id(0x60010002)]*/ int ClearRule(void* hState);
  /*[id(0x60010003)]*/ int CreateNewState(void* hState, void** phState);
  /*[id(0x60010004)]*/ int AddWordTransition(void* hFromState, void* hToState, wchar* psz, wchar* pszSeparators, SPGRAMMARWORDTYPE eWordType, float Weight, SPPROPERTYINFO* pPropInfo);
  /*[id(0x60010005)]*/ int AddRuleTransition(void* hFromState, void* hToState, void* hRule, float Weight, SPPROPERTYINFO* pPropInfo);
  /*[id(0x60010006)]*/ int AddResource(void* hRuleState, wchar* pszResourceName, wchar* pszResourceValue);
  /*[id(0x60010007)]*/ int Commit(uint dwReserved);
}

/*
//sapi.dll
[
    object,
    uuid(8137828F-591A-4A42-BE58-49EA7EBAAC68),
    helpstring("ISpGrammarBuilder Interface"),
    pointer_default(unique),
    restricted,
    local
]
interface ISpGrammarBuilder : IUnknown
{
    HRESULT ResetGrammar([in] LANGID NewLanguage);

    HRESULT GetRule([in] const WCHAR * pszRuleName,
                    [in] DWORD dwRuleId,
                    [in] DWORD dwAttributes,
                    [in] BOOL fCreateIfNotExist,
                    [out] SPSTATEHANDLE * phInitialState);
    HRESULT ClearRule(SPSTATEHANDLE hState);

    HRESULT CreateNewState(
                SPSTATEHANDLE hState,   
                SPSTATEHANDLE * phState);

    HRESULT AddWordTransition(
                    SPSTATEHANDLE hFromState,
                    SPSTATEHANDLE hToState,
                    const WCHAR * psz,      // If NULL then epsilon
                    const WCHAR * pszSeparators,    // If NULL then psz points to a single word, else specifies valid separator characters
                    SPGRAMMARWORDTYPE eWordType,
                    float Weight,
                    const SPPROPERTYINFO * pPropInfo);

    HRESULT AddRuleTransition(
                SPSTATEHANDLE hFromState,
                SPSTATEHANDLE hToState,
                SPSTATEHANDLE hRule,    // Must be the initial state of the rule
                float Weight,
                const SPPROPERTYINFO * pPropInfo);

    HRESULT AddResource([in] SPSTATEHANDLE hRuleState,  // Any state handle in a rule is OK
                        [in] const WCHAR * pszResourceName,
                        [in] const WCHAR * pszResourceValue);

    HRESULT Commit(DWORD dwReserved);
};
*/

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

// ISpPhoneConverter Interface
interface ISpPhoneConverter : ISpObjectWithToken {
  mixin(uuid("8445c581-0cac-4a38-abfe-9b2ce2826455"));
  //static DWINGUID IID = { 0x8445c581, 0x0cac, 0x4a38, 0xab, 0xfe, 0x9b, 0x2c, 0xe2, 0x82, 0x64, 0x55 };
  /*[id(0x60020000)]*/ int PhoneToId(ushort* pszPhone, out ushort pId);
  /*[id(0x60020001)]*/ int IdToPhone(ushort* pId, out ushort pszPhone);
}

// ISpObjectWithToken Interface
interface ISpObjectWithToken : IUnknown {
  mixin(uuid("5b559f40-e952-11d2-bb91-00c04f8ee6c0"));
  //static DWINGUID IID = { 0x5b559f40, 0xe952, 0x11d2, 0xbb, 0x91, 0x00, 0xc0, 0x4f, 0x8e, 0xe6, 0xc0 };
  /*[id(0x60010000)]*/ int SetObjectToken(ISpObjectToken pToken);
  /*[id(0x60010001)]*/ int GetObjectToken(ISpObjectToken* ppToken);
}

// CoClasses

// SREngine
abstract class SREngine {
  mixin(uuid("ec468149-6916-11d2-9427-00c04f8ef48f"));
  //static DWINGUID CLSID = { 0xec468149, 0x6916, 0x11d2, 0x94, 0x27, 0x00, 0xc0, 0x4f, 0x8e, 0xf4, 0x8f };
  mixin Interfaces!(ISpSREngine);
}

// Alternates Class
abstract class Alternates {
  mixin(uuid("19efc4d2-5251-4eb5-84c8-5a970ff8f5e0"));
  //static DWINGUID CLSID = { 0x19efc4d2, 0x5251, 0x4eb5, 0x84, 0xc8, 0x5a, 0x97, 0x0f, 0xf8, 0xf5, 0xe0 };
  mixin Interfaces!(ISpSRAlternates);
}

// SpSRJpnPhoneConverter Class
abstract class SpSRJpnPhoneConverter {
  mixin(uuid("93520e48-87da-11d3-9517-00c04f604ff2"));
  //static DWINGUID CLSID = { 0x93520e48, 0x87da, 0x11d3, 0x95, 0x17, 0x00, 0xc0, 0x4f, 0x60, 0x4f, 0xf2 };
  mixin Interfaces!(ISpPhoneConverter);
}

// SpSRChsPhoneConverter Class
abstract class SpSRChsPhoneConverter {
  mixin(uuid("93520e49-87da-11d3-9517-00c04f604ff2"));
  //static DWINGUID CLSID = { 0x93520e49, 0x87da, 0x11d3, 0x95, 0x17, 0x00, 0xc0, 0x4f, 0x60, 0x4f, 0xf2 };
  mixin Interfaces!(ISpPhoneConverter);
}

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
