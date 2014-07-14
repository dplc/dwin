// DirectAnimation Library
// Version 1.0

/*[uuid("34f681d0-3640-11cf-9294-00aa00b8a733")]*/
module dwin.sys.win32.com.tlb.danim;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum __MIDL___MIDL_itf_danim_0190_0001 {
  DAEmpty = 0x00000000,
  DASolid = 0x00000001,
  DADash = 0x00000002,
}

enum __MIDL___MIDL_itf_danim_0190_0002 {
  DAEndFlat = 0x00000000,
  DAEndSquare = 0x00000001,
  DAEndRound = 0x00000002,
}

enum __MIDL___MIDL_itf_danim_0190_0003 {
  DAJoinBevel = 0x00000000,
  DAJoinRound = 0x00000001,
  DAJoinMiter = 0x00000002,
}

// Bitflags for Modifiable Behaviors
enum __MIDL___MIDL_itf_danim_0139_0001 {
  DAContinueTimeline = 0x00000001,
  DASwitchFinal = 0x00000002,
  DASwitchNextTick = 0x00000004,
}

// Bitflags for IDA2Image::ImageQuality
enum __MIDL___MIDL_itf_danim_0140_0001 {
  DAQUAL_AA_TEXT_ON = 0x00000001,
  DAQUAL_AA_TEXT_OFF = 0x00000002,
  DAQUAL_AA_LINES_ON = 0x00000004,
  DAQUAL_AA_LINES_OFF = 0x00000008,
  DAQUAL_AA_SOLIDS_ON = 0x00000010,
  DAQUAL_AA_SOLIDS_OFF = 0x00000020,
  DAQUAL_AA_CLIP_ON = 0x00000040,
  DAQUAL_AA_CLIP_OFF = 0x00000080,
  DAQUAL_MSHTML_COLORS_ON = 0x00000100,
  DAQUAL_MSHTML_COLORS_OFF = 0x00000200,
  DAQUAL_QUALITY_TRANSFORMS_ON = 0x00000400,
  DAQUAL_QUALITY_TRANSFORMS_OFF = 0x00000800,
}

// Bitflags for IDA2View::GetInvalidatedRects
enum __MIDL___MIDL_itf_danim_0140_0002 {
  DAINVRECT_MERGE_BOXES = 0x00000001,
}

// Enum for IDA2LineStyle::DashStyle
enum __MIDL___MIDL_itf_danim_0140_0003 {
  DASHSTYLE_SOLID = 0x00000000,
  DASHSTYLE_DASH = 0x00000001,
  DASHSTYLE_DOT = 0x00000002,
  DASHSTYLE_DASHDOT = 0x00000003,
  DASHSTYLE_DASHDOTDOT = 0x00000004,
  DASHSTYLE_NULL = 0x00000005,
}

// Enum for IDA2LineStyle::EndStyle
enum __MIDL___MIDL_itf_danim_0140_0004 {
  ENDSTYLE_ROUND = 0x00000000,
  ENDSTYLE_SQUARE = 0x00000001,
  ENDSTYLE_FLAT = 0x00000002,
}

// Enum for IDA2LineStyle::JoinStyle
enum __MIDL___MIDL_itf_danim_0140_0005 {
  JOINSTYLE_ROUND = 0x00000000,
  JOINSTYLE_BEVEL = 0x00000001,
  JOINSTYLE_MITER = 0x00000002,
}

// Bitflags for StartModelEx
enum __MIDL___MIDL_itf_danim_0187_0001 {
  DAAsyncFlag = 0x00000001,
}

enum __MIDL___MIDL_itf_danim_0198_0001 {
  DAMultimediaTimer = 0x00000000,
  DAContainerTimer = 0x00000001,
  DAWMTimer = 0x00000002,
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
  uint type;
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

struct tagBIND_OPTS2 {
  uint cbStruct;
  uint grfFlags;
  uint grfMode;
  uint dwTickCountDeadline;
  uint dwTrackFlags;
  uint dwClassContext;
  uint locale;
  _COSERVERINFO* pServerInfo;
}

struct _COSERVERINFO {
  uint dwReserved1;
  wchar* pwszName;
  _COAUTHINFO* pAuthInfo;
  uint dwReserved2;
}

struct _COAUTHINFO {
  uint dwAuthnSvc;
  uint dwAuthzSvc;
  wchar* pwszServerPrincName;
  uint dwAuthnLevel;
  uint dwImpersonationLevel;
  _COAUTHIDENTITY* pAuthIdentityData;
  uint dwCapabilities;
}

struct _COAUTHIDENTITY {
  ushort* User;
  uint UserLength;
  ushort* Domain;
  uint DomainLength;
  ushort* Password;
  uint PasswordLength;
  uint Flags;
}

struct tagRECT {
  int left;
  int top;
  int right;
  int bottom;
}

struct tagPOINT {
  int X;
  int Y;
}

// Aliases

alias _RemotableHandle* wireHDC;

alias __MIDL___MIDL_itf_danim_0190_0001 DA_DASH_STYLE;

alias __MIDL___MIDL_itf_danim_0190_0002 DA_END_STYLE;

alias __MIDL___MIDL_itf_danim_0190_0003 DA_JOIN_STYLE;

// Bitflags for IDA2Image::ImageQuality
alias __MIDL___MIDL_itf_danim_0140_0001 DA_IMAGE_QUALITY_FLAGS;

// Bitflags for IDA2View::GetInvalidatedRects
alias __MIDL___MIDL_itf_danim_0140_0002 DA_INVALIDATED_RECTS_FLAGS;

// Enum for IDA2LineStyle::DashStyle
alias __MIDL___MIDL_itf_danim_0140_0003 DA_DASHSTYLE_ENUM;

// Enum for IDA2LineStyle::EndStyle
alias __MIDL___MIDL_itf_danim_0140_0004 DA_ENDSTYLE_ENUM;

// Enum for IDA2LineStyle::JoinStyle
alias __MIDL___MIDL_itf_danim_0140_0005 DA_JOINSTYLE_ENUM;

alias uint ULONG_PTR;

alias _RemotableHandle* wireHWND;

alias __MIDL___MIDL_itf_danim_0198_0001 DA_TIMER_SOURCE;

// Interfaces

// DirectAnimation View Site interface
interface IDAViewSite : IDispatch {
  mixin(uuid("283807b3-2c60-11d0-a31d-00aa00b92c03"));
  // static DWINGUID IID = { 0x283807b3, 0x2c60, 0x11d0, 0xa3, 0x1d, 0x00, 0xaa, 0x00, 0xb9, 0x2c, 0x03 };
  /*[id(0x60020000)]*/ int SetStatusText(wchar* StatusText);
}

// DirectAnimation View
interface IDAView : IDispatch {
  mixin(uuid("283807b4-2c60-11d0-a31d-00aa00b92c03"));
  // static DWINGUID IID = { 0x283807b4, 0x2c60, 0x11d0, 0xa3, 0x1d, 0x00, 0xaa, 0x00, 0xb9, 0x2c, 0x03 };
  // The current simulation time.
  /*[id(0x60020000)]*/ int get_SimulationTime(out double simTime);
  /*[id(0x60020001)]*/ int Tick(double simTime, out short needToRender);
  /*[id(0x60020002)]*/ int Render();
  /*[id(0x60020003)]*/ int AddBvrToRun(IDABehavior bvr, out int pId);
  /*[id(0x60020004)]*/ int RemoveRunningBvr(int id);
  /*[id(0x60020005)]*/ int StartModel(IDAImage pImage, IDASound pSound, double startTime);
  /*[id(0x60020006)]*/ int StopModel();
  // The window to display the view in.
  /*[id(0x60020007)]*/ int get_Window(out int hwnd);
  // The window to display the view in.
  /*[id(0x60020007)]*/ int set_Window(int hwnd);
  // The DirectDraw Surface to display the view in.
  /*[id(0x60020009)]*/ int get_IDirectDrawSurface(out IUnknown ddsurf);
  // The DirectDraw Surface to display the view in.
  /*[id(0x60020009)]*/ int set_IDirectDrawSurface(IUnknown ddsurf);
  // The HDC to display the view in.
  /*[id(0x6002000B)]*/ int get_DC(out wireHDC DC);
  // The HDC to display the view in.
  /*[id(0x6002000B)]*/ int set_DC(wireHDC DC);
  // Composition mode: compose to backbuffer or directly to target
  /*[id(0x6002000D)]*/ int get_CompositeDirectlyToTarget(out short composeToTarget);
  // Composition mode: compose to backbuffer or directly to target
  /*[id(0x6002000D)]*/ int set_CompositeDirectlyToTarget(short composeToTarget);
  /*[id(0x6002000F)]*/ int SetViewport(int xPos, int yPos, int w, int h);
  /*[id(0x60020010)]*/ int SetClipRect(int xPos, int yPos, int w, int h);
  /*[id(0x60020011)]*/ int RePaint(int xPos, int yPos, int w, int h);
  /*[id(0x60020012)]*/ int PaletteChanged(short bNew);
  /*[id(0x60020013)]*/ int get_Site(out IDAViewSite pViewSite);
  /*[id(0x60020013)]*/ int set_Site(IDAViewSite pViewSite);
  /*[id(0x60020015)]*/ int set_ClientSite(IOleClientSite pClientSite);
  /*[id(0x60020015)]*/ int get_ClientSite(out IOleClientSite pClientSite);
  /*[id(0x60020017)]*/ int OnMouseMove(double when, int xPos, int yPos, ubyte modifiers);
  /*[id(0x60020018)]*/ int OnMouseButton(double when, int xPos, int yPos, ubyte button, short bPressed, ubyte modifiers);
  /*[id(0x60020019)]*/ int OnKey(double when, int key, short bPressed, ubyte modifiers);
  /*[id(0x6002001A)]*/ int OnFocus(short bHasFocus);
  /*[id(0x6002001B)]*/ int get_Preferences(out IDAPreferences prefs);
  /*[id(0x6002001C)]*/ int QueryHitPoint(uint dwAspect, tagRECT* prcBounds, tagPOINT ptLoc, int lCloseHint, out uint pHitResult);
}

// DirectAnimation Behavior
interface IDABehavior : IDispatch {
  mixin(uuid("283807b7-2c60-11d0-a31d-00aa00b92c03"));
  // static DWINGUID IID = { 0x283807b7, 0x2c60, 0x11d0, 0xa3, 0x1d, 0x00, 0xaa, 0x00, 0xb9, 0x2c, 0x03 };
  /*[id(0x60020000)]*/ int GetClassName(out wchar* pClassName);
  /*[id(0x60020001)]*/ int Init(IDABehavior toBvr);
  /*[id(0x60020002)]*/ int Importance(double relativeImportance, out IDABehavior ppBvr);
  /*[id(0x60020003)]*/ int RunOnce(out IDABehavior bvr);
  /*[id(0x60020004)]*/ int SubstituteTime(IDANumber xform, out IDABehavior bvr);
  /*[id(0x60020005)]*/ int SwitchTo(IDABehavior SwitchTo);
  /*[id(0x60020006)]*/ int SwitchToNumber(double numToSwitchTo);
  /*[id(0x60020007)]*/ int SwitchToString(wchar* strToSwitchTo);
  /*[id(0x60020008)]*/ int Hook(IDABvrHook notifier, out IDABehavior pBvr);
  /*[id(0x60020009)]*/ int Duration(double Duration, out IDABehavior bvr);
  /*[id(0x6002000A)]*/ int DurationAnim(IDANumber Duration, out IDABehavior bvr);
  /*[id(0x6002000B)]*/ int Repeat(int count, out IDABehavior bvr);
  /*[id(0x6002000C)]*/ int RepeatForever(out IDABehavior bvr);
  /*[id(0x6002000D)]*/ int IsReady(short bBlock, out short b);
}

// DirectAnimation Number Behavior
interface IDANumber : IDABehavior {
  mixin(uuid("9cde7340-3c20-11d0-a330-00aa00b92c03"));
  // static DWINGUID IID = { 0x9cde7340, 0x3c20, 0x11d0, 0xa3, 0x30, 0x00, 0xaa, 0x00, 0xb9, 0x2c, 0x03 };
  /*[id(0x60030000)]*/ int Extract(out double ret_0);
  /*[id(0x60030001)]*/ int AnimateProperty(wchar* propertyPath_0, wchar* scriptingLanguage_1, short invokeAsMethod_2, double minUpdateInterval_3, out IDANumber ret_4);
  /*[id(0x60030002)]*/ int ToStringAnim(IDANumber precision_0, out IDAString ret_1);
  /*[id(0x60030003)]*/ int ToString(double precision_0, out IDAString ret_1);
}

// DirectAnimation String Behavior
interface IDAString : IDABehavior {
  mixin(uuid("c46c1bc3-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID IID = { 0xc46c1bc3, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  /*[id(0x60030000)]*/ int Extract(out wchar* ret_0);
  /*[id(0x60030001)]*/ int AnimateProperty(wchar* propertyPath_0, wchar* scriptingLanguage_1, short invokeAsMethod_2, double minUpdateInterval_3, out IDAString ret_4);
}

// DirectAnimation Bvr Callback
interface IDABvrHook : IUnknown {
  mixin(uuid("3e2487c4-8709-11d0-b177-00c04fc2a0ca"));
  // static DWINGUID IID = { 0x3e2487c4, 0x8709, 0x11d0, 0xb1, 0x77, 0x00, 0xc0, 0x4f, 0xc2, 0xa0, 0xca };
}

// DirectAnimation Image Behavior
interface IDAImage : IDABehavior {
  mixin(uuid("c46c1bd3-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID IID = { 0xc46c1bd3, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  /*[id(0x60030000)]*/ int Pickable(out IDAPickableResult ret_0);
  /*[id(0x60030001)]*/ int PickableOccluded(out IDAPickableResult ret_0);
  /*[id(0x60030002)]*/ int ApplyBitmapEffect(IUnknown effectToApply_0, IDAEvent firesWhenChanged_1, out IDAImage ret_2);
  /*[id(0x60030003)]*/ int get_BoundingBox(out IDABbox2 ret_0);
  /*[id(0x60030004)]*/ int Crop(IDAPoint2 min_0, IDAPoint2 max_1, out IDAImage ret_2);
  /*[id(0x60030005)]*/ int Transform(IDATransform2 xf_0, out IDAImage ret_1);
  /*[id(0x60030006)]*/ int OpacityAnim(IDANumber opacity_0, out IDAImage ret_1);
  /*[id(0x60030007)]*/ int Opacity(double opacity_0, out IDAImage ret_1);
  /*[id(0x60030008)]*/ int Undetectable(out IDAImage ret_0);
  /*[id(0x60030009)]*/ int Tile(out IDAImage ret_0);
  /*[id(0x6003000A)]*/ int Clip(IDAMatte m_0, out IDAImage ret_1);
  /*[id(0x6003000B)]*/ int MapToUnitSquare(out IDAImage ret_0);
  /*[id(0x6003000C)]*/ int ClipPolygonImageEx(int points_0size, IDAPoint2* points_0, out IDAImage ret_1);
  /*[id(0x6003000D)]*/ int ClipPolygonImage(DWINVARIANT points_0, out IDAImage ret_1);
}

// DirectAnimation Pickable Structure
interface IDAPickableResult : IDispatch {
  mixin(uuid("4a933703-e36f-11d0-9b99-00c04fc2f51d"));
  // static DWINGUID IID = { 0x4a933703, 0xe36f, 0x11d0, 0x9b, 0x99, 0x00, 0xc0, 0x4f, 0xc2, 0xf5, 0x1d };
  // The pickable image
  /*[id(0x60020000)]*/ int get_Image(out IDAImage ppImage);
  // The pickable geometry
  /*[id(0x60020001)]*/ int get_Geometry(out IDAGeometry ppGeometry);
  // Event that fires upon picking
  /*[id(0x60020002)]*/ int get_PickEvent(out IDAEvent ppPickEvent);
}

// DirectAnimation Geometry Behavior
interface IDAGeometry : IDABehavior {
  mixin(uuid("c46c1bdf-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID IID = { 0xc46c1bdf, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  /*[id(0x60030000)]*/ int RenderSound(IDAMicrophone mic_0, out IDASound ret_1);
  /*[id(0x60030001)]*/ int Pickable(out IDAPickableResult ret_0);
  /*[id(0x60030002)]*/ int PickableOccluded(out IDAPickableResult ret_0);
  /*[id(0x60030003)]*/ int Undetectable(out IDAGeometry ret_0);
  /*[id(0x60030004)]*/ int EmissiveColor(IDAColor col_0, out IDAGeometry ret_1);
  /*[id(0x60030005)]*/ int DiffuseColor(IDAColor col_0, out IDAGeometry ret_1);
  /*[id(0x60030006)]*/ int SpecularColor(IDAColor col_0, out IDAGeometry ret_1);
  /*[id(0x60030007)]*/ int SpecularExponent(double power_0, out IDAGeometry ret_1);
  /*[id(0x60030008)]*/ int SpecularExponentAnim(IDANumber power_0, out IDAGeometry ret_1);
  /*[id(0x60030009)]*/ int Texture(IDAImage texture_0, out IDAGeometry ret_1);
  /*[id(0x6003000A)]*/ int Opacity(double level_0, out IDAGeometry ret_1);
  /*[id(0x6003000B)]*/ int OpacityAnim(IDANumber level_0, out IDAGeometry ret_1);
  /*[id(0x6003000C)]*/ int Transform(IDATransform3 xf_0, out IDAGeometry ret_1);
  /*[id(0x6003000D)]*/ int get_BoundingBox(out IDABbox3 ret_0);
  /*[id(0x6003000E)]*/ int Render(IDACamera cam_0, out IDAImage ret_1);
  /*[id(0x6003000F)]*/ int LightColor(IDAColor color_0, out IDAGeometry ret_1);
  /*[id(0x60030010)]*/ int LightAttenuationAnim(IDANumber constant_0, IDANumber linear_1, IDANumber quadratic_2, out IDAGeometry ret_3);
  /*[id(0x60030011)]*/ int LightAttenuation(double constant_0, double linear_1, double quadratic_2, out IDAGeometry ret_3);
}

// DirectAnimation Microphone Behavior
interface IDAMicrophone : IDABehavior {
  mixin(uuid("c46c1be5-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID IID = { 0xc46c1be5, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  /*[id(0x60030000)]*/ int Transform(IDATransform3 xf_0, out IDAMicrophone ret_1);
}

// DirectAnimation Transform3 Behavior
interface IDATransform3 : IDABehavior {
  mixin(uuid("c46c1bdb-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID IID = { 0xc46c1bdb, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  /*[id(0x60030000)]*/ int Inverse(out IDATransform3 ret_0);
  /*[id(0x60030001)]*/ int get_IsSingular(out IDABoolean ret_0);
  /*[id(0x60030002)]*/ int ParallelTransform2(out IDATransform2 ret_0);
}

// DirectAnimation Boolean Behavior
interface IDABoolean : IDABehavior {
  mixin(uuid("c46c1bc0-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID IID = { 0xc46c1bc0, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  /*[id(0x60030000)]*/ int Extract(out short ret_0);
}

// DirectAnimation Transform2 Behavior
interface IDATransform2 : IDABehavior {
  mixin(uuid("c46c1bcb-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID IID = { 0xc46c1bcb, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  /*[id(0x60030000)]*/ int Inverse(out IDATransform2 ret_0);
  /*[id(0x60030001)]*/ int get_IsSingular(out IDABoolean ret_0);
}

// DirectAnimation Sound Behavior
interface IDASound : IDABehavior {
  mixin(uuid("c46c1be3-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID IID = { 0xc46c1be3, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  /*[id(0x60030000)]*/ int PhaseAnim(IDANumber phaseAmt_0, out IDASound ret_1);
  /*[id(0x60030001)]*/ int Phase(double phaseAmt_0, out IDASound ret_1);
  /*[id(0x60030002)]*/ int RateAnim(IDANumber pitchShift_0, out IDASound ret_1);
  /*[id(0x60030003)]*/ int Rate(double pitchShift_0, out IDASound ret_1);
  /*[id(0x60030004)]*/ int PanAnim(IDANumber panAmt_0, out IDASound ret_1);
  /*[id(0x60030005)]*/ int Pan(double panAmt_0, out IDASound ret_1);
  /*[id(0x60030006)]*/ int GainAnim(IDANumber gainAmt_0, out IDASound ret_1);
  /*[id(0x60030007)]*/ int Gain(double gainAmt_0, out IDASound ret_1);
  /*[id(0x60030008)]*/ int Loop(out IDASound ret_0);
}

// DirectAnimation Color Behavior
interface IDAColor : IDABehavior {
  mixin(uuid("c46c1bc5-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID IID = { 0xc46c1bc5, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  /*[id(0x60030000)]*/ int get_Red(out IDANumber ret_0);
  /*[id(0x60030001)]*/ int get_Green(out IDANumber ret_0);
  /*[id(0x60030002)]*/ int get_Blue(out IDANumber ret_0);
  /*[id(0x60030003)]*/ int get_Hue(out IDANumber ret_0);
  /*[id(0x60030004)]*/ int get_Saturation(out IDANumber ret_0);
  /*[id(0x60030005)]*/ int get_Lightness(out IDANumber ret_0);
}

// DirectAnimation Bbox3 Behavior
interface IDABbox3 : IDABehavior {
  mixin(uuid("c46c1bdd-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID IID = { 0xc46c1bdd, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  /*[id(0x60030000)]*/ int get_Min(out IDAPoint3 ret_0);
  /*[id(0x60030001)]*/ int get_Max(out IDAPoint3 ret_0);
}

// DirectAnimation Point3 Behavior
interface IDAPoint3 : IDABehavior {
  mixin(uuid("c46c1bd7-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID IID = { 0xc46c1bd7, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  /*[id(0x60030000)]*/ int Project(IDACamera cam_0, out IDAPoint2 ret_1);
  /*[id(0x60030001)]*/ int get_X(out IDANumber ret_0);
  /*[id(0x60030002)]*/ int get_Y(out IDANumber ret_0);
  /*[id(0x60030003)]*/ int get_Z(out IDANumber ret_0);
  /*[id(0x60030004)]*/ int get_SphericalCoordXYAngle(out IDANumber ret_0);
  /*[id(0x60030005)]*/ int get_SphericalCoordYZAngle(out IDANumber ret_0);
  /*[id(0x60030006)]*/ int get_SphericalCoordLength(out IDANumber ret_0);
  /*[id(0x60030007)]*/ int Transform(IDATransform3 xf_0, out IDAPoint3 ret_1);
}

// DirectAnimation Camera Behavior
interface IDACamera : IDABehavior {
  mixin(uuid("c46c1be1-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID IID = { 0xc46c1be1, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  /*[id(0x60030000)]*/ int Transform(IDATransform3 xf_0, out IDACamera ret_1);
  /*[id(0x60030001)]*/ int Depth(double depth_0, out IDACamera ret_1);
  /*[id(0x60030002)]*/ int DepthAnim(IDANumber depth_0, out IDACamera ret_1);
  /*[id(0x60030003)]*/ int DepthResolution(double resolution_0, out IDACamera ret_1);
  /*[id(0x60030004)]*/ int DepthResolutionAnim(IDANumber resolution_0, out IDACamera ret_1);
}

// DirectAnimation Point2 Behavior
interface IDAPoint2 : IDABehavior {
  mixin(uuid("c46c1bc7-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID IID = { 0xc46c1bc7, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  /*[id(0x60030000)]*/ int AnimateControlPosition(wchar* propertyPath_0, wchar* scriptingLanguage_1, short invokeAsMethod_2, double minUpdateInterval_3, out IDAPoint2 ret_4);
  /*[id(0x60030001)]*/ int AnimateControlPositionPixel(wchar* propertyPath_0, wchar* scriptingLanguage_1, short invokeAsMethod_2, double minUpdateInterval_3, out IDAPoint2 ret_4);
  /*[id(0x60030002)]*/ int get_X(out IDANumber ret_0);
  /*[id(0x60030003)]*/ int get_Y(out IDANumber ret_0);
  /*[id(0x60030004)]*/ int get_PolarCoordAngle(out IDANumber ret_0);
  /*[id(0x60030005)]*/ int get_PolarCoordLength(out IDANumber ret_0);
  /*[id(0x60030006)]*/ int Transform(IDATransform2 xf_0, out IDAPoint2 ret_1);
}

// DirectAnimation Event Behavior
interface IDAEvent : IDABehavior {
  mixin(uuid("50b4791e-4731-11d0-8912-00c04fc2a0ca"));
  // static DWINGUID IID = { 0x50b4791e, 0x4731, 0x11d0, 0x89, 0x12, 0x00, 0xc0, 0x4f, 0xc2, 0xa0, 0xca };
  /*[id(0x60030000)]*/ int Notify(IDAUntilNotifier notifier_0, out IDAEvent ret_1);
  /*[id(0x60030001)]*/ int Snapshot(IDABehavior b_0, out IDAEvent ret_1);
  /*[id(0x60030002)]*/ int AttachData(IDABehavior data_0, out IDAEvent ret_1);
  /*[id(0x60030003)]*/ int ScriptCallback(wchar* scriptlet_0, wchar* language_1, out IDAEvent ret_2);
}

// DirectAnimation Until Notify Callback
interface IDAUntilNotifier : IDispatch {
  mixin(uuid("3f3da01a-4705-11d0-8710-00c04fc29d46"));
  // static DWINGUID IID = { 0x3f3da01a, 0x4705, 0x11d0, 0x87, 0x10, 0x00, 0xc0, 0x4f, 0xc2, 0x9d, 0x46 };
  /*[id(0x60020000)]*/ int Notify(IDABehavior eventData, IDABehavior curRunningBvr, IDAView curView, out IDABehavior ppBvr);
}

// DirectAnimation Bbox2 Behavior
interface IDABbox2 : IDABehavior {
  mixin(uuid("c46c1bcd-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID IID = { 0xc46c1bcd, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  /*[id(0x60030000)]*/ int get_Min(out IDAPoint2 ret_0);
  /*[id(0x60030001)]*/ int get_Max(out IDAPoint2 ret_0);
}

// DirectAnimation Matte Behavior
interface IDAMatte : IDABehavior {
  mixin(uuid("c46c1bd1-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID IID = { 0xc46c1bd1, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  /*[id(0x60030000)]*/ int Transform(IDATransform2 xf_0, out IDAMatte ret_1);
}

interface IOleClientSite : IUnknown {
  mixin(uuid("00000118-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00000118, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int SaveObject();
  /*[id(0x60010001)]*/ int GetMoniker(uint dwAssign, uint dwWhichMoniker, out IMoniker ppmk);
  /*[id(0x60010002)]*/ int GetContainer(out IOleContainer ppContainer);
  /*[id(0x60010003)]*/ int ShowObject();
  /*[id(0x60010004)]*/ int OnShowWindow(int fShow);
  /*[id(0x60010005)]*/ int RequestNewObjectLayout();
}

interface IMoniker : IPersistStream {
  mixin(uuid("0000000f-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x0000000f, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60030000)]*/ int RemoteBindToObject(IBindCtx pbc, IMoniker pmkToLeft, ref DWINGUID riidResult, out IUnknown ppvResult);
  /*[id(0x60030001)]*/ int RemoteBindToStorage(IBindCtx pbc, IMoniker pmkToLeft, ref DWINGUID riid, out IUnknown ppvObj);
  /*[id(0x60030002)]*/ int Reduce(IBindCtx pbc, uint dwReduceHowFar, ref IMoniker ppmkToLeft, out IMoniker ppmkReduced);
  /*[id(0x60030003)]*/ int ComposeWith(IMoniker pmkRight, int fOnlyIfNotGeneric, out IMoniker ppmkComposite);
  /*[id(0x60030004)]*/ int Enum(int fForward, out IEnumMoniker ppenumMoniker);
  /*[id(0x60030005)]*/ int IsEqual(IMoniker pmkOtherMoniker);
  /*[id(0x60030006)]*/ int Hash(out uint pdwHash);
  /*[id(0x60030007)]*/ int IsRunning(IBindCtx pbc, IMoniker pmkToLeft, IMoniker pmkNewlyRunning);
  /*[id(0x60030008)]*/ int GetTimeOfLastChange(IBindCtx pbc, IMoniker pmkToLeft, out _FILETIME pfiletime);
  /*[id(0x60030009)]*/ int Inverse(out IMoniker ppmk);
  /*[id(0x6003000A)]*/ int CommonPrefixWith(IMoniker pmkOther, out IMoniker ppmkPrefix);
  /*[id(0x6003000B)]*/ int RelativePathTo(IMoniker pmkOther, out IMoniker ppmkRelPath);
  /*[id(0x6003000C)]*/ int GetDisplayName(IBindCtx pbc, IMoniker pmkToLeft, out wchar* ppszDisplayName);
  /*[id(0x6003000D)]*/ int ParseDisplayName(IBindCtx pbc, IMoniker pmkToLeft, wchar* pszDisplayName, out uint pchEaten, out IMoniker ppmkOut);
  /*[id(0x6003000E)]*/ int IsSystemMoniker(out uint pdwMksys);
}

interface IPersistStream : IPersist {
  mixin(uuid("00000109-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00000109, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60020000)]*/ int IsDirty();
  /*[id(0x60020001)]*/ int Load(IStream pstm);
  /*[id(0x60020002)]*/ int Save(IStream pstm, int fClearDirty);
  /*[id(0x60020003)]*/ int GetSizeMax(out _ULARGE_INTEGER pcbSize);
}

interface IPersist : IUnknown {
  mixin(uuid("0000010c-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x0000010c, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int GetClassID(out DWINGUID pClassID);
}

/+
interface IStream : ISequentialStream {
  mixin(uuid("0000000c-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x0000000c, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
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
+/

interface ISequentialStream : IUnknown {
  mixin(uuid("0c733a30-2a1c-11ce-ade5-00aa0044773d"));
  // static DWINGUID IID = { 0x0c733a30, 0x2a1c, 0x11ce, 0xad, 0xe5, 0x00, 0xaa, 0x00, 0x44, 0x77, 0x3d };
  /*[id(0x60010000)]*/ int RemoteRead(out ubyte pv, uint cb, out uint pcbRead);
  /*[id(0x60010001)]*/ int RemoteWrite(ubyte* pv, uint cb, out uint pcbWritten);
}

interface IBindCtx : IUnknown {
  mixin(uuid("0000000e-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x0000000e, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RegisterObjectBound(IUnknown punk);
  /*[id(0x60010001)]*/ int RevokeObjectBound(IUnknown punk);
  /*[id(0x60010002)]*/ int ReleaseBoundObjects();
  /*[id(0x60010003)]*/ int RemoteSetBindOptions(tagBIND_OPTS2* pbindopts);
  /*[id(0x60010004)]*/ int RemoteGetBindOptions(ref tagBIND_OPTS2 pbindopts);
  /*[id(0x60010005)]*/ int GetRunningObjectTable(out IRunningObjectTable pprot);
  /*[id(0x60010006)]*/ int RegisterObjectParam(wchar* pszKey, IUnknown punk);
  /*[id(0x60010007)]*/ int GetObjectParam(wchar* pszKey, out IUnknown ppunk);
  /*[id(0x60010008)]*/ int EnumObjectParam(out IEnumString ppenum);
  /*[id(0x60010009)]*/ int RevokeObjectParam(wchar* pszKey);
}

interface IRunningObjectTable : IUnknown {
  mixin(uuid("00000010-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00000010, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int Register(uint grfFlags, IUnknown punkObject, IMoniker pmkObjectName, out uint pdwRegister);
  /*[id(0x60010001)]*/ int Revoke(uint dwRegister);
  /*[id(0x60010002)]*/ int IsRunning(IMoniker pmkObjectName);
  /*[id(0x60010003)]*/ int GetObject(IMoniker pmkObjectName, out IUnknown ppunkObject);
  /*[id(0x60010004)]*/ int NoteChangeTime(uint dwRegister, _FILETIME* pfiletime);
  /*[id(0x60010005)]*/ int GetTimeOfLastChange(IMoniker pmkObjectName, out _FILETIME pfiletime);
  /*[id(0x60010006)]*/ int EnumRunning(out IEnumMoniker ppenumMoniker);
}

interface IEnumMoniker : IUnknown {
  mixin(uuid("00000102-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00000102, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RemoteNext(uint celt, out IMoniker rgelt, out uint pceltFetched);
  /*[id(0x60010001)]*/ int Skip(uint celt);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IEnumMoniker ppenum);
}

interface IEnumString : IUnknown {
  mixin(uuid("00000101-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00000101, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RemoteNext(uint celt, out wchar* rgelt, out uint pceltFetched);
  /*[id(0x60010001)]*/ int Skip(uint celt);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IEnumString ppenum);
}

interface IOleContainer : IParseDisplayName {
  mixin(uuid("0000011b-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x0000011b, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60020000)]*/ int EnumObjects(uint grfFlags, out IEnumUnknown ppenum);
  /*[id(0x60020001)]*/ int LockContainer(int fLock);
}

interface IParseDisplayName : IUnknown {
  mixin(uuid("0000011a-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x0000011a, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int ParseDisplayName(IBindCtx pbc, wchar* pszDisplayName, out uint pchEaten, out IMoniker ppmkOut);
}


// d-programming-language-china.org conflict with juno.com.core
interface IEnumUnknown : IUnknown {
  mixin(uuid("00000100-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00000100, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RemoteNext(uint celt, out IUnknown rgelt, out uint pceltFetched);
  /*[id(0x60010001)]*/ int Skip(uint celt);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IEnumUnknown ppenum);
}


// DirectAnimation View Preferences
interface IDAPreferences : IDispatch {
  mixin(uuid("69b5bc70-9b19-11d0-9b60-00c04fc2f51d"));
  // static DWINGUID IID = { 0x69b5bc70, 0x9b19, 0x11d0, 0x9b, 0x60, 0x00, 0xc0, 0x4f, 0xc2, 0xf5, 0x1d };
  /*[id(0x60020000)]*/ int PutPreference(wchar* preferenceName, DWINVARIANT value);
  /*[id(0x60020001)]*/ int GetPreference(wchar* preferenceName, out DWINVARIANT value);
  /*[id(0x60020002)]*/ int Propagate();
}

// DirectAnimation DrawingSurface interface
interface IDADrawingSurface : IDispatch {
  mixin(uuid("bc0bfd34-d21d-11d0-9385-00c04fb6bd36"));
  // static DWINGUID IID = { 0xbc0bfd34, 0xd21d, 0x11d0, 0x93, 0x85, 0x00, 0xc0, 0x4f, 0xb6, 0xbd, 0x36 };
  /*[id(0x60020000)]*/ int get_Image(out IDAImage img);
  /*[id(0x60020001)]*/ int set_LineStyle(IDALineStyle value);
  /*[id(0x60020002)]*/ int set_BorderStyle(IDALineStyle value);
  /*[id(0x60020003)]*/ int set_FontStyle(IDAFontStyle value);
  /*[id(0x60020004)]*/ int set_ClipMatte(IDAMatte value);
  /*[id(0x60020005)]*/ int set_MouseEventsEnabled(short value);
  /*[id(0x60020006)]*/ int set_HatchFillTransparent(short value);
  /*[id(0x60020007)]*/ int get_LocalContextImage(out IDAImage img);
  /*[id(0x60020008)]*/ int Reset();
  /*[id(0x60020009)]*/ int Clear();
  /*[id(0x6002000A)]*/ int SaveGraphicsState();
  /*[id(0x6002000B)]*/ int RestoreGraphicsState();
  /*[id(0x6002000C)]*/ int Opacity(double opac);
  /*[id(0x6002000D)]*/ int OpacityAnim(IDANumber opac);
  /*[id(0x6002000E)]*/ int Crop(double lowerLeftX, double lowerLeftY, double upperRightX, double upperRightY);
  /*[id(0x6002000F)]*/ int CropPoints(IDAPoint2 Min, IDAPoint2 Max);
  /*[id(0x60020010)]*/ int Transform(IDATransform2 xform);
  /*[id(0x60020011)]*/ int LineColor(IDAColor clr);
  /*[id(0x60020012)]*/ int LineWidth(double w);
  /*[id(0x60020013)]*/ int LineDashStyle(DA_DASH_STYLE id);
  /*[id(0x60020014)]*/ int LineEndStyle(DA_END_STYLE id);
  /*[id(0x60020015)]*/ int LineJoinStyle(DA_JOIN_STYLE id);
  /*[id(0x60020016)]*/ int BorderColor(IDAColor clr);
  /*[id(0x60020017)]*/ int BorderWidth(double w);
  /*[id(0x60020018)]*/ int BorderDashStyle(DA_DASH_STYLE id);
  /*[id(0x60020019)]*/ int BorderEndStyle(DA_END_STYLE obsolete);
  /*[id(0x6002001A)]*/ int BorderJoinStyle(DA_JOIN_STYLE id);
  /*[id(0x6002001B)]*/ int Font(wchar* FontFace, int sizeInPoints, short Bold, short Italic, short Underline, short Strikethrough);
  /*[id(0x6002001C)]*/ int TextureFill(IDAImage obsolete1, double obsolete2, double obsolete3);
  /*[id(0x6002001D)]*/ int ImageFill(IDAImage obsolete1, double obsolete2, double obsolete3);
  /*[id(0x6002001E)]*/ int FillTexture(IDAImage img);
  /*[id(0x6002001F)]*/ int FillImage(IDAImage img);
  /*[id(0x60020020)]*/ int FillStyle(int id);
  /*[id(0x60020021)]*/ int FillColor(IDAColor foreground);
  /*[id(0x60020022)]*/ int SecondaryFillColor(IDAColor val);
  /*[id(0x60020023)]*/ int GradientShape(DWINVARIANT pts);
  /*[id(0x60020024)]*/ int GradientExtent(double startx, double starty, double finishx, double finishy);
  /*[id(0x60020025)]*/ int GradientExtentPoints(IDAPoint2 startColor, IDAPoint2 stopColor);
  /*[id(0x60020026)]*/ int GradientRolloffPower(double power);
  /*[id(0x60020027)]*/ int GradientRolloffPowerAnim(IDANumber power);
  /*[id(0x60020028)]*/ int FixedFillScale();
  /*[id(0x60020029)]*/ int HorizontalFillScale();
  /*[id(0x6002002A)]*/ int VerticalFillScale();
  /*[id(0x6002002B)]*/ int AutoSizeFillScale();
  /*[id(0x6002002C)]*/ int PolylineEx(int numPts, IDAPoint2* pts);
  /*[id(0x6002002D)]*/ int Polyline(DWINVARIANT v);
  /*[id(0x6002002E)]*/ int PolygonEx(int numPts, IDAPoint2* pts);
  /*[id(0x6002002F)]*/ int Polygon(DWINVARIANT v);
  /*[id(0x60020030)]*/ int LinePoints(IDAPoint2 p1, IDAPoint2 p2);
  /*[id(0x60020031)]*/ int Line(double startx, double starty, double endX, double endY);
  /*[id(0x60020032)]*/ int ArcRadians(double xPos, double yPos, double startAngle, double endAngle, double arcWidth, double arcHeight);
  /*[id(0x60020033)]*/ int ArcDegrees(double xPos, double yPos, double startAngle, double endAngle, double arcWidth, double arcHeight);
  /*[id(0x60020034)]*/ int Oval(double xPos, double yPos, double w, double h);
  /*[id(0x60020035)]*/ int Rect(double xPos, double yPos, double w, double h);
  /*[id(0x60020036)]*/ int RoundRect(double xPos, double yPos, double w, double h, double arcWidth, double arcHeight);
  /*[id(0x60020037)]*/ int PieRadians(double xPos, double yPos, double startAngle, double endAngle, double arcWidth, double arcHeight);
  /*[id(0x60020038)]*/ int PieDegrees(double xPos, double yPos, double startAngle, double endAngle, double arcWidth, double arcHeight);
  /*[id(0x60020039)]*/ int Text(wchar* str, double xPos, double yPos);
  /*[id(0x6002003A)]*/ int TextPoint(wchar* str, IDAPoint2 point);
  /*[id(0x6002003B)]*/ int FillPath(IDAPath2 path);
  /*[id(0x6002003C)]*/ int DrawPath(IDAPath2 path);
  /*[id(0x6002003D)]*/ int OverlayImage(IDAImage img);
}

// DirectAnimation LineStyle Behavior
interface IDALineStyle : IDABehavior {
  mixin(uuid("c46c1bf1-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID IID = { 0xc46c1bf1, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  /*[id(0x60030000)]*/ int End(IDAEndStyle obsolete_0, out IDALineStyle obsolete_1);
  /*[id(0x60030001)]*/ int Join(IDAJoinStyle obsolete_0, out IDALineStyle obsolete_1);
  /*[id(0x60030002)]*/ int Dash(IDADashStyle obsolete_0, out IDALineStyle obsolete_1);
  /*[id(0x60030003)]*/ int WidthAnim(IDANumber sty_0, out IDALineStyle ret_1);
  /*[id(0x60030004)]*/ int width(double sty_0, out IDALineStyle ret_1);
  /*[id(0x60030005)]*/ int AntiAliasing(double aaStyle_0, out IDALineStyle ret_1);
  /*[id(0x60030006)]*/ int Detail(out IDALineStyle ret_0);
  /*[id(0x60030007)]*/ int Color(IDAColor clr_0, out IDALineStyle ret_1);
}

// DirectAnimation EndStyle Behavior
interface IDAEndStyle : IDABehavior {
  mixin(uuid("c46c1beb-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID IID = { 0xc46c1beb, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
}

// DirectAnimation JoinStyle Behavior
interface IDAJoinStyle : IDABehavior {
  mixin(uuid("c46c1bed-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID IID = { 0xc46c1bed, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
}

// DirectAnimation DashStyle Behavior
interface IDADashStyle : IDABehavior {
  mixin(uuid("c46c1bef-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID IID = { 0xc46c1bef, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
}

// DirectAnimation FontStyle Behavior
interface IDAFontStyle : IDABehavior {
  mixin(uuid("25b0f91d-d23d-11d0-9b85-00c04fc2f51d"));
  // static DWINGUID IID = { 0x25b0f91d, 0xd23d, 0x11d0, 0x9b, 0x85, 0x00, 0xc0, 0x4f, 0xc2, 0xf5, 0x1d };
  /*[id(0x60030000)]*/ int Bold(out IDAFontStyle ret_0);
  /*[id(0x60030001)]*/ int Italic(out IDAFontStyle ret_0);
  /*[id(0x60030002)]*/ int Underline(out IDAFontStyle ret_0);
  /*[id(0x60030003)]*/ int Strikethrough(out IDAFontStyle ret_0);
  /*[id(0x60030004)]*/ int AntiAliasing(double aaStyle_0, out IDAFontStyle ret_1);
  /*[id(0x60030005)]*/ int Color(IDAColor col_0, out IDAFontStyle ret_1);
  /*[id(0x60030006)]*/ int FamilyAnim(IDAString face_0, out IDAFontStyle ret_1);
  /*[id(0x60030007)]*/ int Family(wchar* face_0, out IDAFontStyle ret_1);
  /*[id(0x60030008)]*/ int SizeAnim(IDANumber size_0, out IDAFontStyle ret_1);
  /*[id(0x60030009)]*/ int Size(double size_0, out IDAFontStyle ret_1);
  /*[id(0x6003000A)]*/ int Weight(double weight_0, out IDAFontStyle ret_1);
  /*[id(0x6003000B)]*/ int WeightAnim(IDANumber weight_0, out IDAFontStyle ret_1);
}

// DirectAnimation Path2 Behavior
interface IDAPath2 : IDABehavior {
  mixin(uuid("c46c1bcf-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID IID = { 0xc46c1bcf, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  /*[id(0x60030000)]*/ int Transform(IDATransform2 xf_0, out IDAPath2 ret_1);
  /*[id(0x60030001)]*/ int BoundingBox(IDALineStyle style_0, out IDABbox2 ret_1);
  /*[id(0x60030002)]*/ int Fill(IDALineStyle border_0, IDAImage fill_1, out IDAImage ret_2);
  /*[id(0x60030003)]*/ int Draw(IDALineStyle border_0, out IDAImage ret_1);
  /*[id(0x60030004)]*/ int Close(out IDAPath2 ret_0);
}

// DirectAnimation Behavior2
interface IDA2Behavior : IDABehavior {
  mixin(uuid("9caddc0c-ad56-11d1-9ff8-00c04fa32195"));
  // static DWINGUID IID = { 0x9caddc0c, 0xad56, 0x11d1, 0x9f, 0xf8, 0x00, 0xc0, 0x4f, 0xa3, 0x21, 0x95 };
  /*[id(0x60030000)]*/ int SwitchToEx(IDABehavior newBvr, uint dwFlags);
  /*[id(0x60030001)]*/ int ApplyPreference(wchar* pref, DWINVARIANT val, out IDABehavior bvr);
  /*[id(0x60030002)]*/ int ExtendedAttrib(wchar* arg1, DWINVARIANT arg2, out IDABehavior ppResult);
}

// DirectAnimation Import Interface
interface IDAImport : IDABehavior {
  mixin(uuid("fc54beaa-5b12-11d1-8e7b-00c04fc29d46"));
  // static DWINGUID IID = { 0xfc54beaa, 0x5b12, 0x11d1, 0x8e, 0x7b, 0x00, 0xc0, 0x4f, 0xc2, 0x9d, 0x46 };
  /*[id(0x60030000)]*/ int ImportStatus(out int status);
  /*[id(0x60030001)]*/ int ImportCancel();
  // The import priority
  /*[id(0x60030002)]*/ int get_ImportPriority(out float prio);
  // The import priority
  /*[id(0x60030002)]*/ int set_ImportPriority(float prio);
}

// DirectAnimation Modifiable Behavior Interface
interface IDAModifiableBehavior : IDABehavior {
  mixin(uuid("fc54beab-5b12-11d1-8e7b-00c04fc29d46"));
  // static DWINGUID IID = { 0xfc54beab, 0x5b12, 0x11d1, 0x8e, 0x7b, 0x00, 0xc0, 0x4f, 0xc2, 0x9d, 0x46 };
  // The current behavior
  /*[id(0x60030000)]*/ int get_CurrentBehavior(out IDABehavior bvr);
  // The current behavior
  /*[id(0x60030000)]*/ int set_CurrentBehavior(DWINVARIANT bvr);
  /*[id(0x60030002)]*/ int SwitchToEx(IDABehavior newBvr, uint dwFlags);
}

// DirectAnimation Montage Behavior
interface IDAMontage : IDABehavior {
  mixin(uuid("c46c1bd5-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID IID = { 0xc46c1bd5, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  /*[id(0x60030000)]*/ int Render(out IDAImage ret_0);
}

// DirectAnimation Vector2 Behavior
interface IDAVector2 : IDABehavior {
  mixin(uuid("c46c1bc9-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID IID = { 0xc46c1bc9, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  /*[id(0x60030000)]*/ int get_Length(out IDANumber ret_0);
  /*[id(0x60030001)]*/ int get_LengthSquared(out IDANumber ret_0);
  /*[id(0x60030002)]*/ int Normalize(out IDAVector2 ret_0);
  /*[id(0x60030003)]*/ int MulAnim(IDANumber scalar_0, out IDAVector2 ret_1);
  /*[id(0x60030004)]*/ int Mul(double scalar_0, out IDAVector2 ret_1);
  /*[id(0x60030005)]*/ int DivAnim(IDANumber scalar_0, out IDAVector2 ret_1);
  /*[id(0x60030006)]*/ int Div(double scalar_0, out IDAVector2 ret_1);
  /*[id(0x60030007)]*/ int get_X(out IDANumber ret_0);
  /*[id(0x60030008)]*/ int get_Y(out IDANumber ret_0);
  /*[id(0x60030009)]*/ int get_PolarCoordAngle(out IDANumber ret_0);
  /*[id(0x6003000A)]*/ int get_PolarCoordLength(out IDANumber ret_0);
  /*[id(0x6003000B)]*/ int Transform(IDATransform2 xf_0, out IDAVector2 ret_1);
}

// DirectAnimation Vector3 Behavior
interface IDAVector3 : IDABehavior {
  mixin(uuid("c46c1bd9-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID IID = { 0xc46c1bd9, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  /*[id(0x60030000)]*/ int get_Length(out IDANumber ret_0);
  /*[id(0x60030001)]*/ int get_LengthSquared(out IDANumber ret_0);
  /*[id(0x60030002)]*/ int Normalize(out IDAVector3 ret_0);
  /*[id(0x60030003)]*/ int MulAnim(IDANumber scalar_0, out IDAVector3 ret_1);
  /*[id(0x60030004)]*/ int Mul(double scalar_0, out IDAVector3 ret_1);
  /*[id(0x60030005)]*/ int DivAnim(IDANumber scalar_0, out IDAVector3 ret_1);
  /*[id(0x60030006)]*/ int Div(double scalar_0, out IDAVector3 ret_1);
  /*[id(0x60030007)]*/ int get_X(out IDANumber ret_0);
  /*[id(0x60030008)]*/ int get_Y(out IDANumber ret_0);
  /*[id(0x60030009)]*/ int get_Z(out IDANumber ret_0);
  /*[id(0x6003000A)]*/ int get_SphericalCoordXYAngle(out IDANumber ret_0);
  /*[id(0x6003000B)]*/ int get_SphericalCoordYZAngle(out IDANumber ret_0);
  /*[id(0x6003000C)]*/ int get_SphericalCoordLength(out IDANumber ret_0);
  /*[id(0x6003000D)]*/ int Transform(IDATransform3 xf_0, out IDAVector3 ret_1);
}

// DirectAnimation Pair Behavior
interface IDAPair : IDABehavior {
  mixin(uuid("c46c1bf3-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID IID = { 0xc46c1bf3, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  /*[id(0x60030000)]*/ int get_First(out IDABehavior ret_0);
  /*[id(0x60030001)]*/ int get_Second(out IDABehavior ret_0);
}

// DirectAnimation Array Behavior
interface IDAArray : IDABehavior {
  mixin(uuid("d17506c2-6b26-11d0-8914-00c04fc2a0ca"));
  // static DWINGUID IID = { 0xd17506c2, 0x6b26, 0x11d0, 0x89, 0x14, 0x00, 0xc0, 0x4f, 0xc2, 0xa0, 0xca };
  /*[id(0x60030000)]*/ int NthAnim(IDANumber index_0, out IDABehavior ret_1);
  /*[id(0x60030001)]*/ int Length(out IDANumber ret_0);
}

// DirectAnimation Tuple Behavior
interface IDATuple : IDABehavior {
  mixin(uuid("5dfb2650-9668-11d0-b17b-00c04fc2a0ca"));
  // static DWINGUID IID = { 0x5dfb2650, 0x9668, 0x11d0, 0xb1, 0x7b, 0x00, 0xc0, 0x4f, 0xc2, 0xa0, 0xca };
  /*[id(0x60030000)]*/ int Nth(int index_0, out IDABehavior ret_1);
  /*[id(0x60030001)]*/ int get_Length(out int ret_0);
}

// DirectAnimation Userdata Behavior
interface IDAUserData : IDABehavior {
  mixin(uuid("af868305-ab0b-11d0-876a-00c04fc29d46"));
  // static DWINGUID IID = { 0xaf868305, 0xab0b, 0x11d0, 0x87, 0x6a, 0x00, 0xc0, 0x4f, 0xc2, 0x9d, 0x46 };
  /*[id(0x60030000)]*/ int get_Data(out IUnknown ret_0);
}

// DirectAnimation Geometry Behavior
interface IDA2Geometry : IDAGeometry {
  mixin(uuid("b90e5258-574a-11d1-8e7b-00c04fc29d46"));
  // static DWINGUID IID = { 0xb90e5258, 0x574a, 0x11d1, 0x8e, 0x7b, 0x00, 0xc0, 0x4f, 0xc2, 0x9d, 0x46 };
  /*[id(0x60040000)]*/ int AddPickData(IUnknown id_0, short ignoresOcclusion_1, out IDAGeometry ret_2);
  /*[id(0x60040001)]*/ int Shadow(IDAGeometry geoContainingLights_0, IDAPoint3 planePoint_1, IDAVector3 planeNormal_2, out IDAGeometry ret_3);
  /*[id(0x60040002)]*/ int LightRangeAnim(IDANumber range_0, out IDAGeometry ret_1);
  /*[id(0x60040003)]*/ int LightRange(double range_0, out IDAGeometry ret_1);
  /*[id(0x60040004)]*/ int BlendTextureDiffuse(IDABoolean blended_0, out IDAGeometry ret_1);
  /*[id(0x60040005)]*/ int AmbientColor(IDAColor color_0, out IDAGeometry ret_1);
  /*[id(0x60040006)]*/ int D3DRMTexture(IUnknown rmTex_0, out IDAGeometry ret_1);
  /*[id(0x60040007)]*/ int ModelClip(IDAPoint3 planePt_0, IDAVector3 planeVec_1, out IDAGeometry ret_2);
  /*[id(0x60040008)]*/ int Lighting(IDABoolean lighting_0, out IDAGeometry ret_1);
  /*[id(0x60040009)]*/ int TextureImage(IDAImage texture_0, out IDAGeometry ret_1);
}

// DirectAnimation Image Behavior
interface IDA2Image : IDAImage {
  mixin(uuid("b90e5259-574a-11d1-8e7b-00c04fc29d46"));
  // static DWINGUID IID = { 0xb90e5259, 0x574a, 0x11d1, 0x8e, 0x7b, 0x00, 0xc0, 0x4f, 0xc2, 0x9d, 0x46 };
  /*[id(0x60040000)]*/ int AddPickData(IUnknown id_0, short ignoresOcclusion_1, out IDAImage ret_2);
  /*[id(0x60040001)]*/ int RenderResolution(int width_0, int height_1, out IDAImage ret_2);
  /*[id(0x60040002)]*/ int ImageQuality(uint dwQualityFlags_0, out IDAImage ret_1);
  /*[id(0x60040003)]*/ int ColorKey(IDAColor colorKey_0, out IDAImage ret_1);
}

// DirectAnimation FontStyle Behavior
interface IDA2FontStyle : IDAFontStyle {
  mixin(uuid("960d8eff-e494-11d1-ab75-00c04fd92b6b"));
  // static DWINGUID IID = { 0x960d8eff, 0xe494, 0x11d1, 0xab, 0x75, 0x00, 0xc0, 0x4f, 0xd9, 0x2b, 0x6b };
  /*[id(0x60040000)]*/ int TransformCharacters(IDATransform2 transform_0, out IDAFontStyle ret_1);
}

// DirectAnimation LineStyle Behavior
interface IDA2LineStyle : IDALineStyle {
  mixin(uuid("5f00f545-df18-11d1-ab6f-00c04fd92b6b"));
  // static DWINGUID IID = { 0x5f00f545, 0xdf18, 0x11d1, 0xab, 0x6f, 0x00, 0xc0, 0x4f, 0xd9, 0x2b, 0x6b };
  /*[id(0x60040000)]*/ int DashStyle(uint ds_enum_0, out IDALineStyle ret_1);
  /*[id(0x60040001)]*/ int MiterLimit(double mtrlim_0, out IDALineStyle ret_1);
  /*[id(0x60040002)]*/ int MiterLimitAnim(IDANumber mtrlim_0, out IDALineStyle ret_1);
  /*[id(0x60040003)]*/ int JoinStyle(uint js_enum_0, out IDALineStyle ret_1);
  /*[id(0x60040004)]*/ int EndStyle(uint es_enum_0, out IDALineStyle ret_1);
}

// DirectAnimation Event Behavior
interface IDA2Event : IDAEvent {
  mixin(uuid("b90e525a-574a-11d1-8e7b-00c04fc29d46"));
  // static DWINGUID IID = { 0xb90e525a, 0x574a, 0x11d1, 0x8e, 0x7b, 0x00, 0xc0, 0x4f, 0xc2, 0x9d, 0x46 };
  /*[id(0x60040000)]*/ int NotifyScript(wchar* scriptlet_0, out IDAEvent ret_1);
}

// DirectAnimation Array Behavior
interface IDA2Array : IDAArray {
  mixin(uuid("2a8f0b06-be2b-11d1-b219-00c04fc2a0ca"));
  // static DWINGUID IID = { 0x2a8f0b06, 0xbe2b, 0x11d1, 0xb2, 0x19, 0x00, 0xc0, 0x4f, 0xc2, 0xa0, 0xca };
  /*[id(0x60040000)]*/ int AddElement(IDABehavior b_0, uint flag_1, out int ret_2);
  /*[id(0x60040001)]*/ int RemoveElement(int i_0);
}

// DirectAnimation Color Behavior
interface IDA2Color : IDAColor {
  mixin(uuid("28a4b924-61fe-11d2-a740-00c04f79754c"));
  // static DWINGUID IID = { 0x28a4b924, 0x61fe, 0x11d2, 0xa7, 0x40, 0x00, 0xc0, 0x4f, 0x79, 0x75, 0x4c };
  /*[id(0x60040000)]*/ int AnimateProperty(wchar* propertyPath_0, wchar* scriptingLanguage_1, short invokeAsMethod_2, double minUpdateInterval_3, out IDA2Color ret_4);
}

// DirectAnimation Geometry Behavior
interface IDA3Geometry : IDA2Geometry {
  mixin(uuid("eb5093c7-56f9-11d2-88ce-00c04fa35859"));
  // static DWINGUID IID = { 0xeb5093c7, 0x56f9, 0x11d2, 0x88, 0xce, 0x00, 0xc0, 0x4f, 0xa3, 0x58, 0x59 };
  /*[id(0x60050000)]*/ int Billboard(IDAVector3 axis_0, out IDAGeometry ret_1);
}

// DirectAnimation Image Behavior
interface IDA3Image : IDA2Image {
  mixin(uuid("ad083dbb-5817-11d2-aba1-00c04fd92b6b"));
  // static DWINGUID IID = { 0xad083dbb, 0x5817, 0x11d2, 0xab, 0xa1, 0x00, 0xc0, 0x4f, 0xd9, 0x2b, 0x6b };
  /*[id(0x60050000)]*/ int TransformColorRGB(IDATransform3 xf_0, out IDAImage ret_1);
}

// DirectAnimation Array3
interface IDA3Array : IDA2Array {
  mixin(uuid("3089d9a0-4ce1-11d2-933e-00a0c9b72d4d"));
  // static DWINGUID IID = { 0x3089d9a0, 0x4ce1, 0x11d2, 0x93, 0x3e, 0x00, 0xa0, 0xc9, 0xb7, 0x2d, 0x4d };
  /*[id(0x60050000)]*/ int SetElement(int index, IDABehavior b, int flag);
  /*[id(0x60050001)]*/ int GetElement(int index, out IDABehavior ret);
}

// DirectAnimation View2
interface IDA2View : IDAView {
  mixin(uuid("2ae71568-4b34-11d1-b1e3-00c04fc2a0ca"));
  // static DWINGUID IID = { 0x2ae71568, 0x4b34, 0x11d1, 0xb1, 0xe3, 0x00, 0xc0, 0x4f, 0xc2, 0xa0, 0xca };
  /*[id(0x60030000)]*/ int QueryHitPointEx(int s, ULONG_PTR* cookies, double* points, tagRECT* prcBounds, tagPOINT ptLoc, out int hits);
  /*[id(0x60030001)]*/ int StartModelEx(IDAImage pImage, IDASound pSound, double startTime, uint dwFlags);
  /*[id(0x60030002)]*/ int GetDDD3DRM(out IUnknown directDraw, out IUnknown d3drm);
  /*[id(0x60030003)]*/ int GetRMDevice(out IUnknown d3drmDevice, out uint sequenceNumber);
  /*[id(0x60030004)]*/ int GetInvalidatedRects(uint Flags, int s, tagRECT* pRects, out int pNumRects);
}

// DirectAnimation View3
interface IDA3View : IDA2View {
  mixin(uuid("d5570790-57e2-11d2-933f-00a0c9b72d4d"));
  // static DWINGUID IID = { 0xd5570790, 0x57e2, 0x11d2, 0x93, 0x3f, 0x00, 0xa0, 0xc9, 0xb7, 0x2d, 0x4d };
  /*[id(0x60040000)]*/ int Pause();
  /*[id(0x60040001)]*/ int Resume();
  /*[id(0x60040002)]*/ int OnMouseLeave(double when);
  // The window to display the view in.
  /*[id(0x60040003)]*/ int get_Window2(out wireHWND hwnd);
  // The window to display the view in.
  /*[id(0x60040003)]*/ int set_Window2(wireHWND hwnd);
}

// DirectAnimation View Object Events
interface _IDAViewEvents : IDispatch {
  mixin(uuid("89131312-7806-11d2-8bee-00c04fc2f51d"));
  // static DWINGUID IID = { 0x89131312, 0x7806, 0x11d2, 0x8b, 0xee, 0x00, 0xc0, 0x4f, 0xc2, 0xf5, 0x1d };
  /+/*[id(0x00002001)]*/ void Start();+/
  /+/*[id(0x00002002)]*/ void Stop();+/
  /+/*[id(0x00002003)]*/ void OnMouseMove(double when, int xPos, int yPos, int modifiers);+/
  /+/*[id(0x00002004)]*/ void OnMouseButton(double when, int xPos, int yPos, int button, short bPressed, int modifiers);+/
  /+/*[id(0x00002005)]*/ void OnKey(double when, int key, short bPressed, int modifiers);+/
  /+/*[id(0x00002006)]*/ void OnFocus(short bHasFocus);+/
  /+/*[id(0x00002007)]*/ void Pause();+/
  /+/*[id(0x00002008)]*/ void Resume();+/
  /+/*[id(0x00002009)]*/ void Error(int HResult, wchar* ErrorString);+/
}

// DirectAnimation Site interface
interface IDASite : IDispatch {
  mixin(uuid("45393df0-54b9-11cf-92a2-00aa00b8a733"));
  // static DWINGUID IID = { 0x45393df0, 0x54b9, 0x11cf, 0x92, 0xa2, 0x00, 0xaa, 0x00, 0xb8, 0xa7, 0x33 };
  /*[id(0x60020000)]*/ int SetStatusText(wchar* StatusText);
  /*[id(0x60020001)]*/ int ReportError(int hr, wchar* ErrorText);
  /*[id(0x60020002)]*/ int ReportGC(short bStarting);
}

// DirectAnimation Importation Result
interface IDAImportationResult : IDispatch {
  mixin(uuid("4a933702-e36f-11d0-9b99-00c04fc2f51d"));
  // static DWINGUID IID = { 0x4a933702, 0xe36f, 0x11d0, 0x9b, 0x99, 0x00, 0xc0, 0x4f, 0xc2, 0xf5, 0x1d };
  // Image from import
  /*[id(0x60020000)]*/ int get_Image(out IDAImage ppImage);
  // Sound from import
  /*[id(0x60020001)]*/ int get_Sound(out IDASound ppSound);
  // Geometry from import
  /*[id(0x60020002)]*/ int get_Geometry(out IDAGeometry ppGeometry);
  // Media duration in seconds
  /*[id(0x60020003)]*/ int get_Duration(out IDANumber ppDuration);
  // Event that fires on download completion
  /*[id(0x60020004)]*/ int get_CompletionEvent(out IDAEvent ppCompletionEvent);
  // Percentage progress (from 0 to 1).
  /*[id(0x60020005)]*/ int get_Progress(out IDANumber ppProgress);
  // Media size in bytes
  /*[id(0x60020006)]*/ int get_Size(out IDANumber ppSizeInBytes);
}

// DirectAnimation DXTransform Application Result
interface IDADXTransformResult : IDispatch {
  mixin(uuid("bacd4d86-4a4f-11d1-9bc8-00c04fc2f51d"));
  // static DWINGUID IID = { 0xbacd4d86, 0x4a4f, 0x11d1, 0x9b, 0xc8, 0x00, 0xc0, 0x4f, 0xc2, 0xf5, 0x1d };
  // Resulting geometry
  /*[id(0x60020000)]*/ int get_OutputBvr(out IDABehavior ppOutputBvr);
  // IDispatch of the IDXTransform
  /*[id(0x60020001)]*/ int get_TheTransform(out IDispatch ppTheTransform);
  // Attach a behavior to a property of the transform.
  /*[id(0x60020002)]*/ int PutBvrAsProperty(wchar* property, IDABehavior bvr);
}

// DirectAnimation Statics
interface IDAStatics : IDispatch {
  mixin(uuid("542fb452-5003-11cf-92a2-00aa00b8a733"));
  // static DWINGUID IID = { 0x542fb452, 0x5003, 0x11cf, 0x92, 0xa2, 0x00, 0xaa, 0x00, 0xb8, 0xa7, 0x33 };
  /*[id(0x60020000)]*/ int get_VersionString(out wchar* str);
  /*[id(0x60020001)]*/ int get_Site(out IDASite pSite);
  /*[id(0x60020001)]*/ int set_Site(IDASite pSite);
  /*[id(0x60020003)]*/ int set_ClientSite(IOleClientSite pClientSite);
  /*[id(0x60020003)]*/ int get_ClientSite(out IOleClientSite pClientSite);
  /*[id(0x60020005)]*/ int set_PixelConstructionMode(short bMode);
  /*[id(0x60020005)]*/ int get_PixelConstructionMode(out short bMode);
  /*[id(0x60020007)]*/ int TriggerEvent(IDAEvent event, IDABehavior Data);
  /*[id(0x60020008)]*/ int NewDrawingSurface(out IDADrawingSurface pds);
  /*[id(0x60020009)]*/ int ImportMovie(wchar* url, out IDAImportationResult ppResult);
  /*[id(0x6002000A)]*/ int ImportMovieAsync(wchar* url, IDAImage pImageStandIn, IDASound pSoundStandIn, out IDAImportationResult ppResult);
  /*[id(0x6002000B)]*/ int ImportImage(wchar* url, out IDAImage ppImage);
  /*[id(0x6002000C)]*/ int ImportImageAsync(wchar* url, IDAImage pImageStandIn, out IDAImportationResult ppResult);
  /*[id(0x6002000D)]*/ int ImportImageColorKey(wchar* url, ubyte colorKeyRed, ubyte colorKeyGreen, ubyte colorKeyBlue, out IDAImage ppImage);
  /*[id(0x6002000E)]*/ int ImportImageAsyncColorKey(wchar* url, IDAImage pImageStandIn, ubyte colorKeyRed, ubyte colorKeyGreen, ubyte colorKeyBlue, out IDAImportationResult ppResult);
  /*[id(0x6002000F)]*/ int ImportSound(wchar* url, out IDAImportationResult ppResult);
  /*[id(0x60020010)]*/ int ImportSoundAsync(wchar* url, IDASound pSoundStandIn, out IDAImportationResult ppResult);
  /*[id(0x60020011)]*/ int ImportGeometry(wchar* url, out IDAGeometry ppGeometry);
  /*[id(0x60020012)]*/ int ImportGeometryAsync(wchar* url, IDAGeometry pGeoStandIn, out IDAImportationResult ppResult);
  /*[id(0x60020013)]*/ int ImportDirectDrawSurface(IUnknown dds, IDAEvent updateEvent, out IDAImage ppImage);
  /*[id(0x60020014)]*/ int Cond(IDABoolean c, IDABehavior i, IDABehavior e, out IDABehavior pCondBvr);
  /*[id(0x60020015)]*/ int DAArrayEx(int s, IDABehavior* pBvrs, out IDAArray bvr);
  /*[id(0x60020016)]*/ int DAArray(DWINVARIANT bvrs, out IDAArray bvr);
  /*[id(0x60020017)]*/ int DATupleEx(int s, IDABehavior* pBvrs, out IDATuple bvr);
  /*[id(0x60020018)]*/ int DATuple(DWINVARIANT bvrs, out IDATuple bvr);
  /*[id(0x60020019)]*/ int ModifiableBehavior(IDABehavior orig, out IDABehavior bvr);
  /*[id(0x6002001A)]*/ int UninitializedArray(IDAArray typeTmp, out IDAArray bvr);
  /*[id(0x6002001B)]*/ int UninitializedTuple(IDATuple typeTmp, out IDATuple bvr);
  /*[id(0x6002001C)]*/ int NumberBSplineEx(int degree, int numKnots, IDANumber* knots, int numPts, IDANumber* ctrlPts, int numWts, IDANumber* weights, IDANumber evaluator, out IDANumber bvr);
  /*[id(0x6002001D)]*/ int NumberBSpline(int degree, DWINVARIANT knots, DWINVARIANT ctrlPts, DWINVARIANT weights, IDANumber evaluator, out IDANumber bvr);
  /*[id(0x6002001E)]*/ int Point2BSplineEx(int degree, int numKnots, IDANumber* knots, int numPts, IDAPoint2* ctrlPts, int numWts, IDANumber* weights, IDANumber evaluator, out IDAPoint2 bvr);
  /*[id(0x6002001F)]*/ int Point2BSpline(int degree, DWINVARIANT knots, DWINVARIANT ctrlPts, DWINVARIANT weights, IDANumber evaluator, out IDAPoint2 bvr);
  /*[id(0x60020020)]*/ int Point3BSplineEx(int degree, int numKnots, IDANumber* knots, int numPts, IDAPoint3* ctrlPts, int numWts, IDANumber* weights, IDANumber evaluator, out IDAPoint3 bvr);
  /*[id(0x60020021)]*/ int Point3BSpline(int degree, DWINVARIANT knots, DWINVARIANT ctrlPts, DWINVARIANT weights, IDANumber evaluator, out IDAPoint3 bvr);
  /*[id(0x60020022)]*/ int Vector2BSplineEx(int degree, int numKnots, IDANumber* knots, int numPts, IDAVector2* ctrlPts, int numWts, IDANumber* weights, IDANumber evaluator, out IDAVector2 bvr);
  /*[id(0x60020023)]*/ int Vector2BSpline(int degree, DWINVARIANT knots, DWINVARIANT ctrlPts, DWINVARIANT weights, IDANumber evaluator, out IDAVector2 bvr);
  /*[id(0x60020024)]*/ int Vector3BSplineEx(int degree, int numKnots, IDANumber* knots, int numPts, IDAVector3* ctrlPts, int numWts, IDANumber* weights, IDANumber evaluator, out IDAVector3 bvr);
  /*[id(0x60020025)]*/ int Vector3BSpline(int degree, DWINVARIANT knots, DWINVARIANT ctrlPts, DWINVARIANT weights, IDANumber evaluator, out IDAVector3 bvr);
  /*[id(0x60020026)]*/ int Pow(IDANumber a_0, IDANumber b_1, out IDANumber ret_2);
  /*[id(0x60020027)]*/ int Abs(IDANumber a_0, out IDANumber ret_1);
  /*[id(0x60020028)]*/ int Sqrt(IDANumber a_0, out IDANumber ret_1);
  /*[id(0x60020029)]*/ int Floor(IDANumber a_0, out IDANumber ret_1);
  /*[id(0x6002002A)]*/ int Round(IDANumber a_0, out IDANumber ret_1);
  /*[id(0x6002002B)]*/ int Ceiling(IDANumber a_0, out IDANumber ret_1);
  /*[id(0x6002002C)]*/ int Asin(IDANumber a_0, out IDANumber ret_1);
  /*[id(0x6002002D)]*/ int Acos(IDANumber a_0, out IDANumber ret_1);
  /*[id(0x6002002E)]*/ int Atan(IDANumber a_0, out IDANumber ret_1);
  /*[id(0x6002002F)]*/ int Sin(IDANumber a_0, out IDANumber ret_1);
  /*[id(0x60020030)]*/ int Cos(IDANumber a_0, out IDANumber ret_1);
  /*[id(0x60020031)]*/ int Tan(IDANumber a_0, out IDANumber ret_1);
  /*[id(0x60020032)]*/ int Exp(IDANumber a_0, out IDANumber ret_1);
  /*[id(0x60020033)]*/ int Ln(IDANumber a_0, out IDANumber ret_1);
  /*[id(0x60020034)]*/ int Log10(IDANumber a_0, out IDANumber ret_1);
  /*[id(0x60020035)]*/ int ToDegrees(IDANumber a_0, out IDANumber ret_1);
  /*[id(0x60020036)]*/ int ToRadians(IDANumber a_0, out IDANumber ret_1);
  /*[id(0x60020037)]*/ int Mod(IDANumber a_0, IDANumber b_1, out IDANumber ret_2);
  /*[id(0x60020038)]*/ int Atan2(IDANumber a_0, IDANumber b_1, out IDANumber ret_2);
  /*[id(0x60020039)]*/ int Add(IDANumber a_0, IDANumber b_1, out IDANumber ret_2);
  /*[id(0x6002003A)]*/ int Sub(IDANumber a_0, IDANumber b_1, out IDANumber ret_2);
  /*[id(0x6002003B)]*/ int Mul(IDANumber a_0, IDANumber b_1, out IDANumber ret_2);
  /*[id(0x6002003C)]*/ int Div(IDANumber a_0, IDANumber b_1, out IDANumber ret_2);
  /*[id(0x6002003D)]*/ int LT(IDANumber a_0, IDANumber b_1, out IDABoolean ret_2);
  /*[id(0x6002003E)]*/ int LTE(IDANumber a_0, IDANumber b_1, out IDABoolean ret_2);
  /*[id(0x6002003F)]*/ int GT(IDANumber a_0, IDANumber b_1, out IDABoolean ret_2);
  /*[id(0x60020040)]*/ int GTE(IDANumber a_0, IDANumber b_1, out IDABoolean ret_2);
  /*[id(0x60020041)]*/ int EQ(IDANumber a_0, IDANumber b_1, out IDABoolean ret_2);
  /*[id(0x60020042)]*/ int NE(IDANumber a_0, IDANumber b_1, out IDABoolean ret_2);
  /*[id(0x60020043)]*/ int Neg(IDANumber a_0, out IDANumber ret_1);
  /*[id(0x60020044)]*/ int InterpolateAnim(IDANumber from_0, IDANumber to_1, IDANumber duration_2, out IDANumber ret_3);
  /*[id(0x60020045)]*/ int Interpolate(double from_0, double to_1, double duration_2, out IDANumber ret_3);
  /*[id(0x60020046)]*/ int SlowInSlowOutAnim(IDANumber from_0, IDANumber to_1, IDANumber duration_2, IDANumber sharpness_3, out IDANumber ret_4);
  /*[id(0x60020047)]*/ int SlowInSlowOut(double from_0, double to_1, double duration_2, double sharpness_3, out IDANumber ret_4);
  /*[id(0x60020048)]*/ int SoundSource(IDASound snd_0, out IDAGeometry ret_1);
  /*[id(0x60020049)]*/ int Mix(IDASound left_0, IDASound right_1, out IDASound ret_2);
  /*[id(0x6002004A)]*/ int And(IDABoolean a_0, IDABoolean b_1, out IDABoolean ret_2);
  /*[id(0x6002004B)]*/ int Or(IDABoolean a_0, IDABoolean b_1, out IDABoolean ret_2);
  /*[id(0x6002004C)]*/ int Not(IDABoolean a_0, out IDABoolean ret_1);
  /*[id(0x6002004D)]*/ int Integral(IDANumber b_0, out IDANumber ret_1);
  /*[id(0x6002004E)]*/ int Derivative(IDANumber b_0, out IDANumber ret_1);
  /*[id(0x6002004F)]*/ int IntegralVector2(IDAVector2 v_0, out IDAVector2 ret_1);
  /*[id(0x60020050)]*/ int IntegralVector3(IDAVector3 v_0, out IDAVector3 ret_1);
  /*[id(0x60020051)]*/ int DerivativeVector2(IDAVector2 v_0, out IDAVector2 ret_1);
  /*[id(0x60020052)]*/ int DerivativeVector3(IDAVector3 v_0, out IDAVector3 ret_1);
  /*[id(0x60020053)]*/ int DerivativePoint2(IDAPoint2 v_0, out IDAVector2 ret_1);
  /*[id(0x60020054)]*/ int DerivativePoint3(IDAPoint3 v_0, out IDAVector3 ret_1);
  /*[id(0x60020055)]*/ int KeyState(IDANumber n_0, out IDABoolean ret_1);
  /*[id(0x60020056)]*/ int KeyUp(int arg_0, out IDAEvent ret_1);
  /*[id(0x60020057)]*/ int KeyDown(int arg_0, out IDAEvent ret_1);
  /*[id(0x60020058)]*/ int DANumber(double num_0, out IDANumber ret_1);
  /*[id(0x60020059)]*/ int DAString(wchar* str_0, out IDAString ret_1);
  /*[id(0x6002005A)]*/ int DABoolean(short num_0, out IDABoolean ret_1);
  /*[id(0x6002005B)]*/ int SeededRandom(double arg_0, out IDANumber ret_1);
  /*[id(0x6002005C)]*/ int get_MousePosition(out IDAPoint2 ret_0);
  /*[id(0x6002005D)]*/ int get_LeftButtonState(out IDABoolean ret_0);
  /*[id(0x6002005E)]*/ int get_RightButtonState(out IDABoolean ret_0);
  /*[id(0x6002005F)]*/ int get_DATrue(out IDABoolean ret_0);
  /*[id(0x60020060)]*/ int get_DAFalse(out IDABoolean ret_0);
  /*[id(0x60020061)]*/ int get_LocalTime(out IDANumber ret_0);
  /*[id(0x60020062)]*/ int get_GlobalTime(out IDANumber ret_0);
  /*[id(0x60020063)]*/ int get_Pixel(out IDANumber ret_0);
  /*[id(0x60020064)]*/ int UserData(IUnknown data_0, out IDAUserData ret_1);
  /*[id(0x60020065)]*/ int UntilNotify(IDABehavior b0_0, IDAEvent event_1, IDAUntilNotifier notifier_2, out IDABehavior ret_3);
  /*[id(0x60020066)]*/ int Until(IDABehavior b0_0, IDAEvent event_1, IDABehavior b1_2, out IDABehavior ret_3);
  /*[id(0x60020067)]*/ int UntilEx(IDABehavior b0_0, IDAEvent event_1, out IDABehavior ret_2);
  /*[id(0x60020068)]*/ int Sequence(IDABehavior s1_0, IDABehavior s2_1, out IDABehavior ret_2);
  /*[id(0x60020069)]*/ int FollowPath(IDAPath2 path_0, double duration_1, out IDATransform2 ret_2);
  /*[id(0x6002006A)]*/ int FollowPathAngle(IDAPath2 path_0, double duration_1, out IDATransform2 ret_2);
  /*[id(0x6002006B)]*/ int FollowPathAngleUpright(IDAPath2 path_0, double duration_1, out IDATransform2 ret_2);
  /*[id(0x6002006C)]*/ int FollowPathEval(IDAPath2 path_0, IDANumber eval_1, out IDATransform2 ret_2);
  /*[id(0x6002006D)]*/ int FollowPathAngleEval(IDAPath2 path_0, IDANumber eval_1, out IDATransform2 ret_2);
  /*[id(0x6002006E)]*/ int FollowPathAngleUprightEval(IDAPath2 path_0, IDANumber eval_1, out IDATransform2 ret_2);
  /*[id(0x6002006F)]*/ int FollowPathAnim(IDAPath2 obsoleted1_0, IDANumber obsoleted2_1, out IDATransform2 ret_2);
  /*[id(0x60020070)]*/ int FollowPathAngleAnim(IDAPath2 obsoleted1_0, IDANumber obsoleted2_1, out IDATransform2 ret_2);
  /*[id(0x60020071)]*/ int FollowPathAngleUprightAnim(IDAPath2 obsoleted1_0, IDANumber obsoleted2_1, out IDATransform2 ret_2);
  /*[id(0x60020072)]*/ int ConcatString(IDAString s1_0, IDAString s2_1, out IDAString ret_2);
  /*[id(0x60020073)]*/ int PerspectiveCamera(double focalDist_0, double nearClip_1, out IDACamera ret_2);
  /*[id(0x60020074)]*/ int PerspectiveCameraAnim(IDANumber focalDist_0, IDANumber nearClip_1, out IDACamera ret_2);
  /*[id(0x60020075)]*/ int ParallelCamera(double nearClip_0, out IDACamera ret_1);
  /*[id(0x60020076)]*/ int ParallelCameraAnim(IDANumber nearClip_0, out IDACamera ret_1);
  /*[id(0x60020077)]*/ int ColorRgbAnim(IDANumber red_0, IDANumber green_1, IDANumber blue_2, out IDAColor ret_3);
  /*[id(0x60020078)]*/ int ColorRgb(double red_0, double green_1, double blue_2, out IDAColor ret_3);
  /*[id(0x60020079)]*/ int ColorRgb255(short red_0, short green_1, short blue_2, out IDAColor ret_3);
  /*[id(0x6002007A)]*/ int ColorHsl(double hue_0, double saturation_1, double lum_2, out IDAColor ret_3);
  /*[id(0x6002007B)]*/ int ColorHslAnim(IDANumber hue_0, IDANumber saturation_1, IDANumber lum_2, out IDAColor ret_3);
  /*[id(0x6002007C)]*/ int get_Red(out IDAColor ret_0);
  /*[id(0x6002007D)]*/ int get_Green(out IDAColor ret_0);
  /*[id(0x6002007E)]*/ int get_Blue(out IDAColor ret_0);
  /*[id(0x6002007F)]*/ int get_Cyan(out IDAColor ret_0);
  /*[id(0x60020080)]*/ int get_Magenta(out IDAColor ret_0);
  /*[id(0x60020081)]*/ int get_Yellow(out IDAColor ret_0);
  /*[id(0x60020082)]*/ int get_Black(out IDAColor ret_0);
  /*[id(0x60020083)]*/ int get_White(out IDAColor ret_0);
  /*[id(0x60020084)]*/ int get_Aqua(out IDAColor ret_0);
  /*[id(0x60020085)]*/ int get_Fuchsia(out IDAColor ret_0);
  /*[id(0x60020086)]*/ int get_Gray(out IDAColor ret_0);
  /*[id(0x60020087)]*/ int get_Lime(out IDAColor ret_0);
  /*[id(0x60020088)]*/ int get_Maroon(out IDAColor ret_0);
  /*[id(0x60020089)]*/ int get_Navy(out IDAColor ret_0);
  /*[id(0x6002008A)]*/ int get_Olive(out IDAColor ret_0);
  /*[id(0x6002008B)]*/ int get_Purple(out IDAColor ret_0);
  /*[id(0x6002008C)]*/ int get_Silver(out IDAColor ret_0);
  /*[id(0x6002008D)]*/ int get_Teal(out IDAColor ret_0);
  /*[id(0x6002008E)]*/ int Predicate(IDABoolean b_0, out IDAEvent ret_1);
  /*[id(0x6002008F)]*/ int NotEvent(IDAEvent event_0, out IDAEvent ret_1);
  /*[id(0x60020090)]*/ int AndEvent(IDAEvent e1_0, IDAEvent e2_1, out IDAEvent ret_2);
  /*[id(0x60020091)]*/ int OrEvent(IDAEvent e1_0, IDAEvent e2_1, out IDAEvent ret_2);
  /*[id(0x60020092)]*/ int ThenEvent(IDAEvent e1_0, IDAEvent e2_1, out IDAEvent ret_2);
  /*[id(0x60020093)]*/ int get_LeftButtonDown(out IDAEvent ret_0);
  /*[id(0x60020094)]*/ int get_LeftButtonUp(out IDAEvent ret_0);
  /*[id(0x60020095)]*/ int get_RightButtonDown(out IDAEvent ret_0);
  /*[id(0x60020096)]*/ int get_RightButtonUp(out IDAEvent ret_0);
  /*[id(0x60020097)]*/ int get_Always(out IDAEvent ret_0);
  /*[id(0x60020098)]*/ int get_Never(out IDAEvent ret_0);
  /*[id(0x60020099)]*/ int TimerAnim(IDANumber n_0, out IDAEvent ret_1);
  /*[id(0x6002009A)]*/ int Timer(double n_0, out IDAEvent ret_1);
  /*[id(0x6002009B)]*/ int AppTriggeredEvent(out IDAEvent ret_0);
  /*[id(0x6002009C)]*/ int ScriptCallback(wchar* obsolete1_0, IDAEvent obsolete2_1, wchar* obsolete3_2, out IDAEvent ret_3);
  /*[id(0x6002009D)]*/ int get_EmptyGeometry(out IDAGeometry ret_0);
  /*[id(0x6002009E)]*/ int UnionGeometry(IDAGeometry g1_0, IDAGeometry g2_1, out IDAGeometry ret_2);
  /*[id(0x6002009F)]*/ int UnionGeometryArrayEx(int imgs_0size, IDAGeometry* imgs_0, out IDAGeometry ret_1);
  /*[id(0x600200A0)]*/ int UnionGeometryArray(DWINVARIANT imgs_0, out IDAGeometry ret_1);
  /*[id(0x600200A1)]*/ int get_EmptyImage(out IDAImage ret_0);
  /*[id(0x600200A2)]*/ int get_DetectableEmptyImage(out IDAImage ret_0);
  /*[id(0x600200A3)]*/ int SolidColorImage(IDAColor col_0, out IDAImage ret_1);
  /*[id(0x600200A4)]*/ int GradientPolygonEx(int points_0size, IDAPoint2* points_0, int colors_1size, IDAColor* colors_1, out IDAImage ret_2);
  /*[id(0x600200A5)]*/ int GradientPolygon(DWINVARIANT points_0, DWINVARIANT colors_1, out IDAImage ret_2);
  /*[id(0x600200A6)]*/ int RadialGradientPolygonEx(IDAColor inner_0, IDAColor outer_1, int points_2size, IDAPoint2* points_2, double fallOff_3, out IDAImage ret_4);
  /*[id(0x600200A7)]*/ int RadialGradientPolygon(IDAColor inner_0, IDAColor outer_1, DWINVARIANT points_2, double fallOff_3, out IDAImage ret_4);
  /*[id(0x600200A8)]*/ int RadialGradientPolygonAnimEx(IDAColor inner_0, IDAColor outer_1, int points_2size, IDAPoint2* points_2, IDANumber fallOff_3, out IDAImage ret_4);
  /*[id(0x600200A9)]*/ int RadialGradientPolygonAnim(IDAColor inner_0, IDAColor outer_1, DWINVARIANT points_2, IDANumber fallOff_3, out IDAImage ret_4);
  /*[id(0x600200AA)]*/ int GradientSquare(IDAColor lowerLeft_0, IDAColor upperLeft_1, IDAColor upperRight_2, IDAColor lowerRight_3, out IDAImage ret_4);
  /*[id(0x600200AB)]*/ int RadialGradientSquare(IDAColor inner_0, IDAColor outer_1, double fallOff_2, out IDAImage ret_3);
  /*[id(0x600200AC)]*/ int RadialGradientSquareAnim(IDAColor inner_0, IDAColor outer_1, IDANumber fallOff_2, out IDAImage ret_3);
  /*[id(0x600200AD)]*/ int RadialGradientRegularPoly(IDAColor inner_0, IDAColor outer_1, double numEdges_2, double fallOff_3, out IDAImage ret_4);
  /*[id(0x600200AE)]*/ int RadialGradientRegularPolyAnim(IDAColor inner_0, IDAColor outer_1, IDANumber numEdges_2, IDANumber fallOff_3, out IDAImage ret_4);
  /*[id(0x600200AF)]*/ int GradientHorizontal(IDAColor start_0, IDAColor stop_1, double fallOff_2, out IDAImage ret_3);
  /*[id(0x600200B0)]*/ int GradientHorizontalAnim(IDAColor start_0, IDAColor stop_1, IDANumber fallOff_2, out IDAImage ret_3);
  /*[id(0x600200B1)]*/ int HatchHorizontal(IDAColor lineClr_0, double spacing_1, out IDAImage ret_2);
  /*[id(0x600200B2)]*/ int HatchHorizontalAnim(IDAColor lineClr_0, IDANumber spacing_1, out IDAImage ret_2);
  /*[id(0x600200B3)]*/ int HatchVertical(IDAColor lineClr_0, double spacing_1, out IDAImage ret_2);
  /*[id(0x600200B4)]*/ int HatchVerticalAnim(IDAColor lineClr_0, IDANumber spacing_1, out IDAImage ret_2);
  /*[id(0x600200B5)]*/ int HatchForwardDiagonal(IDAColor lineClr_0, double spacing_1, out IDAImage ret_2);
  /*[id(0x600200B6)]*/ int HatchForwardDiagonalAnim(IDAColor lineClr_0, IDANumber spacing_1, out IDAImage ret_2);
  /*[id(0x600200B7)]*/ int HatchBackwardDiagonal(IDAColor lineClr_0, double spacing_1, out IDAImage ret_2);
  /*[id(0x600200B8)]*/ int HatchBackwardDiagonalAnim(IDAColor lineClr_0, IDANumber spacing_1, out IDAImage ret_2);
  /*[id(0x600200B9)]*/ int HatchCross(IDAColor lineClr_0, double spacing_1, out IDAImage ret_2);
  /*[id(0x600200BA)]*/ int HatchCrossAnim(IDAColor lineClr_0, IDANumber spacing_1, out IDAImage ret_2);
  /*[id(0x600200BB)]*/ int HatchDiagonalCross(IDAColor lineClr_0, double spacing_1, out IDAImage ret_2);
  /*[id(0x600200BC)]*/ int HatchDiagonalCrossAnim(IDAColor lineClr_0, IDANumber spacing_1, out IDAImage ret_2);
  /*[id(0x600200BD)]*/ int Overlay(IDAImage top_0, IDAImage bottom_1, out IDAImage ret_2);
  /*[id(0x600200BE)]*/ int OverlayArrayEx(int imgs_0size, IDAImage* imgs_0, out IDAImage ret_1);
  /*[id(0x600200BF)]*/ int OverlayArray(DWINVARIANT imgs_0, out IDAImage ret_1);
  /*[id(0x600200C0)]*/ int get_AmbientLight(out IDAGeometry ret_0);
  /*[id(0x600200C1)]*/ int get_DirectionalLight(out IDAGeometry ret_0);
  /*[id(0x600200C2)]*/ int get_PointLight(out IDAGeometry ret_0);
  /*[id(0x600200C3)]*/ int SpotLightAnim(IDANumber fullcone_0, IDANumber cutoff_1, out IDAGeometry ret_2);
  /*[id(0x600200C4)]*/ int SpotLight(IDANumber fullcone_0, double cutoff_1, out IDAGeometry ret_2);
  /*[id(0x600200C5)]*/ int get_DefaultLineStyle(out IDALineStyle ret_0);
  /*[id(0x600200C6)]*/ int get_EmptyLineStyle(out IDALineStyle ret_0);
  /*[id(0x600200C7)]*/ int get_JoinStyleBevel(out IDAJoinStyle ret_0);
  /*[id(0x600200C8)]*/ int get_JoinStyleRound(out IDAJoinStyle ret_0);
  /*[id(0x600200C9)]*/ int get_JoinStyleMiter(out IDAJoinStyle ret_0);
  /*[id(0x600200CA)]*/ int get_EndStyleFlat(out IDAEndStyle ret_0);
  /*[id(0x600200CB)]*/ int get_EndStyleSquare(out IDAEndStyle ret_0);
  /*[id(0x600200CC)]*/ int get_EndStyleRound(out IDAEndStyle ret_0);
  /*[id(0x600200CD)]*/ int get_DashStyleSolid(out IDADashStyle ret_0);
  /*[id(0x600200CE)]*/ int get_DashStyleDashed(out IDADashStyle ret_0);
  /*[id(0x600200CF)]*/ int get_DefaultMicrophone(out IDAMicrophone ret_0);
  /*[id(0x600200D0)]*/ int get_OpaqueMatte(out IDAMatte ret_0);
  /*[id(0x600200D1)]*/ int get_ClearMatte(out IDAMatte ret_0);
  /*[id(0x600200D2)]*/ int UnionMatte(IDAMatte m1_0, IDAMatte m2_1, out IDAMatte ret_2);
  /*[id(0x600200D3)]*/ int IntersectMatte(IDAMatte m1_0, IDAMatte m2_1, out IDAMatte ret_2);
  /*[id(0x600200D4)]*/ int DifferenceMatte(IDAMatte m1_0, IDAMatte m2_1, out IDAMatte ret_2);
  /*[id(0x600200D5)]*/ int FillMatte(IDAPath2 p_0, out IDAMatte ret_1);
  /*[id(0x600200D6)]*/ int TextMatte(IDAString str_0, IDAFontStyle fs_1, out IDAMatte ret_2);
  /*[id(0x600200D7)]*/ int get_EmptyMontage(out IDAMontage ret_0);
  /*[id(0x600200D8)]*/ int ImageMontage(IDAImage im_0, double depth_1, out IDAMontage ret_2);
  /*[id(0x600200D9)]*/ int ImageMontageAnim(IDAImage im_0, IDANumber depth_1, out IDAMontage ret_2);
  /*[id(0x600200DA)]*/ int UnionMontage(IDAMontage m1_0, IDAMontage m2_1, out IDAMontage ret_2);
  /*[id(0x600200DB)]*/ int Concat(IDAPath2 p1_0, IDAPath2 p2_1, out IDAPath2 ret_2);
  /*[id(0x600200DC)]*/ int ConcatArrayEx(int paths_0size, IDAPath2* paths_0, out IDAPath2 ret_1);
  /*[id(0x600200DD)]*/ int ConcatArray(DWINVARIANT paths_0, out IDAPath2 ret_1);
  /*[id(0x600200DE)]*/ int Line(IDAPoint2 p1_0, IDAPoint2 p2_1, out IDAPath2 ret_2);
  /*[id(0x600200DF)]*/ int Ray(IDAPoint2 pt_0, out IDAPath2 ret_1);
  /*[id(0x600200E0)]*/ int StringPathAnim(IDAString str_0, IDAFontStyle fs_1, out IDAPath2 ret_2);
  /*[id(0x600200E1)]*/ int StringPath(wchar* str_0, IDAFontStyle fs_1, out IDAPath2 ret_2);
  /*[id(0x600200E2)]*/ int PolylineEx(int points_0size, IDAPoint2* points_0, out IDAPath2 ret_1);
  /*[id(0x600200E3)]*/ int Polyline(DWINVARIANT points_0, out IDAPath2 ret_1);
  /*[id(0x600200E4)]*/ int PolydrawPathEx(int points_0size, IDAPoint2* points_0, int codes_1size, IDANumber* codes_1, out IDAPath2 ret_2);
  /*[id(0x600200E5)]*/ int PolydrawPath(DWINVARIANT points_0, DWINVARIANT codes_1, out IDAPath2 ret_2);
  /*[id(0x600200E6)]*/ int ArcRadians(double startAngle_0, double endAngle_1, double arcWidth_2, double arcHeight_3, out IDAPath2 ret_4);
  /*[id(0x600200E7)]*/ int ArcRadiansAnim(IDANumber startAngle_0, IDANumber endAngle_1, IDANumber arcWidth_2, IDANumber arcHeight_3, out IDAPath2 ret_4);
  /*[id(0x600200E8)]*/ int ArcDegrees(double startAngle_0, double endAngle_1, double arcWidth_2, double arcHeight_3, out IDAPath2 ret_4);
  /*[id(0x600200E9)]*/ int PieRadians(double startAngle_0, double endAngle_1, double arcWidth_2, double arcHeight_3, out IDAPath2 ret_4);
  /*[id(0x600200EA)]*/ int PieRadiansAnim(IDANumber startAngle_0, IDANumber endAngle_1, IDANumber arcWidth_2, IDANumber arcHeight_3, out IDAPath2 ret_4);
  /*[id(0x600200EB)]*/ int PieDegrees(double startAngle_0, double endAngle_1, double arcWidth_2, double arcHeight_3, out IDAPath2 ret_4);
  /*[id(0x600200EC)]*/ int Oval(double width_0, double height_1, out IDAPath2 ret_2);
  /*[id(0x600200ED)]*/ int OvalAnim(IDANumber width_0, IDANumber height_1, out IDAPath2 ret_2);
  /*[id(0x600200EE)]*/ int Rect(double width_0, double height_1, out IDAPath2 ret_2);
  /*[id(0x600200EF)]*/ int RectAnim(IDANumber width_0, IDANumber height_1, out IDAPath2 ret_2);
  /*[id(0x600200F0)]*/ int RoundRect(double width_0, double height_1, double cornerArcWidth_2, double cornerArcHeight_3, out IDAPath2 ret_4);
  /*[id(0x600200F1)]*/ int RoundRectAnim(IDANumber width_0, IDANumber height_1, IDANumber cornerArcWidth_2, IDANumber cornerArcHeight_3, out IDAPath2 ret_4);
  /*[id(0x600200F2)]*/ int CubicBSplinePathEx(int points_0size, IDAPoint2* points_0, int knots_1size, IDANumber* knots_1, out IDAPath2 ret_2);
  /*[id(0x600200F3)]*/ int CubicBSplinePath(DWINVARIANT points_0, DWINVARIANT knots_1, out IDAPath2 ret_2);
  /*[id(0x600200F4)]*/ int TextPath(IDAString obsolete1_0, IDAFontStyle obsolete2_1, out IDAPath2 ret_2);
  /*[id(0x600200F5)]*/ int get_Silence(out IDASound ret_0);
  /*[id(0x600200F6)]*/ int MixArrayEx(int snds_0size, IDASound* snds_0, out IDASound ret_1);
  /*[id(0x600200F7)]*/ int MixArray(DWINVARIANT snds_0, out IDASound ret_1);
  /*[id(0x600200F8)]*/ int get_SinSynth(out IDASound ret_0);
  /*[id(0x600200F9)]*/ int get_DefaultFont(out IDAFontStyle ret_0);
  /*[id(0x600200FA)]*/ int FontAnim(IDAString str_0, IDANumber size_1, IDAColor col_2, out IDAFontStyle ret_3);
  /*[id(0x600200FB)]*/ int Font(wchar* str_0, double size_1, IDAColor col_2, out IDAFontStyle ret_3);
  /*[id(0x600200FC)]*/ int StringImageAnim(IDAString str_0, IDAFontStyle fs_1, out IDAImage ret_2);
  /*[id(0x600200FD)]*/ int StringImage(wchar* str_0, IDAFontStyle fs_1, out IDAImage ret_2);
  /*[id(0x600200FE)]*/ int TextImageAnim(IDAString obsoleted1_0, IDAFontStyle obsoleted2_1, out IDAImage ret_2);
  /*[id(0x600200FF)]*/ int TextImage(wchar* obsoleted1_0, IDAFontStyle obsoleted2_1, out IDAImage ret_2);
  /*[id(0x60020100)]*/ int get_XVector2(out IDAVector2 ret_0);
  /*[id(0x60020101)]*/ int get_YVector2(out IDAVector2 ret_0);
  /*[id(0x60020102)]*/ int get_ZeroVector2(out IDAVector2 ret_0);
  /*[id(0x60020103)]*/ int get_Origin2(out IDAPoint2 ret_0);
  /*[id(0x60020104)]*/ int Vector2Anim(IDANumber x_0, IDANumber y_1, out IDAVector2 ret_2);
  /*[id(0x60020105)]*/ int Vector2(double x_0, double y_1, out IDAVector2 ret_2);
  /*[id(0x60020106)]*/ int Point2Anim(IDANumber x_0, IDANumber y_1, out IDAPoint2 ret_2);
  /*[id(0x60020107)]*/ int Point2(double x_0, double y_1, out IDAPoint2 ret_2);
  /*[id(0x60020108)]*/ int Vector2PolarAnim(IDANumber theta_0, IDANumber radius_1, out IDAVector2 ret_2);
  /*[id(0x60020109)]*/ int Vector2Polar(double theta_0, double radius_1, out IDAVector2 ret_2);
  /*[id(0x6002010A)]*/ int Vector2PolarDegrees(double theta_0, double radius_1, out IDAVector2 ret_2);
  /*[id(0x6002010B)]*/ int Point2PolarAnim(IDANumber theta_0, IDANumber radius_1, out IDAPoint2 ret_2);
  /*[id(0x6002010C)]*/ int Point2Polar(double theta_0, double radius_1, out IDAPoint2 ret_2);
  /*[id(0x6002010D)]*/ int DotVector2(IDAVector2 v_0, IDAVector2 u_1, out IDANumber ret_2);
  /*[id(0x6002010E)]*/ int NegVector2(IDAVector2 v_0, out IDAVector2 ret_1);
  /*[id(0x6002010F)]*/ int SubVector2(IDAVector2 v1_0, IDAVector2 v2_1, out IDAVector2 ret_2);
  /*[id(0x60020110)]*/ int AddVector2(IDAVector2 v1_0, IDAVector2 v2_1, out IDAVector2 ret_2);
  /*[id(0x60020111)]*/ int AddPoint2Vector(IDAPoint2 p_0, IDAVector2 v_1, out IDAPoint2 ret_2);
  /*[id(0x60020112)]*/ int SubPoint2Vector(IDAPoint2 p_0, IDAVector2 v_1, out IDAPoint2 ret_2);
  /*[id(0x60020113)]*/ int SubPoint2(IDAPoint2 p1_0, IDAPoint2 p2_1, out IDAVector2 ret_2);
  /*[id(0x60020114)]*/ int DistancePoint2(IDAPoint2 p_0, IDAPoint2 q_1, out IDANumber ret_2);
  /*[id(0x60020115)]*/ int DistanceSquaredPoint2(IDAPoint2 p_0, IDAPoint2 q_1, out IDANumber ret_2);
  /*[id(0x60020116)]*/ int get_XVector3(out IDAVector3 ret_0);
  /*[id(0x60020117)]*/ int get_YVector3(out IDAVector3 ret_0);
  /*[id(0x60020118)]*/ int get_ZVector3(out IDAVector3 ret_0);
  /*[id(0x60020119)]*/ int get_ZeroVector3(out IDAVector3 ret_0);
  /*[id(0x6002011A)]*/ int get_Origin3(out IDAPoint3 ret_0);
  /*[id(0x6002011B)]*/ int Vector3Anim(IDANumber x_0, IDANumber y_1, IDANumber z_2, out IDAVector3 ret_3);
  /*[id(0x6002011C)]*/ int Vector3(double x_0, double y_1, double z_2, out IDAVector3 ret_3);
  /*[id(0x6002011D)]*/ int Point3Anim(IDANumber x_0, IDANumber y_1, IDANumber z_2, out IDAPoint3 ret_3);
  /*[id(0x6002011E)]*/ int Point3(double x_0, double y_1, double z_2, out IDAPoint3 ret_3);
  /*[id(0x6002011F)]*/ int Vector3SphericalAnim(IDANumber xyAngle_0, IDANumber yzAngle_1, IDANumber radius_2, out IDAVector3 ret_3);
  /*[id(0x60020120)]*/ int Vector3Spherical(double xyAngle_0, double yzAngle_1, double radius_2, out IDAVector3 ret_3);
  /*[id(0x60020121)]*/ int Point3SphericalAnim(IDANumber zxAngle_0, IDANumber xyAngle_1, IDANumber radius_2, out IDAPoint3 ret_3);
  /*[id(0x60020122)]*/ int Point3Spherical(double zxAngle_0, double xyAngle_1, double radius_2, out IDAPoint3 ret_3);
  /*[id(0x60020123)]*/ int DotVector3(IDAVector3 v_0, IDAVector3 u_1, out IDANumber ret_2);
  /*[id(0x60020124)]*/ int CrossVector3(IDAVector3 v_0, IDAVector3 u_1, out IDAVector3 ret_2);
  /*[id(0x60020125)]*/ int NegVector3(IDAVector3 v_0, out IDAVector3 ret_1);
  /*[id(0x60020126)]*/ int SubVector3(IDAVector3 v1_0, IDAVector3 v2_1, out IDAVector3 ret_2);
  /*[id(0x60020127)]*/ int AddVector3(IDAVector3 v1_0, IDAVector3 v2_1, out IDAVector3 ret_2);
  /*[id(0x60020128)]*/ int AddPoint3Vector(IDAPoint3 p_0, IDAVector3 v_1, out IDAPoint3 ret_2);
  /*[id(0x60020129)]*/ int SubPoint3Vector(IDAPoint3 p_0, IDAVector3 v_1, out IDAPoint3 ret_2);
  /*[id(0x6002012A)]*/ int SubPoint3(IDAPoint3 p1_0, IDAPoint3 p2_1, out IDAVector3 ret_2);
  /*[id(0x6002012B)]*/ int DistancePoint3(IDAPoint3 p_0, IDAPoint3 q_1, out IDANumber ret_2);
  /*[id(0x6002012C)]*/ int DistanceSquaredPoint3(IDAPoint3 p_0, IDAPoint3 q_1, out IDANumber ret_2);
  /*[id(0x6002012D)]*/ int get_IdentityTransform3(out IDATransform3 ret_0);
  /*[id(0x6002012E)]*/ int Translate3Anim(IDANumber tx_0, IDANumber ty_1, IDANumber tz_2, out IDATransform3 ret_3);
  /*[id(0x6002012F)]*/ int Translate3(double tx_0, double ty_1, double tz_2, out IDATransform3 ret_3);
  /*[id(0x60020130)]*/ int Translate3Rate(double tx_0, double ty_1, double tz_2, out IDATransform3 ret_3);
  /*[id(0x60020131)]*/ int Translate3Vector(IDAVector3 delta_0, out IDATransform3 ret_1);
  /*[id(0x60020132)]*/ int Translate3Point(IDAPoint3 new_origin_0, out IDATransform3 ret_1);
  /*[id(0x60020133)]*/ int Scale3Anim(IDANumber x_0, IDANumber y_1, IDANumber z_2, out IDATransform3 ret_3);
  /*[id(0x60020134)]*/ int Scale3(double x_0, double y_1, double z_2, out IDATransform3 ret_3);
  /*[id(0x60020135)]*/ int Scale3Rate(double x_0, double y_1, double z_2, out IDATransform3 ret_3);
  /*[id(0x60020136)]*/ int Scale3Vector(IDAVector3 scale_vec_0, out IDATransform3 ret_1);
  /*[id(0x60020137)]*/ int Scale3UniformAnim(IDANumber uniform_scale_0, out IDATransform3 ret_1);
  /*[id(0x60020138)]*/ int Scale3Uniform(double uniform_scale_0, out IDATransform3 ret_1);
  /*[id(0x60020139)]*/ int Scale3UniformRate(double uniform_scale_0, out IDATransform3 ret_1);
  /*[id(0x6002013A)]*/ int Rotate3Anim(IDAVector3 axis_0, IDANumber angle_1, out IDATransform3 ret_2);
  /*[id(0x6002013B)]*/ int Rotate3(IDAVector3 axis_0, double angle_1, out IDATransform3 ret_2);
  /*[id(0x6002013C)]*/ int Rotate3Rate(IDAVector3 axis_0, double angle_1, out IDATransform3 ret_2);
  /*[id(0x6002013D)]*/ int Rotate3Degrees(IDAVector3 axis_0, double angle_1, out IDATransform3 ret_2);
  /*[id(0x6002013E)]*/ int Rotate3RateDegrees(IDAVector3 axis_0, double angle_1, out IDATransform3 ret_2);
  /*[id(0x6002013F)]*/ int XShear3Anim(IDANumber a_0, IDANumber b_1, out IDATransform3 ret_2);
  /*[id(0x60020140)]*/ int XShear3(double a_0, double b_1, out IDATransform3 ret_2);
  /*[id(0x60020141)]*/ int XShear3Rate(double a_0, double b_1, out IDATransform3 ret_2);
  /*[id(0x60020142)]*/ int YShear3Anim(IDANumber c_0, IDANumber d_1, out IDATransform3 ret_2);
  /*[id(0x60020143)]*/ int YShear3(double c_0, double d_1, out IDATransform3 ret_2);
  /*[id(0x60020144)]*/ int YShear3Rate(double c_0, double d_1, out IDATransform3 ret_2);
  /*[id(0x60020145)]*/ int ZShear3Anim(IDANumber e_0, IDANumber f_1, out IDATransform3 ret_2);
  /*[id(0x60020146)]*/ int ZShear3(double e_0, double f_1, out IDATransform3 ret_2);
  /*[id(0x60020147)]*/ int ZShear3Rate(double e_0, double f_1, out IDATransform3 ret_2);
  /*[id(0x60020148)]*/ int Transform4x4AnimEx(int m_0size, IDANumber* m_0, out IDATransform3 ret_1);
  /*[id(0x60020149)]*/ int Transform4x4Anim(DWINVARIANT m_0, out IDATransform3 ret_1);
  /*[id(0x6002014A)]*/ int Compose3(IDATransform3 a_0, IDATransform3 b_1, out IDATransform3 ret_2);
  /*[id(0x6002014B)]*/ int Compose3ArrayEx(int xfs_0size, IDATransform3* xfs_0, out IDATransform3 ret_1);
  /*[id(0x6002014C)]*/ int Compose3Array(DWINVARIANT xfs_0, out IDATransform3 ret_1);
  /*[id(0x6002014D)]*/ int LookAtFrom(IDAPoint3 to_0, IDAPoint3 from_1, IDAVector3 up_2, out IDATransform3 ret_3);
  /*[id(0x6002014E)]*/ int get_IdentityTransform2(out IDATransform2 ret_0);
  /*[id(0x6002014F)]*/ int Translate2Anim(IDANumber tx_0, IDANumber ty_1, out IDATransform2 ret_2);
  /*[id(0x60020150)]*/ int Translate2(double tx_0, double ty_1, out IDATransform2 ret_2);
  /*[id(0x60020151)]*/ int Translate2Rate(double tx_0, double ty_1, out IDATransform2 ret_2);
  /*[id(0x60020152)]*/ int Translate2Vector(IDAVector2 delta_0, out IDATransform2 ret_1);
  /*[id(0x60020153)]*/ int Translate2Point(IDAPoint2 pos_0, out IDATransform2 ret_1);
  /*[id(0x60020154)]*/ int Scale2Anim(IDANumber x_0, IDANumber y_1, out IDATransform2 ret_2);
  /*[id(0x60020155)]*/ int Scale2(double x_0, double y_1, out IDATransform2 ret_2);
  /*[id(0x60020156)]*/ int Scale2Rate(double x_0, double y_1, out IDATransform2 ret_2);
  /*[id(0x60020157)]*/ int Scale2Vector2(IDAVector2 obsoleteMethod_0, out IDATransform2 ret_1);
  /*[id(0x60020158)]*/ int Scale2Vector(IDAVector2 scale_vec_0, out IDATransform2 ret_1);
  /*[id(0x60020159)]*/ int Scale2UniformAnim(IDANumber uniform_scale_0, out IDATransform2 ret_1);
  /*[id(0x6002015A)]*/ int Scale2Uniform(double uniform_scale_0, out IDATransform2 ret_1);
  /*[id(0x6002015B)]*/ int Scale2UniformRate(double uniform_scale_0, out IDATransform2 ret_1);
  /*[id(0x6002015C)]*/ int Rotate2Anim(IDANumber angle_0, out IDATransform2 ret_1);
  /*[id(0x6002015D)]*/ int Rotate2(double angle_0, out IDATransform2 ret_1);
  /*[id(0x6002015E)]*/ int Rotate2Rate(double angle_0, out IDATransform2 ret_1);
  /*[id(0x6002015F)]*/ int Rotate2Degrees(double angle_0, out IDATransform2 ret_1);
  /*[id(0x60020160)]*/ int Rotate2RateDegrees(double angle_0, out IDATransform2 ret_1);
  /*[id(0x60020161)]*/ int XShear2Anim(IDANumber arg_0, out IDATransform2 ret_1);
  /*[id(0x60020162)]*/ int XShear2(double arg_0, out IDATransform2 ret_1);
  /*[id(0x60020163)]*/ int XShear2Rate(double arg_0, out IDATransform2 ret_1);
  /*[id(0x60020164)]*/ int YShear2Anim(IDANumber arg_0, out IDATransform2 ret_1);
  /*[id(0x60020165)]*/ int YShear2(double arg_0, out IDATransform2 ret_1);
  /*[id(0x60020166)]*/ int YShear2Rate(double arg_0, out IDATransform2 ret_1);
  /*[id(0x60020167)]*/ int Transform3x2AnimEx(int m_0size, IDANumber* m_0, out IDATransform2 ret_1);
  /*[id(0x60020168)]*/ int Transform3x2Anim(DWINVARIANT m_0, out IDATransform2 ret_1);
  /*[id(0x60020169)]*/ int Compose2(IDATransform2 a_0, IDATransform2 b_1, out IDATransform2 ret_2);
  /*[id(0x6002016A)]*/ int Compose2ArrayEx(int xfs_0size, IDATransform2* xfs_0, out IDATransform2 ret_1);
  /*[id(0x6002016B)]*/ int Compose2Array(DWINVARIANT xfs_0, out IDATransform2 ret_1);
  // Obsolete method: Use DATuple instead
  /*[id(0x6002016C)]*/ int Tuple(DWINVARIANT obsolete1, out IDATuple obsolete2);
  // Obsolete method: Use DAArray instead
  /*[id(0x6002016D)]*/ int Array(DWINVARIANT obsolete1, out IDAArray obsolete2);
  /*[id(0x6002016E)]*/ int get_AreBlockingImportsComplete(out short bComplete);
}

// DirectAnimation Statics2
interface IDA2Statics : IDAStatics {
  mixin(uuid("fa261cf0-c44e-11d1-9be4-00c04fc2f51d"));
  // static DWINGUID IID = { 0xfa261cf0, 0xc44e, 0x11d1, 0x9b, 0xe4, 0x00, 0xc0, 0x4f, 0xc2, 0xf5, 0x1d };
  /*[id(0x60030000)]*/ int ImportDirect3DRMVisual(IUnknown visual, out IDAGeometry bvr);
  /*[id(0x60030001)]*/ int ApplyDXTransformEx(IUnknown theXf, int numInputs, IDABehavior* inputs, IDANumber evaluator, out IDADXTransformResult ppResult);
  /*[id(0x60030002)]*/ int ApplyDXTransform(DWINVARIANT varXf, DWINVARIANT inputs, DWINVARIANT evaluator, out IDADXTransformResult ppResult);
  /*[id(0x60030003)]*/ int ModifiableNumber(double initVal, out IDANumber ppResult);
  /*[id(0x60030004)]*/ int ModifiableString(wchar* initVal, out IDAString ppResult);
  /*[id(0x60030005)]*/ int DAArrayEx2(int s, IDABehavior* pBvrs, uint dwFlags, out IDAArray bvr);
  /*[id(0x60030006)]*/ int DAArray2(DWINVARIANT bvrs, uint dwFlags, out IDAArray bvr);
  /*[id(0x60030007)]*/ int ImportGeometryWrapped(wchar* url, int wrapType, double originX, double originY, double originZ, double zAxisX, double zAxisY, double zAxisZ, double yAxisX, double yAxisY, double yAxisZ, double texOriginX, double texOriginY, double texScaleX, double texScaleY, uint Flags, out IDAGeometry ppGeometry);
  /*[id(0x60030008)]*/ int ImportGeometryWrappedAsync(wchar* url, int wrapType, double originX, double originY, double originZ, double zAxisX, double zAxisY, double zAxisZ, double yAxisX, double yAxisY, double yAxisZ, double texOriginX, double texOriginY, double texScaleX, double texScaleY, uint Flags, IDAGeometry pGeoStandIn, out IDAImportationResult ppResult);
  /*[id(0x60030009)]*/ int ImportDirect3DRMVisualWrapped(IUnknown visual, int wrapType, double originX, double originY, double originZ, double zAxisX, double zAxisY, double zAxisZ, double yAxisX, double yAxisY, double yAxisZ, double texOriginX, double texOriginY, double texScaleX, double texScaleY, uint Flags, out IDAGeometry bvr);
  /*[id(0x6003000A)]*/ int UntilNotifyScript(IDABehavior b0_0, IDAEvent event_1, wchar* scriptlet_2, out IDABehavior ret_3);
  /*[id(0x6003000B)]*/ int get_ViewFrameRate(out IDANumber ret_0);
  /*[id(0x6003000C)]*/ int UnionMontageArrayEx(int mtgs_0size, IDAMontage* mtgs_0, out IDAMontage ret_1);
  /*[id(0x6003000D)]*/ int UnionMontageArray(DWINVARIANT mtgs_0, out IDAMontage ret_1);
  /*[id(0x6003000E)]*/ int get_ModifiableBehaviorFlags(out uint dwFlags);
  /*[id(0x6003000E)]*/ int set_ModifiableBehaviorFlags(uint dwFlags);
  /*[id(0x60030010)]*/ int get_EmptyColor(out IDAColor ret_0);
}

// DirectAnimation Statics3
interface IDA3Statics : IDA2Statics {
  mixin(uuid("6e0b5fc4-4d1e-11d2-aa53-00c04fc2f60f"));
  // static DWINGUID IID = { 0x6e0b5fc4, 0x4d1e, 0x11d2, 0xaa, 0x53, 0x00, 0xc0, 0x4f, 0xc2, 0xf6, 0x0f };
  /*[id(0x60040000)]*/ int ImportSoundStream(wchar* url, out IDAImportationResult ppResult);
  /*[id(0x60040001)]*/ int ImportMovieStream(wchar* url, out IDAImportationResult ppResult);
  /*[id(0x60040002)]*/ int SequenceArrayEx(int sz, IDABehavior* bvrs_0, out IDABehavior ret_1);
  /*[id(0x60040003)]*/ int SequenceArray(DWINVARIANT bvrs_0, out IDABehavior ret_1);
  /*[id(0x60040004)]*/ int get_ViewTimeDelta(out IDANumber ret_0);
  /*[id(0x60040005)]*/ int TriMesh(int nTriangles, DWINVARIANT positions, DWINVARIANT normals, DWINVARIANT UVs, DWINVARIANT indices, out IDAGeometry result);
  /*[id(0x60040006)]*/ int TriMeshEx(int nTriangles, int nPositions, float* positions, int nNormals, float* normals, int nUVs, float* UVs, int nIndices, int* indices, out IDAGeometry result);
  /*[id(0x60040007)]*/ int RadialGradientMulticolor(DWINVARIANT offsets, DWINVARIANT colors, out IDAImage result);
  /*[id(0x60040008)]*/ int RadialGradientMulticolorEx(int nOffsets, IDANumber* offsets, int nColors, IDAColor* colors, out IDAImage result);
  /*[id(0x60040009)]*/ int LinearGradientMulticolor(DWINVARIANT offsets, DWINVARIANT colors, out IDAImage result);
  /*[id(0x6004000A)]*/ int LinearGradientMulticolorEx(int nOffsets, IDANumber* offsets, int nColors, IDAColor* colors, out IDAImage result);
}

// DirectAnimation ActiveX viewer interface
interface IDAViewerControl : IDispatch {
  mixin(uuid("0e41257b-812d-11d0-9b4a-00c04fc2f51d"));
  // static DWINGUID IID = { 0x0e41257b, 0x812d, 0x11d0, 0x9b, 0x4a, 0x00, 0xc0, 0x4f, 0xc2, 0xf5, 0x1d };
  // property updateInterval
  /*[id(0x60020000)]*/ int get_UpdateInterval(out double pVal);
  // property updateInterval
  /*[id(0x60020000)]*/ int set_UpdateInterval(double pVal);
  // property View
  /*[id(0x60020002)]*/ int get_View(out IDAView ppView);
  // property View
  /*[id(0x60020002)]*/ int set_View(IDAView ppView);
  // property Image
  /*[id(0x60020004)]*/ int get_Image(out IDAImage ppImage);
  // property Image
  /*[id(0x60020004)]*/ int set_Image(IDAImage ppImage);
  // property BackgroundImage
  /*[id(0x60020006)]*/ int get_BackgroundImage(out IDAImage ppImage);
  // property BackgroundImage
  /*[id(0x60020006)]*/ int set_BackgroundImage(IDAImage ppImage);
  // property Sound
  /*[id(0x60020008)]*/ int get_Sound(out IDASound ppSound);
  // property Sound
  /*[id(0x60020008)]*/ int set_Sound(IDASound ppSound);
  // property PixelLibrary
  /*[id(0x6002000A)]*/ int get_PixelLibrary(out IDAStatics ppStatics);
  // property MeterLibrary
  /*[id(0x6002000B)]*/ int get_MeterLibrary(out IDAStatics ppStatics);
  // Add a behavior to run at start time
  /*[id(0x6002000C)]*/ int AddBehaviorToRun(IDABehavior pBehavior);
  // Start the model
  /*[id(0x6002000D)]*/ int Start();
  // inputImage property
  /*[id(0x6002000E)]*/ int get_InputImage(out IDAImage pVal);
  /*[id(0x6002000F)]*/ int get_OpaqueForHitDetect(out short b);
  /*[id(0x6002000F)]*/ int set_OpaqueForHitDetect(short b);
  /*[id(0x60020011)]*/ int get_TimerSource(out DA_TIMER_SOURCE ts);
  /*[id(0x60020011)]*/ int set_TimerSource(DA_TIMER_SOURCE ts);
  // Add a error handling routine
  /*[id(0x60020013)]*/ int RegisterErrorHandler(wchar* scriptlet);
}

// DirectAnimation ActiveX windowed viewer interface
interface IDAViewerControlWindowed : IDAViewerControl {
  mixin(uuid("ba8b033e-1e91-11d1-8809-00c04fc29d46"));
  // static DWINGUID IID = { 0xba8b033e, 0x1e91, 0x11d1, 0x88, 0x09, 0x00, 0xc0, 0x4f, 0xc2, 0x9d, 0x46 };
}

interface IDA2ViewerControl : IDAViewerControl {
  mixin(uuid("f3e1b522-d8a6-11d1-9be5-00c04fc2f51d"));
  // static DWINGUID IID = { 0xf3e1b522, 0xd8a6, 0x11d1, 0x9b, 0xe5, 0x00, 0xc0, 0x4f, 0xc2, 0xf5, 0x1d };
  /*[id(0x60030000)]*/ int SetPreference(wchar* pref, DWINVARIANT val);
  /*[id(0x60030001)]*/ int GetPreference(wchar* pref, out DWINVARIANT pVal);
}

interface IDA2ViewerControlWindowed : IDAViewerControlWindowed {
  mixin(uuid("a3034056-ec1c-11d1-9be8-00c04fc2f51d"));
  // static DWINGUID IID = { 0xa3034056, 0xec1c, 0x11d1, 0x9b, 0xe8, 0x00, 0xc0, 0x4f, 0xc2, 0xf5, 0x1d };
  /*[id(0x60040000)]*/ int SetPreference(wchar* pref, DWINVARIANT val);
  /*[id(0x60040001)]*/ int GetPreference(wchar* pref, out DWINVARIANT pVal);
}

interface IDA3ViewerControl : IDA2ViewerControl {
  mixin(uuid("09509866-79aa-11d2-8bf5-00c04fc2f51d"));
  // static DWINGUID IID = { 0x09509866, 0x79aa, 0x11d2, 0x8b, 0xf5, 0x00, 0xc0, 0x4f, 0xc2, 0xf5, 0x1d };
  /*[id(0x60040000)]*/ int Stop();
  /*[id(0x60040001)]*/ int Pause();
  /*[id(0x60040002)]*/ int Resume();
  /*[id(0x60040003)]*/ int Tick();
}

interface IDA3ViewerControlWindowed : IDA2ViewerControlWindowed {
  mixin(uuid("09509867-79aa-11d2-8bf5-00c04fc2f51d"));
  // static DWINGUID IID = { 0x09509867, 0x79aa, 0x11d2, 0x8b, 0xf5, 0x00, 0xc0, 0x4f, 0xc2, 0xf5, 0x1d };
  /*[id(0x60050000)]*/ int Stop();
  /*[id(0x60050001)]*/ int Pause();
  /*[id(0x60050002)]*/ int Resume();
  /*[id(0x60050003)]*/ int Tick();
}

// Direct Animation ActiveX Control Events
interface _IDAViewerControlEvents : IDispatch {
  mixin(uuid("3584f274-61ea-11d2-8bd9-00c04fc2f51d"));
  // static DWINGUID IID = { 0x3584f274, 0x61ea, 0x11d2, 0x8b, 0xd9, 0x00, 0xc0, 0x4f, 0xc2, 0xf5, 0x1d };
  /+/*[id(0x00001001)]*/ void Start();+/
  /+/*[id(0x00001002)]*/ void MouseUp(int button, int KeyFlags, int X, int Y);+/
  /+/*[id(0x00001003)]*/ void MouseDown(int button, int KeyFlags, int X, int Y);+/
  /+/*[id(0x00001004)]*/ void MouseMove(int button, int KeyFlags, int X, int Y);+/
  /+/*[id(0x00001005)]*/ void Click();+/
  /+/*[id(0x00001006)]*/ void KeyPress(int KeyAscii);+/
  /+/*[id(0x00001007)]*/ void KeyUp(int KeyCode, int KeyData);+/
  /+/*[id(0x00001008)]*/ void KeyDown(int KeyCode, int KeyData);+/
  /+/*[id(0x00001009)]*/ void Error(int HResult, wchar* ErrorString);+/
  /+/*[id(0x0000100A)]*/ void Stop();+/
  /+/*[id(0x0000100B)]*/ void Pause();+/
  /+/*[id(0x0000100C)]*/ void Resume();+/
}

// CoClasses

// DirectAnimation Behavior Object
abstract class DABehavior {
  mixin(uuid("283807b8-2c60-11d0-a31d-00aa00b92c03"));
  // static DWINGUID CLSID = { 0x283807b8, 0x2c60, 0x11d0, 0xa3, 0x1d, 0x00, 0xaa, 0x00, 0xb9, 0x2c, 0x03 };
  mixin Interfaces!(IDABehavior);
}

// DirectAnimation View Object
abstract class DAView {
  mixin(uuid("283807b5-2c60-11d0-a31d-00aa00b92c03"));
  // static DWINGUID CLSID = { 0x283807b5, 0x2c60, 0x11d0, 0xa3, 0x1d, 0x00, 0xaa, 0x00, 0xb9, 0x2c, 0x03 };
  mixin Interfaces!(IDA3View);
}

// DirectAnimation Statics Object
abstract class DAStatics {
  mixin(uuid("542fb453-5003-11cf-92a2-00aa00b8a733"));
  // static DWINGUID CLSID = { 0x542fb453, 0x5003, 0x11cf, 0x92, 0xa2, 0x00, 0xaa, 0x00, 0xb8, 0xa7, 0x33 };
  mixin Interfaces!(IDA3Statics);
}

// DirectAnimation ActiveX windowless viewer class
abstract class DAViewerControl {
  mixin(uuid("b6ffc24c-7e13-11d0-9b47-00c04fc2f51d"));
  // static DWINGUID CLSID = { 0xb6ffc24c, 0x7e13, 0x11d0, 0x9b, 0x47, 0x00, 0xc0, 0x4f, 0xc2, 0xf5, 0x1d };
  mixin Interfaces!(IDA3ViewerControl);
}

// DirectAnimation ActiveX windowed viewer class
abstract class DAViewerControlWindowed {
  mixin(uuid("69ad90ef-1c20-11d1-8801-00c04fc29d46"));
  // static DWINGUID CLSID = { 0x69ad90ef, 0x1c20, 0x11d1, 0x88, 0x01, 0x00, 0xc0, 0x4f, 0xc2, 0x9d, 0x46 };
  mixin Interfaces!(IDA3ViewerControlWindowed);
}

// DirectAnimation Boolean Behavior Object
abstract class DABoolean {
  mixin(uuid("c46c1bc1-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID CLSID = { 0xc46c1bc1, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  mixin Interfaces!(IDABoolean);
}

// DirectAnimation Camera Behavior Object
abstract class DACamera {
  mixin(uuid("c46c1be2-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID CLSID = { 0xc46c1be2, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  mixin Interfaces!(IDACamera);
}

// DirectAnimation Color Behavior Object
abstract class DAColor {
  mixin(uuid("c46c1bc6-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID CLSID = { 0xc46c1bc6, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  mixin Interfaces!(IDA2Color);
}

// DirectAnimation Geometry Behavior Object
abstract class DAGeometry {
  mixin(uuid("c46c1be0-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID CLSID = { 0xc46c1be0, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  mixin Interfaces!(IDA3Geometry);
}

// DirectAnimation Image Behavior Object
abstract class DAImage {
  mixin(uuid("c46c1bd4-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID CLSID = { 0xc46c1bd4, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  mixin Interfaces!(IDA3Image);
}

// DirectAnimation Matte Behavior Object
abstract class DAMatte {
  mixin(uuid("c46c1bd2-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID CLSID = { 0xc46c1bd2, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  mixin Interfaces!(IDAMatte);
}

// DirectAnimation Microphone Behavior Object
abstract class DAMicrophone {
  mixin(uuid("c46c1be6-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID CLSID = { 0xc46c1be6, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  mixin Interfaces!(IDAMicrophone);
}

// DirectAnimation Montage Behavior Object
abstract class DAMontage {
  mixin(uuid("c46c1bd6-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID CLSID = { 0xc46c1bd6, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  mixin Interfaces!(IDAMontage);
}

// DirectAnimation Number Behavior Object
abstract class DANumber {
  mixin(uuid("9cde7341-3c20-11d0-a330-00aa00b92c03"));
  // static DWINGUID CLSID = { 0x9cde7341, 0x3c20, 0x11d0, 0xa3, 0x30, 0x00, 0xaa, 0x00, 0xb9, 0x2c, 0x03 };
  mixin Interfaces!(IDANumber);
}

// DirectAnimation Path2 Behavior Object
abstract class DAPath2 {
  mixin(uuid("c46c1bd0-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID CLSID = { 0xc46c1bd0, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  mixin Interfaces!(IDAPath2);
}

// DirectAnimation Point2 Behavior Object
abstract class DAPoint2 {
  mixin(uuid("c46c1bc8-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID CLSID = { 0xc46c1bc8, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  mixin Interfaces!(IDAPoint2);
}

// DirectAnimation Point3 Behavior Object
abstract class DAPoint3 {
  mixin(uuid("c46c1bd8-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID CLSID = { 0xc46c1bd8, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  mixin Interfaces!(IDAPoint3);
}

// DirectAnimation Sound Behavior Object
abstract class DASound {
  mixin(uuid("c46c1be4-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID CLSID = { 0xc46c1be4, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  mixin Interfaces!(IDASound);
}

// DirectAnimation String Behavior Object
abstract class DAString {
  mixin(uuid("c46c1bc4-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID CLSID = { 0xc46c1bc4, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  mixin Interfaces!(IDAString);
}

// DirectAnimation Transform2 Behavior Object
abstract class DATransform2 {
  mixin(uuid("c46c1bcc-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID CLSID = { 0xc46c1bcc, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  mixin Interfaces!(IDATransform2);
}

// DirectAnimation Transform3 Behavior Object
abstract class DATransform3 {
  mixin(uuid("c46c1bdc-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID CLSID = { 0xc46c1bdc, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  mixin Interfaces!(IDATransform3);
}

// DirectAnimation Vector2 Behavior Object
abstract class DAVector2 {
  mixin(uuid("c46c1bca-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID CLSID = { 0xc46c1bca, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  mixin Interfaces!(IDAVector2);
}

// DirectAnimation Vector3 Behavior Object
abstract class DAVector3 {
  mixin(uuid("c46c1bda-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID CLSID = { 0xc46c1bda, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  mixin Interfaces!(IDAVector3);
}

// DirectAnimation FontStyle Behavior Object
abstract class DAFontStyle {
  mixin(uuid("25b0f91c-d23d-11d0-9b85-00c04fc2f51d"));
  // static DWINGUID CLSID = { 0x25b0f91c, 0xd23d, 0x11d0, 0x9b, 0x85, 0x00, 0xc0, 0x4f, 0xc2, 0xf5, 0x1d };
  mixin Interfaces!(IDA2FontStyle);
}

// DirectAnimation LineStyle Behavior Object
abstract class DALineStyle {
  mixin(uuid("c46c1bf2-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID CLSID = { 0xc46c1bf2, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  mixin Interfaces!(IDA2LineStyle);
}

// DirectAnimation EndStyle Behavior Object
abstract class DAEndStyle {
  mixin(uuid("c46c1bec-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID CLSID = { 0xc46c1bec, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  mixin Interfaces!(IDAEndStyle);
}

// DirectAnimation JoinStyle Behavior Object
abstract class DAJoinStyle {
  mixin(uuid("c46c1bee-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID CLSID = { 0xc46c1bee, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  mixin Interfaces!(IDAJoinStyle);
}

// DirectAnimation DashStyle Behavior Object
abstract class DADashStyle {
  mixin(uuid("c46c1bf0-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID CLSID = { 0xc46c1bf0, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  mixin Interfaces!(IDADashStyle);
}

// DirectAnimation Bbox2 Behavior Object
abstract class DABbox2 {
  mixin(uuid("c46c1bce-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID CLSID = { 0xc46c1bce, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  mixin Interfaces!(IDABbox2);
}

// DirectAnimation Bbox3 Behavior Object
abstract class DABbox3 {
  mixin(uuid("c46c1bde-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID CLSID = { 0xc46c1bde, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  mixin Interfaces!(IDABbox3);
}

// DirectAnimation Pair Behavior Object
abstract class DAPair {
  mixin(uuid("c46c1bf4-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID CLSID = { 0xc46c1bf4, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  mixin Interfaces!(IDAPair);
}

// DirectAnimation Event Behavior Object
abstract class DAEvent {
  mixin(uuid("50b4791f-4731-11d0-8912-00c04fc2a0ca"));
  // static DWINGUID CLSID = { 0x50b4791f, 0x4731, 0x11d0, 0x89, 0x12, 0x00, 0xc0, 0x4f, 0xc2, 0xa0, 0xca };
  mixin Interfaces!(IDA2Event);
}

// DirectAnimation Array Behavior Object
abstract class DAArray {
  mixin(uuid("d17506c3-6b26-11d0-8914-00c04fc2a0ca"));
  // static DWINGUID CLSID = { 0xd17506c3, 0x6b26, 0x11d0, 0x89, 0x14, 0x00, 0xc0, 0x4f, 0xc2, 0xa0, 0xca };
  mixin Interfaces!(IDA3Array);
}

// DirectAnimation Tuple Behavior Object
abstract class DATuple {
  mixin(uuid("5dfb2651-9668-11d0-b17b-00c04fc2a0ca"));
  // static DWINGUID CLSID = { 0x5dfb2651, 0x9668, 0x11d0, 0xb1, 0x7b, 0x00, 0xc0, 0x4f, 0xc2, 0xa0, 0xca };
  mixin Interfaces!(IDATuple);
}

// DirectAnimation Userdata Behavior Object
abstract class DAUserData {
  mixin(uuid("af868304-ab0b-11d0-876a-00c04fc29d46"));
  // static DWINGUID CLSID = { 0xaf868304, 0xab0b, 0x11d0, 0x87, 0x6a, 0x00, 0xc0, 0x4f, 0xc2, 0x9d, 0x46 };
  mixin Interfaces!(IDAUserData);
}

// OBSOLETE: DirectAnimation ImportationResult Object
abstract class DAImportationResult {
  mixin(uuid("bcbb1f75-e384-11d0-9b99-00c04fc2f51d"));
  // static DWINGUID CLSID = { 0xbcbb1f75, 0xe384, 0x11d0, 0x9b, 0x99, 0x00, 0xc0, 0x4f, 0xc2, 0xf5, 0x1d };
  mixin Interfaces!(IDAImportationResult);
}

// OBSOLETE: DirectAnimation PickableResult Object
abstract class DAPickableResult {
  mixin(uuid("bcbb1f74-e384-11d0-9b99-00c04fc2f51d"));
  // static DWINGUID CLSID = { 0xbcbb1f74, 0xe384, 0x11d0, 0x9b, 0x99, 0x00, 0xc0, 0x4f, 0xc2, 0xf5, 0x1d };
  mixin Interfaces!(IDAPickableResult);
}
