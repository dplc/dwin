// Version 1.0

/*[uuid("87c96271-addb-4745-b2e8-df88a8472fd1")]*/
module dwin.sys.win32.com.tlb.more.mstime;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum _TimeState {
  TS_Inactive = 0x00000000,
  TS_Active = 0x00000001,
  TS_Cueing = 0x00000002,
  TS_Seeking = 0x00000003,
  TS_Holding = 0x00000004,
}

// Interfaces

interface ITIMEActiveElementCollection : IDispatch {
  mixin(uuid("403e2540-4520-11d3-93ab-00a0c967a438"));
  // static DWINGUID IID = { 0x403e2540, 0x4520, 0x11d3, 0x93, 0xab, 0x00, 0xa0, 0xc9, 0x67, 0xa4, 0x38 };
  /*[id(0x000005DC)]*/ int get_length(out int p);
  /*[id(0xFFFFFFFC)]*/ int get__newEnum(out IUnknown p);
  /*[id(0x00000000)]*/ int item(DWINVARIANT varIndex, out DWINVARIANT pvarResult);
}

interface ITIMEElement : IDispatch {
  mixin(uuid("1c2ef64e-f07d-4338-9771-9154491cd8b9"));
  // static DWINGUID IID = { 0x1c2ef64e, 0xf07d, 0x4338, 0x97, 0x71, 0x91, 0x54, 0x49, 0x1c, 0xd8, 0xb9 };
  /*[id(0x00000101)]*/ int get_accelerate(out DWINVARIANT __MIDL_0010);
  /*[id(0x00000101)]*/ int set_accelerate(DWINVARIANT __MIDL_0010);
  /*[id(0x00000103)]*/ int get_autoReverse(out DWINVARIANT __MIDL_0012);
  /*[id(0x00000103)]*/ int set_autoReverse(DWINVARIANT __MIDL_0012);
  /*[id(0x00000104)]*/ int get_begin(out DWINVARIANT time);
  /*[id(0x00000104)]*/ int set_begin(DWINVARIANT time);
  /*[id(0x00000105)]*/ int get_decelerate(out DWINVARIANT __MIDL_0014);
  /*[id(0x00000105)]*/ int set_decelerate(DWINVARIANT __MIDL_0014);
  /*[id(0x00000107)]*/ int get_dur(out DWINVARIANT time);
  /*[id(0x00000107)]*/ int set_dur(DWINVARIANT time);
  /*[id(0x00000108)]*/ int get_end(out DWINVARIANT time);
  /*[id(0x00000108)]*/ int set_end(DWINVARIANT time);
  /*[id(0x0000010A)]*/ int get_fill(out wchar* f);
  /*[id(0x0000010A)]*/ int set_fill(wchar* f);
  /*[id(0x0000010B)]*/ int get_mute(out DWINVARIANT b);
  /*[id(0x0000010B)]*/ int set_mute(DWINVARIANT b);
  /*[id(0x0000010C)]*/ int get_repeatCount(out DWINVARIANT c);
  /*[id(0x0000010C)]*/ int set_repeatCount(DWINVARIANT c);
  /*[id(0x0000010D)]*/ int get_repeatDur(out DWINVARIANT time);
  /*[id(0x0000010D)]*/ int set_repeatDur(DWINVARIANT time);
  /*[id(0x0000010E)]*/ int get_restart(out wchar* __MIDL_0016);
  /*[id(0x0000010E)]*/ int set_restart(wchar* __MIDL_0016);
  /*[id(0x0000010F)]*/ int get_speed(out DWINVARIANT speed);
  /*[id(0x0000010F)]*/ int set_speed(DWINVARIANT speed);
  /*[id(0x00000110)]*/ int get_syncBehavior(out wchar* sync);
  /*[id(0x00000110)]*/ int set_syncBehavior(wchar* sync);
  /*[id(0x00000112)]*/ int get_syncTolerance(out DWINVARIANT tol);
  /*[id(0x00000112)]*/ int set_syncTolerance(DWINVARIANT tol);
  /*[id(0x00000111)]*/ int get_syncMaster(out DWINVARIANT b);
  /*[id(0x00000111)]*/ int set_syncMaster(DWINVARIANT b);
  /*[id(0x00000113)]*/ int get_timeAction(out wchar* time);
  /*[id(0x00000113)]*/ int set_timeAction(wchar* time);
  /*[id(0x00000114)]*/ int get_timeContainer(out wchar* __MIDL_0018);
  /*[id(0x00000116)]*/ int get_volume(out DWINVARIANT val);
  /*[id(0x00000116)]*/ int set_volume(DWINVARIANT val);
  /*[id(0x00000120)]*/ int get_currTimeState(out ITIMEState timeState);
  /*[id(0x00000121)]*/ int get_timeAll(out ITIMEElementCollection allColl);
  /*[id(0x00000122)]*/ int get_timeChildren(out ITIMEElementCollection childColl);
  /*[id(0x00000123)]*/ int get_timeParent(out ITIMEElement parent);
  /*[id(0x00000124)]*/ int get_isPaused(out short b);
  /*[id(0x00000130)]*/ int beginElement();
  /*[id(0x00000131)]*/ int beginElementAt(double parentTime);
  /*[id(0x00000132)]*/ int endElement();
  /*[id(0x00000133)]*/ int endElementAt(double parentTime);
  /*[id(0x00000134)]*/ int pauseElement();
  /*[id(0x00000135)]*/ int resetElement();
  /*[id(0x00000136)]*/ int resumeElement();
  /*[id(0x00000137)]*/ int seekActiveTime(double activeTime);
  /*[id(0x00000138)]*/ int seekSegmentTime(double segmentTime);
  /*[id(0x00000139)]*/ int seekTo(int repeatCount, double segmentTime);
  /*[id(0x0000013B)]*/ int documentTimeToParentTime(double documentTime, out double parentTime);
  /*[id(0x0000013C)]*/ int parentTimeToDocumentTime(double parentTime, out double documentTime);
  /*[id(0x0000013D)]*/ int parentTimeToActiveTime(double parentTime, out double activeTime);
  /*[id(0x0000013E)]*/ int activeTimeToParentTime(double activeTime, out double parentTime);
  /*[id(0x0000013F)]*/ int activeTimeToSegmentTime(double activeTime, out double segmentTime);
  /*[id(0x00000140)]*/ int segmentTimeToActiveTime(double segmentTime, out double activeTime);
  /*[id(0x00000141)]*/ int segmentTimeToSimpleTime(double segmentTime, out double simpleTime);
  /*[id(0x00000142)]*/ int simpleTimeToSegmentTime(double simpleTime, out double segmentTime);
  /*[id(0x00000150)]*/ int get_endSync(out wchar* es);
  /*[id(0x00000150)]*/ int set_endSync(wchar* es);
  /*[id(0x00000160)]*/ int get_activeElements(out ITIMEActiveElementCollection activeColl);
  /*[id(0x00000161)]*/ int get_hasMedia(out short flag);
  /*[id(0x00000170)]*/ int nextElement();
  /*[id(0x00000171)]*/ int prevElement();
  /*[id(0x00000115)]*/ int get_updateMode(out wchar* updateMode);
  /*[id(0x00000115)]*/ int set_updateMode(wchar* updateMode);
}

interface ITIMEState : IDispatch {
  mixin(uuid("dd5ec62a-9d77-4573-80a8-758594e69cea"));
  // static DWINGUID IID = { 0xdd5ec62a, 0x9d77, 0x4573, 0x80, 0xa8, 0x75, 0x85, 0x94, 0xe6, 0x9c, 0xea };
  /*[id(0x00001001)]*/ int get_activeDur(out double dur);
  /*[id(0x00001002)]*/ int get_activeTime(out double time);
  /*[id(0x00001003)]*/ int get_isActive(out short active);
  /*[id(0x00001004)]*/ int get_isOn(out short on);
  /*[id(0x00001005)]*/ int get_isPaused(out short paused);
  /*[id(0x00001006)]*/ int get_isMuted(out short muted);
  /*[id(0x00001007)]*/ int get_parentTimeBegin(out double time);
  /*[id(0x00001008)]*/ int get_parentTimeEnd(out double time);
  /*[id(0x00001009)]*/ int get_progress(out double progress);
  /*[id(0x0000100A)]*/ int get_repeatCount(out int count);
  /*[id(0x0000100B)]*/ int get_segmentDur(out double dur);
  /*[id(0x0000100C)]*/ int get_segmentTime(out double time);
  /*[id(0x0000100D)]*/ int get_simpleDur(out double dur);
  /*[id(0x0000100E)]*/ int get_simpleTime(out double time);
  /*[id(0x0000100F)]*/ int get_speed(out float speed);
  /*[id(0x00001010)]*/ int get_state(out _TimeState timeState);
  /*[id(0x00001011)]*/ int get_stateString(out wchar* state);
  /*[id(0x00001012)]*/ int get_volume(out float vol);
}

interface ITIMEElementCollection : IDispatch {
  mixin(uuid("50abc224-6d53-4f83-9135-2440a41b7bc8"));
  // static DWINGUID IID = { 0x50abc224, 0x6d53, 0x4f83, 0x91, 0x35, 0x24, 0x40, 0xa4, 0x1b, 0x7b, 0xc8 };
  /*[id(0x00000601)]*/ int set_length(int p);
  /*[id(0x00000601)]*/ int get_length(out int p);
  /*[id(0xFFFFFFFC)]*/ int get__newEnum(out IUnknown ppIUnknown);
  /*[id(0x00000000)]*/ int item(DWINVARIANT varName, DWINVARIANT varIndex, out IDispatch ppDisp);
  /*[id(0x00000602)]*/ int tags(DWINVARIANT varName, out IDispatch ppDisp);
}

interface ITIMEBodyElement : ITIMEElement {
  mixin(uuid("8c90e348-ec0a-4229-90b0-e57d2ca45ccb"));
  // static DWINGUID IID = { 0x8c90e348, 0xec0a, 0x4229, 0x90, 0xb0, 0xe5, 0x7d, 0x2c, 0xa4, 0x5c, 0xcb };
}

interface ITIMEMediaElement : ITIMEElement {
  mixin(uuid("47a6972f-ae65-4a6b-ae63-d0c1d5307b58"));
  // static DWINGUID IID = { 0x47a6972f, 0xae65, 0x4a6b, 0xae, 0x63, 0xd0, 0xc1, 0xd5, 0x30, 0x7b, 0x58 };
  /*[id(0x00000401)]*/ int get_clipBegin(out DWINVARIANT time);
  /*[id(0x00000401)]*/ int set_clipBegin(DWINVARIANT time);
  /*[id(0x00000402)]*/ int get_clipEnd(out DWINVARIANT time);
  /*[id(0x00000402)]*/ int set_clipEnd(DWINVARIANT time);
  /*[id(0x00000403)]*/ int get_player(out DWINVARIANT id);
  /*[id(0x00000403)]*/ int set_player(DWINVARIANT id);
  /*[id(0x00000404)]*/ int get_src(out DWINVARIANT url);
  /*[id(0x00000404)]*/ int set_src(DWINVARIANT url);
  /*[id(0x00000405)]*/ int get_type(out DWINVARIANT mimetype);
  /*[id(0x00000405)]*/ int set_type(DWINVARIANT mimetype);
  /*[id(0x00000410)]*/ int get_abstract(out wchar* abs);
  /*[id(0x00000411)]*/ int get_author(out wchar* auth);
  /*[id(0x00000412)]*/ int get_copyright(out wchar* cpyrght);
  /*[id(0x00000413)]*/ int get_hasAudio(out short b);
  /*[id(0x00000414)]*/ int get_hasVisual(out short b);
  /*[id(0x00000416)]*/ int get_mediaDur(out double dur);
  /*[id(0x00000417)]*/ int get_mediaHeight(out int height);
  /*[id(0x00000418)]*/ int get_mediaWidth(out int width);
  /*[id(0x00000419)]*/ int get_playerObject(out IDispatch ppDisp);
  /*[id(0x0000041A)]*/ int get_playList(out ITIMEPlayList pPlayList);
  /*[id(0x0000041B)]*/ int get_rating(out wchar* rate);
  /*[id(0x0000041C)]*/ int get_title(out wchar* name);
  /*[id(0x0000041D)]*/ int get_hasPlayList(out short b);
  /*[id(0x00000430)]*/ int get_canPause(out short b);
  /*[id(0x00000432)]*/ int get_canSeek(out short b);
}

interface ITIMEPlayList : IDispatch {
  mixin(uuid("e9b75b62-dd97-4b19-8fd9-9646292952e0"));
  // static DWINGUID IID = { 0xe9b75b62, 0xdd97, 0x4b19, 0x8f, 0xd9, 0x96, 0x46, 0x29, 0x29, 0x52, 0xe0 };
  /*[id(0x00000B01)]*/ int set_activeTrack(DWINVARIANT pPlayItem);
  /*[id(0x00000B01)]*/ int get_activeTrack(out ITIMEPlayItem pPlayItem);
  /*[id(0x00000B02)]*/ int get_dur(double* dur);
  /*[id(0x00000000)]*/ int item(DWINVARIANT varIndex, out ITIMEPlayItem pPlayItem);
  /*[id(0x000005DC)]*/ int get_length(out int p);
  /*[id(0xFFFFFFFC)]*/ int get__newEnum(out IUnknown p);
  /*[id(0x00000B03)]*/ int nextTrack();
  /*[id(0x00000B04)]*/ int prevTrack();
}

interface ITIMEPlayItem : IDispatch {
  mixin(uuid("2a6096d9-2ce0-47dc-a813-9099a2466309"));
  // static DWINGUID IID = { 0x2a6096d9, 0x2ce0, 0x47dc, 0xa8, 0x13, 0x90, 0x99, 0xa2, 0x46, 0x63, 0x09 };
  /*[id(0x00000C01)]*/ int get_abstract(out wchar* abs);
  /*[id(0x00000C02)]*/ int get_author(out wchar* auth);
  /*[id(0x00000C03)]*/ int get_copyright(out wchar* cpyrght);
  /*[id(0x00000C04)]*/ int get_dur(out double dur);
  /*[id(0x00000C05)]*/ int get_index(out int index);
  /*[id(0x00000C06)]*/ int get_rating(out wchar* rate);
  /*[id(0x00000C07)]*/ int get_src(out wchar* src);
  /*[id(0x00000C08)]*/ int get_title(out wchar* title);
  /*[id(0x00000C0A)]*/ int setActive();
}

interface ITIMEMediaElement2 : ITIMEMediaElement {
  mixin(uuid("9ee29400-7ee6-453a-85b3-4ec28e0305b4"));
  // static DWINGUID IID = { 0x9ee29400, 0x7ee6, 0x453a, 0x85, 0xb3, 0x4e, 0xc2, 0x8e, 0x03, 0x05, 0xb4 };
  /*[id(0x00001403)]*/ int get_earliestMediaTime(out DWINVARIANT earliestMediaTime);
  /*[id(0x00001404)]*/ int get_latestMediaTime(out DWINVARIANT latestMediaTime);
  /*[id(0x00001405)]*/ int get_minBufferedMediaDur(out DWINVARIANT minBufferedMediaDur);
  /*[id(0x00001405)]*/ int set_minBufferedMediaDur(DWINVARIANT minBufferedMediaDur);
  /*[id(0x00001406)]*/ int get_downloadTotal(out DWINVARIANT downloadTotal);
  /*[id(0x00001407)]*/ int get_downloadCurrent(out DWINVARIANT downloadCurrent);
  /*[id(0x00001408)]*/ int get_isStreamed(out short b);
  /*[id(0x00001409)]*/ int get_bufferingProgress(out DWINVARIANT bufferingProgress);
  /*[id(0x0000140A)]*/ int get_hasDownloadProgress(out short b);
  /*[id(0x0000140F)]*/ int get_downloadProgress(out DWINVARIANT downloadProgress);
  /*[id(0x0000140B)]*/ int get_mimetype(out wchar* mimetype);
  /*[id(0x0000140C)]*/ int seekToFrame(int frameNr);
  /*[id(0x0000140D)]*/ int decodeMimeType(ushort* header, int headerSize, out wchar* mimetype);
  /*[id(0x0000140E)]*/ int get_currentFrame(out int currFrame);
}

interface ITIMETransitionElement : IDispatch {
  mixin(uuid("f383d66f-5e68-4fc2-b641-03672b543a49"));
  // static DWINGUID IID = { 0xf383d66f, 0x5e68, 0x4fc2, 0xb6, 0x41, 0x03, 0x67, 0x2b, 0x54, 0x3a, 0x49 };
  /*[id(0x00001501)]*/ int get_type(out DWINVARIANT type);
  /*[id(0x00001501)]*/ int set_type(DWINVARIANT type);
  /*[id(0x00001502)]*/ int get_subType(out DWINVARIANT subType);
  /*[id(0x00001502)]*/ int set_subType(DWINVARIANT subType);
  /*[id(0x00001503)]*/ int get_dur(out DWINVARIANT dur);
  /*[id(0x00001503)]*/ int set_dur(DWINVARIANT dur);
  /*[id(0x00001504)]*/ int get_startProgress(out DWINVARIANT startProgress);
  /*[id(0x00001504)]*/ int set_startProgress(DWINVARIANT startProgress);
  /*[id(0x00001505)]*/ int get_endProgress(out DWINVARIANT endProgress);
  /*[id(0x00001505)]*/ int set_endProgress(DWINVARIANT endProgress);
  /*[id(0x00001506)]*/ int get_direction(out DWINVARIANT direction);
  /*[id(0x00001506)]*/ int set_direction(DWINVARIANT direction);
  /*[id(0x00001507)]*/ int get_repeatCount(out DWINVARIANT repeatCount);
  /*[id(0x00001507)]*/ int set_repeatCount(DWINVARIANT repeatCount);
  /*[id(0x00001508)]*/ int get_begin(out DWINVARIANT begin);
  /*[id(0x00001508)]*/ int set_begin(DWINVARIANT begin);
  /*[id(0x00001509)]*/ int get_end(out DWINVARIANT end);
  /*[id(0x00001509)]*/ int set_end(DWINVARIANT end);
}

interface ITIMEAnimationElement : ITIMEElement {
  mixin(uuid("a74f14b1-b6a2-430a-a5e8-1f4e53f710fe"));
  // static DWINGUID IID = { 0xa74f14b1, 0xb6a2, 0x430a, 0xa5, 0xe8, 0x1f, 0x4e, 0x53, 0xf7, 0x10, 0xfe };
  /*[id(0x00000301)]*/ int get_attributeName(out wchar* attrib);
  /*[id(0x00000301)]*/ int set_attributeName(wchar* attrib);
  /*[id(0x00000302)]*/ int get_by(out DWINVARIANT val);
  /*[id(0x00000302)]*/ int set_by(DWINVARIANT val);
  /*[id(0x00000303)]*/ int get_calcMode(out wchar* calcMode);
  /*[id(0x00000303)]*/ int set_calcMode(wchar* calcMode);
  /*[id(0x00000304)]*/ int get_from(out DWINVARIANT val);
  /*[id(0x00000304)]*/ int set_from(DWINVARIANT val);
  /*[id(0x00000305)]*/ int get_keySplines(out wchar* val);
  /*[id(0x00000305)]*/ int set_keySplines(wchar* val);
  /*[id(0x00000306)]*/ int get_keyTimes(out wchar* val);
  /*[id(0x00000306)]*/ int set_keyTimes(wchar* val);
  /*[id(0x00000307)]*/ int get_targetElement(out wchar* target);
  /*[id(0x00000307)]*/ int set_targetElement(wchar* target);
  /*[id(0x00000308)]*/ int get_to(out DWINVARIANT val);
  /*[id(0x00000308)]*/ int set_to(DWINVARIANT val);
  /*[id(0x00000309)]*/ int get_values(out DWINVARIANT val);
  /*[id(0x00000309)]*/ int set_values(DWINVARIANT val);
  /*[id(0x0000030A)]*/ int get_origin(out wchar* val);
  /*[id(0x0000030A)]*/ int set_origin(wchar* val);
  /*[id(0x0000030B)]*/ int get_path(out DWINVARIANT val);
  /*[id(0x0000030B)]*/ int set_path(DWINVARIANT val);
  /*[id(0x0000030C)]*/ int get_additive(out wchar* val);
  /*[id(0x0000030C)]*/ int set_additive(wchar* val);
  /*[id(0x0000030D)]*/ int get_accumulate(out wchar* val);
  /*[id(0x0000030D)]*/ int set_accumulate(wchar* val);
}

interface ITIMEAnimationElement2 : ITIMEAnimationElement {
  mixin(uuid("29ce8661-bd43-421a-b616-e9b31f33a572"));
  // static DWINGUID IID = { 0x29ce8661, 0xbd43, 0x421a, 0xb6, 0x16, 0xe9, 0xb3, 0x1f, 0x33, 0xa5, 0x72 };
  /*[id(0x0000030E)]*/ int get_type(out wchar* val);
  /*[id(0x0000030E)]*/ int set_type(wchar* val);
  /*[id(0x0000030F)]*/ int get_subType(out wchar* val);
  /*[id(0x0000030F)]*/ int set_subType(wchar* val);
  /*[id(0x00000310)]*/ int get_mode(out wchar* val);
  /*[id(0x00000310)]*/ int set_mode(wchar* val);
  /*[id(0x00000311)]*/ int get_fadeColor(out wchar* val);
  /*[id(0x00000311)]*/ int set_fadeColor(wchar* val);
}

interface IAnimationComposer : IUnknown {
  mixin(uuid("5459c83d-322b-44b3-8daa-24c947e7b275"));
  // static DWINGUID IID = { 0x5459c83d, 0x322b, 0x44b3, 0x8d, 0xaa, 0x24, 0xc9, 0x47, 0xe7, 0xb2, 0x75 };
  /*[id(0x60010000)]*/ int get_attribute(out wchar* attributeName);
  /*[id(0x60010001)]*/ int ComposerInit(IDispatch composerSite, wchar* attributeName);
  /*[id(0x60010002)]*/ int ComposerDetach();
  /*[id(0x60010003)]*/ int UpdateFragments();
  /*[id(0x60010004)]*/ int AddFragment(IDispatch newAnimationFragment);
  /*[id(0x60010005)]*/ int InsertFragment(IDispatch newAnimationFragment, DWINVARIANT index);
  /*[id(0x60010006)]*/ int RemoveFragment(IDispatch oldAnimationFragment);
  /*[id(0x60010007)]*/ int EnumerateFragments(IEnumVARIANT* fragments);
  /*[id(0x60010008)]*/ int GetNumFragments(int* fragmentCount);
}

interface IAnimationComposer2 : IAnimationComposer {
  mixin(uuid("1a4f0e79-09cd-47f3-aff1-483bf3a222dc"));
  // static DWINGUID IID = { 0x1a4f0e79, 0x09cd, 0x47f3, 0xaf, 0xf1, 0x48, 0x3b, 0xf3, 0xa2, 0x22, 0xdc };
  /*[id(0x60020000)]*/ int ComposerInitFromFragment(IDispatch composerSite, wchar* attributeName, IDispatch oneFragment);
}

interface IAnimationComposerSite : IDispatch {
  mixin(uuid("488fcb56-8fd6-4cda-a06a-5bb232930eca"));
  // static DWINGUID IID = { 0x488fcb56, 0x8fd6, 0x4cda, 0xa0, 0x6a, 0x5b, 0xb2, 0x32, 0x93, 0x0e, 0xca };
  /*[id(0x00000E01)]*/ int AddFragment(wchar* attributeName, IDispatch fragment);
  /*[id(0x00000E02)]*/ int RemoveFragment(wchar* attributeName, IDispatch fragment);
  /*[id(0x00000E03)]*/ int InsertFragment(wchar* attributeName, IDispatch fragment, DWINVARIANT index);
  /*[id(0x00000E04)]*/ int EnumerateFragments(wchar* attributeName, IEnumVARIANT* fragments);
  /*[id(0x00000E05)]*/ int RegisterComposerFactory(DWINVARIANT* factory);
  /*[id(0x00000E06)]*/ int UnregisterComposerFactory(DWINVARIANT* factory);
}

interface IAnimationComposerSiteSink : IUnknown {
  mixin(uuid("8ef76c64-71cd-480f-96fc-ba2696e659be"));
  // static DWINGUID IID = { 0x8ef76c64, 0x71cd, 0x480f, 0x96, 0xfc, 0xba, 0x26, 0x96, 0xe6, 0x59, 0xbe };
  /*[id(0x60010000)]*/ void UpdateAnimations();
  /*[id(0x60010001)]*/ void ComposerSiteDetach();
}

interface IAnimationRoot : IUnknown {
  mixin(uuid("29df6387-30b4-4a62-891b-a9c5be37be88"));
  // static DWINGUID IID = { 0x29df6387, 0x30b4, 0x4a62, 0x89, 0x1b, 0xa9, 0xc5, 0xbe, 0x37, 0xbe, 0x88 };
  /*[id(0x60010000)]*/ int RegisterComposerSite(IUnknown composerSite);
  /*[id(0x60010001)]*/ int UnregisterComposerSite(IUnknown composerSite);
}

interface IAnimationFragment : IDispatch {
  mixin(uuid("319dfd88-0ac6-4ab1-a19f-90223ba2da16"));
  // static DWINGUID IID = { 0x319dfd88, 0x0ac6, 0x4ab1, 0xa1, 0x9f, 0x90, 0x22, 0x3b, 0xa2, 0xda, 0x16 };
  /*[id(0x00000F01)]*/ int get_element(out IDispatch htmlElement);
  /*[id(0x00000F02)]*/ int get_value(wchar* attributeName, DWINVARIANT origvalue, DWINVARIANT currentvalue, out DWINVARIANT newvalue);
  /*[id(0x00000F03)]*/ int DetachFromComposer();
}

interface IFilterAnimationInfo : IUnknown {
  mixin(uuid("02e29300-c758-49b4-9e11-c58bfe90558b"));
  // static DWINGUID IID = { 0x02e29300, 0xc758, 0x49b4, 0x9e, 0x11, 0xc5, 0x8b, 0xfe, 0x90, 0x55, 0x8b };
  /*[id(0x60010000)]*/ int GetParameters(DWINVARIANT* params);
}

interface ITIMEPlayItem2 : ITIMEPlayItem {
  mixin(uuid("4262cd38-6bdc-40a4-bc50-4cc50366e702"));
  // static DWINGUID IID = { 0x4262cd38, 0x6bdc, 0x40a4, 0xbc, 0x50, 0x4c, 0xc5, 0x03, 0x66, 0xe7, 0x02 };
  /*[id(0x00000C10)]*/ int get_banner(out wchar* banner);
  /*[id(0x00000C11)]*/ int get_bannerAbstract(out wchar* abstractParam);
  /*[id(0x00000C12)]*/ int get_bannerMoreInfo(out wchar* moreInfo);
}

interface ITIMEDVDPlayerObject : IDispatch {
  mixin(uuid("3af7ab68-4f29-462c-aa6e-5872448899e3"));
  // static DWINGUID IID = { 0x3af7ab68, 0x4f29, 0x462c, 0xaa, 0x6e, 0x58, 0x72, 0x44, 0x88, 0x99, 0xe3 };
  /*[id(0x00000D01)]*/ int upperButtonSelect();
  /*[id(0x00000D02)]*/ int lowerButtonSelect();
  /*[id(0x00000D03)]*/ int leftButtonSelect();
  /*[id(0x00000D04)]*/ int rightButtonSelect();
  /*[id(0x00000D05)]*/ int buttonActivate();
  /*[id(0x00000D06)]*/ int gotoMenu();
}

interface ITIMEDMusicPlayerObject : IDispatch {
  mixin(uuid("407954f5-2bab-4cfa-954d-249f9fce43a1"));
  // static DWINGUID IID = { 0x407954f5, 0x2bab, 0x4cfa, 0x95, 0x4d, 0x24, 0x9f, 0x9f, 0xce, 0x43, 0xa1 };
  /*[id(0x00001101)]*/ int get_isDirectMusicInstalled(out short hasDM);
}

interface ITIMEFactory : IUnknown {
  mixin(uuid("cd51e446-3006-434f-90e2-e37e8fb8ca8f"));
  // static DWINGUID IID = { 0xcd51e446, 0x3006, 0x434f, 0x90, 0xe2, 0xe3, 0x7e, 0x8f, 0xb8, 0xca, 0x8f };
}

interface IAnimationComposerFactory : IUnknown {
  mixin(uuid("beeb3233-f71f-4683-8b05-9a5314c97dbc"));
  // static DWINGUID IID = { 0xbeeb3233, 0xf71f, 0x4683, 0x8b, 0x05, 0x9a, 0x53, 0x14, 0xc9, 0x7d, 0xbc };
  /*[id(0x60010000)]*/ int FindComposer(IDispatch targetElement, wchar* attributeName, out IAnimationComposer animationComposer);
}

interface IAnimationComposerSiteFactory : IDispatch {
  mixin(uuid("b4ea5681-ed72-4efe-bbd7-7c47d1325696"));
  // static DWINGUID IID = { 0xb4ea5681, 0xed72, 0x4efe, 0xbb, 0xd7, 0x7c, 0x47, 0xd1, 0x32, 0x56, 0x96 };
}

interface ITIMEMediaPlayerSite : IUnknown {
  mixin(uuid("bf0571ed-344f-4f58-82c7-7431ed0fd834"));
  // static DWINGUID IID = { 0xbf0571ed, 0x344f, 0x4f58, 0x82, 0xc7, 0x74, 0x31, 0xed, 0x0f, 0xd8, 0x34 };
  /*[id(0x00001201)]*/ int get_timeElement(out ITIMEElement pElm);
  /*[id(0x00001202)]*/ int get_timeState(out ITIMEState pState);
  /*[id(0x00001203)]*/ int reportError(int hr, wchar* errorString);
}

interface ITIMEMediaPlayer : IUnknown {
  mixin(uuid("ea4a95be-acc9-4bf0-85a4-1bf3c51e431c"));
  // static DWINGUID IID = { 0xea4a95be, 0xacc9, 0x4bf0, 0x85, 0xa4, 0x1b, 0xf3, 0xc5, 0x1e, 0x43, 0x1c };
  /*[id(0x00000801)]*/ int Init(ITIMEMediaPlayerSite mpsite);
  /*[id(0x00000802)]*/ int Detach();
  /*[id(0x00000810)]*/ int begin();
  /*[id(0x00000811)]*/ int end();
  /*[id(0x00000812)]*/ int resume();
  /*[id(0x00000813)]*/ int pause();
  /*[id(0x00000814)]*/ int repeat();
  /*[id(0x00000815)]*/ int reset();
  /*[id(0x00000816)]*/ int seek(double time);
  /*[id(0x00000820)]*/ int set_src(wchar* value);
  /*[id(0x00000821)]*/ int set_clipBegin(DWINVARIANT value);
  /*[id(0x00000822)]*/ int set_clipEnd(DWINVARIANT value);
  /*[id(0x00000830)]*/ int get_abstract(out wchar* abs);
  /*[id(0x00000831)]*/ int get_author(out wchar* auth);
  /*[id(0x00000832)]*/ int get_canPause(out short b);
  /*[id(0x00000834)]*/ int get_canSeek(out short b);
  /*[id(0x00000835)]*/ int get_clipDur(out double dur);
  /*[id(0x00000836)]*/ int get_copyright(out wchar* cpyrght);
  /*[id(0x00000837)]*/ int get_currTime(out double time);
  /*[id(0x00000838)]*/ int get_customObject(out IDispatch disp);
  /*[id(0x00000839)]*/ int get_hasAudio(out short b);
  /*[id(0x0000083A)]*/ int get_hasVisual(out short b);
  /*[id(0x0000083B)]*/ int get_mediaDur(out double dur);
  /*[id(0x0000083C)]*/ int get_mediaHeight(out int height);
  /*[id(0x0000083D)]*/ int get_mediaWidth(out int width);
  /*[id(0x0000083E)]*/ int get_playList(out ITIMEPlayList pPlayList);
  /*[id(0x0000083F)]*/ int get_rating(out wchar* rate);
  /*[id(0x00000840)]*/ int get_state(out _TimeState ts);
  /*[id(0x00000841)]*/ int get_title(out wchar* name);
}

interface ITIMEMediaPlayerAudio : IUnknown {
  mixin(uuid("ffaacfda-b374-4f22-ac9a-c5bb9437cb56"));
  // static DWINGUID IID = { 0xffaacfda, 0xb374, 0x4f22, 0xac, 0x9a, 0xc5, 0xbb, 0x94, 0x37, 0xcb, 0x56 };
  /*[id(0x00000901)]*/ int set_volume(float value);
  /*[id(0x00000902)]*/ int set_mute(short value);
}

interface ITIMEMediaPlayerNetwork : IUnknown {
  mixin(uuid("b9987fca-7fbb-4015-bd3d-7418605514da"));
  // static DWINGUID IID = { 0xb9987fca, 0x7fbb, 0x4015, 0xbd, 0x3d, 0x74, 0x18, 0x60, 0x55, 0x14, 0xda };
  /*[id(0x00001601)]*/ int get_hasDownloadProgress(out short b);
  /*[id(0x00001602)]*/ int get_downloadProgress(out int l);
  /*[id(0x00001603)]*/ int get_isBuffered(out short b);
  /*[id(0x00001604)]*/ int get_bufferingProgress(out int l);
}

interface ITIMEMediaPlayerControl : IUnknown {
  mixin(uuid("897a99e7-f386-45c8-b51b-3a25bbcbba69"));
  // static DWINGUID IID = { 0x897a99e7, 0xf386, 0x45c8, 0xb5, 0x1b, 0x3a, 0x25, 0xbb, 0xcb, 0xba, 0x69 };
  /*[id(0x00001301)]*/ int getControl(IUnknown* control);
}

// CoClasses

abstract class TIMEFactory {
  mixin(uuid("17237a20-3adb-48ec-b182-35291f115790"));
  // static DWINGUID CLSID = { 0x17237a20, 0x3adb, 0x48ec, 0xb1, 0x82, 0x35, 0x29, 0x1f, 0x11, 0x57, 0x90 };
  mixin Interfaces!(ITIMEFactory);
}

abstract class time {
  mixin(uuid("e32ef57b-7fde-4765-9bc5-a1ba9705c44e"));
  // static DWINGUID CLSID = { 0xe32ef57b, 0x7fde, 0x4765, 0x9b, 0xc5, 0xa1, 0xba, 0x97, 0x05, 0xc4, 0x4e };
  mixin Interfaces!(ITIMEElement);
}

abstract class TIMEAnimation {
  mixin(uuid("f99d135a-c07c-449e-965c-7dbb7c554a51"));
  // static DWINGUID CLSID = { 0xf99d135a, 0xc07c, 0x449e, 0x96, 0x5c, 0x7d, 0xbb, 0x7c, 0x55, 0x4a, 0x51 };
  mixin Interfaces!(IAnimationFragment);
}

abstract class TIMESetAnimation {
  mixin(uuid("ba91ce53-baeb-4f05-861c-0a2a0934f82e"));
  // static DWINGUID CLSID = { 0xba91ce53, 0xbaeb, 0x4f05, 0x86, 0x1c, 0x0a, 0x2a, 0x09, 0x34, 0xf8, 0x2e };
  mixin Interfaces!(IAnimationFragment);
}

abstract class TIMEMotionAnimation {
  mixin(uuid("0019a09d-1a81-41c5-89ec-d9e737811303"));
  // static DWINGUID CLSID = { 0x0019a09d, 0x1a81, 0x41c5, 0x89, 0xec, 0xd9, 0xe7, 0x37, 0x81, 0x13, 0x03 };
  mixin Interfaces!(IAnimationFragment);
}

abstract class TIMEColorAnimation {
  mixin(uuid("62f75052-f3ec-4a64-84fb-ab18e0746ed8"));
  // static DWINGUID CLSID = { 0x62f75052, 0xf3ec, 0x4a64, 0x84, 0xfb, 0xab, 0x18, 0xe0, 0x74, 0x6e, 0xd8 };
  mixin Interfaces!(IAnimationFragment);
}

abstract class TIMEFilterAnimation {
  mixin(uuid("c54515d0-f2e5-4bdd-aa86-1e4f23e480e7"));
  // static DWINGUID CLSID = { 0xc54515d0, 0xf2e5, 0x4bdd, 0xaa, 0x86, 0x1e, 0x4f, 0x23, 0xe4, 0x80, 0xe7 };
  mixin Interfaces!(IAnimationFragment);
}

abstract class AnimationComposerFactory {
  mixin(uuid("332b2a56-f86c-47e7-8602-fc42ac8b9920"));
  // static DWINGUID CLSID = { 0x332b2a56, 0xf86c, 0x47e7, 0x86, 0x02, 0xfc, 0x42, 0xac, 0x8b, 0x99, 0x20 };
  mixin Interfaces!(IAnimationComposerFactory);
}

abstract class AnimationComposerSiteFactory {
  mixin(uuid("16911a65-d41d-4431-87f7-e757f4d03bd8"));
  // static DWINGUID CLSID = { 0x16911a65, 0xd41d, 0x4431, 0x87, 0xf7, 0xe7, 0x57, 0xf4, 0xd0, 0x3b, 0xd8 };
  mixin Interfaces!(IAnimationComposerSiteFactory);
}
