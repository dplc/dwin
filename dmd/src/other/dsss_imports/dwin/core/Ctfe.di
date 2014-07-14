/*******************************************************************************
        Defines tools useful for CTFE        
        copyright:      Copyright (c) 2007  (yidabu  gmail at com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module dwin.core.Ctfe;

public
{
    import dwin.core.Tuple;
    import dwin.core.Traits;
    import dwin.core.Gp;
    
    import tango.core.Tuple;
    import tango.core.Traits;
}    



///////////////////////////////////////////////////////////////////////////////////////////////////////////
// CTFE
///////////////////////////////////////////////////////////////////////////////////////////////////////////


// by Downs
template Replace(char[] SOURCE, char[] WHAT, char[] WITH) {
  static if(SOURCE.length<WHAT.length) const char[] Replace=SOURCE; else
  static if(SOURCE[0..WHAT.length]==WHAT) const char[] Replace=WITH~Replace!(SOURCE[WHAT.length..$], WHAT, WITH); else
  const char[] Replace=SOURCE[0]~Replace!(SOURCE[1..$], WHAT, WITH);
}
//Replace
debug(UnitTest)
{
    unittest
    {
        assert( Replace!("abc", "abcd", "efgh") == "abc" ) ;
        assert( Replace!("abcabc", "b", "B") == "aBcaBc" ) ;
    }
}
//

//  by Downs
template FindOr(char[] SRC, char[] WHAT, size_t OR) 
{
  static if(SRC.length<WHAT.length) const size_t FindOr=OR; else
  static if(SRC[0..WHAT.length]==WHAT) const size_t FindOr=0; else
  const size_t FindOr=FindOr!(SRC[1..$], WHAT, OR)+1;
}
//FindOr
debug( UnitTest )
{
    unittest
    {
        assert( FindOr!("a", "ab", uint.max) == uint.max );
        assert( FindOr!("abcd", "a", uint.max) == 0 );
        assert( FindOr!("abcd", "c", uint.max) == 2 );
    }
}
//

// by Downs
// reverse insert at WHERE or start
template RInsert(char[] SRC, char[] WHERE, char[] WITH) {
  static if(SRC.length<WHERE.length) const char[] RInsert=WITH~SRC; else
  static if(SRC[$-WHERE.length..$]==WHERE) const char[] RInsert=SRC~WITH; else
  const char[] RInsert=RInsert!(SRC[0..$-1], WHERE, WITH)~SRC[$-1];
}
//RInsert
debug( UnitTest )
{
    unittest
    {
        assert( RInsert!("a", "bc", "BC") == "BCa" );
        assert( RInsert!("abc", "bc", "BC") == "abcBC" );
        assert( RInsert!("abcd", "bc", "BC") == "abcBCd" );
        
    }
}
//




// http://www.digitalmars.com/d/archives/digitalmars/D/learn/compile_time_string_manipulation_7225.html
 char[] obfuscate(char[] buf){
    char[] result;
    foreach(c; buf){
       result ~= c ^ 0xCC;
    }
    return result;
 }

 template CT(char[] m){
    const char[] CT = obfuscate(m);
 }










version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
