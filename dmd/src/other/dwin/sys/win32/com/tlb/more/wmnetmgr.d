// WMSClientNetManager 1.0 Type Library
// Version 1.0

/*[uuid("cd12a3c0-9c42-11d2-beed-0060082f2054")]*/
//module dwin.sys.win32.com.tlb.more.wmsclientnetmgr;
module dwin.sys.win32.com.tlb.more.wmnetmgr;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum STREAMPOSTYPE {
  SPT_TIME = 0x00000000,
  SPT_OBJECT = 0x00000001,
  SPT_PACKET = 0x00000002,
  SPT_BYTE = 0x00000003,
}

enum STREAMREQUEST {
  STREAMREQUEST_INCREASE_BANDWIDTH = 0x00000000,
  STREAMREQUEST_REDUCE_BANDWIDTH = 0x00000001,
}

enum WMS_CONTEXT_TYPE {
  WMS_UNKNOWN_CONTEXT_TYPE = 0x00000000,
  WMS_SERVER_CONTEXT_TYPE = 0x00000001,
  WMS_USER_CONTEXT_TYPE = 0x00000002,
  WMS_PRESENTATION_CONTEXT_TYPE = 0x00000003,
  WMS_CONTENT_DESCRIPTION_CONTEXT_TYPE = 0x00000004,
  WMS_COMMAND_REQUEST_CONTEXT_TYPE = 0x00000005,
  WMS_COMMAND_RESPONSE_CONTEXT_TYPE = 0x00000006,
  WMS_TRANSPORT_SPEC_CONTEXT_TYPE = 0x00000007,
  WMS_PACKETIZER_CONTEXT_TYPE = 0x00000008,
  WMS_CACHE_CONTENT_INFORMATION_CONTEXT_TYPE = 0x00000009,
  WMS_ARCHIVE_CONTEXT_TYPE = 0x0000000A,
  WMS_NUM_CONTEXT_TYPE = 0x0000000B,
}

enum STREAMEVENT {
  STREAM_EVENT_STOP = 0x00000000,
  STREAM_EVENT_CLOSE = 0x00000001,
  STREAM_EVENT_HEADER = 0x00000002,
  STREAM_EVENT_NO_HEADER = 0x00000003,
  STREAM_EVENT_BUFFERING_START = 0x00000004,
  STREAM_EVENT_BUFFERING_END = 0x00000005,
  STREAM_EVENT_END_OF_STREAMING = 0x00000006,
}

enum __MIDL___MIDL_itf_wmsclientnetmanager_0310_0002 {
  WMS_NAME_CT_NODE_ADD = 0x00000001,
  WMS_NAME_CT_NODE_RENAME = 0x00000002,
  WMS_NAME_CT_NODE_VALUE_CHANGE = 0x00000004,
  WMS_NAME_CT_NODE_DELETE = 0x00000008,
  WMS_NAME_CT_NODE_MOVE_BEFORE = 0x00000010,
  WMS_NAME_CT_MASK = 0x0000001F,
}

// Unions

union __MIDL_IWinTypes_0009 {
  int hInproc;
  int hRemote;
}

// Structs

struct STREAMPOS {
  STREAMPOSTYPE Type;
  uint msStreamTime;
  uint dwObjectId;
  uint dwPacketId;
}

struct PLAYLISTPOS {
  uint dwPlaylistGenId;
  uint dwOffset;
}

struct STREAMPROPERTIES {
  uint cbSize;
  uint dwStreamId;
  uint dwFlags;
  uint cbMaxSegment;
  uint cbMaxObject;
  uint cTotalObjects;
  uint msDuration;
  uint dwBitRate;
  uint cbHeaderSize;
  _FILETIME fileCreationTime;
}

struct _FILETIME {
  uint dwLowDateTime;
  uint dwHighDateTime;
}

struct __MIDL___MIDL_itf_wmsclientnetmanager_0291_0002 {
  ushort wSrcStreamNumber;
  ushort wDstStreamNumber;
  ushort wThinningLevel;
}

struct _RemotableHandle {
  int fContext;
  __MIDL_IWinTypes_0009 u;
}

struct __MIDL_IWMSPacket_0001 {
  INSSBuffer pBuffer;
  uint dwBufferOffset;
  uint dwBufferLen;
  ushort wFlags;
}

struct __MIDL_IWMSPacketList_0001 {
  IWMSPacket pPacket;
  __MIDL_IWMSPacketList_0002 Attrs;
}

struct __MIDL_IWMSPacketList_0002 {
  uint dwPacketNum;
  uint dwPacketNumBuffers;
  uint dwPacketLength;
  uint dwPacketSendTimeHi;
  uint dwPacketSendTime;
  uint dwPacketStreamNum;
  uint dwPacketFlags;
  uint dwPacketNetSequenceNum;
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

// Aliases

alias __MIDL___MIDL_itf_wmsclientnetmanager_0291_0002 STREAM_SWITCH_ENTRY;

alias _RemotableHandle* wireHWND;

alias __MIDL_IWMSPacket_0001 WMSBUFFERDESC;

alias __MIDL_IWMSPacketList_0001 WMSPACKETDESC;

alias __MIDL___MIDL_itf_wmsclientnetmanager_0310_0002 WMS_NAMESPACE_CHANGE_TYPES;

// Interfaces

interface INSNetSourceCreator : IUnknown {
  mixin(uuid("0c0e4080-9081-11d2-beec-0060082f2054"));
  // static DWINGUID IID = { 0x0c0e4080, 0x9081, 0x11d2, 0xbe, 0xec, 0x00, 0x60, 0x08, 0x2f, 0x20, 0x54 };
  /*[id(0x60010000)]*/ int Initialize();
  /*[id(0x60010001)]*/ int CreateNetSource(wchar* pszStreamName, IMediaStreamMonitor pMonitor, ubyte* pData, IWMSContext pUserContext, INSNetSourceCreatorCallback pCallback, ulong qwContext);
  /*[id(0x60010002)]*/ int GetNetSourceProperties(wchar* pszStreamName, out IWMSNamespaceNode ppPropertiesNode);
  /*[id(0x60010003)]*/ int GetNetSourceSharedNamespace(out IWMSNamespaceNode ppSharedNamespace);
  /*[id(0x60010004)]*/ int GetNetSourceAdminInterface(wchar* pszStreamName, out DWINVARIANT pVal);
  /*[id(0x60010005)]*/ int GetNumProtocolsSupported(out uint pcProtocols);
  /*[id(0x60010006)]*/ int GetProtocolName(uint dwProtocolNum, out ushort pwszProtocolName, ref ushort pcchProtocolName);
  /*[id(0x60010007)]*/ int Shutdown();
}

interface IMediaStreamMonitor : IUnknown {
  mixin(uuid("d7a97310-c082-11d2-b263-006097d2e41e"));
  // static DWINGUID IID = { 0xd7a97310, 0xc082, 0x11d2, 0xb2, 0x63, 0x00, 0x60, 0x97, 0xd2, 0xe4, 0x1e };
  /*[id(0x60010000)]*/ int OnStreamOpen(IMediaStream pStream, int hr, ulong qwContext);
  /*[id(0x60010001)]*/ int OnStreamClose(IMediaStream pStream, int hr, ulong qwContext);
  /*[id(0x60010002)]*/ int OnStreamStart(IMediaStream pStream, int hr, ulong qwContext);
  /*[id(0x60010003)]*/ int OnStreamStop(IMediaStream pStream, int hr, ulong qwContext);
  /*[id(0x60010004)]*/ int OnStreamPause(IMediaStream pStream, int hr, ulong qwContext);
  /*[id(0x60010005)]*/ int OnStreamHeaderAvailable(IMediaStream pStream, int hr, ulong qwContext, INSSBuffer pHeader, IWMSContentDescriptionList pContentDescription, IWMSDataContainerVersion pVersion);
  /*[id(0x60010006)]*/ int OnStreamSegmentAvailable(IMediaStream pStream, int hr, ulong qwContext, IWMSPacket pSegment);
  /*[id(0x60010007)]*/ int OnStreamSegmentsAvailable(IMediaStream pStream, int hr, ulong qwContext, IWMSPacketList pSegments);
  /*[id(0x60010008)]*/ int OnStreamUnsolicitedEvent(IMediaStream pStream, int hr, STREAMEVENT Event, INSSBuffer pBuffer, IUnknown pUnk);
  /*[id(0x60010009)]*/ int OnStreamSelect(IMediaStream pStream, int hr, ulong qwContext);
  /*[id(0x6001000A)]*/ int OnStreamGetLinkBandwidth(IMediaStream pStream, int hr, ulong qwContext, uint dwLinkBandwidth);
  /*[id(0x6001000B)]*/ int OnStreamAcquireCredentials(IMediaStream pStream, int hr, ulong qwContext, int fProxy, wchar* pwszRealm, wchar* pwszSite, wchar* pwszUser, wchar* pwszPassword, uint dwFlags);
}

interface IMediaStream : IUnknown {
  mixin(uuid("e391f620-c082-11d2-b263-006097d2e41e"));
  // static DWINGUID IID = { 0xe391f620, 0xc082, 0x11d2, 0xb2, 0x63, 0x00, 0x60, 0x97, 0xd2, 0xe4, 0x1e };
  /*[id(0x60010000)]*/ int Open(wchar* pszStreamName, ulong qwContext);
  /*[id(0x60010001)]*/ int Close(ulong qwContext);
  /*[id(0x60010002)]*/ int RequestHeader(ulong qwContext);
  /*[id(0x60010003)]*/ int Start(STREAMPOS* pPos, PLAYLISTPOS* pPLPos, double Rate, ulong qwContext);
  /*[id(0x60010004)]*/ int Stop(ulong qwContext);
  /*[id(0x60010005)]*/ int Pause(int fSlowSkip, ulong qwContext);
  /*[id(0x60010006)]*/ int GetStreamProperties(out STREAMPROPERTIES ppProperties);
  /*[id(0x60010007)]*/ int GetStreamName(out wchar* ppszName);
  /*[id(0x60010008)]*/ int GetProxyName(out wchar* ppszName);
  /*[id(0x60010009)]*/ int Shutdown(int fBlock);
  /*[id(0x6001000A)]*/ int IsAlive(out int pfIsAlive);
  /*[id(0x6001000B)]*/ int SelectStreams(STREAM_SWITCH_ENTRY* pStreamEntries, ushort cStreamEntries, ushort wBandwidthLevel, uint dwSelectedBitrate, ulong qwContext);
  /*[id(0x6001000C)]*/ int SetPlayoutDelay(uint dwPlayoutDelay);
  /*[id(0x6001000D)]*/ int SetAccelDuration(uint dwAccelDuration);
  /*[id(0x6001000E)]*/ int SetEnableResends(int fEnableResends);
  /*[id(0x6001000F)]*/ int SetBandwidthLevels(ushort wBandwidthLevels);
  /*[id(0x60010010)]*/ int SetLoggingUrl(wchar* pszLoggingUrl);
  /*[id(0x60010011)]*/ int SetMaxTime(uint dwMsTime, int fAbsolute);
  /*[id(0x60010012)]*/ int SetParentWindow(wireHWND hParentWindow);
  /*[id(0x60010013)]*/ int Rebuffer();
  /*[id(0x60010014)]*/ int SetMediaStreamMonitor(IMediaStreamMonitor pMonitor);
  /*[id(0x60010015)]*/ int GetLinkBandwidth(ulong qwContext);
  /*[id(0x60010016)]*/ int SetLinkBandwidth(uint dwLinkBandwidth);
  /*[id(0x60010017)]*/ int GetMaxNetPacketSize(out ushort pwMaxNetPacketSize);
  /*[id(0x60010018)]*/ int SetFormatSet(IAsfFormatSet pFormatSet);
  /*[id(0x60010019)]*/ int SetUserCredentials(int hrCredentials, ulong qwContext, int fProxy, wchar* pwszRealm, wchar* pwszSite, ubyte* pbUser, uint cbUser, ubyte* pbPassword, uint cbPassword, uint dwFlags);
  /*[id(0x6001001A)]*/ int SetLogClientID(wchar* pwszLogClientID);
  /*[id(0x6001001B)]*/ int SetResult(STREAMREQUEST req, int hrReq);
  /*[id(0x6001001C)]*/ int SetReferrerURL(wchar* pwszReferrerURL);
  /*[id(0x6001001D)]*/ int SetLanguage(wchar* pwszLanguage);
}

interface IAsfFormatSet : IUnknown {
  mixin(uuid("284237d0-73fc-11d0-b724-00aa00b4e220"));
  // static DWINGUID IID = { 0x284237d0, 0x73fc, 0x11d0, 0xb7, 0x24, 0x00, 0xaa, 0x00, 0xb4, 0xe2, 0x20 };
  /*[id(0x60010000)]*/ int AddEncodedFormat(char* pszHeader);
  /*[id(0x60010001)]*/ int FindFormat(uint dwStreamKey, out ubyte pHeader, ref uint pcbHeader);
  /*[id(0x60010002)]*/ int FindAnyFormat(out uint pdwStreamKey, out uint pcbHeader);
  /*[id(0x60010003)]*/ int GetDefaultEccSpan(out uint pdwEccSpan);
  /*[id(0x60010004)]*/ int SetDefaultEccSpan(uint dwEccSpan);
  /*[id(0x60010005)]*/ int GetLinkBandwidth(out uint pdwLinkBandwidth);
  /*[id(0x60010006)]*/ int SetLinkBandwidth(uint dwLinkBandwidth);
}

// Provides methods for managing a buffer.
interface INSSBuffer : IUnknown {
  mixin(uuid("e1cd3524-03d7-11d2-9eed-006097d2d7cf"));
  // static DWINGUID IID = { 0xe1cd3524, 0x03d7, 0x11d2, 0x9e, 0xed, 0x00, 0x60, 0x97, 0xd2, 0xd7, 0xcf };
  // Retrieves the number of bytes in the buffer that are being used to store data.
  /*[id(0x60010000)]*/ int GetLength(out uint pdwLength);
  // Specifies the number of bytes in the buffer that are being used to store data.
  /*[id(0x60010001)]*/ int SetLength(uint dwLength);
  // Retrieves the maximum number of bytes that can be stored in the buffer.
  /*[id(0x60010002)]*/ int GetMaxLength(out uint pdwLength);
  // Retrieves the buffer.
  /*[id(0x60010003)]*/ int GetBuffer(out ubyte ppbBuffer);
  // Retrieves the buffer and the number of bytes in the buffer that are being used to store data.
  /*[id(0x60010004)]*/ int GetBufferAndLength(out ubyte ppbBuffer, out uint pdwLength);
}

// Contains a collection of content description contexts for different languages.
interface IWMSContentDescriptionList : IUnknown {
  mixin(uuid("105d6f73-6df0-11d2-9f14-006097d2d7cf"));
  // static DWINGUID IID = { 0x105d6f73, 0x6df0, 0x11d2, 0x9f, 0x14, 0x00, 0x60, 0x97, 0xd2, 0xd7, 0xcf };
  // Retrieves the number of content descriptions contexts in the collection.
  /*[id(0x60010000)]*/ int GetDescriptionCount(out uint pdwNumDescriptions);
  // Retrieves a specific content description context from the collection by index.
  /*[id(0x60010001)]*/ int GetIndexedDescription(uint dwDescriptionNum, out wchar* pstrLanguage, out IWMSContext ppDescription);
  // Retrieves the content description context for a specific language.
  /*[id(0x60010002)]*/ int GetDescriptionInLanguage(wchar* pstrLanguage, out IWMSContext ppDescription);
  // Adds a content description context for a specific language to the collection.
  /*[id(0x60010003)]*/ int AppendDescription(wchar* pstrLanguage, IWMSContext pDescription);
  // Removes all of the context description contexts in the collection.
  /*[id(0x60010004)]*/ int RemoveAllDescriptions();
  // Retrieves the playlist generation ID.
  /*[id(0x60010005)]*/ int GetPlaylistGenid(uint* pdwPlaylistGenerationId);
  // Specifies the playlist generation ID.
  /*[id(0x60010006)]*/ int SetPlaylistGenid(uint dwPlaylistGenerationId);
  // Adds or sets a DWINVARIANT value property for a specific context property in all context description contexts.
  /*[id(0x60010007)]*/ int SetValueOnAllDescriptions(wchar* pstrName, int lNameHint, DWINVARIANT Value, int lOptions);
  // Removes the specified property from all context description contexts.
  /*[id(0x60010008)]*/ int RemoveValueFromAllDescriptions(wchar* pstrName, int lNameHint, int lOptions);
}

// Provides methods for managing a collection of properties for a particular context.
interface IWMSContext : IUnknown {
  mixin(uuid("4f1a1421-5cd5-11d2-9f05-006097d2d7cf"));
  // static DWINGUID IID = { 0x4f1a1421, 0x5cd5, 0x11d2, 0x9f, 0x05, 0x00, 0x60, 0x97, 0xd2, 0xd7, 0xcf };
  // Sets the value for or adds a new long value property.
  /*[id(0x60010000)]*/ int SetLongValue(wchar* pstrName, int lNameHint, int lValue, int lOptions);
  // Sets the value for or adds a new string value property.
  /*[id(0x60010001)]*/ int SetStringValue(wchar* pstrName, int lNameHint, wchar* pstrValue, int lOptions);
  // Sets the value for or adds a new IUnknown value property.
  /*[id(0x60010002)]*/ int SetIUnknownValue(wchar* pstrName, int lNameHint, IUnknown pValue, int lOptions);
  // Sets the value for or adds a new QWORD value property.
  /*[id(0x60010003)]*/ int SetQwordValue(wchar* pstrName, int lNameHint, long qwValue, int lOptions);
  // Sets the value for or adds a new DATE value property.
  /*[id(0x60010004)]*/ int SetDateValue(wchar* pstrName, int lNameHint, double dateValue, int lOptions);
  // Sets the value for or adds a new SAFEARRAY value property.
  /*[id(0x60010005)]*/ int SetArrayValue(wchar* pstrName, int lNameHint, SAFEARRAY psaValue, int lOptions);
  // Retrieves the value for a long value property.
  /*[id(0x60010006)]*/ int GetLongValue(wchar* pstrName, int lNameHint, out int plValue, int lOptions);
  // Retrieves the value for a string value property.
  /*[id(0x60010007)]*/ int GetStringValue(wchar* pstrName, int lNameHint, out wchar* pstrValue, int lOptions);
  // Retrieves the value for an IUnknown value property.
  /*[id(0x60010008)]*/ int GetIUnknownValue(wchar* pstrName, int lNameHint, out IUnknown pValue, int lOptions);
  // Retrieves the value for a QWORD value property.
  /*[id(0x60010009)]*/ int GetQwordValue(wchar* pstrName, int lNameHint, out long pqwValue, int lOptions);
  // Retrieves the value for a DATE value property.
  /*[id(0x6001000A)]*/ int GetDateValue(wchar* pstrName, int lNameHint, out double pdateValue, int lOptions);
  // Retrieves the value for a SAFEARRAY value property.
  /*[id(0x6001000B)]*/ int GetArrayValue(wchar* pstrName, int lNameHint, out SAFEARRAY ppsaValue, int lOptions);
  // Sets the value for or adds a new property.
  /*[id(0x6001000C)]*/ int SetValue(wchar* pstrName, int lNameHint, DWINVARIANT Value, int lOptions);
  // Retrieves the value for a property.
  /*[id(0x6001000D)]*/ int GetValue(wchar* pstrName, int lNameHint, out DWINVARIANT pValue, int lOptions);
  // Retrieves the number of properties in the context.
  /*[id(0x6001000E)]*/ int GetValueCount(out int pCount);
  // Retrieves the name, value and hint for a specific property by index.
  /*[id(0x6001000F)]*/ int GetIndexedValue(int lIndex, out wchar* pstrName, out int plNameHint, out DWINVARIANT pValue, out int pdwResultOptions, int lOptions);
  // Removes a specific property from the context.
  /*[id(0x60010010)]*/ int RemoveValue(wchar* pstrName, int lNameHint, int lOptions);
  // Removes all properties from the context.
  /*[id(0x60010011)]*/ int RemoveAllValues();
  // Retrieves an enumeration value that indicates the context type.
  /*[id(0x60010012)]*/ int GetContextType(out WMS_CONTEXT_TYPE pType);
  // Retrieves the value for an IUnknown value property and calls QueryInterface to retrieve a pointer to the specified interface.
  /*[id(0x60010013)]*/ int GetAndQueryIUnknownValue(wchar* pstrName, int lNameHint, ref DWINGUID riid, out IUnknown pResult, int lOptions);
  // Copies the specified properties to another context.
  /*[id(0x60010014)]*/ int CopyValues(IWMSContext pDest, wchar** pstrName, int* lNameHint, int lNames);
}

// Provides methods for retrieving content version information.
interface IWMSDataContainerVersion : IUnknown {
  mixin(uuid("3ae75c14-2b3a-11d2-9ef7-006097d2d7cf"));
  // static DWINGUID IID = { 0x3ae75c14, 0x2b3a, 0x11d2, 0x9e, 0xf7, 0x00, 0x60, 0x97, 0xd2, 0xd7, 0xcf };
  // Retrieves the time at which the content was last modified.
  /*[id(0x60010000)]*/ int GetLastModifiedTime(out double pdateLastModifiedTime);
  // Specifies the time at which the content was last modified.
  /*[id(0x60010001)]*/ int SetLastModifiedTime(double dateLastModifiedTime);
  // Retrieves the content expiration date.
  /*[id(0x60010002)]*/ int GetExpirationTime(out double pdateExpirationTime);
  // Specifies the content expiration date.
  /*[id(0x60010003)]*/ int SetExpirationTime(double dateExpirationTime);
  // Retrieves flags that indicate whether content can be cached, proxied, or split.
  /*[id(0x60010004)]*/ int GetCacheFlags(out int plFlags);
  // Specifies flags that indicate whether content can be cached, proxied, or split.
  /*[id(0x60010005)]*/ int SetCacheFlags(int lFlags);
  // Retrieves the size of the content in bytes.
  /*[id(0x60010006)]*/ int GetContentSize(out int plContentSizeLow, out int plContentSizeHigh);
  // Specifies the size of the content in bytes.
  /*[id(0x60010007)]*/ int SetContentSize(int lContentSizeLow, int lContentSizeHigh);
  // Retrieves the number of entity tags.
  /*[id(0x60010008)]*/ int GetEntityTagCount(out int plNumEntityTags);
  // Retrieves an entity tag, given an index number.
  /*[id(0x60010009)]*/ int GetEntityTag(int lTagNum, out wchar* pszEntityTag);
  // Specifies an entity tag.
  /*[id(0x6001000A)]*/ int SetEntityTag(wchar* szEntityTag);
  // Compares two IWMSDataContainerVersion objects to determine whether they are equal.
  /*[id(0x6001000B)]*/ int Compare(IWMSDataContainerVersion pVersion, out short pvfEqual);
}

// Contains methods for managing the buffers, attributes, and headers associated with a packet.
interface IWMSPacket : IUnknown {
  mixin(uuid("3309c901-10a4-11d2-9eee-006097d2d7cf"));
  // static DWINGUID IID = { 0x3309c901, 0x10a4, 0x11d2, 0x9e, 0xee, 0x00, 0x60, 0x97, 0xd2, 0xd7, 0xcf };
  // Retrieves an array of WMSBUFFERDESC structures. Each WMSBUFFERDESC structure contains the location and size of a specific buffer region that contains the packet's data.
  /*[id(0x60010000)]*/ int GetAllBuffers(uint dwMaxNumBuffers, out WMSBUFFERDESC pDesc, out uint pdwNumBuffers, uint dwExFlags);
  // Retrieves the location of a specific buffer region that contains the packet's data.
  /*[id(0x60010001)]*/ int GetBuffer(uint dwBufferNum, out INSSBuffer ppBuffer, out uint pdwBufferOffset, out uint pdwBufferLen, out ushort pwFlags, uint dwExFlags);
  // Adds a new region in a buffer to the collection of buffer regions associated with the packet.
  /*[id(0x60010002)]*/ int InsertBuffer(uint dwBufferNum, INSSBuffer pBuffer, uint dwBufferOffset, uint dwBufferLen, ushort wFlags, uint dwExFlags);
  // Removes the specified region in a buffer from the collection of buffer regions associated with the packet.
  /*[id(0x60010003)]*/ int RemoveBuffer(uint dwBufferNum);
  // Removes all of the buffer regions associated with the packet.
  /*[id(0x60010004)]*/ int RemoveAllBuffers();
  // Retrieves the value for a packet attribute defined by WMS_PACKET_ATTRIBUTES.
  /*[id(0x60010005)]*/ int GetAttribute(uint dwValueName, out uint pdwValue);
  // Specifies the value for a packet attribute defined by WMS_PACKET_ATTRIBUTES.
  /*[id(0x60010006)]*/ int SetAttribute(uint dwValueName, uint dwValue);
  // Retrieves the value for an extended packet attribute defined by a plug-in.
  /*[id(0x60010007)]*/ int GetExtendedAttribute(uint dwValueName, out DWINVARIANT pVariantValue);
  // Retrieves the name and value for an extended packet attribute defined by a plug-in.
  /*[id(0x60010008)]*/ int GetExtendedAttributeByIndex(uint dwIndex, out uint pdwValueName, out DWINVARIANT pVariantValue);
  // Specifies the name and value for an extended packet attribute defined by a plug-in.
  /*[id(0x60010009)]*/ int SetExtendedAttribute(uint dwValueName, DWINVARIANT VariantValue);
  // Retrieves the number of extended packet attributes.
  /*[id(0x6001000A)]*/ int GetExtendedAttributeCount(out uint pdwAttrs);
  // Copies the specified attributes to another packet.
  /*[id(0x6001000B)]*/ int CopyAttributes(IWMSPacket pDest, uint* pdwAttrNames, uint dwNumAttr, int fCopyExtAttr);
  // Appends header data to the first buffer region associated with the packet or to a new buffer.
  /*[id(0x6001000C)]*/ int AppendHeader(IWMSBufferAllocator pAlloc, uint dwHeaderLen, ubyte* pbHeader);
}

// Provides methods for allocating a buffer.
interface IWMSBufferAllocator : IUnknown {
  mixin(uuid("61103ca4-2033-11d2-9ef1-006097d2d7cf"));
  // static DWINGUID IID = { 0x61103ca4, 0x2033, 0x11d2, 0x9e, 0xf1, 0x00, 0x60, 0x97, 0xd2, 0xd7, 0xcf };
  // Allocates a buffer.
  /*[id(0x60010000)]*/ int AllocateBuffer(uint dwMaxBufferSize, out INSSBuffer ppBuffer);
  // Allocates a page aligned buffer that is a multiple of a page size.
  /*[id(0x60010001)]*/ int AllocatePageSizeBuffer(uint dwMaxBufferSize, out INSSBuffer ppBuffer);
}

// Contains methods for managing the packets, attributes, and buffers associated with a packet list.
interface IWMSPacketList : IWMSBufferAllocator {
  mixin(uuid("3309c902-10a4-11d2-9eee-006097d2d7cf"));
  // static DWINGUID IID = { 0x3309c902, 0x10a4, 0x11d2, 0x9e, 0xee, 0x00, 0x60, 0x97, 0xd2, 0xd7, 0xcf };
  // Retrieves the number of packets in the packet list.
  /*[id(0x60020000)]*/ int GetPacketCount(out uint pdwNumPackets);
  // Retrieves a specific packet.
  /*[id(0x60020001)]*/ int GetPacket(uint dwPacketNum, out IWMSPacket ppPacket, uint dwExFlags);
  // Retrieves either an array of WMSPACKETDESC structures or an array of packets in the packet list.
  /*[id(0x60020002)]*/ int GetAllPackets(uint dwFirstPacket, uint dwMaxNumPackets, out WMSPACKETDESC pPacketDesc, out IWMSPacket ppPacket, out uint pdwDescNum, uint dwExFlags);
  // Adds a packet to the packet list at the specified location.
  /*[id(0x60020003)]*/ int InsertPacket(uint dwPacketNum, IWMSPacket pPacket, uint dwExFlags);
  // Adds a packet to the end of the packet list.
  /*[id(0x60020004)]*/ int AppendPacket(IWMSPacket pPacket, uint dwExFlags);
  // Removes the specified packet from the packet list.
  /*[id(0x60020005)]*/ int RemovePacket(uint dwPacketNum);
  // Removes all of the packets from the packet list.
  /*[id(0x60020006)]*/ int RemoveAllPackets(uint dwExFlags);
  // Retrieves the value for a packet list attribute defined by WMS_PACKET_LIST_ATTRIBUTES.
  /*[id(0x60020007)]*/ int GetAttribute(uint dwValueName, uint* pdwValue);
  // Specifies the value for a packet list attribute defined by WMS_PACKET_LIST_ATTRIBUTES.
  /*[id(0x60020008)]*/ int SetAttribute(uint dwValueName, uint dwValue);
  // Retrieves the stream signal defined by WMS_STREAM_SIGNAL_TYPE.
  /*[id(0x60020009)]*/ int GetStreamSignalParam(out DWINVARIANT pParameter);
  // Specifies the stream signal defined by WMS_STREAM_SIGNAL_TYPE.
  /*[id(0x6002000A)]*/ int SetStreamSignalParam(DWINVARIANT* pParameter);
  // Retrieves the packet parser object that created the packet list.
  /*[id(0x6002000B)]*/ int GetPacketParser(out IWMSPacketParser ppSource, uint dwExFlags);
  // Specifies the packet parser object that created the packet list.
  /*[id(0x6002000C)]*/ int SetPacketParser(IWMSPacketParser pSource);
  // Retrieves the buffer associated with this packet list.
  /*[id(0x6002000D)]*/ int GetBuffer(out INSSBuffer ppBuffer, uint dwExFlags);
  // Specifies the buffer associated with this packet list.
  /*[id(0x6002000E)]*/ int SetBuffer(INSSBuffer pBuffer);
  // Specifies the callback object that is used to respond to the ReportStatus method call.
  /*[id(0x6002000F)]*/ int SetCompletionCallback(IWMSPacketListCallback pCallback);
  // Retrieves the callback object that is used to respond to the ReportStatus method call.
  /*[id(0x60020010)]*/ int GetCompletionCallback(out IWMSPacketListCallback ppCallback);
  // Retrieves the value for an extended packet list attribute defined by a plug-in.
  /*[id(0x60020011)]*/ int GetExtendedAttribute(uint dwValueName, out DWINVARIANT pVariantValue);
  // Retrieves the name and value for an extended packet attribute defined by a plug-in.
  /*[id(0x60020012)]*/ int GetExtendedAttributeByIndex(uint dwIndex, out uint pdwValueName, out DWINVARIANT pVariantValue);
  // Specifies the value for an extended packet attribute defined by a plug-in.
  /*[id(0x60020013)]*/ int SetExtendedAttribute(uint dwValueName, DWINVARIANT VariantValue);
  // Retrieves the number of extended attributes.
  /*[id(0x60020014)]*/ int GetExtendedAttributeCount(out uint pdwAttrs);
  // Requests the status for a packet list.
  /*[id(0x60020015)]*/ int ReportStatus(uint dwStatus);
  // Creates a copy of the packet list.
  /*[id(0x60020016)]*/ int ClonePacketList(out IWMSPacketList ppClonedPacketList);
  // Allocates a new packet.
  /*[id(0x60020017)]*/ int AllocPacket(out IWMSPacket ppPacket);
}

// Provides methods to manipulate individual packets.  This interface is implemented by a media parser plug-in.
interface IWMSPacketParser : IUnknown {
  mixin(uuid("8b59f7e1-5411-11d2-9eff-006097d2d7cf"));
  // static DWINGUID IID = { 0x8b59f7e1, 0x5411, 0x11d2, 0x9e, 0xff, 0x00, 0x60, 0x97, 0xd2, 0xd7, 0xcf };
  // Updates the packet data to reflect the packets attribute values.
  /*[id(0x60010000)]*/ int UpdatePacket(IWMSPacket pPacket);
  // Adds an array of packets to a packet list.
  /*[id(0x60010001)]*/ int CombinePackets(uint dwNumInputPackets, IWMSPacket* pInputPacketArray, IWMSPacketList pPacketList, uint dwFlags);
}

// Contains a method to respond to the IWMSPacketList::ReportStatus method call.
interface IWMSPacketListCallback : IUnknown {
  mixin(uuid("49c2a6f1-64b8-11d2-9f0e-006097d2d7cf"));
  // static DWINGUID IID = { 0x49c2a6f1, 0x64b8, 0x11d2, 0x9f, 0x0e, 0x00, 0x60, 0x97, 0xd2, 0xd7, 0xcf };
  // Specifies the results of the the IWMSPacketList::ReportStatus method call.
  /*[id(0x60010000)]*/ int OnReportPacketListStatus(IWMSPacketList pBuffer, uint dwStatus);
}

interface INSNetSourceCreatorCallback : IUnknown {
  mixin(uuid("741bfb30-908b-11d2-beec-0060082f2054"));
  // static DWINGUID IID = { 0x741bfb30, 0x908b, 0x11d2, 0xbe, 0xec, 0x00, 0x60, 0x08, 0x2f, 0x20, 0x54 };
  /*[id(0x60010000)]*/ int OnNetSourceCreated(int hr, IMediaStream pNetSource, ulong qwContext);
}

interface IWMSNamespaceNode : IUnknown {
  mixin(uuid("916d43c6-63a6-11d2-8dcf-006097c9a2b2"));
  // static DWINGUID IID = { 0x916d43c6, 0x63a6, 0x11d2, 0x8d, 0xcf, 0x00, 0x60, 0x97, 0xc9, 0xa2, 0xb2 };
  /*[id(0x60010000)]*/ int SetBinaryValue(ushort fFlags, wchar* pszRelativeName, uint cbValue, ubyte* pbValue);
  /*[id(0x60010001)]*/ int SetBooleanValue(ushort fFlags, wchar* pszRelativeName, int fValue);
  /*[id(0x60010002)]*/ int SetInt32Value(ushort fFlags, wchar* pszRelativeName, uint dwValue, ubyte* pbPerfSharedMem);
  /*[id(0x60010003)]*/ int IncrementInt32Value(wchar* pszRelativeName, uint dwAmount);
  /*[id(0x60010004)]*/ int DecrementInt32Value(wchar* pszRelativeName, uint dwAmount);
  /*[id(0x60010005)]*/ int SetInt64Value(ushort fFlags, wchar* pszRelativeName, long Value, ubyte* pbPerfSharedMem);
  /*[id(0x60010006)]*/ int IncrementInt64Value(wchar* pszRelativeName, long amount);
  /*[id(0x60010007)]*/ int DecrementInt64Value(wchar* pszRelativeName, long amount);
  /*[id(0x60010008)]*/ int SetIUnknownValue(wchar* pszRelativeName, IUnknown punkValue);
  /*[id(0x60010009)]*/ int SetStringValue(ushort fFlags, wchar* pszRelativeName, wchar* pszValue);
  /*[id(0x6001000A)]*/ int ClearNodeValue(wchar* pszRelativeName);
  /*[id(0x6001000B)]*/ int GetBinaryValue(wchar* pszRelativeName, ref uint pcbValue, out ubyte pbValue);
  /*[id(0x6001000C)]*/ int GetBooleanValue(wchar* pszRelativeName, out int pfValue);
  /*[id(0x6001000D)]*/ int GetBstrValue(wchar* pszRelativeName, out wchar* bstrValue);
  /*[id(0x6001000E)]*/ int GetInt32Value(wchar* pszRelativeName, out uint pdwValue);
  /*[id(0x6001000F)]*/ int GetInt64Value(wchar* pszRelativeName, out long pValue);
  /*[id(0x60010010)]*/ int GetIUnknownValue(wchar* pszRelativeName, out IUnknown ppunkValue);
  /*[id(0x60010011)]*/ int GetStringValue(wchar* pszRelativeName, ref uint pcchValue, out wchar* pszValue);
  /*[id(0x60010012)]*/ int GetFlags(out ushort pwFlags);
  /*[id(0x60010013)]*/ int GetShortName(ref uint pcchShortNodeName, out wchar* pszShortNodeName);
  /*[id(0x60010014)]*/ int GetLongName(ref uint pcchLongNodeName, out wchar* pszLongNodeName);
  /*[id(0x60010015)]*/ int GetNodeByName(wchar* pszRelativeName, int fCreateIfDoesntExist, out IWMSNamespaceNode ppNode);
  /*[id(0x60010016)]*/ int GetParentNode(out IWMSNamespaceNode ppParentNode);
  /*[id(0x60010017)]*/ int GetRootNode(out IWMSNamespaceNode ppRootNode);
  /*[id(0x60010018)]*/ int RenameNode(wchar* pszRelativeName, wchar* pszNewNodeName);
  /*[id(0x60010019)]*/ int RemoveNode(wchar* pszRelativeName);
  /*[id(0x6001001A)]*/ int Flush();
  /*[id(0x6001001B)]*/ int GlobalWriteLock();
  /*[id(0x6001001C)]*/ int GlobalWriteUnlock();
  /*[id(0x6001001D)]*/ int CreateChildNode(ushort fFlags, wchar* pszChildNodeName, IWMSNamespaceNode pInsertBeforeNode, IWMSNamespaceNode pNodeToCopy, out IWMSNamespaceNode ppChildNode);
  /*[id(0x6001001E)]*/ int GetChildNodeCount(out uint pdwCount);
  /*[id(0x6001001F)]*/ int GetNodeInfoByIndex(uint dwNodeIndex, out ushort pwNodeFlags, ref uint pcchShortNodeName, out wchar* pszShortNodeName);
  /*[id(0x60010020)]*/ int GetNodeByIndex(uint dwNodeIndex, out IWMSNamespaceNode ppChildNode);
  /*[id(0x60010021)]*/ int MoveBeforeNode(IWMSNamespaceNode pMoveBeforeNode);
  /*[id(0x60010022)]*/ int AdviseOnChange(ushort wOptions, ulong qwContext, IWMSNamespaceChangeCallback pCallback, out ulong pqwCookie);
  /*[id(0x60010023)]*/ int UnadviseOnChange(ulong qwCookie);
  /*[id(0x60010024)]*/ int ExportToFile(wchar* pwszStartNode, wchar* pwszFileName, out uint cbWritten);
  /*[id(0x60010025)]*/ int ExportToStream(wchar* pwszStartNode, IStream pStream, out uint cbWritten);
  /*[id(0x60010026)]*/ int ImportFromFile(wchar* pwszFileName, int fInitializingServer);
  /*[id(0x60010027)]*/ int ImportFromStream(IStream pStream, int fInitializingServer);
}

interface IWMSNamespaceChangeCallback : IUnknown {
  mixin(uuid("916d43c8-63a6-11d2-8dcf-006097c9a2b2"));
  // static DWINGUID IID = { 0x916d43c8, 0x63a6, 0x11d2, 0x8d, 0xcf, 0x00, 0x60, 0x97, 0xc9, 0xa2, 0xb2 };
  /*[id(0x60010000)]*/ int OnValueChanged(IWMSNamespaceNode pNotifyNode, ulong qwContext, IWMSNamespaceNode pChangedValue, WMS_NAMESPACE_CHANGE_TYPES changeType);
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

// CoClasses

// ClientNetManager Class
abstract class ClientNetManager {
  mixin(uuid("cd12a3ce-9c42-11d2-beed-0060082f2054"));
  // static DWINGUID CLSID = { 0xcd12a3ce, 0x9c42, 0x11d2, 0xbe, 0xed, 0x00, 0x60, 0x08, 0x2f, 0x20, 0x54 };
  mixin Interfaces!(INSNetSourceCreator);
}
