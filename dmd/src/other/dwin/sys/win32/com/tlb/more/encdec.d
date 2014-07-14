// Microsoft Encypter-Tagger/Decrypter-Detagger Filters
// Version 1.0

/*[uuid("c4c4c400-0049-4e2b-98fb-9537f6ce516d")]*/
module dwin.sys.win32.com.tlb.more.encdec;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum __MIDL___MIDL_itf_encdec_0257_0001 {
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

enum __MIDL___MIDL_itf_encdec_0257_0002 {
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

// Aliases

alias __MIDL___MIDL_itf_encdec_0257_0001 EnTvRat_System;

alias __MIDL___MIDL_itf_encdec_0257_0002 EnTvRat_GenericLevel;

// Interfaces

// IETFilter Interface
interface IETFilter : IUnknown {
  mixin(uuid("c4c4c4b1-0049-4e2b-98fb-9537f6ce516d"));
  // static DWINGUID IID = { 0xc4c4c4b1, 0x0049, 0x4e2b, 0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d };
  // property EvalRatObjOK
  /*[id(0x00000001)]*/ int get_EvalRatObjOK(out int pHrCoCreateRetVal);
  // method GetCurrRating
  /*[id(0x00000002)]*/ int GetCurrRating(out EnTvRat_System pEnSystem, out EnTvRat_GenericLevel pEnRating, out int plbfEnAttr);
}

// IETFilterEvents
interface IETFilterEvents : IDispatch {
  mixin(uuid("c4c4c4c1-0049-4e2b-98fb-9537f6ce516d"));
  // static DWINGUID IID = { 0xc4c4c4c1, 0x0049, 0x4e2b, 0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d };
}

// IETFilterConfig Interface
interface IETFilterConfig : IUnknown {
  mixin(uuid("c4c4c4d1-0049-4e2b-98fb-9537f6ce516d"));
  // static DWINGUID IID = { 0xc4c4c4d1, 0x0049, 0x4e2b, 0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d };
  // method InitLicense
  /*[id(0x0000000A)]*/ int InitLicense(int LicenseId);
  // method GetSecureChannelObject
  /*[id(0x0000000B)]*/ int GetSecureChannelObject(out IUnknown ppUnkDRMSecureChannel);
}

// IDTFilter Interface
interface IDTFilter : IUnknown {
  mixin(uuid("c4c4c4b2-0049-4e2b-98fb-9537f6ce516d"));
  // static DWINGUID IID = { 0xc4c4c4b2, 0x0049, 0x4e2b, 0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d };
  // property EvalRatObjOK
  /*[id(0x00000001)]*/ int get_EvalRatObjOK(out int pHrCoCreateRetVal);
  // method GetCurrRating
  /*[id(0x00000002)]*/ int GetCurrRating(out EnTvRat_System pEnSystem, out EnTvRat_GenericLevel pEnRating, out int plbfEnAttr);
  // property BlockedRatingAttributes
  /*[id(0x00000003)]*/ int get_BlockedRatingAttributes(EnTvRat_System enSystem, EnTvRat_GenericLevel enLevel, out int plbfEnAttr);
  // property BlockedRatingAttributes
  /*[id(0x00000003)]*/ int set_BlockedRatingAttributes(EnTvRat_System enSystem, EnTvRat_GenericLevel enLevel, int plbfEnAttr);
  // property BlockUnRated
  /*[id(0x00000004)]*/ int get_BlockUnRated(out int pfBlockUnRatedShows);
  // property BlockUnRated
  /*[id(0x00000004)]*/ int set_BlockUnRated(int pfBlockUnRatedShows);
  // property BlockUnRatedDelay
  /*[id(0x00000005)]*/ int get_BlockUnRatedDelay(out int pmsecsDelayBeforeBlock);
  // property BlockUnRatedDelay
  /*[id(0x00000005)]*/ int set_BlockUnRatedDelay(int pmsecsDelayBeforeBlock);
}

// IDTFilter2 Interface
interface IDTFilter2 : IDTFilter {
  mixin(uuid("c4c4c4b4-0049-4e2b-98fb-9537f6ce516d"));
  // static DWINGUID IID = { 0xc4c4c4b4, 0x0049, 0x4e2b, 0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d };
  // property ChallengeUrl
  /*[id(0x00000006)]*/ int get_ChallengeUrl(out wchar* pbstrChallengeUrl);
}

// IDTFilterEvents
interface IDTFilterEvents : IDispatch {
  mixin(uuid("c4c4c4c2-0049-4e2b-98fb-9537f6ce516d"));
  // static DWINGUID IID = { 0xc4c4c4c2, 0x0049, 0x4e2b, 0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d };
}

// IDTFilterConfig Interface
interface IDTFilterConfig : IUnknown {
  mixin(uuid("c4c4c4d2-0049-4e2b-98fb-9537f6ce516d"));
  // static DWINGUID IID = { 0xc4c4c4d2, 0x0049, 0x4e2b, 0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d };
  // method GetSecureChannelObject
  /*[id(0x0000000B)]*/ int GetSecureChannelObject(out IUnknown ppUnkDRMSecureChannel);
}

// IXDSCodec Interface
interface IXDSCodec : IUnknown {
  mixin(uuid("c4c4c4b3-0049-4e2b-98fb-9537f6ce516d"));
  // static DWINGUID IID = { 0xc4c4c4b3, 0x0049, 0x4e2b, 0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d };
  // property XDSToRatObjOK
  /*[id(0x00000001)]*/ int get_XDSToRatObjOK(out int pHrCoCreateRetVal);
  // property CCSubstreamService
  /*[id(0x00000002)]*/ int set_CCSubstreamService(int pSubstreamMask);
  // property CCSubstreamService
  /*[id(0x00000002)]*/ int get_CCSubstreamService(out int pSubstreamMask);
  // method GetContentAdvisoryRating
  /*[id(0x00000003)]*/ int GetContentAdvisoryRating(out int pRat, out int pPktSeqID, out int pCallSeqID, out long pTimeStart, out long pTimeEnd);
  // method GetXDSPacket
  /*[id(0x00000004)]*/ int GetXDSPacket(out int pXDSClassPkt, out int pXDSTypePkt, out wchar* pBstrXDSPkt, out int pPktSeqID, out int pCallSeqID, out long pTimeStart, out long pTimeEnd);
}

// IXDSCodecEvents
interface IXDSCodecEvents : IDispatch {
  mixin(uuid("c4c4c4c3-0049-4e2b-98fb-9537f6ce516d"));
  // static DWINGUID IID = { 0xc4c4c4c3, 0x0049, 0x4e2b, 0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d };
}

// IXDSCodecConfig Interface
interface IXDSCodecConfig : IUnknown {
  mixin(uuid("c4c4c4d3-0049-4e2b-98fb-9537f6ce516d"));
  // static DWINGUID IID = { 0xc4c4c4d3, 0x0049, 0x4e2b, 0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d };
  // method GetSecureChannelObject
  /*[id(0x0000000B)]*/ int GetSecureChannelObject(out IUnknown ppUnkDRMSecureChannel);
}

// CoClasses

// ETFilter Class
abstract class ETFilter {
  mixin(uuid("c4c4c4f1-0049-4e2b-98fb-9537f6ce516d"));
  // static DWINGUID CLSID = { 0xc4c4c4f1, 0x0049, 0x4e2b, 0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d };
  mixin Interfaces!(IETFilter, IETFilterConfig);
}

// CDTFilter Class
abstract class DTFilter {
  mixin(uuid("c4c4c4f2-0049-4e2b-98fb-9537f6ce516d"));
  // static DWINGUID CLSID = { 0xc4c4c4f2, 0x0049, 0x4e2b, 0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d };
  mixin Interfaces!(IDTFilter, IDTFilterConfig);
}

// CXDSCodec Class
abstract class XDSCodec {
  mixin(uuid("c4c4c4f3-0049-4e2b-98fb-9537f6ce516d"));
  // static DWINGUID CLSID = { 0xc4c4c4f3, 0x0049, 0x4e2b, 0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d };
  mixin Interfaces!(IXDSCodec, IXDSCodecConfig);
}
