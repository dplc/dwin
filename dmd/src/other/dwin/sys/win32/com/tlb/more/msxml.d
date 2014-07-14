// Microsoft XML, version 2.0
// Version 2.0

/*[uuid("d63e0ce2-a0a2-11d0-9c02-00c04fc99c8e")]*/
module dwin.sys.win32.com.tlb.more.msxml;

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

// Constants that define types for IXMLElement.
enum tagXMLEMEM_TYPE {
  XMLELEMTYPE_ELEMENT = 0x00000000,
  XMLELEMTYPE_TEXT = 0x00000001,
  XMLELEMTYPE_COMMENT = 0x00000002,
  XMLELEMTYPE_DOCUMENT = 0x00000003,
  XMLELEMTYPE_DTD = 0x00000004,
  XMLELEMTYPE_PI = 0x00000005,
  XMLELEMTYPE_OTHER = 0x00000006,
}

// Structs

struct _xml_error {
  uint _nLine;
  wchar* _pchBuf;
  uint _cchBuf;
  uint _ich;
  wchar* _pszFound;
  wchar* _pszExpected;
  uint _reserved1;
  uint _reserved2;
}

// Aliases

// Constants that define a node's type
alias tagDOMNodeType DOMNodeType;

// Constants that define types for IXMLElement.
alias tagXMLEMEM_TYPE XMLELEM_TYPE;

// Interfaces

interface IXMLDOMImplementation : IDispatch {
  mixin(uuid("2933bf8f-7b36-11d2-b20e-00c04f983e60"));
  // static DWINGUID IID = { 0x2933bf8f, 0x7b36, 0x11d2, 0xb2, 0x0e, 0x00, 0xc0, 0x4f, 0x98, 0x3e, 0x60 };
  /*[id(0x00000091)]*/ int hasFeature(wchar* feature, wchar* versionParam, out short hasFeature);
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
  // last child of the node
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
  // save the document to a specified destination
  /*[id(0x00000040)]*/ int save(DWINVARIANT destination);
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

interface IXMLDOMNotation : IXMLDOMNode {
  mixin(uuid("2933bf8c-7b36-11d2-b20e-00c04f983e60"));
  // static DWINGUID IID = { 0x2933bf8c, 0x7b36, 0x11d2, 0xb2, 0x0e, 0x00, 0xc0, 0x4f, 0x98, 0x3e, 0x60 };
  // the public ID
  /*[id(0x00000088)]*/ int get_publicId(out DWINVARIANT publicId);
  // the system ID
  /*[id(0x00000089)]*/ int get_systemId(out DWINVARIANT systemId);
}

interface IXMLDOMEntity : IXMLDOMNode {
  mixin(uuid("2933bf8d-7b36-11d2-b20e-00c04f983e60"));
  // static DWINGUID IID = { 0x2933bf8d, 0x7b36, 0x11d2, 0xb2, 0x0e, 0x00, 0xc0, 0x4f, 0x98, 0x3e, 0x60 };
  // the public ID
  /*[id(0x0000008C)]*/ int get_publicId(out DWINVARIANT publicId);
  // the system ID
  /*[id(0x0000008D)]*/ int get_systemId(out DWINVARIANT systemId);
  // the name of the notation
  /*[id(0x0000008E)]*/ int get_notationName(out wchar* name);
}

// XTL runtime object
interface IXTLRuntime : IXMLDOMNode {
  mixin(uuid("3efaa425-272f-11d2-836f-0000f87a7782"));
  // static DWINGUID IID = { 0x3efaa425, 0x272f, 0x11d2, 0x83, 0x6f, 0x00, 0x00, 0xf8, 0x7a, 0x77, 0x82 };
  /*[id(0x000000BB)]*/ int uniqueID(IXMLDOMNode pNode, out int pID);
  /*[id(0x000000BC)]*/ int depth(IXMLDOMNode pNode, out int pDepth);
  /*[id(0x000000BD)]*/ int childNumber(IXMLDOMNode pNode, out int pNumber);
  /*[id(0x000000BE)]*/ int ancestorChildNumber(wchar* bstrNodeName, IXMLDOMNode pNode, out int pNumber);
  /*[id(0x000000BF)]*/ int absoluteChildNumber(IXMLDOMNode pNode, out int pNumber);
  /*[id(0x000000C0)]*/ int formatIndex(int lIndex, wchar* bstrFormat, out wchar* pbstrFormattedString);
  /*[id(0x000000C1)]*/ int formatNumber(double dblNumber, wchar* bstrFormat, out wchar* pbstrFormattedString);
  /*[id(0x000000C2)]*/ int formatDate(DWINVARIANT varDate, wchar* bstrFormat, DWINVARIANT varDestLocale, out wchar* pbstrFormattedString);
  /*[id(0x000000C3)]*/ int formatTime(DWINVARIANT varTime, wchar* bstrFormat, DWINVARIANT varDestLocale, out wchar* pbstrFormattedString);
}

interface XMLDOMDocumentEvents : IDispatch {
  mixin(uuid("3efaa427-272f-11d2-836f-0000f87a7782"));
  // static DWINGUID IID = { 0x3efaa427, 0x272f, 0x11d2, 0x83, 0x6f, 0x00, 0x00, 0xf8, 0x7a, 0x77, 0x82 };
  /+/*[id(0x000000C6)]*/ int ondataavailable();+/
  /+/*[id(0xFFFFFD9F)]*/ int onreadystatechange();+/
}

// IXMLHttpRequest Interface
interface IXMLHttpRequest : IDispatch {
  mixin(uuid("ed8c108d-4349-11d2-91a4-00c04f7969e8"));
  // static DWINGUID IID = { 0xed8c108d, 0x4349, 0x11d2, 0x91, 0xa4, 0x00, 0xc0, 0x4f, 0x79, 0x69, 0xe8 };
  // Open HTTP connection
  /*[id(0x00000001)]*/ int open(wchar* bstrMethod, wchar* bstrUrl, DWINVARIANT varAsync, DWINVARIANT bstrUser, DWINVARIANT bstrPassword);
  // Add HTTP request header
  /*[id(0x00000002)]*/ int setRequestHeader(wchar* bstrHeader, wchar* bstrValue);
  // Get HTTP response header
  /*[id(0x00000003)]*/ int getResponseHeader(wchar* bstrHeader, out wchar* pbstrValue);
  // Get all HTTP response headers
  /*[id(0x00000004)]*/ int getAllResponseHeaders(out wchar* pbstrHeaders);
  // Send HTTP request
  /*[id(0x00000005)]*/ int send(DWINVARIANT varBody);
  // Abort HTTP request
  /*[id(0x00000006)]*/ int abort();
  // Get HTTP status code
  /*[id(0x00000007)]*/ int get_status(out int plStatus);
  // Get HTTP status text
  /*[id(0x00000008)]*/ int get_statusText(out wchar* pbstrStatus);
  // Get response body
  /*[id(0x00000009)]*/ int get_responseXML(out IDispatch ppBody);
  // Get response body
  /*[id(0x0000000A)]*/ int get_responseText(out wchar* pbstrBody);
  // Get response body
  /*[id(0x0000000B)]*/ int get_responseBody(out DWINVARIANT pvarBody);
  // Get response body
  /*[id(0x0000000C)]*/ int get_responseStream(out DWINVARIANT pvarBody);
  // Get ready state
  /*[id(0x0000000D)]*/ int get_readyState(out int plState);
  // Register a complete event handler
  /*[id(0x0000000E)]*/ int set_onreadystatechange(IDispatch value);
}

// XML DSO Control
interface IXMLDSOControl : IDispatch {
  mixin(uuid("310afa62-0575-11d2-9ca9-0060b0ec3d39"));
  // static DWINGUID IID = { 0x310afa62, 0x0575, 0x11d2, 0x9c, 0xa9, 0x00, 0x60, 0xb0, 0xec, 0x3d, 0x39 };
  /*[id(0x00010001)]*/ int get_XMLDocument(out IXMLDOMDocument ppDoc);
  /*[id(0x00010001)]*/ int set_XMLDocument(IXMLDOMDocument ppDoc);
  /*[id(0x00010002)]*/ int get_JavaDSOCompatible(out int fJavaDSOCompatible);
  /*[id(0x00010002)]*/ int set_JavaDSOCompatible(int fJavaDSOCompatible);
  /*[id(0xFFFFFDF3)]*/ int get_readyState(out int state);
}

// IXMLElementCollection helps to enumerate through a XML document tree.
interface IXMLElementCollection : IDispatch {
  mixin(uuid("65725580-9b5d-11d0-9bfe-00c04fc99c8e"));
  // static DWINGUID IID = { 0x65725580, 0x9b5d, 0x11d0, 0x9b, 0xfe, 0x00, 0xc0, 0x4f, 0xc9, 0x9c, 0x8e };
  /*[id(0x00010001)]*/ int set_length(int p);
  /*[id(0x00010001)]*/ int get_length(out int p);
  /*[id(0xFFFFFFFC)]*/ int get__newEnum(out IUnknown ppUnk);
  // get current item, or (optional) by index and name.
  /*[id(0x00010003)]*/ int item(DWINVARIANT var1, DWINVARIANT var2, out IDispatch ppDisp);
}

// IXMLDocument loads and saves XML document. This is obsolete. You should use IDOMDocument or IXMLDOMDocument.
interface IXMLDocument : IDispatch {
  mixin(uuid("f52e2b61-18a1-11d1-b105-00805f49916b"));
  // static DWINGUID IID = { 0xf52e2b61, 0x18a1, 0x11d1, 0xb1, 0x05, 0x00, 0x80, 0x5f, 0x49, 0x91, 0x6b };
  // get root IXMLElement of the XML document.
  /*[id(0x00010065)]*/ int get_root(out IXMLElement p);
  /*[id(0x00010066)]*/ int get_fileSize(out wchar* p);
  /*[id(0x00010067)]*/ int get_fileModifiedDate(out wchar* p);
  /*[id(0x00010068)]*/ int get_fileUpdatedDate(out wchar* p);
  // set URL to load an XML document from the URL.
  /*[id(0x00010069)]*/ int get_url(out wchar* p);
  // set URL to load an XML document from the URL.
  /*[id(0x00010069)]*/ int set_url(wchar* p);
  /*[id(0x0001006A)]*/ int get_mimeType(out wchar* p);
  // get ready state.
  /*[id(0x0001006B)]*/ int get_readyState(out int pl);
  // get encoding.
  /*[id(0x0001006D)]*/ int get_charset(out wchar* p);
  // get encoding.
  /*[id(0x0001006D)]*/ int set_charset(wchar* p);
  // get XML version number.
  /*[id(0x0001006E)]*/ int get_version(out wchar* p);
  // get document type.
  /*[id(0x0001006F)]*/ int get_doctype(out wchar* p);
  /*[id(0x00010070)]*/ int get_dtdURL(out wchar* p);
  // create different types of IXMLElements.
  /*[id(0x0001006C)]*/ int createElement(DWINVARIANT vType, DWINVARIANT var1, out IXMLElement ppElem);
}

// IXMLElement represents an element in the XML document tree.
interface IXMLElement : IDispatch {
  mixin(uuid("3f7f31ac-e15f-11d0-9c25-00c04fc99c8e"));
  // static DWINGUID IID = { 0x3f7f31ac, 0xe15f, 0x11d0, 0x9c, 0x25, 0x00, 0xc0, 0x4f, 0xc9, 0x9c, 0x8e };
  // get tag name.
  /*[id(0x000100C9)]*/ int get_tagName(out wchar* p);
  // get tag name.
  /*[id(0x000100C9)]*/ int set_tagName(wchar* p);
  // get parent IXMLElement.
  /*[id(0x000100CA)]*/ int get_parent(out IXMLElement ppParent);
  // set attribute.
  /*[id(0x000100CB)]*/ int setAttribute(wchar* strPropertyName, DWINVARIANT PropertyValue);
  // get attribute.
  /*[id(0x000100CC)]*/ int getAttribute(wchar* strPropertyName, out DWINVARIANT PropertyValue);
  // remove attribute.
  /*[id(0x000100CD)]*/ int removeAttribute(wchar* strPropertyName);
  // get a IXMLElementCollection of children.
  /*[id(0x000100CE)]*/ int get_children(out IXMLElementCollection pp);
  // get type of this IXMLElement.
  /*[id(0x000100CF)]*/ int get_type(out int plType);
  // get text.
  /*[id(0x000100D0)]*/ int get_text(out wchar* p);
  // get text.
  /*[id(0x000100D0)]*/ int set_text(wchar* p);
  // add a child.
  /*[id(0x000100D1)]*/ int addChild(IXMLElement pChildElem, int lIndex, int lReserved);
  // remove a child.
  /*[id(0x000100D2)]*/ int removeChild(IXMLElement pChildElem);
}

interface IXMLDocument2 : IDispatch {
  mixin(uuid("2b8de2fe-8d2d-11d1-b2fc-00c04fd915a9"));
  // static DWINGUID IID = { 0x2b8de2fe, 0x8d2d, 0x11d1, 0xb2, 0xfc, 0x00, 0xc0, 0x4f, 0xd9, 0x15, 0xa9 };
  // get root IXMLElement of the XML document.
  /*[id(0x00010065)]*/ int get_root(out IXMLElement2 p);
  /*[id(0x00010066)]*/ int get_fileSize(out wchar* p);
  /*[id(0x00010067)]*/ int get_fileModifiedDate(out wchar* p);
  /*[id(0x00010068)]*/ int get_fileUpdatedDate(out wchar* p);
  // set URL to load an XML document from the URL.
  /*[id(0x00010069)]*/ int get_url(out wchar* p);
  // set URL to load an XML document from the URL.
  /*[id(0x00010069)]*/ int set_url(wchar* p);
  /*[id(0x0001006A)]*/ int get_mimeType(out wchar* p);
  // get ready state.
  /*[id(0x0001006B)]*/ int get_readyState(out int pl);
  // get encoding.
  /*[id(0x0001006D)]*/ int get_charset(out wchar* p);
  // get encoding.
  /*[id(0x0001006D)]*/ int set_charset(wchar* p);
  // get XML version number.
  /*[id(0x0001006E)]*/ int get_version(out wchar* p);
  // get document type.
  /*[id(0x0001006F)]*/ int get_doctype(out wchar* p);
  /*[id(0x00010070)]*/ int get_dtdURL(out wchar* p);
  // create different types of IXMLElements.
  /*[id(0x0001006C)]*/ int createElement(DWINVARIANT vType, DWINVARIANT var1, out IXMLElement2 ppElem);
  // get asynchronous loading flag.
  /*[id(0x00010071)]*/ int get_async(out short pf);
  // get asynchronous loading flag.
  /*[id(0x00010071)]*/ int set_async(short pf);
}

// IXMLElement2 extends IXMLElement.
interface IXMLElement2 : IDispatch {
  mixin(uuid("2b8de2ff-8d2d-11d1-b2fc-00c04fd915a9"));
  // static DWINGUID IID = { 0x2b8de2ff, 0x8d2d, 0x11d1, 0xb2, 0xfc, 0x00, 0xc0, 0x4f, 0xd9, 0x15, 0xa9 };
  // get tag name.
  /*[id(0x000100C9)]*/ int get_tagName(out wchar* p);
  // get tag name.
  /*[id(0x000100C9)]*/ int set_tagName(wchar* p);
  // get parent IXMLElement.
  /*[id(0x000100CA)]*/ int get_parent(out IXMLElement2 ppParent);
  // set attribute.
  /*[id(0x000100CB)]*/ int setAttribute(wchar* strPropertyName, DWINVARIANT PropertyValue);
  // get attribute.
  /*[id(0x000100CC)]*/ int getAttribute(wchar* strPropertyName, out DWINVARIANT PropertyValue);
  // remove attribute.
  /*[id(0x000100CD)]*/ int removeAttribute(wchar* strPropertyName);
  // get a IXMLElementCollection of all children.
  /*[id(0x000100CE)]*/ int get_children(out IXMLElementCollection pp);
  // get type of this IXMLElement.
  /*[id(0x000100CF)]*/ int get_type(out int plType);
  // get text.
  /*[id(0x000100D0)]*/ int get_text(out wchar* p);
  // get text.
  /*[id(0x000100D0)]*/ int set_text(wchar* p);
  // add a child.
  /*[id(0x000100D1)]*/ int addChild(IXMLElement2 pChildElem, int lIndex, int lReserved);
  // remove a child.
  /*[id(0x000100D2)]*/ int removeChild(IXMLElement2 pChildElem);
  // get a IXMLElementCollection of all attributes.
  /*[id(0x000100D3)]*/ int get_attributes(out IXMLElementCollection pp);
}

// IXMLAttribute allows to get attributes of an IXMLElement.
interface IXMLAttribute : IDispatch {
  mixin(uuid("d4d4a0fc-3b73-11d1-b2b4-00c04fb92596"));
  // static DWINGUID IID = { 0xd4d4a0fc, 0x3b73, 0x11d1, 0xb2, 0xb4, 0x00, 0xc0, 0x4f, 0xb9, 0x25, 0x96 };
  // get attribute name.
  /*[id(0x00010191)]*/ int get_name(out wchar* n);
  // get attribute value.
  /*[id(0x00010192)]*/ int get_value(out wchar* v);
}

// Gets error info.
interface IXMLError : IUnknown {
  mixin(uuid("948c5ad3-c58d-11d0-9c0b-00c04fc99c8e"));
  // static DWINGUID IID = { 0x948c5ad3, 0xc58d, 0x11d0, 0x9c, 0x0b, 0x00, 0xc0, 0x4f, 0xc9, 0x9c, 0x8e };
  /*[id(0x60010000)]*/ int GetErrorInfo(_xml_error* pErrorReturn);
}

// CoClasses

// W3C-DOM XML Document
abstract class DOMDocument {
  mixin(uuid("2933bf90-7b36-11d2-b20e-00c04f983e60"));
  // static DWINGUID CLSID = { 0x2933bf90, 0x7b36, 0x11d2, 0xb2, 0x0e, 0x00, 0xc0, 0x4f, 0x98, 0x3e, 0x60 };
  mixin Interfaces!(IXMLDOMDocument);
}

// W3C-DOM XML Document (Apartment)
abstract class DOMFreeThreadedDocument {
  mixin(uuid("2933bf91-7b36-11d2-b20e-00c04f983e60"));
  // static DWINGUID CLSID = { 0x2933bf91, 0x7b36, 0x11d2, 0xb2, 0x0e, 0x00, 0xc0, 0x4f, 0x98, 0x3e, 0x60 };
  mixin Interfaces!(IXMLDOMDocument);
}

// XML HTTP Request class.
abstract class XMLHTTPRequest {
  mixin(uuid("ed8c108e-4349-11d2-91a4-00c04f7969e8"));
  // static DWINGUID CLSID = { 0xed8c108e, 0x4349, 0x11d2, 0x91, 0xa4, 0x00, 0xc0, 0x4f, 0x79, 0x69, 0xe8 };
  mixin Interfaces!(IXMLHttpRequest);
}

// XML Data Source Object
abstract class XMLDSOControl {
  mixin(uuid("550dda30-0541-11d2-9ca9-0060b0ec3d39"));
  // static DWINGUID CLSID = { 0x550dda30, 0x0541, 0x11d2, 0x9c, 0xa9, 0x00, 0x60, 0xb0, 0xec, 0x3d, 0x39 };
  mixin Interfaces!(IXMLDSOControl);
}

// XMLDocument extends IXML Document.  It is obsolete.  You should use DOMDocument.  This object should not be confused with the XMLDocument property on the XML data island.
abstract class XMLDocument {
  mixin(uuid("cfc399af-d876-11d0-9c10-00c04fc99c8e"));
  // static DWINGUID CLSID = { 0xcfc399af, 0xd876, 0x11d0, 0x9c, 0x10, 0x00, 0xc0, 0x4f, 0xc9, 0x9c, 0x8e };
  mixin Interfaces!(IXMLDocument2);
}
