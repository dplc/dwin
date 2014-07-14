// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2009  (dyuyan  gmail at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: May 2009

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/
module dwin.sys.win32.headers.oaidl;

private import dwin.sys.win32.com.Core;

//  File: oaidl.idl
//
/*
#ifndef DO_NO_IMPORTS
private import "objidl.idl";
#endif

interface ICreateTypeInfo;
interface ICreateTypeInfo2;
interface ICreateTypeLib;
interface ICreateTypeLib2;
interface IDispatch;
interface IEnumVARIANT;
interface ITypeComp;
interface ITypeInfo;
interface ITypeInfo2;
interface ITypeLib;
interface ITypeLib2;
interface ITypeChangeEvents;
interface IErrorInfo;
interface ICreateErrorInfo;
interface ISupportErrorInfo;
interface ITypeFactory;
interface ITypeMarshal;
interface IRecordInfo;
*/

//com.Core
/*
enum SYSKIND {
  SYS_WIN16,
  SYS_WIN32,
  SYS_MAC,
  SYS_WIN64
}
struct TLIBATTR {
  DWINGUID guid;
  uint lcid;
  SYSKIND syskind;
  ushort wMajorVerNum;
  ushort wMinorVerNum;
  ushort wLibFlags;
}
*/

/+
[
  version(1.0), pointer_default(unique)
]

interface IOleAutomationTypes
{

typedef CY CURRENCY;

// #########################################################################
//      SAFEARRAY
// #########################################################################
+/

//com.Core
/*
struct SAFEARRAYBOUND {
  uint cElements;
  int lLbound;
}
*/

/*
typedef struct tagSAFEARRAYBOUND {
    ULONG cElements;
    LONG  lLbound;
} SAFEARRAYBOUND, * LPSAFEARRAYBOUND;
*/

/+
cpp_quote("/* the following is what MIDL knows how to remote */")

// Forward references.
typedef [unique] struct _wireVARIANT * wireVARIANT;
typedef [unique] struct _wireBRECORD * wireBRECORD;

typedef struct _wireSAFEARR_BSTR {
    ULONG Size;
    [size_is(Size), ref] wireBSTR * aBstr;
} SAFEARR_BSTR;

typedef struct _wireSAFEARR_UNKNOWN {
    ULONG Size;
    [size_is(Size), ref] IUnknown ** apUnknown;
} SAFEARR_UNKNOWN;

typedef struct _wireSAFEARR_DISPATCH {
    ULONG Size;
    [size_is(Size), ref] IDispatch ** apDispatch;
} SAFEARR_DISPATCH;

typedef struct _wireSAFEARR_VARIANT {
    ULONG Size;
    [size_is(Size), ref] wireVARIANT * aVariant;
} SAFEARR_VARIANT;

typedef struct _wireSAFEARR_BRECORD {
    ULONG Size;
    [size_is(Size), ref] wireBRECORD * aRecord;
} SAFEARR_BRECORD;

typedef struct _wireSAFEARR_HAVEIID {
    ULONG Size;
    [size_is(Size), ref] IUnknown ** apUnknown;
    IID   iid;
} SAFEARR_HAVEIID;

typedef [v1_enum] enum tagSF_TYPE {
    SF_ERROR    = VT_ERROR,
    SF_I1       = VT_I1,
    SF_I2       = VT_I2,
    SF_I4       = VT_I4,
    SF_I8       = VT_I8,
    SF_BSTR     = VT_BSTR,
    SF_UNKNOWN  = VT_UNKNOWN,
    SF_DISPATCH = VT_DISPATCH,
    SF_VARIANT  = VT_VARIANT,
    SF_RECORD   = VT_RECORD,
    SF_HAVEIID  = VT_UNKNOWN|VT_RESERVED,
} SF_TYPE;

typedef union _wireSAFEARRAY_UNION switch(ULONG sfType) u {
    case SF_BSTR:      SAFEARR_BSTR     BstrStr;
    case SF_UNKNOWN:   SAFEARR_UNKNOWN  UnknownStr;
    case SF_DISPATCH:  SAFEARR_DISPATCH DispatchStr;
    case SF_VARIANT:   SAFEARR_VARIANT  VariantStr;
    case SF_RECORD:    SAFEARR_BRECORD  RecordStr;
    case SF_HAVEIID:   SAFEARR_HAVEIID  HaveIidStr;
    case SF_I1:        BYTE_SIZEDARR    ByteStr;
    case SF_I2:        WORD_SIZEDARR    WordStr;
    case SF_I4:        DWORD_SIZEDARR   LongStr;
    case SF_I8:        HYPER_SIZEDARR   HyperStr;
} SAFEARRAYUNION;

typedef [unique] struct _wireSAFEARRAY {
    USHORT cDims;
    USHORT fFeatures;
    ULONG  cbElements;
    ULONG  cLocks;
    SAFEARRAYUNION uArrayStructs;
    [size_is(cDims)] SAFEARRAYBOUND rgsabound[];
} * wireSAFEARRAY;

typedef [unique] wireSAFEARRAY * wirePSAFEARRAY;


typedef struct tagSAFEARRAY {
    USHORT cDims;
    USHORT fFeatures;
    ULONG  cbElements;
    ULONG  cLocks;
    PVOID  pvData;
    SAFEARRAYBOUND rgsabound[];
} SAFEARRAY;

typedef [wire_marshal(wirePSAFEARRAY)] SAFEARRAY * LPSAFEARRAY;

const USHORT FADF_AUTO       = 0x0001;  /* array is allocated on the stack */
const USHORT FADF_STATIC     = 0x0002;  /* array is staticly allocated */
const USHORT FADF_EMBEDDED   = 0x0004;  /* array is embedded in a structure */
const USHORT FADF_FIXEDSIZE  = 0x0010;  /* may not be resized or reallocated */
const USHORT FADF_RECORD     = 0x0020;  /* an array of records */
const USHORT FADF_HAVEIID    = 0x0040;  /* with FADF_DISPATCH, FADF_UNKNOWN */
                                        /* array has an IID for interfaces */
const USHORT FADF_HAVEVARTYPE= 0x0080;  /* array has a VT type */
const USHORT FADF_BSTR       = 0x0100;  /* an array of BSTRs */
const USHORT FADF_UNKNOWN    = 0x0200;  /* an array of IUnknown* */
const USHORT FADF_DISPATCH   = 0x0400;  /* an array of IDispatch* */
const USHORT FADF_VARIANT    = 0x0800;  /* an array of VARIANTs */
const USHORT FADF_RESERVED   = 0xF008;  /* reserved bits */


// #########################################################################
//      VARIANT
// #########################################################################

cpp_quote("/* VARIANT STRUCTURE")
cpp_quote(" *")
cpp_quote(" *  VARTYPE vt;")
cpp_quote(" *  WORD wReserved1;")
cpp_quote(" *  WORD wReserved2;")
cpp_quote(" *  WORD wReserved3;")
cpp_quote(" *  union {")
cpp_quote(" *    LONGLONG       VT_I8")
cpp_quote(" *    LONG           VT_I4")
cpp_quote(" *    BYTE           VT_UI1")
cpp_quote(" *    SHORT          VT_I2")
cpp_quote(" *    FLOAT          VT_R4")
cpp_quote(" *    DOUBLE         VT_R8")
cpp_quote(" *    VARIANT_BOOL   VT_BOOL")
cpp_quote(" *    SCODE          VT_ERROR")
cpp_quote(" *    CY             VT_CY")
cpp_quote(" *    DATE           VT_DATE")
cpp_quote(" *    BSTR           VT_BSTR")
cpp_quote(" *    IUnknown *     VT_UNKNOWN")
cpp_quote(" *    IDispatch *    VT_DISPATCH")
cpp_quote(" *    SAFEARRAY *    VT_ARRAY")
cpp_quote(" *    BYTE *         VT_BYREF|VT_UI1")
cpp_quote(" *    SHORT *        VT_BYREF|VT_I2")
cpp_quote(" *    LONG *         VT_BYREF|VT_I4")
cpp_quote(" *    LONGLONG *     VT_BYREF|VT_I8")
cpp_quote(" *    FLOAT *        VT_BYREF|VT_R4")
cpp_quote(" *    DOUBLE *       VT_BYREF|VT_R8")
cpp_quote(" *    VARIANT_BOOL * VT_BYREF|VT_BOOL")
cpp_quote(" *    SCODE *        VT_BYREF|VT_ERROR")
cpp_quote(" *    CY *           VT_BYREF|VT_CY")
cpp_quote(" *    DATE *         VT_BYREF|VT_DATE")
cpp_quote(" *    BSTR *         VT_BYREF|VT_BSTR")
cpp_quote(" *    IUnknown **    VT_BYREF|VT_UNKNOWN")
cpp_quote(" *    IDispatch **   VT_BYREF|VT_DISPATCH")
cpp_quote(" *    SAFEARRAY **   VT_BYREF|VT_ARRAY")
cpp_quote(" *    VARIANT *      VT_BYREF|VT_VARIANT")
cpp_quote(" *    PVOID          VT_BYREF (Generic ByRef)")
cpp_quote(" *    CHAR           VT_I1")
cpp_quote(" *    USHORT         VT_UI2")
cpp_quote(" *    ULONG          VT_UI4")
cpp_quote(" *    ULONGLONG      VT_UI8")
cpp_quote(" *    INT            VT_INT")
cpp_quote(" *    UINT           VT_UINT")
cpp_quote(" *    DECIMAL *      VT_BYREF|VT_DECIMAL")
cpp_quote(" *    CHAR *         VT_BYREF|VT_I1")
cpp_quote(" *    USHORT *       VT_BYREF|VT_UI2")
cpp_quote(" *    ULONG *        VT_BYREF|VT_UI4")
cpp_quote(" *    ULONGLONG *    VT_BYREF|VT_UI8")
cpp_quote(" *    INT *          VT_BYREF|VT_INT")
cpp_quote(" *    UINT *         VT_BYREF|VT_UINT")
cpp_quote(" *  }")
cpp_quote(" */")

cpp_quote("#if (__STDC__ && !defined(_FORCENAMELESSUNION)) || defined(NONAMELESSUNION)")
cpp_quote("#define __VARIANT_NAME_1 n1")
cpp_quote("#define __VARIANT_NAME_2 n2")
cpp_quote("#define __VARIANT_NAME_3 n3")
cpp_quote("#define __VARIANT_NAME_4 brecVal")
cpp_quote("#else")
cpp_quote("#define __tagVARIANT")
cpp_quote("#define __VARIANT_NAME_1")
cpp_quote("#define __VARIANT_NAME_2")
cpp_quote("#define __VARIANT_NAME_3")
cpp_quote("#define __tagBRECORD")
cpp_quote("#define __VARIANT_NAME_4")
cpp_quote("#endif")

typedef [wire_marshal(wireVARIANT)] struct tagVARIANT VARIANT;

struct tagVARIANT {
    union {
        struct __tagVARIANT {
            VARTYPE vt;
            WORD    wReserved1;
            WORD    wReserved2;
            WORD    wReserved3;
            union {
                LONGLONG      llVal;        /* VT_I8                */
                LONG          lVal;         /* VT_I4                */
                BYTE          bVal;         /* VT_UI1               */
                SHORT         iVal;         /* VT_I2                */
                FLOAT         fltVal;       /* VT_R4                */
                DOUBLE        dblVal;       /* VT_R8                */
                VARIANT_BOOL  boolVal;      /* VT_BOOL              */
                _VARIANT_BOOL bool;         /* (obsolete)           */
                SCODE         scode;        /* VT_ERROR             */
                CY            cyVal;        /* VT_CY                */
                DATE          date;         /* VT_DATE              */
                BSTR          bstrVal;      /* VT_BSTR              */
                IUnknown *    punkVal;      /* VT_UNKNOWN           */
                IDispatch *   pdispVal;     /* VT_DISPATCH          */
                SAFEARRAY *   parray;       /* VT_ARRAY             */
                BYTE *        pbVal;        /* VT_BYREF|VT_UI1      */
                SHORT *       piVal;        /* VT_BYREF|VT_I2       */
                LONG *        plVal;        /* VT_BYREF|VT_I4       */
                LONGLONG *    pllVal;       /* VT_BYREF|VT_I8       */
                FLOAT *       pfltVal;      /* VT_BYREF|VT_R4       */
                DOUBLE *      pdblVal;      /* VT_BYREF|VT_R8       */
                VARIANT_BOOL *pboolVal;     /* VT_BYREF|VT_BOOL     */
                _VARIANT_BOOL *pbool;       /* (obsolete)           */
                SCODE *       pscode;       /* VT_BYREF|VT_ERROR    */
                CY *          pcyVal;       /* VT_BYREF|VT_CY       */
                DATE *        pdate;        /* VT_BYREF|VT_DATE     */
                BSTR *        pbstrVal;     /* VT_BYREF|VT_BSTR     */
                IUnknown **   ppunkVal;     /* VT_BYREF|VT_UNKNOWN  */
                IDispatch **  ppdispVal;    /* VT_BYREF|VT_DISPATCH */
                SAFEARRAY **  pparray;      /* VT_BYREF|VT_ARRAY    */
                VARIANT *     pvarVal;      /* VT_BYREF|VT_VARIANT  */
                PVOID         byref;        /* Generic ByRef        */
                CHAR          cVal;         /* VT_I1                */
                USHORT        uiVal;        /* VT_UI2               */
                ULONG         ulVal;        /* VT_UI4               */
                ULONGLONG     ullVal;       /* VT_UI8               */
                INT           intVal;       /* VT_INT               */
                UINT          uintVal;      /* VT_UINT              */
                DECIMAL *     pdecVal;      /* VT_BYREF|VT_DECIMAL  */
                CHAR *        pcVal;        /* VT_BYREF|VT_I1       */
                USHORT *      puiVal;       /* VT_BYREF|VT_UI2      */
                ULONG *       pulVal;       /* VT_BYREF|VT_UI4      */
                ULONGLONG *   pullVal;      /* VT_BYREF|VT_UI8      */
                INT *         pintVal;      /* VT_BYREF|VT_INT      */
                UINT *        puintVal;     /* VT_BYREF|VT_UINT     */
                struct __tagBRECORD {
                    PVOID         pvRecord;
                    IRecordInfo * pRecInfo;
                } __VARIANT_NAME_4;         /* VT_RECORD            */
            } __VARIANT_NAME_3;
        } __VARIANT_NAME_2;

        DECIMAL decVal;
    } __VARIANT_NAME_1;
};

typedef VARIANT * LPVARIANT;
typedef VARIANT VARIANTARG;
typedef VARIANT * LPVARIANTARG;

cpp_quote("/* the following is what MIDL knows how to remote */")

struct _wireBRECORD {
    ULONG fFlags;
    ULONG clSize;
    IRecordInfo * pRecInfo;
    [size_is(clSize)] byte * pRecord;
};

struct _wireVARIANT {
    DWORD  clSize;          /* wire buffer length in units of hyper (int64) */
    DWORD  rpcReserved;     /* for future use */
    USHORT vt;
    USHORT wReserved1;
    USHORT wReserved2;
    USHORT wReserved3;
    [switch_type(ULONG), switch_is(vt)] union {
    [case(VT_I8)]       LONGLONG      llVal;        /* VT_I8                */
    [case(VT_I4)]       LONG          lVal;         /* VT_I4                */
    [case(VT_UI1)]      BYTE          bVal;         /* VT_UI1               */
    [case(VT_I2)]       SHORT         iVal;         /* VT_I2                */
    [case(VT_R4)]       FLOAT         fltVal;       /* VT_R4                */
    [case(VT_R8)]       DOUBLE        dblVal;       /* VT_R8                */
    [case(VT_BOOL)]     VARIANT_BOOL  boolVal;      /* VT_BOOL              */
    [case(VT_ERROR)]    SCODE         scode;        /* VT_ERROR             */
    [case(VT_CY)]       CY            cyVal;        /* VT_CY                */
    [case(VT_DATE)]     DATE          date;         /* VT_DATE              */
    [case(VT_BSTR)]     wireBSTR      bstrVal;      /* VT_BSTR              */
    [case(VT_UNKNOWN)]  IUnknown *    punkVal;      /* VT_UNKNOWN           */
    [case(VT_DISPATCH)] IDispatch *   pdispVal;     /* VT_DISPATCH          */
    [case(VT_ARRAY)]    wirePSAFEARRAY parray;       /* VT_ARRAY            */

    [case(VT_RECORD, VT_RECORD|VT_BYREF)]
                        wireBRECORD   brecVal;      /* VT_RECORD            */

    [case(VT_UI1|VT_BYREF)]
                        BYTE *        pbVal;        /* VT_BYREF|VT_UI1      */
    [case(VT_I2|VT_BYREF)]
                        SHORT *       piVal;        /* VT_BYREF|VT_I2       */
    [case(VT_I4|VT_BYREF)]
                        LONG *        plVal;        /* VT_BYREF|VT_I4       */
    [case(VT_I8|VT_BYREF)]
                        LONGLONG *    pllVal;       /* VT_BYREF|VT_I8       */
    [case(VT_R4|VT_BYREF)]
                        FLOAT *       pfltVal;      /* VT_BYREF|VT_R4       */
    [case(VT_R8|VT_BYREF)]
                        DOUBLE *      pdblVal;      /* VT_BYREF|VT_R8       */
    [case(VT_BOOL|VT_BYREF)]
                        VARIANT_BOOL *pboolVal;     /* VT_BYREF|VT_BOOL     */
    [case(VT_ERROR|VT_BYREF)]
                        SCODE *       pscode;       /* VT_BYREF|VT_ERROR    */
    [case(VT_CY|VT_BYREF)]
                        CY *          pcyVal;       /* VT_BYREF|VT_CY       */
    [case(VT_DATE|VT_BYREF)]
                        DATE *        pdate;        /* VT_BYREF|VT_DATE     */
    [case(VT_BSTR|VT_BYREF)]
                        wireBSTR *    pbstrVal;     /* VT_BYREF|VT_BSTR     */
    [case(VT_UNKNOWN|VT_BYREF)]
                        IUnknown **   ppunkVal;     /* VT_BYREF|VT_UNKNOWN  */
    [case(VT_DISPATCH|VT_BYREF)]
                        IDispatch **  ppdispVal;    /* VT_BYREF|VT_DISPATCH */
    [case(VT_ARRAY|VT_BYREF)]
                        wirePSAFEARRAY *pparray;     /* VT_BYREF|VT_ARRAY   */
    [case(VT_VARIANT|VT_BYREF)]
                        wireVARIANT * pvarVal;      /* VT_BYREF|VT_VARIANT  */

    [case(VT_I1)]       CHAR          cVal;         /* VT_I1                */
    [case(VT_UI2)]      USHORT        uiVal;        /* VT_UI2               */
    [case(VT_UI4)]      ULONG         ulVal;        /* VT_UI4               */
    [case(VT_UI8)]      ULONGLONG     ullVal;       /* VT_UI8               */
    [case(VT_INT)]      INT           intVal;       /* VT_INT               */
    [case(VT_UINT)]     UINT          uintVal;      /* VT_UINT              */
    [case(VT_DECIMAL)]  DECIMAL       decVal;       /* VT_DECIMAL           */

    [case(VT_BYREF|VT_DECIMAL)]
                        DECIMAL *     pdecVal;      /* VT_BYREF|VT_DECIMAL  */
    [case(VT_BYREF|VT_I1)]
                        CHAR *        pcVal;        /* VT_BYREF|VT_I1       */
    [case(VT_BYREF|VT_UI2)]
                        USHORT *      puiVal;       /* VT_BYREF|VT_UI2      */
    [case(VT_BYREF|VT_UI4)]
                        ULONG *       pulVal;       /* VT_BYREF|VT_UI4      */
    [case(VT_BYREF|VT_UI8)]
                        ULONGLONG *   pullVal;      /* VT_BYREF|VT_UI8      */
    [case(VT_BYREF|VT_INT)]
                        INT *         pintVal;      /* VT_BYREF|VT_INT      */
    [case(VT_BYREF|VT_UINT)]
                        UINT *        puintVal;     /* VT_BYREF|VT_UINT     */
    [case(VT_EMPTY)]    ;                           /* nothing              */
    [case(VT_NULL)]     ;                           /* nothing              */
    };
};


//########################################################################
//     End of VARIANT & SAFEARRAY
//########################################################################


//TypeInfo stuff.

typedef LONG DISPID;
typedef DISPID MEMBERID;
typedef DWORD HREFTYPE;
+/

//com.Core
/*
enum TYPEKIND {
  TKIND_ENUM,
  TKIND_RECORD,
  TKIND_MODULE,
  TKIND_INTERFACE,
  TKIND_DISPATCH,
  TKIND_COCLASS,
  TKIND_ALIAS,
  TKIND_UNION
}
*/

/*
typedef [v1_enum] enum tagTYPEKIND {
    TKIND_ENUM = 0,
    TKIND_RECORD,
    TKIND_MODULE,
    TKIND_INTERFACE,
    TKIND_DISPATCH,
    TKIND_COCLASS,
    TKIND_ALIAS,
    TKIND_UNION,
    TKIND_MAX                   //
} TYPEKIND;
*/

//com.Core
/*
struct TYPEDESC {
  union {
    TYPEDESC* lptdesc;
    ARRAYDESC* lpadesc;
    uint hreftype;
  }
  VARTYPE vt;
}
*/

/*
typedef struct tagTYPEDESC {
    [switch_type(VARTYPE), switch_is(vt)] union {
        [case(VT_PTR, VT_SAFEARRAY)] struct tagTYPEDESC * lptdesc;
        [case(VT_CARRAY)] struct tagARRAYDESC * lpadesc;
        [case(VT_USERDEFINED)] HREFTYPE hreftype;
        [default]   ;
    };
    VARTYPE vt;
} TYPEDESC;
*/

//com.Core
/*
struct ARRAYDESC {
  TYPEDESC tdescElem;
  ushort cDims;
  SAFEARRAYBOUND[1] rgbounds;
}
*/

/+
typedef struct tagARRAYDESC {
    TYPEDESC tdescElem;         /* element type */
    USHORT cDims;               /* dimension count */
    [size_is(cDims)] SAFEARRAYBOUND rgbounds[]; /* var len array of bounds */
} ARRAYDESC;
+/
// parameter description

    //com.Core
    /*
    struct PARAMDESCEX {
      uint cBytes;
      DWINVARIANT varDefaultValue;
    }
    */
/+
typedef struct tagPARAMDESCEX {
    ULONG cBytes;               /* size of this structure */
    VARIANTARG varDefaultValue; /* default value of this parameter */
} PARAMDESCEX, * LPPARAMDESCEX;
+/

    //com.Core
    /*
    struct PARAMDESC {
      PARAMDESCEX* pparamdescex;
      ushort wParamFlags;
    }
    */

/*
typedef struct tagPARAMDESC {
    LPPARAMDESCEX pparamdescex; // valid if PARAMFLAG_FHASDEFAULT bit is set
    USHORT wParamFlags;         // IN, OUT, etc
} PARAMDESC, * LPPARAMDESC;
*/

enum : ushort {
  PARAMFLAG_NONE = 0x0,
  PARAMFLAG_FIN = 0x1,
  PARAMFLAG_FOUT = 0x2,
  PARAMFLAG_FLCID = 0x4,
  PARAMFLAG_FRETVAL = 0x8,
  PARAMFLAG_FOPT = 0x10,
  PARAMFLAG_FHASDEFAULT = 0x20,
  PARAMFLAG_FHASCUSTDATA = 0x40
}

/+
const USHORT PARAMFLAG_NONE         = 0x00;
const USHORT PARAMFLAG_FIN          = 0x01;
const USHORT PARAMFLAG_FOUT         = 0x02;
const USHORT PARAMFLAG_FLCID        = 0x04;
const USHORT PARAMFLAG_FRETVAL      = 0x08;
const USHORT PARAMFLAG_FOPT         = 0x10;
const USHORT PARAMFLAG_FHASDEFAULT  = 0x20;
const USHORT PARAMFLAG_FHASCUSTDATA = 0x40;
+/

//com.Core

/*
struct IDLDESC {
  uint dwReserved;
  ushort wIDLFlags;
}
*/

/*
typedef struct tagIDLDESC {
    ULONG_PTR dwReserved;
    USHORT wIDLFlags;           // IN, OUT, etc
} IDLDESC, * LPIDLDESC;
*/

/+
const USHORT IDLFLAG_NONE    = PARAMFLAG_NONE;
const USHORT IDLFLAG_FIN     = PARAMFLAG_FIN;
const USHORT IDLFLAG_FOUT    = PARAMFLAG_FOUT;
const USHORT IDLFLAG_FLCID   = PARAMFLAG_FLCID;
const USHORT IDLFLAG_FRETVAL = PARAMFLAG_FRETVAL;

cpp_quote("//;begin_internal")
cpp_quote("#if 0")
cpp_quote("/* the following is what MIDL knows how to remote */")
+/

//com.Core
    /*
    struct ELEMDESC {
      TYPEDESC tdesc;
      union {
        IDLDESC idldesc;
        PARAMDESC paramdesc;
      }
    }
    */
    
    /+
typedef struct tagELEMDESC {    /* a format that MIDL likes */
    TYPEDESC tdesc;             /* the type of the element */
    PARAMDESC paramdesc;        /* IDLDESC is a subset of PARAMDESC */
} ELEMDESC;
+/


/+
cpp_quote("#else /* 0 */")
cpp_quote("//;end_internal")
cpp_quote("typedef struct tagELEMDESC {")
cpp_quote("    TYPEDESC tdesc;             /* the type of the element */")
cpp_quote("    union {")
cpp_quote("        IDLDESC idldesc;        /* info for remoting the element */")
cpp_quote("        PARAMDESC paramdesc;    /* info about the parameter */")
cpp_quote("    };")
cpp_quote("} ELEMDESC, * LPELEMDESC;")
cpp_quote("//;begin_internal")
cpp_quote("#endif /* 0 */")
cpp_quote("//;end_internal")
+/

//com.Core
/*
struct TYPEATTR {
  DWINGUID guid;
  uint lcid;
  uint dwReserved;
  int memidConstructor;
  int memidDestructor;
  wchar* lpstrSchema;
  uint cbSizeInstance;
  TYPEKIND typekind;
  ushort cFuncs;
  ushort cVars;
  ushort cImplTypes;
  ushort cbSizeVft;
  ushort cbAlignment;
  ushort wTypeFlags;
  ushort wMajorVerNum;
  ushort wMinorVerNum;
  TYPEDESC tdescAlias;
  IDLDESC idldescType;
}
*/

/+
typedef struct tagTYPEATTR {
    GUID guid;                  /* the GUID of the TypeInfo */
    LCID lcid;                  /* locale of member names and doc strings */
    DWORD dwReserved;
    MEMBERID memidConstructor;  /* ID of constructor, MEMBERID_NIL if none */
    MEMBERID memidDestructor;   /* ID of destructor, MEMBERID_NIL if none */
    LPOLESTR lpstrSchema;
    ULONG cbSizeInstance;       /* the size of an instance of this type */
    TYPEKIND typekind;          /* the kind of type this typeinfo describes */
    WORD cFuncs;                /* number of functions */
    WORD cVars;                 /* number of variables / data members */
    WORD cImplTypes;            /* number of implemented interfaces */
    WORD cbSizeVft;             /* the size of this types virtual func table */
    WORD cbAlignment;           /* specifies the alignment requirements for
                                   an instance of this type,
                                   0 = align on 64k boundary
                                   1 = byte align
                                   2 = word align
                                   4 = dword align... */
    WORD wTypeFlags;
    WORD wMajorVerNum;          /* major version number */
    WORD wMinorVerNum;          /* minor version number */
    TYPEDESC tdescAlias;        /* if typekind == TKIND_ALIAS this field
                                   specifies the type for which this type
                                   is an alias */
    IDLDESC idldescType;        /* IDL attributes of the described type */
} TYPEATTR, * LPTYPEATTR;
+/

//com.Core
/*
struct DISPPARAMS {
  DWINVARIANT* rgvarg;
  int* rgdispidNamedArgs;
  uint cArgs;
  uint cNamedArgs;
}
*/

/+
typedef struct tagDISPPARAMS {
    [size_is(cArgs)] VARIANTARG * rgvarg;
    [size_is(cNamedArgs)] DISPID * rgdispidNamedArgs;
    UINT cArgs;
    UINT cNamedArgs;
} DISPPARAMS;
+/

/+
cpp_quote("//;begin_internal")
cpp_quote("#if 0")
cpp_quote("/* the following is what MIDL knows how to remote */")

midl_pragma warning( disable: 2395) // polymorphic types not supported in the TLB
+/

//com.Core
/*
struct EXCEPINFO {
  ushort wCode;
  ushort wReserved;
  wchar* bstrSource;
  wchar* bstrDescription;
  wchar* bstrHelpFile;
  uint dwHelpContext;
  void* pvReserved;
  int function(EXCEPINFO*) pfnDeferredFillIn;
  int scode;
}
*/

/+
typedef struct tagEXCEPINFO {
    WORD  wCode;            /* An error code describing the error. */
    WORD  wReserved;
    BSTR  bstrSource;       /* A source of the exception */
    BSTR  bstrDescription;  /* A description of the error */
    BSTR  bstrHelpFile;     /* Fully qualified drive, path, and file name */
    DWORD dwHelpContext;    /* help context of topic within the help file */
    // We can use ULONG_PTR here, because EXCEPINFO is marshalled by RPC
    // RPC will marshal pfnDeferredFillIn.
    ULONG_PTR pvReserved;
    ULONG_PTR pfnDeferredFillIn;
    SCODE scode;
} EXCEPINFO;
+/

/+
cpp_quote("#else /* 0 */")
cpp_quote("//;end_internal")
cpp_quote("typedef struct tagEXCEPINFO {")
cpp_quote("    WORD  wCode;")
cpp_quote("    WORD  wReserved;")
cpp_quote("    BSTR  bstrSource;")
cpp_quote("    BSTR  bstrDescription;")
cpp_quote("    BSTR  bstrHelpFile;")
cpp_quote("    DWORD dwHelpContext;")
cpp_quote("    PVOID pvReserved;")
cpp_quote("    HRESULT (__stdcall *pfnDeferredFillIn)(struct tagEXCEPINFO *);")
cpp_quote("    SCODE scode;")
cpp_quote("} EXCEPINFO, * LPEXCEPINFO;")
cpp_quote("//;begin_internal")
cpp_quote("#endif /* 0 */")
cpp_quote("//;end_internal")
+/

//com.Core
/*
enum CALLCONV {
  CC_FASTCALL,
  CC_CDECL,
  CC_MSPASCAL,
  CC_PASCAL = CC_MSPASCAL,
  CC_MACPASCAL,
  CC_STDCALL,
  CC_FPFASTCALL,
  CC_SYSCALL,
  CC_MPWCDECL,
  CC_MPWPASCAL
}
*/

/*
typedef [v1_enum] enum tagCALLCONV {
    CC_FASTCALL = 0,
    CC_CDECL = 1,
    CC_MSCPASCAL,
    CC_PASCAL = CC_MSCPASCAL,
    CC_MACPASCAL,
    CC_STDCALL,
    CC_FPFASTCALL,
    CC_SYSCALL,
    CC_MPWCDECL,
    CC_MPWPASCAL,
    CC_MAX          // end of enum marker
} CALLCONV;
*/

//com.Core
/*
enum FUNCKIND {
  FUNC_VIRTUAL,
  FUNC_PUREVIRTUAL,
  FUNC_NONVIRTUAL,
  FUNC_STATIC,
  FUNC_DISPATCH
}
*/

/*
typedef [v1_enum] enum tagFUNCKIND {
    FUNC_VIRTUAL,
    FUNC_PUREVIRTUAL,
    FUNC_NONVIRTUAL,
    FUNC_STATIC,
    FUNC_DISPATCH
} FUNCKIND;
*/

//com.Core
/*
enum INVOKEKIND {
  INVOKE_FUNC = 1,
  INVOKE_PROPERTYGET = 2,
  INVOKE_PROPERTYPUT = 4,
  INVOKE_PROPERTYPUTREF = 8
}
*/

/*
typedef [v1_enum] enum tagINVOKEKIND {
    INVOKE_FUNC = 1,
    INVOKE_PROPERTYGET = 2,
    INVOKE_PROPERTYPUT = 4,
    INVOKE_PROPERTYPUTREF = 8
} INVOKEKIND;
*/

//com.Core
/*
    struct FUNCDESC {
      int memid;
      int* lprgscode;
      ELEMDESC* lprgelemdescParam;
      FUNCKIND funckind;
      INVOKEKIND invkind;
      CALLCONV callconv;
      short cParams;
      short cParamsOpt;
      short oVft;
      short cScodes;
      ELEMDESC elemdescFunc;
      ushort wFuncFlags;
    }
    */
    
/+
typedef struct tagFUNCDESC {
    MEMBERID memid;
    [size_is(cScodes)] SCODE * lprgscode;
    [size_is(cParams)] ELEMDESC * lprgelemdescParam; /* array of param types */
    FUNCKIND funckind;
    INVOKEKIND invkind;
    CALLCONV callconv;
    SHORT cParams;
    SHORT cParamsOpt;
    SHORT oVft;
    SHORT cScodes;
    ELEMDESC elemdescFunc;
    WORD wFuncFlags;
} FUNCDESC, * LPFUNCDESC;
+/

//com.Core
/*
enum VARKIND {
  VAR_PERSISTANCE,
  VAR_STATIC,
  VAR_CONST,
  VAR_DISPATCH
}    
*/
/+
typedef [v1_enum] enum tagVARKIND {
    VAR_PERINSTANCE,
    VAR_STATIC,
    VAR_CONST,
    VAR_DISPATCH
} VARKIND;

+/

enum : ushort {
  IMPLTYPEFLAG_FDEFAULT = 0x1,
  IMPLTYPEFLAG_FSOURCE = 0x2,
  IMPLTYPEFLAG_FRESTRICTED = 0x4,
  IMPLTYPEFLAG_FDEFAULTVTABLE = 0x8
}

/*
const USHORT IMPLTYPEFLAG_FDEFAULT      = 0x1;
const USHORT IMPLTYPEFLAG_FSOURCE       = 0x2;
const USHORT IMPLTYPEFLAG_FRESTRICTED   = 0x4;
const USHORT IMPLTYPEFLAG_FDEFAULTVTABLE= 0x8;
*/

//com.Core
/*
struct VARDESC {
  int memid;
  wchar* lpstrSchema;
  union {
    uint oInst;
    DWINVARIANT* lpvarValue;
  }
  ELEMDESC elemdescVar;
  ushort wVarFlags;
  VARKIND varkind;
}
*/

/+
typedef struct tagVARDESC {
    MEMBERID memid;
    LPOLESTR lpstrSchema;
    [switch_type(VARKIND), switch_is(varkind)] union {
        /* offset of variable within the instance */
        [case(VAR_PERINSTANCE, VAR_DISPATCH, VAR_STATIC)] ULONG oInst;
        [case(VAR_CONST)] VARIANT * lpvarValue; /* the value of the constant */
    };
    ELEMDESC elemdescVar;
    WORD     wVarFlags;
    VARKIND  varkind;
} VARDESC, * LPVARDESC;
+/

enum TYPEFLAGS : ushort {
  TYPEFLAG_FAPPOBJECT = 0x1,
  TYPEFLAG_FCANCREATE = 0x2,
  TYPEFLAG_FLICENSED = 0x4,
  TYPEFLAG_FPREDECLID = 0x8,
  TYPEFLAG_FHIDDEN = 0x10,
  TYPEFLAG_FCONTROL = 0x20,
  TYPEFLAG_FDUAL = 0x40,
  TYPEFLAG_FNONEXTENSIBLE = 0x80,
  TYPEFLAG_FOLEAUTOMATION = 0x100,
  TYPEFLAG_FRESTRICTED = 0x200,
  TYPEFLAG_FAGGREGATABLE = 0x400,
  TYPEFLAG_FREPLACEABLE = 0x800,
  TYPEFLAG_FDISPATCHABLE = 0x1000,
  TYPEFLAG_FREVERSEBIND = 0x2000,
  TYPEFLAG_FPROXY = 0x4000
}

/*
typedef enum tagTYPEFLAGS {
    TYPEFLAG_FAPPOBJECT = 0x01,
    TYPEFLAG_FCANCREATE = 0x02,
    TYPEFLAG_FLICENSED = 0x04,
    TYPEFLAG_FPREDECLID = 0x08,
    TYPEFLAG_FHIDDEN = 0x10,
    TYPEFLAG_FCONTROL = 0x20,
    TYPEFLAG_FDUAL = 0x40,
    TYPEFLAG_FNONEXTENSIBLE = 0x80,
    TYPEFLAG_FOLEAUTOMATION = 0x100,
    TYPEFLAG_FRESTRICTED = 0x200,
    TYPEFLAG_FAGGREGATABLE = 0x400,
    TYPEFLAG_FREPLACEABLE = 0x800,
    TYPEFLAG_FDISPATCHABLE = 0x1000,
    TYPEFLAG_FREVERSEBIND = 0x2000,
    TYPEFLAG_FPROXY = 0x4000
} TYPEFLAGS;
*/

enum FUNCFLAGS : ushort {
  FUNCFLAG_FRESTRICTED = 0x1,
  FUNCFLAG_FSOURCE = 0x2,
  FUNCFLAG_FBINDABLE = 0x4,
  FUNCFLAG_FREQUESTEDIT = 0x8,
  FUNCFLAG_FDISPLAYBIND = 0x10,
  FUNCFLAG_FDEFAULTBIND = 0x20,
  FUNCFLAG_FHIDDEN = 0x40,
  FUNCFLAG_FUSESGETLASTERROR = 0x80,
  FUNCFLAG_FDEFAULTCOLLELEM = 0x100,
  FUNCFLAG_FUIDEFAULT = 0x200,
  FUNCFLAG_FNONBROWSABLE = 0x400,
  FUNCFLAG_FREPLACEABLE = 0x800,
  FUNCFLAG_FIMMEDIATEBIND = 0x1000
}

/*
typedef enum tagFUNCFLAGS {
    FUNCFLAG_FRESTRICTED = 0x1,
    FUNCFLAG_FSOURCE = 0x2,
    FUNCFLAG_FBINDABLE = 0x4,
    FUNCFLAG_FREQUESTEDIT = 0x8,
    FUNCFLAG_FDISPLAYBIND = 0x10,
    FUNCFLAG_FDEFAULTBIND = 0x20,
    FUNCFLAG_FHIDDEN = 0x40,
    FUNCFLAG_FUSESGETLASTERROR = 0x80,
    FUNCFLAG_FDEFAULTCOLLELEM = 0x100,
    FUNCFLAG_FUIDEFAULT = 0x200,
    FUNCFLAG_FNONBROWSABLE = 0x400,
    FUNCFLAG_FREPLACEABLE = 0x800,
    FUNCFLAG_FIMMEDIATEBIND = 0x1000
} FUNCFLAGS;
*/

enum VARFLAGS : ushort {
  VARFLAG_FREADONLY = 0x1,
  VARFLAG_FSOURCE = 0x2,
  VARFLAG_FBINDABLE = 0x4,
  VARFLAG_FREQUESTEDIT = 0x8,
  VARFLAG_FDISPLAYBIND = 0x10,
  VARFLAG_FDEFAULTBIND = 0x20,
  VARFLAG_FHIDDEN = 0x40,
  VARFLAG_FRESTRICTED = 0x80,
  VARFLAG_FDEFAULTCOLLELEM = 0x100,
  VARFLAG_FUIDEFAULT = 0x200,
  VARFLAG_FNONBROWSABLE = 0x400,
  VARFLAG_FREPLACEABLE = 0x800,
  VARFLAG_FIMMEDIATEBIND = 0x1000
}
/*
typedef enum tagVARFLAGS {
    VARFLAG_FREADONLY = 0x1,
    VARFLAG_FSOURCE = 0x2,
    VARFLAG_FBINDABLE = 0x4,
    VARFLAG_FREQUESTEDIT = 0x8,
    VARFLAG_FDISPLAYBIND = 0x10,
    VARFLAG_FDEFAULTBIND = 0x20,
    VARFLAG_FHIDDEN = 0x40,
    VARFLAG_FRESTRICTED = 0x80,
    VARFLAG_FDEFAULTCOLLELEM = 0x100,
    VARFLAG_FUIDEFAULT = 0x200,
    VARFLAG_FNONBROWSABLE = 0x400,
    VARFLAG_FREPLACEABLE = 0x800,
    VARFLAG_FIMMEDIATEBIND = 0x1000
} VARFLAGS;
*/

/+
typedef [wire_marshal(DWORD)] struct tagCLEANLOCALSTORAGE {
    IUnknown * pInterface;      /* interface that is responsible for storage */
    PVOID pStorage;             /* the storage being managed by interface */
    DWORD flags;                /* which interface, what storage */
} CLEANLOCALSTORAGE;
+/

    struct CUSTDATAITEM {
      DWINGUID guid;
      DWINVARIANT varValue;
    }

    struct CUSTDATA {
      uint cCustData;
      CUSTDATAITEM* prgCustData;
    }

/+
typedef struct tagCUSTDATAITEM {
    GUID guid;           /* guid identifying this custom data item */
    VARIANTARG varValue; /* value of this custom data item */
} CUSTDATAITEM, * LPCUSTDATAITEM;

typedef struct tagCUSTDATA {
    DWORD cCustData;            /* number of custom data items in rgCustData */
    [size_is(cCustData)] LPCUSTDATAITEM prgCustData;
                                /* array of custom data items */
} CUSTDATA, * LPCUSTDATA;

}
+/

interface ICreateTypeInfo : IUnknown {
  mixin(uuid("00020405-0000-0000-c000-000000000046"));
  int SetGuid(ref DWINGUID guid);
  int SetTypeFlags(uint uTypeFlags);
  int SetDocString(wchar* szStrDoc);
  int SetHelpContext(uint dwHelpContext);
  int SetVersion(ushort wMajorVerNum, ushort wMinorVerNum);
  int AddRefTypeInfo(ITypeInfo pTInfo, uint* phRefType);
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

/*
[
    object,
    uuid(00020405-0000-0000-C000-000000000046),
    pointer_default(unique),
    local
]

interface ICreateTypeInfo: IUnknown
{
    typedef [unique] ICreateTypeInfo * LPCREATETYPEINFO;

    HRESULT SetGuid(
                [in] REFGUID guid
            );

    HRESULT SetTypeFlags(
                [in] UINT uTypeFlags
            );

    HRESULT SetDocString(
                [in] LPOLESTR pStrDoc
            );

    HRESULT SetHelpContext(
                [in] DWORD dwHelpContext
            );

    HRESULT SetVersion(
                [in] WORD wMajorVerNum,
                [in] WORD wMinorVerNum
            );

    HRESULT AddRefTypeInfo(

                [in] ITypeInfo * pTInfo,
                [in] HREFTYPE * phRefType
            );

    HRESULT AddFuncDesc(
                [in] UINT index,
                [in] FUNCDESC * pFuncDesc
            );

    HRESULT AddImplType(
                [in] UINT index,
                [in] HREFTYPE hRefType
            );

    HRESULT SetImplTypeFlags(
                [in] UINT index,
                [in] INT implTypeFlags
            );

    HRESULT SetAlignment(
                [in] WORD cbAlignment
            );

    HRESULT SetSchema(
                [in] LPOLESTR pStrSchema
            );

    HRESULT AddVarDesc(
                [in] UINT index,
                [in] VARDESC * pVarDesc
            );

    HRESULT SetFuncAndParamNames(
                [in] UINT index,
                [in, size_is((UINT) cNames)]
                [in] LPOLESTR * rgszNames,
                [in] UINT cNames
            );

    HRESULT SetVarName(
                [in] UINT index,
                [in] LPOLESTR szName
            );

    HRESULT SetTypeDescAlias(
                [in] TYPEDESC * pTDescAlias
            );

    HRESULT DefineFuncAsDllEntry(
                [in] UINT index,
                [in] LPOLESTR szDllName,
                [in] LPOLESTR szProcName
            );

    HRESULT SetFuncDocString(
                [in] UINT index,
                [in] LPOLESTR szDocString
            );

    HRESULT SetVarDocString(
                [in] UINT index,
                [in] LPOLESTR szDocString
            );

    HRESULT SetFuncHelpContext(
                [in] UINT index,
                [in] DWORD dwHelpContext
            );

    HRESULT SetVarHelpContext(
                [in] UINT index,
                [in] DWORD dwHelpContext
            );

    HRESULT SetMops(
                [in] UINT index,
                [in] BSTR bstrMops
            );

    HRESULT SetTypeIdldesc(
                [in] IDLDESC * pIdlDesc
            );

    HRESULT LayOut(
                void
            );

}
*/

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

/+
[
    object,
    uuid(0002040E-0000-0000-C000-000000000046),
    pointer_default(unique),
    local
]

interface ICreateTypeInfo2: ICreateTypeInfo
{
    typedef [unique] ICreateTypeInfo2 * LPCREATETYPEINFO2;

    HRESULT DeleteFuncDesc(
                [in] UINT index
            );

    HRESULT DeleteFuncDescByMemId(
                [in] MEMBERID memid,
                [in] INVOKEKIND invKind
            );

    HRESULT DeleteVarDesc(
                [in] UINT index
            );

    HRESULT DeleteVarDescByMemId(
                [in] MEMBERID memid
            );

    HRESULT DeleteImplType(
                [in] UINT index
            );

    HRESULT SetCustData(
                [in] REFGUID guid,
                [in] VARIANT * pVarVal
            );

    HRESULT SetFuncCustData( 
                [in] UINT index, 
                [in] REFGUID guid, 
                [in] VARIANT * pVarVal
            );
    
    HRESULT SetParamCustData( 
                [in] UINT indexFunc, 
                [in] UINT indexParam, 
                [in] REFGUID guid, 
                [in] VARIANT * pVarVal
            );

    HRESULT SetVarCustData( 
                [in] UINT index, 
                [in] REFGUID guid, 
                [in] VARIANT * pVarVal
            );

    HRESULT SetImplTypeCustData( 
                [in] UINT index, 
                [in] REFGUID guid, 
                [in] VARIANT * pVarVal
            );

    HRESULT SetHelpStringContext(
                [in] ULONG dwHelpStringContext
            );

    HRESULT SetFuncHelpStringContext(
                [in] UINT index,
                [in] ULONG dwHelpStringContext
            );

    HRESULT SetVarHelpStringContext(
                [in] UINT index,
                [in] ULONG dwHelpStringContext
            );

    HRESULT Invalidate(
                void
            );

    HRESULT SetName(
                [in]  LPOLESTR szName
            );

}
+/

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

/*
[
    object,
    uuid(00020406-0000-0000-C000-000000000046),
    pointer_default(unique),
    local
]

interface ICreateTypeLib : IUnknown
{
    typedef [unique] ICreateTypeLib * LPCREATETYPELIB;

    HRESULT CreateTypeInfo(
                [in]  LPOLESTR szName,
                [in]  TYPEKIND tkind,
                [out] ICreateTypeInfo ** ppCTInfo
            );

    HRESULT SetName(
                [in]  LPOLESTR szName
            );

    HRESULT SetVersion(
                [in] WORD wMajorVerNum,
                [in] WORD wMinorVerNum
            );

    HRESULT SetGuid(
                [in] REFGUID guid
            );

    HRESULT SetDocString(
                [in] LPOLESTR szDoc
            );

    HRESULT SetHelpFileName(
                [in] LPOLESTR szHelpFileName
            );

    HRESULT SetHelpContext(
                [in] DWORD dwHelpContext
            );

    HRESULT SetLcid(
                [in] LCID lcid
            );

    HRESULT SetLibFlags(
                [in] UINT uLibFlags
            );

    HRESULT SaveAllChanges(
                void
            );
}
*/




interface ICreateTypeLib2 : ICreateTypeLib {
  mixin(uuid("0002040f-0000-0000-c000-000000000046"));
  int DeleteTypeInfo(wchar* szName);
  int SetCustData(ref DWINGUID guid, ref DWINVARIANT pVarVal);
  int SetHelpStringContext(uint dwHelpStringContext);
  int SetHelpStringDll(wchar* szFileName);
}



/*
[
    object,
    uuid(0002040F-0000-0000-C000-000000000046),
    pointer_default(unique),
    local
]

interface ICreateTypeLib2 : ICreateTypeLib
{
    typedef [unique] ICreateTypeLib2 * LPCREATETYPELIB2;

    HRESULT DeleteTypeInfo(
                [in] LPOLESTR szName
            );

    HRESULT SetCustData(
                [in] REFGUID guid,
                [in] VARIANT * pVarVal
            );

    HRESULT SetHelpStringContext(
                [in] ULONG dwHelpStringContext
            );

    HRESULT SetHelpStringDll(
                [in] LPOLESTR szFileName
            );
}
*/

/+
[
    object,
    uuid(00020400-0000-0000-C000-000000000046),
    pointer_default(unique)
]

interface IDispatch : IUnknown
{
    typedef [unique] IDispatch * LPDISPATCH;

    HRESULT GetTypeInfoCount(
                [out] UINT * pctinfo
            );

    HRESULT GetTypeInfo(
                [in] UINT iTInfo,
                [in] LCID lcid,
                [out] ITypeInfo ** ppTInfo
            );

    HRESULT GetIDsOfNames(
                [in] REFIID riid,
                [in, size_is(cNames)] LPOLESTR * rgszNames,
                [in] UINT cNames,
                [in] LCID lcid,
                [out, size_is(cNames)] DISPID * rgDispId
            );

    [local]
    HRESULT Invoke(
                [in] DISPID dispIdMember,
                [in] REFIID riid,
                [in] LCID lcid,
                [in] WORD wFlags,
                [in, out] DISPPARAMS * pDispParams,
                [out] VARIANT * pVarResult,
                [out] EXCEPINFO * pExcepInfo,
                [out] UINT * puArgErr
            );

    [call_as(Invoke)]
    HRESULT RemoteInvoke(
                [in] DISPID dispIdMember,
                [in] REFIID riid,
                [in] LCID lcid,
                [in] DWORD dwFlags,
                [in] DISPPARAMS * pDispParams,
                [out] VARIANT * pVarResult,
                [out] EXCEPINFO * pExcepInfo,
                [out] UINT * pArgErr,
                [in] UINT cVarRef,
                [in, size_is(cVarRef)] UINT * rgVarRefIdx, 
                [in, out, size_is(cVarRef)] VARIANTARG * rgVarRef
            );

cpp_quote("/* DISPID reserved to indicate an \"unknown\" name */")
cpp_quote("/* only reserved for data members (properties); reused as a method dispid below */")
const DISPID DISPID_UNKNOWN = -1;

cpp_quote("/* DISPID reserved for the \"value\" property */")
const DISPID DISPID_VALUE = 0;

cpp_quote("/* The following DISPID is reserved to indicate the param")
cpp_quote(" * that is the right-hand-side (or \"put\" value) of a PropertyPut")
cpp_quote(" */")
const DISPID DISPID_PROPERTYPUT = -3;

cpp_quote("/* DISPID reserved for the standard \"NewEnum\" method */")
const DISPID DISPID_NEWENUM = -4;

cpp_quote("/* DISPID reserved for the standard \"Evaluate\" method */")
const DISPID DISPID_EVALUATE = -5;

const DISPID DISPID_CONSTRUCTOR = -6;

const DISPID DISPID_DESTRUCTOR = -7;

const DISPID DISPID_COLLECT = -8;

cpp_quote("/* The range -500 through -999 is reserved for Controls */")
cpp_quote("/* The range 0x80010000 through 0x8001FFFF is reserved for Controls */")
cpp_quote("/* The range -5000 through -5499 is reserved for ActiveX Accessability */")
cpp_quote("/* The range -2000 through -2499 is reserved for VB5 */")
cpp_quote("/* The range -3900 through -3999 is reserved for Forms */")
cpp_quote("/* The range -5500 through -5550 is reserved for Forms */")
cpp_quote("/* The remainder of the negative DISPIDs are reserved for future use */")

}
+/

    interface IEnumVARIANT : IUnknown {
      // static DWINGUID IID = { 0x00020404, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int Next(uint celt, DWINVARIANT* rgVar, out uint pCeltFetched);
      int Skip(uint celt);
      int Reset();
      int Clone(out IEnumVARIANT ppEnum);
    }

/*
[
    object,
    uuid(00020404-0000-0000-C000-000000000046),
    pointer_default(unique)
]

interface IEnumVARIANT : IUnknown
{
    typedef [unique] IEnumVARIANT* LPENUMVARIANT;

    [local]
    HRESULT Next(
                [in] ULONG celt,
                [out, size_is(celt), length_is(*pCeltFetched)] VARIANT * rgVar,
                [out] ULONG * pCeltFetched
            );

    [call_as(Next)]
    HRESULT RemoteNext(
                [in] ULONG celt,
                [out, size_is(celt), length_is(*pCeltFetched)] VARIANT * rgVar,
                [out] ULONG * pCeltFetched
            );

    HRESULT Skip(
                [in] ULONG celt
            );

    HRESULT Reset(
            );

    HRESULT Clone(
                [out] IEnumVARIANT ** ppEnum
            );
}
*/

//com.Core
/*
struct BINDPTR {
  FUNCDESC* lpfuncdesc;
  VARDESC* lpvardesc;
  ITypeComp lptcomp;
}
*/

//com.Core
/*
    interface ITypeComp : IUnknown {
      mixin(uuid("00020403-0000-0000-c000-000000000046"));        
      // static DWINGUID IID = { 0x00020403, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int Bind(wchar* szName, uint lHashVal, ushort wFlags, out ITypeInfo ppTInfo, out DESCKIND pDescKind, out BINDPTR pBindPtr);
      int BindType(wchar* szName, uint lHashVal, out ITypeInfo ppTInfo, out ITypeComp ppTComp);
    }
*/

//com.Core
/*
enum DESCKIND {
  DESCKIND_NONE,
  DESCKIND_FUNCDESC,
  DESCKIND_VARDESC,
  DESCKIND_TYPECOMP,
  DESCKIND_IMPLICITAPPOBJ
}
*/

/+
[
    object,
    uuid(00020403-0000-0000-C000-000000000046),
    pointer_default(unique)
]

interface ITypeComp : IUnknown
{
    typedef [unique] ITypeComp * LPTYPECOMP;

    typedef [v1_enum] enum tagDESCKIND {
        DESCKIND_NONE = 0,
        DESCKIND_FUNCDESC,
        DESCKIND_VARDESC,
        DESCKIND_TYPECOMP,
        DESCKIND_IMPLICITAPPOBJ,
        DESCKIND_MAX
    } DESCKIND;

    typedef union tagBINDPTR {
        FUNCDESC  * lpfuncdesc;
        VARDESC   * lpvardesc;
        ITypeComp * lptcomp;
    } BINDPTR, * LPBINDPTR;

    [local]
    HRESULT Bind(
                [in] LPOLESTR szName,
                [in] ULONG lHashVal,
                [in] WORD wFlags,
                [out] ITypeInfo ** ppTInfo,
                [out] DESCKIND * pDescKind,
                [out] BINDPTR * pBindPtr
            );

    [call_as(Bind)]
    HRESULT RemoteBind(
                [in] LPOLESTR szName,
                [in] ULONG lHashVal,
                [in] WORD wFlags,
                [out] ITypeInfo ** ppTInfo,
                [out] DESCKIND * pDescKind,
                [out] LPFUNCDESC * ppFuncDesc,
                [out] LPVARDESC * ppVarDesc,
                [out] ITypeComp ** ppTypeComp,
                [out] CLEANLOCALSTORAGE * pDummy
            );

    [local]
    HRESULT BindType(
                [in] LPOLESTR szName,
                [in] ULONG lHashVal,
                [out] ITypeInfo ** ppTInfo,
                [out] ITypeComp ** ppTComp
            );

    [call_as(BindType)]
    HRESULT RemoteBindType(
                [in] LPOLESTR szName,
                [in] ULONG lHashVal,
                [out] ITypeInfo ** ppTInfo
            );
}
+/

/+
[
    object,
    uuid(00020401-0000-0000-C000-000000000046),
    pointer_default(unique)
]

interface ITypeInfo : IUnknown
{
    typedef [unique] ITypeInfo * LPTYPEINFO;

    [local]
    HRESULT GetTypeAttr(
                [out] TYPEATTR ** ppTypeAttr
            );

    [call_as(GetTypeAttr)]
    HRESULT RemoteGetTypeAttr(
                [out] LPTYPEATTR * ppTypeAttr,
                [out] CLEANLOCALSTORAGE * pDummy
            );

    HRESULT GetTypeComp(
                [out] ITypeComp ** ppTComp
            );

    [local]
    HRESULT GetFuncDesc(
                [in] UINT index,
                [out] FUNCDESC ** ppFuncDesc
            );

    [call_as(GetFuncDesc)]
    HRESULT RemoteGetFuncDesc(
                [in] UINT index,
                [out] LPFUNCDESC * ppFuncDesc,
                [out] CLEANLOCALSTORAGE * pDummy
            );

    [local]
    HRESULT GetVarDesc(
                [in] UINT index,
                [out] VARDESC ** ppVarDesc
            );

    [call_as(GetVarDesc)]
    HRESULT RemoteGetVarDesc(
                [in] UINT index,
                [out] LPVARDESC * ppVarDesc,
                [out] CLEANLOCALSTORAGE * pDummy
            );

    [local]
    HRESULT GetNames(
                [in] MEMBERID memid,
                [out,size_is(cMaxNames),length_is(*pcNames)] BSTR * rgBstrNames,
                [in] UINT cMaxNames,
                [out] UINT * pcNames
            );

    [call_as(GetNames)]
    HRESULT RemoteGetNames(
                [in] MEMBERID memid,
                [out,size_is(cMaxNames),length_is(*pcNames)] BSTR * rgBstrNames,
                [in] UINT cMaxNames,
                [out] UINT * pcNames
            );

    HRESULT GetRefTypeOfImplType(
                [in] UINT index,
                [out] HREFTYPE * pRefType
            );

    HRESULT GetImplTypeFlags(
                [in] UINT index,
                [out] INT * pImplTypeFlags
            );

    [local]
    HRESULT GetIDsOfNames(
                [in, size_is(cNames)] LPOLESTR * rgszNames,
                [in] UINT cNames,
                [out, size_is(cNames)] MEMBERID * pMemId
            );

    [call_as(GetIDsOfNames)]
    HRESULT LocalGetIDsOfNames(
                void
            );

    [local]
    HRESULT Invoke(
                [in] PVOID pvInstance,
                [in] MEMBERID memid,
                [in] WORD wFlags,
                [in, out] DISPPARAMS * pDispParams,
                [out] VARIANT * pVarResult,
                [out] EXCEPINFO * pExcepInfo,
                [out] UINT * puArgErr
            );

    [call_as(Invoke)]
    HRESULT LocalInvoke (
                void
            );

    [local]
    HRESULT GetDocumentation(
                [in] MEMBERID memid,
                [out] BSTR * pBstrName,
                [out] BSTR * pBstrDocString,
                [out] DWORD * pdwHelpContext,
                [out] BSTR * pBstrHelpFile
            );

    [call_as(GetDocumentation)]
    HRESULT RemoteGetDocumentation(
                [in] MEMBERID memid,
                [in] DWORD refPtrFlags,
                [out] BSTR * pBstrName,
                [out] BSTR * pBstrDocString,
                [out] DWORD * pdwHelpContext,
                [out] BSTR * pBstrHelpFile
            );

    [local]
    HRESULT GetDllEntry(
                [in] MEMBERID memid,
                [in] INVOKEKIND invKind,
                [out] BSTR * pBstrDllName,
                [out] BSTR * pBstrName,
                [out] WORD * pwOrdinal
            );

    [call_as(GetDllEntry)]
    HRESULT RemoteGetDllEntry(
                [in] MEMBERID memid,
                [in] INVOKEKIND invKind,
                [in] DWORD refPtrFlags,
                [out] BSTR * pBstrDllName,
                [out] BSTR * pBstrName,
                [out] WORD * pwOrdinal
            );

    HRESULT GetRefTypeInfo(
                [in] HREFTYPE hRefType,
                [out] ITypeInfo ** ppTInfo
            );

    [local]
    HRESULT AddressOfMember(
                [in] MEMBERID memid,
                [in] INVOKEKIND invKind,
                [out] PVOID * ppv
            );

    [call_as(AddressOfMember)]
    HRESULT LocalAddressOfMember(
                void
            );

    [local]
    HRESULT CreateInstance(
                [in] IUnknown * pUnkOuter,
                [in] REFIID riid,
                [out, iid_is(riid)] PVOID * ppvObj
            );

    [call_as(CreateInstance)]
    HRESULT RemoteCreateInstance(
                [in] REFIID riid,
                [out, iid_is(riid)] IUnknown ** ppvObj
            );

    HRESULT GetMops(
                [in] MEMBERID memid,
                [out] BSTR * pBstrMops
            );

    [local]
    HRESULT GetContainingTypeLib(
                [out] ITypeLib ** ppTLib,
                [out] UINT * pIndex
            );

    [call_as(GetContainingTypeLib)]
    HRESULT RemoteGetContainingTypeLib(
                [out] ITypeLib ** ppTLib,
                [out] UINT * pIndex
            );

    [local]
    void ReleaseTypeAttr(
                [in] TYPEATTR * pTypeAttr
            );

    [call_as(ReleaseTypeAttr)]
    HRESULT LocalReleaseTypeAttr(
                void
            );

    [local]
    void ReleaseFuncDesc(
                [in] FUNCDESC * pFuncDesc
            );

    [call_as(ReleaseFuncDesc)]
    HRESULT LocalReleaseFuncDesc(
                void
            );

    [local]
    void ReleaseVarDesc(
                [in] VARDESC * pVarDesc
            );

    [call_as(ReleaseVarDesc)]
    HRESULT LocalReleaseVarDesc(
                void
            );
}
+/

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

    /*
[
    object,
    uuid(00020412-0000-0000-C000-000000000046),
    pointer_default(unique)
]

interface ITypeInfo2 : ITypeInfo
{
    typedef [unique] ITypeInfo2 * LPTYPEINFO2;

    HRESULT GetTypeKind(
                [out] TYPEKIND * pTypeKind
            );

    HRESULT GetTypeFlags(
                [out] ULONG * pTypeFlags
            );

    HRESULT GetFuncIndexOfMemId(
                [in] MEMBERID memid, 
                [in] INVOKEKIND invKind, 
                [out] UINT * pFuncIndex
            );

    HRESULT GetVarIndexOfMemId(
                [in] MEMBERID memid, 
                [out] UINT * pVarIndex
            );

    HRESULT GetCustData(
                [in] REFGUID guid,
                [out] VARIANT * pVarVal
            );
    
    HRESULT GetFuncCustData(
                [in] UINT index, 
                [in] REFGUID guid, 
                [out] VARIANT * pVarVal
            );
    
    HRESULT GetParamCustData(
                [in] UINT indexFunc, 
                [in] UINT indexParam, 
                [in] REFGUID guid, 
                [out] VARIANT * pVarVal
            );

    HRESULT GetVarCustData(
                [in] UINT index, 
                [in] REFGUID guid, 
                [out] VARIANT * pVarVal
            );

    HRESULT GetImplTypeCustData(
                [in] UINT index, 
                [in] REFGUID guid, 
                [out] VARIANT * pVarVal
            );

    [local]
    HRESULT GetDocumentation2(
                [in] MEMBERID memid,
                [in] LCID lcid,
                [out] BSTR *pbstrHelpString,
                [out] DWORD *pdwHelpStringContext,
                [out] BSTR *pbstrHelpStringDll
            );

    [call_as(GetDocumentation2)]
    HRESULT RemoteGetDocumentation2(
                [in] MEMBERID memid,
                [in] LCID lcid,
                [in] DWORD refPtrFlags,
                [out] BSTR *pbstrHelpString,
                [out] DWORD *pdwHelpStringContext,
                [out] BSTR *pbstrHelpStringDll
            );

    HRESULT GetAllCustData(
                [out] CUSTDATA * pCustData
            );
    
    HRESULT GetAllFuncCustData(
                [in] UINT index, 
                [out] CUSTDATA * pCustData
            );
    
    HRESULT GetAllParamCustData(
                [in] UINT indexFunc, 
                [in] UINT indexParam, 
                [out] CUSTDATA * pCustData
            );

    HRESULT GetAllVarCustData(
                [in] UINT index, 
                [out] CUSTDATA * pCustData
            );

    HRESULT GetAllImplTypeCustData(
                [in] UINT index, 
                [out] CUSTDATA * pCustData
            );
}
*/


enum /* LIBFLAGS */ : ushort {
  LIBFLAG_FRESTRICTED = 0x1,
  LIBFLAG_FCONTROL = 0x2,
  LIBFLAG_FHIDDEN = 0x4,
  LIBFLAG_FHASDISKIMAGE = 0x8
}


//com.Core
/+
[
    object,
    uuid(00020402-0000-0000-C000-000000000046),
    pointer_default(unique)
]

interface ITypeLib : IUnknown
{
    typedef [v1_enum] enum tagSYSKIND {
        SYS_WIN16 = 0,
        SYS_WIN32,
        SYS_MAC,
                SYS_WIN64
    } SYSKIND;

    typedef [v1_enum] enum tagLIBFLAGS {
        LIBFLAG_FRESTRICTED = 0x01,
        LIBFLAG_FCONTROL = 0x02,
        LIBFLAG_FHIDDEN = 0x04,
        LIBFLAG_FHASDISKIMAGE = 0x08
    } LIBFLAGS;

    typedef [unique] ITypeLib * LPTYPELIB;

    typedef struct tagTLIBATTR {
        GUID guid;
        LCID lcid;
        SYSKIND syskind;
        WORD wMajorVerNum;
        WORD wMinorVerNum;
        WORD wLibFlags;
    } TLIBATTR, * LPTLIBATTR;

    [local]
    UINT GetTypeInfoCount(
                void
            );

    [call_as(GetTypeInfoCount)]
    HRESULT RemoteGetTypeInfoCount(
                [out]  UINT * pcTInfo
            );

    HRESULT GetTypeInfo(
                [in]  UINT index,
                [out] ITypeInfo ** ppTInfo
            );

    HRESULT GetTypeInfoType(
                [in]  UINT index,
                [out] TYPEKIND * pTKind
            );

    HRESULT GetTypeInfoOfGuid(
                [in]  REFGUID guid,
                [out] ITypeInfo ** ppTinfo
            );

    [local]
    HRESULT GetLibAttr(
                [out] TLIBATTR ** ppTLibAttr
            );

    [call_as(GetLibAttr)]
    HRESULT RemoteGetLibAttr(
                [out] LPTLIBATTR * ppTLibAttr,
                [out] CLEANLOCALSTORAGE * pDummy
            );

    HRESULT GetTypeComp(
                [out] ITypeComp ** ppTComp
            );

    [local]
    HRESULT GetDocumentation(
                [in]  INT index,
                [out] BSTR * pBstrName,
                [out] BSTR * pBstrDocString,
                [out] DWORD * pdwHelpContext,
                [out] BSTR * pBstrHelpFile
            );

    [call_as(GetDocumentation)]
    HRESULT RemoteGetDocumentation(
                [in]  INT index,
                [in]  DWORD refPtrFlags,
                [out] BSTR * pBstrName,
                [out] BSTR * pBstrDocString,
                [out] DWORD * pdwHelpContext,
                [out] BSTR * pBstrHelpFile
            );

    [local]
    HRESULT IsName(
                [in, out] LPOLESTR szNameBuf,
                [in] ULONG lHashVal,
                [out] BOOL * pfName
            );

    [call_as(IsName)]
    HRESULT RemoteIsName(
                [in] LPOLESTR szNameBuf,
                [in] ULONG lHashVal,
                [out] BOOL * pfName,
                [out] BSTR * pBstrLibName
            );

    [local]
    HRESULT FindName(
                [in, out] LPOLESTR szNameBuf,
                [in] ULONG lHashVal,
                [out,size_is(*pcFound),length_is(*pcFound)] ITypeInfo **ppTInfo,
                [out,size_is(*pcFound),length_is(*pcFound)] MEMBERID * rgMemId,
                [in, out] USHORT * pcFound
            );

    [call_as(FindName)]
    HRESULT RemoteFindName(
                [in] LPOLESTR szNameBuf,
                [in] ULONG lHashVal,
                [out,size_is(*pcFound),length_is(*pcFound)] ITypeInfo **ppTInfo,
                [out,size_is(*pcFound),length_is(*pcFound)] MEMBERID * rgMemId,
                [in, out] USHORT * pcFound,
                [out] BSTR * pBstrLibName
            );

    [local]
    void ReleaseTLibAttr(
                [in]  TLIBATTR * pTLibAttr
            );

    [call_as(ReleaseTLibAttr)]
    HRESULT LocalReleaseTLibAttr(
                void
            );
}
+/

    interface ITypeLib2 : ITypeLib {
      mixin(uuid("00020411-0000-0000-c000-000000000046"));        
      // static DWINGUID IID = { 0x00020411, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int GetCustData(ref DWINGUID guid, out DWINVARIANT pVarVal);
      int GetLibStatistics(out uint pcUniqueNames, out uint pcchUniqueNames);
      int GetDocumentation2(int index, uint lcid, wchar** pBstrHelpString, uint* pdwHelpContext, wchar** pBstrHelpStringDll);
      int GetAllCustData(out CUSTDATA pCustData);
    }

/*
[
    object,
    uuid(00020411-0000-0000-C000-000000000046),
    pointer_default(unique)
]

interface ITypeLib2 : ITypeLib
{
    typedef [unique] ITypeLib2 * LPTYPELIB2;

    HRESULT GetCustData(
                [in] REFGUID guid,
                [out] VARIANT * pVarVal
            );

    [local]
    HRESULT GetLibStatistics(
                [out] ULONG * pcUniqueNames,
                [out] ULONG * pcchUniqueNames
            );

    [call_as(GetLibStatistics)]
    HRESULT RemoteGetLibStatistics(
                [out] ULONG * pcUniqueNames,
                [out] ULONG * pcchUniqueNames
            );

    [local]
    HRESULT GetDocumentation2(
                [in]  INT index,
                [in]  LCID lcid,
                [out] BSTR *pbstrHelpString,
                [out] DWORD *pdwHelpStringContext,
                [out] BSTR *pbstrHelpStringDll
            );

    [call_as(GetDocumentation2)]
    HRESULT RemoteGetDocumentation2(
                [in]  INT index,
                [in]  LCID lcid,
                [in]  DWORD refPtrFlags,
                [out] BSTR *pbstrHelpString,
                [out] DWORD *pdwHelpStringContext,
                [out] BSTR *pbstrHelpStringDll
            );


    HRESULT GetAllCustData(
                [out] CUSTDATA * pCustData
            );
}
*/

enum CHANGEKIND {
  CHANGEKIND_ADDMEMBER,
  CHANGEKIND_DELETEMEMBER,
  CHANGEKIND_SETNAMES,
  CHANGEKIND_SETDOCUMENTATION,
  CHANGEKIND_GENERAL,
  CHANGEKIND_INVALIDATE,
  CHANGEKIND_CHANGEFAILED,
  CHANGEKIND_MAX
}

    interface ITypeChangeEvents : IUnknown {
      mixin(uuid("00020410-0000-0000-c000-000000000046"));        
      // static DWINGUID IID = { 0x00020410, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int RequestTypeChange(CHANGEKIND changeKind, ITypeInfo pTInfoBefore, wchar* pStrName, out int pfCancel);
      int AfterTypeChange(CHANGEKIND changeKind, ITypeInfo pTInfoAfter, wchar* pStrName);
    }

/*
[
    object,
    uuid(00020410-0000-0000-C000-000000000046),
    pointer_default(unique),
    local
]

interface ITypeChangeEvents: IUnknown
{
    typedef [unique] ITypeChangeEvents * LPTYPECHANGEEVENTS;

    // notification messages used by the dynamic typeinfo protocol.
    typedef enum tagCHANGEKIND {
        CHANGEKIND_ADDMEMBER,
        CHANGEKIND_DELETEMEMBER,
        CHANGEKIND_SETNAMES,
        CHANGEKIND_SETDOCUMENTATION,
        CHANGEKIND_GENERAL,
        CHANGEKIND_INVALIDATE,
        CHANGEKIND_CHANGEFAILED,
        CHANGEKIND_MAX
    } CHANGEKIND;

    HRESULT RequestTypeChange(
                [in] CHANGEKIND changeKind,
                [in] ITypeInfo * pTInfoBefore,
                [in] LPOLESTR pStrName,
                [out] INT * pfCancel
            );
    
    HRESULT AfterTypeChange(
                [in] CHANGEKIND changeKind,
                [in] ITypeInfo * pTInfoAfter,
                [in] LPOLESTR pStrName
            );
}
*/

    interface IErrorInfo : IUnknown {
      mixin(uuid("1cf2b120-547d-101b-8e65-08002b2bd119"));          
      // static DWINGUID IID = { 0x1CF2B120, 0x547D, 0x101B, 0x8E, 0x65, 0x08, 0x00, 0x2B, 0x2B, 0xD1, 0x19 };
      int GetGUID(out DWINGUID pGuid);
      int GetSource(out wchar* pBstrSource);
      int GetDescription(out wchar* pBstrDescription);
      int GetHelpFile(out wchar* pBstrHelpFile);
      int GetHelpContext(out uint pdwHelpContext);
    }

/*
[
    object,
    uuid(1CF2B120-547D-101B-8E65-08002B2BD119),
    pointer_default(unique)
]

interface IErrorInfo: IUnknown
{
    typedef [unique] IErrorInfo * LPERRORINFO;

    HRESULT GetGUID(
                [out] GUID * pGUID
            );

    HRESULT GetSource(
                [out] BSTR * pBstrSource
            );

    HRESULT GetDescription(
                [out] BSTR * pBstrDescription
            );

    HRESULT GetHelpFile(
                [out] BSTR * pBstrHelpFile
            );

    HRESULT GetHelpContext(
                [out] DWORD * pdwHelpContext
            );
}
*/

/+
[
    object,
    uuid(22F03340-547D-101B-8E65-08002B2BD119),
    pointer_default(unique)
]

interface ICreateErrorInfo: IUnknown
{
    typedef [unique] ICreateErrorInfo * LPCREATEERRORINFO;

    HRESULT SetGUID(
                [in] REFGUID rguid
            );

    HRESULT SetSource(
                [in] LPOLESTR szSource
            );

    HRESULT SetDescription(
                [in] LPOLESTR szDescription
            );

    HRESULT SetHelpFile(
                [in] LPOLESTR szHelpFile
            );

    HRESULT SetHelpContext(
                [in] DWORD dwHelpContext
            );
}


[
    object,
    uuid(DF0B3D60-548F-101B-8E65-08002B2BD119),
    pointer_default(unique)
]

interface ISupportErrorInfo: IUnknown
{
    typedef [unique] ISupportErrorInfo * LPSUPPORTERRORINFO;

    HRESULT InterfaceSupportsErrorInfo(
                [in]  REFIID riid
            );
}
+/

    interface ITypeFactory : IUnknown {
      mixin(uuid("0000002E-0000-0000-C000-000000000046"));
      // static DWINGUID IID = { 0x0000002E, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };
      int CreateFromTypeInfo(ITypeInfo pTypeInfo, ref DWINGUID riid, out IUnknown ppv);
    }

/*
[
    object,
    uuid(0000002E-0000-0000-C000-000000000046)
]

interface ITypeFactory : IUnknown
{
    HRESULT CreateFromTypeInfo(
                [in] ITypeInfo *pTypeInfo,
                [in] REFIID riid,
                [out, iid_is(riid)] IUnknown **ppv
            );
}
*/

    interface ITypeMarshal : IUnknown {
      mixin(uuid("0000002D-0000-0000-C000-000000000046"));        
      // static DWINGUID IID = { 0x0000002D, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 };        
      int Size(void* pvType, uint dwDestContext, void* pvDestContext, out uint pSize);
      int Marshal(void* pvType, uint dwDestContext, void* pvDestContext, uint cbBufferLength, ubyte* pBuffer, out uint pcbWritten);
      int Unmarshal(void* pvType, uint dwFlags, uint cbBufferLength, ubyte* pBuffer, out uint pcbRead);
      int Free(void* pvType);
    }

    /*
[
    local,
    object,
    uuid(0000002D-0000-0000-C000-000000000046)
]

interface ITypeMarshal : IUnknown
{
    HRESULT Size(
                [in]  PVOID pvType,
                [in]  DWORD dwDestContext,
                [in]  PVOID pvDestContext,
                [out] ULONG * pSize
            );

    HRESULT Marshal(
                [in]  PVOID pvType,
                [in]  DWORD dwDestContext,
                [in]  PVOID pvDestContext,
                [in]  ULONG cbBufferLength,
                [out] BYTE  * pBuffer,
                [out] ULONG * pcbWritten
            );

    HRESULT Unmarshal(
                [out] PVOID pvType,
                [in]  DWORD dwFlags,
                [in]  ULONG cbBufferLength,
                [in]  BYTE  * pBuffer,
                [out] ULONG * pcbRead
            );

    HRESULT Free(
                [in] PVOID pvType
            );
}
*/

/*
[
    local,
    object,
    uuid(0000002F-0000-0000-C000-000000000046)
]

interface IRecordInfo: IUnknown
{
    typedef [unique] IRecordInfo * LPRECORDINFO;

    HRESULT RecordInit(
                [out] PVOID pvNew
            );

    HRESULT RecordClear(
                [in]  PVOID pvExisting
            );

    HRESULT RecordCopy(
                [in]  PVOID pvExisting,
                [out] PVOID pvNew
            );

    HRESULT GetGuid(
                [out] GUID * pguid
            );

    HRESULT GetName(
                [out] BSTR * pbstrName
            );

    HRESULT GetSize(
                [out] ULONG * pcbSize
            );

    HRESULT GetTypeInfo(
                [out] ITypeInfo ** ppTypeInfo
            );

    HRESULT GetField(
                [in]  PVOID pvData,
                [in]  LPCOLESTR szFieldName,
                [out] VARIANT * pvarField
            );

    HRESULT GetFieldNoCopy(
                [in]  PVOID pvData,
                [in]  LPCOLESTR szFieldName,
                [out] VARIANT * pvarField,
                [out] PVOID * ppvDataCArray
            );

    HRESULT PutField(
                [in] ULONG wFlags,
                [in,out] PVOID pvData,
                [in]  LPCOLESTR szFieldName,
                [in]  VARIANT * pvarField
            );

    HRESULT PutFieldNoCopy(
                [in] ULONG wFlags,
                [in,out] PVOID pvData,
                [in]  LPCOLESTR szFieldName,
                [in]  VARIANT * pvarField
            );

    HRESULT GetFieldNames(
                [in,out] ULONG * pcNames,
                [out,size_is(*pcNames),length_is(*pcNames)] BSTR * rgBstrNames
            );

    BOOL IsMatchingType(
                [in] IRecordInfo * pRecordInfo
            );

    PVOID RecordCreate(
            );

    HRESULT RecordCreateCopy(
                [in] PVOID pvSource,
                [out] PVOID * ppvDest
            );

    HRESULT RecordDestroy(
                [in] PVOID pvRecord
            );
}


[
    object,
    uuid(3127CA40-446E-11CE-8135-00AA004BB851),
    pointer_default(unique)
]

interface IErrorLog : IUnknown
{
    typedef IErrorLog * LPERRORLOG;

    HRESULT AddError(
                [in] LPCOLESTR pszPropName,
                [in] EXCEPINFO * pExcepInfo
            );
}


[
    object,
    uuid(55272A00-42CB-11CE-8135-00AA004BB851),
    pointer_default(unique)
]

interface IPropertyBag : IUnknown
{
    typedef IPropertyBag * LPPROPERTYBAG;

    [local]
    HRESULT Read(
                [in] LPCOLESTR pszPropName,
                [in, out] VARIANT * pVar,
                [in] IErrorLog * pErrorLog
            );

    [call_as(Read)]
    HRESULT RemoteRead(
                [in] LPCOLESTR pszPropName,
                [out] VARIANT * pVar,
                [in] IErrorLog * pErrorLog,
                [in] DWORD varType,
                [in] IUnknown * pUnkObj
            );

    HRESULT Write(
                [in] LPCOLESTR pszPropName,
                [in] VARIANT * pVar
            );
}
*/

/+
cpp_quote("#if ( _MSC_VER >= 800 )")
cpp_quote("#if _MSC_VER >= 1200")
cpp_quote("#pragma warning(pop)")
cpp_quote("#else")
cpp_quote("#pragma warning(default:4201) /* Nameless struct/union */")
cpp_quote("#endif")
cpp_quote("#endif")

+/
