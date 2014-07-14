// itngram_CHS 1.0 Type Library
// Version 1.0

//mixin(uuid("42e0f13a-11fd-11d3-bb97-00c04f8ee6c0"));
//C:\Program Files\Common Files\SpeechEngines\Microsoft\SR\2052\itngram.dll
//module itngramlib;
module dwin.sys.win32.com.tlb.speech.itngramCHS;

/*[importlib("stdole2.tlb")]*/
private import dwin.sys.win32.com.Core;

// Structs

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

// Interfaces

// ISpCFGInterpreter Interface
interface ISpCFGInterpreter : IUnknown {
  mixin(uuid("f3d3f926-11fc-11d3-bb97-00c04f8ee6c0"));
  //static DWINGUID IID = { 0xf3d3f926, 0x11fc, 0x11d3, 0xbb, 0x97, 0x00, 0xc0, 0x4f, 0x8e, 0xe6, 0xc0 };
  /*[id(0x60010000)]*/ int InitGrammar(ushort* pszGrammarName, void** pvGrammarData);
  /*[id(0x60010001)]*/ int Interpret(ISpPhraseBuilder pPhrase, uint ulFirstElement, uint ulCountOfElements, ISpCFGInterpreterSite pSite);
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

// ISpCFGInterpreterSite Interface
interface ISpCFGInterpreterSite : IUnknown {
  mixin(uuid("6a6ffad8-78b6-473d-b844-98152e4fb16b"));
  //static DWINGUID IID = { 0x6a6ffad8, 0x78b6, 0x473d, 0xb8, 0x44, 0x98, 0x15, 0x2e, 0x4f, 0xb1, 0x6b };
  /*[id(0x60010000)]*/ int AddTextReplacement(SPPHRASEREPLACEMENT* pReplace);
  /*[id(0x60010001)]*/ int AddProperty(SPPHRASEPROPERTY* pProperty);
  /*[id(0x60010002)]*/ int GetResourceValue(ushort* pszResourceName, out ushort ppCoMemResource);
}

// CoClasses

// ITN_CHS Class
abstract class TestITN_CHS {
  mixin(uuid("42e0f147-11fd-11d3-bb97-00c04f8ee6c0"));
  //static DWINGUID CLSID = { 0x42e0f147, 0x11fd, 0x11d3, 0xbb, 0x97, 0x00, 0xc0, 0x4f, 0x8e, 0xe6, 0xc0 };
  mixin Interfaces!(ISpCFGInterpreter);
}

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
