// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2009  (dyuyan  gmail at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: May 2009

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/



module dwin.sys.win32.browser.StorageImpl;

private import dwin.sys.win32.com.Core;
private import tango.sys.win32.Types : FILETIME, E_NOTIMPL, S_OK;


class StorageImpl : Implements!(IStorage)
{

  int CreateStream(wchar* pwcsName, uint grfMode, uint reserved1, uint reserved2, out IStream ppstm)
  { return E_NOTIMPL; }
  int OpenStream(wchar* pwcsName, void* reserved1, uint grfMode, uint reserved2, out IStream ppstm)
  { return E_NOTIMPL; }
  
  int CreateStorage(wchar* pwcsName, uint grfMode, uint reserved1, uint reserved2, out IStorage ppstg)
  { return E_NOTIMPL; }
  
  int OpenStorage(wchar* pwcsName, IStorage psrgPriority, uint grfMode, wchar** snbExclude, uint reserved, out IStorage ppstg)
  { return E_NOTIMPL; }
  
  int CopyTo(uint ciidExclude, DWINGUID* rgiidExclude, wchar** snbExclude, IStorage pstgDest)
  { return E_NOTIMPL; }
  
  int MoveElementTo(wchar* pwcsName, IStorage pstgDest, wchar* pwcsNewName, uint grfFlags)
  { return E_NOTIMPL; }
  
  int Commit(uint grfCommitFlags)
  { return E_NOTIMPL; }
  
  int Revert()
  { return E_NOTIMPL; }
  
  int EnumElements(uint reserved1, void* reserved2, uint reserved3, out IEnumSTATSTG ppenum)
  { return E_NOTIMPL; }
  
  int DestroyElement(wchar* pwcsName)
  { return E_NOTIMPL; }
  
  int RenameElement(wchar* pwcsOldName, wchar* pwcsNewName)
  { return E_NOTIMPL; }
  
  int SetElementTimes(wchar* pwcsName, FILETIME* pctime, FILETIME* patime, FILETIME* pmtime)
  { return E_NOTIMPL; }
  
  int SetClass(DWINGUID* clsid)
  { return S_OK; }
  
  int SetStateBits(uint grfStateBits, uint grfMask)
  { return E_NOTIMPL; }
  
  int Stat(out STATSTG stg, uint grfStatFlag)
  { 
    return E_NOTIMPL; 
  }  
      

}
