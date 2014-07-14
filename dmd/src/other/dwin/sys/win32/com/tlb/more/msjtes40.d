// JET Expression Service Type Library
// Version 4.0

/*[uuid("2358c810-62ba-11d1-b3db-00600832c573")]*/
//module dwin.sys.win32.com.tlb.more.jetes;
module dwin.sys.win32.com.tlb.more.msjetes40;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum tagTYPEKIND {
  TKIND_ENUM = 0x00000000,
  TKIND_RECORD = 0x00000001,
  TKIND_MODULE = 0x00000002,
  TKIND_INTERFACE = 0x00000003,
  TKIND_DISPATCH = 0x00000004,
  TKIND_COCLASS = 0x00000005,
  TKIND_ALIAS = 0x00000006,
  TKIND_UNION = 0x00000007,
  TKIND_MAX = 0x00000008,
}

enum tagDESCKIND {
  DESCKIND_NONE = 0x00000000,
  DESCKIND_FUNCDESC = 0x00000001,
  DESCKIND_VARDESC = 0x00000002,
  DESCKIND_TYPECOMP = 0x00000003,
  DESCKIND_IMPLICITAPPOBJ = 0x00000004,
  DESCKIND_MAX = 0x00000005,
}

enum tagFUNCKIND {
  FUNC_VIRTUAL = 0x00000000,
  FUNC_PUREVIRTUAL = 0x00000001,
  FUNC_NONVIRTUAL = 0x00000002,
  FUNC_STATIC = 0x00000003,
  FUNC_DISPATCH = 0x00000004,
}

enum tagINVOKEKIND {
  INVOKE_FUNC = 0x00000001,
  INVOKE_PROPERTYGET = 0x00000002,
  INVOKE_PROPERTYPUT = 0x00000004,
  INVOKE_PROPERTYPUTREF = 0x00000008,
}

enum tagCALLCONV {
  CC_FASTCALL = 0x00000000,
  CC_CDECL = 0x00000001,
  CC_MSCPASCAL = 0x00000002,
  CC_PASCAL = 0x00000002,
  CC_MACPASCAL = 0x00000003,
  CC_STDCALL = 0x00000004,
  CC_FPFASTCALL = 0x00000005,
  CC_SYSCALL = 0x00000006,
  CC_MPWCDECL = 0x00000007,
  CC_MPWPASCAL = 0x00000008,
  CC_MAX = 0x00000009,
}

enum tagVARKIND {
  VAR_PERINSTANCE = 0x00000000,
  VAR_STATIC = 0x00000001,
  VAR_CONST = 0x00000002,
  VAR_DISPATCH = 0x00000003,
}

enum tagSYSKIND {
  SYS_WIN16 = 0x00000000,
  SYS_WIN32 = 0x00000001,
  SYS_MAC = 0x00000002,
}

// Unions

union __MIDL_IOleAutomationTypes_0005 {
  tagTYPEDESC* lptdesc;
  tagARRAYDESC* lpadesc;
  uint hreftype;
}

union __MIDL_IOleAutomationTypes_0006 {
  uint oInst;
  DWINVARIANT* lpvarValue;
}

// Structs

struct tagTYPEATTR {
 DWINGUID guid;
  uint lcid;
  uint dwReserved;
  int memidConstructor;
  int memidDestructor;
  wchar* lpstrSchema;
  uint cbSizeInstance;
  tagTYPEKIND typekind;
  ushort cFuncs;
  ushort cVars;
  ushort cImplTypes;
  ushort cbSizeVft;
  ushort cbAlignment;
  ushort wTypeFlags;
  ushort wMajorVerNum;
  ushort wMinorVerNum;
  tagTYPEDESC tdescAlias;
  tagIDLDESC idldescType;
}

struct tagTYPEDESC {
  __MIDL_IOleAutomationTypes_0005 __MIDL_0013;
  ushort vt;
}

struct tagARRAYDESC {
  tagTYPEDESC tdescElem;
  ushort cDims;
  tagSAFEARRAYBOUND* rgbounds;
}

struct tagSAFEARRAYBOUND {
  uint cElements;
  int lLbound;
}

struct tagIDLDESC {
  uint dwReserved;
  ushort wIDLFlags;
}

struct tagFUNCDESC {
  int memid;
  int* lprgscode;
  tagELEMDESC* lprgelemdescParam;
  tagFUNCKIND funckind;
  tagINVOKEKIND invkind;
  tagCALLCONV callconv;
  short cParams;
  short cParamsOpt;
  short oVft;
  short cScodes;
  tagELEMDESC elemdescFunc;
  ushort wFuncFlags;
}

struct tagELEMDESC {
  tagTYPEDESC tdesc;
  tagPARAMDESC paramdesc;
}

struct tagPARAMDESC {
  tagPARAMDESCEX* pparamdescex;
  ushort wParamFlags;
}

struct tagPARAMDESCEX {
  uint cBytes;
  DWINVARIANT varDefaultValue;
}

struct tagVARDESC {
  int memid;
  wchar* lpstrSchema;
  __MIDL_IOleAutomationTypes_0006 __MIDL_0014;
  tagELEMDESC elemdescVar;
  ushort wVarFlags;
  tagVARKIND varkind;
}

struct tagTLIBATTR {
 DWINGUID guid;
  uint lcid;
  tagSYSKIND syskind;
  ushort wMajorVerNum;
  ushort wMinorVerNum;
  ushort wLibFlags;
}

// Aliases

alias uint DWORD;

// Interfaces

interface IJetES : IDispatch {
  mixin(uuid("e2a100c1-d773-11d0-8776-00a0c91ec756"));
  // static DWINGUID IID = { 0xe2a100c1, 0xd773, 0x11d0, 0x87, 0x76, 0x00, 0xa0, 0xc9, 0x1e, 0xc7, 0x56 };
  /*[id(0x60020000)]*/ int InitQJetCallbacks(void* pQJetCallbacks, uint cbSize);
  /*[id(0x60020001)]*/ int NewInstance(out IJetESInstance ppIESInstance);
  /*[id(0x60020002)]*/ int NewSimpleInstance(out IJetESSimpleInstance ppIESSimpleInstance);
  /*[id(0x60020003)]*/ int SetVBAExpressionObject(ref DWINGUID riid, void* pIExpressionService);
  /*[id(0x60020004)]*/ int SetPictureCallbacks(IJetESPictures pIJetESPictures);
  /*[id(0x60020005)]*/ int ReleaseVBAExpressionObject();
}

interface IJetESInstance : IUnknown {
  mixin(uuid("e2a100c2-d773-11d0-8776-00a0c91ec756"));
  // static DWINGUID IID = { 0xe2a100c2, 0xd773, 0x11d0, 0x87, 0x76, 0x00, 0xa0, 0xc9, 0x1e, 0xc7, 0x56 };
  /*[id(0x60010000)]*/ int SetVBAExpressionObject(ref DWINGUID riid, void* pIExpressionService);
  /*[id(0x60010001)]*/ int AddITypeLibToCache(ITypeLib pITypeLib, ref uint pdwCacheIndex);
  /*[id(0x60010002)]*/ int RemoveITypeLibFromCache(uint dwCacheIndex);
  /*[id(0x60010003)]*/ int GetITypeLibFromCache(uint dwCacheIndex, out ITypeLib ppOldITypeLib);
  /*[id(0x60010004)]*/ int HtteParseExpr(void* seg, void* pXTC, short* wzExpression, uint cch, void* lpxersT, void *pHtte);
  /*[id(0x60010005)]*/ int DecodeHtteA(void* seg, void* pXTC, void* htte, ref byte szExpression, uint cchMax, ref byte szImpT, out int pfRes);
  /*[id(0x60010006)]*/ int DecodeHtte(void* seg, void* pXTC, void* htte, ref short wzExpression, uint cchMax, ref short wzImpT, out int pfRes);
  /*[id(0x60010007)]*/ int ErrEvalHtte(void* seg, void* htte, void *pvlOut, out int piErr);
  /*[id(0x60010008)]*/ int FreeHtte(void* seg, void * htte);
  /*[id(0x60010009)]*/ int BindExpr(void* seg, void* pXTC, void * htte, void* pxers);
  /*[id(0x6001000A)]*/ int PwzOfDfi(int dfi, out short pwz);
  /*[id(0x6001000B)]*/ int FWildWch(short* wzWild, uint cch, out int pfRes);
  /*[id(0x6001000C)]*/ int ErrSetValHtte(void* seg, void* htte, void* pvlIn, out int piErr);
  /*[id(0x6001000D)]*/ int ESRunning(out int pfRunning);
  /*[id(0x6001000E)]*/ int ErrESSetCollateSeq(int sort, out int sortOld, out int piErr);
  /*[id(0x6001000F)]*/ int ESSetCollateSeqLCID(uint localeID, out uint localeOld, out int piErr);
  /*[id(0x60010010)]*/ int SetCalendar(uint ulCalType);
}

interface ITypeLib : IUnknown {
  mixin(uuid("00020402-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00020402, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RemoteGetTypeInfoCount(out uint pcTInfo);
  /*[id(0x60010001)]*/ int GetTypeInfo(uint index, out ITypeInfo ppTInfo);
  /*[id(0x60010002)]*/ int GetTypeInfoType(uint index, out tagTYPEKIND pTKind);
  /*[id(0x60010003)]*/ int GetTypeInfoOfGuid(ref DWINGUID guid, out ITypeInfo ppTInfo);
  /*[id(0x60010004)]*/ int RemoteGetLibAttr(out tagTLIBATTR ppTLibAttr, out DWORD pDummy);
  /*[id(0x60010005)]*/ int GetTypeComp(out ITypeComp ppTComp);
  /*[id(0x60010006)]*/ int RemoteGetDocumentation(int index, uint refPtrFlags, out wchar* pBstrName, out wchar* pBstrDocString, out uint pdwHelpContext, out wchar* pBstrHelpFile);
  /*[id(0x60010007)]*/ int RemoteIsName(wchar* szNameBuf, uint lHashVal, out int pfName, out wchar* pBstrLibName);
  /*[id(0x60010008)]*/ int RemoteFindName(wchar* szNameBuf, uint lHashVal, out ITypeInfo ppTInfo, out int rgMemId, ref ushort pcFound, out wchar* pBstrLibName);
  /*[id(0x60010009)]*/ int LocalReleaseTLibAttr();
}

interface ITypeInfo : IUnknown {
  mixin(uuid("00020401-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00020401, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RemoteGetTypeAttr(out tagTYPEATTR ppTypeAttr, out DWORD pDummy);
  /*[id(0x60010001)]*/ int GetTypeComp(out ITypeComp ppTComp);
  /*[id(0x60010002)]*/ int RemoteGetFuncDesc(uint index, out tagFUNCDESC ppFuncDesc, out DWORD pDummy);
  /*[id(0x60010003)]*/ int RemoteGetVarDesc(uint index, out tagVARDESC ppVarDesc, out DWORD pDummy);
  /*[id(0x60010004)]*/ int RemoteGetNames(int memid, out wchar* rgBstrNames, uint cMaxNames, out uint pcNames);
  /*[id(0x60010005)]*/ int GetRefTypeOfImplType(uint index, out uint pRefType);
  /*[id(0x60010006)]*/ int GetImplTypeFlags(uint index, out int pImplTypeFlags);
  /*[id(0x60010007)]*/ int GetIDsOfNames(wchar** rgszNames, uint cNames, out int pMemId);
  /*[id(0x60010008)]*/ int RemoteInvoke(IUnknown pIUnk, int memid, uint dwFlags, DISPPARAMS* pDispParams, out DWINVARIANT pVarResult, out EXCEPINFO pExcepInfo, out uint pArgErr, uint cVarRef, uint* rgVarRefIdx, ref DWINVARIANT rgVarRef);
  /*[id(0x60010009)]*/ int RemoteGetDocumentation(int memid, uint refPtrFlags, out wchar* pBstrName, out wchar* pBstrDocString, out uint pdwHelpContext, out wchar* pBstrHelpFile);
  /*[id(0x6001000A)]*/ int RemoteGetDllEntry(int memid, tagINVOKEKIND invkind, uint refPtrFlags, out wchar* pBstrDllName, out wchar* pBstrName, out ushort pwOrdinal);
  /*[id(0x6001000B)]*/ int GetRefTypeInfo(uint hreftype, out ITypeInfo ppTInfo);
  /*[id(0x6001000C)]*/ int LocalAddressOfMember();
  /*[id(0x6001000D)]*/ int RemoteCreateInstance(ref DWINGUID riid, out IUnknown ppvObj);
  /*[id(0x6001000E)]*/ int GetMops(int memid, out wchar* pBstrMops);
  /*[id(0x6001000F)]*/ int RemoteGetContainingTypeLib(out ITypeLib ppTLib, out uint pIndex);
  /*[id(0x60010010)]*/ int LocalReleaseTypeAttr();
  /*[id(0x60010011)]*/ int LocalReleaseFuncDesc();
  /*[id(0x60010012)]*/ int LocalReleaseVarDesc();
}

interface ITypeComp : IUnknown {
  mixin(uuid("00020403-0000-0000-c000-000000000046"));
  // static DWINGUID IID = { 0x00020403, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
  /*[id(0x60010000)]*/ int RemoteBind(wchar* szName, uint lHashVal, ushort wFlags, out ITypeInfo ppTInfo, out tagDESCKIND pDescKind, out tagFUNCDESC ppFuncDesc, out tagVARDESC ppVarDesc, out ITypeComp ppTypeComp, out DWORD pDummy);
  /*[id(0x60010001)]*/ int RemoteBindType(wchar* szName, uint lHashVal, out ITypeInfo ppTInfo);
}

interface IJetESSimpleInstance : IUnknown {
  mixin(uuid("3fa7f0d1-1732-11d1-a970-00a0249a4733"));
  // static DWINGUID IID = { 0x3fa7f0d1, 0x1732, 0x11d1, 0xa9, 0x70, 0x00, 0xa0, 0x24, 0x9a, 0x47, 0x33 };
  /*[id(0x60010000)]*/ int AddDefaultContext(wchar* bstrContextProvider, IJetESParseContext pIJetESParseContext);
  /*[id(0x60010001)]*/ int GetDefaultContextByPriority(int lPriority, out wchar* pbstrContextProvider, out IJetESParseContext ppIJetESParseContext);
  /*[id(0x60010002)]*/ int Parse(uint lcid, wchar* bstrExpr, IJetESParseContext pIParseContext, out IJetESFormula ppIJetESFormula);
  /*[id(0x60010003)]*/ int RemoveDefaultContextByName(wchar* bstrContextProvider);
  /*[id(0x60010004)]*/ int SetLocalizationParams(uint lcidCollateSeq, int fHijriCalendar);
  /*[id(0x60010005)]*/ int InsertDefaultContext(int lPriority, wchar* bstrContextProvider, IJetESParseContext pIJetESParseContext);
  /*[id(0x60010006)]*/ int GetNumberOfDefaultContext(out int pcDefContext);
  /*[id(0x60010007)]*/ int RemoveDefaultContextByPriority(int lPriority);
  /*[id(0x60010008)]*/ int GetDefaultContextByName(wchar* bstrContextProvider, out int plPriority, out IJetESParseContext ppIJetESParseContext);
}

interface IJetESParseContext : IUnknown {
  mixin(uuid("3fa7f0d3-1732-11d1-a970-00a0249a4733"));
  // static DWINGUID IID = { 0x3fa7f0d3, 0x1732, 0x11d1, 0xa9, 0x70, 0x00, 0xa0, 0x24, 0x9a, 0x47, 0x33 };
  /*[id(0x60010000)]*/ int ResolveName(uint lcid, wchar* bstrName, out IUnknown ppIUnknown);
}

interface IJetESFormula : IUnknown {
  mixin(uuid("3fa7f0d2-1732-11d1-a970-00a0249a4733"));
  // static DWINGUID IID = { 0x3fa7f0d2, 0x1732, 0x11d1, 0xa9, 0x70, 0x00, 0xa0, 0x24, 0x9a, 0x47, 0x33 };
  /*[id(0x60010000)]*/ int Decode(uint lcid, out wchar* pbstrDecodedExpr, int fLocalized);
  /*[id(0x60010001)]*/ int Evaluate(out DWINVARIANT pValue);
  /*[id(0x60010002)]*/ int GetErrorInfo(out int lErrorCode, out uint ulStartPos, out uint ulLength);
  /*[id(0x60010003)]*/ int GetEvaluationType(out ushort pVarType);
  /*[id(0x60010004)]*/ int GetTreeEnumerator(out IJetESTreeEnum ppEnum);
  /*[id(0x60010005)]*/ int EstimateMaxDataLength(out uint pcbLength);
}

interface IJetESTreeEnum : IUnknown {
  mixin(uuid("822ec630-9597-11d1-9fd7-00600832c4fe"));
  // static DWINGUID IID = { 0x822ec630, 0x9597, 0x11d1, 0x9f, 0xd7, 0x00, 0x60, 0x08, 0x32, 0xc4, 0xfe };
  /*[id(0x60010000)]*/ int Next();
  /*[id(0x60010001)]*/ int Reset();
  /*[id(0x60010002)]*/ int GetTreeElemType(out uint pulType, out uint pulSubType);
  /*[id(0x60010003)]*/ int GetTreeElemVal(out DWINVARIANT pValue);
  /*[id(0x60010004)]*/ int GetRightOperand(out DWINVARIANT pValue);
  /*[id(0x60010005)]*/ int GetLeftOperand(out DWINVARIANT pValue);
}

interface IJetESPictures : IUnknown {
  mixin(uuid("52b45731-6089-11d1-b3da-00600832c573"));
  // static DWINGUID IID = { 0x52b45731, 0x6089, 0x11d1, 0xb3, 0xda, 0x00, 0x60, 0x08, 0x32, 0xc5, 0x73 };
  /*[id(0x60010000)]*/ int EnglishPictureToLocal(short* wz, out wchar* bstrOut);
  /*[id(0x60010001)]*/ int LocalPictureToEnglish(short* wz, out wchar* bstrOut);
}

// CoClasses

// Jet Expression Service
abstract class JetES {
  mixin(uuid("039ea4c0-e696-11d0-878a-00a0c91ec756"));
  // static DWINGUID CLSID = { 0x039ea4c0, 0xe696, 0x11d0, 0x87, 0x8a, 0x00, 0xa0, 0xc9, 0x1e, 0xc7, 0x56 };
  mixin Interfaces!(IJetES);
}
