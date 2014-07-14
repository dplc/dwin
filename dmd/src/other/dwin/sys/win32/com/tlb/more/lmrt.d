// LM Library
// Version 1.0

/*[uuid("183c2598-0480-11d1-87ea-00c04fc29d46")]*/
//module dwin.sys.win32.com.tlb.more.liquidmotion;
module dwin.sys.win32.com.tlb.more.lmrt;

private import dwin.sys.win32.com.tlb.stdole2;
/*[importlib("danim.dll")]*/
private import dwin.sys.win32.com.Core;
private import dwin.sys.win32.com.tlb.danim;

// Enums

enum __MIDL___MIDL_itf_lmrt_0191_0001 {
  DAEmpty = 0x00000000,
  DASolid = 0x00000001,
  DADash = 0x00000002,
}

enum __MIDL___MIDL_itf_lmrt_0191_0002 {
  DAEndFlat = 0x00000000,
  DAEndSquare = 0x00000001,
  DAEndRound = 0x00000002,
}

enum __MIDL___MIDL_itf_lmrt_0191_0003 {
  DAJoinBevel = 0x00000000,
  DAJoinRound = 0x00000001,
  DAJoinMiter = 0x00000002,
}

enum __MIDL___MIDL_itf_lmrt_0199_0001 {
  DAMultimediaTimer = 0x00000000,
  DAContainerTimer = 0x00000001,
  DAWMTimer = 0x00000002,
}

enum ActorBvrFlags {
  e_None = 0x00000000,
  e_Absolute = 0x00000001,
  e_AbsoluteAccum = 0x00000002,
  e_Relative = 0x00000003,
  e_RelativeAccum = 0x00000004,
  e_RelativeReset = 0x00000005,
  e_RelativeFrom = 0x00000006,
  e_Filter = 0x00000007,
  e_ScaledImage = 0x00000008,
  e_UnscaledImage = 0x00000009,
  e_Static = 0x0000000A,
  e_Intermediate = 0x0000000B,
  e_Composed = 0x0000000C,
  e_Final = 0x0000000D,
  e_From = 0x0000000E,
}

enum ActorBvrType {
  e_Translation = 0x00000000,
  e_Rotation = 0x00000001,
  e_Scale = 0x00000002,
  e_Color = 0x00000003,
  e_Number = 0x00000004,
  e_String = 0x00000005,
  e_Effect = 0x00000006,
  e_Image = 0x00000007,
}

// Interfaces

// LM Engine COM Control
interface ILMEngine : IDispatch {
  mixin(uuid("c533adf0-0c80-11d1-8c54-00a02468f316"));
  // static DWINGUID IID = { 0xc533adf0, 0x0c80, 0x11d1, 0x8c, 0x54, 0x00, 0xa0, 0x24, 0x68, 0xf3, 0x16 };
  // method run
  /*[id(0x00000001)]*/ int runFromStream(IStream pStream);
  // method run
  /*[id(0x00000002)]*/ int runFromURL(wchar* url);
  // ClientSite property
  /*[id(0x00000003)]*/ int set_ClientSite(IOleClientSite value);
  // Image property
  /*[id(0x00000004)]*/ int get_Image(out IDAImage pVal);
  // Sound property
  /*[id(0x00000005)]*/ int get_Sound(out IDASound pVal);
  // Reader control property
  /*[id(0x00000006)]*/ int set_Reader(ILMReader value);
  // method initNotify
  /*[id(0x00000007)]*/ int initNotify(ubyte* bytes, uint count, out IDAUntilNotifier pNotifier);
  // GetBehavior method
  /*[id(0x00000008)]*/ int GetBehavior(wchar* tag, IDABehavior pIDefaultBvr, out IDABehavior pVal);
  // SetAsyncBlkSize method
  /*[id(0x00000009)]*/ int SetAsyncBlkSize(int blkSize);
  // SetAsyncDelay method
  /*[id(0x0000000A)]*/ int SetAsyncDelay(int delay);
  // AbortExecution method
  /*[id(0x0000000B)]*/ int AbortExecution();
  // initAsync method
  /*[id(0x0000000C)]*/ int initAsync();
}

// DirectAnimation Image Behavior
interface IDAImage : IDABehavior {
  mixin(uuid("c46c1bd3-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID IID = { 0xc46c1bd3, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  /*[id(0x60030000)]*/ int Pickable(out IDAPickableResult ret_0);
  /*[id(0x60030001)]*/ int PickableOccluded(out IDAPickableResult ret_0);
  /*[id(0x60030002)]*/ int ApplyBitmapEffect(IUnknown effectToApply_0, IDAEvent* firesWhenChanged_1, out IDAImage ret_2);
  /*[id(0x60030003)]*/ int get_BoundingBox(out IDABbox2 ret_0);
  /*[id(0x60030004)]*/ int Crop(IDAPoint2* min_0, IDAPoint2 max_1, out IDAImage ret_2);
  /*[id(0x60030005)]*/ int Transform(IDATransform2* xf_0, out IDAImage ret_1);
  /*[id(0x60030006)]*/ int OpacityAnim(IDANumber opacity_0, out IDAImage ret_1);
  /*[id(0x60030007)]*/ int Opacity(double opacity_0, out IDAImage ret_1);
  /*[id(0x60030008)]*/ int Undetectable(out IDAImage ret_0);
  /*[id(0x60030009)]*/ int Tile(out IDAImage ret_0);
  /*[id(0x6003000A)]*/ int Clip(IDAMatte* m_0, out IDAImage ret_1);
  /*[id(0x6003000B)]*/ int MapToUnitSquare(out IDAImage ret_0);
  /*[id(0x6003000C)]*/ int ClipPolygonImageEx(int points_0size, IDAPoint2* points_0, out IDAImage ret_1);
  /*[id(0x6003000D)]*/ int ClipPolygonImage(DWINVARIANT points_0, out IDAImage ret_1);
}

// DirectAnimation Behavior
interface IDABehavior : IDispatch {
  mixin(uuid("283807b7-2c60-11d0-a31d-00aa00b92c03"));
  // static DWINGUID IID = { 0x283807b7, 0x2c60, 0x11d0, 0xa3, 0x1d, 0x00, 0xaa, 0x00, 0xb9, 0x2c, 0x03 };
  /*[id(0x60020000)]*/ int GetClassName(out wchar* pClassName);
  /*[id(0x60020001)]*/ int Init(IDABehavior toBvr);
  /*[id(0x60020002)]*/ int Importance(double relativeImportance, out IDABehavior ppBvr);
  /*[id(0x60020003)]*/ int RunOnce(out IDABehavior bvr);
  /*[id(0x60020004)]*/ int SubstituteTime(IDANumber* xform, out IDABehavior bvr);
  /*[id(0x60020005)]*/ int SwitchTo(IDABehavior SwitchTo);
  /*[id(0x60020006)]*/ int SwitchToNumber(double numToSwitchTo);
  /*[id(0x60020007)]*/ int SwitchToString(wchar* strToSwitchTo);
  /*[id(0x60020008)]*/ int Hook(IDABvrHook* notifier, out IDABehavior pBvr);
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
  /*[id(0x60030000)]*/ int RenderSound(IDAMicrophone* mic_0, out IDASound ret_1);
  /*[id(0x60030001)]*/ int Pickable(out IDAPickableResult ret_0);
  /*[id(0x60030002)]*/ int PickableOccluded(out IDAPickableResult ret_0);
  /*[id(0x60030003)]*/ int Undetectable(out IDAGeometry ret_0);
  /*[id(0x60030004)]*/ int EmissiveColor(IDAColor col_0, out IDAGeometry ret_1);
  /*[id(0x60030005)]*/ int DiffuseColor(IDAColor col_0, out IDAGeometry ret_1);
  /*[id(0x60030006)]*/ int SpecularColor(IDAColor col_0, out IDAGeometry ret_1);
  /*[id(0x60030007)]*/ int SpecularExponent(double power_0, out IDAGeometry ret_1);
  /*[id(0x60030008)]*/ int SpecularExponentAnim(IDANumber power_0, out IDAGeometry ret_1);
  /*[id(0x60030009)]*/ int Texture(IDAImage* texture_0, out IDAGeometry ret_1);
  /*[id(0x6003000A)]*/ int Opacity(double level_0, out IDAGeometry ret_1);
  /*[id(0x6003000B)]*/ int OpacityAnim(IDANumber level_0, out IDAGeometry ret_1);
  /*[id(0x6003000C)]*/ int Transform(IDATransform3* xf_0, out IDAGeometry ret_1);
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
  /*[id(0x60020000)]*/ int Notify(IDABehavior eventData, IDABehavior curRunningBvr, IDAView* curView, out IDABehavior ppBvr);
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

// DirectAnimation View Site interface
interface IDAViewSite : IDispatch {
  mixin(uuid("283807b3-2c60-11d0-a31d-00aa00b92c03"));
  // static DWINGUID IID = { 0x283807b3, 0x2c60, 0x11d0, 0xa3, 0x1d, 0x00, 0xaa, 0x00, 0xb9, 0x2c, 0x03 };
  /*[id(0x60020000)]*/ int SetStatusText(wchar* StatusText);
}

// DirectAnimation View Preferences
interface IDAPreferences : IDispatch {
  mixin(uuid("69b5bc70-9b19-11d0-9b60-00c04fc2f51d"));
  // static DWINGUID IID = { 0x69b5bc70, 0x9b19, 0x11d0, 0x9b, 0x60, 0x00, 0xc0, 0x4f, 0xc2, 0xf5, 0x1d };
  /*[id(0x60020000)]*/ int PutPreference(wchar* preferenceName, DWINVARIANT value);
  /*[id(0x60020001)]*/ int GetPreference(wchar* preferenceName, out DWINVARIANT value);
  /*[id(0x60020002)]*/ int Propagate();
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

// LM ActiveX reader interface
interface ILMReader : IDispatch {
  mixin(uuid("183c2599-0480-11d1-87ea-00c04fc29d46"));
  // static DWINGUID IID = { 0x183c2599, 0x0480, 0x11d1, 0x87, 0xea, 0x00, 0xc0, 0x4f, 0xc2, 0x9d, 0x46 };
  // Image property
  /*[id(0x00000001)]*/ int get_Image(out IDAImage pVal);
  // Sound property
  /*[id(0x00000002)]*/ int get_Sound(out IDASound pVal);
  // LMEngine COM object property
  /*[id(0x00000003)]*/ int get_Engine(out ILMEngine pVal);
  // createEngine method
  /*[id(0x00000004)]*/ int createEngine(out ILMEngine pVal);
  // execute method
  /*[id(0x00000005)]*/ int execute(wchar* url, out ILMEngine pVal);
  // NoExports property
  /*[id(0x00000006)]*/ int get_NoExports(out short pVal);
  // NoExports property
  /*[id(0x00000006)]*/ int set_NoExports(short pVal);
  // Async property
  /*[id(0x00000007)]*/ int get_Async(out short pVal);
  // Async property
  /*[id(0x00000007)]*/ int set_Async(short pVal);
  // Src property
  /*[id(0x00000008)]*/ int get_Src(out wchar* url);
  // create Async Engine method
  /*[id(0x00000009)]*/ int createAsyncEngine(out ILMEngine pVal);
}

// LM ActiveX reader interface
interface ILMReader2 : ILMReader {
  mixin(uuid("7a6de760-ff0e-11d1-babd-00a0c999c4c0"));
  // static DWINGUID IID = { 0x7a6de760, 0xff0e, 0x11d1, 0xba, 0xbd, 0x00, 0xa0, 0xc9, 0x99, 0xc4, 0xc0 };
  // ViewerControl property
  /*[id(0x0000000A)]*/ int get_ViewerControl(out IDAViewerControl ViewerControl);
  // ViewerControl property
  /*[id(0x0000000A)]*/ int set_ViewerControl(IDAViewerControl ViewerControl);
  // Version String property
  /*[id(0x0000000B)]*/ int get_VersionString(out wchar* VersionString);
  // releaseFilterGraph method
  /*[id(0x0000000C)]*/ int releaseFilterGraph();
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
  /*[id(0x60020011)]*/ int get_TimerSource(out __MIDL___MIDL_itf_lmrt_0199_0001 ts);
  /*[id(0x60020011)]*/ int set_TimerSource(__MIDL___MIDL_itf_lmrt_0199_0001 ts);
  // Add a error handling routine
  /*[id(0x60020013)]*/ int RegisterErrorHandler(wchar* scriptlet);
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
  /*[id(0x60020007)]*/ int TriggerEvent(IDAEvent event, IDABehavior data);
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

// DirectAnimation Site interface
interface IDASite : IDispatch {
  mixin(uuid("45393df0-54b9-11cf-92a2-00aa00b8a733"));
  // static DWINGUID IID = { 0x45393df0, 0x54b9, 0x11cf, 0x92, 0xa2, 0x00, 0xaa, 0x00, 0xb8, 0xa7, 0x33 };
  /*[id(0x60020000)]*/ int SetStatusText(wchar* StatusText);
  /*[id(0x60020001)]*/ int ReportError(int hr, wchar* ErrorText);
  /*[id(0x60020002)]*/ int ReportGC(short bStarting);
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
  /*[id(0x60020013)]*/ int LineDashStyle(__MIDL___MIDL_itf_lmrt_0191_0001 id);
  /*[id(0x60020014)]*/ int LineEndStyle(__MIDL___MIDL_itf_lmrt_0191_0002 id);
  /*[id(0x60020015)]*/ int LineJoinStyle(__MIDL___MIDL_itf_lmrt_0191_0003 id);
  /*[id(0x60020016)]*/ int BorderColor(IDAColor clr);
  /*[id(0x60020017)]*/ int BorderWidth(double w);
  /*[id(0x60020018)]*/ int BorderDashStyle(__MIDL___MIDL_itf_lmrt_0191_0001 id);
  /*[id(0x60020019)]*/ int BorderEndStyle(__MIDL___MIDL_itf_lmrt_0191_0002 obsolete);
  /*[id(0x6002001A)]*/ int BorderJoinStyle(__MIDL___MIDL_itf_lmrt_0191_0003 id);
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
  /*[id(0x60030000)]*/ int End(IDAEndStyle* obsolete_0, out IDALineStyle obsolete_1);
  /*[id(0x60030001)]*/ int Join(IDAJoinStyle* obsolete_0, out IDALineStyle obsolete_1);
  /*[id(0x60030002)]*/ int Dash(IDADashStyle* obsolete_0, out IDALineStyle obsolete_1);
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
  /*[id(0x60030001)]*/ int BoundingBox(IDALineStyle* style_0, out IDABbox2 ret_1);
  /*[id(0x60030002)]*/ int Fill(IDALineStyle border_0, IDAImage fill_1, out IDAImage ret_2);
  /*[id(0x60030003)]*/ int Draw(IDALineStyle border_0, out IDAImage ret_1);
  /*[id(0x60030004)]*/ int Close(out IDAPath2 ret_0);
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

// DirectAnimation Userdata Behavior
interface IDAUserData : IDABehavior {
  mixin(uuid("af868305-ab0b-11d0-876a-00c04fc29d46"));
  // static DWINGUID IID = { 0xaf868305, 0xab0b, 0x11d0, 0x87, 0x6a, 0x00, 0xc0, 0x4f, 0xc2, 0x9d, 0x46 };
  /*[id(0x60030000)]*/ int get_data(out IUnknown ret_0);
}

// DirectAnimation Montage Behavior
interface IDAMontage : IDABehavior {
  mixin(uuid("c46c1bd5-3c52-11d0-9200-848c1d000000"));
  // static DWINGUID IID = { 0xc46c1bd5, 0x3c52, 0x11d0, 0x92, 0x00, 0x84, 0x8c, 0x1d, 0x00, 0x00, 0x00 };
  /*[id(0x60030000)]*/ int Render(out IDAImage ret_0);
}

// LM Engine Codec Download Interface
interface ILMCodecDownload : IUnknown {
  mixin(uuid("eb823ed0-110d-11d2-bad2-00a0c999c4c0"));
  // static DWINGUID IID = { 0xeb823ed0, 0x110d, 0x11d2, 0xba, 0xd2, 0x00, 0xa0, 0xc9, 0x99, 0xc4, 0xc0 };
  // method setAutoCodecDownloadEnabled
  /*[id(0x00000001)]*/ int setAutoCodecDownloadEnabled(int bEnabled);
}

// LM Engine Wrapper Interface
interface ILMEngineWrapper : IUnknown {
  mixin(uuid("56565b88-3dd1-11d2-9f05-0060b0c3c4f4"));
  // static DWINGUID IID = { 0x56565b88, 0x3dd1, 0x11d2, 0x9f, 0x05, 0x00, 0x60, 0xb0, 0xc3, 0xc4, 0xf4 };
  // method getWrapped
  /*[id(0x00000001)]*/ int GetWrapped(out IUnknown ppWrapped);
  // method setWrapped
  /*[id(0x00000002)]*/ int SetWrapped(IUnknown pWrapped);
  // method invalidate
  /*[id(0x00000003)]*/ int Invalidate();
}

// LM Engine Execute Interface
interface ILMEngineExecute : IUnknown {
  mixin(uuid("cefb610e-3e9f-11d2-9f06-0060b0c3c4f4"));
  // static DWINGUID IID = { 0xcefb610e, 0x3e9f, 0x11d2, 0x9f, 0x06, 0x00, 0x60, 0xb0, 0xc3, 0xc4, 0xf4 };
  // method ExportBehavior
  /*[id(0x00000001)]*/ int ExportBehavior(wchar* key, IDABehavior toExport);
  // method SetImage
  /*[id(0x00000002)]*/ int SetImage(IDAImage pImage);
  // method SetSound
  /*[id(0x00000003)]*/ int SetSound(IDASound pSound);
  // method SetStopEvent
  /*[id(0x00000004)]*/ int SetStopEvent(IDAEvent pNewStopEvent, int bOverwrite);
  // method SetStartEvent
  /*[id(0x00000005)]*/ int SetStartEvent(IDAEvent pNewStartEvent, int bOverwrite);
}

// LM Engine COM Control
interface ILMEngine2 : ILMEngine {
  mixin(uuid("686d9e60-ff11-11d1-babd-00a0c999c4c0"));
  // static DWINGUID IID = { 0x686d9e60, 0xff11, 0x11d1, 0xba, 0xbd, 0x00, 0xa0, 0xc9, 0x99, 0xc4, 0xc0 };
  // OnMemDataAvailable method
  /*[id(0x0000000D)]*/ int OnMemDataAvailable(byte lastBlock, uint blockSize, ubyte* block);
  // Start Method
  /*[id(0x0000000E)]*/ int Start(long rtNow);
  // Stop Method
  /*[id(0x0000000F)]*/ int Stop();
  // SetMediaCacheDir Method
  /*[id(0x00000010)]*/ int SetMediaCacheDir(ushort* wsz);
  // setParentEngine Method
  /*[id(0x00000011)]*/ int setParentEngine(ILMEngine2 ParentEngine);
  // clearParentEngine Method
  /*[id(0x00000012)]*/ int clearParentEngine();
  // getCurrentGraphTime Method
  /*[id(0x00000013)]*/ int getCurrentGraphTime(out double pGraphTime);
  // releaseFilterGraph method
  /*[id(0x00000014)]*/ int releaseFilterGraph();
  // releaseAllFilterGraph method
  /*[id(0x00000015)]*/ int releaseAllFilterGraph();
  // disableAutoAntialias method
  /*[id(0x00000016)]*/ int disableAutoAntialias();
  // ensureBlockSize method
  /*[id(0x00000017)]*/ int ensureBlockSize(uint blockSize);
}

// ILMAutoEffectBvr Interface
interface ILMAutoEffectBvr : IDispatch {
  mixin(uuid("b2a46902-74e0-11d2-9bee-00c04fa34789"));
  // static DWINGUID IID = { 0xb2a46902, 0x74e0, 0x11d2, 0x9b, 0xee, 0x00, 0xc0, 0x4f, 0xa3, 0x47, 0x89 };
  /*[id(0x00000001)]*/ int get_animates(out DWINVARIANT pVal);
  /*[id(0x00000001)]*/ int set_animates(DWINVARIANT pVal);
  /*[id(0x00000002)]*/ int get_type(out DWINVARIANT pVal);
  /*[id(0x00000002)]*/ int set_type(DWINVARIANT pVal);
  /*[id(0x00000003)]*/ int get_cause(out DWINVARIANT pVal);
  /*[id(0x00000003)]*/ int set_cause(DWINVARIANT pVal);
  /*[id(0x00000004)]*/ int get_span(out DWINVARIANT pVal);
  /*[id(0x00000004)]*/ int set_span(DWINVARIANT pVal);
  /*[id(0x00000005)]*/ int get_Size(out DWINVARIANT pVal);
  /*[id(0x00000005)]*/ int set_Size(DWINVARIANT pVal);
  /*[id(0x00000006)]*/ int get_Rate(out DWINVARIANT pVal);
  /*[id(0x00000006)]*/ int set_Rate(DWINVARIANT pVal);
  /*[id(0x00000007)]*/ int get_gravity(out DWINVARIANT pVal);
  /*[id(0x00000007)]*/ int set_gravity(DWINVARIANT pVal);
  /*[id(0x00000008)]*/ int get_wind(out DWINVARIANT pVal);
  /*[id(0x00000008)]*/ int set_wind(DWINVARIANT pVal);
  /*[id(0x00000009)]*/ int get_FillColor(out DWINVARIANT pVal);
  /*[id(0x00000009)]*/ int set_FillColor(DWINVARIANT pVal);
  /*[id(0x0000000A)]*/ int get_strokeColor(out DWINVARIANT pVal);
  /*[id(0x0000000A)]*/ int set_strokeColor(DWINVARIANT pVal);
  /*[id(0x0000000B)]*/ int get_Opacity(out DWINVARIANT pVal);
  /*[id(0x0000000B)]*/ int set_Opacity(DWINVARIANT pVal);
  /*[id(0x0000000C)]*/ int buildBehaviorFragments(IDispatch pActorDisp);
  /*[id(0x0000000D)]*/ int mouseEvent(int X, int Y, short bMove, short bUp, short bShift, short bAlt, short bCtrl, int button);
}

// ILMBehaviorFactory Interface
interface ILMBehaviorFactory : IDispatch {
  mixin(uuid("b1549e57-3894-11d2-bb7f-00a0c999c4c1"));
  // static DWINGUID IID = { 0xb1549e57, 0x3894, 0x11d2, 0xbb, 0x7f, 0x00, 0xa0, 0xc9, 0x99, 0xc4, 0xc1 };
}

// ICrBehaviorFactory Interface
interface ICrBehaviorFactory : IDispatch {
  mixin(uuid("754ff232-5d4e-11d2-875b-00a0c93c09b3"));
  // static DWINGUID IID = { 0x754ff232, 0x5d4e, 0x11d2, 0x87, 0x5b, 0x00, 0xa0, 0xc9, 0x3c, 0x09, 0xb3 };
}

// ICrColorBvr Interface
interface ICrColorBvr : IDispatch {
  mixin(uuid("3845a173-eb30-11d1-9a23-00a0c879fe5f"));
  // static DWINGUID IID = { 0x3845a173, 0xeb30, 0x11d1, 0x9a, 0x23, 0x00, 0xa0, 0xc8, 0x79, 0xfe, 0x5f };
  /*[id(0x00000001)]*/ int set_from(DWINVARIANT pRetFrom);
  /*[id(0x00000001)]*/ int get_from(out DWINVARIANT pRetFrom);
  /*[id(0x00000002)]*/ int set_to(DWINVARIANT pRetTo);
  /*[id(0x00000002)]*/ int get_to(out DWINVARIANT pRetTo);
  /*[id(0x00000003)]*/ int set_property(DWINVARIANT pRetProperty);
  /*[id(0x00000003)]*/ int get_property(out DWINVARIANT pRetProperty);
  /*[id(0x00000004)]*/ int set_direction(DWINVARIANT pRetDirection);
  /*[id(0x00000004)]*/ int get_direction(out DWINVARIANT pRetDirection);
  /*[id(0x00000005)]*/ int set_animates(DWINVARIANT pRetAnimates);
  /*[id(0x00000005)]*/ int get_animates(out DWINVARIANT pRetAnimates);
  /*[id(0x00000006)]*/ int buildBehaviorFragments(IDispatch pActorDisp);
}

// ICrRotateBvr Interface
interface ICrRotateBvr : IDispatch {
  mixin(uuid("027713f1-5fa8-11d2-875b-00a0c93c09b3"));
  // static DWINGUID IID = { 0x027713f1, 0x5fa8, 0x11d2, 0x87, 0x5b, 0x00, 0xa0, 0xc9, 0x3c, 0x09, 0xb3 };
  /*[id(0x00000001)]*/ int set_from(DWINVARIANT pRetFrom);
  /*[id(0x00000001)]*/ int get_from(out DWINVARIANT pRetFrom);
  /*[id(0x00000002)]*/ int set_to(DWINVARIANT pRetTo);
  /*[id(0x00000002)]*/ int get_to(out DWINVARIANT pRetTo);
  /*[id(0x00000003)]*/ int set_by(DWINVARIANT pRetBy);
  /*[id(0x00000003)]*/ int get_by(out DWINVARIANT pRetBy);
  /*[id(0x00000004)]*/ int set_type(DWINVARIANT pRetType);
  /*[id(0x00000004)]*/ int get_type(out DWINVARIANT pRetType);
  /*[id(0x00000005)]*/ int set_mode(DWINVARIANT pRetMode);
  /*[id(0x00000005)]*/ int get_mode(out DWINVARIANT pRetMode);
  /*[id(0x00000006)]*/ int set_animates(DWINVARIANT pRetAnimates);
  /*[id(0x00000006)]*/ int get_animates(out DWINVARIANT pRetAnimates);
  /*[id(0x00000007)]*/ int buildBehaviorFragments(IDispatch pActorDisp);
}

// ICrScaleBvr Interface
interface ICrScaleBvr : IDispatch {
  mixin(uuid("e80353d1-677d-11d2-875e-00a0c93c09b3"));
  // static DWINGUID IID = { 0xe80353d1, 0x677d, 0x11d2, 0x87, 0x5e, 0x00, 0xa0, 0xc9, 0x3c, 0x09, 0xb3 };
  /*[id(0x00000001)]*/ int set_from(DWINVARIANT pRetFrom);
  /*[id(0x00000001)]*/ int get_from(out DWINVARIANT pRetFrom);
  /*[id(0x00000002)]*/ int set_to(DWINVARIANT pRetTo);
  /*[id(0x00000002)]*/ int get_to(out DWINVARIANT pRetTo);
  /*[id(0x00000003)]*/ int set_by(DWINVARIANT pRetBy);
  /*[id(0x00000003)]*/ int get_by(out DWINVARIANT pRetBy);
  /*[id(0x00000004)]*/ int set_type(DWINVARIANT pRetType);
  /*[id(0x00000004)]*/ int get_type(out DWINVARIANT pRetType);
  /*[id(0x00000005)]*/ int set_mode(DWINVARIANT pRetMode);
  /*[id(0x00000005)]*/ int get_mode(out DWINVARIANT pRetMode);
  /*[id(0x00000006)]*/ int set_animates(DWINVARIANT pRetAnimates);
  /*[id(0x00000006)]*/ int get_animates(out DWINVARIANT pRetAnimates);
  /*[id(0x00000007)]*/ int buildBehaviorFragments(IDispatch pActorDisp);
}

// ICrMoveBvr Interface
interface ICrMoveBvr : IDispatch {
  mixin(uuid("c5b86f31-69ee-11d2-875f-00a0c93c09b3"));
  // static DWINGUID IID = { 0xc5b86f31, 0x69ee, 0x11d2, 0x87, 0x5f, 0x00, 0xa0, 0xc9, 0x3c, 0x09, 0xb3 };
  /*[id(0x00000001)]*/ int set_from(DWINVARIANT pRetFrom);
  /*[id(0x00000001)]*/ int get_from(out DWINVARIANT pRetFrom);
  /*[id(0x00000002)]*/ int set_to(DWINVARIANT pRetTo);
  /*[id(0x00000002)]*/ int get_to(out DWINVARIANT pRetTo);
  /*[id(0x00000003)]*/ int set_by(DWINVARIANT pRetBy);
  /*[id(0x00000003)]*/ int get_by(out DWINVARIANT pRetBy);
  /*[id(0x00000005)]*/ int set_v(DWINVARIANT pRetPath);
  /*[id(0x00000005)]*/ int get_v(out DWINVARIANT pRetPath);
  /*[id(0x00000004)]*/ int set_animates(DWINVARIANT pRetAnimates);
  /*[id(0x00000004)]*/ int get_animates(out DWINVARIANT pRetAnimates);
  /*[id(0x00000006)]*/ int set_type(DWINVARIANT pRetType);
  /*[id(0x00000006)]*/ int get_type(out DWINVARIANT pRetType);
  /*[id(0x00000007)]*/ int set_mode(DWINVARIANT pRetMode);
  /*[id(0x00000007)]*/ int get_mode(out DWINVARIANT pRetMode);
  /*[id(0x00000008)]*/ int set_direction(DWINVARIANT pRetDirection);
  /*[id(0x00000008)]*/ int get_direction(out DWINVARIANT pRetDirection);
  /*[id(0x00000009)]*/ int buildBehaviorFragments(IDispatch pActorDisp);
}

// ICrMoveBvr2 Interface
interface ICrMoveBvr2 : ICrMoveBvr {
  mixin(uuid("2ddeabe2-faa5-11d2-b9dd-00c04f6843fa"));
  // static DWINGUID IID = { 0x2ddeabe2, 0xfaa5, 0x11d2, 0xb9, 0xdd, 0x00, 0xc0, 0x4f, 0x68, 0x43, 0xfa };
  /*[id(0x0000000A)]*/ int get_currentX(out DWINVARIANT pRetCurrent);
  /*[id(0x0000000B)]*/ int get_currentY(out DWINVARIANT pRetCurrent);
}

// ICrPathBvr Interface
interface ICrPathBvr : IDispatch {
  mixin(uuid("80f49561-6a9a-11d2-875f-00a0c93c09b3"));
  // static DWINGUID IID = { 0x80f49561, 0x6a9a, 0x11d2, 0x87, 0x5f, 0x00, 0xa0, 0xc9, 0x3c, 0x09, 0xb3 };
  /*[id(0x00000001)]*/ int set_v(DWINVARIANT pRetPath);
  /*[id(0x00000001)]*/ int get_v(out DWINVARIANT pRetPath);
  /*[id(0x00000002)]*/ int GetDATransform(IDispatch pDispProgress, out DWINVARIANT pRetTrans);
}

// ICrNumberBvr Interface
interface ICrNumberBvr : IDispatch {
  mixin(uuid("ecdb03d1-6e99-11d2-875f-00a0c93c09b3"));
  // static DWINGUID IID = { 0xecdb03d1, 0x6e99, 0x11d2, 0x87, 0x5f, 0x00, 0xa0, 0xc9, 0x3c, 0x09, 0xb3 };
  /*[id(0x00000001)]*/ int set_from(DWINVARIANT pRetFrom);
  /*[id(0x00000001)]*/ int get_from(out DWINVARIANT pRetFrom);
  /*[id(0x00000002)]*/ int set_to(DWINVARIANT pRetTo);
  /*[id(0x00000002)]*/ int get_to(out DWINVARIANT pRetTo);
  /*[id(0x00000003)]*/ int set_by(DWINVARIANT pRetBy);
  /*[id(0x00000003)]*/ int get_by(out DWINVARIANT pRetBy);
  /*[id(0x00000004)]*/ int set_type(DWINVARIANT pRetType);
  /*[id(0x00000004)]*/ int get_type(out DWINVARIANT pRetType);
  /*[id(0x00000005)]*/ int set_mode(DWINVARIANT pRetMode);
  /*[id(0x00000005)]*/ int get_mode(out DWINVARIANT pRetMode);
  /*[id(0x00000006)]*/ int set_property(DWINVARIANT pRetProperty);
  /*[id(0x00000006)]*/ int get_property(out DWINVARIANT pRetProperty);
  /*[id(0x00000008)]*/ int set_animates(DWINVARIANT pRetAnimates);
  /*[id(0x00000008)]*/ int get_animates(out DWINVARIANT pRetAnimates);
  /*[id(0x00000009)]*/ int buildBehaviorFragments(IDispatch pActorDisp);
}

// ICrSetBvr Interface
interface ICrSetBvr : IDispatch {
  mixin(uuid("ba60f741-6f72-11d2-875f-00a0c93c09b3"));
  // static DWINGUID IID = { 0xba60f741, 0x6f72, 0x11d2, 0x87, 0x5f, 0x00, 0xa0, 0xc9, 0x3c, 0x09, 0xb3 };
  /*[id(0x00000001)]*/ int set_value(DWINVARIANT pRetValue);
  /*[id(0x00000001)]*/ int get_value(out DWINVARIANT pRetValue);
  /*[id(0x00000002)]*/ int set_property(DWINVARIANT pRetProperty);
  /*[id(0x00000002)]*/ int get_property(out DWINVARIANT pRetProperty);
  /*[id(0x00000003)]*/ int set_type(DWINVARIANT pRetType);
  /*[id(0x00000003)]*/ int get_type(out DWINVARIANT pRetType);
  /*[id(0x00000004)]*/ int set_animates(DWINVARIANT pRetAnimates);
  /*[id(0x00000004)]*/ int get_animates(out DWINVARIANT pRetAnimates);
  /*[id(0x00000005)]*/ int buildBehaviorFragments(IDispatch pActorDisp);
}

// ICrEffectBvr Interface
interface ICrEffectBvr : IDispatch {
  mixin(uuid("54274111-7a5e-11d2-875f-00a0c93c09b3"));
  // static DWINGUID IID = { 0x54274111, 0x7a5e, 0x11d2, 0x87, 0x5f, 0x00, 0xa0, 0xc9, 0x3c, 0x09, 0xb3 };
  /*[id(0x00000001)]*/ int set_type(DWINVARIANT pRetType);
  /*[id(0x00000001)]*/ int get_type(out DWINVARIANT pRetType);
  /*[id(0x00000002)]*/ int set_animates(DWINVARIANT pRetAnimates);
  /*[id(0x00000002)]*/ int get_animates(out DWINVARIANT pRetAnimates);
  /*[id(0x00000003)]*/ int set_classid(DWINVARIANT pRetClassId);
  /*[id(0x00000003)]*/ int get_classid(out DWINVARIANT pRetClassId);
  /*[id(0x00000004)]*/ int set_transition(DWINVARIANT pRetTransition);
  /*[id(0x00000004)]*/ int get_transition(out DWINVARIANT pRetTransition);
  /*[id(0x00000005)]*/ int set_progid(DWINVARIANT pRetProgId);
  /*[id(0x00000005)]*/ int get_progid(out DWINVARIANT pRetProgId);
  /*[id(0x00000007)]*/ int set_direction(DWINVARIANT pRetDirection);
  /*[id(0x00000007)]*/ int get_direction(out DWINVARIANT pRetDirection);
  /*[id(0x00000006)]*/ int buildBehaviorFragments(IDispatch pActorDisp);
}

// ICrActorBvr Interface
interface ICrActorBvr : IDispatch {
  mixin(uuid("484c7a41-736c-11d2-a5e8-00a0c967a25f"));
  // static DWINGUID IID = { 0x484c7a41, 0x736c, 0x11d2, 0xa5, 0xe8, 0x00, 0xa0, 0xc9, 0x67, 0xa2, 0x5f };
  /*[id(0x00000001)]*/ int set_animates(DWINVARIANT pvarAnimates);
  /*[id(0x00000001)]*/ int get_animates(out DWINVARIANT pvarAnimates);
  /*[id(0x00000002)]*/ int set_scale(DWINVARIANT pRetScale);
  /*[id(0x00000002)]*/ int get_scale(out DWINVARIANT pRetScale);
  /*[id(0x00000003)]*/ int set_pixelScale(DWINVARIANT pRetPixelScale);
  /*[id(0x00000003)]*/ int get_pixelScale(out DWINVARIANT pRetPixelScale);
  /*[id(0x00000007)]*/ int getActorBehavior(wchar* bstrProperty, ActorBvrFlags eFlags, ActorBvrType eType, out DWINVARIANT pvarRetBvr);
  /*[id(0x00000004)]*/ int addBehaviorFragment(wchar* bstrProperty, IUnknown pdabvrAnimator, IUnknown pdaboolActive, IUnknown pdabvrTimeline, ActorBvrFlags eFlags, ActorBvrType eType);
  /*[id(0x00000005)]*/ int addMouseEventListener(IUnknown pUnkListener);
  /*[id(0x00000006)]*/ int removeMouseEventListener(IUnknown pUnkListener);
}

// ICrActorBvr Interface
interface ICrActorBvr2 : ICrActorBvr {
  mixin(uuid("b93d15fc-afc3-11d2-b0de-00a0c999c4c0"));
  // static DWINGUID IID = { 0xb93d15fc, 0xafc3, 0x11d2, 0xb0, 0xde, 0x00, 0xa0, 0xc9, 0x99, 0xc4, 0xc0 };
  /*[id(0x00000008)]*/ int addBehaviorFragmentEx(wchar* bstrProperty, IUnknown pdabvrAnimator, IUnknown pdaboolActive, IUnknown pdavrTimeline, ActorBvrFlags eFlags, ActorBvrType eType, IDispatch pdispBehaviorElement, out int pCookie);
  /*[id(0x00000009)]*/ int removeBehaviorFragment(int cookie);
  /*[id(0x0000000A)]*/ int requestRebuild(IDispatch pdispBehaviorElement);
  /*[id(0x0000000B)]*/ int cancelRebuildRequests(IDispatch pdispBehaviorElement);
  /*[id(0x0000000C)]*/ int rebuildNow();
  /*[id(0x0000000D)]*/ int getStatic(wchar* bstrTrackName, out DWINVARIANT pRetStatic);
  /*[id(0x0000000E)]*/ int setStatic(wchar* bstrTrackName, DWINVARIANT varStatic);
  /*[id(0x0000000F)]*/ int getDynamic(wchar* bstrTrackName, out DWINVARIANT pRetStatic);
  /*[id(0x00000010)]*/ int applyStatics();
  /*[id(0x00000011)]*/ int applyDynamics();
}

// ICrActionBvr Interface
interface ICrActionBvr : IDispatch {
  mixin(uuid("3045d45a-8304-11d2-9533-0060b0c3c4f4"));
  // static DWINGUID IID = { 0x3045d45a, 0x8304, 0x11d2, 0x95, 0x33, 0x00, 0x60, 0xb0, 0xc3, 0xc4, 0xf4 };
  /*[id(0x00000001)]*/ int buildBehaviorFragments(IDispatch pActorDisp);
}

// LMSample Interface
interface ILMSample : IUnknown {
  mixin(uuid("30c11f2c-78fd-11d2-952c-0060b0c3c4f4"));
  // static DWINGUID IID = { 0x30c11f2c, 0x78fd, 0x11d2, 0x95, 0x2c, 0x00, 0x60, 0xb0, 0xc3, 0xc4, 0xf4 };
  // Sample method
  /*[id(0x00000001)]*/ int Sample(double startTime, double globalNow, double localNow);
}

// CoClasses

// LM ActiveX reader class
abstract class LMReader {
  mixin(uuid("183c259a-0480-11d1-87ea-00c04fc29d46"));
  // static DWINGUID CLSID = { 0x183c259a, 0x0480, 0x11d1, 0x87, 0xea, 0x00, 0xc0, 0x4f, 0xc2, 0x9d, 0x46 };
  mixin Interfaces!(ILMReader2);
}

// LM Engine COM Control
abstract class LMEngine {
  mixin(uuid("c533adf1-0c80-11d1-8c54-00a02468f316"));
  // static DWINGUID CLSID = { 0xc533adf1, 0x0c80, 0x11d1, 0x8c, 0x54, 0x00, 0xa0, 0x24, 0x68, 0xf3, 0x16 };
  mixin Interfaces!(ILMEngine2);
}

// LMAutoEffectBvr Class
abstract class LMAutoEffectBvr {
  mixin(uuid("bb339a46-7c49-11d2-9bf3-00c04fa34789"));
  // static DWINGUID CLSID = { 0xbb339a46, 0x7c49, 0x11d2, 0x9b, 0xf3, 0x00, 0xc0, 0x4f, 0xa3, 0x47, 0x89 };
  mixin Interfaces!(ILMAutoEffectBvr);
}

// LMBehaviorFactory Class
abstract class LMBehaviorFactory {
  mixin(uuid("b1549e58-3894-11d2-bb7f-00a0c999c4c1"));
  // static DWINGUID CLSID = { 0xb1549e58, 0x3894, 0x11d2, 0xbb, 0x7f, 0x00, 0xa0, 0xc9, 0x99, 0xc4, 0xc1 };
  mixin Interfaces!(ILMBehaviorFactory);
}

// CrBehaviorFactory Class
abstract class CrBehaviorFactory {
  mixin(uuid("754ff233-5d4e-11d2-875b-00a0c93c09b3"));
  // static DWINGUID CLSID = { 0x754ff233, 0x5d4e, 0x11d2, 0x87, 0x5b, 0x00, 0xa0, 0xc9, 0x3c, 0x09, 0xb3 };
  mixin Interfaces!(ICrBehaviorFactory);
}

// Scale Behavior Class
abstract class CrScaleBvr {
  mixin(uuid("e80353d3-677d-11d2-875e-00a0c93c09b3"));
  // static DWINGUID CLSID = { 0xe80353d3, 0x677d, 0x11d2, 0x87, 0x5e, 0x00, 0xa0, 0xc9, 0x3c, 0x09, 0xb3 };
  mixin Interfaces!(ICrScaleBvr);
}

// Color Behavior Class
abstract class CrColorBvr {
  mixin(uuid("3845a174-eb30-11d1-9a23-00a0c879fe5f"));
  // static DWINGUID CLSID = { 0x3845a174, 0xeb30, 0x11d1, 0x9a, 0x23, 0x00, 0xa0, 0xc8, 0x79, 0xfe, 0x5f };
  mixin Interfaces!(ICrColorBvr);
}

// Rotate Behavior Class
abstract class CrRotateBvr {
  mixin(uuid("027713f2-5fa8-11d2-875b-00a0c93c09b3"));
  // static DWINGUID CLSID = { 0x027713f2, 0x5fa8, 0x11d2, 0x87, 0x5b, 0x00, 0xa0, 0xc9, 0x3c, 0x09, 0xb3 };
  mixin Interfaces!(ICrRotateBvr);
}

// Move Behavior Class
abstract class CrMoveBvr {
  mixin(uuid("c5b86f32-69ee-11d2-875f-00a0c93c09b3"));
  // static DWINGUID CLSID = { 0xc5b86f32, 0x69ee, 0x11d2, 0x87, 0x5f, 0x00, 0xa0, 0xc9, 0x3c, 0x09, 0xb3 };
  mixin Interfaces!(ICrMoveBvr);
}

// Path Behavior Class
abstract class CrPathBvr {
  mixin(uuid("80f49562-6a9a-11d2-875f-00a0c93c09b3"));
  // static DWINGUID CLSID = { 0x80f49562, 0x6a9a, 0x11d2, 0x87, 0x5f, 0x00, 0xa0, 0xc9, 0x3c, 0x09, 0xb3 };
  mixin Interfaces!(ICrPathBvr);
}

// Number Behavior Class
abstract class CrNumberBvr {
  mixin(uuid("ecdb03d2-6e99-11d2-875f-00a0c93c09b3"));
  // static DWINGUID CLSID = { 0xecdb03d2, 0x6e99, 0x11d2, 0x87, 0x5f, 0x00, 0xa0, 0xc9, 0x3c, 0x09, 0xb3 };
  mixin Interfaces!(ICrNumberBvr);
}

// Set Behavior Class
abstract class CrSetBvr {
  mixin(uuid("ba60f742-6f72-11d2-875f-00a0c93c09b3"));
  // static DWINGUID CLSID = { 0xba60f742, 0x6f72, 0x11d2, 0x87, 0x5f, 0x00, 0xa0, 0xc9, 0x3c, 0x09, 0xb3 };
  mixin Interfaces!(ICrSetBvr);
}

// Actor Behavior Class
abstract class CrActorBvr {
  mixin(uuid("6dde3061-736c-11d2-a5e8-00a0c967a25f"));
  // static DWINGUID CLSID = { 0x6dde3061, 0x736c, 0x11d2, 0xa5, 0xe8, 0x00, 0xa0, 0xc9, 0x67, 0xa2, 0x5f };
  mixin Interfaces!(ICrActorBvr);
}

// Effect Behavior Class
abstract class CrEffectBvr {
  mixin(uuid("54274112-7a5e-11d2-875f-00a0c93c09b3"));
  // static DWINGUID CLSID = { 0x54274112, 0x7a5e, 0x11d2, 0x87, 0x5f, 0x00, 0xa0, 0xc9, 0x3c, 0x09, 0xb3 };
  mixin Interfaces!(ICrEffectBvr);
}

// Action Behavior Class
abstract class CrActionBvr {
  mixin(uuid("58a2e406-8304-11d2-9533-0060b0c3c4f4"));
  // static DWINGUID CLSID = { 0x58a2e406, 0x8304, 0x11d2, 0x95, 0x33, 0x00, 0x60, 0xb0, 0xc3, 0xc4, 0xf4 };
  mixin Interfaces!(ICrActionBvr);
}
