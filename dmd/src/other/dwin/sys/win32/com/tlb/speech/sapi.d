// Microsoft Speech Object Library
// Version 5.0
//C:\Program Files\Common Files\Microsoft Shared\Speech\sapi.dll 
//mixin(uuid("c866ca3a-32f7-11d2-9602-00c04f8ee628"));
//module speechlib;
module dwin.sys.win32.com.tlb.speech.sapi;

/*[importlib("stdole2.tlb")]*/
private import dwin.sys.win32.com.Core;

// Enums

enum SpeechDataKeyLocation {
  SDKLDefaultLocation = 0x00000000,
  SDKLCurrentUser = 0x00000001,
  SDKLLocalMachine = 0x00000002,
  SDKLCurrentConfig = 0x00000005,
}

enum SpeechTokenContext {
  STCInprocServer = 0x00000001,
  STCInprocHandler = 0x00000002,
  STCLocalServer = 0x00000004,
  STCRemoteServer = 0x00000010,
  STCAll = 0x00000017,
}

enum SpeechTokenShellFolder {
  STSF_AppData = 0x0000001A,
  STSF_LocalAppData = 0x0000001C,
  STSF_CommonAppData = 0x00000023,
  STSF_FlagCreate = 0x00008000,
}

enum SpeechAudioState {
  SASClosed = 0x00000000,
  SASStop = 0x00000001,
  SASPause = 0x00000002,
  SASRun = 0x00000003,
}

enum SpeechAudioFormatType {
  SAFTDefault = 0xFFFFFFFF,
  SAFTNoAssignedFormat = 0x00000000,
  SAFTText = 0x00000001,
  SAFTNonStandardFormat = 0x00000002,
  SAFTExtendedAudioFormat = 0x00000003,
  SAFT8kHz8BitMono = 0x00000004,
  SAFT8kHz8BitStereo = 0x00000005,
  SAFT8kHz16BitMono = 0x00000006,
  SAFT8kHz16BitStereo = 0x00000007,
  SAFT11kHz8BitMono = 0x00000008,
  SAFT11kHz8BitStereo = 0x00000009,
  SAFT11kHz16BitMono = 0x0000000A,
  SAFT11kHz16BitStereo = 0x0000000B,
  SAFT12kHz8BitMono = 0x0000000C,
  SAFT12kHz8BitStereo = 0x0000000D,
  SAFT12kHz16BitMono = 0x0000000E,
  SAFT12kHz16BitStereo = 0x0000000F,
  SAFT16kHz8BitMono = 0x00000010,
  SAFT16kHz8BitStereo = 0x00000011,
  SAFT16kHz16BitMono = 0x00000012,
  SAFT16kHz16BitStereo = 0x00000013,
  SAFT22kHz8BitMono = 0x00000014,
  SAFT22kHz8BitStereo = 0x00000015,
  SAFT22kHz16BitMono = 0x00000016,
  SAFT22kHz16BitStereo = 0x00000017,
  SAFT24kHz8BitMono = 0x00000018,
  SAFT24kHz8BitStereo = 0x00000019,
  SAFT24kHz16BitMono = 0x0000001A,
  SAFT24kHz16BitStereo = 0x0000001B,
  SAFT32kHz8BitMono = 0x0000001C,
  SAFT32kHz8BitStereo = 0x0000001D,
  SAFT32kHz16BitMono = 0x0000001E,
  SAFT32kHz16BitStereo = 0x0000001F,
  SAFT44kHz8BitMono = 0x00000020,
  SAFT44kHz8BitStereo = 0x00000021,
  SAFT44kHz16BitMono = 0x00000022,
  SAFT44kHz16BitStereo = 0x00000023,
  SAFT48kHz8BitMono = 0x00000024,
  SAFT48kHz8BitStereo = 0x00000025,
  SAFT48kHz16BitMono = 0x00000026,
  SAFT48kHz16BitStereo = 0x00000027,
  SAFTTrueSpeech_8kHz1BitMono = 0x00000028,
  SAFTCCITT_ALaw_8kHzMono = 0x00000029,
  SAFTCCITT_ALaw_8kHzStereo = 0x0000002A,
  SAFTCCITT_ALaw_11kHzMono = 0x0000002B,
  SAFTCCITT_ALaw_11kHzStereo = 0x0000002C,
  SAFTCCITT_ALaw_22kHzMono = 0x0000002D,
  SAFTCCITT_ALaw_22kHzStereo = 0x0000002E,
  SAFTCCITT_ALaw_44kHzMono = 0x0000002F,
  SAFTCCITT_ALaw_44kHzStereo = 0x00000030,
  SAFTCCITT_uLaw_8kHzMono = 0x00000031,
  SAFTCCITT_uLaw_8kHzStereo = 0x00000032,
  SAFTCCITT_uLaw_11kHzMono = 0x00000033,
  SAFTCCITT_uLaw_11kHzStereo = 0x00000034,
  SAFTCCITT_uLaw_22kHzMono = 0x00000035,
  SAFTCCITT_uLaw_22kHzStereo = 0x00000036,
  SAFTCCITT_uLaw_44kHzMono = 0x00000037,
  SAFTCCITT_uLaw_44kHzStereo = 0x00000038,
  SAFTADPCM_8kHzMono = 0x00000039,
  SAFTADPCM_8kHzStereo = 0x0000003A,
  SAFTADPCM_11kHzMono = 0x0000003B,
  SAFTADPCM_11kHzStereo = 0x0000003C,
  SAFTADPCM_22kHzMono = 0x0000003D,
  SAFTADPCM_22kHzStereo = 0x0000003E,
  SAFTADPCM_44kHzMono = 0x0000003F,
  SAFTADPCM_44kHzStereo = 0x00000040,
  SAFTGSM610_8kHzMono = 0x00000041,
  SAFTGSM610_11kHzMono = 0x00000042,
  SAFTGSM610_22kHzMono = 0x00000043,
  SAFTGSM610_44kHzMono = 0x00000044,
}

enum SpeechStreamSeekPositionType {
  SSSPTRelativeToStart = 0x00000000,
  SSSPTRelativeToCurrentPosition = 0x00000001,
  SSSPTRelativeToEnd = 0x00000002,
}

enum SpeechStreamFileMode {
  SSFMOpenForRead = 0x00000000,
  SSFMOpenReadWrite = 0x00000001,
  SSFMCreate = 0x00000002,
  SSFMCreateForWrite = 0x00000003,
}

enum SpeechRunState {
  SRSEDone = 0x00000001,
  SRSEIsSpeaking = 0x00000002,
}

enum SpeechVoiceEvents {
  SVEStartInputStream = 0x00000002,
  SVEEndInputStream = 0x00000004,
  SVEVoiceChange = 0x00000008,
  SVEBookmark = 0x00000010,
  SVEWordBoundary = 0x00000020,
  SVEPhoneme = 0x00000040,
  SVESentenceBoundary = 0x00000080,
  SVEViseme = 0x00000100,
  SVEAudioLevel = 0x00000200,
  SVEPrivate = 0x00008000,
  SVEAllEvents = 0x000083FE,
}

enum SpeechVoicePriority {
  SVPNormal = 0x00000000,
  SVPAlert = 0x00000001,
  SVPOver = 0x00000002,
}

enum SpeechVoiceSpeakFlags {
  SVSFDefault = 0x00000000,
  SVSFlagsAsync = 0x00000001,
  SVSFPurgeBeforeSpeak = 0x00000002,
  SVSFIsFilename = 0x00000004,
  SVSFIsXML = 0x00000008,
  SVSFIsNotXML = 0x00000010,
  SVSFPersistXML = 0x00000020,
  SVSFNLPSpeakPunc = 0x00000040,
  SVSFNLPMask = 0x00000040,
  SVSFVoiceMask = 0x0000007F,
  SVSFUnusedFlags = 0xFFFFFF80,
}

enum SpeechVisemeFeature {
  SVF_None = 0x00000000,
  SVF_Stressed = 0x00000001,
  SVF_Emphasis = 0x00000002,
}

enum SpeechVisemeType {
  SVP_0 = 0x00000000,
  SVP_1 = 0x00000001,
  SVP_2 = 0x00000002,
  SVP_3 = 0x00000003,
  SVP_4 = 0x00000004,
  SVP_5 = 0x00000005,
  SVP_6 = 0x00000006,
  SVP_7 = 0x00000007,
  SVP_8 = 0x00000008,
  SVP_9 = 0x00000009,
  SVP_10 = 0x0000000A,
  SVP_11 = 0x0000000B,
  SVP_12 = 0x0000000C,
  SVP_13 = 0x0000000D,
  SVP_14 = 0x0000000E,
  SVP_15 = 0x0000000F,
  SVP_16 = 0x00000010,
  SVP_17 = 0x00000011,
  SVP_18 = 0x00000012,
  SVP_19 = 0x00000013,
  SVP_20 = 0x00000014,
  SVP_21 = 0x00000015,
}

enum SpeechRecognizerState {
  SRSInactive = 0x00000000,
  SRSActive = 0x00000001,
  SRSActiveAlways = 0x00000002,
  SRSInactiveWithPurge = 0x00000003,
}

enum SpeechInterference {
  SINone = 0x00000000,
  SINoise = 0x00000001,
  SINoSignal = 0x00000002,
  SITooLoud = 0x00000003,
  SITooQuiet = 0x00000004,
  SITooFast = 0x00000005,
  SITooSlow = 0x00000006,
}

enum SpeechRecoEvents {
  SREStreamEnd = 0x00000001,
  SRESoundStart = 0x00000002,
  SRESoundEnd = 0x00000004,
  SREPhraseStart = 0x00000008,
  SRERecognition = 0x00000010,
  SREHypothesis = 0x00000020,
  SREBookmark = 0x00000040,
  SREPropertyNumChange = 0x00000080,
  SREPropertyStringChange = 0x00000100,
  SREFalseRecognition = 0x00000200,
  SREInterference = 0x00000400,
  SRERequestUI = 0x00000800,
  SREStateChange = 0x00001000,
  SREAdaptation = 0x00002000,
  SREStreamStart = 0x00004000,
  SRERecoOtherContext = 0x00008000,
  SREAudioLevel = 0x00010000,
  SREPrivate = 0x00040000,
  SREAllEvents = 0x0005FFFF,
}

enum SpeechRecoContextState {
  SRCS_Disabled = 0x00000000,
  SRCS_Enabled = 0x00000001,
}

enum SpeechRetainedAudioOptions {
  SRAONone = 0x00000000,
  SRAORetainAudio = 0x00000001,
}

enum SpeechGrammarState {
  SGSEnabled = 0x00000001,
  SGSDisabled = 0x00000000,
  SGSExclusive = 0x00000003,
}

enum SpeechRuleAttributes {
  SRATopLevel = 0x00000001,
  SRADefaultToActive = 0x00000002,
  SRAExport = 0x00000004,
  SRAImport = 0x00000008,
  SRAInterpreter = 0x00000010,
  SRADynamic = 0x00000020,
}

enum SpeechGrammarRuleStateTransitionType {
  SGRSTTEpsilon = 0x00000000,
  SGRSTTWord = 0x00000001,
  SGRSTTRule = 0x00000002,
  SGRSTTDictation = 0x00000003,
  SGRSTTWildcard = 0x00000004,
  SGRSTTTextBuffer = 0x00000005,
}

enum SpeechGrammarWordType {
  SGDisplay = 0x00000000,
  SGLexical = 0x00000001,
  SGPronounciation = 0x00000002,
}

enum SpeechSpecialTransitionType {
  SSTTWildcard = 0x00000001,
  SSTTDictation = 0x00000002,
  SSTTTextBuffer = 0x00000003,
}

enum SpeechLoadOption {
  SLOStatic = 0x00000000,
  SLODynamic = 0x00000001,
}

enum SpeechRuleState {
  SGDSInactive = 0x00000000,
  SGDSActive = 0x00000001,
  SGDSActiveWithAutoPause = 0x00000003,
}

enum SpeechWordPronounceable {
  SWPUnknownWordUnpronounceable = 0x00000000,
  SWPUnknownWordPronounceable = 0x00000001,
  SWPKnownWordPronounceable = 0x00000002,
}

enum SpeechEngineConfidence {
  SECLowConfidence = 0xFFFFFFFF,
  SECNormalConfidence = 0x00000000,
  SECHighConfidence = 0x00000001,
}

enum SpeechDisplayAttributes {
  SDA_No_Trailing_Space = 0x00000000,
  SDA_One_Trailing_Space = 0x00000002,
  SDA_Two_Trailing_Spaces = 0x00000004,
  SDA_Consume_Leading_Spaces = 0x00000008,
}

enum SpeechDiscardType {
  SDTProperty = 0x00000001,
  SDTReplacement = 0x00000002,
  SDTRule = 0x00000004,
  SDTDisplayText = 0x00000008,
  SDTLexicalForm = 0x00000010,
  SDTPronunciation = 0x00000020,
  SDTAudio = 0x00000040,
  SDTAlternates = 0x00000080,
  SDTAll = 0x000000FF,
}

enum SpeechBookmarkOptions {
  SBONone = 0x00000000,
  SBOPause = 0x00000001,
}

enum SpeechFormatType {
  SFTInput = 0x00000000,
  SFTSREngine = 0x00000001,
}

enum SpeechRecognitionType {
  SRTStandard = 0x00000000,
  SRTAutopause = 0x00000001,
  SRTEmulated = 0x00000002,
}

enum SpeechLexiconType {
  SLTUser = 0x00000001,
  SLTApp = 0x00000002,
}

enum SpeechWordType {
  SWTAdded = 0x00000001,
  SWTDeleted = 0x00000002,
}

enum SpeechPartOfSpeech {
  SPSNotOverriden = 0xFFFFFFFF,
  SPSUnknown = 0x00000000,
  SPSNoun = 0x00001000,
  SPSVerb = 0x00002000,
  SPSModifier = 0x00003000,
  SPSFunction = 0x00004000,
  SPSInterjection = 0x00005000,
}

enum DISPID_SpeechDataKey {
  DISPID_SDKSetBinaryValue = 0x00000001,
  DISPID_SDKGetBinaryValue = 0x00000002,
  DISPID_SDKSetStringValue = 0x00000003,
  DISPID_SDKGetStringValue = 0x00000004,
  DISPID_SDKSetLongValue = 0x00000005,
  DISPID_SDKGetlongValue = 0x00000006,
  DISPID_SDKOpenKey = 0x00000007,
  DISPID_SDKCreateKey = 0x00000008,
  DISPID_SDKDeleteKey = 0x00000009,
  DISPID_SDKDeleteValue = 0x0000000A,
  DISPID_SDKEnumKeys = 0x0000000B,
  DISPID_SDKEnumValues = 0x0000000C,
}

enum DISPID_SpeechObjectToken {
  DISPID_SOTId = 0x00000001,
  DISPID_SOTDataKey = 0x00000002,
  DISPID_SOTCategory = 0x00000003,
  DISPID_SOTGetDescription = 0x00000004,
  DISPID_SOTSetId = 0x00000005,
  DISPID_SOTGetAttribute = 0x00000006,
  DISPID_SOTCreateInstance = 0x00000007,
  DISPID_SOTRemove = 0x00000008,
  DISPID_SOTGetStorageFileName = 0x00000009,
  DISPID_SOTRemoveStorageFileName = 0x0000000A,
  DISPID_SOTIsUISupported = 0x0000000B,
  DISPID_SOTDisplayUI = 0x0000000C,
  DISPID_SOTMatchesAttributes = 0x0000000D,
}

enum DISPID_SpeechObjectTokens {
  DISPID_SOTsCount = 0x00000001,
  DISPID_SOTsItem = 0x00000000,
  DISPID_SOTs_NewEnum = 0xFFFFFFFC,
}

enum DISPID_SpeechObjectTokenCategory {
  DISPID_SOTCId = 0x00000001,
  DISPID_SOTCDefault = 0x00000002,
  DISPID_SOTCSetId = 0x00000003,
  DISPID_SOTCGetDataKey = 0x00000004,
  DISPID_SOTCEnumerateTokens = 0x00000005,
}

enum DISPID_SpeechAudioFormat {
  DISPID_SAFType = 0x00000001,
  DISPID_SAFGuid = 0x00000002,
  DISPID_SAFGetWaveFormatEx = 0x00000003,
  DISPID_SAFSetWaveFormatEx = 0x00000004,
}

enum DISPID_SpeechBaseStream {
  DISPID_SBSFormat = 0x00000001,
  DISPID_SBSRead = 0x00000002,
  DISPID_SBSWrite = 0x00000003,
  DISPID_SBSSeek = 0x00000004,
}

enum DISPID_SpeechAudio {
  DISPID_SAStatus = 0x000000C8,
  DISPID_SABufferInfo = 0x000000C9,
  DISPID_SADefaultFormat = 0x000000CA,
  DISPID_SAVolume = 0x000000CB,
  DISPID_SABufferNotifySize = 0x000000CC,
  DISPID_SAEventHandle = 0x000000CD,
  DISPID_SASetState = 0x000000CE,
}

enum DISPID_SpeechMMSysAudio {
  DISPID_SMSADeviceId = 0x0000012C,
  DISPID_SMSALineId = 0x0000012D,
  DISPID_SMSAMMHandle = 0x0000012E,
}

enum DISPID_SpeechFileStream {
  DISPID_SFSOpen = 0x00000064,
  DISPID_SFSClose = 0x00000065,
}

enum DISPID_SpeechCustomStream {
  DISPID_SCSBaseStream = 0x00000064,
}

enum DISPID_SpeechMemoryStream {
  DISPID_SMSSetData = 0x00000064,
  DISPID_SMSGetData = 0x00000065,
}

enum DISPID_SpeechAudioStatus {
  DISPID_SASFreeBufferSpace = 0x00000001,
  DISPID_SASNonBlockingIO = 0x00000002,
  DISPID_SASState = 0x00000003,
  DISPID_SASCurrentSeekPosition = 0x00000004,
  DISPID_SASCurrentDevicePosition = 0x00000005,
}

enum DISPID_SpeechAudioBufferInfo {
  DISPID_SABIMinNotification = 0x00000001,
  DISPID_SABIBufferSize = 0x00000002,
  DISPID_SABIEventBias = 0x00000003,
}

enum DISPID_SpeechWaveFormatEx {
  DISPID_SWFEFormatTag = 0x00000001,
  DISPID_SWFEChannels = 0x00000002,
  DISPID_SWFESamplesPerSec = 0x00000003,
  DISPID_SWFEAvgBytesPerSec = 0x00000004,
  DISPID_SWFEBlockAlign = 0x00000005,
  DISPID_SWFEBitsPerSample = 0x00000006,
  DISPID_SWFEExtraData = 0x00000007,
}

enum DISPID_SpeechVoice {
  DISPID_SVStatus = 0x00000001,
  DISPID_SVVoice = 0x00000002,
  DISPID_SVAudioOutput = 0x00000003,
  DISPID_SVAudioOutputStream = 0x00000004,
  DISPID_SVRate = 0x00000005,
  DISPID_SVVolume = 0x00000006,
  DISPID_SVAllowAudioOuputFormatChangesOnNextSet = 0x00000007,
  DISPID_SVEventInterests = 0x00000008,
  DISPID_SVPriority = 0x00000009,
  DISPID_SVAlertBoundary = 0x0000000A,
  DISPID_SVSyncronousSpeakTimeout = 0x0000000B,
  DISPID_SVSpeak = 0x0000000C,
  DISPID_SVSpeakStream = 0x0000000D,
  DISPID_SVPause = 0x0000000E,
  DISPID_SVResume = 0x0000000F,
  DISPID_SVSkip = 0x00000010,
  DISPID_SVGetVoices = 0x00000011,
  DISPID_SVGetAudioOutputs = 0x00000012,
  DISPID_SVWaitUntilDone = 0x00000013,
  DISPID_SVSpeakCompleteEvent = 0x00000014,
  DISPID_SVIsUISupported = 0x00000015,
  DISPID_SVDisplayUI = 0x00000016,
}

enum DISPID_SpeechVoiceStatus {
  DISPID_SVSCurrentStreamNumber = 0x00000001,
  DISPID_SVSLastStreamNumberQueued = 0x00000002,
  DISPID_SVSLastResult = 0x00000003,
  DISPID_SVSRunningState = 0x00000004,
  DISPID_SVSInputWordPosition = 0x00000005,
  DISPID_SVSInputWordLength = 0x00000006,
  DISPID_SVSInputSentencePosition = 0x00000007,
  DISPID_SVSInputSentenceLength = 0x00000008,
  DISPID_SVSLastBookmark = 0x00000009,
  DISPID_SVSLastBookmarkId = 0x0000000A,
  DISPID_SVSPhonemeId = 0x0000000B,
  DISPID_SVSVisemeId = 0x0000000C,
}

enum DISPID_SpeechVoiceEvent {
  DISPID_SVEStreamStart = 0x00000001,
  DISPID_SVEStreamEnd = 0x00000002,
  DISPID_SVEVoiceChange = 0x00000003,
  DISPID_SVEBookmark = 0x00000004,
  DISPID_SVEWord = 0x00000005,
  DISPID_SVEPhoneme = 0x00000006,
  DISPID_SVESentenceBoundary = 0x00000007,
  DISPID_SVEViseme = 0x00000008,
  DISPID_SVEAudioLevel = 0x00000009,
  DISPID_SVEEnginePrivate = 0x0000000A,
}

enum DISPID_SpeechRecognizer {
  DISPID_SRRecognizer = 0x00000001,
  DISPID_SRAllowAudioInputFormatChangesOnNextSet = 0x00000002,
  DISPID_SRAudioInput = 0x00000003,
  DISPID_SRAudioInputStream = 0x00000004,
  DISPID_SRIsShared = 0x00000005,
  DISPID_SRState = 0x00000006,
  DISPID_SRStatus = 0x00000007,
  DISPID_SRProfile = 0x00000008,
  DISPID_SREmulateRecognition = 0x00000009,
  DISPID_SRCreateRecoContext = 0x0000000A,
  DISPID_SRGetFormat = 0x0000000B,
  DISPID_SRSetPropertyNumber = 0x0000000C,
  DISPID_SRGetPropertyNumber = 0x0000000D,
  DISPID_SRSetPropertyString = 0x0000000E,
  DISPID_SRGetPropertyString = 0x0000000F,
  DISPID_SRIsUISupported = 0x00000010,
  DISPID_SRDisplayUI = 0x00000011,
  DISPID_SRGetRecognizers = 0x00000012,
  DISPID_SVGetAudioInputs = 0x00000013,
  DISPID_SVGetProfiles = 0x00000014,
}

enum DISPID_SpeechRecognizerStatus {
  DISPID_SRSAudioStatus = 0x00000001,
  DISPID_SRSCurrentStreamPosition = 0x00000002,
  DISPID_SRSCurrentStreamNumber = 0x00000003,
  DISPID_SRSNumberOfActiveRules = 0x00000004,
  DISPID_SRSClsidEngine = 0x00000005,
  DISPID_SRSSupportedLanguages = 0x00000006,
}

enum DISPID_SpeechRecoContext {
  DISPID_SRCRecognizer = 0x00000001,
  DISPID_SRCAudioInInterferenceStatus = 0x00000002,
  DISPID_SRCRequestedUIType = 0x00000003,
  DISPID_SRCVoice = 0x00000004,
  DISPID_SRAllowVoiceFormatMatchingOnNextSet = 0x00000005,
  DISPID_SRCVoicePurgeEvent = 0x00000006,
  DISPID_SRCEventInterests = 0x00000007,
  DISPID_SRCCmdMaxAlternates = 0x00000008,
  DISPID_SRCState = 0x00000009,
  DISPID_SRCRetainedAudio = 0x0000000A,
  DISPID_SRCRetainedAudioFormat = 0x0000000B,
  DISPID_SRCPause = 0x0000000C,
  DISPID_SRCResume = 0x0000000D,
  DISPID_SRCCreateGrammar = 0x0000000E,
  DISPID_SRCCreateResultFromMemory = 0x0000000F,
  DISPID_SRCBookmark = 0x00000010,
  DISPID_SRCSetAdaptationData = 0x00000011,
}

enum DISPIDSPRG {
  DISPID_SRGId = 0x00000001,
  DISPID_SRGRecoContext = 0x00000002,
  DISPID_SRGState = 0x00000003,
  DISPID_SRGRules = 0x00000004,
  DISPID_SRGReset = 0x00000005,
  DISPID_SRGCommit = 0x00000006,
  DISPID_SRGCmdLoadFromFile = 0x00000007,
  DISPID_SRGCmdLoadFromObject = 0x00000008,
  DISPID_SRGCmdLoadFromResource = 0x00000009,
  DISPID_SRGCmdLoadFromMemory = 0x0000000A,
  DISPID_SRGCmdLoadFromProprietaryGrammar = 0x0000000B,
  DISPID_SRGCmdSetRuleState = 0x0000000C,
  DISPID_SRGCmdSetRuleIdState = 0x0000000D,
  DISPID_SRGDictationLoad = 0x0000000E,
  DISPID_SRGDictationUnload = 0x0000000F,
  DISPID_SRGDictationSetState = 0x00000010,
  DISPID_SRGSetWordSequenceData = 0x00000011,
  DISPID_SRGSetTextSelection = 0x00000012,
  DISPID_SRGIsPronounceable = 0x00000013,
}

enum DISPID_SpeechRecoContextEvents {
  DISPID_SRCEStartStream = 0x00000001,
  DISPID_SRCEEndStream = 0x00000002,
  DISPID_SRCEBookmark = 0x00000003,
  DISPID_SRCESoundStart = 0x00000004,
  DISPID_SRCESoundEnd = 0x00000005,
  DISPID_SRCEPhraseStart = 0x00000006,
  DISPID_SRCERecognition = 0x00000007,
  DISPID_SRCEHypothesis = 0x00000008,
  DISPID_SRCEPropertyNumberChange = 0x00000009,
  DISPID_SRCEPropertyStringChange = 0x0000000A,
  DISPID_SRCEFalseRecognition = 0x0000000B,
  DISPID_SRCEInterference = 0x0000000C,
  DISPID_SRCERequestUI = 0x0000000D,
  DISPID_SRCERecognizerStateChange = 0x0000000E,
  DISPID_SRCEAdaptation = 0x0000000F,
  DISPID_SRCERecognitionForOtherContext = 0x00000010,
  DISPID_SRCEAudioLevel = 0x00000011,
  DISPID_SRCEEnginePrivate = 0x00000012,
}

enum DISPID_SpeechGrammarRule {
  DISPID_SGRAttributes = 0x00000001,
  DISPID_SGRInitialState = 0x00000002,
  DISPID_SGRName = 0x00000003,
  DISPID_SGRId = 0x00000004,
  DISPID_SGRClear = 0x00000005,
  DISPID_SGRAddResource = 0x00000006,
  DISPID_SGRAddState = 0x00000007,
}

enum DISPID_SpeechGrammarRules {
  DISPID_SGRsCount = 0x00000001,
  DISPID_SGRsDynamic = 0x00000002,
  DISPID_SGRsAdd = 0x00000003,
  DISPID_SGRsCommit = 0x00000004,
  DISPID_SGRsCommitAndSave = 0x00000005,
  DISPID_SGRsFindRule = 0x00000006,
  DISPID_SGRsItem = 0x00000000,
  DISPID_SGRs_NewEnum = 0xFFFFFFFC,
}

enum DISPID_SpeechGrammarRuleState {
  DISPID_SGRSRule = 0x00000001,
  DISPID_SGRSTransitions = 0x00000002,
  DISPID_SGRSAddWordTransition = 0x00000003,
  DISPID_SGRSAddRuleTransition = 0x00000004,
  DISPID_SGRSAddSpecialTransition = 0x00000005,
}

enum DISPID_SpeechGrammarRuleStateTransitions {
  DISPID_SGRSTsCount = 0x00000001,
  DISPID_SGRSTsItem = 0x00000000,
  DISPID_SGRSTs_NewEnum = 0xFFFFFFFC,
}

enum DISPID_SpeechGrammarRuleStateTransition {
  DISPID_SGRSTType = 0x00000001,
  DISPID_SGRSTText = 0x00000002,
  DISPID_SGRSTRule = 0x00000003,
  DISPID_SGRSTWeight = 0x00000004,
  DISPID_SGRSTPropertyName = 0x00000005,
  DISPID_SGRSTPropertyId = 0x00000006,
  DISPID_SGRSTPropertyValue = 0x00000007,
  DISPID_SGRSTNextState = 0x00000008,
}

enum DISPIDSPTSI {
  DISPIDSPTSI_ActiveOffset = 0x00000001,
  DISPIDSPTSI_ActiveLength = 0x00000002,
  DISPIDSPTSI_SelectionOffset = 0x00000003,
  DISPIDSPTSI_SelectionLength = 0x00000004,
}

enum DISPID_SpeechRecoResult {
  DISPID_SRRRecoContext = 0x00000001,
  DISPID_SRRTimes = 0x00000002,
  DISPID_SRRAudioFormat = 0x00000003,
  DISPID_SRRPhraseInfo = 0x00000004,
  DISPID_SRRAlternates = 0x00000005,
  DISPID_SRRAudio = 0x00000006,
  DISPID_SRRSpeakAudio = 0x00000007,
  DISPID_SRRSaveToMemory = 0x00000008,
  DISPID_SRRDiscardResultInfo = 0x00000009,
}

enum DISPID_SpeechPhraseBuilder {
  DISPID_SPPBRestorePhraseFromMemory = 0x00000001,
}

enum DISPID_SpeechRecoResultTimes {
  DISPID_SRRTStreamTime = 0x00000001,
  DISPID_SRRTLength = 0x00000002,
  DISPID_SRRTTickCount = 0x00000003,
  DISPID_SRRTOffsetFromStart = 0x00000004,
}

enum DISPID_SpeechPhraseAlternate {
  DISPID_SPARecoResult = 0x00000001,
  DISPID_SPAStartElementInResult = 0x00000002,
  DISPID_SPANumberOfElementsInResult = 0x00000003,
  DISPID_SPAPhraseInfo = 0x00000004,
  DISPID_SPACommit = 0x00000005,
}

enum DISPID_SpeechPhraseAlternates {
  DISPID_SPAsCount = 0x00000001,
  DISPID_SPAsItem = 0x00000000,
  DISPID_SPAs_NewEnum = 0xFFFFFFFC,
}

enum DISPID_SpeechPhraseInfo {
  DISPID_SPILanguageId = 0x00000001,
  DISPID_SPIGrammarId = 0x00000002,
  DISPID_SPIStartTime = 0x00000003,
  DISPID_SPIAudioStreamPosition = 0x00000004,
  DISPID_SPIAudioSizeBytes = 0x00000005,
  DISPID_SPIRetainedSizeBytes = 0x00000006,
  DISPID_SPIAudioSizeTime = 0x00000007,
  DISPID_SPIRule = 0x00000008,
  DISPID_SPIProperties = 0x00000009,
  DISPID_SPIElements = 0x0000000A,
  DISPID_SPIReplacements = 0x0000000B,
  DISPID_SPIEngineId = 0x0000000C,
  DISPID_SPIEnginePrivateData = 0x0000000D,
  DISPID_SPISaveToMemory = 0x0000000E,
  DISPID_SPIGetText = 0x0000000F,
  DISPID_SPIGetDisplayAttributes = 0x00000010,
}

enum DISPID_SpeechPhraseElement {
  DISPID_SPEAudioTimeOffset = 0x00000001,
  DISPID_SPEAudioSizeTime = 0x00000002,
  DISPID_SPEAudioStreamOffset = 0x00000003,
  DISPID_SPEAudioSizeBytes = 0x00000004,
  DISPID_SPERetainedStreamOffset = 0x00000005,
  DISPID_SPERetainedSizeBytes = 0x00000006,
  DISPID_SPEDisplayText = 0x00000007,
  DISPID_SPELexicalForm = 0x00000008,
  DISPID_SPEPronunciation = 0x00000009,
  DISPID_SPEDisplayAttributes = 0x0000000A,
  DISPID_SPERequiredConfidence = 0x0000000B,
  DISPID_SPEActualConfidence = 0x0000000C,
  DISPID_SPEEngineConfidence = 0x0000000D,
}

enum DISPID_SpeechPhraseElements {
  DISPID_SPEsCount = 0x00000001,
  DISPID_SPEsItem = 0x00000000,
  DISPID_SPEs_NewEnum = 0xFFFFFFFC,
}

enum DISPID_SpeechPhraseReplacement {
  DISPID_SPRDisplayAttributes = 0x00000001,
  DISPID_SPRText = 0x00000002,
  DISPID_SPRFirstElement = 0x00000003,
  DISPID_SPRNumberOfElements = 0x00000004,
}

enum DISPID_SpeechPhraseReplacements {
  DISPID_SPRsCount = 0x00000001,
  DISPID_SPRsItem = 0x00000000,
  DISPID_SPRs_NewEnum = 0xFFFFFFFC,
}

enum DISPID_SpeechPhraseProperty {
  DISPID_SPPName = 0x00000001,
  DISPID_SPPId = 0x00000002,
  DISPID_SPPValue = 0x00000003,
  DISPID_SPPFirstElement = 0x00000004,
  DISPID_SPPNumberOfElements = 0x00000005,
  DISPID_SPPEngineConfidence = 0x00000006,
  DISPID_SPPConfidence = 0x00000007,
  DISPID_SPPParent = 0x00000008,
  DISPID_SPPChildren = 0x00000009,
}

enum DISPID_SpeechPhraseProperties {
  DISPID_SPPsCount = 0x00000001,
  DISPID_SPPsItem = 0x00000000,
  DISPID_SPPs_NewEnum = 0xFFFFFFFC,
}

enum DISPID_SpeechPhraseRule {
  DISPID_SPRuleName = 0x00000001,
  DISPID_SPRuleId = 0x00000002,
  DISPID_SPRuleFirstElement = 0x00000003,
  DISPID_SPRuleNumberOfElements = 0x00000004,
  DISPID_SPRuleParent = 0x00000005,
  DISPID_SPRuleChildren = 0x00000006,
  DISPID_SPRuleConfidence = 0x00000007,
  DISPID_SPRuleEngineConfidence = 0x00000008,
}

enum DISPID_SpeechPhraseRules {
  DISPID_SPRulesCount = 0x00000001,
  DISPID_SPRulesItem = 0x00000000,
  DISPID_SPRules_NewEnum = 0xFFFFFFFC,
}

enum DISPID_SpeechLexicon {
  DISPID_SLGenerationId = 0x00000001,
  DISPID_SLGetWords = 0x00000002,
  DISPID_SLAddPronunciation = 0x00000003,
  DISPID_SLAddPronunciationByPhoneIds = 0x00000004,
  DISPID_SLRemovePronunciation = 0x00000005,
  DISPID_SLRemovePronunciationByPhoneIds = 0x00000006,
  DISPID_SLGetPronunciations = 0x00000007,
  DISPID_SLGetGenerationChange = 0x00000008,
}

enum DISPID_SpeechLexiconWords {
  DISPID_SLWsCount = 0x00000001,
  DISPID_SLWsItem = 0x00000000,
  DISPID_SLWs_NewEnum = 0xFFFFFFFC,
}

enum DISPID_SpeechLexiconWord {
  DISPID_SLWLangId = 0x00000001,
  DISPID_SLWType = 0x00000002,
  DISPID_SLWWord = 0x00000003,
  DISPID_SLWPronunciations = 0x00000004,
}

enum DISPID_SpeechLexiconProns {
  DISPID_SLPsCount = 0x00000001,
  DISPID_SLPsItem = 0x00000000,
  DISPID_SLPs_NewEnum = 0xFFFFFFFC,
}

enum DISPID_SpeechLexiconPronunciation {
  DISPID_SLPType = 0x00000001,
  DISPID_SLPLangId = 0x00000002,
  DISPID_SLPPartOfSpeech = 0x00000003,
  DISPID_SLPPhoneIds = 0x00000004,
  DISPID_SLPSymbolic = 0x00000005,
}

enum DISPID_SpeechPhoneConverter {
  DISPID_SPCLangId = 0x00000001,
  DISPID_SPCPhoneToId = 0x00000002,
  DISPID_SPCIdToPhone = 0x00000003,
}

enum SPDATAKEYLOCATION {
  SPDKL_DefaultLocation = 0x00000000,
  SPDKL_CurrentUser = 0x00000001,
  SPDKL_LocalMachine = 0x00000002,
  SPDKL_CurrentConfig = 0x00000005,
}

enum _SPAUDIOSTATE {
  SPAS_CLOSED = 0x00000000,
  SPAS_STOP = 0x00000001,
  SPAS_PAUSE = 0x00000002,
  SPAS_RUN = 0x00000003,
}

enum SPFILEMODE {
  SPFM_OPEN_READONLY = 0x00000000,
  SPFM_OPEN_READWRITE = 0x00000001,
  SPFM_CREATE = 0x00000002,
  SPFM_CREATE_ALWAYS = 0x00000003,
  SPFM_NUM_MODES = 0x00000004,
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

enum SPRECOSTATE {
  SPRST_INACTIVE = 0x00000000,
  SPRST_ACTIVE = 0x00000001,
  SPRST_ACTIVE_ALWAYS = 0x00000002,
  SPRST_INACTIVE_WITH_PURGE = 0x00000003,
  SPRST_NUM_STATES = 0x00000004,
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

enum SPCONTEXTSTATE {
  SPCS_DISABLED = 0x00000000,
  SPCS_ENABLED = 0x00000001,
}

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

// Unions

union __MIDL_IWinTypes_0009 {
  int hInproc;
  int hRemote;
}

// Structs

struct _RemotableHandle {
  int fContext;
  __MIDL_IWinTypes_0009 u;
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
  uint reserved;
}

struct _FILETIME {
  uint dwLowDateTime;
  uint dwHighDateTime;
}

struct WaveFormatEx {
  ushort wFormatTag;
  ushort nChannels;
  uint nSamplesPerSec;
  uint nAvgBytesPerSec;
  ushort nBlockAlign;
  ushort wBitsPerSample;
  ushort cbSize;
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

struct SPAUDIOSTATUS {
  int cbFreeBuffSpace;
  uint cbNonBlockingIO;
  _SPAUDIOSTATE State;
  ulong CurSeekPos;
  ulong CurDevicePos;
  uint dwReserved1;
  uint dwReserved2;
}

struct SPAUDIOBUFFERINFO {
  uint ulMsMinNotification;
  uint ulMsBufferSize;
  uint ulMsEventBias;
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

struct SPRECOGNIZERSTATUS {
  SPAUDIOSTATUS AudioStatus;
  ulong ullRecognitionStreamPos;
  uint ulStreamNumber;
  uint ulNumActive;
  DWINGUID ClsidEngine;
  uint cLangIDs;
  ushort[20] aLangID;
  uint dwReserved1;
  uint dwReserved2;
}

struct SPPHRASE {
  uint cbSize;
  ushort LangId;
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
  ubyte reserved;
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

struct SPWORDPRONUNCIATIONLIST {
  uint ulSize;
  ubyte* pvBuffer;
  SPWORDPRONUNCIATION* pFirstWordPronunciation;
}

struct SPWORDPRONUNCIATION {
  SPWORDPRONUNCIATION* pNextWordPronunciation;
  SPLEXICONTYPE eLexiconType;
  ushort LangId;
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
  ushort LangId;
  ushort wReserved;
  SPWORDTYPE eWordType;
  ushort* pszWord;
  SPWORDPRONUNCIATION* pFirstWordPronunciation;
}

// Aliases

alias _RemotableHandle* wireHWND;

alias uint UINT_PTR;

alias int LONG_PTR;

alias _SPAUDIOSTATE SPAUDIOSTATE;

alias SPWAVEFORMATTYPE SPSTREAMFORMATTYPE;

alias tagSPPROPERTYINFO SPPROPERTYINFO;

alias tagSPTEXTSELECTIONINFO SPTEXTSELECTIONINFO;

// Interfaces

// ISpeechDataKey Interface
interface ISpeechDataKey : IDispatch {
  mixin(uuid("ce17c09b-4efa-44d5-a4c9-59d9585ab0cd"));
  //static DWINGUID IID = { 0xce17c09b, 0x4efa, 0x44d5, 0xa4, 0xc9, 0x59, 0xd9, 0x58, 0x5a, 0xb0, 0xcd };
  // SetBinaryValue
  /*[id(0x00000001)]*/ int SetBinaryValue(wchar* ValueName, DWINVARIANT Value);
  // GetBinaryValue
  /*[id(0x00000002)]*/ int GetBinaryValue(wchar* ValueName, out DWINVARIANT Value);
  // SetStringValue
  /*[id(0x00000003)]*/ int SetStringValue(wchar* ValueName, wchar* Value);
  // GetStringValue
  /*[id(0x00000004)]*/ int GetStringValue(wchar* ValueName, out wchar* Value);
  // SetLongValue
  /*[id(0x00000005)]*/ int SetLongValue(wchar* ValueName, int Value);
  // GetlongValue
  /*[id(0x00000006)]*/ int GetLongValue(wchar* ValueName, out int Value);
  // OpenKey
  /*[id(0x00000007)]*/ int OpenKey(wchar* SubKeyName, out ISpeechDataKey SubKey);
  // CreateKey
  /*[id(0x00000008)]*/ int CreateKey(wchar* SubKeyName, out ISpeechDataKey SubKey);
  // DeleteKey
  /*[id(0x00000009)]*/ int DeleteKey(wchar* SubKeyName);
  // DeleteValue
  /*[id(0x0000000A)]*/ int DeleteValue(wchar* ValueName);
  // EnumKeys
  /*[id(0x0000000B)]*/ int EnumKeys(int Index, out wchar* SubKeyName);
  // EnumValues
  /*[id(0x0000000C)]*/ int EnumValues(int Index, out wchar* ValueName);
}

// ISpeechObjectToken Interface
interface ISpeechObjectToken : IDispatch {
  mixin(uuid("c74a3adc-b727-4500-a84a-b526721c8b8c"));
  //static DWINGUID IID = { 0xc74a3adc, 0xb727, 0x4500, 0xa8, 0x4a, 0xb5, 0x26, 0x72, 0x1c, 0x8b, 0x8c };
  // Id
  /*[id(0x00000001)]*/ int get_Id(out wchar* ObjectId);
  // DataKey
  /*[id(0x00000002)]*/ int get_DataKey(out ISpeechDataKey DataKey);
  // Category
  /*[id(0x00000003)]*/ int get_Category(out ISpeechObjectTokenCategory Category);
  // GetDescription
  /*[id(0x00000004)]*/ int GetDescription(int Locale, out wchar* Description);
  // SetId
  /*[id(0x00000005)]*/ int SetId(wchar* Id, wchar* CategoryID, short CreateIfNotExist);
  // GetAttribute
  /*[id(0x00000006)]*/ int GetAttribute(wchar* AttributeName, out wchar* AttributeValue);
  // CreateInstance
  /*[id(0x00000007)]*/ int CreateInstance(IUnknown pUnkOuter, SpeechTokenContext ClsContext, out IUnknown ObjectParam);
  // Remove
  /*[id(0x00000008)]*/ int Remove(wchar* ObjectStorageCLSID);
  // GetStorageFileName
  /*[id(0x00000009)]*/ int GetStorageFileName(wchar* ObjectStorageCLSID, wchar* KeyName, wchar* FileName, SpeechTokenShellFolder Folder, out wchar* FilePath);
  // RemoveStorageFileName
  /*[id(0x0000000A)]*/ int RemoveStorageFileName(wchar* ObjectStorageCLSID, wchar* KeyName, short DeleteFile);
  // IsUISupported
  /*[id(0x0000000B)]*/ int IsUISupported(wchar* TypeOfUI, DWINVARIANT* ExtraData, IUnknown ObjectParam, out short Supported);
  // DisplayUI
  /*[id(0x0000000C)]*/ int DisplayUI(int hWnd, wchar* Title, wchar* TypeOfUI, DWINVARIANT* ExtraData, IUnknown ObjectParam);
  // MatchesAttributes
  /*[id(0x0000000D)]*/ int MatchesAttributes(wchar* Attributes, out short Matches);
}

// ISpeechObjectTokenCategory Interface
interface ISpeechObjectTokenCategory : IDispatch {
  mixin(uuid("ca7eac50-2d01-4145-86d4-5ae7d70f4469"));
  //static DWINGUID IID = { 0xca7eac50, 0x2d01, 0x4145, 0x86, 0xd4, 0x5a, 0xe7, 0xd7, 0x0f, 0x44, 0x69 };
  // Id
  /*[id(0x00000001)]*/ int get_Id(out wchar* Id);
  // Default
  /*[id(0x00000002)]*/ int set_Default(wchar* TokenId);
  // Default
  /*[id(0x00000002)]*/ int get_Default(out wchar* TokenId);
  // SetId
  /*[id(0x00000003)]*/ int SetId(wchar* Id, short CreateIfNotExist);
  // GetDataKey
  /*[id(0x00000004)]*/ int GetDataKey(SpeechDataKeyLocation Location, out ISpeechDataKey DataKey);
  // EnumerateTokens
  /*[id(0x00000005)]*/ int EnumerateTokens(wchar* RequiredAttributes, wchar* OptionalAttributes, out ISpeechObjectTokens Tokens);
}

// ISpeechObjectTokens Interface
interface ISpeechObjectTokens : IDispatch {
  mixin(uuid("9285b776-2e7b-4bc0-b53e-580eb6fa967f"));
  //static DWINGUID IID = { 0x9285b776, 0x2e7b, 0x4bc0, 0xb5, 0x3e, 0x58, 0x0e, 0xb6, 0xfa, 0x96, 0x7f };
  // Count
  /*[id(0x00000001)]*/ int get_Count(out int Count);
  // Item
  /*[id(0x00000000)]*/ int Item(int Index, out ISpeechObjectToken Token);
  // Enumerates the tokens
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown ppEnumVARIANT);
}

// ISpeechAudioBufferInfo Interface
interface ISpeechAudioBufferInfo : IDispatch {
  mixin(uuid("11b103d8-1142-4edf-a093-82fb3915f8cc"));
  //static DWINGUID IID = { 0x11b103d8, 0x1142, 0x4edf, 0xa0, 0x93, 0x82, 0xfb, 0x39, 0x15, 0xf8, 0xcc };
  // MinNotification
  /*[id(0x00000001)]*/ int get_MinNotification(out int MinNotification);
  // MinNotification
  /*[id(0x00000001)]*/ int set_MinNotification(int MinNotification);
  // BufferSize
  /*[id(0x00000002)]*/ int get_BufferSize(out int BufferSize);
  // BufferSize
  /*[id(0x00000002)]*/ int set_BufferSize(int BufferSize);
  // EventBias
  /*[id(0x00000003)]*/ int get_EventBias(out int EventBias);
  // EventBias
  /*[id(0x00000003)]*/ int set_EventBias(int EventBias);
}

// ISpeechAudioStatus Interface
interface ISpeechAudioStatus : IDispatch {
  mixin(uuid("c62d9c91-7458-47f6-862d-1ef86fb0b278"));
  //static DWINGUID IID = { 0xc62d9c91, 0x7458, 0x47f6, 0x86, 0x2d, 0x1e, 0xf8, 0x6f, 0xb0, 0xb2, 0x78 };
  // FreeBufferSpace
  /*[id(0x00000001)]*/ int get_FreeBufferSpace(out int FreeBufferSpace);
  // NonBlockingIO
  /*[id(0x00000002)]*/ int get_NonBlockingIO(out int NonBlockingIO);
  // State
  /*[id(0x00000003)]*/ int get_State(out SpeechAudioState State);
  // CurrentSeekPosition
  /*[id(0x00000004)]*/ int get_CurrentSeekPosition(out DWINVARIANT CurrentSeekPosition);
  // CurrentDevicePosition
  /*[id(0x00000005)]*/ int get_CurrentDevicePosition(out DWINVARIANT CurrentDevicePosition);
}

// ISpeechAudioFormat Interface
interface ISpeechAudioFormat : IDispatch {
  mixin(uuid("e6e9c590-3e18-40e3-8299-061f98bde7c7"));
  //static DWINGUID IID = { 0xe6e9c590, 0x3e18, 0x40e3, 0x82, 0x99, 0x06, 0x1f, 0x98, 0xbd, 0xe7, 0xc7 };
  // Type
  /*[id(0x00000001)]*/ int get_Type(out SpeechAudioFormatType AudioFormat);
  // Type
  /*[id(0x00000001)]*/ int set_Type(SpeechAudioFormatType AudioFormat);
  // Guid
  /*[id(0x00000002)]*/ int get_Guid(out wchar* Guid);
  // Guid
  /*[id(0x00000002)]*/ int set_Guid(wchar* Guid);
  // GetWaveFormatEx
  /*[id(0x00000003)]*/ int GetWaveFormatEx(out ISpeechWaveFormatEx WaveFormatEx);
  // SetWaveFormatEx
  /*[id(0x00000004)]*/ int SetWaveFormatEx(ISpeechWaveFormatEx WaveFormatEx);
}

// ISpeechWaveFormatEx Interface
interface ISpeechWaveFormatEx : IDispatch {
  mixin(uuid("7a1ef0d5-1581-4741-88e4-209a49f11a10"));
  //static DWINGUID IID = { 0x7a1ef0d5, 0x1581, 0x4741, 0x88, 0xe4, 0x20, 0x9a, 0x49, 0xf1, 0x1a, 0x10 };
  // FormatTag
  /*[id(0x00000001)]*/ int get_FormatTag(out short FormatTag);
  // FormatTag
  /*[id(0x00000001)]*/ int set_FormatTag(short FormatTag);
  // Channels
  /*[id(0x00000002)]*/ int get_Channels(out short Channels);
  // Channels
  /*[id(0x00000002)]*/ int set_Channels(short Channels);
  // SamplesPerSec
  /*[id(0x00000003)]*/ int get_SamplesPerSec(out int SamplesPerSec);
  // SamplesPerSec
  /*[id(0x00000003)]*/ int set_SamplesPerSec(int SamplesPerSec);
  // AvgBytesPerSec
  /*[id(0x00000004)]*/ int get_AvgBytesPerSec(out int AvgBytesPerSec);
  // AvgBytesPerSec
  /*[id(0x00000004)]*/ int set_AvgBytesPerSec(int AvgBytesPerSec);
  // BlockAlign
  /*[id(0x00000005)]*/ int get_BlockAlign(out short BlockAlign);
  // BlockAlign
  /*[id(0x00000005)]*/ int set_BlockAlign(short BlockAlign);
  // BitsPerSample
  /*[id(0x00000006)]*/ int get_BitsPerSample(out short BitsPerSample);
  // BitsPerSample
  /*[id(0x00000006)]*/ int set_BitsPerSample(short BitsPerSample);
  // ExtraData
  /*[id(0x00000007)]*/ int get_ExtraData(out DWINVARIANT ExtraData);
  // ExtraData
  /*[id(0x00000007)]*/ int set_ExtraData(DWINVARIANT ExtraData);
}

// ISpeechBaseStream Interface
interface ISpeechBaseStream : IDispatch {
  mixin(uuid("6450336f-7d49-4ced-8097-49d6dee37294"));
  //static DWINGUID IID = { 0x6450336f, 0x7d49, 0x4ced, 0x80, 0x97, 0x49, 0xd6, 0xde, 0xe3, 0x72, 0x94 };
  // Format
  /*[id(0x00000001)]*/ int get_Format(out ISpeechAudioFormat AudioFormat);
  // Format
  /*[id(0x00000001)]*/ int setref_Format(ISpeechAudioFormat AudioFormat);
  // Read
  /*[id(0x00000002)]*/ int Read(out DWINVARIANT Buffer, int NumberOfBytes, out int BytesRead);
  // Write
  /*[id(0x00000003)]*/ int Write(DWINVARIANT Buffer, out int BytesWritten);
  // Seek
  /*[id(0x00000004)]*/ int Seek(DWINVARIANT Position, SpeechStreamSeekPositionType Origin, out DWINVARIANT NewPosition);
}

// ISpeechFileStream Interface
interface ISpeechFileStream : ISpeechBaseStream {
  mixin(uuid("af67f125-ab39-4e93-b4a2-cc2e66e182a7"));
  //static DWINGUID IID = { 0xaf67f125, 0xab39, 0x4e93, 0xb4, 0xa2, 0xcc, 0x2e, 0x66, 0xe1, 0x82, 0xa7 };
  // Open
  /*[id(0x00000064)]*/ int Open(wchar* FileName, SpeechStreamFileMode FileMode, short DoEvents);
  // Close
  /*[id(0x00000065)]*/ int Close();
}

// ISpeechMemoryStream Interface
interface ISpeechMemoryStream : ISpeechBaseStream {
  mixin(uuid("eeb14b68-808b-4abe-a5ea-b51da7588008"));
  //static DWINGUID IID = { 0xeeb14b68, 0x808b, 0x4abe, 0xa5, 0xea, 0xb5, 0x1d, 0xa7, 0x58, 0x80, 0x08 };
  // SetData
  /*[id(0x00000064)]*/ int SetData(DWINVARIANT Data);
  // GetData
  /*[id(0x00000065)]*/ int GetData(out DWINVARIANT pData);
}

// ISpeechCustomStream Interface
interface ISpeechCustomStream : ISpeechBaseStream {
  mixin(uuid("1a9e9f4f-104f-4db8-a115-efd7fd0c97ae"));
  //static DWINGUID IID = { 0x1a9e9f4f, 0x104f, 0x4db8, 0xa1, 0x15, 0xef, 0xd7, 0xfd, 0x0c, 0x97, 0xae };
  // BaseStream
  /*[id(0x00000064)]*/ int get_BaseStream(out IUnknown ppUnkStream);
  // BaseStream
  /*[id(0x00000064)]*/ int setref_BaseStream(IUnknown ppUnkStream);
}

// ISpeechAudio Interface
interface ISpeechAudio : ISpeechBaseStream {
  mixin(uuid("cff8e175-019e-11d3-a08e-00c04f8ef9b5"));
  //static DWINGUID IID = { 0xcff8e175, 0x019e, 0x11d3, 0xa0, 0x8e, 0x00, 0xc0, 0x4f, 0x8e, 0xf9, 0xb5 };
  // Status
  /*[id(0x000000C8)]*/ int get_Status(out ISpeechAudioStatus Status);
  // BufferInfo
  /*[id(0x000000C9)]*/ int get_BufferInfo(out ISpeechAudioBufferInfo BufferInfo);
  // DefaultFormat
  /*[id(0x000000CA)]*/ int get_DefaultFormat(out ISpeechAudioFormat StreamFormat);
  // Volume
  /*[id(0x000000CB)]*/ int get_Volume(out int Volume);
  // Volume
  /*[id(0x000000CB)]*/ int set_Volume(int Volume);
  // BufferNotifySize
  /*[id(0x000000CC)]*/ int get_BufferNotifySize(out int BufferNotifySize);
  // BufferNotifySize
  /*[id(0x000000CC)]*/ int set_BufferNotifySize(int BufferNotifySize);
  // EventHandle
  /*[id(0x000000CD)]*/ int get_EventHandle(out int EventHandle);
  // SetState
  /*[id(0x000000CE)]*/ int SetState(SpeechAudioState State);
}

// ISpeechMMSysAudio Interface
interface ISpeechMMSysAudio : ISpeechAudio {
  mixin(uuid("3c76af6d-1fd7-4831-81d1-3b71d5a13c44"));
  //static DWINGUID IID = { 0x3c76af6d, 0x1fd7, 0x4831, 0x81, 0xd1, 0x3b, 0x71, 0xd5, 0xa1, 0x3c, 0x44 };
  // DeviceId
  /*[id(0x0000012C)]*/ int get_DeviceId(out int DeviceId);
  // DeviceId
  /*[id(0x0000012C)]*/ int set_DeviceId(int DeviceId);
  // LineId
  /*[id(0x0000012D)]*/ int get_LineId(out int LineId);
  // LineId
  /*[id(0x0000012D)]*/ int set_LineId(int LineId);
  // MMHandle
  /*[id(0x0000012E)]*/ int get_MMHandle(out int Handle);
}

// ISpeechVoice Interface
interface ISpeechVoice : IDispatch {
  mixin(uuid("269316d8-57bd-11d2-9eee-00c04f797396"));
  //static DWINGUID IID = { 0x269316d8, 0x57bd, 0x11d2, 0x9e, 0xee, 0x00, 0xc0, 0x4f, 0x79, 0x73, 0x96 };
  // Status
  /*[id(0x00000001)]*/ int get_Status(out ISpeechVoiceStatus Status);
  // Voice
  /*[id(0x00000002)]*/ int get_Voice(out ISpeechObjectToken Voice);
  // Voice
  /*[id(0x00000002)]*/ int setref_Voice(ISpeechObjectToken Voice);
  // Gets the audio output object
  /*[id(0x00000003)]*/ int get_AudioOutput(out ISpeechObjectToken AudioOutput);
  // Gets the audio output object
  /*[id(0x00000003)]*/ int setref_AudioOutput(ISpeechObjectToken AudioOutput);
  // Gets the audio output stream
  /*[id(0x00000004)]*/ int get_AudioOutputStream(out ISpeechBaseStream AudioOutputStream);
  // Gets the audio output stream
  /*[id(0x00000004)]*/ int setref_AudioOutputStream(ISpeechBaseStream AudioOutputStream);
  // Rate
  /*[id(0x00000005)]*/ int get_Rate(out int Rate);
  // Rate
  /*[id(0x00000005)]*/ int set_Rate(int Rate);
  // Volume
  /*[id(0x00000006)]*/ int get_Volume(out int Volume);
  // Volume
  /*[id(0x00000006)]*/ int set_Volume(int Volume);
  // AllowAudioOutputFormatChangesOnNextSet
  /*[id(0x00000007)]*/ int set_AllowAudioOutputFormatChangesOnNextSet(short Allow);
  // AllowAudioOutputFormatChangesOnNextSet
  /*[id(0x00000007)]*/ int get_AllowAudioOutputFormatChangesOnNextSet(out short Allow);
  // EventInterests
  /*[id(0x00000008)]*/ int get_EventInterests(out SpeechVoiceEvents EventInterestFlags);
  // EventInterests
  /*[id(0x00000008)]*/ int set_EventInterests(SpeechVoiceEvents EventInterestFlags);
  // Priority
  /*[id(0x00000009)]*/ int set_Priority(SpeechVoicePriority Priority);
  // Priority
  /*[id(0x00000009)]*/ int get_Priority(out SpeechVoicePriority Priority);
  // AlertBoundary
  /*[id(0x0000000A)]*/ int set_AlertBoundary(SpeechVoiceEvents Boundary);
  // AlertBoundary
  /*[id(0x0000000A)]*/ int get_AlertBoundary(out SpeechVoiceEvents Boundary);
  // SyncSpeakTimeout
  /*[id(0x0000000B)]*/ int set_SynchronousSpeakTimeout(int msTimeout);
  // SyncSpeakTimeout
  /*[id(0x0000000B)]*/ int get_SynchronousSpeakTimeout(out int msTimeout);
  // Speak
  /*[id(0x0000000C)]*/ int Speak(wchar* Text, SpeechVoiceSpeakFlags Flags, out int StreamNumber);
  // SpeakStream
  /*[id(0x0000000D)]*/ int SpeakStream(ISpeechBaseStream Stream, SpeechVoiceSpeakFlags Flags, out int StreamNumber);
  // Pauses the voices rendering.
  /*[id(0x0000000E)]*/ int Pause();
  // Resumes the voices rendering.
  /*[id(0x0000000F)]*/ int Resume();
  // Skips rendering the specified number of items.
  /*[id(0x00000010)]*/ int Skip(wchar* Type, int NumItems, out int NumSkipped);
  // GetVoices
  /*[id(0x00000011)]*/ int GetVoices(wchar* RequiredAttributes, wchar* OptionalAttributes, out ISpeechObjectTokens ObjectTokens);
  // GetAudioOutputs
  /*[id(0x00000012)]*/ int GetAudioOutputs(wchar* RequiredAttributes, wchar* OptionalAttributes, out ISpeechObjectTokens ObjectTokens);
  // WaitUntilDone
  /*[id(0x00000013)]*/ int WaitUntilDone(int msTimeout, out short Done);
  // SpeakCompleteEvent
  /*[id(0x00000014)]*/ int SpeakCompleteEvent(out int Handle);
  // IsUISupported
  /*[id(0x00000015)]*/ int IsUISupported(wchar* TypeOfUI, DWINVARIANT* ExtraData, out short Supported);
  // DisplayUI
  /*[id(0x00000016)]*/ int DisplayUI(int hWndParent, wchar* Title, wchar* TypeOfUI, DWINVARIANT* ExtraData);
}

// ISpeechVoiceStatus Interface
interface ISpeechVoiceStatus : IDispatch {
  mixin(uuid("8be47b07-57f6-11d2-9eee-00c04f797396"));
  //static DWINGUID IID = { 0x8be47b07, 0x57f6, 0x11d2, 0x9e, 0xee, 0x00, 0xc0, 0x4f, 0x79, 0x73, 0x96 };
  // CurrentStreamNumber
  /*[id(0x00000001)]*/ int get_CurrentStreamNumber(out int StreamNumber);
  // LastStreamNumberQueued
  /*[id(0x00000002)]*/ int get_LastStreamNumberQueued(out int StreamNumber);
  // LastHResult
  /*[id(0x00000003)]*/ int get_LastHResult(out int HResult);
  // RunningState
  /*[id(0x00000004)]*/ int get_RunningState(out SpeechRunState State);
  // InputWordPosition
  /*[id(0x00000005)]*/ int get_InputWordPosition(out int Position);
  // InputWordLength
  /*[id(0x00000006)]*/ int get_InputWordLength(out int Length);
  // InputSentencePosition
  /*[id(0x00000007)]*/ int get_InputSentencePosition(out int Position);
  // InputSentenceLength
  /*[id(0x00000008)]*/ int get_InputSentenceLength(out int Length);
  // LastBookmark
  /*[id(0x00000009)]*/ int get_LastBookmark(out wchar* Bookmark);
  // LastBookmarkId
  /*[id(0x0000000A)]*/ int get_LastBookmarkId(out int BookmarkId);
  // PhonemeId
  /*[id(0x0000000B)]*/ int get_PhonemeId(out short PhoneId);
  // VisemeId
  /*[id(0x0000000C)]*/ int get_VisemeId(out short VisemeId);
}

interface _ISpeechVoiceEvents : IDispatch {
  mixin(uuid("a372acd1-3bef-4bbd-8ffb-cb3e2b416af8"));
  //static DWINGUID IID = { 0xa372acd1, 0x3bef, 0x4bbd, 0x8f, 0xfb, 0xcb, 0x3e, 0x2b, 0x41, 0x6a, 0xf8 };
  /+// StartStream
  /*[id(0x00000001)]*/ void StartStream(int StreamNumber, DWINVARIANT StreamPosition);+/
  /+// EndStream
  /*[id(0x00000002)]*/ void EndStream(int StreamNumber, DWINVARIANT StreamPosition);+/
  /+// VoiceChange
  /*[id(0x00000003)]*/ void VoiceChange(int StreamNumber, DWINVARIANT StreamPosition, ISpeechObjectToken VoiceObjectToken);+/
  /+// Bookmark
  /*[id(0x00000004)]*/ void Bookmark(int StreamNumber, DWINVARIANT StreamPosition, wchar* Bookmark, int BookmarkId);+/
  /+// Word
  /*[id(0x00000005)]*/ void Word(int StreamNumber, DWINVARIANT StreamPosition, int CharacterPosition, int Length);+/
  /+// Sentence
  /*[id(0x00000007)]*/ void Sentence(int StreamNumber, DWINVARIANT StreamPosition, int CharacterPosition, int Length);+/
  /+// Phoneme
  /*[id(0x00000006)]*/ void Phoneme(int StreamNumber, DWINVARIANT StreamPosition, int Duration, short NextPhoneId, SpeechVisemeFeature Feature, short CurrentPhoneId);+/
  /+// Viseme
  /*[id(0x00000008)]*/ void Viseme(int StreamNumber, DWINVARIANT StreamPosition, int Duration, SpeechVisemeType NextVisemeId, SpeechVisemeFeature Feature, SpeechVisemeType CurrentVisemeId);+/
  /+// AudioLevel
  /*[id(0x00000009)]*/ void AudioLevel(int StreamNumber, DWINVARIANT StreamPosition, int AudioLevel);+/
  /+// EnginePrivate
  /*[id(0x0000000A)]*/ void EnginePrivate(int StreamNumber, int StreamPosition, DWINVARIANT EngineData);+/
}

// ISpeechRecognizer Interface
interface ISpeechRecognizer : IDispatch {
  mixin(uuid("2d5f1c0c-bd75-4b08-9478-3b11fea2586c"));
  //static DWINGUID IID = { 0x2d5f1c0c, 0xbd75, 0x4b08, 0x94, 0x78, 0x3b, 0x11, 0xfe, 0xa2, 0x58, 0x6c };
  // Recognizer
  /*[id(0x00000001)]*/ int setref_Recognizer(ISpeechObjectToken Recognizer);
  // Recognizer
  /*[id(0x00000001)]*/ int get_Recognizer(out ISpeechObjectToken Recognizer);
  // AllowAudioInputFormatChangesOnNextSet
  /*[id(0x00000002)]*/ int set_AllowAudioInputFormatChangesOnNextSet(short Allow);
  // AllowAudioInputFormatChangesOnNextSet
  /*[id(0x00000002)]*/ int get_AllowAudioInputFormatChangesOnNextSet(out short Allow);
  // AudioInput
  /*[id(0x00000003)]*/ int setref_AudioInput(ISpeechObjectToken AudioInput);
  // AudioInput
  /*[id(0x00000003)]*/ int get_AudioInput(out ISpeechObjectToken AudioInput);
  // AudioInputStream
  /*[id(0x00000004)]*/ int setref_AudioInputStream(ISpeechBaseStream AudioInputStream);
  // AudioInputStream
  /*[id(0x00000004)]*/ int get_AudioInputStream(out ISpeechBaseStream AudioInputStream);
  // IsShared
  /*[id(0x00000005)]*/ int get_IsShared(out short Shared);
  // State
  /*[id(0x00000006)]*/ int set_State(SpeechRecognizerState State);
  // State
  /*[id(0x00000006)]*/ int get_State(out SpeechRecognizerState State);
  // Status
  /*[id(0x00000007)]*/ int get_Status(out ISpeechRecognizerStatus Status);
  // Profile
  /*[id(0x00000008)]*/ int setref_Profile(ISpeechObjectToken Profile);
  // Profile
  /*[id(0x00000008)]*/ int get_Profile(out ISpeechObjectToken Profile);
  // EmulateRecognition
  /*[id(0x00000009)]*/ int EmulateRecognition(DWINVARIANT TextElements, DWINVARIANT* ElementDisplayAttributes, int LanguageId);
  // CreateRecoContext
  /*[id(0x0000000A)]*/ int CreateRecoContext(out ISpeechRecoContext NewContext);
  // GetFormat
  /*[id(0x0000000B)]*/ int GetFormat(SpeechFormatType Type, out ISpeechAudioFormat Format);
  // SetPropertyNumber
  /*[id(0x0000000C)]*/ int SetPropertyNumber(wchar* Name, int Value, out short Supported);
  // GetPropertyNumber
  /*[id(0x0000000D)]*/ int GetPropertyNumber(wchar* Name, ref int Value, out short Supported);
  // SetPropertyString
  /*[id(0x0000000E)]*/ int SetPropertyString(wchar* Name, wchar* Value, out short Supported);
  // GetPropertyString
  /*[id(0x0000000F)]*/ int GetPropertyString(wchar* Name, ref wchar* Value, out short Supported);
  // IsUISupported
  /*[id(0x00000010)]*/ int IsUISupported(wchar* TypeOfUI, DWINVARIANT* ExtraData, out short Supported);
  // DisplayUI
  /*[id(0x00000011)]*/ int DisplayUI(int hWndParent, wchar* Title, wchar* TypeOfUI, DWINVARIANT* ExtraData);
  // GetRecognizers
  /*[id(0x00000012)]*/ int GetRecognizers(wchar* RequiredAttributes, wchar* OptionalAttributes, out ISpeechObjectTokens ObjectTokens);
  // GetAudioInputs
  /*[id(0x00000013)]*/ int GetAudioInputs(wchar* RequiredAttributes, wchar* OptionalAttributes, out ISpeechObjectTokens ObjectTokens);
  // GetProfiles
  /*[id(0x00000014)]*/ int GetProfiles(wchar* RequiredAttributes, wchar* OptionalAttributes, out ISpeechObjectTokens ObjectTokens);
}

// ISpeechRecognizerStatus Interface
interface ISpeechRecognizerStatus : IDispatch {
  mixin(uuid("bff9e781-53ec-484e-bb8a-0e1b5551e35c"));
  //static DWINGUID IID = { 0xbff9e781, 0x53ec, 0x484e, 0xbb, 0x8a, 0x0e, 0x1b, 0x55, 0x51, 0xe3, 0x5c };
  // AudioStatus
  /*[id(0x00000001)]*/ int get_AudioStatus(out ISpeechAudioStatus AudioStatus);
  // CurrentStreamPosition
  /*[id(0x00000002)]*/ int get_CurrentStreamPosition(out DWINVARIANT pCurrentStreamPos);
  // CurrentStreamNumber
  /*[id(0x00000003)]*/ int get_CurrentStreamNumber(out int StreamNumber);
  // NumberOfActiveRules
  /*[id(0x00000004)]*/ int get_NumberOfActiveRules(out int NumberOfActiveRules);
  // ClsidEngine
  /*[id(0x00000005)]*/ int get_ClsidEngine(out wchar* ClsidEngine);
  // SupportedLanguages
  /*[id(0x00000006)]*/ int get_SupportedLanguages(out DWINVARIANT SupportedLanguages);
}

// ISpeechRecoContext Interface
interface ISpeechRecoContext : IDispatch {
  mixin(uuid("580aa49d-7e1e-4809-b8e2-57da806104b8"));
  //static DWINGUID IID = { 0x580aa49d, 0x7e1e, 0x4809, 0xb8, 0xe2, 0x57, 0xda, 0x80, 0x61, 0x04, 0xb8 };
  // Recognizer
  /*[id(0x00000001)]*/ int get_Recognizer(out ISpeechRecognizer Recognizer);
  // AudioInInterferenceStatus
  /*[id(0x00000002)]*/ int get_AudioInputInterferenceStatus(out SpeechInterference Interference);
  // RequestedUIType
  /*[id(0x00000003)]*/ int get_RequestedUIType(out wchar* UIType);
  // Voice
  /*[id(0x00000004)]*/ int setref_Voice(ISpeechVoice Voice);
  // Voice
  /*[id(0x00000004)]*/ int get_Voice(out ISpeechVoice Voice);
  // AllowVoiceFormatMatchingOnNextSet
  /*[id(0x00000005)]*/ int set_AllowVoiceFormatMatchingOnNextSet(short pAllow);
  // AllowVoiceFormatMatchingOnNextSet
  /*[id(0x00000005)]*/ int get_AllowVoiceFormatMatchingOnNextSet(out short pAllow);
  // VoicePurgeEvent
  /*[id(0x00000006)]*/ int set_VoicePurgeEvent(SpeechRecoEvents EventInterest);
  // VoicePurgeEvent
  /*[id(0x00000006)]*/ int get_VoicePurgeEvent(out SpeechRecoEvents EventInterest);
  // EventInterests
  /*[id(0x00000007)]*/ int set_EventInterests(SpeechRecoEvents EventInterest);
  // EventInterests
  /*[id(0x00000007)]*/ int get_EventInterests(out SpeechRecoEvents EventInterest);
  // CmdMaxAlternates
  /*[id(0x00000008)]*/ int set_CmdMaxAlternates(int MaxAlternates);
  // CmdMaxAlternates
  /*[id(0x00000008)]*/ int get_CmdMaxAlternates(out int MaxAlternates);
  // State
  /*[id(0x00000009)]*/ int set_State(SpeechRecoContextState State);
  // State
  /*[id(0x00000009)]*/ int get_State(out SpeechRecoContextState State);
  // RetainedAudio
  /*[id(0x0000000A)]*/ int set_RetainedAudio(SpeechRetainedAudioOptions Option);
  // RetainedAudio
  /*[id(0x0000000A)]*/ int get_RetainedAudio(out SpeechRetainedAudioOptions Option);
  // RetainedAudioFormat
  /*[id(0x0000000B)]*/ int setref_RetainedAudioFormat(ISpeechAudioFormat Format);
  // RetainedAudioFormat
  /*[id(0x0000000B)]*/ int get_RetainedAudioFormat(out ISpeechAudioFormat Format);
  // Pause
  /*[id(0x0000000C)]*/ int Pause();
  // Resume
  /*[id(0x0000000D)]*/ int Resume();
  // CreateGrammar
  /*[id(0x0000000E)]*/ int CreateGrammar(DWINVARIANT GrammarId, out ISpeechRecoGrammar Grammar);
  // CreateResultFromMemory
  /*[id(0x0000000F)]*/ int CreateResultFromMemory(DWINVARIANT* ResultBlock, out ISpeechRecoResult Result);
  // Bookmark
  /*[id(0x00000010)]*/ int Bookmark(SpeechBookmarkOptions Options, DWINVARIANT StreamPos, DWINVARIANT BookmarkId);
  // SetAdaptationData
  /*[id(0x00000011)]*/ int SetAdaptationData(wchar* AdaptationString);
}

// ISpeechRecoGrammar Interface
interface ISpeechRecoGrammar : IDispatch {
  mixin(uuid("b6d6f79f-2158-4e50-b5bc-9a9ccd852a09"));
  //static DWINGUID IID = { 0xb6d6f79f, 0x2158, 0x4e50, 0xb5, 0xbc, 0x9a, 0x9c, 0xcd, 0x85, 0x2a, 0x09 };
  // Id
  /*[id(0x00000001)]*/ int get_Id(out DWINVARIANT Id);
  // RecoContext
  /*[id(0x00000002)]*/ int get_RecoContext(out ISpeechRecoContext RecoContext);
  // State
  /*[id(0x00000003)]*/ int set_State(SpeechGrammarState State);
  // State
  /*[id(0x00000003)]*/ int get_State(out SpeechGrammarState State);
  // Rules
  /*[id(0x00000004)]*/ int get_Rules(out ISpeechGrammarRules Rules);
  // Reset
  /*[id(0x00000005)]*/ int Reset(int NewLanguage);
  // CmdLoadFromFile
  /*[id(0x00000007)]*/ int CmdLoadFromFile(wchar* FileName, SpeechLoadOption LoadOption);
  // CmdLoadFromObject
  /*[id(0x00000008)]*/ int CmdLoadFromObject(wchar* ClassId, wchar* GrammarName, SpeechLoadOption LoadOption);
  // CmdLoadFromResource
  /*[id(0x00000009)]*/ int CmdLoadFromResource(int hModule, DWINVARIANT ResourceName, DWINVARIANT ResourceType, int LanguageId, SpeechLoadOption LoadOption);
  // CmdLoadFromMemory
  /*[id(0x0000000A)]*/ int CmdLoadFromMemory(DWINVARIANT GrammarData, SpeechLoadOption LoadOption);
  // CmdLoadFromProprietaryGrammar
  /*[id(0x0000000B)]*/ int CmdLoadFromProprietaryGrammar(wchar* ProprietaryGuid, wchar* ProprietaryString, DWINVARIANT ProprietaryData, SpeechLoadOption LoadOption);
  // CmdSetRuleState
  /*[id(0x0000000C)]*/ int CmdSetRuleState(wchar* Name, SpeechRuleState State);
  // CmdSetRuleIdState
  /*[id(0x0000000D)]*/ int CmdSetRuleIdState(int RuleId, SpeechRuleState State);
  // DictationLoad
  /*[id(0x0000000E)]*/ int DictationLoad(wchar* TopicName, SpeechLoadOption LoadOption);
  // DictationUnload
  /*[id(0x0000000F)]*/ int DictationUnload();
  // DictationSetState
  /*[id(0x00000010)]*/ int DictationSetState(SpeechRuleState State);
  // SetWordSequenceData
  /*[id(0x00000011)]*/ int SetWordSequenceData(wchar* Text, int TextLength, ISpeechTextSelectionInformation Info);
  // SetTextSelection
  /*[id(0x00000012)]*/ int SetTextSelection(ISpeechTextSelectionInformation Info);
  // IsPronounceable
  /*[id(0x00000013)]*/ int IsPronounceable(wchar* Word, out SpeechWordPronounceable WordPronounceable);
}

// ISpeechGrammarRules Interface
interface ISpeechGrammarRules : IDispatch {
  mixin(uuid("6ffa3b44-fc2d-40d1-8afc-32911c7f1ad1"));
  //static DWINGUID IID = { 0x6ffa3b44, 0xfc2d, 0x40d1, 0x8a, 0xfc, 0x32, 0x91, 0x1c, 0x7f, 0x1a, 0xd1 };
  // Count
  /*[id(0x00000001)]*/ int get_Count(out int Count);
  // FindRule
  /*[id(0x00000006)]*/ int FindRule(DWINVARIANT RuleNameOrId, out ISpeechGrammarRule Rule);
  // Item
  /*[id(0x00000000)]*/ int Item(int Index, out ISpeechGrammarRule Rule);
  // Enumerates the alternates
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown EnumVARIANT);
  // Dynamic
  /*[id(0x00000002)]*/ int get_Dynamic(out short Dynamic);
  // Add
  /*[id(0x00000003)]*/ int Add(wchar* RuleName, SpeechRuleAttributes Attributes, int RuleId, out ISpeechGrammarRule Rule);
  // Commit
  /*[id(0x00000004)]*/ int Commit();
  // CommitAndSave
  /*[id(0x00000005)]*/ int CommitAndSave(out wchar* ErrorText, out DWINVARIANT SaveStream);
}

// ISpeechGrammarRule Interface
interface ISpeechGrammarRule : IDispatch {
  mixin(uuid("afe719cf-5dd1-44f2-999c-7a399f1cfccc"));
  //static DWINGUID IID = { 0xafe719cf, 0x5dd1, 0x44f2, 0x99, 0x9c, 0x7a, 0x39, 0x9f, 0x1c, 0xfc, 0xcc };
  // RuleAttributes
  /*[id(0x00000001)]*/ int get_Attributes(out SpeechRuleAttributes Attributes);
  // InitialState
  /*[id(0x00000002)]*/ int get_InitialState(out ISpeechGrammarRuleState State);
  // Name
  /*[id(0x00000003)]*/ int get_Name(out wchar* Name);
  // Id
  /*[id(0x00000004)]*/ int get_Id(out int Id);
  // Clear
  /*[id(0x00000005)]*/ int Clear();
  // AddResource
  /*[id(0x00000006)]*/ int AddResource(wchar* ResourceName, wchar* ResourceValue);
  // AddState
  /*[id(0x00000007)]*/ int AddState(out ISpeechGrammarRuleState State);
}

// ISpeechGrammarRuleState Interface
interface ISpeechGrammarRuleState : IDispatch {
  mixin(uuid("d4286f2c-ee67-45ae-b928-28d695362eda"));
  //static DWINGUID IID = { 0xd4286f2c, 0xee67, 0x45ae, 0xb9, 0x28, 0x28, 0xd6, 0x95, 0x36, 0x2e, 0xda };
  // Rule
  /*[id(0x00000001)]*/ int get_Rule(out ISpeechGrammarRule Rule);
  // Transitions
  /*[id(0x00000002)]*/ int get_Transitions(out ISpeechGrammarRuleStateTransitions Transitions);
  // AddWordTransition
  /*[id(0x00000003)]*/ int AddWordTransition(ISpeechGrammarRuleState DestState, wchar* Words, wchar* Separators, SpeechGrammarWordType Type, wchar* PropertyName, int PropertyId, DWINVARIANT* PropertyValue, float Weight);
  // AddRuleTransition
  /*[id(0x00000004)]*/ int AddRuleTransition(ISpeechGrammarRuleState DestinationState, ISpeechGrammarRule Rule, wchar* PropertyName, int PropertyId, DWINVARIANT* PropertyValue, float Weight);
  // AddSpecialTransition
  /*[id(0x00000005)]*/ int AddSpecialTransition(ISpeechGrammarRuleState DestinationState, SpeechSpecialTransitionType Type, wchar* PropertyName, int PropertyId, DWINVARIANT* PropertyValue, float Weight);
}

// ISpeechGrammarRuleStateTransitions Interface
interface ISpeechGrammarRuleStateTransitions : IDispatch {
  mixin(uuid("eabce657-75bc-44a2-aa7f-c56476742963"));
  //static DWINGUID IID = { 0xeabce657, 0x75bc, 0x44a2, 0xaa, 0x7f, 0xc5, 0x64, 0x76, 0x74, 0x29, 0x63 };
  // Count
  /*[id(0x00000001)]*/ int get_Count(out int Count);
  // Item
  /*[id(0x00000000)]*/ int Item(int Index, out ISpeechGrammarRuleStateTransition Transition);
  // Enumerates the transitions
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown EnumVARIANT);
}

// ISpeechGrammarRuleStateTransition Interface
interface ISpeechGrammarRuleStateTransition : IDispatch {
  mixin(uuid("cafd1db1-41d1-4a06-9863-e2e81da17a9a"));
  //static DWINGUID IID = { 0xcafd1db1, 0x41d1, 0x4a06, 0x98, 0x63, 0xe2, 0xe8, 0x1d, 0xa1, 0x7a, 0x9a };
  // Type
  /*[id(0x00000001)]*/ int get_Type(out SpeechGrammarRuleStateTransitionType Type);
  // Text
  /*[id(0x00000002)]*/ int get_Text(out wchar* Text);
  // Rule
  /*[id(0x00000003)]*/ int get_Rule(out ISpeechGrammarRule Rule);
  // Weight
  /*[id(0x00000004)]*/ int get_Weight(out DWINVARIANT Weight);
  // PropertyName
  /*[id(0x00000005)]*/ int get_PropertyName(out wchar* PropertyName);
  // PropertyId
  /*[id(0x00000006)]*/ int get_PropertyId(out int PropertyId);
  // PropertyValue
  /*[id(0x00000007)]*/ int get_PropertyValue(out DWINVARIANT PropertyValue);
  // NextState
  /*[id(0x00000008)]*/ int get_NextState(out ISpeechGrammarRuleState NextState);
}

// ISpeechTextSelectionInformation Interface
interface ISpeechTextSelectionInformation : IDispatch {
  mixin(uuid("3b9c7e7a-6eee-4ded-9092-11657279adbe"));
  //static DWINGUID IID = { 0x3b9c7e7a, 0x6eee, 0x4ded, 0x90, 0x92, 0x11, 0x65, 0x72, 0x79, 0xad, 0xbe };
  // ActiveOffset
  /*[id(0x00000001)]*/ int set_ActiveOffset(int ActiveOffset);
  // ActiveOffset
  /*[id(0x00000001)]*/ int get_ActiveOffset(out int ActiveOffset);
  // ActiveLength
  /*[id(0x00000002)]*/ int set_ActiveLength(int ActiveLength);
  // ActiveLength
  /*[id(0x00000002)]*/ int get_ActiveLength(out int ActiveLength);
  // SelectionOffset
  /*[id(0x00000003)]*/ int set_SelectionOffset(int SelectionOffset);
  // SelectionOffset
  /*[id(0x00000003)]*/ int get_SelectionOffset(out int SelectionOffset);
  // SelectionLength
  /*[id(0x00000004)]*/ int set_SelectionLength(int SelectionLength);
  // SelectionLength
  /*[id(0x00000004)]*/ int get_SelectionLength(out int SelectionLength);
}

// ISpeechRecoResult Interface
interface ISpeechRecoResult : IDispatch {
  mixin(uuid("ed2879cf-ced9-4ee6-a534-de0191d5468d"));
  //static DWINGUID IID = { 0xed2879cf, 0xced9, 0x4ee6, 0xa5, 0x34, 0xde, 0x01, 0x91, 0xd5, 0x46, 0x8d };
  // RecoContext
  /*[id(0x00000001)]*/ int get_RecoContext(out ISpeechRecoContext RecoContext);
  // Times
  /*[id(0x00000002)]*/ int get_Times(out ISpeechRecoResultTimes Times);
  // AudioFormat
  /*[id(0x00000003)]*/ int setref_AudioFormat(ISpeechAudioFormat Format);
  // AudioFormat
  /*[id(0x00000003)]*/ int get_AudioFormat(out ISpeechAudioFormat Format);
  // PhraseInfo
  /*[id(0x00000004)]*/ int get_PhraseInfo(out ISpeechPhraseInfo PhraseInfo);
  // Alternates
  /*[id(0x00000005)]*/ int Alternates(int RequestCount, int StartElement, int Elements, out ISpeechPhraseAlternates Alternates);
  // Audio
  /*[id(0x00000006)]*/ int Audio(int StartElement, int Elements, out ISpeechMemoryStream Stream);
  // SpeakAudio
  /*[id(0x00000007)]*/ int SpeakAudio(int StartElement, int Elements, SpeechVoiceSpeakFlags Flags, out int StreamNumber);
  // SaveToMemory
  /*[id(0x00000008)]*/ int SaveToMemory(out DWINVARIANT ResultBlock);
  // DiscardResultInfo
  /*[id(0x00000009)]*/ int DiscardResultInfo(SpeechDiscardType ValueTypes);
}

// ISpeechRecoResultTimes Interface
interface ISpeechRecoResultTimes : IDispatch {
  mixin(uuid("62b3b8fb-f6e7-41be-bdcb-056b1c29efc0"));
  //static DWINGUID IID = { 0x62b3b8fb, 0xf6e7, 0x41be, 0xbd, 0xcb, 0x05, 0x6b, 0x1c, 0x29, 0xef, 0xc0 };
  // StreamTime
  /*[id(0x00000001)]*/ int get_StreamTime(out DWINVARIANT Time);
  // Length
  /*[id(0x00000002)]*/ int get_Length(out DWINVARIANT Length);
  // TickCount
  /*[id(0x00000003)]*/ int get_TickCount(out int TickCount);
  // Start
  /*[id(0x00000004)]*/ int get_OffsetFromStart(out DWINVARIANT OffsetFromStart);
}

// ISpeechPhraseInfo Interface
interface ISpeechPhraseInfo : IDispatch {
  mixin(uuid("961559cf-4e67-4662-8bf0-d93f1fcd61b3"));
  //static DWINGUID IID = { 0x961559cf, 0x4e67, 0x4662, 0x8b, 0xf0, 0xd9, 0x3f, 0x1f, 0xcd, 0x61, 0xb3 };
  // LanguageId
  /*[id(0x00000001)]*/ int get_LanguageId(out int LanguageId);
  // GrammarId
  /*[id(0x00000002)]*/ int get_GrammarId(out DWINVARIANT GrammarId);
  // StartTime
  /*[id(0x00000003)]*/ int get_StartTime(out DWINVARIANT StartTime);
  // AudioStreamPosition
  /*[id(0x00000004)]*/ int get_AudioStreamPosition(out DWINVARIANT AudioStreamPosition);
  // AudioSizeBytes
  /*[id(0x00000005)]*/ int get_AudioSizeBytes(out int pAudioSizeBytes);
  // RetainedSizeBytes
  /*[id(0x00000006)]*/ int get_RetainedSizeBytes(out int RetainedSizeBytes);
  // AudioSizeTime
  /*[id(0x00000007)]*/ int get_AudioSizeTime(out int AudioSizeTime);
  // Rule
  /*[id(0x00000008)]*/ int get_Rule(out ISpeechPhraseRule Rule);
  // Properties
  /*[id(0x00000009)]*/ int get_Properties(out ISpeechPhraseProperties Properties);
  // Elements
  /*[id(0x0000000A)]*/ int get_Elements(out ISpeechPhraseElements Elements);
  // Replacements
  /*[id(0x0000000B)]*/ int get_Replacements(out ISpeechPhraseReplacements Replacements);
  // EngineId
  /*[id(0x0000000C)]*/ int get_EngineId(out wchar* EngineIdGuid);
  // EnginePrivateData
  /*[id(0x0000000D)]*/ int get_EnginePrivateData(out DWINVARIANT PrivateData);
  // SaveToMemory
  /*[id(0x0000000E)]*/ int SaveToMemory(out DWINVARIANT PhraseBlock);
  // GetText
  /*[id(0x0000000F)]*/ int GetText(int StartElement, int Elements, short UseReplacements, out wchar* Text);
  // DisplayAttributes
  /*[id(0x00000010)]*/ int GetDisplayAttributes(int StartElement, int Elements, short UseReplacements, out SpeechDisplayAttributes DisplayAttributes);
}

// ISpeechPhraseRule Interface
interface ISpeechPhraseRule : IDispatch {
  mixin(uuid("a7bfe112-a4a0-48d9-b602-c313843f6964"));
  //static DWINGUID IID = { 0xa7bfe112, 0xa4a0, 0x48d9, 0xb6, 0x02, 0xc3, 0x13, 0x84, 0x3f, 0x69, 0x64 };
  // Name
  /*[id(0x00000001)]*/ int get_Name(out wchar* Name);
  // Id
  /*[id(0x00000002)]*/ int get_Id(out int Id);
  // FirstElement
  /*[id(0x00000003)]*/ int get_FirstElement(out int FirstElement);
  // NumElements
  /*[id(0x00000004)]*/ int get_NumberOfElements(out int NumberOfElements);
  // Parent
  /*[id(0x00000005)]*/ int get_Parent(out ISpeechPhraseRule Parent);
  // Children
  /*[id(0x00000006)]*/ int get_Children(out ISpeechPhraseRules Children);
  // Confidence
  /*[id(0x00000007)]*/ int get_Confidence(out SpeechEngineConfidence ActualConfidence);
  // EngineConfidence
  /*[id(0x00000008)]*/ int get_EngineConfidence(out float EngineConfidence);
}

// ISpeechPhraseRules Interface
interface ISpeechPhraseRules : IDispatch {
  mixin(uuid("9047d593-01dd-4b72-81a3-e4a0ca69f407"));
  //static DWINGUID IID = { 0x9047d593, 0x01dd, 0x4b72, 0x81, 0xa3, 0xe4, 0xa0, 0xca, 0x69, 0xf4, 0x07 };
  // Count
  /*[id(0x00000001)]*/ int get_Count(out int Count);
  // Item
  /*[id(0x00000000)]*/ int Item(int Index, out ISpeechPhraseRule Rule);
  // Enumerates the Rules
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown EnumVARIANT);
}

// ISpeechPhraseProperties Interface
interface ISpeechPhraseProperties : IDispatch {
  mixin(uuid("08166b47-102e-4b23-a599-bdb98dbfd1f4"));
  //static DWINGUID IID = { 0x08166b47, 0x102e, 0x4b23, 0xa5, 0x99, 0xbd, 0xb9, 0x8d, 0xbf, 0xd1, 0xf4 };
  // Count
  /*[id(0x00000001)]*/ int get_Count(out int Count);
  // Item
  /*[id(0x00000000)]*/ int Item(int Index, out ISpeechPhraseProperty Property);
  // Enumerates the alternates
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown EnumVARIANT);
}

// ISpeechPhraseProperty Interface
interface ISpeechPhraseProperty : IDispatch {
  mixin(uuid("ce563d48-961e-4732-a2e1-378a42b430be"));
  //static DWINGUID IID = { 0xce563d48, 0x961e, 0x4732, 0xa2, 0xe1, 0x37, 0x8a, 0x42, 0xb4, 0x30, 0xbe };
  // Name
  /*[id(0x00000001)]*/ int get_Name(out wchar* Name);
  // Id
  /*[id(0x00000002)]*/ int get_Id(out int Id);
  // Value
  /*[id(0x00000003)]*/ int get_Value(out DWINVARIANT Value);
  // FirstElement
  /*[id(0x00000004)]*/ int get_FirstElement(out int FirstElement);
  // NumberOfElements
  /*[id(0x00000005)]*/ int get_NumberOfElements(out int NumberOfElements);
  // EngineConfidence
  /*[id(0x00000006)]*/ int get_EngineConfidence(out float Confidence);
  // Confidence
  /*[id(0x00000007)]*/ int get_Confidence(out SpeechEngineConfidence Confidence);
  // Parent
  /*[id(0x00000008)]*/ int get_Parent(out ISpeechPhraseProperty ParentProperty);
  // Children
  /*[id(0x00000009)]*/ int get_Children(out ISpeechPhraseProperties Children);
}

// ISpeechPhraseElements Interface
interface ISpeechPhraseElements : IDispatch {
  mixin(uuid("0626b328-3478-467d-a0b3-d0853b93dda3"));
  //static DWINGUID IID = { 0x0626b328, 0x3478, 0x467d, 0xa0, 0xb3, 0xd0, 0x85, 0x3b, 0x93, 0xdd, 0xa3 };
  // Count
  /*[id(0x00000001)]*/ int get_Count(out int Count);
  // Item
  /*[id(0x00000000)]*/ int Item(int Index, out ISpeechPhraseElement Element);
  // Enumerates the tokens
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown EnumVARIANT);
}

// ISpeechPhraseElement Interface
interface ISpeechPhraseElement : IDispatch {
  mixin(uuid("e6176f96-e373-4801-b223-3b62c068c0b4"));
  //static DWINGUID IID = { 0xe6176f96, 0xe373, 0x4801, 0xb2, 0x23, 0x3b, 0x62, 0xc0, 0x68, 0xc0, 0xb4 };
  // AudioTimeOffset
  /*[id(0x00000001)]*/ int get_AudioTimeOffset(out int AudioTimeOffset);
  // AudioSizeTime
  /*[id(0x00000002)]*/ int get_AudioSizeTime(out int AudioSizeTime);
  // AudioStreamOffset
  /*[id(0x00000003)]*/ int get_AudioStreamOffset(out int AudioStreamOffset);
  // AudioSizeBytes
  /*[id(0x00000004)]*/ int get_AudioSizeBytes(out int AudioSizeBytes);
  // RetainedStreamOffset
  /*[id(0x00000005)]*/ int get_RetainedStreamOffset(out int RetainedStreamOffset);
  // RetainedSizeBytes
  /*[id(0x00000006)]*/ int get_RetainedSizeBytes(out int RetainedSizeBytes);
  // DisplayText
  /*[id(0x00000007)]*/ int get_DisplayText(out wchar* DisplayText);
  // LexicalForm
  /*[id(0x00000008)]*/ int get_LexicalForm(out wchar* LexicalForm);
  // Pronunciation
  /*[id(0x00000009)]*/ int get_Pronunciation(out DWINVARIANT Pronunciation);
  // DisplayAttributes
  /*[id(0x0000000A)]*/ int get_DisplayAttributes(out SpeechDisplayAttributes DisplayAttributes);
  // RequiredConfidence
  /*[id(0x0000000B)]*/ int get_RequiredConfidence(out SpeechEngineConfidence RequiredConfidence);
  // ActualConfidence
  /*[id(0x0000000C)]*/ int get_ActualConfidence(out SpeechEngineConfidence ActualConfidence);
  // EngineConfidence
  /*[id(0x0000000D)]*/ int get_EngineConfidence(out float EngineConfidence);
}

// ISpeechPhraseReplacements Interface
interface ISpeechPhraseReplacements : IDispatch {
  mixin(uuid("38bc662f-2257-4525-959e-2069d2596c05"));
  //static DWINGUID IID = { 0x38bc662f, 0x2257, 0x4525, 0x95, 0x9e, 0x20, 0x69, 0xd2, 0x59, 0x6c, 0x05 };
  // Count
  /*[id(0x00000001)]*/ int get_Count(out int Count);
  // Item
  /*[id(0x00000000)]*/ int Item(int Index, out ISpeechPhraseReplacement Reps);
  // Enumerates the tokens
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown EnumVARIANT);
}

// ISpeechPhraseReplacement Interface
interface ISpeechPhraseReplacement : IDispatch {
  mixin(uuid("2890a410-53a7-4fb5-94ec-06d4998e3d02"));
  //static DWINGUID IID = { 0x2890a410, 0x53a7, 0x4fb5, 0x94, 0xec, 0x06, 0xd4, 0x99, 0x8e, 0x3d, 0x02 };
  // DisplayAttributes
  /*[id(0x00000001)]*/ int get_DisplayAttributes(out SpeechDisplayAttributes DisplayAttributes);
  // Text
  /*[id(0x00000002)]*/ int get_Text(out wchar* Text);
  // FirstElement
  /*[id(0x00000003)]*/ int get_FirstElement(out int FirstElement);
  // NumElements
  /*[id(0x00000004)]*/ int get_NumberOfElements(out int NumberOfElements);
}

// ISpeechPhraseAlternates Interface
interface ISpeechPhraseAlternates : IDispatch {
  mixin(uuid("b238b6d5-f276-4c3d-a6c1-2974801c3cc2"));
  //static DWINGUID IID = { 0xb238b6d5, 0xf276, 0x4c3d, 0xa6, 0xc1, 0x29, 0x74, 0x80, 0x1c, 0x3c, 0xc2 };
  // Count
  /*[id(0x00000001)]*/ int get_Count(out int Count);
  // Item
  /*[id(0x00000000)]*/ int Item(int Index, out ISpeechPhraseAlternate PhraseAlternate);
  // Enumerates the alternates
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown EnumVARIANT);
}

// ISpeechPhraseAlternate Interface
interface ISpeechPhraseAlternate : IDispatch {
  mixin(uuid("27864a2a-2b9f-4cb8-92d3-0d2722fd1e73"));
  //static DWINGUID IID = { 0x27864a2a, 0x2b9f, 0x4cb8, 0x92, 0xd3, 0x0d, 0x27, 0x22, 0xfd, 0x1e, 0x73 };
  // RecoResult
  /*[id(0x00000001)]*/ int get_RecoResult(out ISpeechRecoResult RecoResult);
  // StartElementInResult
  /*[id(0x00000002)]*/ int get_StartElementInResult(out int StartElement);
  // NumberOfElementsInResult
  /*[id(0x00000003)]*/ int get_NumberOfElementsInResult(out int NumberOfElements);
  // Phrase
  /*[id(0x00000004)]*/ int get_PhraseInfo(out ISpeechPhraseInfo PhraseInfo);
  // Commit
  /*[id(0x00000005)]*/ int Commit();
}

interface _ISpeechRecoContextEvents : IDispatch {
  mixin(uuid("7b8fcb42-0e9d-4f00-a048-7b04d6179d3d"));
  //static DWINGUID IID = { 0x7b8fcb42, 0x0e9d, 0x4f00, 0xa0, 0x48, 0x7b, 0x04, 0xd6, 0x17, 0x9d, 0x3d };
  /+// StartStream
  /*[id(0x00000001)]*/ void StartStream(int StreamNumber, DWINVARIANT StreamPosition);+/
  /+// EndStream
  /*[id(0x00000002)]*/ void EndStream(int StreamNumber, DWINVARIANT StreamPosition, short StreamReleased);+/
  /+// Bookmark
  /*[id(0x00000003)]*/ void Bookmark(int StreamNumber, DWINVARIANT StreamPosition, DWINVARIANT BookmarkId, SpeechBookmarkOptions Options);+/
  /+// SoundStart
  /*[id(0x00000004)]*/ void SoundStart(int StreamNumber, DWINVARIANT StreamPosition);+/
  /+// SoundEnd
  /*[id(0x00000005)]*/ void SoundEnd(int StreamNumber, DWINVARIANT StreamPosition);+/
  /+// PhraseStart
  /*[id(0x00000006)]*/ void PhraseStart(int StreamNumber, DWINVARIANT StreamPosition);+/
  /+// Recognition
  /*[id(0x00000007)]*/ void Recognition(int StreamNumber, DWINVARIANT StreamPosition, SpeechRecognitionType RecognitionType, ISpeechRecoResult Result);+/
  /+// Hypothesis
  /*[id(0x00000008)]*/ void Hypothesis(int StreamNumber, DWINVARIANT StreamPosition, ISpeechRecoResult Result);+/
  /+// PropertyNumberChange
  /*[id(0x00000009)]*/ void PropertyNumberChange(int StreamNumber, DWINVARIANT StreamPosition, wchar* PropertyName, int NewNumberValue);+/
  /+// PropertyStringChange
  /*[id(0x0000000A)]*/ void PropertyStringChange(int StreamNumber, DWINVARIANT StreamPosition, wchar* PropertyName, wchar* NewStringValue);+/
  /+// FalseRecognition
  /*[id(0x0000000B)]*/ void FalseRecognition(int StreamNumber, DWINVARIANT StreamPosition, ISpeechRecoResult Result);+/
  /+// Interference
  /*[id(0x0000000C)]*/ void Interference(int StreamNumber, DWINVARIANT StreamPosition, SpeechInterference Interference);+/
  /+// RequestUI
  /*[id(0x0000000D)]*/ void RequestUI(int StreamNumber, DWINVARIANT StreamPosition, wchar* UIType);+/
  /+// RecognizerStateChange
  /*[id(0x0000000E)]*/ void RecognizerStateChange(int StreamNumber, DWINVARIANT StreamPosition, SpeechRecognizerState NewState);+/
  /+// Adaptation
  /*[id(0x0000000F)]*/ void Adaptation(int StreamNumber, DWINVARIANT StreamPosition);+/
  /+// RecognitionForOtherContext
  /*[id(0x00000010)]*/ void RecognitionForOtherContext(int StreamNumber, DWINVARIANT StreamPosition);+/
  /+// AudioLevel
  /*[id(0x00000011)]*/ void AudioLevel(int StreamNumber, DWINVARIANT StreamPosition, int AudioLevel);+/
  /+// EnginePrivate
  /*[id(0x00000012)]*/ void EnginePrivate(int StreamNumber, DWINVARIANT StreamPosition, DWINVARIANT EngineData);+/
}

// ISpeechLexicon Interface
interface ISpeechLexicon : IDispatch {
  mixin(uuid("3da7627a-c7ae-4b23-8708-638c50362c25"));
  //static DWINGUID IID = { 0x3da7627a, 0xc7ae, 0x4b23, 0x87, 0x08, 0x63, 0x8c, 0x50, 0x36, 0x2c, 0x25 };
  // GenerationId
  /*[id(0x00000001)]*/ int get_GenerationId(out int GenerationId);
  // GetWords
  /*[id(0x00000002)]*/ int GetWords(SpeechLexiconType Flags, int* GenerationId, out ISpeechLexiconWords Words);
  // AddPronunciation
  /*[id(0x00000003)]*/ int AddPronunciation(wchar* bstrWord, int LangId, SpeechPartOfSpeech PartOfSpeech, wchar* bstrPronunciation);
  // AddPronunciationByPhoneIds
  /*[id(0x00000004)]*/ int AddPronunciationByPhoneIds(wchar* bstrWord, int LangId, SpeechPartOfSpeech PartOfSpeech, DWINVARIANT* PhoneIds);
  // RemovePronunciation
  /*[id(0x00000005)]*/ int RemovePronunciation(wchar* bstrWord, int LangId, SpeechPartOfSpeech PartOfSpeech, wchar* bstrPronunciation);
  // RemovePronunciationByPhoneIds
  /*[id(0x00000006)]*/ int RemovePronunciationByPhoneIds(wchar* bstrWord, int LangId, SpeechPartOfSpeech PartOfSpeech, DWINVARIANT* PhoneIds);
  // GetPronunciations
  /*[id(0x00000007)]*/ int GetPronunciations(wchar* bstrWord, int LangId, SpeechLexiconType TypeFlags, out ISpeechLexiconPronunciations ppPronunciations);
  // GetGenerationChange
  /*[id(0x00000008)]*/ int GetGenerationChange(ref int GenerationId, out ISpeechLexiconWords ppWords);
}

// ISpeechLexiconWords Interface
interface ISpeechLexiconWords : IDispatch {
  mixin(uuid("8d199862-415e-47d5-ac4f-faa608b424e6"));
  //static DWINGUID IID = { 0x8d199862, 0x415e, 0x47d5, 0xac, 0x4f, 0xfa, 0xa6, 0x08, 0xb4, 0x24, 0xe6 };
  // Count
  /*[id(0x00000001)]*/ int get_Count(out int Count);
  // Item
  /*[id(0x00000000)]*/ int Item(int Index, out ISpeechLexiconWord Word);
  // Enumerates the tokens
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown EnumVARIANT);
}

// ISpeechLexiconWord Interface
interface ISpeechLexiconWord : IDispatch {
  mixin(uuid("4e5b933c-c9be-48ed-8842-1ee51bb1d4ff"));
  //static DWINGUID IID = { 0x4e5b933c, 0xc9be, 0x48ed, 0x88, 0x42, 0x1e, 0xe5, 0x1b, 0xb1, 0xd4, 0xff };
  /*[id(0x00000001)]*/ int get_LangId(out int LangId);
  /*[id(0x00000002)]*/ int get_Type(out SpeechWordType WordType);
  /*[id(0x00000003)]*/ int get_Word(out wchar* Word);
  /*[id(0x00000004)]*/ int get_Pronunciations(out ISpeechLexiconPronunciations Pronunciations);
}

// ISpeechLexiconPronunciations Interface
interface ISpeechLexiconPronunciations : IDispatch {
  mixin(uuid("72829128-5682-4704-a0d4-3e2bb6f2ead3"));
  //static DWINGUID IID = { 0x72829128, 0x5682, 0x4704, 0xa0, 0xd4, 0x3e, 0x2b, 0xb6, 0xf2, 0xea, 0xd3 };
  // Count
  /*[id(0x00000001)]*/ int get_Count(out int Count);
  // Item
  /*[id(0x00000000)]*/ int Item(int Index, out ISpeechLexiconPronunciation Pronunciation);
  // Enumerates the tokens
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown EnumVARIANT);
}

// ISpeechLexiconPronunciation Interface
interface ISpeechLexiconPronunciation : IDispatch {
  mixin(uuid("95252c5d-9e43-4f4a-9899-48ee73352f9f"));
  //static DWINGUID IID = { 0x95252c5d, 0x9e43, 0x4f4a, 0x98, 0x99, 0x48, 0xee, 0x73, 0x35, 0x2f, 0x9f };
  // Type
  /*[id(0x00000001)]*/ int get_Type(out SpeechLexiconType LexiconType);
  // LangId
  /*[id(0x00000002)]*/ int get_LangId(out int LangId);
  // PartOfSpeech
  /*[id(0x00000003)]*/ int get_PartOfSpeech(out SpeechPartOfSpeech PartOfSpeech);
  // PhoneIds
  /*[id(0x00000004)]*/ int get_PhoneIds(out DWINVARIANT PhoneIds);
  // Symbolic
  /*[id(0x00000005)]*/ int get_Symbolic(out wchar* Symbolic);
}

// ISpeechPhraseInfoBuilder Interface
interface ISpeechPhraseInfoBuilder : IDispatch {
  mixin(uuid("3b151836-df3a-4e0a-846c-d2adc9334333"));
  //static DWINGUID IID = { 0x3b151836, 0xdf3a, 0x4e0a, 0x84, 0x6c, 0xd2, 0xad, 0xc9, 0x33, 0x43, 0x33 };
  // RestorePhraseFromMemory
  /*[id(0x00000001)]*/ int RestorePhraseFromMemory(DWINVARIANT* PhraseInMemory, out ISpeechPhraseInfo PhraseInfo);
}

// ISpeechPhoneConverter Interface
interface ISpeechPhoneConverter : IDispatch {
  mixin(uuid("c3e4f353-433f-43d6-89a1-6a62a7054c3d"));
  //static DWINGUID IID = { 0xc3e4f353, 0x433f, 0x43d6, 0x89, 0xa1, 0x6a, 0x62, 0xa7, 0x05, 0x4c, 0x3d };
  // LanguageId
  /*[id(0x00000001)]*/ int get_LanguageId(out int LanguageId);
  // LanguageId
  /*[id(0x00000001)]*/ int set_LanguageId(int LanguageId);
  // PhoneToId
  /*[id(0x00000002)]*/ int PhoneToId(wchar* Phonemes, out DWINVARIANT IdArray);
  // IdToPhone
  /*[id(0x00000003)]*/ int IdToPhone(DWINVARIANT IdArray, out wchar* Phonemes);
}

// ISpNotifyTranslator Interface
interface ISpNotifyTranslator : ISpNotifySink {
  mixin(uuid("aca16614-5d3d-11d2-960e-00c04f8ee628"));
  //static DWINGUID IID = { 0xaca16614, 0x5d3d, 0x11d2, 0x96, 0x0e, 0x00, 0xc0, 0x4f, 0x8e, 0xe6, 0x28 };
  /*[id(0x60020000)]*/ int InitWindowMessage(wireHWND hWnd, uint Msg, UINT_PTR wParam, LONG_PTR lParam);
  /*[id(0x60020001)]*/ int InitCallback(void** pfnCallback, UINT_PTR wParam, LONG_PTR lParam);
  /*[id(0x60020002)]*/ int InitSpNotifyCallback(void** pSpCallback, UINT_PTR wParam, LONG_PTR lParam);
  /*[id(0x60020003)]*/ int InitWin32Event(void* hEvent, int fCloseHandleOnRelease);
  /*[id(0x60020004)]*/ int Wait(uint dwMilliseconds);
  /*[id(0x60020005)]*/ void* GetEventHandle();
}

// ISpNotifySink Interface
interface ISpNotifySink : IUnknown {
  mixin(uuid("259684dc-37c3-11d2-9603-00c04f8ee628"));
  //static DWINGUID IID = { 0x259684dc, 0x37c3, 0x11d2, 0x96, 0x03, 0x00, 0xc0, 0x4f, 0x8e, 0xe6, 0x28 };
  /*[id(0x60010000)]*/ int Notify();
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

// ISpObjectToken Interface
interface ISpObjectToken : ISpDataKey {
  mixin(uuid("14056589-e16c-11d2-bb90-00c04f8ee6c0"));
  //static DWINGUID IID = { 0x14056589, 0xe16c, 0x11d2, 0xbb, 0x90, 0x00, 0xc0, 0x4f, 0x8e, 0xe6, 0xc0 };
  /*[id(0x60020000)]*/ int SetId(wchar* pszCategoryId, wchar* pszTokenId, int fCreateIfNotExist);
  /*[id(0x60020001)]*/ int GetId(wchar** ppszCoMemTokenId);
  /*[id(0x60020002)]*/ int GetCategory(ISpObjectTokenCategory* ppTokenCategory);
  /*[id(0x60020003)]*/ int CreateInstance(IUnknown pUnkOuter, uint dwClsContext, ref DWINGUID riid, void**  ppvObject);
  /*[id(0x60020004)]*/ int GetStorageFileName(ref DWINGUID clsidCaller, wchar* pszValueName, wchar* pszFileNameSpecifier, uint nFolder, out wchar* ppszFilePath);
  /*[id(0x60020005)]*/ int RemoveStorageFileName(ref DWINGUID clsidCaller, wchar* pszKeyName, int fDeleteFile);
  /*[id(0x60020006)]*/ int Remove(ref DWINGUID pclsidCaller);
  /*[id(0x60020007)]*/ int IsUISupported(wchar* pszTypeOfUI, void* pvExtraData, uint cbExtraData, IUnknown punkObject, out int pfSupported);
  /*[id(0x60020008)]*/ int DisplayUI(wireHWND hWndParent, wchar* pszTitle, wchar* pszTypeOfUI, void* pvExtraData, uint cbExtraData, IUnknown punkObject);
  /*[id(0x60020009)]*/ int MatchesAttributes(wchar* pszAttributes, out int pfMatches);
}

/*
//--- ISpObjectToken --------------------------------------------------------
[
    object,
    uuid(14056589-E16C-11D2-BB90-00C04F8EE6C0),
    helpstring("ISpObjectToken Interface"),
    pointer_default(unique),
    restricted
]
interface ISpObjectToken : ISpDataKey
{
    HRESULT SetId(const WCHAR * pszCategoryId, const WCHAR * pszTokenId, BOOL fCreateIfNotExist);
    HRESULT GetId(WCHAR ** ppszCoMemTokenId);
    HRESULT GetCategory(ISpObjectTokenCategory ** ppTokenCategory);

    HRESULT CreateInstance(
                [in] IUnknown * pUnkOuter, 
                [in] DWORD dwClsContext,
                [in] REFIID riid, 
                [out, iid_is(riid)] void ** ppvObject);

    HRESULT GetStorageFileName(
                [in] REFCLSID clsidCaller,
                [in] const WCHAR * pszValueName,
                [in] const WCHAR * pszFileNameSpecifier,
                [in] ULONG nFolder,       // Same as SHGetFolderPath -- If non-zero, must set CSIDL_FLAG_CREATE
                [out] WCHAR ** ppszFilePath);
    HRESULT RemoveStorageFileName(
                [in] REFCLSID clsidCaller,
                [in] const WCHAR * pszKeyName,
                [in] BOOL fDeleteFile);

    HRESULT Remove(const CLSID * pclsidCaller);
    
    [local] HRESULT IsUISupported(
                [in] const WCHAR * pszTypeOfUI,
                [in] void * pvExtraData,
                [in] ULONG cbExtraData,
                [in] IUnknown * punkObject,
                [out] BOOL *pfSupported);
    [local] HRESULT DisplayUI(
                [in] HWND hwndParent,
                [in] const WCHAR * pszTitle,
                [in] const WCHAR * pszTypeOfUI,
                [in] void * pvExtraData,
                [in] ULONG cbExtraData,
                [in] IUnknown * punkObject);
    HRESULT MatchesAttributes(
                [in] const WCHAR * pszAttributes, 
                [out] BOOL *pfMatches);
};
*/

// ISpResourceManager Interface
interface ISpResourceManager : IServiceProvider {
  mixin(uuid("93384e18-5014-43d5-adbb-a78e055926bd"));
  //static DWINGUID IID = { 0x93384e18, 0x5014, 0x43d5, 0xad, 0xbb, 0xa7, 0x8e, 0x05, 0x59, 0x26, 0xbd };
  /*[id(0x60020000)]*/ int SetObject(ref DWINGUID guidServiceId, IUnknown punkObject);
  /*[id(0x60020001)]*/ int GetObject(ref DWINGUID guidServiceId, ref DWINGUID ObjectCLSID, ref DWINGUID ObjectIID, int fReleaseWhenLastExternalRefReleased, void**  ppObject);
}

interface IServiceProvider : IUnknown {
  mixin(uuid("6d5140c1-7436-11ce-8034-00aa006009fa"));
  //static DWINGUID IID = { 0x6d5140c1, 0x7436, 0x11ce, 0x80, 0x34, 0x00, 0xaa, 0x00, 0x60, 0x09, 0xfa };
  /*[id(0x60010000)]*/ int RemoteQueryService(ref DWINGUID guidService, ref DWINGUID riid, out IUnknown ppvObject);
}

// ISpStreamFormatConverter Interface
interface ISpStreamFormatConverter : ISpStreamFormat {
  mixin(uuid("678a932c-ea71-4446-9b41-78fda6280a29"));
  //static DWINGUID IID = { 0x678a932c, 0xea71, 0x4446, 0x9b, 0x41, 0x78, 0xfd, 0xa6, 0x28, 0x0a, 0x29 };
  /*[id(0x60040000)]*/ int SetBaseStream(ISpStreamFormat pStream, int fSetFormatToBaseStreamFormat, int fWriteToBaseStream);
  /*[id(0x60040001)]*/ int GetBaseStream(out ISpStreamFormat ppStream);
  /*[id(0x60040002)]*/ int SetFormat(ref DWINGUID rguidFormatIdOfConvertedStream, WaveFormatEx* pWaveFormatExOfConvertedStream);
  /*[id(0x60040003)]*/ int ResetSeekPosition();
  /*[id(0x60040004)]*/ int ScaleConvertedToBaseOffset(ulong ullOffsetConvertedStream, out ulong pullOffsetBaseStream);
  /*[id(0x60040005)]*/ int ScaleBaseToConvertedOffset(ulong ullOffsetBaseStream, out ulong pullOffsetConvertedStream);
}

// ISpStreamFormat Interface
interface ISpStreamFormat : IStream {
  mixin(uuid("bed530be-2606-4f4d-a1c0-54c5cda5566f"));
  //static DWINGUID IID = { 0xbed530be, 0x2606, 0x4f4d, 0xa1, 0xc0, 0x54, 0xc5, 0xcd, 0xa5, 0x56, 0x6f };
  /*[id(0x60030000)]*/ int GetFormat(ref DWINGUID pguidFormatId, WaveFormatEx** ppCoMemWaveFormatEx);
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

// ISpMMSysAudio Interface
interface ISpMMSysAudio : ISpAudio {
  mixin(uuid("15806f6e-1d70-4b48-98e6-3b1a007509ab"));
  //static DWINGUID IID = { 0x15806f6e, 0x1d70, 0x4b48, 0x98, 0xe6, 0x3b, 0x1a, 0x00, 0x75, 0x09, 0xab };
  /*[id(0x60050000)]*/ int GetDeviceId(out uint puDeviceId);
  /*[id(0x60050001)]*/ int SetDeviceId(uint uDeviceId);
  /*[id(0x60050002)]*/ int GetMMHandle(void** pHandle);
  /*[id(0x60050003)]*/ int GetLineId(out uint puLineId);
  /*[id(0x60050004)]*/ int SetLineId(uint uLineId);
}

// ISpAudio Interface
interface ISpAudio : ISpStreamFormat {
  mixin(uuid("c05c768f-fae8-4ec2-8e07-338321c12452"));
  //static DWINGUID IID = { 0xc05c768f, 0xfae8, 0x4ec2, 0x8e, 0x07, 0x33, 0x83, 0x21, 0xc1, 0x24, 0x52 };
  /*[id(0x60040000)]*/ int SetState(SPAUDIOSTATE NewState, ulong ullReserved);
  /*[id(0x60040001)]*/ int SetFormat(ref DWINGUID rguidFmtId, WaveFormatEx* pWaveFormatEx);
  /*[id(0x60040002)]*/ int GetStatus(out SPAUDIOSTATUS pStatus);
  /*[id(0x60040003)]*/ int SetBufferInfo(SPAUDIOBUFFERINFO* pBuffInfo);
  /*[id(0x60040004)]*/ int GetBufferInfo(out SPAUDIOBUFFERINFO pBuffInfo);
  /*[id(0x60040005)]*/ int GetDefaultFormat(out DWINGUID pFormatId, out WaveFormatEx ppCoMemWaveFormatEx);
  /*[id(0x60040006)]*/ void* EventHandle();
  /*[id(0x60040007)]*/ int GetVolumeLevel(out uint pLevel);
  /*[id(0x60040008)]*/ int SetVolumeLevel(uint Level);
  /*[id(0x60040009)]*/ int GetBufferNotifySize(out uint pcbSize);
  /*[id(0x6004000A)]*/ int SetBufferNotifySize(uint cbSize);
}

// ISpStream Interface
interface ISpStream : ISpStreamFormat {
  mixin(uuid("12e3cca9-7518-44c5-a5e7-ba5a79cb929e"));
  //static DWINGUID IID = { 0x12e3cca9, 0x7518, 0x44c5, 0xa5, 0xe7, 0xba, 0x5a, 0x79, 0xcb, 0x92, 0x9e };
  /*[id(0x60040000)]*/ int SetBaseStream(IStream pStream, ref DWINGUID rguidFormat, WaveFormatEx* pWaveFormatEx);
  /*[id(0x60040001)]*/ int GetBaseStream(IStream* ppStream);
  /*[id(0x60040002)]*/ int BindToFile(ushort* pszFileName, SPFILEMODE eMode, ref DWINGUID pFormatId, WaveFormatEx* pWaveFormatEx, ulong ullEventInterest);
  /*[id(0x60040003)]*/ int Close();
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
  /*[id(0x60030018)]*/ int DisplayUI(wireHWND hWndParent, ushort* pszTitle, ushort* pszTypeOfUI, void* pvExtraData, uint cbExtraData);
}

/*
[
    object,
    uuid(6C44DF74-72B9-4992-A1EC-EF996E0422D4),
    helpstring("ISpVoice Interface"),
    pointer_default(unique),
    restricted
]
interface ISpVoice : ISpEventSource
{
    HRESULT SetOutput( [in] IUnknown * pUnkOutput, [in]BOOL fAllowFormatChanges );
    HRESULT GetOutputObjectToken( [out] ISpObjectToken ** ppObjectToken );
    HRESULT GetOutputStream( [out] ISpStreamFormat ** ppStream );

    HRESULT Pause( void );
    HRESULT Resume( void );
                
    HRESULT SetVoice([in] ISpObjectToken *pToken);
    HRESULT GetVoice([out] ISpObjectToken **ppToken);
    
    HRESULT Speak(
                [in, string] const WCHAR* pwcs, 
                [in] DWORD dwFlags, 
                [out] ULONG * pulStreamNumber);
    HRESULT SpeakStream(
                [in] IStream* pStream,  // If not ISpStreamFormat supported then SPDFID_Text assumed
                [in] DWORD dwFlags, 
                [out] ULONG * pulStreamNumber);
                
    HRESULT GetStatus(
                [out] SPVOICESTATUS *pStatus, 
                [out, string] WCHAR ** ppszLastBookmark);

    HRESULT Skip( [in,string]WCHAR* pItemType, [in]long lNumItems, [out]ULONG* pulNumSkipped );
                
    HRESULT SetPriority([in] SPVPRIORITY ePriority );
    HRESULT GetPriority([out] SPVPRIORITY* pePriority );

    HRESULT SetAlertBoundary( [in] SPEVENTENUM eBoundary );
    HRESULT GetAlertBoundary( [out] SPEVENTENUM* peBoundary );

    HRESULT SetRate([in] long RateAdjust );
    HRESULT GetRate([out] long* pRateAdjust);
    
    HRESULT SetVolume([in] USHORT usVolume);
    HRESULT GetVolume([out] USHORT* pusVolume);
    
    HRESULT WaitUntilDone([in] ULONG msTimeout);
    
    HRESULT SetSyncSpeakTimeout([in] ULONG msTimeout);
    HRESULT GetSyncSpeakTimeout([out] ULONG * pmsTimeout);

    [local] HANDLE SpeakCompleteEvent();
    
    [local] HRESULT IsUISupported(
                [in] const WCHAR * pszTypeOfUI,
                [in] void * pvExtraData,
                [in] ULONG cbExtraData,
                [out] BOOL *pfSupported);
    [local] HRESULT DisplayUI(
                [in] HWND hwndParent,
                [in] const WCHAR * pszTitle,
                [in] const WCHAR * pszTypeOfUI,
                [in] void * pvExtraData,
                [in] ULONG cbExtraData);
    
};
*/

// ISpRecoContext Interface
interface ISpRecoContext : ISpEventSource {
  mixin(uuid("f740a62f-7c15-489e-8234-940a33d9272d"));
  //static DWINGUID IID = { 0xf740a62f, 0x7c15, 0x489e, 0x82, 0x34, 0x94, 0x0a, 0x33, 0xd9, 0x27, 0x2d };
  /*[id(0x60030000)]*/ int GetRecognizer(out ISpRecognizer ppRecognizer);
  /*[id(0x60030001)]*/ int CreateGrammar(ulong ullGrammarID, out ISpRecoGrammar ppGrammar);
  /*[id(0x60030002)]*/ int GetStatus(out SPRECOCONTEXTSTATUS pStatus);
  /*[id(0x60030003)]*/ int GetMaxAlternates(uint* pcAlternates);
  /*[id(0x60030004)]*/ int SetMaxAlternates(uint cAlternates);
  /*[id(0x60030005)]*/ int SetAudioOptions(SPAUDIOOPTIONS Options, ref DWINGUID pAudioFormatId, WaveFormatEx* pWaveFormatEx);
  /*[id(0x60030006)]*/ int GetAudioOptions(SPAUDIOOPTIONS* pOptions, out DWINGUID pAudioFormatId, out WaveFormatEx ppCoMemWFEX);
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
  /*[id(0x6002000C)]*/ int GetFormat(SPSTREAMFORMATTYPE WaveFormatType, out DWINGUID pFormatId, out WaveFormatEx ppCoMemWFEX);
  /*[id(0x6002000D)]*/ int IsUISupported(ushort* pszTypeOfUI, void* pvExtraData, uint cbExtraData, out int pfSupported);
  /*[id(0x6002000E)]*/ int DisplayUI(wireHWND hWndParent, ushort* pszTitle, ushort* pszTypeOfUI, void* pvExtraData, uint cbExtraData);
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

// ISpPhrase Interface
interface ISpPhrase : IUnknown {
  mixin(uuid("1a5c0354-b621-4b5a-8791-d306ed379e53"));
  //static DWINGUID IID = { 0x1a5c0354, 0xb621, 0x4b5a, 0x87, 0x91, 0xd3, 0x06, 0xed, 0x37, 0x9e, 0x53 };
  /*[id(0x60010000)]*/ int GetPhrase(out SPPHRASE ppCoMemPhrase);
  /*[id(0x60010001)]*/ int GetSerializedPhrase(out SPSERIALIZEDPHRASE ppCoMemPhrase);
  /*[id(0x60010002)]*/ int GetText(uint ulStart, uint ulCount, int fUseTextReplacements, out ushort ppszCoMemText, out ubyte pbDisplayAttributes);
  /*[id(0x60010003)]*/ int Discard(uint dwValueTypes);
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

// ISpRecoResult Interface
interface ISpRecoResult : ISpPhrase {
  mixin(uuid("20b053be-e235-43cd-9a2a-8d17a48b7842"));
  //static DWINGUID IID = { 0x20b053be, 0xe235, 0x43cd, 0x9a, 0x2a, 0x8d, 0x17, 0xa4, 0x8b, 0x78, 0x42 };
  /*[id(0x60020000)]*/ int GetResultTimes(out SPRECORESULTTIMES pTimes);
  /*[id(0x60020001)]*/ int GetAlternates(uint ulStartElement, uint cElements, uint ulRequestCount, out ISpPhraseAlt ppPhrases, out uint pcPhrasesReturned);
  /*[id(0x60020002)]*/ int GetAudio(uint ulStartElement, uint cElements, out ISpStreamFormat ppStream);
  /*[id(0x60020003)]*/ int SpeakAudio(uint ulStartElement, uint cElements, uint dwFlags, out uint pulStreamNumber);
  /*[id(0x60020004)]*/ int Serialize(out SPSERIALIZEDRESULT ppCoMemSerializedResult);
  /*[id(0x60020005)]*/ int ScaleAudio(ref DWINGUID pAudioFormatId, WaveFormatEx* pWaveFormatEx);
  /*[id(0x60020006)]*/ int GetRecoContext(out ISpRecoContext ppRecoContext);
}

// ISpPhraseAlt Interface
interface ISpPhraseAlt : ISpPhrase {
  mixin(uuid("8fcebc98-4e49-4067-9c6c-d86a0e092e3d"));
  //static DWINGUID IID = { 0x8fcebc98, 0x4e49, 0x4067, 0x9c, 0x6c, 0xd8, 0x6a, 0x0e, 0x09, 0x2e, 0x3d };
  /*[id(0x60020000)]*/ int GetAltInfo(ISpPhrase* ppParent, uint* pulStartElementInParent, uint* pcElementsInParent, uint* pcElementsInAlt);
  /*[id(0x60020001)]*/ int Commit();
}

// ISpLexicon Interface
interface ISpLexicon : IUnknown {
  mixin(uuid("da41a7c2-5383-4db2-916b-6c1719e3db58"));
  //static DWINGUID IID = { 0xda41a7c2, 0x5383, 0x4db2, 0x91, 0x6b, 0x6c, 0x17, 0x19, 0xe3, 0xdb, 0x58 };
  /*[id(0x60010000)]*/ int GetPronunciations(ushort* pszWord, ushort LangId, uint dwFlags, ref SPWORDPRONUNCIATIONLIST pWordPronunciationList);
  /*[id(0x60010001)]*/ int AddPronunciation(ushort* pszWord, ushort LangId, SPPARTOFSPEECH ePartOfSpeech, ushort* pszPronunciation);
  /*[id(0x60010002)]*/ int RemovePronunciation(ushort* pszWord, ushort LangId, SPPARTOFSPEECH ePartOfSpeech, ushort* pszPronunciation);
  /*[id(0x60010003)]*/ int GetGeneration(uint* pdwGeneration);
  /*[id(0x60010004)]*/ int GetGenerationChange(uint dwFlags, ref uint pdwGeneration, ref SPWORDLIST pWordList);
  /*[id(0x60010005)]*/ int GetWords(uint dwFlags, ref uint pdwGeneration, ref uint pdwCookie, ref SPWORDLIST pWordList);
}

// ISpPhoneConverter Interface
interface ISpPhoneConverter : ISpObjectWithToken {
  mixin(uuid("8445c581-0cac-4a38-abfe-9b2ce2826455"));
  //static DWINGUID IID = { 0x8445c581, 0x0cac, 0x4a38, 0xab, 0xfe, 0x9b, 0x2c, 0xe2, 0x82, 0x64, 0x55 };
  /*[id(0x60020000)]*/ int PhoneToId(ushort* pszPhone, out ushort pId);
  /*[id(0x60020001)]*/ int IdToPhone(ushort* pId, out ushort pszPhone);
}

// CoClasses

// SpNotify
abstract class SpNotifyTranslator {
  mixin(uuid("e2ae5372-5d40-11d2-960e-00c04f8ee628"));
  //static DWINGUID CLSID = { 0xe2ae5372, 0x5d40, 0x11d2, 0x96, 0x0e, 0x00, 0xc0, 0x4f, 0x8e, 0xe6, 0x28 };
  mixin Interfaces!(ISpNotifyTranslator);
}

// SpObjectTokenCategory Class
abstract class SpObjectTokenCategory {
  mixin(uuid("a910187f-0c7a-45ac-92cc-59edafb77b53"));
  //static DWINGUID CLSID = { 0xa910187f, 0x0c7a, 0x45ac, 0x92, 0xcc, 0x59, 0xed, 0xaf, 0xb7, 0x7b, 0x53 };
  mixin Interfaces!(ISpeechObjectTokenCategory, ISpObjectTokenCategory);
}

// SpObjectToken Class
abstract class SpObjectToken {
  mixin(uuid("ef411752-3736-4cb4-9c8c-8ef4ccb58efe"));
  //static DWINGUID CLSID = { 0xef411752, 0x3736, 0x4cb4, 0x9c, 0x8c, 0x8e, 0xf4, 0xcc, 0xb5, 0x8e, 0xfe };
  mixin Interfaces!(ISpeechObjectToken, ISpObjectToken);
}

// SpResourceManger
abstract class SpResourceManager {
  mixin(uuid("96749373-3391-11d2-9ee3-00c04f797396"));
  //static DWINGUID CLSID = { 0x96749373, 0x3391, 0x11d2, 0x9e, 0xe3, 0x00, 0xc0, 0x4f, 0x79, 0x73, 0x96 };
  mixin Interfaces!(ISpResourceManager);
}

// FormatConverter Class
abstract class SpStreamFormatConverter {
  mixin(uuid("7013943a-e2ec-11d2-a086-00c04f8ef9b5"));
  //static DWINGUID CLSID = { 0x7013943a, 0xe2ec, 0x11d2, 0xa0, 0x86, 0x00, 0xc0, 0x4f, 0x8e, 0xf9, 0xb5 };
  mixin Interfaces!(ISpStreamFormatConverter);
}

// SpMMAudioEnum Class
abstract class SpMMAudioEnum {
  mixin(uuid("ab1890a0-e91f-11d2-bb91-00c04f8ee6c0"));
  //static DWINGUID CLSID = { 0xab1890a0, 0xe91f, 0x11d2, 0xbb, 0x91, 0x00, 0xc0, 0x4f, 0x8e, 0xe6, 0xc0 };
  mixin Interfaces!(IEnumSpObjectTokens);
}

// SpMMAudioIn Class
abstract class SpMMAudioIn {
  mixin(uuid("cf3d2e50-53f2-11d2-960c-00c04f8ee628"));
  //static DWINGUID CLSID = { 0xcf3d2e50, 0x53f2, 0x11d2, 0x96, 0x0c, 0x00, 0xc0, 0x4f, 0x8e, 0xe6, 0x28 };
  mixin Interfaces!(ISpeechMMSysAudio, ISpEventSource, ISpEventSink, ISpObjectWithToken, ISpMMSysAudio);
}

// SpMMAudioOut Class
abstract class SpMMAudioOut {
  mixin(uuid("a8c680eb-3d32-11d2-9ee7-00c04f797396"));
  //static DWINGUID CLSID = { 0xa8c680eb, 0x3d32, 0x11d2, 0x9e, 0xe7, 0x00, 0xc0, 0x4f, 0x79, 0x73, 0x96 };
  mixin Interfaces!(ISpeechMMSysAudio, ISpEventSource, ISpEventSink, ISpObjectWithToken, ISpMMSysAudio);
}

// SpRecPlayAudio Class
abstract class SpRecPlayAudio {
  mixin(uuid("fee225fc-7afd-45e9-95d0-5a318079d911"));
  //static DWINGUID CLSID = { 0xfee225fc, 0x7afd, 0x45e9, 0x95, 0xd0, 0x5a, 0x31, 0x80, 0x79, 0xd9, 0x11 };
  mixin Interfaces!(ISpObjectWithToken, ISpAudio);
}

// SpStream Class
abstract class SpStream {
  mixin(uuid("715d9c59-4442-11d2-9605-00c04f8ee628"));
  //static DWINGUID CLSID = { 0x715d9c59, 0x4442, 0x11d2, 0x96, 0x05, 0x00, 0xc0, 0x4f, 0x8e, 0xe6, 0x28 };
  mixin Interfaces!(ISpStream);
}

// SpVoice Class
abstract class SpVoice {
  mixin(uuid("96749377-3391-11d2-9ee3-00c04f797396"));
  //static DWINGUID CLSID = { 0x96749377, 0x3391, 0x11d2, 0x9e, 0xe3, 0x00, 0xc0, 0x4f, 0x79, 0x73, 0x96 };
  mixin Interfaces!(ISpeechVoice, ISpVoice);
}

// SpSharedRecoContext Class
abstract class SpSharedRecoContext {
  mixin(uuid("47206204-5eca-11d2-960f-00c04f8ee628"));
  //static DWINGUID CLSID = { 0x47206204, 0x5eca, 0x11d2, 0x96, 0x0f, 0x00, 0xc0, 0x4f, 0x8e, 0xe6, 0x28 };
  mixin Interfaces!(ISpeechRecoContext, ISpRecoContext);
}

// SpInprocRecognizer Class
abstract class SpInprocRecognizer {
  mixin(uuid("41b89b6b-9399-11d2-9623-00c04f8ee628"));
  //static DWINGUID CLSID = { 0x41b89b6b, 0x9399, 0x11d2, 0x96, 0x23, 0x00, 0xc0, 0x4f, 0x8e, 0xe6, 0x28 };
  mixin Interfaces!(ISpeechRecognizer, ISpRecognizer);
}

// SpSharedRecognizer Class
abstract class SpSharedRecognizer {
  mixin(uuid("3bee4890-4fe9-4a37-8c1e-5e7e12791c1f"));
  //static DWINGUID CLSID = { 0x3bee4890, 0x4fe9, 0x4a37, 0x8c, 0x1e, 0x5e, 0x7e, 0x12, 0x79, 0x1c, 0x1f };
  mixin Interfaces!(ISpeechRecognizer, ISpRecognizer);
}

// SpLexicon Class
abstract class SpLexicon {
  mixin(uuid("0655e396-25d0-11d3-9c26-00c04f8ef87c"));
  //static DWINGUID CLSID = { 0x0655e396, 0x25d0, 0x11d3, 0x9c, 0x26, 0x00, 0xc0, 0x4f, 0x8e, 0xf8, 0x7c };
  mixin Interfaces!(ISpeechLexicon, ISpLexicon);
}

// SpUnCompressedLexicon Class
abstract class SpUnCompressedLexicon {
  mixin(uuid("c9e37c15-df92-4727-85d6-72e5eeb6995a"));
  //static DWINGUID CLSID = { 0xc9e37c15, 0xdf92, 0x4727, 0x85, 0xd6, 0x72, 0xe5, 0xee, 0xb6, 0x99, 0x5a };
  mixin Interfaces!(ISpeechLexicon, ISpLexicon, ISpObjectWithToken);
}

// SpCompressedLexicon Class
abstract class SpCompressedLexicon {
  mixin(uuid("90903716-2f42-11d3-9c26-00c04f8ef87c"));
  //static DWINGUID CLSID = { 0x90903716, 0x2f42, 0x11d3, 0x9c, 0x26, 0x00, 0xc0, 0x4f, 0x8e, 0xf8, 0x7c };
  mixin Interfaces!(ISpLexicon, ISpObjectWithToken);
}

// SpPhoneConverter Class
abstract class SpPhoneConverter {
  mixin(uuid("9185f743-1143-4c28-86b5-bff14f20e5c8"));
  //static DWINGUID CLSID = { 0x9185f743, 0x1143, 0x4c28, 0x86, 0xb5, 0xbf, 0xf1, 0x4f, 0x20, 0xe5, 0xc8 };
  mixin Interfaces!(ISpeechPhoneConverter, ISpPhoneConverter);
}

// SpNullPhoneConverter Class
abstract class SpNullPhoneConverter {
  mixin(uuid("455f24e9-7396-4a16-9715-7c0fdbe3efe3"));
  //static DWINGUID CLSID = { 0x455f24e9, 0x7396, 0x4a16, 0x97, 0x15, 0x7c, 0x0f, 0xdb, 0xe3, 0xef, 0xe3 };
  mixin Interfaces!(ISpPhoneConverter);
}

// SpTextSelectionInformation Class
abstract class SpTextSelectionInformation {
  mixin(uuid("0f92030a-cbfd-4ab8-a164-ff5985547ff6"));
  //static DWINGUID CLSID = { 0x0f92030a, 0xcbfd, 0x4ab8, 0xa1, 0x64, 0xff, 0x59, 0x85, 0x54, 0x7f, 0xf6 };
  mixin Interfaces!(ISpeechTextSelectionInformation);
}

// SpPhraseInfoBuilder Class
abstract class SpPhraseInfoBuilder {
  mixin(uuid("c23fc28d-c55f-4720-8b32-91f73c2bd5d1"));
  //static DWINGUID CLSID = { 0xc23fc28d, 0xc55f, 0x4720, 0x8b, 0x32, 0x91, 0xf7, 0x3c, 0x2b, 0xd5, 0xd1 };
  mixin Interfaces!(ISpeechPhraseInfoBuilder);
}

// SpAudioFormat Class
abstract class SpAudioFormat {
  mixin(uuid("9ef96870-e160-4792-820d-48cf0649e4ec"));
  //static DWINGUID CLSID = { 0x9ef96870, 0xe160, 0x4792, 0x82, 0x0d, 0x48, 0xcf, 0x06, 0x49, 0xe4, 0xec };
  mixin Interfaces!(ISpeechAudioFormat);
}

// SpWaveFormatEx Class
abstract class SpWaveFormatEx {
  mixin(uuid("c79a574c-63be-44b9-801f-283f87f898be"));
  //static DWINGUID CLSID = { 0xc79a574c, 0x63be, 0x44b9, 0x80, 0x1f, 0x28, 0x3f, 0x87, 0xf8, 0x98, 0xbe };
  mixin Interfaces!(ISpeechWaveFormatEx);
}

// SpInProcRecoContext Class
abstract class SpInProcRecoContext {
  mixin(uuid("73ad6842-ace0-45e8-a4dd-8795881a2c2a"));
  //static DWINGUID CLSID = { 0x73ad6842, 0xace0, 0x45e8, 0xa4, 0xdd, 0x87, 0x95, 0x88, 0x1a, 0x2c, 0x2a };
  mixin Interfaces!(ISpeechRecoContext, ISpRecoContext);
}

// SpCustomStream Class
abstract class SpCustomStream {
  mixin(uuid("8dbef13f-1948-4aa8-8cf0-048eebed95d8"));
  //static DWINGUID CLSID = { 0x8dbef13f, 0x1948, 0x4aa8, 0x8c, 0xf0, 0x04, 0x8e, 0xeb, 0xed, 0x95, 0xd8 };
  mixin Interfaces!(ISpeechCustomStream, ISpStream);
}

// SpFileStream Class
abstract class SpFileStream {
  mixin(uuid("947812b3-2ae1-4644-ba86-9e90ded7ec91"));
  //static DWINGUID CLSID = { 0x947812b3, 0x2ae1, 0x4644, 0xba, 0x86, 0x9e, 0x90, 0xde, 0xd7, 0xec, 0x91 };
  mixin Interfaces!(ISpeechFileStream, ISpStream);
}

// SpMemoryStream Class
abstract class SpMemoryStream {
  mixin(uuid("5fb7ef7d-dff4-468a-b6b7-2fcbd188f994"));
  //static DWINGUID CLSID = { 0x5fb7ef7d, 0xdff4, 0x468a, 0xb6, 0xb7, 0x2f, 0xcb, 0xd1, 0x88, 0xf9, 0x94 };
  mixin Interfaces!(ISpeechMemoryStream, ISpStream);
}

// Global variables
const wchar* SpeechRegistryUserRoot = "HKEY_CURRENT_USER\\SOFTWARE\\Microsoft\\Speech";
const wchar* SpeechRegistryLocalMachineRoot = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech";
const wchar* SpeechCategoryAudioOut = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech\\AudioOutput";
const wchar* SpeechCategoryAudioIn = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech\\AudioInput";
const wchar* SpeechCategoryVoices = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech\\Voices";
const wchar* SpeechCategoryRecognizers = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech\\Recognizers";
const wchar* SpeechCategoryAppLexicons = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech\\AppLexicons";
const wchar* SpeechCategoryPhoneConverters = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech\\PhoneConverters";
const wchar* SpeechCategoryRecoProfiles = "HKEY_CURRENT_USER\\SOFTWARE\\Microsoft\\Speech\\RecoProfiles";
const wchar* SpeechTokenIdUserLexicon = "HKEY_CURRENT_USER\\SOFTWARE\\Microsoft\\Speech\\CurrentUserLexicon";
const wchar* SpeechTokenValueCLSID = "CLSID";
const wchar* SpeechTokenKeyFiles = "Files";
const wchar* SpeechTokenKeyUI = "UI";
const wchar* SpeechTokenKeyAttributes = "Attributes";
const wchar* SpeechVoiceCategoryTTSRate = "DefaultTTSRate";
const wchar* SpeechPropertyResourceUsage = "ResourceUsage";
const wchar* SpeechPropertyHighConfidenceThreshold = "HighConfidenceThreshold";
const wchar* SpeechPropertyNormalConfidenceThreshold = "NormalConfidenceThreshold";
const wchar* SpeechPropertyLowConfidenceThreshold = "LowConfidenceThreshold";
const wchar* SpeechPropertyResponseSpeed = "ResponseSpeed";
const wchar* SpeechPropertyComplexResponseSpeed = "ComplexResponseSpeed";
const wchar* SpeechPropertyAdaptationOn = "AdaptationOn";
const wchar* SpeechDictationTopicSpelling = "Spelling";
const wchar* SpeechGrammarTagWildcard = "...";
const wchar* SpeechGrammarTagDictation = "*";
const wchar* SpeechGrammarTagUnlimitedDictation = "*+";
const wchar* SpeechEngineProperties = "EngineProperties";
const wchar* SpeechAddRemoveWord = "AddRemoveWord";
const wchar* SpeechUserTraining = "UserTraining";
const wchar* SpeechMicTraining = "MicTraining";
const wchar* SpeechRecoProfileProperties = "RecoProfileProperties";
const wchar* SpeechAudioProperties = "AudioProperties";
const wchar* SpeechAudioVolume = "AudioVolume";
const wchar* SpeechVoiceSkipTypeSentence = "Sentence";
const wchar* SpeechAudioFormatGUIDWave = "{C31ADBAE-527F-4ff5-A230-F62BB61FF70C}";
const wchar* SpeechAudioFormatGUIDText = "{7CEEF9F9-3D13-11d2-9EE7-00C04F797396}";
const float Speech_Default_Weight = 1.065353E+09;
const int Speech_Max_Word_Length = 0x00000080;
const int Speech_Max_Pron_Length = 0x00000180;
const int Speech_StreamPos_Asap = 0x00000000;
const int Speech_StreamPos_RealTime = 0xFFFFFFFF;
const int SpeechAllElements = 0xFFFFFFFF;
