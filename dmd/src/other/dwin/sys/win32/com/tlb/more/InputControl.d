// InputControl 1.0 Type Library
// Version 1.0

/*[uuid("2ba10ef5-8a81-4c57-92d6-591515ecf910")]*/
module dwin.sys.win32.com.tlb.more.InputControl;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// _IAxInputControlEvents Interface
interface _IAxInputControlEvents : IDispatch {
  mixin(uuid("2ea6ac75-6982-4a23-8b03-7b3ca3fda647"));
  // static DWINGUID IID = { 0x2ea6ac75, 0x6982, 0x4a23, 0x8b, 0x03, 0x7b, 0x3c, 0xa3, 0xfd, 0xa6, 0x47 };
}

// IAxInputControl Interface
interface IAxInputControl : IDispatch {
  mixin(uuid("133a76a3-a847-4613-bb39-8be887adade6"));
  // static DWINGUID IID = { 0x133a76a3, 0xa847, 0x4613, 0xbb, 0x39, 0x8b, 0xe8, 0x87, 0xad, 0xad, 0xe6 };
  // property borderVisible
  /*[id(0x00000001)]*/ int get_borderVisible(out int pVal);
  // property borderVisible
  /*[id(0x00000001)]*/ int set_borderVisible(int pVal);
  // property minLength
  /*[id(0x00000002)]*/ int get_minLength(out int pVal);
  // property minLength
  /*[id(0x00000002)]*/ int set_minLength(int pVal);
  // property maxLength
  /*[id(0x00000003)]*/ int get_maxLength(out int pVal);
  // property maxLength
  /*[id(0x00000003)]*/ int set_maxLength(int pVal);
  // property rule
  /*[id(0x00000004)]*/ int get_rule(out wchar* pVal);
  // property rule
  /*[id(0x00000004)]*/ int set_rule(wchar* pVal);
  // property keyName
  /*[id(0x00000005)]*/ int get_keyName(out wchar* pVal);
  // property keyName
  /*[id(0x00000005)]*/ int set_keyName(wchar* pVal);
  // method clear
  /*[id(0x00000006)]*/ int clear();
  // method getLength
  /*[id(0x00000007)]*/ int getLength(out int pRet);
  // method isValid
  /*[id(0x00000008)]*/ int isValid(out int pRet);
  // method compareWith
  /*[id(0x00000009)]*/ int compareWith(wchar* inParam, out int pRet);
  // method isEqual
  /*[id(0x0000000A)]*/ int isEqual(IUnknown pOther, out int pRet);
  // method AddKeyPart
  /*[id(0x0000000C)]*/ int AddKeyPart(wchar* keyPart, out int pRet);
  // property UniqueID
  /*[id(0x0000000D)]*/ int set_UniqueID(wchar* value);
  // method commit
  /*[id(0x0000000F)]*/ int commit(IUnknown pSubmit, out int pRet);
  // property isPassword
  /*[id(0x00000010)]*/ int set_isPassword(int value);
  // method commitKeyPart
  /*[id(0x00000011)]*/ int commitKeyPart(IUnknown pInputControl, out int pRet);
}

// CoClasses

// AxInputControl Class
abstract class AxInputControl {
  mixin(uuid("73e4740c-08eb-4133-896b-8d0a7c9ee3cd"));
  // static DWINGUID CLSID = { 0x73e4740c, 0x08eb, 0x4133, 0x89, 0x6b, 0x8d, 0x0a, 0x7c, 0x9e, 0xe3, 0xcd };
  mixin Interfaces!(IAxInputControl);
}
