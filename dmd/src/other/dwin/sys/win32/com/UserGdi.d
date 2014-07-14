
module dwin.sys.win32.com.UserGdi;
/*
private import dwin.sys.win32.com.Core;
private import dwin.sys.win32.com.Types;
private import dwin.sys.win32.com.COMInterface;
    
private import tango.sys.win32.Types;    
*/

/*
export
{
    LONG  InterlockedIncrement(LPLONG lpAddend); // com.Core
    LONG  InterlockedDecrement(LPLONG lpAddend);   //com.Core
    LONG  InterlockedExchange(LPLONG Target, LONG Value);
    LONG  InterlockedExchangeAdd(LPLONG Addend, LONG Value);
    PVOID InterlockedCompareExchange(PVOID *Destination, PVOID Exchange, PVOID Comperand);
}
*/

//COM API
//extern(Windows):

    //ole2.h
    //int RegisterDragDrop(HANDLE hwnd, IDropTarget pDropTarget);
    //int RevokeDragDrop(HANDLE hwnd);
    //int DoDragDrop(IDataObject pDataObject, IDropSource pDropSource, uint dwOKEffects, out uint pdwEffect);

    //objbase
    //int CoCreateGuid(out DWINGUID pguid);
    //int CoInitializeEx(void* pvReserved, uint dwCoInit);
    //int CoInitialize(void*);
    //void CoUninitialize();
    //int CoGetClassObject(ref DWINGUID rclsid, uint dwClsContext, void* pvReserved, ref DWINGUID riid, void** ppv);

    //oleauto
    //int RegisterActiveObject(IUnknown punk, ref DWINGUID rclsid, uint dwFlags, out uint pdwRegister);
    //int RevokeActiveObject(uint dwRegister, void* pvReserved);
    //int GetActiveObject(ref DWINGUID rclsid, void* pvReserved, out IUnknown ppunk);

    //objbase
    //int ProgIDFromCLSID(ref DWINGUID clsid, out wchar* lplpszProgID);
    //int CLSIDFromProgID(wchar* lpszProgID, out DWINGUID lpclsid);
   //void* CoTaskMemAlloc(size_t cb);
   // void* CoTaskMemRealloc(void* pv, uint cb);
   // void CoTaskMemFree(void* pv);

   //int CoGetMalloc(uint dwMemContext/* = 1*/, out IMalloc ppMalloc);


    /*
    int LoadTypeLib(wchar* szFile, out ITypeLib pptlib);

    int LoadTypeLibEx(wchar* szFile, REGKIND regkind, out ITypeLib pptlib);
    int LoadRegTypeLib(ref DWINGUID rgiud, ushort wVerMajor, ushort wVerMinor, uint lcid, out ITypeLib pptlib);
    int QueryPathOfRegTypeLib(ref DWINGUID guid, ushort wVerMajor, ushort wVerMinor, uint lcid, out wchar* lpbstrPathName);
    int RegisterTypeLib(ITypeLib ptlib, wchar* szFullPath, wchar* szHelpDir);
    int UnRegisterTypeLib(ref DWINGUID libID, ushort wVerMajor, ushort wVerMinor, uint lcid, SYSKIND syskind);
    int RegisterTypeLibForUser(ITypeLib ptlib, wchar* szFullPath, wchar* szHelpDir);
    int UnRegisterTypeLibForUser(ref DWINGUID libID, ushort wVerMajor, ushort wVerMinor, uint lcid, SYSKIND syskind);
    //int CreateTypeLib(SYSKIND syskind, wchar* szFile, out ICreateTypeLib ppctlib);
    //int CreateTypeLib2(SYSKIND syskind, wchar* szFile, out ICreateTypeLib2 ppctlib);
    */
    /*
    wchar* SysAllocString(wchar* psz);
    int SysReAllocString(ref wchar* pbstr, wchar* psz);
    wchar* SysAllocStringLen(wchar* strIn, uint ui);
    int SysReAllocStringLen(ref wchar* pbstr, wchar* psz, uint len);
    void SysFreeString(wchar* bstring);
    uint SysStringLen(wchar* bstring);
    uint SysStringByteLen(wchar* bstring);
    wchar* SysAllocStringByteLen(wchar* psz, uint len);
    */
    
    //oleauto
    //void VariantInit(DWINVARIANT* pvarg);
    //int VariantClear(DWINVARIANT* pvarg);
    //int VariantCopy(DWINVARIANT* pvargDest, in DWINVARIANT* pvargSrc);
    //int VariantChangeType(DWINVARIANT* pvargDest, in DWINVARIANT* pvarSrc, ushort wFlags, VARTYPE vt);
    //int VariantChangeTypeEx(DWINVARIANT* pvargDest, in DWINVARIANT* pvarSrc, uint lcid, ushort wFlags, VARTYPE vt);

    /*
    alias DllImport!("propsys.dll", "PropVariantCopy",
      int function(PROPVARIANT* pvarDest, in PROPVARIANT* pvarSrc))
      PropVariantCopy;
    */

    /*
    alias DllImport!("propsys.dll", "PropVariantToBSTR",
      int function(PROPVARIANT* propvar, wchar** pbstrOut))
      PropVariantToBSTR;
    */


    /*

    int SafeArrayAllocDescriptor(uint cDims, out SAFEARRAY* ppsaOut);
    int SafeArrayAllocDescriptorEx(VARTYPE vt, uint cDims, out SAFEARRAY* ppsaOut);
    int SafeArrayAllocData(SAFEARRAY* psa);
    SAFEARRAY* SafeArrayCreate(VARTYPE vt, uint cDims, SAFEARRAYBOUND* rgsabound);
    SAFEARRAY* SafeArrayCreateEx(VARTYPE vt, uint cDims, SAFEARRAYBOUND* rgsabound, void* pvExtra);
    int SafeArrayCopyData(SAFEARRAY* psaSource, SAFEARRAY* psaTarget);
    int SafeArrayDestroyDescriptor(SAFEARRAY* psa);
    int SafeArrayDestroyData(SAFEARRAY* psa);
    int SafeArrayDestroy(SAFEARRAY* psa);
    int SafeArrayRedim(SAFEARRAY* psa, SAFEARRAYBOUND* psaboundNew);
    uint SafeArrayGetDim(SAFEARRAY* psa);
    uint SafeArrayGetElemsize(SAFEARRAY* psa);
    int SafeArrayGetUBound(SAFEARRAY* psa, uint cDim, out int plUbound);
    int SafeArrayGetLBound(SAFEARRAY* psa, uint cDim, out int plLbound);
    int SafeArrayLock(SAFEARRAY* psa);
    int SafeArrayUnlock(SAFEARRAY* psa);
    int SafeArrayAccessData(SAFEARRAY* psa, void** ppvData);
    int SafeArrayUnaccessData(SAFEARRAY* psa);
    int SafeArrayGetElement(SAFEARRAY* psa, int* rgIndices, void* pv);
    int SafeArrayPutElement(SAFEARRAY* psa, int* rgIndices, void* pv);
    int SafeArrayCopy(SAFEARRAY* psa, out SAFEARRAY* ppsaOut);
    int SafeArrayPtrOfIndex(SAFEARRAY* psa, int* rgIndices, void** ppvData);
    int SafeArraySetRecordInfo(SAFEARRAY* psa, IRecordInfo prinfo);
    int SafeArrayGetRecordInfo(SAFEARRAY* psa, out IRecordInfo prinfo);
    int SafeArraySetIID(SAFEARRAY* psa, ref DWINGUID guid);
    int SafeArrayGetIID(SAFEARRAY* psa, out DWINGUID pguid);
    int SafeArrayGetVartype(SAFEARRAY* psa, out VARTYPE pvt);
    SAFEARRAY* SafeArrayCreateVector(VARTYPE vt, int lLbound, uint cElements);
    SAFEARRAY* SafeArrayCreateVectorEx(VARTYPE vt, int lLbound, uint cElements, void* pvExtra);
    */
    
    //oleauto
    /*
int VarDecFromUI4(uint ulIn, out DECIMAL pdecOut);
int VarDecFromI4(int lIn, out DECIMAL pdecOut);
int VarDecFromUI8(ulong ui64In, out DECIMAL pdecOut);
int VarDecFromI8(long i64In, out DECIMAL pdecOut);
int VarDecFromR4(float dlbIn, out DECIMAL pdecOut);
int VarDecFromR8(double dlbIn, out DECIMAL pdecOut);
int VarDecFromStr(in wchar* StrIn, uint lcid, uint dwFlags, out DECIMAL pdecOut);
int VarBstrFromDec(in DECIMAL* pdecIn, uint lcid, uint dwFlags, out wchar* pbstrOut);
int VarUI4FromDec(in DECIMAL* pdecIn, out uint pulOut);
int VarI4FromDec(in DECIMAL* pdecIn, out int plOut);
int VarUI8FromDec(in DECIMAL* pdecIn, out ulong pui64Out);
int VarI8FromDec(in DECIMAL* pdecIn, out long pi64Out);
int VarR8FromDec(in DECIMAL* pdecIn, out double pdblOut);
*/

/*
int VarDecAdd(DECIMAL* pdecLeft, DECIMAL* pdecRight, DECIMAL* pdecResult);
int VarDecSub(DECIMAL* pdecLeft, DECIMAL* pdecRight, DECIMAL* pdecResult);
int VarDecMul(DECIMAL* pdecLeft, DECIMAL* pdecRight, DECIMAL* pdecResult);
int VarDecDiv(DECIMAL* pdecLeft, DECIMAL* pdecRight, DECIMAL* pdecResult);
int VarDecRound(DECIMAL* pdecIn, int cDecimals, DECIMAL* pdecResult);
int VarDecAbs(DECIMAL* pdecIn, DECIMAL* pdecResult);
int VarDecFix(DECIMAL* pdecIn, DECIMAL* pdecResult);
int VarDecInt(DECIMAL* pdecIn, DECIMAL* pdecResult);
int VarDecNeg(DECIMAL* pdecIn, DECIMAL* pdecResult);
int VarDecCmp(DECIMAL* pdecLeft, DECIMAL* pdecRight);
*/
    //ole2
    //int CreateStreamOnHGlobal(HANDLE hGlobal, int fDeleteOnRelease, out IStream ppstm);

    //olectl
    //int OleCreatePictureIndirect(PICTDESC* lpPictDesc, ref DWINGUID riid, int fOwn, void** lplpvObj);
    //int OleLoadPicture(IStream lpstream, int lSize, int fRunmode, ref DWINGUID riid, void** lplpvObj);
    //above from juno.com.core

    //bellow added by yidabu
    //int PropVariantCopy(PROPVARIANT* pvarDest, in PROPVARIANT* pvarSrc);//ole32.lib origin is dllimport version, by d-programming-language-china.org 20071005
    //int PropVariantToBSTR(PROPVARIANT* propvar, wchar** pbstrOut);
/*
    alias DllImport!("propsys.dll", "PropVariantCopy",
  int function(PROPVARIANT* pvarDest, in PROPVARIANT* pvarSrc))
  PropVariantCopy;

alias DllImport!("propsys.dll", "PropVariantToBSTR",
  int function(PROPVARIANT* propvar, wchar** pbstrOut))
  PropVariantToBSTR;
  */

//    int CreateBindCtx(uint, ref IBindCtx);
    //urlmon
    //int CreateURLMoniker(IMoniker* pMkCtx, wchar* szURL, ref IMoniker ppmk);


