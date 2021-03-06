// Microsoft CDO for Windows 2000 Library
// Version 1.0

/*[uuid("cd000000-8b95-11d1-82db-00c04fb1625d")]*/
module dwin.sys.win32.com.tlb.cdosys;

private import dwin.sys.win32.com.tlb.stdole2;
/*[importlib("msado15.dll")]*/
private import dwin.sys.win32.com.Core;
private import dwin.sys.win32.com.tlb.adodb;
// Enums

enum CdoConfigSource {
  cdoDefaults = 0xFFFFFFFF,
  cdoIIS = 0x00000001,
  cdoOutlookExpress = 0x00000002,
}

enum CdoDSNOptions {
  cdoDSNDefault = 0x00000000,
  cdoDSNNever = 0x00000001,
  cdoDSNFailure = 0x00000002,
  cdoDSNSuccess = 0x00000004,
  cdoDSNDelay = 0x00000008,
  cdoDSNSuccessFailOrDelay = 0x0000000E,
}

enum CdoEventStatus {
  cdoRunNextSink = 0x00000000,
  cdoSkipRemainingSinks = 0x00000001,
}

enum cdoImportanceValues {
  cdoLow = 0x00000000,
  cdoNormal = 0x00000001,
  cdoHigh = 0x00000002,
}

enum CdoMessageStat {
  cdoStatSuccess = 0x00000000,
  cdoStatAbortDelivery = 0x00000002,
  cdoStatBadMail = 0x00000003,
}

enum CdoMHTMLFlags {
  cdoSuppressNone = 0x00000000,
  cdoSuppressImages = 0x00000001,
  cdoSuppressBGSounds = 0x00000002,
  cdoSuppressFrames = 0x00000004,
  cdoSuppressObjects = 0x00000008,
  cdoSuppressStyleSheets = 0x00000010,
  cdoSuppressAll = 0x0000001F,
}

enum CdoNNTPProcessingField {
  cdoPostMessage = 0x00000001,
  cdoProcessControl = 0x00000002,
  cdoProcessModerator = 0x00000004,
}

enum CdoPostUsing {
  cdoPostUsingPickup = 0x00000001,
  cdoPostUsingPort = 0x00000002,
}

enum cdoPriorityValues {
  cdoPriorityNonUrgent = 0xFFFFFFFF,
  cdoPriorityNormal = 0x00000000,
  cdoPriorityUrgent = 0x00000001,
}

enum CdoProtocolsAuthentication {
  cdoAnonymous = 0x00000000,
  cdoBasic = 0x00000001,
  cdoNTLM = 0x00000002,
}

enum CdoReferenceType {
  cdoRefTypeId = 0x00000000,
  cdoRefTypeLocation = 0x00000001,
}

enum CdoSendUsing {
  cdoSendUsingPickup = 0x00000001,
  cdoSendUsingPort = 0x00000002,
}

enum cdoSensitivityValues {
  cdoSensitivityNone = 0x00000000,
  cdoPersonal = 0x00000001,
  cdoPrivate = 0x00000002,
  cdoCompanyConfidential = 0x00000003,
}

enum CdoTimeZoneId {
  cdoUTC = 0x00000000,
  cdoGMT = 0x00000001,
  cdoSarajevo = 0x00000002,
  cdoParis = 0x00000003,
  cdoBerlin = 0x00000004,
  cdoEasternEurope = 0x00000005,
  cdoPrague = 0x00000006,
  cdoAthens = 0x00000007,
  cdoBrasilia = 0x00000008,
  cdoAtlanticCanada = 0x00000009,
  cdoEastern = 0x0000000A,
  cdoCentral = 0x0000000B,
  cdoMountain = 0x0000000C,
  cdoPacific = 0x0000000D,
  cdoAlaska = 0x0000000E,
  cdoHawaii = 0x0000000F,
  cdoMidwayIsland = 0x00000010,
  cdoWellington = 0x00000011,
  cdoBrisbane = 0x00000012,
  cdoAdelaide = 0x00000013,
  cdoTokyo = 0x00000014,
  cdoSingapore = 0x00000015,
  cdoBangkok = 0x00000016,
  cdoBombay = 0x00000017,
  cdoAbuDhabi = 0x00000018,
  cdoTehran = 0x00000019,
  cdoBaghdad = 0x0000001A,
  cdoIsrael = 0x0000001B,
  cdoNewfoundland = 0x0000001C,
  cdoAzores = 0x0000001D,
  cdoMidAtlantic = 0x0000001E,
  cdoMonrovia = 0x0000001F,
  cdoBuenosAires = 0x00000020,
  cdoCaracas = 0x00000021,
  cdoIndiana = 0x00000022,
  cdoBogota = 0x00000023,
  cdoSaskatchewan = 0x00000024,
  cdoMexicoCity = 0x00000025,
  cdoArizona = 0x00000026,
  cdoEniwetok = 0x00000027,
  cdoFiji = 0x00000028,
  cdoMagadan = 0x00000029,
  cdoHobart = 0x0000002A,
  cdoGuam = 0x0000002B,
  cdoDarwin = 0x0000002C,
  cdoBeijing = 0x0000002D,
  cdoAlmaty = 0x0000002E,
  cdoIslamabad = 0x0000002F,
  cdoKabul = 0x00000030,
  cdoCairo = 0x00000031,
  cdoHarare = 0x00000032,
  cdoMoscow = 0x00000033,
  cdoFloating = 0x00000034,
  cdoCapeVerde = 0x00000035,
  cdoCaucasus = 0x00000036,
  cdoCentralAmerica = 0x00000037,
  cdoEastAfrica = 0x00000038,
  cdoMelbourne = 0x00000039,
  cdoEkaterinburg = 0x0000003A,
  cdoHelsinki = 0x0000003B,
  cdoGreenland = 0x0000003C,
  cdoRangoon = 0x0000003D,
  cdoNepal = 0x0000003E,
  cdoIrkutsk = 0x0000003F,
  cdoKrasnoyarsk = 0x00000040,
  cdoSantiago = 0x00000041,
  cdoSriLanka = 0x00000042,
  cdoTonga = 0x00000043,
  cdoVladivostok = 0x00000044,
  cdoWestCentralAfrica = 0x00000045,
  cdoYakutsk = 0x00000046,
  cdoDhaka = 0x00000047,
  cdoSeoul = 0x00000048,
  cdoPerth = 0x00000049,
  cdoArab = 0x0000004A,
  cdoTaipei = 0x0000004B,
  cdoSydney2000 = 0x0000004C,
  cdoInvalidTimeZone = 0x0000004E,
}

// Interfaces

// Defines methods and properties used to manage a collection of BodyPart objects.
interface IBodyParts : IDispatch {
  mixin(uuid("cd000023-8b95-11d1-82db-00c04fb1625d"));
  // static DWINGUID IID = { 0xcd000023, 0x8b95, 0x11d1, 0x82, 0xdb, 0x00, 0xc0, 0x4f, 0xb1, 0x62, 0x5d };
  // Returns the number of BodyPart objects in the collection.
  /*[id(0x00000001)]*/ int get_Count(out int varCount);
  // The specified BodyPart object in the collection.
  /*[id(0x00000000)]*/ int get_Item(int Index, out IBodyPart ppBody);
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown retval);
  // Deletes the specified BodyPart object from the collection. Can use the index or a reference to the object.
  /*[id(0x00000002)]*/ int Delete(DWINVARIANT varBP);
  // Deletes all BodyPart objects in the collection.
  /*[id(0x00000003)]*/ int DeleteAll();
  // Adds a BodyPart object to the collection at the specified index, and returns the newly added object.
  /*[id(0x00000004)]*/ int Add(int Index, out IBodyPart ppPart);
}

// Defines methods, properties, and collections used to manage a message body part.
interface IBodyPart : IDispatch {
  mixin(uuid("cd000021-8b95-11d1-82db-00c04fb1625d"));
  // static DWINGUID IID = { 0xcd000021, 0x8b95, 0x11d1, 0x82, 0xdb, 0x00, 0xc0, 0x4f, 0xb1, 0x62, 0x5d };
  // The object's BodyParts collection.
  /*[id(0x000000C8)]*/ int get_BodyParts(out IBodyParts varBodyParts);
  // The method used to encode the body part content. For example, quoted-printable or base64.
  /*[id(0x000000C9)]*/ int get_ContentTransferEncoding(out wchar* pContentTransferEncoding);
  // The method used to encode the body part content. For example, quoted-printable or base64.
  /*[id(0x000000C9)]*/ int put_ContentTransferEncoding(wchar* pContentTransferEncoding);
  // The content media type portion of the body part's content type.
  /*[id(0x000000CA)]*/ int get_ContentMediaType(out wchar* pContentMediaType);
  // The content media type portion of the body part's content type.
  /*[id(0x000000CA)]*/ int put_ContentMediaType(wchar* pContentMediaType);
  // The object's Fields collection.
  /*[id(0x000000CB)]*/ int get_Fields(out Fields varFields);
  // The character set of the body part's text content (not applicable for non-text content types).
  /*[id(0x000000CC)]*/ int get_Charset(out wchar* pCharset);
  // The character set of the body part's text content (not applicable for non-text content types).
  /*[id(0x000000CC)]*/ int put_Charset(wchar* pCharset);
  // The value of the filename parameter for the content-disposition MIME header.
  /*[id(0x000000CD)]*/ int get_FileName(out wchar* varFileName);
  // The object's IDataSource interface.
  /*[id(0x000000CF)]*/ int get_DataSource(out IDataSource varDataSource);
  // The body part's content class.
  /*[id(0x000000D0)]*/ int get_ContentClass(out wchar* pContentClass);
  // The body part's content class.
  /*[id(0x000000D0)]*/ int put_ContentClass(wchar* pContentClass);
  // Deprecated. Do not use.
  /*[id(0x000000D1)]*/ int get_ContentClassName(out wchar* pContentClassName);
  // Deprecated. Do not use.
  /*[id(0x000000D1)]*/ int put_ContentClassName(wchar* pContentClassName);
  // The object's parent object in the body part hierarchy.
  /*[id(0x000000D2)]*/ int get_Parent(out IBodyPart varParent);
  // Adds a body part to the object's BodyParts collection.
  /*[id(0x000000FA)]*/ int AddBodyPart(int Index, out IBodyPart ppPart);
  // Saves the body part content to the specified file.
  /*[id(0x000000FB)]*/ int SaveToFile(wchar* FileName);
  // Returns a Stream object containing the body part content in encoded format. The encoding method is specified in the ContentTransferEncoding property.
  /*[id(0x000000FC)]*/ int GetEncodedContentStream(out _Stream ppStream);
  // Returns a Stream object containing the body part content in decoded format.
  /*[id(0x000000FD)]*/ int GetDecodedContentStream(out _Stream ppStream);
  // Returns an ADO Stream object containing the body part in serialized, MIME encoded format.
  /*[id(0x000000FE)]*/ int GetStream(out _Stream ppStream);
  // Returns the specified parameter from the body part's specified header field.
  /*[id(0x000000FF)]*/ int GetFieldParameter(wchar* FieldName, wchar* Parameter, out wchar* pbstrValue);
  // Returns a specified interface on this object; provided for script languages.
  /*[id(0x000000A0)]*/ int GetInterface(wchar* Interface, out IDispatch ppUnknown);
}

// Defines methods, properties, and collections used to extract messages from or embed messages into other CDO message body parts.
interface IDataSource : IDispatch {
  mixin(uuid("cd000029-8b95-11d1-82db-00c04fb1625d"));
  // static DWINGUID IID = { 0xcd000029, 0x8b95, 0x11d1, 0x82, 0xdb, 0x00, 0xc0, 0x4f, 0xb1, 0x62, 0x5d };
  // The interface name (type) of the currently bound object. When you bind resources by URL, the value _Record is returned.
  /*[id(0x000000CF)]*/ int get_SourceClass(out wchar* varSourceClass);
  // Returns the currently bound object. When you bind resources by URL, an ADO _Record interface is returned on an open Record object.
  /*[id(0x000000D0)]*/ int get_Source(out IUnknown varSource);
  // Indicates whether the local data has been changed since the last save or bind operation.
  /*[id(0x000000D1)]*/ int get_IsDirty(out short pIsDirty);
  // Indicates whether the local data has been changed since the last save or bind operation.
  /*[id(0x000000D1)]*/ int put_IsDirty(short pIsDirty);
  // Not Implemented. Reserved for future use.
  /*[id(0x000000D2)]*/ int get_SourceURL(out wchar* varSourceURL);
  // Not implemented. Reserved for future use.
  /*[id(0x000000D3)]*/ int get_ActiveConnection(out _Connection varActiveConnection);
  // Binds to and saves data into the specified object.
  /*[id(0x000000FB)]*/ int SaveToObject(IUnknown Source, wchar* InterfaceName);
  // Binds to and opens data from the specified object.
  /*[id(0x000000FC)]*/ int OpenObject(IUnknown Source, wchar* InterfaceName);
  // Not implemented. Reserved for future use.
  /*[id(0x000000FD)]*/ int SaveTo(wchar* SourceURL, IDispatch ActiveConnection, ConnectModeEnum Mode, RecordCreateOptionsEnum CreateOptions, RecordOpenOptionsEnum Options, wchar* UserName, wchar* Password);
  // Not implemented. Reserved for future use.
  /*[id(0x000000FE)]*/ int Open(wchar* SourceURL, IDispatch ActiveConnection, ConnectModeEnum Mode, RecordCreateOptionsEnum CreateOptions, RecordOpenOptionsEnum Options, wchar* UserName, wchar* Password);
  // Saves data into the currently bound object.
  /*[id(0x000000FF)]*/ int Save();
  // Not implemented. Reserved for future use.
  /*[id(0x00000100)]*/ int SaveToContainer(wchar* ContainerURL, IDispatch ActiveConnection, ConnectModeEnum Mode, RecordCreateOptionsEnum CreateOptions, RecordOpenOptionsEnum Options, wchar* UserName, wchar* Password);
}

// Defines methods and properties used to manage a collection of Message objects on the file system. Returned by IDropDirectory.GetMessages.
interface IMessages : IDispatch {
  mixin(uuid("cd000025-8b95-11d1-82db-00c04fb1625d"));
  // static DWINGUID IID = { 0xcd000025, 0x8b95, 0x11d1, 0x82, 0xdb, 0x00, 0xc0, 0x4f, 0xb1, 0x62, 0x5d };
  // Returns the message specified by index from the collection.
  /*[id(0x00000000)]*/ int get_Item(int Index, out IMessage ppMessage);
  // The number of message objects in the collection.
  /*[id(0x00000001)]*/ int get_Count(out int varCount);
  // Deletes the specified message object in the collection.
  /*[id(0x00000002)]*/ int Delete(int Index);
  // Deletes all message objects in the collection.
  /*[id(0x00000003)]*/ int DeleteAll();
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown retval);
  // Returns the name of the file containing the specified message in the file system.
  /*[id(0x00000005)]*/ int get_FileName(DWINVARIANT var, out wchar* FileName);
}

// Defines methods, properties, and collections used to manage a message.
interface IMessage : IDispatch {
  mixin(uuid("cd000020-8b95-11d1-82db-00c04fb1625d"));
  // static DWINGUID IID = { 0xcd000020, 0x8b95, 0x11d1, 0x82, 0xdb, 0x00, 0xc0, 0x4f, 0xb1, 0x62, 0x5d };
  // The message's hidden carbon copy (BCC header) recipients.
  /*[id(0x00000065)]*/ int get_BCC(out wchar* pBCC);
  // The message's hidden carbon copy (BCC header) recipients.
  /*[id(0x00000065)]*/ int put_BCC(wchar* pBCC);
  // The message's secondary (CC header) recipients.
  /*[id(0x00000067)]*/ int get_CC(out wchar* pCC);
  // The message's secondary (CC header) recipients.
  /*[id(0x00000067)]*/ int put_CC(wchar* pCC);
  // The message's follow-up recipients.
  /*[id(0x00000069)]*/ int get_FollowUpTo(out wchar* pFollowUpTo);
  // The message's follow-up recipients.
  /*[id(0x00000069)]*/ int put_FollowUpTo(wchar* pFollowUpTo);
  // The message's principle (From header) authors.
  /*[id(0x0000006A)]*/ int get_From(out wchar* pFrom);
  // The message's principle (From header) authors.
  /*[id(0x0000006A)]*/ int put_From(wchar* pFrom);
  // The message's keywords.
  /*[id(0x0000006B)]*/ int get_Keywords(out wchar* pKeywords);
  // The message's keywords.
  /*[id(0x0000006B)]*/ int put_Keywords(wchar* pKeywords);
  // Indicates whether the message is to be serialized using the MIME (True) or UUENCODE (False) format.
  /*[id(0x0000006E)]*/ int get_MimeFormatted(out short pMimeFormatted);
  // Indicates whether the message is to be serialized using the MIME (True) or UUENCODE (False) format.
  /*[id(0x0000006E)]*/ int put_MimeFormatted(short pMimeFormatted);
  // The message's newsgroup (Newsgroups header) recipients.
  /*[id(0x0000006F)]*/ int get_Newsgroups(out wchar* pNewsgroups);
  // The message's newsgroup (Newsgroups header) recipients.
  /*[id(0x0000006F)]*/ int put_Newsgroups(wchar* pNewsgroups);
  // The sender's organization name.
  /*[id(0x00000070)]*/ int get_Organization(out wchar* pOrganization);
  // The sender's organization name.
  /*[id(0x00000070)]*/ int put_Organization(wchar* pOrganization);
  // The date and time the message was received.
  /*[id(0x00000072)]*/ int get_ReceivedTime(out double varReceivedTime);
  // The email addresses (Reply-To header) to which to reply.
  /*[id(0x00000073)]*/ int get_ReplyTo(out wchar* pReplyTo);
  // The email addresses (Reply-To header) to which to reply.
  /*[id(0x00000073)]*/ int put_ReplyTo(wchar* pReplyTo);
  // The delivery status notification (DSN) options for the message.
  /*[id(0x00000074)]*/ int get_DSNOptions(out CdoDSNOptions pDSNOptions);
  // The delivery status notification (DSN) options for the message.
  /*[id(0x00000074)]*/ int put_DSNOptions(CdoDSNOptions pDSNOptions);
  // The date and time the message was sent.
  /*[id(0x00000077)]*/ int get_SentOn(out double varSentOn);
  // The message's subject (Subject header).
  /*[id(0x00000078)]*/ int get_Subject(out wchar* pSubject);
  // The message's subject (Subject header).
  /*[id(0x00000078)]*/ int put_Subject(wchar* pSubject);
  // The message's principle (To header) recipients.
  /*[id(0x00000079)]*/ int get_To(out wchar* pTo);
  // The message's principle (To header) recipients.
  /*[id(0x00000079)]*/ int put_To(wchar* pTo);
  // The text/plain portion of the message body.
  /*[id(0x0000007B)]*/ int get_TextBody(out wchar* pTextBody);
  // The text/plain portion of the message body.
  /*[id(0x0000007B)]*/ int put_TextBody(wchar* pTextBody);
  // The text/html portion of the message body.
  /*[id(0x0000007C)]*/ int get_HTMLBody(out wchar* pHTMLBody);
  // The text/html portion of the message body.
  /*[id(0x0000007C)]*/ int put_HTMLBody(wchar* pHTMLBody);
  // The object's Attachments collection.
  /*[id(0x0000007D)]*/ int get_Attachments(out IBodyParts varAttachments);
  // The message's actual sender.
  /*[id(0x0000007E)]*/ int get_Sender(out wchar* pSender);
  // The message's actual sender.
  /*[id(0x0000007E)]*/ int put_Sender(wchar* pSender);
  // The object's Configuration object.
  /*[id(0x0000007F)]*/ int get_Configuration(out IConfiguration pConfiguration);
  // The object's Configuration object.
  /*[id(0x0000007F)]*/ int put_Configuration(IConfiguration pConfiguration);
  // The object's Configuration object.
  /*[id(0x0000007F)]*/ int putref_Configuration(IConfiguration pConfiguration);
  // Indicates whether a text/plain alternate representation should automatically be generated from the text/html part of the message body.
  /*[id(0x00000080)]*/ int get_AutoGenerateTextBody(out short pAutoGenerateTextBody);
  // Indicates whether a text/plain alternate representation should automatically be generated from the text/html part of the message body.
  /*[id(0x00000080)]*/ int put_AutoGenerateTextBody(short pAutoGenerateTextBody);
  // The transport envelope Fields collection for the message (transport event sinks only).
  /*[id(0x00000081)]*/ int get_EnvelopeFields(out Fields varEnvelopeFields);
  // Returns the BodyPart object (IBodyPart interface) containing the text/plain part of the message body.
  /*[id(0x00000082)]*/ int get_TextBodyPart(out IBodyPart varTextBodyPart);
  // Returns the BodyPart object (IBodyPart interface) containing the text/html portion of the message body.
  /*[id(0x00000083)]*/ int get_HTMLBodyPart(out IBodyPart varHTMLBodyPart);
  // The object's IBodyPart interface.
  /*[id(0x00000084)]*/ int get_BodyPart(out IBodyPart varBodyPart);
  // The object's IDataSource interface.
  /*[id(0x00000085)]*/ int get_DataSource(out IDataSource varDataSource);
  // The object's Fields collection.
  /*[id(0x00000086)]*/ int get_Fields(out Fields varFields);
  // Indicates whether a mail delivery notification (MDN) should be sent when the message is received.
  /*[id(0x00000087)]*/ int get_MDNRequested(out short pMDNRequested);
  // Indicates whether a mail delivery notification (MDN) should be sent when the message is received.
  /*[id(0x00000087)]*/ int put_MDNRequested(short pMDNRequested);
  // Adds a BodyPart object with content referenced within the text/html portion of the message body.
  /*[id(0x00000096)]*/ int AddRelatedBodyPart(wchar* URL, wchar* Reference, CdoReferenceType ReferenceType, wchar* UserName, wchar* Password, out IBodyPart ppBody);
  // Adds an attachment (BodyPart) to the message.
  /*[id(0x00000097)]*/ int AddAttachment(wchar* URL, wchar* UserName, wchar* Password, out IBodyPart ppBody);
  // Creates an MHTML-formatted message body using the resource(s) at the specified URL.
  /*[id(0x00000098)]*/ int CreateMHTMLBody(wchar* URL, CdoMHTMLFlags Flags, wchar* UserName, wchar* Password);
  // Returns a Message object used to forward a message.
  /*[id(0x00000099)]*/ int Forward(out IMessage ppMsg);
  // Posts the message using the method specified in the associated Configuration object.
  /*[id(0x0000009A)]*/ int Post();
  // Returns a Message object used to post a reply to the message.
  /*[id(0x0000009B)]*/ int PostReply(out IMessage ppMsg);
  // Returns a Message object used to reply to the message.
  /*[id(0x0000009C)]*/ int Reply(out IMessage ppMsg);
  // Returns a Message object used to post a reply to all recipients of the message.
  /*[id(0x0000009D)]*/ int ReplyAll(out IMessage ppMsg);
  // Sends the message using the method specified in the associated Configuration object.
  /*[id(0x0000009E)]*/ int Send();
  // Returns an ADO Stream object containing the message in serialized, RFC 822 format. The message body is encoded using either MIME or UUENCODE as specified by the MIMEFormatted property.
  /*[id(0x0000009F)]*/ int GetStream(out _Stream ppStream);
  // Returns a specified interface on this object; provided for script languages.
  /*[id(0x000000A0)]*/ int GetInterface(wchar* Interface, out IDispatch ppUnknown);
}

// Defines methods, properties, and collections used to manage configuration information for CDO objects.
interface IConfiguration : IDispatch {
  mixin(uuid("cd000022-8b95-11d1-82db-00c04fb1625d"));
  // static DWINGUID IID = { 0xcd000022, 0x8b95, 0x11d1, 0x82, 0xdb, 0x00, 0xc0, 0x4f, 0xb1, 0x62, 0x5d };
  // The object's Fields collection.
  /*[id(0x00000000)]*/ int get_Fields(out Fields varFields);
  // Loads the specified configuration.
  /*[id(0x00000032)]*/ int Load(CdoConfigSource LoadFrom, wchar* URL);
  // Returns a specified interface on this object; provided for script languages.
  /*[id(0x000000A0)]*/ int GetInterface(wchar* Interface, out IDispatch ppUnknown);
}

// Defines methods, properties, and collections used to manage a collection of messages on the file system.
interface IDropDirectory : IDispatch {
  mixin(uuid("cd000024-8b95-11d1-82db-00c04fb1625d"));
  // static DWINGUID IID = { 0xcd000024, 0x8b95, 0x11d1, 0x82, 0xdb, 0x00, 0xc0, 0x4f, 0xb1, 0x62, 0x5d };
  // Returns a collection of messages contained in the specified directory on the file system. The default location is the SMTP drop directory.
  /*[id(0x000000C8)]*/ int GetMessages(wchar* DirName, out IMessages Msgs);
}

// ISMTPScriptConnector interface
interface ISMTPScriptConnector : IDispatch {
  mixin(uuid("cd000030-8b95-11d1-82db-00c04fb1625d"));
  // static DWINGUID IID = { 0xcd000030, 0x8b95, 0x11d1, 0x82, 0xdb, 0x00, 0xc0, 0x4f, 0xb1, 0x62, 0x5d };
}

// Implement when creating SMTP OnArrival event sinks.
interface ISMTPOnArrival : IDispatch {
  mixin(uuid("cd000026-8b95-11d1-82db-00c04fb1625d"));
  // static DWINGUID IID = { 0xcd000026, 0x8b95, 0x11d1, 0x82, 0xdb, 0x00, 0xc0, 0x4f, 0xb1, 0x62, 0x5d };
  // Called by the SMTP event dispatcher when a message arrives.
  /*[id(0x00000100)]*/ int OnArrival(IMessage Msg, ref CdoEventStatus EventStatus);
}

// INNTPFinalScriptConnector interface
interface INNTPEarlyScriptConnector : IDispatch {
  mixin(uuid("cd000034-8b95-11d1-82db-00c04fb1625d"));
  // static DWINGUID IID = { 0xcd000034, 0x8b95, 0x11d1, 0x82, 0xdb, 0x00, 0xc0, 0x4f, 0xb1, 0x62, 0x5d };
}

// Implement when creating NNTP OnPostEarly event sinks.
interface INNTPOnPostEarly : IDispatch {
  mixin(uuid("cd000033-8b95-11d1-82db-00c04fb1625d"));
  // static DWINGUID IID = { 0xcd000033, 0x8b95, 0x11d1, 0x82, 0xdb, 0x00, 0xc0, 0x4f, 0xb1, 0x62, 0x5d };
  // Called by the NNTP event dispatcher when message headers arrive.
  /*[id(0x00000100)]*/ int OnPostEarly(IMessage Msg, ref CdoEventStatus EventStatus);
}

// INNTPPostScriptConnector interface
interface INNTPPostScriptConnector : IDispatch {
  mixin(uuid("cd000031-8b95-11d1-82db-00c04fb1625d"));
  // static DWINGUID IID = { 0xcd000031, 0x8b95, 0x11d1, 0x82, 0xdb, 0x00, 0xc0, 0x4f, 0xb1, 0x62, 0x5d };
}

// Implement when creating NNTP OnPost event sinks.
interface INNTPOnPost : IDispatch {
  mixin(uuid("cd000027-8b95-11d1-82db-00c04fb1625d"));
  // static DWINGUID IID = { 0xcd000027, 0x8b95, 0x11d1, 0x82, 0xdb, 0x00, 0xc0, 0x4f, 0xb1, 0x62, 0x5d };
  // Called by the NNTP event dispatcher when a message is posted.
  /*[id(0x00000100)]*/ int OnPost(IMessage Msg, ref CdoEventStatus EventStatus);
}

// INNTPFinalScriptConnector interface
interface INNTPFinalScriptConnector : IDispatch {
  mixin(uuid("cd000032-8b95-11d1-82db-00c04fb1625d"));
  // static DWINGUID IID = { 0xcd000032, 0x8b95, 0x11d1, 0x82, 0xdb, 0x00, 0xc0, 0x4f, 0xb1, 0x62, 0x5d };
}

// Implement when creating NNTP OnPostFinal event sinks.
interface INNTPOnPostFinal : IDispatch {
  mixin(uuid("cd000028-8b95-11d1-82db-00c04fb1625d"));
  // static DWINGUID IID = { 0xcd000028, 0x8b95, 0x11d1, 0x82, 0xdb, 0x00, 0xc0, 0x4f, 0xb1, 0x62, 0x5d };
  // Called by the NNTP event dispatcher after a posted message has been saved to its final location.
  /*[id(0x00000100)]*/ int OnPostFinal(IMessage Msg, ref CdoEventStatus EventStatus);
}

// CoClasses

// Defines an object used to manage a message.
abstract class Message {
  mixin(uuid("cd000001-8b95-11d1-82db-00c04fb1625d"));
  // static DWINGUID CLSID = { 0xcd000001, 0x8b95, 0x11d1, 0x82, 0xdb, 0x00, 0xc0, 0x4f, 0xb1, 0x62, 0x5d };
  mixin Interfaces!(IMessage, IDataSource, IBodyPart);
}

// Defines an object used to store configuration information for CDO objects.
abstract class Configuration {
  mixin(uuid("cd000002-8b95-11d1-82db-00c04fb1625d"));
  // static DWINGUID CLSID = { 0xcd000002, 0x8b95, 0x11d1, 0x82, 0xdb, 0x00, 0xc0, 0x4f, 0xb1, 0x62, 0x5d };
  mixin Interfaces!(IConfiguration);
}

// Defines an object used to access messages located on the file system.
abstract class DropDirectory {
  mixin(uuid("cd000004-8b95-11d1-82db-00c04fb1625d"));
  // static DWINGUID CLSID = { 0xcd000004, 0x8b95, 0x11d1, 0x82, 0xdb, 0x00, 0xc0, 0x4f, 0xb1, 0x62, 0x5d };
  mixin Interfaces!(IDropDirectory);
}

// SMTPConnector Class
abstract class SMTPConnector {
  mixin(uuid("cd000008-8b95-11d1-82db-00c04fb1625d"));
  // static DWINGUID CLSID = { 0xcd000008, 0x8b95, 0x11d1, 0x82, 0xdb, 0x00, 0xc0, 0x4f, 0xb1, 0x62, 0x5d };
  mixin Interfaces!(ISMTPScriptConnector);
}

// NNTPEarlyConnector Class
abstract class NNTPEarlyConnector {
  mixin(uuid("cd000011-8b95-11d1-82db-00c04fb1625d"));
  // static DWINGUID CLSID = { 0xcd000011, 0x8b95, 0x11d1, 0x82, 0xdb, 0x00, 0xc0, 0x4f, 0xb1, 0x62, 0x5d };
  mixin Interfaces!(INNTPEarlyScriptConnector);
}

// NNTPPostConnector Class
abstract class NNTPPostConnector {
  mixin(uuid("cd000009-8b95-11d1-82db-00c04fb1625d"));
  // static DWINGUID CLSID = { 0xcd000009, 0x8b95, 0x11d1, 0x82, 0xdb, 0x00, 0xc0, 0x4f, 0xb1, 0x62, 0x5d };
  mixin Interfaces!(INNTPPostScriptConnector);
}

// NNTPFinalConnector Class
abstract class NNTPFinalConnector {
  mixin(uuid("cd000010-8b95-11d1-82db-00c04fb1625d"));
  // static DWINGUID CLSID = { 0xcd000010, 0x8b95, 0x11d1, 0x82, 0xdb, 0x00, 0xc0, 0x4f, 0xb1, 0x62, 0x5d };
  mixin Interfaces!(INNTPFinalScriptConnector);
}

// Global variables
const char[] cdoTimeZoneIDURN = "urn:schemas:calendar:timezoneid";
const char[] cdoBIG5 = "big5";
const char[] cdoEUC_JP = "euc-jp";
const char[] cdoEUC_KR = "euc-kr";
const char[] cdoGB2312 = "gb2312";
const char[] cdoISO_2022_JP = "iso-2022-jp";
const char[] cdoISO_2022_KR = "iso-2022-kr";
const char[] cdoISO_8859_1 = "iso-8859-1";
const char[] cdoISO_8859_2 = "iso-8859-2";
const char[] cdoISO_8859_3 = "iso-8859-3";
const char[] cdoISO_8859_4 = "iso-8859-4";
const char[] cdoISO_8859_5 = "iso-8859-5";
const char[] cdoISO_8859_6 = "iso-8859-6";
const char[] cdoISO_8859_7 = "iso-8859-7";
const char[] cdoISO_8859_8 = "iso-8859-8";
const char[] cdoISO_8859_9 = "iso-8859-9";
const char[] cdoKOI8_R = "koi8-r";
const char[] cdoShift_JIS = "shift-jis";
const char[] cdoUS_ASCII = "us-ascii";
const char[] cdoUTF_7 = "utf-7";
const char[] cdoUTF_8 = "utf-8";
const char[] cdoISO_8859_15 = "iso-8859-15";
const char[] cdoAutoPromoteBodyParts = "http://schemas.microsoft.com/cdo/configuration/autopromotebodyparts";
const char[] cdoFlushBuffersOnWrite = "http://schemas.microsoft.com/cdo/configuration/flushbuffersonwrite";
const char[] cdoHTTPCookies = "http://schemas.microsoft.com/cdo/configuration/httpcookies";
const char[] cdoLanguageCode = "http://schemas.microsoft.com/cdo/configuration/languagecode";
const char[] cdoNNTPAccountName = "http://schemas.microsoft.com/cdo/configuration/nntpaccountname";
const char[] cdoNNTPAuthenticate = "http://schemas.microsoft.com/cdo/configuration/nntpauthenticate";
const char[] cdoNNTPConnectionTimeout = "http://schemas.microsoft.com/cdo/configuration/nntpconnectiontimeout";
const char[] cdoNNTPServer = "http://schemas.microsoft.com/cdo/configuration/nntpserver";
const char[] cdoNNTPServerPickupDirectory = "http://schemas.microsoft.com/cdo/configuration/nntpserverpickupdirectory";
const char[] cdoNNTPServerPort = "http://schemas.microsoft.com/cdo/configuration/nntpserverport";
const char[] cdoNNTPUseSSL = "http://schemas.microsoft.com/cdo/configuration/nntpusessl";
const char[] cdoPostEmailAddress = "http://schemas.microsoft.com/cdo/configuration/postemailaddress";
const char[] cdoPostPassword = "http://schemas.microsoft.com/cdo/configuration/postpassword";
const char[] cdoPostUserName = "http://schemas.microsoft.com/cdo/configuration/postusername";
const char[] cdoPostUserReplyEmailAddress = "http://schemas.microsoft.com/cdo/configuration/postuserreplyemailaddress";
const char[] cdoPostUsingMethod = "http://schemas.microsoft.com/cdo/configuration/postusing";
const char[] cdoSaveSentItems = "http://schemas.microsoft.com/cdo/configuration/savesentitems";
const char[] cdoSendEmailAddress = "http://schemas.microsoft.com/cdo/configuration/sendemailaddress";
const char[] cdoSendPassword = "http://schemas.microsoft.com/cdo/configuration/sendpassword";
const char[] cdoSendUserName = "http://schemas.microsoft.com/cdo/configuration/sendusername";
const char[] cdoSendUserReplyEmailAddress = "http://schemas.microsoft.com/cdo/configuration/senduserreplyemailaddress";
const char[] cdoSendUsingMethod = "http://schemas.microsoft.com/cdo/configuration/sendusing";
const char[] cdoSMTPAccountName = "http://schemas.microsoft.com/cdo/configuration/smtpaccountname";
const char[] cdoSMTPAuthenticate = "http://schemas.microsoft.com/cdo/configuration/smtpauthenticate";
const char[] cdoSMTPConnectionTimeout = "http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout";
const char[] cdoSMTPServer = "http://schemas.microsoft.com/cdo/configuration/smtpserver";
const char[] cdoSMTPServerPickupDirectory = "http://schemas.microsoft.com/cdo/configuration/smtpserverpickupdirectory";
const char[] cdoSMTPServerPort = "http://schemas.microsoft.com/cdo/configuration/smtpserverport";
const char[] cdoSMTPUseSSL = "http://schemas.microsoft.com/cdo/configuration/smtpusessl";
const char[] cdoURLGetLatestVersion = "http://schemas.microsoft.com/cdo/configuration/urlgetlatestversion";
const char[] cdoURLProxyBypass = "http://schemas.microsoft.com/cdo/configuration/urlproxybypass";
const char[] cdoURLProxyServer = "http://schemas.microsoft.com/cdo/configuration/urlproxyserver";
const char[] cdoUseMessageResponseText = "http://schemas.microsoft.com/cdo/configuration/usemessageresponsetext";
const char[] cdoGif = "image/gif";
const char[] cdoJpeg = "image/jpeg";
const char[] cdoMessageExternalBody = "message/external-body";
const char[] cdoMessagePartial = "message/partial";
const char[] cdoMessageRFC822 = "message/rfc822";
const char[] cdoMultipartAlternative = "multipart/alternative";
const char[] cdoMultipartDigest = "multipart/digest";
const char[] cdoMultipartMixed = "multipart/mixed";
const char[] cdoMultipartRelated = "multipart/related";
const char[] cdoTextHTML = "text/html";
const char[] cdoTextPlain = "text/plain";
const char[] cdoContentClass = "DAV:contentclass";
const char[] cdoGetContentType = "DAV:getcontenttype";
const char[] cdo7bit = "7bit";
const char[] cdo8bit = "8bit";
const char[] cdoBase64 = "base64";
const char[] cdoBinary = "binary";
const char[] cdoMacBinHex40 = "mac-binhex40";
const char[] cdoQuotedPrintable = "quoted-printable";
const char[] cdoUuencode = "uuencode";
const char[] cdoSensitivity = "http://schemas.microsoft.com/exchange/sensitivity";
const char[] cdoAttachmentFilename = "urn:schemas:httpmail:attachmentfilename";
const char[] cdoBcc = "urn:schemas:httpmail:bcc";
const char[] cdoCc = "urn:schemas:httpmail:cc";
const char[] cdoContentDispositionType = "urn:schemas:httpmail:content-disposition-type";
const char[] cdoContentMediaType = "urn:schemas:httpmail:content-media-type";
const char[] cdoDate = "urn:schemas:httpmail:date";
const char[] cdoDateReceived = "urn:schemas:httpmail:datereceived";
const char[] cdoFrom = "urn:schemas:httpmail:from";
const char[] cdoHasAttachment = "urn:schemas:httpmail:hasattachment";
const char[] cdoHTMLDescription = "urn:schemas:httpmail:htmldescription";
const char[] cdoImportance = "urn:schemas:httpmail:importance";
const char[] cdoNormalizedSubject = "urn:schemas:httpmail:normalizedsubject";
const char[] cdoPriority = "urn:schemas:httpmail:priority";
const char[] cdoReplyTo = "urn:schemas:httpmail:reply-to";
const char[] cdoSender = "urn:schemas:httpmail:sender";
const char[] cdoSubject = "urn:schemas:httpmail:subject";
const char[] cdoTextDescription = "urn:schemas:httpmail:textdescription";
const char[] cdoThreadTopic = "urn:schemas:httpmail:thread-topic";
const char[] cdoTo = "urn:schemas:httpmail:to";
const char[] cdoAdoStream = "_Stream";
const char[] cdoIBodyPart = "IBodyPart";
const char[] cdoIConfiguration = "IConfiguration";
const char[] cdoIDataSource = "IDataSource";
const char[] cdoIMessage = "IMessage";
const char[] cdoIStream = "IStream";
const char[] cdoApproved = "urn:schemas:mailheader:approved";
const char[] cdoComment = "urn:schemas:mailheader:comment";
const char[] cdoContentBase = "urn:schemas:mailheader:content-base";
const char[] cdoContentDescription = "urn:schemas:mailheader:content-description";
const char[] cdoContentDisposition = "urn:schemas:mailheader:content-disposition";
const char[] cdoContentId = "urn:schemas:mailheader:content-id";
const char[] cdoContentLanguage = "urn:schemas:mailheader:content-language";
const char[] cdoContentLocation = "urn:schemas:mailheader:content-location";
const char[] cdoContentTransferEncoding = "urn:schemas:mailheader:content-transfer-encoding";
const char[] cdoContentType = "urn:schemas:mailheader:content-type";
const char[] cdoControl = "urn:schemas:mailheader:control";
const char[] cdoDisposition = "urn:schemas:mailheader:disposition";
const char[] cdoDispositionNotificationTo = "urn:schemas:mailheader:disposition-notification-to";
const char[] cdoDistribution = "urn:schemas:mailheader:distribution";
const char[] cdoExpires = "urn:schemas:mailheader:expires";
const char[] cdoFollowupTo = "urn:schemas:mailheader:followup-to";
const char[] cdoInReplyTo = "urn:schemas:mailheader:in-reply-to";
const char[] cdoLines = "urn:schemas:mailheader:lines";
const char[] cdoMessageId = "urn:schemas:mailheader:message-id";
const char[] cdoMIMEVersion = "urn:schemas:mailheader:mime-version";
const char[] cdoNewsgroups = "urn:schemas:mailheader:newsgroups";
const char[] cdoOrganization = "urn:schemas:mailheader:organization";
const char[] cdoOriginalRecipient = "urn:schemas:mailheader:original-recipient";
const char[] cdoPath = "urn:schemas:mailheader:path";
const char[] cdoPostingVersion = "urn:schemas:mailheader:posting-version";
const char[] cdoReceived = "urn:schemas:mailheader:received";
const char[] cdoReferences = "urn:schemas:mailheader:references";
const char[] cdoRelayVersion = "urn:schemas:mailheader:relay-version";
const char[] cdoReturnPath = "urn:schemas:mailheader:return-path";
const char[] cdoReturnReceiptTo = "urn:schemas:mailheader:return-receipt-to";
const char[] cdoSummary = "urn:schemas:mailheader:summary";
const char[] cdoThreadIndex = "urn:schemas:mailheader:thread-index";
const char[] cdoXMailer = "urn:schemas:mailheader:x-mailer";
const char[] cdoXref = "urn:schemas:mailheader:xref";
const char[] cdoXUnsent = "urn:schemas:mailheader:x-unsent";
const char[] cdoXFidelity = "urn:schemas:mailheader:x-cdostreamhighfidelity";
const char[] cdoNSConfiguration = "http://schemas.microsoft.com/cdo/configuration/";
const char[] cdoNSContacts = "urn:schemas:contacts:";
const char[] cdoNSHTTPMail = "urn:schemas:httpmail:";
const char[] cdoNSMailHeader = "urn:schemas:mailheader:";
const char[] cdoNSNNTPEnvelope = "http://schemas.microsoft.com/cdo/nntpenvelope/";
const char[] cdoNSSMTPEnvelope = "http://schemas.microsoft.com/cdo/smtpenvelope/";
const char[] cdoNewsgroupList = "http://schemas.microsoft.com/cdo/nntpenvelope/newsgrouplist";
const char[] cdoNNTPProcessing = "http://schemas.microsoft.com/cdo/nntpenvelope/nntpprocessing";
const char[] cdoKeywords = "urn:schemas-microsoft-com:office:office#Keywords";
const char[] cdoArrivalTime = "http://schemas.microsoft.com/cdo/smtpenvelope/arrivaltime";
const char[] cdoClientIPAddress = "http://schemas.microsoft.com/cdo/smtpenvelope/clientipaddress";
const char[] cdoMessageStatus = "http://schemas.microsoft.com/cdo/smtpenvelope/messagestatus";
const char[] cdoPickupFileName = "http://schemas.microsoft.com/cdo/smtpenvelope/pickupfilename";
const char[] cdoRecipientList = "http://schemas.microsoft.com/cdo/smtpenvelope/recipientlist";
const char[] cdoSenderEmailAddress = "http://schemas.microsoft.com/cdo/smtpenvelope/senderemailaddress";
const int CDO_E_UNCAUGHT_EXCEPTION = 0x80040201;
const int CDO_E_NOT_OPENED = 0x80040202;
const int CDO_E_UNSUPPORTED_DATASOURCE = 0x80040203;
const int CDO_E_INVALID_PROPERTYNAME = 0x80040204;
const int CDO_E_PROP_UNSUPPORTED = 0x80040205;
const int CDO_E_INACTIVE = 0x80040206;
const int CDO_E_NO_SUPPORT_FOR_OBJECTS = 0x80040207;
const int CDO_E_NOT_AVAILABLE = 0x80040208;
const int CDO_E_NO_DEFAULT_DROP_DIR = 0x80040209;
const int CDO_E_SMTP_SERVER_REQUIRED = 0x8004020A;
const int CDO_E_NNTP_SERVER_REQUIRED = 0x8004020B;
const int CDO_E_RECIPIENT_MISSING = 0x8004020C;
const int CDO_E_FROM_MISSING = 0x8004020D;
const int CDO_E_SENDER_REJECTED = 0x8004020E;
const int CDO_E_RECIPIENTS_REJECTED = 0x8004020F;
const int CDO_E_NNTP_POST_FAILED = 0x80040210;
const int CDO_E_SMTP_SEND_FAILED = 0x80040211;
const int CDO_E_CONNECTION_DROPPED = 0x80040212;
const int CDO_E_FAILED_TO_CONNECT = 0x80040213;
const int CDO_E_INVALID_POST = 0x80040214;
const int CDO_E_AUTHENTICATION_FAILURE = 0x80040215;
const int CDO_E_INVALID_CONTENT_TYPE = 0x80040216;
const int CDO_E_LOGON_FAILURE = 0x80040217;
const int CDO_E_HTTP_NOT_FOUND = 0x80040218;
const int CDO_E_HTTP_FORBIDDEN = 0x80040219;
const int CDO_E_HTTP_FAILED = 0x8004021A;
const int CDO_E_MULTIPART_NO_DATA = 0x8004021B;
const int CDO_E_INVALID_ENCODING_FOR_MULTIPART = 0x8004021C;
const int CDO_E_UNSAFE_OPERATION = 0x8004021D;
const int CDO_E_PROP_NOT_FOUND = 0x8004021E;
const int CDO_E_INVALID_SEND_OPTION = 0x80040220;
const int CDO_E_INVALID_POST_OPTION = 0x80040221;
const int CDO_E_NO_PICKUP_DIR = 0x80040222;
const int CDO_E_NOT_ALL_DELETED = 0x80040223;
const int CDO_E_NO_METHOD = 0x80040224;
const int CDO_E_PROP_READONLY = 0x80040227;
const int CDO_E_PROP_CANNOT_DELETE = 0x80040228;
const int CDO_E_BAD_DATA = 0x80040229;
const int CDO_E_PROP_NONHEADER = 0x8004022A;
const int CDO_E_INVALID_CHARSET = 0x8004022B;
const int CDO_E_ADOSTREAM_NOT_BOUND = 0x8004022C;
const int CDO_E_CONTENTPROPXML_NOT_FOUND = 0x8004022D;
const int CDO_E_CONTENTPROPXML_WRONG_CHARSET = 0x8004022E;
const int CDO_E_CONTENTPROPXML_PARSE_FAILED = 0x8004022F;
const int CDO_E_CONTENTPROPXML_CONVERT_FAILED = 0x80040230;
const int CDO_E_NO_DIRECTORIES_SPECIFIED = 0x80040231;
const int CDO_E_DIRECTORIES_UNREACHABLE = 0x80040232;
const int CDO_E_BAD_SENDER = 0x80040233;
const int CDO_E_SELF_BINDING = 0x80040234;
const int CDO_E_BAD_ATTENDEE_DATA = 0x80040235;
const int CDO_E_ROLE_NOMORE_AVAILABLE = 0x80040236;
const int CDO_E_BAD_TASKTYPE_ONASSIGN = 0x80040237;
const int CDO_E_NOT_ASSIGNEDTO_USER = 0x80040238;
const int CDO_E_OUTOFDATE = 0x80040239;
const int CDO_E_ARGUMENT1 = 0x80044000;
const int CDO_E_ARGUMENT2 = 0x80044001;
const int CDO_E_ARGUMENT3 = 0x80044002;
const int CDO_E_ARGUMENT4 = 0x80044003;
const int CDO_E_ARGUMENT5 = 0x80044004;
const int CDO_E_NOT_FOUND = 0x800CCE05;
const int CDO_E_INVALID_ENCODING_TYPE = 0x800CCE1D;

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
