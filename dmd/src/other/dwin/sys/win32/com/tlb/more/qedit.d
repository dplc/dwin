// Dexter 1.0 Type Library
// Version 1.0

/*[uuid("78530b68-61f9-11d2-8cad-00a024580902")]*/
//module dwin.sys.win32.com.tlb.more.dexter;
module dwin.sys.win32.com.tlb.more.qedit;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum __MIDL___MIDL_itf_qedit_0000_0007 {
  TIMELINE_MAJOR_TYPE_COMPOSITE = 0x00000001,
  TIMELINE_MAJOR_TYPE_TRACK = 0x00000002,
  TIMELINE_MAJOR_TYPE_SOURCE = 0x00000004,
  TIMELINE_MAJOR_TYPE_TRANSITION = 0x00000008,
  TIMELINE_MAJOR_TYPE_EFFECT = 0x00000010,
  TIMELINE_MAJOR_TYPE_GROUP = 0x00000080,
}

enum _FilterState {
  State_Stopped = 0x00000000,
  State_Paused = 0x00000001,
  State_Running = 0x00000002,
}

enum _PinDirection {
  PINDIR_INPUT = 0x00000000,
  PINDIR_OUTPUT = 0x00000001,
}

// Structs

struct _AMMediaType {
 DWINGUID majortype;
 DWINGUID subtype;
  int bFixedSizeSamples;
  int bTemporalCompression;
  uint lSampleSize;
 DWINGUID formattype;
  IUnknown pUnk;
  uint cbFormat;
  ubyte* pbFormat;
}

struct __MIDL___MIDL_itf_qedit_0000_0002 {
  wchar* Name;
  int dispID;
  int nValues;
}

struct __MIDL___MIDL_itf_qedit_0000_0003 {
  DWINVARIANT v;
  long rt;
  uint dwInterp;
}

struct _LARGE_INTEGER {
  long QuadPart;
}

struct _ULARGE_INTEGER {
  ulong QuadPart;
}

struct tagSTATSTG {
  wchar* pwcsName;
  uint Type;
  _ULARGE_INTEGER cbSize;
  _FILETIME mtime;
  _FILETIME ctime;
  _FILETIME atime;
  uint grfMode;
  uint grfLocksSupported;
 DWINGUID clsid;
  uint grfStateBits;
  uint reserved;
}

struct _FILETIME {
  uint dwLowDateTime;
  uint dwHighDateTime;
}

struct _PinInfo {
  IBaseFilter pFilter;
  _PinDirection dir;
  ushort[128] achName;
}

struct _FilterInfo {
  ushort[128] achName;
  IFilterGraph pGraph;
}

// Aliases

alias __MIDL___MIDL_itf_qedit_0000_0002 DEXTER_PARAM;

alias __MIDL___MIDL_itf_qedit_0000_0003 DEXTER_VALUE;

alias __MIDL___MIDL_itf_qedit_0000_0007 TIMELINE_MAJOR_TYPE;

alias int LONG_PTR;

alias uint ULONG_PTR;

// Interfaces

// IResize Interface
interface IResize : IUnknown {
  mixin(uuid("4ada63a0-72d5-11d2-952a-0060081840bc"));
  // static DWINGUID IID = { 0x4ada63a0, 0x72d5, 0x11d2, 0x95, 0x2a, 0x00, 0x60, 0x08, 0x18, 0x40, 0xbc };
  /*[id(0x60010000)]*/ int get_Size(out int piHeight, out int piWidth, out int pFlag);
  /*[id(0x60010001)]*/ int get_InputSize(out int piHeight, out int piWidth);
  /*[id(0x60010002)]*/ int put_Size(int Height, int Width, int Flag);
  /*[id(0x60010003)]*/ int get_MediaType(out _AMMediaType pmt);
  /*[id(0x60010004)]*/ int put_MediaType(_AMMediaType* pmt);
}

// IAMTimeline Interface
interface IAMTimeline : IUnknown {
  mixin(uuid("78530b74-61f9-11d2-8cad-00a024580902"));
  // static DWINGUID IID = { 0x78530b74, 0x61f9, 0x11d2, 0x8c, 0xad, 0x00, 0xa0, 0x24, 0x58, 0x09, 0x02 };
  // method CreateEmptyNode
  /*[id(0x60010000)]*/ int CreateEmptyNode(out IAMTimelineObj ppObj, TIMELINE_MAJOR_TYPE Type);
  /*[id(0x60010001)]*/ int AddGroup(IAMTimelineObj pGroup);
  /*[id(0x60010002)]*/ int RemGroupFromList(IAMTimelineObj pGroup);
  /*[id(0x60010003)]*/ int GetGroup(out IAMTimelineObj ppGroup, int WhichGroup);
  /*[id(0x60010004)]*/ int GetGroupCount(int* pCount);
  /*[id(0x60010005)]*/ int ClearAllGroups();
  /*[id(0x60010006)]*/ int GetInsertMode(int* pMode);
  // method SetInsertMode
  /*[id(0x60010007)]*/ int SetInsertMode(int Mode);
  // method EnableTransitions
  /*[id(0x60010008)]*/ int EnableTransitions(int fEnabled);
  // method TransitionsEnabled
  /*[id(0x60010009)]*/ int TransitionsEnabled(int* pfEnabled);
  // method EnableEffects
  /*[id(0x6001000A)]*/ int EnableEffects(int fEnabled);
  // method EffectsEnabled
  /*[id(0x6001000B)]*/ int EffectsEnabled(int* pfEnabled);
  // method SetInterestRange
  /*[id(0x6001000C)]*/ int SetInterestRange(long Start, long Stop);
  // method GetDuration
  /*[id(0x6001000D)]*/ int GetDuration(long* pDuration);
  // method GetDuration2
  /*[id(0x6001000E)]*/ int GetDuration2(double* pDuration);
  // method SetDefaultFPS
  /*[id(0x6001000F)]*/ int SetDefaultFPS(double FPS);
  // method GetDefaultFPS
  /*[id(0x60010010)]*/ int GetDefaultFPS(double* pFPS);
  // method IsDirty
  /*[id(0x60010011)]*/ int IsDirty(int* pDirty);
  // method GetDirtyRange
  /*[id(0x60010012)]*/ int GetDirtyRange(long* pStart, long* pStop);
  // method GetCountOfType
  /*[id(0x60010013)]*/ int GetCountOfType(int Group, int* pVal, int* pValWithComps, TIMELINE_MAJOR_TYPE majortype);
  /*[id(0x60010014)]*/ int ValidateSourceNames(int ValidateFlags, IMediaLocator pOverride, LONG_PTR NotifyEventHandle);
  /*[id(0x60010015)]*/ int SetDefaultTransition(ref DWINGUID pGuid);
  /*[id(0x60010016)]*/ int GetDefaultTransition(ref DWINGUID pGuid);
  /*[id(0x60010017)]*/ int SetDefaultEffect(ref DWINGUID pGuid);
  /*[id(0x60010018)]*/ int GetDefaultEffect(ref DWINGUID pGuid);
  /*[id(0x60010019)]*/ int SetDefaultTransitionB(wchar* pGuid);
  /*[id(0x6001001A)]*/ int GetDefaultTransitionB(out wchar* pGuid);
  /*[id(0x6001001B)]*/ int SetDefaultEffectB(wchar* pGuid);
  /*[id(0x6001001C)]*/ int GetDefaultEffectB(out wchar* pGuid);
}

// IAMTimelineObj Interface
interface IAMTimelineObj : IUnknown {
  mixin(uuid("78530b77-61f9-11d2-8cad-00a024580902"));
  // static DWINGUID IID = { 0x78530b77, 0x61f9, 0x11d2, 0x8c, 0xad, 0x00, 0xa0, 0x24, 0x58, 0x09, 0x02 };
  // method GetStartStop
  /*[id(0x60010000)]*/ int GetStartStop(long* pStart, long* pStop);
  // method GetStartStop2
  /*[id(0x60010001)]*/ int GetStartStop2(double* pStart, double* pStop);
  // method FixTimes
  /*[id(0x60010002)]*/ int FixTimes(long* pStart, long* pStop);
  // method FixTimes2
  /*[id(0x60010003)]*/ int FixTimes2(double* pStart, double* pStop);
  // method SetStartStop
  /*[id(0x60010004)]*/ int SetStartStop(long Start, long Stop);
  // method SetStartStop2
  /*[id(0x60010005)]*/ int SetStartStop2(double Start, double Stop);
  // method GetPropertySetter
  /*[id(0x60010006)]*/ int GetPropertySetter(out IPropertySetter pVal);
  // method SetPropertySetter
  /*[id(0x60010007)]*/ int SetPropertySetter(IPropertySetter newVal);
  // method GetSubObject
  /*[id(0x60010008)]*/ int GetSubObject(out IUnknown pVal);
  // method SetSubObject
  /*[id(0x60010009)]*/ int SetSubObject(IUnknown newVal);
  // method SetSubObjectGUID
  /*[id(0x6001000A)]*/ int SetSubObjectGUID(DWINGUID newVal);
  // method SetSubObjectGUIDByBSTR
  /*[id(0x6001000B)]*/ int SetSubObjectGUIDB(wchar* newVal);
  // method GetSubObjectGUID
  /*[id(0x6001000C)]*/ int GetSubObjectGUID(ref DWINGUID pVal);
  // method GetSubObjectGUIDByBSTR
  /*[id(0x6001000D)]*/ int GetSubObjectGUIDB(out wchar* pVal);
  // method GetSubObjectLoaded
  /*[id(0x6001000E)]*/ int GetSubObjectLoaded(int* pVal);
  // method GetTimelineType
  /*[id(0x6001000F)]*/ int GetTimelineType(TIMELINE_MAJOR_TYPE* pVal);
  // method SetTimelineType
  /*[id(0x60010010)]*/ int SetTimelineType(TIMELINE_MAJOR_TYPE newVal);
  // method GetUserID
  /*[id(0x60010011)]*/ int GetUserID(int* pVal);
  // method SetUserID
  /*[id(0x60010012)]*/ int SetUserID(int newVal);
  // method GetGenID
  /*[id(0x60010013)]*/ int GetGenID(int* pVal);
  // method GetUserName
  /*[id(0x60010014)]*/ int GetUserName(out wchar* pVal);
  // method SetUserName
  /*[id(0x60010015)]*/ int SetUserName(wchar* newVal);
  // method GetUserData
  /*[id(0x60010016)]*/ int GetUserData(ubyte* pData, int* pSize);
  // method SetUserData
  /*[id(0x60010017)]*/ int SetUserData(ubyte* pData, int Size);
  // method GetMuted
  /*[id(0x60010018)]*/ int GetMuted(int* pVal);
  // method SetMuted
  /*[id(0x60010019)]*/ int SetMuted(int newVal);
  // method GetLocked
  /*[id(0x6001001A)]*/ int GetLocked(int* pVal);
  // method SetLocked
  /*[id(0x6001001B)]*/ int SetLocked(int newVal);
  // method GetDirtyRange
  /*[id(0x6001001C)]*/ int GetDirtyRange(long* pStart, long* pStop);
  // method GetDirtyRange
  /*[id(0x6001001D)]*/ int GetDirtyRange2(double* pStart, double* pStop);
  // method SetDirtyRange
  /*[id(0x6001001E)]*/ int SetDirtyRange(long Start, long Stop);
  // method SetDirtyRange
  /*[id(0x6001001F)]*/ int SetDirtyRange2(double Start, double Stop);
  // method ClearDirty
  /*[id(0x60010020)]*/ int ClearDirty();
  // method Remove
  /*[id(0x60010021)]*/ int Remove();
  // method RemoveAll
  /*[id(0x60010022)]*/ int RemoveAll();
  /*[id(0x60010023)]*/ int GetTimelineNoRef(IAMTimeline* ppResult);
  /*[id(0x60010024)]*/ int GetGroupIBelongTo(out IAMTimelineGroup ppGroup);
  /*[id(0x60010025)]*/ int GetEmbedDepth(int* pVal);
}

// IPropertySetter Interface
interface IPropertySetter : IUnknown {
  mixin(uuid("ae9472bd-b0c3-11d2-8d24-00a0c9441e20"));
  // static DWINGUID IID = { 0xae9472bd, 0xb0c3, 0x11d2, 0x8d, 0x24, 0x00, 0xa0, 0xc9, 0x44, 0x1e, 0x20 };
  /*[id(0x60010000)]*/ int LoadXML(IUnknown pxml);
  /*[id(0x60010001)]*/ int PrintXML(out ubyte pszXML, int cbXML, out int pcbPrinted, int indent);
  /*[id(0x60010002)]*/ int CloneProps(out IPropertySetter ppSetter, long rtStart, long rtStop);
  /*[id(0x60010003)]*/ int AddProp(DEXTER_PARAM Param, DEXTER_VALUE* paValue);
  /*[id(0x60010004)]*/ int GetProps(out int pcParams, out DEXTER_PARAM paParam, out DEXTER_VALUE paValue);
  /*[id(0x60010005)]*/ int FreeProps(int cParams, DEXTER_PARAM* paParam, DEXTER_VALUE* paValue);
  /*[id(0x60010006)]*/ int ClearProps();
  /*[id(0x60010007)]*/ int SaveToBlob(out int pcSize, out ubyte ppb);
  /*[id(0x60010008)]*/ int LoadFromBlob(int cSize, ubyte* pb);
  /*[id(0x60010009)]*/ int SetProps(IUnknown pTarget, long rtNow);
  /*[id(0x6001000A)]*/ int PrintXMLW(out ushort pszXML, int cchXML, out int pcchPrinted, int indent);
}

// IAMTimelineGroup Interface
interface IAMTimelineGroup : IUnknown {
  mixin(uuid("9eed4f00-b8a6-11d2-8023-00c0df10d434"));
  // static DWINGUID IID = { 0x9eed4f00, 0xb8a6, 0x11d2, 0x80, 0x23, 0x00, 0xc0, 0xdf, 0x10, 0xd4, 0x34 };
  // method SetTimeline
  /*[id(0x60010000)]*/ int SetTimeline(IAMTimeline pTimeline);
  // method GetTimeline
  /*[id(0x60010001)]*/ int GetTimeline(out IAMTimeline ppTimeline);
  // method GetPriority
  /*[id(0x60010002)]*/ int GetPriority(int* pPriority);
  // method GetMediaType
  /*[id(0x60010003)]*/ int GetMediaType(out _AMMediaType __MIDL_0043);
  // method SetMediaType
  /*[id(0x60010004)]*/ int SetMediaType(_AMMediaType* __MIDL_0044);
  // method SetOutputFPS
  /*[id(0x60010005)]*/ int SetOutputFPS(double FPS);
  // method GetOutputFPS
  /*[id(0x60010006)]*/ int GetOutputFPS(double* pFPS);
  // method SetGroupName
  /*[id(0x60010007)]*/ int SetGroupName(wchar* pGroupName);
  // method GetGroupName
  /*[id(0x60010008)]*/ int GetGroupName(out wchar* pGroupName);
  // method SetPreviewMode
  /*[id(0x60010009)]*/ int SetPreviewMode(int fPreview);
  // method GetPreviewMode
  /*[id(0x6001000A)]*/ int GetPreviewMode(int* pfPreview);
  // method SetMediaTypeForVB
  /*[id(0x6001000B)]*/ int SetMediaTypeForVB(int Val);
  // method GetOutputBuffering
  /*[id(0x6001000C)]*/ int GetOutputBuffering(out int pnBuffer);
  // method SetOutputBuffering
  /*[id(0x6001000D)]*/ int SetOutputBuffering(int nBuffer);
  /*[id(0x6001000E)]*/ int SetSmartRecompressFormat(int* pFormat);
  /*[id(0x6001000F)]*/ int GetSmartRecompressFormat(int** ppFormat);
  /*[id(0x60010010)]*/ int IsSmartRecompressFormatSet(int* pVal);
  /*[id(0x60010011)]*/ int IsRecompressFormatDirty(int* pVal);
  /*[id(0x60010012)]*/ int ClearRecompressFormatDirty();
  /*[id(0x60010013)]*/ int SetRecompFormatFromSource(IAMTimelineSrc pSource);
}

// IAMTimelineSrc Interface
interface IAMTimelineSrc : IUnknown {
  mixin(uuid("78530b79-61f9-11d2-8cad-00a024580902"));
  // static DWINGUID IID = { 0x78530b79, 0x61f9, 0x11d2, 0x8c, 0xad, 0x00, 0xa0, 0x24, 0x58, 0x09, 0x02 };
  // method GetMediaTimes
  /*[id(0x60010000)]*/ int GetMediaTimes(long* pStart, long* pStop);
  // method GetMediaTimes2
  /*[id(0x60010001)]*/ int GetMediaTimes2(double* pStart, double* pStop);
  // method ModifyStopTime
  /*[id(0x60010002)]*/ int ModifyStopTime(long Stop);
  // method ModifyStopTime2
  /*[id(0x60010003)]*/ int ModifyStopTime2(double Stop);
  // method FixMediaTimes
  /*[id(0x60010004)]*/ int FixMediaTimes(long* pStart, long* pStop);
  // method FixMediaTimes2
  /*[id(0x60010005)]*/ int FixMediaTimes2(double* pStart, double* pStop);
  // method SetMediaTimes
  /*[id(0x60010006)]*/ int SetMediaTimes(long Start, long Stop);
  // method SetMediaTimes2
  /*[id(0x60010007)]*/ int SetMediaTimes2(double Start, double Stop);
  // method SetMediaLength
  /*[id(0x60010008)]*/ int SetMediaLength(long Length);
  // method SetMediaLength2
  /*[id(0x60010009)]*/ int SetMediaLength2(double Length);
  // method GetMediaLength
  /*[id(0x6001000A)]*/ int GetMediaLength(long* pLength);
  // method GetMediaLength2
  /*[id(0x6001000B)]*/ int GetMediaLength2(double* pLength);
  // method GetMediaName
  /*[id(0x6001000C)]*/ int GetMediaName(out wchar* pVal);
  // method SetMediaName
  /*[id(0x6001000D)]*/ int SetMediaName(wchar* newVal);
  // method SpliceWithNext
  /*[id(0x6001000E)]*/ int SpliceWithNext(IAMTimelineObj pNext);
  // method GetStreamNumber
  /*[id(0x6001000F)]*/ int GetStreamNumber(int* pVal);
  // method SetStreamNumber
  /*[id(0x60010010)]*/ int SetStreamNumber(int Val);
  /*[id(0x60010011)]*/ int IsNormalRate(int* pVal);
  // method GetDefaultFPS
  /*[id(0x60010012)]*/ int GetDefaultFPS(double* pFPS);
  // method SetDefaultFPS
  /*[id(0x60010013)]*/ int SetDefaultFPS(double FPS);
  // method GetStretchMode
  /*[id(0x60010014)]*/ int GetStretchMode(int* pnStretchMode);
  // method SetStretchMode
  /*[id(0x60010015)]*/ int SetStretchMode(int nStretchMode);
}

// IMediaLocator Interface
interface IMediaLocator : IUnknown {
  mixin(uuid("288581e0-66ce-11d2-918f-00c0df10d434"));
  // static DWINGUID IID = { 0x288581e0, 0x66ce, 0x11d2, 0x91, 0x8f, 0x00, 0xc0, 0xdf, 0x10, 0xd4, 0x34 };
  /*[id(0x60010000)]*/ int FindMediaFile(wchar* Input, wchar* FilterString, wchar** pOutput, int Flags);
  /*[id(0x60010001)]*/ int AddFoundLocation(wchar* DirectoryName);
}

interface IPersistStream : IPersist {
  mixin(uuid("00000109-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00000109, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60020000)]*/ int IsDirty();
  /*[id(0x60020001)]*/ int Load(IStream pstm);
  /*[id(0x60020002)]*/ int Save(IStream pstm, int fClearDirty);
  /*[id(0x60020003)]*/ int GetSizeMax(out _ULARGE_INTEGER pcbSize);
}

interface IPersist : IUnknown {
  mixin(uuid("0000010c-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x0000010c, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int GetClassID(out DWINGUID pClassID);
}

interface IStream : ISequentialStream {
  mixin(uuid("0000000c-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x0000000c, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60020000)]*/ int RemoteSeek(_LARGE_INTEGER dlibMove, uint dwOrigin, out _ULARGE_INTEGER plibNewPosition);
  /*[id(0x60020001)]*/ int SetSize(_ULARGE_INTEGER libNewSize);
  /*[id(0x60020002)]*/ int RemoteCopyTo(IStream pstm, _ULARGE_INTEGER cb, out _ULARGE_INTEGER pcbRead, out _ULARGE_INTEGER pcbWritten);
  /*[id(0x60020003)]*/ int Commit(uint grfCommitFlags);
  /*[id(0x60020004)]*/ int Revert();
  /*[id(0x60020005)]*/ int LockRegion(_ULARGE_INTEGER libOffset, _ULARGE_INTEGER cb, uint dwLockType);
  /*[id(0x60020006)]*/ int UnlockRegion(_ULARGE_INTEGER libOffset, _ULARGE_INTEGER cb, uint dwLockType);
  /*[id(0x60020007)]*/ int Stat(out tagSTATSTG pstatstg, uint grfStatFlag);
  /*[id(0x60020008)]*/ int Clone(out IStream ppstm);
}

interface ISequentialStream : IUnknown {
  mixin(uuid("0c733a30-2a1c-11ce-ade5-00aa0044773d"));
  // static DWINGUID IID = { 0x0c733a30, 0x2a1c, 0x11ce, 0xad, 0xe5, 0x00, 0xaa, 0x00, 0x44, 0x77, 0x3d };
  /*[id(0x60010000)]*/ int RemoteRead(out ubyte pv, uint cb, out uint pcbRead);
  /*[id(0x60010001)]*/ int RemoteWrite(ubyte* pv, uint cb, out uint pcbWritten);
}

// IAMSetErrorLog Interface
interface IAMSetErrorLog : IUnknown {
  mixin(uuid("963566da-be21-4eaf-88e9-35704f8f52a1"));
  // static DWINGUID IID = { 0x963566da, 0xbe21, 0x4eaf, 0x88, 0xe9, 0x35, 0x70, 0x4f, 0x8f, 0x52, 0xa1 };
  // property ErrorLog
  /*[id(0x60010000)]*/ int get_ErrorLog(out IAMErrorLog pVal);
  // property ErrorLog
  /*[id(0x60010000)]*/ int set_ErrorLog(IAMErrorLog pVal);
}

// IAMErrorLog Interface
interface IAMErrorLog : IUnknown {
  mixin(uuid("e43e73a2-0efa-11d3-9601-00a0c9441e20"));
  // static DWINGUID IID = { 0xe43e73a2, 0x0efa, 0x11d3, 0x96, 0x01, 0x00, 0xa0, 0xc9, 0x44, 0x1e, 0x20 };
  // method LogError
  /*[id(0x60010000)]*/ int LogError(int Severity, wchar* pErrorString, int ErrorCode, int hresult, DWINVARIANT* pExtraInfo);
}

// IAMTimelineEffectable Interface
interface IAMTimelineEffectable : IUnknown {
  mixin(uuid("eae58537-622e-11d2-8cad-00a024580902"));
  // static DWINGUID IID = { 0xeae58537, 0x622e, 0x11d2, 0x8c, 0xad, 0x00, 0xa0, 0x24, 0x58, 0x09, 0x02 };
  // method EffectInsBefore
  /*[id(0x60010000)]*/ int EffectInsBefore(IAMTimelineObj pFX, int priority);
  // method EffectSwapPriorities
  /*[id(0x60010001)]*/ int EffectSwapPriorities(int PriorityA, int PriorityB);
  // method EffectGetCount
  /*[id(0x60010002)]*/ int EffectGetCount(int* pCount);
  // method GetEffect
  /*[id(0x60010003)]*/ int GetEffect(out IAMTimelineObj ppFx, int Which);
}

// IAMTimelineSplittable Interface
interface IAMTimelineSplittable : IUnknown {
  mixin(uuid("a0f840a0-d590-11d2-8d55-00a0c9441e20"));
  // static DWINGUID IID = { 0xa0f840a0, 0xd590, 0x11d2, 0x8d, 0x55, 0x00, 0xa0, 0xc9, 0x44, 0x1e, 0x20 };
  /*[id(0x60010000)]*/ int SplitAt(long Time);
  /*[id(0x60010001)]*/ int SplitAt2(double Time);
}

// IAMTimelineTrack Interface
interface IAMTimelineTrack : IUnknown {
  mixin(uuid("eae58538-622e-11d2-8cad-00a024580902"));
  // static DWINGUID IID = { 0xeae58538, 0x622e, 0x11d2, 0x8c, 0xad, 0x00, 0xa0, 0x24, 0x58, 0x09, 0x02 };
  // method SrcAdd
  /*[id(0x60010000)]*/ int SrcAdd(IAMTimelineObj pSource);
  // method GetNextSrc
  /*[id(0x60010001)]*/ int GetNextSrc(out IAMTimelineObj ppSrc, long* pInOut);
  // method GetNextSrc2
  /*[id(0x60010002)]*/ int GetNextSrc2(out IAMTimelineObj ppSrc, double* pInOut);
  // method MoveEverythingBy
  /*[id(0x60010003)]*/ int MoveEverythingBy(long Start, long MoveBy);
  // method MoveEverythingBy2
  /*[id(0x60010004)]*/ int MoveEverythingBy2(double Start, double MoveBy);
  // method GetSourcesCount
  /*[id(0x60010005)]*/ int GetSourcesCount(int* pVal);
  // method AreYouBlank
  /*[id(0x60010006)]*/ int AreYouBlank(int* pVal);
  // method GetSrcAtTime
  /*[id(0x60010007)]*/ int GetSrcAtTime(out IAMTimelineObj ppSrc, long Time, int SearchDirection);
  // method GetSrcAtTime2
  /*[id(0x60010008)]*/ int GetSrcAtTime2(out IAMTimelineObj ppSrc, double Time, int SearchDirection);
  /*[id(0x60010009)]*/ int InsertSpace(long rtStart, long rtEnd);
  /*[id(0x6001000A)]*/ int InsertSpace2(double rtStart, double rtEnd);
  /*[id(0x6001000B)]*/ int ZeroBetween(long rtStart, long rtEnd);
  /*[id(0x6001000C)]*/ int ZeroBetween2(double rtStart, double rtEnd);
  /*[id(0x6001000D)]*/ int GetNextSrcEx(IAMTimelineObj pLast, out IAMTimelineObj ppNext);
}

// IAMTimelineTransable Interface
interface IAMTimelineTransable : IUnknown {
  mixin(uuid("378fa386-622e-11d2-8cad-00a024580902"));
  // static DWINGUID IID = { 0x378fa386, 0x622e, 0x11d2, 0x8c, 0xad, 0x00, 0xa0, 0x24, 0x58, 0x09, 0x02 };
  // method TransAdd
  /*[id(0x60010000)]*/ int TransAdd(IAMTimelineObj pTrans);
  // method TransGetCount
  /*[id(0x60010001)]*/ int TransGetCount(int* pCount);
  // method GetNextTrans
  /*[id(0x60010002)]*/ int GetNextTrans(out IAMTimelineObj ppTrans, long* pInOut);
  // method GetNextTrans2
  /*[id(0x60010003)]*/ int GetNextTrans2(out IAMTimelineObj ppTrans, double* pInOut);
  // method GetTransAtTime
  /*[id(0x60010004)]*/ int GetTransAtTime(out IAMTimelineObj ppObj, long Time, int SearchDirection);
  // method GetTransAtTime2
  /*[id(0x60010005)]*/ int GetTransAtTime2(out IAMTimelineObj ppObj, double Time, int SearchDirection);
}

// IAMTimelineVirtualTrack Interface
interface IAMTimelineVirtualTrack : IUnknown {
  mixin(uuid("a8ed5f80-c2c7-11d2-8d39-00a0c9441e20"));
  // static DWINGUID IID = { 0xa8ed5f80, 0xc2c7, 0x11d2, 0x8d, 0x39, 0x00, 0xa0, 0xc9, 0x44, 0x1e, 0x20 };
  // method TrackGetPriority
  /*[id(0x60010000)]*/ int TrackGetPriority(int* pPriority);
  // method SetTrackDirty
  /*[id(0x60010001)]*/ int SetTrackDirty();
}

// IAMTimelineComp Interface
interface IAMTimelineComp : IUnknown {
  mixin(uuid("eae58536-622e-11d2-8cad-00a024580902"));
  // static DWINGUID IID = { 0xeae58536, 0x622e, 0x11d2, 0x8c, 0xad, 0x00, 0xa0, 0x24, 0x58, 0x09, 0x02 };
  // method VTrackInsBefore
  /*[id(0x60010000)]*/ int VTrackInsBefore(IAMTimelineObj pVirtualTrack, int priority);
  // method VTrackSwapPriorities
  /*[id(0x60010001)]*/ int VTrackSwapPriorities(int VirtualTrackA, int VirtualTrackB);
  // method VTrackGetCount
  /*[id(0x60010002)]*/ int VTrackGetCount(int* pVal);
  // method GetVTrack
  /*[id(0x60010003)]*/ int GetVTrack(out IAMTimelineObj ppVirtualTrack, int Which);
  // method GetCountOfType
  /*[id(0x60010004)]*/ int GetCountOfType(int* pVal, int* pValWithComps, TIMELINE_MAJOR_TYPE majortype);
  // method GetRecursiveLayerOfType
  /*[id(0x60010005)]*/ int GetRecursiveLayerOfType(out IAMTimelineObj ppVirtualTrack, int WhichLayer, TIMELINE_MAJOR_TYPE Type);
  // method GetRecursiveLayerOfTypeI (do not call)
  /*[id(0x60010006)]*/ int GetRecursiveLayerOfTypeI(out IAMTimelineObj ppVirtualTrack, ref int pWhichLayer, TIMELINE_MAJOR_TYPE Type);
  /*[id(0x60010007)]*/ int GetNextVTrack(IAMTimelineObj pVirtualTrack, out IAMTimelineObj ppNextVirtualTrack);
}

// IAMTimelineTrans Interface
interface IAMTimelineTrans : IUnknown {
  mixin(uuid("bce0c265-622d-11d2-8cad-00a024580902"));
  // static DWINGUID IID = { 0xbce0c265, 0x622d, 0x11d2, 0x8c, 0xad, 0x00, 0xa0, 0x24, 0x58, 0x09, 0x02 };
  // method GetCutPoint
  /*[id(0x60010000)]*/ int GetCutPoint(long* pTLTime);
  // method GetCutPoint2
  /*[id(0x60010001)]*/ int GetCutPoint2(double* pTLTime);
  // method SetCutPoint
  /*[id(0x60010002)]*/ int SetCutPoint(long TLTime);
  // method SetCutPoint2
  /*[id(0x60010003)]*/ int SetCutPoint2(double TLTime);
  // method GetSwapInputs
  /*[id(0x60010004)]*/ int GetSwapInputs(int* pVal);
  // method SetSwapInputs
  /*[id(0x60010005)]*/ int SetSwapInputs(int pVal);
  // method GetCutsOnly
  /*[id(0x60010006)]*/ int GetCutsOnly(int* pVal);
  // method SetCutsOnly
  /*[id(0x60010007)]*/ int SetCutsOnly(int pVal);
}

// IAMTimelineEffect Interface
interface IAMTimelineEffect : IUnknown {
  mixin(uuid("bce0c264-622d-11d2-8cad-00a024580902"));
  // static DWINGUID IID = { 0xbce0c264, 0x622d, 0x11d2, 0x8c, 0xad, 0x00, 0xa0, 0x24, 0x58, 0x09, 0x02 };
  // method EffectGetPriority
  /*[id(0x60010000)]*/ int EffectGetPriority(int* pVal);
}

interface IPropertyBag : IUnknown {
  mixin(uuid("55272a00-42cb-11ce-8135-00aa004bb851"));
  // static DWINGUID IID = { 0x55272a00, 0x42cb, 0x11ce, 0x81, 0x35, 0x00, 0xaa, 0x00, 0x4b, 0xb8, 0x51 };
  /*[id(0x60010000)]*/ int RemoteRead(wchar* pszPropName, out DWINVARIANT pVar, IErrorLog pErrorLog, uint varType, IUnknown pUnkObj);
  /*[id(0x60010001)]*/ int Write(wchar* pszPropName, DWINVARIANT* pVar);
}

interface IErrorLog : IUnknown {
  mixin(uuid("3127ca40-446e-11ce-8135-00aa004bb851"));
  // static DWINGUID IID = { 0x3127ca40, 0x446e, 0x11ce, 0x81, 0x35, 0x00, 0xaa, 0x00, 0x4b, 0xb8, 0x51 };
  /*[id(0x60010000)]*/ int AddError(wchar* pszPropName, EXCEPINFO* pExcepInfo);
}

// IRenderEngine Interface
interface IRenderEngine : IUnknown {
  mixin(uuid("6bee3a81-66c9-11d2-918f-00c0df10d434"));
  // static DWINGUID IID = { 0x6bee3a81, 0x66c9, 0x11d2, 0x91, 0x8f, 0x00, 0xc0, 0xdf, 0x10, 0xd4, 0x34 };
  /*[id(0x60010000)]*/ int SetTimelineObject(IAMTimeline pTimeline);
  /*[id(0x60010001)]*/ int GetTimelineObject(out IAMTimeline ppTimeline);
  /*[id(0x60010002)]*/ int GetFilterGraph(out IGraphBuilder ppFG);
  /*[id(0x60010003)]*/ int SetFilterGraph(IGraphBuilder pFG);
  /*[id(0x60010004)]*/ int SetInterestRange(long Start, long Stop);
  /*[id(0x60010005)]*/ int SetInterestRange2(double Start, double Stop);
  /*[id(0x60010006)]*/ int SetRenderRange(long Start, long Stop);
  /*[id(0x60010007)]*/ int SetRenderRange2(double Start, double Stop);
  /*[id(0x60010008)]*/ int GetGroupOutputPin(int Group, out IPin ppRenderPin);
  /*[id(0x60010009)]*/ int ScrapIt();
  /*[id(0x6001000A)]*/ int RenderOutputPins();
  /*[id(0x6001000B)]*/ int GetVendorString(out wchar* pVendorID);
  /*[id(0x6001000C)]*/ int ConnectFrontEnd();
  /*[id(0x6001000D)]*/ int SetSourceConnectCallback(IGrfCache pCallback);
  /*[id(0x6001000E)]*/ int SetDynamicReconnectLevel(int Level);
  /*[id(0x6001000F)]*/ int DoSmartRecompression();
  /*[id(0x60010010)]*/ int UseInSmartRecompressionGraph();
  /*[id(0x60010011)]*/ int SetSourceNameValidation(wchar* FilterString, IMediaLocator pOverride, int Flags);
  /*[id(0x60010012)]*/ int Commit();
  /*[id(0x60010013)]*/ int Decommit();
  /*[id(0x60010014)]*/ int GetCaps(int Index, int* pReturn);
}

interface IGraphBuilder : IFilterGraph {
  mixin(uuid("56a868a9-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a868a9, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60020000)]*/ int Connect(IPin ppinOut, IPin ppinIn);
  /*[id(0x60020001)]*/ int Render(IPin ppinOut);
  /*[id(0x60020002)]*/ int RenderFile(wchar* lpcwstrFile, wchar* lpcwstrPlayList);
  /*[id(0x60020003)]*/ int AddSourceFilter(wchar* lpcwstrFileName, wchar* lpcwstrFilterName, out IBaseFilter ppFilter);
  /*[id(0x60020004)]*/ int SetLogFile(ULONG_PTR hFile);
  /*[id(0x60020005)]*/ int Abort();
  /*[id(0x60020006)]*/ int ShouldOperationContinue();
}

interface IFilterGraph : IUnknown {
  mixin(uuid("56a8689f-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a8689f, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60010000)]*/ int AddFilter(IBaseFilter pFilter, wchar* pName);
  /*[id(0x60010001)]*/ int RemoveFilter(IBaseFilter pFilter);
  /*[id(0x60010002)]*/ int EnumFilters(out IEnumFilters ppEnum);
  /*[id(0x60010003)]*/ int FindFilterByName(wchar* pName, out IBaseFilter ppFilter);
  /*[id(0x60010004)]*/ int ConnectDirect(IPin ppinOut, IPin ppinIn, _AMMediaType* pmt);
  /*[id(0x60010005)]*/ int Reconnect(IPin pPin);
  /*[id(0x60010006)]*/ int Disconnect(IPin pPin);
  /*[id(0x60010007)]*/ int SetDefaultSyncSource();
}

interface IBaseFilter : IMediaFilter {
  mixin(uuid("56a86895-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a86895, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60030000)]*/ int EnumPins(out IEnumPins ppEnum);
  /*[id(0x60030001)]*/ int FindPin(wchar* Id, out IPin ppPin);
  /*[id(0x60030002)]*/ int QueryFilterInfo(out _FilterInfo pInfo);
  /*[id(0x60030003)]*/ int JoinFilterGraph(IFilterGraph pGraph, wchar* pName);
  /*[id(0x60030004)]*/ int QueryVendorInfo(out wchar* pVendorInfo);
}

interface IMediaFilter : IPersist {
  mixin(uuid("56a86899-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a86899, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60020000)]*/ int Stop();
  /*[id(0x60020001)]*/ int Pause();
  /*[id(0x60020002)]*/ int Run(long tStart);
  /*[id(0x60020003)]*/ int GetState(uint dwMilliSecsTimeout, out _FilterState State);
  /*[id(0x60020004)]*/ int SetSyncSource(IReferenceClock pClock);
  /*[id(0x60020005)]*/ int GetSyncSource(out IReferenceClock pClock);
}

interface IReferenceClock : IUnknown {
  mixin(uuid("56a86897-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a86897, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60010000)]*/ int GetTime(out long pTime);
  /*[id(0x60010001)]*/ int AdviseTime(long baseTime, long streamTime, ULONG_PTR hEvent, out ULONG_PTR pdwAdviseCookie);
  /*[id(0x60010002)]*/ int AdvisePeriodic(long startTime, long periodTime, ULONG_PTR hSemaphore, out ULONG_PTR pdwAdviseCookie);
  /*[id(0x60010003)]*/ int Unadvise(ULONG_PTR dwAdviseCookie);
}

interface IEnumPins : IUnknown {
  mixin(uuid("56a86892-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a86892, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60010000)]*/ int Next(uint cPins, out IPin ppPins, out uint pcFetched);
  /*[id(0x60010001)]*/ int Skip(uint cPins);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IEnumPins ppEnum);
}

interface IPin : IUnknown {
  mixin(uuid("56a86891-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a86891, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60010000)]*/ int Connect(IPin pReceivePin, _AMMediaType* pmt);
  /*[id(0x60010001)]*/ int ReceiveConnection(IPin pConnector, _AMMediaType* pmt);
  /*[id(0x60010002)]*/ int Disconnect();
  /*[id(0x60010003)]*/ int ConnectedTo(out IPin pPin);
  /*[id(0x60010004)]*/ int ConnectionMediaType(out _AMMediaType pmt);
  /*[id(0x60010005)]*/ int QueryPinInfo(out _PinInfo pInfo);
  /*[id(0x60010006)]*/ int QueryDirection(out _PinDirection pPinDir);
  /*[id(0x60010007)]*/ int QueryId(out wchar* Id);
  /*[id(0x60010008)]*/ int QueryAccept(_AMMediaType* pmt);
  /*[id(0x60010009)]*/ int EnumMediaTypes(out IEnumMediaTypes ppEnum);
  /*[id(0x6001000A)]*/ int QueryInternalConnections(out IPin apPin, ref uint nPin);
  /*[id(0x6001000B)]*/ int EndOfStream();
  /*[id(0x6001000C)]*/ int BeginFlush();
  /*[id(0x6001000D)]*/ int EndFlush();
  /*[id(0x6001000E)]*/ int NewSegment(long tStart, long tStop, double dRate);
}

interface IEnumMediaTypes : IUnknown {
  mixin(uuid("89c31040-846b-11ce-97d3-00aa0055595a"));
  // static DWINGUID IID = { 0x89c31040, 0x846b, 0x11ce, 0x97, 0xd3, 0x00, 0xaa, 0x00, 0x55, 0x59, 0x5a };
  /*[id(0x60010000)]*/ int Next(uint cMediaTypes, out _AMMediaType ppMediaTypes, out uint pcFetched);
  /*[id(0x60010001)]*/ int Skip(uint cMediaTypes);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IEnumMediaTypes ppEnum);
}

interface IEnumFilters : IUnknown {
  mixin(uuid("56a86893-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a86893, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60010000)]*/ int Next(uint cFilters, out IBaseFilter ppFilter, out uint pcFetched);
  /*[id(0x60010001)]*/ int Skip(uint cFilters);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IEnumFilters ppEnum);
}

// IGrfCache Interface
interface IGrfCache : IDispatch {
  mixin(uuid("ae9472be-b0c3-11d2-8d24-00a0c9441e20"));
  // static DWINGUID IID = { 0xae9472be, 0xb0c3, 0x11d2, 0x8d, 0x24, 0x00, 0xa0, 0xc9, 0x44, 0x1e, 0x20 };
  // method AddFilter
  /*[id(0x00000001)]*/ int AddFilter(IGrfCache ChainedCache, long Id, IBaseFilter pFilter, wchar* pName);
  // method ConnectPins
  /*[id(0x00000002)]*/ int ConnectPins(IGrfCache ChainedCache, long PinID1, IPin pPin1, long PinID2, IPin pPin2);
  // method SetGraph
  /*[id(0x00000003)]*/ int SetGraph(IGraphBuilder pGraph);
  // method DoConnectionsNow
  /*[id(0x00000004)]*/ int DoConnectionsNow();
}

// IRenderEngine2 Interface
interface IRenderEngine2 : IUnknown {
  mixin(uuid("6bee3a82-66c9-11d2-918f-00c0df10d434"));
  // static DWINGUID IID = { 0x6bee3a82, 0x66c9, 0x11d2, 0x91, 0x8f, 0x00, 0xc0, 0xdf, 0x10, 0xd4, 0x34 };
  /*[id(0x60010000)]*/ int SetResizerGUID(DWINGUID ResizerGuid);
}

// ISmartRenderEngine Interface
interface ISmartRenderEngine : IUnknown {
  mixin(uuid("f03fa8ce-879a-4d59-9b2c-26bb1cf83461"));
  // static DWINGUID IID = { 0xf03fa8ce, 0x879a, 0x4d59, 0x9b, 0x2c, 0x26, 0xbb, 0x1c, 0xf8, 0x34, 0x61 };
  /*[id(0x60010000)]*/ int SetGroupCompressor(int Group, IBaseFilter pCompressor);
  /*[id(0x60010001)]*/ int GetGroupCompressor(int Group, IBaseFilter* pCompressor);
  /*[id(0x60010002)]*/ int SetFindCompressorCB(IFindCompressorCB pCallback);
}

// IFindCompressorCB Interface
interface IFindCompressorCB : IUnknown {
  mixin(uuid("f03fa8de-879a-4d59-9b2c-26bb1cf83461"));
  // static DWINGUID IID = { 0xf03fa8de, 0x879a, 0x4d59, 0x9b, 0x2c, 0x26, 0xbb, 0x1c, 0xf8, 0x34, 0x61 };
  /*[id(0x60010000)]*/ int GetCompressor(_AMMediaType* pType, _AMMediaType* pCompType, out IBaseFilter ppFilter);
}

// IXml2Dex Interface
interface IXml2Dex : IDispatch {
  mixin(uuid("18c628ed-962a-11d2-8d08-00a0c9441e20"));
  // static DWINGUID IID = { 0x18c628ed, 0x962a, 0x11d2, 0x8d, 0x08, 0x00, 0xa0, 0xc9, 0x44, 0x1e, 0x20 };
  // method CreateGraphFromFile
  /*[id(0x00000001)]*/ int CreateGraphFromFile(out IUnknown ppGraph, IUnknown pTimeline, wchar* Filename);
  // method WriteGrfFile
  /*[id(0x00000002)]*/ int WriteGrfFile(IUnknown pGraph, wchar* Filename);
  // method WriteXMLFile
  /*[id(0x00000003)]*/ int WriteXMLFile(IUnknown pTimeline, wchar* Filename);
  // method ReadXMLFile
  /*[id(0x00000005)]*/ int ReadXMLFile(IUnknown pTimeline, wchar* XMLName);
  // method Delete
  /*[id(0x00000006)]*/ int Delete(IUnknown pTimeline, double dStart, double dEnd);
  // method WriteXMLPart
  /*[id(0x00000007)]*/ int WriteXMLPart(IUnknown pTimeline, double dStart, double dEnd, wchar* Filename);
  // method PasteXMLFile
  /*[id(0x00000008)]*/ int PasteXMLFile(IUnknown pTimeline, double dStart, wchar* Filename);
  // method CopyXML
  /*[id(0x00000009)]*/ int CopyXML(IUnknown pTimeline, double dStart, double dEnd);
  // method PasteXML
  /*[id(0x0000000A)]*/ int PasteXML(IUnknown pTimeline, double dStart);
  // method Reset
  /*[id(0x0000000B)]*/ int Reset();
  // method ReadXML
  /*[id(0x0000000C)]*/ int ReadXML(IUnknown pTimeline, IUnknown pxml);
  // method WriteXML
  /*[id(0x0000000D)]*/ int WriteXML(IUnknown pTimeline, wchar** pbstrXML);
}

// IMediaDet Interface
interface IMediaDet : IUnknown {
  mixin(uuid("65bd0710-24d2-4ff7-9324-ed2e5d3abafa"));
  // static DWINGUID IID = { 0x65bd0710, 0x24d2, 0x4ff7, 0x93, 0x24, 0xed, 0x2e, 0x5d, 0x3a, 0xba, 0xfa };
  // property Filter
  /*[id(0x00000001)]*/ int get_Filter(out IUnknown pVal);
  // property Filter
  /*[id(0x00000001)]*/ int set_Filter(IUnknown pVal);
  // property OutputStreams
  /*[id(0x00000002)]*/ int get_OutputStreams(out int pVal);
  // property CurrentStream
  /*[id(0x00000003)]*/ int get_CurrentStream(out int pVal);
  // property CurrentStream
  /*[id(0x00000003)]*/ int set_CurrentStream(int pVal);
  // property StreamType
  /*[id(0x00000004)]*/ int get_StreamType(out DWINGUID pVal);
  // property StreamTypeB
  /*[id(0x00000005)]*/ int get_StreamTypeB(out wchar* pVal);
  // property StreamLength
  /*[id(0x00000006)]*/ int get_StreamLength(out double pVal);
  // property Filename
  /*[id(0x00000007)]*/ int get_Filename(out wchar* pVal);
  // property Filename
  /*[id(0x00000007)]*/ int set_Filename(wchar* pVal);
  // method GetBitmapBits
  /*[id(0x00000008)]*/ int GetBitmapBits(double streamTime, int* pBufferSize, ubyte* pBuffer, int Width, int Height);
  // method WriteBitmapBits
  /*[id(0x00000009)]*/ int WriteBitmapBits(double streamTime, int Width, int Height, wchar* Filename);
  // property StreamMediaType
  /*[id(0x0000000A)]*/ int get_StreamMediaType(out _AMMediaType pVal);
  // method GetSampleGrabber
  /*[id(0x0000000B)]*/ int GetSampleGrabber(out ISampleGrabber ppVal);
  // property FrameRate
  /*[id(0x0000000C)]*/ int get_FrameRate(out double pVal);
  // method EnterBitmapGrabMode
  /*[id(0x0000000D)]*/ int EnterBitmapGrabMode(double SeekTime);
}

// ISampleGrabber Interface
interface ISampleGrabber : IUnknown {
  mixin(uuid("6b652fff-11fe-4fce-92ad-0266b5d7c78f"));
  // static DWINGUID IID = { 0x6b652fff, 0x11fe, 0x4fce, 0x92, 0xad, 0x02, 0x66, 0xb5, 0xd7, 0xc7, 0x8f };
  /*[id(0x60010000)]*/ int SetOneShot(int OneShot);
  /*[id(0x60010001)]*/ int SetMediaType(_AMMediaType* pType);
  /*[id(0x60010002)]*/ int GetConnectedMediaType(_AMMediaType* pType);
  /*[id(0x60010003)]*/ int SetBufferSamples(int BufferThem);
  /*[id(0x60010004)]*/ int GetCurrentBuffer(ref int pBufferSize, out int pBuffer);
  /*[id(0x60010005)]*/ int GetCurrentSample(out IMediaSample ppSample);
  /*[id(0x60010006)]*/ int SetCallback(ISampleGrabberCB pCallback, int WhichMethodToCallback);
}

interface IMediaSample : IUnknown {
  mixin(uuid("56a8689a-0ad4-11ce-b03a-0020af0ba770"));
  // static DWINGUID IID = { 0x56a8689a, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70 };
  /*[id(0x60010000)]*/ int GetPointer(out ubyte ppBuffer);
  /*[id(0x60010001)]*/ int GetSize();
  /*[id(0x60010002)]*/ int GetTime(out long pTimeStart, out long pTimeEnd);
  /*[id(0x60010003)]*/ int SetTime(long* pTimeStart, long* pTimeEnd);
  /*[id(0x60010004)]*/ int IsSyncPoint();
  /*[id(0x60010005)]*/ int SetSyncPoint(int bIsSyncPoint);
  /*[id(0x60010006)]*/ int IsPreroll();
  /*[id(0x60010007)]*/ int SetPreroll(int bIsPreroll);
  /*[id(0x60010008)]*/ int GetActualDataLength();
  /*[id(0x60010009)]*/ int SetActualDataLength(int __MIDL_0012);
  /*[id(0x6001000A)]*/ int GetMediaType(_AMMediaType** ppMediaType);
  /*[id(0x6001000B)]*/ int SetMediaType(_AMMediaType* pMediaType);
  /*[id(0x6001000C)]*/ int IsDiscontinuity();
  /*[id(0x6001000D)]*/ int SetDiscontinuity(int bDiscontinuity);
  /*[id(0x6001000E)]*/ int GetMediaTime(out long pTimeStart, out long pTimeEnd);
  /*[id(0x6001000F)]*/ int SetMediaTime(long* pTimeStart, long* pTimeEnd);
}

// ISampleGrabberCB Interface
interface ISampleGrabberCB : IUnknown {
  mixin(uuid("0579154a-2b53-4994-b0d0-e773148eff85"));
  // static DWINGUID IID = { 0x0579154a, 0x2b53, 0x4994, 0xb0, 0xd0, 0xe7, 0x73, 0x14, 0x8e, 0xff, 0x85 };
  /*[id(0x60010000)]*/ int SampleCB(double SampleTime, IMediaSample pSample);
  /*[id(0x60010001)]*/ int BufferCB(double SampleTime, ubyte* pBuffer, int BufferLen);
}

// IDxtCompositor Interface
interface IDxtCompositor : IDXEffect {
  mixin(uuid("bb44391e-6abd-422f-9e2e-385c9dff51fc"));
  // static DWINGUID IID = { 0xbb44391e, 0x6abd, 0x422f, 0x9e, 0x2e, 0x38, 0x5c, 0x9d, 0xff, 0x51, 0xfc };
  // property OffsetX
  /*[id(0x00000001)]*/ int get_OffsetX(out int pVal);
  // property OffsetX
  /*[id(0x00000001)]*/ int set_OffsetX(int pVal);
  // property OffsetY
  /*[id(0x00000002)]*/ int get_OffsetY(out int pVal);
  // property OffsetY
  /*[id(0x00000002)]*/ int set_OffsetY(int pVal);
  // property Width
  /*[id(0x00000003)]*/ int get_Width(out int pVal);
  // property Width
  /*[id(0x00000003)]*/ int set_Width(int pVal);
  // property Height
  /*[id(0x00000004)]*/ int get_Height(out int pVal);
  // property Height
  /*[id(0x00000004)]*/ int set_Height(int pVal);
  // property SrcOffsetX
  /*[id(0x00000005)]*/ int get_SrcOffsetX(out int pVal);
  // property SrcOffsetX
  /*[id(0x00000005)]*/ int set_SrcOffsetX(int pVal);
  // property SrcOffsetY
  /*[id(0x00000006)]*/ int get_SrcOffsetY(out int pVal);
  // property SrcOffsetY
  /*[id(0x00000006)]*/ int set_SrcOffsetY(int pVal);
  // property SrcWidth
  /*[id(0x00000007)]*/ int get_SrcWidth(out int pVal);
  // property SrcWidth
  /*[id(0x00000007)]*/ int set_SrcWidth(int pVal);
  // property SrcHeight
  /*[id(0x00000008)]*/ int get_SrcHeight(out int pVal);
  // property SrcHeight
  /*[id(0x00000008)]*/ int set_SrcHeight(int pVal);
}

// IDXEffect Interface
interface IDXEffect : IDispatch {
  mixin(uuid("e31fb81b-1335-11d1-8189-0000f87557db"));
  // static DWINGUID IID = { 0xe31fb81b, 0x1335, 0x11d1, 0x81, 0x89, 0x00, 0x00, 0xf8, 0x75, 0x57, 0xdb };
  /*[id(0x00002710)]*/ int get_Capabilities(out int pVal);
  /*[id(0x00002711)]*/ int get_Progress(out float pVal);
  /*[id(0x00002711)]*/ int set_Progress(float pVal);
  /*[id(0x00002712)]*/ int get_StepResolution(out float pVal);
  /*[id(0x00002713)]*/ int get_Duration(out float pVal);
  /*[id(0x00002713)]*/ int set_Duration(float pVal);
}

// IDxtAlphaSetter Interface
interface IDxtAlphaSetter : IDXEffect {
  mixin(uuid("4ee9ead9-da4d-43d0-9383-06b90c08b12b"));
  // static DWINGUID IID = { 0x4ee9ead9, 0xda4d, 0x43d0, 0x93, 0x83, 0x06, 0xb9, 0x0c, 0x08, 0xb1, 0x2b };
  // property Alpha
  /*[id(0x00000001)]*/ int get_Alpha(out int pVal);
  // property Alpha
  /*[id(0x00000001)]*/ int set_Alpha(int pVal);
  // property AlphaRamp
  /*[id(0x00000002)]*/ int get_AlphaRamp(out double pVal);
  // property AlphaRamp
  /*[id(0x00000002)]*/ int set_AlphaRamp(double pVal);
}

// IDxtJpeg Interface
interface IDxtJpeg : IDXEffect {
  mixin(uuid("de75d011-7a65-11d2-8cea-00a0c9441e20"));
  // static DWINGUID IID = { 0xde75d011, 0x7a65, 0x11d2, 0x8c, 0xea, 0x00, 0xa0, 0xc9, 0x44, 0x1e, 0x20 };
  // property MaskNum
  /*[id(0x00000001)]*/ int get_MaskNum(out int __MIDL_0021);
  // property MaskNum
  /*[id(0x00000001)]*/ int set_MaskNum(int __MIDL_0021);
  // property MaskName
  /*[id(0x00000002)]*/ int get_MaskName(out wchar* pVal);
  // property MaskName
  /*[id(0x00000002)]*/ int set_MaskName(wchar* pVal);
  // property ScaleX
  /*[id(0x00000003)]*/ int get_ScaleX(out double __MIDL_0023);
  // property ScaleX
  /*[id(0x00000003)]*/ int set_ScaleX(double __MIDL_0023);
  // property ScaleY
  /*[id(0x00000004)]*/ int get_ScaleY(out double __MIDL_0025);
  // property ScaleY
  /*[id(0x00000004)]*/ int set_ScaleY(double __MIDL_0025);
  // property OffsetX
  /*[id(0x00000005)]*/ int get_OffsetX(out int __MIDL_0027);
  // property OffsetX
  /*[id(0x00000005)]*/ int set_OffsetX(int __MIDL_0027);
  // property OffsetY
  /*[id(0x00000006)]*/ int get_OffsetY(out int __MIDL_0029);
  // property OffsetY
  /*[id(0x00000006)]*/ int set_OffsetY(int __MIDL_0029);
  // property ReplicateX
  /*[id(0x00000007)]*/ int get_ReplicateX(out int pVal);
  // property ReplicateX
  /*[id(0x00000007)]*/ int set_ReplicateX(int pVal);
  // property ReplicateY
  /*[id(0x00000008)]*/ int get_ReplicateY(out int pVal);
  // property ReplicateY
  /*[id(0x00000008)]*/ int set_ReplicateY(int pVal);
  // property BorderColor
  /*[id(0x00000009)]*/ int get_BorderColor(out int pVal);
  // property BorderColor
  /*[id(0x00000009)]*/ int set_BorderColor(int pVal);
  // property BorderWidth
  /*[id(0x0000000A)]*/ int get_BorderWidth(out int pVal);
  // property BorderWidth
  /*[id(0x0000000A)]*/ int set_BorderWidth(int pVal);
  // property BorderSoftness
  /*[id(0x0000000B)]*/ int get_BorderSoftness(out int pVal);
  // property BorderSoftness
  /*[id(0x0000000B)]*/ int set_BorderSoftness(int pVal);
  /*[id(0x60030016)]*/ int ApplyChanges();
  /*[id(0x60030017)]*/ int LoadDefSettings();
}

// IDxtKey Interface
interface IDxtKey : IDXEffect {
  mixin(uuid("3255de56-38fb-4901-b980-94b438010d7b"));
  // static DWINGUID IID = { 0x3255de56, 0x38fb, 0x4901, 0xb9, 0x80, 0x94, 0xb4, 0x38, 0x01, 0x0d, 0x7b };
  // property KeyType
  /*[id(0x00000001)]*/ int get_KeyType(out int __MIDL_0031);
  // property KeyType
  /*[id(0x00000001)]*/ int set_KeyType(int __MIDL_0031);
  // property Hue
  /*[id(0x00000002)]*/ int get_Hue(out int __MIDL_0033);
  // property Hue
  /*[id(0x00000002)]*/ int set_Hue(int __MIDL_0033);
  // property Luminance
  /*[id(0x00000003)]*/ int get_Luminance(out int __MIDL_0035);
  // property Luminance
  /*[id(0x00000003)]*/ int set_Luminance(int __MIDL_0035);
  // property RGB
  /*[id(0x00000004)]*/ int get_RGB(out uint __MIDL_0037);
  // property RGB
  /*[id(0x00000004)]*/ int set_RGB(uint __MIDL_0037);
  // property Similarity
  /*[id(0x00000005)]*/ int get_Similarity(out int __MIDL_0039);
  // property Similarity
  /*[id(0x00000005)]*/ int set_Similarity(int __MIDL_0039);
  // property Invert
  /*[id(0x00000006)]*/ int get_Invert(out int __MIDL_0041);
  // property Invert
  /*[id(0x00000006)]*/ int set_Invert(int __MIDL_0041);
}

// CoClasses

// AMTimeline Class
abstract class AMTimeline {
  mixin(uuid("78530b75-61f9-11d2-8cad-00a024580902"));
  // static DWINGUID CLSID = { 0x78530b75, 0x61f9, 0x11d2, 0x8c, 0xad, 0x00, 0xa0, 0x24, 0x58, 0x09, 0x02 };
  mixin Interfaces!(IAMTimeline, IPersistStream, IAMSetErrorLog);
}

// IAMTimelineObj Class
abstract class AMTimelineObj {
  mixin(uuid("78530b78-61f9-11d2-8cad-00a024580902"));
  // static DWINGUID CLSID = { 0x78530b78, 0x61f9, 0x11d2, 0x8c, 0xad, 0x00, 0xa0, 0x24, 0x58, 0x09, 0x02 };
  mixin Interfaces!(IAMTimelineObj);
}

// IAMTimelineSrc Class
abstract class AMTimelineSrc {
  mixin(uuid("78530b7a-61f9-11d2-8cad-00a024580902"));
  // static DWINGUID CLSID = { 0x78530b7a, 0x61f9, 0x11d2, 0x8c, 0xad, 0x00, 0xa0, 0x24, 0x58, 0x09, 0x02 };
  mixin Interfaces!(IAMTimelineSrc, IAMTimelineObj, IAMTimelineEffectable, IAMTimelineSplittable);
}

abstract class AMTimelineTrack {
  mixin(uuid("8f6c3c50-897b-11d2-8cfb-00a0c9441e20"));
  // static DWINGUID CLSID = { 0x8f6c3c50, 0x897b, 0x11d2, 0x8c, 0xfb, 0x00, 0xa0, 0xc9, 0x44, 0x1e, 0x20 };
  mixin Interfaces!(IAMTimelineTrack, IAMTimelineObj, IAMTimelineEffectable, IAMTimelineTransable, IAMTimelineVirtualTrack, IAMTimelineSplittable);
}

abstract class AMTimelineComp {
  mixin(uuid("74d2ec80-6233-11d2-8cad-00a024580902"));
  // static DWINGUID CLSID = { 0x74d2ec80, 0x6233, 0x11d2, 0x8c, 0xad, 0x00, 0xa0, 0x24, 0x58, 0x09, 0x02 };
  mixin Interfaces!(IAMTimelineComp, IAMTimelineObj, IAMTimelineEffectable, IAMTimelineTransable, IAMTimelineVirtualTrack);
}

abstract class AMTimelineGroup {
  mixin(uuid("f6d371e1-b8a6-11d2-8023-00c0df10d434"));
  // static DWINGUID CLSID = { 0xf6d371e1, 0xb8a6, 0x11d2, 0x80, 0x23, 0x00, 0xc0, 0xdf, 0x10, 0xd4, 0x34 };
  mixin Interfaces!(IAMTimelineGroup, IAMTimelineComp, IAMTimelineObj);
}

abstract class AMTimelineTrans {
  mixin(uuid("74d2ec81-6233-11d2-8cad-00a024580902"));
  // static DWINGUID CLSID = { 0x74d2ec81, 0x6233, 0x11d2, 0x8c, 0xad, 0x00, 0xa0, 0x24, 0x58, 0x09, 0x02 };
  mixin Interfaces!(IAMTimelineTrans, IAMTimelineObj, IAMTimelineSplittable);
}

abstract class AMTimelineEffect {
  mixin(uuid("74d2ec82-6233-11d2-8cad-00a024580902"));
  // static DWINGUID CLSID = { 0x74d2ec82, 0x6233, 0x11d2, 0x8c, 0xad, 0x00, 0xa0, 0x24, 0x58, 0x09, 0x02 };
  mixin Interfaces!(IAMTimelineEffect, IAMTimelineObj, IAMTimelineSplittable, IPropertyBag);
}

abstract class RenderEngine {
  mixin(uuid("64d8a8e0-80a2-11d2-8cf3-00a0c9441e20"));
  // static DWINGUID CLSID = { 0x64d8a8e0, 0x80a2, 0x11d2, 0x8c, 0xf3, 0x00, 0xa0, 0xc9, 0x44, 0x1e, 0x20 };
  mixin Interfaces!(IRenderEngine, IRenderEngine2, IAMSetErrorLog);
}

abstract class SmartRenderEngine {
  mixin(uuid("498b0949-bbe9-4072-98be-6ccaeb79dc6f"));
  // static DWINGUID CLSID = { 0x498b0949, 0xbbe9, 0x4072, 0x98, 0xbe, 0x6c, 0xca, 0xeb, 0x79, 0xdc, 0x6f };
  mixin Interfaces!(IRenderEngine, ISmartRenderEngine, IAMSetErrorLog);
}

abstract class AudMixer {
  mixin(uuid("036a9790-c153-11d2-9ef7-006008039e37"));
  // static DWINGUID CLSID = { 0x036a9790, 0xc153, 0x11d2, 0x9e, 0xf7, 0x00, 0x60, 0x08, 0x03, 0x9e, 0x37 };
  mixin Interfaces!(IBaseFilter);
}

// Xml2Dex Class
abstract class Xml2Dex {
  mixin(uuid("18c628ee-962a-11d2-8d08-00a0c9441e20"));
  // static DWINGUID CLSID = { 0x18c628ee, 0x962a, 0x11d2, 0x8d, 0x08, 0x00, 0xa0, 0xc9, 0x44, 0x1e, 0x20 };
  mixin Interfaces!(IXml2Dex);
}

// MediaLocator Class
abstract class MediaLocator {
  mixin(uuid("cc1101f2-79dc-11d2-8ce6-00a0c9441e20"));
  // static DWINGUID CLSID = { 0xcc1101f2, 0x79dc, 0x11d2, 0x8c, 0xe6, 0x00, 0xa0, 0xc9, 0x44, 0x1e, 0x20 };
  mixin Interfaces!(IMediaLocator);
}

// Varying Property Holder
abstract class PropertySetter {
  mixin(uuid("adf95821-ded7-11d2-acbe-0080c75e246e"));
  // static DWINGUID CLSID = { 0xadf95821, 0xded7, 0x11d2, 0xac, 0xbe, 0x00, 0x80, 0xc7, 0x5e, 0x24, 0x6e };
  mixin Interfaces!(IPropertySetter, IAMSetErrorLog);
}

// MediaDet Class
abstract class MediaDet {
  mixin(uuid("65bd0711-24d2-4ff7-9324-ed2e5d3abafa"));
  // static DWINGUID CLSID = { 0x65bd0711, 0x24d2, 0x4ff7, 0x93, 0x24, 0xed, 0x2e, 0x5d, 0x3a, 0xba, 0xfa };
  mixin Interfaces!(IMediaDet);
}

// MsGrab Class
abstract class SampleGrabber {
  mixin(uuid("c1f400a0-3f08-11d3-9f0b-006008039e37"));
  // static DWINGUID CLSID = { 0xc1f400a0, 0x3f08, 0x11d3, 0x9f, 0x0b, 0x00, 0x60, 0x08, 0x03, 0x9e, 0x37 };
  mixin Interfaces!(ISampleGrabber);
}

// NullRenderer Class
abstract class NullRenderer {
  mixin(uuid("c1f400a4-3f08-11d3-9f0b-006008039e37"));
  // static DWINGUID CLSID = { 0xc1f400a4, 0x3f08, 0x11d3, 0x9f, 0x0b, 0x00, 0x60, 0x08, 0x03, 0x9e, 0x37 };
  mixin Interfaces!(IBaseFilter);
}

// DxtCompositor Class
abstract class DxtCompositor {
  mixin(uuid("bb44391d-6abd-422f-9e2e-385c9dff51fc"));
  // static DWINGUID CLSID = { 0xbb44391d, 0x6abd, 0x422f, 0x9e, 0x2e, 0x38, 0x5c, 0x9d, 0xff, 0x51, 0xfc };
  mixin Interfaces!(IDxtCompositor);
}

// DxtAlphaSetter Class
abstract class DxtAlphaSetter {
  mixin(uuid("506d89ae-909a-44f7-9444-abd575896e35"));
  // static DWINGUID CLSID = { 0x506d89ae, 0x909a, 0x44f7, 0x94, 0x44, 0xab, 0xd5, 0x75, 0x89, 0x6e, 0x35 };
  mixin Interfaces!(IDxtAlphaSetter);
}

// SMPTE wipe DXT
abstract class DxtJpeg {
  mixin(uuid("de75d012-7a65-11d2-8cea-00a0c9441e20"));
  // static DWINGUID CLSID = { 0xde75d012, 0x7a65, 0x11d2, 0x8c, 0xea, 0x00, 0xa0, 0xc9, 0x44, 0x1e, 0x20 };
  mixin Interfaces!(IDxtJpeg);
}

abstract class ColorSource {
  mixin(uuid("0cfdd070-581a-11d2-9ee6-006008039e37"));
  // static DWINGUID CLSID = { 0x0cfdd070, 0x581a, 0x11d2, 0x9e, 0xe6, 0x00, 0x60, 0x08, 0x03, 0x9e, 0x37 };
  mixin Interfaces!(IBaseFilter);
}

// DxtKey Class
abstract class DxtKey {
  mixin(uuid("c5b19592-145e-11d3-9f04-006008039e37"));
  // static DWINGUID CLSID = { 0xc5b19592, 0x145e, 0x11d3, 0x9f, 0x04, 0x00, 0x60, 0x08, 0x03, 0x9e, 0x37 };
  mixin Interfaces!(IDxtKey);
}
