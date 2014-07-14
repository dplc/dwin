
module dwin.core.Gp;

private import dwin.core.Ctfe;
    
private import tango.text.Ascii;


///////////////////////////////////////////////////////////////////////////////////////////////////////////
// Generic Programming
///////////////////////////////////////////////////////////////////////////////////////////////////////////
 
struct IsLessEqual( Elem )
{
    bool opCall( Elem p1, Elem p2 )
    {
        return p1 <= p2;
    }
} 

struct IsMoreEqual( Elem )
{
    bool opCall( Elem p1, Elem p2 )
    {
        return p1 >= p2;
    }
} 

struct IsMore( Elem )
{
    bool opCall( Elem p1, Elem p2 )
    {
        return p1 > p2;
    }
} 


//from tango.core.Array
struct IsEqual( T )
{
    bool opCall( T p1, T p2 )
    {
        // TODO: Fix this if/when opEquals is changed to return a bool.
        static if( is( T == class ) || is( T == struct ) )
            return (p1 == p2) != 0;
        else
            return p1 == p2;
    }
}
//

struct IsLess( T )
{
    bool opCall( T p1, T p2 )
    {
        return p1 < p2;
    }
}
//


void swap(T)(ref T a, ref T b) { T c=a; a=b; b=c; }

template Pair(T) { alias Tuple!(T, T) Pair; }
template Triple(T) { alias Tuple!(T, T, T) Triple; }
