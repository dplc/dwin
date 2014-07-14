// Microsoft NetShow Player
// Version 1.0

/*[uuid("2179c5d0-ebff-11cf-b6fd-00aa00b4e220")]*/
//module dwin.sys.win32.com.tlb.more.nsplay;
module dwin.sys.win32.com.tlb.more.nscompat;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// Event interface for NSPlay control
interface DNSPlayEvents : IDispatch {
  mixin(uuid("e7c4be81-7960-11d0-b727-00aa00b4e220"));
  // static DWINGUID IID = { 0xe7c4be81, 0x7960, 0x11d0, 0xb7, 0x27, 0x00, 0xaa, 0x00, 0xb4, 0xe2, 0x20 };
  /+// Sent when a key is pressed
  /*[id(0xFFFFFDA6)]*/ void KeyDown(short KeyCode, short ShiftState);+/
  /+// Sent when a key is released
  /*[id(0xFFFFFDA4)]*/ void KeyUp(short KeyCode, short ShiftState);+/
  /+// Sent when a character is entered
  /*[id(0xFFFFFDA5)]*/ void KeyPress(short CharacterCode);+/
  /+// Sent when a mouse button is pressed
  /*[id(0xFFFFFDA3)]*/ void MouseDown(short Button, short ShiftState, OLE_XPOS_PIXELS x, OLE_YPOS_PIXELS y);+/
  /+// Sent when a mouse button is released
  /*[id(0xFFFFFDA1)]*/ void MouseUp(short Button, short ShiftState, OLE_XPOS_PIXELS x, OLE_YPOS_PIXELS y);+/
  /+// Sent when a mouse button is clicked
  /*[id(0xFFFFFDA8)]*/ void Click(short Button, short ShiftState, OLE_XPOS_PIXELS x, OLE_YPOS_PIXELS y);+/
  /+// Sent when a mouse button is double clicked
  /*[id(0xFFFFFDA7)]*/ void DblClick(short Button, short ShiftState, OLE_XPOS_PIXELS x, OLE_YPOS_PIXELS y);+/
  /+// Sent when the mouse is moved
  /*[id(0xFFFFFDA2)]*/ void MouseMove(short Button, short ShiftState, OLE_XPOS_PIXELS x, OLE_YPOS_PIXELS y);+/
  /+// Sent when a synchronized command or URL is received
  /*[id(0x00000BB9)]*/ void ScriptCommand(wchar* scType, wchar* Param);+/
  /+// Sent when the end of file is reached
  /*[id(0x00000BBA)]*/ void EndOfStream(int Result);+/
  /+// Sent when the control begins or ends buffering
  /*[id(0x00000BBB)]*/ void Buffering(short Start);+/
  /+// Sent when the control is disconnected from the server
  /*[id(0x00000BBC)]*/ void Disconnect(int Result);+/
  /+// Sent when the control changes CurrentState
  /*[id(0x00000BBD)]*/ void StateChange(int OldState, int NewState);+/
  /+// Sent when a marker is reached
  /*[id(0x00000BBE)]*/ void MarkerHit(int MarkerNum);+/
  /+// Sent when automatic playback fails
  /*[id(0x00000BBF)]*/ void AutoStartFailure(int Result);+/
  /+// Sent when a new stream is started in a channel
  /*[id(0x00000BC0)]*/ void NewStream();+/
  /+// Sent when the control encounters a problem
  /*[id(0x00000BC1)]*/ void Warning(int WarningType, int Param, wchar* Description);+/
  /+// Sent when the control has an error condition
  /*[id(0x00000BC2)]*/ void Error();+/
  /+// Sent when the control changes OpenState
  /*[id(0x00000BC3)]*/ void OpenStateChange(int OldState, int NewState);+/
  /+// Sent when the control changes PlayState
  /*[id(0x00000BC4)]*/ void PlayStateChange(int OldState, int NewState);+/
}

// Event interface for NSOPlay control
interface DNSOPlayEvents : IDispatch {
  mixin(uuid("2179c5d2-ebff-11cf-b6fd-00aa00b4e220"));
  // static DWINGUID IID = { 0x2179c5d2, 0xebff, 0x11cf, 0xb6, 0xfd, 0x00, 0xaa, 0x00, 0xb4, 0xe2, 0x20 };
  /+// Sent when a key is pressed
  /*[id(0xFFFFFDA6)]*/ void KeyDown(short KeyCode, short ShiftState);+/
  /+// Sent when a key is released
  /*[id(0xFFFFFDA4)]*/ void KeyUp(short KeyCode, short ShiftState);+/
  /+// Sent when a character is entered
  /*[id(0xFFFFFDA5)]*/ void KeyPress(short CharacterCode);+/
  /+// Sent when a mouse button is pressed
  /*[id(0xFFFFFDA3)]*/ void MouseDown(short Button, short ShiftState, OLE_XPOS_PIXELS x, OLE_YPOS_PIXELS y);+/
  /+// Sent when a mouse button is released
  /*[id(0xFFFFFDA1)]*/ void MouseUp(short Button, short ShiftState, OLE_XPOS_PIXELS x, OLE_YPOS_PIXELS y);+/
  /+// Sent when a mouse button is clicked
  /*[id(0xFFFFFDA8)]*/ void Click(short Button, short ShiftState, OLE_XPOS_PIXELS x, OLE_YPOS_PIXELS y);+/
  /+// Sent when a mouse button is double clicked
  /*[id(0xFFFFFDA7)]*/ void DblClick(short Button, short ShiftState, OLE_XPOS_PIXELS x, OLE_YPOS_PIXELS y);+/
  /+// Sent when the mouse is moved
  /*[id(0xFFFFFDA2)]*/ void MouseMove(short Button, short ShiftState, OLE_XPOS_PIXELS x, OLE_YPOS_PIXELS y);+/
  /+// Sent when a synchronized command or URL is received
  /*[id(0x00000BB9)]*/ void ScriptCommand(wchar* bstrType, wchar* bstrParam);+/
  /+// Sent when the end of file is reached
  /*[id(0x00000BBA)]*/ void EndOfStream(int Result);+/
  /+// Sent when the control begins or ends buffering
  /*[id(0x00000BBB)]*/ void Buffering(short Start);+/
  /+// Sent when the control is disconnected from the server
  /*[id(0x00000BBC)]*/ void Disconnect(int Result);+/
  /+// Sent when the control changes file playback state
  /*[id(0x00000BBD)]*/ void StateChange(int OldState, int NewState);+/
  /+// Sent when a marker is reached
  /*[id(0x00000BBE)]*/ void MarkerHit(int MarkerNum);+/
  /+// Sent when automatic playback fails
  /*[id(0x00000BBF)]*/ void AutoStartFailure(int Result);+/
}

// Dispatch interface for NSPlay Control
interface INSPlay1 : INSPlay {
  mixin(uuid("265ec141-ae62-11d1-8500-00a0c91f9ca0"));
  // static DWINGUID IID = { 0x265ec141, 0xae62, 0x11d1, 0x85, 0x00, 0x00, 0xa0, 0xc9, 0x1f, 0x9c, 0xa0 };
  // Returns the Media Player object
  /*[id(0x00000457)]*/ int get_MediaPlayer(out IDispatch ppdispatch);
}

// Dispatch interface for NSPlay Control
interface INSPlay : INSOPlay {
  mixin(uuid("e7c4be80-7960-11d0-b727-00aa00b4e220"));
  // static DWINGUID IID = { 0xe7c4be80, 0x7960, 0x11d0, 0xb7, 0x27, 0x00, 0xaa, 0x00, 0xb4, 0xe2, 0x20 };
  // Returns the name of the channel
  /*[id(0x0000041A)]*/ int get_ChannelName(out wchar* pbstrChannelName);
  // Returns the description of the channel
  /*[id(0x0000041B)]*/ int get_ChannelDescription(out wchar* pbstrChannelDescription);
  // Returns the location of the channel metafile
  /*[id(0x0000041C)]*/ int get_ChannelURL(out wchar* pbstrChannelURL);
  // Returns the contact address of the channel
  /*[id(0x0000041D)]*/ int get_ContactAddress(out wchar* pbstrContactAddress);
  // Returns the contact phone number of the channel
  /*[id(0x0000041E)]*/ int get_ContactPhone(out wchar* pbstrContactPhone);
  // Returns the contact e-mail address of the channel
  /*[id(0x0000041F)]*/ int get_ContactEmail(out wchar* pbstrContactEmail);
  // Returns or sets whether or not the display size can be set at run time
  /*[id(0x00000420)]*/ int get_AllowChangeDisplaySize(out short pAllowChangeDisplaySize);
  // Returns or sets whether or not the display size can be set at run time
  /*[id(0x00000420)]*/ int set_AllowChangeDisplaySize(short pAllowChangeDisplaySize);
  // Returns the number of installable codecs used by the file
  /*[id(0x00000421)]*/ int get_CodecCount(out int pCodecCount);
  // Returns whether or not the source is a broadcast
  /*[id(0x00000422)]*/ int get_IsBroadcast(out short pIsBroadcast);
  // Returns whether or not the duration is known
  /*[id(0x00000423)]*/ int get_IsDurationValid(out short pIsDurationValid);
  // Returns the protocol used to receive data
  /*[id(0x00000424)]*/ int get_SourceProtocol(out int pSourceProtocol);
  // Returns the open state of the control
  /*[id(0x00000425)]*/ int get_OpenState(out int pOpenState);
  // Returns or sets whether or not the control sends OpenStateChange events
  /*[id(0x00000426)]*/ int get_SendOpenStateChangeEvents(out short pSendOpenStateChangeEvents);
  // Returns or sets whether or not the control sends OpenStateChange events
  /*[id(0x00000426)]*/ int set_SendOpenStateChangeEvents(short pSendOpenStateChangeEvents);
  // Returns or sets whether or not the control sends Warning events
  /*[id(0x00000427)]*/ int get_SendWarningEvents(out short pSendWarningEvents);
  // Returns or sets whether or not the control sends Warning events
  /*[id(0x00000427)]*/ int set_SendWarningEvents(short pSendWarningEvents);
  // Returns or sets whether or not the control sends Error events
  /*[id(0x00000428)]*/ int get_SendErrorEvents(out short pSendErrorEvents);
  // Returns or sets whether or not the control sends Error events
  /*[id(0x00000428)]*/ int set_SendErrorEvents(short pSendErrorEvents);
  // Returns whether or not the control currently has an error
  /*[id(0x00000429)]*/ int get_HasError(out short pHasError);
  // Returns the description of the current error state
  /*[id(0x0000042A)]*/ int get_ErrorDescription(out wchar* pbstrErrorDescription);
  // Returns the current error code
  /*[id(0x0000042B)]*/ int get_ErrorCode(out int pErrorCode);
  // Returns the play state of the control
  /*[id(0x0000042C)]*/ int get_PlayState(out int pPlayState);
  // Returns or sets whether or not the control sends PlayStateChange events
  /*[id(0x0000042D)]*/ int get_SendPlayStateChangeEvents(out short pSendPlayStateChangeEvents);
  // Returns or sets whether or not the control sends PlayStateChange events
  /*[id(0x0000042D)]*/ int set_SendPlayStateChangeEvents(short pSendPlayStateChangeEvents);
  // Returns the control's buffering time
  /*[id(0x0000042E)]*/ int get_BufferingTime(out double pBufferingTime);
  // Returns the control's buffering time
  /*[id(0x0000042E)]*/ int set_BufferingTime(double pBufferingTime);
  // Returns whether or not the control uses a fixed UDP port number
  /*[id(0x0000042F)]*/ int get_UseFixedUDPPort(out short pUseFixedUDPPort);
  // Returns whether or not the control uses a fixed UDP port number
  /*[id(0x0000042F)]*/ int set_UseFixedUDPPort(short pUseFixedUDPPort);
  // Returns the control's fixed UDP port number
  /*[id(0x00000430)]*/ int get_FixedUDPPort(out int pFixedUDPPort);
  // Returns the control's fixed UDP port number
  /*[id(0x00000430)]*/ int set_FixedUDPPort(int pFixedUDPPort);
  // Returns whether or not the control uses a proxy server for HTTP streaming
  /*[id(0x00000431)]*/ int get_UseHTTPProxy(out short pUseHTTPProxy);
  // Returns whether or not the control uses a proxy server for HTTP streaming
  /*[id(0x00000431)]*/ int set_UseHTTPProxy(short pUseHTTPProxy);
  // Returns whether or not the control automatically sets HTTP proxy info
  /*[id(0x00000439)]*/ int get_EnableAutoProxy(out short pEnableAutoProxy);
  // Returns whether or not the control automatically sets HTTP proxy info
  /*[id(0x00000439)]*/ int set_EnableAutoProxy(short pEnableAutoProxy);
  // Returns the control's HTTP proxy server
  /*[id(0x00000432)]*/ int get_HTTPProxyHost(out wchar* pbstrHTTPProxyHost);
  // Returns the control's HTTP proxy server
  /*[id(0x00000432)]*/ int set_HTTPProxyHost(wchar* pbstrHTTPProxyHost);
  // Returns the control's HTTP proxy port number
  /*[id(0x00000433)]*/ int get_HTTPProxyPort(out int pHTTPProxyPort);
  // Returns the control's HTTP proxy port number
  /*[id(0x00000433)]*/ int set_HTTPProxyPort(int pHTTPProxyPort);
  // Returns whether or not the control attempts to receive multicast data
  /*[id(0x00000434)]*/ int get_EnableMulticast(out short pEnableMulticast);
  // Returns whether or not the control attempts to receive multicast data
  /*[id(0x00000434)]*/ int set_EnableMulticast(short pEnableMulticast);
  // Returns whether or not the control attempts to receive data using UDP
  /*[id(0x00000435)]*/ int get_EnableUDP(out short pEnableUDP);
  // Returns whether or not the control attempts to receive data using UDP
  /*[id(0x00000435)]*/ int set_EnableUDP(short pEnableUDP);
  // Returns whether or not the control attempts to receive data using TCP
  /*[id(0x00000436)]*/ int get_EnableTCP(out short pEnableTCP);
  // Returns whether or not the control attempts to receive data using TCP
  /*[id(0x00000436)]*/ int set_EnableTCP(short pEnableTCP);
  // Returns whether or not the control attempts to receive data using HTTP
  /*[id(0x00000437)]*/ int get_EnableHTTP(out short pEnableHTTP);
  // Returns whether or not the control attempts to receive data using HTTP
  /*[id(0x00000437)]*/ int set_EnableHTTP(short pEnableHTTP);
  // Returns the percentage of buffering completed
  /*[id(0x00000438)]*/ int get_BufferingProgress(out int pBufferingProgress);
  // Returns or sets the control's base HTTP URL
  /*[id(0x0000043A)]*/ int get_BaseURL(out wchar* pbstrBaseURL);
  // Returns or sets the control's base HTTP URL
  /*[id(0x0000043A)]*/ int set_BaseURL(wchar* pbstrBaseURL);
  // Returns or sets the control's default target HTTP frame
  /*[id(0x0000043B)]*/ int get_DefaultFrame(out wchar* pbstrDefaultFrame);
  // Returns or sets the control's default target HTTP frame
  /*[id(0x0000043B)]*/ int set_DefaultFrame(wchar* pbstrDefaultFrame);
  // Displays version information dialog box
  /*[id(0xFFFFFDD8)]*/ int AboutBox();
  // Cancels the current operation
  /*[id(0x000007D6)]*/ int Cancel();
  // Returns whether or not a codec is installed
  /*[id(0x000007D7)]*/ int GetCodecInstalled(int CodecNum, out short pCodecInstalled);
  // Returns the descriptive name of a codec
  /*[id(0x000007D8)]*/ int GetCodecDescription(int CodecNum, out wchar* pbstrCodecDescription);
  // Returns the URL for a codec
  /*[id(0x000007D9)]*/ int GetCodecURL(int CodecNum, out wchar* pbstrCodecURL);
  // Opens the given filename asynchronously
  /*[id(0x000007DA)]*/ int Open(wchar* bstrFileName);
}

// Dispatch interface for NSOPlay Control
interface INSOPlay : IDispatch {
  mixin(uuid("2179c5d1-ebff-11cf-b6fd-00aa00b4e220"));
  // static DWINGUID IID = { 0x2179c5d1, 0xebff, 0x11cf, 0xb6, 0xfd, 0x00, 0xaa, 0x00, 0xb4, 0xe2, 0x20 };
  // Returns the original width of the source images
  /*[id(0x000003E9)]*/ int get_ImageSourceWidth(out int pWidth);
  // Returns the original height of the source images
  /*[id(0x000003EA)]*/ int get_ImageSourceHeight(out int pHeight);
  // Returns the play duration of the file
  /*[id(0x000003EB)]*/ int get_Duration(out double pDuration);
  // Returns the author of the file
  /*[id(0x000003EC)]*/ int get_Author(out wchar* pbstrAuthor);
  // Returns the copyright statement of the file
  /*[id(0x000003ED)]*/ int get_Copyright(out wchar* pbstrCopyright);
  // Returns the description of the file
  /*[id(0x000003EE)]*/ int get_Description(out wchar* pbstrDescription);
  // Returns the rating of the file
  /*[id(0x000003EF)]*/ int get_Rating(out wchar* pbstrRating);
  // Returns the title of the file
  /*[id(0x000003F0)]*/ int get_Title(out wchar* pbstrTitle);
  // Returns the source path of the file
  /*[id(0x000003F1)]*/ int get_SourceLink(out wchar* pbstrSourceLink);
  // Returns the number of markers in the file
  /*[id(0x000003F2)]*/ int get_MarkerCount(out int pMarkerCount);
  // Returns whether or not the file can be scanned
  /*[id(0x000003F3)]*/ int get_CanScan(out short pCanScan);
  // Returns whether or not the file can be seeked into
  /*[id(0x000003F4)]*/ int get_CanSeek(out short pCanSeek);
  // Returns whether or not the file can be seeked into by markers
  /*[id(0x00000417)]*/ int get_CanSeekToMarkers(out short pCanSeekToMarkers);
  // Returns the creation date of the file
  /*[id(0x0000040C)]*/ int get_CreationDate(out double pCreationDate);
  // Returns the bandwidth of the file in bits per second
  /*[id(0x0000040D)]*/ int get_Bandwidth(out int pBandwidth);
  // Returns the error correction type of the file
  /*[id(0x0000040E)]*/ int get_ErrorCorrection(out wchar* pbstrErrorCorrection);
  // Returns or sets whether or not file playback is automatically started
  /*[id(0x000003F9)]*/ int get_AutoStart(out short pAutoStart);
  // Returns or sets whether or not file playback is automatically started
  /*[id(0x000003F9)]*/ int set_AutoStart(short pAutoStart);
  // Returns or sets whether or not a file is rewound at the end of playback
  /*[id(0x000003FA)]*/ int get_AutoRewind(out short pAutoRewind);
  // Returns or sets whether or not a file is rewound at the end of playback
  /*[id(0x000003FA)]*/ int set_AutoRewind(short pAutoRewind);
  // Returns or sets whether or not the control type can be set at run time
  /*[id(0x000003FB)]*/ int get_AllowChangeControlType(out short pAllowChangeControlType);
  // Returns or sets whether or not the control type can be set at run time
  /*[id(0x000003FB)]*/ int set_AllowChangeControlType(short pAllowChangeControlType);
  // Returns or sets whether or not received URLs are automatically invoked
  /*[id(0x000003FC)]*/ int get_InvokeURLs(out short pInvokeURLs);
  // Returns or sets whether or not received URLs are automatically invoked
  /*[id(0x000003FC)]*/ int set_InvokeURLs(short pInvokeURLs);
  // Returns or sets whether or not a right mouse click invokes a context menu
  /*[id(0x000003FD)]*/ int get_EnableContextMenu(out short pEnableContextMenu);
  // Returns or sets whether or not a right mouse click invokes a context menu
  /*[id(0x000003FD)]*/ int set_EnableContextMenu(short pEnableContextMenu);
  // Returns or sets whether or not the control is transparent before playing
  /*[id(0x000003FE)]*/ int get_TransparentAtStart(out short pTransparentAtStart);
  // Returns or sets whether or not the control is transparent before playing
  /*[id(0x000003FE)]*/ int set_TransparentAtStart(short pTransparentAtStart);
  /*[id(0x000003FF)]*/ int get_TransparentOnStop(out short pTransparentOnStop);
  /*[id(0x000003FF)]*/ int set_TransparentOnStop(short pTransparentOnStop);
  // Returns or sets whether or not clicking on the control starts file playback
  /*[id(0x00000401)]*/ int get_ClickToPlay(out short pClickToPlay);
  // Returns or sets whether or not clicking on the control starts file playback
  /*[id(0x00000401)]*/ int set_ClickToPlay(short pClickToPlay);
  // Returns or sets the current file name and path
  /*[id(0x00000402)]*/ int get_FileName(out wchar* pbstrFileName);
  // Returns or sets the current file name and path
  /*[id(0x00000402)]*/ int set_FileName(wchar* pbstrFileName);
  // Returns or sets the current position in the file
  /*[id(0x00000403)]*/ int get_CurrentPosition(out double pCurrentPosition);
  // Returns or sets the current position in the file
  /*[id(0x00000403)]*/ int set_CurrentPosition(double pCurrentPosition);
  // Returns or sets the current playback rate
  /*[id(0x00000404)]*/ int get_Rate(out double pRate);
  // Returns or sets the current playback rate
  /*[id(0x00000404)]*/ int set_Rate(double pRate);
  // Returns or sets the current marker number
  /*[id(0x00000405)]*/ int get_CurrentMarker(out int pCurrentMarker);
  // Returns or sets the current marker number
  /*[id(0x00000405)]*/ int set_CurrentMarker(int pCurrentMarker);
  // Returns or sets the number of times a file plays
  /*[id(0x00000406)]*/ int get_PlayCount(out int pPlayCount);
  // Returns or sets the number of times a file plays
  /*[id(0x00000406)]*/ int set_PlayCount(int pPlayCount);
  // Returns the current state of the control
  /*[id(0x00000407)]*/ int get_CurrentState(out int pCurrentState);
  // Returns or sets the display size of images
  /*[id(0x00000408)]*/ int get_DisplaySize(out int pDisplaySize);
  // Returns or sets the display size of images
  /*[id(0x00000408)]*/ int set_DisplaySize(int pDisplaySize);
  // Returns the window handle of the control's main window
  /*[id(0x00000409)]*/ int get_MainWindow(out int pMainWindow);
  // Returns or sets the type of playback controls displayed
  /*[id(0x0000040A)]*/ int get_ControlType(out int pControlType);
  // Returns or sets the type of playback controls displayed
  /*[id(0x0000040A)]*/ int set_ControlType(int pControlType);
  // Returns or sets whether or not scanning is enabled on files that support it
  /*[id(0x0000040B)]*/ int get_AllowScan(out short pAllowScan);
  // Returns or sets whether or not scanning is enabled on files that support it
  /*[id(0x0000040B)]*/ int set_AllowScan(short pAllowScan);
  // Returns or sets whether or not the control sends keyboard events
  /*[id(0x000003F5)]*/ int get_SendKeyboardEvents(out short pSendKeyboardEvents);
  // Returns or sets whether or not the control sends keyboard events
  /*[id(0x000003F5)]*/ int set_SendKeyboardEvents(short pSendKeyboardEvents);
  // Returns or sets whether or not the control sends mouse click events
  /*[id(0x000003F6)]*/ int get_SendMouseClickEvents(out short pSendMouseClickEvents);
  // Returns or sets whether or not the control sends mouse click events
  /*[id(0x000003F6)]*/ int set_SendMouseClickEvents(short pSendMouseClickEvents);
  // Returns or sets whether or not the control sends mouse move events
  /*[id(0x000003F7)]*/ int get_SendMouseMoveEvents(out short pSendMouseMoveEvents);
  // Returns or sets whether or not the control sends mouse move events
  /*[id(0x000003F7)]*/ int set_SendMouseMoveEvents(short pSendMouseMoveEvents);
  // Returns or sets whether or not the control sends state change events
  /*[id(0x000003F8)]*/ int get_SendStateChangeEvents(out short pSendStateChangeEvents);
  // Returns or sets whether or not the control sends state change events
  /*[id(0x000003F8)]*/ int set_SendStateChangeEvents(short pSendStateChangeEvents);
  // Returns the number of packets received
  /*[id(0x0000040F)]*/ int get_ReceivedPackets(out int pReceivedPackets);
  // Returns the number of packets recovered
  /*[id(0x00000410)]*/ int get_RecoveredPackets(out int pRecoveredPackets);
  // Returns the number of packets lost
  /*[id(0x00000411)]*/ int get_LostPackets(out int pLostPackets);
  // Returns the percentage of packets received in the last 30 seconds
  /*[id(0x00000412)]*/ int get_ReceptionQuality(out int pReceptionQuality);
  // Returns the number of times buffering occurred during playback
  /*[id(0x00000413)]*/ int get_BufferingCount(out int pBufferingCount);
  // Returns or sets the cursor type
  /*[id(0x00000414)]*/ int get_CursorType(out int pCursorType);
  // Returns or sets the cursor type
  /*[id(0x00000414)]*/ int set_CursorType(int pCursorType);
  // Returns or sets whether or not the control shows its animation during initial file buffering
  /*[id(0x00000415)]*/ int get_AnimationAtStart(out short pAnimationAtStart);
  // Returns or sets whether or not the control shows its animation during initial file buffering
  /*[id(0x00000415)]*/ int set_AnimationAtStart(short pAnimationAtStart);
  /*[id(0x00000416)]*/ int get_AnimationOnStop(out short pAnimationOnStop);
  /*[id(0x00000416)]*/ int set_AnimationOnStop(short pAnimationOnStop);
  // Begins playing from the current file position or marker
  /*[id(0x000007D1)]*/ int Play();
  // Pauses file playback at the current position
  /*[id(0x000007D2)]*/ int Pause();
  // Stops file playback at the current position
  /*[id(0x000007D3)]*/ int Stop();
  // Returns the time of a marker
  /*[id(0x000007D4)]*/ int GetMarkerTime(int MarkerNum, out double pMarkerTime);
  // Returns the name of a marker
  /*[id(0x000007D5)]*/ int GetMarkerName(int MarkerNum, out wchar* pbstrMarkerName);
}

// CoClasses

// NSPlay control
abstract class NSPlay {
  mixin(uuid("2179c5d3-ebff-11cf-b6fd-00aa00b4e220"));
  // static DWINGUID CLSID = { 0x2179c5d3, 0xebff, 0x11cf, 0xb6, 0xfd, 0x00, 0xaa, 0x00, 0xb4, 0xe2, 0x20 };
  mixin Interfaces!(INSPlay1, INSPlay, INSOPlay, DNSOPlayEvents);
}
