// Version 1.0

/*[uuid("33adbfcc-3e0d-11d2-b948-00c04fa32195")]*/
//module dwin.sys.win32.com.tlb.more.time;
module dwin.sys.win32.com.tlb.more.datime;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum _MediaType {
  MT_Media = 0x00000000,
  MT_Image = 0x00000001,
  MT_Audio = 0x00000002,
  MT_Video = 0x00000003,
  MT_Animation = 0x00000004,
  MT_Textstream = 0x00000005,
}

// Unions

union __MIDL_IWinTypes_0009 {
  int hInproc;
  int hRemote;
}

// Structs

struct tagRECT {
  int left;
  int top;
  int right;
  int bottom;
}

struct _RemotableHandle {
  int fContext;
  __MIDL_IWinTypes_0009 u;
}

// Aliases

alias _RemotableHandle* wireHDC;

// Interfaces

interface ITIMEElement : IDispatch {
  mixin(uuid("e53dc05c-3f93-11d2-b948-00c04fa32195"));
  // static DWINGUID IID = { 0xe53dc05c, 0x3f93, 0x11d2, 0xb9, 0x48, 0x00, 0xc0, 0x4f, 0xa3, 0x21, 0x95 };
  /*[id(0x00000101)]*/ int get_begin(out DWINVARIANT TIME);
  /*[id(0x00000101)]*/ int set_begin(DWINVARIANT TIME);
  /*[id(0x00000102)]*/ int get_beginWith(out DWINVARIANT TIME);
  /*[id(0x00000102)]*/ int set_beginWith(DWINVARIANT TIME);
  /*[id(0x00000103)]*/ int get_beginAfter(out DWINVARIANT TIME);
  /*[id(0x00000103)]*/ int set_beginAfter(DWINVARIANT TIME);
  /*[id(0x00000104)]*/ int get_beginEvent(out DWINVARIANT TIME);
  /*[id(0x00000104)]*/ int set_beginEvent(DWINVARIANT TIME);
  /*[id(0x00000105)]*/ int get_dur(out DWINVARIANT TIME);
  /*[id(0x00000105)]*/ int set_dur(DWINVARIANT TIME);
  /*[id(0x00000106)]*/ int get_end(out DWINVARIANT TIME);
  /*[id(0x00000106)]*/ int set_end(DWINVARIANT TIME);
  /*[id(0x00000107)]*/ int get_endWith(out DWINVARIANT TIME);
  /*[id(0x00000107)]*/ int set_endWith(DWINVARIANT TIME);
  /*[id(0x00000108)]*/ int get_endEvent(out DWINVARIANT TIME);
  /*[id(0x00000108)]*/ int set_endEvent(DWINVARIANT TIME);
  /*[id(0x00000109)]*/ int get_endSync(out DWINVARIANT TIME);
  /*[id(0x00000109)]*/ int set_endSync(DWINVARIANT TIME);
  /*[id(0x0000010A)]*/ int get_repeat(out DWINVARIANT TIME);
  /*[id(0x0000010A)]*/ int set_repeat(DWINVARIANT TIME);
  /*[id(0x0000010B)]*/ int get_repeatDur(out DWINVARIANT TIME);
  /*[id(0x0000010B)]*/ int set_repeatDur(DWINVARIANT TIME);
  /*[id(0x0000011E)]*/ int get_accelerate(out int __MIDL_0010);
  /*[id(0x0000011E)]*/ int set_accelerate(int __MIDL_0010);
  /*[id(0x0000011F)]*/ int get_decelerate(out int __MIDL_0012);
  /*[id(0x0000011F)]*/ int set_decelerate(int __MIDL_0012);
  /*[id(0x00000122)]*/ int get_endHold(out short __MIDL_0014);
  /*[id(0x00000122)]*/ int set_endHold(short __MIDL_0014);
  /*[id(0x00000120)]*/ int get_autoReverse(out short __MIDL_0016);
  /*[id(0x00000120)]*/ int set_autoReverse(short __MIDL_0016);
  /*[id(0x00000121)]*/ int get_eventRestart(out short __MIDL_0018);
  /*[id(0x00000121)]*/ int set_eventRestart(short __MIDL_0018);
  /*[id(0x0000010C)]*/ int get_timeAction(out wchar* TIME);
  /*[id(0x0000010C)]*/ int set_timeAction(wchar* TIME);
  /*[id(0x0000010D)]*/ int beginElement();
  /*[id(0x0000010E)]*/ int endElement();
  /*[id(0x0000010F)]*/ int pause();
  /*[id(0x00000110)]*/ int resume();
  /*[id(0x00000111)]*/ int cue();
  /*[id(0x00000112)]*/ int get_timeline(out wchar* __MIDL_0020);
  /*[id(0x00000112)]*/ int set_timeline(wchar* __MIDL_0020);
  /*[id(0x00000113)]*/ int get_currTime(out float TIME);
  /*[id(0x00000113)]*/ int set_currTime(float TIME);
  /*[id(0x00000114)]*/ int get_localTime(out float TIME);
  /*[id(0x00000114)]*/ int set_localTime(float TIME);
  /*[id(0x00000115)]*/ int get_currState(out wchar* state);
  /*[id(0x00000116)]*/ int get_syncBehavior(out wchar* sync);
  /*[id(0x00000116)]*/ int set_syncBehavior(wchar* sync);
  /*[id(0x00000117)]*/ int get_syncTolerance(out DWINVARIANT tol);
  /*[id(0x00000117)]*/ int set_syncTolerance(DWINVARIANT tol);
  /*[id(0x00000119)]*/ int get_parentTIMEElement(out ITIMEElement parent);
  /*[id(0x00000119)]*/ int set_parentTIMEElement(ITIMEElement parent);
  /*[id(0x0000011A)]*/ int get_allTIMEElements(out ITIMEElementCollection ppDisp);
  /*[id(0x0000011B)]*/ int get_childrenTIMEElements(out ITIMEElementCollection ppDisp);
  /*[id(0x0000011C)]*/ int get_allTIMEInterfaces(out ITIMEElementCollection ppDisp);
  /*[id(0x0000011D)]*/ int get_childrenTIMEInterfaces(out ITIMEElementCollection ppDisp);
  /*[id(0x00000123)]*/ int get_timelineBehavior(out IDispatch bvr);
  /*[id(0x00000124)]*/ int get_progressBehavior(out IDispatch bvr);
  /*[id(0x00000125)]*/ int get_onOffBehavior(out IDispatch bvr);
}

interface ITIMEElementCollection : IDispatch {
  mixin(uuid("1c00bc3a-5e1c-11d2-b252-00a0c90d6111"));
  // static DWINGUID IID = { 0x1c00bc3a, 0x5e1c, 0x11d2, 0xb2, 0x52, 0x00, 0xa0, 0xc9, 0x0d, 0x61, 0x11 };
  /*[id(0x00000601)]*/ int set_length(int p);
  /*[id(0x00000601)]*/ int get_length(out int p);
  /*[id(0xFFFFFFFC)]*/ int get__newEnum(out IUnknown ppIUnknown);
  /*[id(0x00000000)]*/ int item(DWINVARIANT varName, DWINVARIANT varIndex, out IDispatch ppDisp);
  /*[id(0x00000602)]*/ int tags(DWINVARIANT varName, out IDispatch ppDisp);
}

interface ITIMEDAElementRenderSite : IUnknown {
  mixin(uuid("7a6af9a0-9355-11d2-80ba-00c04fa32195"));
  // static DWINGUID IID = { 0x7a6af9a0, 0x9355, 0x11d2, 0x80, 0xba, 0x00, 0xc0, 0x4f, 0xa3, 0x21, 0x95 };
  /*[id(0x60010000)]*/ int Invalidate(tagRECT* prc);
}

interface ITIMEDAElementRender : IUnknown {
  mixin(uuid("9e328494-9354-11d2-80ba-00c04fa32195"));
  // static DWINGUID IID = { 0x9e328494, 0x9354, 0x11d2, 0x80, 0xba, 0x00, 0xc0, 0x4f, 0xa3, 0x21, 0x95 };
  /*[id(0x60010000)]*/ int Tick();
  /*[id(0x60010001)]*/ int Draw(wireHDC dc, tagRECT* prc);
  /*[id(0x60010002)]*/ int get_RenderSite(out ITIMEDAElementRenderSite ppSite);
  /*[id(0x60010002)]*/ int set_RenderSite(ITIMEDAElementRenderSite ppSite);
}

interface ITIMEDAElement : IDispatch {
  mixin(uuid("17c7a570-4d53-11d2-b954-00c04fa32195"));
  // static DWINGUID IID = { 0x17c7a570, 0x4d53, 0x11d2, 0xb9, 0x54, 0x00, 0xc0, 0x4f, 0xa3, 0x21, 0x95 };
  /*[id(0x00000301)]*/ int get_image(out DWINVARIANT img);
  /*[id(0x00000301)]*/ int set_image(DWINVARIANT img);
  /*[id(0x00000302)]*/ int get_sound(out DWINVARIANT snd);
  /*[id(0x00000302)]*/ int set_sound(DWINVARIANT snd);
  /*[id(0x00000303)]*/ int get_renderMode(out DWINVARIANT mode);
  /*[id(0x00000303)]*/ int set_renderMode(DWINVARIANT mode);
  /*[id(0x00000304)]*/ int addDABehavior(DWINVARIANT bvr, out int cookie);
  /*[id(0x00000305)]*/ int removeDABehavior(int cookie);
  /*[id(0x00000306)]*/ int get_statics(out IDispatch ppStatics);
  /*[id(0x00000307)]*/ int get_renderObject(out ITIMEDAElementRender __MIDL_0022);
}

interface ITIMEBodyElement : ITIMEElement {
  mixin(uuid("111c45f0-4de9-11d2-b954-00c04fa32195"));
  // static DWINGUID IID = { 0x111c45f0, 0x4de9, 0x11d2, 0xb9, 0x54, 0x00, 0xc0, 0x4f, 0xa3, 0x21, 0x95 };
  /*[id(0x00000201)]*/ int get_timeStartRule(out wchar* startrule);
  /*[id(0x00000201)]*/ int set_timeStartRule(wchar* startrule);
  /*[id(0x00000202)]*/ int addTIMEDAElement(ITIMEDAElement daelm);
  /*[id(0x00000203)]*/ int removeTIMEDAElement(ITIMEDAElement daelm);
}

interface ITIMEMediaElement : ITIMEElement {
  mixin(uuid("68675562-53ab-11d2-b955-3078302c2030"));
  // static DWINGUID IID = { 0x68675562, 0x53ab, 0x11d2, 0xb9, 0x55, 0x30, 0x78, 0x30, 0x2c, 0x20, 0x30 };
  /*[id(0x00000401)]*/ int get_src(out DWINVARIANT url);
  /*[id(0x00000401)]*/ int set_src(DWINVARIANT url);
  /*[id(0x00000402)]*/ int get_img(out DWINVARIANT url);
  /*[id(0x00000402)]*/ int set_img(DWINVARIANT url);
  /*[id(0x00000403)]*/ int get_player(out DWINVARIANT clsid);
  /*[id(0x00000403)]*/ int set_player(DWINVARIANT clsid);
  /*[id(0x00000404)]*/ int get_type(out DWINVARIANT type);
  /*[id(0x00000404)]*/ int set_type(DWINVARIANT type);
  /*[id(0x00000405)]*/ int get_playerObject(out IDispatch ppDisp);
  /*[id(0x00000406)]*/ int get_clockSource(out short b);
  /*[id(0x00000406)]*/ int set_clockSource(short b);
  /*[id(0x00000407)]*/ int get_clipBegin(out DWINVARIANT type);
  /*[id(0x00000407)]*/ int set_clipBegin(DWINVARIANT type);
  /*[id(0x00000408)]*/ int get_clipEnd(out DWINVARIANT type);
  /*[id(0x00000408)]*/ int set_clipEnd(DWINVARIANT type);
}

interface ITIMEFactory : IDispatch {
  mixin(uuid("423e9da4-3e0d-11d2-b948-00c04fa32195"));
  // static DWINGUID IID = { 0x423e9da4, 0x3e0d, 0x11d2, 0xb9, 0x48, 0x00, 0xc0, 0x4f, 0xa3, 0x21, 0x95 };
  /*[id(0x00000501)]*/ int CreateTIMEElement(ref DWINGUID riid, IUnknown pUnk, void *timeelm);
  /*[id(0x00000502)]*/ int CreateTIMEBodyElement(ref DWINGUID riid, void *timeelm);
  /*[id(0x00000503)]*/ int CreateTIMEDAElement(ref DWINGUID riid, void *timeelm);
  /*[id(0x00000504)]*/ int CreateTIMEMediaElement(ref DWINGUID riid, _MediaType type, void *timeelm);
}

interface ITIMEMediaPlayer : IDispatch {
  mixin(uuid("e6faa0b2-69fe-11d2-b259-00a0c90d6111"));
  // static DWINGUID IID = { 0xe6faa0b2, 0x69fe, 0x11d2, 0xb2, 0x59, 0x00, 0xa0, 0xc9, 0x0d, 0x61, 0x11 };
  /*[id(0x0000080A)]*/ int Init();
  /*[id(0x00000801)]*/ int clipBegin(DWINVARIANT varClipBegin);
  /*[id(0x00000802)]*/ int clipEnd(DWINVARIANT varClipEnd);
  /*[id(0x00000803)]*/ int begin();
  /*[id(0x00000804)]*/ int end();
  /*[id(0x00000805)]*/ int resume();
  /*[id(0x00000806)]*/ int pause();
  /*[id(0x00000807)]*/ int Tick();
  /*[id(0x00000808)]*/ int set_CurrentTime(double dblCurrentTime);
  /*[id(0x00000808)]*/ int get_CurrentTime(out double dblCurrentTime);
  /*[id(0x00000809)]*/ int set_src(wchar* pbstrURL);
  /*[id(0x00000809)]*/ int get_src(out wchar* pbstrURL);
  /*[id(0x0000080B)]*/ int set_repeat(int ltime);
  /*[id(0x0000080B)]*/ int get_repeat(out int ltime);
  /*[id(0x0000080C)]*/ int cue();
}

interface TIMEMediaPlayerEvents : IDispatch {
  mixin(uuid("4539e412-7813-11d2-b25f-00a0c90d6111"));
  // static DWINGUID IID = { 0x4539e412, 0x7813, 0x11d2, 0xb2, 0x5f, 0x00, 0xa0, 0xc9, 0x0d, 0x61, 0x11 };
  /+/*[id(0x00000901)]*/ void onbegin();+/
  /+/*[id(0x00000902)]*/ void onend();+/
  /+/*[id(0x00000903)]*/ void onresume();+/
  /+/*[id(0x00000904)]*/ void onpause();+/
  /+/*[id(0x00000905)]*/ void onmediaready();+/
  /+/*[id(0x00000906)]*/ void onmediaslip();+/
  /+/*[id(0x00000907)]*/ void onmedialoadfailed();+/
  /+/*[id(0xFFFFFD9F)]*/ void onreadystatechange(int readystate);+/
}

interface ITIMEMMFactory : IDispatch {
  mixin(uuid("73ba8f8a-80e0-11d2-b263-00a0c90d6111"));
  // static DWINGUID IID = { 0x73ba8f8a, 0x80e0, 0x11d2, 0xb2, 0x63, 0x00, 0xa0, 0xc9, 0x0d, 0x61, 0x11 };
  /*[id(0x60020000)]*/ int CreateBehavior(wchar* id, IDispatch bvr, out IUnknown ppOut);
  /*[id(0x60020001)]*/ int CreateTimeline(wchar* id, out IUnknown ppOut);
  /*[id(0x60020002)]*/ int CreatePlayer(wchar* id, IUnknown bvr, IServiceProvider sp, out IUnknown ppOut);
  /*[id(0x60020003)]*/ int CreateView(wchar* id, IDispatch imgbvr, IDispatch sndbvr, IUnknown viewsite, out IUnknown ppOut);
}

interface IServiceProvider : IUnknown {
  mixin(uuid("6d5140c1-7436-11ce-8034-00aa006009fa"));
  // static DWINGUID IID = { 0x6d5140c1, 0x7436, 0x11ce, 0x80, 0x34, 0x00, 0xaa, 0x00, 0x60, 0x09, 0xfa };
  /*[id(0x60010000)]*/ int RemoteQueryService(ref DWINGUID guidService, ref DWINGUID riid, out IUnknown ppvObject);
}

// CoClasses

abstract class TIMEMMFactory {
  mixin(uuid("33fda1ea-80df-11d2-b263-00a0c90d6111"));
  // static DWINGUID CLSID = { 0x33fda1ea, 0x80df, 0x11d2, 0xb2, 0x63, 0x00, 0xa0, 0xc9, 0x0d, 0x61, 0x11 };
  mixin Interfaces!(ITIMEMMFactory);
}

abstract class TIMEFactory {
  mixin(uuid("476c391c-3e0d-11d2-b948-00c04fa32195"));
  // static DWINGUID CLSID = { 0x476c391c, 0x3e0d, 0x11d2, 0xb9, 0x48, 0x00, 0xc0, 0x4f, 0xa3, 0x21, 0x95 };
  mixin Interfaces!(ITIMEFactory);
}
