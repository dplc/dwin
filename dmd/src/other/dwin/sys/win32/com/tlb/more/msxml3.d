// Microsoft XML, v3.0
// Version 3.0

/*[uuid("f5078f18-c551-11d3-89b9-0000f81fe221")]*/
//module dwin.sys.win32.com.tlb.more.msxml2;
module dwin.sys.win32.com.tlb.more.msxml3;

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

// Schema Object Model Item Types
enum _SOMITEMTYPE {
  SOMITEM_SCHEMA = 0x00001000,
  SOMITEM_ATTRIBUTE = 0x00001001,
  SOMITEM_ATTRIBUTEGROUP = 0x00001002,
  SOMITEM_NOTATION = 0x00001003,
  SOMITEM_IDENTITYCONSTRAINT = 0x00001100,
  SOMITEM_KEY = 0x00001101,
  SOMITEM_KEYREF = 0x00001102,
  SOMITEM_UNIQUE = 0x00001103,
  SOMITEM_ANYTYPE = 0x00002000,
  SOMITEM_DATATYPE = 0x00002100,
  SOMITEM_DATATYPE_ANYTYPE = 0x00002101,
  SOMITEM_DATATYPE_ANYURI = 0x00002102,
  SOMITEM_DATATYPE_BASE64BINARY = 0x00002103,
  SOMITEM_DATATYPE_BOOLEAN = 0x00002104,
  SOMITEM_DATATYPE_BYTE = 0x00002105,
  SOMITEM_DATATYPE_DATE = 0x00002106,
  SOMITEM_DATATYPE_DATETIME = 0x00002107,
  SOMITEM_DATATYPE_DAY = 0x00002108,
  SOMITEM_DATATYPE_DECIMAL = 0x00002109,
  SOMITEM_DATATYPE_DOUBLE = 0x0000210A,
  SOMITEM_DATATYPE_DURATION = 0x0000210B,
  SOMITEM_DATATYPE_ENTITIES = 0x0000210C,
  SOMITEM_DATATYPE_ENTITY = 0x0000210D,
  SOMITEM_DATATYPE_FLOAT = 0x0000210E,
  SOMITEM_DATATYPE_HEXBINARY = 0x0000210F,
  SOMITEM_DATATYPE_ID = 0x00002110,
  SOMITEM_DATATYPE_IDREF = 0x00002111,
  SOMITEM_DATATYPE_IDREFS = 0x00002112,
  SOMITEM_DATATYPE_INT = 0x00002113,
  SOMITEM_DATATYPE_INTEGER = 0x00002114,
  SOMITEM_DATATYPE_LANGUAGE = 0x00002115,
  SOMITEM_DATATYPE_LONG = 0x00002116,
  SOMITEM_DATATYPE_MONTH = 0x00002117,
  SOMITEM_DATATYPE_MONTHDAY = 0x00002118,
  SOMITEM_DATATYPE_NAME = 0x00002119,
  SOMITEM_DATATYPE_NCNAME = 0x0000211A,
  SOMITEM_DATATYPE_NEGATIVEINTEGER = 0x0000211B,
  SOMITEM_DATATYPE_NMTOKEN = 0x0000211C,
  SOMITEM_DATATYPE_NMTOKENS = 0x0000211D,
  SOMITEM_DATATYPE_NONNEGATIVEINTEGER = 0x0000211E,
  SOMITEM_DATATYPE_NONPOSITIVEINTEGER = 0x0000211F,
  SOMITEM_DATATYPE_NORMALIZEDSTRING = 0x00002120,
  SOMITEM_DATATYPE_NOTATION = 0x00002121,
  SOMITEM_DATATYPE_POSITIVEINTEGER = 0x00002122,
  SOMITEM_DATATYPE_QNAME = 0x00002123,
  SOMITEM_DATATYPE_SHORT = 0x00002124,
  SOMITEM_DATATYPE_STRING = 0x00002125,
  SOMITEM_DATATYPE_TIME = 0x00002126,
  SOMITEM_DATATYPE_TOKEN = 0x00002127,
  SOMITEM_DATATYPE_UNSIGNEDBYTE = 0x00002128,
  SOMITEM_DATATYPE_UNSIGNEDINT = 0x00002129,
  SOMITEM_DATATYPE_UNSIGNEDLONG = 0x0000212A,
  SOMITEM_DATATYPE_UNSIGNEDSHORT = 0x0000212B,
  SOMITEM_DATATYPE_YEAR = 0x0000212C,
  SOMITEM_DATATYPE_YEARMONTH = 0x0000212D,
  SOMITEM_DATATYPE_ANYSIMPLETYPE = 0x000021FF,
  SOMITEM_SIMPLETYPE = 0x00002200,
  SOMITEM_COMPLEXTYPE = 0x00002400,
  SOMITEM_PARTICLE = 0x00004000,
  SOMITEM_ANY = 0x00004001,
  SOMITEM_ANYATTRIBUTE = 0x00004002,
  SOMITEM_ELEMENT = 0x00004003,
  SOMITEM_GROUP = 0x00004100,
  SOMITEM_ALL = 0x00004101,
  SOMITEM_CHOICE = 0x00004102,
  SOMITEM_SEQUENCE = 0x00004103,
  SOMITEM_EMPTYPARTICLE = 0x00004104,
  SOMITEM_NULL = 0x00000800,
  SOMITEM_NULL_TYPE = 0x00002800,
  SOMITEM_NULL_ANY = 0x00004801,
  SOMITEM_NULL_ANYATTRIBUTE = 0x00004802,
  SOMITEM_NULL_ELEMENT = 0x00004803,
}

// Schema Object Model Filters
enum _SCHEMADERIVATIONMETHOD {
  SCHEMADERIVATIONMETHOD_EMPTY = 0x00000000,
  SCHEMADERIVATIONMETHOD_SUBSTITUTION = 0x00000001,
  SCHEMADERIVATIONMETHOD_EXTENSION = 0x00000002,
  SCHEMADERIVATIONMETHOD_RESTRICTION = 0x00000004,
  SCHEMADERIVATIONMETHOD_LIST = 0x00000008,
  SCHEMADERIVATIONMETHOD_UNION = 0x00000010,
  SCHEMADERIVATIONMETHOD_ALL = 0x000000FF,
  SCHEMADERIVATIONMETHOD_NONE = 0x00000100,
}

// Schema Object Model Type variety values
enum _SCHEMATYPEVARIETY {
  SCHEMATYPEVARIETY_NONE = 0xFFFFFFFF,
  SCHEMATYPEVARIETY_ATOMIC = 0x00000000,
  SCHEMATYPEVARIETY_LIST = 0x00000001,
  SCHEMATYPEVARIETY_UNION = 0x00000002,
}

// Schema Object Model Whitespace facet values
enum _SCHEMAWHITESPACE {
  SCHEMAWHITESPACE_NONE = 0xFFFFFFFF,
  SCHEMAWHITESPACE_PRESERVE = 0x00000000,
  SCHEMAWHITESPACE_REPLACE = 0x00000001,
  SCHEMAWHITESPACE_COLLAPSE = 0x00000002,
}

// Schema Object Model Process Contents
enum _SCHEMAPROCESSCONTENTS {
  SCHEMAPROCESSCONTENTS_NONE = 0x00000000,
  SCHEMAPROCESSCONTENTS_SKIP = 0x00000001,
  SCHEMAPROCESSCONTENTS_LAX = 0x00000002,
  SCHEMAPROCESSCONTENTS_STRICT = 0x00000003,
}

// Schema Object Model Content Types
enum _SCHEMACONTENTTYPE {
  SCHEMACONTENTTYPE_EMPTY = 0x00000000,
  SCHEMACONTENTTYPE_TEXTONLY = 0x00000001,
  SCHEMACONTENTTYPE_ELEMENTONLY = 0x00000002,
  SCHEMACONTENTTYPE_MIXED = 0x00000003,
}

// Schema Object Model Attribute Uses
enum _SCHEMAUSE {
  SCHEMAUSE_OPTIONAL = 0x00000000,
  SCHEMAUSE_PROHIBITED = 0x00000001,
  SCHEMAUSE_REQUIRED = 0x00000002,
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

// Options for ServerXMLHTTPRequest Option property
enum _SERVERXMLHTTP_OPTION {
  SXH_OPTION_URL = 0xFFFFFFFF,
  SXH_OPTION_URL_CODEPAGE = 0x00000000,
  SXH_OPTION_ESCAPE_PERCENT_IN_URL = 0x00000001,
  SXH_OPTION_IGNORE_SERVER_SSL_CERT_ERROR_FLAGS = 0x00000002,
  SXH_OPTION_SELECT_CLIENT_SSL_CERT = 0x00000003,
}

// Flags for SXH_OPTION_IGNORE_SERVER_SSL_CERT_ERROR_FLAGS option
enum _SXH_SERVER_CERT_OPTION {
  SXH_SERVER_CERT_IGNORE_UNKNOWN_CA = 0x00000100,
  SXH_SERVER_CERT_IGNORE_WRONG_USAGE = 0x00000200,
  SXH_SERVER_CERT_IGNORE_CERT_CN_INVALID = 0x00001000,
  SXH_SERVER_CERT_IGNORE_CERT_DATE_INVALID = 0x00002000,
  SXH_SERVER_CERT_IGNORE_ALL_SERVER_ERRORS = 0x00003300,
}

// Settings for setProxy
enum _SXH_PROXY_SETTING {
  SXH_PROXY_SET_DEFAULT = 0x00000000,
  SXH_PROXY_SET_PRECONFIG = 0x00000000,
  SXH_PROXY_SET_DIRECT = 0x00000001,
  SXH_PROXY_SET_PROXY = 0x00000002,
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

// Schema Object Model Item Types
alias _SOMITEMTYPE SOMITEMTYPE;

// Schema Object Model Filters
alias _SCHEMADERIVATIONMETHOD SCHEMADERIVATIONMETHOD;

// Schema Object Model Type variety values
alias _SCHEMATYPEVARIETY SCHEMATYPEVARIETY;

// Schema Object Model Whitespace facet values
alias _SCHEMAWHITESPACE SCHEMAWHITESPACE;

// Schema Object Model Process Contents
alias _SCHEMAPROCESSCONTENTS SCHEMAPROCESSCONTENTS;

// Schema Object Model Content Types
alias _SCHEMACONTENTTYPE SCHEMACONTENTTYPE;

// Schema Object Model Attribute Uses
alias _SCHEMAUSE SCHEMAUSE;

// Constants that define types for IXMLElement.
alias tagXMLEMEM_TYPE XMLELEM_TYPE;

// Options for ServerXMLHTTPRequest Option property
alias _SERVERXMLHTTP_OPTION SERVERXMLHTTP_OPTION;

// Flags for SXH_OPTION_IGNORE_SERVER_SSL_CERT_ERROR_FLAGS option
alias _SXH_SERVER_CERT_OPTION SXH_SERVER_CERT_OPTION;

// Settings for setProxy
alias _SXH_PROXY_SETTING SXH_PROXY_SETTING;

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

interface IXMLDOMDocument2 : IXMLDOMDocument {
  mixin(uuid("2933bf95-7b36-11d2-b20e-00c04f983e60"));
  // static DWINGUID IID = { 0x2933bf95, 0x7b36, 0x11d2, 0xb2, 0x0e, 0x00, 0xc0, 0x4f, 0x98, 0x3e, 0x60 };
  // A collection of all namespaces for this document
  /*[id(0x000000C9)]*/ int get_namespaces(out IXMLDOMSchemaCollection namespaceCollection);
  // The associated schema cache
  /*[id(0x000000CA)]*/ int get_schemas(out DWINVARIANT otherCollection);
  // The associated schema cache
  /*[id(0x000000CA)]*/ int setref_schemas(DWINVARIANT otherCollection);
  // perform runtime validation on the currently loaded XML document
  /*[id(0x000000CB)]*/ int validate(out IXMLDOMParseError errorObj);
  // set the value of the named property
  /*[id(0x000000CC)]*/ int setProperty(wchar* name, DWINVARIANT value);
  // get the value of the named property
  /*[id(0x000000CD)]*/ int getProperty(wchar* name, out DWINVARIANT value);
}

// XML Schemas Collection
interface IXMLDOMSchemaCollection : IDispatch {
  mixin(uuid("373984c8-b845-449b-91e7-45ac83036ade"));
  // static DWINGUID IID = { 0x373984c8, 0xb845, 0x449b, 0x91, 0xe7, 0x45, 0xac, 0x83, 0x03, 0x6a, 0xde };
  // add a new schema
  /*[id(0x00000003)]*/ int add(wchar* namespaceURI, DWINVARIANT var);
  // lookup schema by namespaceURI
  /*[id(0x00000004)]*/ int get(wchar* namespaceURI, out IXMLDOMNode schemaNode);
  // remove schema by namespaceURI
  /*[id(0x00000005)]*/ int remove(wchar* namespaceURI);
  // number of schemas in collection
  /*[id(0x00000006)]*/ int get_length(out int length);
  // Get namespaceURI for schema by index
  /*[id(0x00000000)]*/ int get_namespaceURI(int index, out wchar* length);
  // copy & merge other collection into this one
  /*[id(0x00000008)]*/ int addCollection(IXMLDOMSchemaCollection otherCollection);
  /*[id(0xFFFFFFFC)]*/ int get__newEnum(out IUnknown ppUnk);
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

// IXSLTemplate Interface
interface IXSLTemplate : IDispatch {
  mixin(uuid("2933bf93-7b36-11d2-b20e-00c04f983e60"));
  // static DWINGUID IID = { 0x2933bf93, 0x7b36, 0x11d2, 0xb2, 0x0e, 0x00, 0xc0, 0x4f, 0x98, 0x3e, 0x60 };
  // stylesheet to use with processors
  /*[id(0x00000002)]*/ int setref_stylesheet(IXMLDOMNode stylesheet);
  // stylesheet to use with processors
  /*[id(0x00000002)]*/ int get_stylesheet(out IXMLDOMNode stylesheet);
  // create a new processor object
  /*[id(0x00000003)]*/ int createProcessor(out IXSLProcessor ppProcessor);
}

// IXSLProcessor Interface
interface IXSLProcessor : IDispatch {
  mixin(uuid("2933bf92-7b36-11d2-b20e-00c04f983e60"));
  // static DWINGUID IID = { 0x2933bf92, 0x7b36, 0x11d2, 0xb2, 0x0e, 0x00, 0xc0, 0x4f, 0x98, 0x3e, 0x60 };
  // XML input tree to transform
  /*[id(0x00000002)]*/ int set_input(DWINVARIANT pVar);
  // XML input tree to transform
  /*[id(0x00000002)]*/ int get_input(out DWINVARIANT pVar);
  // template object used to create this processor object
  /*[id(0x00000003)]*/ int get_ownerTemplate(out IXSLTemplate ppTemplate);
  // set XSL mode and it's namespace
  /*[id(0x00000004)]*/ int setStartMode(wchar* mode, wchar* namespaceURI);
  // starting XSL mode
  /*[id(0x00000005)]*/ int get_startMode(out wchar* mode);
  // namespace of starting XSL mode
  /*[id(0x00000006)]*/ int get_startModeURI(out wchar* namespaceURI);
  // custom stream object for transform output
  /*[id(0x00000007)]*/ int set_output(DWINVARIANT pOutput);
  // custom stream object for transform output
  /*[id(0x00000007)]*/ int get_output(out DWINVARIANT pOutput);
  // start/resume the XSL transformation process
  /*[id(0x00000008)]*/ int transform(out short pDone);
  // reset state of processor and abort current transform
  /*[id(0x00000009)]*/ int reset();
  // current state of the processor
  /*[id(0x0000000A)]*/ int get_readyState(out int pReadyState);
  // set <xsl:param> values
  /*[id(0x0000000B)]*/ int addParameter(wchar* baseName, DWINVARIANT parameter, wchar* namespaceURI);
  // pass object to stylesheet
  /*[id(0x0000000C)]*/ int addObject(IDispatch obj, wchar* namespaceURI);
  // current stylesheet being used
  /*[id(0x0000000D)]*/ int get_stylesheet(out IXMLDOMNode stylesheet);
}

// ISAXXMLReader interface
interface ISAXXMLReader : IUnknown {
  mixin(uuid("a4f96ed0-f829-476e-81c0-cdc7bd2a0802"));
  // static DWINGUID IID = { 0xa4f96ed0, 0xf829, 0x476e, 0x81, 0xc0, 0xcd, 0xc7, 0xbd, 0x2a, 0x08, 0x02 };
  /*[id(0x60010000)]*/ int getFeature(ushort* pwchName, out short pvfValue);
  /*[id(0x60010001)]*/ int putFeature(ushort* pwchName, short vfValue);
  /*[id(0x60010002)]*/ int getProperty(ushort* pwchName, out DWINVARIANT pvarValue);
  /*[id(0x60010003)]*/ int putProperty(ushort* pwchName, DWINVARIANT varValue);
  /*[id(0x60010004)]*/ int getEntityResolver(out ISAXEntityResolver ppResolver);
  /*[id(0x60010005)]*/ int putEntityResolver(ISAXEntityResolver pResolver);
  /*[id(0x60010006)]*/ int getContentHandler(out ISAXContentHandler ppHandler);
  /*[id(0x60010007)]*/ int putContentHandler(ISAXContentHandler pHandler);
  /*[id(0x60010008)]*/ int getDTDHandler(out ISAXDTDHandler ppHandler);
  /*[id(0x60010009)]*/ int putDTDHandler(ISAXDTDHandler pHandler);
  /*[id(0x6001000A)]*/ int getErrorHandler(out ISAXErrorHandler ppHandler);
  /*[id(0x6001000B)]*/ int putErrorHandler(ISAXErrorHandler pHandler);
  /*[id(0x6001000C)]*/ int getBaseURL(out ushort ppwchBaseUrl);
  /*[id(0x6001000D)]*/ int putBaseURL(ushort* pwchBaseUrl);
  /*[id(0x6001000E)]*/ int getSecureBaseURL(out ushort ppwchSecureBaseUrl);
  /*[id(0x6001000F)]*/ int putSecureBaseURL(ushort* pwchSecureBaseUrl);
  /*[id(0x60010010)]*/ int parse(DWINVARIANT varInput);
  /*[id(0x60010011)]*/ int parseURL(ushort* pwchUrl);
}

// ISAXEntityResolver interface
interface ISAXEntityResolver : IUnknown {
  mixin(uuid("99bca7bd-e8c4-4d5f-a0cf-6d907901ff07"));
  // static DWINGUID IID = { 0x99bca7bd, 0xe8c4, 0x4d5f, 0xa0, 0xcf, 0x6d, 0x90, 0x79, 0x01, 0xff, 0x07 };
  /*[id(0x60010000)]*/ int resolveEntity(ushort* pwchPublicId, ushort* pwchSystemId, out DWINVARIANT pvarInput);
}

// ISAXContentHandler interface
interface ISAXContentHandler : IUnknown {
  mixin(uuid("1545cdfa-9e4e-4497-a8a4-2bf7d0112c44"));
  // static DWINGUID IID = { 0x1545cdfa, 0x9e4e, 0x4497, 0xa8, 0xa4, 0x2b, 0xf7, 0xd0, 0x11, 0x2c, 0x44 };
  /*[id(0x60010000)]*/ int putDocumentLocator(ISAXLocator pLocator);
  /*[id(0x60010001)]*/ int startDocument();
  /*[id(0x60010002)]*/ int endDocument();
  /*[id(0x60010003)]*/ int startPrefixMapping(ushort* pwchPrefix, int cchPrefix, ushort* pwchUri, int cchUri);
  /*[id(0x60010004)]*/ int endPrefixMapping(ushort* pwchPrefix, int cchPrefix);
  /*[id(0x60010005)]*/ int startElement(ushort* pwchNamespaceUri, int cchNamespaceUri, ushort* pwchLocalName, int cchLocalName, ushort* pwchQName, int cchQName, ISAXAttributes pAttributes);
  /*[id(0x60010006)]*/ int endElement(ushort* pwchNamespaceUri, int cchNamespaceUri, ushort* pwchLocalName, int cchLocalName, ushort* pwchQName, int cchQName);
  /*[id(0x60010007)]*/ int characters(ushort* pwchChars, int cchChars);
  /*[id(0x60010008)]*/ int ignorableWhitespace(ushort* pwchChars, int cchChars);
  /*[id(0x60010009)]*/ int processingInstruction(ushort* pwchTarget, int cchTarget, ushort* pwchData, int cchData);
  /*[id(0x6001000A)]*/ int skippedEntity(ushort* pwchName, int cchName);
}

// ISAXLocator interface
interface ISAXLocator : IUnknown {
  mixin(uuid("9b7e472a-0de4-4640-bff3-84d38a051c31"));
  // static DWINGUID IID = { 0x9b7e472a, 0x0de4, 0x4640, 0xbf, 0xf3, 0x84, 0xd3, 0x8a, 0x05, 0x1c, 0x31 };
  /*[id(0x60010000)]*/ int getColumnNumber(out int pnColumn);
  /*[id(0x60010001)]*/ int getLineNumber(out int pnLine);
  /*[id(0x60010002)]*/ int getPublicId(out ushort ppwchPublicId);
  /*[id(0x60010003)]*/ int getSystemId(out ushort ppwchSystemId);
}

// ISAXAttributes interface
interface ISAXAttributes : IUnknown {
  mixin(uuid("f078abe1-45d2-4832-91ea-4466ce2f25c9"));
  // static DWINGUID IID = { 0xf078abe1, 0x45d2, 0x4832, 0x91, 0xea, 0x44, 0x66, 0xce, 0x2f, 0x25, 0xc9 };
  /*[id(0x60010000)]*/ int getLength(out int pnLength);
  /*[id(0x60010001)]*/ int getURI(int nIndex, out ushort ppwchUri, out int pcchUri);
  /*[id(0x60010002)]*/ int getLocalName(int nIndex, out ushort ppwchLocalName, out int pcchLocalName);
  /*[id(0x60010003)]*/ int getQName(int nIndex, out ushort ppwchQName, out int pcchQName);
  /*[id(0x60010004)]*/ int getName(int nIndex, out ushort ppwchUri, out int pcchUri, out ushort ppwchLocalName, out int pcchLocalName, out ushort ppwchQName, out int pcchQName);
  /*[id(0x60010005)]*/ int getIndexFromName(ushort* pwchUri, int cchUri, ushort* pwchLocalName, int cchLocalName, out int pnIndex);
  /*[id(0x60010006)]*/ int getIndexFromQName(ushort* pwchQName, int cchQName, out int pnIndex);
  /*[id(0x60010007)]*/ int getType(int nIndex, out ushort ppwchType, out int pcchType);
  /*[id(0x60010008)]*/ int getTypeFromName(ushort* pwchUri, int cchUri, ushort* pwchLocalName, int cchLocalName, out ushort ppwchType, out int pcchType);
  /*[id(0x60010009)]*/ int getTypeFromQName(ushort* pwchQName, int cchQName, out ushort ppwchType, out int pcchType);
  /*[id(0x6001000A)]*/ int getValue(int nIndex, out ushort ppwchValue, out int pcchValue);
  /*[id(0x6001000B)]*/ int getValueFromName(ushort* pwchUri, int cchUri, ushort* pwchLocalName, int cchLocalName, out ushort ppwchValue, out int pcchValue);
  /*[id(0x6001000C)]*/ int getValueFromQName(ushort* pwchQName, int cchQName, out ushort ppwchValue, out int pcchValue);
}

// ISAXDTDHandler interface
interface ISAXDTDHandler : IUnknown {
  mixin(uuid("e15c1baf-afb3-4d60-8c36-19a8c45defed"));
  // static DWINGUID IID = { 0xe15c1baf, 0xafb3, 0x4d60, 0x8c, 0x36, 0x19, 0xa8, 0xc4, 0x5d, 0xef, 0xed };
  /*[id(0x60010000)]*/ int notationDecl(ushort* pwchName, int cchName, ushort* pwchPublicId, int cchPublicId, ushort* pwchSystemId, int cchSystemId);
  /*[id(0x60010001)]*/ int unparsedEntityDecl(ushort* pwchName, int cchName, ushort* pwchPublicId, int cchPublicId, ushort* pwchSystemId, int cchSystemId, ushort* pwchNotationName, int cchNotationName);
}

// ISAXErrorHandler interface
interface ISAXErrorHandler : IUnknown {
  mixin(uuid("a60511c4-ccf5-479e-98a3-dc8dc545b7d0"));
  // static DWINGUID IID = { 0xa60511c4, 0xccf5, 0x479e, 0x98, 0xa3, 0xdc, 0x8d, 0xc5, 0x45, 0xb7, 0xd0 };
  /*[id(0x60010000)]*/ int error(ISAXLocator pLocator, ushort* pwchErrorMessage, int hrErrorCode);
  /*[id(0x60010001)]*/ int fatalError(ISAXLocator pLocator, ushort* pwchErrorMessage, int hrErrorCode);
  /*[id(0x60010002)]*/ int ignorableWarning(ISAXLocator pLocator, ushort* pwchErrorMessage, int hrErrorCode);
}

// ISAXXMLFilter interface
interface ISAXXMLFilter : ISAXXMLReader {
  mixin(uuid("70409222-ca09-4475-acb8-40312fe8d145"));
  // static DWINGUID IID = { 0x70409222, 0xca09, 0x4475, 0xac, 0xb8, 0x40, 0x31, 0x2f, 0xe8, 0xd1, 0x45 };
  /*[id(0x60020000)]*/ int getParent(out ISAXXMLReader ppReader);
  /*[id(0x60020001)]*/ int putParent(ISAXXMLReader pReader);
}

// ISAXLexicalHandler interface
interface ISAXLexicalHandler : IUnknown {
  mixin(uuid("7f85d5f5-47a8-4497-bda5-84ba04819ea6"));
  // static DWINGUID IID = { 0x7f85d5f5, 0x47a8, 0x4497, 0xbd, 0xa5, 0x84, 0xba, 0x04, 0x81, 0x9e, 0xa6 };
  /*[id(0x60010000)]*/ int startDTD(ushort* pwchName, int cchName, ushort* pwchPublicId, int cchPublicId, ushort* pwchSystemId, int cchSystemId);
  /*[id(0x60010001)]*/ int endDTD();
  /*[id(0x60010002)]*/ int startEntity(ushort* pwchName, int cchName);
  /*[id(0x60010003)]*/ int endEntity(ushort* pwchName, int cchName);
  /*[id(0x60010004)]*/ int startCDATA();
  /*[id(0x60010005)]*/ int endCDATA();
  /*[id(0x60010006)]*/ int comment(ushort* pwchChars, int cchChars);
}

// ISAXDeclHandler interface
interface ISAXDeclHandler : IUnknown {
  mixin(uuid("862629ac-771a-47b2-8337-4e6843c1be90"));
  // static DWINGUID IID = { 0x862629ac, 0x771a, 0x47b2, 0x83, 0x37, 0x4e, 0x68, 0x43, 0xc1, 0xbe, 0x90 };
  /*[id(0x60010000)]*/ int elementDecl(ushort* pwchName, int cchName, ushort* pwchModel, int cchModel);
  /*[id(0x60010001)]*/ int attributeDecl(ushort* pwchElementName, int cchElementName, ushort* pwchAttributeName, int cchAttributeName, ushort* pwchType, int cchType, ushort* pwchValueDefault, int cchValueDefault, ushort* pwchValue, int cchValue);
  /*[id(0x60010002)]*/ int internalEntityDecl(ushort* pwchName, int cchName, ushort* pwchValue, int cchValue);
  /*[id(0x60010003)]*/ int externalEntityDecl(ushort* pwchName, int cchName, ushort* pwchPublicId, int cchPublicId, ushort* pwchSystemId, int cchSystemId);
}

// IVBSAXXMLReader interface
interface IVBSAXXMLReader : IDispatch {
  mixin(uuid("8c033caa-6cd6-4f73-b728-4531af74945f"));
  // static DWINGUID IID = { 0x8c033caa, 0x6cd6, 0x4f73, 0xb7, 0x28, 0x45, 0x31, 0xaf, 0x74, 0x94, 0x5f };
  // Look up the value of a feature.
  /*[id(0x00000502)]*/ int getFeature(wchar* strName, out short fValue);
  // Set the state of a feature.
  /*[id(0x00000503)]*/ int putFeature(wchar* strName, short fValue);
  // Look up the value of a property.
  /*[id(0x00000504)]*/ int getProperty(wchar* strName, out DWINVARIANT varValue);
  // Set the value of a property.
  /*[id(0x00000505)]*/ int putProperty(wchar* strName, DWINVARIANT varValue);
  // Allow an application to register an entity resolver or look up the current entity resolver.
  /*[id(0x00000506)]*/ int get_entityResolver(out IVBSAXEntityResolver oResolver);
  // Allow an application to register an entity resolver or look up the current entity resolver.
  /*[id(0x00000506)]*/ int setref_entityResolver(IVBSAXEntityResolver oResolver);
  // Allow an application to register a content event handler or look up the current content event handler.
  /*[id(0x00000507)]*/ int get_contentHandler(out IVBSAXContentHandler oHandler);
  // Allow an application to register a content event handler or look up the current content event handler.
  /*[id(0x00000507)]*/ int setref_contentHandler(IVBSAXContentHandler oHandler);
  // Allow an application to register a DTD event handler or look up the current DTD event handler.
  /*[id(0x00000508)]*/ int get_dtdHandler(out IVBSAXDTDHandler oHandler);
  // Allow an application to register a DTD event handler or look up the current DTD event handler.
  /*[id(0x00000508)]*/ int setref_dtdHandler(IVBSAXDTDHandler oHandler);
  // Allow an application to register an error event handler or look up the current error event handler.
  /*[id(0x00000509)]*/ int get_errorHandler(out IVBSAXErrorHandler oHandler);
  // Allow an application to register an error event handler or look up the current error event handler.
  /*[id(0x00000509)]*/ int setref_errorHandler(IVBSAXErrorHandler oHandler);
  // Set or get the base URL for the document.
  /*[id(0x0000050A)]*/ int get_baseURL(out wchar* strBaseURL);
  // Set or get the base URL for the document.
  /*[id(0x0000050A)]*/ int set_baseURL(wchar* strBaseURL);
  // Set or get the secure base URL for the document.
  /*[id(0x0000050B)]*/ int get_secureBaseURL(out wchar* strSecureBaseURL);
  // Set or get the secure base URL for the document.
  /*[id(0x0000050B)]*/ int set_secureBaseURL(wchar* strSecureBaseURL);
  // Parse an XML document.
  /*[id(0x0000050C)]*/ int parse(DWINVARIANT varInput);
  // Parse an XML document from a system identifier (URI).
  /*[id(0x0000050D)]*/ int parseURL(wchar* strURL);
}

// IVBSAXEntityResolver interface
interface IVBSAXEntityResolver : IDispatch {
  mixin(uuid("0c05d096-f45b-4aca-ad1a-aa0bc25518dc"));
  // static DWINGUID IID = { 0x0c05d096, 0xf45b, 0x4aca, 0xad, 0x1a, 0xaa, 0x0b, 0xc2, 0x55, 0x18, 0xdc };
  // Allow the application to resolve external entities.
  /*[id(0x00000527)]*/ int resolveEntity(ref wchar* strPublicId, ref wchar* strSystemId, out DWINVARIANT varInput);
}

// IVBSAXContentHandler interface
interface IVBSAXContentHandler : IDispatch {
  mixin(uuid("2ed7290a-4dd5-4b46-bb26-4e4155e77faa"));
  // static DWINGUID IID = { 0x2ed7290a, 0x4dd5, 0x4b46, 0xbb, 0x26, 0x4e, 0x41, 0x55, 0xe7, 0x7f, 0xaa };
  // Receive an object for locating the origin of SAX document events.
  /*[id(0x0000052A)]*/ int setref_documentLocator(IVBSAXLocator value);
  // Receive notification of the beginning of a document.
  /*[id(0x0000052B)]*/ int startDocument();
  // Receive notification of the end of a document.
  /*[id(0x0000052C)]*/ int endDocument();
  // Begin the scope of a prefix-URI Namespace mapping.
  /*[id(0x0000052D)]*/ int startPrefixMapping(ref wchar* strPrefix, ref wchar* strURI);
  // End the scope of a prefix-URI mapping.
  /*[id(0x0000052E)]*/ int endPrefixMapping(ref wchar* strPrefix);
  // Receive notification of the beginning of an element.
  /*[id(0x0000052F)]*/ int startElement(ref wchar* strNamespaceURI, ref wchar* strLocalName, ref wchar* strQName, IVBSAXAttributes oAttributes);
  // Receive notification of the end of an element.
  /*[id(0x00000530)]*/ int endElement(ref wchar* strNamespaceURI, ref wchar* strLocalName, ref wchar* strQName);
  // Receive notification of character data.
  /*[id(0x00000531)]*/ int characters(ref wchar* strChars);
  // Receive notification of ignorable whitespace in element content.
  /*[id(0x00000532)]*/ int ignorableWhitespace(ref wchar* strChars);
  // Receive notification of a processing instruction.
  /*[id(0x00000533)]*/ int processingInstruction(ref wchar* strTarget, ref wchar* strData);
  // Receive notification of a skipped entity.
  /*[id(0x00000534)]*/ int skippedEntity(ref wchar* strName);
}

// IVBSAXLocator interface
interface IVBSAXLocator : IDispatch {
  mixin(uuid("796e7ac5-5aa2-4eff-acad-3faaf01a3288"));
  // static DWINGUID IID = { 0x796e7ac5, 0x5aa2, 0x4eff, 0xac, 0xad, 0x3f, 0xaa, 0xf0, 0x1a, 0x32, 0x88 };
  // Get the column number where the current document event ends.
  /*[id(0x00000521)]*/ int get_columnNumber(out int nColumn);
  // Get the line number where the current document event ends.
  /*[id(0x00000522)]*/ int get_lineNumber(out int nLine);
  // Get the public identifier for the current document event.
  /*[id(0x00000523)]*/ int get_publicId(out wchar* strPublicId);
  // Get the system identifier for the current document event.
  /*[id(0x00000524)]*/ int get_systemId(out wchar* strSystemId);
}

// IVBSAXAttributes interface
interface IVBSAXAttributes : IDispatch {
  mixin(uuid("10dc0586-132b-4cac-8bb3-db00ac8b7ee0"));
  // static DWINGUID IID = { 0x10dc0586, 0x132b, 0x4cac, 0x8b, 0xb3, 0xdb, 0x00, 0xac, 0x8b, 0x7e, 0xe0 };
  // Get the number of attributes in the list.
  /*[id(0x00000540)]*/ int get_length(out int nLength);
  // Look up an attribute's Namespace URI by index.
  /*[id(0x00000541)]*/ int getURI(int nIndex, out wchar* strURI);
  // Look up an attribute's local name by index.
  /*[id(0x00000542)]*/ int getLocalName(int nIndex, out wchar* strLocalName);
  // Look up an attribute's XML 1.0 qualified name by index.
  /*[id(0x00000543)]*/ int getQName(int nIndex, out wchar* strQName);
  // Look up the index of an attribute by Namespace name.
  /*[id(0x00000544)]*/ int getIndexFromName(wchar* strURI, wchar* strLocalName, out int nIndex);
  // Look up the index of an attribute by XML 1.0 qualified name.
  /*[id(0x00000545)]*/ int getIndexFromQName(wchar* strQName, out int nIndex);
  // Look up an attribute's type by index.
  /*[id(0x00000546)]*/ int getType(int nIndex, out wchar* strType);
  // Look up an attribute's type by Namespace name.
  /*[id(0x00000547)]*/ int getTypeFromName(wchar* strURI, wchar* strLocalName, out wchar* strType);
  // Look up an attribute's type by XML 1.0 qualified name.
  /*[id(0x00000548)]*/ int getTypeFromQName(wchar* strQName, out wchar* strType);
  // Look up an attribute's value by index.
  /*[id(0x00000549)]*/ int getValue(int nIndex, out wchar* strValue);
  // Look up an attribute's value by Namespace name.
  /*[id(0x0000054A)]*/ int getValueFromName(wchar* strURI, wchar* strLocalName, out wchar* strValue);
  // Look up an attribute's value by XML 1.0 qualified name.
  /*[id(0x0000054B)]*/ int getValueFromQName(wchar* strQName, out wchar* strValue);
}

// IVBSAXDTDHandler interface
interface IVBSAXDTDHandler : IDispatch {
  mixin(uuid("24fb3297-302d-4620-ba39-3a732d850558"));
  // static DWINGUID IID = { 0x24fb3297, 0x302d, 0x4620, 0xba, 0x39, 0x3a, 0x73, 0x2d, 0x85, 0x05, 0x58 };
  // Receive notification of a notation declaration event.
  /*[id(0x00000537)]*/ int notationDecl(ref wchar* strName, ref wchar* strPublicId, ref wchar* strSystemId);
  // Receive notification of an unparsed entity declaration event.
  /*[id(0x00000538)]*/ int unparsedEntityDecl(ref wchar* strName, ref wchar* strPublicId, ref wchar* strSystemId, ref wchar* strNotationName);
}

// IVBSAXErrorHandler interface
interface IVBSAXErrorHandler : IDispatch {
  mixin(uuid("d963d3fe-173c-4862-9095-b92f66995f52"));
  // static DWINGUID IID = { 0xd963d3fe, 0x173c, 0x4862, 0x90, 0x95, 0xb9, 0x2f, 0x66, 0x99, 0x5f, 0x52 };
  // Receive notification of a recoverable error.
  /*[id(0x0000053B)]*/ int error(IVBSAXLocator oLocator, ref wchar* strErrorMessage, int nErrorCode);
  // Receive notification of a non-recoverable error.
  /*[id(0x0000053C)]*/ int fatalError(IVBSAXLocator oLocator, ref wchar* strErrorMessage, int nErrorCode);
  // Receive notification of an ignorable warning.
  /*[id(0x0000053D)]*/ int ignorableWarning(IVBSAXLocator oLocator, ref wchar* strErrorMessage, int nErrorCode);
}

// IVBSAXXMLFilter interface
interface IVBSAXXMLFilter : IDispatch {
  mixin(uuid("1299eb1b-5b88-433e-82de-82ca75ad4e04"));
  // static DWINGUID IID = { 0x1299eb1b, 0x5b88, 0x433e, 0x82, 0xde, 0x82, 0xca, 0x75, 0xad, 0x4e, 0x04 };
  // Set or get the parent reader
  /*[id(0x0000051D)]*/ int get_parent(out IVBSAXXMLReader oReader);
  // Set or get the parent reader
  /*[id(0x0000051D)]*/ int setref_parent(IVBSAXXMLReader oReader);
}

// IVBSAXLexicalHandler interface
interface IVBSAXLexicalHandler : IDispatch {
  mixin(uuid("032aac35-8c0e-4d9d-979f-e3b702935576"));
  // static DWINGUID IID = { 0x032aac35, 0x8c0e, 0x4d9d, 0x97, 0x9f, 0xe3, 0xb7, 0x02, 0x93, 0x55, 0x76 };
  // Report the start of DTD declarations, if any.
  /*[id(0x0000054E)]*/ int startDTD(ref wchar* strName, ref wchar* strPublicId, ref wchar* strSystemId);
  // Report the end of DTD declarations.
  /*[id(0x0000054F)]*/ int endDTD();
  // Report the beginning of some internal and external XML entities.
  /*[id(0x00000550)]*/ int startEntity(ref wchar* strName);
  // Report the end of an entity.
  /*[id(0x00000551)]*/ int endEntity(ref wchar* strName);
  // Report the start of a CDATA section.
  /*[id(0x00000552)]*/ int startCDATA();
  // Report the end of a CDATA section.
  /*[id(0x00000553)]*/ int endCDATA();
  // Report an XML comment anywhere in the document.
  /*[id(0x00000554)]*/ int comment(ref wchar* strChars);
}

// IVBSAXDeclHandler interface
interface IVBSAXDeclHandler : IDispatch {
  mixin(uuid("e8917260-7579-4be1-b5dd-7afbfa6f077b"));
  // static DWINGUID IID = { 0xe8917260, 0x7579, 0x4be1, 0xb5, 0xdd, 0x7a, 0xfb, 0xfa, 0x6f, 0x07, 0x7b };
  // Report an element type declaration.
  /*[id(0x00000557)]*/ int elementDecl(ref wchar* strName, ref wchar* strModel);
  // Report an attribute type declaration.
  /*[id(0x00000558)]*/ int attributeDecl(ref wchar* strElementName, ref wchar* strAttributeName, ref wchar* strType, ref wchar* strValueDefault, ref wchar* strValue);
  // Report an internal entity declaration.
  /*[id(0x00000559)]*/ int internalEntityDecl(ref wchar* strName, ref wchar* strValue);
  // Report a parsed external entity declaration.
  /*[id(0x0000055A)]*/ int externalEntityDecl(ref wchar* strName, ref wchar* strPublicId, ref wchar* strSystemId);
}

// IMXWriter interface
interface IMXWriter : IDispatch {
  mixin(uuid("4d7ff4ba-1565-4ea8-94e1-6e724a46f98d"));
  // static DWINGUID IID = { 0x4d7ff4ba, 0x1565, 0x4ea8, 0x94, 0xe1, 0x6e, 0x72, 0x4a, 0x46, 0xf9, 0x8d };
  // Set or get the output.
  /*[id(0x00000569)]*/ int set_output(DWINVARIANT varDestination);
  // Set or get the output.
  /*[id(0x00000569)]*/ int get_output(out DWINVARIANT varDestination);
  // Set or get the output encoding.
  /*[id(0x0000056B)]*/ int set_encoding(wchar* strEncoding);
  // Set or get the output encoding.
  /*[id(0x0000056B)]*/ int get_encoding(out wchar* strEncoding);
  // Determine whether or not to write the byte order mark
  /*[id(0x0000056C)]*/ int set_byteOrderMark(short fWriteByteOrderMark);
  // Determine whether or not to write the byte order mark
  /*[id(0x0000056C)]*/ int get_byteOrderMark(out short fWriteByteOrderMark);
  // Enable or disable auto indent mode.
  /*[id(0x0000056D)]*/ int set_indent(short fIndentMode);
  // Enable or disable auto indent mode.
  /*[id(0x0000056D)]*/ int get_indent(out short fIndentMode);
  // Set or get the standalone document declaration.
  /*[id(0x0000056E)]*/ int set_standalone(short fValue);
  // Set or get the standalone document declaration.
  /*[id(0x0000056E)]*/ int get_standalone(out short fValue);
  // Determine whether or not to omit the XML declaration.
  /*[id(0x0000056F)]*/ int set_omitXMLDeclaration(short fValue);
  // Determine whether or not to omit the XML declaration.
  /*[id(0x0000056F)]*/ int get_omitXMLDeclaration(out short fValue);
  // Set or get the xml version info.
  /*[id(0x00000570)]*/ int set_version(wchar* strVersion);
  // Set or get the xml version info.
  /*[id(0x00000570)]*/ int get_version(out wchar* strVersion);
  // When enabled, the writer no longer escapes out its input when writing it out.
  /*[id(0x00000571)]*/ int set_disableOutputEscaping(short fValue);
  // When enabled, the writer no longer escapes out its input when writing it out.
  /*[id(0x00000571)]*/ int get_disableOutputEscaping(out short fValue);
  // Flushes all writer buffers forcing the writer to write to the underlying output object
  /*[id(0x00000572)]*/ int flush();
}

// IMXAttributes interface
interface IMXAttributes : IDispatch {
  mixin(uuid("f10d27cc-3ec0-415c-8ed8-77ab1c5e7262"));
  // static DWINGUID IID = { 0xf10d27cc, 0x3ec0, 0x415c, 0x8e, 0xd8, 0x77, 0xab, 0x1c, 0x5e, 0x72, 0x62 };
  // Add an attribute to the end of the list.
  /*[id(0x0000055D)]*/ int addAttribute(wchar* strURI, wchar* strLocalName, wchar* strQName, wchar* strType, wchar* strValue);
  // Add an attribute, whose value is equal to the indexed attribute in the input attributes object, to the end of the list.
  /*[id(0x00000567)]*/ int addAttributeFromIndex(DWINVARIANT varAtts, int nIndex);
  // Clear the attribute list for reuse.
  /*[id(0x0000055E)]*/ int clear();
  // Remove an attribute from the list.
  /*[id(0x0000055F)]*/ int removeAttribute(int nIndex);
  // Set an attribute in the list.
  /*[id(0x00000560)]*/ int setAttribute(int nIndex, wchar* strURI, wchar* strLocalName, wchar* strQName, wchar* strType, wchar* strValue);
  // Copy an entire Attributes object.
  /*[id(0x00000561)]*/ int setAttributes(DWINVARIANT varAtts);
  // Set the local name of a specific attribute.
  /*[id(0x00000562)]*/ int setLocalName(int nIndex, wchar* strLocalName);
  // Set the qualified name of a specific attribute.
  /*[id(0x00000563)]*/ int setQName(int nIndex, wchar* strQName);
  // Set the type of a specific attribute.
  /*[id(0x00000564)]*/ int setType(int nIndex, wchar* strType);
  // Set the Namespace URI of a specific attribute.
  /*[id(0x00000565)]*/ int setURI(int nIndex, wchar* strURI);
  // Set the value of a specific attribute.
  /*[id(0x00000566)]*/ int setValue(int nIndex, wchar* strValue);
}

// IMXReaderControl interface
interface IMXReaderControl : IDispatch {
  mixin(uuid("808f4e35-8d5a-4fbe-8466-33a41279ed30"));
  // static DWINGUID IID = { 0x808f4e35, 0x8d5a, 0x4fbe, 0x84, 0x66, 0x33, 0xa4, 0x12, 0x79, 0xed, 0x30 };
  // Abort the reader
  /*[id(0x00000576)]*/ int abort();
  // Resume the reader
  /*[id(0x00000577)]*/ int resume();
  // Suspend the reader
  /*[id(0x00000578)]*/ int suspend();
}

// IMXSchemaDeclHandler interface
interface IMXSchemaDeclHandler : IDispatch {
  mixin(uuid("fa4bb38c-faf9-4cca-9302-d1dd0fe520db"));
  // static DWINGUID IID = { 0xfa4bb38c, 0xfaf9, 0x4cca, 0x93, 0x02, 0xd1, 0xdd, 0x0f, 0xe5, 0x20, 0xdb };
  // Access schema element declaration
  /*[id(0x0000057B)]*/ int schemaElementDecl(ISchemaElement oSchemaElement);
}

// XML Schema Element
interface ISchemaElement : ISchemaParticle {
  mixin(uuid("50ea08b7-dd1b-4664-9a50-c2f40f4bd79a"));
  // static DWINGUID IID = { 0x50ea08b7, 0xdd1b, 0x4664, 0x9a, 0x50, 0xc2, 0xf4, 0x0f, 0x4b, 0xd7, 0x9a };
  /*[id(0x000005C4)]*/ int get_type(out ISchemaType type);
  /*[id(0x000005BD)]*/ int get_scope(out ISchemaComplexType scopeParam);
  /*[id(0x00000597)]*/ int get_defaultValue(out wchar* defaultValue);
  /*[id(0x0000059E)]*/ int get_fixedValue(out wchar* fixedValue);
  /*[id(0x000005A3)]*/ int get_isNillable(out short nillable);
  /*[id(0x000005A1)]*/ int get_identityConstraints(out ISchemaItemCollection constraints);
  /*[id(0x000005BF)]*/ int get_substitutionGroup(out ISchemaElement element);
  /*[id(0x000005C0)]*/ int get_substitutionGroupExclusions(out SCHEMADERIVATIONMETHOD exclusions);
  /*[id(0x00000599)]*/ int get_disallowedSubstitutions(out SCHEMADERIVATIONMETHOD disallowed);
  /*[id(0x000005A2)]*/ int get_isAbstract(out short abstractParam);
  /*[id(0x000005A4)]*/ int get_isReference(out short reference);
}

// XML Schema Particle
interface ISchemaParticle : ISchemaItem {
  mixin(uuid("50ea08b5-dd1b-4664-9a50-c2f40f4bd79a"));
  // static DWINGUID IID = { 0x50ea08b5, 0xdd1b, 0x4664, 0x9a, 0x50, 0xc2, 0xf4, 0x0f, 0x4b, 0xd7, 0x9a };
  /*[id(0x000005AF)]*/ int get_minOccurs(out DWINVARIANT minOccurs);
  /*[id(0x000005AB)]*/ int get_maxOccurs(out DWINVARIANT maxOccurs);
}

// XML Schema Item
interface ISchemaItem : IDispatch {
  mixin(uuid("50ea08b3-dd1b-4664-9a50-c2f40f4bd79a"));
  // static DWINGUID IID = { 0x50ea08b3, 0xdd1b, 0x4664, 0x9a, 0x50, 0xc2, 0xf4, 0x0f, 0x4b, 0xd7, 0x9a };
  /*[id(0x000005B1)]*/ int get_name(out wchar* name);
  /*[id(0x000005B3)]*/ int get_namespaceURI(out wchar* namespaceURI);
  /*[id(0x000005BB)]*/ int get_schema(out ISchema schema);
  /*[id(0x000005A0)]*/ int get_id(out wchar* id);
  /*[id(0x000005A6)]*/ int get_itemType(out SOMITEMTYPE itemType);
  /*[id(0x000005C6)]*/ int get_unhandledAttributes(out IVBSAXAttributes attributes);
  /*[id(0x000005CB)]*/ int writeAnnotation(IUnknown annotationSink, out short isWritten);
}

// XML Schema
interface ISchema : ISchemaItem {
  mixin(uuid("50ea08b4-dd1b-4664-9a50-c2f40f4bd79a"));
  // static DWINGUID IID = { 0x50ea08b4, 0xdd1b, 0x4664, 0x9a, 0x50, 0xc2, 0xf4, 0x0f, 0x4b, 0xd7, 0x9a };
  /*[id(0x000005C2)]*/ int get_targetNamespace(out wchar* targetNamespace);
  /*[id(0x000005C9)]*/ int get_version(out wchar* versionParam);
  /*[id(0x000005C5)]*/ int get_types(out ISchemaItemCollection types);
  /*[id(0x0000059A)]*/ int get_elements(out ISchemaItemCollection elements);
  /*[id(0x00000593)]*/ int get_attributes(out ISchemaItemCollection attributes);
  /*[id(0x00000592)]*/ int get_attributeGroups(out ISchemaItemCollection attributeGroups);
  /*[id(0x000005B0)]*/ int get_modelGroups(out ISchemaItemCollection modelGroups);
  /*[id(0x000005B4)]*/ int get_notations(out ISchemaItemCollection notations);
  /*[id(0x000005BC)]*/ int get_schemaLocations(out ISchemaStringCollection schemaLocations);
}

// XML Schema Item Collection
interface ISchemaItemCollection : IDispatch {
  mixin(uuid("50ea08b2-dd1b-4664-9a50-c2f40f4bd79a"));
  // static DWINGUID IID = { 0x50ea08b2, 0xdd1b, 0x4664, 0x9a, 0x50, 0xc2, 0xf4, 0x0f, 0x4b, 0xd7, 0x9a };
  /*[id(0x00000000)]*/ int get_item(int index, out ISchemaItem item);
  /*[id(0x0000058F)]*/ int itemByName(wchar* name, out ISchemaItem item);
  /*[id(0x00000590)]*/ int itemByQName(wchar* name, wchar* namespaceURI, out ISchemaItem item);
  /*[id(0x000005A7)]*/ int get_length(out int length);
  /*[id(0xFFFFFFFC)]*/ int get__newEnum(out IUnknown ppUnk);
}

// XML Schema String Collection
interface ISchemaStringCollection : IDispatch {
  mixin(uuid("50ea08b1-dd1b-4664-9a50-c2f40f4bd79a"));
  // static DWINGUID IID = { 0x50ea08b1, 0xdd1b, 0x4664, 0x9a, 0x50, 0xc2, 0xf4, 0x0f, 0x4b, 0xd7, 0x9a };
  /*[id(0x00000000)]*/ int get_item(int index, out wchar* bstring);
  /*[id(0x000005A7)]*/ int get_length(out int length);
  /*[id(0xFFFFFFFC)]*/ int get__newEnum(out IUnknown ppUnk);
}

// XML Schema Type
interface ISchemaType : ISchemaItem {
  mixin(uuid("50ea08b8-dd1b-4664-9a50-c2f40f4bd79a"));
  // static DWINGUID IID = { 0x50ea08b8, 0xdd1b, 0x4664, 0x9a, 0x50, 0xc2, 0xf4, 0x0f, 0x4b, 0xd7, 0x9a };
  /*[id(0x00000594)]*/ int get_baseTypes(out ISchemaItemCollection baseTypes);
  /*[id(0x0000059D)]*/ int get_final(out SCHEMADERIVATIONMETHOD finalParam);
  /*[id(0x000005C8)]*/ int get_variety(out SCHEMATYPEVARIETY variety);
  /*[id(0x00000598)]*/ int get_derivedBy(out SCHEMADERIVATIONMETHOD derivedBy);
  /*[id(0x000005A5)]*/ int isValid(wchar* data, out short valid);
  /*[id(0x000005AC)]*/ int get_minExclusive(out wchar* minExclusive);
  /*[id(0x000005AD)]*/ int get_minInclusive(out wchar* minInclusive);
  /*[id(0x000005A8)]*/ int get_maxExclusive(out wchar* maxExclusive);
  /*[id(0x000005A9)]*/ int get_maxInclusive(out wchar* maxInclusive);
  /*[id(0x000005C3)]*/ int get_totalDigits(out DWINVARIANT totalDigits);
  /*[id(0x0000059F)]*/ int get_fractionDigits(out DWINVARIANT fractionDigits);
  /*[id(0x000005A7)]*/ int get_length(out DWINVARIANT length);
  /*[id(0x000005AE)]*/ int get_minLength(out DWINVARIANT minLength);
  /*[id(0x000005AA)]*/ int get_maxLength(out DWINVARIANT maxLength);
  /*[id(0x0000059B)]*/ int get_enumeration(out ISchemaStringCollection enumeration);
  /*[id(0x000005CA)]*/ int get_whitespace(out SCHEMAWHITESPACE whitespace);
  /*[id(0x000005B6)]*/ int get_patterns(out ISchemaStringCollection patterns);
}

// XML Schema Complex Type
interface ISchemaComplexType : ISchemaType {
  mixin(uuid("50ea08b9-dd1b-4664-9a50-c2f40f4bd79a"));
  // static DWINGUID IID = { 0x50ea08b9, 0xdd1b, 0x4664, 0x9a, 0x50, 0xc2, 0xf4, 0x0f, 0x4b, 0xd7, 0x9a };
  /*[id(0x000005A2)]*/ int get_isAbstract(out short abstractParam);
  /*[id(0x00000591)]*/ int get_anyAttribute(out ISchemaAny anyAttribute);
  /*[id(0x00000593)]*/ int get_attributes(out ISchemaItemCollection attributes);
  /*[id(0x00000596)]*/ int get_contentType(out SCHEMACONTENTTYPE contentType);
  /*[id(0x00000595)]*/ int get_contentModel(out ISchemaModelGroup contentModel);
  /*[id(0x000005B8)]*/ int get_prohibitedSubstitutions(out SCHEMADERIVATIONMETHOD prohibited);
}

// XML Schema Any
interface ISchemaAny : ISchemaParticle {
  mixin(uuid("50ea08bc-dd1b-4664-9a50-c2f40f4bd79a"));
  // static DWINGUID IID = { 0x50ea08bc, 0xdd1b, 0x4664, 0x9a, 0x50, 0xc2, 0xf4, 0x0f, 0x4b, 0xd7, 0x9a };
  /*[id(0x000005B2)]*/ int get_namespaces(out ISchemaStringCollection namespaces);
  /*[id(0x000005B7)]*/ int get_processContents(out SCHEMAPROCESSCONTENTS processContents);
}

// XML Schema Type
interface ISchemaModelGroup : ISchemaParticle {
  mixin(uuid("50ea08bb-dd1b-4664-9a50-c2f40f4bd79a"));
  // static DWINGUID IID = { 0x50ea08bb, 0xdd1b, 0x4664, 0x9a, 0x50, 0xc2, 0xf4, 0x0f, 0x4b, 0xd7, 0x9a };
  /*[id(0x000005B5)]*/ int get_particles(out ISchemaItemCollection particles);
}

// XML Schemas Collection 2
interface IXMLDOMSchemaCollection2 : IXMLDOMSchemaCollection {
  mixin(uuid("50ea08b0-dd1b-4664-9a50-c2f40f4bd79a"));
  // static DWINGUID IID = { 0x50ea08b0, 0xdd1b, 0x4664, 0x9a, 0x50, 0xc2, 0xf4, 0x0f, 0x4b, 0xd7, 0x9a };
  /*[id(0x0000058B)]*/ int validate();
  /*[id(0x0000058C)]*/ int set_validateOnLoad(short validateOnLoad);
  /*[id(0x0000058C)]*/ int get_validateOnLoad(out short validateOnLoad);
  /*[id(0x0000058D)]*/ int getSchema(wchar* namespaceURI, out ISchema schema);
  /*[id(0x0000058E)]*/ int getDeclaration(IXMLDOMNode node, out ISchemaItem item);
}

// XML Schema Attribute
interface ISchemaAttribute : ISchemaItem {
  mixin(uuid("50ea08b6-dd1b-4664-9a50-c2f40f4bd79a"));
  // static DWINGUID IID = { 0x50ea08b6, 0xdd1b, 0x4664, 0x9a, 0x50, 0xc2, 0xf4, 0x0f, 0x4b, 0xd7, 0x9a };
  /*[id(0x000005C4)]*/ int get_type(out ISchemaType type);
  /*[id(0x000005BD)]*/ int get_scope(out ISchemaComplexType scopeParam);
  /*[id(0x00000597)]*/ int get_defaultValue(out wchar* defaultValue);
  /*[id(0x0000059E)]*/ int get_fixedValue(out wchar* fixedValue);
  /*[id(0x000005C7)]*/ int get_use(out SCHEMAUSE use);
  /*[id(0x000005A4)]*/ int get_isReference(out short reference);
}

// XML Schema Attribute Group
interface ISchemaAttributeGroup : ISchemaItem {
  mixin(uuid("50ea08ba-dd1b-4664-9a50-c2f40f4bd79a"));
  // static DWINGUID IID = { 0x50ea08ba, 0xdd1b, 0x4664, 0x9a, 0x50, 0xc2, 0xf4, 0x0f, 0x4b, 0xd7, 0x9a };
  /*[id(0x00000591)]*/ int get_anyAttribute(out ISchemaAny anyAttribute);
  /*[id(0x00000593)]*/ int get_attributes(out ISchemaItemCollection attributes);
}

// XML Schema Any
interface ISchemaIdentityConstraint : ISchemaItem {
  mixin(uuid("50ea08bd-dd1b-4664-9a50-c2f40f4bd79a"));
  // static DWINGUID IID = { 0x50ea08bd, 0xdd1b, 0x4664, 0x9a, 0x50, 0xc2, 0xf4, 0x0f, 0x4b, 0xd7, 0x9a };
  /*[id(0x000005BE)]*/ int get_selector(out wchar* selector);
  /*[id(0x0000059C)]*/ int get_fields(out ISchemaStringCollection fields);
  /*[id(0x000005BA)]*/ int get_referencedKey(out ISchemaIdentityConstraint key);
}

// XML Schema Notation
interface ISchemaNotation : ISchemaItem {
  mixin(uuid("50ea08be-dd1b-4664-9a50-c2f40f4bd79a"));
  // static DWINGUID IID = { 0x50ea08be, 0xdd1b, 0x4664, 0x9a, 0x50, 0xc2, 0xf4, 0x0f, 0x4b, 0xd7, 0x9a };
  /*[id(0x000005C1)]*/ int get_systemIdentifier(out wchar* uri);
  /*[id(0x000005B9)]*/ int get_publicIdentifier(out wchar* uri);
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

interface IXMLDOMSelection : IXMLDOMNodeList {
  mixin(uuid("aa634fc7-5888-44a7-a257-3a47150d3a0e"));
  // static DWINGUID IID = { 0xaa634fc7, 0x5888, 0x44a7, 0xa2, 0x57, 0x3a, 0x47, 0x15, 0x0d, 0x3a, 0x0e };
  // selection expression
  /*[id(0x00000051)]*/ int get_expr(out wchar* expression);
  // selection expression
  /*[id(0x00000051)]*/ int set_expr(wchar* expression);
  // nodes to apply selection expression to
  /*[id(0x00000052)]*/ int get_context(out IXMLDOMNode ppNode);
  // nodes to apply selection expression to
  /*[id(0x00000052)]*/ int setref_context(IXMLDOMNode ppNode);
  // gets the next node without advancing the list position
  /*[id(0x00000053)]*/ int peekNode(out IXMLDOMNode ppNode);
  // checks to see if the node matches the pattern
  /*[id(0x00000054)]*/ int matches(IXMLDOMNode pNode, out IXMLDOMNode ppNode);
  // removes the next node
  /*[id(0x00000055)]*/ int removeNext(out IXMLDOMNode ppNode);
  // removes all the nodes that match the selection
  /*[id(0x00000056)]*/ int removeAll();
  // clone this object with the same position and context
  /*[id(0x00000057)]*/ int clone(out IXMLDOMSelection ppNode);
  // get the value of the named property
  /*[id(0x00000058)]*/ int getProperty(wchar* name, out DWINVARIANT value);
  // set the value of the named property
  /*[id(0x00000059)]*/ int setProperty(wchar* name, DWINVARIANT value);
}

interface XMLDOMDocumentEvents : IDispatch {
  mixin(uuid("3efaa427-272f-11d2-836f-0000f87a7782"));
  // static DWINGUID IID = { 0x3efaa427, 0x272f, 0x11d2, 0x83, 0x6f, 0x00, 0x00, 0xf8, 0x7a, 0x77, 0x82 };
  /+/*[id(0x000000C6)]*/ int ondataavailable();+/
  /+/*[id(0xFFFFFD9F)]*/ int onreadystatechange();+/
}

// DSO Control
interface IDSOControl : IDispatch {
  mixin(uuid("310afa62-0575-11d2-9ca9-0060b0ec3d39"));
  // static DWINGUID IID = { 0x310afa62, 0x0575, 0x11d2, 0x9c, 0xa9, 0x00, 0x60, 0xb0, 0xec, 0x3d, 0x39 };
  /*[id(0x00010001)]*/ int get_XMLDocument(out IXMLDOMDocument ppDoc);
  /*[id(0x00010001)]*/ int set_XMLDocument(IXMLDOMDocument ppDoc);
  /*[id(0x00010002)]*/ int get_JavaDSOCompatible(out int fJavaDSOCompatible);
  /*[id(0x00010002)]*/ int set_JavaDSOCompatible(int fJavaDSOCompatible);
  /*[id(0xFFFFFDF3)]*/ int get_readyState(out int state);
}

// IXMLHTTPRequest Interface
interface IXMLHTTPRequest : IDispatch {
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

// IServerXMLHTTPRequest Interface
interface IServerXMLHTTPRequest : IXMLHTTPRequest {
  mixin(uuid("2e9196bf-13ba-4dd4-91ca-6c571f281495"));
  // static DWINGUID IID = { 0x2e9196bf, 0x13ba, 0x4dd4, 0x91, 0xca, 0x6c, 0x57, 0x1f, 0x28, 0x14, 0x95 };
  // Specify timeout settings (in milliseconds)
  /*[id(0x0000000F)]*/ int setTimeouts(int resolveTimeout, int connectTimeout, int sendTimeout, int receiveTimeout);
  // Wait for asynchronous send to complete, with optional timeout (in seconds)
  /*[id(0x00000010)]*/ int waitForResponse(DWINVARIANT timeoutInSeconds, out short isSuccessful);
  // Get an option value
  /*[id(0x00000011)]*/ int getOption(SERVERXMLHTTP_OPTION option, out DWINVARIANT value);
  // Set an option value
  /*[id(0x00000012)]*/ int setOption(SERVERXMLHTTP_OPTION option, DWINVARIANT value);
}

// IServerXMLHTTPRequest2 Interface
interface IServerXMLHTTPRequest2 : IServerXMLHTTPRequest {
  mixin(uuid("2e01311b-c322-4b0a-bd77-b90cfdc8dce7"));
  // static DWINGUID IID = { 0x2e01311b, 0xc322, 0x4b0a, 0xbd, 0x77, 0xb9, 0x0c, 0xfd, 0xc8, 0xdc, 0xe7 };
  // Specify proxy configuration
  /*[id(0x00000013)]*/ int setProxy(SXH_PROXY_SETTING proxySetting, DWINVARIANT varProxyServer, DWINVARIANT varBypassList);
  // Specify proxy authentication credentials
  /*[id(0x00000014)]*/ int setProxyCredentials(wchar* bstrUserName, wchar* bstrPassword);
}

// IMXNamespacePrefixes interface
interface IMXNamespacePrefixes : IDispatch {
  mixin(uuid("c90352f4-643c-4fbc-bb23-e996eb2d51fd"));
  // static DWINGUID IID = { 0xc90352f4, 0x643c, 0x4fbc, 0xbb, 0x23, 0xe9, 0x96, 0xeb, 0x2d, 0x51, 0xfd };
  /*[id(0x00000000)]*/ int get_item(int index, out wchar* prefix);
  /*[id(0x00000588)]*/ int get_length(out int length);
  /*[id(0xFFFFFFFC)]*/ int get__newEnum(out IUnknown ppUnk);
}

// IVBMXNamespaceManager interface
interface IVBMXNamespaceManager : IDispatch {
  mixin(uuid("c90352f5-643c-4fbc-bb23-e996eb2d51fd"));
  // static DWINGUID IID = { 0xc90352f5, 0x643c, 0x4fbc, 0xbb, 0x23, 0xe9, 0x96, 0xeb, 0x2d, 0x51, 0xfd };
  /*[id(0x0000057E)]*/ int set_allowOverride(short fOverride);
  /*[id(0x0000057E)]*/ int get_allowOverride(out short fOverride);
  /*[id(0x0000057F)]*/ int reset();
  /*[id(0x00000580)]*/ int pushContext();
  /*[id(0x00000581)]*/ int pushNodeContext(IXMLDOMNode contextNode, short fDeep);
  /*[id(0x00000582)]*/ int popContext();
  /*[id(0x00000583)]*/ int declarePrefix(wchar* prefix, wchar* namespaceURI);
  /*[id(0x00000584)]*/ int getDeclaredPrefixes(out IMXNamespacePrefixes prefixes);
  /*[id(0x00000585)]*/ int getPrefixes(wchar* namespaceURI, out IMXNamespacePrefixes prefixes);
  /*[id(0x00000586)]*/ int getURI(wchar* prefix, out DWINVARIANT uri);
  /*[id(0x00000587)]*/ int getURIFromNode(wchar* strPrefix, IXMLDOMNode contextNode, out DWINVARIANT uri);
}

// IMXNamespaceManager interface
interface IMXNamespaceManager : IUnknown {
  mixin(uuid("c90352f6-643c-4fbc-bb23-e996eb2d51fd"));
  // static DWINGUID IID = { 0xc90352f6, 0x643c, 0x4fbc, 0xbb, 0x23, 0xe9, 0x96, 0xeb, 0x2d, 0x51, 0xfd };
  /*[id(0x60010000)]*/ int putAllowOverride(short fOverride);
  /*[id(0x60010001)]*/ int getAllowOverride(out short fOverride);
  /*[id(0x60010002)]*/ int reset();
  /*[id(0x60010003)]*/ int pushContext();
  /*[id(0x60010004)]*/ int pushNodeContext(IXMLDOMNode contextNode, short fDeep);
  /*[id(0x60010005)]*/ int popContext();
  /*[id(0x60010006)]*/ int declarePrefix(ushort* prefix, ushort* namespaceURI);
  /*[id(0x60010007)]*/ int getDeclaredPrefix(int nIndex, ref ushort pwchPrefix, ref int pcchPrefix);
  /*[id(0x60010008)]*/ int getPrefix(ushort* pwszNamespaceURI, int nIndex, ref ushort pwchPrefix, ref int pcchPrefix);
  /*[id(0x60010009)]*/ int getURI(ushort* pwchPrefix, IXMLDOMNode pContextNode, ref ushort pwchUri, ref int pcchUri);
}

// CoClasses

// W3C-DOM XML Document (Apartment)
abstract class DOMDocument {
  mixin(uuid("f6d90f11-9c73-11d3-b32e-00c04f990bb4"));
  // static DWINGUID CLSID = { 0xf6d90f11, 0x9c73, 0x11d3, 0xb3, 0x2e, 0x00, 0xc0, 0x4f, 0x99, 0x0b, 0xb4 };
  mixin Interfaces!(IXMLDOMDocument2);
}

// W3C-DOM XML Document (Apartment)
abstract class DOMDocument26 {
  mixin(uuid("f5078f1b-c551-11d3-89b9-0000f81fe221"));
  // static DWINGUID CLSID = { 0xf5078f1b, 0xc551, 0x11d3, 0x89, 0xb9, 0x00, 0x00, 0xf8, 0x1f, 0xe2, 0x21 };
  mixin Interfaces!(IXMLDOMDocument2);
}

// W3C-DOM XML Document (Apartment)
abstract class DOMDocument30 {
  mixin(uuid("f5078f32-c551-11d3-89b9-0000f81fe221"));
  // static DWINGUID CLSID = { 0xf5078f32, 0xc551, 0x11d3, 0x89, 0xb9, 0x00, 0x00, 0xf8, 0x1f, 0xe2, 0x21 };
  mixin Interfaces!(IXMLDOMDocument2);
}

// W3C-DOM XML Document (Apartment)
abstract class DOMDocument40 {
  mixin(uuid("88d969c0-f192-11d4-a65f-0040963251e5"));
  // static DWINGUID CLSID = { 0x88d969c0, 0xf192, 0x11d4, 0xa6, 0x5f, 0x00, 0x40, 0x96, 0x32, 0x51, 0xe5 };
  mixin Interfaces!(IXMLDOMDocument2);
}

// W3C-DOM XML Document (Free threaded)
abstract class FreeThreadedDOMDocument {
  mixin(uuid("f6d90f12-9c73-11d3-b32e-00c04f990bb4"));
  // static DWINGUID CLSID = { 0xf6d90f12, 0x9c73, 0x11d3, 0xb3, 0x2e, 0x00, 0xc0, 0x4f, 0x99, 0x0b, 0xb4 };
  mixin Interfaces!(IXMLDOMDocument2);
}

// W3C-DOM XML Document (Free threaded)
abstract class FreeThreadedDOMDocument26 {
  mixin(uuid("f5078f1c-c551-11d3-89b9-0000f81fe221"));
  // static DWINGUID CLSID = { 0xf5078f1c, 0xc551, 0x11d3, 0x89, 0xb9, 0x00, 0x00, 0xf8, 0x1f, 0xe2, 0x21 };
  mixin Interfaces!(IXMLDOMDocument2);
}

// W3C-DOM XML Document (Free threaded)
abstract class FreeThreadedDOMDocument30 {
  mixin(uuid("f5078f33-c551-11d3-89b9-0000f81fe221"));
  // static DWINGUID CLSID = { 0xf5078f33, 0xc551, 0x11d3, 0x89, 0xb9, 0x00, 0x00, 0xf8, 0x1f, 0xe2, 0x21 };
  mixin Interfaces!(IXMLDOMDocument2);
}

// W3C-DOM XML Document (Free threaded)
abstract class FreeThreadedDOMDocument40 {
  mixin(uuid("88d969c1-f192-11d4-a65f-0040963251e5"));
  // static DWINGUID CLSID = { 0x88d969c1, 0xf192, 0x11d4, 0xa6, 0x5f, 0x00, 0x40, 0x96, 0x32, 0x51, 0xe5 };
  mixin Interfaces!(IXMLDOMDocument2);
}

// XML Schema Cache
abstract class XMLSchemaCache {
  mixin(uuid("373984c9-b845-449b-91e7-45ac83036ade"));
  // static DWINGUID CLSID = { 0x373984c9, 0xb845, 0x449b, 0x91, 0xe7, 0x45, 0xac, 0x83, 0x03, 0x6a, 0xde };
  mixin Interfaces!(IXMLDOMSchemaCollection);
}

// XML Schema Cache 2.6
abstract class XMLSchemaCache26 {
  mixin(uuid("f5078f1d-c551-11d3-89b9-0000f81fe221"));
  // static DWINGUID CLSID = { 0xf5078f1d, 0xc551, 0x11d3, 0x89, 0xb9, 0x00, 0x00, 0xf8, 0x1f, 0xe2, 0x21 };
  mixin Interfaces!(IXMLDOMSchemaCollection);
}

// XML Schema Cache 3.0
abstract class XMLSchemaCache30 {
  mixin(uuid("f5078f34-c551-11d3-89b9-0000f81fe221"));
  // static DWINGUID CLSID = { 0xf5078f34, 0xc551, 0x11d3, 0x89, 0xb9, 0x00, 0x00, 0xf8, 0x1f, 0xe2, 0x21 };
  mixin Interfaces!(IXMLDOMSchemaCollection);
}

// XML Schema Cache 4.0
abstract class XMLSchemaCache40 {
  mixin(uuid("88d969c2-f192-11d4-a65f-0040963251e5"));
  // static DWINGUID CLSID = { 0x88d969c2, 0xf192, 0x11d4, 0xa6, 0x5f, 0x00, 0x40, 0x96, 0x32, 0x51, 0xe5 };
  mixin Interfaces!(IXMLDOMSchemaCollection2);
}

// Compiled XSL Stylesheet Cache
abstract class XSLTemplate {
  mixin(uuid("2933bf94-7b36-11d2-b20e-00c04f983e60"));
  // static DWINGUID CLSID = { 0x2933bf94, 0x7b36, 0x11d2, 0xb2, 0x0e, 0x00, 0xc0, 0x4f, 0x98, 0x3e, 0x60 };
  mixin Interfaces!(IXSLTemplate);
}

// Compiled XSL Stylesheet Cache 2.6
abstract class XSLTemplate26 {
  mixin(uuid("f5078f21-c551-11d3-89b9-0000f81fe221"));
  // static DWINGUID CLSID = { 0xf5078f21, 0xc551, 0x11d3, 0x89, 0xb9, 0x00, 0x00, 0xf8, 0x1f, 0xe2, 0x21 };
  mixin Interfaces!(IXSLTemplate);
}

// Compiled XSL Stylesheet Cache 3.0
abstract class XSLTemplate30 {
  mixin(uuid("f5078f36-c551-11d3-89b9-0000f81fe221"));
  // static DWINGUID CLSID = { 0xf5078f36, 0xc551, 0x11d3, 0x89, 0xb9, 0x00, 0x00, 0xf8, 0x1f, 0xe2, 0x21 };
  mixin Interfaces!(IXSLTemplate);
}

// Compiled XSL Stylesheet Cache 4.0
abstract class XSLTemplate40 {
  mixin(uuid("88d969c3-f192-11d4-a65f-0040963251e5"));
  // static DWINGUID CLSID = { 0x88d969c3, 0xf192, 0x11d4, 0xa6, 0x5f, 0x00, 0x40, 0x96, 0x32, 0x51, 0xe5 };
  mixin Interfaces!(IXSLTemplate);
}

// XML Data Source Object
abstract class DSOControl {
  mixin(uuid("f6d90f14-9c73-11d3-b32e-00c04f990bb4"));
  // static DWINGUID CLSID = { 0xf6d90f14, 0x9c73, 0x11d3, 0xb3, 0x2e, 0x00, 0xc0, 0x4f, 0x99, 0x0b, 0xb4 };
  mixin Interfaces!(IDSOControl);
}

// XML Data Source Object
abstract class DSOControl26 {
  mixin(uuid("f5078f1f-c551-11d3-89b9-0000f81fe221"));
  // static DWINGUID CLSID = { 0xf5078f1f, 0xc551, 0x11d3, 0x89, 0xb9, 0x00, 0x00, 0xf8, 0x1f, 0xe2, 0x21 };
  mixin Interfaces!(IDSOControl);
}

// XML Data Source Object
abstract class DSOControl30 {
  mixin(uuid("f5078f39-c551-11d3-89b9-0000f81fe221"));
  // static DWINGUID CLSID = { 0xf5078f39, 0xc551, 0x11d3, 0x89, 0xb9, 0x00, 0x00, 0xf8, 0x1f, 0xe2, 0x21 };
  mixin Interfaces!(IDSOControl);
}

// XML Data Source Object
abstract class DSOControl40 {
  mixin(uuid("88d969c4-f192-11d4-a65f-0040963251e5"));
  // static DWINGUID CLSID = { 0x88d969c4, 0xf192, 0x11d4, 0xa6, 0x5f, 0x00, 0x40, 0x96, 0x32, 0x51, 0xe5 };
  mixin Interfaces!(IDSOControl);
}

// XML HTTP Request class.
abstract class XMLHTTP {
  mixin(uuid("f6d90f16-9c73-11d3-b32e-00c04f990bb4"));
  // static DWINGUID CLSID = { 0xf6d90f16, 0x9c73, 0x11d3, 0xb3, 0x2e, 0x00, 0xc0, 0x4f, 0x99, 0x0b, 0xb4 };
  mixin Interfaces!(IXMLHTTPRequest);
}

// XML HTTP Request class.
abstract class XMLHTTP26 {
  mixin(uuid("f5078f1e-c551-11d3-89b9-0000f81fe221"));
  // static DWINGUID CLSID = { 0xf5078f1e, 0xc551, 0x11d3, 0x89, 0xb9, 0x00, 0x00, 0xf8, 0x1f, 0xe2, 0x21 };
  mixin Interfaces!(IXMLHTTPRequest);
}

// XML HTTP Request class.
abstract class XMLHTTP30 {
  mixin(uuid("f5078f35-c551-11d3-89b9-0000f81fe221"));
  // static DWINGUID CLSID = { 0xf5078f35, 0xc551, 0x11d3, 0x89, 0xb9, 0x00, 0x00, 0xf8, 0x1f, 0xe2, 0x21 };
  mixin Interfaces!(IXMLHTTPRequest);
}

// XML HTTP Request class.
abstract class XMLHTTP40 {
  mixin(uuid("88d969c5-f192-11d4-a65f-0040963251e5"));
  // static DWINGUID CLSID = { 0x88d969c5, 0xf192, 0x11d4, 0xa6, 0x5f, 0x00, 0x40, 0x96, 0x32, 0x51, 0xe5 };
  mixin Interfaces!(IXMLHTTPRequest);
}

// Server XML HTTP Request class.
abstract class ServerXMLHTTP {
  mixin(uuid("afba6b42-5692-48ea-8141-dc517dcf0ef1"));
  // static DWINGUID CLSID = { 0xafba6b42, 0x5692, 0x48ea, 0x81, 0x41, 0xdc, 0x51, 0x7d, 0xcf, 0x0e, 0xf1 };
  mixin Interfaces!(IServerXMLHTTPRequest);
}

// Server XML HTTP Request class.
abstract class ServerXMLHTTP30 {
  mixin(uuid("afb40ffd-b609-40a3-9828-f88bbe11e4e3"));
  // static DWINGUID CLSID = { 0xafb40ffd, 0xb609, 0x40a3, 0x98, 0x28, 0xf8, 0x8b, 0xbe, 0x11, 0xe4, 0xe3 };
  mixin Interfaces!(IServerXMLHTTPRequest);
}

// Server XML HTTP Request class.
abstract class ServerXMLHTTP40 {
  mixin(uuid("88d969c6-f192-11d4-a65f-0040963251e5"));
  // static DWINGUID CLSID = { 0x88d969c6, 0xf192, 0x11d4, 0xa6, 0x5f, 0x00, 0x40, 0x96, 0x32, 0x51, 0xe5 };
  mixin Interfaces!(IServerXMLHTTPRequest2);
}

// SAX XML Reader (version independent) coclass
abstract class SAXXMLReader {
  mixin(uuid("079aa557-4a18-424a-8eee-e39f0a8d41b9"));
  // static DWINGUID CLSID = { 0x079aa557, 0x4a18, 0x424a, 0x8e, 0xee, 0xe3, 0x9f, 0x0a, 0x8d, 0x41, 0xb9 };
  mixin Interfaces!(IVBSAXXMLReader, ISAXXMLReader, IMXReaderControl);
}

// SAX XML Reader 3.0 coclass
abstract class SAXXMLReader30 {
  mixin(uuid("3124c396-fb13-4836-a6ad-1317f1713688"));
  // static DWINGUID CLSID = { 0x3124c396, 0xfb13, 0x4836, 0xa6, 0xad, 0x13, 0x17, 0xf1, 0x71, 0x36, 0x88 };
  mixin Interfaces!(IVBSAXXMLReader, ISAXXMLReader, IMXReaderControl);
}

// SAX XML Reader 4.0 coclass
abstract class SAXXMLReader40 {
  mixin(uuid("7c6e29bc-8b8b-4c3d-859e-af6cd158be0f"));
  // static DWINGUID CLSID = { 0x7c6e29bc, 0x8b8b, 0x4c3d, 0x85, 0x9e, 0xaf, 0x6c, 0xd1, 0x58, 0xbe, 0x0f };
  mixin Interfaces!(IVBSAXXMLReader, ISAXXMLReader);
}

// Microsoft XML Writer (version independent) coclass
abstract class MXXMLWriter {
  mixin(uuid("fc220ad8-a72a-4ee8-926e-0b7ad152a020"));
  // static DWINGUID CLSID = { 0xfc220ad8, 0xa72a, 0x4ee8, 0x92, 0x6e, 0x0b, 0x7a, 0xd1, 0x52, 0xa0, 0x20 };
  mixin Interfaces!(IMXWriter, ISAXContentHandler, ISAXErrorHandler, ISAXDTDHandler, ISAXLexicalHandler, ISAXDeclHandler, IVBSAXContentHandler, IVBSAXDeclHandler, IVBSAXDTDHandler, IVBSAXErrorHandler, IVBSAXLexicalHandler);
}

// Microsoft XML Writer 3.0 coclass
abstract class MXXMLWriter30 {
  mixin(uuid("3d813dfe-6c91-4a4e-8f41-04346a841d9c"));
  // static DWINGUID CLSID = { 0x3d813dfe, 0x6c91, 0x4a4e, 0x8f, 0x41, 0x04, 0x34, 0x6a, 0x84, 0x1d, 0x9c };
  mixin Interfaces!(IMXWriter, ISAXContentHandler, ISAXDeclHandler, ISAXDTDHandler, ISAXErrorHandler, ISAXLexicalHandler, IVBSAXContentHandler, IVBSAXDeclHandler, IVBSAXDTDHandler, IVBSAXErrorHandler, IVBSAXLexicalHandler);
}

// Microsoft XML Writer 4.0 coclass
abstract class MXXMLWriter40 {
  mixin(uuid("88d969c8-f192-11d4-a65f-0040963251e5"));
  // static DWINGUID CLSID = { 0x88d969c8, 0xf192, 0x11d4, 0xa6, 0x5f, 0x00, 0x40, 0x96, 0x32, 0x51, 0xe5 };
  mixin Interfaces!(IMXWriter, ISAXContentHandler, ISAXDeclHandler, ISAXDTDHandler, ISAXErrorHandler, ISAXLexicalHandler, IVBSAXContentHandler, IVBSAXDeclHandler, IVBSAXDTDHandler, IVBSAXErrorHandler, IVBSAXLexicalHandler);
}

// Microsoft HTML Writer (version independent) coclass
abstract class MXHTMLWriter {
  mixin(uuid("a4c23ec3-6b70-4466-9127-550077239978"));
  // static DWINGUID CLSID = { 0xa4c23ec3, 0x6b70, 0x4466, 0x91, 0x27, 0x55, 0x00, 0x77, 0x23, 0x99, 0x78 };
  mixin Interfaces!(IMXWriter, ISAXContentHandler, ISAXErrorHandler, ISAXDTDHandler, ISAXLexicalHandler, ISAXDeclHandler, IVBSAXContentHandler, IVBSAXDeclHandler, IVBSAXDTDHandler, IVBSAXErrorHandler, IVBSAXLexicalHandler);
}

// Microsoft HTML Writer 3.0 coclass
abstract class MXHTMLWriter30 {
  mixin(uuid("853d1540-c1a7-4aa9-a226-4d3bd301146d"));
  // static DWINGUID CLSID = { 0x853d1540, 0xc1a7, 0x4aa9, 0xa2, 0x26, 0x4d, 0x3b, 0xd3, 0x01, 0x14, 0x6d };
  mixin Interfaces!(IMXWriter, ISAXContentHandler, ISAXDeclHandler, ISAXDTDHandler, ISAXErrorHandler, ISAXLexicalHandler, IVBSAXContentHandler, IVBSAXDeclHandler, IVBSAXDTDHandler, IVBSAXErrorHandler, IVBSAXLexicalHandler);
}

// Microsoft HTML Writer 4.0 coclass
abstract class MXHTMLWriter40 {
  mixin(uuid("88d969c9-f192-11d4-a65f-0040963251e5"));
  // static DWINGUID CLSID = { 0x88d969c9, 0xf192, 0x11d4, 0xa6, 0x5f, 0x00, 0x40, 0x96, 0x32, 0x51, 0xe5 };
  mixin Interfaces!(IMXWriter, ISAXContentHandler, ISAXDeclHandler, ISAXDTDHandler, ISAXErrorHandler, ISAXLexicalHandler, IVBSAXContentHandler, IVBSAXDeclHandler, IVBSAXDTDHandler, IVBSAXErrorHandler, IVBSAXLexicalHandler);
}

// SAX Attributes (version independent) coclass
abstract class SAXAttributes {
  mixin(uuid("4dd441ad-526d-4a77-9f1b-9841ed802fb0"));
  // static DWINGUID CLSID = { 0x4dd441ad, 0x526d, 0x4a77, 0x9f, 0x1b, 0x98, 0x41, 0xed, 0x80, 0x2f, 0xb0 };
  mixin Interfaces!(IMXAttributes, IVBSAXAttributes, ISAXAttributes);
}

// SAX Attributes 3.0 coclass
abstract class SAXAttributes30 {
  mixin(uuid("3e784a01-f3ae-4dc0-9354-9526b9370eba"));
  // static DWINGUID CLSID = { 0x3e784a01, 0xf3ae, 0x4dc0, 0x93, 0x54, 0x95, 0x26, 0xb9, 0x37, 0x0e, 0xba };
  mixin Interfaces!(IMXAttributes, IVBSAXAttributes, ISAXAttributes);
}

// SAX Attributes 4.0 coclass
abstract class SAXAttributes40 {
  mixin(uuid("88d969ca-f192-11d4-a65f-0040963251e5"));
  // static DWINGUID CLSID = { 0x88d969ca, 0xf192, 0x11d4, 0xa6, 0x5f, 0x00, 0x40, 0x96, 0x32, 0x51, 0xe5 };
  mixin Interfaces!(IMXAttributes, IVBSAXAttributes, ISAXAttributes);
}

// MX Namespace Manager coclass
abstract class MXNamespaceManager {
  mixin(uuid("88d969d5-f192-11d4-a65f-0040963251e5"));
  // static DWINGUID CLSID = { 0x88d969d5, 0xf192, 0x11d4, 0xa6, 0x5f, 0x00, 0x40, 0x96, 0x32, 0x51, 0xe5 };
  mixin Interfaces!(IVBMXNamespaceManager, IMXNamespaceManager);
}

// MX Namespace Manager 4.0 coclass
abstract class MXNamespaceManager40 {
  mixin(uuid("88d969d6-f192-11d4-a65f-0040963251e5"));
  // static DWINGUID CLSID = { 0x88d969d6, 0xf192, 0x11d4, 0xa6, 0x5f, 0x00, 0x40, 0x96, 0x32, 0x51, 0xe5 };
  mixin Interfaces!(IVBMXNamespaceManager, IMXNamespaceManager);
}

// XMLDocument extends IXML Document.  It is obsolete.  You should use DOMDocument.  This object should not be confused with the XMLDocument property on the XML data island.
abstract class XMLDocument {
  mixin(uuid("cfc399af-d876-11d0-9c10-00c04fc99c8e"));
  // static DWINGUID CLSID = { 0xcfc399af, 0xd876, 0x11d0, 0x9c, 0x10, 0x00, 0xc0, 0x4f, 0xc9, 0x9c, 0x8e };
  mixin Interfaces!(IXMLDocument2);
}
