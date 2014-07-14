// Indeo?video custom control type library
// Version 1.0

/*[uuid("665a4446-d905-11d0-a30e-444553540000")]*/
//module dwin.sys.win32.com.tlb.more.indeotype;
module dwin.sys.win32.com.tlb.more.ir50_32;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum __MIDL_IIndeoDecodeOA_0003 {
  INDEO_FALSE = 0x00000000,
  INDEO_TRUE = 0x00000001,
}

enum __MIDL_IIndeoDecodeOA_0002 {
  SCALABILITY_DONT_DROP_QUALITY = 0x00000000,
  SCALABILITY_ON = 0x00000001,
  SCALABILITY_DONT_DROP_FRAMES = 0x00000002,
  SCALABILITY_OFF = 0x00000003,
}

enum __MIDL_IIndeoDecodeOA_0001 {
  DITHER_OFF = 0x00000000,
  DITHER_LOW = 0x00000001,
  DITHER_MEDIUM = 0x00000002,
  DITHER_HIGH = 0x00000003,
}

// Aliases

alias __MIDL_IIndeoDecodeOA_0003 INDEO_BOOL;

alias __MIDL_IIndeoDecodeOA_0002 SCALABILITY_SELECTIONS;

alias __MIDL_IIndeoDecodeOA_0001 DITHER_SELECTIONS;

// Interfaces

// Indeo?video Decode OA interface
interface IIndeoDecodeOA : IDispatch {
  mixin(uuid("665a4447-d905-11d0-a30e-444553540000"));
  // static DWINGUID IID = { 0x665a4447, 0xd905, 0x11d0, 0xa3, 0x0e, 0x44, 0x45, 0x53, 0x54, 0x00, 0x00 };
  // Sends Sequence data to the codec
  /*[id(0x60020000)]*/ int SetSequenceData();
  // Resets Sequence data in the codec
  /*[id(0x60020001)]*/ int ResetSequenceData();
  // Sends Frame data to the codec
  /*[id(0x60020002)]*/ int SetFrameData();
  // Resets Frame data in the codec
  /*[id(0x60020003)]*/ int ResetFrameData();
  // Sets Filter Graph member variable
  /*[id(0x60020004)]*/ int AssociateWith(IUnknown mifg);
  // Sets/Gets Access Key value
  /*[id(0x60020005)]*/ int get_Key(out int lKey);
  // Sets/Gets Access Key value
  /*[id(0x60020005)]*/ int set_Key(int lKey);
  // Sets/Gets Enable Access Key state
  /*[id(0x60020007)]*/ int get_EnabledKey(out INDEO_BOOL fEnabledKey);
  // Sets/Gets Enable Access Key state
  /*[id(0x60020007)]*/ int set_EnabledKey(INDEO_BOOL fEnabledKey);
  // Sets/Gets Scalability state
  /*[id(0x60020009)]*/ int get_Scalability(out SCALABILITY_SELECTIONS eScalability);
  // Sets/Gets Scalability state
  /*[id(0x60020009)]*/ int set_Scalability(SCALABILITY_SELECTIONS eScalability);
  // Sets/Gets Fill Transparency state
  /*[id(0x6002000B)]*/ int get_FillTransparentPixels(out INDEO_BOOL fFillTransparentPixels);
  // Sets/Gets Fill Transparency state
  /*[id(0x6002000B)]*/ int set_FillTransparentPixels(INDEO_BOOL fFillTransparentPixels);
  // Sets/Gets Alt Line state
  /*[id(0x6002000D)]*/ int get_AltLine(out INDEO_BOOL fAltLine);
  // Sets/Gets Alt Line state
  /*[id(0x6002000D)]*/ int set_AltLine(INDEO_BOOL fAltLine);
  // Sets/Gets Decode Time value
  /*[id(0x6002000F)]*/ int get_TimeLimit(out int lTimeLimit);
  // Sets/Gets Decode Time value
  /*[id(0x6002000F)]*/ int set_TimeLimit(int lTimeLimit);
  // Sets/Gets Decode Rect X value
  /*[id(0x60020011)]*/ int get_DecodeRectX(out int lX);
  // Sets/Gets Decode Rect X value
  /*[id(0x60020011)]*/ int set_DecodeRectX(int lX);
  // Sets/Gets Decode Rect Y value
  /*[id(0x60020013)]*/ int get_DecodeRectY(out int lY);
  // Sets/Gets Decode Rect Y value
  /*[id(0x60020013)]*/ int set_DecodeRectY(int lY);
  // Sets/Gets Decode Rect Width value
  /*[id(0x60020015)]*/ int get_DecodeRectWidth(out int lWidth);
  // Sets/Gets Decode Rect Width value
  /*[id(0x60020015)]*/ int set_DecodeRectWidth(int lWidth);
  // Sets/Gets Decode Rect Height value
  /*[id(0x60020017)]*/ int get_DecodeRectHeight(out int lHeight);
  // Sets/Gets Decode Rect Height value
  /*[id(0x60020017)]*/ int set_DecodeRectHeight(int lHeight);
  // Sets/Gets View Rect X value
  /*[id(0x60020019)]*/ int get_ViewRectX(out int lX);
  // Sets/Gets View Rect X value
  /*[id(0x60020019)]*/ int set_ViewRectX(int lX);
  // Sets/Gets View Rect Y value
  /*[id(0x6002001B)]*/ int get_ViewRectY(out int lY);
  // Sets/Gets View Rect Y value
  /*[id(0x6002001B)]*/ int set_ViewRectY(int lY);
  // Sets/Gets View Rect Width value
  /*[id(0x6002001D)]*/ int get_ViewRectWidth(out int lWidth);
  // Sets/Gets View Rect Width value
  /*[id(0x6002001D)]*/ int set_ViewRectWidth(int lWidth);
  // Sets/Gets View Rect Height value
  /*[id(0x6002001F)]*/ int get_ViewRectHeight(out int lHeight);
  // Sets/Gets View Rect Height value
  /*[id(0x6002001F)]*/ int set_ViewRectHeight(int lHeight);
  // Sets/Gets Brightness value
  /*[id(0x60020021)]*/ int get_Brightness(out int lBrightness);
  // Sets/Gets Brightness value
  /*[id(0x60020021)]*/ int set_Brightness(int lBrightness);
  // Sets/Gets Saturation value
  /*[id(0x60020023)]*/ int get_Saturation(out int lSaturation);
  // Sets/Gets Saturation value
  /*[id(0x60020023)]*/ int set_Saturation(int lSaturation);
  // Sets/Gets Contrast value
  /*[id(0x60020025)]*/ int get_Contrast(out int lContrast);
  // Sets/Gets Contrast value
  /*[id(0x60020025)]*/ int set_Contrast(int lContrast);
  // Sets/Gets Transparency Fill Color value
  /*[id(0x60020027)]*/ int get_TransparencyFillColor(out int dwFillColor);
  // Sets/Gets Transparency Fill Color value
  /*[id(0x60020027)]*/ int set_TransparencyFillColor(int dwFillColor);
  // Sets/Gets First Palette Index value
  /*[id(0x60020029)]*/ int get_FirstPalIndex(out int dwFirstPalIndex);
  // Sets/Gets First Palette Index value
  /*[id(0x60020029)]*/ int set_FirstPalIndex(int dwFirstPalIndex);
  // Sets/Gets Last Palette Index value
  /*[id(0x6002002B)]*/ int get_LastPalIndex(out int dwLastPalIndex);
  // Sets/Gets Last Palette Index value
  /*[id(0x6002002B)]*/ int set_LastPalIndex(int dwLastPalIndex);
  // Sets/Gets Palette pointer
  /*[id(0x6002002D)]*/ int get_Palette(out int prgbPalette);
  // Sets/Gets Palette pointer
  /*[id(0x6002002D)]*/ int set_Palette(int prgbPalette);
  // Sets/Gets Configurable Palette Dither value
  /*[id(0x6002002F)]*/ int get_Dither(out DITHER_SELECTIONS eDither);
  // Sets/Gets Configurable Palette Dither value
  /*[id(0x6002002F)]*/ int set_Dither(DITHER_SELECTIONS eDither);
  // Sets/Gets View Rect Origin state
  /*[id(0x60020031)]*/ int get_ViewRectOrigin(out INDEO_BOOL fViewRectOrigin);
  // Sets/Gets View Rect Origin state
  /*[id(0x60020031)]*/ int set_ViewRectOrigin(INDEO_BOOL fViewRectOrigin);
  // Sets/Gets Foreground Transparency Mask pointer
  /*[id(0x60020033)]*/ int get_InputTransparencyBitmask(out int pbmInputTransparencyBitmask);
  // Sets/Gets Foreground Transparency Mask pointer
  /*[id(0x60020033)]*/ int set_InputTransparencyBitmask(int pbmInputTransparencyBitmask);
}

// Indeo?video Encode OA interface
interface IIndeoEncodeOA : IDispatch {
  mixin(uuid("665a4449-d905-11d0-a30e-444553540000"));
  // static DWINGUID IID = { 0x665a4449, 0xd905, 0x11d0, 0xa3, 0x0e, 0x44, 0x45, 0x53, 0x54, 0x00, 0x00 };
  // Sends Compression data to the codec
  /*[id(0x60020000)]*/ int SetCompressionData();
  // Resets Compression data in the codec
  /*[id(0x60020001)]*/ int ResetCompressionData();
  // Sends Sequence data to the codec
  /*[id(0x60020002)]*/ int SetSequenceData();
  // Resets Sequence data in the codec
  /*[id(0x60020003)]*/ int ResetSequenceData();
  // Sets Filter Graph member variable
  /*[id(0x60020004)]*/ int AssociateWith(IUnknown mifg);
  // Sets/Gets Key Frame Interval value
  /*[id(0x60020005)]*/ int get_KeyFrameInterval(out int lKeyFrameInterval);
  // Sets/Gets Key Frame Interval value
  /*[id(0x60020005)]*/ int set_KeyFrameInterval(int lKeyFrameInterval);
  // Sets/Gets Data Rate value
  /*[id(0x60020007)]*/ int get_DataRate(out int lDataRate);
  // Sets/Gets Data Rate value
  /*[id(0x60020007)]*/ int set_DataRate(int lDataRate);
  // Sets/Gets Quality value
  /*[id(0x60020009)]*/ int get_Quality(out int lQuality);
  // Sets/Gets Quality value
  /*[id(0x60020009)]*/ int set_Quality(int lQuality);
  // Sets/Gets Access Key value
  /*[id(0x6002000B)]*/ int get_Key(out int lKey);
  // Sets/Gets Access Key value
  /*[id(0x6002000B)]*/ int set_Key(int lKey);
  // Sets/Gets Minimum Viewport Width value
  /*[id(0x6002000D)]*/ int get_MinViewportWidth(out int lWidth);
  // Sets/Gets Minimum Viewport Width value
  /*[id(0x6002000D)]*/ int set_MinViewportWidth(int lWidth);
  // Sets/Gets Minimum Viewport Height value
  /*[id(0x6002000F)]*/ int get_MinViewportHeight(out int lHeight);
  // Sets/Gets Minimum Viewport Height value
  /*[id(0x6002000F)]*/ int set_MinViewportHeight(int lHeight);
  // Sets/Gets Transparency Low Blue value
  /*[id(0x60020011)]*/ int get_TransparencyRangeBlueLow(out int lBlueLow);
  // Sets/Gets Transparency Low Blue value
  /*[id(0x60020011)]*/ int set_TransparencyRangeBlueLow(int lBlueLow);
  // Sets/Gets Transparency High Blue value
  /*[id(0x60020013)]*/ int get_TransparencyRangeBlueHigh(out int lBlueHigh);
  // Sets/Gets Transparency High Blue value
  /*[id(0x60020013)]*/ int set_TransparencyRangeBlueHigh(int lBlueHigh);
  // Sets/Gets Transparency Low Green value
  /*[id(0x60020015)]*/ int get_TransparencyRangeGreenLow(out int lGreenLow);
  // Sets/Gets Transparency Low Green value
  /*[id(0x60020015)]*/ int set_TransparencyRangeGreenLow(int lGreenLow);
  // Sets/Gets Transparency High Green value
  /*[id(0x60020017)]*/ int get_TransparencyRangeGreenHigh(out int lGreenHigh);
  // Sets/Gets Transparency High Green value
  /*[id(0x60020017)]*/ int set_TransparencyRangeGreenHigh(int lGreenHigh);
  // Sets/Gets Transparency Low Red value
  /*[id(0x60020019)]*/ int get_TransparencyRangeRedLow(out int lRedLow);
  // Sets/Gets Transparency Low Red value
  /*[id(0x60020019)]*/ int set_TransparencyRangeRedLow(int lRedLow);
  // Sets/Gets Transparency High Red value
  /*[id(0x6002001B)]*/ int get_TransparencyRangeRedHigh(out int lRedHigh);
  // Sets/Gets Transparency High Red value
  /*[id(0x6002001B)]*/ int set_TransparencyRangeRedHigh(int lRedHigh);
  // Sets/Gets Transparency Method value
  /*[id(0x6002001D)]*/ int get_TransparencyMethod(out int lTransparencyMethod);
  // Sets/Gets Transparency Method value
  /*[id(0x6002001D)]*/ int set_TransparencyMethod(int lTransparencyMethod);
  // Sets/Gets Access Key Enabled state
  /*[id(0x6002001F)]*/ int get_EnabledKey(out INDEO_BOOL fEnabledKey);
  // Sets/Gets Access Key Enabled state
  /*[id(0x6002001F)]*/ int set_EnabledKey(INDEO_BOOL fEnabledKey);
  // Sets/Gets Scalability state
  /*[id(0x60020021)]*/ int get_Scalability(out INDEO_BOOL fScalability);
  // Sets/Gets Scalability state
  /*[id(0x60020021)]*/ int set_Scalability(INDEO_BOOL fScalability);
  // Sets/Gets Quick Compressor state
  /*[id(0x60020023)]*/ int get_QuickCompress(out INDEO_BOOL QuickCompress);
  // Sets/Gets Quick Compressor state
  /*[id(0x60020023)]*/ int set_QuickCompress(INDEO_BOOL QuickCompress);
}

// CoClasses

// Indeo?video Decompression filter type info
abstract class IndeoDecode {
  mixin(uuid("665a4448-d905-11d0-a30e-444553540000"));
  // static DWINGUID CLSID = { 0x665a4448, 0xd905, 0x11d0, 0xa3, 0x0e, 0x44, 0x45, 0x53, 0x54, 0x00, 0x00 };
  mixin Interfaces!(IIndeoDecodeOA);
}

// Indeo?video Compression filter type info
abstract class IndeoEncode {
  mixin(uuid("665a444a-d905-11d0-a30e-444553540000"));
  // static DWINGUID CLSID = { 0x665a444a, 0xd905, 0x11d0, 0xa3, 0x0e, 0x44, 0x45, 0x53, 0x54, 0x00, 0x00 };
  mixin Interfaces!(IIndeoEncodeOA);
}
