// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2009  (dyuyan  gmail at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: May 2009

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/
module dwin.sys.win32.headers.comcat;

private import dwin.sys.win32.com.Core;

extern(Windows):

/+
//  Contents:   Component Categories Interfaces

cpp_quote("//=--------------------------------------------------------------------------=")
cpp_quote("// ComCat.h")
cpp_quote("//=--------------------------------------------------------------------------=")
cpp_quote("// Copyright (c) Microsoft Corporation. All rights reserved.")
cpp_quote("//")
cpp_quote("// THIS CODE AND INFORMATION IS PROVIDED \"AS IS\" WITHOUT WARRANTY OF")
cpp_quote("// ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO")
cpp_quote("// THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A")
cpp_quote("// PARTICULAR PURPOSE.")
cpp_quote("//=--------------------------------------------------------------------------=")
cpp_quote("")
cpp_quote("#pragma comment(lib,\"uuid.lib\")")
cpp_quote("")
cpp_quote("//=--------------------------------------------------------------------------=")
cpp_quote("// OLE Componet Categories Interfaces.")
cpp_quote("//=--------------------------------------------------------------------------=")
cpp_quote("//")

#ifndef DO_NO_IMPORTS
private import "unknwn.idl";
#endif

interface IEnumGUID;
interface IEnumCATEGORYINFO;
interface ICatRegister;
interface ICatInformation;
cpp_quote("EXTERN_C const CLSID CLSID_StdComponentCategoriesMgr;")

cpp_quote("")
cpp_quote("////////////////////////////////////////////////////////////////////////////")
cpp_quote("//  Types")
    typedef GUID CATID;
    typedef REFGUID REFCATID;
cpp_quote("#define IID_IEnumCLSID              IID_IEnumGUID")
cpp_quote("#define IEnumCLSID                  IEnumGUID")
cpp_quote("#define LPENUMCLSID                 LPENUMGUID")
#define IEnumCLSID                      IEnumGUID
cpp_quote("#define CATID_NULL                   GUID_NULL")
cpp_quote("#define IsEqualCATID(rcatid1, rcatid2)       IsEqualGUID(rcatid1, rcatid2)")
cpp_quote("#define IID_IEnumCATID       IID_IEnumGUID")
cpp_quote("#define IEnumCATID           IEnumGUID")
#define IEnumCATID                      IEnumGUID

cpp_quote("")
cpp_quote("////////////////////////////////////////////////////////////////////////////")
cpp_quote("//  Category IDs (link to uuid3.lib)")
cpp_quote("EXTERN_C const CATID CATID_Insertable;")
cpp_quote("EXTERN_C const CATID CATID_Control;")
cpp_quote("EXTERN_C const CATID CATID_Programmable;")
cpp_quote("EXTERN_C const CATID CATID_IsShortcut;")
cpp_quote("EXTERN_C const CATID CATID_NeverShowExt;")
cpp_quote("EXTERN_C const CATID CATID_DocObject;")
cpp_quote("EXTERN_C const CATID CATID_Printable;")
cpp_quote("EXTERN_C const CATID CATID_RequiresDataPathHost;")
cpp_quote("EXTERN_C const CATID CATID_PersistsToMoniker;")
cpp_quote("EXTERN_C const CATID CATID_PersistsToStorage;")
cpp_quote("EXTERN_C const CATID CATID_PersistsToStreamInit;")
cpp_quote("EXTERN_C const CATID CATID_PersistsToStream;")
cpp_quote("EXTERN_C const CATID CATID_PersistsToMemory;")
cpp_quote("EXTERN_C const CATID CATID_PersistsToFile;")
cpp_quote("EXTERN_C const CATID CATID_PersistsToPropertyBag;")
cpp_quote("EXTERN_C const CATID CATID_InternetAware;")
cpp_quote("EXTERN_C const CATID CATID_DesignTimeUIActivatableControl;")

cpp_quote("")
cpp_quote("////////////////////////////////////////////////////////////////////////////")
cpp_quote("//  Interface Definitions")
+/

    interface IEnumGUID : IUnknown {
      mixin(uuid("0002E000-0000-0000-c000-000000000046"));        
      // static DWINGUID IID = { 0x0002E000, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int Next(uint celt, DWINGUID* rgelt, out uint pceltFetched);
      int Skip(uint celt);
      int Reset();
      int Clone(out IEnumGUID ppenum);
    }


//+---------------------------------------------------------------------------
//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//
//  Contents:    IEnumGUID interface definition
//
//----------------------------------------------------------------------------
/*
cpp_quote("#ifndef _LPENUMGUID_DEFINED")
cpp_quote("#define _LPENUMGUID_DEFINED")
[
    object,
    uuid(0002E000-0000-0000-C000-000000000046),
    pointer_default(unique)
]
interface IEnumGUID : IUnknown
{
    typedef [unique] IEnumGUID *LPENUMGUID;

    HRESULT Next(
	[in] ULONG celt,
	[out, size_is(celt), length_is(*pceltFetched)] GUID *rgelt,
	[out] ULONG *pceltFetched);

    HRESULT Skip(
	[in] ULONG celt);

    HRESULT Reset();

    HRESULT Clone(
	[out] IEnumGUID **ppenum);
}
cpp_quote("#endif")
*/

    interface IEnumCATEGORYINFO : IUnknown {
      mixin(uuid("0002E011-0000-0000-c000-000000000046"));        
      // static DWINGUID IID = { 0x0002E011, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int Next(uint celt, CATEGORYINFO* rgelt, out uint pceltFetched);
      int Skip(uint celt);
      int Reset();
      int Clone(out IEnumGUID ppenum);
    }

//+---------------------------------------------------------------------------
//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//
//  Contents:    IEnumCATEGORYINFO definition
//
//----------------------------------------------------------------------------
/*
cpp_quote("#ifndef _LPENUMCATEGORYINFO_DEFINED")
cpp_quote("#define _LPENUMCATEGORYINFO_DEFINED")
[
    object,
    uuid(0002E011-0000-0000-C000-000000000046),
    pointer_default(unique)
]
interface IEnumCATEGORYINFO : IUnknown
{
    typedef [unique] IEnumCATEGORYINFO *LPENUMCATEGORYINFO;

#define CATDESC_MAX 128

    typedef struct tagCATEGORYINFO {
	CATID       catid;
	LCID        lcid;
    OLECHAR szDescription[CATDESC_MAX];
    } CATEGORYINFO, *LPCATEGORYINFO;

    HRESULT Next(
	[in] ULONG celt,
	[out, size_is(celt), length_is(*pceltFetched)] CATEGORYINFO* rgelt,
	[out] ULONG* pceltFetched);

    HRESULT Skip(
	[in] ULONG celt);

    HRESULT Reset();

    HRESULT Clone(
	[out] IEnumCATEGORYINFO** ppenum);
}
cpp_quote("#endif")
*/

//+---------------------------------------------------------------------------
//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//
//  Contents:    ICatRegister definition
//
//----------------------------------------------------------------------------

struct CATEGORYINFO {
  DWINGUID catid;
  uint lcid;
  wchar[128] szDescription;
}

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
    
    
    /*

cpp_quote("#ifndef _LPCATREGISTER_DEFINED")
cpp_quote("#define _LPCATREGISTER_DEFINED")
+/

[
    object,
    uuid(0002E012-0000-0000-C000-000000000046),
    pointer_default(unique)
]
interface ICatRegister : IUnknown
{
    typedef [unique] ICatRegister* LPCATREGISTER;

    HRESULT RegisterCategories(
	[in] ULONG cCategories,
	[in, size_is(cCategories)] CATEGORYINFO rgCategoryInfo[]);

    HRESULT UnRegisterCategories(
	[in] ULONG cCategories,
	[in, size_is(cCategories)] CATID rgcatid[]);

    HRESULT RegisterClassImplCategories(
	[in] REFCLSID rclsid,
	[in] ULONG cCategories,
	[in, size_is(cCategories)] CATID rgcatid[]);

    HRESULT UnRegisterClassImplCategories(
	[in] REFCLSID rclsid,
	[in] ULONG cCategories,
	[in, size_is(cCategories)] CATID rgcatid[]);

    HRESULT RegisterClassReqCategories(
	[in] REFCLSID rclsid,
	[in] ULONG cCategories,
	[in, size_is(cCategories)] CATID rgcatid[]);

    HRESULT UnRegisterClassReqCategories(
	[in] REFCLSID rclsid,
	[in] ULONG cCategories,
	[in, size_is(cCategories)] CATID rgcatid[]);
}
cpp_quote("#endif")
*/


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

    
//+---------------------------------------------------------------------------
//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//
//  Contents:    ICatInformation definition
//
//----------------------------------------------------------------------------
/*
cpp_quote("#ifndef _LPCATINFORMATION_DEFINED")
cpp_quote("#define _LPCATINFORMATION_DEFINED")
[
    object,
    uuid(0002E013-0000-0000-C000-000000000046),
    pointer_default(unique)
]
interface ICatInformation : IUnknown
{
    typedef [unique] ICatInformation* LPCATINFORMATION;

    HRESULT EnumCategories(
	[in] LCID lcid,
	[out] IEnumCATEGORYINFO** ppenumCategoryInfo);

    HRESULT GetCategoryDesc(
	[in] REFCATID rcatid,
	[in] LCID lcid,
	[out] LPWSTR* pszDesc);

    [local]
    HRESULT EnumClassesOfCategories(
	[in] ULONG cImplemented,
	[in,size_is(cImplemented)] CATID rgcatidImpl[],
	[in] ULONG cRequired,
	[in,size_is(cRequired)] CATID rgcatidReq[],
	[out] IEnumCLSID** ppenumClsid);

    [call_as(EnumClassesOfCategories)]
    HRESULT RemoteEnumClassesOfCategories(
	[in] ULONG cImplemented,
	[in,unique,size_is(cImplemented)] CATID rgcatidImpl[],
	[in] ULONG cRequired,
	[in,unique,size_is(cRequired)] CATID rgcatidReq[],
	[out] IEnumCLSID** ppenumClsid);

    [local]
    HRESULT IsClassOfCategories(
	[in] REFCLSID rclsid,
	[in] ULONG cImplemented,
	[in,size_is(cImplemented)] CATID rgcatidImpl[],
	[in] ULONG cRequired,
	[in,size_is(cRequired)] CATID rgcatidReq[]);

    [call_as(IsClassOfCategories)]
    HRESULT RemoteIsClassOfCategories(
	[in] REFCLSID rclsid,
	[in] ULONG cImplemented,
	[in,unique,size_is(cImplemented)] CATID rgcatidImpl[],
	[in] ULONG cRequired,
	[in,unique,size_is(cRequired)] CATID rgcatidReq[] );

    HRESULT EnumImplCategoriesOfClass(
	[in] REFCLSID rclsid,
	[out] IEnumCATID** ppenumCatid);

    HRESULT EnumReqCategoriesOfClass(
	[in] REFCLSID rclsid,
	[out] IEnumCATID** ppenumCatid);
}
cpp_quote("#endif")

*/