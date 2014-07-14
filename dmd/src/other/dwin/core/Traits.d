
// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: Nov 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/




 
module dwin.core.Traits;

private import dwin.core.Ctfe;
    


///////////////////////////////////////////////////////////////////////////////////////////////////////////
// Traits
///////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
template isArrayType(T) { const bool isArrayType=false; }
template isArrayType(T: T[]) { const bool isArrayType=true; }
*/
template ElemType( T )
{
    alias typeof(T[0]) ElemType;
}
//



/// Return the type of element stored in T. Eg, ElementType!(double[][35][]) is double.
//  from mathextra.blade.BladeRank
template ElemBaseType(T) {
    static if (is(typeof(T[0]))) alias ElemBaseType!(typeof(T[0])) ElemBaseType;
    else alias T ElemBaseType;
}
debug ( UnitTest ) unittest
{    
    assert( is (ElemBaseType!(double[][35][]) == double) );    
    assert( is (ElemBaseType!(char[][]) == char) );    
}
//


/**
Gets the name of a function alias.
*/
public template NameOfFunc(alias f)
{
	const char[] NameOfFunc = (&f).stringof[1 .. $];
}
debug( UnitTest ) unittest
{
    int foo(int a, int b);
    assert( NameOfFunc!(foo) == "foo" );        
}


/**
    Metafunction to see if a given type is one of char[], wchar[] or dchar[].
*/
template isStringType(T)
{
	const bool isStringType = is(T : char[]) || is(T : wchar[]) || is(T : dchar[]);
}

template isNumericType(T)
{
    const bool isNumericType =  isIntegerType!(T) ||
                                    isFloatingPointType!(T);    
}