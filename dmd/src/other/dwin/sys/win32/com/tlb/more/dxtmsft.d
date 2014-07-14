// Microsoft DirectX Transforms Image Transforms Type Library
// Version 1.1

/*[uuid("5e77eb03-937c-11d1-b047-00aa003b6061")]*/
module dwin.sys.win32.com.tlb.more.dxtmsft;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum DXCOMPFUNC {
  DXCOMPFUNC_SWAP_AB = 0x00000010,
  DXCOMPFUNC_FUNCMASK = 0x0000000F,
  DXCOMPFUNC_CLEAR = 0x00000000,
  DXCOMPFUNC_MIN = 0x00000001,
  DXCOMPFUNC_MAX = 0x00000002,
  DXCOMPFUNC_A = 0x00000003,
  DXCOMPFUNC_A_OVER_B = 0x00000004,
  DXCOMPFUNC_A_IN_B = 0x00000005,
  DXCOMPFUNC_A_OUT_B = 0x00000006,
  DXCOMPFUNC_A_ATOP_B = 0x00000007,
  DXCOMPFUNC_A_SUBTRACT_B = 0x00000008,
  DXCOMPFUNC_A_ADD_B = 0x00000009,
  DXCOMPFUNC_A_XOR_B = 0x0000000A,
  DXCOMPFUNC_B = 0x00000013,
  DXCOMPFUNC_B_OVER_A = 0x00000014,
  DXCOMPFUNC_B_IN_A = 0x00000015,
  DXCOMPFUNC_B_OUT_A = 0x00000016,
  DXCOMPFUNC_B_ATOP_A = 0x00000017,
  DXCOMPFUNC_B_SUBTRACT_A = 0x00000018,
  DXCOMPFUNC_B_ADD_A = 0x00000019,
  DXCOMPFUNC_NUMFUNCS = 0x0000001A,
}

enum DXLUTCOLOR {
  DXLUTCOLOR_RED = 0x00000000,
  DXLUTCOLOR_GREEN = 0x00000001,
  DXLUTCOLOR_BLUE = 0x00000002,
}

enum OPIDDXLUTBUILDER {
  OPID_DXLUTBUILDER_Gamma = 0x00000000,
  OPID_DXLUTBUILDER_Opacity = 0x00000001,
  OPID_DXLUTBUILDER_Brightness = 0x00000002,
  OPID_DXLUTBUILDER_Contrast = 0x00000003,
  OPID_DXLUTBUILDER_ColorBalance = 0x00000004,
  OPID_DXLUTBUILDER_Posterize = 0x00000005,
  OPID_DXLUTBUILDER_Invert = 0x00000006,
  OPID_DXLUTBUILDER_Threshold = 0x00000007,
  OPID_DXLUTBUILDER_NUM_OPS = 0x00000008,
}

enum DXGRADIENTTYPE {
  DXGRADIENT_VERTICAL = 0x00000000,
  DXGRADIENT_HORIZONTAL = 0x00000001,
  DXGRADIENT_NUM_GRADIENTS = 0x00000002,
}

enum DXWIPEDIRECTION {
  DXWD_HORIZONTAL = 0x00000000,
  DXWD_VERTICAL = 0x00000001,
}

enum DXCONVFILTERTYPE {
  DXCFILTER_SRCCOPY = 0x00000000,
  DXCFILTER_BOX7X7 = 0x00000001,
  DXCFILTER_BLUR3X3 = 0x00000002,
  DXCFILTER_SHARPEN = 0x00000003,
  DXCFILTER_EMBOSS = 0x00000004,
  DXCFILTER_ENGRAVE = 0x00000005,
  DXCFILTER_NUM_FILTERS = 0x00000006,
  DXCFILTER_CUSTOM = 0x00000007,
}

// Unions

union __MIDL_IWinTypes_0009 {
  int hInproc;
  int hRemote;
}

// Structs

struct DXBASESAMPLE {
  ubyte Blue;
  ubyte Green;
  ubyte Red;
  ubyte Alpha;
}

struct DXSAMPLE {
  ubyte Blue;
  ubyte Green;
  ubyte Red;
  ubyte Alpha;
}

struct tagSIZE {
  int cx;
  int cy;
}

struct _RemotableHandle {
  int fContext;
  __MIDL_IWinTypes_0009 u;
}

struct tagRECT {
  int left;
  int top;
  int right;
  int bottom;
}

// Aliases

alias _RemotableHandle* wireHDC;

// Interfaces

// IDXTComposite Interface
interface IDXTComposite : IDispatch {
  mixin(uuid("9a43a843-0831-11d1-817f-0000f87557db"));
  // static DWINGUID IID = { 0x9a43a843, 0x0831, 0x11d1, 0x81, 0x7f, 0x00, 0x00, 0xf8, 0x75, 0x57, 0xdb };
  /*[id(0x00000001)]*/ int set_Function(DXCOMPFUNC peFunc);
  /*[id(0x00000001)]*/ int get_Function(out DXCOMPFUNC peFunc);
}

// IDXDLUTBuilder Interface
interface IDXDLUTBuilder : IDispatch {
  mixin(uuid("73068231-35ee-11d1-81a1-0000f87557db"));
  // static DWINGUID IID = { 0x73068231, 0x35ee, 0x11d1, 0x81, 0xa1, 0x00, 0x00, 0xf8, 0x75, 0x57, 0xdb };
  /*[id(0x00000001)]*/ int get_NumBuildSteps(out int pNumSteps);
  /*[id(0x00000002)]*/ int get_BuildOrder(out DWINVARIANT pOpOrder);
  /*[id(0x00000002)]*/ int set_BuildOrder(DWINVARIANT* pOpOrder);
  /*[id(0x00000003)]*/ int get_Gamma(out float pVal);
  /*[id(0x00000003)]*/ int set_Gamma(float pVal);
  /*[id(0x00000004)]*/ int get_Opacity(out float pVal);
  /*[id(0x00000004)]*/ int set_Opacity(float pVal);
  /*[id(0x00000005)]*/ int get_Brightness(out DWINVARIANT pWeights);
  /*[id(0x00000005)]*/ int set_Brightness(DWINVARIANT* pWeights);
  /*[id(0x00000006)]*/ int get_Contrast(out DWINVARIANT pWeights);
  /*[id(0x00000006)]*/ int set_Contrast(DWINVARIANT* pWeights);
  /*[id(0x00000007)]*/ int get_ColorBalance(DXLUTCOLOR Color, out DWINVARIANT pWeights);
  /*[id(0x00000007)]*/ int set_ColorBalance(DXLUTCOLOR Color, DWINVARIANT* pWeights);
  /*[id(0x00000008)]*/ int get_LevelsPerChannel(out int pVal);
  /*[id(0x00000008)]*/ int set_LevelsPerChannel(int pVal);
  /*[id(0x00000009)]*/ int get_Invert(out float pThreshold);
  /*[id(0x00000009)]*/ int set_Invert(float pThreshold);
  /*[id(0x0000000A)]*/ int get_Threshold(out float pVal);
  /*[id(0x0000000A)]*/ int set_Threshold(float pVal);
}

// IDXLUTBuilder Interface
interface IDXLUTBuilder : IUnknown {
  mixin(uuid("f4370fc1-cadb-11d0-b52c-00a0c9054373"));
  // static DWINGUID IID = { 0xf4370fc1, 0xcadb, 0x11d0, 0xb5, 0x2c, 0x00, 0xa0, 0xc9, 0x05, 0x43, 0x73 };
  /*[id(0x60010000)]*/ int GetNumBuildSteps(out uint pulNumSteps);
  /*[id(0x60010001)]*/ int GetBuildOrder(out OPIDDXLUTBUILDER OpOrder, uint ulSize);
  /*[id(0x60010002)]*/ int SetBuildOrder(OPIDDXLUTBUILDER* OpOrder, uint ulNumSteps);
  /*[id(0x60010003)]*/ int SetGamma(float newVal);
  /*[id(0x60010004)]*/ int GetGamma(out float pVal);
  /*[id(0x60010005)]*/ int GetOpacity(out float pVal);
  /*[id(0x60010006)]*/ int SetOpacity(float newVal);
  /*[id(0x60010007)]*/ int GetBrightness(ref uint pulCount, out float Weights);
  /*[id(0x60010008)]*/ int SetBrightness(uint ulCount, float* Weights);
  /*[id(0x60010009)]*/ int GetContrast(ref uint pulCount, out float Weights);
  /*[id(0x6001000A)]*/ int SetContrast(uint ulCount, float* Weights);
  /*[id(0x6001000B)]*/ int GetColorBalance(DXLUTCOLOR Color, ref uint pulCount, out float Weights);
  /*[id(0x6001000C)]*/ int SetColorBalance(DXLUTCOLOR Color, uint ulCount, float* Weights);
  /*[id(0x6001000D)]*/ int GetLevelsPerChannel(out uint pVal);
  /*[id(0x6001000E)]*/ int SetLevelsPerChannel(uint newVal);
  /*[id(0x6001000F)]*/ int GetInvert(out float pThreshold);
  /*[id(0x60010010)]*/ int SetInvert(float Threshold);
  /*[id(0x60010011)]*/ int GetThreshold(out float pVal);
  /*[id(0x60010012)]*/ int SetThreshold(float newVal);
}

// IDXLookupTable Interface
interface IDXLookupTable : IDXBaseObject {
  mixin(uuid("01bafc7f-9e63-11d1-9053-00c04fd9189d"));
  // static DWINGUID IID = { 0x01bafc7f, 0x9e63, 0x11d1, 0x90, 0x53, 0x00, 0xc0, 0x4f, 0xd9, 0x18, 0x9d };
  /*[id(0x60020000)]*/ int GetTables(/*ref*/ ubyte[256] RedLUT, /*ref*/ ubyte[256] GreenLUT, /*ref*/ ubyte[256] BlueLUT, /*ref*/ ubyte[256] AlphaLUT);
  /*[id(0x60020001)]*/ int IsChannelIdentity(out DXBASESAMPLE pSampleBools);
  /*[id(0x60020002)]*/ int GetIndexValues(uint Index, out DXBASESAMPLE pSample);
  /*[id(0x60020003)]*/ int ApplyTables(ref DXSAMPLE pSamples, uint cSamples);
}

// IDXBaseObject Interface
interface IDXBaseObject : IUnknown {
  mixin(uuid("17b59b2b-9cc8-11d1-9053-00c04fd9189d"));
  // static DWINGUID IID = { 0x17b59b2b, 0x9cc8, 0x11d1, 0x90, 0x53, 0x00, 0xc0, 0x4f, 0xd9, 0x18, 0x9d };
  /*[id(0x60010000)]*/ int GetGenerationId(out uint pID);
  /*[id(0x60010001)]*/ int IncrementGenerationId(int bRefresh);
  /*[id(0x60010002)]*/ int GetObjectSize(out uint pcbSize);
}

// IDXTGradientD Interface
interface IDXTGradientD : IDispatch {
  mixin(uuid("623e2881-fc0e-11d1-9a77-0000f8756a10"));
  // static DWINGUID IID = { 0x623e2881, 0xfc0e, 0x11d1, 0x9a, 0x77, 0x00, 0x00, 0xf8, 0x75, 0x6a, 0x10 };
  /*[id(0x00000001)]*/ int set_GradientType(DXGRADIENTTYPE peType);
  /*[id(0x00000001)]*/ int get_GradientType(out DXGRADIENTTYPE peType);
  /*[id(0x00000002)]*/ int set_StartColor(OLE_COLOR pVal);
  /*[id(0x00000002)]*/ int get_StartColor(out OLE_COLOR pVal);
  /*[id(0x00000003)]*/ int set_EndColor(OLE_COLOR pVal);
  /*[id(0x00000003)]*/ int get_EndColor(out OLE_COLOR pVal);
  /*[id(0x00000004)]*/ int set_GradientWidth(int pVal);
  /*[id(0x00000004)]*/ int get_GradientWidth(out int pVal);
  /*[id(0x00000005)]*/ int set_GradientHeight(int pVal);
  /*[id(0x00000005)]*/ int get_GradientHeight(out int pVal);
  /*[id(0x00000006)]*/ int set_KeepAspectRatio(short pVal);
  /*[id(0x00000006)]*/ int get_KeepAspectRatio(out short pVal);
  /*[id(0x00000007)]*/ int set_StartColorStr(wchar* pVal);
  /*[id(0x00000007)]*/ int get_StartColorStr(out wchar* pVal);
  /*[id(0x00000008)]*/ int set_EndColorStr(wchar* pVal);
  /*[id(0x00000008)]*/ int get_EndColorStr(out wchar* pVal);
}

// IDXTWipe2 Interface
interface IDXTWipe2 : IDXTWipe {
  mixin(uuid("e1ff8091-442b-4801-88b6-2b47b1611fd2"));
  // static DWINGUID IID = { 0xe1ff8091, 0x442b, 0x4801, 0x88, 0xb6, 0x2b, 0x47, 0xb1, 0x61, 0x1f, 0xd2 };
  /*[id(0x00002716)]*/ int get_Motion(out wchar* pbstrMotion);
  /*[id(0x00002716)]*/ int set_Motion(wchar* pbstrMotion);
}

// IDXTWipe Interface
interface IDXTWipe : IDXEffect {
  mixin(uuid("af279b2f-86eb-11d1-81bf-0000f87557db"));
  // static DWINGUID IID = { 0xaf279b2f, 0x86eb, 0x11d1, 0x81, 0xbf, 0x00, 0x00, 0xf8, 0x75, 0x57, 0xdb };
  /*[id(0x00002714)]*/ int get_GradientSize(out float pPercentSize);
  /*[id(0x00002714)]*/ int set_GradientSize(float pPercentSize);
  /*[id(0x00002715)]*/ int get_WipeStyle(out DXWIPEDIRECTION pVal);
  /*[id(0x00002715)]*/ int set_WipeStyle(DXWIPEDIRECTION pVal);
}

// IDXEffect Interface
interface IDXEffect : IDispatch {
  mixin(uuid("e31fb81b-1335-11d1-8189-0000f87557db"));
  // static DWINGUID IID = { 0xe31fb81b, 0x1335, 0x11d1, 0x81, 0x89, 0x00, 0x00, 0xf8, 0x75, 0x57, 0xdb };
  /*[id(0x00002710)]*/ int get_Capabilities(out int pVal);
  /*[id(0x00002711)]*/ int get_Progress(out float pVal);
  /*[id(0x00002711)]*/ int set_Progress(float pVal);
  /*[id(0x00002712)]*/ int get_StepResolution(out float pVal);
  /*[id(0x00002713)]*/ int get_Duration(out float pVal);
  /*[id(0x00002713)]*/ int set_Duration(float pVal);
}

// IDXTConvolution Interface
interface IDXTConvolution : IUnknown {
  mixin(uuid("7ba7f8af-e5ea-11d1-81dd-0000f87557db"));
  // static DWINGUID IID = { 0x7ba7f8af, 0xe5ea, 0x11d1, 0x81, 0xdd, 0x00, 0x00, 0xf8, 0x75, 0x57, 0xdb };
  /*[id(0x60010000)]*/ int SetFilterType(DXCONVFILTERTYPE eType);
  /*[id(0x60010001)]*/ int GetFilterType(out DXCONVFILTERTYPE peType);
  /*[id(0x60010002)]*/ int SetCustomFilter(float* pFilter, tagSIZE Size);
  /*[id(0x60010003)]*/ int SetConvertToGray(int bConvertToGray);
  /*[id(0x60010004)]*/ int GetConvertToGray(out int pbConvertToGray);
  /*[id(0x60010005)]*/ int SetBias(float Bias);
  /*[id(0x60010006)]*/ int GetBias(out float pBias);
  /*[id(0x60010007)]*/ int SetExcludeAlpha(int bExcludeAlpha);
  /*[id(0x60010008)]*/ int GetExcludeAlpha(out int pbExcludeAlpha);
}

// ICrBlur Interface
interface ICrBlur : IDispatch {
  mixin(uuid("9f7c7827-e87a-11d1-81e0-0000f87557db"));
  // static DWINGUID IID = { 0x9f7c7827, 0xe87a, 0x11d1, 0x81, 0xe0, 0x00, 0x00, 0xf8, 0x75, 0x57, 0xdb };
  /*[id(0x00000001)]*/ int get_MakeShadow(out short pVal);
  /*[id(0x00000001)]*/ int set_MakeShadow(short pVal);
  /*[id(0x00000002)]*/ int get_ShadowOpacity(out float pVal);
  /*[id(0x00000002)]*/ int set_ShadowOpacity(float pVal);
  /*[id(0x00000003)]*/ int get_PixelRadius(out float pPixelRadius);
  /*[id(0x00000003)]*/ int set_PixelRadius(float pPixelRadius);
}

// ICrEmboss Interface
interface ICrEmboss : IDispatch {
  mixin(uuid("e4acfb80-053e-11d2-81ea-0000f87557db"));
  // static DWINGUID IID = { 0xe4acfb80, 0x053e, 0x11d2, 0x81, 0xea, 0x00, 0x00, 0xf8, 0x75, 0x57, 0xdb };
  /*[id(0x00000001)]*/ int get_Bias(out float pVal);
  /*[id(0x00000001)]*/ int set_Bias(float pVal);
}

// ICrEngrave Interface
interface ICrEngrave : IDispatch {
  mixin(uuid("e4acfb7f-053e-11d2-81ea-0000f87557db"));
  // static DWINGUID IID = { 0xe4acfb7f, 0x053e, 0x11d2, 0x81, 0xea, 0x00, 0x00, 0xf8, 0x75, 0x57, 0xdb };
  /*[id(0x00000001)]*/ int get_Bias(out float pVal);
  /*[id(0x00000001)]*/ int set_Bias(float pVal);
}

// IDXTFade Interface
interface IDXTFade : IDXEffect {
  mixin(uuid("16b280c4-ee70-11d1-9066-00c04fd9189d"));
  // static DWINGUID IID = { 0x16b280c4, 0xee70, 0x11d1, 0x90, 0x66, 0x00, 0xc0, 0x4f, 0xd9, 0x18, 0x9d };
  /*[id(0x00000001)]*/ int get_Overlap(out float pVal);
  /*[id(0x00000001)]*/ int set_Overlap(float pVal);
  /*[id(0x00000002)]*/ int get_Center(out int pVal);
  /*[id(0x00000002)]*/ int set_Center(int pVal);
}

// IDXBasicImage Interface
interface IDXBasicImage : IDispatch {
  mixin(uuid("16b280c7-ee70-11d1-9066-00c04fd9189d"));
  // static DWINGUID IID = { 0x16b280c7, 0xee70, 0x11d1, 0x90, 0x66, 0x00, 0xc0, 0x4f, 0xd9, 0x18, 0x9d };
  /*[id(0x00000001)]*/ int get_Rotation(out int pVal);
  /*[id(0x00000001)]*/ int set_Rotation(int pVal);
  /*[id(0x00000002)]*/ int get_Mirror(out int pVal);
  /*[id(0x00000002)]*/ int set_Mirror(int pVal);
  /*[id(0x00000003)]*/ int get_GrayScale(out int pVal);
  /*[id(0x00000003)]*/ int set_GrayScale(int pVal);
  /*[id(0x00000004)]*/ int get_Opacity(out float pVal);
  /*[id(0x00000004)]*/ int set_Opacity(float pVal);
  /*[id(0x00000005)]*/ int get_Invert(out int pVal);
  /*[id(0x00000005)]*/ int set_Invert(int pVal);
  /*[id(0x00000006)]*/ int get_XRay(out int pVal);
  /*[id(0x00000006)]*/ int set_XRay(int pVal);
  /*[id(0x00000007)]*/ int get_Mask(out int pVal);
  /*[id(0x00000007)]*/ int set_Mask(int pVal);
  /*[id(0x00000008)]*/ int get_MaskColor(out int pVal);
  /*[id(0x00000008)]*/ int set_MaskColor(int pVal);
}

// IDXPixelate Interface
interface IDXPixelate : IDXEffect {
  mixin(uuid("d33e180f-fbe9-11d1-906a-00c04fd9189d"));
  // static DWINGUID IID = { 0xd33e180f, 0xfbe9, 0x11d1, 0x90, 0x6a, 0x00, 0xc0, 0x4f, 0xd9, 0x18, 0x9d };
  /*[id(0x00000001)]*/ int get_MaxSquare(out int pVal);
  /*[id(0x00000001)]*/ int set_MaxSquare(int pVal);
}

// ICrIris2 Interface
interface ICrIris2 : ICrIris {
  mixin(uuid("f7b06961-ba8c-4970-918b-1c60cb9ff180"));
  // static DWINGUID IID = { 0xf7b06961, 0xba8c, 0x4970, 0x91, 0x8b, 0x1c, 0x60, 0xcb, 0x9f, 0xf1, 0x80 };
  /*[id(0x00000002)]*/ int get_Motion(out wchar* pbstrMotion);
  /*[id(0x00000002)]*/ int set_Motion(wchar* pbstrMotion);
}

// ICrIris Interface
interface ICrIris : IDXEffect {
  mixin(uuid("3f69f350-0379-11d2-a484-00c04f8efb69"));
  // static DWINGUID IID = { 0x3f69f350, 0x0379, 0x11d2, 0xa4, 0x84, 0x00, 0xc0, 0x4f, 0x8e, 0xfb, 0x69 };
  /*[id(0x00000001)]*/ int get_irisStyle(out wchar* pVal);
  /*[id(0x00000001)]*/ int set_irisStyle(wchar* pVal);
}

// ICrSlide Interface
interface ICrSlide : IDXEffect {
  mixin(uuid("810e402e-056b-11d2-a484-00c04f8efb69"));
  // static DWINGUID IID = { 0x810e402e, 0x056b, 0x11d2, 0xa4, 0x84, 0x00, 0xc0, 0x4f, 0x8e, 0xfb, 0x69 };
  /*[id(0x00000001)]*/ int get_bands(out short pVal);
  /*[id(0x00000001)]*/ int set_bands(short pVal);
  /*[id(0x00000002)]*/ int get_slideStyle(out wchar* pVal);
  /*[id(0x00000002)]*/ int set_slideStyle(wchar* pVal);
}

// ICrRadialWipe Interface
interface ICrRadialWipe : IDXEffect {
  mixin(uuid("424b71ae-0695-11d2-a484-00c04f8efb69"));
  // static DWINGUID IID = { 0x424b71ae, 0x0695, 0x11d2, 0xa4, 0x84, 0x00, 0xc0, 0x4f, 0x8e, 0xfb, 0x69 };
  /*[id(0x00000001)]*/ int get_WipeStyle(out wchar* pVal);
  /*[id(0x00000001)]*/ int set_WipeStyle(wchar* pVal);
}

// ICrBarn2 Interface
interface ICrBarn2 : ICrBarn {
  mixin(uuid("b66a7a1b-8fc6-448c-a2eb-3c55957478a1"));
  // static DWINGUID IID = { 0xb66a7a1b, 0x8fc6, 0x448c, 0xa2, 0xeb, 0x3c, 0x55, 0x95, 0x74, 0x78, 0xa1 };
  /*[id(0x00000001)]*/ int get_Motion(out wchar* pbstrMotion);
  /*[id(0x00000001)]*/ int set_Motion(wchar* pbstrMotion);
  /*[id(0x00000002)]*/ int get_Orientation(out wchar* pbstrOrientation);
  /*[id(0x00000002)]*/ int set_Orientation(wchar* pbstrOrientation);
}

// ICrBarn Interface
interface ICrBarn : IDXEffect {
  mixin(uuid("276a2ee0-0b5d-11d2-a484-00c04f8efb69"));
  // static DWINGUID IID = { 0x276a2ee0, 0x0b5d, 0x11d2, 0xa4, 0x84, 0x00, 0xc0, 0x4f, 0x8e, 0xfb, 0x69 };
}

// ICrBlinds2 Interface
interface ICrBlinds2 : ICrBlinds {
  mixin(uuid("7059d403-599a-4264-8140-641eb8ae1f64"));
  // static DWINGUID IID = { 0x7059d403, 0x599a, 0x4264, 0x81, 0x40, 0x64, 0x1e, 0xb8, 0xae, 0x1f, 0x64 };
  /*[id(0x00000002)]*/ int get_Direction(out wchar* pbstrDirection);
  /*[id(0x00000002)]*/ int set_Direction(wchar* pbstrDirection);
}

// ICrBlinds Interface
interface ICrBlinds : IDXEffect {
  mixin(uuid("5af5c340-0ba9-11d2-a484-00c04f8efb69"));
  // static DWINGUID IID = { 0x5af5c340, 0x0ba9, 0x11d2, 0xa4, 0x84, 0x00, 0xc0, 0x4f, 0x8e, 0xfb, 0x69 };
  /*[id(0x00000001)]*/ int get_bands(out short pVal);
  /*[id(0x00000001)]*/ int set_bands(short pVal);
}

// ICrStretch Interface
interface ICrStretch : IDXEffect {
  mixin(uuid("6684af00-0a87-11d2-a484-00c04f8efb69"));
  // static DWINGUID IID = { 0x6684af00, 0x0a87, 0x11d2, 0xa4, 0x84, 0x00, 0xc0, 0x4f, 0x8e, 0xfb, 0x69 };
  /*[id(0x00000001)]*/ int get_stretchStyle(out wchar* pVal);
  /*[id(0x00000001)]*/ int set_stretchStyle(wchar* pVal);
}

// ICrInset Interface
interface ICrInset : IDXEffect {
  mixin(uuid("05c5ee20-0ba6-11d2-a484-00c04f8efb69"));
  // static DWINGUID IID = { 0x05c5ee20, 0x0ba6, 0x11d2, 0xa4, 0x84, 0x00, 0xc0, 0x4f, 0x8e, 0xfb, 0x69 };
}

// ICrSpiral Interface
interface ICrSpiral : IDXTGridSize {
  mixin(uuid("0de527a0-0c7e-11d2-a484-00c04f8efb69"));
  // static DWINGUID IID = { 0x0de527a0, 0x0c7e, 0x11d2, 0xa4, 0x84, 0x00, 0xc0, 0x4f, 0x8e, 0xfb, 0x69 };
}

// IDXTGridSize Interface
interface IDXTGridSize : IDXEffect {
  mixin(uuid("d6bbe91e-ff60-11d2-8f6e-00a0c9697274"));
  // static DWINGUID IID = { 0xd6bbe91e, 0xff60, 0x11d2, 0x8f, 0x6e, 0x00, 0xa0, 0xc9, 0x69, 0x72, 0x74 };
  /*[id(0x00000001)]*/ int get_gridSizeX(out short pX);
  /*[id(0x00000001)]*/ int set_gridSizeX(short pX);
  /*[id(0x00000002)]*/ int get_gridSizeY(out short pY);
  /*[id(0x00000002)]*/ int set_gridSizeY(short pY);
}

// ICrZigzag Interface
interface ICrZigzag : IDXTGridSize {
  mixin(uuid("4e5a64a0-0c8b-11d2-a484-00c04f8efb69"));
  // static DWINGUID IID = { 0x4e5a64a0, 0x0c8b, 0x11d2, 0xa4, 0x84, 0x00, 0xc0, 0x4f, 0x8e, 0xfb, 0x69 };
}

// ICrWheel Interface
interface ICrWheel : IDXEffect {
  mixin(uuid("3943de80-1464-11d2-a484-00c04f8efb69"));
  // static DWINGUID IID = { 0x3943de80, 0x1464, 0x11d2, 0xa4, 0x84, 0x00, 0xc0, 0x4f, 0x8e, 0xfb, 0x69 };
  /*[id(0x00000001)]*/ int get_spokes(out short pX);
  /*[id(0x00000001)]*/ int set_spokes(short pX);
}

// IDXTChroma Interface
interface IDXTChroma : IDispatch {
  mixin(uuid("1d4637e2-383c-11d2-952a-00c04fa34f05"));
  // static DWINGUID IID = { 0x1d4637e2, 0x383c, 0x11d2, 0x95, 0x2a, 0x00, 0xc0, 0x4f, 0xa3, 0x4f, 0x05 };
  /*[id(0x00000001)]*/ int set_Color(DWINVARIANT pVal);
  /*[id(0x00000001)]*/ int get_Color(out DWINVARIANT pVal);
}

// IDXTDropShadow Interface
interface IDXTDropShadow : IDispatch {
  mixin(uuid("1d4637e3-383c-11d2-952a-00c04fa34f05"));
  // static DWINGUID IID = { 0x1d4637e3, 0x383c, 0x11d2, 0x95, 0x2a, 0x00, 0xc0, 0x4f, 0xa3, 0x4f, 0x05 };
  /*[id(0x00000001)]*/ int get_Color(out DWINVARIANT pVal);
  /*[id(0x00000001)]*/ int set_Color(DWINVARIANT pVal);
  /*[id(0x00000002)]*/ int get_OffX(out int pVal);
  /*[id(0x00000002)]*/ int set_OffX(int pVal);
  /*[id(0x00000003)]*/ int get_OffY(out int pVal);
  /*[id(0x00000003)]*/ int set_OffY(int pVal);
  /*[id(0x00000004)]*/ int get_Positive(out short pVal);
  /*[id(0x00000004)]*/ int set_Positive(short pVal);
}

// IDXTCheckerBoard Interface
interface IDXTCheckerBoard : IDXEffect {
  mixin(uuid("ad3c2576-117c-4510-84dd-b668971dcfd1"));
  // static DWINGUID IID = { 0xad3c2576, 0x117c, 0x4510, 0x84, 0xdd, 0xb6, 0x68, 0x97, 0x1d, 0xcf, 0xd1 };
  /*[id(0x00000001)]*/ int get_Direction(out wchar* pbstrDirection);
  /*[id(0x00000001)]*/ int set_Direction(wchar* pbstrDirection);
  /*[id(0x00000002)]*/ int get_SquaresX(out int pnSquaresX);
  /*[id(0x00000002)]*/ int set_SquaresX(int pnSquaresX);
  /*[id(0x00000003)]*/ int get_SquaresY(out int pnSquaresY);
  /*[id(0x00000003)]*/ int set_SquaresY(int pnSquaresY);
}

// IDXTRevealTrans Interface
interface IDXTRevealTrans : IDXEffect {
  mixin(uuid("b8095006-a128-464b-8b2d-90580aee2b05"));
  // static DWINGUID IID = { 0xb8095006, 0xa128, 0x464b, 0x8b, 0x2d, 0x90, 0x58, 0x0a, 0xee, 0x2b, 0x05 };
  /*[id(0x00000001)]*/ int get_Transition(out int pnTransition);
  /*[id(0x00000001)]*/ int set_Transition(int pnTransition);
}

// IDXTMask Interface
interface IDXTMask : IDispatch {
  mixin(uuid("a1067146-b063-47d7-a54a-2c2309e9889d"));
  // static DWINGUID IID = { 0xa1067146, 0xb063, 0x47d7, 0xa5, 0x4a, 0x2c, 0x23, 0x09, 0xe9, 0x88, 0x9d };
  /*[id(0x00000001)]*/ int get_Color(out DWINVARIANT pvarColor);
  /*[id(0x00000001)]*/ int set_Color(DWINVARIANT pvarColor);
}

// IDXTRedirect Interface
interface IDXTRedirect : IDispatch {
  mixin(uuid("02f5140b-626f-4019-9c9e-2daa1e93e8fc"));
  // static DWINGUID IID = { 0x02f5140b, 0x626f, 0x4019, 0x9c, 0x9e, 0x2d, 0xaa, 0x1e, 0x93, 0xe8, 0xfc };
  /*[id(0x00000001)]*/ int ElementImage(out DWINVARIANT pvarImage);
  /*[id(0x00000002)]*/ int SetDAViewHandler(IDispatch pDispViewHandler);
  /*[id(0x00000003)]*/ int HasImageBeenAllocated(out int pfAllocated);
  /*[id(0x00000004)]*/ int DoRedirection(IUnknown pInputSurface, wireHDC hdcOutput, tagRECT* pDrawRect);
}

// IDXTAlphaImageLoader Interface
interface IDXTAlphaImageLoader : IDispatch {
  mixin(uuid("a5f2d3e8-7a7e-48e5-bc75-40790be4a941"));
  // static DWINGUID IID = { 0xa5f2d3e8, 0x7a7e, 0x48e5, 0xbc, 0x75, 0x40, 0x79, 0x0b, 0xe4, 0xa9, 0x41 };
  /*[id(0x00000001)]*/ int get_Src(out wchar* pbstrSrc);
  /*[id(0x00000001)]*/ int set_Src(wchar* pbstrSrc);
  /*[id(0x00000002)]*/ int get_SizingMethod(out wchar* pbstrSizingMethod);
  /*[id(0x00000002)]*/ int set_SizingMethod(wchar* pbstrSizingMethod);
}

// IDXTRandomBars Interface
interface IDXTRandomBars : IDXEffect {
  mixin(uuid("8a6d2022-4a8f-4eb9-bb25-aa05201f9c84"));
  // static DWINGUID IID = { 0x8a6d2022, 0x4a8f, 0x4eb9, 0xbb, 0x25, 0xaa, 0x05, 0x20, 0x1f, 0x9c, 0x84 };
  /*[id(0x00000001)]*/ int get_Orientation(out wchar* pbstrOrientation);
  /*[id(0x00000001)]*/ int set_Orientation(wchar* pbstrOrientation);
}

// IDXTStrips Interface
interface IDXTStrips : IDXEffect {
  mixin(uuid("a83c9b5c-fb11-4af5-8f65-d03f151d3ed5"));
  // static DWINGUID IID = { 0xa83c9b5c, 0xfb11, 0x4af5, 0x8f, 0x65, 0xd0, 0x3f, 0x15, 0x1d, 0x3e, 0xd5 };
  /*[id(0x00000001)]*/ int get_Motion(out wchar* pbstrMotion);
  /*[id(0x00000001)]*/ int set_Motion(wchar* pbstrMotion);
}

// IDXTMetaRoll Interface
interface IDXTMetaRoll : IDXEffect {
  mixin(uuid("9c61f46d-0530-11d2-8f98-00c04fb92eb7"));
  // static DWINGUID IID = { 0x9c61f46d, 0x0530, 0x11d2, 0x8f, 0x98, 0x00, 0xc0, 0x4f, 0xb9, 0x2e, 0xb7 };
  /*[id(0x00000001)]*/ int get_Copyright(out wchar* pVal);
  /*[id(0x00000001)]*/ int set_Copyright(wchar* pVal);
}

// IDXTMetaRipple Interface
interface IDXTMetaRipple : IDXEffect {
  mixin(uuid("aa0d4d02-06a3-11d2-8f98-00c04fb92eb7"));
  // static DWINGUID IID = { 0xaa0d4d02, 0x06a3, 0x11d2, 0x8f, 0x98, 0x00, 0xc0, 0x4f, 0xb9, 0x2e, 0xb7 };
  /*[id(0x00000001)]*/ int get_Copyright(out wchar* pVal);
  /*[id(0x00000001)]*/ int set_Copyright(wchar* pVal);
}

// IDXTMetaPageTurn Interface
interface IDXTMetaPageTurn : IDXEffect {
  mixin(uuid("aa0d4d07-06a3-11d2-8f98-00c04fb92eb7"));
  // static DWINGUID IID = { 0xaa0d4d07, 0x06a3, 0x11d2, 0x8f, 0x98, 0x00, 0xc0, 0x4f, 0xb9, 0x2e, 0xb7 };
  /*[id(0x00000001)]*/ int get_Copyright(out wchar* pVal);
  /*[id(0x00000001)]*/ int set_Copyright(wchar* pVal);
}

// IDXTMetaLiquid Interface
interface IDXTMetaLiquid : IDXEffect {
  mixin(uuid("aa0d4d09-06a3-11d2-8f98-00c04fb92eb7"));
  // static DWINGUID IID = { 0xaa0d4d09, 0x06a3, 0x11d2, 0x8f, 0x98, 0x00, 0xc0, 0x4f, 0xb9, 0x2e, 0xb7 };
  /*[id(0x00000001)]*/ int get_Copyright(out wchar* pVal);
  /*[id(0x00000001)]*/ int set_Copyright(wchar* pVal);
}

// IDXTMetaCenterPeel Interface
interface IDXTMetaCenterPeel : IDXEffect {
  mixin(uuid("aa0d4d0b-06a3-11d2-8f98-00c04fb92eb7"));
  // static DWINGUID IID = { 0xaa0d4d0b, 0x06a3, 0x11d2, 0x8f, 0x98, 0x00, 0xc0, 0x4f, 0xb9, 0x2e, 0xb7 };
  /*[id(0x00000001)]*/ int get_Copyright(out wchar* pVal);
  /*[id(0x00000001)]*/ int set_Copyright(wchar* pVal);
}

// IDXTMetaPeelSmall Interface
interface IDXTMetaPeelSmall : IDXEffect {
  mixin(uuid("aa0d4d0d-06a3-11d2-8f98-00c04fb92eb7"));
  // static DWINGUID IID = { 0xaa0d4d0d, 0x06a3, 0x11d2, 0x8f, 0x98, 0x00, 0xc0, 0x4f, 0xb9, 0x2e, 0xb7 };
  /*[id(0x00000001)]*/ int get_Copyright(out wchar* pVal);
  /*[id(0x00000001)]*/ int set_Copyright(wchar* pVal);
}

// IDXTMetaPeelPiece Interface
interface IDXTMetaPeelPiece : IDXEffect {
  mixin(uuid("aa0d4d0f-06a3-11d2-8f98-00c04fb92eb7"));
  // static DWINGUID IID = { 0xaa0d4d0f, 0x06a3, 0x11d2, 0x8f, 0x98, 0x00, 0xc0, 0x4f, 0xb9, 0x2e, 0xb7 };
  /*[id(0x00000001)]*/ int get_Copyright(out wchar* pVal);
  /*[id(0x00000001)]*/ int set_Copyright(wchar* pVal);
}

// IDXTMetaPeelSplit Interface
interface IDXTMetaPeelSplit : IDXEffect {
  mixin(uuid("aa0d4d11-06a3-11d2-8f98-00c04fb92eb7"));
  // static DWINGUID IID = { 0xaa0d4d11, 0x06a3, 0x11d2, 0x8f, 0x98, 0x00, 0xc0, 0x4f, 0xb9, 0x2e, 0xb7 };
  /*[id(0x00000001)]*/ int get_Copyright(out wchar* pVal);
  /*[id(0x00000001)]*/ int set_Copyright(wchar* pVal);
}

// IDXTMetaWater Interface
interface IDXTMetaWater : IDXEffect {
  mixin(uuid("107045c4-06e0-11d2-8d6d-00c04f8ef8e0"));
  // static DWINGUID IID = { 0x107045c4, 0x06e0, 0x11d2, 0x8d, 0x6d, 0x00, 0xc0, 0x4f, 0x8e, 0xf8, 0xe0 };
  /*[id(0x00000001)]*/ int get_Copyright(out wchar* pVal);
  /*[id(0x00000001)]*/ int set_Copyright(wchar* pVal);
}

// IDXTMetaLightWipe Interface
interface IDXTMetaLightWipe : IDXEffect {
  mixin(uuid("107045c7-06e0-11d2-8d6d-00c04f8ef8e0"));
  // static DWINGUID IID = { 0x107045c7, 0x06e0, 0x11d2, 0x8d, 0x6d, 0x00, 0xc0, 0x4f, 0x8e, 0xf8, 0xe0 };
  /*[id(0x00000001)]*/ int get_Copyright(out wchar* pVal);
  /*[id(0x00000001)]*/ int set_Copyright(wchar* pVal);
}

// IDXTMetaRadialScaleWipe Interface
interface IDXTMetaRadialScaleWipe : IDXEffect {
  mixin(uuid("107045c9-06e0-11d2-8d6d-00c04f8ef8e0"));
  // static DWINGUID IID = { 0x107045c9, 0x06e0, 0x11d2, 0x8d, 0x6d, 0x00, 0xc0, 0x4f, 0x8e, 0xf8, 0xe0 };
  /*[id(0x00000001)]*/ int get_Copyright(out wchar* pVal);
  /*[id(0x00000001)]*/ int set_Copyright(wchar* pVal);
}

// IDXTMetaWhiteOut Interface
interface IDXTMetaWhiteOut : IDXEffect {
  mixin(uuid("107045cb-06e0-11d2-8d6d-00c04f8ef8e0"));
  // static DWINGUID IID = { 0x107045cb, 0x06e0, 0x11d2, 0x8d, 0x6d, 0x00, 0xc0, 0x4f, 0x8e, 0xf8, 0xe0 };
  /*[id(0x00000001)]*/ int get_Copyright(out wchar* pVal);
  /*[id(0x00000001)]*/ int set_Copyright(wchar* pVal);
}

// IDXTMetaTwister Interface
interface IDXTMetaTwister : IDXEffect {
  mixin(uuid("107045ce-06e0-11d2-8d6d-00c04f8ef8e0"));
  // static DWINGUID IID = { 0x107045ce, 0x06e0, 0x11d2, 0x8d, 0x6d, 0x00, 0xc0, 0x4f, 0x8e, 0xf8, 0xe0 };
  /*[id(0x00000001)]*/ int get_Copyright(out wchar* pVal);
  /*[id(0x00000001)]*/ int set_Copyright(wchar* pVal);
}

// IDXTMetaBurnFilm Interface
interface IDXTMetaBurnFilm : IDXEffect {
  mixin(uuid("107045d0-06e0-11d2-8d6d-00c04f8ef8e0"));
  // static DWINGUID IID = { 0x107045d0, 0x06e0, 0x11d2, 0x8d, 0x6d, 0x00, 0xc0, 0x4f, 0x8e, 0xf8, 0xe0 };
  /*[id(0x00000001)]*/ int get_Copyright(out wchar* pVal);
  /*[id(0x00000001)]*/ int set_Copyright(wchar* pVal);
}

// IDXTMetaJaws Interface
interface IDXTMetaJaws : IDXEffect {
  mixin(uuid("2a54c903-07aa-11d2-8d6d-00c04f8ef8e0"));
  // static DWINGUID IID = { 0x2a54c903, 0x07aa, 0x11d2, 0x8d, 0x6d, 0x00, 0xc0, 0x4f, 0x8e, 0xf8, 0xe0 };
  /*[id(0x00000001)]*/ int get_Copyright(out wchar* pVal);
  /*[id(0x00000001)]*/ int set_Copyright(wchar* pVal);
}

// IDXTMetaColorFade Interface
interface IDXTMetaColorFade : IDXEffect {
  mixin(uuid("2a54c907-07aa-11d2-8d6d-00c04f8ef8e0"));
  // static DWINGUID IID = { 0x2a54c907, 0x07aa, 0x11d2, 0x8d, 0x6d, 0x00, 0xc0, 0x4f, 0x8e, 0xf8, 0xe0 };
  /*[id(0x00000001)]*/ int get_Copyright(out wchar* pVal);
  /*[id(0x00000001)]*/ int set_Copyright(wchar* pVal);
}

// IDXTMetaFlowMotion Interface
interface IDXTMetaFlowMotion : IDXEffect {
  mixin(uuid("2a54c90a-07aa-11d2-8d6d-00c04f8ef8e0"));
  // static DWINGUID IID = { 0x2a54c90a, 0x07aa, 0x11d2, 0x8d, 0x6d, 0x00, 0xc0, 0x4f, 0x8e, 0xf8, 0xe0 };
  /*[id(0x00000001)]*/ int get_Copyright(out wchar* pVal);
  /*[id(0x00000001)]*/ int set_Copyright(wchar* pVal);
}

// IDXTMetaVacuum Interface
interface IDXTMetaVacuum : IDXEffect {
  mixin(uuid("2a54c90c-07aa-11d2-8d6d-00c04f8ef8e0"));
  // static DWINGUID IID = { 0x2a54c90c, 0x07aa, 0x11d2, 0x8d, 0x6d, 0x00, 0xc0, 0x4f, 0x8e, 0xf8, 0xe0 };
  /*[id(0x00000001)]*/ int get_Copyright(out wchar* pVal);
  /*[id(0x00000001)]*/ int set_Copyright(wchar* pVal);
}

// IDXTMetaGriddler Interface
interface IDXTMetaGriddler : IDXEffect {
  mixin(uuid("2a54c910-07aa-11d2-8d6d-00c04f8ef8e0"));
  // static DWINGUID IID = { 0x2a54c910, 0x07aa, 0x11d2, 0x8d, 0x6d, 0x00, 0xc0, 0x4f, 0x8e, 0xf8, 0xe0 };
  /*[id(0x00000001)]*/ int get_Copyright(out wchar* pVal);
  /*[id(0x00000001)]*/ int set_Copyright(wchar* pVal);
}

// IDXTMetaGriddler2 Interface
interface IDXTMetaGriddler2 : IDXEffect {
  mixin(uuid("2a54c912-07aa-11d2-8d6d-00c04f8ef8e0"));
  // static DWINGUID IID = { 0x2a54c912, 0x07aa, 0x11d2, 0x8d, 0x6d, 0x00, 0xc0, 0x4f, 0x8e, 0xf8, 0xe0 };
  /*[id(0x00000001)]*/ int get_Copyright(out wchar* pVal);
  /*[id(0x00000001)]*/ int set_Copyright(wchar* pVal);
}

// IDXTMetaThreshold Interface
interface IDXTMetaThreshold : IDXEffect {
  mixin(uuid("2a54c914-07aa-11d2-8d6d-00c04f8ef8e0"));
  // static DWINGUID IID = { 0x2a54c914, 0x07aa, 0x11d2, 0x8d, 0x6d, 0x00, 0xc0, 0x4f, 0x8e, 0xf8, 0xe0 };
  /*[id(0x00000001)]*/ int get_Copyright(out wchar* pVal);
  /*[id(0x00000001)]*/ int set_Copyright(wchar* pVal);
}

// IDXTMetaWormHole Interface
interface IDXTMetaWormHole : IDXEffect {
  mixin(uuid("0e6ae021-0c83-11d2-8cd4-00104bc75d9a"));
  // static DWINGUID IID = { 0x0e6ae021, 0x0c83, 0x11d2, 0x8c, 0xd4, 0x00, 0x10, 0x4b, 0xc7, 0x5d, 0x9a };
  /*[id(0x00000001)]*/ int get_Copyright(out wchar* pVal);
  /*[id(0x00000001)]*/ int set_Copyright(wchar* pVal);
}

// IDXTGlow Interface
interface IDXTGlow : IDispatch {
  mixin(uuid("1d4637e4-383c-11d2-952a-00c04fa34f05"));
  // static DWINGUID IID = { 0x1d4637e4, 0x383c, 0x11d2, 0x95, 0x2a, 0x00, 0xc0, 0x4f, 0xa3, 0x4f, 0x05 };
  /*[id(0x00000001)]*/ int get_Color(out DWINVARIANT pvarColor);
  /*[id(0x00000001)]*/ int set_Color(DWINVARIANT pvarColor);
  /*[id(0x00000002)]*/ int get_Strength(out int pVal);
  /*[id(0x00000002)]*/ int set_Strength(int pVal);
}

// IDXTShadow Interface
interface IDXTShadow : IDispatch {
  mixin(uuid("1d4637e6-383c-11d2-952a-00c04fa34f05"));
  // static DWINGUID IID = { 0x1d4637e6, 0x383c, 0x11d2, 0x95, 0x2a, 0x00, 0xc0, 0x4f, 0xa3, 0x4f, 0x05 };
  /*[id(0x00000001)]*/ int set_Color(wchar* pbstrColor);
  /*[id(0x00000001)]*/ int get_Color(out wchar* pbstrColor);
  /*[id(0x00000002)]*/ int get_Direction(out int pVal);
  /*[id(0x00000002)]*/ int set_Direction(int pVal);
  /*[id(0x00000003)]*/ int get_Strength(out int pVal);
  /*[id(0x00000003)]*/ int set_Strength(int pVal);
}

// IDXTAlpha Interface
interface IDXTAlpha : IDispatch {
  mixin(uuid("1d4637e0-383c-11d2-952a-00c04fa34f05"));
  // static DWINGUID IID = { 0x1d4637e0, 0x383c, 0x11d2, 0x95, 0x2a, 0x00, 0xc0, 0x4f, 0xa3, 0x4f, 0x05 };
  /*[id(0x00000001)]*/ int get_Opacity(out int pVal);
  /*[id(0x00000001)]*/ int set_Opacity(int pVal);
  /*[id(0x00000002)]*/ int get_FinishOpacity(out int pVal);
  /*[id(0x00000002)]*/ int set_FinishOpacity(int pVal);
  /*[id(0x00000003)]*/ int get_Style(out int pVal);
  /*[id(0x00000003)]*/ int set_Style(int pVal);
  /*[id(0x00000004)]*/ int get_StartX(out int pVal);
  /*[id(0x00000004)]*/ int set_StartX(int pVal);
  /*[id(0x00000005)]*/ int get_StartY(out int pVal);
  /*[id(0x00000005)]*/ int set_StartY(int pVal);
  /*[id(0x00000006)]*/ int get_FinishX(out int pVal);
  /*[id(0x00000006)]*/ int set_FinishX(int pVal);
  /*[id(0x00000007)]*/ int get_FinishY(out int pVal);
  /*[id(0x00000007)]*/ int set_FinishY(int pVal);
}

// IDXTWave Interface
interface IDXTWave : IDispatch {
  mixin(uuid("1d4637e7-383c-11d2-952a-00c04fa34f05"));
  // static DWINGUID IID = { 0x1d4637e7, 0x383c, 0x11d2, 0x95, 0x2a, 0x00, 0xc0, 0x4f, 0xa3, 0x4f, 0x05 };
  /*[id(0x00000001)]*/ int get_Add(out short pVal);
  /*[id(0x00000001)]*/ int set_Add(short pVal);
  /*[id(0x00000002)]*/ int get_Freq(out int pVal);
  /*[id(0x00000002)]*/ int set_Freq(int pVal);
  /*[id(0x00000003)]*/ int get_LightStrength(out int pVal);
  /*[id(0x00000003)]*/ int set_LightStrength(int pVal);
  /*[id(0x00000004)]*/ int get_Phase(out int pVal);
  /*[id(0x00000004)]*/ int set_Phase(int pVal);
  /*[id(0x00000005)]*/ int get_Strength(out int pVal);
  /*[id(0x00000005)]*/ int set_Strength(int pVal);
}

// IDXTLight Interface
interface IDXTLight : IDispatch {
  mixin(uuid("f9efbec1-4302-11d2-952a-00c04fa34f05"));
  // static DWINGUID IID = { 0xf9efbec1, 0x4302, 0x11d2, 0x95, 0x2a, 0x00, 0xc0, 0x4f, 0xa3, 0x4f, 0x05 };
  /*[id(0x00000001)]*/ int addAmbient(int r, int g, int b, int Strength);
  /*[id(0x00000002)]*/ int addPoint(int x, int y, int z, int r, int g, int b, int Strength);
  /*[id(0x00000003)]*/ int addCone(int x, int y, int z, int tx, int ty, int r, int g, int b, int Strength, int spread);
  /*[id(0x00000004)]*/ int moveLight(int lightNum, int x, int y, int z, int fAbsolute);
  /*[id(0x00000005)]*/ int ChangeStrength(int lightNum, int dStrength, int fAbsolute);
  /*[id(0x00000006)]*/ int ChangeColor(int lightNum, int r, int g, int b, int fAbsolute);
  /*[id(0x00000007)]*/ int Clear();
}

// IDXTMotionBlur Interface
interface IDXTMotionBlur : IDispatch {
  mixin(uuid("089057be-d3f5-4a2c-b10a-a5130184a0f7"));
  // static DWINGUID IID = { 0x089057be, 0xd3f5, 0x4a2c, 0xb1, 0x0a, 0xa5, 0x13, 0x01, 0x84, 0xa0, 0xf7 };
  /*[id(0x00000001)]*/ int get_Add(out short pfAdd);
  /*[id(0x00000001)]*/ int set_Add(short pfAdd);
  /*[id(0x00000002)]*/ int get_Direction(out short pnDirection);
  /*[id(0x00000002)]*/ int set_Direction(short pnDirection);
  /*[id(0x00000003)]*/ int get_Strength(out int pnStrength);
  /*[id(0x00000003)]*/ int set_Strength(int pnStrength);
}

// IDXTMatrix Interface
interface IDXTMatrix : IDispatch {
  mixin(uuid("ac66a493-0f0c-4c76-825c-9d68bede9188"));
  // static DWINGUID IID = { 0xac66a493, 0x0f0c, 0x4c76, 0x82, 0x5c, 0x9d, 0x68, 0xbe, 0xde, 0x91, 0x88 };
  /*[id(0x00000001)]*/ int get_M11(out float pflM11);
  /*[id(0x00000001)]*/ int set_M11(float pflM11);
  /*[id(0x00000002)]*/ int get_M12(out float pflM12);
  /*[id(0x00000002)]*/ int set_M12(float pflM12);
  /*[id(0x00000003)]*/ int get_Dx(out float pfldx);
  /*[id(0x00000003)]*/ int set_Dx(float pfldx);
  /*[id(0x00000004)]*/ int get_M21(out float pflM21);
  /*[id(0x00000004)]*/ int set_M21(float pflM21);
  /*[id(0x00000005)]*/ int get_M22(out float pflM22);
  /*[id(0x00000005)]*/ int set_M22(float pflM22);
  /*[id(0x00000006)]*/ int get_Dy(out float pfldy);
  /*[id(0x00000006)]*/ int set_Dy(float pfldy);
  /*[id(0x00000007)]*/ int get_SizingMethod(out wchar* pbstrSizingMethod);
  /*[id(0x00000007)]*/ int set_SizingMethod(wchar* pbstrSizingMethod);
  /*[id(0x00000008)]*/ int get_FilterType(out wchar* pbstrFilterType);
  /*[id(0x00000008)]*/ int set_FilterType(wchar* pbstrFilterType);
}

// IDXTICMFilter Interface
interface IDXTICMFilter : IDispatch {
  mixin(uuid("734321ed-1e7b-4e1c-bbfa-89c819800e2f"));
  // static DWINGUID IID = { 0x734321ed, 0x1e7b, 0x4e1c, 0xbb, 0xfa, 0x89, 0xc8, 0x19, 0x80, 0x0e, 0x2f };
  /*[id(0x00000001)]*/ int get_ColorSpace(out wchar* pbstrColorSpace);
  /*[id(0x00000001)]*/ int set_ColorSpace(wchar* pbstrColorSpace);
  /*[id(0x00000002)]*/ int get_Intent(out short pnIntent);
  /*[id(0x00000002)]*/ int set_Intent(short pnIntent);
}

// CoClasses

// DXTComposite Class
abstract class DXTComposite {
  mixin(uuid("9a43a844-0831-11d1-817f-0000f87557db"));
  // static DWINGUID CLSID = { 0x9a43a844, 0x0831, 0x11d1, 0x81, 0x7f, 0x00, 0x00, 0xf8, 0x75, 0x57, 0xdb };
  mixin Interfaces!(IDXTComposite);
}

// DXLUTBuilder Class
abstract class DXLUTBuilder {
  mixin(uuid("1e54333b-2a00-11d1-8198-0000f87557db"));
  // static DWINGUID CLSID = { 0x1e54333b, 0x2a00, 0x11d1, 0x81, 0x98, 0x00, 0x00, 0xf8, 0x75, 0x57, 0xdb };
  mixin Interfaces!(IDXDLUTBuilder, IDXLUTBuilder, IDXLookupTable);
}

// DXTGradientD Class
abstract class DXTGradientD {
  mixin(uuid("623e2882-fc0e-11d1-9a77-0000f8756a10"));
  // static DWINGUID CLSID = { 0x623e2882, 0xfc0e, 0x11d1, 0x9a, 0x77, 0x00, 0x00, 0xf8, 0x75, 0x6a, 0x10 };
  mixin Interfaces!(IDXTGradientD);
}

// DXTWipe Class
abstract class DXTWipe {
  mixin(uuid("af279b30-86eb-11d1-81bf-0000f87557db"));
  // static DWINGUID CLSID = { 0xaf279b30, 0x86eb, 0x11d1, 0x81, 0xbf, 0x00, 0x00, 0xf8, 0x75, 0x57, 0xdb };
  mixin Interfaces!(IDXTWipe2);
}

// DXTGradientWipe Class
abstract class DXTGradientWipe {
  mixin(uuid("b96f67a2-30c2-47e8-bd85-70a2c948b50f"));
  // static DWINGUID CLSID = { 0xb96f67a2, 0x30c2, 0x47e8, 0xbd, 0x85, 0x70, 0xa2, 0xc9, 0x48, 0xb5, 0x0f };
  mixin Interfaces!(IDXTWipe2);
}

// DXTWipePP Class
abstract class DXTWipePP {
  mixin(uuid("7ffe4d08-fbfd-11d1-9a77-0000f8756a10"));
  // static DWINGUID CLSID = { 0x7ffe4d08, 0xfbfd, 0x11d1, 0x9a, 0x77, 0x00, 0x00, 0xf8, 0x75, 0x6a, 0x10 };
  mixin Interfaces!(IUnknown);
}

// DXTConvolution Class
abstract class DXTConvolution {
  mixin(uuid("2bc0ef29-e6ba-11d1-81dd-0000f87557db"));
  // static DWINGUID CLSID = { 0x2bc0ef29, 0xe6ba, 0x11d1, 0x81, 0xdd, 0x00, 0x00, 0xf8, 0x75, 0x57, 0xdb };
  mixin Interfaces!(IDXTConvolution);
}

// CrBlur Class
abstract class CrBlur {
  mixin(uuid("7312498d-e87a-11d1-81e0-0000f87557db"));
  // static DWINGUID CLSID = { 0x7312498d, 0xe87a, 0x11d1, 0x81, 0xe0, 0x00, 0x00, 0xf8, 0x75, 0x57, 0xdb };
  mixin Interfaces!(ICrBlur);
}

// CrEmboss Class
abstract class CrEmboss {
  mixin(uuid("f515306d-0156-11d2-81ea-0000f87557db"));
  // static DWINGUID CLSID = { 0xf515306d, 0x0156, 0x11d2, 0x81, 0xea, 0x00, 0x00, 0xf8, 0x75, 0x57, 0xdb };
  mixin Interfaces!(ICrEmboss);
}

// CrEngrave Class
abstract class CrEngrave {
  mixin(uuid("f515306e-0156-11d2-81ea-0000f87557db"));
  // static DWINGUID CLSID = { 0xf515306e, 0x0156, 0x11d2, 0x81, 0xea, 0x00, 0x00, 0xf8, 0x75, 0x57, 0xdb };
  mixin Interfaces!(ICrEngrave);
}

// DXFade Class
abstract class DXFade {
  mixin(uuid("16b280c5-ee70-11d1-9066-00c04fd9189d"));
  // static DWINGUID CLSID = { 0x16b280c5, 0xee70, 0x11d1, 0x90, 0x66, 0x00, 0xc0, 0x4f, 0xd9, 0x18, 0x9d };
  mixin Interfaces!(IDXTFade);
}

// FadePP Class
abstract class FadePP {
  mixin(uuid("16b280c6-ee70-11d1-9066-00c04fd9189d"));
  // static DWINGUID CLSID = { 0x16b280c6, 0xee70, 0x11d1, 0x90, 0x66, 0x00, 0xc0, 0x4f, 0xd9, 0x18, 0x9d };
  mixin Interfaces!(IUnknown);
}

// BasicImageEffects Class
abstract class BasicImageEffects {
  mixin(uuid("16b280c8-ee70-11d1-9066-00c04fd9189d"));
  // static DWINGUID CLSID = { 0x16b280c8, 0xee70, 0x11d1, 0x90, 0x66, 0x00, 0xc0, 0x4f, 0xd9, 0x18, 0x9d };
  mixin Interfaces!(IDXBasicImage);
}

// BasicImageEffectsPP Class
abstract class BasicImageEffectsPP {
  mixin(uuid("16b280c9-ee70-11d1-9066-00c04fd9189d"));
  // static DWINGUID CLSID = { 0x16b280c9, 0xee70, 0x11d1, 0x90, 0x66, 0x00, 0xc0, 0x4f, 0xd9, 0x18, 0x9d };
  mixin Interfaces!(IUnknown);
}

// Pixelate Effect Class
abstract class Pixelate {
  mixin(uuid("4ccea634-fbe0-11d1-906a-00c04fd9189d"));
  // static DWINGUID CLSID = { 0x4ccea634, 0xfbe0, 0x11d1, 0x90, 0x6a, 0x00, 0xc0, 0x4f, 0xd9, 0x18, 0x9d };
  mixin Interfaces!(IDXPixelate);
}

// Pixelate Property Page Class
abstract class PixelatePP {
  mixin(uuid("4ccea635-fbe0-11d1-906a-00c04fd9189d"));
  // static DWINGUID CLSID = { 0x4ccea635, 0xfbe0, 0x11d1, 0x90, 0x6a, 0x00, 0xc0, 0x4f, 0xd9, 0x18, 0x9d };
  mixin Interfaces!(IUnknown);
}

// CrBlurPP Class
abstract class CrBlurPP {
  mixin(uuid("623e287e-fc0e-11d1-9a77-0000f8756a10"));
  // static DWINGUID CLSID = { 0x623e287e, 0xfc0e, 0x11d1, 0x9a, 0x77, 0x00, 0x00, 0xf8, 0x75, 0x6a, 0x10 };
  mixin Interfaces!(IUnknown);
}

// GradientPP Class
abstract class GradientPP {
  mixin(uuid("623e2880-fc0e-11d1-9a77-0000f8756a10"));
  // static DWINGUID CLSID = { 0x623e2880, 0xfc0e, 0x11d1, 0x9a, 0x77, 0x00, 0x00, 0xf8, 0x75, 0x6a, 0x10 };
  mixin Interfaces!(IUnknown);
}

// CompositePP Class
abstract class CompositePP {
  mixin(uuid("25b33660-fd83-11d1-8ade-444553540001"));
  // static DWINGUID CLSID = { 0x25b33660, 0xfd83, 0x11d1, 0x8a, 0xde, 0x44, 0x45, 0x53, 0x54, 0x00, 0x01 };
  mixin Interfaces!(IUnknown);
}

// ConvolvePP Class
abstract class ConvolvePP {
  mixin(uuid("25b33661-fd83-11d1-8ade-444553540001"));
  // static DWINGUID CLSID = { 0x25b33661, 0xfd83, 0x11d1, 0x8a, 0xde, 0x44, 0x45, 0x53, 0x54, 0x00, 0x01 };
  mixin Interfaces!(IUnknown);
}

// LUTBuilderPP Class
abstract class LUTBuilderPP {
  mixin(uuid("25b33662-fd83-11d1-8ade-444553540001"));
  // static DWINGUID CLSID = { 0x25b33662, 0xfd83, 0x11d1, 0x8a, 0xde, 0x44, 0x45, 0x53, 0x54, 0x00, 0x01 };
  mixin Interfaces!(IUnknown);
}

// CrIris Class
abstract class CrIris {
  mixin(uuid("3f69f351-0379-11d2-a484-00c04f8efb69"));
  // static DWINGUID CLSID = { 0x3f69f351, 0x0379, 0x11d2, 0xa4, 0x84, 0x00, 0xc0, 0x4f, 0x8e, 0xfb, 0x69 };
  mixin Interfaces!(ICrIris2);
}

// DXTIris Class
abstract class DXTIris {
  mixin(uuid("049f2ce6-d996-4721-897a-db15ce9eb73d"));
  // static DWINGUID CLSID = { 0x049f2ce6, 0xd996, 0x4721, 0x89, 0x7a, 0xdb, 0x15, 0xce, 0x9e, 0xb7, 0x3d };
  mixin Interfaces!(ICrIris2);
}

// CrIrisPP Class
abstract class CrIrisPP {
  mixin(uuid("80de22c4-0f44-11d2-8b82-00a0c93c09b2"));
  // static DWINGUID CLSID = { 0x80de22c4, 0x0f44, 0x11d2, 0x8b, 0x82, 0x00, 0xa0, 0xc9, 0x3c, 0x09, 0xb2 };
  mixin Interfaces!(IUnknown);
}

// CrSlide Class
abstract class CrSlide {
  mixin(uuid("810e402f-056b-11d2-a484-00c04f8efb69"));
  // static DWINGUID CLSID = { 0x810e402f, 0x056b, 0x11d2, 0xa4, 0x84, 0x00, 0xc0, 0x4f, 0x8e, 0xfb, 0x69 };
  mixin Interfaces!(ICrSlide);
}

// DXTSlide Class
abstract class DXTSlide {
  mixin(uuid("d1c5a1e7-cc47-4e32-bdd2-4b3c5fc50af5"));
  // static DWINGUID CLSID = { 0xd1c5a1e7, 0xcc47, 0x4e32, 0xbd, 0xd2, 0x4b, 0x3c, 0x5f, 0xc5, 0x0a, 0xf5 };
  mixin Interfaces!(ICrSlide);
}

// CrSlidePP Class
abstract class CrSlidePP {
  mixin(uuid("cc8cede1-1003-11d2-8b82-00a0c93c09b2"));
  // static DWINGUID CLSID = { 0xcc8cede1, 0x1003, 0x11d2, 0x8b, 0x82, 0x00, 0xa0, 0xc9, 0x3c, 0x09, 0xb2 };
  mixin Interfaces!(IUnknown);
}

// CrRadialWipe
abstract class CrRadialWipe {
  mixin(uuid("424b71af-0695-11d2-a484-00c04f8efb69"));
  // static DWINGUID CLSID = { 0x424b71af, 0x0695, 0x11d2, 0xa4, 0x84, 0x00, 0xc0, 0x4f, 0x8e, 0xfb, 0x69 };
  mixin Interfaces!(ICrRadialWipe);
}

// DXTRadialWipe
abstract class DXTRadialWipe {
  mixin(uuid("164484a9-35d9-4fb7-9fab-48273b96aa1d"));
  // static DWINGUID CLSID = { 0x164484a9, 0x35d9, 0x4fb7, 0x9f, 0xab, 0x48, 0x27, 0x3b, 0x96, 0xaa, 0x1d };
  mixin Interfaces!(ICrRadialWipe);
}

// CrRadialWipe Property Page
abstract class CrRadialWipePP {
  mixin(uuid("33d932e0-0f48-11d2-8b82-00a0c93c09b2"));
  // static DWINGUID CLSID = { 0x33d932e0, 0x0f48, 0x11d2, 0x8b, 0x82, 0x00, 0xa0, 0xc9, 0x3c, 0x09, 0xb2 };
  mixin Interfaces!(IUnknown);
}

// CrBarn Class
abstract class CrBarn {
  mixin(uuid("c3bdf740-0b58-11d2-a484-00c04f8efb69"));
  // static DWINGUID CLSID = { 0xc3bdf740, 0x0b58, 0x11d2, 0xa4, 0x84, 0x00, 0xc0, 0x4f, 0x8e, 0xfb, 0x69 };
  mixin Interfaces!(ICrBarn2);
}

// DXTBarn Class
abstract class DXTBarn {
  mixin(uuid("ec9ba17d-60b5-462b-a6d8-14b89057e22a"));
  // static DWINGUID CLSID = { 0xec9ba17d, 0x60b5, 0x462b, 0xa6, 0xd8, 0x14, 0xb8, 0x90, 0x57, 0xe2, 0x2a };
  mixin Interfaces!(ICrBarn2);
}

// CrBarn Property Page
abstract class CrBarnPP {
  mixin(uuid("fcad7436-f151-4110-b97e-32bd607fbdb8"));
  // static DWINGUID CLSID = { 0xfcad7436, 0xf151, 0x4110, 0xb9, 0x7e, 0x32, 0xbd, 0x60, 0x7f, 0xbd, 0xb8 };
  mixin Interfaces!(IUnknown);
}

// CrBlinds Class
abstract class CrBlinds {
  mixin(uuid("00c429c0-0ba9-11d2-a484-00c04f8efb69"));
  // static DWINGUID CLSID = { 0x00c429c0, 0x0ba9, 0x11d2, 0xa4, 0x84, 0x00, 0xc0, 0x4f, 0x8e, 0xfb, 0x69 };
  mixin Interfaces!(ICrBlinds2);
}

// DXTBlinds Class
abstract class DXTBlinds {
  mixin(uuid("9a4a4a51-fb3a-4f4b-9b57-a2912a289769"));
  // static DWINGUID CLSID = { 0x9a4a4a51, 0xfb3a, 0x4f4b, 0x9b, 0x57, 0xa2, 0x91, 0x2a, 0x28, 0x97, 0x69 };
  mixin Interfaces!(ICrBlinds2);
}

// CrBlindPP Class
abstract class CrBlindPP {
  mixin(uuid("213052c1-100d-11d2-8b82-00a0c93c09b2"));
  // static DWINGUID CLSID = { 0x213052c1, 0x100d, 0x11d2, 0x8b, 0x82, 0x00, 0xa0, 0xc9, 0x3c, 0x09, 0xb2 };
  mixin Interfaces!(IUnknown);
}

// CrStretch Class
abstract class CrStretch {
  mixin(uuid("7658f2a2-0a83-11d2-a484-00c04f8efb69"));
  // static DWINGUID CLSID = { 0x7658f2a2, 0x0a83, 0x11d2, 0xa4, 0x84, 0x00, 0xc0, 0x4f, 0x8e, 0xfb, 0x69 };
  mixin Interfaces!(ICrStretch);
}

// DXTStretch Class
abstract class DXTStretch {
  mixin(uuid("f088de73-bdd0-4e3c-81f8-6d32f4fe9d28"));
  // static DWINGUID CLSID = { 0xf088de73, 0xbdd0, 0x4e3c, 0x81, 0xf8, 0x6d, 0x32, 0xf4, 0xfe, 0x9d, 0x28 };
  mixin Interfaces!(ICrStretch);
}

// CrStretchPP Class
abstract class CrStretchPP {
  mixin(uuid("15fb95e0-0f77-11d2-8b82-00a0c93c09b2"));
  // static DWINGUID CLSID = { 0x15fb95e0, 0x0f77, 0x11d2, 0x8b, 0x82, 0x00, 0xa0, 0xc9, 0x3c, 0x09, 0xb2 };
  mixin Interfaces!(IUnknown);
}

// CrInset Class
abstract class CrInset {
  mixin(uuid("93073c40-0ba5-11d2-a484-00c04f8efb69"));
  // static DWINGUID CLSID = { 0x93073c40, 0x0ba5, 0x11d2, 0xa4, 0x84, 0x00, 0xc0, 0x4f, 0x8e, 0xfb, 0x69 };
  mixin Interfaces!(ICrInset);
}

// DXTInset Class
abstract class DXTInset {
  mixin(uuid("76f363f2-7e9f-4ed7-a6a7-ee30351b6628"));
  // static DWINGUID CLSID = { 0x76f363f2, 0x7e9f, 0x4ed7, 0xa6, 0xa7, 0xee, 0x30, 0x35, 0x1b, 0x66, 0x28 };
  mixin Interfaces!(ICrInset);
}

// CrSpiral Class
abstract class CrSpiral {
  mixin(uuid("aca97e00-0c7d-11d2-a484-00c04f8efb69"));
  // static DWINGUID CLSID = { 0xaca97e00, 0x0c7d, 0x11d2, 0xa4, 0x84, 0x00, 0xc0, 0x4f, 0x8e, 0xfb, 0x69 };
  mixin Interfaces!(ICrSpiral);
}

// DXTSpiral Class
abstract class DXTSpiral {
  mixin(uuid("4a03dcb9-6e17-4a39-8845-4ee7dc5331a5"));
  // static DWINGUID CLSID = { 0x4a03dcb9, 0x6e17, 0x4a39, 0x88, 0x45, 0x4e, 0xe7, 0xdc, 0x53, 0x31, 0xa5 };
  mixin Interfaces!(ICrSpiral);
}

// CrSpiralPP Class
abstract class CrSpiralPP {
  mixin(uuid("c6a4fe81-1022-11d2-8b82-00a0c93c09b2"));
  // static DWINGUID CLSID = { 0xc6a4fe81, 0x1022, 0x11d2, 0x8b, 0x82, 0x00, 0xa0, 0xc9, 0x3c, 0x09, 0xb2 };
  mixin Interfaces!(IUnknown);
}

// CrZigzag Class
abstract class CrZigzag {
  mixin(uuid("e6e73d20-0c8a-11d2-a484-00c04f8efb69"));
  // static DWINGUID CLSID = { 0xe6e73d20, 0x0c8a, 0x11d2, 0xa4, 0x84, 0x00, 0xc0, 0x4f, 0x8e, 0xfb, 0x69 };
  mixin Interfaces!(ICrZigzag);
}

// DXTZigZag Class
abstract class DXTZigzag {
  mixin(uuid("23e26328-3928-40f2-95e5-93cad69016eb"));
  // static DWINGUID CLSID = { 0x23e26328, 0x3928, 0x40f2, 0x95, 0xe5, 0x93, 0xca, 0xd6, 0x90, 0x16, 0xeb };
  mixin Interfaces!(ICrZigzag);
}

// CrZigzagPP Class
abstract class CrZigzagPP {
  mixin(uuid("1559a3c1-102b-11d2-8b82-00a0c93c09b2"));
  // static DWINGUID CLSID = { 0x1559a3c1, 0x102b, 0x11d2, 0x8b, 0x82, 0x00, 0xa0, 0xc9, 0x3c, 0x09, 0xb2 };
  mixin Interfaces!(IUnknown);
}

// CrWheel Class
abstract class CrWheel {
  mixin(uuid("5ae1dae0-1461-11d2-a484-00c04f8efb69"));
  // static DWINGUID CLSID = { 0x5ae1dae0, 0x1461, 0x11d2, 0xa4, 0x84, 0x00, 0xc0, 0x4f, 0x8e, 0xfb, 0x69 };
  mixin Interfaces!(ICrWheel);
}

// CrWheelPP Class
abstract class CrWheelPP {
  mixin(uuid("fa9f6180-1464-11d2-a484-00c04f8efb69"));
  // static DWINGUID CLSID = { 0xfa9f6180, 0x1464, 0x11d2, 0xa4, 0x84, 0x00, 0xc0, 0x4f, 0x8e, 0xfb, 0x69 };
  mixin Interfaces!(IUnknown);
}

// Chroma Class
abstract class DXTChroma {
  mixin(uuid("421516c1-3cf8-11d2-952a-00c04fa34f05"));
  // static DWINGUID CLSID = { 0x421516c1, 0x3cf8, 0x11d2, 0x95, 0x2a, 0x00, 0xc0, 0x4f, 0xa3, 0x4f, 0x05 };
  mixin Interfaces!(IDXTChroma);
}

// ChromaPP Class
abstract class DXTChromaPP {
  mixin(uuid("ec7e0760-4c76-11d2-8ade-00a0c98e6527"));
  // static DWINGUID CLSID = { 0xec7e0760, 0x4c76, 0x11d2, 0x8a, 0xde, 0x00, 0xa0, 0xc9, 0x8e, 0x65, 0x27 };
  mixin Interfaces!(IUnknown);
}

// DropShadow Class
abstract class DXTDropShadow {
  mixin(uuid("adc6cb86-424c-11d2-952a-00c04fa34f05"));
  // static DWINGUID CLSID = { 0xadc6cb86, 0x424c, 0x11d2, 0x95, 0x2a, 0x00, 0xc0, 0x4f, 0xa3, 0x4f, 0x05 };
  mixin Interfaces!(IDXTDropShadow);
}

// DropShadowPP Class
abstract class DXTDropShadowPP {
  mixin(uuid("ec7e0761-4c76-11d2-8ade-00a0c98e6527"));
  // static DWINGUID CLSID = { 0xec7e0761, 0x4c76, 0x11d2, 0x8a, 0xde, 0x00, 0xa0, 0xc9, 0x8e, 0x65, 0x27 };
  mixin Interfaces!(IUnknown);
}

// DXTCheckerBoard Class
abstract class DXTCheckerBoard {
  mixin(uuid("b3ee7802-8224-4787-a1ea-f0de16deabd3"));
  // static DWINGUID CLSID = { 0xb3ee7802, 0x8224, 0x4787, 0xa1, 0xea, 0xf0, 0xde, 0x16, 0xde, 0xab, 0xd3 };
  mixin Interfaces!(IDXTCheckerBoard);
}

// DXTCheckerBoardPP Class
abstract class DXTCheckerBoardPP {
  mixin(uuid("cbf47525-98d2-45ea-b843-fd213d932b10"));
  // static DWINGUID CLSID = { 0xcbf47525, 0x98d2, 0x45ea, 0xb8, 0x43, 0xfd, 0x21, 0x3d, 0x93, 0x2b, 0x10 };
  mixin Interfaces!(IUnknown);
}

// DXTRevealTrans Class
abstract class DXTRevealTrans {
  mixin(uuid("e31e87c4-86ea-4940-9b8a-5bd5d179a737"));
  // static DWINGUID CLSID = { 0xe31e87c4, 0x86ea, 0x4940, 0x9b, 0x8a, 0x5b, 0xd5, 0xd1, 0x79, 0xa7, 0x37 };
  mixin Interfaces!(IDXTRevealTrans);
}

// DXTMaskFilter Class
abstract class DXTMaskFilter {
  mixin(uuid("3a04d93b-1edd-4f3f-a375-a03ec19572c4"));
  // static DWINGUID CLSID = { 0x3a04d93b, 0x1edd, 0x4f3f, 0xa3, 0x75, 0xa0, 0x3e, 0xc1, 0x95, 0x72, 0xc4 };
  mixin Interfaces!(IDXTMask);
}

// DXTRedirect Class
abstract class DXTRedirect {
  mixin(uuid("42b07b28-2280-4937-b035-0293fb812781"));
  // static DWINGUID CLSID = { 0x42b07b28, 0x2280, 0x4937, 0xb0, 0x35, 0x02, 0x93, 0xfb, 0x81, 0x27, 0x81 };
  mixin Interfaces!(IDXTRedirect);
}

// DXTAlphaImageLoader Class
abstract class DXTAlphaImageLoader {
  mixin(uuid("0c7efbde-0303-4c6f-a4f7-31fa2be5e397"));
  // static DWINGUID CLSID = { 0x0c7efbde, 0x0303, 0x4c6f, 0xa4, 0xf7, 0x31, 0xfa, 0x2b, 0xe5, 0xe3, 0x97 };
  mixin Interfaces!(IDXTAlphaImageLoader);
}

// DXTAlphaImageLoader Property Page
abstract class DXTAlphaImageLoaderPP {
  mixin(uuid("8c80ce2d-850d-47da-8ecd-55023562d167"));
  // static DWINGUID CLSID = { 0x8c80ce2d, 0x850d, 0x47da, 0x8e, 0xcd, 0x55, 0x02, 0x35, 0x62, 0xd1, 0x67 };
  mixin Interfaces!(IUnknown);
}

// DXTRandomDissolve Class
abstract class DXTRandomDissolve {
  mixin(uuid("f7f4a1b6-8e87-452f-a2d7-3077f508dbc0"));
  // static DWINGUID CLSID = { 0xf7f4a1b6, 0x8e87, 0x452f, 0xa2, 0xd7, 0x30, 0x77, 0xf5, 0x08, 0xdb, 0xc0 };
  mixin Interfaces!(IDXEffect);
}

// DXTRandomBars Class
abstract class DXTRandomBars {
  mixin(uuid("2e7700b7-27c4-437f-9fbf-1e8be2817566"));
  // static DWINGUID CLSID = { 0x2e7700b7, 0x27c4, 0x437f, 0x9f, 0xbf, 0x1e, 0x8b, 0xe2, 0x81, 0x75, 0x66 };
  mixin Interfaces!(IDXTRandomBars);
}

// DXTRandomBars Property Page
abstract class DXTRandomBarsPP {
  mixin(uuid("e3e6ae11-7fdc-40c4-afbf-1dcea82862cc"));
  // static DWINGUID CLSID = { 0xe3e6ae11, 0x7fdc, 0x40c4, 0xaf, 0xbf, 0x1d, 0xce, 0xa8, 0x28, 0x62, 0xcc };
  mixin Interfaces!(IUnknown);
}

// DXTStrips Class
abstract class DXTStrips {
  mixin(uuid("63a4b1fc-259a-4a5b-8129-a83b8c9e6f4f"));
  // static DWINGUID CLSID = { 0x63a4b1fc, 0x259a, 0x4a5b, 0x81, 0x29, 0xa8, 0x3b, 0x8c, 0x9e, 0x6f, 0x4f };
  mixin Interfaces!(IDXTStrips);
}

// DXTStrips Property Page
abstract class DXTStripsPP {
  mixin(uuid("fec0b7ee-7aec-4067-9ee1-facfb7ce9af9"));
  // static DWINGUID CLSID = { 0xfec0b7ee, 0x7aec, 0x4067, 0x9e, 0xe1, 0xfa, 0xcf, 0xb7, 0xce, 0x9a, 0xf9 };
  mixin Interfaces!(IUnknown);
}

// MetaCreations Roll
abstract class DXTMetaRoll {
  mixin(uuid("9c61f46e-0530-11d2-8f98-00c04fb92eb7"));
  // static DWINGUID CLSID = { 0x9c61f46e, 0x0530, 0x11d2, 0x8f, 0x98, 0x00, 0xc0, 0x4f, 0xb9, 0x2e, 0xb7 };
  mixin Interfaces!(IDXTMetaRoll);
}

// MetaCreations Ripple
abstract class DXTMetaRipple {
  mixin(uuid("aa0d4d03-06a3-11d2-8f98-00c04fb92eb7"));
  // static DWINGUID CLSID = { 0xaa0d4d03, 0x06a3, 0x11d2, 0x8f, 0x98, 0x00, 0xc0, 0x4f, 0xb9, 0x2e, 0xb7 };
  mixin Interfaces!(IDXTMetaRipple);
}

// MetaCreations PageTurn
abstract class DXTMetaPageTurn {
  mixin(uuid("aa0d4d08-06a3-11d2-8f98-00c04fb92eb7"));
  // static DWINGUID CLSID = { 0xaa0d4d08, 0x06a3, 0x11d2, 0x8f, 0x98, 0x00, 0xc0, 0x4f, 0xb9, 0x2e, 0xb7 };
  mixin Interfaces!(IDXTMetaPageTurn);
}

// MetaCreations Liquid
abstract class DXTMetaLiquid {
  mixin(uuid("aa0d4d0a-06a3-11d2-8f98-00c04fb92eb7"));
  // static DWINGUID CLSID = { 0xaa0d4d0a, 0x06a3, 0x11d2, 0x8f, 0x98, 0x00, 0xc0, 0x4f, 0xb9, 0x2e, 0xb7 };
  mixin Interfaces!(IDXTMetaLiquid);
}

// MetaCreations CenterPeel
abstract class DXTMetaCenterPeel {
  mixin(uuid("aa0d4d0c-06a3-11d2-8f98-00c04fb92eb7"));
  // static DWINGUID CLSID = { 0xaa0d4d0c, 0x06a3, 0x11d2, 0x8f, 0x98, 0x00, 0xc0, 0x4f, 0xb9, 0x2e, 0xb7 };
  mixin Interfaces!(IDXTMetaCenterPeel);
}

// MetaCreations PeelSmall
abstract class DXTMetaPeelSmall {
  mixin(uuid("aa0d4d0e-06a3-11d2-8f98-00c04fb92eb7"));
  // static DWINGUID CLSID = { 0xaa0d4d0e, 0x06a3, 0x11d2, 0x8f, 0x98, 0x00, 0xc0, 0x4f, 0xb9, 0x2e, 0xb7 };
  mixin Interfaces!(IDXTMetaPeelSmall);
}

// MetaCreations PeelPiece
abstract class DXTMetaPeelPiece {
  mixin(uuid("aa0d4d10-06a3-11d2-8f98-00c04fb92eb7"));
  // static DWINGUID CLSID = { 0xaa0d4d10, 0x06a3, 0x11d2, 0x8f, 0x98, 0x00, 0xc0, 0x4f, 0xb9, 0x2e, 0xb7 };
  mixin Interfaces!(IDXTMetaPeelPiece);
}

// MetaCreations PeelSplit
abstract class DXTMetaPeelSplit {
  mixin(uuid("aa0d4d12-06a3-11d2-8f98-00c04fb92eb7"));
  // static DWINGUID CLSID = { 0xaa0d4d12, 0x06a3, 0x11d2, 0x8f, 0x98, 0x00, 0xc0, 0x4f, 0xb9, 0x2e, 0xb7 };
  mixin Interfaces!(IDXTMetaPeelSplit);
}

// DXTMetaWater Class
abstract class DXTMetaWater {
  mixin(uuid("107045c5-06e0-11d2-8d6d-00c04f8ef8e0"));
  // static DWINGUID CLSID = { 0x107045c5, 0x06e0, 0x11d2, 0x8d, 0x6d, 0x00, 0xc0, 0x4f, 0x8e, 0xf8, 0xe0 };
  mixin Interfaces!(IDXTMetaWater);
}

// DXTMetaLightWipe Class
abstract class DXTMetaLightWipe {
  mixin(uuid("107045c8-06e0-11d2-8d6d-00c04f8ef8e0"));
  // static DWINGUID CLSID = { 0x107045c8, 0x06e0, 0x11d2, 0x8d, 0x6d, 0x00, 0xc0, 0x4f, 0x8e, 0xf8, 0xe0 };
  mixin Interfaces!(IDXTMetaLightWipe);
}

// DXTMetaRadialScaleWipe Class
abstract class DXTMetaRadialScaleWipe {
  mixin(uuid("107045ca-06e0-11d2-8d6d-00c04f8ef8e0"));
  // static DWINGUID CLSID = { 0x107045ca, 0x06e0, 0x11d2, 0x8d, 0x6d, 0x00, 0xc0, 0x4f, 0x8e, 0xf8, 0xe0 };
  mixin Interfaces!(IDXTMetaRadialScaleWipe);
}

// DXTMetaWhiteOut Class
abstract class DXTMetaWhiteOut {
  mixin(uuid("107045cc-06e0-11d2-8d6d-00c04f8ef8e0"));
  // static DWINGUID CLSID = { 0x107045cc, 0x06e0, 0x11d2, 0x8d, 0x6d, 0x00, 0xc0, 0x4f, 0x8e, 0xf8, 0xe0 };
  mixin Interfaces!(IDXTMetaWhiteOut);
}

// DXTMetaTwister Class
abstract class DXTMetaTwister {
  mixin(uuid("107045cf-06e0-11d2-8d6d-00c04f8ef8e0"));
  // static DWINGUID CLSID = { 0x107045cf, 0x06e0, 0x11d2, 0x8d, 0x6d, 0x00, 0xc0, 0x4f, 0x8e, 0xf8, 0xe0 };
  mixin Interfaces!(IDXTMetaTwister);
}

// DXTMetaBurnFilm Class
abstract class DXTMetaBurnFilm {
  mixin(uuid("107045d1-06e0-11d2-8d6d-00c04f8ef8e0"));
  // static DWINGUID CLSID = { 0x107045d1, 0x06e0, 0x11d2, 0x8d, 0x6d, 0x00, 0xc0, 0x4f, 0x8e, 0xf8, 0xe0 };
  mixin Interfaces!(IDXTMetaBurnFilm);
}

// DXTMetaJaws Class
abstract class DXTMetaJaws {
  mixin(uuid("2a54c904-07aa-11d2-8d6d-00c04f8ef8e0"));
  // static DWINGUID CLSID = { 0x2a54c904, 0x07aa, 0x11d2, 0x8d, 0x6d, 0x00, 0xc0, 0x4f, 0x8e, 0xf8, 0xe0 };
  mixin Interfaces!(IDXTMetaJaws);
}

// DXTMetaColorFade Class
abstract class DXTMetaColorFade {
  mixin(uuid("2a54c908-07aa-11d2-8d6d-00c04f8ef8e0"));
  // static DWINGUID CLSID = { 0x2a54c908, 0x07aa, 0x11d2, 0x8d, 0x6d, 0x00, 0xc0, 0x4f, 0x8e, 0xf8, 0xe0 };
  mixin Interfaces!(IDXTMetaColorFade);
}

// DXTMetaFlowMotion Class
abstract class DXTMetaFlowMotion {
  mixin(uuid("2a54c90b-07aa-11d2-8d6d-00c04f8ef8e0"));
  // static DWINGUID CLSID = { 0x2a54c90b, 0x07aa, 0x11d2, 0x8d, 0x6d, 0x00, 0xc0, 0x4f, 0x8e, 0xf8, 0xe0 };
  mixin Interfaces!(IDXTMetaFlowMotion);
}

// DXTMetaVacuum Class
abstract class DXTMetaVacuum {
  mixin(uuid("2a54c90d-07aa-11d2-8d6d-00c04f8ef8e0"));
  // static DWINGUID CLSID = { 0x2a54c90d, 0x07aa, 0x11d2, 0x8d, 0x6d, 0x00, 0xc0, 0x4f, 0x8e, 0xf8, 0xe0 };
  mixin Interfaces!(IDXTMetaVacuum);
}

// DXTMetaGriddler Class
abstract class DXTMetaGriddler {
  mixin(uuid("2a54c911-07aa-11d2-8d6d-00c04f8ef8e0"));
  // static DWINGUID CLSID = { 0x2a54c911, 0x07aa, 0x11d2, 0x8d, 0x6d, 0x00, 0xc0, 0x4f, 0x8e, 0xf8, 0xe0 };
  mixin Interfaces!(IDXTMetaGriddler);
}

// DXTMetaGriddler2 Class
abstract class DXTMetaGriddler2 {
  mixin(uuid("2a54c913-07aa-11d2-8d6d-00c04f8ef8e0"));
  // static DWINGUID CLSID = { 0x2a54c913, 0x07aa, 0x11d2, 0x8d, 0x6d, 0x00, 0xc0, 0x4f, 0x8e, 0xf8, 0xe0 };
  mixin Interfaces!(IDXTMetaGriddler2);
}

// DXTMetaThreshold Class
abstract class DXTMetaThreshold {
  mixin(uuid("2a54c915-07aa-11d2-8d6d-00c04f8ef8e0"));
  // static DWINGUID CLSID = { 0x2a54c915, 0x07aa, 0x11d2, 0x8d, 0x6d, 0x00, 0xc0, 0x4f, 0x8e, 0xf8, 0xe0 };
  mixin Interfaces!(IDXTMetaThreshold);
}

// DXTMetaWormHole Class
abstract class DXTMetaWormHole {
  mixin(uuid("0e6ae022-0c83-11d2-8cd4-00104bc75d9a"));
  // static DWINGUID CLSID = { 0x0e6ae022, 0x0c83, 0x11d2, 0x8c, 0xd4, 0x00, 0x10, 0x4b, 0xc7, 0x5d, 0x9a };
  mixin Interfaces!(IDXTMetaWormHole);
}

// DXTGlow Class
abstract class DXTGlow {
  mixin(uuid("9f8e6421-3d9b-11d2-952a-00c04fa34f05"));
  // static DWINGUID CLSID = { 0x9f8e6421, 0x3d9b, 0x11d2, 0x95, 0x2a, 0x00, 0xc0, 0x4f, 0xa3, 0x4f, 0x05 };
  mixin Interfaces!(IDXTGlow);
}

// DXTShadow Class
abstract class DXTShadow {
  mixin(uuid("e71b4063-3e59-11d2-952a-00c04fa34f05"));
  // static DWINGUID CLSID = { 0xe71b4063, 0x3e59, 0x11d2, 0x95, 0x2a, 0x00, 0xc0, 0x4f, 0xa3, 0x4f, 0x05 };
  mixin Interfaces!(IDXTShadow);
}

// DXTAlpha Class
abstract class DXTAlpha {
  mixin(uuid("adc6cb82-424c-11d2-952a-00c04fa34f05"));
  // static DWINGUID CLSID = { 0xadc6cb82, 0x424c, 0x11d2, 0x95, 0x2a, 0x00, 0xc0, 0x4f, 0xa3, 0x4f, 0x05 };
  mixin Interfaces!(IDXTAlpha);
}

// DXTWave Class
abstract class DXTWave {
  mixin(uuid("adc6cb88-424c-11d2-952a-00c04fa34f05"));
  // static DWINGUID CLSID = { 0xadc6cb88, 0x424c, 0x11d2, 0x95, 0x2a, 0x00, 0xc0, 0x4f, 0xa3, 0x4f, 0x05 };
  mixin Interfaces!(IDXTWave);
}

// DXTLight Class
abstract class DXTLight {
  mixin(uuid("f9efbec2-4302-11d2-952a-00c04fa34f05"));
  // static DWINGUID CLSID = { 0xf9efbec2, 0x4302, 0x11d2, 0x95, 0x2a, 0x00, 0xc0, 0x4f, 0xa3, 0x4f, 0x05 };
  mixin Interfaces!(IDXTLight);
}

// DXTAlphaPP Class
abstract class DXTAlphaPP {
  mixin(uuid("d687a7e0-4ba4-11d2-8ade-00a0c98e6527"));
  // static DWINGUID CLSID = { 0xd687a7e0, 0x4ba4, 0x11d2, 0x8a, 0xde, 0x00, 0xa0, 0xc9, 0x8e, 0x65, 0x27 };
  mixin Interfaces!(IUnknown);
}

// DXTGlowPP Class
abstract class DXTGlowPP {
  mixin(uuid("ec7e0764-4c76-11d2-8ade-00a0c98e6527"));
  // static DWINGUID CLSID = { 0xec7e0764, 0x4c76, 0x11d2, 0x8a, 0xde, 0x00, 0xa0, 0xc9, 0x8e, 0x65, 0x27 };
  mixin Interfaces!(IUnknown);
}

// DXTShadowPP Class
abstract class DXTShadowPP {
  mixin(uuid("ec7e0765-4c76-11d2-8ade-00a0c98e6527"));
  // static DWINGUID CLSID = { 0xec7e0765, 0x4c76, 0x11d2, 0x8a, 0xde, 0x00, 0xa0, 0xc9, 0x8e, 0x65, 0x27 };
  mixin Interfaces!(IUnknown);
}

// DXTWavePP Class
abstract class DXTWavePP {
  mixin(uuid("f12456c0-4c9e-11d2-8ade-00a0c98e6527"));
  // static DWINGUID CLSID = { 0xf12456c0, 0x4c9e, 0x11d2, 0x8a, 0xde, 0x00, 0xa0, 0xc9, 0x8e, 0x65, 0x27 };
  mixin Interfaces!(IUnknown);
}

// DXTLightPP Class
abstract class DXTLightPP {
  mixin(uuid("694af25f-124d-11d3-91d5-00c04f8efb69"));
  // static DWINGUID CLSID = { 0x694af25f, 0x124d, 0x11d3, 0x91, 0xd5, 0x00, 0xc0, 0x4f, 0x8e, 0xfb, 0x69 };
  mixin Interfaces!(IUnknown);
}

// DXTMotionBlur Class
abstract class DXTMotionBlur {
  mixin(uuid("dd13de77-d3ba-42d4-b5c6-7745fa4e2d4b"));
  // static DWINGUID CLSID = { 0xdd13de77, 0xd3ba, 0x42d4, 0xb5, 0xc6, 0x77, 0x45, 0xfa, 0x4e, 0x2d, 0x4b };
  mixin Interfaces!(IDXTMotionBlur);
}

// DXTMotionBlurPP Class
abstract class DXTMotionBlurPP {
  mixin(uuid("926433e1-7f8f-4bc6-bec4-8c126c6b7dc4"));
  // static DWINGUID CLSID = { 0x926433e1, 0x7f8f, 0x4bc6, 0xbe, 0xc4, 0x8c, 0x12, 0x6c, 0x6b, 0x7d, 0xc4 };
  mixin Interfaces!(IUnknown);
}

// DXTMatrix Class
abstract class DXTMatrix {
  mixin(uuid("4abf5a06-5568-4834-bee3-327a6d95a685"));
  // static DWINGUID CLSID = { 0x4abf5a06, 0x5568, 0x4834, 0xbe, 0xe3, 0x32, 0x7a, 0x6d, 0x95, 0xa6, 0x85 };
  mixin Interfaces!(IDXTMatrix);
}

// DXTMatrixPP Class
abstract class DXTMatrixPP {
  mixin(uuid("c591103a-b3a8-4d47-a3f7-2aeee4b8013f"));
  // static DWINGUID CLSID = { 0xc591103a, 0xb3a8, 0x4d47, 0xa3, 0xf7, 0x2a, 0xee, 0xe4, 0xb8, 0x01, 0x3f };
  mixin Interfaces!(IUnknown);
}

// DXTICMFilter Class
abstract class DXTICMFilter {
  mixin(uuid("a1bfb370-5a9f-4429-bb72-b13e2feaedef"));
  // static DWINGUID CLSID = { 0xa1bfb370, 0x5a9f, 0x4429, 0xbb, 0x72, 0xb1, 0x3e, 0x2f, 0xea, 0xed, 0xef };
  mixin Interfaces!(IDXTICMFilter);
}

// DXTICMFilterPP Class
abstract class DXTICMFilterPP {
  mixin(uuid("1958fb12-31e6-47e5-aa49-b23d12c853e6"));
  // static DWINGUID CLSID = { 0x1958fb12, 0x31e6, 0x47e5, 0xaa, 0x49, 0xb2, 0x3d, 0x12, 0xc8, 0x53, 0xe6 };
  mixin Interfaces!(IUnknown);
}
