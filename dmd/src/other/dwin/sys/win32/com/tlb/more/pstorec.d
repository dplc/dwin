// PStore 1.0 Type Library
// Version 1.0

/*[uuid("5a6f1ebd-2db1-11d0-8c39-00c04fd9126b")]*/
module dwin.sys.win32.com.tlb.more.pstorec;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Structs

struct _PST_PROVIDERINFO {
  uint cbSize;
 DWINGUID ID;
  uint Capabilities;
  wchar* szProviderName;
}

struct _PST_TYPEINFO {
  uint cbSize;
  wchar* szDisplayName;
}

struct _PST_ACCESSRULESET {
  uint cbSize;
  uint cRules;
  _PST_ACCESSRULE* rgRules;
}

struct _PST_ACCESSRULE {
  uint cbSize;
  uint AccessModeFlags;
  uint cClauses;
  _PST_ACCESSCLAUSE* rgClauses;
}

struct _PST_ACCESSCLAUSE {
  uint cbSize;
  uint ClauseType;
  uint cbClauseData;
  ubyte* pbClauseData;
}

struct _PST_PROMPTINFO {
  uint cbSize;
  uint dwPromptFlags;
  uint hwndApp;
  wchar* szPrompt;
}

// Interfaces

// IEnumPStoreProviders Interface
interface IEnumPStoreProviders : IUnknown {
  mixin(uuid("5a6f1ebf-2db1-11d0-8c39-00c04fd9126b"));
  // static DWINGUID IID = { 0x5a6f1ebf, 0x2db1, 0x11d0, 0x8c, 0x39, 0x00, 0xc0, 0x4f, 0xd9, 0x12, 0x6b };
  /*[id(0x60010000)]*/ int Next(uint celt, out _PST_PROVIDERINFO rgelt, ref uint pceltFetched);
  /*[id(0x60010001)]*/ int Skip(uint celt);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IEnumPStoreProviders ppenum);
}

// IPStore Interface
interface IPStore : IUnknown {
  mixin(uuid("5a6f1ec0-2db1-11d0-8c39-00c04fd9126b"));
  // static DWINGUID IID = { 0x5a6f1ec0, 0x2db1, 0x11d0, 0x8c, 0x39, 0x00, 0xc0, 0x4f, 0xd9, 0x12, 0x6b };
  /*[id(0x60010000)]*/ int GetInfo(out _PST_PROVIDERINFO ppProperties);
  /*[id(0x60010001)]*/ int GetProvParam(uint dwParam, out uint pcbData, out ubyte ppbData, uint dwFlags);
  /*[id(0x60010002)]*/ int SetProvParam(uint dwParam, uint cbData, ubyte* pbData, uint dwFlags);
  /*[id(0x60010003)]*/ int CreateType(uint Key, ref DWINGUID pType, _PST_TYPEINFO* pInfo, uint dwFlags);
  /*[id(0x60010004)]*/ int GetTypeInfo(uint Key, ref DWINGUID pType, out _PST_TYPEINFO ppInfo, uint dwFlags);
  /*[id(0x60010005)]*/ int DeleteType(uint Key, ref DWINGUID pType, uint dwFlags);
  /*[id(0x60010006)]*/ int CreateSubtype(uint Key, ref DWINGUID pType, ref DWINGUID pSubtype, _PST_TYPEINFO* pInfo, _PST_ACCESSRULESET* pRules, uint dwFlags);
  /*[id(0x60010007)]*/ int GetSubtypeInfo(uint Key, ref DWINGUID pType, ref DWINGUID pSubtype, out _PST_TYPEINFO ppInfo, uint dwFlags);
  /*[id(0x60010008)]*/ int DeleteSubtype(uint Key, ref DWINGUID pType, ref DWINGUID pSubtype, uint dwFlags);
  /*[id(0x60010009)]*/ int ReadAccessRuleset(uint Key, ref DWINGUID pType, ref DWINGUID pSubtype, out _PST_ACCESSRULESET ppRules, uint dwFlags);
  /*[id(0x6001000A)]*/ int WriteAccessRuleset(uint Key, ref DWINGUID pType, ref DWINGUID pSubtype, _PST_ACCESSRULESET* pRules, uint dwFlags);
  /*[id(0x6001000B)]*/ int EnumTypes(uint Key, uint dwFlags, IEnumPStoreTypes* ppenum);
  /*[id(0x6001000C)]*/ int EnumSubtypes(uint Key, ref DWINGUID pType, uint dwFlags, IEnumPStoreTypes* ppenum);
  /*[id(0x6001000D)]*/ int DeleteItem(uint Key, ref DWINGUID pItemType, ref DWINGUID pItemSubtype, wchar* szItemName, _PST_PROMPTINFO* pPromptInfo, uint dwFlags);
  /*[id(0x6001000E)]*/ int ReadItem(uint Key, ref DWINGUID pItemType, ref DWINGUID pItemSubtype, wchar* szItemName, out uint pcbData, out ubyte ppbData, _PST_PROMPTINFO* pPromptInfo, uint dwFlags);
  /*[id(0x6001000F)]*/ int WriteItem(uint Key, ref DWINGUID pItemType, ref DWINGUID pItemSubtype, wchar* szItemName, uint cbData, ubyte* pbData, _PST_PROMPTINFO* pPromptInfo, uint dwDefaultConfirmationStyle, uint dwFlags);
  /*[id(0x60010010)]*/ int OpenItem(uint Key, ref DWINGUID pItemType, ref DWINGUID pItemSubtype, wchar* szItemName, uint ModeFlags, _PST_PROMPTINFO* pPromptInfo, uint dwFlags);
  /*[id(0x60010011)]*/ int CloseItem(uint Key, ref DWINGUID pItemType, ref DWINGUID pItemSubtype, wchar* szItemName, uint dwFlags);
  /*[id(0x60010012)]*/ int EnumItems(uint Key, ref DWINGUID pItemType, ref DWINGUID pItemSubtype, uint dwFlags, IEnumPStoreItems* ppenum);
}

// IEnumPStoreTypes Interface
interface IEnumPStoreTypes : IUnknown {
  mixin(uuid("789c1cbf-31ee-11d0-8c39-00c04fd9126b"));
  // static DWINGUID IID = { 0x789c1cbf, 0x31ee, 0x11d0, 0x8c, 0x39, 0x00, 0xc0, 0x4f, 0xd9, 0x12, 0x6b };
  /*[id(0x60010000)]*/ int Next(uint celt, out DWINGUID rgelt, ref uint pceltFetched);
  /*[id(0x60010001)]*/ int Skip(uint celt);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IEnumPStoreTypes ppenum);
}

// IEnumPStoreItems Interface
interface IEnumPStoreItems : IUnknown {
  mixin(uuid("5a6f1ec1-2db1-11d0-8c39-00c04fd9126b"));
  // static DWINGUID IID = { 0x5a6f1ec1, 0x2db1, 0x11d0, 0x8c, 0x39, 0x00, 0xc0, 0x4f, 0xd9, 0x12, 0x6b };
  /*[id(0x60010000)]*/ int Next(uint celt, out wchar* rgelt, ref uint pceltFetched);
  /*[id(0x60010001)]*/ int Skip(uint celt);
  /*[id(0x60010002)]*/ int Reset();
  /*[id(0x60010003)]*/ int Clone(out IEnumPStoreItems ppenum);
}

// CoClasses

// PStore Class
abstract class CPStore {
  mixin(uuid("5a6f1ec3-2db1-11d0-8c39-00c04fd9126b"));
  // static DWINGUID CLSID = { 0x5a6f1ec3, 0x2db1, 0x11d0, 0x8c, 0x39, 0x00, 0xc0, 0x4f, 0xd9, 0x12, 0x6b };
  mixin Interfaces!(IEnumPStoreProviders, IPStore);
}

// CEnumTypes Class
abstract class CEnumTypes {
  mixin(uuid("09bb61e7-31ec-11d0-8c39-00c04fd9126b"));
  // static DWINGUID CLSID = { 0x09bb61e7, 0x31ec, 0x11d0, 0x8c, 0x39, 0x00, 0xc0, 0x4f, 0xd9, 0x12, 0x6b };
  mixin Interfaces!(IEnumPStoreTypes);
}

// CEnumPStoreItems Class
abstract class CEnumItems {
  mixin(uuid("09bb61e6-31ec-11d0-8c39-00c04fd9126b"));
  // static DWINGUID CLSID = { 0x09bb61e6, 0x31ec, 0x11d0, 0x8c, 0x39, 0x00, 0xc0, 0x4f, 0xd9, 0x12, 0x6b };
  mixin Interfaces!(IEnumPStoreItems);
}
