// Microsoft AutoDiscovery Type Library
// Version 1.0

/*[uuid("4eafb888-81cb-4eba-bac9-da254e5721f1")]*/
//module dwin.sys.win32.com.tlb.more.autodiscovery;
module dwin.sys.win32.com.tlb.more.autodisc;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

// Constants that define a node's type
enum tagDOMNodeType {
  NODE_INVALID = 0x00000000,
  NODE_ELEMENT = 0x00000001,
  NODE_ATTRIBUTE = 0x00000002,
  NODE_TEXT = 0x00000003,
  NODE_CDATA_SECTION = 0x00000004,
  NODE_ENTITY_REFERENCE = 0x00000005,
  NODE_ENTITY = 0x00000006,
  NODE_PROCESSING_INSTRUCTION = 0x00000007,
  NODE_COMMENT = 0x00000008,
  NODE_DOCUMENT = 0x00000009,
  NODE_DOCUMENT_TYPE = 0x0000000A,
  NODE_DOCUMENT_FRAGMENT = 0x0000000B,
  NODE_NOTATION = 0x0000000C,
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

// Constants that define a node's type
alias tagDOMNodeType DOMNodeType;

alias _RemotableHandle* wireHWND;

// Interfaces

interface IAutoDiscoveryProvider : IDispatch {
  mixin(uuid("9dcf4a37-01de-4549-a9cb-3ac31ec23c4f"));
  // static DWINGUID IID = { 0x9dcf4a37, 0x01de, 0x4549, 0xa9, 0xcb, 0x3a, 0xc3, 0x1e, 0xc2, 0x3c, 0x4f };
  // Get the protocol name
  /*[id(0x000000C9)]*/ int get_length(out int pnLength);
  // Get the Server Name (pop.mail.yahoo.com)
  /*[id(0x000000CA)]*/ int get_item(DWINVARIANT varIndex, out wchar* pbstr);
}

interface IMailAutoDiscovery : IDispatch {
  mixin(uuid("80402dee-b114-4d32-b44e-82fd8234c92a"));
  // static DWINGUID IID = { 0x80402dee, 0xb114, 0x4d32, 0xb4, 0x4e, 0x82, 0xfd, 0x82, 0x34, 0xc9, 0x2a };
  // Get the display name for the account
  /*[id(0x00000064)]*/ int get_DisplayName(out wchar* pbstr);
  // Get the URL that the server or service may provide that describes how to configure your e-mail or other information about getting email.
  /*[id(0x00000065)]*/ int get_InfoURL(out wchar* pbstrURL);
  // Get the prefered protocol
  /*[id(0x00000067)]*/ int get_PreferedProtocolType(out wchar* pbstrProtocolType);
  // Put the number of supported protocols
  /*[id(0x00000068)]*/ int get_length(out int pnLength);
  // Get the protocol by index
  /*[id(0x00000069)]*/ int get_item(DWINVARIANT varIndex, out IMailProtocolADEntry ppMailProtocol);
  // Get XML
  /*[id(0x00000066)]*/ int get_xml(out IXMLDOMDocument ppXMLDoc);
  // Get XML
  /*[id(0x00000066)]*/ int set_xml(IXMLDOMDocument ppXMLDoc);
  // What servers will be contacted that will have the full email address uploaded?
  /*[id(0x00000099)]*/ int getPrimaryProviders(wchar* bstrEmailAddress, out IAutoDiscoveryProvider ppProviders);
  // What servers will be contacted that will have the hostname of the email address uploaded?
  /*[id(0x0000009A)]*/ int getSecondaryProviders(wchar* bstrEmailAddress, out IAutoDiscoveryProvider ppProviders);
  // Get the information for this email address.
  /*[id(0x00000097)]*/ int DiscoverMail(wchar* bstrEmailAddress);
  // Delete this from the cache so we hit the net the next time
  /*[id(0x00000096)]*/ int PurgeCache();
  // Make DiscoverNow return right way before finished.  The specified message will be sent to the hwnd when it finishes.  The LPARAM will have the IXMLDOMDocument result.
  /*[id(0x00000098)]*/ int WorkAsync(wireHWND hwnd, uint wMsg);
}

interface IMailProtocolADEntry : IDispatch {
  mixin(uuid("40ef8c68-d554-47ed-aa37-e5fb6bc91075"));
  // static DWINGUID IID = { 0x40ef8c68, 0xd554, 0x47ed, 0xaa, 0x37, 0xe5, 0xfb, 0x6b, 0xc9, 0x10, 0x75 };
  // Get the protocol name
  /*[id(0x000000C9)]*/ int get_Protocol(out wchar* pbstr);
  // Get the Server Name (pop.mail.yahoo.com)
  /*[id(0x000000CA)]*/ int get_ServerName(out wchar* pbstr);
  // Get the Server Port Number (default or 123)
  /*[id(0x000000CB)]*/ int get_ServerPort(out wchar* pbstr);
  // Get the login name for this account
  /*[id(0x000000CC)]*/ int get_LoginName(out wchar* pbstr);
  // Get the HTTP Post HTML
  /*[id(0x000000CD)]*/ int get_PostHTML(out wchar* pbstr);
  // Does the Server support SSL?
  /*[id(0x000000CE)]*/ int get_UseSSL(out short pfUseSSL);
  // Is Authentication required when logging into the server?
  /*[id(0x000000CF)]*/ int get_IsAuthRequired(out short pfIsAuthRequired);
  // Should SPA be used during authentication
  /*[id(0x000000D0)]*/ int get_UseSPA(out short pfUseSPA);
  // If SMTP, does it use the auth settings from POP3?
  /*[id(0x000000D1)]*/ int get_SMTPUsesPOP3Auth(out short pfUsePOP3Auth);
}

interface IXMLDOMDocument : IXMLDOMNode {
  mixin(uuid("2933bf81-7b36-11d2-b20e-00c04f983e60"));
  // static DWINGUID IID = { 0x2933bf81, 0x7b36, 0x11d2, 0xb2, 0x0e, 0x00, 0xc0, 0x4f, 0x98, 0x3e, 0x60 };
  // node corresponding to the DOCTYPE
  /*[id(0x00000026)]*/ int get_doctype(out IXMLDOMDocumentType documentType);
  // info on this DOM implementation
  /*[id(0x00000027)]*/ int get_implementation(out IXMLDOMImplementation impl);
  // the root of the tree
  /*[id(0x00000028)]*/ int get_documentElement(out IXMLDOMElement DOMElement);
  // the root of the tree
  /*[id(0x00000028)]*/ int setref_documentElement(IXMLDOMElement DOMElement);
  // create an Element node
  /*[id(0x00000029)]*/ int createElement(wchar* tagName, out IXMLDOMElement element);
  // create a DocumentFragment node
  /*[id(0x0000002A)]*/ int createDocumentFragment(out IXMLDOMDocumentFragment docFrag);
  // create a text node
  /*[id(0x0000002B)]*/ int createTextNode(wchar* data, out IXMLDOMText text);
  // create a comment node
  /*[id(0x0000002C)]*/ int createComment(wchar* data, out IXMLDOMComment comment);
  // create a CDATA section node
  /*[id(0x0000002D)]*/ int createCDATASection(wchar* data, out IXMLDOMCDATASection cdata);
  // create a processing instruction node
  /*[id(0x0000002E)]*/ int createProcessingInstruction(wchar* target, wchar* data, out IXMLDOMProcessingInstruction pi);
  // create an attribute node
  /*[id(0x0000002F)]*/ int createAttribute(wchar* name, out IXMLDOMAttribute attribute);
  // create an entity reference node
  /*[id(0x00000031)]*/ int createEntityReference(wchar* name, out IXMLDOMEntityReference entityRef);
  // build a list of elements by name
  /*[id(0x00000032)]*/ int getElementsByTagName(wchar* tagName, out IXMLDOMNodeList resultList);
  // create a node of the specified node type and name
  /*[id(0x00000036)]*/ int createNode(DWINVARIANT type, wchar* name, wchar* namespaceURI, out IXMLDOMNode node);
  // retrieve node from it's ID
  /*[id(0x00000038)]*/ int nodeFromID(wchar* idString, out IXMLDOMNode node);
  // load document from the specified XML source
  /*[id(0x0000003A)]*/ int load(DWINVARIANT xmlSource, out short isSuccessful);
  // get the state of the XML document
  /*[id(0xFFFFFDF3)]*/ int get_readyState(out int value);
  // get the last parser error
  /*[id(0x0000003B)]*/ int get_parseError(out IXMLDOMParseError errorObj);
  // get the URL for the loaded XML document
  /*[id(0x0000003C)]*/ int get_url(out wchar* urlString);
  // flag for asynchronous download
  /*[id(0x0000003D)]*/ int get_async(out short isAsync);
  // flag for asynchronous download
  /*[id(0x0000003D)]*/ int set_async(short isAsync);
  // abort an asynchronous download
  /*[id(0x0000003E)]*/ int abort();
  // load the document from a string
  /*[id(0x0000003F)]*/ int loadXML(wchar* bstrXML, out short isSuccessful);
  // save the document to a specified desination
  /*[id(0x00000040)]*/ int save(DWINVARIANT desination);
  // indicates whether the parser performs validation
  /*[id(0x00000041)]*/ int get_validateOnParse(out short isValidating);
  // indicates whether the parser performs validation
  /*[id(0x00000041)]*/ int set_validateOnParse(short isValidating);
  // indicates whether the parser resolves references to external DTD/Entities/Schema
  /*[id(0x00000042)]*/ int get_resolveExternals(out short isResolving);
  // indicates whether the parser resolves references to external DTD/Entities/Schema
  /*[id(0x00000042)]*/ int set_resolveExternals(short isResolving);
  // indicates whether the parser preserves whitespace
  /*[id(0x00000043)]*/ int get_preserveWhiteSpace(out short isPreserving);
  // indicates whether the parser preserves whitespace
  /*[id(0x00000043)]*/ int set_preserveWhiteSpace(short isPreserving);
  // register a readystatechange event handler
  /*[id(0x00000044)]*/ int set_onreadystatechange(DWINVARIANT value);
  // register an ondataavailable event handler
  /*[id(0x00000045)]*/ int set_ondataavailable(DWINVARIANT value);
  // register an ontransformnode event handler
  /*[id(0x00000046)]*/ int set_ontransformnode(DWINVARIANT value);
}

// Core DOM node interface
interface IXMLDOMNode : IDispatch {
  mixin(uuid("2933bf80-7b36-11d2-b20e-00c04f983e60"));
  // static DWINGUID IID = { 0x2933bf80, 0x7b36, 0x11d2, 0xb2, 0x0e, 0x00, 0xc0, 0x4f, 0x98, 0x3e, 0x60 };
  // name of the node
  /*[id(0x00000002)]*/ int get_nodeName(out wchar* name);
  // value stored in the node
  /*[id(0x00000003)]*/ int get_nodeValue(out DWINVARIANT value);
  // value stored in the node
  /*[id(0x00000003)]*/ int set_nodeValue(DWINVARIANT value);
  // the node's type
  /*[id(0x00000004)]*/ int get_nodeType(out DOMNodeType type);
  // parent of the node
  /*[id(0x00000006)]*/ int get_parentNode(out IXMLDOMNode parent);
  // the collection of the node's children
  /*[id(0x00000007)]*/ int get_childNodes(out IXMLDOMNodeList childList);
  // first child of the node
  /*[id(0x00000008)]*/ int get_firstChild(out IXMLDOMNode firstChild);
  // first child of the node
  /*[id(0x00000009)]*/ int get_lastChild(out IXMLDOMNode lastChild);
  // left sibling of the node
  /*[id(0x0000000A)]*/ int get_previousSibling(out IXMLDOMNode previousSibling);
  // right sibling of the node
  /*[id(0x0000000B)]*/ int get_nextSibling(out IXMLDOMNode nextSibling);
  // the collection of the node's attributes
  /*[id(0x0000000C)]*/ int get_attributes(out IXMLDOMNamedNodeMap attributeMap);
  // insert a child node
  /*[id(0x0000000D)]*/ int insertBefore(IXMLDOMNode newChild, DWINVARIANT refChild, out IXMLDOMNode outNewChild);
  // replace a child node
  /*[id(0x0000000E)]*/ int replaceChild(IXMLDOMNode newChild, IXMLDOMNode oldChild, out IXMLDOMNode outOldChild);
  // remove a child node
  /*[id(0x0000000F)]*/ int removeChild(IXMLDOMNode childNode, out IXMLDOMNode oldChild);
  // append a child node
  /*[id(0x00000010)]*/ int appendChild(IXMLDOMNode newChild, out IXMLDOMNode outNewChild);
  /*[id(0x00000011)]*/ int hasChildNodes(out short hasChild);
  // document that contains the node
  /*[id(0x00000012)]*/ int get_ownerDocument(out IXMLDOMDocument DOMDocument);
  /*[id(0x00000013)]*/ int cloneNode(short deep, out IXMLDOMNode cloneRoot);
  // the type of node in string form
  /*[id(0x00000015)]*/ int get_nodeTypeString(out wchar* nodeType);
  // text content of the node and subtree
  /*[id(0x00000018)]*/ int get_text(out wchar* text);
  // text content of the node and subtree
  /*[id(0x00000018)]*/ int set_text(wchar* text);
  // indicates whether node is a default value
  /*[id(0x00000016)]*/ int get_specified(out short isSpecified);
  // pointer to the definition of the node in the DTD or schema
  /*[id(0x00000017)]*/ int get_definition(out IXMLDOMNode definitionNode);
  // get the strongly typed value of the node
  /*[id(0x00000019)]*/ int get_nodeTypedValue(out DWINVARIANT typedValue);
  // get the strongly typed value of the node
  /*[id(0x00000019)]*/ int set_nodeTypedValue(DWINVARIANT typedValue);
  // the data type of the node
  /*[id(0x0000001A)]*/ int get_dataType(out DWINVARIANT dataTypeName);
  // the data type of the node
  /*[id(0x0000001A)]*/ int set_dataType(wchar* dataTypeName);
  // return the XML source for the node and each of its descendants
  /*[id(0x0000001B)]*/ int get_xml(out wchar* xmlString);
  // apply the stylesheet to the subtree
  /*[id(0x0000001C)]*/ int transformNode(IXMLDOMNode stylesheet, out wchar* xmlString);
  // execute query on the subtree
  /*[id(0x0000001D)]*/ int selectNodes(wchar* queryString, out IXMLDOMNodeList resultList);
  // execute query on the subtree
  /*[id(0x0000001E)]*/ int selectSingleNode(wchar* queryString, out IXMLDOMNode resultNode);
  // has sub-tree been completely parsed
  /*[id(0x0000001F)]*/ int get_parsed(out short isParsed);
  // the URI for the namespace applying to the node
  /*[id(0x00000020)]*/ int get_namespaceURI(out wchar* namespaceURI);
  // the prefix for the namespace applying to the node
  /*[id(0x00000021)]*/ int get_prefix(out wchar* prefixString);
  // the base name of the node (nodename with the prefix stripped off)
  /*[id(0x00000022)]*/ int get_baseName(out wchar* nameString);
  // apply the stylesheet to the subtree, returning the result through a document or a stream
  /*[id(0x00000023)]*/ int transformNodeToObject(IXMLDOMNode stylesheet, DWINVARIANT outputObject);
}

interface IXMLDOMNodeList : IDispatch {
  mixin(uuid("2933bf82-7b36-11d2-b20e-00c04f983e60"));
  // static DWINGUID IID = { 0x2933bf82, 0x7b36, 0x11d2, 0xb2, 0x0e, 0x00, 0xc0, 0x4f, 0x98, 0x3e, 0x60 };
  // collection of nodes
  /*[id(0x00000000)]*/ int get_item(int index, out IXMLDOMNode listItem);
  // number of nodes in the collection
  /*[id(0x0000004A)]*/ int get_length(out int listLength);
  // get next node from iterator
  /*[id(0x0000004C)]*/ int nextNode(out IXMLDOMNode nextItem);
  // reset the position of iterator
  /*[id(0x0000004D)]*/ int reset();
  /*[id(0xFFFFFFFC)]*/ int get__newEnum(out IUnknown ppUnk);
}

interface IXMLDOMNamedNodeMap : IDispatch {
  mixin(uuid("2933bf83-7b36-11d2-b20e-00c04f983e60"));
  // static DWINGUID IID = { 0x2933bf83, 0x7b36, 0x11d2, 0xb2, 0x0e, 0x00, 0xc0, 0x4f, 0x98, 0x3e, 0x60 };
  // lookup item by name
  /*[id(0x00000053)]*/ int getNamedItem(wchar* name, out IXMLDOMNode namedItem);
  // set item by name
  /*[id(0x00000054)]*/ int setNamedItem(IXMLDOMNode newItem, out IXMLDOMNode nameItem);
  // remove item by name
  /*[id(0x00000055)]*/ int removeNamedItem(wchar* name, out IXMLDOMNode namedItem);
  // collection of nodes
  /*[id(0x00000000)]*/ int get_item(int index, out IXMLDOMNode listItem);
  // number of nodes in the collection
  /*[id(0x0000004A)]*/ int get_length(out int listLength);
  // lookup the item by name and namespace
  /*[id(0x00000057)]*/ int getQualifiedItem(wchar* baseName, wchar* namespaceURI, out IXMLDOMNode qualifiedItem);
  // remove the item by name and namespace
  /*[id(0x00000058)]*/ int removeQualifiedItem(wchar* baseName, wchar* namespaceURI, out IXMLDOMNode qualifiedItem);
  // get next node from iterator
  /*[id(0x00000059)]*/ int nextNode(out IXMLDOMNode nextItem);
  // reset the position of iterator
  /*[id(0x0000005A)]*/ int reset();
  /*[id(0xFFFFFFFC)]*/ int get__newEnum(out IUnknown ppUnk);
}

interface IXMLDOMDocumentType : IXMLDOMNode {
  mixin(uuid("2933bf8b-7b36-11d2-b20e-00c04f983e60"));
  // static DWINGUID IID = { 0x2933bf8b, 0x7b36, 0x11d2, 0xb2, 0x0e, 0x00, 0xc0, 0x4f, 0x98, 0x3e, 0x60 };
  // name of the document type (root of the tree)
  /*[id(0x00000083)]*/ int get_name(out wchar* rootName);
  // a list of entities in the document
  /*[id(0x00000084)]*/ int get_entities(out IXMLDOMNamedNodeMap entityMap);
  // a list of notations in the document
  /*[id(0x00000085)]*/ int get_notations(out IXMLDOMNamedNodeMap notationMap);
}

interface IXMLDOMImplementation : IDispatch {
  mixin(uuid("2933bf8f-7b36-11d2-b20e-00c04f983e60"));
  // static DWINGUID IID = { 0x2933bf8f, 0x7b36, 0x11d2, 0xb2, 0x0e, 0x00, 0xc0, 0x4f, 0x98, 0x3e, 0x60 };
  /*[id(0x00000091)]*/ int hasFeature(wchar* feature, wchar* versionParam, out short hasFeature);
}

interface IXMLDOMElement : IXMLDOMNode {
  mixin(uuid("2933bf86-7b36-11d2-b20e-00c04f983e60"));
  // static DWINGUID IID = { 0x2933bf86, 0x7b36, 0x11d2, 0xb2, 0x0e, 0x00, 0xc0, 0x4f, 0x98, 0x3e, 0x60 };
  // get the tagName of the element
  /*[id(0x00000061)]*/ int get_tagName(out wchar* tagName);
  // look up the string value of an attribute by name
  /*[id(0x00000063)]*/ int getAttribute(wchar* name, out DWINVARIANT value);
  // set the string value of an attribute by name
  /*[id(0x00000064)]*/ int setAttribute(wchar* name, DWINVARIANT value);
  // remove an attribute by name
  /*[id(0x00000065)]*/ int removeAttribute(wchar* name);
  // look up the attribute node by name
  /*[id(0x00000066)]*/ int getAttributeNode(wchar* name, out IXMLDOMAttribute attributeNode);
  // set the specified attribute on the element
  /*[id(0x00000067)]*/ int setAttributeNode(IXMLDOMAttribute DOMAttribute, out IXMLDOMAttribute attributeNode);
  // remove the specified attribute
  /*[id(0x00000068)]*/ int removeAttributeNode(IXMLDOMAttribute DOMAttribute, out IXMLDOMAttribute attributeNode);
  // build a list of elements by name
  /*[id(0x00000069)]*/ int getElementsByTagName(wchar* tagName, out IXMLDOMNodeList resultList);
  // collapse all adjacent text nodes in sub-tree
  /*[id(0x0000006A)]*/ int normalize();
}

interface IXMLDOMAttribute : IXMLDOMNode {
  mixin(uuid("2933bf85-7b36-11d2-b20e-00c04f983e60"));
  // static DWINGUID IID = { 0x2933bf85, 0x7b36, 0x11d2, 0xb2, 0x0e, 0x00, 0xc0, 0x4f, 0x98, 0x3e, 0x60 };
  // get name of the attribute
  /*[id(0x00000076)]*/ int get_name(out wchar* attributeName);
  // string value of the attribute
  /*[id(0x00000078)]*/ int get_value(out DWINVARIANT attributeValue);
  // string value of the attribute
  /*[id(0x00000078)]*/ int set_value(DWINVARIANT attributeValue);
}

interface IXMLDOMDocumentFragment : IXMLDOMNode {
  mixin(uuid("3efaa413-272f-11d2-836f-0000f87a7782"));
  // static DWINGUID IID = { 0x3efaa413, 0x272f, 0x11d2, 0x83, 0x6f, 0x00, 0x00, 0xf8, 0x7a, 0x77, 0x82 };
}

interface IXMLDOMText : IXMLDOMCharacterData {
  mixin(uuid("2933bf87-7b36-11d2-b20e-00c04f983e60"));
  // static DWINGUID IID = { 0x2933bf87, 0x7b36, 0x11d2, 0xb2, 0x0e, 0x00, 0xc0, 0x4f, 0x98, 0x3e, 0x60 };
  // split the text node into two text nodes at the position specified
  /*[id(0x0000007B)]*/ int splitText(int offset, out IXMLDOMText rightHandTextNode);
}

interface IXMLDOMCharacterData : IXMLDOMNode {
  mixin(uuid("2933bf84-7b36-11d2-b20e-00c04f983e60"));
  // static DWINGUID IID = { 0x2933bf84, 0x7b36, 0x11d2, 0xb2, 0x0e, 0x00, 0xc0, 0x4f, 0x98, 0x3e, 0x60 };
  // value of the node
  /*[id(0x0000006D)]*/ int get_data(out wchar* data);
  // value of the node
  /*[id(0x0000006D)]*/ int set_data(wchar* data);
  // number of characters in value
  /*[id(0x0000006E)]*/ int get_length(out int dataLength);
  // retrieve substring of value
  /*[id(0x0000006F)]*/ int substringData(int offset, int count, out wchar* data);
  // append string to value
  /*[id(0x00000070)]*/ int appendData(wchar* data);
  // insert string into value
  /*[id(0x00000071)]*/ int insertData(int offset, wchar* data);
  // delete string within the value
  /*[id(0x00000072)]*/ int deleteData(int offset, int count);
  // replace string within the value
  /*[id(0x00000073)]*/ int replaceData(int offset, int count, wchar* data);
}

interface IXMLDOMComment : IXMLDOMCharacterData {
  mixin(uuid("2933bf88-7b36-11d2-b20e-00c04f983e60"));
  // static DWINGUID IID = { 0x2933bf88, 0x7b36, 0x11d2, 0xb2, 0x0e, 0x00, 0xc0, 0x4f, 0x98, 0x3e, 0x60 };
}

interface IXMLDOMCDATASection : IXMLDOMText {
  mixin(uuid("2933bf8a-7b36-11d2-b20e-00c04f983e60"));
  // static DWINGUID IID = { 0x2933bf8a, 0x7b36, 0x11d2, 0xb2, 0x0e, 0x00, 0xc0, 0x4f, 0x98, 0x3e, 0x60 };
}

interface IXMLDOMProcessingInstruction : IXMLDOMNode {
  mixin(uuid("2933bf89-7b36-11d2-b20e-00c04f983e60"));
  // static DWINGUID IID = { 0x2933bf89, 0x7b36, 0x11d2, 0xb2, 0x0e, 0x00, 0xc0, 0x4f, 0x98, 0x3e, 0x60 };
  // the target
  /*[id(0x0000007F)]*/ int get_target(out wchar* name);
  // the data
  /*[id(0x00000080)]*/ int get_data(out wchar* value);
  // the data
  /*[id(0x00000080)]*/ int set_data(wchar* value);
}

interface IXMLDOMEntityReference : IXMLDOMNode {
  mixin(uuid("2933bf8e-7b36-11d2-b20e-00c04f983e60"));
  // static DWINGUID IID = { 0x2933bf8e, 0x7b36, 0x11d2, 0xb2, 0x0e, 0x00, 0xc0, 0x4f, 0x98, 0x3e, 0x60 };
}

// structure for reporting parser errors
interface IXMLDOMParseError : IDispatch {
  mixin(uuid("3efaa426-272f-11d2-836f-0000f87a7782"));
  // static DWINGUID IID = { 0x3efaa426, 0x272f, 0x11d2, 0x83, 0x6f, 0x00, 0x00, 0xf8, 0x7a, 0x77, 0x82 };
  // the error code
  /*[id(0x00000000)]*/ int get_errorCode(out int errorCode);
  // the URL of the XML document containing the error
  /*[id(0x000000B3)]*/ int get_url(out wchar* urlString);
  // the cause of the error
  /*[id(0x000000B4)]*/ int get_reason(out wchar* reasonString);
  // the data where the error occurred
  /*[id(0x000000B5)]*/ int get_srcText(out wchar* sourceString);
  // the line number in the XML document where the error occurred
  /*[id(0x000000B6)]*/ int get_line(out int lineNumber);
  // the character position in the line containing the error
  /*[id(0x000000B7)]*/ int get_linepos(out int linePosition);
  // the absolute file position in the XML document containing the error
  /*[id(0x000000B8)]*/ int get_filepos(out int filePosition);
}

interface IAccountDiscovery : IDispatch {
  mixin(uuid("fa202bbc-6abe-4c17-b184-570b6cf256a6"));
  // static DWINGUID IID = { 0xfa202bbc, 0x6abe, 0x4c17, 0xb1, 0x84, 0x57, 0x0b, 0x6c, 0xf2, 0x56, 0xa6 };
  // Set the xml of this message
  /*[id(0x00000033)]*/ int DiscoverNow(wchar* bstrEmailAddress, uint dwFlags, wchar* bstrXMLRequest, out IXMLDOMDocument ppXMLResponse);
  // Make DiscoverNow return right way before finished.  The specified message will be sent to the hwnd when it finishes.  The LPARAM will have the IXMLDOMDocument result.
  /*[id(0x00000034)]*/ int WorkAsync(wireHWND hwnd, uint wMsg);
}

// CoClasses

// Mail AutoDiscovery Provider Class
abstract class AutoDiscoveryProvider {
  mixin(uuid("c4f3d5bf-4809-44e3-84a4-368b6b33b0b4"));
  // static DWINGUID CLSID = { 0xc4f3d5bf, 0x4809, 0x44e3, 0x84, 0xa4, 0x36, 0x8b, 0x6b, 0x33, 0xb0, 0xb4 };
  mixin Interfaces!(IAutoDiscoveryProvider);
}

// AutoDiscover Accounts Class
abstract class AccountDiscovery {
  mixin(uuid("3dab30ed-8132-40bf-a8ba-7b5057f0cd10"));
  // static DWINGUID CLSID = { 0x3dab30ed, 0x8132, 0x40bf, 0xa8, 0xba, 0x7b, 0x50, 0x57, 0xf0, 0xcd, 0x10 };
  mixin Interfaces!(IAccountDiscovery);
}

// Mail AutoDiscovery Class
abstract class MailProtocolADEntry {
  mixin(uuid("61a5d6f3-c131-4c35-bf40-90a50f214122"));
  // static DWINGUID CLSID = { 0x61a5d6f3, 0xc131, 0x4c35, 0xbf, 0x40, 0x90, 0xa5, 0x0f, 0x21, 0x41, 0x22 };
  mixin Interfaces!(IMailProtocolADEntry);
}

// Mail AutoDiscovery Class
abstract class MailAutoDiscovery {
  mixin(uuid("008fd5dd-6dbb-48e3-991b-2d3ed658516a"));
  // static DWINGUID CLSID = { 0x008fd5dd, 0x6dbb, 0x48e3, 0x99, 0x1b, 0x2d, 0x3e, 0xd6, 0x58, 0x51, 0x6a };
  mixin Interfaces!(IMailAutoDiscovery);
}
