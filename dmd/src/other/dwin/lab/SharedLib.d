/*******************************************************************************
        
        copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/


module dwin.lab.SharedLib;

public import tango.sys.SharedLib;
private import dwin.core.Ctfe;
    
version(LAB):

/**
    Examples:
    ---
    alias DllImport!("user32.dll", "MessageBoxW", int function(void*, wchar*, wchar*, uint) ) msgBox;        
    alias DllImport!("Kernel32.dll", "GetTickCount", size_t function() ) tickCount;        
    
    msgBox(null, "hello, Tango\0"w.ptr , cast(wchar*)null, MB_OKCANCEL);
    tickCount();
    ---

*/
version(Win32):

struct DllImport(char[] dllName, char[] entryPoint, TFunc) 
{
    static ReturnTypeOf!(TFunc) opCall( ParameterTupleOf!(TFunc) args ) 
    {
        if (auto lib = SharedLib.load(dllName)) 
        {
            static TFunc func = null;
            void* ptr = lib.getSymbol(entryPoint.ptr);
            if(ptr)
                func = cast(TFunc) ptr;
            lib.unload();            
            return func(args);
        }
    }
} 
