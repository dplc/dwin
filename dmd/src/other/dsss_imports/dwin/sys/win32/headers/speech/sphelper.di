// Written in the D programming language.

/*******************************************************************************
        
        This is the header file for core helper functions implementation for MS speech SDK.        
        
        Copyright:      Copyright (c) 2009  (dyuyan  gmail at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: June 2009

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/


module dwin.sys.win32.headers.sphelper;

private import dwin.sys.win32.com.Core;
private import dwin.sys.win32.com.tlb.speech.sapi;



/*
inline HRESULT SpFindBestToken(
    const WCHAR * pszCategoryId, 
    const WCHAR * pszReqAttribs, 
    const WCHAR * pszOptAttribs, 
    ISpObjectToken **ppObjectToken)
{
    SPDBG_FUNC("SpFindBestToken");
    HRESULT hr = S_OK;
    
    const WCHAR *pszVendorPreferred = L"VendorPreferred";
    const ulLenVendorPreferred = wcslen(pszVendorPreferred);

    // append VendorPreferred to the end of pszOptAttribs to force this preference
    ULONG ulLen = pszOptAttribs ? wcslen(pszOptAttribs) + ulLenVendorPreferred + 1 : ulLenVendorPreferred;
    WCHAR *pszOptAttribsVendorPref = (WCHAR*)_alloca((ulLen+1)*sizeof(WCHAR));
    if (pszOptAttribsVendorPref)
    {
        if (pszOptAttribs)
        {
            wcscpy(pszOptAttribsVendorPref, pszOptAttribs);
            wcscat(pszOptAttribsVendorPref, L";");
            wcscat(pszOptAttribsVendorPref, pszVendorPreferred);
        }
        else
        {
            wcscpy(pszOptAttribsVendorPref, pszVendorPreferred);
        }
    }
    else
    {
        hr = E_OUTOFMEMORY;
    }

    CComPtr<IEnumSpObjectTokens> cpEnum;
    if (SUCCEEDED(hr))
    {
        hr = SpEnumTokens(pszCategoryId, pszReqAttribs, pszOptAttribsVendorPref, &cpEnum);
    }

    if (SUCCEEDED(hr))
    {
        hr = cpEnum->Next(1, ppObjectToken, NULL);
        if (hr == S_FALSE)
        {
            *ppObjectToken = NULL;
            hr = SPERR_NOT_FOUND;
        }
    }

    if (hr != SPERR_NOT_FOUND)
    {
        SPDBG_REPORT_ON_FAIL(hr);
    }
    
    return hr;
}
*/
version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
