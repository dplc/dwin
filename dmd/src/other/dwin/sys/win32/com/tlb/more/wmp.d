// Windows Media Player
// Version 1.0

/*[uuid("6bf52a50-394a-11d3-b153-00c04f79faa6")]*/
module dwin.sys.win32.com.tlb.more.wmp;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

// WMP Playlist Change Event Type
enum WMPPlaylistChangeEventType {
  wmplcUnknown = 0x00000000,
  wmplcClear = 0x00000001,
  wmplcInfoChange = 0x00000002,
  wmplcMove = 0x00000003,
  wmplcDelete = 0x00000004,
  wmplcInsert = 0x00000005,
  wmplcAppend = 0x00000006,
  wmplcPrivate = 0x00000007,
  wmplcNameChange = 0x00000008,
  wmplcMorph = 0x00000009,
  wmplcSort = 0x0000000A,
  wmplcLast = 0x0000000B,
}

// WMP Sync Device Status
enum WMPDeviceStatus {
  wmpdsUnknown = 0x00000000,
  wmpdsPartnershipExists = 0x00000001,
  wmpdsPartnershipDeclined = 0x00000002,
  wmpdsPartnershipAnother = 0x00000003,
  wmpdsManualDevice = 0x00000004,
  wmpdsNewDevice = 0x00000005,
  wmpdsLast = 0x00000006,
}

// WMP Sync States
enum WMPSyncState {
  wmpssUnknown = 0x00000000,
  wmpssSynchronizing = 0x00000001,
  wmpssStopped = 0x00000002,
  wmpssLast = 0x00000003,
}

// State of opening process
enum WMPOpenState {
  wmposUndefined = 0x00000000,
  wmposPlaylistChanging = 0x00000001,
  wmposPlaylistLocating = 0x00000002,
  wmposPlaylistConnecting = 0x00000003,
  wmposPlaylistLoading = 0x00000004,
  wmposPlaylistOpening = 0x00000005,
  wmposPlaylistOpenNoMedia = 0x00000006,
  wmposPlaylistChanged = 0x00000007,
  wmposMediaChanging = 0x00000008,
  wmposMediaLocating = 0x00000009,
  wmposMediaConnecting = 0x0000000A,
  wmposMediaLoading = 0x0000000B,
  wmposMediaOpening = 0x0000000C,
  wmposMediaOpen = 0x0000000D,
  wmposBeginCodecAcquisition = 0x0000000E,
  wmposEndCodecAcquisition = 0x0000000F,
  wmposBeginLicenseAcquisition = 0x00000010,
  wmposEndLicenseAcquisition = 0x00000011,
  wmposBeginIndividualization = 0x00000012,
  wmposEndIndividualization = 0x00000013,
  wmposMediaWaiting = 0x00000014,
  wmposOpeningUnknownURL = 0x00000015,
}

// State of playback
enum WMPPlayState {
  wmppsUndefined = 0x00000000,
  wmppsStopped = 0x00000001,
  wmppsPaused = 0x00000002,
  wmppsPlaying = 0x00000003,
  wmppsScanForward = 0x00000004,
  wmppsScanReverse = 0x00000005,
  wmppsBuffering = 0x00000006,
  wmppsWaiting = 0x00000007,
  wmppsMediaEnded = 0x00000008,
  wmppsTransitioning = 0x00000009,
  wmppsReady = 0x0000000A,
  wmppsReconnecting = 0x0000000B,
  wmppsLast = 0x0000000C,
}

// State of a download
enum WMPSubscriptionDownloadState {
  wmpsdlsDownloading = 0x00000000,
  wmpsdlsPaused = 0x00000001,
  wmpsdlsProcessing = 0x00000002,
  wmpsdlsCompleted = 0x00000003,
  wmpsdlsCancelled = 0x00000004,
}

enum WMP_WRITENAMESEX_TYPE {
  WMP_WRITENAMES_TYPE_CD_BY_TOC = 0x00000000,
  WMP_WRITENAMES_TYPE_CD_BY_CONTENT_ID = 0x00000001,
  WMP_WRITENAMES_TYPE_CD_BY_MDQCD = 0x00000002,
  WMP_WRITENAMES_TYPE_DVD_BY_DVDID = 0x00000003,
}

// Aliases

alias uint ULONG_PTR;

// Interfaces

// IWMPEvents: Public interface.
interface IWMPEvents : IUnknown {
  mixin(uuid("19a6627b-da9e-47c1-bb23-00b5e668236a"));
  // static DWINGUID IID = { 0x19a6627b, 0xda9e, 0x47c1, 0xbb, 0x23, 0x00, 0xb5, 0xe6, 0x68, 0x23, 0x6a };
  // Sent when the control changes OpenState
  /*[id(0x00001389)]*/ void OpenStateChange(int NewState);
  // Sent when the control changes PlayState
  /*[id(0x000013ED)]*/ void PlayStateChange(int NewState);
  // Sent when the current audio language has changed
  /*[id(0x000013EE)]*/ void AudioLanguageChange(int LangID);
  // Sent when the status string changes
  /*[id(0x0000138A)]*/ void StatusChange();
  // Sent when a synchronized command or URL is received
  /*[id(0x000014B5)]*/ void ScriptCommand(wchar* scType, wchar* Param);
  // Sent when a new stream is started in a channel
  /*[id(0x0000151B)]*/ void NewStream();
  // Sent when the control is disconnected from the server
  /*[id(0x00001519)]*/ void Disconnect(int Result);
  // Sent when the control begins or ends buffering
  /*[id(0x0000151A)]*/ void Buffering(short Start);
  // Sent when the control has an error condition
  /*[id(0x0000157D)]*/ void Error();
  // Sent when the control encounters a problem
  /*[id(0x000015E1)]*/ void Warning(int WarningType, int Param, wchar* Description);
  // Sent when the end of file is reached
  /*[id(0x00001451)]*/ void EndOfStream(int Result);
  // Indicates that the current position of the movie has changed
  /*[id(0x00001452)]*/ void PositionChange(double oldPosition, double newPosition);
  // Sent when a marker is reached
  /*[id(0x00001453)]*/ void MarkerHit(int MarkerNum);
  // Indicates that the unit used to express duration and position has changed
  /*[id(0x00001454)]*/ void DurationUnitChange(int NewDurationUnit);
  // Indicates that the CD ROM media has changed
  /*[id(0x00001645)]*/ void CdromMediaChange(int CdromNum);
  // Sent when a playlist changes
  /*[id(0x000016A9)]*/ void PlaylistChange(IDispatch Playlist, WMPPlaylistChangeEventType change);
  // Sent when the current playlist changes
  /*[id(0x000016AC)]*/ void CurrentPlaylistChange(WMPPlaylistChangeEventType change);
  // Sent when a current playlist item becomes available
  /*[id(0x000016AD)]*/ void CurrentPlaylistItemAvailable(wchar* bstrItemName);
  // Sent when a media object changes
  /*[id(0x000016AA)]*/ void MediaChange(IDispatch Item);
  // Sent when a current media item becomes available
  /*[id(0x000016AB)]*/ void CurrentMediaItemAvailable(wchar* bstrItemName);
  // Sent when the item selection on the current playlist changes
  /*[id(0x000016AE)]*/ void CurrentItemChange(IDispatch pdispMedia);
  // Sent when the media collection needs to be requeried
  /*[id(0x000016AF)]*/ void MediaCollectionChange();
  // Sent when an attribute string is added in the media collection
  /*[id(0x000016B0)]*/ void MediaCollectionAttributeStringAdded(wchar* bstrAttribName, wchar* bstrAttribVal);
  // Sent when an attribute string is removed from the media collection
  /*[id(0x000016B1)]*/ void MediaCollectionAttributeStringRemoved(wchar* bstrAttribName, wchar* bstrAttribVal);
  // Sent when an attribute string is changed in the media collection
  /*[id(0x000016BC)]*/ void MediaCollectionAttributeStringChanged(wchar* bstrAttribName, wchar* bstrOldAttribVal, wchar* bstrNewAttribVal);
  // Sent when playlist collection needs to be requeried
  /*[id(0x000016B2)]*/ void PlaylistCollectionChange();
  // Sent when a playlist is added to the playlist collection
  /*[id(0x000016B3)]*/ void PlaylistCollectionPlaylistAdded(wchar* bstrPlaylistName);
  // Sent when a playlist is removed from the playlist collection
  /*[id(0x000016B4)]*/ void PlaylistCollectionPlaylistRemoved(wchar* bstrPlaylistName);
  // Sent when a playlist has been set or reset as deleted
  /*[id(0x000016BA)]*/ void PlaylistCollectionPlaylistSetAsDeleted(wchar* bstrPlaylistName, short varfIsDeleted);
  // Playlist playback mode has changed
  /*[id(0x000016BB)]*/ void ModeChange(wchar* ModeName, short NewValue);
  // Sent when the media object has an error condition
  /*[id(0x000016BD)]*/ void MediaError(IDispatch pMediaObject);
  // Current playlist switch with no open state change
  /*[id(0x000016BF)]*/ void OpenPlaylistSwitch(IDispatch pItem);
  // Send a current domain
  /*[id(0x000016BE)]*/ void DomainChange(wchar* strDomain);
  // Sent when display switches to player application
  /*[id(0x00001965)]*/ void SwitchedToPlayerApplication();
  // Sent when display switches to control
  /*[id(0x00001966)]*/ void SwitchedToControl();
  // Sent when the player docks or undocks
  /*[id(0x00001967)]*/ void PlayerDockedStateChange();
  // Sent when the OCX reconnects to the player
  /*[id(0x00001968)]*/ void PlayerReconnect();
  // Occurs when a user clicks the mouse
  /*[id(0x00001969)]*/ void Click(short nButton, short nShiftState, int fX, int fY);
  // Occurs when a user double-clicks the mouse
  /*[id(0x0000196A)]*/ void DoubleClick(short nButton, short nShiftState, int fX, int fY);
  // Occurs when a key is pressed
  /*[id(0x0000196B)]*/ void KeyDown(short nKeyCode, short nShiftState);
  // Occurs when a key is pressed and released
  /*[id(0x0000196C)]*/ void KeyPress(short nKeyAscii);
  // Occurs when a key is released
  /*[id(0x0000196D)]*/ void KeyUp(short nKeyCode, short nShiftState);
  // Occurs when a mouse button is pressed
  /*[id(0x0000196E)]*/ void MouseDown(short nButton, short nShiftState, int fX, int fY);
  // Occurs when a mouse pointer is moved
  /*[id(0x0000196F)]*/ void MouseMove(short nButton, short nShiftState, int fX, int fY);
  // Occurs when a mouse button is released
  /*[id(0x00001970)]*/ void MouseUp(short nButton, short nShiftState, int fX, int fY);
}

// IWMPEvents2: Public interface.
interface IWMPEvents2 : IWMPEvents {
  mixin(uuid("1e7601fa-47ea-4107-9ea9-9004ed9684ff"));
  // static DWINGUID IID = { 0x1e7601fa, 0x47ea, 0x4107, 0x9e, 0xa9, 0x90, 0x04, 0xed, 0x96, 0x84, 0xff };
  // Occurs when a device is connected
  /*[id(0x00001971)]*/ void DeviceConnect(IWMPSyncDevice pDevice);
  // Occurs when a device is disconnected
  /*[id(0x00001972)]*/ void DeviceDisconnect(IWMPSyncDevice pDevice);
  // Occurs when a device status changes
  /*[id(0x00001973)]*/ void DeviceStatusChange(IWMPSyncDevice pDevice, WMPDeviceStatus NewStatus);
  // Occurs when a device sync state changes
  /*[id(0x00001974)]*/ void DeviceSyncStateChange(IWMPSyncDevice pDevice, WMPSyncState NewState);
  // Occurs when a device's media has an error
  /*[id(0x00001975)]*/ void DeviceSyncError(IWMPSyncDevice pDevice, IDispatch pMedia);
  // Occurs when createPartnership call completes
  /*[id(0x00001976)]*/ void CreatePartnershipComplete(IWMPSyncDevice pDevice, int hrResult);
}

// IWMPSyncDevice: Public interface for Windows Media Player SDK.
interface IWMPSyncDevice : IUnknown {
  mixin(uuid("82a2986c-0293-4fd0-b279-b21b86c058be"));
  // static DWINGUID IID = { 0x82a2986c, 0x0293, 0x4fd0, 0xb2, 0x79, 0xb2, 0x1b, 0x86, 0xc0, 0x58, 0xbe };
  /*[id(0x60010000)]*/ int get_friendlyName(out wchar* pbstrName);
  /*[id(0x60010000)]*/ int set_friendlyName(wchar* pbstrName);
  /*[id(0x60010002)]*/ int get_deviceName(out wchar* pbstrName);
  /*[id(0x60010003)]*/ int get_deviceId(out wchar* pbstrDeviceId);
  /*[id(0x60010004)]*/ int get_partnershipIndex(out int plIndex);
  /*[id(0x60010005)]*/ int get_connected(out short pvbConnected);
  /*[id(0x60010006)]*/ int get_status(out WMPDeviceStatus pwmpds);
  /*[id(0x60010007)]*/ int get_syncState(out WMPSyncState pwmpss);
  /*[id(0x60010008)]*/ int get_progress(out int plProgress);
  /*[id(0x60010009)]*/ int getItemInfo(wchar* bstrItemName, out wchar* pbstrVal);
  /*[id(0x6001000A)]*/ int createPartnership(short vbShowUI);
  /*[id(0x6001000B)]*/ int deletePartnership();
  /*[id(0x6001000C)]*/ int Start();
  /*[id(0x6001000D)]*/ int stop();
  /*[id(0x6001000E)]*/ int showSettings();
  /*[id(0x6001000F)]*/ int isIdentical(IWMPSyncDevice pDevice, out short pvbool);
}

// _WMPOCXEvents: Public interface.
interface _WMPOCXEvents : IDispatch {
  mixin(uuid("6bf52a51-394a-11d3-b153-00c04f79faa6"));
  // static DWINGUID IID = { 0x6bf52a51, 0x394a, 0x11d3, 0xb1, 0x53, 0x00, 0xc0, 0x4f, 0x79, 0xfa, 0xa6 };
  /+// Sent when the control changes OpenState
  /*[id(0x00001389)]*/ void OpenStateChange(int NewState);+/
  /+// Sent when the control changes PlayState
  /*[id(0x000013ED)]*/ void PlayStateChange(int NewState);+/
  /+// Sent when the current audio language has changed
  /*[id(0x000013EE)]*/ void AudioLanguageChange(int LangID);+/
  /+// Sent when the status string changes
  /*[id(0x0000138A)]*/ void StatusChange();+/
  /+// Sent when a synchronized command or URL is received
  /*[id(0x000014B5)]*/ void ScriptCommand(wchar* scType, wchar* Param);+/
  /+// Sent when a new stream is started in a channel
  /*[id(0x0000151B)]*/ void NewStream();+/
  /+// Sent when the control is disconnected from the server
  /*[id(0x00001519)]*/ void Disconnect(int Result);+/
  /+// Sent when the control begins or ends buffering
  /*[id(0x0000151A)]*/ void Buffering(short Start);+/
  /+// Sent when the control has an error condition
  /*[id(0x0000157D)]*/ void Error();+/
  /+// Sent when the control encounters a problem
  /*[id(0x000015E1)]*/ void Warning(int WarningType, int Param, wchar* Description);+/
  /+// Sent when the end of file is reached
  /*[id(0x00001451)]*/ void EndOfStream(int Result);+/
  /+// Indicates that the current position of the movie has changed
  /*[id(0x00001452)]*/ void PositionChange(double oldPosition, double newPosition);+/
  /+// Sent when a marker is reached
  /*[id(0x00001453)]*/ void MarkerHit(int MarkerNum);+/
  /+// Indicates that the unit used to express duration and position has changed
  /*[id(0x00001454)]*/ void DurationUnitChange(int NewDurationUnit);+/
  /+// Indicates that the CD ROM media has changed
  /*[id(0x00001645)]*/ void CdromMediaChange(int CdromNum);+/
  /+// Sent when a playlist changes
  /*[id(0x000016A9)]*/ void PlaylistChange(IDispatch Playlist, WMPPlaylistChangeEventType change);+/
  /+// Sent when the current playlist changes
  /*[id(0x000016AC)]*/ void CurrentPlaylistChange(WMPPlaylistChangeEventType change);+/
  /+// Sent when a current playlist item becomes available
  /*[id(0x000016AD)]*/ void CurrentPlaylistItemAvailable(wchar* bstrItemName);+/
  /+// Sent when a media object changes
  /*[id(0x000016AA)]*/ void MediaChange(IDispatch Item);+/
  /+// Sent when a current media item becomes available
  /*[id(0x000016AB)]*/ void CurrentMediaItemAvailable(wchar* bstrItemName);+/
  /+// Sent when the item selection on the current playlist changes
  /*[id(0x000016AE)]*/ void CurrentItemChange(IDispatch pdispMedia);+/
  /+// Sent when the media collection needs to be requeried
  /*[id(0x000016AF)]*/ void MediaCollectionChange();+/
  /+// Sent when an attribute string is added in the media collection
  /*[id(0x000016B0)]*/ void MediaCollectionAttributeStringAdded(wchar* bstrAttribName, wchar* bstrAttribVal);+/
  /+// Sent when an attribute string is removed from the media collection
  /*[id(0x000016B1)]*/ void MediaCollectionAttributeStringRemoved(wchar* bstrAttribName, wchar* bstrAttribVal);+/
  /+// Sent when an attribute string is changed in the media collection
  /*[id(0x000016BC)]*/ void MediaCollectionAttributeStringChanged(wchar* bstrAttribName, wchar* bstrOldAttribVal, wchar* bstrNewAttribVal);+/
  /+// Sent when playlist collection needs to be requeried
  /*[id(0x000016B2)]*/ void PlaylistCollectionChange();+/
  /+// Sent when a playlist is added to the playlist collection
  /*[id(0x000016B3)]*/ void PlaylistCollectionPlaylistAdded(wchar* bstrPlaylistName);+/
  /+// Sent when a playlist is removed from the playlist collection
  /*[id(0x000016B4)]*/ void PlaylistCollectionPlaylistRemoved(wchar* bstrPlaylistName);+/
  /+// Sent when a playlist has been set or reset as deleted
  /*[id(0x000016BA)]*/ void PlaylistCollectionPlaylistSetAsDeleted(wchar* bstrPlaylistName, short varfIsDeleted);+/
  /+// Playlist playback mode has changed
  /*[id(0x000016BB)]*/ void ModeChange(wchar* ModeName, short NewValue);+/
  /+// Sent when the media object has an error condition
  /*[id(0x000016BD)]*/ void MediaError(IDispatch pMediaObject);+/
  /+// Current playlist switch with no open state change
  /*[id(0x000016BF)]*/ void OpenPlaylistSwitch(IDispatch pItem);+/
  /+// Send a current domain
  /*[id(0x000016BE)]*/ void DomainChange(wchar* strDomain);+/
  /+// Sent when display switches to player application
  /*[id(0x00001965)]*/ void SwitchedToPlayerApplication();+/
  /+// Sent when display switches to control
  /*[id(0x00001966)]*/ void SwitchedToControl();+/
  /+// Sent when the player docks or undocks
  /*[id(0x00001967)]*/ void PlayerDockedStateChange();+/
  /+// Sent when the OCX reconnects to the player
  /*[id(0x00001968)]*/ void PlayerReconnect();+/
  /+// Occurs when a user clicks the mouse
  /*[id(0x00001969)]*/ void Click(short nButton, short nShiftState, int fX, int fY);+/
  /+// Occurs when a user double-clicks the mouse
  /*[id(0x0000196A)]*/ void DoubleClick(short nButton, short nShiftState, int fX, int fY);+/
  /+// Occurs when a key is pressed
  /*[id(0x0000196B)]*/ void KeyDown(short nKeyCode, short nShiftState);+/
  /+// Occurs when a key is pressed and released
  /*[id(0x0000196C)]*/ void KeyPress(short nKeyAscii);+/
  /+// Occurs when a key is released
  /*[id(0x0000196D)]*/ void KeyUp(short nKeyCode, short nShiftState);+/
  /+// Occurs when a mouse button is pressed
  /*[id(0x0000196E)]*/ void MouseDown(short nButton, short nShiftState, int fX, int fY);+/
  /+// Occurs when a mouse pointer is moved
  /*[id(0x0000196F)]*/ void MouseMove(short nButton, short nShiftState, int fX, int fY);+/
  /+// Occurs when a mouse button is released
  /*[id(0x00001970)]*/ void MouseUp(short nButton, short nShiftState, int fX, int fY);+/
  /+// Occurs when a device is connected
  /*[id(0x00001971)]*/ void DeviceConnect(IWMPSyncDevice pDevice);+/
  /+// Occurs when a device is disconnected
  /*[id(0x00001972)]*/ void DeviceDisconnect(IWMPSyncDevice pDevice);+/
  /+// Occurs when a device status changes
  /*[id(0x00001973)]*/ void DeviceStatusChange(IWMPSyncDevice pDevice, WMPDeviceStatus NewStatus);+/
  /+// Occurs when a device sync state changes
  /*[id(0x00001974)]*/ void DeviceSyncStateChange(IWMPSyncDevice pDevice, WMPSyncState NewState);+/
  /+// Occurs when a device's media has an error
  /*[id(0x00001975)]*/ void DeviceSyncError(IWMPSyncDevice pDevice, IDispatch pMedia);+/
  /+// Occurs when createPartnership call completes
  /*[id(0x00001976)]*/ void CreatePartnershipComplete(IWMPSyncDevice pDevice, int hrResult);+/
}

// IWMPPlayer4: Public interface.
interface IWMPPlayer4 : IWMPCore3 {
  mixin(uuid("6c497d62-8919-413c-82db-e935fb3ec584"));
  // static DWINGUID IID = { 0x6c497d62, 0x8919, 0x413c, 0x82, 0xdb, 0xe9, 0x35, 0xfb, 0x3e, 0xc5, 0x84 };
  // Returns a boolean value specifying whether or not the control is enabled
  /*[id(0x00000013)]*/ int get_enabled(out short pbEnabled);
  // Returns a boolean value specifying whether or not the control is enabled
  /*[id(0x00000013)]*/ int set_enabled(short pbEnabled);
  // Returns a boolean value specifying whether or not the control is in full screen mode
  /*[id(0x00000015)]*/ int get_fullScreen(out short pbFullScreen);
  // Returns a boolean value specifying whether or not the control is in full screen mode
  /*[id(0x00000015)]*/ int set_fullScreen(short pbFullScreen);
  // Returns a boolean value specifying whether or not the context menu is enabled on the control
  /*[id(0x00000016)]*/ int get_enableContextMenu(out short pbEnableContextMenu);
  // Returns a boolean value specifying whether or not the context menu is enabled on the control
  /*[id(0x00000016)]*/ int set_enableContextMenu(short pbEnableContextMenu);
  // Specifies the ui mode to select
  /*[id(0x00000017)]*/ int set_uiMode(wchar* pbstrMode);
  // Specifies the ui mode to select
  /*[id(0x00000017)]*/ int get_uiMode(out wchar* pbstrMode);
  // Returns a boolean value specifying whether or not video is stretched
  /*[id(0x00000018)]*/ int get_stretchToFit(out short pbEnabled);
  // Returns a boolean value specifying whether or not video is stretched
  /*[id(0x00000018)]*/ int set_stretchToFit(short pbEnabled);
  // Returns a boolean value specifying whether or not video is windowless
  /*[id(0x00000019)]*/ int get_windowlessVideo(out short pbEnabled);
  // Returns a boolean value specifying whether or not video is windowless
  /*[id(0x00000019)]*/ int set_windowlessVideo(short pbEnabled);
  // Indicates whether the player is running remotely
  /*[id(0x0000001A)]*/ int get_isRemote(out short pvarfIsRemote);
  // Returns the player application handler
  /*[id(0x0000001B)]*/ int get_playerApplication(out IWMPPlayerApplication ppIWMPPlayerApplication);
  // Opens the player with the specified URL
  /*[id(0x0000001C)]*/ int openPlayer(wchar* bstrURL);
}

// IWMPCore3: Public interface.
interface IWMPCore3 : IWMPCore2 {
  mixin(uuid("7587c667-628f-499f-88e7-6a6f4e888464"));
  // static DWINGUID IID = { 0x7587c667, 0x628f, 0x499f, 0x88, 0xe7, 0x6a, 0x6f, 0x4e, 0x88, 0x84, 0x64 };
  // Creates a new playlist object
  /*[id(0x00000029)]*/ int newPlaylist(wchar* bstrName, wchar* bstrURL, out IWMPPlaylist ppPlaylist);
  // Creates a new media object
  /*[id(0x0000002A)]*/ int newMedia(wchar* bstrURL, out IWMPMedia ppMedia);
}

// IWMPCore2: Public interface.
interface IWMPCore2 : IWMPCore {
  mixin(uuid("bc17e5b7-7561-4c18-bb90-17d485775659"));
  // static DWINGUID IID = { 0xbc17e5b7, 0x7561, 0x4c18, 0xbb, 0x90, 0x17, 0xd4, 0x85, 0x77, 0x56, 0x59 };
  // Returns the DVD handler
  /*[id(0x00000028)]*/ int get_dvd(out IWMPDVD ppDVD);
}

// IWMPCore: Public interface.
interface IWMPCore : IDispatch {
  mixin(uuid("d84cca99-cce2-11d2-9ecc-0000f8085981"));
  // static DWINGUID IID = { 0xd84cca99, 0xcce2, 0x11d2, 0x9e, 0xcc, 0x00, 0x00, 0xf8, 0x08, 0x59, 0x81 };
  // Closes the media
  /*[id(0x00000003)]*/ int close();
  // Returns or sets the URL
  /*[id(0x00000001)]*/ int get_URL(out wchar* pbstrURL);
  // Returns or sets the URL
  /*[id(0x00000001)]*/ int set_URL(wchar* pbstrURL);
  // Returns the open state of the player
  /*[id(0x00000002)]*/ int get_openState(out WMPOpenState pwmpos);
  // Returns the play state of the player
  /*[id(0x0000000A)]*/ int get_playState(out WMPPlayState pwmpps);
  // Returns the control handler
  /*[id(0x00000004)]*/ int get_controls(out IWMPControls ppControl);
  // Returns the settings handler
  /*[id(0x00000005)]*/ int get_settings(out IWMPSettings ppSettings);
  // Returns or sets the current media object
  /*[id(0x00000006)]*/ int get_currentMedia(out IWMPMedia ppMedia);
  // Returns or sets the current media object
  /*[id(0x00000006)]*/ int set_currentMedia(IWMPMedia ppMedia);
  // Returns the media collection handler
  /*[id(0x00000008)]*/ int get_mediaCollection(out IWMPMediaCollection ppMediaCollection);
  // Returns the playlist collection handler
  /*[id(0x00000009)]*/ int get_playlistCollection(out IWMPPlaylistCollection ppPlaylistCollection);
  // Returns the version information for the player
  /*[id(0x0000000B)]*/ int get_versionInfo(out wchar* pbstrVersionInfo);
  /*[id(0x0000000C)]*/ int launchURL(wchar* bstrURL);
  // Returns the network information handler
  /*[id(0x00000007)]*/ int get_network(out IWMPNetwork ppQNI);
  // Returns/sets the current playlist
  /*[id(0x0000000D)]*/ int get_currentPlaylist(out IWMPPlaylist ppPL);
  // Returns/sets the current playlist
  /*[id(0x0000000D)]*/ int set_currentPlaylist(IWMPPlaylist ppPL);
  // Get the CDROM drive collection
  /*[id(0x0000000E)]*/ int get_cdromCollection(out IWMPCdromCollection ppCdromCollection);
  // Returns the closed caption handler
  /*[id(0x0000000F)]*/ int get_closedCaption(out IWMPClosedCaption ppClosedCaption);
  // Returns whether the machine is online.
  /*[id(0x00000010)]*/ int get_isOnline(out short pfOnline);
  // Returns the error object
  /*[id(0x00000011)]*/ int get_Error(out IWMPError ppError);
  // Returns status string
  /*[id(0x00000012)]*/ int get_status(out wchar* pbstrStatus);
}

// IWMPControls: Public interface.
interface IWMPControls : IDispatch {
  mixin(uuid("74c09e02-f828-11d2-a74b-00a0c905f36e"));
  // static DWINGUID IID = { 0x74c09e02, 0xf828, 0x11d2, 0xa7, 0x4b, 0x00, 0xa0, 0xc9, 0x05, 0xf3, 0x6e };
  // Returns whether or not the specified media functionality is available
  /*[id(0x0000003E)]*/ int get_isAvailable(wchar* bstrItem, out short pIsAvailable);
  // Begins playing media
  /*[id(0x00000033)]*/ int play();
  // Stops play of media
  /*[id(0x00000034)]*/ int stop();
  // Pauses play of media
  /*[id(0x00000035)]*/ int pause();
  // Fast play of media in forward direction
  /*[id(0x00000036)]*/ int fastForward();
  // Fast play of media in reverse direction
  /*[id(0x00000037)]*/ int fastReverse();
  // Returns the current position in media
  /*[id(0x00000038)]*/ int get_currentPosition(out double pdCurrentPosition);
  // Returns the current position in media
  /*[id(0x00000038)]*/ int set_currentPosition(double pdCurrentPosition);
  // Returns the current position in media as a string
  /*[id(0x00000039)]*/ int get_currentPositionString(out wchar* pbstrCurrentPosition);
  // Sets the current item to the next item in the playlist
  /*[id(0x0000003A)]*/ int next();
  // Sets the current item to the previous item in the playlist
  /*[id(0x0000003B)]*/ int previous();
  // Returns/Sets the play item
  /*[id(0x0000003C)]*/ int get_currentItem(out IWMPMedia ppIWMPMedia);
  // Returns/Sets the play item
  /*[id(0x0000003C)]*/ int set_currentItem(IWMPMedia ppIWMPMedia);
  // Returns the current marker
  /*[id(0x0000003D)]*/ int get_currentMarker(out int plMarker);
  // Returns the current marker
  /*[id(0x0000003D)]*/ int set_currentMarker(int plMarker);
  // Sets the current item and plays it
  /*[id(0x0000003F)]*/ int playItem(IWMPMedia pIWMPMedia);
}

// IWMPMedia: Public interface.
interface IWMPMedia : IDispatch {
  mixin(uuid("94d55e95-3fac-11d3-b155-00c04f79faa6"));
  // static DWINGUID IID = { 0x94d55e95, 0x3fac, 0x11d3, 0xb1, 0x55, 0x00, 0xc0, 0x4f, 0x79, 0xfa, 0xa6 };
  // Determines if the supplied object is the same as the this one
  /*[id(0x000002FB)]*/ int get_isIdentical(IWMPMedia pIWMPMedia, out short pvbool);
  // Returns the media URL
  /*[id(0x000002EF)]*/ int get_sourceURL(out wchar* pbstrSourceURL);
  // Returns the name of the media
  /*[id(0x000002FC)]*/ int get_name(out wchar* pbstrName);
  // Returns the name of the media
  /*[id(0x000002FC)]*/ int set_name(wchar* pbstrName);
  // Returns the original width of the source images
  /*[id(0x000002F0)]*/ int get_imageSourceWidth(out int pWidth);
  // Returns the original height of the source images
  /*[id(0x000002F1)]*/ int get_imageSourceHeight(out int pHeight);
  // Returns the number of markers in the file
  /*[id(0x000002F2)]*/ int get_markerCount(out int pMarkerCount);
  // Returns the time of a marker
  /*[id(0x000002F3)]*/ int getMarkerTime(int MarkerNum, out double pMarkerTime);
  // Returns the name of a marker
  /*[id(0x000002F4)]*/ int getMarkerName(int MarkerNum, out wchar* pbstrMarkerName);
  // Returns duration of current media
  /*[id(0x000002F5)]*/ int get_duration(out double pDuration);
  // Returns duration of current media as a string
  /*[id(0x000002F6)]*/ int get_durationString(out wchar* pbstrDuration);
  // Returns the count of the attributes associated with this media
  /*[id(0x000002F7)]*/ int get_attributeCount(out int plCount);
  // Returns the name of the attribute whose index has been specified
  /*[id(0x000002F8)]*/ int getAttributeName(int lIndex, out wchar* pbstrItemName);
  // Returns the value of specified attribute for this media
  /*[id(0x000002F9)]*/ int getItemInfo(wchar* bstrItemName, out wchar* pbstrVal);
  // Sets the value of specified attribute for this media
  /*[id(0x000002FA)]*/ int setItemInfo(wchar* bstrItemName, wchar* bstrVal);
  // Gets an item info by atom
  /*[id(0x000002FD)]*/ int getItemInfoByAtom(int lAtom, out wchar* pbstrVal);
  // Is the media a member of the given playlist
  /*[id(0x000002FE)]*/ int isMemberOf(IWMPPlaylist pPlaylist, out short pvarfIsMemberOf);
  // Is the attribute read only
  /*[id(0x000002FF)]*/ int isReadOnlyItem(wchar* bstrItemName, out short pvarfIsReadOnly);
}

// IWMPPlaylist: Public interface.
interface IWMPPlaylist : IDispatch {
  mixin(uuid("d5f0f4f1-130c-11d3-b14e-00c04f79faa6"));
  // static DWINGUID IID = { 0xd5f0f4f1, 0x130c, 0x11d3, 0xb1, 0x4e, 0x00, 0xc0, 0x4f, 0x79, 0xfa, 0xa6 };
  // Returns the number of items in the playlist
  /*[id(0x000000C9)]*/ int get_count(out int plCount);
  // Returns the name of the playlist
  /*[id(0x000000CA)]*/ int get_name(out wchar* pbstrName);
  // Returns the name of the playlist
  /*[id(0x000000CA)]*/ int set_name(wchar* pbstrName);
  // Returns the number of attributes associated with the playlist
  /*[id(0x000000D2)]*/ int get_attributeCount(out int plCount);
  // Returns the name of an attribute specified by an index
  /*[id(0x000000D3)]*/ int get_attributeName(int lIndex, out wchar* pbstrAttributeName);
  // Returns the item at the specified index
  /*[id(0x000000D4)]*/ int get_Item(int lIndex, out IWMPMedia ppIWMPMedia);
  // Returns the value of a playlist attribute
  /*[id(0x000000CB)]*/ int getItemInfo(wchar* bstrName, out wchar* pbstrVal);
  // Sets the value of a playlist attribute
  /*[id(0x000000CC)]*/ int setItemInfo(wchar* bstrName, wchar* bstrValue);
  // Determines if the supplied object is the same as the this one
  /*[id(0x000000D5)]*/ int get_isIdentical(IWMPPlaylist pIWMPPlaylist, out short pvbool);
  // Removes all items from the playlist
  /*[id(0x000000CD)]*/ int clear();
  // Inserts an item into the playlist at the specified location
  /*[id(0x000000CE)]*/ int insertItem(int lIndex, IWMPMedia pIWMPMedia);
  // Adds an item to the end of the playlist
  /*[id(0x000000CF)]*/ int appendItem(IWMPMedia pIWMPMedia);
  // Removes the specified item from the playlist
  /*[id(0x000000D0)]*/ int removeItem(IWMPMedia pIWMPMedia);
  // Changes the location of an item in the playlist
  /*[id(0x000000D1)]*/ int moveItem(int lIndexOld, int lIndexNew);
}

// IWMPSettings: Public interface.
interface IWMPSettings : IDispatch {
  mixin(uuid("9104d1ab-80c9-4fed-abf0-2e6417a6df14"));
  // static DWINGUID IID = { 0x9104d1ab, 0x80c9, 0x4fed, 0xab, 0xf0, 0x2e, 0x64, 0x17, 0xa6, 0xdf, 0x14 };
  // Returns whether or not the specified media functionality is available
  /*[id(0x00000071)]*/ int get_isAvailable(wchar* bstrItem, out short pIsAvailable);
  // Returns whether media should automatically begin playing
  /*[id(0x00000065)]*/ int get_autoStart(out short pfAutoStart);
  // Returns whether media should automatically begin playing
  /*[id(0x00000065)]*/ int set_autoStart(short pfAutoStart);
  // Returns the base URL used for relative path resolution
  /*[id(0x0000006C)]*/ int get_baseURL(out wchar* pbstrBaseURL);
  // Returns the base URL used for relative path resolution
  /*[id(0x0000006C)]*/ int set_baseURL(wchar* pbstrBaseURL);
  // Returns the frame location that changes when a URL flip occurs
  /*[id(0x0000006D)]*/ int get_defaultFrame(out wchar* pbstrDefaultFrame);
  // Returns the frame location that changes when a URL flip occurs
  /*[id(0x0000006D)]*/ int set_defaultFrame(wchar* pbstrDefaultFrame);
  // Returns whether URL events should spawn a browser.
  /*[id(0x00000067)]*/ int get_invokeURLs(out short pfInvokeURLs);
  // Returns whether URL events should spawn a browser.
  /*[id(0x00000067)]*/ int set_invokeURLs(short pfInvokeURLs);
  // Returns whether audio should be muted.
  /*[id(0x00000068)]*/ int get_mute(out short pfMute);
  // Returns whether audio should be muted.
  /*[id(0x00000068)]*/ int set_mute(short pfMute);
  // Returns how many times media should play
  /*[id(0x00000069)]*/ int get_playCount(out int plCount);
  // Returns how many times media should play
  /*[id(0x00000069)]*/ int set_playCount(int plCount);
  // Returns current playback rate
  /*[id(0x0000006A)]*/ int get_rate(out double pdRate);
  // Returns current playback rate
  /*[id(0x0000006A)]*/ int set_rate(double pdRate);
  // Returns current audio Balance
  /*[id(0x00000066)]*/ int get_balance(out int plBalance);
  // Returns current audio Balance
  /*[id(0x00000066)]*/ int set_balance(int plBalance);
  // Returns current audio volume
  /*[id(0x0000006B)]*/ int get_volume(out int plVolume);
  // Returns current audio volume
  /*[id(0x0000006B)]*/ int set_volume(int plVolume);
  // Returns the mode of the playlist
  /*[id(0x0000006E)]*/ int getMode(wchar* bstrMode, out short pvarfMode);
  // Sets the mode of the playlist
  /*[id(0x0000006F)]*/ int setMode(wchar* bstrMode, short varfMode);
  // Returns whether error dialogs are shown by default when embedded
  /*[id(0x00000070)]*/ int get_enableErrorDialogs(out short pfEnableErrorDialogs);
  // Returns whether error dialogs are shown by default when embedded
  /*[id(0x00000070)]*/ int set_enableErrorDialogs(short pfEnableErrorDialogs);
}

// IWMPMediaCollection: Public interface.
interface IWMPMediaCollection : IDispatch {
  mixin(uuid("8363bc22-b4b4-4b19-989d-1cd765749dd1"));
  // static DWINGUID IID = { 0x8363bc22, 0xb4b4, 0x4b19, 0x98, 0x9d, 0x1c, 0xd7, 0x65, 0x74, 0x9d, 0xd1 };
  // Creates a new media object
  /*[id(0x000001C4)]*/ int add(wchar* bstrURL, out IWMPMedia ppItem);
  // Returns a collection of all the items
  /*[id(0x000001C5)]*/ int getAll(out IWMPPlaylist ppMediaItems);
  // Returns a collection of items with the given name
  /*[id(0x000001C6)]*/ int getByName(wchar* bstrName, out IWMPPlaylist ppMediaItems);
  // Returns a collection of items with the given genre
  /*[id(0x000001C7)]*/ int getByGenre(wchar* bstrGenre, out IWMPPlaylist ppMediaItems);
  // Returns a collection of items by a given author
  /*[id(0x000001C8)]*/ int getByAuthor(wchar* bstrAuthor, out IWMPPlaylist ppMediaItems);
  // Returns a collection of items from the given album
  /*[id(0x000001C9)]*/ int getByAlbum(wchar* bstrAlbum, out IWMPPlaylist ppMediaItems);
  // Returns a collection of items with the given attribute
  /*[id(0x000001CA)]*/ int getByAttribute(wchar* bstrAttribute, wchar* bstrValue, out IWMPPlaylist ppMediaItems);
  // Removes an item from the media collection
  /*[id(0x000001CB)]*/ int remove(IWMPMedia pItem, short varfDeleteFile);
  // Returns the string collection associated with an attribute
  /*[id(0x000001CD)]*/ int getAttributeStringCollection(wchar* bstrAttribute, wchar* bstrMediaType, out IWMPStringCollection ppStringCollection);
  // Gets an atom associated with an item name which can be requested from an IWMPMedia out of this collection via getItemInfoByAtom
  /*[id(0x000001D6)]*/ int getMediaAtom(wchar* bstrItemName, out int plAtom);
  // Sets the deleted flag on a media object
  /*[id(0x000001D7)]*/ int setDeleted(IWMPMedia pItem, short varfIsDeleted);
  // Gets the deleted flag on a media object
  /*[id(0x000001D8)]*/ int isDeleted(IWMPMedia pItem, out short pvarfIsDeleted);
}

// IWMPStringCollection: Public interface.
interface IWMPStringCollection : IDispatch {
  mixin(uuid("4a976298-8c0d-11d3-b389-00c04f68574b"));
  // static DWINGUID IID = { 0x4a976298, 0x8c0d, 0x11d3, 0xb3, 0x89, 0x00, 0xc0, 0x4f, 0x68, 0x57, 0x4b };
  // Returns the number of items in the string collection
  /*[id(0x00000191)]*/ int get_count(out int plCount);
  // Returns the string at the given index
  /*[id(0x00000192)]*/ int Item(int lIndex, out wchar* pbstrString);
}

// IWMPPlaylistCollection: Public interface.
interface IWMPPlaylistCollection : IDispatch {
  mixin(uuid("10a13217-23a7-439b-b1c0-d847c79b7774"));
  // static DWINGUID IID = { 0x10a13217, 0x23a7, 0x439b, 0xb1, 0xc0, 0xd8, 0x47, 0xc7, 0x9b, 0x77, 0x74 };
  // Creates a new playlist object
  /*[id(0x00000228)]*/ int newPlaylist(wchar* bstrName, out IWMPPlaylist ppItem);
  // Returns a playlist array with all the playlists
  /*[id(0x00000229)]*/ int getAll(out IWMPPlaylistArray ppPlaylistArray);
  // Returns a playlist array with playlists matching the given name
  /*[id(0x0000022A)]*/ int getByName(wchar* bstrName, out IWMPPlaylistArray ppPlaylistArray);
  // Removes an item from the playlist collection
  /*[id(0x0000022C)]*/ int remove(IWMPPlaylist pItem);
  // Sets the deleted flag on a playlist object
  /*[id(0x00000230)]*/ int setDeleted(IWMPPlaylist pItem, short varfIsDeleted);
  // Gets the deleted flag on a playlist object
  /*[id(0x00000231)]*/ int isDeleted(IWMPPlaylist pItem, out short pvarfIsDeleted);
  // Imports a playlist object into the library
  /*[id(0x00000232)]*/ int importPlaylist(IWMPPlaylist pItem, out IWMPPlaylist ppImportedItem);
}

// IWMPPlaylistArray: Public interface.
interface IWMPPlaylistArray : IDispatch {
  mixin(uuid("679409c0-99f7-11d3-9fb7-00105aa620bb"));
  // static DWINGUID IID = { 0x679409c0, 0x99f7, 0x11d3, 0x9f, 0xb7, 0x00, 0x10, 0x5a, 0xa6, 0x20, 0xbb };
  // Returns the number of items in the playlist array
  /*[id(0x000001F5)]*/ int get_count(out int plCount);
  // Returns the playlist object at the given index
  /*[id(0x000001F6)]*/ int Item(int lIndex, out IWMPPlaylist ppItem);
}

// IWMPNetwork: Public interface.
interface IWMPNetwork : IDispatch {
  mixin(uuid("ec21b779-edef-462d-bba4-ad9dde2b29a7"));
  // static DWINGUID IID = { 0xec21b779, 0xedef, 0x462d, 0xbb, 0xa4, 0xad, 0x9d, 0xde, 0x2b, 0x29, 0xa7 };
  // Returns the current bandwidth of the clip.
  /*[id(0x00000321)]*/ int get_bandWidth(out int plBandwidth);
  // Returns the number of recovered packets
  /*[id(0x00000322)]*/ int get_recoveredPackets(out int plRecoveredPackets);
  // Returns the source protocol used to receive data.
  /*[id(0x00000323)]*/ int get_sourceProtocol(out wchar* pbstrSourceProtocol);
  // Returns the number of packets received.
  /*[id(0x00000324)]*/ int get_receivedPackets(out int plReceivedPackets);
  // Returns the number of packets lost.
  /*[id(0x00000325)]*/ int get_lostPackets(out int plLostPackets);
  // Returns the percentage of packets received in the last 15 seconds.
  /*[id(0x00000326)]*/ int get_receptionQuality(out int plReceptionQuality);
  // Returns the number of times buffering occurred during clip playback.
  /*[id(0x00000327)]*/ int get_bufferingCount(out int plBufferingCount);
  // Returns the percentage of buffering completed.
  /*[id(0x00000328)]*/ int get_bufferingProgress(out int plBufferingProgress);
  // Returns the number of seconds allocated for buffering for this media type.
  /*[id(0x00000329)]*/ int get_bufferingTime(out int plBufferingTime);
  // Returns the number of seconds allocated for buffering for this media type.
  /*[id(0x00000329)]*/ int set_bufferingTime(int plBufferingTime);
  // Current video frame rate in frames/second
  /*[id(0x0000032A)]*/ int get_frameRate(out int plFrameRate);
  // Maximum possible video bit rate
  /*[id(0x0000032B)]*/ int get_maxBitRate(out int plBitRate);
  // Current video bit rate
  /*[id(0x0000032C)]*/ int get_bitRate(out int plBitRate);
  // Returns the proxy settings for the specified protocol
  /*[id(0x0000032D)]*/ int getProxySettings(wchar* bstrProtocol, out int plProxySetting);
  // Sets the proxy settings for the specified protocol
  /*[id(0x0000032E)]*/ int setProxySettings(wchar* bstrProtocol, int lProxySetting);
  // Returns the proxy name for the specified protocol
  /*[id(0x0000032F)]*/ int getProxyName(wchar* bstrProtocol, out wchar* pbstrProxyName);
  // Sets the proxy name for the specified protocol
  /*[id(0x00000330)]*/ int setProxyName(wchar* bstrProtocol, wchar* bstrProxyName);
  // Returns the proxy port for the specified protocol
  /*[id(0x00000331)]*/ int getProxyPort(wchar* bstrProtocol, out int lProxyPort);
  // Sets the proxy port for the specified protocol
  /*[id(0x00000332)]*/ int setProxyPort(wchar* bstrProtocol, int lProxyPort);
  // Returns the proxy exception list for the specified protocol
  /*[id(0x00000333)]*/ int getProxyExceptionList(wchar* bstrProtocol, out wchar* pbstrExceptionList);
  // Sets the proxy exception list for the specified protocol
  /*[id(0x00000334)]*/ int setProxyExceptionList(wchar* bstrProtocol, wchar* pbstrExceptionList);
  // Returns whether or not to bypass the proxy for local addresses
  /*[id(0x00000335)]*/ int getProxyBypassForLocal(wchar* bstrProtocol, out short pfBypassForLocal);
  // Sets whether or not to by pass the proxy for local addresses
  /*[id(0x00000336)]*/ int setProxyBypassForLocal(wchar* bstrProtocol, short fBypassForLocal);
  // Returns or sets maximum allowed bandwidth
  /*[id(0x00000337)]*/ int get_maxBandwidth(out int lMaxBandwidth);
  // Returns or sets maximum allowed bandwidth
  /*[id(0x00000337)]*/ int set_maxBandwidth(int lMaxBandwidth);
  // Returns the percentage of download completed.
  /*[id(0x00000338)]*/ int get_downloadProgress(out int plDownloadProgress);
  // Returns the video frame rate, in frames/second, that the file was encoded in
  /*[id(0x00000339)]*/ int get_encodedFrameRate(out int plFrameRate);
  // Returns the number of skipped frames
  /*[id(0x0000033A)]*/ int get_framesSkipped(out int plFrames);
}

// IWMPCdromCollection: Public interface.
interface IWMPCdromCollection : IDispatch {
  mixin(uuid("ee4c8fe2-34b2-11d3-a3bf-006097c9b344"));
  // static DWINGUID IID = { 0xee4c8fe2, 0x34b2, 0x11d3, 0xa3, 0xbf, 0x00, 0x60, 0x97, 0xc9, 0xb3, 0x44 };
  // Returns the number of items in the cdrom collection
  /*[id(0x0000012D)]*/ int get_count(out int plCount);
  // Returns the CDROM object at the given index
  /*[id(0x0000012E)]*/ int Item(int lIndex, out IWMPCdrom ppItem);
  // Returns the CDROM object associated with a particular drive specifier, e.g. F:
  /*[id(0x0000012F)]*/ int getByDriveSpecifier(wchar* bstrDriveSpecifier, out IWMPCdrom ppCdrom);
}

// IWMPCdrom: Public interface.
interface IWMPCdrom : IDispatch {
  mixin(uuid("cfab6e98-8730-11d3-b388-00c04f68574b"));
  // static DWINGUID IID = { 0xcfab6e98, 0x8730, 0x11d3, 0xb3, 0x88, 0x00, 0xc0, 0x4f, 0x68, 0x57, 0x4b };
  // Returns the CDROM drive specifier
  /*[id(0x000000FB)]*/ int get_driveSpecifier(out wchar* pbstrDrive);
  // Returns the playlist of tracks currently in the CDROM drive
  /*[id(0x000000FC)]*/ int get_Playlist(out IWMPPlaylist ppPlaylist);
  // Eject the CD in the CDROM drive
  /*[id(0x000000FD)]*/ int eject();
}

// IWMPClosedCaption: Public interface.
interface IWMPClosedCaption : IDispatch {
  mixin(uuid("4f2df574-c588-11d3-9ed0-00c04fb6e937"));
  // static DWINGUID IID = { 0x4f2df574, 0xc588, 0x11d3, 0x9e, 0xd0, 0x00, 0xc0, 0x4f, 0xb6, 0xe9, 0x37 };
  // Returns the previously set SAMI style
  /*[id(0x000003B7)]*/ int get_SAMIStyle(out wchar* pbstrSAMIStyle);
  // Returns the previously set SAMI style
  /*[id(0x000003B7)]*/ int set_SAMIStyle(wchar* pbstrSAMIStyle);
  // Returns the previously set SAMI language
  /*[id(0x000003B8)]*/ int get_SAMILang(out wchar* pbstrSAMILang);
  // Returns the previously set SAMI language
  /*[id(0x000003B8)]*/ int set_SAMILang(wchar* pbstrSAMILang);
  // Returns the previously set SAMI file name
  /*[id(0x000003B9)]*/ int get_SAMIFileName(out wchar* pbstrSAMIFileName);
  // Returns the previously set SAMI file name
  /*[id(0x000003B9)]*/ int set_SAMIFileName(wchar* pbstrSAMIFileName);
  // Returns the previously set Captioning ID
  /*[id(0x000003BA)]*/ int get_captioningId(out wchar* pbstrCaptioningID);
  // Returns the previously set Captioning ID
  /*[id(0x000003BA)]*/ int set_captioningId(wchar* pbstrCaptioningID);
}

// IWMPError: Public interface.
interface IWMPError : IDispatch {
  mixin(uuid("a12dcf7d-14ab-4c1b-a8cd-63909f06025b"));
  // static DWINGUID IID = { 0xa12dcf7d, 0x14ab, 0x4c1b, 0xa8, 0xcd, 0x63, 0x90, 0x9f, 0x06, 0x02, 0x5b };
  // Clears the error queue
  /*[id(0x00000353)]*/ int clearErrorQueue();
  // Returns the number of error items
  /*[id(0x00000354)]*/ int get_errorCount(out int plNumErrors);
  // Returns an error item object
  /*[id(0x00000355)]*/ int get_Item(int dwIndex, out IWMPErrorItem ppErrorItem);
  // Launches WebHelp
  /*[id(0x00000356)]*/ int webHelp();
}

// IWMPErrorItem: Public interface.
interface IWMPErrorItem : IDispatch {
  mixin(uuid("3614c646-3b3b-4de7-a81e-930e3f2127b3"));
  // static DWINGUID IID = { 0x3614c646, 0x3b3b, 0x4de7, 0xa8, 0x1e, 0x93, 0x0e, 0x3f, 0x21, 0x27, 0xb3 };
  // Returns the error code
  /*[id(0x00000385)]*/ int get_errorCode(out int phr);
  // Returns a description of the error
  /*[id(0x00000386)]*/ int get_errorDescription(out wchar* pbstrDescription);
  // Returns context information for the error
  /*[id(0x00000387)]*/ int get_errorContext(out DWINVARIANT pvarContext);
  // Returns remedy code for the error
  /*[id(0x00000388)]*/ int get_remedy(out int plRemedy);
  // Returns a custom url for this error (if avail)
  /*[id(0x00000389)]*/ int get_customUrl(out wchar* pbstrCustomUrl);
}

// IWMPDVD: Public interface.
interface IWMPDVD : IDispatch {
  mixin(uuid("8da61686-4668-4a5c-ae5d-803193293dbe"));
  // static DWINGUID IID = { 0x8da61686, 0x4668, 0x4a5c, 0xae, 0x5d, 0x80, 0x31, 0x93, 0x29, 0x3d, 0xbe };
  // Returns whether or not the specified DVD functionality is available
  /*[id(0x000003E9)]*/ int get_isAvailable(wchar* bstrItem, out short pIsAvailable);
  // Returns the current DVD domain
  /*[id(0x000003EA)]*/ int get_domain(out wchar* strDomain);
  // Displays the top menu of the DVD
  /*[id(0x000003EB)]*/ int topMenu();
  // Displays the title menu of the current DVD title
  /*[id(0x000003EC)]*/ int titleMenu();
  // Navigates back one menu
  /*[id(0x000003ED)]*/ int back();
  // Removes the menu from the screen and returns to playing the DVD
  /*[id(0x000003EE)]*/ int resume();
}

// IWMPPlayerApplication: Public interface.
interface IWMPPlayerApplication : IDispatch {
  mixin(uuid("40897764-ceab-47be-ad4a-8e28537f9bbf"));
  // static DWINGUID IID = { 0x40897764, 0xceab, 0x47be, 0xad, 0x4a, 0x8e, 0x28, 0x53, 0x7f, 0x9b, 0xbf };
  // Switches the display to player application
  /*[id(0x0000044D)]*/ int switchToPlayerApplication();
  // Switches the display to control
  /*[id(0x0000044E)]*/ int switchToControl();
  // Returns a boolean value specifying whether or not the player is docked
  /*[id(0x0000044F)]*/ int get_playerDocked(out short pbPlayerDocked);
  // Returns a boolean value specifying whether or not the control has display
  /*[id(0x00000450)]*/ int get_hasDisplay(out short pbHasDisplay);
}

// IWMPPlayer3: Public interface.
interface IWMPPlayer3 : IWMPCore2 {
  mixin(uuid("54062b68-052a-4c25-a39f-8b63346511d4"));
  // static DWINGUID IID = { 0x54062b68, 0x052a, 0x4c25, 0xa3, 0x9f, 0x8b, 0x63, 0x34, 0x65, 0x11, 0xd4 };
  // Returns a boolen value specifying whether or not the control is enabled
  /*[id(0x00000013)]*/ int get_enabled(out short pbEnabled);
  // Returns a boolen value specifying whether or not the control is enabled
  /*[id(0x00000013)]*/ int set_enabled(short pbEnabled);
  // Returns a boolean value specifying whether or not the control is in full screen mode
  /*[id(0x00000015)]*/ int get_fullScreen(out short pbFullScreen);
  // Returns a boolean value specifying whether or not the control is in full screen mode
  /*[id(0x00000015)]*/ int set_fullScreen(short pbFullScreen);
  // Returns a boolean value specifying whether or not the context menu is enabled on the control
  /*[id(0x00000016)]*/ int get_enableContextMenu(out short pbEnableContextMenu);
  // Returns a boolean value specifying whether or not the context menu is enabled on the control
  /*[id(0x00000016)]*/ int set_enableContextMenu(short pbEnableContextMenu);
  // Specifies the ui mode to select
  /*[id(0x00000017)]*/ int set_uiMode(wchar* pbstrMode);
  // Specifies the ui mode to select
  /*[id(0x00000017)]*/ int get_uiMode(out wchar* pbstrMode);
  // Returns a boolen value specifying whether or not video is stretched
  /*[id(0x00000018)]*/ int get_stretchToFit(out short pbEnabled);
  // Returns a boolen value specifying whether or not video is stretched
  /*[id(0x00000018)]*/ int set_stretchToFit(short pbEnabled);
  // Returns a boolen value specifying whether or not video is windowless
  /*[id(0x00000019)]*/ int get_windowlessVideo(out short pbEnabled);
  // Returns a boolen value specifying whether or not video is windowless
  /*[id(0x00000019)]*/ int set_windowlessVideo(short pbEnabled);
}

// IWMPPlayer2: Public interface.
interface IWMPPlayer2 : IWMPCore {
  mixin(uuid("0e6b01d1-d407-4c85-bf5f-1c01f6150280"));
  // static DWINGUID IID = { 0x0e6b01d1, 0xd407, 0x4c85, 0xbf, 0x5f, 0x1c, 0x01, 0xf6, 0x15, 0x02, 0x80 };
  // Returns a boolen value specifying whether or not the control is enabled
  /*[id(0x00000013)]*/ int get_enabled(out short pbEnabled);
  // Returns a boolen value specifying whether or not the control is enabled
  /*[id(0x00000013)]*/ int set_enabled(short pbEnabled);
  // Returns a boolean value specifying whether or not the control is in full screen mode
  /*[id(0x00000015)]*/ int get_fullScreen(out short pbFullScreen);
  // Returns a boolean value specifying whether or not the control is in full screen mode
  /*[id(0x00000015)]*/ int set_fullScreen(short pbFullScreen);
  // Returns a boolean value specifying whether or not the context menu is enabled on the control
  /*[id(0x00000016)]*/ int get_enableContextMenu(out short pbEnableContextMenu);
  // Returns a boolean value specifying whether or not the context menu is enabled on the control
  /*[id(0x00000016)]*/ int set_enableContextMenu(short pbEnableContextMenu);
  // Specifies the ui mode to select
  /*[id(0x00000017)]*/ int set_uiMode(wchar* pbstrMode);
  // Specifies the ui mode to select
  /*[id(0x00000017)]*/ int get_uiMode(out wchar* pbstrMode);
  // Returns a boolen value specifying whether or not video is stretched
  /*[id(0x00000018)]*/ int get_stretchToFit(out short pbEnabled);
  // Returns a boolen value specifying whether or not video is stretched
  /*[id(0x00000018)]*/ int set_stretchToFit(short pbEnabled);
  // Returns a boolen value specifying whether or not video is windowless
  /*[id(0x00000019)]*/ int get_windowlessVideo(out short pbEnabled);
  // Returns a boolen value specifying whether or not video is windowless
  /*[id(0x00000019)]*/ int set_windowlessVideo(short pbEnabled);
}

// IWMPPlayer: Public interface.
interface IWMPPlayer : IWMPCore {
  mixin(uuid("6bf52a4f-394a-11d3-b153-00c04f79faa6"));
  // static DWINGUID IID = { 0x6bf52a4f, 0x394a, 0x11d3, 0xb1, 0x53, 0x00, 0xc0, 0x4f, 0x79, 0xfa, 0xa6 };
  // Returns a boolen value specifying whether or not the control is enabled
  /*[id(0x00000013)]*/ int get_enabled(out short pbEnabled);
  // Returns a boolen value specifying whether or not the control is enabled
  /*[id(0x00000013)]*/ int set_enabled(short pbEnabled);
  // Returns a boolean value specifying whether or not the control is in full screen mode
  /*[id(0x00000015)]*/ int get_fullScreen(out short pbFullScreen);
  // Returns a boolean value specifying whether or not the control is in full screen mode
  /*[id(0x00000015)]*/ int set_fullScreen(short pbFullScreen);
  // Returns a boolean value specifying whether or not the context menu is enabled on the control
  /*[id(0x00000016)]*/ int get_enableContextMenu(out short pbEnableContextMenu);
  // Returns a boolean value specifying whether or not the context menu is enabled on the control
  /*[id(0x00000016)]*/ int set_enableContextMenu(short pbEnableContextMenu);
  // Specifies the ui mode to select
  /*[id(0x00000017)]*/ int set_uiMode(wchar* pbstrMode);
  // Specifies the ui mode to select
  /*[id(0x00000017)]*/ int get_uiMode(out wchar* pbstrMode);
}

// IWMPErrorItem2: Public interface.
interface IWMPErrorItem2 : IWMPErrorItem {
  mixin(uuid("f75ccec0-c67c-475c-931e-8719870bee7d"));
  // static DWINGUID IID = { 0xf75ccec0, 0xc67c, 0x475c, 0x93, 0x1e, 0x87, 0x19, 0x87, 0x0b, 0xee, 0x7d };
  // Returns condition for the error
  /*[id(0x0000038A)]*/ int get_condition(out int plCondition);
}

// IWMPControls2: Public interface.
interface IWMPControls2 : IWMPControls {
  mixin(uuid("6f030d25-0890-480f-9775-1f7e40ab5b8e"));
  // static DWINGUID IID = { 0x6f030d25, 0x0890, 0x480f, 0x97, 0x75, 0x1f, 0x7e, 0x40, 0xab, 0x5b, 0x8e };
  // Advances the video one frame
  /*[id(0x00000040)]*/ int step(int lStep);
}

// IWMPMedia2: Public interface.
interface IWMPMedia2 : IWMPMedia {
  mixin(uuid("ab7c88bb-143e-4ea4-acc3-e4350b2106c3"));
  // static DWINGUID IID = { 0xab7c88bb, 0x143e, 0x4ea4, 0xac, 0xc3, 0xe4, 0x35, 0x0b, 0x21, 0x06, 0xc3 };
  // Returns an error item pointer for a media specific error
  /*[id(0x00000300)]*/ int get_Error(out IWMPErrorItem ppIWMPErrorItem);
}

// IWMPMedia3: Public interface.
interface IWMPMedia3 : IWMPMedia2 {
  mixin(uuid("f118efc7-f03a-4fb4-99c9-1c02a5c1065b"));
  // static DWINGUID IID = { 0xf118efc7, 0xf03a, 0x4fb4, 0x99, 0xc9, 0x1c, 0x02, 0xa5, 0xc1, 0x06, 0x5b };
  /*[id(0x00000301)]*/ int getAttributeCountByType(wchar* bstrType, wchar* bstrLanguage, out int plCount);
  /*[id(0x00000302)]*/ int getItemInfoByType(wchar* bstrType, wchar* bstrLanguage, int lIndex, out DWINVARIANT pvarValue);
}

// IWMPMetadataPicture: Not Public.  Internal interface used by Windows Media Player.
interface IWMPMetadataPicture : IDispatch {
  mixin(uuid("5c29bbe0-f87d-4c45-aa28-a70f0230ffa9"));
  // static DWINGUID IID = { 0x5c29bbe0, 0xf87d, 0x4c45, 0xaa, 0x28, 0xa7, 0x0f, 0x02, 0x30, 0xff, 0xa9 };
  /*[id(0x0000041B)]*/ int get_mimeType(out wchar* pbstrMimeType);
  /*[id(0x0000041C)]*/ int get_pictureType(out wchar* pbstrPictureType);
  /*[id(0x0000041D)]*/ int get_Description(out wchar* pbstrDescription);
  /*[id(0x0000041E)]*/ int get_URL(out wchar* pbstrURL);
}

// IWMPMetadataText: Not Public.  Internal interface used by Windows Media Player.
interface IWMPMetadataText : IDispatch {
  mixin(uuid("769a72db-13d2-45e2-9c48-53ca9d5b7450"));
  // static DWINGUID IID = { 0x769a72db, 0x13d2, 0x45e2, 0x9c, 0x48, 0x53, 0xca, 0x9d, 0x5b, 0x74, 0x50 };
  /*[id(0x00000420)]*/ int get_Description(out wchar* pbstrDescription);
  /*[id(0x0000041F)]*/ int get_text(out wchar* pbstrText);
}

// IWMPSettings2: Public interface.
interface IWMPSettings2 : IWMPSettings {
  mixin(uuid("fda937a4-eece-4da5-a0b6-39bf89ade2c2"));
  // static DWINGUID IID = { 0xfda937a4, 0xeece, 0x4da5, 0xa0, 0xb6, 0x39, 0xbf, 0x89, 0xad, 0xe2, 0xc2 };
  // Returns the LCID of default audio language
  /*[id(0x00000072)]*/ int get_defaultAudioLanguage(out int plLangID);
  /*[id(0x00000073)]*/ int get_mediaAccessRights(out wchar* pbstrRights);
  /*[id(0x00000074)]*/ int requestMediaAccessRights(wchar* bstrDesiredAccess, out short pvbAccepted);
}

// IWMPControls3: Public interface.
interface IWMPControls3 : IWMPControls2 {
  mixin(uuid("a1d1110e-d545-476a-9a78-ac3e4cb1e6bd"));
  // static DWINGUID IID = { 0xa1d1110e, 0xd545, 0x476a, 0x9a, 0x78, 0xac, 0x3e, 0x4c, 0xb1, 0xe6, 0xbd };
  // Returns the count of supported audio languages
  /*[id(0x00000041)]*/ int get_audioLanguageCount(out int plCount);
  // Returns the LCID corresponding to the index
  /*[id(0x00000042)]*/ int getAudioLanguageID(int lIndex, out int plLangID);
  // Returns the desription corresponding to the index
  /*[id(0x00000043)]*/ int getAudioLanguageDescription(int lIndex, out wchar* pbstrLangDesc);
  // Gets the current audio language setting for playback
  /*[id(0x00000044)]*/ int get_currentAudioLanguage(out int plLangID);
  // Gets the current audio language setting for playback
  /*[id(0x00000044)]*/ int set_currentAudioLanguage(int plLangID);
  // Gets the current audio language index setting for playback
  /*[id(0x00000045)]*/ int get_currentAudioLanguageIndex(out int plIndex);
  // Gets the current audio language index setting for playback
  /*[id(0x00000045)]*/ int set_currentAudioLanguageIndex(int plIndex);
  // Returns the human-readable name of language specified by LCID
  /*[id(0x00000046)]*/ int getLanguageName(int lLangID, out wchar* pbstrLangName);
  // Returns the current timecode position in media
  /*[id(0x00000047)]*/ int get_currentPositionTimecode(out wchar* bstrTimecode);
  // Returns the current timecode position in media
  /*[id(0x00000047)]*/ int set_currentPositionTimecode(wchar* bstrTimecode);
}

// IWMPClosedCaption2: Public interface.
interface IWMPClosedCaption2 : IWMPClosedCaption {
  mixin(uuid("350ba78b-6bc8-4113-a5f5-312056934eb6"));
  // static DWINGUID IID = { 0x350ba78b, 0x6bc8, 0x4113, 0xa5, 0xf5, 0x31, 0x20, 0x56, 0x93, 0x4e, 0xb6 };
  // Returns the count of SAMI languages
  /*[id(0x000003BB)]*/ int get_SAMILangCount(out int plCount);
  // Returns the name of a SAMI language by index
  /*[id(0x000003BC)]*/ int getSAMILangName(int nIndex, out wchar* pbstrName);
  // Returns the ID of a SAMI language by index
  /*[id(0x000003BD)]*/ int getSAMILangID(int nIndex, out int plLangID);
  // Returns the count of SAMI styles
  /*[id(0x000003BE)]*/ int get_SAMIStyleCount(out int plCount);
  // Returns the name of a SAMI style by index
  /*[id(0x000003BF)]*/ int getSAMIStyleName(int nIndex, out wchar* pbstrName);
}

// IWMPPlaylistCtrl: Public interface for skin object model.
interface IWMPPlaylistCtrl : IDispatch {
  mixin(uuid("5f9cfd92-8cad-11d3-9a7e-00c04f8efb70"));
  // static DWINGUID IID = { 0x5f9cfd92, 0x8cad, 0x11d3, 0x9a, 0x7e, 0x00, 0xc0, 0x4f, 0x8e, 0xfb, 0x70 };
  // property playlist
  /*[id(0x000015E1)]*/ int get_Playlist(out IWMPPlaylist ppdispPlaylist);
  // property playlist
  /*[id(0x000015E1)]*/ int set_Playlist(IWMPPlaylist ppdispPlaylist);
  // property columns
  /*[id(0x000015E2)]*/ int get_columns(out wchar* pbstrColumns);
  // property columns
  /*[id(0x000015E2)]*/ int set_columns(wchar* pbstrColumns);
  // property columnCount
  /*[id(0x000015E3)]*/ int get_columnCount(out int pVal);
  // property columnOrder
  /*[id(0x000015E4)]*/ int get_columnOrder(out wchar* pbstrColumnOrder);
  // property columnOrder
  /*[id(0x000015E4)]*/ int set_columnOrder(wchar* pbstrColumnOrder);
  // property columnsVisible
  /*[id(0x000015E5)]*/ int get_columnsVisible(out short pVal);
  // property columnsVisible
  /*[id(0x000015E5)]*/ int set_columnsVisible(short pVal);
  // property dropDownVisible
  /*[id(0x000015E7)]*/ int get_dropDownVisible(out short pVal);
  // property dropDownVisible
  /*[id(0x000015E7)]*/ int set_dropDownVisible(short pVal);
  // property playlistItemsVisible
  /*[id(0x000015E8)]*/ int get_playlistItemsVisible(out short pVal);
  // property playlistItemsVisible
  /*[id(0x000015E8)]*/ int set_playlistItemsVisible(short pVal);
  // property checkboxesVisible
  /*[id(0x000015E9)]*/ int get_checkboxesVisible(out short pVal);
  // property checkboxesVisible
  /*[id(0x000015E9)]*/ int set_checkboxesVisible(short pVal);
  // property backgroundColor
  /*[id(0x000015EC)]*/ int get_backgroundColor(out wchar* pbstrColor);
  // property backgroundColor
  /*[id(0x000015EC)]*/ int set_backgroundColor(wchar* pbstrColor);
  // property foregroundColor
  /*[id(0x000015ED)]*/ int get_foregroundColor(out wchar* pbstrColor);
  // property foregroundColor
  /*[id(0x000015ED)]*/ int set_foregroundColor(wchar* pbstrColor);
  // property disabledItemColor
  /*[id(0x000015EE)]*/ int get_disabledItemColor(out wchar* pbstrColor);
  // property disabledItemColor
  /*[id(0x000015EE)]*/ int set_disabledItemColor(wchar* pbstrColor);
  // property itemPlayingColor
  /*[id(0x000015EF)]*/ int get_itemPlayingColor(out wchar* pbstrColor);
  // property itemPlayingColor
  /*[id(0x000015EF)]*/ int set_itemPlayingColor(wchar* pbstrColor);
  // property itemPlayingBackgroundColor
  /*[id(0x000015F0)]*/ int get_itemPlayingBackgroundColor(out wchar* pbstrBackgroundColor);
  // property itemPlayingBackgroundColor
  /*[id(0x000015F0)]*/ int set_itemPlayingBackgroundColor(wchar* pbstrBackgroundColor);
  // property backgroundImage
  /*[id(0x000015F1)]*/ int get_backgroundImage(out wchar* pbstrImage);
  // property backgroundImage
  /*[id(0x000015F1)]*/ int set_backgroundImage(wchar* pbstrImage);
  // property allowItemEditing
  /*[id(0x000015F2)]*/ int get_allowItemEditing(out short pVal);
  // property allowItemEditing
  /*[id(0x000015F2)]*/ int set_allowItemEditing(short pVal);
  // property allowColumnSorting
  /*[id(0x000015F3)]*/ int get_allowColumnSorting(out short pVal);
  // property allowColumnSorting
  /*[id(0x000015F3)]*/ int set_allowColumnSorting(short pVal);
  // property dropDownList
  /*[id(0x000015F4)]*/ int get_dropDownList(out wchar* pbstrList);
  // property dropDownList
  /*[id(0x000015F4)]*/ int set_dropDownList(wchar* pbstrList);
  // property dropDownToolTip
  /*[id(0x000015F5)]*/ int get_dropDownToolTip(out wchar* pbstrToolTip);
  // property dropDownToolTip
  /*[id(0x000015F5)]*/ int set_dropDownToolTip(wchar* pbstrToolTip);
  // property copying
  /*[id(0x000015F6)]*/ int get_copying(out short pVal);
  // method copy
  /*[id(0x000015F7)]*/ int copy();
  // method abortCopy
  /*[id(0x000015F8)]*/ int abortCopy();
  // method deleteSelected
  /*[id(0x000015F9)]*/ int deleteSelected();
  // method deleteSelectedFromLibrary
  /*[id(0x000015FA)]*/ int deleteSelectedFromLibrary();
  // method moveSelectedUp
  /*[id(0x000015FC)]*/ int moveSelectedUp();
  // method moveSelectedDown
  /*[id(0x000015FD)]*/ int moveSelectedDown();
  // method addSelectedToPlaylist
  /*[id(0x000015FE)]*/ int addSelectedToPlaylist(IWMPPlaylist pdispPlaylist);
  // method getNextSelectedItem
  /*[id(0x000015FF)]*/ int getNextSelectedItem(int nStartIndex, out int pnSelected);
  // method getNextCheckedItem
  /*[id(0x00001600)]*/ int getNextCheckedItem(int nStartIndex, out int pnChecked);
  // method setSelectedState
  /*[id(0x00001601)]*/ int setSelectedState(int nIndex, short vbSelected);
  // method setCheckedState
  /*[id(0x00001602)]*/ int setCheckedState(int nIndex, short vbChecked);
  // method sortColumn
  /*[id(0x00001603)]*/ int sortColumn(int nIndex);
  // method setColumnResizeMode
  /*[id(0x00001604)]*/ int setColumnResizeMode(int nIndex, wchar* newMode);
  // method setColumnWidth
  /*[id(0x00001605)]*/ int setColumnWidth(int nIndex, int nWidth);
  // property itemErrorColor
  /*[id(0x0000160A)]*/ int get_itemErrorColor(out wchar* pbstrColor);
  // property itemErrorColor
  /*[id(0x0000160A)]*/ int set_itemErrorColor(wchar* pbstrColor);
  // property itemCount
  /*[id(0x0000160B)]*/ int get_itemCount(out int pnItemCount);
  // property itemMedia
  /*[id(0x0000160C)]*/ int get_itemMedia(int nIndex, out IWMPMedia ppMedia);
  // property itemPlaylist
  /*[id(0x0000160D)]*/ int get_itemPlaylist(int nIndex, out IWMPPlaylist ppPlaylist);
  // method getNextSelectedItem2
  /*[id(0x0000160E)]*/ int getNextSelectedItem2(int nStartIndex, out int pnSelected);
  // method getNextCheckedItem2
  /*[id(0x0000160F)]*/ int getNextCheckedItem2(int nStartIndex, out int pnChecked);
  // method setSelectedState2
  /*[id(0x00001610)]*/ int setSelectedState2(int nIndex, short vbSelected);
  // method setCheckedState2
  /*[id(0x00001611)]*/ int setCheckedState2(int nIndex, short vbChecked);
  // property leftStatus
  /*[id(0x00001612)]*/ int get_leftStatus(out wchar* pbstrStatus);
  // property leftStatus
  /*[id(0x00001612)]*/ int set_leftStatus(wchar* pbstrStatus);
  // property rightStatus
  /*[id(0x00001613)]*/ int get_rightStatus(out wchar* pbstrStatus);
  // property rightStatus
  /*[id(0x00001613)]*/ int set_rightStatus(wchar* pbstrStatus);
  // property editButtonVisible
  /*[id(0x00001614)]*/ int get_editButtonVisible(out short pVal);
  // property editButtonVisible
  /*[id(0x00001614)]*/ int set_editButtonVisible(short pVal);
  // property dropDownImage
  /*[id(0x00001615)]*/ int get_dropDownImage(out wchar* pbstrImage);
  // property dropDownImage
  /*[id(0x00001615)]*/ int set_dropDownImage(wchar* pbstrImage);
  // property dropDownBackgroundImage
  /*[id(0x00001616)]*/ int get_dropDownBackgroundImage(out wchar* pbstrImage);
  // property dropDownBackgroundImage
  /*[id(0x00001616)]*/ int set_dropDownBackgroundImage(wchar* pbstrImage);
  // property hueShift
  /*[id(0x00001617)]*/ int get_hueShift(out float pVal);
  // property hueShift
  /*[id(0x00001617)]*/ int set_hueShift(float pVal);
  // property saturation
  /*[id(0x00001618)]*/ int get_saturation(out float pVal);
  // property saturation
  /*[id(0x00001618)]*/ int set_saturation(float pVal);
  // property statusColor
  /*[id(0x0000161A)]*/ int get_statusColor(out wchar* pbstrColor);
  // property statusColor
  /*[id(0x0000161A)]*/ int set_statusColor(wchar* pbstrColor);
  // property toolbarVisible
  /*[id(0x0000161C)]*/ int get_toolbarVisible(out short pVal);
  // property toolbarVisible
  /*[id(0x0000161C)]*/ int set_toolbarVisible(short pVal);
  // property itemSelectedColor
  /*[id(0x0000161E)]*/ int get_itemSelectedColor(out wchar* pbstrColor);
  // property itemSelectedColor
  /*[id(0x0000161E)]*/ int set_itemSelectedColor(wchar* pbstrColor);
  // property itemSelectedFocusLostColor
  /*[id(0x0000161F)]*/ int get_itemSelectedFocusLostColor(out wchar* pbstrFocusLostColor);
  // property itemSelectedFocusLostColor
  /*[id(0x0000161F)]*/ int set_itemSelectedFocusLostColor(wchar* pbstrFocusLostColor);
  // property itemSelectedBackgroundColor
  /*[id(0x00001620)]*/ int get_itemSelectedBackgroundColor(out wchar* pbstrColor);
  // property itemSelectedBackgroundColor
  /*[id(0x00001620)]*/ int set_itemSelectedBackgroundColor(wchar* pbstrColor);
  // property itemSelectedBackgroundFocusLostColor
  /*[id(0x00001621)]*/ int get_itemSelectedBackgroundFocusLostColor(out wchar* pbstrFocusLostColor);
  // property itemSelectedBackgroundFocusLostColor
  /*[id(0x00001621)]*/ int set_itemSelectedBackgroundFocusLostColor(wchar* pbstrFocusLostColor);
  // property backgroundSplitColor
  /*[id(0x00001622)]*/ int get_backgroundSplitColor(out wchar* pbstrColor);
  // property backgroundSplitColor
  /*[id(0x00001622)]*/ int set_backgroundSplitColor(wchar* pbstrColor);
  // property statusTextColor
  /*[id(0x00001623)]*/ int get_statusTextColor(out wchar* pbstrColor);
  // property statusTextColor
  /*[id(0x00001623)]*/ int set_statusTextColor(wchar* pbstrColor);
}

// IAppDispatch: Not Public.  Internal interface used by Windows Media Player.
interface IAppDispatch : IDispatch {
  mixin(uuid("e41c88dd-2364-4ff7-a0f5-ca9859af783f"));
  // static DWINGUID IID = { 0xe41c88dd, 0x2364, 0x4ff7, 0xa0, 0xf5, 0xca, 0x98, 0x59, 0xaf, 0x78, 0x3f };
  /*[id(0x00000064)]*/ int get_titlebarVisible(out short pVal);
  /*[id(0x00000064)]*/ int set_titlebarVisible(short pVal);
  /*[id(0x00000065)]*/ int get_titlebarAutoHide(out short pVal);
  /*[id(0x00000065)]*/ int set_titlebarAutoHide(short pVal);
  /*[id(0x00000066)]*/ int get_currentTask(out wchar* pVal);
  /*[id(0x00000066)]*/ int set_currentTask(wchar* pVal);
  /*[id(0x00000067)]*/ int get_settingsVisible(out short pVal);
  /*[id(0x00000067)]*/ int set_settingsVisible(short pVal);
  /*[id(0x00000068)]*/ int get_playlistVisible(out short pVal);
  /*[id(0x00000068)]*/ int set_playlistVisible(short pVal);
  /*[id(0x00000069)]*/ int gotoSkinMode();
  /*[id(0x0000006A)]*/ int adjustLeft(int nDistance);
  /*[id(0x0000006B)]*/ int get_taskbarVisible(out short pVal);
  /*[id(0x0000006B)]*/ int set_taskbarVisible(short pVal);
  /*[id(0x00000074)]*/ int get_DPI(out int pVal);
  /*[id(0x00000072)]*/ int get_previousEnabled(out short pVal);
  /*[id(0x00000073)]*/ int previous();
  /*[id(0x0000006C)]*/ int get_titlebarCurrentlyVisible(out short pVal);
  /*[id(0x0000006D)]*/ int get_bgPluginRunning(out short pVal);
  /*[id(0x0000006E)]*/ int configurePlugins(int nType);
  // method getTimeString
  /*[id(0x0000006F)]*/ int getTimeString(double dTime, out wchar* pVal);
  /*[id(0x00000070)]*/ int get_isXPOrBetter(out short pVal);
  /*[id(0x00000071)]*/ int get_maximized(out short pVal);
}

// IWMPSafeBrowser: Not Public.  Internal interface used by Windows Media Player.
interface IWMPSafeBrowser : IDispatch {
  mixin(uuid("ef870383-83ab-4ea9-be48-56fa4251af10"));
  // static DWINGUID IID = { 0xef870383, 0x83ab, 0x4ea9, 0xbe, 0x48, 0x56, 0xfa, 0x42, 0x51, 0xaf, 0x10 };
  /*[id(0x000020D0)]*/ int get_URL(out wchar* pVal);
  /*[id(0x000020D0)]*/ int set_URL(wchar* pVal);
  /*[id(0x000020D1)]*/ int get_status(out int pVal);
  /*[id(0x000020D2)]*/ int get_pendingDownloads(out int pVal);
  // method showSAMIText
  /*[id(0x000020D3)]*/ int showSAMIText(wchar* samiText);
  // method showLyrics
  /*[id(0x000020D4)]*/ int showLyrics(wchar* lyrics);
  // loads one of our special pages by name
  /*[id(0x000020D5)]*/ int loadSpecialPage(wchar* pageName);
  // go back to the previous page
  /*[id(0x000020D6)]*/ int goBack();
  // go forward through the current MRU
  /*[id(0x000020D7)]*/ int goForward();
  // stop loading page
  /*[id(0x000020D8)]*/ int stop();
  // refresh the page
  /*[id(0x000020D9)]*/ int refresh();
  /*[id(0x000020DA)]*/ int get_baseURL(out wchar* pVal);
  /*[id(0x000020DE)]*/ int get_fullURL(out wchar* pVal);
  /*[id(0x000020DB)]*/ int get_secureLock(out int pVal);
  /*[id(0x000020DC)]*/ int get_busy(out short pVal);
  // show security certificate dialog
  /*[id(0x000020DD)]*/ int showCert();
}

// IWMPSyncServices: Public interface for Windows Media Player SDK.
interface IWMPSyncServices : IUnknown {
  mixin(uuid("8b5050ff-e0a4-4808-b3a8-893a9e1ed894"));
  // static DWINGUID IID = { 0x8b5050ff, 0xe0a4, 0x4808, 0xb3, 0xa8, 0x89, 0x3a, 0x9e, 0x1e, 0xd8, 0x94 };
  /*[id(0x60010000)]*/ int get_deviceCount(out int plCount);
  /*[id(0x60010001)]*/ int getDevice(int lIndex, out IWMPSyncDevice ppDevice);
}

// IWMPObjectExtendedProps: Public interface for skin object model.
interface IWMPObjectExtendedProps : IDispatch {
  mixin(uuid("21d077c1-4baa-11d3-bd45-00c04f6ea5ae"));
  // static DWINGUID IID = { 0x21d077c1, 0x4baa, 0x11d3, 0xbd, 0x45, 0x00, 0xc0, 0x4f, 0x6e, 0xa5, 0xae };
  // property id
  /*[id(0x000007D0)]*/ int get_id(out wchar* pVal);
  // property elementType
  /*[id(0x000007D1)]*/ int get_elementType(out wchar* pVal);
  // property left
  /*[id(0x000007D2)]*/ int get_left(out int pVal);
  // property left
  /*[id(0x000007D2)]*/ int set_left(int pVal);
  // property top
  /*[id(0x000007D3)]*/ int get_top(out int pVal);
  // property top
  /*[id(0x000007D3)]*/ int set_top(int pVal);
  // property width
  /*[id(0x000007D4)]*/ int get_width(out int pVal);
  // property width
  /*[id(0x000007D4)]*/ int set_width(int pVal);
  // property height
  /*[id(0x000007D5)]*/ int get_height(out int pVal);
  // property height
  /*[id(0x000007D5)]*/ int set_height(int pVal);
  // property zIndex
  /*[id(0x000007D6)]*/ int get_zIndex(out int pVal);
  // property zIndex
  /*[id(0x000007D6)]*/ int set_zIndex(int pVal);
  // property clippingImage
  /*[id(0x000007D7)]*/ int get_clippingImage(out wchar* pVal);
  // property clippingImage
  /*[id(0x000007D7)]*/ int set_clippingImage(wchar* pVal);
  // property clippingColor
  /*[id(0x000007D8)]*/ int get_clippingColor(out wchar* pVal);
  // property clippingColor
  /*[id(0x000007D8)]*/ int set_clippingColor(wchar* pVal);
  // property visible
  /*[id(0x000007D9)]*/ int get_visible(out short pVal);
  // property visible
  /*[id(0x000007D9)]*/ int set_visible(short pVal);
  // property enabled
  /*[id(0x000007DA)]*/ int get_enabled(out short pVal);
  // property enabled
  /*[id(0x000007DA)]*/ int set_enabled(short pVal);
  // property tabStop
  /*[id(0x000007DB)]*/ int get_tabStop(out short pVal);
  // property tabStop
  /*[id(0x000007DB)]*/ int set_tabStop(short pVal);
  // property passThrough
  /*[id(0x000007DC)]*/ int get_passThrough(out short pVal);
  // property passThrough
  /*[id(0x000007DC)]*/ int set_passThrough(short pVal);
  // property horizontalAlignment
  /*[id(0x000007DD)]*/ int get_horizontalAlignment(out wchar* pVal);
  // property horizontalAlignment
  /*[id(0x000007DD)]*/ int set_horizontalAlignment(wchar* pVal);
  // property verticalAlignment
  /*[id(0x000007DE)]*/ int get_verticalAlignment(out wchar* pVal);
  // property verticalAlignment
  /*[id(0x000007DE)]*/ int set_verticalAlignment(wchar* pVal);
  // method moveTo
  /*[id(0x000007DF)]*/ int moveTo(int newX, int newY, int moveTime);
  // property alphaBlend
  /*[id(0x000007E0)]*/ int get_alphaBlend(out int pVal);
  // property alphaBlend
  /*[id(0x000007E0)]*/ int set_alphaBlend(int pVal);
  // method alphaBlendTo
  /*[id(0x000007E1)]*/ int alphaBlendTo(int newVal, int alphaTime);
  // property accName
  /*[id(0x000007E2)]*/ int get_accName(out wchar* pszName);
  // property accName
  /*[id(0x000007E2)]*/ int set_accName(wchar* pszName);
  // property accDescription
  /*[id(0x000007E3)]*/ int get_accDescription(out wchar* pszDesc);
  // property accDescription
  /*[id(0x000007E3)]*/ int set_accDescription(wchar* pszDesc);
  // property accKeyboardShortcut	
  /*[id(0x000007E4)]*/ int get_accKeyboardShortcut(out wchar* pszShortcut);
  // property accKeyboardShortcut	
  /*[id(0x000007E4)]*/ int set_accKeyboardShortcut(wchar* pszShortcut);
}

// IWMPLayoutSubView: Public interface for skin object model.
interface IWMPLayoutSubView : IWMPObjectExtendedProps {
  mixin(uuid("72f486b1-0d43-11d3-bd3f-00c04f6ea5ae"));
  // static DWINGUID IID = { 0x72f486b1, 0x0d43, 0x11d3, 0xbd, 0x3f, 0x00, 0xc0, 0x4f, 0x6e, 0xa5, 0xae };
  // property transparencyColor
  /*[id(0x000008FC)]*/ int get_transparencyColor(out wchar* pVal);
  // property transparencyColor
  /*[id(0x000008FC)]*/ int set_transparencyColor(wchar* pVal);
  // property backgroundColor
  /*[id(0x000008FD)]*/ int get_backgroundColor(out wchar* pVal);
  // property backgroundColor
  /*[id(0x000008FD)]*/ int set_backgroundColor(wchar* pVal);
  // property backgroundImage
  /*[id(0x000008FE)]*/ int get_backgroundImage(out wchar* pVal);
  // property backgroundImage
  /*[id(0x000008FE)]*/ int set_backgroundImage(wchar* pVal);
  // property backgroundTiled
  /*[id(0x000008FF)]*/ int get_backgroundTiled(out short pVal);
  // property backgroundTiled
  /*[id(0x000008FF)]*/ int set_backgroundTiled(short pVal);
  // property hueShift
  /*[id(0x00000900)]*/ int get_backgroundImageHueShift(out float pVal);
  // property hueShift
  /*[id(0x00000900)]*/ int set_backgroundImageHueShift(float pVal);
  // property saturation
  /*[id(0x00000901)]*/ int get_backgroundImageSaturation(out float pVal);
  // property saturation
  /*[id(0x00000901)]*/ int set_backgroundImageSaturation(float pVal);
  // property resizeBackgroundImage
  /*[id(0x00000902)]*/ int get_resizeBackgroundImage(out short pVal);
  // property resizeBackgroundImage
  /*[id(0x00000902)]*/ int set_resizeBackgroundImage(short pVal);
}

// IWMPLayoutView: Public interface for skin object model.
interface IWMPLayoutView : IWMPLayoutSubView {
  mixin(uuid("172e905d-80d9-4c2f-b7ce-2ccb771787a2"));
  // static DWINGUID IID = { 0x172e905d, 0x80d9, 0x4c2f, 0xb7, 0xce, 0x2c, 0xcb, 0x77, 0x17, 0x87, 0xa2 };
  // property title
  /*[id(0x00000903)]*/ int get_title(out wchar* pVal);
  // property title
  /*[id(0x00000903)]*/ int set_title(wchar* pVal);
  // property category
  /*[id(0x00000904)]*/ int get_category(out wchar* pVal);
  // property category
  /*[id(0x00000904)]*/ int set_category(wchar* pVal);
  // property focusObjectID
  /*[id(0x00000905)]*/ int get_focusObjectID(out wchar* pVal);
  // property focusObjectID
  /*[id(0x00000905)]*/ int set_focusObjectID(wchar* pVal);
  // property titleBar
  /*[id(0x00000907)]*/ int get_titleBar(out short pVal);
  // property resizable
  /*[id(0x00000908)]*/ int get_resizable(out short pVal);
  // property timerInterval
  /*[id(0x00000909)]*/ int get_timerInterval(out int pVal);
  // property timerInterval
  /*[id(0x00000909)]*/ int set_timerInterval(int pVal);
  // property minWidth
  /*[id(0x0000090A)]*/ int get_minWidth(out int pVal);
  // property minWidth
  /*[id(0x0000090A)]*/ int set_minWidth(int pVal);
  // property maxWidth
  /*[id(0x0000090B)]*/ int get_maxWidth(out int pVal);
  // property maxWidth
  /*[id(0x0000090B)]*/ int set_maxWidth(int pVal);
  // property minHeight
  /*[id(0x0000090C)]*/ int get_minHeight(out int pVal);
  // property minHeight
  /*[id(0x0000090C)]*/ int set_minHeight(int pVal);
  // property maxHeight
  /*[id(0x0000090D)]*/ int get_maxHeight(out int pVal);
  // property maxHeight
  /*[id(0x0000090D)]*/ int set_maxHeight(int pVal);
  // method close
  /*[id(0x0000090E)]*/ int close();
  // method minimize
  /*[id(0x0000090F)]*/ int minimize();
  // method maximize
  /*[id(0x00000910)]*/ int maximize();
  // method restore
  /*[id(0x00000911)]*/ int restore();
  // method size
  /*[id(0x00000912)]*/ int size(wchar* bstrDirection);
  // method returnToMediaCenter
  /*[id(0x00000913)]*/ int returnToMediaCenter();
  // method updateWindow
  /*[id(0x00000914)]*/ int updateWindow();
}

// IWMPEventObject: Not Public.  Internal interface used by Windows Media Player.
interface IWMPEventObject : IDispatch {
  mixin(uuid("5af0bec1-46aa-11d3-bd45-00c04f6ea5ae"));
  // static DWINGUID IID = { 0x5af0bec1, 0x46aa, 0x11d3, 0xbd, 0x45, 0x00, 0xc0, 0x4f, 0x6e, 0xa5, 0xae };
  /*[id(0x00000898)]*/ int get_srcElement(out IDispatch p);
  /*[id(0x00000899)]*/ int get_altKey(out short p);
  /*[id(0x0000089A)]*/ int get_ctrlKey(out short p);
  /*[id(0x0000089B)]*/ int get_shiftKey(out short p);
  /*[id(0x0000089C)]*/ int get_fromElement(out IDispatch p);
  /*[id(0x0000089D)]*/ int get_toElement(out IDispatch p);
  /*[id(0x0000089E)]*/ int set_keyCode(int p);
  /*[id(0x0000089E)]*/ int get_keyCode(out int p);
  /*[id(0x0000089F)]*/ int get_button(out int p);
  /*[id(0x000008A0)]*/ int get_x(out int p);
  /*[id(0x000008A1)]*/ int get_y(out int p);
  /*[id(0x000008A2)]*/ int get_clientX(out int p);
  /*[id(0x000008A3)]*/ int get_clientY(out int p);
  /*[id(0x000008A4)]*/ int get_offsetX(out int p);
  /*[id(0x000008A5)]*/ int get_offsetY(out int p);
  /*[id(0x000008A6)]*/ int get_screenX(out int p);
  /*[id(0x000008A7)]*/ int get_screenY(out int p);
  /*[id(0x000008A8)]*/ int get_screenWidth(out int p);
  /*[id(0x000008A9)]*/ int get_screenHeight(out int p);
}

// IWMPTheme: Public interface for skin object model.
interface IWMPTheme : IDispatch {
  mixin(uuid("6fcae13d-e492-4584-9c21-d2c052a2a33a"));
  // static DWINGUID IID = { 0x6fcae13d, 0xe492, 0x4584, 0x9c, 0x21, 0xd2, 0xc0, 0x52, 0xa2, 0xa3, 0x3a };
  // property title
  /*[id(0x000009C4)]*/ int get_title(out wchar* pVal);
  // property version
  /*[id(0x000009C5)]*/ int get_version(out float pfVersion);
  // property authorVersion
  /*[id(0x000009C6)]*/ int get_authorVersion(out wchar* pVal);
  // property author
  /*[id(0x000009C7)]*/ int get_author(out wchar* pVal);
  // property copyright
  /*[id(0x000009C8)]*/ int get_copyright(out wchar* pVal);
  // property title
  /*[id(0x000009C9)]*/ int get_currentViewID(out wchar* pVal);
  // property title
  /*[id(0x000009C9)]*/ int set_currentViewID(wchar* pVal);
  // method showErrorDialog
  /*[id(0x000009CA)]*/ int showErrorDialog();
  // method logString
  /*[id(0x000009CB)]*/ int logString(wchar* stringVal);
  // method openView
  /*[id(0x000009CC)]*/ int openView(wchar* viewID);
  // method openView
  /*[id(0x000009D3)]*/ int openViewRelative(wchar* viewID, int x, int y);
  // method closeView
  /*[id(0x000009CD)]*/ int closeView(wchar* viewID);
  // method openDialog
  /*[id(0x000009CE)]*/ int openDialog(wchar* dialogType, wchar* parameters, out wchar* pVal);
  // method loadString
  /*[id(0x000009CF)]*/ int loadString(wchar* bstrString, out wchar* pbstrReturn);
  // method loadPreference
  /*[id(0x000009D0)]*/ int loadPreference(wchar* bstrName, out wchar* pbstrValue);
  // method savePreference
  /*[id(0x000009D1)]*/ int savePreference(wchar* bstrName, wchar* bstrValue);
  // method playSound
  /*[id(0x000009D2)]*/ int playSound(wchar* bstrFilename);
}

// IWMPLayoutSettingsDispatch: Not Public.  Internal interface used by Windows Media Player.
interface IWMPLayoutSettingsDispatch : IDispatch {
  mixin(uuid("b2c2d18e-97af-4b6a-a56b-2ffff470fb81"));
  // static DWINGUID IID = { 0xb2c2d18e, 0x97af, 0x4b6a, 0xa5, 0x6b, 0x2f, 0xff, 0xf4, 0x70, 0xfb, 0x81 };
  // property effectType
  /*[id(0x00000AF0)]*/ int get_effectType(out wchar* pVal);
  // property effectType
  /*[id(0x00000AF0)]*/ int set_effectType(wchar* pVal);
  // property effectPreset
  /*[id(0x00000AF1)]*/ int get_effectPreset(out int pVal);
  // property effectPreset
  /*[id(0x00000AF1)]*/ int set_effectPreset(int pVal);
  // property settingsView
  /*[id(0x00000AF2)]*/ int get_settingsView(out wchar* pVal);
  // property settingsView
  /*[id(0x00000AF2)]*/ int set_settingsView(wchar* pVal);
  // property videoZoom
  /*[id(0x00000AF3)]*/ int get_videoZoom(out int pVal);
  // property videoZoom
  /*[id(0x00000AF3)]*/ int set_videoZoom(int pVal);
  // property videoShrinkToFit
  /*[id(0x00000AF4)]*/ int get_videoShrinkToFit(out short pVal);
  // property videoShrinkToFit
  /*[id(0x00000AF4)]*/ int set_videoShrinkToFit(short pVal);
  // property videoStretchToFit
  /*[id(0x00000AF5)]*/ int get_videoStretchToFit(out short pVal);
  // property videoStretchToFit
  /*[id(0x00000AF5)]*/ int set_videoStretchToFit(short pVal);
  // property userVideoStretchToFit
  /*[id(0x00000B34)]*/ int get_userVideoStretchToFit(out short pVal);
  // property userVideoStretchToFit
  /*[id(0x00000B34)]*/ int set_userVideoStretchToFit(short pVal);
  // property showCaptions
  /*[id(0x00000AF7)]*/ int get_showCaptions(out short pVal);
  // property showCaptions
  /*[id(0x00000AF7)]*/ int set_showCaptions(short pVal);
  // property showTitles
  /*[id(0x00000AF8)]*/ int get_showTitles(out short pVal);
  // property showTitles
  /*[id(0x00000AF8)]*/ int set_showTitles(short pVal);
  // property showEffects
  /*[id(0x00000AF9)]*/ int get_showEffects(out short pVal);
  // property showEffects
  /*[id(0x00000AF9)]*/ int set_showEffects(short pVal);
  // property showFullScreenPlaylist
  /*[id(0x00000AFB)]*/ int get_showFullScreenPlaylist(out short pVal);
  // property showFullScreenPlaylist
  /*[id(0x00000AFB)]*/ int set_showFullScreenPlaylist(short pVal);
  // property contrastMode
  /*[id(0x00000AFD)]*/ int get_contrastMode(out wchar* pVal);
  // method getNamedString
  /*[id(0x00000AFA)]*/ int getNamedString(wchar* bstrName, out wchar* pbstrVal);
  // method getDurationStringFromSeconds
  /*[id(0x00000AFF)]*/ int getDurationStringFromSeconds(int lDurationVal, out wchar* pbstrVal);
  // property displayView
  /*[id(0x00000B00)]*/ int get_displayView(out wchar* pVal);
  // property displayView
  /*[id(0x00000B00)]*/ int set_displayView(wchar* pVal);
  // property metadataView
  /*[id(0x00000B01)]*/ int get_metadataView(out wchar* pVal);
  // property metadataView
  /*[id(0x00000B01)]*/ int set_metadataView(wchar* pVal);
  // property showSettings
  /*[id(0x00000B02)]*/ int get_showSettings(out short pVal);
  // property showSettings
  /*[id(0x00000B02)]*/ int set_showSettings(short pVal);
  // property showResizeBars
  /*[id(0x00000B03)]*/ int get_showResizeBars(out short pVal);
  // property showResizeBars
  /*[id(0x00000B03)]*/ int set_showResizeBars(short pVal);
  // property showPlaylist
  /*[id(0x00000B04)]*/ int get_showPlaylist(out short pVal);
  // property showPlaylist
  /*[id(0x00000B04)]*/ int set_showPlaylist(short pVal);
  // property showMetadata
  /*[id(0x00000B05)]*/ int get_showMetadata(out short pVal);
  // property showMetadata
  /*[id(0x00000B05)]*/ int set_showMetadata(short pVal);
  // property settingsWidth
  /*[id(0x00000B06)]*/ int get_settingsWidth(out int pVal);
  // property settingsWidth
  /*[id(0x00000B06)]*/ int set_settingsWidth(int pVal);
  // property settingsHeight
  /*[id(0x00000B07)]*/ int get_settingsHeight(out int pVal);
  // property settingsHeight
  /*[id(0x00000B07)]*/ int set_settingsHeight(int pVal);
  // property playlistWidth
  /*[id(0x00000B08)]*/ int get_playlistWidth(out int pVal);
  // property playlistWidth
  /*[id(0x00000B08)]*/ int set_playlistWidth(int pVal);
  // property playlistHeight
  /*[id(0x00000B09)]*/ int get_playlistHeight(out int pVal);
  // property playlistHeight
  /*[id(0x00000B09)]*/ int set_playlistHeight(int pVal);
  // property metadataWidth
  /*[id(0x00000B0A)]*/ int get_metadataWidth(out int pVal);
  // property metadataWidth
  /*[id(0x00000B0A)]*/ int set_metadataWidth(int pVal);
  // property metadataHeight
  /*[id(0x00000B0B)]*/ int get_metadataHeight(out int pVal);
  // property metadataHeight
  /*[id(0x00000B0B)]*/ int set_metadataHeight(int pVal);
  // property fullScreenAvailable
  /*[id(0x00000B0C)]*/ int get_fullScreenAvailable(out short pVal);
  // property fullScreenAvailable
  /*[id(0x00000B0C)]*/ int set_fullScreenAvailable(short pVal);
  // property fullScreenRequest
  /*[id(0x00000B0D)]*/ int get_fullScreenRequest(out short pVal);
  // property fullScreenRequest
  /*[id(0x00000B0D)]*/ int set_fullScreenRequest(short pVal);
  // property quickHide
  /*[id(0x00000B0E)]*/ int get_quickHide(out short pVal);
  // property quickHide
  /*[id(0x00000B0E)]*/ int set_quickHide(short pVal);
  // property displayPreset
  /*[id(0x00000B0F)]*/ int get_displayPreset(out int pVal);
  // property displayPreset
  /*[id(0x00000B0F)]*/ int set_displayPreset(int pVal);
  // property settingsPreset
  /*[id(0x00000B10)]*/ int get_settingsPreset(out int pVal);
  // property settingsPreset
  /*[id(0x00000B10)]*/ int set_settingsPreset(int pVal);
  // property metadataPreset
  /*[id(0x00000B11)]*/ int get_metadataPreset(out int pVal);
  // property metadataPreset
  /*[id(0x00000B11)]*/ int set_metadataPreset(int pVal);
  // property userDisplayView
  /*[id(0x00000B12)]*/ int get_userDisplayView(out wchar* pVal);
  // property userWMPDisplayView
  /*[id(0x00000B13)]*/ int get_userWMPDisplayView(out wchar* pVal);
  // property userDisplayPreset
  /*[id(0x00000B14)]*/ int get_userDisplayPreset(out int pVal);
  // property userWMPDisplayPreset
  /*[id(0x00000B15)]*/ int get_userWMPDisplayPreset(out int pVal);
  // property dynamicRangeControl
  /*[id(0x00000B16)]*/ int get_dynamicRangeControl(out int pVal);
  // property dynamicRangeControl
  /*[id(0x00000B16)]*/ int set_dynamicRangeControl(int pVal);
  // property slowRate
  /*[id(0x00000B17)]*/ int get_slowRate(out float pVal);
  // property slowRate
  /*[id(0x00000B17)]*/ int set_slowRate(float pVal);
  // property fastRate
  /*[id(0x00000B18)]*/ int get_fastRate(out float pVal);
  // property fastRate
  /*[id(0x00000B18)]*/ int set_fastRate(float pVal);
  // property buttonHueShift
  /*[id(0x00000B19)]*/ int get_buttonHueShift(out float pVal);
  // property buttonHueShift
  /*[id(0x00000B19)]*/ int set_buttonHueShift(float pVal);
  // property buttonSaturation
  /*[id(0x00000B1A)]*/ int get_buttonSaturation(out float pVal);
  // property buttonSaturation
  /*[id(0x00000B1A)]*/ int set_buttonSaturation(float pVal);
  // property backHueShift
  /*[id(0x00000B1B)]*/ int get_backHueShift(out float pVal);
  // property backHueShift
  /*[id(0x00000B1B)]*/ int set_backHueShift(float pVal);
  // property backSaturation
  /*[id(0x00000B1C)]*/ int get_backSaturation(out float pVal);
  // property backSaturation
  /*[id(0x00000B1C)]*/ int set_backSaturation(float pVal);
  // property vizRequest
  /*[id(0x00000B1D)]*/ int get_vizRequest(out int pVal);
  // property vizRequest
  /*[id(0x00000B1D)]*/ int set_vizRequest(int pVal);
  // property appColorLight
  /*[id(0x00000B1F)]*/ int get_appColorLight(out wchar* pVal);
  // property appColorMedium
  /*[id(0x00000B20)]*/ int get_appColorMedium(out wchar* pVal);
  // property appColorDark
  /*[id(0x00000B21)]*/ int get_appColorDark(out wchar* pVal);
  // property toolbarButtonHighlight
  /*[id(0x00000B28)]*/ int get_toolbarButtonHighlight(out wchar* pVal);
  // property toolbarButtonShadow
  /*[id(0x00000B29)]*/ int get_toolbarButtonShadow(out wchar* pVal);
  // property toolbarButtonFace
  /*[id(0x00000B2A)]*/ int get_toolbarButtonFace(out wchar* pVal);
  // property itemPlayingColor
  /*[id(0x00000B22)]*/ int get_itemPlayingColor(out wchar* pVal);
  // property itemPlayingBackgroundColor
  /*[id(0x00000B23)]*/ int get_itemPlayingBackgroundColor(out wchar* pVal);
  // property itemErrorColor
  /*[id(0x00000B24)]*/ int get_itemErrorColor(out wchar* pVal);
  // property AppColorLimited
  /*[id(0x00000B25)]*/ int get_appColorLimited(out short pVal);
  // property AppColorBlackBackground
  /*[id(0x00000B26)]*/ int get_appColorBlackBackground(out short pVal);
  // property AppColorBlackBackground
  /*[id(0x00000B26)]*/ int set_appColorBlackBackground(short pVal);
  // property appColorVideoBorder
  /*[id(0x00000B27)]*/ int get_appColorVideoBorder(out wchar* pVal);
  // property appColorVideoBorder
  /*[id(0x00000B27)]*/ int set_appColorVideoBorder(wchar* pVal);
  // auxiliary color
  /*[id(0x00000B35)]*/ int get_appColorAux1(out wchar* pVal);
  // auxiliary color
  /*[id(0x00000B36)]*/ int get_appColorAux2(out wchar* pVal);
  // auxiliary color
  /*[id(0x00000B37)]*/ int get_appColorAux3(out wchar* pVal);
  // auxiliary color
  /*[id(0x00000B38)]*/ int get_appColorAux4(out wchar* pVal);
  // auxiliary color
  /*[id(0x00000B39)]*/ int get_appColorAux5(out wchar* pVal);
  // auxiliary color
  /*[id(0x00000B3A)]*/ int get_appColorAux6(out wchar* pVal);
  // auxiliary color
  /*[id(0x00000B3B)]*/ int get_appColorAux7(out wchar* pVal);
  // auxiliary color
  /*[id(0x00000B3C)]*/ int get_appColorAux8(out wchar* pVal);
  // auxiliary color
  /*[id(0x00000B3D)]*/ int get_appColorAux9(out wchar* pVal);
  // auxiliary color
  /*[id(0x00000B3E)]*/ int get_appColorAux10(out wchar* pVal);
  // auxiliary color
  /*[id(0x00000B3F)]*/ int get_appColorAux11(out wchar* pVal);
  // auxiliary color
  /*[id(0x00000B40)]*/ int get_appColorAux12(out wchar* pVal);
  // auxiliary color
  /*[id(0x00000B41)]*/ int get_appColorAux13(out wchar* pVal);
  // auxiliary color
  /*[id(0x00000B42)]*/ int get_appColorAux14(out wchar* pVal);
  // auxiliary color
  /*[id(0x00000B43)]*/ int get_appColorAux15(out wchar* pVal);
  // status string for remote player (taskbar player)
  /*[id(0x00000B44)]*/ int get_status(out wchar* pVal);
  // status string for remote player (taskbar player)
  /*[id(0x00000B44)]*/ int set_status(wchar* pVal);
  // property userWMPSettingsView
  /*[id(0x00000B2B)]*/ int get_userWMPSettingsView(out wchar* pVal);
  // property userWMPSettingsPreset
  /*[id(0x00000B2C)]*/ int get_userWMPSettingsPreset(out int pVal);
  // property userWMPShowSettings
  /*[id(0x00000B2D)]*/ int get_userWMPShowSettings(out short pVal);
  // property userWMPMetadataView
  /*[id(0x00000B2E)]*/ int get_userWMPMetadataView(out wchar* pVal);
  // property userWMPMetadataPreset
  /*[id(0x00000B2F)]*/ int get_userWMPMetadataPreset(out int pVal);
  // property userWMPShowMetadata
  /*[id(0x00000B30)]*/ int get_userWMPShowMetadata(out short pVal);
  // property captionsHeight
  /*[id(0x00000B31)]*/ int get_captionsHeight(out int pVal);
  // property captionsHeight
  /*[id(0x00000B31)]*/ int set_captionsHeight(int pVal);
  // property snapToVideo
  /*[id(0x00000B32)]*/ int get_snapToVideo(out short pVal);
  // property snapToVideo
  /*[id(0x00000B32)]*/ int set_snapToVideo(short pVal);
  // property pinFullScreenControls
  /*[id(0x00000B33)]*/ int get_pinFullScreenControls(out short pVal);
  // property pinFullScreenControls
  /*[id(0x00000B33)]*/ int set_pinFullScreenControls(short pVal);
}

// IWMPBrandDispatch: Not Public.  Internal interface used by Windows Media Player.
interface IWMPBrandDispatch : IDispatch {
  mixin(uuid("98bb02d4-ed74-43cc-ad6a-45888f2e0dcc"));
  // static DWINGUID IID = { 0x98bb02d4, 0xed74, 0x43cc, 0xad, 0x6a, 0x45, 0x88, 0x8f, 0x2e, 0x0d, 0xcc };
  // property friendlyName
  /*[id(0x00000BDE)]*/ int get_fullServiceName(out wchar* pVal);
  // property friendlyName
  /*[id(0x00000BB8)]*/ int get_friendlyName(out wchar* pVal);
  // property guideButtonText
  /*[id(0x00000BB9)]*/ int get_guideButtonText(out wchar* pVal);
  // property guideButtonTip
  /*[id(0x00000BBA)]*/ int get_guideButtonTip(out wchar* pVal);
  // property guideMenuText
  /*[id(0x00000BBB)]*/ int get_guideMenuText(out wchar* pVal);
  // property guideAccText
  /*[id(0x00000BBC)]*/ int get_guideAccText(out wchar* pVal);
  // property task1ButtonText
  /*[id(0x00000BBD)]*/ int get_task1ButtonText(out wchar* pVal);
  // property task1ButtonTip
  /*[id(0x00000BBE)]*/ int get_task1ButtonTip(out wchar* pVal);
  // property task1MenuText
  /*[id(0x00000BBF)]*/ int get_task1MenuText(out wchar* pVal);
  // property task1AccText
  /*[id(0x00000BC0)]*/ int get_task1AccText(out wchar* pVal);
  // property task2ButtonText
  /*[id(0x00000BC1)]*/ int get_task2ButtonText(out wchar* pVal);
  // property task2ButtonTip
  /*[id(0x00000BC2)]*/ int get_task2ButtonTip(out wchar* pVal);
  // property task2MenuText
  /*[id(0x00000BC3)]*/ int get_task2MenuText(out wchar* pVal);
  // property task2AccText
  /*[id(0x00000BC4)]*/ int get_task2AccText(out wchar* pVal);
  // property task3ButtonText
  /*[id(0x00000BC5)]*/ int get_task3ButtonText(out wchar* pVal);
  // property task3ButtonTip
  /*[id(0x00000BC6)]*/ int get_task3ButtonTip(out wchar* pVal);
  // property task3MenuText
  /*[id(0x00000BC7)]*/ int get_task3MenuText(out wchar* pVal);
  // property task3AccText
  /*[id(0x00000BC8)]*/ int get_task3AccText(out wchar* pVal);
  // property guideUrl
  /*[id(0x00000BC9)]*/ int get_guideUrl(out wchar* pVal);
  // property task1Url
  /*[id(0x00000BCA)]*/ int get_task1Url(out wchar* pVal);
  // property task2Url
  /*[id(0x00000BCB)]*/ int get_task2Url(out wchar* pVal);
  // property task3Url
  /*[id(0x00000BCC)]*/ int get_task3Url(out wchar* pVal);
  // property imageLargeUrl
  /*[id(0x00000BCD)]*/ int get_imageLargeUrl(out wchar* pVal);
  // property imageSmallUrl
  /*[id(0x00000BCE)]*/ int get_imageSmallUrl(out wchar* pVal);
  // property imageMenuUrl
  /*[id(0x00000BCF)]*/ int get_imageMenuUrl(out wchar* pVal);
  // property infoCenterUrl
  /*[id(0x00000BD0)]*/ int get_infoCenterUrl(out wchar* pVal);
  // property albumInfoUrl
  /*[id(0x00000BD1)]*/ int get_albumInfoUrl(out wchar* pVal);
  // property buyCDUrl
  /*[id(0x00000BD2)]*/ int get_buyCDUrl(out wchar* pVal);
  // property htmlViewUrl
  /*[id(0x00000BD3)]*/ int get_htmlViewUrl(out wchar* pVal);
  // property navigateUrl
  /*[id(0x00000BD4)]*/ int get_navigateUrl(out wchar* pVal);
  // property cookieUrl
  /*[id(0x00000BD5)]*/ int get_cookieUrl(out wchar* pVal);
  // property downloadStatusUrl
  /*[id(0x00000BD6)]*/ int get_downloadStatusUrl(out wchar* pVal);
  // property colorPlayer
  /*[id(0x00000BD7)]*/ int get_colorPlayer(out wchar* pVal);
  // property colorPlayerText
  /*[id(0x00000BD8)]*/ int get_colorPlayerText(out wchar* pVal);
  // property navigateDispid
  /*[id(0x00000BD9)]*/ int get_navigateDispid(out int pVal);
  // property navigateParams
  /*[id(0x00000BDA)]*/ int get_navigateParams(out wchar* pVal);
  // property navigatePane
  /*[id(0x00000BDB)]*/ int get_navigatePane(out wchar* pVal);
  // property selectedPane
  /*[id(0x00000BDC)]*/ int get_selectedPane(out wchar* pVal);
  // property selectedPane
  /*[id(0x00000BDC)]*/ int set_selectedPane(wchar* pVal);
  // method setNavigateProps
  /*[id(0x00000BDF)]*/ int setNavigateProps(wchar* bstrPane, int lDispid, wchar* bstrParams);
  // method getMediaParams
  /*[id(0x00000BE0)]*/ int getMediaParams(IUnknown pObject, wchar* bstrURL, out wchar* pbstrResult);
  // property selectedTask
  /*[id(0x00000BDD)]*/ int set_selectedTask(int value);
}

// IWMPNowPlayingHelperDispatch: Not Public.  Internal interface used by Windows Media Player.
interface IWMPNowPlayingHelperDispatch : IDispatch {
  mixin(uuid("504f112e-77cc-4e3c-a073-5371b31d9b36"));
  // static DWINGUID IID = { 0x504f112e, 0x77cc, 0x4e3c, 0xa0, 0x73, 0x53, 0x71, 0xb3, 0x1d, 0x9b, 0x36 };
  // property viewFriendlyName
  /*[id(0x00000B55)]*/ int get_viewFriendlyName(wchar* bstrView, out wchar* pVal);
  // property viewPresetCount
  /*[id(0x00000B56)]*/ int get_viewPresetCount(wchar* bstrView, out int pVal);
  // method viewPresetName
  /*[id(0x00000B57)]*/ int get_viewPresetName(wchar* bstrView, int nPresetIndex, out wchar* pVal);
  // property effectFriendlyName
  /*[id(0x00000B58)]*/ int get_effectFriendlyName(wchar* bstrEffect, out wchar* pVal);
  // method effectPresetName
  /*[id(0x00000B59)]*/ int get_effectPresetName(wchar* bstrEffect, int nPresetIndex, out wchar* pVal);
  // method resolveDisplayView
  /*[id(0x00000B5D)]*/ int resolveDisplayView(short fSafe, out wchar* pbstrVal);
  // method isValidDisplayView
  /*[id(0x00000B5E)]*/ int isValidDisplayView(wchar* bstrView, out short pVal);
  // method getSkinFile
  /*[id(0x00000B5F)]*/ int getSkinFile(out wchar* pVal);
  // method captionsAvailable
  /*[id(0x00000B60)]*/ int get_captionsAvailable(out short pVal);
  // property linkAvailable
  /*[id(0x00000B61)]*/ int get_linkAvailable(out int pVal);
  // property linkRequest
  /*[id(0x00000B62)]*/ int get_linkRequest(out int pVal);
  // property linkRequest
  /*[id(0x00000B62)]*/ int set_linkRequest(int pVal);
  // property linkRequestParams
  /*[id(0x00000B63)]*/ int get_linkRequestParams(out wchar* pVal);
  // property linkRequestParams
  /*[id(0x00000B63)]*/ int set_linkRequestParams(wchar* pVal);
  // property isXPOrBetter
  /*[id(0x00000B64)]*/ int get_isXPOrBetter(out short pVal);
  // method getCurrentArtID
  /*[id(0x00000B65)]*/ int getCurrentArtID(short fLargeArt, out int pVal);
  // method getTimeString
  /*[id(0x00000B66)]*/ int getTimeString(double dTime, out wchar* pVal);
  // method getCurrentScriptCommand
  /*[id(0x00000B67)]*/ int getCurrentScriptCommand(wchar* bstrType, out wchar* pbstrCommand);
  // method calcLayout
  /*[id(0x00000B68)]*/ int calcLayout(int lWidth, int lHeight, short vbCaptions, short vbBanner);
  // method getLayoutSize
  /*[id(0x00000B69)]*/ int getLayoutSize(int nProp, out int plValue);
  // method getRootPlaylist
  /*[id(0x00000B6A)]*/ int getRootPlaylist(IDispatch pPlaylist, out IDispatch ppRootPlaylist);
  // method getHTMLViewURL
  /*[id(0x00000B6B)]*/ int getHTMLViewURL(out wchar* pVal);
  /*[id(0x00000B6C)]*/ int get_canSendLink(out short pCanSendLink);
  /*[id(0x00000B6D)]*/ int sendLink(double dblStartTime, double dblEndTime);
  /*[id(0x00000B6E)]*/ int get_editObj(out IUnknown ppVal);
  /*[id(0x00000B6E)]*/ int set_editObj(IUnknown ppVal);
  // method getStatusString
  /*[id(0x00000B6F)]*/ int getStatusString(wchar* bstrCategory, out wchar* pbstrStatus);
  /*[id(0x00000B70)]*/ int get_notificationString(out wchar* pbstrNotificationString);
  /*[id(0x00000B72)]*/ int get_htmlViewBaseURL(out wchar* pVal);
  /*[id(0x00000B72)]*/ int set_htmlViewBaseURL(wchar* pVal);
  /*[id(0x00000B75)]*/ int get_htmlViewFullURL(out wchar* pVal);
  /*[id(0x00000B75)]*/ int set_htmlViewFullURL(wchar* pVal);
  /*[id(0x00000B71)]*/ int get_htmlViewSecureLock(out int pVal);
  /*[id(0x00000B71)]*/ int set_htmlViewSecureLock(int pVal);
  /*[id(0x00000B73)]*/ int get_htmlViewBusy(out short pVal);
  /*[id(0x00000B73)]*/ int set_htmlViewBusy(short pVal);
  /*[id(0x00000B74)]*/ int get_htmlViewShowCert(out short pVal);
  /*[id(0x00000B74)]*/ int set_htmlViewShowCert(short pVal);
  /*[id(0x00000B76)]*/ int get_previousEnabled(out short pVal);
  /*[id(0x00000B76)]*/ int set_previousEnabled(short pVal);
  /*[id(0x00000B77)]*/ int get_doPreviousNow(out short pVal);
  /*[id(0x00000B77)]*/ int set_doPreviousNow(short pVal);
  /*[id(0x00000B78)]*/ int get_DPI(out int pVal);
  // clear all user color info
  /*[id(0x00000B79)]*/ int clearColors();
}

// IWMPButtonCtrlEvents: Public interface for skin object model.
interface IWMPButtonCtrlEvents : IDispatch {
  mixin(uuid("bb17fff7-1692-4555-918a-6af7bfacedd2"));
  // static DWINGUID IID = { 0xbb17fff7, 0x1692, 0x4555, 0x91, 0x8a, 0x6a, 0xf7, 0xbf, 0xac, 0xed, 0xd2 };
  /+// event ondragbegin
  /*[id(0x00001400)]*/ int onclick();+/
}

// IWMPButtonCtrl: Public interface for skin object model.
interface IWMPButtonCtrl : IDispatch {
  mixin(uuid("87291b50-0c8e-11d3-bb2a-00a0c93ca73a"));
  // static DWINGUID IID = { 0x87291b50, 0x0c8e, 0x11d3, 0xbb, 0x2a, 0x00, 0xa0, 0xc9, 0x3c, 0xa7, 0x3a };
  /*[id(0x000013EE)]*/ int get_image(out wchar* pVal);
  /*[id(0x000013EE)]*/ int set_image(wchar* pVal);
  /*[id(0x000013EF)]*/ int get_hoverImage(out wchar* pVal);
  /*[id(0x000013EF)]*/ int set_hoverImage(wchar* pVal);
  /*[id(0x000013F0)]*/ int get_downImage(out wchar* pVal);
  /*[id(0x000013F0)]*/ int set_downImage(wchar* pVal);
  /*[id(0x000013F1)]*/ int get_disabledImage(out wchar* pVal);
  /*[id(0x000013F1)]*/ int set_disabledImage(wchar* pVal);
  /*[id(0x000013F2)]*/ int get_hoverDownImage(out wchar* pVal);
  /*[id(0x000013F2)]*/ int set_hoverDownImage(wchar* pVal);
  /*[id(0x000013F3)]*/ int get_tiled(out short pVal);
  /*[id(0x000013F3)]*/ int set_tiled(short pVal);
  /*[id(0x000013F4)]*/ int get_transparencyColor(out wchar* pVal);
  /*[id(0x000013F4)]*/ int set_transparencyColor(wchar* pVal);
  /*[id(0x000013F5)]*/ int get_down(out short pVal);
  /*[id(0x000013F5)]*/ int set_down(short pVal);
  /*[id(0x000013F6)]*/ int get_sticky(out short pVal);
  /*[id(0x000013F6)]*/ int set_sticky(short pVal);
  /*[id(0x000013F8)]*/ int get_upToolTip(out wchar* pVal);
  /*[id(0x000013F8)]*/ int set_upToolTip(wchar* pVal);
  /*[id(0x000013F9)]*/ int get_downToolTip(out wchar* pVal);
  /*[id(0x000013F9)]*/ int set_downToolTip(wchar* pVal);
  /*[id(0x000013FA)]*/ int get_cursor(out wchar* pVal);
  /*[id(0x000013FA)]*/ int set_cursor(wchar* pVal);
}

// IWMPListBoxCtrl: Public interface for skin object model.
interface IWMPListBoxCtrl : IDispatch {
  mixin(uuid("fc1880ce-83b9-43a7-a066-c44ce8c82583"));
  // static DWINGUID IID = { 0xfc1880ce, 0x83b9, 0x43a7, 0xa0, 0x66, 0xc4, 0x4c, 0xe8, 0xc8, 0x25, 0x83 };
  /*[id(0x000017DC)]*/ int get_selectedItem(out int pnPos);
  /*[id(0x000017DC)]*/ int set_selectedItem(int pnPos);
  /*[id(0x000017D4)]*/ int get_sorted(out short pVal);
  /*[id(0x000017D4)]*/ int set_sorted(short pVal);
  /*[id(0x000017D5)]*/ int get_multiselect(out short pVal);
  /*[id(0x000017D5)]*/ int set_multiselect(short pVal);
  /*[id(0x000017D6)]*/ int get_readOnly(out short pVal);
  /*[id(0x000017D6)]*/ int set_readOnly(short pVal);
  /*[id(0x000017D7)]*/ int get_foregroundColor(out wchar* pVal);
  /*[id(0x000017D7)]*/ int set_foregroundColor(wchar* pVal);
  /*[id(0x000017D8)]*/ int get_backgroundColor(out wchar* pVal);
  /*[id(0x000017D8)]*/ int set_backgroundColor(wchar* pVal);
  /*[id(0x000017D9)]*/ int get_fontSize(out int pVal);
  /*[id(0x000017D9)]*/ int set_fontSize(int pVal);
  /*[id(0x000017DA)]*/ int get_fontStyle(out wchar* pVal);
  /*[id(0x000017DA)]*/ int set_fontStyle(wchar* pVal);
  /*[id(0x000017DB)]*/ int get_fontFace(out wchar* pVal);
  /*[id(0x000017DB)]*/ int set_fontFace(wchar* pVal);
  /*[id(0x000017DD)]*/ int get_itemCount(out int pVal);
  /*[id(0x000017DE)]*/ int get_firstVisibleItem(out int pVal);
  /*[id(0x000017DE)]*/ int set_firstVisibleItem(int pVal);
  /*[id(0x000017E8)]*/ int set_popUp(short value);
  /*[id(0x000017E9)]*/ int get_focusItem(out int pVal);
  /*[id(0x000017E9)]*/ int set_focusItem(int pVal);
  /*[id(0x000017ED)]*/ int get_border(out short pVal);
  /*[id(0x000017ED)]*/ int set_border(short pVal);
  // method getItem
  /*[id(0x000017DF)]*/ int getItem(int nPos, out wchar* pVal);
  // method insertItem
  /*[id(0x000017E0)]*/ int insertItem(int nPos, wchar* newVal);
  // method appendItem
  /*[id(0x000017E1)]*/ int appendItem(wchar* newVal);
  // method replaceItem
  /*[id(0x000017E2)]*/ int replaceItem(int nPos, wchar* newVal);
  // method deleteItem
  /*[id(0x000017E3)]*/ int deleteItem(int nPos);
  // method deleteAll
  /*[id(0x000017E4)]*/ int deleteAll();
  // method findItem
  /*[id(0x000017E5)]*/ int findItem(int nStartIndex, wchar* newVal, out int pnPos);
  // method getNextSelectedItem
  /*[id(0x000017E6)]*/ int getNextSelectedItem(int nStartIndex, out int pnSelected);
  // method setSelectedState
  /*[id(0x000017EA)]*/ int setSelectedState(int nPos, short vbSelected);
  // method show
  /*[id(0x000017EB)]*/ int show();
  // method dismiss
  /*[id(0x000017EC)]*/ int dismiss();
}

// IWMPListBoxItem: Public interface for skin object model.
interface IWMPListBoxItem : IDispatch {
  mixin(uuid("d255dfb8-c22a-42cf-b8b7-f15d7bcf65d6"));
  // static DWINGUID IID = { 0xd255dfb8, 0xc22a, 0x42cf, 0xb8, 0xb7, 0xf1, 0x5d, 0x7b, 0xcf, 0x65, 0xd6 };
  // property value
  /*[id(0x000017E7)]*/ int set_value(wchar* value);
}

// IWMPPlaylistCtrlColumn: Public interface for skin object model.
interface IWMPPlaylistCtrlColumn : IDispatch {
  mixin(uuid("63d9d30f-ae4c-4678-8ca8-5720f4fe4419"));
  // static DWINGUID IID = { 0x63d9d30f, 0xae4c, 0x4678, 0x8c, 0xa8, 0x57, 0x20, 0xf4, 0xfe, 0x44, 0x19 };
  // property columnName
  /*[id(0x00001626)]*/ int get_columnName(out wchar* pVal);
  // property columnName
  /*[id(0x00001626)]*/ int set_columnName(wchar* pVal);
  // property columnID
  /*[id(0x00001627)]*/ int get_columnID(out wchar* pVal);
  // property columnID
  /*[id(0x00001627)]*/ int set_columnID(wchar* pVal);
  // property columnResizeMode
  /*[id(0x00001628)]*/ int get_columnResizeMode(out wchar* pVal);
  // property columnResizeMode
  /*[id(0x00001628)]*/ int set_columnResizeMode(wchar* pVal);
  // property columnWidth
  /*[id(0x00001629)]*/ int get_columnWidth(out int pVal);
  // property columnWidth
  /*[id(0x00001629)]*/ int set_columnWidth(int pVal);
}

// IWMPSliderCtrlEvents: Public interface for skin object model.
interface IWMPSliderCtrlEvents : IDispatch {
  mixin(uuid("cdac14d2-8be4-11d3-bb48-00a0c93ca73a"));
  // static DWINGUID IID = { 0xcdac14d2, 0x8be4, 0x11d3, 0xbb, 0x48, 0x00, 0xa0, 0xc9, 0x3c, 0xa7, 0x3a };
  /+// event ondragbegin
  /*[id(0x00001536)]*/ int ondragbegin();+/
  /+// event ondragend
  /*[id(0x00001537)]*/ int ondragend();+/
  /+// event onpositionchange
  /*[id(0x00001538)]*/ int onpositionchange();+/
}

// IWMPSliderCtrl: Public interface for skin object model.
interface IWMPSliderCtrl : IDispatch {
  mixin(uuid("f2bf2c8f-405f-11d3-bb39-00a0c93ca73a"));
  // static DWINGUID IID = { 0xf2bf2c8f, 0x405f, 0x11d3, 0xbb, 0x39, 0x00, 0xa0, 0xc9, 0x3c, 0xa7, 0x3a };
  // property direction
  /*[id(0x00001518)]*/ int get_direction(out wchar* pVal);
  // property direction
  /*[id(0x00001518)]*/ int set_direction(wchar* pVal);
  // property slide
  /*[id(0x0000151A)]*/ int get_slide(out short pVal);
  // property slide
  /*[id(0x0000151A)]*/ int set_slide(short pVal);
  // property tiled
  /*[id(0x0000151B)]*/ int get_tiled(out short pVal);
  // property tiled
  /*[id(0x0000151B)]*/ int set_tiled(short pVal);
  // property foregroundColor
  /*[id(0x0000151C)]*/ int get_foregroundColor(out wchar* pVal);
  // property foregroundColor
  /*[id(0x0000151C)]*/ int set_foregroundColor(wchar* pVal);
  // property foregroundEndColor
  /*[id(0x0000151D)]*/ int get_foregroundEndColor(out wchar* pVal);
  // property foregroundEndColor
  /*[id(0x0000151D)]*/ int set_foregroundEndColor(wchar* pVal);
  // property backgroundColor
  /*[id(0x0000151E)]*/ int get_backgroundColor(out wchar* pVal);
  // property backgroundColor
  /*[id(0x0000151E)]*/ int set_backgroundColor(wchar* pVal);
  // property backgroundEndColor
  /*[id(0x0000151F)]*/ int get_backgroundEndColor(out wchar* pVal);
  // property backgroundEndColor
  /*[id(0x0000151F)]*/ int set_backgroundEndColor(wchar* pVal);
  // property disabledColor
  /*[id(0x00001520)]*/ int get_disabledColor(out wchar* pVal);
  // property disabledColor
  /*[id(0x00001520)]*/ int set_disabledColor(wchar* pVal);
  // property transparencyColor
  /*[id(0x00001521)]*/ int get_transparencyColor(out wchar* pVal);
  // property transparencyColor
  /*[id(0x00001521)]*/ int set_transparencyColor(wchar* pVal);
  // property foregroundImage
  /*[id(0x00001522)]*/ int get_foregroundImage(out wchar* pVal);
  // property foregroundImage
  /*[id(0x00001522)]*/ int set_foregroundImage(wchar* pVal);
  // property backgroundImage
  /*[id(0x00001523)]*/ int get_backgroundImage(out wchar* pVal);
  // property backgroundImage
  /*[id(0x00001523)]*/ int set_backgroundImage(wchar* pVal);
  // property backgroundHoverImage
  /*[id(0x00001524)]*/ int get_backgroundHoverImage(out wchar* pVal);
  // property backgroundHoverImage
  /*[id(0x00001524)]*/ int set_backgroundHoverImage(wchar* pVal);
  // property disabledImage
  /*[id(0x00001525)]*/ int get_disabledImage(out wchar* pVal);
  // property disabledImage
  /*[id(0x00001525)]*/ int set_disabledImage(wchar* pVal);
  // property thumbImage
  /*[id(0x00001526)]*/ int get_thumbImage(out wchar* pVal);
  // property thumbImage
  /*[id(0x00001526)]*/ int set_thumbImage(wchar* pVal);
  // property thumbHoverImage
  /*[id(0x00001527)]*/ int get_thumbHoverImage(out wchar* pVal);
  // property thumbHoverImage
  /*[id(0x00001527)]*/ int set_thumbHoverImage(wchar* pVal);
  // property thumbDownImage
  /*[id(0x00001528)]*/ int get_thumbDownImage(out wchar* pVal);
  // property thumbDownImage
  /*[id(0x00001528)]*/ int set_thumbDownImage(wchar* pVal);
  // property thumbDisabledImage
  /*[id(0x00001529)]*/ int get_thumbDisabledImage(out wchar* pVal);
  // property thumbDisabledImage
  /*[id(0x00001529)]*/ int set_thumbDisabledImage(wchar* pVal);
  // property min
  /*[id(0x0000152A)]*/ int get_min(out float pVal);
  // property min
  /*[id(0x0000152A)]*/ int set_min(float pVal);
  // property max
  /*[id(0x0000152B)]*/ int get_max(out float pVal);
  // property max
  /*[id(0x0000152B)]*/ int set_max(float pVal);
  // property value
  /*[id(0x0000152C)]*/ int get_value(out float pVal);
  // property value
  /*[id(0x0000152C)]*/ int set_value(float pVal);
  // property toolTip
  /*[id(0x0000152D)]*/ int get_toolTip(out wchar* pVal);
  // property toolTip
  /*[id(0x0000152D)]*/ int set_toolTip(wchar* pVal);
  // property cursor
  /*[id(0x0000152E)]*/ int get_cursor(out wchar* pVal);
  // property cursor
  /*[id(0x0000152E)]*/ int set_cursor(wchar* pVal);
  // property borderSize
  /*[id(0x0000152F)]*/ int get_borderSize(out int pVal);
  // property borderSize
  /*[id(0x0000152F)]*/ int set_borderSize(int pVal);
  // property foregroundHoverImage
  /*[id(0x00001530)]*/ int get_foregroundHoverImage(out wchar* pVal);
  // property foregroundHoverImage
  /*[id(0x00001530)]*/ int set_foregroundHoverImage(wchar* pVal);
  // property foregroundValue
  /*[id(0x00001531)]*/ int get_foregroundProgress(out float pVal);
  // property foregroundValue
  /*[id(0x00001531)]*/ int set_foregroundProgress(float pVal);
  // property useForegroundValue
  /*[id(0x00001532)]*/ int get_useForegroundProgress(out short pVal);
  // property useForegroundValue
  /*[id(0x00001532)]*/ int set_useForegroundProgress(short pVal);
}

// IWMPVideoCtrlEvents: Public interface for skin object model.
interface IWMPVideoCtrlEvents : IDispatch {
  mixin(uuid("a85c0477-714c-4a06-b9f6-7c8ca38b45dc"));
  // static DWINGUID IID = { 0xa85c0477, 0x714c, 0x4a06, 0xb9, 0xf6, 0x7c, 0x8c, 0xa3, 0x8b, 0x45, 0xdc };
  /+// event onvideostart
  /*[id(0x00001658)]*/ int onvideostart();+/
  /+// event onvideostart
  /*[id(0x00001659)]*/ int onvideoend();+/
}

// IWMPVideoCtrl: Public interface for skin object model.
interface IWMPVideoCtrl : IDispatch {
  mixin(uuid("61cecf10-fc3a-11d2-a1cd-005004602752"));
  // static DWINGUID IID = { 0x61cecf10, 0xfc3a, 0x11d2, 0xa1, 0xcd, 0x00, 0x50, 0x04, 0x60, 0x27, 0x52 };
  /*[id(0x00001644)]*/ int set_windowless(short pbClipped);
  /*[id(0x00001644)]*/ int get_windowless(out short pbClipped);
  /*[id(0x00001645)]*/ int set_cursor(wchar* pbstrCursor);
  /*[id(0x00001645)]*/ int get_cursor(out wchar* pbstrCursor);
  /*[id(0x00001646)]*/ int set_backgroundColor(wchar* pbstrColor);
  /*[id(0x00001646)]*/ int get_backgroundColor(out wchar* pbstrColor);
  /*[id(0x00001648)]*/ int set_maintainAspectRatio(short pbMaintainAspectRatio);
  /*[id(0x00001648)]*/ int get_maintainAspectRatio(out short pbMaintainAspectRatio);
  /*[id(0x0000164A)]*/ int set_toolTip(wchar* bstrToolTip);
  /*[id(0x0000164A)]*/ int get_toolTip(out wchar* bstrToolTip);
  /*[id(0x0000164B)]*/ int get_fullScreen(out short pbFullScreen);
  /*[id(0x0000164B)]*/ int set_fullScreen(short pbFullScreen);
  /*[id(0x00001647)]*/ int set_shrinkToFit(short pbShrinkToFit);
  /*[id(0x00001647)]*/ int get_shrinkToFit(out short pbShrinkToFit);
  /*[id(0x0000164C)]*/ int set_stretchToFit(short pbStretchToFit);
  /*[id(0x0000164C)]*/ int get_stretchToFit(out short pbStretchToFit);
  /*[id(0x0000164D)]*/ int set_zoom(int pzoom);
  /*[id(0x0000164D)]*/ int get_zoom(out int pzoom);
}

// IWMPEffectsCtrl: Public interface for skin object model.
interface IWMPEffectsCtrl : IDispatch {
  mixin(uuid("a9efab80-0a60-4c3f-bbd1-4558dd2a9769"));
  // static DWINGUID IID = { 0xa9efab80, 0x0a60, 0x4c3f, 0xbb, 0xd1, 0x45, 0x58, 0xdd, 0x2a, 0x97, 0x69 };
  // property windowed
  /*[id(0x0000157C)]*/ int get_windowed(out short pVal);
  // property windowed
  /*[id(0x0000157C)]*/ int set_windowed(short pVal);
  // property allowAll
  /*[id(0x0000157D)]*/ int get_allowAll(out short pVal);
  // property allowAll
  /*[id(0x0000157D)]*/ int set_allowAll(short pVal);
  // property currentEffectType
  /*[id(0x00001583)]*/ int set_currentEffectType(wchar* pVal);
  // property currentEffectType
  /*[id(0x00001583)]*/ int get_currentEffectType(out wchar* pVal);
  // property currentEffectTitle
  /*[id(0x00001582)]*/ int get_currentEffectTitle(out wchar* pVal);
  // method next
  /*[id(0x0000157E)]*/ int next();
  // method previous
  /*[id(0x0000157F)]*/ int previous();
  // method settings
  /*[id(0x00001580)]*/ int settings();
  // property currentEffect
  /*[id(0x00001581)]*/ int get_currentEffect(out IDispatch p);
  // property currentEffect
  /*[id(0x00001581)]*/ int set_currentEffect(IDispatch p);
  // method nextEffect
  /*[id(0x00001585)]*/ int nextEffect();
  // method previousEffect
  /*[id(0x00001586)]*/ int previousEffect();
  // method nextPreset
  /*[id(0x00001587)]*/ int nextPreset();
  // method previousPreset
  /*[id(0x00001588)]*/ int previousPreset();
  // property currentPreset
  /*[id(0x00001589)]*/ int get_currentPreset(out int pVal);
  // property currentPreset
  /*[id(0x00001589)]*/ int set_currentPreset(int pVal);
  // property currentPresetTitle
  /*[id(0x0000158A)]*/ int get_currentPresetTitle(out wchar* pVal);
  // property currentEffectPresetCount
  /*[id(0x0000158B)]*/ int get_currentEffectPresetCount(out int pVal);
  // property fullScreen
  /*[id(0x0000158C)]*/ int get_fullScreen(out short pbFullScreen);
  // property fullScreen
  /*[id(0x0000158C)]*/ int set_fullScreen(short pbFullScreen);
  // property canGoFullScreen
  /*[id(0x0000158D)]*/ int get_effectCanGoFullScreen(out short pbFullScreen);
  // property canGoFullScreen
  /*[id(0x0000158E)]*/ int get_effectHasPropertyPage(out short pbPropertyPage);
  // property effectCount
  /*[id(0x00001590)]*/ int get_effectCount(out int pVal);
  // property effectTitle(index)
  /*[id(0x00001591)]*/ int get_effectTitle(int index, out wchar* pVal);
  // property effectType(index)
  /*[id(0x00001592)]*/ int get_effectType(int index, out wchar* pVal);
}

// IWMPEqualizerSettingsCtrl: Public interface for skin object model.
interface IWMPEqualizerSettingsCtrl : IDispatch {
  mixin(uuid("2bd3716f-a914-49fb-8655-996d5f495498"));
  // static DWINGUID IID = { 0x2bd3716f, 0xa914, 0x49fb, 0x86, 0x55, 0x99, 0x6d, 0x5f, 0x49, 0x54, 0x98 };
  // property bypass
  /*[id(0x000016A8)]*/ int get_bypass(out short pVal);
  // property bypass
  /*[id(0x000016A8)]*/ int set_bypass(short pVal);
  // property gainLevel1
  /*[id(0x000016AC)]*/ int get_gainLevel1(out float pflLevel);
  // property gainLevel1
  /*[id(0x000016AC)]*/ int set_gainLevel1(float pflLevel);
  // property gainLevel2
  /*[id(0x000016AD)]*/ int get_gainLevel2(out float pflLevel);
  // property gainLevel2
  /*[id(0x000016AD)]*/ int set_gainLevel2(float pflLevel);
  // property gainLevel3
  /*[id(0x000016AE)]*/ int get_gainLevel3(out float pflLevel);
  // property gainLevel3
  /*[id(0x000016AE)]*/ int set_gainLevel3(float pflLevel);
  // property gainLevel4
  /*[id(0x000016AF)]*/ int get_gainLevel4(out float pflLevel);
  // property gainLevel4
  /*[id(0x000016AF)]*/ int set_gainLevel4(float pflLevel);
  // property gainLevel5
  /*[id(0x000016B0)]*/ int get_gainLevel5(out float pflLevel);
  // property gainLevel5
  /*[id(0x000016B0)]*/ int set_gainLevel5(float pflLevel);
  // property gainLevel6
  /*[id(0x000016B1)]*/ int get_gainLevel6(out float pflLevel);
  // property gainLevel6
  /*[id(0x000016B1)]*/ int set_gainLevel6(float pflLevel);
  // property gainLevel7
  /*[id(0x000016B2)]*/ int get_gainLevel7(out float pflLevel);
  // property gainLevel7
  /*[id(0x000016B2)]*/ int set_gainLevel7(float pflLevel);
  // property gainLevel8
  /*[id(0x000016B3)]*/ int get_gainLevel8(out float pflLevel);
  // property gainLevel8
  /*[id(0x000016B3)]*/ int set_gainLevel8(float pflLevel);
  // property gainLevel9
  /*[id(0x000016B4)]*/ int get_gainLevel9(out float pflLevel);
  // property gainLevel9
  /*[id(0x000016B4)]*/ int set_gainLevel9(float pflLevel);
  // property gainLevel10
  /*[id(0x000016B5)]*/ int get_gainLevel10(out float pflLevel);
  // property gainLevel10
  /*[id(0x000016B5)]*/ int set_gainLevel10(float pflLevel);
  // property gainLevels
  /*[id(0x000016B7)]*/ int get_gainLevels(int iIndex, out float pflLevel);
  // property gainLevels
  /*[id(0x000016B7)]*/ int set_gainLevels(int iIndex, float pflLevel);
  // method reset
  /*[id(0x000016B6)]*/ int reset();
  /*[id(0x000016A9)]*/ int get_bands(out int pbands);
  // method nextPreset
  /*[id(0x000016B8)]*/ int nextPreset();
  // method previousPreset
  /*[id(0x000016B9)]*/ int previousPreset();
  // property currentPreset
  /*[id(0x000016BA)]*/ int get_currentPreset(out int pVal);
  // property currentPreset
  /*[id(0x000016BA)]*/ int set_currentPreset(int pVal);
  // property currentPresetTitle
  /*[id(0x000016BB)]*/ int get_currentPresetTitle(out wchar* pVal);
  // property presetCount
  /*[id(0x000016BC)]*/ int get_presetCount(out int pVal);
  // property enhancedAudio
  /*[id(0x000016BD)]*/ int get_enhancedAudio(out short pfVal);
  // property enhancedAudio
  /*[id(0x000016BD)]*/ int set_enhancedAudio(short pfVal);
  // property speakerSize
  /*[id(0x000016BE)]*/ int get_speakerSize(out int plVal);
  // property speakerSize
  /*[id(0x000016BE)]*/ int set_speakerSize(int plVal);
  // property currentSpeakerName
  /*[id(0x000016BF)]*/ int get_currentSpeakerName(out wchar* pbstrName);
  // property truBassLevel
  /*[id(0x000016C0)]*/ int get_truBassLevel(out int plTruBassLevel);
  // property truBassLevel
  /*[id(0x000016C0)]*/ int set_truBassLevel(int plTruBassLevel);
  // property wowLevel
  /*[id(0x000016C1)]*/ int get_wowLevel(out int plWowLevel);
  // property wowLevel
  /*[id(0x000016C1)]*/ int set_wowLevel(int plWowLevel);
  // property splineTension
  /*[id(0x000016C3)]*/ int get_splineTension(out float pflSplineTension);
  // property splineTension
  /*[id(0x000016C3)]*/ int set_splineTension(float pflSplineTension);
  // property enableSplineTension
  /*[id(0x000016C2)]*/ int get_enableSplineTension(out short pfEnableSplineTension);
  // property enableSplineTension
  /*[id(0x000016C2)]*/ int set_enableSplineTension(short pfEnableSplineTension);
  // property presetTitle
  /*[id(0x000016C4)]*/ int get_presetTitle(int iIndex, out wchar* pVal);
  // property normalization
  /*[id(0x000016C5)]*/ int get_normalization(out short pfVal);
  // property normalization
  /*[id(0x000016C5)]*/ int set_normalization(short pfVal);
  // property normalizationAverage
  /*[id(0x000016C6)]*/ int get_normalizationAverage(out float pflAverage);
  // property normalizationPeak
  /*[id(0x000016C7)]*/ int get_normalizationPeak(out float pflPeak);
  // property crossFade
  /*[id(0x000016C8)]*/ int get_crossFade(out short pfVal);
  // property crossFade
  /*[id(0x000016C8)]*/ int set_crossFade(short pfVal);
  // property crossFadeWindow
  /*[id(0x000016C9)]*/ int get_crossFadeWindow(out int plWindow);
  // property crossFadeWindow
  /*[id(0x000016C9)]*/ int set_crossFadeWindow(int plWindow);
}

// IWMPVideoSettingsCtrl: Public interface for skin object model.
interface IWMPVideoSettingsCtrl : IDispatch {
  mixin(uuid("07ec23da-ef73-4bde-a40f-f269e0b7afd6"));
  // static DWINGUID IID = { 0x07ec23da, 0xef73, 0x4bde, 0xa4, 0x0f, 0xf2, 0x69, 0xe0, 0xb7, 0xaf, 0xd6 };
  // property brightness
  /*[id(0x0000170C)]*/ int get_brightness(out int pVal);
  // property brightness
  /*[id(0x0000170C)]*/ int set_brightness(int pVal);
  // property contrast
  /*[id(0x0000170D)]*/ int get_contrast(out int pVal);
  // property contrast
  /*[id(0x0000170D)]*/ int set_contrast(int pVal);
  // property hue
  /*[id(0x0000170E)]*/ int get_hue(out int pVal);
  // property hue
  /*[id(0x0000170E)]*/ int set_hue(int pVal);
  // property saturation
  /*[id(0x0000170F)]*/ int get_saturation(out int pVal);
  // property saturation
  /*[id(0x0000170F)]*/ int set_saturation(int pVal);
  // method reset
  /*[id(0x00001710)]*/ int reset();
}

// IWMPLibraryTreeCtrl: Not Public.  Internal interface used by Windows Media Player.
interface IWMPLibraryTreeCtrl : IDispatch {
  mixin(uuid("b738fcae-f089-45df-aed6-034b9e7db632"));
  // static DWINGUID IID = { 0xb738fcae, 0xf089, 0x45df, 0xae, 0xd6, 0x03, 0x4b, 0x9e, 0x7d, 0xb6, 0x32 };
  // property dropDownVisible
  /*[id(0x00001901)]*/ int get_dropDownVisible(out short pVal);
  // property dropDownVisible
  /*[id(0x00001901)]*/ int set_dropDownVisible(short pVal);
  // property foregroundColor
  /*[id(0x00001902)]*/ int get_foregroundColor(out wchar* pVal);
  // property foregroundColor
  /*[id(0x00001902)]*/ int set_foregroundColor(wchar* pVal);
  // property backgroundColor
  /*[id(0x00001903)]*/ int get_backgroundColor(out wchar* pVal);
  // property backgroundColor
  /*[id(0x00001903)]*/ int set_backgroundColor(wchar* pVal);
  // property fontSize
  /*[id(0x00001904)]*/ int get_fontSize(out int pVal);
  // property fontSize
  /*[id(0x00001904)]*/ int set_fontSize(int pVal);
  // property fontStyle
  /*[id(0x00001905)]*/ int get_fontStyle(out wchar* pVal);
  // property fontStyle
  /*[id(0x00001905)]*/ int set_fontStyle(wchar* pVal);
  // property fontFace
  /*[id(0x00001906)]*/ int get_fontFace(out wchar* pVal);
  // property fontFace
  /*[id(0x00001906)]*/ int set_fontFace(wchar* pVal);
  // property filter
  /*[id(0x00001907)]*/ int get_filter(out wchar* pVal);
  // property filter
  /*[id(0x00001907)]*/ int set_filter(wchar* pVal);
  // property expandState
  /*[id(0x00001908)]*/ int get_expandState(out wchar* pVal);
  // property expandState
  /*[id(0x00001908)]*/ int set_expandState(wchar* pVal);
  // property playlist
  /*[id(0x00001909)]*/ int get_Playlist(out IWMPPlaylist ppPlaylist);
  // property playlist
  /*[id(0x00001909)]*/ int set_Playlist(IWMPPlaylist ppPlaylist);
  // property selectedPlaylist
  /*[id(0x0000190A)]*/ int get_selectedPlaylist(out IWMPPlaylist ppPlaylist);
  // property selectedMedia
  /*[id(0x0000190B)]*/ int get_selectedMedia(out IWMPMedia ppMedia);
}

// IWMPEditCtrl: Public interface for skin object model.
interface IWMPEditCtrl : IDispatch {
  mixin(uuid("70e1217c-c617-4cfd-bd8a-69ca2043e70b"));
  // static DWINGUID IID = { 0x70e1217c, 0xc617, 0x4cfd, 0xbd, 0x8a, 0x69, 0xca, 0x20, 0x43, 0xe7, 0x0b };
  // property value
  /*[id(0x00000000)]*/ int get_value(out wchar* pVal);
  // property value
  /*[id(0x00000000)]*/ int set_value(wchar* pVal);
  // property border
  /*[id(0x00001770)]*/ int get_border(out short pVal);
  // property border
  /*[id(0x00001770)]*/ int set_border(short pVal);
  // property justification
  /*[id(0x00001771)]*/ int get_justification(out wchar* pVal);
  // property justification
  /*[id(0x00001771)]*/ int set_justification(wchar* pVal);
  // property editStyle
  /*[id(0x00001772)]*/ int get_editStyle(out wchar* pVal);
  // property editStyle
  /*[id(0x00001772)]*/ int set_editStyle(wchar* pVal);
  // property wordWrap
  /*[id(0x00001773)]*/ int get_wordWrap(out short pVal);
  // property wordWrap
  /*[id(0x00001773)]*/ int set_wordWrap(short pVal);
  // property readOnly
  /*[id(0x00001774)]*/ int get_readOnly(out short pVal);
  // property readOnly
  /*[id(0x00001774)]*/ int set_readOnly(short pVal);
  // property foregroundColor
  /*[id(0x00001775)]*/ int get_foregroundColor(out wchar* pVal);
  // property foregroundColor
  /*[id(0x00001775)]*/ int set_foregroundColor(wchar* pVal);
  // property backgroundColor
  /*[id(0x00001776)]*/ int get_backgroundColor(out wchar* pVal);
  // property backgroundColor
  /*[id(0x00001776)]*/ int set_backgroundColor(wchar* pVal);
  // property fontSize
  /*[id(0x00001777)]*/ int get_fontSize(out int pVal);
  // property fontSize
  /*[id(0x00001777)]*/ int set_fontSize(int pVal);
  // property fontStyle
  /*[id(0x00001778)]*/ int get_fontStyle(out wchar* pVal);
  // property fontStyle
  /*[id(0x00001778)]*/ int set_fontStyle(wchar* pVal);
  // property fontFace
  /*[id(0x00001779)]*/ int get_fontFace(out wchar* pVal);
  // property fontFace
  /*[id(0x00001779)]*/ int set_fontFace(wchar* pVal);
  // property textLimit
  /*[id(0x0000177A)]*/ int get_textLimit(out int pVal);
  // property textLimit
  /*[id(0x0000177A)]*/ int set_textLimit(int pVal);
  // property lineCount
  /*[id(0x0000177B)]*/ int get_lineCount(out int pVal);
  // method getLine
  /*[id(0x0000177C)]*/ int getLine(int nIndex, out wchar* pVal);
  // method getSelectionStart
  /*[id(0x0000177D)]*/ int getSelectionStart(out int pnStart);
  // method getSelectionEnd
  /*[id(0x0000177E)]*/ int getSelectionEnd(out int pnEnd);
  // method setSelection
  /*[id(0x0000177F)]*/ int setSelection(int nStart, int nEnd);
  // method replaceSelection
  /*[id(0x00001780)]*/ int replaceSelection(wchar* newVal);
  // method getLineIndex
  /*[id(0x00001781)]*/ int getLineIndex(int nIndex, out int pnPosition);
  // method getLineFromChar
  /*[id(0x00001782)]*/ int getLineFromChar(int nPosition, out int pnLine);
}

// IWMPPluginUIHost: Not Public.  Internal interface used by Windows Media Player.
interface IWMPPluginUIHost : IDispatch {
  mixin(uuid("5d0ad945-289e-45c5-a9c6-f301f0152108"));
  // static DWINGUID IID = { 0x5d0ad945, 0x289e, 0x45c5, 0xa9, 0xc6, 0xf3, 0x01, 0xf0, 0x15, 0x21, 0x08 };
  // property backgroundColor
  /*[id(0x00001839)]*/ int get_backgroundColor(out wchar* pVal);
  // property backgroundColor
  /*[id(0x00001839)]*/ int set_backgroundColor(wchar* pVal);
  // property objectID
  /*[id(0x0000183A)]*/ int get_objectID(out wchar* pVal);
  // property objectID
  /*[id(0x0000183A)]*/ int set_objectID(wchar* pVal);
  // method getProperty
  /*[id(0x0000183B)]*/ int getProperty(wchar* bstrName, out DWINVARIANT pVal);
  // method setProperty
  /*[id(0x0000183C)]*/ int setProperty(wchar* bstrName, DWINVARIANT newVal);
}

// IWMPMenuCtrl: Not Public.  Internal interface used by Windows Media Player.
interface IWMPMenuCtrl : IDispatch {
  mixin(uuid("158a7adc-33da-4039-a553-bddbbe389f5c"));
  // static DWINGUID IID = { 0x158a7adc, 0x33da, 0x4039, 0xa5, 0x53, 0xbd, 0xdb, 0xbe, 0x38, 0x9f, 0x5c };
  // method deleteAllItems
  /*[id(0x0000189D)]*/ int deleteAllItems();
  // method appendItem
  /*[id(0x0000189E)]*/ int appendItem(int nID, wchar* bstrItem);
  // method appendSeparator
  /*[id(0x0000189F)]*/ int appendSeparator();
  // property enableItem
  /*[id(0x000018A0)]*/ int enableItem(int nID, short newVal);
  // property checkItem
  /*[id(0x000018A1)]*/ int checkItem(int nID, short newVal);
  // property checkRadioItem
  /*[id(0x000018A2)]*/ int checkRadioItem(int nID, short newVal);
  // property showFlags
  /*[id(0x000018A3)]*/ int get_showFlags(out int pVal);
  // property showFlags
  /*[id(0x000018A3)]*/ int set_showFlags(int pVal);
  // method show
  /*[id(0x000018A4)]*/ int show(out int pnID);
  // method showEx
  /*[id(0x000018A5)]*/ int showEx(int nID);
}

// IWMPAutoMenuCtrl: Not Public.  Internal interface used by Windows Media Player.
interface IWMPAutoMenuCtrl : IDispatch {
  mixin(uuid("1ad13e0b-4f3a-41df-9be2-f9e6fe0a7875"));
  // static DWINGUID IID = { 0x1ad13e0b, 0x4f3a, 0x41df, 0x9b, 0xe2, 0xf9, 0xe6, 0xfe, 0x0a, 0x78, 0x75 };
  // method show
  /*[id(0x00001965)]*/ int show(wchar* newVal);
}

// IWMPRegionalButtonCtrl: Public interface for skin object model.
interface IWMPRegionalButtonCtrl : IDispatch {
  mixin(uuid("58d507b1-2354-11d3-bd41-00c04f6ea5ae"));
  // static DWINGUID IID = { 0x58d507b1, 0x2354, 0x11d3, 0xbd, 0x41, 0x00, 0xc0, 0x4f, 0x6e, 0xa5, 0xae };
  // property Image
  /*[id(0x000014B4)]*/ int get_image(out wchar* pVal);
  // property Image
  /*[id(0x000014B4)]*/ int set_image(wchar* pVal);
  // property HoverImage
  /*[id(0x000014B5)]*/ int get_hoverImage(out wchar* pVal);
  // property HoverImage
  /*[id(0x000014B5)]*/ int set_hoverImage(wchar* pVal);
  // property DownImage
  /*[id(0x000014B6)]*/ int get_downImage(out wchar* pVal);
  // property DownImage
  /*[id(0x000014B6)]*/ int set_downImage(wchar* pVal);
  // property HoverDownImage
  /*[id(0x000014B7)]*/ int get_hoverDownImage(out wchar* pVal);
  // property HoverDownImage
  /*[id(0x000014B7)]*/ int set_hoverDownImage(wchar* pVal);
  // property DisabledImage
  /*[id(0x000014B8)]*/ int get_disabledImage(out wchar* pVal);
  // property DisabledImage
  /*[id(0x000014B8)]*/ int set_disabledImage(wchar* pVal);
  // property MappingImage
  /*[id(0x000014B9)]*/ int get_mappingImage(out wchar* pVal);
  // property MappingImage
  /*[id(0x000014B9)]*/ int set_mappingImage(wchar* pVal);
  // property TransparencyColor
  /*[id(0x000014BA)]*/ int get_transparencyColor(out wchar* pVal);
  // property TransparencyColor
  /*[id(0x000014BA)]*/ int set_transparencyColor(wchar* pVal);
  // property Cursor
  /*[id(0x000014BC)]*/ int get_cursor(out wchar* pVal);
  // property Cursor
  /*[id(0x000014BC)]*/ int set_cursor(wchar* pVal);
  // property ShowBackground
  /*[id(0x000014BD)]*/ int get_showBackground(out short pVal);
  // property ShowBackground
  /*[id(0x000014BD)]*/ int set_showBackground(short pVal);
  // property Radio
  /*[id(0x000014BE)]*/ int get_radio(out short pVal);
  // property Radio
  /*[id(0x000014BE)]*/ int set_radio(short pVal);
  // property ButtonCount
  /*[id(0x000014BF)]*/ int get_buttonCount(out int nButtons);
  // method CreateButton
  /*[id(0x000014C0)]*/ int createButton(out IDispatch pButton);
  // method GetButton
  /*[id(0x000014C1)]*/ int getButton(int nButton, out IDispatch pButton);
  // method Click
  /*[id(0x000014C2)]*/ int Click(int nButton);
  // property hueShift
  /*[id(0x000014C3)]*/ int get_hueShift(out float pVal);
  // property hueShift
  /*[id(0x000014C3)]*/ int set_hueShift(float pVal);
  // property saturation
  /*[id(0x000014C4)]*/ int get_saturation(out float pVal);
  // property saturation
  /*[id(0x000014C4)]*/ int set_saturation(float pVal);
}

// IWMPRegionalButtonEvents: Public interface for skin object model.
interface IWMPRegionalButtonEvents : IDispatch {
  mixin(uuid("50fc8d31-67ac-11d3-bd4c-00c04f6ea5ae"));
  // static DWINGUID IID = { 0x50fc8d31, 0x67ac, 0x11d3, 0xbd, 0x4c, 0x00, 0xc0, 0x4f, 0x6e, 0xa5, 0xae };
  /+// event onblur
  /*[id(0x000014F0)]*/ int onblur();+/
  /+// event onfocus
  /*[id(0x000014F1)]*/ int onfocus();+/
  /+// event onclick
  /*[id(0x000014F2)]*/ int onclick();+/
  /+// event ondblclick
  /*[id(0x000014F3)]*/ int ondblclick();+/
  /+// event onmousedown
  /*[id(0x000014F4)]*/ int onmousedown();+/
  /+// event onmouseup
  /*[id(0x000014F5)]*/ int onmouseup();+/
  /+// event onmousemove
  /*[id(0x000014F6)]*/ int onmousemove();+/
  /+// event onmouseover
  /*[id(0x000014F7)]*/ int onmouseover();+/
  /+// event onmouseout
  /*[id(0x000014F8)]*/ int onmouseout();+/
  /+// event onkeypress
  /*[id(0x000014F9)]*/ int onkeypress();+/
  /+// event onkeydown
  /*[id(0x000014FA)]*/ int onkeydown();+/
  /+// event onkeyup
  /*[id(0x000014FB)]*/ int onkeyup();+/
}

// IWMPRegionalButton: Public interface for skin object model.
interface IWMPRegionalButton : IDispatch {
  mixin(uuid("58d507b2-2354-11d3-bd41-00c04f6ea5ae"));
  // static DWINGUID IID = { 0x58d507b2, 0x2354, 0x11d3, 0xbd, 0x41, 0x00, 0xc0, 0x4f, 0x6e, 0xa5, 0xae };
  // property UpToolTip
  /*[id(0x000014D2)]*/ int get_upToolTip(out wchar* pVal);
  // property UpToolTip
  /*[id(0x000014D2)]*/ int set_upToolTip(wchar* pVal);
  // property DownToolTip
  /*[id(0x000014D3)]*/ int get_downToolTip(out wchar* pVal);
  // property DownToolTip
  /*[id(0x000014D3)]*/ int set_downToolTip(wchar* pVal);
  // property MappingColor
  /*[id(0x000014D4)]*/ int get_mappingColor(out wchar* pVal);
  // property MappingColor
  /*[id(0x000014D4)]*/ int set_mappingColor(wchar* pVal);
  // property Enabled
  /*[id(0x000014D5)]*/ int get_enabled(out short pVal);
  // property Enabled
  /*[id(0x000014D5)]*/ int set_enabled(short pVal);
  // property Sticky
  /*[id(0x000014DB)]*/ int get_sticky(out short pVal);
  // property Sticky
  /*[id(0x000014DB)]*/ int set_sticky(short pVal);
  // property Down
  /*[id(0x000014DC)]*/ int get_down(out short pVal);
  // property Down
  /*[id(0x000014DC)]*/ int set_down(short pVal);
  // property Index
  /*[id(0x000014DD)]*/ int get_index(out int pVal);
  // property TabStop
  /*[id(0x000014DE)]*/ int get_tabStop(out short pVal);
  // property TabStop
  /*[id(0x000014DE)]*/ int set_tabStop(short pVal);
  // property Cursor
  /*[id(0x000014DF)]*/ int get_cursor(out wchar* pVal);
  // property Cursor
  /*[id(0x000014DF)]*/ int set_cursor(wchar* pVal);
  // method Click
  /*[id(0x000014E0)]*/ int Click();
  // property AccName
  /*[id(0x000014E1)]*/ int get_accName(out wchar* pszName);
  // property AccName
  /*[id(0x000014E1)]*/ int set_accName(wchar* pszName);
  // property AccDescription
  /*[id(0x000014E2)]*/ int get_accDescription(out wchar* pszDescription);
  // property AccDescription
  /*[id(0x000014E2)]*/ int set_accDescription(wchar* pszDescription);
  // property accKeyboardShortcut
  /*[id(0x000014E3)]*/ int get_accKeyboardShortcut(out wchar* pszShortcut);
  // property accKeyboardShortcut
  /*[id(0x000014E3)]*/ int set_accKeyboardShortcut(wchar* pszShortcut);
}

// IWMPCustomSliderCtrlEvents: Public interface for skin object model.
interface IWMPCustomSliderCtrlEvents : IDispatch {
  mixin(uuid("95f45aa4-ed0a-11d2-ba67-0000f80855e6"));
  // static DWINGUID IID = { 0x95f45aa4, 0xed0a, 0x11d2, 0xba, 0x67, 0x00, 0x00, 0xf8, 0x08, 0x55, 0xe6 };
  /+// event ondragbegin
  /*[id(0x0000139C)]*/ int ondragbegin();+/
  /+// event ondragend
  /*[id(0x0000139D)]*/ int ondragend();+/
  /+// event onpositionchange
  /*[id(0x0000139E)]*/ int onpositionchange();+/
}

// IWMPCustomSlider: Public interface for skin object model.
interface IWMPCustomSlider : IDispatch {
  mixin(uuid("95f45aa2-ed0a-11d2-ba67-0000f80855e6"));
  // static DWINGUID IID = { 0x95f45aa2, 0xed0a, 0x11d2, 0xba, 0x67, 0x00, 0x00, 0xf8, 0x08, 0x55, 0xe6 };
  // property cursor
  /*[id(0x00001391)]*/ int get_cursor(out wchar* pVal);
  // property cursor
  /*[id(0x00001391)]*/ int set_cursor(wchar* pVal);
  // property min
  /*[id(0x0000138D)]*/ int get_min(out float pVal);
  // property min
  /*[id(0x0000138D)]*/ int set_min(float pVal);
  // property max
  /*[id(0x0000138E)]*/ int get_max(out float pVal);
  // property max
  /*[id(0x0000138E)]*/ int set_max(float pVal);
  // property value
  /*[id(0x00001392)]*/ int get_value(out float pVal);
  // property value
  /*[id(0x00001392)]*/ int set_value(float pVal);
  // property toolTip
  /*[id(0x00001393)]*/ int get_toolTip(out wchar* pVal);
  // property toolTip
  /*[id(0x00001393)]*/ int set_toolTip(wchar* pVal);
  // property positionImage
  /*[id(0x0000138A)]*/ int get_positionImage(out wchar* pVal);
  // property positionImage
  /*[id(0x0000138A)]*/ int set_positionImage(wchar* pVal);
  // property image
  /*[id(0x00001389)]*/ int get_image(out wchar* pVal);
  // property image
  /*[id(0x00001389)]*/ int set_image(wchar* pVal);
  // property hoverImage
  /*[id(0x0000138B)]*/ int get_hoverImage(out wchar* pVal);
  // property hoverImage
  /*[id(0x0000138B)]*/ int set_hoverImage(wchar* pVal);
  // property disabledImage
  /*[id(0x0000138C)]*/ int get_disabledImage(out wchar* pVal);
  // property disabledImage
  /*[id(0x0000138C)]*/ int set_disabledImage(wchar* pVal);
  // property downImage
  /*[id(0x00001394)]*/ int get_downImage(out wchar* pVal);
  // property downImage
  /*[id(0x00001394)]*/ int set_downImage(wchar* pVal);
  // property transparancyColor
  /*[id(0x00001390)]*/ int get_transparencyColor(out wchar* pVal);
  // property transparancyColor
  /*[id(0x00001390)]*/ int set_transparencyColor(wchar* pVal);
}

// IWMPTextCtrl: Public interface for skin object model.
interface IWMPTextCtrl : IDispatch {
  mixin(uuid("237dac8e-0e32-11d3-a2e2-00c04f79f88e"));
  // static DWINGUID IID = { 0x237dac8e, 0x0e32, 0x11d3, 0xa2, 0xe2, 0x00, 0xc0, 0x4f, 0x79, 0xf8, 0x8e };
  // property backgroundColor
  /*[id(0x00001451)]*/ int get_backgroundColor(out wchar* pVal);
  // property backgroundColor
  /*[id(0x00001451)]*/ int set_backgroundColor(wchar* pVal);
  // property fontFace
  /*[id(0x00001456)]*/ int get_fontFace(out wchar* pVal);
  // property fontFace
  /*[id(0x00001456)]*/ int set_fontFace(wchar* pVal);
  // property fontStyle
  /*[id(0x00001457)]*/ int get_fontStyle(out wchar* pVal);
  // property fontStyle
  /*[id(0x00001457)]*/ int set_fontStyle(wchar* pVal);
  // property fontSize
  /*[id(0x00001458)]*/ int get_fontSize(out int pVal);
  // property fontSize
  /*[id(0x00001458)]*/ int set_fontSize(int pVal);
  // property foregroundColor
  /*[id(0x00001459)]*/ int get_foregroundColor(out wchar* pVal);
  // property foregroundColor
  /*[id(0x00001459)]*/ int set_foregroundColor(wchar* pVal);
  // property hoverBackgroundColor
  /*[id(0x0000145A)]*/ int get_hoverBackgroundColor(out wchar* pVal);
  // property hoverBackgroundColor
  /*[id(0x0000145A)]*/ int set_hoverBackgroundColor(wchar* pVal);
  // property hoverForegroundColor
  /*[id(0x0000145B)]*/ int get_hoverForegroundColor(out wchar* pVal);
  // property hoverForegroundColor
  /*[id(0x0000145B)]*/ int set_hoverForegroundColor(wchar* pVal);
  // property hoverFontStyle
  /*[id(0x0000145C)]*/ int get_hoverFontStyle(out wchar* pVal);
  // property hoverFontStyle
  /*[id(0x0000145C)]*/ int set_hoverFontStyle(wchar* pVal);
  // property value
  /*[id(0x0000145D)]*/ int get_value(out wchar* pVal);
  // property value
  /*[id(0x0000145D)]*/ int set_value(wchar* pVal);
  // property toolTip
  /*[id(0x0000145E)]*/ int get_toolTip(out wchar* pVal);
  // property toolTip
  /*[id(0x0000145E)]*/ int set_toolTip(wchar* pVal);
  // property disabledFontStyle
  /*[id(0x0000145F)]*/ int get_disabledFontStyle(out wchar* pVal);
  // property disabledFontStyle
  /*[id(0x0000145F)]*/ int set_disabledFontStyle(wchar* pVal);
  // property disabledForegroundColor
  /*[id(0x00001460)]*/ int get_disabledForegroundColor(out wchar* pVal);
  // property disabledForegroundColor
  /*[id(0x00001460)]*/ int set_disabledForegroundColor(wchar* pVal);
  // property disabledBackgroundColor
  /*[id(0x00001461)]*/ int get_disabledBackgroundColor(out wchar* pVal);
  // property disabledBackgroundColor
  /*[id(0x00001461)]*/ int set_disabledBackgroundColor(wchar* pVal);
  // property fontSmoothing
  /*[id(0x00001465)]*/ int get_fontSmoothing(out short pVal);
  // property fontSmoothing
  /*[id(0x00001465)]*/ int set_fontSmoothing(short pVal);
  // property justification
  /*[id(0x00001466)]*/ int get_justification(out wchar* pVal);
  // property justification
  /*[id(0x00001466)]*/ int set_justification(wchar* pVal);
  // property wordWrap
  /*[id(0x00001467)]*/ int get_wordWrap(out short pVal);
  // property wordWrap
  /*[id(0x00001467)]*/ int set_wordWrap(short pVal);
  // property cursor
  /*[id(0x00001468)]*/ int get_cursor(out wchar* pVal);
  // property cursor
  /*[id(0x00001468)]*/ int set_cursor(wchar* pVal);
  // property scrolling
  /*[id(0x00001469)]*/ int get_scrolling(out short pVal);
  // property scrolling
  /*[id(0x00001469)]*/ int set_scrolling(short pVal);
  // property scrollingDirection
  /*[id(0x0000146A)]*/ int get_scrollingDirection(out wchar* pVal);
  // property scrollingDirection
  /*[id(0x0000146A)]*/ int set_scrollingDirection(wchar* pVal);
  // property scrollingDelay
  /*[id(0x0000146B)]*/ int get_scrollingDelay(out int pVal);
  // property scrollingDelay
  /*[id(0x0000146B)]*/ int set_scrollingDelay(int pVal);
  // property scrollingAmount
  /*[id(0x0000146C)]*/ int get_scrollingAmount(out int pVal);
  // property scrollingAmount
  /*[id(0x0000146C)]*/ int set_scrollingAmount(int pVal);
  // property textWidth
  /*[id(0x0000146D)]*/ int get_textWidth(out int pVal);
}

// ITaskCntrCtrl: Not Public.  Internal interface used by Windows Media Player.
interface ITaskCntrCtrl : IDispatch {
  mixin(uuid("891eadb1-1c45-48b0-b704-49a888da98c4"));
  // static DWINGUID IID = { 0x891eadb1, 0x1c45, 0x48b0, 0xb7, 0x04, 0x49, 0xa8, 0x88, 0xda, 0x98, 0xc4 };
  /*[id(0x60020000)]*/ int get_CurrentContainer(out IUnknown ppUnk);
  /*[id(0x60020000)]*/ int set_CurrentContainer(IUnknown ppUnk);
  /*[id(0x60020002)]*/ int Activate();
}

// _WMPCoreEvents: Public interface.
interface _WMPCoreEvents : IDispatch {
  mixin(uuid("d84cca96-cce2-11d2-9ecc-0000f8085981"));
  // static DWINGUID IID = { 0xd84cca96, 0xcce2, 0x11d2, 0x9e, 0xcc, 0x00, 0x00, 0xf8, 0x08, 0x59, 0x81 };
  /+// Sent when the control changes OpenState
  /*[id(0x00001389)]*/ void OpenStateChange(int NewState);+/
  /+// Sent when the control changes PlayState
  /*[id(0x000013ED)]*/ void PlayStateChange(int NewState);+/
  /+// Sent when the current audio language has changed
  /*[id(0x000013EE)]*/ void AudioLanguageChange(int LangID);+/
  /+// Sent when the status string changes
  /*[id(0x0000138A)]*/ void StatusChange();+/
  /+// Sent when a synchronized command or URL is received
  /*[id(0x000014B5)]*/ void ScriptCommand(wchar* scType, wchar* Param);+/
  /+// Sent when a new stream is started in a channel
  /*[id(0x0000151B)]*/ void NewStream();+/
  /+// Sent when the control is disconnected from the server
  /*[id(0x00001519)]*/ void Disconnect(int Result);+/
  /+// Sent when the control begins or ends buffering
  /*[id(0x0000151A)]*/ void Buffering(short Start);+/
  /+// Sent when the control has an error condition
  /*[id(0x0000157D)]*/ void Error();+/
  /+// Sent when the control encounters a problem
  /*[id(0x000015E1)]*/ void Warning(int WarningType, int Param, wchar* Description);+/
  /+// Sent when the end of file is reached
  /*[id(0x00001451)]*/ void EndOfStream(int Result);+/
  /+// Indicates that the current position of the movie has changed
  /*[id(0x00001452)]*/ void PositionChange(double oldPosition, double newPosition);+/
  /+// Sent when a marker is reached
  /*[id(0x00001453)]*/ void MarkerHit(int MarkerNum);+/
  /+// Indicates that the unit used to express duration and position has changed
  /*[id(0x00001454)]*/ void DurationUnitChange(int NewDurationUnit);+/
  /+// Indicates that the CD ROM media has changed
  /*[id(0x00001645)]*/ void CdromMediaChange(int CdromNum);+/
  /+// Sent when a playlist changes
  /*[id(0x000016A9)]*/ void PlaylistChange(IDispatch Playlist, WMPPlaylistChangeEventType change);+/
  /+// Sent when the current playlist changes
  /*[id(0x000016AC)]*/ void CurrentPlaylistChange(WMPPlaylistChangeEventType change);+/
  /+// Sent when a current playlist item becomes available
  /*[id(0x000016AD)]*/ void CurrentPlaylistItemAvailable(wchar* bstrItemName);+/
  /+// Sent when a media object changes
  /*[id(0x000016AA)]*/ void MediaChange(IDispatch Item);+/
  /+// Sent when a current media item becomes available
  /*[id(0x000016AB)]*/ void CurrentMediaItemAvailable(wchar* bstrItemName);+/
  /+// Sent when the item selection on the current playlist changes
  /*[id(0x000016AE)]*/ void CurrentItemChange(IDispatch pdispMedia);+/
  /+// Sent when the media collection needs to be requeried
  /*[id(0x000016AF)]*/ void MediaCollectionChange();+/
  /+// Sent when an attribute string is added in the media collection
  /*[id(0x000016B0)]*/ void MediaCollectionAttributeStringAdded(wchar* bstrAttribName, wchar* bstrAttribVal);+/
  /+// Sent when an attribute string is removed from the media collection
  /*[id(0x000016B1)]*/ void MediaCollectionAttributeStringRemoved(wchar* bstrAttribName, wchar* bstrAttribVal);+/
  /+// Sent when an attribute string is changed in the media collection
  /*[id(0x000016BC)]*/ void MediaCollectionAttributeStringChanged(wchar* bstrAttribName, wchar* bstrOldAttribVal, wchar* bstrNewAttribVal);+/
  /+// Sent when playlist collection needs to be requeried
  /*[id(0x000016B2)]*/ void PlaylistCollectionChange();+/
  /+// Sent when a playlist is added to the playlist collection
  /*[id(0x000016B3)]*/ void PlaylistCollectionPlaylistAdded(wchar* bstrPlaylistName);+/
  /+// Sent when a playlist is removed from the playlist collection
  /*[id(0x000016B4)]*/ void PlaylistCollectionPlaylistRemoved(wchar* bstrPlaylistName);+/
  /+// Sent when a playlist has been set or reset as deleted
  /*[id(0x000016BA)]*/ void PlaylistCollectionPlaylistSetAsDeleted(wchar* bstrPlaylistName, short varfIsDeleted);+/
  /+// Playlist playback mode has changed
  /*[id(0x000016BB)]*/ void ModeChange(wchar* ModeName, short NewValue);+/
  /+// Sent when the media object has an error condition
  /*[id(0x000016BD)]*/ void MediaError(IDispatch pMediaObject);+/
  /+// Current playlist switch with no open state change
  /*[id(0x000016BF)]*/ void OpenPlaylistSwitch(IDispatch pItem);+/
  /+// Send a current domain
  /*[id(0x000016BE)]*/ void DomainChange(wchar* strDomain);+/
}

// IWMPGraphEventHandler: Not Public.  Internal interface used by Windows Media Player.
interface IWMPGraphEventHandler : IDispatch {
  mixin(uuid("6b550945-018f-11d3-b14a-00c04f79faa6"));
  // static DWINGUID IID = { 0x6b550945, 0x018f, 0x11d3, 0xb1, 0x4a, 0x00, 0xc0, 0x4f, 0x79, 0xfa, 0xa6 };
  // Notifies graph state changes
  /*[id(0x00001FD7)]*/ int NotifyGraphStateChange(ULONG_PTR punkGraph, int lGraphState);
  // Notifies graph state changes asynchronously
  /*[id(0x00001FED)]*/ int AsyncNotifyGraphStateChange(ULONG_PTR punkGraph, int lGraphState);
  // Notifies changes in playback rate
  /*[id(0x00001FD9)]*/ int NotifyRateChange(ULONG_PTR punkGraph, double dRate);
  // Notifies the end of playback
  /*[id(0x00001FDD)]*/ int NotifyPlaybackEnd(ULONG_PTR punkGraph, wchar* bstrQueuedUrl, uint dwCurrentContext);
  // Notifies the end of a stream
  /*[id(0x00001FDC)]*/ int NotifyStreamEnd(ULONG_PTR punkGraph);
  // Notifies that a script command was encountered
  /*[id(0x00001FDE)]*/ int NotifyScriptCommand(ULONG_PTR punkGraph, wchar* bstrCommand, wchar* bstrParam);
  // Notifies that a script command was encountered
  /*[id(0x00001FEC)]*/ int NotifyEarlyScriptCommand(ULONG_PTR punkGraph, wchar* bstrCommand, wchar* bstrParam, double dTime);
  // Notifies that a marker was encountered
  /*[id(0x00001FDF)]*/ int NotifyMarkerHit(ULONG_PTR punkGraph, int lMarker);
  // Notifies that an error has occurred
  /*[id(0x00001FE0)]*/ int NotifyGraphError(ULONG_PTR punkGraph, int lErrMajor, int lErrMinor, int lCondition, wchar* bstrInfo);
  // Spawns the Acquire Credentials dialog
  /*[id(0x00001FE1)]*/ int NotifyAcquireCredentials(ULONG_PTR punkGraph, wchar* bstrRealm, wchar* bstrSite, ref wchar* bstrUser, ref wchar* bstrPassword, ref uint pdwFlags, out short pfCancel);
  // Spawns the untrusted license dialog
  /*[id(0x00001FF2)]*/ int NotifyUntrustedLicense(ULONG_PTR punkGraph, wchar* bstrURL, out short pfCancel);
  // Notifies a communication with the license dialog
  /*[id(0x00001FE2)]*/ int NotifyLicenseDialog(ULONG_PTR punkGraph, wchar* bstrURL, ubyte* pPostData, uint dwPostDataSize, int lResult);
  // Notifies a communication with the Individualization dialog
  /*[id(0x00001FE3)]*/ int NotifyNeedsIndividualization(ULONG_PTR punkGraph, out short pfResult);
  // Notifies that new metadata is avail
  /*[id(0x00001FE5)]*/ int NotifyNewMetadata(ULONG_PTR punkGraph);
  // Notifies that new capabilities are avail
  /*[id(0x00001FE6)]*/ int NotifyNewMediaCaps(ULONG_PTR punkGraph);
  // Notifies that the graph's connection to the media has been lost.
  /*[id(0x00001FE7)]*/ int NotifyDisconnect(ULONG_PTR punkGraph, int lResult);
  // Notifies that the graph save operation started/stopped.
  /*[id(0x00001FE8)]*/ int NotifySave(ULONG_PTR punkGraph, int fStarted, int lResult);
  // Notifies if the close call needs to be delayed.
  /*[id(0x00001FE9)]*/ int NotifyDelayClose(ULONG_PTR punkGraph, short fDelay);
  // Notifies when domain changes, parental control and region needs to be handled.
  /*[id(0x00001FEA)]*/ int NotifyDVD(ULONG_PTR punkGraph, int lEventCode, int lParam1, int lParam2);
  // Requests a callback into the graph on the apps thread
  /*[id(0x00001FEB)]*/ int NotifyRequestAppThreadAction(ULONG_PTR punkGraph, uint dwAction);
  // Notifies that a prerolled graph is ready to play with no more buffering
  /*[id(0x00001FEE)]*/ int NotifyPrerollReady(ULONG_PTR punkGraph);
  // Notifies core that our DirectShow filters have new icons to display
  /*[id(0x00001FF1)]*/ int NotifyNewIcons(ULONG_PTR punkGraph);
  // Notifies core that our step operation has completed
  /*[id(0x00001FF3)]*/ int NotifyStepComplete(ULONG_PTR punkGraph);
  // Notifies core that our bitrate has changed
  /*[id(0x00001FF4)]*/ int NotifyNewBitrate(ULONG_PTR punkGraph, uint dwBitrate);
  /*[id(0x00001FF5)]*/ int NotifyGraphCreationPreRender(ULONG_PTR punkGraph, ULONG_PTR punkFilterGraph, ULONG_PTR punkCardeaEncConfig, ULONG_PTR phrContinue, ULONG_PTR hEventToSet);
  /*[id(0x00001FF6)]*/ int NotifyGraphCreationPostRender(ULONG_PTR punkGraph, ULONG_PTR punkFilterGraph, ULONG_PTR phrContinue, ULONG_PTR hEventToSet);
}

// IAssaultVis: Not Public.  Internal interface used by Windows Media Player.
interface IAssaultVis : IDispatch {
  mixin(uuid("28682b8e-9055-47a9-a179-8e0bab1164d1"));
  // static DWINGUID IID = { 0x28682b8e, 0x9055, 0x47a9, 0xa1, 0x79, 0x8e, 0x0b, 0xab, 0x11, 0x64, 0xd1 };
}

// IBattery: Not Public.  Internal interface used by Windows Media Player.
interface IBattery : IDispatch {
  mixin(uuid("f8578bfa-cd8f-4ce1-a684-5b7e85fca7dc"));
  // static DWINGUID IID = { 0xf8578bfa, 0xcd8f, 0x4ce1, 0xa6, 0x84, 0x5b, 0x7e, 0x85, 0xfc, 0xa7, 0xdc };
  /*[id(0x00000001)]*/ int get_presetCount(out int pVal);
  /*[id(0x00000002)]*/ int get_preset(int nIndex, out IDispatch ppDispatch);
}

// IBatteryPreset: Not Public.  Internal interface used by Windows Media Player.
interface IBatteryPreset : IDispatch {
  mixin(uuid("40c6bde7-9c90-49d4-ad20-bef81a6c5f22"));
  // static DWINGUID IID = { 0x40c6bde7, 0x9c90, 0x49d4, 0xad, 0x20, 0xbe, 0xf8, 0x1a, 0x6c, 0x5f, 0x22 };
  /*[id(0x00000001)]*/ int get_title(out wchar* pVal);
  /*[id(0x00000001)]*/ int set_title(wchar* pVal);
}

// IBatteryRandomPreset: Not Public.  Internal interface used by Windows Media Player.
interface IBatteryRandomPreset : IBatteryPreset {
  mixin(uuid("f85e2d65-207d-48db-84b1-915e1735db17"));
  // static DWINGUID IID = { 0xf85e2d65, 0x207d, 0x48db, 0x84, 0xb1, 0x91, 0x5e, 0x17, 0x35, 0xdb, 0x17 };
}

// IBatterySavedPreset: Not Public.  Internal interface used by Windows Media Player.
interface IBatterySavedPreset : IBatteryPreset {
  mixin(uuid("876e7208-0172-4ebb-b08b-2e1d30dfe44c"));
  // static DWINGUID IID = { 0x876e7208, 0x0172, 0x4ebb, 0xb0, 0x8b, 0x2e, 0x1d, 0x30, 0xdf, 0xe4, 0x4c };
}

// IBarsEffect: Not Public.  Internal interface used by Windows Media Player.
interface IBarsEffect : IDispatch {
  mixin(uuid("33e9291a-f6a9-11d2-9435-00a0c92a2f2d"));
  // static DWINGUID IID = { 0x33e9291a, 0xf6a9, 0x11d2, 0x94, 0x35, 0x00, 0xa0, 0xc9, 0x2a, 0x2f, 0x2d };
  // property displayMode
  /*[id(0x00001F40)]*/ int get_displayMode(out int pVal);
  // property displayMode
  /*[id(0x00001F40)]*/ int set_displayMode(int pVal);
  // property showPeaks
  /*[id(0x00001F41)]*/ int get_showPeaks(out short pVal);
  // property showPeaks
  /*[id(0x00001F41)]*/ int set_showPeaks(short pVal);
  // property peakHangTime
  /*[id(0x00001F42)]*/ int get_peakHangTime(out int pVal);
  // property peakHangTime
  /*[id(0x00001F42)]*/ int set_peakHangTime(int pVal);
  // property peakFallbackAcceleration
  /*[id(0x00001F43)]*/ int get_peakFallbackAcceleration(out float pVal);
  // property peakFallbackAcceleration
  /*[id(0x00001F43)]*/ int set_peakFallbackAcceleration(float pVal);
  // property peakFallbackSpeed
  /*[id(0x00001F44)]*/ int get_peakFallbackSpeed(out float pVal);
  // property peakFallbackSpeed
  /*[id(0x00001F44)]*/ int set_peakFallbackSpeed(float pVal);
  // property levelFallbackAcceleration
  /*[id(0x00001F45)]*/ int get_levelFallbackAcceleration(out float pVal);
  // property levelFallbackAcceleration
  /*[id(0x00001F45)]*/ int set_levelFallbackAcceleration(float pVal);
  // property levelFallbackSpeed
  /*[id(0x00001F46)]*/ int get_levelFallbackSpeed(out float pVal);
  // property levelFallbackSpeed
  /*[id(0x00001F46)]*/ int set_levelFallbackSpeed(float pVal);
  // property backgroundColor
  /*[id(0x00001F47)]*/ int get_backgroundColor(out wchar* pVal);
  // property backgroundColor
  /*[id(0x00001F47)]*/ int set_backgroundColor(wchar* pVal);
  // property levelColor
  /*[id(0x00001F48)]*/ int get_levelColor(out wchar* pVal);
  // property levelColor
  /*[id(0x00001F48)]*/ int set_levelColor(wchar* pVal);
  // property peakColor
  /*[id(0x00001F49)]*/ int get_peakColor(out wchar* pVal);
  // property peakColor
  /*[id(0x00001F49)]*/ int set_peakColor(wchar* pVal);
  // property horizontalSpacing
  /*[id(0x00001F4A)]*/ int get_horizontalSpacing(out int pVal);
  // property horizontalSpacing
  /*[id(0x00001F4A)]*/ int set_horizontalSpacing(int pVal);
  // property levelWidth
  /*[id(0x00001F4C)]*/ int get_levelWidth(out int pVal);
  // property levelWidth
  /*[id(0x00001F4C)]*/ int set_levelWidth(int pVal);
  // property levelScale
  /*[id(0x00001F4D)]*/ int get_levelScale(out float pVal);
  // property levelScale
  /*[id(0x00001F4D)]*/ int set_levelScale(float pVal);
  // property fadeRate
  /*[id(0x00001F4E)]*/ int get_fadeRate(out int pVal);
  // property fadeRate
  /*[id(0x00001F4E)]*/ int set_fadeRate(int pVal);
  // property fadeMode
  /*[id(0x00001F4F)]*/ int get_fadeMode(out int pVal);
  // property fadeMode
  /*[id(0x00001F4F)]*/ int set_fadeMode(int pVal);
  // property transparent
  /*[id(0x00001F50)]*/ int get_transparent(out short pVal);
  // property transparent
  /*[id(0x00001F50)]*/ int set_transparent(short pVal);
}

// ISpikesEffect: Not Public.  Internal interface used by Windows Media Player.
interface ISpikesEffect : IDispatch {
  mixin(uuid("3984e7eb-08ef-11d3-9447-00a0c92a2f2d"));
  // static DWINGUID IID = { 0x3984e7eb, 0x08ef, 0x11d3, 0x94, 0x47, 0x00, 0xa0, 0xc9, 0x2a, 0x2f, 0x2d };
  // property backgroundColor
  /*[id(0x00002009)]*/ int get_backgroundColor(out wchar* pVal);
  // property backgroundColor
  /*[id(0x00002009)]*/ int set_backgroundColor(wchar* pVal);
  // property foregroundColor
  /*[id(0x0000200A)]*/ int get_foregroundColor(out wchar* pVal);
  // property foregroundColor
  /*[id(0x0000200A)]*/ int set_foregroundColor(wchar* pVal);
  // property displayMode
  /*[id(0x0000200B)]*/ int get_displayMode(out int pVal);
  // property displayMode
  /*[id(0x0000200B)]*/ int set_displayMode(int pVal);
  // property fallbackSpeed
  /*[id(0x0000200C)]*/ int get_fallbackSpeed(out float pVal);
  // property fallbackSpeed
  /*[id(0x0000200C)]*/ int set_fallbackSpeed(float pVal);
  // property transparent
  /*[id(0x0000200D)]*/ int get_transparent(out short pVal);
  // property transparent
  /*[id(0x0000200D)]*/ int set_transparent(short pVal);
}

// IDotPlaneEffect: Not Public.  Internal interface used by Windows Media Player.
interface IDotPlaneEffect : IDispatch {
  mixin(uuid("37327700-ef20-11d2-9431-00a0c92a2f2d"));
  // static DWINGUID IID = { 0x37327700, 0xef20, 0x11d2, 0x94, 0x31, 0x00, 0xa0, 0xc9, 0x2a, 0x2f, 0x2d };
  // property cameraDistance
  /*[id(0x0000206C)]*/ int get_cameraDistance(out float pVal);
  // property cameraDistance
  /*[id(0x0000206C)]*/ int set_cameraDistance(float pVal);
  // property fallbackAcceleration
  /*[id(0x0000206D)]*/ int get_fallbackAcceleration(out float pVal);
  // property fallbackAcceleration
  /*[id(0x0000206D)]*/ int set_fallbackAcceleration(float pVal);
  // property fallbackSpeed
  /*[id(0x0000206E)]*/ int get_fallbackSpeed(out float pVal);
  // property fallbackSpeed
  /*[id(0x0000206E)]*/ int set_fallbackSpeed(float pVal);
  // property spinZ
  /*[id(0x0000206F)]*/ int get_spinZ(out short pVal);
  // property spinZ
  /*[id(0x0000206F)]*/ int set_spinZ(short pVal);
  // property spinX
  /*[id(0x00002070)]*/ int get_spinX(out short pVal);
  // property spinX
  /*[id(0x00002070)]*/ int set_spinX(short pVal);
  // property spinY
  /*[id(0x00002071)]*/ int get_spinY(out short pVal);
  // property spinY
  /*[id(0x00002071)]*/ int set_spinY(short pVal);
  // method reset
  /*[id(0x00002079)]*/ int reset();
  // method stopSpin
  /*[id(0x0000207A)]*/ int stopSpin();
  // property backgroundColor
  /*[id(0x00002073)]*/ int get_backgroundColor(out wchar* pVal);
  // property backgroundColor
  /*[id(0x00002073)]*/ int set_backgroundColor(wchar* pVal);
  // property fadeColor1
  /*[id(0x00002074)]*/ int get_fadeColor1(out wchar* pVal);
  // property fadeColor1
  /*[id(0x00002074)]*/ int set_fadeColor1(wchar* pVal);
  // property fadeColor2
  /*[id(0x00002075)]*/ int get_fadeColor2(out wchar* pVal);
  // property fadeColor2
  /*[id(0x00002075)]*/ int set_fadeColor2(wchar* pVal);
  // property fadeColor3
  /*[id(0x00002076)]*/ int get_fadeColor3(out wchar* pVal);
  // property fadeColor3
  /*[id(0x00002076)]*/ int set_fadeColor3(wchar* pVal);
  // property fadeColor4
  /*[id(0x00002077)]*/ int get_fadeColor4(out wchar* pVal);
  // property fadeColor4
  /*[id(0x00002077)]*/ int set_fadeColor4(wchar* pVal);
  // property fadeColor5
  /*[id(0x00002078)]*/ int get_fadeColor5(out wchar* pVal);
  // property fadeColor5
  /*[id(0x00002078)]*/ int set_fadeColor5(wchar* pVal);
  // property transparent
  /*[id(0x0000207B)]*/ int get_transparent(out short pVal);
  // property transparent
  /*[id(0x0000207B)]*/ int set_transparent(short pVal);
}

// IPlenoptic: Not Public.  Internal interface used by Windows Media Player.
interface IPlenoptic : IDispatch {
  mixin(uuid("e31e7583-32d5-491c-b611-825d032b02cf"));
  // static DWINGUID IID = { 0xe31e7583, 0x32d5, 0x491c, 0xb6, 0x11, 0x82, 0x5d, 0x03, 0x2b, 0x02, 0xcf };
}

// IWMPExternal: Public interface for scripting object model.
interface IWMPExternal : IDispatch {
  mixin(uuid("e2cc638c-fd2c-409b-a1ea-5ddb72dc8e84"));
  // static DWINGUID IID = { 0xe2cc638c, 0xfd2c, 0x409b, 0xa1, 0xea, 0x5d, 0xdb, 0x72, 0xdc, 0x8e, 0x84 };
  /*[id(0x00002715)]*/ int get_version(out wchar* pBSTR);
  /*[id(0x0000271C)]*/ int get_appColorLight(out wchar* pbstrColor);
  /*[id(0x00002722)]*/ int set_OnColorChange(IDispatch value);
}

// IWMPExternalColors: Public interface for scripting object model.
interface IWMPExternalColors : IWMPExternal {
  mixin(uuid("d10ccdff-472d-498c-b5fe-3630e5405e0a"));
  // static DWINGUID IID = { 0xd10ccdff, 0x472d, 0x498c, 0xb5, 0xfe, 0x36, 0x30, 0xe5, 0x40, 0x5e, 0x0a };
  /*[id(0x0000271D)]*/ int get_appColorMedium(out wchar* pbstrColor);
  /*[id(0x0000271E)]*/ int get_appColorDark(out wchar* pbstrColor);
  /*[id(0x0000271F)]*/ int get_appColorButtonHighlight(out wchar* pbstrColor);
  /*[id(0x00002720)]*/ int get_appColorButtonShadow(out wchar* pbstrColor);
  /*[id(0x00002721)]*/ int get_appColorButtonHoverFace(out wchar* pbstrColor);
}

// IWMPSubscriptionServiceLimited: Public interface for scripting object model.
interface IWMPSubscriptionServiceLimited : IWMPExternalColors {
  mixin(uuid("54df358e-cf38-4010-99f1-f44b0e9000e5"));
  // static DWINGUID IID = { 0x54df358e, 0xcf38, 0x4010, 0x99, 0xf1, 0xf4, 0x4b, 0x0e, 0x90, 0x00, 0xe5 };
  /*[id(0x0000272A)]*/ int NavigateTaskPaneURL(wchar* bstrKeyName, wchar* bstrTaskPane, wchar* bstrParams);
  /*[id(0x0000272B)]*/ int set_SelectedTaskPane(wchar* bstrTaskPane);
  /*[id(0x0000272B)]*/ int get_SelectedTaskPane(out wchar* bstrTaskPane);
}

// IWMPSubscriptionServiceExternal: Public interface for scripting object model.
interface IWMPSubscriptionServiceExternal : IWMPSubscriptionServiceLimited {
  mixin(uuid("2e922378-ee70-4ceb-bbab-ce7ce4a04816"));
  // static DWINGUID IID = { 0x2e922378, 0xee70, 0x4ceb, 0xbb, 0xab, 0xce, 0x7c, 0xe4, 0xa0, 0x48, 0x16 };
  /*[id(0x00002719)]*/ int get_DownloadManager(out IWMPDownloadManager ppDownloadMgr);
}

// IWMPDownloadManager: Public interface.
interface IWMPDownloadManager : IDispatch {
  mixin(uuid("e15e9ad1-8f20-4cc4-9ec7-1a328ca86a0d"));
  // static DWINGUID IID = { 0xe15e9ad1, 0x8f20, 0x4cc4, 0x9e, 0xc7, 0x1a, 0x32, 0x8c, 0xa8, 0x6a, 0x0d };
  // Returns a specific download collection
  /*[id(0x0000047F)]*/ int getDownloadCollection(int lCollectionId, out IWMPDownloadCollection ppCollection);
  // Creates a download collection
  /*[id(0x00000480)]*/ int createDownloadCollection(out IWMPDownloadCollection ppCollection);
}

// IWMPDownloadCollection: Public interface.
interface IWMPDownloadCollection : IDispatch {
  mixin(uuid("0a319c7f-85f9-436c-b88e-82fd88000e1c"));
  // static DWINGUID IID = { 0x0a319c7f, 0x85f9, 0x436c, 0xb8, 0x8e, 0x82, 0xfd, 0x88, 0x00, 0x0e, 0x1c };
  // Returns the unique identifier of the collection
  /*[id(0x000004B1)]*/ int get_id(out int plId);
  // Returns the number of pending downloads
  /*[id(0x000004B2)]*/ int get_count(out int plCount);
  // Returns a pending download object
  /*[id(0x000004B3)]*/ int Item(int lItem, out IWMPDownloadItem2 ppDownload);
  // Queues a download
  /*[id(0x000004B4)]*/ int startDownload(wchar* bstrSourceURL, wchar* bstrType, out IWMPDownloadItem2 ppDownload);
  // Remove a download from the collection. Cancel if in progress.
  /*[id(0x000004B5)]*/ int removeItem(int lItem);
  // Clear the download collection
  /*[id(0x000004B6)]*/ int clear();
}

// IWMPDownloadItem2: Public interface.
interface IWMPDownloadItem2 : IWMPDownloadItem {
  mixin(uuid("9fbb3336-6da3-479d-b8ff-67d46e20a987"));
  // static DWINGUID IID = { 0x9fbb3336, 0x6da3, 0x479d, 0xb8, 0xff, 0x67, 0xd4, 0x6e, 0x20, 0xa9, 0x87 };
  // Returns the value of specified attribute for this download item
  /*[id(0x00000515)]*/ int getItemInfo(wchar* bstrItemName, out wchar* pbstrVal);
}

// IWMPDownloadItem: Public interface.
interface IWMPDownloadItem : IDispatch {
  mixin(uuid("c9470e8e-3f6b-46a9-a0a9-452815c34297"));
  // static DWINGUID IID = { 0xc9470e8e, 0x3f6b, 0x46a9, 0xa0, 0xa9, 0x45, 0x28, 0x15, 0xc3, 0x42, 0x97 };
  // Returns the source URL of the download
  /*[id(0x000004E3)]*/ int get_sourceURL(out wchar* pbstrURL);
  // Returns the size of the download
  /*[id(0x000004E4)]*/ int get_size(out int plSize);
  // Returns the type of the download
  /*[id(0x000004E5)]*/ int get_type(out wchar* pbstrType);
  // Returns the progress (in bytes) of the download
  /*[id(0x000004E6)]*/ int get_progress(out int plProgress);
  // Returns the state of the download
  /*[id(0x000004E7)]*/ int get_downloadState(out WMPSubscriptionDownloadState pwmpsdls);
  // Pauses the download
  /*[id(0x000004E8)]*/ int pause();
  // Resumes the download
  /*[id(0x000004E9)]*/ int resume();
  // Cancels the download
  /*[id(0x000004EA)]*/ int cancel();
}

// IWMPSubscriptionServicePlayMedia: Public interface for scripting object model.
interface IWMPSubscriptionServicePlayMedia : IWMPSubscriptionServiceLimited {
  mixin(uuid("5f0248c1-62b3-42d7-b927-029119e6ad14"));
  // static DWINGUID IID = { 0x5f0248c1, 0x62b3, 0x42d7, 0xb9, 0x27, 0x02, 0x91, 0x19, 0xe6, 0xad, 0x14 };
  // method playMedia
  /*[id(0x00002714)]*/ int playMedia(wchar* bstrURL);
}

// IWMPCDDVDWizardExternal: Not Public.  Internal interface used by Windows Media Player.
interface IWMPCDDVDWizardExternal : IWMPExternalColors {
  mixin(uuid("2d7ef888-1d3c-484a-a906-9f49d99bb344"));
  // static DWINGUID IID = { 0x2d7ef888, 0x1d3c, 0x484a, 0xa9, 0x06, 0x9f, 0x49, 0xd9, 0x9b, 0xb3, 0x44 };
  /*[id(0x00002711)]*/ int WriteNames(wchar* bstrTOC, wchar* bstrMetadata);
  /*[id(0x00002712)]*/ int ReturnToMainTask();
  /*[id(0x00002717)]*/ int WriteNamesEx(WMP_WRITENAMESEX_TYPE type, wchar* bstrTypeId, wchar* bstrMetadata, short fRenameRegroupFiles);
  /*[id(0x00002718)]*/ int GetMDQByRequestID(wchar* bstrRequestID, out wchar* pbstrMDQ);
  /*[id(0x0000271B)]*/ int EditMetadata();
  /*[id(0x0000271A)]*/ int IsMetadataAvailableForEdit(out short pbIsAvailable);
  /*[id(0x00002727)]*/ int BuyCD(wchar* bstrTitle, wchar* bstrArtist, wchar* bstrAlbum, wchar* bstrUFID, wchar* bstrWMID);
}

// IWMPBaseExternal: Public interface for scripting object model.
interface IWMPBaseExternal : IWMPExternal {
  mixin(uuid("f81b2a59-02bc-4003-8b2f-c124af66fc66"));
  // static DWINGUID IID = { 0xf81b2a59, 0x02bc, 0x4003, 0x8b, 0x2f, 0xc1, 0x24, 0xaf, 0x66, 0xfc, 0x66 };
}

// IWMPOfflineExternal: Not Public.  Internal interface used by Windows Media Player..
interface IWMPOfflineExternal : IWMPExternal {
  mixin(uuid("3148e685-b243-423d-8341-8480d6eff674"));
  // static DWINGUID IID = { 0x3148e685, 0xb243, 0x423d, 0x83, 0x41, 0x84, 0x80, 0xd6, 0xef, 0xf6, 0x74 };
  /*[id(0x00002729)]*/ int forceOnline();
}

// CoClasses

// Windows Media Player ActiveX Control
abstract class WindowsMediaPlayer {
  mixin(uuid("6bf52a52-394a-11d3-b153-00c04f79faa6"));
  // static DWINGUID CLSID = { 0x6bf52a52, 0x394a, 0x11d3, 0xb1, 0x53, 0x00, 0xc0, 0x4f, 0x79, 0xfa, 0xa6 };
  mixin Interfaces!(IWMPPlayer4, IWMPPlayer3, IWMPPlayer2, IWMPPlayer, IWMPControls, IWMPSettings, IWMPPlaylist, IWMPMedia, IWMPMediaCollection, IWMPPlaylistCollection, IWMPCdromCollection, IWMPError, IWMPErrorItem, IWMPErrorItem2, IWMPClosedCaption, IWMPDVD, IWMPControls2, IWMPMedia2, IWMPMedia3, IWMPMetadataPicture, IWMPMetadataText, IWMPSettings2, IWMPControls3, IWMPClosedCaption2);
}

// WMPButtonCtrl: Not Public.  Internal object used by Windows Media Player.
abstract class WMPButtonCtrl {
  mixin(uuid("87291b51-0c8e-11d3-bb2a-00a0c93ca73a"));
  // static DWINGUID CLSID = { 0x87291b51, 0x0c8e, 0x11d3, 0xbb, 0x2a, 0x00, 0xa0, 0xc9, 0x3c, 0xa7, 0x3a };
  mixin Interfaces!(IWMPButtonCtrl);
}

// WMPListBoxCtrl: Not Public.  Internal object used by Windows Media Player.
abstract class WMPListBoxCtrl {
  mixin(uuid("fc1880cf-83b9-43a7-a066-c44ce8c82583"));
  // static DWINGUID CLSID = { 0xfc1880cf, 0x83b9, 0x43a7, 0xa0, 0x66, 0xc4, 0x4c, 0xe8, 0xc8, 0x25, 0x83 };
  mixin Interfaces!(IWMPListBoxCtrl);
}

// WMPSliderCtrl: Not Public.  Internal object used by Windows Media Player.
abstract class WMPSliderCtrl {
  mixin(uuid("f2bf2c90-405f-11d3-bb39-00a0c93ca73a"));
  // static DWINGUID CLSID = { 0xf2bf2c90, 0x405f, 0x11d3, 0xbb, 0x39, 0x00, 0xa0, 0xc9, 0x3c, 0xa7, 0x3a };
  mixin Interfaces!(IWMPSliderCtrl);
}

// WMPVideoCtrl: Not Public.  Internal object used by Windows Media Player.
abstract class WMPVideoCtrl {
  mixin(uuid("61cecf11-fc3a-11d2-a1cd-005004602752"));
  // static DWINGUID CLSID = { 0x61cecf11, 0xfc3a, 0x11d2, 0xa1, 0xcd, 0x00, 0x50, 0x04, 0x60, 0x27, 0x52 };
  mixin Interfaces!(IWMPVideoCtrl);
}

// WMPEffects: Not Public.  Internal object used by Windows Media Player.
abstract class WMPEffects {
  mixin(uuid("47dea830-d619-4154-b8d8-6b74845d6a2d"));
  // static DWINGUID CLSID = { 0x47dea830, 0xd619, 0x4154, 0xb8, 0xd8, 0x6b, 0x74, 0x84, 0x5d, 0x6a, 0x2d };
  mixin Interfaces!(IWMPEffectsCtrl);
}

// WMPEqualizerSettingsCtrl: Not Public.  Internal object used by Windows Media Player.
abstract class WMPEqualizerSettingsCtrl {
  mixin(uuid("93eb32f5-87b1-45ad-acc6-0f2483db83bb"));
  // static DWINGUID CLSID = { 0x93eb32f5, 0x87b1, 0x45ad, 0xac, 0xc6, 0x0f, 0x24, 0x83, 0xdb, 0x83, 0xbb };
  mixin Interfaces!(IWMPEqualizerSettingsCtrl);
}

// WMPVideoSettingsCtrl: Not Public.  Internal object used by Windows Media Player.
abstract class WMPVideoSettingsCtrl {
  mixin(uuid("ae7bfafe-dcc8-4a73-92c8-cc300ca88859"));
  // static DWINGUID CLSID = { 0xae7bfafe, 0xdcc8, 0x4a73, 0x92, 0xc8, 0xcc, 0x30, 0x0c, 0xa8, 0x88, 0x59 };
  mixin Interfaces!(IWMPVideoSettingsCtrl);
}

// WMPLibraryTreeCtrl: Not Public.  Internal object used by Windows Media Player.
abstract class WMPLibraryTreeCtrl {
  mixin(uuid("d9de732a-aee9-4503-9d11-5605589977a8"));
  // static DWINGUID CLSID = { 0xd9de732a, 0xaee9, 0x4503, 0x9d, 0x11, 0x56, 0x05, 0x58, 0x99, 0x77, 0xa8 };
  mixin Interfaces!(IWMPLibraryTreeCtrl);
}

// WMPEditCtrl: Not Public.  Internal object used by Windows Media Player.
abstract class WMPEditCtrl {
  mixin(uuid("6342fced-25ea-4033-bddb-d049a14382d3"));
  // static DWINGUID CLSID = { 0x6342fced, 0x25ea, 0x4033, 0xbd, 0xdb, 0xd0, 0x49, 0xa1, 0x43, 0x82, 0xd3 };
  mixin Interfaces!(IWMPEditCtrl);
}

// WMPMenuCtrl: Not Public.  Internal object used by Windows Media Player.
abstract class WMPMenuCtrl {
  mixin(uuid("bab3768b-8883-4aec-9f9b-e14c947913ef"));
  // static DWINGUID CLSID = { 0xbab3768b, 0x8883, 0x4aec, 0x9f, 0x9b, 0xe1, 0x4c, 0x94, 0x79, 0x13, 0xef };
  mixin Interfaces!(IWMPMenuCtrl);
}

// WMPAutoMenuCtrl: Not Public.  Internal object used by Windows Media Player.
abstract class WMPAutoMenuCtrl {
  mixin(uuid("6b28f900-8d64-4b80-9963-cc52ddd1fbb4"));
  // static DWINGUID CLSID = { 0x6b28f900, 0x8d64, 0x4b80, 0x99, 0x63, 0xcc, 0x52, 0xdd, 0xd1, 0xfb, 0xb4 };
  mixin Interfaces!(IWMPAutoMenuCtrl);
}

// WMPRegionalButtonCtrl: Not Public.  Internal object used by Windows Media Player.
abstract class WMPRegionalButtonCtrl {
  mixin(uuid("ae3b6831-25a9-11d3-bd41-00c04f6ea5ae"));
  // static DWINGUID CLSID = { 0xae3b6831, 0x25a9, 0x11d3, 0xbd, 0x41, 0x00, 0xc0, 0x4f, 0x6e, 0xa5, 0xae };
  mixin Interfaces!(IWMPRegionalButtonCtrl);
}

// WMPRegionalButton: Not Public.  Internal object used by Windows Media Player.
abstract class WMPRegionalButton {
  mixin(uuid("09aeff11-69ef-11d3-bd4d-00c04f6ea5ae"));
  // static DWINGUID CLSID = { 0x09aeff11, 0x69ef, 0x11d3, 0xbd, 0x4d, 0x00, 0xc0, 0x4f, 0x6e, 0xa5, 0xae };
  mixin Interfaces!(IWMPRegionalButton);
}

// WMPCustomSliderCtrl: Not Public.  Internal object used by Windows Media Player.
abstract class WMPCustomSliderCtrl {
  mixin(uuid("95f45aa3-ed0a-11d2-ba67-0000f80855e6"));
  // static DWINGUID CLSID = { 0x95f45aa3, 0xed0a, 0x11d2, 0xba, 0x67, 0x00, 0x00, 0xf8, 0x08, 0x55, 0xe6 };
  mixin Interfaces!(IWMPCustomSlider);
}

// WMPTextCtrl: Not Public.  Internal object used by Windows Media Player.
abstract class WMPTextCtrl {
  mixin(uuid("ddda102e-0e17-11d3-a2e2-00c04f79f88e"));
  // static DWINGUID CLSID = { 0xddda102e, 0x0e17, 0x11d3, 0xa2, 0xe2, 0x00, 0xc0, 0x4f, 0x79, 0xf8, 0x8e };
  mixin Interfaces!(IWMPTextCtrl);
}

// WMPPlaylistCtrl: Not Public.  Internal object used by Windows Media Player.
abstract class WMPPlaylistCtrl {
  mixin(uuid("5f9cfd93-8cad-11d3-9a7e-00c04f8efb70"));
  // static DWINGUID CLSID = { 0x5f9cfd93, 0x8cad, 0x11d3, 0x9a, 0x7e, 0x00, 0xc0, 0x4f, 0x8e, 0xfb, 0x70 };
  mixin Interfaces!(IWMPPlaylistCtrl);
}

// WMPCore: Not Public.  Internal object used by Windows Media Player.
abstract class WMPCore {
  mixin(uuid("09428d37-e0b9-11d2-b147-00c04f79faa6"));
  // static DWINGUID CLSID = { 0x09428d37, 0xe0b9, 0x11d2, 0xb1, 0x47, 0x00, 0xc0, 0x4f, 0x79, 0xfa, 0xa6 };
  mixin Interfaces!(IWMPCore3, IWMPCore2, IWMPCore, IWMPControls, IWMPPlaylist, IWMPSettings, IWMPMedia, IWMPStringCollection, IWMPMediaCollection, IWMPPlaylistCollection, IWMPCdromCollection, IWMPCdrom, IWMPErrorItem, IWMPClosedCaption, IWMPError, IWMPDVD, IWMPControls2, IWMPMedia2, IWMPMedia3, IWMPMetadataPicture, IWMPMetadataText, IWMPSettings2, IWMPControls3, IWMPClosedCaption2);
}
