
// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2007  (yidabu  g m a i l at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: Nov 2007

        Authors:        yidabu ( D Programming Language China : http://bbs.d-programming-language-china.org )

*******************************************************************************/

module ydb.Crypt;

private import Base64 = tango.util.encode.Base64;

/// simple xor for CTFE use
char[] xor(char[] src)
{
    size_t len = src.length % 256;
    
    char[] des;
    foreach(v; src)                  
        des ~= v ^ ( ++len % 256 );
    return des;
}
   
template ob(char[] m)
{
    const char[] ob = xor(m);
}


char[] verify_xor(char[] src)
{
    size_t len = src.length + 256;
    char[] des;
    foreach(v; src)
        des ~= v ^ (--len % 256);
    
    return des;
}

template verify_ob(char[] m)
{
    const char[] verify_ob = verify_xor(m);
}





/**

    Examples:
    --
    const char[] SOURCE = "I would say hello to you, but you couldn't read it even if I did."c ;
    auto enc = Crypt.xor(SOURCE) ;
    auto dec = Crypt.xor(enc   ) ;

    ---
    
    See_Also:
    http://www.digitalmars.com/d/archives/digitalmars/D/learn/A_bit_of_binary_I_O_6046.html
*/

struct Crypt 
{
    // for write SoftAnalytics
    static char[] xor(char[] src)
    {
        size_t len = src.length + 256;
        char[] des;
        foreach(v; src)
            des ~= v ^ (--len % 256);
        
        return des;
    }
    
    // for encrypt data recived from server
    static char[] xor(char[] src, char[]key)
    {
        char[] des;
        foreach(k, v; src)
            des ~= v ^ ( key[k % key.length] );
        return des;
    }      
    
    static char[] xor(char[] src, char[]key, char delegate(char[], uint) dg)
    {
        /*
        if(!dg)
            dg = delegate char (char[] s, size_t index) 
            { 
                return s[--index % s.length]; 
            };
        */
            
        char[] des = src.dup;
        auto i = des.length;
        foreach(ref v; des)
            v = v ^ dg(key, i);
        
        return des;
    }    
    
    /**
    
    */
    // 
    static char[] xor (char[] src, size_t chunkSize, size_t rot) 
    {
        /*
        if(!chunkSize)
            chunkSize = 32U;
        
        if(!rot)
            rot = 16U;
        */
        char[] result ;

        foreach (ch; chunks(src, chunkSize)) {
            result ~= mutate(ch, rot);
        }
        return result;
    }

        private static char[][] chunks (char[] x, size_t chunkSize) 
        {
            char[]   source = x ;
            char[][] result     ;

            while (source.length >= chunkSize) 
            {
                result ~= source[0          .. chunkSize] ;
                source  = source[chunkSize .. $         ] ;
            }
            if (source.length) 
            {
                result ~= source;
            }
            return result;
       }

        private static char[] mutate (char[] x, size_t rot) 
        {
            char[] result ;

            if (x.length > rot) 
            {
                result = x[rot .. $] ~ x[0 .. rot];
            }
            else 
            {
                result = x.dup;
            }
            foreach (k, ref c; result) 
            {
                c ^= k % 256;
            }
            return result;
       }

}


debug(UnitTest) unittest
{
    const char[] src = "abcd";
    const char[] des = ob!(src);
    assert( ob!(des) == src );
    
    assert( Crypt.xor( Crypt.xor(src) ) == src );
    assert( Crypt.xor( Crypt.xor(src, "hello"), "hello" ) == src );
    assert( Crypt.xor( Crypt.xor(src, 32, 16), 32, 16 ) == src );
    
}

    /**
        January 4, 2010
        在命令行软件中，直接使用明文用户名和密码是比较危险的，应该加密一下再使用
        pre是让软件用来识别这是加密过的明文，自动解密后再用
    Example:
    -------------------
    char[] src = "mypass";
    char[] pre = "s-d.n";
    char[] encoded = encodePass(src, pre);
    char[] decoded = decodePass(encoded, pre);
    Stdout.formatln( "encoded:{}", encoded);
    Stdout.formatln( "decoded:{}", decoded);
    -------------------

    */
    
    char[] encodePass(char[] src, char[] pre = "s-d.n")
    {
        if(!src.length) return src;
            
        if(pre.length && src.length > pre.length && src[0..pre.length] == pre) //if encoded alreaded, return src
            return src;
        
        char[] blah = xor(src);
        scope encodebuf = new char[Base64.allocateEncodeSize(cast(ubyte[])blah)];
        char[] encoded = Base64.encode(cast(ubyte[])blah, encodebuf);        
        return pre ~ encoded;
    }
        
    //if has pre, src must begin with pre
    char[] decodePass(char[] src, char[] pre = "s-d.n")
    {
        if(!src.length) return src;
        if(pre.length && (src.length <= pre.length || src[0..pre.length] != pre) )
            return src;
        src = src[pre.length..$];
        ubyte[] decodebuf = new ubyte[src.length];
        char[] decoded = cast(char[]) Base64.decode(src, decodebuf);
        return xor(decoded);        
    }
    

    
version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
