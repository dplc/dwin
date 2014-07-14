// WiaVideo 1.0 Type Library
// Version 1.0

/*[uuid("1320ad9e-a50f-4ed0-b1a4-4e45ec25005e")]*/
module dwin.sys.win32.com.tlb.more.wiavideo;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum __MIDL___MIDL_itf_wiavideo_0000_0001 {
  WIAVIDEO_NO_VIDEO = 0x00000001,
  WIAVIDEO_CREATING_VIDEO = 0x00000002,
  WIAVIDEO_VIDEO_CREATED = 0x00000003,
  WIAVIDEO_VIDEO_PLAYING = 0x00000004,
  WIAVIDEO_VIDEO_PAUSED = 0x00000005,
  WIAVIDEO_DESTROYING_VIDEO = 0x00000006,
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

// Aliases

alias _RemotableHandle* wireHWND;

alias __MIDL___MIDL_itf_wiavideo_0000_0001 WIAVIDEO_STATE;

// Interfaces

// IWiaVideo Interface
interface IWiaVideo : IUnknown {
  mixin(uuid("d52920aa-db88-41f0-946c-e00dc0a19cfa"));
  // static DWINGUID IID = { 0xd52920aa, 0xdb88, 0x41f0, 0x94, 0x6c, 0xe0, 0x0d, 0xc0, 0xa1, 0x9c, 0xfa };
  // property PreviewVisible
  /*[id(0x00000001)]*/ int get_PreviewVisible(out int pbPreviewVisible);
  // property PreviewVisible
  /*[id(0x00000001)]*/ int set_PreviewVisible(int pbPreviewVisible);
  // property ImageDirectory
  /*[id(0x00000002)]*/ int get_ImagesDirectory(out wchar* pbstrImageDirectory);
  // property ImageDirectory
  /*[id(0x00000002)]*/ int set_ImagesDirectory(wchar* pbstrImageDirectory);
  // method CreateVideoByWiaDevID.
  /*[id(0x00000003)]*/ int CreateVideoByWiaDevID(wchar* bstrWiaDeviceID, wireHWND hwndParent, int bStretchToFitParent, int bAutoBeginPlayback);
  // method CreateVideoByDevNum
  /*[id(0x00000004)]*/ int CreateVideoByDevNum(uint uiDeviceNumber, wireHWND hwndParent, int bStretchToFitParent, int bAutoBeginPlayback);
  // method CreateVideoByName
  /*[id(0x00000005)]*/ int CreateVideoByName(wchar* bstrFriendlyName, wireHWND hwndParent, int bStretchToFitParent, int bAutoBeginPlayback);
  // method DestroyVideo
  /*[id(0x00000006)]*/ int DestroyVideo();
  // method Play
  /*[id(0x00000007)]*/ int Play();
  // method Pause
  /*[id(0x00000008)]*/ int Pause();
  // method TakePicture
  /*[id(0x00000009)]*/ int TakePicture(out wchar* pbstrNewImageFilename);
  // method ResizeVideo
  /*[id(0x0000000A)]*/ int ResizeVideo(int bStretchToFitParent);
  // method GetState
  /*[id(0x0000000B)]*/ int GetCurrentState(out WIAVIDEO_STATE pState);
}

// CoClasses

// WiaVideo Class
abstract class WiaVideo {
  mixin(uuid("3908c3cd-4478-4536-af2f-10c25d4ef89a"));
  // static DWINGUID CLSID = { 0x3908c3cd, 0x4478, 0x4536, 0xaf, 0x2f, 0x10, 0xc2, 0x5d, 0x4e, 0xf8, 0x9a };
  mixin Interfaces!(IWiaVideo);
}
