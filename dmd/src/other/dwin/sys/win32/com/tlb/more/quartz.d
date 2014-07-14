// ActiveMovie control type library
// Version 1.0

/*[uuid("56a868b0-0ad4-11ce-b03a-0020af0ba770")]*/
//module dwin.sys.win32.com.tlb.more.quartztype;
module dwin.sys.win32.com.tlb.more.quartz;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Aliases

alias int LONG_PTR;

// Interfaces

// Collection
interface IAMCollection : IDispatch {
  mixin(uuid("56a868b9-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a868b9, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60020000)]*/ int get_Count(out int plCount);
  /*[id(0x60020001)]*/ int Item(int lItem, out IUnknown ppUnk);
  /*[id(0x60020002)]*/ int get__NewEnum(out IUnknown ppUnk);
}

// IMediaControl interface
interface IMediaControl : IDispatch {
  mixin(uuid("56a868b1-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a868b1, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60020000)]*/ int Run();
  /*[id(0x60020001)]*/ int Pause();
  /*[id(0x60020002)]*/ int Stop();
  /*[id(0x60020003)]*/ int GetState(int msTimeout, out int pfs);
  /*[id(0x60020004)]*/ int RenderFile(wchar* strFilename);
  /*[id(0x60020005)]*/ int AddSourceFilter(wchar* strFilename, out IDispatch ppUnk);
  /*[id(0x60020006)]*/ int get_FilterCollection(out IDispatch ppUnk);
  /*[id(0x60020007)]*/ int get_RegFilterCollection(out IDispatch ppUnk);
  /*[id(0x60020008)]*/ int StopWhenReady();
}

// IMediaEvent interface
interface IMediaEvent : IDispatch {
  mixin(uuid("56a868b6-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a868b6, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60020000)]*/ int GetEventHandle(out LONG_PTR hEvent);
  /*[id(0x60020001)]*/ int GetEvent(out int lEventCode, out LONG_PTR lParam1, out LONG_PTR lParam2, int msTimeout);
  /*[id(0x60020002)]*/ int WaitForCompletion(int msTimeout, out int pEvCode);
  /*[id(0x60020003)]*/ int CancelDefaultHandling(int lEvCode);
  /*[id(0x60020004)]*/ int RestoreDefaultHandling(int lEvCode);
  /*[id(0x60020005)]*/ int FreeEventParams(int lEvCode, LONG_PTR lParam1, LONG_PTR lParam2);
}

// IMediaEventEx interface
interface IMediaEventEx : IMediaEvent {
  mixin(uuid("56a868c0-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a868c0, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60030000)]*/ int SetNotifyWindow(LONG_PTR hwnd, int lMsg, LONG_PTR lInstanceData);
  /*[id(0x60030001)]*/ int SetNotifyFlags(int lNoNotifyFlags);
  /*[id(0x60030002)]*/ int GetNotifyFlags(out int lplNoNotifyFlags);
}

// IMediaPosition interface
interface IMediaPosition : IDispatch {
  mixin(uuid("56a868b2-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a868b2, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60020000)]*/ int get_Duration(out double plength);
  /*[id(0x60020001)]*/ int set_CurrentPosition(double pllTime);
  /*[id(0x60020001)]*/ int get_CurrentPosition(out double pllTime);
  /*[id(0x60020003)]*/ int get_StopTime(out double pllTime);
  /*[id(0x60020003)]*/ int set_StopTime(double pllTime);
  /*[id(0x60020005)]*/ int get_PrerollTime(out double pllTime);
  /*[id(0x60020005)]*/ int set_PrerollTime(double pllTime);
  /*[id(0x60020007)]*/ int set_Rate(double pdRate);
  /*[id(0x60020007)]*/ int get_Rate(out double pdRate);
  /*[id(0x60020009)]*/ int CanSeekForward(out int pCanSeekForward);
  /*[id(0x6002000A)]*/ int CanSeekBackward(out int pCanSeekBackward);
}

// IBasicAudio interface
interface IBasicAudio : IDispatch {
  mixin(uuid("56a868b3-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a868b3, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60020000)]*/ int set_Volume(int plVolume);
  /*[id(0x60020000)]*/ int get_Volume(out int plVolume);
  /*[id(0x60020002)]*/ int set_Balance(int plBalance);
  /*[id(0x60020002)]*/ int get_Balance(out int plBalance);
}

// IVideoWindow interface
interface IVideoWindow : IDispatch {
  mixin(uuid("56a868b4-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a868b4, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60020000)]*/ int set_Caption(wchar* strCaption);
  /*[id(0x60020000)]*/ int get_Caption(out wchar* strCaption);
  /*[id(0x60020002)]*/ int set_WindowStyle(int WindowStyle);
  /*[id(0x60020002)]*/ int get_WindowStyle(out int WindowStyle);
  /*[id(0x60020004)]*/ int set_WindowStyleEx(int WindowStyleEx);
  /*[id(0x60020004)]*/ int get_WindowStyleEx(out int WindowStyleEx);
  /*[id(0x60020006)]*/ int set_AutoShow(int AutoShow);
  /*[id(0x60020006)]*/ int get_AutoShow(out int AutoShow);
  /*[id(0x60020008)]*/ int set_WindowState(int WindowState);
  /*[id(0x60020008)]*/ int get_WindowState(out int WindowState);
  /*[id(0x6002000A)]*/ int set_BackgroundPalette(int pBackgroundPalette);
  /*[id(0x6002000A)]*/ int get_BackgroundPalette(out int pBackgroundPalette);
  /*[id(0x6002000C)]*/ int set_Visible(int pVisible);
  /*[id(0x6002000C)]*/ int get_Visible(out int pVisible);
  /*[id(0x6002000E)]*/ int set_Left(int pLeft);
  /*[id(0x6002000E)]*/ int get_Left(out int pLeft);
  /*[id(0x60020010)]*/ int set_Width(int pWidth);
  /*[id(0x60020010)]*/ int get_Width(out int pWidth);
  /*[id(0x60020012)]*/ int set_Top(int pTop);
  /*[id(0x60020012)]*/ int get_Top(out int pTop);
  /*[id(0x60020014)]*/ int set_Height(int pHeight);
  /*[id(0x60020014)]*/ int get_Height(out int pHeight);
  /*[id(0x60020016)]*/ int set_Owner(LONG_PTR Owner);
  /*[id(0x60020016)]*/ int get_Owner(out LONG_PTR Owner);
  /*[id(0x60020018)]*/ int set_MessageDrain(LONG_PTR Drain);
  /*[id(0x60020018)]*/ int get_MessageDrain(out LONG_PTR Drain);
  /*[id(0x6002001A)]*/ int get_BorderColor(out int Color);
  /*[id(0x6002001A)]*/ int set_BorderColor(int Color);
  /*[id(0x6002001C)]*/ int get_FullScreenMode(out int FullScreenMode);
  /*[id(0x6002001C)]*/ int set_FullScreenMode(int FullScreenMode);
  /*[id(0x6002001E)]*/ int SetWindowForeground(int Focus);
  /*[id(0x6002001F)]*/ int NotifyOwnerMessage(LONG_PTR hwnd, int uMsg, LONG_PTR wParam, LONG_PTR lParam);
  /*[id(0x60020020)]*/ int SetWindowPosition(int Left, int Top, int Width, int Height);
  /*[id(0x60020021)]*/ int GetWindowPosition(out int pLeft, out int pTop, out int pWidth, out int pHeight);
  /*[id(0x60020022)]*/ int GetMinIdealImageSize(out int pWidth, out int pHeight);
  /*[id(0x60020023)]*/ int GetMaxIdealImageSize(out int pWidth, out int pHeight);
  /*[id(0x60020024)]*/ int GetRestorePosition(out int pLeft, out int pTop, out int pWidth, out int pHeight);
  /*[id(0x60020025)]*/ int HideCursor(int HideCursor);
  /*[id(0x60020026)]*/ int IsCursorHidden(out int CursorHidden);
}

// IBasicVideo interface
interface IBasicVideo : IDispatch {
  mixin(uuid("56a868b5-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a868b5, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60020000)]*/ int get_AvgTimePerFrame(out double pAvgTimePerFrame);
  /*[id(0x60020001)]*/ int get_BitRate(out int pBitRate);
  /*[id(0x60020002)]*/ int get_BitErrorRate(out int pBitErrorRate);
  /*[id(0x60020003)]*/ int get_VideoWidth(out int pVideoWidth);
  /*[id(0x60020004)]*/ int get_VideoHeight(out int pVideoHeight);
  /*[id(0x60020005)]*/ int set_SourceLeft(int pSourceLeft);
  /*[id(0x60020005)]*/ int get_SourceLeft(out int pSourceLeft);
  /*[id(0x60020007)]*/ int set_SourceWidth(int pSourceWidth);
  /*[id(0x60020007)]*/ int get_SourceWidth(out int pSourceWidth);
  /*[id(0x60020009)]*/ int set_SourceTop(int pSourceTop);
  /*[id(0x60020009)]*/ int get_SourceTop(out int pSourceTop);
  /*[id(0x6002000B)]*/ int set_SourceHeight(int pSourceHeight);
  /*[id(0x6002000B)]*/ int get_SourceHeight(out int pSourceHeight);
  /*[id(0x6002000D)]*/ int set_DestinationLeft(int pDestinationLeft);
  /*[id(0x6002000D)]*/ int get_DestinationLeft(out int pDestinationLeft);
  /*[id(0x6002000F)]*/ int set_DestinationWidth(int pDestinationWidth);
  /*[id(0x6002000F)]*/ int get_DestinationWidth(out int pDestinationWidth);
  /*[id(0x60020011)]*/ int set_DestinationTop(int pDestinationTop);
  /*[id(0x60020011)]*/ int get_DestinationTop(out int pDestinationTop);
  /*[id(0x60020013)]*/ int set_DestinationHeight(int pDestinationHeight);
  /*[id(0x60020013)]*/ int get_DestinationHeight(out int pDestinationHeight);
  /*[id(0x60020015)]*/ int SetSourcePosition(int Left, int Top, int Width, int Height);
  /*[id(0x60020016)]*/ int GetSourcePosition(out int pLeft, out int pTop, out int pWidth, out int pHeight);
  /*[id(0x60020017)]*/ int SetDefaultSourcePosition();
  /*[id(0x60020018)]*/ int SetDestinationPosition(int Left, int Top, int Width, int Height);
  /*[id(0x60020019)]*/ int GetDestinationPosition(out int pLeft, out int pTop, out int pWidth, out int pHeight);
  /*[id(0x6002001A)]*/ int SetDefaultDestinationPosition();
  /*[id(0x6002001B)]*/ int GetVideoSize(out int pWidth, out int pHeight);
  /*[id(0x6002001C)]*/ int GetVideoPaletteEntries(int StartIndex, int Entries, out int pRetrieved, out int pPalette);
  /*[id(0x6002001D)]*/ int GetCurrentImage(ref int pBufferSize, out int pDIBImage);
  /*[id(0x6002001E)]*/ int IsUsingDefaultSource();
  /*[id(0x6002001F)]*/ int IsUsingDefaultDestination();
}

// IBasicVideo2
interface IBasicVideo2 : IBasicVideo {
  mixin(uuid("329bb360-f6ea-11d1-9038-00a0c9697298"));
  // static DWINGUID IID = { 0x329bb360, 0xf6ea, 0x11d1, 0x90, 0x38, 0x00, 0xa0, 0xc9, 0x69, 0x72, 0x98 };
  /*[id(0x60030000)]*/ int GetPreferredAspectRatio(out int plAspectX, out int plAspectY);
}

// IDeferredCommand
interface IDeferredCommand : IUnknown {
  mixin(uuid("56a868b8-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a868b8, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60010000)]*/ int Cancel();
  /*[id(0x60010001)]*/ int Confidence(out int pConfidence);
  /*[id(0x60010002)]*/ int Postpone(double newtime);
  /*[id(0x60010003)]*/ int GetHResult(out int phrResult);
}

// IQueueCommand
interface IQueueCommand : IUnknown {
  mixin(uuid("56a868b7-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a868b7, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60010000)]*/ int InvokeAtStreamTime(out IDeferredCommand pCmd, double time, ref DWINGUID iid, int dispidMethod, short wFlags, int cArgs, DWINVARIANT* pDispParams, ref DWINVARIANT pvarResult, out short puArgErr);
  /*[id(0x60010001)]*/ int InvokeAtPresentationTime(out IDeferredCommand pCmd, double time, ref DWINGUID iid, int dispidMethod, short wFlags, int cArgs, DWINVARIANT* pDispParams, ref DWINVARIANT pvarResult, out short puArgErr);
}

// FilterInfo
interface IFilterInfo : IDispatch {
  mixin(uuid("56a868ba-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a868ba, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60020000)]*/ int FindPin(wchar* strPinID, out IDispatch ppUnk);
  /*[id(0x60020001)]*/ int get_Name(out wchar* strName);
  /*[id(0x60020002)]*/ int get_VendorInfo(out wchar* strVendorInfo);
  /*[id(0x60020003)]*/ int get_Filter(out IUnknown ppUnk);
  /*[id(0x60020004)]*/ int get_Pins(out IDispatch ppUnk);
  /*[id(0x60020005)]*/ int get_IsFileSource(out int pbIsSource);
  /*[id(0x60020006)]*/ int get_Filename(out wchar* pstrFilename);
  /*[id(0x60020006)]*/ int set_Filename(wchar* pstrFilename);
}

// Registry Filter Info
interface IRegFilterInfo : IDispatch {
  mixin(uuid("56a868bb-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a868bb, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60020000)]*/ int get_Name(out wchar* strName);
  /*[id(0x60020001)]*/ int Filter(out IDispatch ppUnk);
}

// Media Type
interface IMediaTypeInfo : IDispatch {
  mixin(uuid("56a868bc-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a868bc, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60020000)]*/ int get_Type(out wchar* strType);
  /*[id(0x60020001)]*/ int get_Subtype(out wchar* strType);
}

// Pin Info
interface IPinInfo : IDispatch {
  mixin(uuid("56a868bd-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a868bd, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60020000)]*/ int get_Pin(out IUnknown ppUnk);
  /*[id(0x60020001)]*/ int get_ConnectedTo(out IDispatch ppUnk);
  /*[id(0x60020002)]*/ int get_ConnectionMediaType(out IDispatch ppUnk);
  /*[id(0x60020003)]*/ int get_FilterInfo(out IDispatch ppUnk);
  /*[id(0x60020004)]*/ int get_Name(out wchar* ppUnk);
  /*[id(0x60020005)]*/ int get_Direction(out int ppDirection);
  /*[id(0x60020006)]*/ int get_PinID(out wchar* strPinID);
  /*[id(0x60020007)]*/ int get_MediaTypes(out IDispatch ppUnk);
  /*[id(0x60020008)]*/ int Connect(IUnknown pPin);
  /*[id(0x60020009)]*/ int ConnectDirect(IUnknown pPin);
  /*[id(0x6002000A)]*/ int ConnectWithType(IUnknown pPin, IDispatch pMediaType);
  /*[id(0x6002000B)]*/ int Disconnect();
  /*[id(0x6002000C)]*/ int Render();
}

// Statistics
interface IAMStats : IDispatch {
  mixin(uuid("bc9bcf80-dcd2-11d2-abf6-00a0c905f375"));
  // static DWINGUID IID = { 0xbc9bcf80, 0xdcd2, 0x11d2, 0xab, 0xf6, 0x00, 0xa0, 0xc9, 0x05, 0xf3, 0x75 };
  /*[id(0x60020000)]*/ int Reset();
  /*[id(0x60020001)]*/ int get_Count(out int plCount);
  /*[id(0x60020002)]*/ int GetValueByIndex(int lIndex, out wchar* szName, out int lCount, out double dLast, out double dAverage, out double dStdDev, out double dMin, out double dMax);
  /*[id(0x60020003)]*/ int GetValueByName(wchar* szName, out int lIndex, out int lCount, out double dLast, out double dAverage, out double dStdDev, out double dMin, out double dMax);
  /*[id(0x60020004)]*/ int GetIndex(wchar* szName, int lCreate, out int plIndex);
  /*[id(0x60020005)]*/ int AddValue(int lIndex, double dValue);
}

// CoClasses

// Filtergraph type info
abstract class FilgraphManager {
  mixin(uuid("e436ebb3-524f-11ce-9f53-0020af0ba770"));
  // static DWINGUID CLSID = { 0xe436ebb3, 0x524f, 0x11ce, 0x9f, 0x53, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  mixin Interfaces!(IMediaControl, IMediaEvent, IMediaPosition, IBasicAudio, IBasicVideo, IVideoWindow);
}
