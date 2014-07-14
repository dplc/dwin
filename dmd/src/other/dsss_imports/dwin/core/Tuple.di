/*******************************************************************************
        
        copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/


module dwin.core.Tuple;

private import dwin.core.Ctfe;
    

///////////////////////////////////////////////////////////////////////////////////////////////////////////
// Tuple
///////////////////////////////////////////////////////////////////////////////////////////////////////////

template InTuple( T, List... )
{
    static if( IndexOf!(T, List)  == List.length )
        const bool InTuple = false;
    else
        const bool InTuple = true;
}

static assert( InTuple!(char, char[], char) );
static assert( !InTuple!(dchar, char[], char) );


//  scrapple\arg_bind
/// return true if A[0] is in A[1..$], return false if A.length == 1 or otherwise
template InValues(A...)
{
	static assert(A.length != 0);

	static if(A.length == 1)
		const bool InValues = false;
	else
	{
		static if(A[0] == A[$-1])
			const bool InValues = true;
		else
			const bool InValues = InValues!(A[0], A[1..$-1]);
	}
}
//InValues
static assert(!InValues!(1,2,3,4,5,6));
static assert(InValues!(2,2,3,4,5,6));
static assert(InValues!(4,2,3,4,5,6));
static assert(InValues!(6,2,3,4,5,6));
static assert(!InValues!(6));






/// Convert tuple to string.
///
/// This is only necessary because CTFE functions cannot iterate over the elements
/// of a tuple. The solution is to use templates to create a string representation
/// of the types in the tuple.
//  from mathextra.blade.BladeRank
template ElemTupleToStr(X...)
{
    static if (X.length==0) const char [][] ElemTupleToStr = [];
    else  const char [][] ElemTupleToStr =  ElemTupleToStr!(X[0..$-1]) ~ [ElemBaseType!(X[$-1]).stringof];
}
debug( UnitTest )
{
    unittest 
    {
        static assert( ElemTupleToStr!(real [], double) == ["real", "double"]);
        static assert( ElemTupleToStr!() == cast(char[][])([]));
    }
}


/// Determine the (tensor) rank of type T; ie 0 if T is a scalar, 1 for vector,
/// 2 for matrix, 3 for rank-3 tensor, etc
//  from mathextra.blade.BladeRank
template Rank(T) 
{
    // If it can be indexed, it's a vector
    static if (is(typeof(T[0]))) const int Rank = 1 + Rank!(typeof(T[0]));
    else const int Rank = 0;
}
//
debug( UnitTest )
{
    unittest
    {
        assert( Rank!(char) == 0 );
        assert( Rank!(char[]) == 1 );
        assert( Rank!(char[][]) == 2 );
        assert( Rank!(wchar[][15][]) == 3 );
    }
}
//

/// Determine the rank of every item of the tuple T.
//  from mathextra.blade.BladeRank
template TupleRank(T...) 
{
    static if (T.length==1) const int[] TupleRank = [ Rank!(T[0])];
    else const int[] TupleRank = Rank!(T[0]) ~ TupleRank!(T[1..$]);
}
debug( UnitTest )
{
    unittest
    {
        assert(TupleRank!(int[][], float, double[], double[45])==[2,0,1,1]);
    }
}


//by oldrev, redsea
template HasMember(T, char [] member) 
{ 
    const bool HasMember = is( typeof(mixin("T." ~ member)) ); 
}
template HasMember(alias T, char [] member) 
{ 
    const bool HasMember = is( typeof(mixin("T." ~ member)) ); 
} 

//HasMember   
debug( UnitTest )
{   
    unittest
    {
        struct Foo   
        {   
            int m;   
            void bar() { }   
        }   
       
        assert( HasMember!(Foo, "bar") );   
        assert( HasMember!(Foo, "m") );   
        assert( HasMember!(Foo, "sizeof") );   
        assert( !HasMember!(Foo, "foo") );   
        assert( !HasMember!(Foo, "y") );   
        assert( HasMember!(int, "sizeof") );   
    }
} 
//

// scrapple\arg_bind
template Remove(R...)      // 0 based indices of the Tuple parts to remove
{
	template From(A...)    // the tuple to remove stuff from
	{
		static if(A.length != 0)
		{
			static if(InValues!(A.length-1, R))
			{
				alias From!(A[0..$-1]) From;
			}
			else
			{
				alias Tuple!(From!(A[0..$-1]), A[$-1]) From;
			}
		}
		else
		{
			alias Tuple!() From;
		}
	}
}
debug( UnitTest )
{
    unittest
    {
        alias Remove!(1,3,5).From!(ubyte,byte,ushort,short,uint,int) remove;
        static assert(remove.length == 3, "lenght is: "~cast(char)('0' + remove.length));
        static assert(is(remove[0] == ubyte));
        static assert(is(remove[1] == ushort));
        static assert(is(remove[2] == uint));        
    }
}


// scrapple\arg_bind
template Select(R...)      // 0 based indes the the Tuple parts to remove
{
	template From(A...)    // the tuple to remove stuff from
	{
		static if(A.length != 0)
		{
			static if(InValues!(A.length-1, R))
			{
				alias Tuple!(From!(A[0..$-1]), A[$-1]) From;
			}
			else
			{
				alias From!(A[0..$-1]) From;
			}
		}
		else
		{
			alias Tuple!() From;
		}
	}
}
debug( UnitTest )
{
    unittest
    {
        alias Select!(1,3,5).From!(ubyte,byte,ushort,short,uint,int) select;
        static assert(select.length == 3, "lenght is: "~cast(char)('0' + select.length));
        static assert(is(select[0] == byte));
        static assert(is(select[1] == short));
        static assert(is(select[2] == int));
    }
}


// return a tuple with ints from start to stop
template Range(int start, int stop, A...)
{
	static if(start >= stop) 
		alias Tuple!(A,start) Range;
	else
		alias Range!(start+1, stop, A, start) Range;
}
debug( UnitTest )
{
    unittest
    {
        alias Range!(0,5) r;
        static assert(r.length == 6);
        static assert(r[0] == 0);
        static assert(r[$-1] == 5);
    }
}

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
