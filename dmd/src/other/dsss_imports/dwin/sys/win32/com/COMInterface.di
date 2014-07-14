// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2009  (dyuyan  gmail at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: May 2009

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/


module dwin.sys.win32.com.COMInterface;


//private import dwin.sys.win32.com.Types;    
//private import dwin.sys.win32.com.Core;


    
//private import tango.sys.win32.Types;        


//pragma (lib, "ole32.lib");
//pragma (lib, "oleaut32.lib");
//pragma(lib,"Urlmon.lib");

//extern(Windows):

    //DWINGUID IID_NULL = { 0x00000000, 0x0000, 0x0000, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };

    //Core Interface moved into Core.d
    /*
    interface IUnknown {
      mixin(uuid("00000000-0000-0000-c000-000000000046"));            
      //static DWINGUID IID = { 0x00000000, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int QueryInterface(ref DWINGUID riid, void** ppvObject);
      uint AddRef();
      uint Release();
    }
    
    interface IDispatch : IUnknown {
      mixin(uuid("00020400-0000-0000-c000-000000000046"));        
      //static DWINGUID IID = { 0x00020400, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int GetTypeInfoCount(out uint pctinfo);
      int GetTypeInfo(uint iTInfo, uint lcid, out ITypeInfo ppTInfo);
      int GetIDsOfNames(ref DWINGUID riid, wchar** rgszNames, uint cNames, uint lcid, int* rgDispId);
      int Invoke(int dispIdMember, ref DWINGUID riid, uint lcid, ushort wFlags, DISPPARAMS* pDispParams, DWINVARIANT* pVarResult, EXCEPINFO* pExcepInfo, uint* puArgErr);
    }    
    */

    //unknown
    /*
    interface IClassFactory : IUnknown {
      mixin(uuid("00000001-0000-0000-c000-000000000046"));
      // static DWINGUID IID = { 0x00000001, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int CreateInstance(IUnknown pUnkOuter, ref DWINGUID riid, void** ppvObject);
      int LockServer(int fLock);
    }
    */

    //objidl
    /*
    interface IMalloc : IUnknown {
      // static DWINGUID IID = { 0x00000002, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      mixin(uuid("00000002-0000-0000-c000-000000000046"));
      void* Alloc(size_t cb);
      void* Realloc(void* pv, uint cb);
      void Free(void* pv);
      uint GetSize(void* pv);
      int DidAlloc(void* pv);
      void HeapMinimize();
    }
    */
    
    // moved into objidl
    /*
    interface IMarshal : IUnknown {
      mixin(uuid("00000003-0000-0000-c000-000000000046"));
      int GetUnmarshalClass(ref DWINGUID riid, void* pv, uint dwDestContext, void* pvDestContext, uint mshlflags, out DWINGUID pCid);
      int GetMarshalSizeMax(ref DWINGUID riid, void* pv, uint dwDestContext, void* pvDestContext, uint mshlflags, out uint pSize);
      int MarshalInterface(IStream pStm, ref DWINGUID riid, void* pv, uint dwDestContext, void* pvDestContext, uint mshlflags);
      int UnmarshalInterface(IStream pStm, ref DWINGUID riid, void** ppv);
      int ReleaseMarshalData(IStream pStm);
      int DisconnectObject(uint dwReserved);
    }
    */
    
    /*
    interface IStorage : IUnknown {
      // static DWINGUID IID = { 0x0000000b, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      mixin(uuid("0000000b-0000-0000-c000-000000000046"));
      int CreateStream(wchar* pwcsName, uint grfMode, uint reserved1, uint reserved2, out IStream ppstm);
      int OpenStream(wchar* pwcsName, void* reserved1, uint grfMode, uint reserved2, out IStream ppstm);
      int CreateStorage(wchar* pwcsName, uint grfMode, uint reserved1, uint reserved2, out IStorage ppstg);
      int OpenStorage(wchar* pwcsName, IStorage psrgPriority, uint grfMode, wchar** snbExclude, uint reserved, out IStorage ppstg);
      int CopyTo(uint ciidExclude, DWINGUID* rgiidExclude, wchar** snbExclude, IStorage pstgDest);
      int MoveElementTo(wchar* pwcsName, IStorage pstgDest, wchar* pwcsNewName, uint grfFlags);
      int Commit(uint grfCommitFlags);
      int Revert();
      int EnumElements(uint reserved1, void* reserved2, uint reserved3, out IEnumSTATSTG ppenum);
      int DestroyElement(wchar* pwcsName);
      int RenameElement(wchar* pwcsOldName, wchar* pwcsNewName);
      int SetElementTimes(wchar* pwcsName, ref FILETIME pctime, ref FILETIME patime, ref FILETIME pmtime);
      int SetClass(ref DWINGUID clsid);
      int SetStateBits(uint grfStateBits, uint grfMask);
      int Stat(out STATSTG pstatstg, uint grfStatFlag);
    }
    */
    
    /*
    interface ISequentialStream : IUnknown {
      // static DWINGUID IID = { 0x0c733a30, 0x2a1c, 0x11ce, 0xad, 0xe5, 0x00, 0xaa, 0x00, 0x44, 0x77, 0x3d };
      mixin(uuid("0c733a30-2a1c-11ce-ade5-00aa0044773d"));
      int Read(void* pv, uint cb, ref uint pcbRead);
      int Write(void* pv, uint cb, ref uint pcbWritten);
    }
    */
    
    /*
    interface IStream : ISequentialStream {
      // static DWINGUID IID = { 0x0000000C, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      mixin(uuid("0000000c-0000-0000-c000-000000000046"));
      int Seek(long dlibMove, uint dwOrigin, ref ulong plibNewPosition);
      int SetSize(ulong libNewSize);
      int CopyTo(IStream stm, ulong cb, ref ulong pcbRead, ref ulong pcbWritten);
      int Commit(uint hrfCommitFlags);
      int Revert();
      int LockRegion(ulong libOffset, ulong cb, uint dwLockType);
      int UnlockRegion(ulong libOffset, ulong cb, uint dwLockType);
      int Stat(out STATSTG pstatstg, uint gfrStatFlag);
      int Clone(out IStream ppstm);
    }
    */

    /*
    interface IEnumSTATSTG : IUnknown {
      mixin(uuid("0000000d-0000-0000-c000-000000000046"));
      // static DWINGUID IID = { 0x0000000d, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int Next(uint celt, STATSTG* rgelt, out uint pceltFetched);
      int Skip(uint celt);
      int Reset();
      int Clone(out IEnumSTATSTG ppenum);
    }
    */

    //objidl
    /*
    interface IBindCtx : IUnknown {
      mixin(uuid("0000000e-0000-0000-c000-000000000046"));
      // static DWINGUID IID = { 0x0000000e, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int RegisterObjectBound(IUnknown punk);
      int RevokeObjectBound(IUnknown punk);
      int ReleaseBoundObjects();
      int SetBindOptions(ref BIND_OPTS pbindopts);
      int GetRunningObjectTable(out IRunningObjectTable pprot);
      int RegisterObjectParam(wchar* pszKey, IUnknown punk);
      int GetObjectParam(wchar* pszKey, out IUnknown ppunk);
      int EnumObjectParam(out IEnumString ppenum);
      int RemoveObjectParam(wchar* pszKey);
    }
    */
    

    //objidl
    /*
    interface IRunningObjectTable : IUnknown {
      mixin(uuid("00000010-0000-0000-c000-000000000046"));
      // static DWINGUID IID = { 0x00000010, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int Register(uint grfFlags, IUnknown punkObject, IMoniker pmkObjectName, out uint pdwRegister);
      int Revoke(uint dwRegister);
      int IsRunning(IMoniker pmkObjectName);
      int GetObject(IMoniker pmkObjectName, out IUnknown ppunkObject);
      int NoteChangeTime(uint dwRegister, ref FILETIME pfiletime);
      int GetTimeOfLastChange(IMoniker pmkObjectName, out FILETIME pfiletime);
      int EnumRunning(out IEnumMoniker ppenumMoniker);
    }
    */

    // moved into oaidl
    /*
    interface ITypeMarshal : IUnknown {
      mixin(uuid("0000002D-0000-0000-C000-000000000046"));        
      // static DWINGUID IID = { 0x0000002D, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };        
      int Size(void* pvType, uint dwDestContext, void* pvDestContext, out uint pSize);
      int Marshal(void* pvType, uint dwDestContext, void* pvDestContext, uint cbBufferLength, ubyte* pBuffer, out uint pcbWritten);
      int Unmarshal(void* pvType, uint dwFlags, uint cbBufferLength, ubyte* pBuffer, out uint pcbRead);
      int Free(void* pvType);
    }
    */
    
    //oaidl
    /*
    interface ITypeFactory : IUnknown {
      mixin(uuid("0000002E-0000-0000-C000-000000000046"));
      // static DWINGUID IID = { 0x0000002E, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int CreateFromTypeInfo(ITypeInfo pTypeInfo, ref DWINGUID riid, out IUnknown ppv);
    }
    */
    
    /*
    interface IRecordInfo : IUnknown {
      mixin(uuid("0000002f-0000-0000-c000-000000000046"));        
      // static DWINGUID IID = { 0x0000002F, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int RecordInit(void* pvNew);
      int RecordClear(void* pvExisting);
      int RecordCopy(void* pvExisting, void* pvNew);
      int GetGuid(out DWINGUID pguid);
      int GetName(out wchar* pbstrName);
      int GetSize(out uint pcbSize);
      int GetTypeInfo(out ITypeInfo ppTypeInfo);
      int GetField(void* pvData, wchar* szFieldName, out DWINVARIANT pvarField);
      int GetFieldNoCopy(void* pvData, wchar* szFieldName, out DWINVARIANT pvarField, void** ppvDataCArray);
      int PutField(uint wFlags, void* pvData, wchar* szFieldName, ref DWINVARIANT pvarField);
      int PutFieldNoCopy(uint wFlags, void* pvData, wchar* szFieldName, ref DWINVARIANT pvarField);
      int GetFieldNames(out uint pcNames, wchar** rgBstrNames);
      bool IsMatchingType(IRecordInfo pRecordInfo);
      void* RecordCreate();
      int RecordCreateCopy(void* pvSource, out void* ppvDest);
      int RecordDestroy(void* pvRecord);
    }
    */
      
    // moved into oboidl
    /*
    interface IEnumUnknown : IUnknown {
      mixin(uuid("00000100-0000-0000-c000-000000000046"));
      // static DWINGUID IID = { 0x00000100, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int Next(uint celt, IUnknown* rgelt, out uint pceltFetched);
      int Skip(uint celt);
      int Reset();
      int Clone(out IEnumUnknown ppenum);
    }
    */
    
    //objidl
    /*
    interface IEnumString : IUnknown {
      mixin(uuid("00000101-0000-0000-c000-000000000046"));
      // static DWINGUID IID = { 0x00000101, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int Next(uint celt, wchar** rgelt, out uint pceltFetched);
      int Skip(uint celt);
      int Reset();
      int Clone(out IEnumString ppenum);
    }
    */

    //objidl
    /*
    interface IEnumMoniker : IUnknown {
      mixin(uuid("00000102-0000-0000-c000-000000000046"));
      // static DWINGUID IID = { 0x00000102, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int Next(uint celt, IEnumMoniker* rgelt, out uint pceltFetched);
      int Skip(uint celt);
      int Reset();
      int Clone(out IEnumMoniker ppenum);
    }
    */

 
    //objidl
    /*
    interface IEnumFORMATETC : IUnknown {
      mixin(uuid("00000103-0000-0000-c000-000000000046"));        
      // static DWINGUID IID = { 0x00000103, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int Next(uint celt, FORMATETC* rgelt, out uint pceltFetched);
      int Skip(uint celt);
      int Reset();
      int Clone(out IEnumFORMATETC ppenum);
    }
    */


    //oleidl
    /*
    interface IEnumOLEVERB : IUnknown {
      mixin(uuid("00000104-0000-0000-c000-000000000046"));
      // static DWINGUID IID = { 0x00000104, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int Next(uint celt, OLEVERB* rgelt, out uint pceltFetched);
      int Skip(uint celt);
      int Reset();
      int Clone(out IEnumOLEVERB ppenum);
    }
    */


    //objidl
    /*
    interface IEnumSTATDATA : IUnknown {
      mixin(uuid("00000105-0000-0000-c000-000000000046"));
      // static DWINGUID IID = { 0x00000105, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int Next(uint celt, STATDATA* rgelt, out uint pceltFetched);
      int Skip(uint celt);
      int Reset();
      int Clone(out IEnumSTATDATA ppenum);
    }
    */

    //objidl
    /*
    interface IPersist : IUnknown {
      mixin(uuid("0000010c-0000-0000-c000-000000000046"));
      // static DWINGUID IID = { 0x0000010c, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int GetClassID(out DWINGUID pClassID);
    }
    */
    
    
    //objidl
    /*
    interface IPersistStream : IPersist {
      mixin(uuid("00000109-0000-0000-c000-000000000046"));
      // static DWINGUID IID = { 0x00000109, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int IsDirty();
      int Load(IStream pStm);
      int Save(IStream pStm, int fClearDirty);
      int GetSizeMax(out ulong pcbSize);
    }
    */

    //objidl
    /*
    interface IDataObject : IUnknown {
      mixin(uuid("0000010e-0000-0000-c000-000000000046"));        
      // static DWINGUID IID = { 0x0000010e, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int GetData(ref FORMATETC pformatetcIn, out STGMEDIUM pmedium);
      int GetDataHere(ref FORMATETC pformatetc, ref STGMEDIUM pmedium);
      int QueryGetData(ref FORMATETC pformatetc);
      int GetCanonicalFormatEtc(ref FORMATETC pformatetcIn, out FORMATETC pformatetcOut);
      int SetData(ref FORMATETC pformatetc, ref STGMEDIUM pmedium, bool fRelease);
      int EnumFormatEtc(uint dwDirection, out IEnumFORMATETC ppenumFormatEtc);
      int DAdvise(ref FORMATETC pformatetc, uint advf, IAdviseSink pAdvSink, out uint pdwConnection);
      int DUnadvise(uint dwConnection);
      int EnumDAdvise(out IEnumSTATDATA ppenumAdvise);
    }
    */

    //objidl
    /*
    interface IAdviseSink : IUnknown {
      mixin(uuid("0000010f-0000-0000-c000-000000000046"));    
      // static DWINGUID IID = { 0x0000010f, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int OnDataChange(ref FORMATETC pFormatetc, ref STGMEDIUM pStgmed);
      int OnViewChange(uint dwAspect, int lindex);
      int OnRename(IMoniker pmk);
      int OnSave();
      int OnClose();
    }
    */

    //oleidl
    /*
    interface IDropSource : IUnknown {
      mixin(uuid("00000121-0000-0000-c000-000000000046"));        
      // static DWINGUID IID = { 0x00000121, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int QueryContinueDrag(int fEscapePressed, uint grfKeyState);
      int GiveFeedback(uint dwEffect);
    }

    interface IDropTarget : IUnknown {
      mixin(uuid("00000122-0000-0000-c000-000000000046"));        
      // static DWINGUID IID = { 0x00000122, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int DragEnter(IDataObject pDataObj, uint grfKeyState, POINT pt, ref uint pdwEffect);
      int DragOver(uint grfKeyState, POINT pt, ref uint pdwEffect);
      int DragLeave();
      int Drop(IDataObject pDataObj, uint grfKeyState, POINT pt, ref uint pdwEffect);
    }
    */
    
    /*
    interface ITypeInfo : IUnknown {
      mixin(uuid("00020401-0000-0000-c000-000000000046"));        
      // static DWINGUID IID = { 0x00020401, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int GetTypeAttr(out TYPEATTR* ppTypeAttr);
      int GetTypeComp(out ITypeComp ppTComp);
      int GetFuncDesc(uint index, out FUNCDESC* ppFuncDesc);
      int GetVarDesc(uint index, out VARDESC* ppVarDesc);
      int GetNames(int memid, wchar** rgBstrNames, uint cMaxNames, out uint pcNames);
      int GetRefTypeOfImplType(uint index, out uint pRefType);
      int GetImplTypeFlags(uint index, out int pImplTypeFlags);
      int GetIDsOfNames(wchar** rgszNames, uint cNames, int* pMemId);
      int Invoke(void* pvInstance, int memid, ushort wFlags, DISPPARAMS* pDispParams, DWINVARIANT* pVarResult, EXCEPINFO* pExcepInfo, uint* puArgErr);
      int GetDocumentation(int memid, wchar** pBstrName, wchar** pBstrDocString, uint* pdwHelpContext, wchar** pBstrHelpFile);
      int GetDllEntry(int memid, INVOKEKIND invKind, wchar** pBstrDllName, wchar** pBstrName, ushort* pwOrdinal);
      int GetRefTypeInfo(uint hRefType, out ITypeInfo ppTInfo);
      int AddressOfMember(int memid, INVOKEKIND invKind, void** ppv);
      int CreateInstance(IUnknown pUnkOuter, ref DWINGUID riid, void** ppvObj);
      int GetMops(int memid, wchar** pBstrMops);
      int GetContainingTypeLib(out ITypeLib ppTLib, out uint pIndex);
      int ReleaseTypeAttr(TYPEATTR* pTypeAttr);
      int ReleaseFuncDesc(FUNCDESC* pFuncDesc);
      int ReleaseVarDesc(VARDESC* pVarDesc);
    }
    */

    /+
    interface ITypeLib : IUnknown {
      mixin(uuid("00020402-0000-0000-c000-000000000046"));        
      // static DWINGUID IID = { 0x00020402, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      /**
       * Returns the number of type descriptions in the type library.
       */
      uint GetTypeInfoCount();
      /**
       * Retrieves the specified type description in the library.
       * Params:
       *   index = The _index of the ITypeInfo interface to return.
       *   ppTInfo = When the method returns, the ITypeInfo describing the type referenced by index.
       */
      int GetTypeInfo(uint index, out ITypeInfo ppTInfo);
      /**
       * Retrieves the type of a type description.
       * Params:
       *   index = The _index of the type desciption in the library.
       *   pTKind = When the method returns, the TYPEKIND enumeration for the type description.
       */
      int GetTypeInfoType(uint index, out TYPEKIND pTKind);
      /**
       * Retrieves the type description that corresponds to the specified DWINGUID.
       */
      int GetTypeInfoOfGuid(ref DWINGUID guid, out ITypeInfo ppTInfo);
      int GetLibAttr(out TLIBATTR* ppTLibAttr);
      int GetTypeComp(out ITypeComp ppTComp);
      int GetDocumentation(int index, wchar** pBstrName, wchar** pBstrDocString, uint* pBstrHelpContext, wchar** pBstrHelpFile);
      int IsName(wchar* szNameBuf, uint lHashVal, out bool pfName);
      int FindName(wchar* szNameBuf, uint lHashVal, ITypeInfo* ppTInfo, int* rgMemId, ref ushort pcFound);
      int ReleaseTLibAttr(TLIBATTR* pTLibAttr);
    }
    +/
    
    //oaidl
    /*
    interface ITypeComp : IUnknown {
      mixin(uuid("00020403-0000-0000-c000-000000000046"));        
      // static DWINGUID IID = { 0x00020403, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int Bind(wchar* szName, uint lHashVal, ushort wFlags, out ITypeInfo ppTInfo, out DESCKIND pDescKind, out BINDPTR pBindPtr);
      int BindType(wchar* szName, uint lHashVal, out ITypeInfo ppTInfo, out ITypeComp ppTComp);
    }
    */
        
    //oaidl
    /*
    interface IEnumVARIANT : IUnknown {
      // static DWINGUID IID = { 0x00020404, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int Next(uint celt, DWINVARIANT* rgVar, out uint pCeltFetched);
      int Skip(uint celt);
      int Reset();
      int Clone(out IEnumVARIANT ppEnum);
    }
    */

// oaidl
/*
interface ICreateTypeInfo : IUnknown {
  mixin(uuid("00020405-0000-0000-c000-000000000046"));
  int SetGuid(ref DWINGUID guid);
  int SetTypeFlags(uint uTypeFlags);
  int SetDocString(wchar* szStrDoc);
  int SetHelpContext(uint dwHelpContext);
  int SetVersion(ushort wMajorVerNum, ushort wMinorVerNum);
  int AddRefTypeInfo(ITypeInfo pTInfo, ref uint phRefType);
  int AddFuncDesc(uint index, FUNCDESC* pFuncDesc);
  int AddImplType(uint index, uint hRefType);
  int SetTypeImplFlags(uint index, int implTypeFlags);
  int SetAlignment(ushort cbAlignment);
  int SetSchema(wchar* pStrSchema);
  int AddVarDesc(uint index, VARDESC* pVarDesc);
  int SetFuncAndParamNames(uint index, wchar** rgszNames, uint cNames);
  int SetVarName(uint index, wchar* szName);
  int SetTypeDescAlias(TYPEDESC* pTDescAlias);
  int DefineFuncAsDllEntry(uint index, wchar* szDllName, wchar* szProcName);
  int SetFuncDocString(uint index, wchar* szDocString);
  int SetVarDocString(uint index, wchar* szDocString);
  int SetFuncHelpContext(uint index, uint dwHelpContext);
  int SetVarHelpContext(uint index, uint dwHelpContext);
  int SetMops(uint index, wchar* bstrMops);
  int SetTypeIdldesc(IDLDESC* pIdlDesc);
  int LayOut();
}
*/

/*
interface ICreateTypeLib : IUnknown {
  mixin(uuid("00020406-0000-0000-c000-000000000046"));
  int CreateTypeInfo(wchar* szName, TYPEKIND tkind, out ICreateTypeInfo ppCTInfo);
  int SetName(wchar* szName);
  int SetVersion(ushort wMajorVerNum, ushort wMinorVerNum);
  int SetGuid(ref DWINGUID guid);
  int SetDocString(wchar* szDoc);
  int SetHelpFileName(wchar* szHelpFileName);
  int SetHelpContext(uint dwHelpContext);
  int SetLcid(uint lcid);
  int SetLibFlags(uint uLibFlags);
  int SaveAllChanges();
}
*/

//oaidl
/*
interface ICreateTypeInfo2 : ICreateTypeInfo {
  mixin(uuid("0002040e-0000-0000-c000-000000000046"));
  int DeleteFuncDesc(uint index);
  int DeleteFuncDescByMemId(int memid, INVOKEKIND invKind);
  int DeleteVarDesc(uint index);
  int DeleteVarDescByMemId(int memid);
  int DeleteImplType(uint index);
  int SetCustData(ref DWINGUID guid, ref DWINVARIANT pVarVal);
  int SetFuncCustData(uint index, ref DWINGUID guid, ref DWINVARIANT pVarVal);
  int SetParamCustData(uint indexFunc, uint indexParam, ref DWINGUID guid, ref DWINVARIANT pVarVal);
  int SetVarCustData(uint index, ref DWINGUID guid, ref DWINVARIANT pVarVal);
  int SetImplTypeCustData(uint index, ref DWINGUID guid, ref DWINVARIANT pVarVal);
  int SetHelpStringContext(uint dwHelpStringContext);
  int SetFuncHelpStringContext(uint index, uint dwHelpStringContext);
  int SetVarHelpStringContext(uint index, uint dwHelpStringContext);
  int Invalidate();
}
*/

//Moved into oaidl
/*
interface ICreateTypeLib2 : ICreateTypeLib {
  mixin(uuid("0002040f-0000-0000-c000-000000000046"));
  int DeleteTypeInfo(wchar* szName);
  int SetCustData(ref DWINGUID guid, ref DWINVARIANT pVarVal);
  int SetHelpStringContext(uint dwHelpStringContext);
  int SetHelpStringDll(wchar* szFileName);
}
*/

    //oaidl
    /*
    interface ITypeChangeEvents : IUnknown {
      mixin(uuid("00020410-0000-0000-c000-000000000046"));        
      // static DWINGUID IID = { 0x00020410, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int RequestTypeChange(CHANGEKIND changeKind, ITypeInfo pTInfoBefore, wchar* pStrName, out int pfCancel);
      int AfterTypeChange(CHANGEKIND changeKind, ITypeInfo pTInfoAfter, wchar* pStrName);
    }
    */

    //oaidl
    /*
    interface ITypeLib2 : ITypeLib {
      mixin(uuid("00020411-0000-0000-c000-000000000046"));        
      // static DWINGUID IID = { 0x00020411, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int GetCustData(ref DWINGUID guid, out DWINVARIANT pVarVal);
      int GetLibStatistics(out uint pcUniqueNames, out uint pcchUniqueNames);
      int GetDocumentation2(int index, uint lcid, wchar** pBstrHelpString, uint* pdwHelpContext, wchar** pBstrHelpStringDll);
      int GetAllCustData(out CUSTDATA pCustData);
    }
    */

    //oaidl
    /*
    interface ITypeInfo2 : ITypeInfo {
      mixin(uuid("00020412-0000-0000-c000-000000000046"));        
      // static DWINGUID IID = { 0x00020412, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int GetTypeKind(out TYPEKIND pTypeKind);
      int GetTypeFlags(out uint pTypeFlags);
      int GetFuncIndexOfMemId(int memid, INVOKEKIND invKind, out uint pFuncIndex);
      int GetVarIndexOfMemId(int memid, out uint pVarIndex);
      int GetCustData(ref DWINGUID guid, out DWINVARIANT pVarVal);
      int GetFuncCustData(uint index, ref DWINGUID guid, out DWINVARIANT pVarVal);
      int GetParamCustData(uint indexFunc, uint indexParam, ref DWINGUID guid, out DWINVARIANT pVarVal);
      int GetVarCustData(uint index, ref DWINGUID guid, out DWINVARIANT pVarVal);
      int GetImplTypeCustData(uint index, ref DWINGUID guid, out DWINVARIANT pVarVal);
      int GetDocumentation2(int memid, uint lcid, wchar** pBstrHelpString, uint* pdwHelpContext, wchar** pBstrHelpStringDll);
      int GetAllCustData(out CUSTDATA pCustData);
      int GetAllFuncCustData(uint index, out CUSTDATA pCustData);
      int GetAllParamCustData(uint indexFunc, uint indexParam, out CUSTDATA pCustData);
      int GetAllVarCustData(uint index, out CUSTDATA pCustData);
      int GetAllTypeImplCustData(uint index, out CUSTDATA pCustData);
    }
    */
    
    //comcat
    /*
    interface ICatRegister : IUnknown {
      mixin(uuid("0002E012-0000-0000-C000-000000000046"));
      // static DWINGUID IID = { 0x0002E012, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int RegisterCategories(uint cCategories, CATEGORYINFO* rgCategoryInfo);
      int UnRegisterCategories(uint cCategories, DWINGUID* rgcatid);
      int RegisterClassImplCategories(ref DWINGUID rclsid, uint cCategories, DWINGUID* rgcatid);
      int UnRegisterClassImplCategories(ref DWINGUID rclsid, uint cCategories, DWINGUID* rgcatid);
      int RegisterClassReqCategories(ref DWINGUID rclsid, uint cCategories, DWINGUID* rgcatid);
      int UnRegisterClassReqCategories(ref DWINGUID rclsid, uint cCategories, DWINGUID* rgcatid);
    }
    */
    
    //objidl
    /*
    interface IConnectionPointContainer : IUnknown {
      mixin(uuid("b196b284-bab4-101a-b69c-00aa00341d07"));        
      // static DWINGUID IID = { 0xB196B284, 0xBAB4, 0x101A, 0xB6, 0x9C, 0x00, 0xAA, 0x00, 0x34, 0x1D, 0x07 };
      int EnumConnectionPoints(out IEnumConnectionPoints ppEnum);
      int FindConnectionPoint(ref DWINGUID riid, out IConnectionPoint ppCP);
    }
    */
    
    //objidl
    /*
    interface IEnumConnectionPoints : IUnknown {
      mixin(uuid("b196b285-bab4-101a-b69c-00aa00341d07"));        
      // static DWINGUID IID = { 0xB196B285, 0xBAB4, 0x101A, 0xB6, 0x9C, 0x00, 0xAA, 0x00, 0x34, 0x1D, 0x07 };
      int Next(uint celt, IConnectionPoint* ppCP, out uint pceltFetched);
      int Skip(uint celt);
      int Reset();
      int Clone(out IEnumConnectionPoints ppenum);
    }
    */

    //oaidl
    /*
    interface IErrorInfo : IUnknown {
      mixin(uuid("1cf2b120-547d-101b-8e65-08002b2bd119"));          
      // static DWINGUID IID = { 0x1CF2B120, 0x547D, 0x101B, 0x8E, 0x65, 0x08, 0x00, 0x2B, 0x2B, 0xD1, 0x19 };
      int GetGUID(out DWINGUID pGuid);
      int GetSource(out wchar* pBstrSource);
      int GetDescription(out wchar* pBstrDescription);
      int GetHelpFile(out wchar* pBstrHelpFile);
      int GetHelpContext(out uint pdwHelpContext);
    }
    */

    //objidl
    /*
    interface IConnectionPoint : IUnknown {
      mixin(uuid("b196b286-bab4-101a-b69c-00aa00341d07"));        
      // static DWINGUID IID = { 0xB196B286, 0xBAB4, 0x101A, 0xB6, 0x9C, 0x00, 0xAA, 0x00, 0x34, 0x1D, 0x07 };
      int GetConnectionInterface(out DWINGUID pIID);
      int GetConnectionPointContainer(out IConnectionPointContainer ppCPC);
      int Advise(IUnknown pUnkSink, out uint pdwCookie);
      int Unadvise(uint dwCookie);
      int EnumConnections(out IEnumConnections ppenum);
    }
    */


    //objidl
    /*
    interface IEnumConnections : IUnknown {
      mixin(uuid("b196b287-bab4-101a-b69c-00aa00341d07"));        
      // static DWINGUID IID = { 0xB196B287, 0xBAB4, 0x101A, 0xB6, 0x9C, 0x00, 0xAA, 0x00, 0x34, 0x1D, 0x07 };
      int Next(uint celt, CONNECTDATA* rgcd, out uint pceltFetched);
      int Skip(uint celt);
      int Reset();
      int Clone(out IEnumConnections ppenum);
    }
    */

    //ocidl
    /*
    interface IClassFactory2 : IClassFactory {
      mixin(uuid("b196b28f-bab4-101a-b69c-00aa00341d07"));        
      // static DWINGUID IID = { 0xB196B28F, 0xBAB4, 0x101A, 0xB6, 0x9C, 0x00, 0xAA, 0x00, 0x34, 0x1D, 0x07 };
      int GetLicInfo(out LICINFO pLicInfo);
      int RequestLicKey(uint dwReserved, out wchar* pBstrKey);
      int CreateInstanceLic(IUnknown pUnkOuter, IUnknown pUnkReserved, ref DWINGUID riid, wchar* bstrKey, void** ppvObj);
    }
    */


    //ocidl
    /*
    interface IFont : IUnknown {
      // static DWINGUID IID = { 0xBEF6E002, 0xA874, 0x101A, 0x8B, 0xBA, 0x00, 0xAA, 0x00, 0x30, 0x0C, 0xAB };
      int get_Name(out wchar* pName);
      int set_Name(wchar* name);
      int get_Size(out long pSize);
      int set_Size(long size);
      int get_Bold(out int pBold);
      int set_Bold(int bold);
      int get_Italic(out int pItalic);
      int set_Italic(int italic);
      int get_Underline(out int pUnderline);
      int set_Underline(int underline);
      int get_Strikethrough(out int pStrikethrough);
      int set_Strikethrough(int strikethrough);
      int get_Weight(out short pWeight);
      int set_Weight(short weight);
      int get_Charset(out short pCharset);
      int set_Charset(short charset);
      int get_hFont(out HANDLE phFont);
      int Clone(out IFont ppFont);
      int IsEqual(IFont pFontOther);
      int SetRatio(int cyLogical, int cyHimetric);
      int QueryTextMetrics(out TEXTMETRICOLE pTM);
      int AddRefHfont(HANDLE hFont);
      int ReleaseHfont(HANDLE hFont);
      int SetHdc(HANDLE hDC);
    }
    */

    //ocidl
    /*
    interface IPicture : IUnknown {
      // static DWINGUID IID = { 0x7BF80980, 0xBF32, 0x101A, 0x8B, 0xBB, 0x00, 0xAA, 0x00, 0x30, 0x0C, 0xAB };
      int get_Handle(out uint pHandle);
      int get_hPal(out uint phPal);
      int get_Type(out short pType);
      int get_Width(out int pWidth);
      int get_Height(out int pHeight);
      int Render(HANDLE hDC, int x, int y, int cx, int cy, int xSrc, int ySrc, int cxSrc, int cySrc, RECT* pRcBounds);
      int set_hPal(uint hPal);
      int get_CurDC(out HANDLE phDC);
      int SelectPicture(HANDLE hDCIn, out HANDLE phDCOut, out uint phBmpOut);
      int get_KeepOriginalFormat(out int pKeep);
      int put_KeepOriginalFormat(int keep);
      int PictureChanged();
      int SaveAsFile(IStream pStream, int fSaveMemCopy, out int pCbSize);
      int get_Attributes(out uint pDwAttr);
    }
    */
        
    //ocidl
    /*
    interface IFontEventsDisp : IDispatch {
      mixin(uuid("4ef6100a-af88-11d0-9846-00c04fc29993"));        
      // static DWINGUID IID = { 0x4EF6100A, 0xAF88, 0x11D0, 0x98, 0x46, 0x00, 0xC0, 0x4F, 0xC2, 0x99, 0x93 };
    } 
    */
        
    //ocidl
    /*
    interface IFontDisp : IDispatch {
       mixin(uuid("bef6e003-a874-101a-8bba-00aa00300cab"));        
      // static DWINGUID IID = { 0xBEF6E003, 0xA874, 0x101A, 0x8B, 0xBA, 0x00, 0xAA, 0x00, 0x30, 0x0C, 0xAB };
    }
    */
        
    //ocidl
    /*
    interface IPictureDisp : IDispatch {
      mixin(uuid("7bf80981-bf32-101a-8bbb-00aa00300cab"));        
      // static DWINGUID IID = { 0x7BF80981, 0xBF32, 0x101A, 0x8B, 0xBB, 0x00, 0xAA, 0x00, 0x30, 0x0C, 0xAB };
    }    
    */

    //comcat
    /*
    interface IEnumGUID : IUnknown {
      mixin(uuid("0002E000-0000-0000-c000-000000000046"));        
      // static DWINGUID IID = { 0x0002E000, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int Next(uint celt, DWINGUID* rgelt, out uint pceltFetched);
      int Skip(uint celt);
      int Reset();
      int Clone(out IEnumGUID ppenum);
    }
    */

    //comcat
    /*
    interface IEnumCATEGORYINFO : IUnknown {
      mixin(uuid("0002E011-0000-0000-c000-000000000046"));        
      // static DWINGUID IID = { 0x0002E011, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int Next(uint celt, CATEGORYINFO* rgelt, out uint pceltFetched);
      int Skip(uint celt);
      int Reset();
      int Clone(out IEnumGUID ppenum);
    }
    */

    
    //comcat
    /*
    interface ICatInformation : IUnknown {
      mixin(uuid("0002E013-0000-0000-c000-000000000046"));        
      // static DWINGUID IID = { 0x0002E013, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int EnumCategories(uint lcid, out IEnumCATEGORYINFO ppenumCategoryInfo);
      int GetCategoryDesc(inout DWINGUID rcatid, uint lcid, out wchar* pszDesc);
      int EnumClassesOfCategories(uint cImplemented, DWINGUID* rgcatidImpl, uint cRequired, DWINGUID* rgcatidReq, out IEnumGUID ppenumClsid);
      int IsClassOfCategories(inout DWINGUID rclsid, uint cImplemented, DWINGUID* rgcatidImpl, uint cRequired, DWINGUID* rgcatidReq);
      int EnumImplCategoriesOfClass(inout DWINGUID rclsid, out IEnumGUID ppenumCatid);
      int EnumReqCategoriesOfClass(inout DWINGUID rclsid, out IEnumGUID ppenumCatid);
    }
    */
    
    //not found in VC8 inlclude
    /*
    interface IPropertyStore : IUnknown {
      
      mixin(uuid("886d8eeb-8cf2-4446-8d02-cdba1dbdcf99"));
      // static DWINGUID IID = { 0x886d8eeb, 0x8cf2, 0x4446, 0x8d, 0x02, 0xcd, 0xba, 0x1d, 0xbd, 0xcf, 0x99 };
      int GetCount(out uint cProps);
      int GetAt(uint iProp, out PROPERTYKEY pkey);
      int GetValue(ref PROPERTYKEY key, out PROPVARIANT pv);
      int SetValue(ref PROPERTYKEY key, ref PROPVARIANT propvar);
      int Commit();
    }
    */


    //ocidl
    /*
    interface IPersistStreamInit : IPersist { 
        mixin(uuid("7FD52380-4E07-101B-AE2D-08002B2EC713"));        
    //from regist {7FD52380-4E07-101B-AE2D-08002B2EC713}
        // static DWINGUID IID = {0x7FD52380,0x4E07,0x101B,0xAE,0x2D,0x08,0x00,0x2B,0x2E,0xC7,0x13};    
        int IsDirty(); 
        int Load(IStream pStm); 
        int Save(IStream pStm, int fClearDirty);
        int GetSizeMax(out ulong); 
        int InitNew(); 
    } 
    */

    // from urlmon.h
    /*
    interface IPersistMoniker : public IUnknown {                      
        mixin(uuid("79eac9c9-baf9-11ce-8c82-00aa004ba90b"));
        // static DWINGUID IID = { 0x79eac9c9, 0xbaf9, 0x11ce, 0x8c, 0x82, 0x00, 0xaa, 0x00, 0x4b, 0xa9, 0x0b };
        int GetClassID( out DWINGUID pClassID );
        int IsDirty( ); 
        int Load( int fFullyAvailable, IMoniker pimkName, IBindCtx pibc, int grfMode); // failed ref Imoniker pimkName...
        int Save( IMoniker pimkName, IBindCtx pbc, int fRemember);    
        int SaveCompleted( IMoniker pimkName, IBindCtx pibc);
        int GetCurMoniker( out IMoniker ppimkName);  
    }
    */

    // from dwin.sys.win32.com.tlb.danim
    //objidl
    /+
    interface IMoniker : IPersistStream {
      mixin(uuid("0000000f-0000-0000-c000-000000000046"));
      // static DWINGUID IID = { 0x0000000f, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      /*[id(0x60030000)]*/ //int RemoteBindToObject(IBindCtx pbc, IMoniker pmkToLeft, ref DWINGUID riidResult, out IUnknown ppvResult);
      /*[id(0x60030000)]*/ int BindToObject(IBindCtx pbc, IMoniker pmkToLeft, ref DWINGUID riidResult, out IUnknown ppvResult);
      /*[id(0x60030001)]*/ //int RemoteBindToStorage(IBindCtx pbc, IMoniker pmkToLeft, ref DWINGUID riid, out IUnknown ppvObj);
      /*[id(0x60030001)]*/ int BindToStorage(IBindCtx pbc, IMoniker pmkToLeft, ref DWINGUID riid, out IUnknown ppvObj);
      /*[id(0x60030002)]*/ int Reduce(IBindCtx pbc, uint dwReduceHowFar, ref IMoniker ppmkToLeft, out IMoniker ppmkReduced);
      /*[id(0x60030003)]*/ int ComposeWith(IMoniker pmkRight, int fOnlyIfNotGeneric, out IMoniker ppmkComposite);
      /*[id(0x60030004)]*/ int Enum(int fForward, out IEnumMoniker ppenumMoniker);
      /*[id(0x60030005)]*/ int IsEqual(IMoniker pmkOtherMoniker);
      /*[id(0x60030006)]*/ int Hash(out uint pdwHash);
      /*[id(0x60030007)]*/ int IsRunning(IBindCtx pbc, IMoniker pmkToLeft, IMoniker pmkNewlyRunning);
      /*[id(0x60030008)]*/ int GetTimeOfLastChange(IBindCtx pbc, IMoniker pmkToLeft, out FILETIME pfiletime);
      /*[id(0x60030009)]*/ int Inverse(out IMoniker ppmk);
      /*[id(0x6003000A)]*/ int CommonPrefixWith(IMoniker pmkOther, out IMoniker ppmkPrefix);
      /*[id(0x6003000B)]*/ int RelativePathTo(IMoniker pmkOther, out IMoniker ppmkRelPath);
      /*[id(0x6003000C)]*/ int GetDisplayName(IBindCtx pbc, IMoniker pmkToLeft, out wchar* ppszDisplayName);
      /*[id(0x6003000D)]*/ int ParseDisplayName(IBindCtx pbc, IMoniker pmkToLeft, wchar* pszDisplayName, out uint pchEaten, out IMoniker ppmkOut);
      /*[id(0x6003000E)]*/ int IsSystemMoniker(out uint pdwMksys);
    }    
    +/
    
    /+
    //from dwin.sys.win32.com.tlb.danim 
    interface IOleContainer : IParseDisplayName {
      mixin(uuid("0000011b-0000-0000-c000-000000000046"));
      // static DWINGUID IID = { 0x0000011b, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      /*[id(0x60020000)]*/ int EnumObjects(uint grfFlags, out IEnumUnknown ppenum);
      /*[id(0x60020001)]*/ int LockContainer(int fLock);
    }    
    interface IParseDisplayName : IUnknown {
      mixin(uuid("0000011a-0000-0000-c000-000000000046"));
      // static DWINGUID IID = { 0x0000011a, 0x0000, 0x0000, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      /*[id(0x60010000)]*/ int ParseDisplayName(IBindCtx pbc, wchar* pszDisplayName, out uint pchEaten, out IMoniker ppmkOut);
    } 
    +/
        
    //moved into headers.objidl.d at May 18 2009
    /*
    //from MS VS8 PlatformSDK ObjIdl.IDL
    interface IPersistFile : IPersist
    {
        mixin(uuid("0000010b-0000-0000-C000-000000000046"));
        // static DWINGUID IID = { 0x0000010b, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
        int IsDirty ();
        int Load(wchar* pszFileName, uint dwMode);
        int Save(wchar* pszFileName, int fRemember);
        int SaveCompleted (wchar* pszFileName);
        int GetCurFile(out wchar* ppszFileName);
    }  
    */
    
    //moved into headers.shobjidl at May 18 2009
    /*
    //from MS VS8 VC PlatformSDK shObjIdl.idl
    interface IShellLinkW : IUnknown
    {
        mixin(uuid("000214F9-0000-0000-C000-000000000046"));
        // static DWINGUID IID = { 0x000214F9, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
        
        int GetPath( wchar* pszFile, int cch, ref WIN32_FIND_DATAW pfd, uint fFlags);
        int GetIDList(out LPITEMIDLIST  ppidl);
        int SetIDList(LPCITEMIDLIST pidl);
        int GetDescription(wchar* pszName, int cch);
        int SetDescription(wchar* pszName);
        int GetWorkingDirectory(wchar* pszDir, int cch);
        int SetWorkingDirectory(wchar* pszDir);
        int GetArguments(wchar* pszArgs, int cch);
        int SetArguments(wchar* pszArgs);
        int GetHotkey(out ushort pwHotkey);
        int SetHotkey(ushort wHotkey);
        int GetShowCmd(out int piShowCmd);
        int SetShowCmd(int iShowCmd);
        int GetIconLocation(wchar* pszIconPath, int cch, out int piIcon);
        int SetIconLocation(wchar* pszIconPath, int iIcon);
        int SetRelativePath(wchar* pszPathRel, uint dwReserved);
        int Resolve(void* hwnd, uint fFlags);
        int SetPath(wchar* pszFile);
    };    
    */
    

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
