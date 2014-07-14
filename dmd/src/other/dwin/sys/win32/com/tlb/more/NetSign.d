// NetSign 1.0 Type Library
// Version 1.0

/*[uuid("9a8c6864-cae2-41a4-a2ef-53baa60d9508")]*/
//module dwin.sys.win32.com.tlb.more.netsign;
module dwin.sys.win32.com.tlb.more.NetSign;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// _IInfoSecNetSignEvents Interface
interface _IInfoSecNetSignEvents : IDispatch {
  mixin(uuid("569eb7ba-bdbe-47fd-be57-cf061a4b3d7e"));
  // static DWINGUID IID = { 0x569eb7ba, 0xbdbe, 0x47fd, 0xbe, 0x57, 0xcf, 0x06, 0x1a, 0x4b, 0x3d, 0x7e };
}

// IInfoSecNetSign Interface
interface IInfoSecNetSign : IDispatch {
  mixin(uuid("343d34b5-b609-4ed5-970f-cb1f3bf8576f"));
  // static DWINGUID IID = { 0x343d34b5, 0xb609, 0x4ed5, 0x97, 0x0f, 0xcb, 0x1f, 0x3b, 0xf8, 0x57, 0x6f };
  // method makeAttachedSign
  /*[id(0x00000001)]*/ int makeAttachedSign();
  // property attachedSign
  /*[id(0x00000002)]*/ int get_attachedSign(out wchar* pVal);
  // property detachedSign
  /*[id(0x00000003)]*/ int get_detachedSign(out wchar* pVal);
  // method addFormItem
  /*[id(0x00000004)]*/ int addFormItem(wchar* formItem);
  // method addFileName
  /*[id(0x00000005)]*/ int addFileName(wchar* __MIDL_0011);
  // method makeDetachedSign
  /*[id(0x00000006)]*/ int makeDetachedSign();
  // property signedMsg
  /*[id(0x00000007)]*/ int set_signedMsg(wchar* value);
  // method verifySign
  /*[id(0x00000008)]*/ int verifySign();
  // property plainTextForDetachedSign
  /*[id(0x00000009)]*/ int set_plainTextForDetachedSign(wchar* value);
  // property defaultDN
  /*[id(0x0000000A)]*/ int set_defaultDN(wchar* value);
  // property errorNum
  /*[id(0x0000000B)]*/ int get_errorNum(out int pVal);
  // method showPlainText
  /*[id(0x0000000C)]*/ int showPlainText();
  // method verifyAttachedSign
  /*[id(0x0000000D)]*/ int verifyAttachedSign(wchar* swSign, int savePlain);
  // property signerDN
  /*[id(0x0000000E)]*/ int get_signerDN(out wchar* pVal);
  // property defaultDNRecv
  /*[id(0x0000000F)]*/ int set_defaultDNRecv(wchar* value);
  // method makeSignAndEncryptEnvelop
  /*[id(0x00000010)]*/ int makeSignAndEncryptEnvelop();
  // property signAndEncryptEnvelop
  /*[id(0x00000011)]*/ int get_signAndEncryptEnvelop(out wchar* pVal);
  // property signsPlaintextBase64
  /*[id(0x00000012)]*/ int get_signsPlaintextBase64(out wchar* pVal);
  // property signsHashBase64
  /*[id(0x00000013)]*/ int get_signsHashBase64(out wchar* pVal);
  // method hash1Base64
  /*[id(0x00000014)]*/ int hash1Base64(wchar* swPlain);
  // property hash1Base64Result
  /*[id(0x00000015)]*/ int get_hash1Base64Result(out wchar* pVal);
  // method verifyDetachedServerSign
  /*[id(0x00000016)]*/ int verifyDetachedServerSign();
  // method verifyAttachedServerSign
  /*[id(0x00000017)]*/ int verifyAttachedServerSign();
  // property plainTextForDetachedVerify
  /*[id(0x00000018)]*/ int set_plainTextForDetachedVerify(wchar* value);
  // property base64In
  /*[id(0x00000019)]*/ int set_base64In(wchar* value);
  // property base64Out
  /*[id(0x0000001A)]*/ int get_base64Out(out wchar* pVal);
  // method Base64Encode
  /*[id(0x0000001B)]*/ int Base64Encode();
  // method Base64Decode
  /*[id(0x0000001C)]*/ int Base64Decode();
  // property MaxSignSize
  /*[id(0x0000001D)]*/ int get_MaxSignSize(out int pVal);
  // property MaxSignSize
  /*[id(0x0000001D)]*/ int set_MaxSignSize(int pVal);
  // property DNspliter
  /*[id(0x0000001E)]*/ int set_DNspliter(wchar* value);
}

// CoClasses

// InfoSecNetSign Class
abstract class InfoSecNetSign {
  mixin(uuid("62b938c4-4190-4f37-8cf0-a92b0a91cc77"));
  // static DWINGUID CLSID = { 0x62b938c4, 0x4190, 0x4f37, 0x8c, 0xf0, 0xa9, 0x2b, 0x0a, 0x91, 0xcc, 0x77 };
  mixin Interfaces!(IInfoSecNetSign);
}
