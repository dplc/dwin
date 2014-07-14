
// Written in the D programming language.

/*******************************************************************************

        Create shortcut of Application.
        
        copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: Nov 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module dwin.sys.win32.ShellLink;

private import dwin.sys.win32.com.Core;
private import dwin.sys.win32.headers.shlguid : CLSID_ShellLink;
private import dwin.sys.win32.headers.shobjidl : IShellLinkW;
private import dwin.sys.win32.headers.objidl : IPersistFile;
private import dwin.sys.win32.com.COMException;
    
private import dwin.sys.win32.CodePage : toString16z;

//private import dwin.sys.win32.com.tlb.shell32;  //for ShellLinkDual

private import bstr = dwin.sys.win32.com.Bstr;

private import tango.sys.win32.Types;

pragma(lib,"uuid.lib"); 


/**
    DESCRIPTION: Creates a Windows shortcut
    Examples:
    ---
        char[] ie = r"C:\Program Files\Internet Explorer\iexplore.exe";
        scope shell = new ShellLink();
        shell.path = ie;
        shell.iconLocation = ie;
        shell.workingDirectory = r"C:\Program Files\Internet Explorer\";
        shell.save(r"D:\ie.lnk");
    ---
*/
class ShellLink
{
    private 
    {
        IShellLinkW  shell;
        IPersistFile    pfile;
        int hr = E_FAIL;
    }
    
    void exception(char[] msg)
    {
        throw new COMException("ShellLink " ~ msg);
    }
    
    this()
    {
        shell = coCreate!(IShellLinkW)(CLSID_ShellLink, ExecutionContext.InProcessServer);
        if(!shell)
            exception("IShellLinkW failed");
        pfile = com_cast!(IPersistFile)(shell);
        if(!pfile)
            exception("IPersistFile failed");
        
    }
    ~this()
    {
        tryRelease(pfile);
        tryRelease(shell);
    }

    /** Sets exe location */    
    bool path(char[] s)
    {
        //wchar* bstring = s.toString16z();
        auto bstring = bstr.fromString(s);
        scope(exit)
            bstr.free(bstring);
        hr = shell.SetPath(bstring);
        return hr == S_OK;
    }

    /** Gives shortcut an icon */
    bool iconLocation(char[] s, int icon = 0)
    {
        //wchar* bstring = s.toString16z();
        wchar* bstring = bstr.fromString(s);
        scope(exit)
            bstr.free(bstring);            
        hr = shell.SetIconLocation(bstring, icon);
        return hr == S_OK;       
    }

    /** Sets shortcut description */
    bool description(char[] s)
    {
        //wchar* bstring = s.toString16z();
        wchar* bstring = bstr.fromString(s);
        scope(exit)
            bstr.free(bstring);            
        hr = shell.SetDescription(bstring);
        return hr == S_OK;        
    }    

    /** Make it full screen */
    bool showCmd(int show = SW_SHOW)
    {
        hr = shell.SetShowCmd(show);
        return hr == S_OK;        
    }     

    /* Set default path */
    bool workingDirectory(char[] s)
    {
        //wchar* bstring = s.toString16z();
        wchar* bstring = bstr.fromString(s);
        scope(exit)
            bstr.free(bstring);            
        hr = shell.SetWorkingDirectory(bstring);
        return hr == S_OK;        
    }       

    bool arguments(char[] s)
    {
        //wchar* bstring = s.toString16z();
        wchar* bstring = bstr.fromString(s);
        scope(exit)
            bstr.free(bstring);            
        hr = shell.SetArguments(bstring);
        return hr == S_OK;        
    }       
    
    bool save(char[] s, BOOL remember = TRUE)
    {
        //wchar* bstring = s.toString16z();
        wchar* bstring = bstr.fromString(s);
        scope(exit)
            bstr.free(bstring);            
        hr = pfile.Save(bstring, remember);    //http://msdn2.microsoft.com/en-us/library/ms693701.aspx
        return hr == S_OK;  
    }
}
// ShellLink


// not finished, coCreate get 80040154
/**
    DESCRIPTION: Creates a Windows shortcut
    Examples:
    ---
        char[] ie = r"C:\Program Files\Internet Explorer\iexplore.exe";
        auto shell = new ShellLinkDual();
        shell.path = ie;
        shell.iconLocation = ie;
        shell.workingDirectory = r"C:\Program Files\Internet Explorer\";
        shell.save(r"D:\ie.lnk");
    ---
*/
/*
private class ShellLinkDual
{
    private 
    {
        IShellLinkDual  shell;
        //IPersistFile    pfile;
        int hr = E_FAIL;
    }
    
    void exception(char[] msg)
    {
        throw new COMException("ShellLinkDual " ~ msg);
    }
    
    this()
    {
        shell = ShellLinkObject.coCreate!(IShellLinkDual, ExceptionPolicy.Throw)(ExecutionContext.InProcessServer);
        
        //pfile = com_cast!(IPersistFile)(shell);
        //if(!pfile)
           // exception("IPersistFile");
        
    }
    ~this()
    {
        tryRelease(shell);
        //tryRelease(pfile);
    }

    //Sets exe location
    bool path(char[] s)
    {
        wchar* bstring = s.toString16z();
        hr = shell.set_Path(bstring);
        bstr.free(bstring);
        return hr == S_OK;
    }

    // Gives shortcut an icon 
    bool iconLocation(char[] s, int icon = 0)
    {
        wchar* bstring = s.toString16z();
        hr = shell.SetIconLocation(bstring, icon);
        bstr.free(bstring);
        return hr == S_OK;       
    }

    // Sets shortcut description
    bool description(char[] s)
    {
        wchar* bstring = s.toString16z();
        hr = shell.set_Description(bstring);
        bstr.free(bstring);
        return hr == S_OK;        
    }    

    /// Make it full screen 
    bool showCommand(int show = SW_SHOW)
    {
        hr = shell.set_ShowCommand(show);
        return hr == S_OK;        
    }     

    // Set default path 
    bool workingDirectory(char[] s)
    {
        wchar* bstring = s.toString16z();
        hr = shell.set_WorkingDirectory(bstring);
        bstr.free(bstring);
        return hr == S_OK;        
    }       

    bool arguments(char[] s)
    {
        wchar* bstring = s.toString16z();
        hr = shell.set_Arguments(bstring);
        bstr.free(bstring);
        return hr == S_OK;        
    }       
    
    //bool save(char[] s, bool remember = true)
    bool save(char[] s)
    {
        //wchar* bstring = s.toString16z();
        //hr = pfile.Save(bstring, remember);    //http://msdn2.microsoft.com/en-us/library/ms693701.aspx
        //hr = shell.Save(bstring);
        //bstr.free(bstring);
        

        DWINVARIANT v = DWINVARIANT(s);

        hr = shell.Save(v);
        v.clear();
        return hr == S_OK;  
    }
}
// ShellLinkDual
*/

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
