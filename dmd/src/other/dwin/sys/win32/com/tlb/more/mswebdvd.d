// MSWebDVD 1.0 Type Library
// Version 1.0

/*[uuid("38ee5ce1-4b62-11d3-854f-00a0c9c898e7")]*/
module dwin.sys.win32.com.tlb.more.mswebdvd;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum __MIDL_IMSWebDVD_0002 {
  dvdMenu_Title = 0x00000002,
  dvdMenu_Root = 0x00000003,
  dvdMenu_Subpicture = 0x00000004,
  dvdMenu_Audio = 0x00000005,
  dvdMenu_Angle = 0x00000006,
  dvdMenu_Chapter = 0x00000007,
}

enum __MIDL_IMSWebDVD_0003 {
  dvdState_Undefined = 0xFFFFFFFE,
  dvdState_Unitialized = 0xFFFFFFFF,
  dvdState_Stopped = 0x00000000,
  dvdState_Paused = 0x00000001,
  dvdState_Running = 0x00000002,
}

enum __MIDL_IMSWebDVD_0004 {
  dvdStruct_Volume = 0x00000001,
  dvdStruct_Title = 0x00000002,
  dvdStruct_ParentalID = 0x00000003,
  dvdStruct_PartOfTitle = 0x00000004,
  dvdStruct_Cell = 0x00000005,
  dvdStream_Audio = 0x00000010,
  dvdStream_Subpicture = 0x00000011,
  dvdStream_Angle = 0x00000012,
  dvdChannel_Audio = 0x00000020,
  dvdGeneral_Name = 0x00000030,
  dvdGeneral_Comments = 0x00000031,
  dvdTitle_Series = 0x00000038,
  dvdTitle_Movie = 0x00000039,
  dvdTitle_Video = 0x0000003A,
  dvdTitle_Album = 0x0000003B,
  dvdTitle_Song = 0x0000003C,
  dvdTitle_Other = 0x0000003F,
  dvdTitle_Sub_Series = 0x00000040,
  dvdTitle_Sub_Movie = 0x00000041,
  dvdTitle_Sub_Video = 0x00000042,
  dvdTitle_Sub_Album = 0x00000043,
  dvdTitle_Sub_Song = 0x00000044,
  dvdTitle_Sub_Other = 0x00000047,
  dvdTitle_Orig_Series = 0x00000048,
  dvdTitle_Orig_Movie = 0x00000049,
  dvdTitle_Orig_Video = 0x0000004A,
  dvdTitle_Orig_Album = 0x0000004B,
  dvdTitle_Orig_Song = 0x0000004C,
  dvdTitle_Orig_Other = 0x0000004F,
  dvdOther_Scene = 0x00000050,
  dvdOther_Cut = 0x00000051,
  dvdOther_Take = 0x00000052,
}

enum __MIDL_IMSWebDVD_0005 {
  dvdSPExt_NotSpecified = 0x00000000,
  dvdSPExt_Caption_Normal = 0x00000001,
  dvdSPExt_Caption_Big = 0x00000002,
  dvdSPExt_Caption_Children = 0x00000003,
  dvdSPExt_CC_Normal = 0x00000005,
  dvdSPExt_CC_Big = 0x00000006,
  dvdSPExt_CC_Children = 0x00000007,
  dvdSPExt_Forced = 0x00000009,
  dvdSPExt_DirectorComments_Normal = 0x0000000D,
  dvdSPExt_DirectorComments_Big = 0x0000000E,
  dvdSPExt_DirectorComments_Children = 0x0000000F,
}

enum __MIDL_IMSWebDVD_0001 {
  dvdCursor_Arrow = 0x00000000,
  dvdCursor_ZoomIn = 0x00000001,
  dvdCursor_ZoomOut = 0x00000002,
  dvdCursor_Hand = 0x00000003,
  dvdCursor_None = 0xFFFFFFFF,
}

// Aliases

alias __MIDL_IMSWebDVD_0002 DVDMenuIDConstants;

alias __MIDL_IMSWebDVD_0003 DVDFilterState;

alias __MIDL_IMSWebDVD_0004 DVDTextStringType;

alias __MIDL_IMSWebDVD_0005 DVDSPExt;

alias __MIDL_IMSWebDVD_0001 DVDCursorType;

// Interfaces

// Event interface for DVDChapter control
interface _IMSWebDVD : IDispatch {
  mixin(uuid("2490fef2-9f03-4bb4-9ad7-3a3fc58206a4"));
  // static DWINGUID IID = { 0x2490fef2, 0x9f03, 0x4bb4, 0x9a, 0xd7, 0x3a, 0x3f, 0xc5, 0x82, 0x06, 0xa4 };
  /+// Notifies the client about DVD Code
  /*[id(0x00000001)]*/ void DVDNotify(int lEventCode, DWINVARIANT lParam1, DWINVARIANT lParam2);+/
  /+// Notifies the client
  /*[id(0x00000002)]*/ void PlayForwards(short bEnabled);+/
  /+// Notifies the client
  /*[id(0x00000003)]*/ void PlayBackwards(short bEnabled);+/
  /+// Notifies the client
  /*[id(0x00000004)]*/ void ShowMenu(DVDMenuIDConstants __MIDL_0011, short bEnabled);+/
  /+// Notifies the client
  /*[id(0x00000005)]*/ void Resume(short bEnabled);+/
  /+// Notifies the client
  /*[id(0x00000006)]*/ void SelectOrActivatButton(short bEnabled);+/
  /+// Notifies the client
  /*[id(0x00000007)]*/ void StillOff(short bEnabled);+/
  /+// Notifies the client
  /*[id(0x00000008)]*/ void PauseOn(short bEnabled);+/
  /+// Notifies the client
  /*[id(0x00000009)]*/ void ChangeCurrentAudioStream(short bEnabled);+/
  /+// Notifies the client
  /*[id(0x0000000A)]*/ void ChangeCurrentSubpictureStream(short bEnabled);+/
  /+// Notifies the client
  /*[id(0x0000000B)]*/ void ChangeCurrentAngle(short bEnabled);+/
  /+// Notifies the client
  /*[id(0x0000000C)]*/ void PlayAtTimeInTitle(short bEnabled);+/
  /+// Notifies the client
  /*[id(0x0000000D)]*/ void PlayAtTime(short bEnabled);+/
  /+// Notifies the client
  /*[id(0x0000000E)]*/ void PlayChapterInTitle(short bEnabled);+/
  /+// Notifies the client
  /*[id(0x0000000F)]*/ void PlayChapter(short bEnabled);+/
  /+// Notifies the client
  /*[id(0x00000010)]*/ void ReplayChapter(short bEnabled);+/
  /+// Notifies the client
  /*[id(0x00000011)]*/ void PlayNextChapter(short bEnabled);+/
  /+// Notifies the client
  /*[id(0x00000012)]*/ void Stop(short bEnabled);+/
  /+// Notifies the client
  /*[id(0x00000013)]*/ void ReturnFromSubmenu(short bEnabled);+/
  /+// Notifies the client
  /*[id(0x00000014)]*/ void PlayTitle(short bEnabled);+/
  /+// Notifies the client
  /*[id(0x00000015)]*/ void PlayPrevChapter(short bEnabled);+/
  /+// Notifies the client
  /*[id(0x00000016)]*/ void UpdateOverlay();+/
  /+// Reports that the ReadyState property of the ActiveMovie Control has changed
  /*[id(0xFFFFFD9F)]*/ void ReadyStateChange(int ReadyState);+/
}

// IOverlayCallback Interface
interface IOverlayCallback : IDispatch {
  mixin(uuid("84440b2b-931c-4183-bf8b-b98bc09fd2e9"));
  // static DWINGUID IID = { 0x84440b2b, 0x931c, 0x4183, 0xbf, 0x8b, 0xb9, 0x8b, 0xc0, 0x9f, 0xd2, 0xe9 };
  // method SetDDrawDVD
  /*[id(0x00000001)]*/ int SetDDrawDVD(DWINVARIANT pDDrawDVD);
}

// IMSWebDVD Interface
interface IMSWebDVD : IDispatch {
  mixin(uuid("38ee5ced-4b62-11d3-854f-00a0c9c898e7"));
  // static DWINGUID IID = { 0x38ee5ced, 0x4b62, 0x11d3, 0x85, 0x4f, 0x00, 0xa0, 0xc9, 0xc8, 0x98, 0xe7 };
  // method Render
  /*[id(0x00000001)]*/ int Render(int lRender);
  // method Play
  /*[id(0x00000002)]*/ int Play();
  // method Pause
  /*[id(0x00000003)]*/ int Pause();
  // method Stop
  /*[id(0x00000004)]*/ int Stop();
  // method PlayTitle
  /*[id(0x00000005)]*/ int PlayTitle(int lTitle);
  // method PlayChapterInTitle
  /*[id(0x00000006)]*/ int PlayChapterInTitle(int lTitle, int lChapter);
  // method PlayChapter
  /*[id(0x00000007)]*/ int PlayChapter(int lChapter);
  // method PlayAtTimeInTitle
  /*[id(0x00000008)]*/ int PlayAtTimeInTitle(int lTitle, wchar* strTime);
  // method PlayAtTime
  /*[id(0x00000009)]*/ int PlayAtTime(wchar* strTime);
  // method PlayBackwards
  /*[id(0x0000000A)]*/ int PlayBackwards(double dSpeed, short fDoNotReset);
  // method PlayForwards
  /*[id(0x0000000B)]*/ int PlayForwards(double dSpeed, short fDoNotReset);
  // method ShowMenu
  /*[id(0x0000000C)]*/ int ShowMenu(DVDMenuIDConstants MenuID);
  // method Resume
  /*[id(0x0000000D)]*/ int Resume();
  // method GetNumberOfChapters
  /*[id(0x0000000E)]*/ int GetNumberOfChapters(int lTitle, out int pVal);
  // method PlayChaptersAutoStop
  /*[id(0x0000000F)]*/ int PlayChaptersAutoStop(int strTitle, int strChapter, int strChapterCount);
  // property FullScreenMode
  /*[id(0x00000010)]*/ int get_FullScreenMode(out short displaySize);
  // property FullScreenMode
  /*[id(0x00000010)]*/ int set_FullScreenMode(short displaySize);
  // property PlayState
  /*[id(0x00000011)]*/ int get_PlayState(out DVDFilterState pVal);
  // method SelectUpperButton
  /*[id(0x00000012)]*/ int SelectUpperButton();
  // method SelectLowerButton
  /*[id(0x00000013)]*/ int SelectLowerButton();
  // method SelectLeftButton
  /*[id(0x00000014)]*/ int SelectLeftButton();
  // method SelectRightButton
  /*[id(0x00000015)]*/ int SelectRightButton();
  // method ActivateButton
  /*[id(0x00000016)]*/ int ActivateButton();
  // method SelectAndActivateButton
  /*[id(0x00000017)]*/ int SelectAndActivateButton(int lButton);
  // method ActivateAtPosition
  /*[id(0x00000018)]*/ int ActivateAtPosition(int xPos, int yPos);
  // method SelectAtPosition
  /*[id(0x00000019)]*/ int SelectAtPosition(int xPos, int yPos);
  // method GetButtonAtPosition
  /*[id(0x0000001A)]*/ int GetButtonAtPosition(int xPos, int yPos, out int plButton);
  // method GetButtonRect
  /*[id(0x0000001B)]*/ int GetButtonRect(int lButton, out IDVDRect ppRect);
  // method PlayNextChapter
  /*[id(0x0000001C)]*/ int PlayNextChapter();
  // method PlayPrevChapter
  /*[id(0x0000001D)]*/ int PlayPrevChapter();
  // method ReplayChapter
  /*[id(0x0000001E)]*/ int ReplayChapter();
  // method ReturnFromSubmenu
  /*[id(0x0000001F)]*/ int ReturnFromSubmenu();
  // method StillOff
  /*[id(0x00000020)]*/ int StillOff();
  // method GetAudioLanguage
  /*[id(0x00000021)]*/ int GetAudioLanguage(int lStream, short fFormat, out wchar* strAudioLang);
  // method GetSubpictureLanguage
  /*[id(0x00000022)]*/ int GetSubpictureLanguage(int lStream, out wchar* strLanguage);
  // property CurrentTitle
  /*[id(0x00000023)]*/ int get_CurrentTitle(out int pVal);
  // property CurrentChapter
  /*[id(0x00000024)]*/ int get_CurrentChapter(out int pVal);
  // property FramesPerSecond
  /*[id(0x00000025)]*/ int get_FramesPerSecond(out int pVal);
  // property CurrentTime
  /*[id(0x00000026)]*/ int get_CurrentTime(out wchar* pVal);
  // property DVDDirectory
  /*[id(0x00000027)]*/ int get_DVDDirectory(out wchar* pVal);
  // property DVDDirectory
  /*[id(0x00000027)]*/ int set_DVDDirectory(wchar* pVal);
  // property CurrentDomain
  /*[id(0x00000028)]*/ int get_CurrentDomain(out int pVal);
  // property CurrentDiscSide
  /*[id(0x00000029)]*/ int get_CurrentDiscSide(out int pVal);
  // property TitlesAvailable
  /*[id(0x0000002A)]*/ int get_TitlesAvailable(out int pVal);
  // property CurrentVolume
  /*[id(0x0000002B)]*/ int get_CurrentVolume(out int pVal);
  // property VolumesAvailable
  /*[id(0x0000002C)]*/ int get_VolumesAvailable(out int pVal);
  // method PlayPeriodInTitleAutoStop
  /*[id(0x0000002D)]*/ int PlayPeriodInTitleAutoStop(int lTitle, wchar* strStartTime, wchar* strEndTime);
  // property CurrentSubpictureStream
  /*[id(0x0000002E)]*/ int get_CurrentSubpictureStream(out int pVal);
  // property CurrentSubpictureStream
  /*[id(0x0000002E)]*/ int set_CurrentSubpictureStream(int pVal);
  // property SubpictureOn
  /*[id(0x0000002F)]*/ int get_SubpictureOn(out short pVal);
  // property SubpictureOn
  /*[id(0x0000002F)]*/ int set_SubpictureOn(short pVal);
  // property SubpictureStreamsAvailable
  /*[id(0x00000030)]*/ int get_SubpictureStreamsAvailable(out int pVal);
  // property TotalTitleTime
  /*[id(0x00000031)]*/ int get_TotalTitleTime(out wchar* pVal);
  // property CurrentCCService
  /*[id(0x00000032)]*/ int get_CurrentCCService(out int pVal);
  // property CurrentCCService
  /*[id(0x00000032)]*/ int set_CurrentCCService(int pVal);
  // property CurrentButton
  /*[id(0x00000033)]*/ int get_CurrentButton(out int pVal);
  // property ButtonsAvailable
  /*[id(0x00000034)]*/ int get_ButtonsAvailable(out int pVal);
  // property CCActive
  /*[id(0x00000035)]*/ int get_CCActive(out short pVal);
  // property CCActive
  /*[id(0x00000035)]*/ int set_CCActive(short pVal);
  // property CurrentAngle
  /*[id(0x00000036)]*/ int get_CurrentAngle(out int pVal);
  // property CurrentAngle
  /*[id(0x00000036)]*/ int set_CurrentAngle(int pVal);
  // property AnglesAvailable
  /*[id(0x00000037)]*/ int get_AnglesAvailable(out int pVal);
  // property AudioStreamsAvailable
  /*[id(0x00000038)]*/ int get_AudioStreamsAvailable(out int pVal);
  // property CurrentAudioStream
  /*[id(0x00000039)]*/ int get_CurrentAudioStream(out int pVal);
  // property CurrentAudioStream
  /*[id(0x00000039)]*/ int set_CurrentAudioStream(int pVal);
  // property ColorKey
  /*[id(0x0000003A)]*/ int get_ColorKey(out int pVal);
  // property ColorKey
  /*[id(0x0000003A)]*/ int set_ColorKey(int pVal);
  // method UOPValid
  /*[id(0x0000003B)]*/ int UOPValid(int lUOP, out short pfValid);
  // method GetGPRM
  /*[id(0x0000003C)]*/ int GetGPRM(int lIndex, out short psGPRM);
  // method GetSPRM
  /*[id(0x0000003D)]*/ int GetSPRM(int lIndex, out short psSPRM);
  // property DVDUniqueID
  /*[id(0x0000003E)]*/ int get_DVDUniqueID(out wchar* pVal);
  // property Mute
  /*[id(0x0000003F)]*/ int get_Mute(out short pVal);
  // property Mute
  /*[id(0x0000003F)]*/ int set_Mute(short pVal);
  // property Volume
  /*[id(0x00000040)]*/ int get_Volume(out int pVal);
  // property Volume
  /*[id(0x00000040)]*/ int set_Volume(int pVal);
  // property Balance
  /*[id(0x00000041)]*/ int get_Balance(out int pVal);
  // property Balance
  /*[id(0x00000041)]*/ int set_Balance(int pVal);
  // property EnableResetOnStop
  /*[id(0x00000042)]*/ int get_EnableResetOnStop(out short pVal);
  // property EnableResetOnStop
  /*[id(0x00000042)]*/ int set_EnableResetOnStop(short pVal);
  // property ShowCursor
  /*[id(0x00000043)]*/ int get_ShowCursor(out short pVal);
  // property ShowCursor
  /*[id(0x00000043)]*/ int set_ShowCursor(short pVal);
  // method DVDTimeCode2bstr
  /*[id(0x00000044)]*/ int DVDTimeCode2bstr(int timeCode, out wchar* pTimeStr);
  // property WindowlessActivation
  /*[id(0x00000045)]*/ int get_WindowlessActivation(out short pVal);
  // property WindowlessActivation
  /*[id(0x00000045)]*/ int set_WindowlessActivation(short pVal);
  // property DisableAutoMouseProcessing
  /*[id(0x00000046)]*/ int get_DisableAutoMouseProcessing(out short pVal);
  // property DisableAutoMouseProcessing
  /*[id(0x00000046)]*/ int set_DisableAutoMouseProcessing(short pVal);
  // method GetDVDScreenInMouseCoordinates
  /*[id(0x00000048)]*/ int GetDVDScreenInMouseCoordinates(out IDVDRect ppRect);
  // method SetDVDScreenInMouseCoordinates
  /*[id(0x00000049)]*/ int SetDVDScreenInMouseCoordinates(IDVDRect pRect);
  // method GetClipVideoRect
  /*[id(0x0000004A)]*/ int GetClipVideoRect(out IDVDRect ppRect);
  // method GetVideoSize
  /*[id(0x0000004B)]*/ int GetVideoSize(out IDVDRect ppRect);
  // method SetClipVideoRect
  /*[id(0x0000004C)]*/ int SetClipVideoRect(IDVDRect pRect);
  // method GetPlayerParentalLevel
  /*[id(0x0000004D)]*/ int GetPlayerParentalLevel(out int plParentalLevel);
  // method GetPlayerParentalCountry
  /*[id(0x0000004E)]*/ int GetPlayerParentalCountry(out int plCountryCode);
  // method GetTitleParentalLevels
  /*[id(0x0000004F)]*/ int GetTitleParentalLevels(int lTitle, out int plParentalLevels);
  // method SelectParentalLevel
  /*[id(0x00000050)]*/ int SelectParentalLevel(int lParentalLevel, wchar* strUserName, wchar* strPassword);
  // method SelectParentalCountry
  /*[id(0x00000051)]*/ int SelectParentalCountry(int lCountry, wchar* strUserName, wchar* strPassword);
  // NotifyParentalLevelChange
  /*[id(0x00000052)]*/ int NotifyParentalLevelChange(short newVal);
  // method AcceptParentalLevelChange
  /*[id(0x00000053)]*/ int AcceptParentalLevelChange(short fAccept, wchar* strUserName, wchar* strPassword);
  // method Eject
  /*[id(0x00000054)]*/ int Eject();
  // method SetGPRM
  /*[id(0x00000055)]*/ int SetGPRM(int lIndex, short sValue);
  // method GetDVDTextNumberOfLanguages
  /*[id(0x00000056)]*/ int GetDVDTextNumberOfLanguages(out int plNumOfLangs);
  // method GetDVDTextNumberOfStrings
  /*[id(0x00000057)]*/ int GetDVDTextNumberOfStrings(int lLangIndex, out int plNumOfStrings);
  // method GetDVDTextString
  /*[id(0x00000058)]*/ int GetDVDTextString(int lLangIndex, int lStringIndex, out wchar* pstrText);
  // method GetDVDTextStringType
  /*[id(0x00000059)]*/ int GetDVDTextStringType(int lLangIndex, int lStringIndex, out DVDTextStringType pType);
  // method SelectDefaultSubpictureLanguage
  /*[id(0x0000005A)]*/ int SelectDefaultSubpictureLanguage(int lang, DVDSPExt ext);
  // method SelectDefaultAudioLanguage
  /*[id(0x0000005B)]*/ int SelectDefaultAudioLanguage(int lang, int ext);
  // property ToolTip
  /*[id(0x0000005C)]*/ int get_ToolTip(out wchar* pVal);
  // property ToolTip
  /*[id(0x0000005C)]*/ int set_ToolTip(wchar* pVal);
  // method GetDelayTime
  /*[id(0x0000005D)]*/ int GetDelayTime(int delayType, out DWINVARIANT pVal);
  // method SetDelayTime
  /*[id(0x0000005E)]*/ int SetDelayTime(int delayType, DWINVARIANT newVal);
  // property ToolTipMaxWidth
  /*[id(0x0000005F)]*/ int get_ToolTipMaxWidth(out int pVal);
  // property ToolTipMaxWidth
  /*[id(0x0000005F)]*/ int set_ToolTipMaxWidth(int pVal);
  // property DVDAdm
  /*[id(0x00000060)]*/ int get_DVDAdm(out IDispatch pVal);
  // property CursorType
  /*[id(0x00000061)]*/ int get_CursorType(out DVDCursorType pVal);
  // property CursorType
  /*[id(0x00000061)]*/ int set_CursorType(DVDCursorType pVal);
  // method Zoom
  /*[id(0x00000062)]*/ int Zoom(int x, int y, double zoomRatio);
  // method RegionChange
  /*[id(0x00000063)]*/ int RegionChange();
  // method SaveBookmark
  /*[id(0x00000064)]*/ int SaveBookmark();
  // method RestoreBookmark
  /*[id(0x00000065)]*/ int RestoreBookmark();
  // method DeleteBookmark
  /*[id(0x00000066)]*/ int DeleteBookmark();
  // method Capture
  /*[id(0x00000067)]*/ int Capture();
  // property PreferredSubpictureStream
  /*[id(0x00000069)]*/ int get_PreferredSubpictureStream(out int pVal);
  // method CanStep
  /*[id(0x0000006A)]*/ int CanStep(short fBackwards, out short pfCan);
  // method Step
  /*[id(0x0000006B)]*/ int Step(int lStep);
  // property AspectRatio
  /*[id(0x0000006C)]*/ int get_AspectRatio(out double pVal);
  // method GetKaraokeChannelAssignment
  /*[id(0x0000006D)]*/ int GetKaraokeChannelAssignment(int lStream, out int lChannelAssignment);
  // method GetKaraokeChannelContent
  /*[id(0x0000006E)]*/ int GetKaraokeChannelContent(int lStream, int lChan, out int lContent);
  // property KaraokeAudioPresentationMode
  /*[id(0x0000006F)]*/ int get_KaraokeAudioPresentationMode(out int pVal);
  // property KaraokeAudioPresentationMode
  /*[id(0x0000006F)]*/ int set_KaraokeAudioPresentationMode(int pVal);
  // method DefaultAudioLanguage
  /*[id(0x00000070)]*/ int get_DefaultAudioLanguage(out int lang);
  // method DefaultAudioLanguageExt
  /*[id(0x00000071)]*/ int get_DefaultAudioLanguageExt(out int ext);
  // method DefaultSubpictureLanguage
  /*[id(0x00000072)]*/ int get_DefaultSubpictureLanguage(out int lang);
  // method DefaultSubpictureLanguageExt
  /*[id(0x00000073)]*/ int get_DefaultSubpictureLanguageExt(out DVDSPExt ext);
  // method DefaultMenuLanguage
  /*[id(0x00000074)]*/ int get_DefaultMenuLanguage(out int lang);
  // method DefaultMenuLanguage
  /*[id(0x00000074)]*/ int set_DefaultMenuLanguage(int lang);
  // method GetLangFromLangID
  /*[id(0x00000076)]*/ int GetLangFromLangID(int langID, out wchar* lang);
  // method IsAudioStreamEnabled
  /*[id(0x00000077)]*/ int IsAudioStreamEnabled(int lStream, out short fEnabled);
  // method IsSubpictureStreamEnabled
  /*[id(0x00000078)]*/ int IsSubpictureStreamEnabled(int lStream, out short fEnabled);
  // method GetDVDTextLanguageLCID
  /*[id(0x00000079)]*/ int GetDVDTextLanguageLCID(int lLangIndex, out int lcid);
  /*[id(0xFFFFFE0B)]*/ int set_BackColor(DWINVARIANT pclr);
  /*[id(0xFFFFFE0B)]*/ int get_BackColor(out DWINVARIANT pclr);
  /*[id(0xFFFFFDF3)]*/ int get_ReadyState(out int pVal);
}

// IDVDRect Interface
interface IDVDRect : IDispatch {
  mixin(uuid("90598166-2297-40ed-9ab2-59fd8e368fb2"));
  // static DWINGUID IID = { 0x90598166, 0x2297, 0x40ed, 0x9a, 0xb2, 0x59, 0xfd, 0x8e, 0x36, 0x8f, 0xb2 };
  // property x
  /*[id(0x00000001)]*/ int get_x(out int pVal);
  // property x
  /*[id(0x00000001)]*/ int set_x(int pVal);
  // property y
  /*[id(0x00000002)]*/ int get_y(out int pVal);
  // property y
  /*[id(0x00000002)]*/ int set_y(int pVal);
  // property Width
  /*[id(0x00000003)]*/ int get_Width(out int pVal);
  // property Width
  /*[id(0x00000003)]*/ int set_Width(int pVal);
  // property Height
  /*[id(0x00000004)]*/ int get_Height(out int pVal);
  // property Height
  /*[id(0x00000004)]*/ int set_Height(int pVal);
}

// IMSDVDAdm Interface
interface IMSDVDAdm : IDispatch {
  mixin(uuid("df55e77c-d1f6-4681-bff7-cd235f8122f3"));
  // static DWINGUID IID = { 0xdf55e77c, 0xd1f6, 0x4681, 0xbf, 0xf7, 0xcd, 0x23, 0x5f, 0x81, 0x22, 0xf3 };
  // method ChangePassword
  /*[id(0x00000001)]*/ int ChangePassword(wchar* strUserName, wchar* strOld, wchar* strNew);
  // property DisableScreenSaver
  /*[id(0x00000004)]*/ int get_DisableScreenSaver(out short pVal);
  // property DisableScreenSaver
  /*[id(0x00000004)]*/ int set_DisableScreenSaver(short pVal);
  // method SaveParentalLevel
  /*[id(0x00000005)]*/ int SaveParentalLevel(int level, wchar* strUserName, wchar* strPassword);
  // method SaveParentalCountry
  /*[id(0x00000006)]*/ int SaveParentalCountry(int country, wchar* strUserName, wchar* strPassword);
  // method ConfirmPassword
  /*[id(0x00000008)]*/ int ConfirmPassword(wchar* strUserName, wchar* strPassword, out short pVal);
  // method GetParentalLevel
  /*[id(0x0000000A)]*/ int GetParentalLevel(out int lLevel);
  // method GetParentalCountry
  /*[id(0x0000000B)]*/ int GetParentalCountry(out int lCountry);
  // property DefaultAudioLCID
  /*[id(0x0000000C)]*/ int get_DefaultAudioLCID(out int pVal);
  // property DefaultAudioLCID
  /*[id(0x0000000C)]*/ int set_DefaultAudioLCID(int pVal);
  // property DefaultSubpictureLCID
  /*[id(0x0000000D)]*/ int get_DefaultSubpictureLCID(out int pVal);
  // property DefaultSubpictureLCID
  /*[id(0x0000000D)]*/ int set_DefaultSubpictureLCID(int pVal);
  // property DefaultMenuLCID
  /*[id(0x0000000E)]*/ int get_DefaultMenuLCID(out int pVal);
  // property DefaultMenuLCID
  /*[id(0x0000000E)]*/ int set_DefaultMenuLCID(int pVal);
  // property BookmarkOnStop
  /*[id(0x0000000F)]*/ int get_BookmarkOnStop(out short pVal);
  // property BookmarkOnStop
  /*[id(0x0000000F)]*/ int set_BookmarkOnStop(short pVal);
  // property BookmarkOnClose
  /*[id(0x00000010)]*/ int get_BookmarkOnClose(out short pVal);
  // property BookmarkOnClose
  /*[id(0x00000010)]*/ int set_BookmarkOnClose(short pVal);
  // method RestoreScreenSaver
  /*[id(0x00000011)]*/ int RestoreScreenSaver();
  // method ConfirmPassword
  /*[id(0x00000012)]*/ int _ConfirmPassword(wchar* strUserName, wchar* strPassword, out short pVal);
}

// CoClasses

// MSWebDVD Class
abstract class MSWebDVD {
  mixin(uuid("38ee5cee-4b62-11d3-854f-00a0c9c898e7"));
  // static DWINGUID CLSID = { 0x38ee5cee, 0x4b62, 0x11d3, 0x85, 0x4f, 0x00, 0xa0, 0xc9, 0xc8, 0x98, 0xe7 };
  mixin Interfaces!(IMSWebDVD);
}

// DVDRect Class
abstract class DVDRect {
  mixin(uuid("b9240a2e-ee1a-4e1f-ad76-6536f9d3b176"));
  // static DWINGUID CLSID = { 0xb9240a2e, 0xee1a, 0x4e1f, 0xad, 0x76, 0x65, 0x36, 0xf9, 0xd3, 0xb1, 0x76 };
  mixin Interfaces!(IDVDRect);
}

// MSDVDAdm Class
abstract class MSDVDAdm {
  mixin(uuid("8d670533-270b-4549-b19b-414fb9c6ebdb"));
  // static DWINGUID CLSID = { 0x8d670533, 0x270b, 0x4549, 0xb1, 0x9b, 0x41, 0x4f, 0xb9, 0xc6, 0xeb, 0xdb };
  mixin Interfaces!(IMSDVDAdm);
}

// OverlayCallback Class
abstract class OverlayCallback {
  mixin(uuid("38aa78b2-b824-4c63-a512-02fd95fbdf4c"));
  // static DWINGUID CLSID = { 0x38aa78b2, 0xb824, 0x4c63, 0xa5, 0x12, 0x02, 0xfd, 0x95, 0xfb, 0xdf, 0x4c };
  mixin Interfaces!(IOverlayCallback);
}
