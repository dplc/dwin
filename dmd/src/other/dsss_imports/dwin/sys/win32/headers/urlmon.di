// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2009  (dyuyan  gmail at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: 2009

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module dwin.sys.win32.headers.urlmon;

private import dwin.sys.win32.com.Core;
private import dwin.sys.win32.headers.objidl; //for IMoniker IBindCtx
    

//  File:       urlmon.idl
//
//  Contents:   async moniker interfaces

pragma(lib, "uuid.lib");

/*
#ifdef UNIX
typedef unsigned long HANDLE_PTR;
#endif
*/

private import dwin.sys.win32.headers.objidl;
private import dwin.sys.win32.headers.oleidl;
//import "servprov.idl";
//import "msxml.idl";

/+
interface IPersistMoniker;
interface IBindProtocol;
interface IBinding;
interface IBindStatusCallback;
interface IBindStatusCallbackMsg;
interface IAuthenticate;
interface IWindowForBindingUI;
interface ICodeInstall;
interface IHttpNegotiate;
interface IHttpNegotiate2;
interface IWinInetFileStream;

cpp_quote("// Side-by-Side clsid")
cpp_quote("EXTERN_C const IID CLSID_SBS_StdURLMoniker;  ")
cpp_quote("EXTERN_C const IID CLSID_SBS_HttpProtocol;   ")
cpp_quote("EXTERN_C const IID CLSID_SBS_FtpProtocol;    ")
cpp_quote("EXTERN_C const IID CLSID_SBS_GopherProtocol; ")
cpp_quote("EXTERN_C const IID CLSID_SBS_HttpSProtocol;  ")
cpp_quote("EXTERN_C const IID CLSID_SBS_FileProtocol;   ")
cpp_quote("EXTERN_C const IID CLSID_SBS_MkProtocol;     ")
cpp_quote("EXTERN_C const IID CLSID_SBS_UrlMkBindCtx;   ")
cpp_quote("EXTERN_C const IID CLSID_SBS_SoftDistExt;  ")
cpp_quote("EXTERN_C const IID CLSID_SBS_StdEncodingFilterFac; ")
cpp_quote("EXTERN_C const IID CLSID_SBS_DeCompMimeFilter;     ")
cpp_quote("EXTERN_C const IID CLSID_SBS_CdlProtocol;          ")
cpp_quote("EXTERN_C const IID CLSID_SBS_ClassInstallFilter;   ")
cpp_quote("EXTERN_C const IID CLSID_SBS_InternetSecurityManager;  ")
cpp_quote("EXTERN_C const IID CLSID_SBS_InternetZoneManager;  ")
cpp_quote("// END Side-by-Side clsid")


cpp_quote("// These are for backwards compatibility with previous URLMON versions")
cpp_quote("#define BINDF_DONTUSECACHE BINDF_GETNEWESTVERSION")
cpp_quote("#define BINDF_DONTPUTINCACHE BINDF_NOWRITECACHE")
cpp_quote("#define BINDF_NOCOPYDATA BINDF_PULLDATA")
cpp_quote("#define INVALID_P_ROOT_SECURITY_ID ((BYTE*)-1)")

cpp_quote("#define PI_DOCFILECLSIDLOOKUP PI_CLSIDLOOKUP")

cpp_quote("EXTERN_C const IID IID_IAsyncMoniker;    ")
cpp_quote("EXTERN_C const IID CLSID_StdURLMoniker;  ")
cpp_quote("EXTERN_C const IID CLSID_HttpProtocol;   ")
cpp_quote("EXTERN_C const IID CLSID_FtpProtocol;    ")
cpp_quote("EXTERN_C const IID CLSID_GopherProtocol; ")
cpp_quote("EXTERN_C const IID CLSID_HttpSProtocol;  ")
cpp_quote("EXTERN_C const IID CLSID_FileProtocol;   ")
cpp_quote("EXTERN_C const IID CLSID_MkProtocol;     ")
cpp_quote("EXTERN_C const IID CLSID_StdURLProtocol; ")
cpp_quote("EXTERN_C const IID CLSID_UrlMkBindCtx;   ")
cpp_quote("EXTERN_C const IID CLSID_StdEncodingFilterFac; ")
cpp_quote("EXTERN_C const IID CLSID_DeCompMimeFilter;     ")
cpp_quote("EXTERN_C const IID CLSID_CdlProtocol;          ")
cpp_quote("EXTERN_C const IID CLSID_ClassInstallFilter;   ")
cpp_quote("EXTERN_C const IID IID_IAsyncBindCtx;    ")

#pragma midl_echo(" ")
#pragma midl_echo("#define SZ_URLCONTEXT           OLESTR(\"URL Context\")")
#pragma midl_echo("#define SZ_ASYNC_CALLEE         OLESTR(\"AsyncCallee\")")
+/

    int CreateURLMoniker(IMoniker* pMkCtx, wchar* szURL, ref IMoniker ppmk);

/+
#pragma midl_echo("#define MKSYS_URLMONIKER         6            ")
#pragma midl_echo("#define URL_MK_LEGACY            0            ")
#pragma midl_echo("#define URL_MK_UNIFORM           1            ")
#pragma midl_echo("#define URL_MK_NO_CANONICALIZE   2            ")
#pragma midl_echo(" ")
#pragma midl_echo("STDAPI CreateURLMoniker(LPMONIKER pMkCtx, LPCWSTR szURL, LPMONIKER FAR * ppmk);             ")
#pragma midl_echo("STDAPI CreateURLMonikerEx(LPMONIKER pMkCtx, LPCWSTR szURL, LPMONIKER FAR * ppmk, DWORD dwFlags);             ")
#pragma midl_echo("STDAPI GetClassURL(LPCWSTR szURL, CLSID *pClsID);                                           ")
#pragma midl_echo("STDAPI CreateAsyncBindCtx(DWORD reserved, IBindStatusCallback *pBSCb,                       ")
#pragma midl_echo("                                IEnumFORMATETC *pEFetc, IBindCtx **ppBC);                   ")

#pragma midl_echo("STDAPI CreateAsyncBindCtxEx(IBindCtx *pbc, DWORD dwOptions, IBindStatusCallback *pBSCb, IEnumFORMATETC *pEnum,   ")
#pragma midl_echo("                            IBindCtx **ppBC, DWORD reserved);                                                     ")

#pragma midl_echo("STDAPI MkParseDisplayNameEx(IBindCtx *pbc, LPCWSTR szDisplayName, ULONG *pchEaten,          ")
#pragma midl_echo("                                LPMONIKER *ppmk);                                           ")
#pragma midl_echo("STDAPI RegisterBindStatusCallback(LPBC pBC, IBindStatusCallback *pBSCb,                     ")
#pragma midl_echo("                                IBindStatusCallback**  ppBSCBPrev, DWORD dwReserved);       ")
#pragma midl_echo("STDAPI RevokeBindStatusCallback(LPBC pBC, IBindStatusCallback *pBSCb);                      ")

#pragma midl_echo("STDAPI GetClassFileOrMime(LPBC pBC, LPCWSTR szFilename, LPVOID pBuffer, DWORD cbSize, LPCWSTR szMime, DWORD dwReserved, CLSID *pclsid); ")
#pragma midl_echo("STDAPI IsValidURL(LPBC pBC, LPCWSTR szURL, DWORD dwReserved);                               ")


#pragma midl_echo("STDAPI CoGetClassObjectFromURL( REFCLSID rCLASSID,")
#pragma midl_echo("            LPCWSTR szCODE, DWORD dwFileVersionMS, ")
#pragma midl_echo("            DWORD dwFileVersionLS, LPCWSTR szTYPE,")
#pragma midl_echo("            LPBINDCTX pBindCtx, DWORD dwClsContext,")
#pragma midl_echo("            LPVOID pvReserved, REFIID riid, LPVOID * ppv);")

#pragma midl_echo("STDAPI FaultInIEFeature( HWND hWnd,")
#pragma midl_echo("            uCLSSPEC *pClassSpec,")
#pragma midl_echo("            QUERYCONTEXT *pQuery, DWORD dwFlags);                                           ")

#pragma midl_echo("STDAPI GetComponentIDFromCLSSPEC(uCLSSPEC *pClassspec,")
#pragma midl_echo("             LPSTR * ppszComponentID);                                                      ")

#pragma midl_echo("// flags for FaultInIEFeature")
#pragma midl_echo("#define FIEF_FLAG_FORCE_JITUI               0x1     // force JIT ui even if")
#pragma midl_echo("                                                 // previoulsy rejected by ")
#pragma midl_echo("                                                 // user in this session or")
#pragma midl_echo("                                                 // marked as Never Ask Again")
#pragma midl_echo("#define FIEF_FLAG_PEEK                      0x2     // just peek, don't faultin")
#pragma midl_echo("#define FIEF_FLAG_SKIP_INSTALLED_VERSION_CHECK        0x4     // force JIT without checking local version")



#pragma midl_echo(" ")
#pragma midl_echo("//helper apis                                                                               ")
#pragma midl_echo("STDAPI IsAsyncMoniker(IMoniker* pmk);                                                       ")
#pragma midl_echo("STDAPI CreateURLBinding(LPCWSTR lpszUrl, IBindCtx *pbc, IBinding **ppBdg);                  ")
#pragma midl_echo(" ")
#pragma midl_echo("STDAPI RegisterMediaTypes(UINT ctypes, const LPCSTR* rgszTypes, CLIPFORMAT* rgcfTypes);            ")
#pragma midl_echo("STDAPI FindMediaType(LPCSTR rgszTypes, CLIPFORMAT* rgcfTypes);                                       ")
#pragma midl_echo("STDAPI CreateFormatEnumerator( UINT cfmtetc, FORMATETC* rgfmtetc, IEnumFORMATETC** ppenumfmtetc); ")
#pragma midl_echo("STDAPI RegisterFormatEnumerator(LPBC pBC, IEnumFORMATETC *pEFetc, DWORD reserved);          ")
#pragma midl_echo("STDAPI RevokeFormatEnumerator(LPBC pBC, IEnumFORMATETC *pEFetc);                            ")
#pragma midl_echo("STDAPI RegisterMediaTypeClass(LPBC pBC,UINT ctypes, const LPCSTR* rgszTypes, CLSID *rgclsID, DWORD reserved);    ")
#pragma midl_echo("STDAPI FindMediaTypeClass(LPBC pBC, LPCSTR szType, CLSID *pclsID, DWORD reserved);                          ")
#pragma midl_echo("STDAPI UrlMkSetSessionOption(DWORD dwOption, LPVOID pBuffer, DWORD dwBufferLength, DWORD dwReserved);       ")
#pragma midl_echo("STDAPI UrlMkGetSessionOption(DWORD dwOption, LPVOID pBuffer, DWORD dwBufferLength, DWORD *pdwBufferLength, DWORD dwReserved);       ")

#pragma midl_echo("STDAPI FindMimeFromData(                                                                                                                  ")
#pragma midl_echo("                        LPBC pBC,                           // bind context - can be NULL                                                 ")
#pragma midl_echo("                        LPCWSTR pwzUrl,                     // url - can be null                                                          ")
#pragma midl_echo("                        LPVOID pBuffer,                     // buffer with data to sniff - can be null (pwzUrl must be valid)             ")
#pragma midl_echo("                        DWORD cbSize,                       // size of buffer                                                             ")
#pragma midl_echo("                        LPCWSTR pwzMimeProposed,            // proposed mime if - can be null                                             ")
#pragma midl_echo("                        DWORD dwMimeFlags,                  // will be defined                                                            ")
#pragma midl_echo("                        LPWSTR *ppwzMimeOut,                // the suggested mime                                                         ")
#pragma midl_echo("                        DWORD dwReserved);                  // must be 0                                                                  ")


#pragma midl_echo("#define     FMFD_DEFAULT             0x00000000 ")
#pragma midl_echo("#define     FMFD_URLASFILENAME       0x00000001 ")
#pragma midl_echo("#define     FMFD_ENABLEMIMESNIFFING  0x00000002 ")
#pragma midl_echo("#define     FMFD_IGNOREMIMETEXTPLAIN  0x00000004 ")

#pragma midl_echo("STDAPI ObtainUserAgentString(DWORD dwOption, LPSTR pszUAOut, DWORD* cbSize);       ")
#pragma midl_echo("STDAPI CompareSecurityIds(BYTE* pbSecurityId1, DWORD dwLen1, BYTE* pbSecurityId2, DWORD dwLen2, DWORD dwReserved);    ")

#pragma midl_echo("STDAPI CompatFlagsFromClsid(CLSID *pclsid, LPDWORD pdwCompatFlags, LPDWORD pdwMiscStatusFlags);             ")

#pragma midl_echo(" ")
#pragma midl_echo("// URLMON-specific defines for UrlMkSetSessionOption() above")
#pragma midl_echo("#define URLMON_OPTION_USERAGENT           0x10000001")
#pragma midl_echo("#define URLMON_OPTION_USERAGENT_REFRESH   0x10000002")
#pragma midl_echo("#define URLMON_OPTION_URL_ENCODING        0x10000004")
#pragma midl_echo("#define URLMON_OPTION_USE_BINDSTRINGCREDS 0x10000008")

#pragma midl_echo(" ")
#pragma midl_echo("#define CF_NULL                 0                                  ")
#pragma midl_echo("#define CFSTR_MIME_NULL         NULL                               ")
// 7 bit MIME Types
#pragma midl_echo("#define CFSTR_MIME_TEXT         (TEXT(\"text/plain\"))             ")
#pragma midl_echo("#define CFSTR_MIME_RICHTEXT     (TEXT(\"text/richtext\"))          ")
#pragma midl_echo("#define CFSTR_MIME_X_BITMAP     (TEXT(\"image/x-xbitmap\"))        ")
#pragma midl_echo("#define CFSTR_MIME_POSTSCRIPT   (TEXT(\"application/postscript\")) ")
// 8 bit MIME Types
#pragma midl_echo("#define CFSTR_MIME_AIFF         (TEXT(\"audio/aiff\"))             ")
#pragma midl_echo("#define CFSTR_MIME_BASICAUDIO   (TEXT(\"audio/basic\"))            ")
#pragma midl_echo("#define CFSTR_MIME_WAV          (TEXT(\"audio/wav\"))              ")
#pragma midl_echo("#define CFSTR_MIME_X_WAV        (TEXT(\"audio/x-wav\"))            ")
#pragma midl_echo("#define CFSTR_MIME_GIF          (TEXT(\"image/gif\"))              ")
#pragma midl_echo("#define CFSTR_MIME_PJPEG        (TEXT(\"image/pjpeg\"))            ")
#pragma midl_echo("#define CFSTR_MIME_JPEG         (TEXT(\"image/jpeg\"))             ")
#pragma midl_echo("#define CFSTR_MIME_TIFF         (TEXT(\"image/tiff\"))             ")
#pragma midl_echo("#define CFSTR_MIME_X_PNG        (TEXT(\"image/x-png\"))            ")
#pragma midl_echo("#define CFSTR_MIME_BMP          (TEXT(\"image/bmp\"))              ")
#pragma midl_echo("#define CFSTR_MIME_X_ART        (TEXT(\"image/x-jg\"))             ")
#pragma midl_echo("#define CFSTR_MIME_X_EMF        (TEXT(\"image/x-emf\"))            ")
#pragma midl_echo("#define CFSTR_MIME_X_WMF        (TEXT(\"image/x-wmf\"))            ")
#pragma midl_echo("#define CFSTR_MIME_AVI          (TEXT(\"video/avi\"))              ")
#pragma midl_echo("#define CFSTR_MIME_MPEG         (TEXT(\"video/mpeg\"))             ")
#pragma midl_echo("#define CFSTR_MIME_FRACTALS     (TEXT(\"application/fractals\"))   ")
#pragma midl_echo("#define CFSTR_MIME_RAWDATA      (TEXT(\"application/octet-stream\"))")
#pragma midl_echo("#define CFSTR_MIME_RAWDATASTRM  (TEXT(\"application/octet-stream\"))")
#pragma midl_echo("#define CFSTR_MIME_PDF          (TEXT(\"application/pdf\"))        ")
#pragma midl_echo("#define CFSTR_MIME_HTA          (TEXT(\"application/hta\"))        ")
#pragma midl_echo("#define CFSTR_MIME_X_AIFF       (TEXT(\"audio/x-aiff\"))           ")
#pragma midl_echo("#define CFSTR_MIME_X_REALAUDIO  (TEXT(\"audio/x-pn-realaudio\"))   ")
#pragma midl_echo("#define CFSTR_MIME_XBM          (TEXT(\"image/xbm\"))              ")
#pragma midl_echo("#define CFSTR_MIME_QUICKTIME    (TEXT(\"video/quicktime\"))        ")
#pragma midl_echo("#define CFSTR_MIME_X_MSVIDEO    (TEXT(\"video/x-msvideo\"))        ")
#pragma midl_echo("#define CFSTR_MIME_X_SGI_MOVIE  (TEXT(\"video/x-sgi-movie\"))      ")
// 7 or 8 bit MIME Types
#pragma midl_echo("#define CFSTR_MIME_HTML         (TEXT(\"text/html\"))              ")
#pragma midl_echo("#define CFSTR_MIME_XML          (TEXT(\"text/xml\"))               ")
#pragma midl_echo(" ")

cpp_quote("// MessageId: MK_S_ASYNCHRONOUS                                              ")
cpp_quote("// MessageText: Operation is successful, but will complete asynchronously.   ")
cpp_quote("//                                                                           ")
cpp_quote("#define MK_S_ASYNCHRONOUS    _HRESULT_TYPEDEF_(0x000401E8L)                  ")
cpp_quote("#ifndef S_ASYNCHRONOUS                                                       ")
cpp_quote("#define S_ASYNCHRONOUS       MK_S_ASYNCHRONOUS                               ")
cpp_quote("#endif                                                                       ")
cpp_quote("                                                                             ")
cpp_quote("#ifndef E_PENDING                                                            ")
cpp_quote("#define E_PENDING _HRESULT_TYPEDEF_(0x8000000AL)                             ")
cpp_quote("#endif                                                                       ")
cpp_quote("                                                                             ")
cpp_quote("//                                                                           ")
cpp_quote("//                                                                           ")
cpp_quote("// WinINet and protocol specific errors are mapped to one of the following   ")
cpp_quote("// error which are returned in IBSC::OnStopBinding                           ")
cpp_quote("//                                                                           ")
cpp_quote("//                                                                           ")
cpp_quote("// Note: FACILITY C is split into ranges of 1k                               ")
cpp_quote("// C0000 - C03FF  INET_E_ (URLMON's original hresult)                        ")
cpp_quote("// C0400 - C07FF  INET_E_CLIENT_xxx                                          ")
cpp_quote("// C0800 - C0BFF  INET_E_SERVER_xxx                                          ")
cpp_quote("// C0C00 - C0FFF  INET_E_????                                                ")
cpp_quote("// C1000 - C13FF  INET_E_AGENT_xxx (info delivery agents)                    ")

//
// url could not be parsed
//
cpp_quote("#define INET_E_INVALID_URL               _HRESULT_TYPEDEF_(0x800C0002L)      ")
//
// InternetOpen failed - no session was established
//
cpp_quote("#define INET_E_NO_SESSION                _HRESULT_TYPEDEF_(0x800C0003L)      ")
//
//  InternetConnect failed - no
//
cpp_quote("#define INET_E_CANNOT_CONNECT            _HRESULT_TYPEDEF_(0x800C0004L)      ")
//
// the server or proxy was not found
//
cpp_quote("#define INET_E_RESOURCE_NOT_FOUND        _HRESULT_TYPEDEF_(0x800C0005L)      ")
//
// the actual object was not found - e.g. http: 404
//
cpp_quote("#define INET_E_OBJECT_NOT_FOUND          _HRESULT_TYPEDEF_(0x800C0006L)      ")
//
//  connection was established but data can not be retrieved
//  no filename from cache invalid etc.
//
cpp_quote("#define INET_E_DATA_NOT_AVAILABLE        _HRESULT_TYPEDEF_(0x800C0007L)      ")
//
//  generic download failure - connection broke
//
cpp_quote("#define INET_E_DOWNLOAD_FAILURE          _HRESULT_TYPEDEF_(0x800C0008L)      ")
//
//  to access to this object need authentication    e.g. http: 401
//
cpp_quote("#define INET_E_AUTHENTICATION_REQUIRED   _HRESULT_TYPEDEF_(0x800C0009L)      ")
//
// the object is not available of the required type             http: 403 no object
//
cpp_quote("#define INET_E_NO_VALID_MEDIA            _HRESULT_TYPEDEF_(0x800C000AL)      ")
//
// the internet connection timed out
//
cpp_quote("#define INET_E_CONNECTION_TIMEOUT        _HRESULT_TYPEDEF_(0x800C000BL)      ")
//
// the request was invalid
//
cpp_quote("#define INET_E_INVALID_REQUEST           _HRESULT_TYPEDEF_(0x800C000CL)      ")
//
// protocol is not know and no plugable protocol is registered
//
cpp_quote("#define INET_E_UNKNOWN_PROTOCOL          _HRESULT_TYPEDEF_(0x800C000DL)      ")
//
// security problem encountered
//
cpp_quote("#define INET_E_SECURITY_PROBLEM          _HRESULT_TYPEDEF_(0x800C000EL)      ")
//
// object could not be loaded; IPersistXXX::Load failed
//
cpp_quote("#define INET_E_CANNOT_LOAD_DATA          _HRESULT_TYPEDEF_(0x800C000FL)      ")
//
// CoCreateInstance failed.
//
cpp_quote("#define INET_E_CANNOT_INSTANTIATE_OBJECT _HRESULT_TYPEDEF_(0x800C0010L)      ")
//
// Redirect failed.
//
cpp_quote("#define INET_E_REDIRECT_FAILED           _HRESULT_TYPEDEF_(0x800C0014L)      ")
//
// Redirect to directory.
//
cpp_quote("#define INET_E_REDIRECT_TO_DIR           _HRESULT_TYPEDEF_(0x800C0015L)      ")
//
// HResult range returned in OnStopBinding
//
//
// Data can not be locked
//
cpp_quote("#define INET_E_CANNOT_LOCK_REQUEST       _HRESULT_TYPEDEF_(0x800C0016L)      ")
cpp_quote("#define INET_E_USE_EXTEND_BINDING        _HRESULT_TYPEDEF_(0x800C0017L)      ")
cpp_quote("#define INET_E_TERMINATED_BIND           _HRESULT_TYPEDEF_(0x800C0018L)      ")
cpp_quote("#define INET_E_ERROR_FIRST               _HRESULT_TYPEDEF_(0x800C0002L)      ")

// User declined download of component
cpp_quote("#define INET_E_CODE_DOWNLOAD_DECLINED    _HRESULT_TYPEDEF_(0x800C0100L)      ")
cpp_quote("#define INET_E_RESULT_DISPATCHED         _HRESULT_TYPEDEF_(0x800C0200L)      ")

// Exact code download version requested not found
cpp_quote("#define INET_E_CANNOT_REPLACE_SFP_FILE   _HRESULT_TYPEDEF_(0x800C0300L)      ")

// Authenticode prompt UI was not shown because the page is not in the ActiveX permissive state
cpp_quote("#define INET_E_CODE_INSTALL_SUPPRESSED   _HRESULT_TYPEDEF_(0x800C0400L)      ")


// NOTE: Please update INET_E_ERROR_LAST if you add an error code with a higher number:
cpp_quote("#define INET_E_ERROR_LAST                INET_E_CANNOT_REPLACE_SFP_FILE")


//  Contents:  IPersistMoniker interface definition
//
//----------------------------------------------------------------------------

cpp_quote("#ifndef _LPPERSISTMONIKER_DEFINED")
cpp_quote("#define _LPPERSISTMONIKER_DEFINED")
+/

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

    /+
    /*
[
        object,
        uuid(79eac9c9-baf9-11ce-8c82-00aa004ba90b),
        pointer_default(unique)
]

interface IPersistMoniker : IUnknown
{
    typedef [unique] IPersistMoniker *LPPERSISTMONIKER;

    HRESULT GetClassID(
        [out] CLSID *pClassID
        );

    HRESULT IsDirty(void);

    HRESULT Load(
        [in] BOOL fFullyAvailable,
        [in] IMoniker * pimkName,
        [in] LPBC pibc,
        [in] DWORD grfMode
        );

    HRESULT Save(
        [in] IMoniker * pimkName,
        [in] LPBC pbc,
        [in] BOOL fRemember);

    HRESULT SaveCompleted(
        [in] IMoniker * pimkName,
        [in] LPBC pibc);

    HRESULT GetCurMoniker(
        [out] IMoniker ** ppimkName);
}

cpp_quote("#endif")
*/
+/

/+
//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:  IMonikerProp interface definition
//
//----------------------------------------------------------------------------
/*
cpp_quote("#ifndef _LPMONIKERPROP_DEFINED")
cpp_quote("#define _LPMONIKERPROP_DEFINED")

[
        object,
        uuid(a5ca5f7f-1847-4d87-9c5b-918509f7511d),
        pointer_default(unique)
]

interface IMonikerProp : IUnknown
{
    typedef [unique] IMonikerProp *LPMONIKERPROP;

    typedef enum {
        MIMETYPEPROP            = 0x00000000,
        USE_SRC_URL             = 0X00000001,
        CLASSIDPROP             = 0x00000002,
        TRUSTEDDOWNLOADPROP     = 0x00000003,
        POPUPLEVELPROP          = 0x00000004,
    } MONIKERPROPERTY;
    
    HRESULT PutProperty (
        [in] MONIKERPROPERTY mkp,
        [in] LPCWSTR val
    );
}

cpp_quote("#endif")
*/
//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:  IBindProtocol interface definition
//
//----------------------------------------------------------------------------
/*
cpp_quote("#ifndef _LPBINDPROTOCOL_DEFINED")
cpp_quote("#define _LPBINDPROTOCOL_DEFINED")

[
        local,
        object,
        uuid(79eac9cd-baf9-11ce-8c82-00aa004ba90b),
        pointer_default(unique)
]


interface IBindProtocol : IUnknown
{
        typedef [unique] IBindProtocol *LPBINDPROTOCOL;

        HRESULT CreateBinding(
                [in] LPCWSTR szUrl,
                [in] IBindCtx *pbc,
                [out] IBinding ** ppb);
}

cpp_quote("#endif")
*/

//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:   IBinding interface definition
//
//----------------------------------------------------------------------------
/*
cpp_quote("#ifndef _LPBINDING_DEFINED")
cpp_quote("#define _LPBINDING_DEFINED")

[
        object,
        uuid(79eac9c0-baf9-11ce-8c82-00aa004ba90b),
        pointer_default(unique)
]

interface IBinding: IUnknown
{
        typedef [unique] IBinding *LPBINDING;

        HRESULT Abort();

        HRESULT Suspend();

        HRESULT Resume();

        HRESULT SetPriority(
                [in] LONG nPriority);

        HRESULT GetPriority(
                [out] LONG * pnPriority);

        [local]
        HRESULT GetBindResult(
                [out]       CLSID *pclsidProtocol,
                [out]       DWORD *pdwResult,
                [out]       LPOLESTR *pszResult,
                [in, out]   DWORD   *pdwReserved);

        [call_as(GetBindResult)]
        HRESULT RemoteGetBindResult(
                [out]   CLSID       *pclsidProtocol,
                [out]   DWORD       *pdwResult,
                [out]   LPOLESTR    *pszResult,
                [in]    DWORD       dwReserved);

}

cpp_quote("#endif")
*/

//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:   IBindStatusCallback interface definition
//
//----------------------------------------------------------------------------
/*
cpp_quote("#ifndef _LPBINDSTATUSCALLBACK_DEFINED")
cpp_quote("#define _LPBINDSTATUSCALLBACK_DEFINED")

[
        object,
        uuid(79eac9c1-baf9-11ce-8c82-00aa004ba90b),
        pointer_default(unique)
]

interface IBindStatusCallback: IUnknown
{
        typedef [unique] IBindStatusCallback *LPBINDSTATUSCALLBACK;

        typedef enum
        {
            BINDVERB_GET       = 0x00000000,       // default action
            BINDVERB_POST      = 0x00000001,       // post verb
            BINDVERB_PUT       = 0x00000002,       // put verb
            BINDVERB_CUSTOM    = 0x00000003,       // custom verb
        } BINDVERB;

        typedef enum
        {
            BINDINFOF_URLENCODESTGMEDDATA   = 0x00000001,       // url encode the stgmed data
            BINDINFOF_URLENCODEDEXTRAINFO   = 0x00000002,       // url encode the extra info
        } BINDINFOF;


        // flags that describe the type of transaction that caller wants
        typedef enum
        {
             BINDF_ASYNCHRONOUS              = 0x00000001
            ,BINDF_ASYNCSTORAGE              = 0x00000002
            ,BINDF_NOPROGRESSIVERENDERING    = 0x00000004
            ,BINDF_OFFLINEOPERATION          = 0x00000008
            ,BINDF_GETNEWESTVERSION          = 0x00000010
            ,BINDF_NOWRITECACHE              = 0x00000020
            ,BINDF_NEEDFILE                  = 0x00000040
            ,BINDF_PULLDATA                  = 0x00000080
            ,BINDF_IGNORESECURITYPROBLEM     = 0x00000100
            ,BINDF_RESYNCHRONIZE             = 0x00000200
            ,BINDF_HYPERLINK                 = 0x00000400
            ,BINDF_NO_UI                     = 0x00000800
            ,BINDF_SILENTOPERATION           = 0x00001000
            ,BINDF_PRAGMA_NO_CACHE           = 0x00002000
            
            ,BINDF_GETCLASSOBJECT            = 0x00004000
            ,BINDF_RESERVED_1                = 0x00008000
            
            // bindstatus callback from client is free threaded
            ,BINDF_FREE_THREADED             = 0x00010000
            // client does not need to know excat size of data available
            // hence the read goes directly to e.g. socket
            ,BINDF_DIRECT_READ               = 0x00020000
            // is the transaction a forms submit.
            ,BINDF_FORMS_SUBMIT              = 0x00040000
            ,BINDF_GETFROMCACHE_IF_NET_FAIL  = 0x00080000
            // binding is from UrlMoniker
            ,BINDF_FROMURLMON                = 0x00100000
            ,BINDF_FWD_BACK                  = 0x00200000
            
            ,BINDF_PREFERDEFAULTHANDLER      = 0x00400000
            ,BINDF_ENFORCERESTRICTED         = 0x00800000
                       
            // Note:
            // the highest byte 0x??000000 is used internally
            // see other documentation
        } BINDF;

        typedef enum
        {
             URL_ENCODING_NONE               = 0x00000000
            ,URL_ENCODING_ENABLE_UTF8        = 0x10000000
            ,URL_ENCODING_DISABLE_UTF8       = 0x20000000
        } URL_ENCODING;

        typedef struct _tagBINDINFO
        {
            ULONG       cbSize;
            LPWSTR      szExtraInfo;        // e.g. string added to the URL string [range byte]
            STGMEDIUM   stgmedData;         // e.g. put or post data
            DWORD       grfBindInfoF;       // e.g. how meddata should be treaded
            DWORD       dwBindVerb;         // e.g. put, post, ...
            LPWSTR      szCustomVerb;       // e.g. custom verb
            DWORD       cbstgmedData;       // size of data in stgmedData
            DWORD       dwOptions;          // additional option
            DWORD       dwOptionsFlags;     // options flags
            DWORD       dwCodePage;         // the code used to convert the url
            SECURITY_ATTRIBUTES securityAttributes;
            IID         iid;                // iid of pUnk
            IUnknown    *pUnk;              // pUnk - whatever
            DWORD       dwReserved;         // should be null

        } BINDINFO;

        typedef struct _REMSECURITY_ATTRIBUTES
        {
            DWORD nLength;
            DWORD lpSecurityDescriptor;
            BOOL  bInheritHandle;
        } REMSECURITY_ATTRIBUTES, *PREMSECURITY_ATTRIBUTES, *LPREMSECURITY_ATTRIBUTES;

        typedef struct _tagRemBINDINFO
        {
            ULONG       cbSize;
            LPWSTR      szExtraInfo;        // e.g. string added to the URL string [range byte]
            DWORD       grfBindInfoF;       // e.g. how meddata should be treaded
            DWORD       dwBindVerb;         // e.g. put, post, ...
            LPWSTR      szCustomVerb;       // e.g. custom verb
            DWORD       cbstgmedData;       // size of data in stgmedData
            DWORD       dwOptions;          // additional options
            DWORD       dwOptionsFlags;     // options flags
            DWORD       dwCodePage;         // the code used to convert the url
            REMSECURITY_ATTRIBUTES securityAttributes;
            IID         iid;                // iid of pUnk
            IUnknown    *pUnk;              // pUnk - whatever
            DWORD       dwReserved;         // should be null

        } RemBINDINFO;

        typedef struct tagRemFORMATETC {
            DWORD cfFormat;
            DWORD ptd;
            DWORD dwAspect;
            LONG lindex;
            DWORD tymed;
        } RemFORMATETC, *LPREMFORMATETC;

        // Options flag
        typedef enum
        {
             BINDINFO_OPTIONS_WININETFLAG        = 0x00010000    

            ,BINDINFO_OPTIONS_ENABLE_UTF8        = 0x00020000    
            ,BINDINFO_OPTIONS_DISABLE_UTF8       = 0x00040000    
            ,BINDINFO_OPTIONS_USE_IE_ENCODING    = 0x00080000    

            ,BINDINFO_OPTIONS_BINDTOOBJECT       = 0x00100000    
            ,BINDINFO_OPTIONS_SECURITYOPTOUT     = 0x00200000    
            ,BINDINFO_OPTIONS_IGNOREMIMETEXTPLAIN     = 0x00400000
            ,BINDINFO_OPTIONS_USEBINDSTRINGCREDS       = 0x00800000
            ,BINDINFO_OPTIONS_IGNOREHTTPHTTPSREDIRECTS = 0x01000000
            ,BINDINFO_OPTIONS_SHDOCVW_NAVIGATE   = 0x80000000    

            // Note:
            // the lowest byte 0xx0000???? is used extended binding 
        } BINDINFO_OPTIONS;

    

        // Data notification flags
        typedef enum
        {
             BSCF_FIRSTDATANOTIFICATION          = 0x00000001
            ,BSCF_INTERMEDIATEDATANOTIFICATION   = 0x00000002
            ,BSCF_LASTDATANOTIFICATION           = 0x00000004
            ,BSCF_DATAFULLYAVAILABLE             = 0x00000008
            ,BSCF_AVAILABLEDATASIZEUNKNOWN       = 0x00000010

        } BSCF;

        typedef enum tagBINDSTATUS
        {
             BINDSTATUS_FINDINGRESOURCE          = 1
            ,BINDSTATUS_CONNECTING
            ,BINDSTATUS_REDIRECTING
            ,BINDSTATUS_BEGINDOWNLOADDATA
            ,BINDSTATUS_DOWNLOADINGDATA
            ,BINDSTATUS_ENDDOWNLOADDATA
            ,BINDSTATUS_BEGINDOWNLOADCOMPONENTS
            ,BINDSTATUS_INSTALLINGCOMPONENTS
            ,BINDSTATUS_ENDDOWNLOADCOMPONENTS
            ,BINDSTATUS_USINGCACHEDCOPY
            ,BINDSTATUS_SENDINGREQUEST
            ,BINDSTATUS_CLASSIDAVAILABLE
            ,BINDSTATUS_MIMETYPEAVAILABLE
            ,BINDSTATUS_CACHEFILENAMEAVAILABLE
            ,BINDSTATUS_BEGINSYNCOPERATION
            ,BINDSTATUS_ENDSYNCOPERATION
            ,BINDSTATUS_BEGINUPLOADDATA
            ,BINDSTATUS_UPLOADINGDATA
            ,BINDSTATUS_ENDUPLOADDATA
            ,BINDSTATUS_PROTOCOLCLASSID
            ,BINDSTATUS_ENCODING
            ,BINDSTATUS_VERIFIEDMIMETYPEAVAILABLE
            ,BINDSTATUS_CLASSINSTALLLOCATION
            ,BINDSTATUS_DECODING
            ,BINDSTATUS_LOADINGMIMEHANDLER
            ,BINDSTATUS_CONTENTDISPOSITIONATTACH
            ,BINDSTATUS_FILTERREPORTMIMETYPE
            ,BINDSTATUS_CLSIDCANINSTANTIATE
            ,BINDSTATUS_IUNKNOWNAVAILABLE
            ,BINDSTATUS_DIRECTBIND
            ,BINDSTATUS_RAWMIMETYPE
            ,BINDSTATUS_PROXYDETECTING
            ,BINDSTATUS_ACCEPTRANGES
            ,BINDSTATUS_COOKIE_SENT
            ,BINDSTATUS_COMPACT_POLICY_RECEIVED
            ,BINDSTATUS_COOKIE_SUPPRESSED
            ,BINDSTATUS_COOKIE_STATE_UNKNOWN
            ,BINDSTATUS_COOKIE_STATE_ACCEPT
            ,BINDSTATUS_COOKIE_STATE_REJECT
            ,BINDSTATUS_COOKIE_STATE_PROMPT
            ,BINDSTATUS_COOKIE_STATE_LEASH
            ,BINDSTATUS_COOKIE_STATE_DOWNGRADE
            ,BINDSTATUS_POLICY_HREF
            ,BINDSTATUS_P3P_HEADER
            ,BINDSTATUS_SESSION_COOKIE_RECEIVED
            ,BINDSTATUS_PERSISTENT_COOKIE_RECEIVED
            ,BINDSTATUS_SESSION_COOKIES_ALLOWED
            ,BINDSTATUS_CACHECONTROL
            ,BINDSTATUS_CONTENTDISPOSITIONFILENAME
            ,BINDSTATUS_MIMETEXTPLAINMISMATCH
            ,BINDSTATUS_PUBLISHERAVAILABLE 
            ,BINDSTATUS_DISPLAYNAMEAVAILABLE
        } BINDSTATUS;


        HRESULT OnStartBinding(
                [in] DWORD dwReserved,
                [in] IBinding * pib);

        HRESULT GetPriority(
                [out] LONG * pnPriority);

        HRESULT OnLowResource(
                [in] DWORD reserved);

        HRESULT OnProgress(
                [in] ULONG ulProgress,
                [in] ULONG ulProgressMax,
                [in] ULONG ulStatusCode,
                [in] LPCWSTR szStatusText);

        HRESULT OnStopBinding(
                [in] HRESULT hresult,
                [in, unique] LPCWSTR szError
                );

        [local]
        HRESULT GetBindInfo(
                [out] DWORD *grfBINDF,
                [in, out, unique] BINDINFO * pbindinfo
                );

        [call_as(GetBindInfo)]
        HRESULT RemoteGetBindInfo(
                [out] DWORD *grfBINDF,
                [in, out, unique] RemBINDINFO * pbindinfo,
                [in, out, unique] RemSTGMEDIUM* pstgmed
                );

        [local]
        HRESULT OnDataAvailable(
                [in] DWORD grfBSCF,
                [in] DWORD dwSize,
                [in] FORMATETC* pformatetc,
                [in] STGMEDIUM* pstgmed
                );

        [call_as(OnDataAvailable)]
        HRESULT RemoteOnDataAvailable(
                [in] DWORD grfBSCF,
                [in] DWORD dwSize,
                [in] RemFORMATETC *pformatetc,
                [in] RemSTGMEDIUM* pstgmed
                );

        HRESULT OnObjectAvailable(
                [in] REFIID riid,
                [in, iid_is(riid)] IUnknown* punk
                );

}
cpp_quote("#endif")
*/

//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:   IAuthenticate interface definition
//
//----------------------------------------------------------------------------
/*
cpp_quote("#ifndef _LPAUTHENTICATION_DEFINED")
cpp_quote("#define _LPAUTHENTICATION_DEFINED")

[
    object,
    uuid(79eac9d0-baf9-11ce-8c82-00aa004ba90b),
    pointer_default(unique)
]


interface IAuthenticate : IUnknown
{
    typedef [unique] IAuthenticate *LPAUTHENTICATION;

    HRESULT Authenticate(
                [out] HWND* phwnd,
                [out] LPWSTR *pszUsername,
                [out] LPWSTR *pszPassword
                );
}

cpp_quote("#endif")
*/

//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:   IHttpNegotiate interface definition
//
//----------------------------------------------------------------------------
/*
cpp_quote("#ifndef _LPHTTPNEGOTIATE_DEFINED")
cpp_quote("#define _LPHTTPNEGOTIATE_DEFINED")

[
    object,
    uuid(79eac9d2-baf9-11ce-8c82-00aa004ba90b),
    pointer_default(unique)
]

interface IHttpNegotiate : IUnknown
{
    typedef [unique] IHttpNegotiate *LPHTTPNEGOTIATE;

    HRESULT BeginningTransaction(
                [in]         LPCWSTR szURL,
                [in, unique] LPCWSTR szHeaders,
                [in]         DWORD dwReserved,
                [out]        LPWSTR *pszAdditionalHeaders
                );

    HRESULT OnResponse(
                [in]         DWORD dwResponseCode,
                [in, unique] LPCWSTR szResponseHeaders,
                [in, unique] LPCWSTR szRequestHeaders,
                [out]        LPWSTR *pszAdditionalRequestHeaders
                );
}

cpp_quote("#endif")
*/
//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:   IHttpNegotiate2 interface definition
//
//----------------------------------------------------------------------------
/*
cpp_quote("#ifndef _LPHTTPNEGOTIATE2_DEFINED")
cpp_quote("#define _LPHTTPNEGOTIATE2_DEFINED")

[
    object,
    uuid(4F9F9FCB-E0F4-48eb-B7AB-FA2EA9365CB4),
    pointer_default(unique)
]

interface IHttpNegotiate2 : IHttpNegotiate
{
    typedef [unique] IHttpNegotiate2 *LPHTTPNEGOTIATE2;

    HRESULT GetRootSecurityId
    (
        [out, size_is(*pcbSecurityId)]
                BYTE*   pbSecurityId,
        [in, out]
                DWORD*  pcbSecurityId,
        [in]    DWORD_PTR dwReserved
    );
}

cpp_quote("#endif")
*/
//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:   IWinInetFileStream interface definition
//
//----------------------------------------------------------------------------
/*
cpp_quote("#ifndef _LPWININETFILESTREAM_DEFINED")
cpp_quote("#define _LPWININETFILESTREAM_DEFINED")

[
    object,
    uuid(F134C4B7-B1F8-4e75-B886-74B90943BECB),
    pointer_default(unique)
]

interface IWinInetFileStream : IUnknown
{
    typedef [unique] IWinInetFileStream *LPWININETFILESTREAM;

    HRESULT SetHandleForUnlock
    (
        [in]    DWORD_PTR hWinInetLockHandle,
        [in]    DWORD_PTR dwReserved
    );

    HRESULT SetDeleteFile
    (
        [in]    DWORD_PTR dwReserved
    );
}

cpp_quote("#endif")
*/



//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:   IWindowForBindingUI interface definition
//
//----------------------------------------------------------------------------
/*
cpp_quote("#ifndef _LPWINDOWFORBINDINGUI_DEFINED")
cpp_quote("#define _LPWINDOWFORBINDINGUI_DEFINED")

[
    local,
    object,
    uuid(79eac9d5-bafa-11ce-8c82-00aa004ba90b),
    pointer_default(unique)
]

interface IWindowForBindingUI : IUnknown
{
    typedef [unique] IWindowForBindingUI *LPWINDOWFORBINDINGUI;

    HRESULT GetWindow(
                [in]  REFGUID rguidReason,
                [out] HWND* phwnd);
}

cpp_quote("#endif")
*/

//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:   ICodeDownloadClient interface definition
//
//----------------------------------------------------------------------------
/*
cpp_quote("#ifndef _LPCODEINSTALL_DEFINED")
cpp_quote("#define _LPCODEINSTALL_DEFINED")

[
    local,
    object,
    uuid(79eac9d1-baf9-11ce-8c82-00aa004ba90b),
    pointer_default(unique)
]


interface ICodeInstall : IWindowForBindingUI
{
    typedef [unique] ICodeInstall *LPCODEINSTALL;

    typedef enum {
        CIP_DISK_FULL,
        CIP_ACCESS_DENIED,
        CIP_NEWER_VERSION_EXISTS,
        CIP_OLDER_VERSION_EXISTS,
        CIP_NAME_CONFLICT,
        CIP_TRUST_VERIFICATION_COMPONENT_MISSING,
        CIP_EXE_SELF_REGISTERATION_TIMEOUT,
        CIP_UNSAFE_TO_ABORT,
        CIP_NEED_REBOOT,        
        CIP_NEED_REBOOT_UI_PERMISSION
    } CIP_STATUS;

    HRESULT OnCodeInstallProblem(
            [in] ULONG ulStatusCode,            // contingency status
            [in, unique] LPCWSTR szDestination,         // file that needs to be updated
            [in, unique] LPCWSTR szSource,              // new version from 'net (a temp file)
            [in] DWORD dwReserved
            );

}

cpp_quote("#endif")
*/


//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:   IWinInetInfo interface definition
//
//----------------------------------------------------------------------------
/*
cpp_quote("#ifndef _LPWININETINFO_DEFINED")
cpp_quote("#define _LPWININETINFO_DEFINED")

[
    object,
    uuid(79eac9d6-bafa-11ce-8c82-00aa004ba90b),
    pointer_default(unique)
]

interface IWinInetInfo : IUnknown
{

    typedef [unique] IWinInetInfo *LPWININETINFO;

    [local]
    HRESULT QueryOption(
            [in]      DWORD  dwOption,
            [in, out, size_is(*pcbBuf)]     LPVOID pBuffer,
            [in, out] DWORD *pcbBuf);

    [call_as(QueryOption)]
    HRESULT RemoteQueryOption(
            [in]      DWORD  dwOption,
            [in, out, size_is(*pcbBuf)]     BYTE *pBuffer,
            [in, out] DWORD *pcbBuf);

}
cpp_quote("#endif")

cpp_quote("#define WININETINFO_OPTION_LOCK_HANDLE 65534")
*/

//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:   IHttpSecurity interface definition
//
//----------------------------------------------------------------------------
/*
cpp_quote("#ifndef _LPHTTPSECURITY_DEFINED")
cpp_quote("#define _LPHTTPSECURITY_DEFINED")

[
    local,
    object,
    uuid(79eac9d7-bafa-11ce-8c82-00aa004ba90b),

    pointer_default(unique)
]


interface IHttpSecurity : IWindowForBindingUI
{
    typedef [unique] IHttpSecurity *LPHTTPSECURITY;

   HRESULT OnSecurityProblem(
            [in] DWORD dwProblem);

}
cpp_quote("#endif")
*/

//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:   IWinInetHttpInfo interface definition
//
//----------------------------------------------------------------------------
/*
cpp_quote("#ifndef _LPWININETHTTPINFO_DEFINED")
cpp_quote("#define _LPWININETHTTPINFO_DEFINED")

[
    object,
    uuid(79eac9d8-bafa-11ce-8c82-00aa004ba90b),
    pointer_default(unique)
]

interface IWinInetHttpInfo : IWinInetInfo
{
    typedef [unique] IWinInetHttpInfo *LPWININETHTTPINFO;

    [local]
    HRESULT QueryInfo(
            [in]      DWORD  dwOption,
            [in, out,size_is(*pcbBuf)]     LPVOID pBuffer,
            [in, out] DWORD *pcbBuf,
            [in, out] DWORD *pdwFlags,
            [in, out] DWORD *pdwReserved
            );

    [call_as(QueryInfo)]
    HRESULT RemoteQueryInfo(
            [in]      DWORD  dwOption,
            [in,out,size_is(*pcbBuf)] BYTE *pBuffer,
            [in, out] DWORD *pcbBuf,
            [in, out] DWORD *pdwFlags,
            [in, out] DWORD *pdwReserved
            );

}
cpp_quote("#endif")
*/

//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:   IWinInetCacheHints interface definition
//
//----------------------------------------------------------------------------
/*
cpp_quote("#ifndef _LPWININETCACHEHINTS_DEFINED")
cpp_quote("#define _LPWININETCACHEHINTS_DEFINED")

[
    local,
    object,
    uuid(DD1EC3B3-8391-4fdb-A9E6-347C3CAAA7DD),
    pointer_default(unique)
]

interface IWinInetCacheHints : IUnknown
{
    typedef [unique] IWinInetCacheHints *LPWININETCACHEHINTS;

    HRESULT SetCacheExtension(
            [in]      LPCWSTR  pwzExt,
            [in,out,size_is(*pcbCacheFile)]    LPVOID pszCacheFile,
            [in, out]   DWORD* pcbCacheFile,
            [in, out]   DWORD* pdwWinInetError,
            [in, out]   DWORD* pdwReserved
            );
}
cpp_quote("#endif")

cpp_quote("#define SID_IBindHost IID_IBindHost")
cpp_quote("#define SID_SBindHost IID_IBindHost")
*/
//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:   IBindHost definition
//
//---------------------------------------------------------------------------
/*
cpp_quote("#ifndef _LPBINDHOST_DEFINED")
cpp_quote("#define _LPBINDHOST_DEFINED")

cpp_quote("EXTERN_C const GUID SID_BindHost;")
[
        object,
        uuid(fc4801a1-2ba9-11cf-a229-00aa003d7352),
        pointer_default(unique)
]
interface IBindHost : IUnknown
{
        typedef [unique] IBindHost *LPBINDHOST;

        HRESULT CreateMoniker(
            [in]    LPOLESTR    szName,
            [in]    IBindCtx   *pBC,
            [out]   IMoniker**  ppmk,
            [in]    DWORD       dwReserved);

        [local]
        HRESULT MonikerBindToStorage(
            [in]    IMoniker            *pMk,
            [in]    IBindCtx            *pBC,
            [in]    IBindStatusCallback *pBSC,
            [in]    REFIID              riid,
            [out]   void                **ppvObj);

        [call_as(MonikerBindToStorage)]
        HRESULT RemoteMonikerBindToStorage(
            [in, unique]    IMoniker            *pMk,
            [in, unique]    IBindCtx            *pBC,
            [in, unique]    IBindStatusCallback *pBSC,
            [in]            REFIID riid,
            [out, iid_is(riid)] IUnknown **ppvObj);

        [local]
        HRESULT MonikerBindToObject(
            [in]    IMoniker            *pMk,
            [in]    IBindCtx            *pBC,
            [in]    IBindStatusCallback *pBSC,
            [in]    REFIID              riid,
            [out]   void                **ppvObj);

        [call_as(MonikerBindToObject)]
        HRESULT RemoteMonikerBindToObject(
            [in, unique]    IMoniker            *pMk,
            [in, unique]    IBindCtx            *pBC,
            [in, unique]    IBindStatusCallback *pBSC,
            [in]            REFIID riid,
            [out, iid_is(riid)] IUnknown **ppvObj);
}

cpp_quote("#endif")
*/
+/

// urlhlink stuff
/+
#pragma midl_echo("                                                                                                           ")
cpp_quote("// These are for backwards compatibility with previous URLMON versions")
#pragma midl_echo("// Flags for the UrlDownloadToCacheFile                                                                    ")
#pragma midl_echo("#define URLOSTRM_USECACHEDCOPY_ONLY             0x1      // Only get from cache                            ")
#pragma midl_echo("#define URLOSTRM_USECACHEDCOPY                  0x2      // Get from cache if available else download      ")
#pragma midl_echo("#define URLOSTRM_GETNEWESTVERSION               0x3      // Get new version only. But put it in cache too  ")
#pragma midl_echo("                                                                                                           ")
#pragma midl_echo("                                                                                                           ")
#pragma midl_echo("struct IBindStatusCallback;                                                                                ")
#pragma midl_echo("STDAPI HlinkSimpleNavigateToString(                                                                        ")
#pragma midl_echo("    /* [in] */ LPCWSTR szTarget,         // required - target document - null if local jump w/in doc       ")
#pragma midl_echo("    /* [in] */ LPCWSTR szLocation,       // optional, for navigation into middle of a doc                  ")
#pragma midl_echo("    /* [in] */ LPCWSTR szTargetFrameName,// optional, for targeting frame-sets                             ")
#pragma midl_echo("    /* [in] */ IUnknown *pUnk,           // required - we'll search this for other necessary interfaces    ")
#pragma midl_echo("    /* [in] */ IBindCtx *pbc,            // optional. caller may register an IBSC in this                  ")
#pragma midl_echo("    /* [in] */ IBindStatusCallback *,                                                                      ")
#pragma midl_echo("    /* [in] */ DWORD grfHLNF,            // flags                                                          ")
#pragma midl_echo("    /* [in] */ DWORD dwReserved          // for future use, must be NULL                                   ")
#pragma midl_echo(");                                                                                                         ")
#pragma midl_echo("                                                                                                           ")
#pragma midl_echo("STDAPI HlinkSimpleNavigateToMoniker(                                                                       ")
#pragma midl_echo("    /* [in] */ IMoniker *pmkTarget,      // required - target document - (may be null                      ")
#pragma midl_echo("    /* [in] */ LPCWSTR szLocation,       // optional, for navigation into middle of a doc                  ")
#pragma midl_echo("    /* [in] */ LPCWSTR szTargetFrameName,// optional, for targeting frame-sets                             ")
#pragma midl_echo("    /* [in] */ IUnknown *pUnk,           // required - we'll search this for other necessary interfaces    ")
#pragma midl_echo("    /* [in] */ IBindCtx *pbc,            // optional. caller may register an IBSC in this                  ")
#pragma midl_echo("    /* [in] */ IBindStatusCallback *,                                                                      ")
#pragma midl_echo("    /* [in] */ DWORD grfHLNF,            // flags                                                          ")
#pragma midl_echo("    /* [in] */ DWORD dwReserved          // for future use, must be NULL                                   ")
#pragma midl_echo(");                                                                                                         ")
//#pragma midl_echo("typedef HRESULT (STDAPICALLTYPE *LPFNUOSCALLBACK)(LPBINDSTATUSCALLBACK);                                   ")
#pragma midl_echo("                                                                                                           ")
#pragma midl_echo("STDAPI URLOpenStreamA(LPUNKNOWN,LPCSTR,DWORD,LPBINDSTATUSCALLBACK);                                        ")
#pragma midl_echo("STDAPI URLOpenStreamW(LPUNKNOWN,LPCWSTR,DWORD,LPBINDSTATUSCALLBACK);                                       ")
#pragma midl_echo("STDAPI URLOpenPullStreamA(LPUNKNOWN,LPCSTR,DWORD,LPBINDSTATUSCALLBACK);                                    ")
#pragma midl_echo("STDAPI URLOpenPullStreamW(LPUNKNOWN,LPCWSTR,DWORD,LPBINDSTATUSCALLBACK);                                   ")
#pragma midl_echo("STDAPI URLDownloadToFileA(LPUNKNOWN,LPCSTR,LPCSTR,DWORD,LPBINDSTATUSCALLBACK);                             ")
#pragma midl_echo("STDAPI URLDownloadToFileW(LPUNKNOWN,LPCWSTR,LPCWSTR,DWORD,LPBINDSTATUSCALLBACK);                           ")
#pragma midl_echo("STDAPI URLDownloadToCacheFileA(LPUNKNOWN,LPCSTR,LPTSTR,DWORD,DWORD,LPBINDSTATUSCALLBACK);                  ")
#pragma midl_echo("STDAPI URLDownloadToCacheFileW(LPUNKNOWN,LPCWSTR,LPWSTR,DWORD,DWORD,LPBINDSTATUSCALLBACK);                 ")
#pragma midl_echo("STDAPI URLOpenBlockingStreamA(LPUNKNOWN,LPCSTR,LPSTREAM*,DWORD,LPBINDSTATUSCALLBACK);                      ")
#pragma midl_echo("STDAPI URLOpenBlockingStreamW(LPUNKNOWN,LPCWSTR,LPSTREAM*,DWORD,LPBINDSTATUSCALLBACK);                     ")
#pragma midl_echo("                                                                                                           ")
#pragma midl_echo("#ifdef UNICODE                                                                                             ")
#pragma midl_echo("#define URLOpenStream            URLOpenStreamW                                                            ")
#pragma midl_echo("#define URLOpenPullStream        URLOpenPullStreamW                                                        ")
#pragma midl_echo("#define URLDownloadToFile        URLDownloadToFileW                                                        ")
#pragma midl_echo("#define URLDownloadToCacheFile   URLDownloadToCacheFileW                                                   ")
#pragma midl_echo("#define URLOpenBlockingStream    URLOpenBlockingStreamW                                                    ")
#pragma midl_echo("#else                                                                                                      ")
#pragma midl_echo("#define URLOpenStream            URLOpenStreamA                                                            ")
#pragma midl_echo("#define URLOpenPullStream        URLOpenPullStreamA                                                        ")
#pragma midl_echo("#define URLDownloadToFile        URLDownloadToFileA                                                        ")
#pragma midl_echo("#define URLDownloadToCacheFile   URLDownloadToCacheFileA                                                   ")
#pragma midl_echo("#define URLOpenBlockingStream    URLOpenBlockingStreamA                                                    ")
#pragma midl_echo("#endif // !UNICODE                                                                                         ")
#pragma midl_echo("                                                                                                           ")
#pragma midl_echo("                                                                                                           ")
#pragma midl_echo("STDAPI HlinkGoBack(IUnknown *pUnk);                                                                        ")
#pragma midl_echo("STDAPI HlinkGoForward(IUnknown *pUnk);                                                                     ")
#pragma midl_echo("STDAPI HlinkNavigateString(IUnknown *pUnk, LPCWSTR szTarget);                                              ")
#pragma midl_echo("STDAPI HlinkNavigateMoniker(IUnknown *pUnk, IMoniker *pmkTarget);                                          ")
#pragma midl_echo("                                                                                                           ")
// urlhlink end


//
// Some components to not want the new async plugable protocol interfaces (e.g OLE)
//
#pragma midl_echo("#ifndef  _URLMON_NO_ASYNC_PLUGABLE_PROTOCOLS_   ")

interface IInternet;
interface IInternetBindInfo;
interface IInternetProtocolRoot;
interface IInternetProtocol;
interface IInternetProtocolSink;
interface IInternetProtocolInfo;
interface IInternetSession;
interface IInternetProtocolSinkStackable;
+/

/+
//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:   IInternet interface definition
//
//----------------------------------------------------------------------------
/*
cpp_quote("#ifndef _LPIINTERNET")
cpp_quote("#define _LPIINTERNET")

[
        local,
        object,
        uuid(79eac9e0-baf9-11ce-8c82-00aa004ba90b),
        pointer_default(unique)
]

interface IInternet : IUnknown
{
        typedef [unique] IInternet *LPIINTERNET;



}
cpp_quote("#endif")

*/
//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:   IInternetBindInfo interface definition
//
//----------------------------------------------------------------------------
/*
cpp_quote("#ifndef _LPIINTERNETBINDINFO")
cpp_quote("#define _LPIINTERNETBINDINFO")

[
        local,
        object,
        uuid(79eac9e1-baf9-11ce-8c82-00aa004ba90b),
        pointer_default(unique)
]

interface IInternetBindInfo : IUnknown
{
        typedef [unique] IInternetBindInfo *LPIINTERNETBINDINFO;

        typedef enum tagBINDSTRING
        {
             BINDSTRING_HEADERS  = 1
            ,BINDSTRING_ACCEPT_MIMES
            ,BINDSTRING_EXTRA_URL
            ,BINDSTRING_LANGUAGE
            ,BINDSTRING_USERNAME
            ,BINDSTRING_PASSWORD
            ,BINDSTRING_UA_PIXELS
            ,BINDSTRING_UA_COLOR
            ,BINDSTRING_OS
            ,BINDSTRING_USER_AGENT
            ,BINDSTRING_ACCEPT_ENCODINGS
            ,BINDSTRING_POST_COOKIE
            ,BINDSTRING_POST_DATA_MIME
            ,BINDSTRING_URL
            ,BINDSTRING_IID
            ,BINDSTRING_FLAG_BIND_TO_OBJECT
            ,BINDSTRING_PTR_BIND_CONTEXT
        } BINDSTRING;


        HRESULT GetBindInfo(
                [out] DWORD *grfBINDF,
                [in, out, unique] BINDINFO * pbindinfo
                );

        HRESULT GetBindString(
                [in]  ULONG ulStringType,
                [in, out] LPOLESTR *ppwzStr,
                [in]      ULONG cEl,
                [in, out] ULONG *pcElFetched
                );

}
cpp_quote("#endif")
*/


//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:   IInternetProtocolRoot interface definition
//
//----------------------------------------------------------------------------
/*
cpp_quote("#ifndef _LPIINTERNETPROTOCOLROOT_DEFINED")
cpp_quote("#define _LPIINTERNETPROTOCOLROOT_DEFINED")

[
        local,
        object,
        uuid(79eac9e3-baf9-11ce-8c82-00aa004ba90b),
        pointer_default(unique)
]

interface IInternetProtocolRoot : IUnknown
{
        typedef [unique] IInternetProtocolRoot *LPIINTERNETPROTOCOLROOT;

        typedef enum _tagPI_FLAGS
        {
             PI_PARSE_URL               = 0x00000001
            ,PI_FILTER_MODE             = 0x00000002
            ,PI_FORCE_ASYNC             = 0x00000004
            ,PI_USE_WORKERTHREAD        = 0x00000008
            ,PI_MIMEVERIFICATION        = 0x00000010
            ,PI_CLSIDLOOKUP             = 0x00000020
            ,PI_DATAPROGRESS            = 0x00000040
            ,PI_SYNCHRONOUS             = 0x00000080
            ,PI_APARTMENTTHREADED       = 0x00000100
            ,PI_CLASSINSTALL            = 0x00000200
            // new flags to deal with mime handler
            // and to load app directly
            ,PI_PASSONBINDCTX                   = 0x00002000
            ,PI_NOMIMEHANDLER                   = 0x00008000
            ,PI_LOADAPPDIRECT                   = 0x00004000
            // flags used in the protocol data on switch
            ,PD_FORCE_SWITCH            = 0x00010000
            ,PI_PREFERDEFAULTHANDLER            = 0x00020000
            
        } PI_FLAGS;

        typedef struct _tagPROTOCOLDATA
        {
            DWORD   grfFlags;
            DWORD   dwState;
            LPVOID  pData;
            ULONG   cbData;
        } PROTOCOLDATA;

        typedef struct _tagStartParam
        {
            IID       iid;
            IBindCtx  *pIBindCtx;
            IUnknown  *pItf;    
        } StartParam;


        HRESULT Start(
            [in] LPCWSTR szUrl,
            [in] IInternetProtocolSink *pOIProtSink,
            [in] IInternetBindInfo *pOIBindInfo,
            [in] DWORD grfPI,
            [in] HANDLE_PTR dwReserved
            );

        HRESULT Continue(
            [in] PROTOCOLDATA *pProtocolData
            );

        HRESULT Abort(
            [in] HRESULT hrReason,
            [in] DWORD dwOptions
            );

        HRESULT Terminate(
            [in] DWORD dwOptions
            );

        HRESULT Suspend();

        HRESULT Resume();

}
cpp_quote("#endif")
*/

//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:   IInternetProtocol interface definition
//
//----------------------------------------------------------------------------
/*
cpp_quote("#ifndef _LPIINTERNETPROTOCOL_DEFINED")
cpp_quote("#define _LPIINTERNETPROTOCOL_DEFINED")

[
        local,
        object,
        uuid(79eac9e4-baf9-11ce-8c82-00aa004ba90b),
        pointer_default(unique)
]

interface IInternetProtocol : IInternetProtocolRoot
{

        typedef [unique] IInternetProtocol *LPIINTERNETPROTOCOL;

        HRESULT Read(
            [in,out, size_is(cb), length_is(*pcbRead)]
            void *pv,
            [in] ULONG cb,
            [out] ULONG *pcbRead);

        HRESULT Seek(
            [in] LARGE_INTEGER dlibMove,
            [in] DWORD dwOrigin,
            [out] ULARGE_INTEGER *plibNewPosition);

        HRESULT LockRequest(
            [in] DWORD dwOptions
            );

        HRESULT UnlockRequest();
}
cpp_quote("#endif")
*/
//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:   IInternetProtocolSink interface definition
//
//----------------------------------------------------------------------------
/*
cpp_quote("#ifndef _LPIINTERNETPROTOCOLSINK_DEFINED")
cpp_quote("#define _LPIINTERNETPROTOCOLSINK_DEFINED")

[
        local,
        object,
        uuid(79eac9e5-baf9-11ce-8c82-00aa004ba90b),
        pointer_default(unique)
]

interface IInternetProtocolSink : IUnknown
{
        typedef [unique] IInternetProtocolSink *LPIINTERNETPROTOCOLSINK;

        HRESULT Switch(
            [in] PROTOCOLDATA *pProtocolData
            );

        HRESULT ReportProgress(
            [in] ULONG   ulStatusCode,
            [in] LPCWSTR szStatusText
            );

        HRESULT ReportData(
            [in] DWORD grfBSCF,
            [in] ULONG ulProgress,
            [in] ULONG ulProgressMax
            );

        HRESULT ReportResult(
            [in] HRESULT hrResult,
            [in] DWORD   dwError,
            [in] LPCWSTR szResult
            );
}
cpp_quote("#endif")
*/
//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:   IInternetProtocolSinkStackable interface definition
//
//----------------------------------------------------------------------------
/*
cpp_quote("#ifndef _LPIINTERNETPROTOCOLSINKSTACKABLE_DEFINED")
cpp_quote("#define _LPIINTERNETPROTOCOLSINKSTACKABLE_DEFINED")

[
        local,
        object,
        uuid(79eac9f0-baf9-11ce-8c82-00aa004ba90b),
        pointer_default(unique)
]

interface IInternetProtocolSinkStackable : IUnknown
{
        typedef [unique] IInternetProtocolSinkStackable *LPIINTERNETPROTOCOLSINKStackable;

        HRESULT SwitchSink(
            [in] IInternetProtocolSink *pOIProtSink
            );

        HRESULT CommitSwitch();
        HRESULT RollbackSwitch();
}
cpp_quote("#endif")
*/
//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995 - 1997.
//
//  Contents:   IInternetSession interface definition
//
//----------------------------------------------------------------------------
/*
cpp_quote("#ifndef _LPIINTERNETSESSION_DEFINED")
cpp_quote("#define _LPIINTERNETSESSION_DEFINED")

[
        local,
        object,
        uuid(79eac9e7-baf9-11ce-8c82-00aa004ba90b),
        pointer_default(unique)
]


interface IInternetSession : IUnknown
{
        typedef [unique] IInternetSession *LPIINTERNETSESSION;

        typedef enum _tagOIBDG_FLAGS
        {
            // default is free threaded
             OIBDG_APARTMENTTHREADED        = 0x00000100
            ,OIBDG_DATAONLY                 = 0x00001000
        } OIBDG_FLAGS;

        HRESULT RegisterNameSpace(
            [in] IClassFactory *pCF,
            [in] REFCLSID rclsid,
            [in] LPCWSTR pwzProtocol,
            [in] ULONG          cPatterns,
            [in] const LPCWSTR *ppwzPatterns,
            [in] DWORD          dwReserved
            );

        HRESULT UnregisterNameSpace(
            [in] IClassFactory *pCF,
            [in] LPCWSTR pszProtocol
            );

        HRESULT RegisterMimeFilter(
            [in] IClassFactory *pCF,
            [in] REFCLSID rclsid,
            [in] LPCWSTR pwzType
            );

        HRESULT UnregisterMimeFilter(
            [in] IClassFactory *pCF,
            [in] LPCWSTR pwzType
            );

        HRESULT CreateBinding(
            [in] LPBC pBC,
            [in] LPCWSTR szUrl,
            [in] IUnknown *pUnkOuter,
            [out, unique] IUnknown **ppUnk,
            [out, unique] IInternetProtocol **ppOInetProt,
            [in] DWORD dwOption
            );

        HRESULT SetSessionOption(
            [in] DWORD dwOption,
            [in] LPVOID pBuffer,
            [in] DWORD dwBufferLength,
            [in] DWORD dwReserved
            );

        HRESULT GetSessionOption(
            [in] DWORD dwOption,
            [in, out] LPVOID pBuffer,
            [in, out] DWORD *pdwBufferLength,
            [in] DWORD dwReserved
            );
}
cpp_quote("#endif")
*/

//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:   IInternetThreadSwitch interface definition
//
//----------------------------------------------------------------------------
/*
cpp_quote("#ifndef _LPIINTERNETTHREADSWITCH_DEFINED")
cpp_quote("#define _LPIINTERNETTHREADSWITCH_DEFINED")

[
        local,
        object,
        uuid(79eac9e8-baf9-11ce-8c82-00aa004ba90b),
        pointer_default(unique)
]

interface IInternetThreadSwitch : IUnknown
{
        typedef [unique] IInternetThreadSwitch *LPIINTERNETTHREADSWITCH;

        HRESULT Prepare();

        HRESULT Continue();
}
cpp_quote("#endif")
*/


//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:   IInternetPriority interface definition
//
//----------------------------------------------------------------------------
/*
cpp_quote("#ifndef _LPIINTERNETPRIORITY_DEFINED")
cpp_quote("#define _LPIINTERNETPRIORITY_DEFINED")

[
        local,
        object,
        uuid(79eac9eb-baf9-11ce-8c82-00aa004ba90b),
        pointer_default(unique)
]

interface IInternetPriority : IUnknown
{
        typedef [unique] IInternetPriority *LPIINTERNETPRIORITY;

        HRESULT SetPriority(
            [in] LONG nPriority
            );

        HRESULT GetPriority(
            [out] LONG * pnPriority
            );

}
cpp_quote("#endif")
*/



//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:   IInternetProtocolInfo interface definition
//
//----------------------------------------------------------------------------
/*
cpp_quote("#ifndef _LPIINTERNETPROTOCOLINFO_DEFINED")
cpp_quote("#define _LPIINTERNETPROTOCOLINFO_DEFINED")

[
        local,
        object,
        uuid(79eac9ec-baf9-11ce-8c82-00aa004ba90b),
        pointer_default(unique)
]

interface IInternetProtocolInfo : IUnknown
{
        typedef [unique] IInternetProtocolInfo *LPIINTERNETPROTOCOLINFO;

        typedef enum _tagPARSEACTION
        {
             PARSE_CANONICALIZE      = 1    // compute canonical URL
            ,PARSE_FRIENDLY                 // get user friendly name from URL
            ,PARSE_SECURITY_URL             // get security URL.
            ,PARSE_ROOTDOCUMENT             // returns URL of root document for site
            ,PARSE_DOCUMENT                 // Strips of #anchor
            ,PARSE_ANCHOR                   // Strips of everything before #anchor
            ,PARSE_ENCODE                   // encode the url
            ,PARSE_DECODE                   // decode the url
            ,PARSE_PATH_FROM_URL            // get the path if apply
            ,PARSE_URL_FROM_PATH            // create a url from the path
            ,PARSE_MIME                     // return mime of this url
            ,PARSE_SERVER                   // return server
            ,PARSE_SCHEMA
            ,PARSE_SITE
            ,PARSE_DOMAIN
            ,PARSE_LOCATION
            ,PARSE_SECURITY_DOMAIN          // returns the canonical security form of the URL.
            ,PARSE_ESCAPE                   // encode the url
            ,PARSE_UNESCAPE                 // decode the url
        } PARSEACTION;

        // Actions for CoInternetGetSecurityURL function.
        typedef enum _tagPSUACTION
        {
            PSU_DEFAULT            = 1         // gets security URL and returns its domain.
            ,PSU_SECURITY_URL_ONLY             // gets just the security URL
        } PSUACTION;

        //
        // Query options - needs more work on possible options
        //
        typedef enum _tagQUERYOPTION
        {
             QUERY_EXPIRATION_DATE      = 1     // the expiration date in form of systemtime
            ,QUERY_TIME_OF_LAST_CHANGE          // time of last change in form of systemtime
            ,QUERY_CONTENT_ENCODING             // the content concoding schema
            ,QUERY_CONTENT_TYPE                 // the content type header (mime and charset)
            ,QUERY_REFRESH                      // the refresh
            ,QUERY_RECOMBINE                    // combine the page URL with the nearest base if TRUE
            ,QUERY_CAN_NAVIGATE                 // does the protocol navigate (unlike mailto)
            ,QUERY_USES_NETWORK                 // will URL hit network
            ,QUERY_IS_CACHED                    // is data cached locally?
            ,QUERY_IS_INSTALLEDENTRY            // Is the entry installed locally (on cdrom)
            ,QUERY_IS_CACHED_OR_MAPPED          // is the entry in cache or is it on a mapped drive
                                                // It may be mapped but may not actually be present
            ,QUERY_USES_CACHE                   // does the protocol use the internet cache
            ,QUERY_IS_SECURE                    // is the protocol encrypted
            ,QUERY_IS_SAFE                      // the protocol serves only trusted (e.g. local resource) content
        } QUERYOPTION;

        //
        // returns:
        // S_OK on success
        // S_FALSE on success but buffer is too small
        // INET_E_DEFAULT_ACTION if action is not know should be handled be default implementation
        //
        HRESULT ParseUrl(
            [in]    LPCWSTR     pwzUrl,
            [in]    PARSEACTION ParseAction,
            [in]    DWORD       dwParseFlags,
            [out]   LPWSTR      pwzResult,
            [in]    DWORD       cchResult,
            [out]   DWORD      *pcchResult,
            [in]    DWORD       dwReserved
            );

        //
        // returns:
        // S_OK on success
        // S_FALSE on success but buffer is too small
        // INET_E_DEFAULT_ACTION if action is not know should be handled be default implementation
        //
        HRESULT CombineUrl(
            [in]    LPCWSTR     pwzBaseUrl,
            [in]    LPCWSTR     pwzRelativeUrl,
            [in]    DWORD       dwCombineFlags,
            [out]   LPWSTR      pwzResult,
            [in]    DWORD       cchResult,
            [out]   DWORD      *pcchResult,
            [in]    DWORD       dwReserved
            );

        //
        // returns:
        // S_OK  if equal
        // S_FALSE otherwise
        //
        HRESULT CompareUrl(
            [in]    LPCWSTR pwzUrl1,
            [in]    LPCWSTR pwzUrl2,
            [in]    DWORD dwCompareFlags
            );

        //
        // returns:
        // S_OK on success
        // S_FALSE on success but buffer is too small
        // INET_E_QUERYOPTION_UNKNOWN
        //
        HRESULT QueryInfo(
            [in]        LPCWSTR pwzUrl,
            [in]        QUERYOPTION   OueryOption,
            [in]        DWORD         dwQueryFlags,
            [in, out,size_is(*pcbBuf)]  LPVOID pBuffer,
            [in]        DWORD   cbBuffer,
            [in, out]   DWORD  *pcbBuf,
            [in]        DWORD   dwReserved
            );

}

cpp_quote("#endif")
*/
+/

/+
//
// compatablility defines
//
cpp_quote("#define IOInet               IInternet            ")
cpp_quote("#define IOInetBindInfo       IInternetBindInfo    ")
cpp_quote("#define IOInetProtocolRoot   IInternetProtocolRoot")
cpp_quote("#define IOInetProtocol       IInternetProtocol    ")
cpp_quote("#define IOInetProtocolSink   IInternetProtocolSink")
cpp_quote("#define IOInetProtocolInfo   IInternetProtocolInfo")
cpp_quote("#define IOInetSession        IInternetSession     ")
cpp_quote("#define IOInetPriority       IInternetPriority    ")
cpp_quote("#define IOInetThreadSwitch   IInternetThreadSwitch")
cpp_quote("#define IOInetProtocolSinkStackable   IInternetProtocolSinkStackable")

cpp_quote("#define LPOINET              LPIINTERNET             ")
cpp_quote("#define LPOINETPROTOCOLINFO  LPIINTERNETPROTOCOLINFO ")
cpp_quote("#define LPOINETBINDINFO      LPIINTERNETBINDINFO     ")
cpp_quote("#define LPOINETPROTOCOLROOT  LPIINTERNETPROTOCOLROOT ")
cpp_quote("#define LPOINETPROTOCOL      LPIINTERNETPROTOCOL     ")
cpp_quote("#define LPOINETPROTOCOLSINK  LPIINTERNETPROTOCOLSINK ")
cpp_quote("#define LPOINETSESSION       LPIINTERNETSESSION      ")
cpp_quote("#define LPOINETTHREADSWITCH  LPIINTERNETTHREADSWITCH ")
cpp_quote("#define LPOINETPRIORITY      LPIINTERNETPRIORITY     ")
cpp_quote("#define LPOINETPROTOCOLINFO  LPIINTERNETPROTOCOLINFO ")
cpp_quote("#define LPOINETPROTOCOLSINKSTACKABLE  LPIINTERNETPROTOCOLSINKSTACKABLE ")


cpp_quote("#define IID_IOInet               IID_IInternet            ")
cpp_quote("#define IID_IOInetBindInfo       IID_IInternetBindInfo    ")
cpp_quote("#define IID_IOInetProtocolRoot   IID_IInternetProtocolRoot")
cpp_quote("#define IID_IOInetProtocol       IID_IInternetProtocol    ")
cpp_quote("#define IID_IOInetProtocolSink   IID_IInternetProtocolSink")
cpp_quote("#define IID_IOInetProtocolInfo   IID_IInternetProtocolInfo")
cpp_quote("#define IID_IOInetSession        IID_IInternetSession     ")
cpp_quote("#define IID_IOInetPriority       IID_IInternetPriority    ")
cpp_quote("#define IID_IOInetThreadSwitch   IID_IInternetThreadSwitch")
cpp_quote("#define IID_IOInetProtocolSinkStackable   IID_IInternetProtocolSinkStackable")


//
// OInet helper functions for url parsing
//
#pragma midl_echo("STDAPI CoInternetParseUrl(               ")
#pragma midl_echo("    LPCWSTR     pwzUrl,                  ")
#pragma midl_echo("    PARSEACTION ParseAction,             ")
#pragma midl_echo("    DWORD       dwFlags,                 ")
#pragma midl_echo("    LPWSTR      pszResult,               ")
#pragma midl_echo("    DWORD       cchResult,               ")
#pragma midl_echo("    DWORD      *pcchResult,              ")
#pragma midl_echo("    DWORD       dwReserved               ")
#pragma midl_echo("    );                                   ")
#pragma midl_echo("STDAPI CoInternetCombineUrl(             ")
#pragma midl_echo("    LPCWSTR     pwzBaseUrl,              ")
#pragma midl_echo("    LPCWSTR     pwzRelativeUrl,          ")
#pragma midl_echo("    DWORD       dwCombineFlags,          ")
#pragma midl_echo("    LPWSTR      pszResult,               ")
#pragma midl_echo("    DWORD       cchResult,               ")
#pragma midl_echo("    DWORD      *pcchResult,              ")
#pragma midl_echo("    DWORD       dwReserved               ")
#pragma midl_echo("    );                                   ")
#pragma midl_echo("STDAPI CoInternetCompareUrl(             ")
#pragma midl_echo("    LPCWSTR pwzUrl1,                     ")
#pragma midl_echo("    LPCWSTR pwzUrl2,                     ")
#pragma midl_echo("    DWORD dwFlags                        ")
#pragma midl_echo("    );                                   ")
#pragma midl_echo("STDAPI CoInternetGetProtocolFlags(       ")
#pragma midl_echo("    LPCWSTR     pwzUrl,                  ")
#pragma midl_echo("    DWORD      *pdwFlags,                ")
#pragma midl_echo("    DWORD       dwReserved               ")
#pragma midl_echo("    );                                   ")
#pragma midl_echo("STDAPI CoInternetQueryInfo(              ")
#pragma midl_echo("    LPCWSTR     pwzUrl,                  ")
#pragma midl_echo("    QUERYOPTION QueryOptions,            ")
#pragma midl_echo("    DWORD       dwQueryFlags,            ")
#pragma midl_echo("    LPVOID      pvBuffer,                ")
#pragma midl_echo("    DWORD       cbBuffer,                ")
#pragma midl_echo("    DWORD      *pcbBuffer,               ")
#pragma midl_echo("    DWORD       dwReserved               ")
#pragma midl_echo("    );                                   ")
#pragma midl_echo("STDAPI CoInternetGetSession(             ")
#pragma midl_echo("    DWORD       dwSessionMode,           ")
#pragma midl_echo("    IInternetSession **ppIInternetSession,")
#pragma midl_echo("    DWORD       dwReserved               ")
#pragma midl_echo("    );                                   ")
#pragma midl_echo("STDAPI CoInternetGetSecurityUrl(         ")
#pragma midl_echo("    LPCWSTR pwzUrl,                      ")
#pragma midl_echo("    LPWSTR  *ppwzSecUrl,                 ")
#pragma midl_echo("    PSUACTION  psuAction,                ")
#pragma midl_echo("    DWORD   dwReserved                   ")
#pragma midl_echo("    );                                   ")
#pragma midl_echo("STDAPI AsyncInstallDistributionUnit(     ")
#pragma midl_echo("    LPCWSTR szDistUnit,                  ")
#pragma midl_echo("    LPCWSTR szTYPE,                      ")
#pragma midl_echo("    LPCWSTR szExt,                       ")
#pragma midl_echo("    DWORD dwFileVersionMS,               ")
#pragma midl_echo("    DWORD dwFileVersionLS,               ")
#pragma midl_echo("    LPCWSTR szURL,                       ")
#pragma midl_echo("    IBindCtx *pbc,                       ")
#pragma midl_echo("    LPVOID   pvReserved,                 ")
#pragma midl_echo("    DWORD   flags                        ")
#pragma midl_echo("    );                                   ")

//
// Feature options, primarily for Springboard 
//

cpp_quote("#ifndef _INTERNETFEATURELIST_DEFINED")
cpp_quote("#define _INTERNETFEATURELIST_DEFINED")

typedef enum _tagINTERNETFEATURELIST
{
    FEATURE_OBJECT_CACHING      = 0,
    FEATURE_ZONE_ELEVATION,
    FEATURE_MIME_HANDLING,
    FEATURE_MIME_SNIFFING,
    FEATURE_WINDOW_RESTRICTIONS,
    FEATURE_WEBOC_POPUPMANAGEMENT,
    FEATURE_BEHAVIORS,
    FEATURE_DISABLE_MK_PROTOCOL,
    FEATURE_LOCALMACHINE_LOCKDOWN,
    FEATURE_SECURITYBAND,
    FEATURE_RESTRICT_ACTIVEXINSTALL,
    FEATURE_VALIDATE_NAVIGATE_URL,
    FEATURE_RESTRICT_FILEDOWNLOAD,
    FEATURE_ADDON_MANAGEMENT,
    FEATURE_PROTOCOL_LOCKDOWN,
    FEATURE_HTTP_USERNAME_PASSWORD_DISABLE,
    FEATURE_SAFE_BINDTOOBJECT,
    FEATURE_UNC_SAVEDFILECHECK,
    FEATURE_GET_URL_DOM_FILEPATH_UNENCODED,
    FEATURE_ENTRY_COUNT,             // This should be the last item              
} INTERNETFEATURELIST;        

cpp_quote("")
cpp_quote("// CoInternetSetFeatureEnabled can be used to set/reset features. ")
cpp_quote("// The following flags control where the feature is set")
cpp_quote("")
cpp_quote("#define SET_FEATURE_ON_THREAD                       0x00000001")
cpp_quote("#define SET_FEATURE_ON_PROCESS                      0x00000002")
cpp_quote("#define SET_FEATURE_IN_REGISTRY                     0x00000004")
cpp_quote("#define SET_FEATURE_ON_THREAD_LOCALMACHINE          0x00000008")
cpp_quote("#define SET_FEATURE_ON_THREAD_INTRANET              0x00000010")
cpp_quote("#define SET_FEATURE_ON_THREAD_TRUSTED               0x00000020")
cpp_quote("#define SET_FEATURE_ON_THREAD_INTERNET              0x00000040")
cpp_quote("#define SET_FEATURE_ON_THREAD_RESTRICTED            0x00000080")

cpp_quote("")
cpp_quote("// CoInternetIsFeatureEnabled can be used to get features. ")
cpp_quote("// The following flags control where the feature is obtained from")
cpp_quote("// default is from process")
cpp_quote("")
cpp_quote("#define GET_FEATURE_FROM_THREAD                      0x00000001")
cpp_quote("#define GET_FEATURE_FROM_PROCESS                     0x00000002")
cpp_quote("#define GET_FEATURE_FROM_REGISTRY                    0x00000004")
cpp_quote("#define GET_FEATURE_FROM_THREAD_LOCALMACHINE         0x00000008")
cpp_quote("#define GET_FEATURE_FROM_THREAD_INTRANET             0x00000010")
cpp_quote("#define GET_FEATURE_FROM_THREAD_TRUSTED              0x00000020")
cpp_quote("#define GET_FEATURE_FROM_THREAD_INTERNET             0x00000040")
cpp_quote("#define GET_FEATURE_FROM_THREAD_RESTRICTED           0x00000080")

cpp_quote("#endif")
        
//
// OInet helper functions for looking up if features are enabled
//

#pragma midl_echo("STDAPI CoInternetSetFeatureEnabled(      ")
#pragma midl_echo("    INTERNETFEATURELIST FeatureEntry,    ")
#pragma midl_echo("    DWORD dwFlags,                       ")
#pragma midl_echo("    BOOL fEnable                         ")
#pragma midl_echo("    );                                   ")

#pragma midl_echo("STDAPI CoInternetIsFeatureEnabled(       ")
#pragma midl_echo("    INTERNETFEATURELIST FeatureEntry,    ")
#pragma midl_echo("    DWORD dwFlags                        ")
#pragma midl_echo("    );                                   ")

#pragma midl_echo("STDAPI CoInternetIsFeatureEnabledForUrl( ")
#pragma midl_echo("    INTERNETFEATURELIST FeatureEntry,    ")
#pragma midl_echo("    DWORD dwFlags,                       ")
#pragma midl_echo("    LPCWSTR szURL,                       ")
#pragma midl_echo("    IInternetSecurityManager *pSecMgr    ")
#pragma midl_echo("    );                                   ")

#pragma midl_echo("STDAPI CoInternetIsFeatureZoneElevationEnabled( ")
#pragma midl_echo("    LPCWSTR szFromURL,                          ")
#pragma midl_echo("    LPCWSTR szToURL,                            ")
#pragma midl_echo("    IInternetSecurityManager *pSecMgr,          ")
#pragma midl_echo("    DWORD dwFlags                               ")
#pragma midl_echo("    );                                          ")

//
// STGMEDIUMs and BINDINFO helper utils
//
#pragma midl_echo(" ")
#pragma midl_echo("STDAPI CopyStgMedium(const STGMEDIUM * pcstgmedSrc,  ")
#pragma midl_echo("                           STGMEDIUM * pstgmedDest); ")

#pragma midl_echo("STDAPI CopyBindInfo( const BINDINFO * pcbiSrc,   ")
#pragma midl_echo("                           BINDINFO * pbiDest ); ")

#pragma midl_echo("STDAPI_(void) ReleaseBindInfo( BINDINFO * pbindinfo );  ")
#pragma midl_echo(" ")

cpp_quote("#define INET_E_USE_DEFAULT_PROTOCOLHANDLER _HRESULT_TYPEDEF_(0x800C0011L)      ")
cpp_quote("#define INET_E_USE_DEFAULT_SETTING         _HRESULT_TYPEDEF_(0x800C0012L)      ")
cpp_quote("#define INET_E_DEFAULT_ACTION              INET_E_USE_DEFAULT_PROTOCOLHANDLER  ")
cpp_quote("#define INET_E_QUERYOPTION_UNKNOWN         _HRESULT_TYPEDEF_(0x800C0013L)      ")
cpp_quote("#define INET_E_REDIRECTING                 _HRESULT_TYPEDEF_(0x800C0014L)      ")

cpp_quote("#define OInetParseUrl               CoInternetParseUrl               ")
cpp_quote("#define OInetCombineUrl             CoInternetCombineUrl             ")
cpp_quote("#define OInetCompareUrl             CoInternetCompareUrl             ")
cpp_quote("#define OInetQueryInfo              CoInternetQueryInfo              ")
cpp_quote("#define OInetGetSession             CoInternetGetSession             ")

#pragma midl_echo("#endif // !_URLMON_NO_ASYNC_PLUGABLE_PROTOCOLS_ ")

cpp_quote("//")
cpp_quote("// Static Protocol flags")
cpp_quote("//")
cpp_quote("#define PROTOCOLFLAG_NO_PICS_CHECK     0x00000001")
cpp_quote("")



cpp_quote("// Creates the security manager object. The first argument is the Service provider")
cpp_quote("// to allow for delegation")
cpp_quote("STDAPI CoInternetCreateSecurityManager(IServiceProvider *pSP, IInternetSecurityManager **ppSM, DWORD dwReserved);")
cpp_quote("")
cpp_quote("STDAPI CoInternetCreateZoneManager(IServiceProvider *pSP, IInternetZoneManager **ppZM, DWORD dwReserved);")
cpp_quote("")
cpp_quote("")

cpp_quote("// Security manager CLSID's")
cpp_quote("EXTERN_C const IID CLSID_InternetSecurityManager;  ")
cpp_quote("EXTERN_C const IID CLSID_InternetZoneManager;  ")
cpp_quote("EXTERN_C const IID CLSID_PersistentZoneIdentifier;  ")

cpp_quote("// This service is used for delegation support on the Security Manager interface")
cpp_quote("#define SID_SInternetSecurityManager         IID_IInternetSecurityManager")
cpp_quote("")
cpp_quote("#define SID_SInternetSecurityManagerEx         IID_IInternetSecurityManagerEx")
cpp_quote("")
cpp_quote("#define SID_SInternetHostSecurityManager     IID_IInternetHostSecurityManager")
cpp_quote("")

cpp_quote("#ifndef _LPINTERNETSECURITYMGRSITE_DEFINED")
cpp_quote("#define _LPINTERNETSECURITYMGRSITE_DEFINED")
[

    local,
    object,
    uuid(79eac9ed-baf9-11ce-8c82-00aa004ba90b),
    helpstring("IInternetSecurityMgrSite Interface"),
    pointer_default(unique)
]

interface IInternetSecurityMgrSite : IUnknown
{
    HRESULT GetWindow (
            [out] HWND* phwnd);
    HRESULT EnableModeless (
            [in] BOOL fEnable);
};
cpp_quote("#endif")


cpp_quote("#ifndef _LPINTERNETSECURITYMANANGEREX_DEFINED")
cpp_quote("#define _LPINTERNETSECURITYMANANGEREX_DEFINED")

[

    uuid(F164EDF1-CC7C-4f0d-9A94-34222625C393),
    helpstring("IInternetSecurityManagerEx Interface"),
    pointer_default(unique)
]

interface IInternetSecurityManagerEx : IInternetSecurityManager
{
    HRESULT     ProcessUrlActionEx
    (
        [in]    LPCWSTR     pwszUrl,
        [in]    DWORD       dwAction,
        [out, size_is(cbPolicy)]
                BYTE*   pPolicy,    // output buffer pointer
        [in]    DWORD   cbPolicy,   // output buffer size
        [in]    BYTE*   pContext,   // context (used by the delegation routines)
        [in]    DWORD   cbContext,  // size of the Context
        [in]    DWORD   dwFlags,    // See enum PUAF for details.
        [in]    DWORD   dwReserved,
        [out]   DWORD   *pdwOutFlags //See enum PUAF for details
    );

cpp_quote("// This is the wrapper function that most clients will use.")
cpp_quote("// It figures out the current Policy for the passed in Action,")
cpp_quote("// and puts up UI if the current Policy indicates that the user")
cpp_quote("// should be queried. It returns back the Policy which the caller")
cpp_quote("// will use to determine if the action should be allowed")
}
cpp_quote("#endif")

cpp_quote("#ifndef _LPINTERNETSECURITYMANANGER_DEFINED")
cpp_quote("#define _LPINTERNETSECURITYMANANGER_DEFINED")

[

    uuid(79eac9ee-baf9-11ce-8c82-00aa004ba90b),
    helpstring("IInternetSecurityManager Interface"),
    pointer_default(unique)
]

interface IInternetSecurityManager : IUnknown
{
    HRESULT     SetSecuritySite
    (
        [in,unique]    IInternetSecurityMgrSite *pSite
    );

    HRESULT     GetSecuritySite
    (
        [out]   IInternetSecurityMgrSite **ppSite
    );

cpp_quote("#define MUTZ_NOSAVEDFILECHECK        0x00000001 // don't check file: for saved file comment")
cpp_quote("#define MUTZ_ISFILE                  0x00000002 // Assume URL if File, url does not need file://")
cpp_quote("#define MUTZ_ACCEPT_WILDCARD_SCHEME  0x00000080 // Accept a wildcard scheme")
cpp_quote("#define MUTZ_ENFORCERESTRICTED       0x00000100 // enforce restricted zone independent of URL")
cpp_quote("#define MUTZ_REQUIRESAVEDFILECHECK   0x00000400 // always check the file for MOTW (overriding FEATURE_UNC_SAVEDFILECHECK)")
cpp_quote("#define MUTZ_DONT_UNESCAPE           0x00000800 // Do not unescape the url")

    HRESULT MapUrlToZone
    (
        [in]    LPCWSTR     pwszUrl,
        [out]   DWORD*      pdwZone,
        [in]    DWORD       dwFlags
    );

cpp_quote("// MapUrlToZone returns the zone index given a URL")

cpp_quote("#define MAX_SIZE_SECURITY_ID 512 // bytes")

    HRESULT GetSecurityId
    (
        [in]    LPCWSTR     pwszUrl,
        [out, size_is(*pcbSecurityId)]
                BYTE*   pbSecurityId,
        [in, out]
                DWORD*  pcbSecurityId,
        [in]    DWORD_PTR dwReserved
    );

    // Flags passed into ProcessUrlAction.
    typedef enum
    {
        PUAF_DEFAULT                        = 0x00000000,
        PUAF_NOUI                           = 0x00000001,
        PUAF_ISFILE                         = 0x00000002,  // Assume URL if File, url does not need file://
        PUAF_WARN_IF_DENIED                 = 0x00000004,
        PUAF_FORCEUI_FOREGROUND             = 0x00000008,
        PUAF_CHECK_TIFS                     = 0x00000010,
        PUAF_DONTCHECKBOXINDIALOG           = 0x00000020,
        PUAF_TRUSTED                        = 0x00000040,
        PUAF_ACCEPT_WILDCARD_SCHEME         = 0x00000080, 
        PUAF_ENFORCERESTRICTED              = 0x00000100,
        PUAF_NOSAVEDFILECHECK               = 0x00000200, // don't check file: for saved comment
        PUAF_REQUIRESAVEDFILECHECK          = 0x00000400, // always check the file for MOTW (overriding FEATURE_UNC_SAVEDFILECHECK)
        PUAF_LMZ_UNLOCKED                   = 0x00010000, // flag to retrieve local machine policies when LMZL is on
        PUAF_LMZ_LOCKED                     = 0x00020000, // flag to force retrieving locked down local machine policies when LMZL is on
        PUAF_DEFAULTZONEPOL                 = 0x00040000, // flag to retrieve Default Security Zone policies when NPL is on
        PUAF_NPL_USE_LOCKED_IF_RESTRICTED   = 0x00080000, // flag to tell urlmon that trident wants to use locked zones if needed.
        PUAF_NOUIIFLOCKED                   = 0x00100000, // flag to turn off UI if Urlmon figures it is using the locked zone. 
        PUAF_DRAGPROTOCOLCHECK              = 0x00200000  // flag to check for whitelist drag protcols when URLACTION_SHELL_MOVE_OR_COPY is allow
    } PUAF ;

    typedef enum
    {
        PUAFOUT_DEFAULT                        = 0x00000000,
        PUAFOUT_ISLOCKZONEPOLICY               = 0x00000001
    } PUAFOUT ;

    HRESULT     ProcessUrlAction
    (
        [in]    LPCWSTR     pwszUrl,
        [in]    DWORD       dwAction,
        [out, size_is(cbPolicy)]
                BYTE*   pPolicy,    // output buffer pointer
        [in]    DWORD   cbPolicy,   // output buffer size
        [in]    BYTE*   pContext,   // context (used by the delegation routines)
        [in]    DWORD   cbContext,  // size of the Context
        [in]    DWORD   dwFlags,    // See enum PUAF for details.
        [in]    DWORD   dwReserved
    );
cpp_quote("// This is the wrapper function that most clients will use.")
cpp_quote("// It figures out the current Policy for the passed in Action,")
cpp_quote("// and puts up UI if the current Policy indicates that the user")
cpp_quote("// should be queried. It returns back the Policy which the caller")
cpp_quote("// will use to determine if the action should be allowed")

    HRESULT     QueryCustomPolicy
    (
        [in]    LPCWSTR     pwszUrl,
        [in]    REFGUID     guidKey,
        [out, size_is(,*pcbPolicy)]     // allocation via IMemAlloc; caller frees
                BYTE**  ppPolicy,   // pointer to output buffer pointer
        [out]   DWORD*  pcbPolicy,  // pointer to output buffer size
        [in]    BYTE*   pContext,   // context (used by the delegation routines)
        [in]    DWORD   cbContext,  // size of the Context
        [in]    DWORD   dwReserved
    );
cpp_quote("// This is the wrapper function to conveniently read a custom policy.")

// create/enumerate mappings

    typedef enum
    {
        SZM_CREATE = 0x00000000, // create new mapping, error's if mapping already exists.
        SZM_DELETE = 0x00000001, // delete the mapping
    }
        SZM_FLAGS;

    HRESULT SetZoneMapping
    (
        [in]    DWORD   dwZone,        // absolute zone index
        [in]    LPCWSTR lpszPattern,   // URL pattern with limited wildcarding
        [in]    DWORD   dwFlags       // add, change, delete
    );

cpp_quote("// SetZoneMapping")
cpp_quote("//    lpszPattern: string denoting a URL pattern")
cpp_quote("//        Examples of valid patterns:   ")
cpp_quote("//            *://*.msn.com             ")
cpp_quote("//            http://*.sony.co.jp       ")
cpp_quote("//            *://et.msn.com            ")
cpp_quote("//            ftp://157.54.23.41/       ")
cpp_quote("//            https://localsvr          ")
cpp_quote("//            file:\\localsvr\share     ")
cpp_quote("//            *://157.54.100-200.*      ")
cpp_quote("//        Examples of invalid patterns: ")
cpp_quote("//            http://*.lcs.mit.edu      ")
cpp_quote("//            ftp://*                   ")
cpp_quote("//    dwFlags: SZM_FLAGS values         ")

    HRESULT GetZoneMappings
    (
        [in]    DWORD   dwZone,        // absolute zone index
        [out]   IEnumString  **ppenumString,   // output buffer size
        [in]    DWORD   dwFlags        // reserved, pass 0
    );
// Returns an enumerator of strings for the mappings of a zone.
// dwFlags is for future use; pass in 0.

};

//  implmented by CLSID_ PersistentZoneIdentifier (along with IPersistFile)
//  to access or change the Zone attached to a local file 
[
    local,
    object,
    uuid(cd45f185-1b21-48e2-967b-ead743a8914e),
    pointer_default(unique)
]
interface IZoneIdentifier : IUnknown
{
    HRESULT GetId([out] DWORD *pdwZone);
    HRESULT SetId([in] DWORD dwZone);
    HRESULT Remove();
};

cpp_quote("#endif")

cpp_quote("#ifndef _LPINTERNETHOSTSECURITYMANANGER_DEFINED")
cpp_quote("#define _LPINTERNETHOSTSECURITYMANANGER_DEFINED")

cpp_quote("//This is the interface MSHTML exposes to its clients")
cpp_quote("//The clients need not pass in a URL to these functions")
cpp_quote("//since MSHTML maintains the notion of the current URL")

[

    local,
    object,
    uuid(3af280b6-cb3f-11d0-891e-00c04fb6bfc4),
    helpstring("IInternetHostSecurityManager Interface"),
    pointer_default(unique)
]

interface IInternetHostSecurityManager : IUnknown
{

    HRESULT GetSecurityId
    (
        [out, size_is(*pcbSecurityId)]
                BYTE*   pbSecurityId,
        [in, out]
                DWORD*  pcbSecurityId,
        [in]    DWORD_PTR dwReserved
    );

    HRESULT     ProcessUrlAction
    (
        [in]    DWORD       dwAction,
        [out, size_is(cbPolicy)]
                BYTE*   pPolicy,    // output buffer pointer
        [in]    DWORD   cbPolicy,   // output buffer size
        [in]    BYTE*   pContext,   // context (used by the delegation routines)
        [in]    DWORD   cbContext,  // size of the Context
        [in]    DWORD   dwFlags,    // See enum PUAF for details.
        [in]    DWORD   dwReserved
    );

    HRESULT     QueryCustomPolicy
    (
        [in]    REFGUID     guidKey,
        [out, size_is(,*pcbPolicy)]     // allocation via IMemAlloc; caller frees
                BYTE**  ppPolicy,   // pointer to output buffer pointer
        [out]   DWORD*  pcbPolicy,  // pointer to output buffer size
        [in]    BYTE*   pContext,   // context (used by the delegation routines)
        [in]    DWORD   cbContext,  // size of the Context
        [in]    DWORD   dwReserved
    );

};
cpp_quote("#endif")

cpp_quote("")
cpp_quote("// The zone manager maintains policies for a set of standard actions. ")
cpp_quote("// These actions are identified by integral values (called action indexes)")
cpp_quote("// specified below.")
cpp_quote("")
cpp_quote("// Minimum legal value for an action    ")
cpp_quote("#define URLACTION_MIN                                          0x00001000")
cpp_quote("")
cpp_quote("#define URLACTION_DOWNLOAD_MIN                                 0x00001000")
cpp_quote("#define URLACTION_DOWNLOAD_SIGNED_ACTIVEX                      0x00001001")
cpp_quote("#define URLACTION_DOWNLOAD_UNSIGNED_ACTIVEX                    0x00001004")
cpp_quote("#define URLACTION_DOWNLOAD_CURR_MAX                            0x00001004")
cpp_quote("#define URLACTION_DOWNLOAD_MAX                                 0x000011FF")
cpp_quote("")
cpp_quote("#define URLACTION_ACTIVEX_MIN                                  0x00001200")
cpp_quote("#define URLACTION_ACTIVEX_RUN                                  0x00001200")
cpp_quote("#define URLPOLICY_ACTIVEX_CHECK_LIST                           0x00010000")
cpp_quote("#define URLACTION_ACTIVEX_OVERRIDE_OBJECT_SAFETY               0x00001201 // aggregate next four")
cpp_quote("#define URLACTION_ACTIVEX_OVERRIDE_DATA_SAFETY                 0x00001202 //")
cpp_quote("#define URLACTION_ACTIVEX_OVERRIDE_SCRIPT_SAFETY               0x00001203 //")
cpp_quote("#define URLACTION_SCRIPT_OVERRIDE_SAFETY                       0x00001401 //")
cpp_quote("#define URLACTION_ACTIVEX_CONFIRM_NOOBJECTSAFETY               0x00001204 //")
cpp_quote("#define URLACTION_ACTIVEX_TREATASUNTRUSTED                     0x00001205")
cpp_quote("#define URLACTION_ACTIVEX_NO_WEBOC_SCRIPT                      0x00001206")
cpp_quote("#define URLACTION_ACTIVEX_CURR_MAX                             0x00001206")
cpp_quote("#define URLACTION_ACTIVEX_MAX                                  0x000013ff")
cpp_quote("")
cpp_quote("#define URLACTION_SCRIPT_MIN                                   0x00001400")
cpp_quote("#define URLACTION_SCRIPT_RUN                                   0x00001400")
cpp_quote("#define URLACTION_SCRIPT_JAVA_USE                              0x00001402")
cpp_quote("#define URLACTION_SCRIPT_SAFE_ACTIVEX                          0x00001405")
cpp_quote("#define URLACTION_CROSS_DOMAIN_DATA                            0x00001406")
cpp_quote("#define URLACTION_SCRIPT_PASTE                                 0x00001407")
cpp_quote("#define URLACTION_SCRIPT_CURR_MAX                              0x00001407")
cpp_quote("#define URLACTION_SCRIPT_MAX                                   0x000015ff")
cpp_quote("")
cpp_quote("#define URLACTION_HTML_MIN                                     0x00001600")
cpp_quote("#define URLACTION_HTML_SUBMIT_FORMS                            0x00001601 // aggregate next two")
cpp_quote("#define URLACTION_HTML_SUBMIT_FORMS_FROM                       0x00001602 //")
cpp_quote("#define URLACTION_HTML_SUBMIT_FORMS_TO                         0x00001603 //")
cpp_quote("#define URLACTION_HTML_FONT_DOWNLOAD                           0x00001604")
cpp_quote("#define URLACTION_HTML_JAVA_RUN                                0x00001605 // derive from Java custom policy")
cpp_quote("#define URLACTION_HTML_USERDATA_SAVE                           0x00001606")
cpp_quote("#define URLACTION_HTML_SUBFRAME_NAVIGATE                       0x00001607")
cpp_quote("#define URLACTION_HTML_META_REFRESH                            0x00001608")
cpp_quote("#define URLACTION_HTML_MIXED_CONTENT                           0x00001609")
//cpp_quote("#define URLACTION_HTML_CURR_MAX                                0x00001609")
cpp_quote("#define URLACTION_HTML_MAX                                     0x000017ff")
cpp_quote("")
cpp_quote("#define URLACTION_SHELL_MIN                                    0x00001800")
cpp_quote("#define URLACTION_SHELL_INSTALL_DTITEMS                        0x00001800")
cpp_quote("#define URLACTION_SHELL_MOVE_OR_COPY                           0x00001802")
cpp_quote("#define URLACTION_SHELL_FILE_DOWNLOAD                          0x00001803")
cpp_quote("#define URLACTION_SHELL_VERB                                   0x00001804")
cpp_quote("#define URLACTION_SHELL_WEBVIEW_VERB                           0x00001805")
cpp_quote("#define URLACTION_SHELL_SHELLEXECUTE                           0x00001806")
//  URLACTION_SHELL_SHELLEXECUTE and URLACTION_SHELL_EXECUTE_HIGHRISK are deliberately the same value
cpp_quote("#define URLACTION_SHELL_EXECUTE_HIGHRISK                       0x00001806")
cpp_quote("#define URLACTION_SHELL_EXECUTE_MODRISK                        0x00001807")
cpp_quote("#define URLACTION_SHELL_EXECUTE_LOWRISK                        0x00001808")
cpp_quote("#define URLACTION_SHELL_POPUPMGR                               0x00001809")
cpp_quote("#define URLACTION_SHELL_RTF_OBJECTS_LOAD                       0x0000180A")
cpp_quote("#define URLACTION_SHELL_ENHANCED_DRAGDROP_SECURITY             0x0000180B")
cpp_quote("#define URLACTION_SHELL_CURR_MAX                               0x0000180B")
cpp_quote("#define URLACTION_SHELL_MAX                                    0x000019ff")
cpp_quote("")
cpp_quote("#define URLACTION_NETWORK_MIN                                  0x00001A00")
cpp_quote("")
cpp_quote("#define URLACTION_CREDENTIALS_USE                              0x00001A00")
cpp_quote("#define URLPOLICY_CREDENTIALS_SILENT_LOGON_OK        0x00000000")
cpp_quote("#define URLPOLICY_CREDENTIALS_MUST_PROMPT_USER       0x00010000")
cpp_quote("#define URLPOLICY_CREDENTIALS_CONDITIONAL_PROMPT     0x00020000")
cpp_quote("#define URLPOLICY_CREDENTIALS_ANONYMOUS_ONLY         0x00030000")
cpp_quote("")
cpp_quote("#define URLACTION_AUTHENTICATE_CLIENT                          0x00001A01")
cpp_quote("#define URLPOLICY_AUTHENTICATE_CLEARTEXT_OK          0x00000000")
cpp_quote("#define URLPOLICY_AUTHENTICATE_CHALLENGE_RESPONSE    0x00010000")
cpp_quote("#define URLPOLICY_AUTHENTICATE_MUTUAL_ONLY           0x00030000")
cpp_quote("")
cpp_quote("")
cpp_quote("#define URLACTION_COOKIES                                      0x00001A02")
cpp_quote("#define URLACTION_COOKIES_SESSION                              0x00001A03")
cpp_quote("")
cpp_quote("#define URLACTION_CLIENT_CERT_PROMPT                           0x00001A04")
cpp_quote("")
cpp_quote("#define URLACTION_COOKIES_THIRD_PARTY                          0x00001A05")
cpp_quote("#define URLACTION_COOKIES_SESSION_THIRD_PARTY                  0x00001A06")
cpp_quote("")
cpp_quote("#define URLACTION_COOKIES_ENABLED                              0x00001A10")
cpp_quote("")

cpp_quote("#define URLACTION_NETWORK_CURR_MAX                             0x00001A10")
cpp_quote("#define URLACTION_NETWORK_MAX                                  0x00001Bff")
cpp_quote("")
cpp_quote("")
cpp_quote("#define URLACTION_JAVA_MIN                                     0x00001C00")
cpp_quote("#define URLACTION_JAVA_PERMISSIONS                             0x00001C00")
cpp_quote("#define URLPOLICY_JAVA_PROHIBIT                      0x00000000")
cpp_quote("#define URLPOLICY_JAVA_HIGH                          0x00010000")
cpp_quote("#define URLPOLICY_JAVA_MEDIUM                        0x00020000")
cpp_quote("#define URLPOLICY_JAVA_LOW                           0x00030000")
cpp_quote("#define URLPOLICY_JAVA_CUSTOM                        0x00800000")
cpp_quote("#define URLACTION_JAVA_CURR_MAX                                0x00001C00")
cpp_quote("#define URLACTION_JAVA_MAX                                     0x00001Cff")

cpp_quote("")
cpp_quote("")
cpp_quote("// The following Infodelivery actions should have no default policies")
cpp_quote("// in the registry.  They assume that no default policy means fall")
cpp_quote("// back to the global restriction.  If an admin sets a policy per")
cpp_quote("// zone, then it overrides the global restriction.")
cpp_quote("")
cpp_quote("#define URLACTION_INFODELIVERY_MIN                           0x00001D00")
cpp_quote("#define URLACTION_INFODELIVERY_NO_ADDING_CHANNELS            0x00001D00")
cpp_quote("#define URLACTION_INFODELIVERY_NO_EDITING_CHANNELS           0x00001D01")
cpp_quote("#define URLACTION_INFODELIVERY_NO_REMOVING_CHANNELS          0x00001D02")
cpp_quote("#define URLACTION_INFODELIVERY_NO_ADDING_SUBSCRIPTIONS       0x00001D03")
cpp_quote("#define URLACTION_INFODELIVERY_NO_EDITING_SUBSCRIPTIONS      0x00001D04")
cpp_quote("#define URLACTION_INFODELIVERY_NO_REMOVING_SUBSCRIPTIONS     0x00001D05")
cpp_quote("#define URLACTION_INFODELIVERY_NO_CHANNEL_LOGGING            0x00001D06")
cpp_quote("#define URLACTION_INFODELIVERY_CURR_MAX                      0x00001D06")
cpp_quote("#define URLACTION_INFODELIVERY_MAX                           0x00001Dff")

cpp_quote("#define URLACTION_CHANNEL_SOFTDIST_MIN                       0x00001E00")
cpp_quote("#define URLACTION_CHANNEL_SOFTDIST_PERMISSIONS               0x00001E05")
cpp_quote("#define URLPOLICY_CHANNEL_SOFTDIST_PROHIBIT          0x00010000")
cpp_quote("#define URLPOLICY_CHANNEL_SOFTDIST_PRECACHE          0x00020000")
cpp_quote("#define URLPOLICY_CHANNEL_SOFTDIST_AUTOINSTALL       0x00030000")
cpp_quote("#define URLACTION_CHANNEL_SOFTDIST_MAX                       0x00001Eff")

cpp_quote("#define URLACTION_BEHAVIOR_MIN                               0x00002000")
cpp_quote("#define URLACTION_BEHAVIOR_RUN                               0x00002000")
cpp_quote("#define URLPOLICY_BEHAVIOR_CHECK_LIST                        0x00010000")
cpp_quote("")
cpp_quote("// The following actions correspond to the Feature options above." )
cpp_quote("// However, they are NOT in the same order." )
cpp_quote("#define URLACTION_FEATURE_MIN                                0x00002100")
cpp_quote("#define URLACTION_FEATURE_MIME_SNIFFING                      0x00002100")
cpp_quote("#define URLACTION_FEATURE_ZONE_ELEVATION                     0x00002101")
cpp_quote("#define URLACTION_FEATURE_WINDOW_RESTRICTIONS                0x00002102")
cpp_quote("")

cpp_quote("#define URLACTION_AUTOMATIC_DOWNLOAD_UI_MIN                  0x00002200")
cpp_quote("#define URLACTION_AUTOMATIC_DOWNLOAD_UI                      0x00002200")
cpp_quote("#define URLACTION_AUTOMATIC_ACTIVEX_UI                       0x00002201")
cpp_quote("")

cpp_quote("#define URLACTION_ALLOW_RESTRICTEDPROTOCOLS                0x00002300")
cpp_quote("")

cpp_quote("// For each action specified above the system maintains")
cpp_quote("// a set of policies for the action. ")
cpp_quote("// The only policies supported currently are permissions (i.e. is something allowed)")
cpp_quote("// and logging status. ")
cpp_quote("// IMPORTANT: If you are defining your own policies don't overload the meaning of the")
cpp_quote("// loword of the policy. You can use the hiword to store any policy bits which are only")
cpp_quote("// meaningful to your action.")
cpp_quote("// For an example of how to do this look at the URLPOLICY_JAVA above")
cpp_quote("")
cpp_quote("// Permissions ")
cpp_quote("#define URLPOLICY_ALLOW                0x00")
cpp_quote("#define URLPOLICY_QUERY                0x01")
cpp_quote("#define URLPOLICY_DISALLOW             0x03")
cpp_quote("")
cpp_quote("// Notifications are not done when user already queried.")  // CUT
cpp_quote("#define URLPOLICY_NOTIFY_ON_ALLOW      0x10")
cpp_quote("#define URLPOLICY_NOTIFY_ON_DISALLOW   0x20")
cpp_quote("")
cpp_quote("// Logging is done regardless of whether user was queried.") // CUT
cpp_quote("#define URLPOLICY_LOG_ON_ALLOW         0x40")
cpp_quote("#define URLPOLICY_LOG_ON_DISALLOW      0x80")
cpp_quote("")
cpp_quote("#define URLPOLICY_MASK_PERMISSIONS     0x0f")
cpp_quote("#define GetUrlPolicyPermissions(dw)        (dw & URLPOLICY_MASK_PERMISSIONS)")
cpp_quote("#define SetUrlPolicyPermissions(dw,dw2)    ((dw) = ((dw) & ~(URLPOLICY_MASK_PERMISSIONS)) | (dw2))")
cpp_quote("")
cpp_quote("")
cpp_quote("#define URLPOLICY_DONTCHECKDLGBOX     0x100")

cpp_quote("// The ordinal #'s that define the predefined zones internet explorer knows about. ")
cpp_quote("// When we support user-defined zones their zone numbers should be between ")
cpp_quote("// URLZONE_USER_MIN and URLZONE_USER_MAX")

cpp_quote("// Custom policy to query whether the local machine zone")
cpp_quote("// has been unlocked for current document.")
cpp_quote("EXTERN_C const GUID GUID_CUSTOM_LOCALMACHINEZONEUNLOCKED; ")

    
//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:   IInternetZoneManager interface definition
//
//----------------------------------------------------------------------------
cpp_quote("#ifndef _LPINTERNETZONEMANAGER_DEFINED")
cpp_quote("#define _LPINTERNETZONEMANAGER_DEFINED")

[

    local,
    object,
    uuid(79eac9ef-baf9-11ce-8c82-00aa004ba90b),
    helpstring("IInternetZoneManager Interface"),
    pointer_default(unique)
]

interface IInternetZoneManager : IUnknown
{
    typedef [unique] IInternetZoneManager *LPURLZONEMANAGER;


    typedef enum tagURLZONE
    {
        URLZONE_PREDEFINED_MIN = 0,
        URLZONE_LOCAL_MACHINE  = 0,         // local machine zone is not exposed in UI
        URLZONE_INTRANET,                   // My Intranet zone
        URLZONE_TRUSTED,                    // Trusted Web sites zone
        URLZONE_INTERNET,                   // The Internet zone
        URLZONE_UNTRUSTED,                  // Untrusted sites zone
        URLZONE_PREDEFINED_MAX = 999,

        URLZONE_USER_MIN = 1000,
        URLZONE_USER_MAX = 10000,
    }  URLZONE;

cpp_quote("// Enhanced Security Configuration zone mapping flag for IInternetSecurityManager::SetZoneMapping")
cpp_quote("#define URLZONE_ESC_FLAG     0x100")

    typedef enum tagURLTEMPLATE
    {
        // This value is just used to indicate the current set
        // of policies are not based on any template.
        URLTEMPLATE_CUSTOM  =   0x000000,

        URLTEMPLATE_PREDEFINED_MIN =    0x10000,
        URLTEMPLATE_LOW =               0x10000,
        URLTEMPLATE_MEDLOW =            0x10500,
        URLTEMPLATE_MEDIUM =            0x11000,
        URLTEMPLATE_HIGH  =             0x12000,
        URLTEMPLATE_PREDEFINED_MAX =    0x20000
    } URLTEMPLATE ;



    enum { MAX_ZONE_PATH = 260, MAX_ZONE_DESCRIPTION = 200 };

    typedef enum {
        ZAFLAGS_CUSTOM_EDIT                 = 0x00000001,
        ZAFLAGS_ADD_SITES                   = 0x00000002,
        ZAFLAGS_REQUIRE_VERIFICATION        = 0x00000004,
        ZAFLAGS_INCLUDE_PROXY_OVERRIDE      = 0x00000008,  // Intranet only.
        ZAFLAGS_INCLUDE_INTRANET_SITES      = 0x00000010,  // Intranet only.
        ZAFLAGS_NO_UI                       = 0x00000020,  // Don't display UI (used for local machine)
        ZAFLAGS_SUPPORTS_VERIFICATION       = 0x00000040,  // Supports server verification.
        ZAFLAGS_UNC_AS_INTRANET             = 0x00000080,
        
        // Locked/Unlocked state specific flags.
        ZAFLAGS_USE_LOCKED_ZONES            = 0x00010000,
    } ZAFLAGS ;

    typedef struct _ZONEATTRIBUTES
    {
        ULONG   cbSize;
        WCHAR   szDisplayName[MAX_ZONE_PATH];
        WCHAR   szDescription[MAX_ZONE_DESCRIPTION];
        WCHAR   szIconPath[MAX_ZONE_PATH];
        DWORD   dwTemplateMinLevel;
        DWORD   dwTemplateRecommended;
        DWORD   dwTemplateCurrentLevel;
        DWORD   dwFlags;                     // ZAFLAGS.
    } ZONEATTRIBUTES, *LPZONEATTRIBUTES;

    HRESULT GetZoneAttributes
    (
        [in]    DWORD   dwZone,
        [in, out, unique]
                ZONEATTRIBUTES* pZoneAttributes
    );

cpp_quote("// Gets the zone attributes (information in registry other than actual security")
cpp_quote("// policies associated with the zone).  Zone attributes are fixed as:")


    HRESULT    SetZoneAttributes
    (
        [in]    DWORD   dwZone,
        [in]    ZONEATTRIBUTES* pZoneAttributes
    );
cpp_quote("// Sets the zone attributes (information in registry other than actual security")
cpp_quote("// policies associated with the zone).  Zone attributes as above.")
cpp_quote("// Returns S_OK or ??? if failed to write the zone attributes.")


cpp_quote("/* Registry Flags")
cpp_quote("")
cpp_quote("    When reading, default behavior is:")
cpp_quote("        If HKLM allows override and HKCU value exists")
cpp_quote("            Then use HKCU value")
cpp_quote("            Else use HKLM value")
cpp_quote("    When writing, default behavior is same as HKCU")
cpp_quote("        If HKLM allows override")
cpp_quote("           Then Write to HKCU")
cpp_quote("           Else Fail")
cpp_quote("*/")

    typedef enum _URLZONEREG
    {
        URLZONEREG_DEFAULT=0,
        URLZONEREG_HKLM,
        URLZONEREG_HKCU
    } URLZONEREG;

    HRESULT GetZoneCustomPolicy
    (
        [in]    DWORD   dwZone,     // zone index
        [in]    REFGUID guidKey,    // key to lookup value
        [out, size_is(,*pcbPolicy)]     // allocation via IMemAlloc; caller frees
                BYTE**  ppPolicy,   // pointer to output buffer pointer
        [out]   DWORD*  pcbPolicy,  // pointer to output buffer size
        [in]    URLZONEREG  urlZoneReg    // effective, HKCU, or HKLM
    );

cpp_quote("// Gets a named custom policy associated with a zone;")
cpp_quote("// e.g. the Java VM settings can be defined with a unique key such as 'Java'.")
cpp_quote("// Custom policy support is intended to allow extensibility from the predefined")
cpp_quote("// set of policies that IE4 has built in.")
cpp_quote("// ")
cpp_quote("// pwszKey is the string name designating the custom policy.  Components are")
cpp_quote("//   responsible for having unique names.")
cpp_quote("// ppPolicy is the callee allocated buffer for the policy byte blob; caller is")
cpp_quote("//   responsible for freeing this buffer eventually.")
cpp_quote("// pcbPolicy is the size of the byte blob returned.")
cpp_quote("// dwRegFlags determines how registry is accessed (see above).")
cpp_quote("// Returns S_OK if key is found and buffer allocated; ??? if key is not found (no buffer alloced).")

    HRESULT SetZoneCustomPolicy
    (
        [in]    DWORD   dwZone,     // zone index
        [in]    REFGUID guidKey,    // key to lookup value
        [in, size_is(cbPolicy)]
                BYTE*   pPolicy,    // input buffer pointer
        [in]    DWORD   cbPolicy,   // input data size
        [in]    URLZONEREG urlZoneReg    // default, HKCU, or HKLM
    );
cpp_quote("// Sets a named custom policy associated with a zone;")
cpp_quote("// e.g. the Java VM settings can be defined with a unique key such as 'Java'.")
cpp_quote("// Custom policy support is intended to allow extensibility from the predefined")
cpp_quote("// set of policies that IE4 has built in.  ")
cpp_quote("// ")
cpp_quote("// pwszKey is the string name designating the custom policy.  Components are")
cpp_quote("//   responsible for having unique names.")
cpp_quote("// ppPolicy is the caller allocated buffer for the policy byte blob.")
cpp_quote("// pcbPolicy is the size of the byte blob to be set.")
cpp_quote("// dwRegFlags determines if HTCU or HKLM is set.")
cpp_quote("// Returns S_OK or ??? if failed to write the zone custom policy.")


    HRESULT GetZoneActionPolicy
    (
        [in]    DWORD   dwZone,     // zone index
        [in]    DWORD   dwAction,   // index number of action
        [out, size_is(cbPolicy)]
                BYTE*   pPolicy,    // output buffer pointer
        [in]    DWORD   cbPolicy,    // output buffer size
        [in]    URLZONEREG urlZoneReg // effective, HKCU, or HKLM
    );

cpp_quote("// Gets action policy associated with a zone, the builtin, fixed-length policies info.")
cpp_quote("")
cpp_quote("// dwAction is the action code for the action as defined above.")
cpp_quote("// pPolicy is the caller allocated buffer for the policy data.")
cpp_quote("// cbPolicy is the size of the caller allocated buffer.")
cpp_quote("// dwRegFlags determines how registry is accessed (see above).")
cpp_quote("// Returns S_OK if action is valid; ??? if action is not valid.")

    HRESULT SetZoneActionPolicy
    (
        [in]    DWORD   dwZone,     // zone index
        [in]    DWORD   dwAction,   // index number of action
        [in, size_is(cbPolicy)]
                BYTE*   pPolicy,    // input buffer pointer
        [in]    DWORD   cbPolicy,    // input data size
        [in]    URLZONEREG urlZoneReg // HKCU, or HKLM
    );
// Sets action policy associated with a zone, the builtin, fixed-length policies info.
//
// dwAction is the action code as defined above.
// pPolicy is the caller allocated buffer for the policy data.
// cbPolicy is the size of the caller allocated buffer.
// dwRegFlags determines how registry is accessed (see above).
// Returns S_OK if action is valid; ??? if action is not valid.


// UI, logging, and wrapper for both
// This function is not implemented yet.
    HRESULT PromptAction
    (
        [in]    DWORD   dwAction,                    // action type
        [in]    HWND    hwndParent,                    // parent window handle
        [in]    LPCWSTR pwszUrl,                    // URL to display
        [in]    LPCWSTR pwszText,                    // dialog text
        [in]    DWORD   dwPromptFlags                // reserved, pass 0
    );
// This method presents UI to ask user about specified action


// This function is not implemented.
    HRESULT LogAction
    (
        [in]    DWORD   dwAction,       // action type
        [in]    LPCWSTR pwszUrl,        // URL to log
        [in]    LPCWSTR pwszText,       // associated text
        [in]    DWORD   dwLogFlags      // reserved, pass 0
    );


// zone enumeration

    HRESULT CreateZoneEnumerator
    (
        [out]   DWORD*  pdwEnum,        // enum handle
        [out]   DWORD*  pdwCount,       // # of elements in the list.
        [in]    DWORD   dwFlags         // reserved, pass 0
    );
// Returns enumerator handle needed to enumerate defined zones.
// The zone enumeration corresponds to a snap-shot of the zones when
// the Create call is made.

    HRESULT    GetZoneAt
    (
        [in]    DWORD    dwEnum,         // returned by CreateZoneEnumerator
        [in]    DWORD    dwIndex,        // 0-based
        [out]   DWORD*    pdwZone        // absolute zone index.
    );


    HRESULT DestroyZoneEnumerator
    (
        [in]    DWORD   dwEnum         // enum handle
    );
// Destroys resources associated with an enumerator


    HRESULT     CopyTemplatePoliciesToZone
    (
        [in]    DWORD dwTemplate,       // High, medium or low
        [in]    DWORD dwZone,           // Zone to copy policies to.
        [in]    DWORD dwReserved
    );

}
cpp_quote("#endif")



//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-2004.
//
//  Contents:   IInternetZoneManagerEx interface definition
//
//----------------------------------------------------------------------------
cpp_quote("#ifndef _LPINTERNETZONEMANAGEREX_DEFINED")
cpp_quote("#define _LPINTERNETZONEMANAGEREX_DEFINED")

[

    local,
    object,
    uuid(A4C23339-8E06-431e-9BF4-7E711C085648),
    helpstring("IInternetZoneManagerEx Interface"),
    pointer_default(unique)
]

interface IInternetZoneManagerEx : IInternetZoneManager
{
    HRESULT GetZoneActionPolicyEx
    (
        [in]    DWORD   dwZone,     // zone index
        [in]    DWORD   dwAction,   // index number of action
        [out, size_is(cbPolicy)]
                BYTE*   pPolicy,    // output buffer pointer
        [in]    DWORD   cbPolicy,    // output buffer size
        [in]    URLZONEREG urlZoneReg, // effective, HKCU, or HKLM
        [in]    DWORD    dwFlags   //Lockdown Zones or Normal Zones via ZAFLAGS
    );

cpp_quote("// Gets action policy associated with a zone, the builtin, fixed-length policies info.")
cpp_quote("")
cpp_quote("// dwAction is the action code for the action as defined above.")
cpp_quote("// pPolicy is the caller allocated buffer for the policy data.")
cpp_quote("// cbPolicy is the size of the caller allocated buffer.")
cpp_quote("// dwRegFlags determines how registry is accessed (see above).")
cpp_quote("// dwFlags determine which registry policies are accessed (see above).")
cpp_quote("// Returns S_OK if action is valid; ??? if action is not valid.")

    HRESULT SetZoneActionPolicyEx
    (
        [in]    DWORD   dwZone,     // zone index
        [in]    DWORD   dwAction,   // index number of action
        [in, size_is(cbPolicy)]
                BYTE*   pPolicy,    // input buffer pointer
        [in]    DWORD   cbPolicy,    // input data size
        [in]    URLZONEREG urlZoneReg, // HKCU, or HKLM
        [in]    DWORD    dwFlags   //Lockdown Zones or Normal Zones via ZAFLAGS
    );
// Sets action policy associated with a zone, the builtin, fixed-length policies info.
//
// dwAction is the action code as defined above.
// pPolicy is the caller allocated buffer for the policy data.
// cbPolicy is the size of the caller allocated buffer.
// urlZoneReg determines how registry is accessed (see above).
// dwFlags determine which registry policies are accessed (see above).
// Returns S_OK if action is valid; ??? if action is not valid.
}
cpp_quote("#endif")

cpp_quote("EXTERN_C const IID CLSID_SoftDistExt;  ")
//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:   ISoftDistExt interface definition
//
//----------------------------------------------------------------------------
cpp_quote("#ifndef _LPSOFTDISTEXT_DEFINED")
cpp_quote("#define _LPSOFTDISTEXT_DEFINED")

cpp_quote("")
cpp_quote("#define SOFTDIST_FLAG_USAGE_EMAIL        0x00000001")
cpp_quote("#define SOFTDIST_FLAG_USAGE_PRECACHE     0x00000002")
cpp_quote("#define SOFTDIST_FLAG_USAGE_AUTOINSTALL  0x00000004")
cpp_quote("#define SOFTDIST_FLAG_DELETE_SUBSCRIPTION 0x00000008")
cpp_quote("")
cpp_quote("")
cpp_quote("#define SOFTDIST_ADSTATE_NONE                0x00000000")
cpp_quote("#define SOFTDIST_ADSTATE_AVAILABLE       0x00000001")
cpp_quote("#define SOFTDIST_ADSTATE_DOWNLOADED      0x00000002")
cpp_quote("#define SOFTDIST_ADSTATE_INSTALLED           0x00000003")
cpp_quote("")
typedef struct _tagCODEBASEHOLD
{
     ULONG cbSize;
     LPWSTR szDistUnit;
     LPWSTR szCodeBase;
     DWORD dwVersionMS;
     DWORD dwVersionLS;
     DWORD dwStyle;
} CODEBASEHOLD, *LPCODEBASEHOLD;

typedef struct _tagSOFTDISTINFO
{
    ULONG       cbSize;
    DWORD       dwFlags;
        DWORD   dwAdState;
    LPWSTR      szTitle;
    LPWSTR      szAbstract;
    LPWSTR  szHREF;
    DWORD   dwInstalledVersionMS;
    DWORD   dwInstalledVersionLS;
    DWORD   dwUpdateVersionMS;
    DWORD   dwUpdateVersionLS;
    DWORD   dwAdvertisedVersionMS;
    DWORD   dwAdvertisedVersionLS;
    DWORD       dwReserved;
} SOFTDISTINFO, *LPSOFTDISTINFO;

[

    local,
    object,
    uuid(B15B8DC1-C7E1-11d0-8680-00AA00BDCB71),
    helpstring("ISoftDistExt Interface"),
    pointer_default(unique)
]

interface ISoftDistExt : IUnknown
{

    HRESULT ProcessSoftDist
    (
        [in]    LPCWSTR szCDFURL,
        [in]    IXMLElement *pSoftDistElement,
        [in, out]    LPSOFTDISTINFO lpsdi
    );


    HRESULT GetFirstCodeBase
    (
        [in]    LPWSTR *szCodeBase,
        [in]    LPDWORD dwMaxSize
    );

    HRESULT GetNextCodeBase
    (
        [in]    LPWSTR *szCodeBase,
        [in]    LPDWORD dwMaxSize
    );

    HRESULT AsyncInstallDistributionUnit
    (
        [in]    IBindCtx *pbc,
        [in]    LPVOID pvReserved,
        [in]    DWORD flags,
        [in]    LPCODEBASEHOLD lpcbh
    );

}

cpp_quote("STDAPI GetSoftwareUpdateInfo( LPCWSTR szDistUnit, LPSOFTDISTINFO psdi );")
cpp_quote("STDAPI SetSoftwareUpdateAdvertisementState( LPCWSTR szDistUnit, DWORD dwAdState, DWORD dwAdvertisedVersionMS, DWORD dwAdvertisedVersionLS );")

cpp_quote("#endif")

//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:   ICatalogFileInfo interface definition
//
//----------------------------------------------------------------------------
cpp_quote("#ifndef _LPCATALOGFILEINFO_DEFINED")
cpp_quote("#define _LPCATALOGFILEINFO_DEFINED")

[
    local,
    object,
    uuid(711C7600-6B48-11d1-B403-00AA00B92AF1),
    pointer_default(unique)
]


interface ICatalogFileInfo : IUnknown
{

    typedef [unique] ICatalogFileInfo *LPCATALOGFILEINFO;

    HRESULT GetCatalogFile(
            [out] LPSTR *ppszCatalogFile    // Catalog file path
            );
    HRESULT GetJavaTrust(
            [out] void **ppJavaTrust  // Java Trust structure
            );

}

cpp_quote("#endif")

//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:   IDataFilter definition
//
//---------------------------------------------------------------------------
cpp_quote("#ifndef _LPDATAFILTER_DEFINED")
cpp_quote("#define _LPDATAFILTER_DEFINED")

[
        object,
        uuid(69d14c80-c18e-11d0-a9ce-006097942311),
        pointer_default(unique)
]

interface IDataFilter: IUnknown
{
        typedef [unique] IDataFilter *LPDATAFILTER;

        HRESULT DoEncode(
            [in]    DWORD                   dwFlags,
            [in]    LONG                    lInBufferSize,
            [in, size_is(lInBufferSize)]    
                    BYTE*                   pbInBuffer,
            [in]    LONG                    lOutBufferSize,
            [out, size_is(lOutBufferSize)]   
                    BYTE*                   pbOutBuffer,
            [in]    LONG                    lInBytesAvailable,
            [out]   LONG*                   plInBytesRead,
            [out]   LONG*                   plOutBytesWritten,
            [in]    DWORD                   dwReserved
            );

        HRESULT DoDecode(
            [in]    DWORD                   dwFlags,
            [in]    LONG                    lInBufferSize,
            [in, size_is(lInBufferSize)]    
                    BYTE*                   pbInBuffer,
            [in]    LONG                    lOutBufferSize,
            [out, size_is(lOutBufferSize)]   
                    BYTE*                   pbOutBuffer,
            [in]    LONG                    lInBytesAvailable,
            [out]   LONG*                   plInBytesRead,
            [out]   LONG*                   plOutBytesWritten,
            [in]    DWORD                   dwReserved
            );

        HRESULT SetEncodingLevel(
            [in]   DWORD                    dwEncLevel
            );

}
cpp_quote("#endif")


//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:   IEncodingFilterFactory definition
//
//---------------------------------------------------------------------------

cpp_quote("#ifndef _LPENCODINGFILTERFACTORY_DEFINED")
cpp_quote("#define _LPENCODINGFILTERFACTORY_DEFINED")

typedef struct _tagPROTOCOLFILTERDATA
{
    DWORD                   cbSize;
    IInternetProtocolSink   *pProtocolSink;  // out parameter
    IInternetProtocol       *pProtocol;      // in parameter
    IUnknown                *pUnk;
    DWORD                   dwFilterFlags;
} PROTOCOLFILTERDATA;


[
        local,
        object,
        uuid(70bdde00-c18e-11d0-a9ce-006097942311),
        pointer_default(unique)
]

interface IEncodingFilterFactory : IUnknown
{
        typedef [unique] IEncodingFilterFactory *LPENCODINGFILTERFACTORY;

        typedef struct _tagDATAINFO
        {
            ULONG   ulTotalSize;
            ULONG   ulavrPacketSize;
            ULONG   ulConnectSpeed;
            ULONG   ulProcessorSpeed;
        } DATAINFO ;


        HRESULT FindBestFilter(
            [in]    LPCWSTR                 pwzCodeIn,
            [in]    LPCWSTR                 pwzCodeOut,
            [in]    DATAINFO                info,
            [out]   IDataFilter**           ppDF
            );

        HRESULT GetDefaultFilter(
            [in]    LPCWSTR                 pwzCodeIn,
            [in]    LPCWSTR                 pwzCodeOut,
            [out]   IDataFilter**           ppDF
            );

}
cpp_quote("#endif")


//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 1995-1998.
//
//  Contents:   Hit Logging Apis definition
//
//---------------------------------------------------------------------------

cpp_quote("#ifndef _HITLOGGING_DEFINED")
cpp_quote("#define _HITLOGGING_DEFINED")

cpp_quote("// Logging-specific apis")
#pragma midl_echo("BOOL WINAPI IsLoggingEnabledA(IN LPCSTR  pszUrl);                    ")
#pragma midl_echo("BOOL WINAPI IsLoggingEnabledW(IN LPCWSTR  pwszUrl);                  ")

cpp_quote("#ifdef UNICODE                                                       ")
cpp_quote("#define IsLoggingEnabled         IsLoggingEnabledW                   ")
cpp_quote("#else                                                                ")
cpp_quote("#define IsLoggingEnabled         IsLoggingEnabledA                   ")
cpp_quote("#endif // !UNICODE                                                   ")

// HIT_LOGGING_INFO
typedef struct _tagHIT_LOGGING_INFO {
                            DWORD dwStructSize;
                                LPSTR lpszLoggedUrlName;
                        SYSTEMTIME StartTime;
                                SYSTEMTIME EndTime;
                                LPSTR lpszExtendedInfo;
                                } HIT_LOGGING_INFO, * LPHIT_LOGGING_INFO;

#pragma midl_echo("BOOL WINAPI WriteHitLogging(IN LPHIT_LOGGING_INFO lpLogginginfo);    ")

cpp_quote("#define CONFIRMSAFETYACTION_LOADOBJECT  0x00000001")

struct CONFIRMSAFETY
{
    CLSID       clsid;
    IUnknown *  pUnk;
    DWORD       dwFlags;
};

cpp_quote("EXTERN_C const GUID GUID_CUSTOM_CONFIRMOBJECTSAFETY; ")

cpp_quote("#endif")


//---------------------------------------------------------------------------
//
//  Copyright (C) Microsoft Corporation, 2000.
//
//  Contents:   IWrappedProtocol definition
//
//---------------------------------------------------------------------------
cpp_quote("#ifndef _LPIWRAPPEDPROTOCOL_DEFINED")
cpp_quote("#define _LPIWRAPPEDPROTOCOL_DEFINED")
[
        local,
        object,
        uuid(53c84785-8425-4dc5-971b-e58d9c19f9b6),
        pointer_default(unique)
]

interface IWrappedProtocol : IUnknown
{
        typedef [unique] IWrappedProtocol *LPIWRAPPEDPROTOCOL;

        HRESULT GetWrapperCode(
            [out] LONG * pnCode,
            [in]  DWORD_PTR dwReserved
            );
}
cpp_quote("#endif")
+/
version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
