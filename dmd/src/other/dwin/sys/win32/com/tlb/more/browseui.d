// Microsoft Browser Helpers
// Version 1.0

/*[uuid("b025f75a-cd86-4d11-a0c8-d7644fdbfb5a")]*/
module dwin.sys.win32.com.tlb.more.browseui;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

// State of playback
enum mbPlayState {
  mbpsUndefined = 0x00000000,
  mbpsStopped = 0x00000001,
  mbpsPaused = 0x00000002,
  mbpsPlaying = 0x00000003,
  mbpsScanForward = 0x00000004,
  mbpsScanReverse = 0x00000005,
  mbpsBuffering = 0x00000006,
  mbpsWaiting = 0x00000007,
  mbpsMediaEnded = 0x00000008,
  mbpsTransitioning = 0x00000009,
  mbpsReady = 0x0000000A,
}

// State of opening process
enum mbOpenState {
  mbosUndefined = 0x00000000,
  mbosPlaylistChanging = 0x00000001,
  mbosPlaylistLocating = 0x00000002,
  mbosPlaylistConnecting = 0x00000003,
  mbosPlaylistLoading = 0x00000004,
  mbosPlaylistOpening = 0x00000005,
  mbosPlaylistOpenNoMedia = 0x00000006,
  mbosPlaylistChanged = 0x00000007,
  mbosMediaChanging = 0x00000008,
  mbosMediaLocating = 0x00000009,
  mbosMediaConnecting = 0x0000000A,
  mbosMediaLoading = 0x0000000B,
  mbosMediaOpening = 0x0000000C,
  mbosMediaOpen = 0x0000000D,
  mbosBeginCodecAcquisition = 0x0000000E,
  mbosEndCodecAcquisition = 0x0000000F,
  mbosBeginLicenseAcquisition = 0x00000010,
  mbosEndLicenseAcquisition = 0x00000011,
  mbosBeginIndividualization = 0x00000012,
  mbosEndIndividualization = 0x00000013,
  mbosMediaWaiting = 0x00000014,
  mbosOpeningUnknownURL = 0x00000015,
}

enum contentProxyEvent {
  OnOpenStateChange = 0x00000000,
  OnPlayStateChange = 0x00000001,
  OnShow = 0x00000002,
  OnHide = 0x00000003,
}

// Interfaces

// Event interface for MediaBar behavior
interface _mbEvents : IDispatch {
  mixin(uuid("bb24bbef-1eec-422b-a397-edbc31fb3a56"));
  // static DWINGUID IID = { 0xbb24bbef, 0x1eec, 0x422b, 0xa3, 0x97, 0xed, 0xbc, 0x31, 0xfb, 0x3a, 0x56 };
  /+// Sent when the mediabar player changes OpenState
  /*[id(0x00000FA1)]*/ void OnOpenStateChange();+/
  /+// Sent when the mediabar player changes PlayState
  /*[id(0x00000FA2)]*/ void OnPlayStateChange();+/
  /+// Sent when the mediabar player becomes visible
  /*[id(0x00000FA3)]*/ void OnShow();+/
  /+// Sent when the mediabar player is hidden
  /*[id(0x00000FA4)]*/ void OnHide();+/
}

// IMediaBehavior Interface
interface IMediaBehavior : IDispatch {
  mixin(uuid("bb24bbe0-1eec-422b-a397-edbc31fb3a56"));
  // static DWINGUID IID = { 0xbb24bbe0, 0x1eec, 0x422b, 0xa3, 0x97, 0xed, 0xbc, 0x31, 0xfb, 0x3a, 0x56 };
  // load media from URL and start playing
  /*[id(0x00000001)]*/ int playURL(wchar* bstrURL, wchar* bstrMIME);
  // Stops playing current media
  /*[id(0x00000002)]*/ int stop();
  // Starts playing the next media in playlist (if playlist is present)
  /*[id(0x00000003)]*/ int playNext();
  // Returns the current media item
  /*[id(0x00000004)]*/ int get_currentItem(out IMediaItem ppMediaItem);
  // Returns the next media item in playlist (if any)
  /*[id(0x00000005)]*/ int get_nextItem(out IMediaItem ppMediaItem);
  // Returns the playlist info (if any playlist)
  /*[id(0x00000006)]*/ int get_playlistInfo(out IPlaylistInfo ppPlaylistInfo);
  // Returns whether playlist has a next item.
  /*[id(0x00000007)]*/ int get_hasNextItem(out short pfhasNext);
  // Returns the play state of the player
  /*[id(0x00000008)]*/ int get_playState(out mbPlayState pps);
  // Returns the open state of the player
  /*[id(0x00000009)]*/ int get_openState(out mbOpenState pos);
  // Returns a boolen value specifying whether or not the control is enabled
  /*[id(0x0000000A)]*/ int get_enabled(out short pbEnabled);
  // Returns a boolen value specifying whether or not the control is enabled
  /*[id(0x0000000A)]*/ int set_enabled(short pbEnabled);
  // Returns a boolen value specifying whether or not the mediabar UI is disabled
  /*[id(0x0000000B)]*/ int get_disabledUI(out short pbDisabled);
  // Returns a boolen value specifying whether or not the mediabar UI is disabled
  /*[id(0x0000000B)]*/ int set_disabledUI(short pbDisabled);
}

// IMediaItem Interface
interface IMediaItem : IDispatch {
  mixin(uuid("bb24bbe1-1eec-422b-a397-edbc31fb3a56"));
  // static DWINGUID IID = { 0xbb24bbe1, 0x1eec, 0x422b, 0xa3, 0x97, 0xed, 0xbc, 0x31, 0xfb, 0x3a, 0x56 };
  // Returns the media URL
  /*[id(0x0000000C)]*/ int get_sourceURL(out wchar* pbstrSourceURL);
  // Returns the name of the media
  /*[id(0x0000000D)]*/ int get_name(out wchar* pbstrName);
  // Returns duration of current media
  /*[id(0x0000000E)]*/ int get_duration(out double pDuration);
  // Returns the count of the attributes associated with this media
  /*[id(0x0000000F)]*/ int get_attributeCount(out int plCount);
  // Returns the name of the attribute whose index has been specified
  /*[id(0x00000010)]*/ int getAttributeName(int lIndex, out wchar* pbstrItemName);
  // Returns the value of specified attribute for this media
  /*[id(0x00000011)]*/ int getItemInfo(wchar* bstrItemName, out wchar* pbstrVal);
}

// IPlaylistInfo Interface
interface IPlaylistInfo : IDispatch {
  mixin(uuid("bb24bbe2-1eec-422b-a397-edbc31fb3a56"));
  // static DWINGUID IID = { 0xbb24bbe2, 0x1eec, 0x422b, 0xa3, 0x97, 0xed, 0xbc, 0x31, 0xfb, 0x3a, 0x56 };
  // Returns the name of the playlist
  /*[id(0x00000012)]*/ int get_name(out wchar* pbstrName);
  // Returns the count of the attributes associated with this playlist
  /*[id(0x00000013)]*/ int get_attributeCount(out int plCount);
  // Returns the name of the attribute whose index has been specified
  /*[id(0x00000014)]*/ int getAttributeName(int lIndex, out wchar* pbstrItemName);
  // Returns the value of specified attribute for this media
  /*[id(0x00000015)]*/ int getItemInfo(wchar* bstrItemName, out wchar* pbstrVal);
}

// IMediaHost
interface IMediaHost : IUnknown {
  mixin(uuid("ef508010-c806-4356-8492-d15e616f6f37"));
  // static DWINGUID IID = { 0xef508010, 0xc806, 0x4356, 0x84, 0x92, 0xd1, 0x5e, 0x61, 0x6f, 0x6f, 0x37 };
  /*[id(0x60010000)]*/ int getMediaPlayer(IUnknown* ppPlayer);
  /*[id(0x60010001)]*/ int playURL(wchar* bstrURL, wchar* bstrMIME);
  /*[id(0x60010002)]*/ int addProxy(IUnknown pProxy);
  /*[id(0x60010003)]*/ int removeProxy(IUnknown pProxy);
}

// IContentProxy
interface IContentProxy : IUnknown {
  mixin(uuid("ef508011-c806-4356-8492-d15e616f6f37"));
  // static DWINGUID IID = { 0xef508011, 0xc806, 0x4356, 0x84, 0x92, 0xd1, 0x5e, 0x61, 0x6f, 0x6f, 0x37 };
  /*[id(0x60010000)]*/ int OnCreatedPlayer();
  /*[id(0x60010001)]*/ int fireEvent(contentProxyEvent event);
  /*[id(0x60010002)]*/ int detachPlayer();
}

// CoClasses

// Media Behavior Class
abstract class MediaBehavior {
  mixin(uuid("bb24bbff-1eec-422b-a397-edbc31fb3a56"));
  // static DWINGUID CLSID = { 0xbb24bbff, 0x1eec, 0x422b, 0xa3, 0x97, 0xed, 0xbc, 0x31, 0xfb, 0x3a, 0x56 };
  mixin Interfaces!(IMediaBehavior, IContentProxy);
}

// Media Item Class
abstract class MediaItem {
  mixin(uuid("bb24bbfe-1eec-422b-a397-edbc31fb3a56"));
  // static DWINGUID CLSID = { 0xbb24bbfe, 0x1eec, 0x422b, 0xa3, 0x97, 0xed, 0xbc, 0x31, 0xfb, 0x3a, 0x56 };
  mixin Interfaces!(IMediaItem);
}

// Playlist Info Class
abstract class playlistInfo {
  mixin(uuid("bb24bbfd-1eec-422b-a397-edbc31fb3a56"));
  // static DWINGUID CLSID = { 0xbb24bbfd, 0x1eec, 0x422b, 0xa3, 0x97, 0xed, 0xbc, 0x31, 0xfb, 0x3a, 0x56 };
  mixin Interfaces!(IPlaylistInfo);
}
