// Microsoft ActiveMovie Control
// Version 2.0

/*[uuid("05589fa0-c356-11ce-bf01-00aa0055595a")]*/
//module dwin.sys.win32.com.tlb.more.more.amovie;
module dwin.sys.win32.com.tlb.more.more.amcompat;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

// ActiveMovie Readiness State
enum ReadyStateConstants {
  amvUninitialized = 0x00000000,
  amvLoading = 0x00000001,
  amvInteractive = 0x00000003,
  amvComplete = 0x00000004,
}

// State of ActiveMovie Clip
enum StateConstants {
  amvNotLoaded = 0xFFFFFFFF,
  amvStopped = 0x00000000,
  amvPaused = 0x00000001,
  amvRunning = 0x00000002,
}

// ActiveMovie Display Mode
enum DisplayModeConstants {
  amvTime = 0x00000000,
  amvFrames = 0x00000001,
}

// Direct Show Video Size
enum WindowSizeConstants {
  amvOriginalSize = 0x00000000,
  amvDoubleOriginalSize = 0x00000001,
  amvOneSixteenthScreen = 0x00000002,
  amvOneFourthScreen = 0x00000003,
  amvOneHalfScreen = 0x00000004,
}

// ActiveMovie Appearance
enum AppearanceConstants {
  amvFlat = 0x00000000,
  amv3D = 0x00000001,
}

// ActiveMovie Border Style
enum BorderStyleConstants {
  amvNone = 0x00000000,
  amvFixedSingle = 0x00000001,
}

// Interfaces

// Event interface for ActiveMovie Control
interface DActiveMovieEvents : IDispatch {
  mixin(uuid("05589fa3-c356-11ce-bf01-00aa0055595a"));
  // static DWINGUID IID = { 0x05589fa3, 0xc356, 0x11ce, 0xbf, 0x01, 0x00, 0xaa, 0x00, 0x55, 0x59, 0x5a };
  /+// Indicates that the current state of the movie has changed
  /*[id(0x00000001)]*/ void StateChange(int oldState, int newState);+/
  /+// Indicates that the current position of the movie has changed
  /*[id(0x00000002)]*/ void PositionChange(double oldPosition, double newPosition);+/
  /+// ActiveMovie Control's progress timer
  /*[id(0x00000003)]*/ void Timer();+/
  /+// Reports that an asynchronous operation to open a file has completed successfully
  /*[id(0x00000032)]*/ void OpenComplete();+/
  /+/*[id(0xFFFFFDA8)]*/ void Click();+/
  /+/*[id(0xFFFFFDA7)]*/ void DblClick();+/
  /+/*[id(0xFFFFFDA6)]*/ void KeyDown(short* KeyCode, short Shift);+/
  /+/*[id(0xFFFFFDA4)]*/ void KeyUp(short* KeyCode, short Shift);+/
  /+/*[id(0xFFFFFDA5)]*/ void KeyPress(short* KeyAscii);+/
  /+/*[id(0xFFFFFDA3)]*/ void MouseDown(short Button, short Shift, OLE_XPOS_PIXELS x, OLE_YPOS_PIXELS y);+/
  /+/*[id(0xFFFFFDA2)]*/ void MouseMove(short Button, short Shift, OLE_XPOS_PIXELS x, OLE_YPOS_PIXELS y);+/
  /+/*[id(0xFFFFFDA1)]*/ void MouseUp(short Button, short Shift, OLE_XPOS_PIXELS x, OLE_YPOS_PIXELS y);+/
  /+/*[id(0x000003E7)]*/ void Error(short SCode, wchar* Description, wchar* Source, short* CancelDisplay);+/
}

// Event interface for ActiveMovie Control
interface DActiveMovieEvents2 : IDispatch {
  mixin(uuid("b6cd6553-e9cb-11d0-821f-00a0c91f9ca0"));
  // static DWINGUID IID = { 0xb6cd6553, 0xe9cb, 0x11d0, 0x82, 0x1f, 0x00, 0xa0, 0xc9, 0x1f, 0x9c, 0xa0 };
  /+// Indicates that the current state of the movie has changed
  /*[id(0x00000001)]*/ void StateChange(int oldState, int newState);+/
  /+// Indicates that the current position of the movie has changed
  /*[id(0x00000002)]*/ void PositionChange(double oldPosition, double newPosition);+/
  /+// ActiveMovie Control's progress timer
  /*[id(0x00000003)]*/ void Timer();+/
  /+// Reports that an asynchronous operation to open a file has completed successfully
  /*[id(0x00000032)]*/ void OpenComplete();+/
  /+/*[id(0xFFFFFDA8)]*/ void Click();+/
  /+/*[id(0xFFFFFDA7)]*/ void DblClick();+/
  /+/*[id(0xFFFFFDA6)]*/ void KeyDown(short* KeyCode, short Shift);+/
  /+/*[id(0xFFFFFDA4)]*/ void KeyUp(short* KeyCode, short Shift);+/
  /+/*[id(0xFFFFFDA5)]*/ void KeyPress(short* KeyAscii);+/
  /+/*[id(0xFFFFFDA3)]*/ void MouseDown(short Button, short Shift, OLE_XPOS_PIXELS x, OLE_YPOS_PIXELS y);+/
  /+/*[id(0xFFFFFDA2)]*/ void MouseMove(short Button, short Shift, OLE_XPOS_PIXELS x, OLE_YPOS_PIXELS y);+/
  /+/*[id(0xFFFFFDA1)]*/ void MouseUp(short Button, short Shift, OLE_XPOS_PIXELS x, OLE_YPOS_PIXELS y);+/
  /+/*[id(0x000003E7)]*/ void Error(short SCode, wchar* Description, wchar* Source, short* CancelDisplay);+/
  /+// Indicates that the display mode of the movie has changed
  /*[id(0x00000033)]*/ void DisplayModeChange();+/
  /+// Reports that the ReadyState property of the ActiveMovie Control has changed
  /*[id(0xFFFFFD9F)]*/ void ReadyStateChange(ReadyStateConstants ReadyState);+/
  /+/*[id(0x00000034)]*/ void ScriptCommand(wchar* bstrType, wchar* bstrText);+/
}

// ActiveMovie Control
interface IActiveMovie3 : IActiveMovie2 {
  mixin(uuid("265ec140-ae62-11d1-8500-00a0c91f9ca0"));
  // static DWINGUID IID = { 0x265ec140, 0xae62, 0x11d1, 0x85, 0x00, 0x00, 0xa0, 0xc9, 0x1f, 0x9c, 0xa0 };
  // Returns the Media Player object
  /*[id(0x00000457)]*/ int get_MediaPlayer(out IDispatch ppDispatch);
}

// ActiveMovie Control
interface IActiveMovie2 : IActiveMovie {
  mixin(uuid("b6cd6554-e9cb-11d0-821f-00a0c91f9ca0"));
  // static DWINGUID IID = { 0xb6cd6554, 0xe9cb, 0x11d0, 0x82, 0x1f, 0x00, 0xa0, 0xc9, 0x1f, 0x9c, 0xa0 };
  // Determines whether the sound card is enabled on the machine
  /*[id(0x00000035)]*/ int IsSoundCardEnabled(out short pbSoundCard);
  // Returns the readiness state of the control
  /*[id(0xFFFFFDF3)]*/ int get_ReadyState(out ReadyStateConstants pValue);
}

// ActiveMovie Control
interface IActiveMovie : IDispatch {
  mixin(uuid("05589fa2-c356-11ce-bf01-00aa0055595a"));
  // static DWINGUID IID = { 0x05589fa2, 0xc356, 0x11ce, 0xbf, 0x01, 0x00, 0xaa, 0x00, 0x55, 0x59, 0x5a };
  /*[id(0xFFFFFDD8)]*/ int AboutBox();
  // Puts the multimedia stream into Running state
  /*[id(0x60020001)]*/ int Run();
  // Puts the multimedia stream into Paused state
  /*[id(0x60020002)]*/ int Pause();
  // Puts the multimedia stream into Stopped state
  /*[id(0x60020003)]*/ int Stop();
  // Returns the width of the movie image
  /*[id(0x00000004)]*/ int get_ImageSourceWidth(out int pWidth);
  // Returns the height of the movie image
  /*[id(0x00000005)]*/ int get_ImageSourceHeight(out int pHeight);
  // Returns the name of the author of the movie clip
  /*[id(0x00000006)]*/ int get_Author(out wchar* pbstrAuthor);
  // Returns the title of the movie clip
  /*[id(0x00000007)]*/ int get_Title(out wchar* pbstrTitle);
  // Returns the copyright statement of the movie clip
  /*[id(0x00000008)]*/ int get_Copyright(out wchar* pbstrCopyright);
  // Returns the description of the movie clip
  /*[id(0x00000009)]*/ int get_Description(out wchar* pbstrDescription);
  // Returns the rating of the movie clip
  /*[id(0x0000000A)]*/ int get_Rating(out wchar* pbstrRating);
  // Returns/sets the current multimedia file
  /*[id(0x0000000B)]*/ int get_FileName(out wchar* pbstrFileName);
  // Returns/sets the current multimedia file
  /*[id(0x0000000B)]*/ int set_FileName(wchar* pbstrFileName);
  // Returns the duration of the multimedia stream, if known
  /*[id(0x0000000C)]*/ int get_Duration(out double pValue);
  // Returns/sets the current position of the multimedia stream
  /*[id(0x0000000D)]*/ int get_CurrentPosition(out double pValue);
  // Returns/sets the current position of the multimedia stream
  /*[id(0x0000000D)]*/ int set_CurrentPosition(double pValue);
  // Returns/sets the number of times the movie will be played
  /*[id(0x0000000E)]*/ int get_PlayCount(out int pPlayCount);
  // Returns/sets the number of times the movie will be played
  /*[id(0x0000000E)]*/ int set_PlayCount(int pPlayCount);
  // Returns/sets the position where playback will begin
  /*[id(0x0000000F)]*/ int get_SelectionStart(out double pValue);
  // Returns/sets the position where playback will begin
  /*[id(0x0000000F)]*/ int set_SelectionStart(double pValue);
  // Returns/sets the position where playback will stop
  /*[id(0x00000010)]*/ int get_SelectionEnd(out double pValue);
  // Returns/sets the position where playback will stop
  /*[id(0x00000010)]*/ int set_SelectionEnd(double pValue);
  // Returns the current state of the movie clip
  /*[id(0x00000011)]*/ int get_CurrentState(out StateConstants pState);
  // Returns/sets the rate of the multimedia stream
  /*[id(0x00000012)]*/ int get_Rate(out double pValue);
  // Returns/sets the rate of the multimedia stream
  /*[id(0x00000012)]*/ int set_Rate(double pValue);
  // Returns/sets the audio volume of the multimedia stream
  /*[id(0x00000013)]*/ int get_Volume(out int pValue);
  // Returns/sets the audio volume of the multimedia stream
  /*[id(0x00000013)]*/ int set_Volume(int pValue);
  // Returns/sets the stereo balance of the multimedia stream
  /*[id(0x00000014)]*/ int get_Balance(out int pValue);
  // Returns/sets the stereo balance of the multimedia stream
  /*[id(0x00000014)]*/ int set_Balance(int pValue);
  // Enables/disables the right-click context menu
  /*[id(0x00000015)]*/ int get_EnableContextMenu(out short pEnable);
  // Enables/disables the right-click context menu
  /*[id(0x00000015)]*/ int set_EnableContextMenu(short pEnable);
  // Shows/hides the display panel
  /*[id(0x00000016)]*/ int get_ShowDisplay(out short Show);
  // Shows/hides the display panel
  /*[id(0x00000016)]*/ int set_ShowDisplay(short Show);
  // Shows/hides the control panel
  /*[id(0x00000017)]*/ int get_ShowControls(out short Show);
  // Shows/hides the control panel
  /*[id(0x00000017)]*/ int set_ShowControls(short Show);
  // Shows/hides the position buttons in the control panel
  /*[id(0x00000018)]*/ int get_ShowPositionControls(out short Show);
  // Shows/hides the position buttons in the control panel
  /*[id(0x00000018)]*/ int set_ShowPositionControls(short Show);
  // Shows/hides the selection buttons in the control panel
  /*[id(0x00000019)]*/ int get_ShowSelectionControls(out short Show);
  // Shows/hides the selection buttons in the control panel
  /*[id(0x00000019)]*/ int set_ShowSelectionControls(short Show);
  // Shows/hides the tracker bar in the control panel
  /*[id(0x0000001A)]*/ int get_ShowTracker(out short Show);
  // Shows/hides the tracker bar in the control panel
  /*[id(0x0000001A)]*/ int set_ShowTracker(short Show);
  // Enables/disables the position buttons in the control panel
  /*[id(0x0000001B)]*/ int get_EnablePositionControls(out short Enable);
  // Enables/disables the position buttons in the control panel
  /*[id(0x0000001B)]*/ int set_EnablePositionControls(short Enable);
  // Enables/disables the selection buttons in the control panel
  /*[id(0x0000001C)]*/ int get_EnableSelectionControls(out short Enable);
  // Enables/disables the selection buttons in the control panel
  /*[id(0x0000001C)]*/ int set_EnableSelectionControls(short Enable);
  // Enables/disables the tracker bar in the control panel
  /*[id(0x0000001D)]*/ int get_EnableTracker(out short Enable);
  // Enables/disables the tracker bar in the control panel
  /*[id(0x0000001D)]*/ int set_EnableTracker(short Enable);
  // Allows/disallows hiding the display panel at run time
  /*[id(0x0000001E)]*/ int get_AllowHideDisplay(out short Show);
  // Allows/disallows hiding the display panel at run time
  /*[id(0x0000001E)]*/ int set_AllowHideDisplay(short Show);
  // Allows/disallows hiding the control panel at run time
  /*[id(0x0000001F)]*/ int get_AllowHideControls(out short Show);
  // Allows/disallows hiding the control panel at run time
  /*[id(0x0000001F)]*/ int set_AllowHideControls(short Show);
  // Returns/sets the display mode (time or frames)
  /*[id(0x00000020)]*/ int get_DisplayMode(out DisplayModeConstants pValue);
  // Returns/sets the display mode (time or frames)
  /*[id(0x00000020)]*/ int set_DisplayMode(DisplayModeConstants pValue);
  // Allows/disallows changing the display mode at run time
  /*[id(0x00000021)]*/ int get_AllowChangeDisplayMode(out short fAllow);
  // Allows/disallows changing the display mode at run time
  /*[id(0x00000021)]*/ int set_AllowChangeDisplayMode(short fAllow);
  // Returns/sets the current filter graph
  /*[id(0x00000022)]*/ int get_FilterGraph(out IUnknown ppFilterGraph);
  // Returns/sets the current filter graph
  /*[id(0x00000022)]*/ int set_FilterGraph(IUnknown ppFilterGraph);
  // Returns the current filter graph's Dispatch interface
  /*[id(0x00000023)]*/ int get_FilterGraphDispatch(out IDispatch pDispatch);
  // Returns/sets the foreground color of the display panel
  /*[id(0x00000024)]*/ int get_DisplayForeColor(out uint ForeColor);
  // Returns/sets the foreground color of the display panel
  /*[id(0x00000024)]*/ int set_DisplayForeColor(uint ForeColor);
  // Returns/sets the background color of the display panel
  /*[id(0x00000025)]*/ int get_DisplayBackColor(out uint BackColor);
  // Returns/sets the background color of the display panel
  /*[id(0x00000025)]*/ int set_DisplayBackColor(uint BackColor);
  // Returns/sets the movie window size
  /*[id(0x00000026)]*/ int get_MovieWindowSize(out WindowSizeConstants WindowSize);
  // Returns/sets the movie window size
  /*[id(0x00000026)]*/ int set_MovieWindowSize(WindowSizeConstants WindowSize);
  // Indicates whether the media clip will run full screen
  /*[id(0x00000027)]*/ int get_FullScreenMode(out short pEnable);
  // Indicates whether the media clip will run full screen
  /*[id(0x00000027)]*/ int set_FullScreenMode(short pEnable);
  // Indicates whether the Control will start playing when activated
  /*[id(0x00000028)]*/ int get_AutoStart(out short pEnable);
  // Indicates whether the Control will start playing when activated
  /*[id(0x00000028)]*/ int set_AutoStart(short pEnable);
  // Indicates whether the media clip will rewind automatically after playing
  /*[id(0x00000029)]*/ int get_AutoRewind(out short pEnable);
  // Indicates whether the media clip will rewind automatically after playing
  /*[id(0x00000029)]*/ int set_AutoRewind(short pEnable);
  // Returns the handle of the control window
  /*[id(0xFFFFFDFD)]*/ int get_hWnd(out int hWnd);
  // Returns/sets the appearance
  /*[id(0xFFFFFDF8)]*/ int get_Appearance(out AppearanceConstants pAppearance);
  // Returns/sets the appearance
  /*[id(0xFFFFFDF8)]*/ int set_Appearance(AppearanceConstants pAppearance);
  // Returns/sets the border style
  /*[id(0x0000002A)]*/ int get_BorderStyle(out BorderStyleConstants pBorderStyle);
  // Returns/sets the border style
  /*[id(0x0000002A)]*/ int set_BorderStyle(BorderStyleConstants pBorderStyle);
  // Enables/disables the control
  /*[id(0xFFFFFDFE)]*/ int get_Enabled(out short pEnabled);
  // Enables/disables the control
  /*[id(0xFFFFFDFE)]*/ int set_Enabled(short pEnabled);
  /*[id(0x6002004D)]*/ int get_Info(out int ppInfo);
}

// CoClasses

// Microsoft ActiveMovie Control
abstract class ActiveMovie {
  mixin(uuid("05589fa1-c356-11ce-bf01-00aa0055595a"));
  // static DWINGUID CLSID = { 0x05589fa1, 0xc356, 0x11ce, 0xbf, 0x01, 0x00, 0xaa, 0x00, 0x55, 0x59, 0x5a };
  mixin Interfaces!(IActiveMovie3, IActiveMovie2, IActiveMovie, DActiveMovieEvents);
}
