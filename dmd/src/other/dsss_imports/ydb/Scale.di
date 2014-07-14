
// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2007  (yidabu  g m a i l at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: Nov 2007

        Authors:        yidabu ( D Programming Language China : http://bbs.d-programming-language-china.org )

*******************************************************************************/

module ydb.Scale;

private import  tango.core.Exception,
                tango.util.Convert,
                tango.core.Traits;
    
private import  tango.text.Util,
        tango.util.Convert;

private import Unicode = tango.text.Unicode;
    

private import  dwin.math.Scale,
                dwin.text.Unicode,
                dwin.text.TextConst,
                dwin.core.Traits;


version(ydbVerbose) 
    import tango.util.log.Trace;



class Translate
{
    /*
    // move to dwin.text.TextConst
    static const char[26] Lower = "zabcdefghijklmnopqrstuvwxy";
    static const char[26] Upper = "ZABCDEFGHIJKLMNOPQRSTUVWXY";
    static const char[52] Alpha = "zabcdefghijklmnopqrstuvwxyZABCDEFGHIJKLMNOPQRSTUVWXY";   
    static const char[62] Alnum = "0123456789zabcdefghijklmnopqrstuvwxyZABCDEFGHIJKLMNOPQRSTUVWXY";

    static const char[][60] GanZhi = [
    "癸亥", "甲子", "乙丑", "丙寅", "丁卯", "戊辰", "己巳", "庚午", "辛未", "壬申", 
    "癸酉", "甲戌", "乙亥", "丙子", "丁丑", "戊寅", "己卯", "庚辰", "辛巳", "壬午", 
    "癸未", "甲申", "乙酉", "丙戌", "丁亥", "戊子", "己丑", "庚寅", "辛卯", "壬辰", 
    "癸巳", "甲午", "乙未", "丙申", "丁酉", "戊戌", "己亥", "庚子", "辛丑", "壬寅", 
    "癸卯", "甲辰", "乙巳", "丙午", "丁未", "戊申", "己酉", "庚戌", "辛亥", "壬子", 
    "癸丑", "甲寅", "乙卯", "丙辰", "丁己", "戊午", "己未", "庚申", "辛酉", "壬戌" ];    

    static const char[][10] TianGan = ["癸", "甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬"];
    static const char[][12] DiZhi   = ["亥", "子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌"];
    */
    
    //用于网上校验md5值
    static char[] hexToLowers(char[] hex)
    {
        char[][char] a = [
            '0':"z", '1':"a", '2':"b", '3':"c", '4':"d", '5':"e", '6':"f", '7':"g", 
            '8':"h", '9':"i", 'a':"j", 'b':"k", 'c':"l", 'd':"m", 'e':"n", 'f':"o",
                              'A':"j", 'B':"k", 'C':"l", 'D':"m", 'E':"n", 'F':"o",
            ];
        
        foreach(v; hex)
        {
            assert((v in a) != null);
        }
        char[] result;
        foreach(v; hex)
            result ~= a[v];
        
        return result;
    }
    
    /*
    static char[] AlphaToHex(char[] alpha)
    {
        char[][char] a = [
            '0':"z", '1':"a", '2':"b", '3':"c", '4':"d", '5':"e", '6':"f", '7':"g", 
            '8':"h", '9':"i", 'a':"j", 'b':"k", 'c':"l", 'd':"m", 'e':"n", 'f':"o"  ];
        
        foreach(v; hex)
        {
            assert((v in a) != null);
        }
        char[] result;
        foreach(v; hex)
            result ~= a[v];
        
        return result;
    }    
    */
    
    static char[] getLowers(T)(T t, char[] sepIn = " ", char[] sepOut = "")
    {
        return getFull(t, TextConst.Lower, sepIn, sepOut);
    }
    
    static char[] getAlphas(T)(T t, char[] sepIn = " ", char[] sepOut = "")
    {
        return getFull(t, TextConst.Alpha, sepIn, sepOut);
    }
    
    static char[] getAlnums(T)(T t, char[] sepIn = " ", char[] sepOut = "")
    {
        return getFull(t, TextConst.Alnum, sepIn, sepOut);
    }
    
    static char[] getGanZhis(T)(T t, char[] sepIn = " ", char[] sepOut = "")
    {
        
        return getFull(t, TextConst.GanZhi, sepIn, sepOut);
    }
    
    static char[] getTianGans(T)(T t, char[] sepIn = " ", char[] sepOut = "")
    {
        return getFull(t, TextConst.TianGan, sepIn, sepOut);
    }
    
    static char[] getDiZhis(T)(T t, char[] sepIn = " ", char[] sepOut = "")
    {
        return getFull(t, TextConst.DiZhi, sepIn, sepOut);
    }
        
    static char[] lowersToSnum(char[] lowers, char[] sepOut = " ")
    {
        char[] result;
        
        lowers = Unicode.toLower(lowers);
        foreach(v; lowers)
        {
            if(!Unicode.isLetter(v))
            {
                //version(ydbVerbose) Trace.formatln("lowersToSnum, not letter in " ~ lowers);
                continue;
            }
                
            result ~= to!(char[])( indexOf(TextConst.Lower.ptr, v, TextConst.Lower.length) );
            result ~= sepOut;
            
        }
        
        if(result.length && sepOut.length && result.length > sepOut.length)
            result.length = result.length - sepOut.length;
        
        return result;
    }
    //lowersToSnum


    static char[] alnumsToSnum(char[] alphas, char[] sepOut = " ")
    {
        char[] result;
        
        foreach(v; alphas)
        {
            if(Unicode.isLetter(v))
            {                
                result ~= to!(char[])( indexOf(TextConst.Alnum.ptr, v, TextConst.Alnum.length) );
                result ~= sepOut;
            }
            else if(Unicode.isDigit(v))
            {
                result ~= v;
                result ~= sepOut;                
            }
            else
            {
                continue;                
            }
            
        }
        
        if(result.length && sepOut.length && result.length > sepOut.length)
            result.length = result.length - sepOut.length;
        
        return result;
    }
    //alnumsToSnum    
    
    
    static char[] alphasToSnum(char[] alnums, char[] sepOut = " ")
    {
        char[] result;
        
        foreach(v; alnums)
        {
            if(!Unicode.isLetter(v))
            {
                //version(ydbVerbose) Trace.formatln("alnumsToSnum, not letter in " ~ alnums);
                continue;
            }
                
            result ~= to!(char[])( indexOf(TextConst.Alpha.ptr, v, TextConst.Alpha.length) );
            result ~= sepOut;
            
        }
        
        if(result.length && sepOut.length && result.length > sepOut.length)
            result.length = result.length - sepOut.length;
        
        return result;
    }
    //alphasToSnum 

    
    
    static char getPart(T, A)(T t, A a)
    {
        static assert( isCharType!(ElemBaseType!(A)) && is(typeof(A[0])), 
            "The type of " ~ typeof(A).stringof ~ " must be string type");
        
        char result;
        static if( isIntegerType!(T) )
        {
            if(a.length && t < a.length)
                result = a[t];
            else
                assert(false, "The number of " ~ to!(char[])(t) ~ " larger than " ~ to!(char[])(a.length-1) );
        }
        else static if( is(T == char[]) )
        {
            if(isDigits(t))
                return getPart( to!(int)(t), a );
            else
                version(ydbVerbose) Trace.formatln("getPart {} out of range", t);
        }
        else static assert(false, "The type of " ~ typeof(T).stringof ~ " not accept");
        
        return result;
    }
    //getPart
    
    
    static char[] getFull(T, A)(T t, A a, char[] sepIn = " ", char[] sepOut = "")
    {
        
        static assert( isCharType!(ElemBaseType!(A)) && is(typeof(A[0])), 
            "The type of " ~ typeof(A).stringof ~ " must be string type");
        

        char[] result;
        
        static if ( is(T == char[]) )
        {
            if(!t.length)
                return null;
        // not neeeded
        //    if( t.length > 1 && t[0].sizeof is 1 && !containsPattern(t, sepIn) )
        //  t = dwin.text.Util.insert(t, sepIn, t[0].sizeof);
            
            foreach( v; delimit(t,sepIn) )
            {
                result ~= getPart(v, a);
                result ~= sepOut;                
            }
        }
        else static if( isIntegerType!(T) )
            return getFull( Scale!(T)(t, 10, a.length, sepIn), a, sepIn, sepOut);
        
        if(result.length && sepOut.length && result.length > sepOut.length)
            result.length = result.length - sepOut.length;
        
        return result;
    }
    //getFull
    
    

    
    
    char[] getSnum(A)(A a, char[] t, char[] sepIn = "", char[] sepOut = " ")
    {
        static assert( isCharType!(ElemBaseType!(A)) && is(typeof(A[0])), 
            "The type of " ~ typeof(A).stringof ~ " must be string type");
            
        char[] result;
        if(!sepIn.length)
            foreach(v; t)
                for(size_t i; i < a.length; i++)
                {
                    if(v ==a[i])
                    {
                        result ~= to!(char[])(i);
                        result ~= sepOut;
                        break;
                    }
                }
        else 
            foreach(v; delimit(t, sepIn) )
            {
                for(size_t i; i < a.length; i++)
                {
                    if(v == a[i])
                    {
                        result ~= to!(char[])(i);
                        result ~= sepOut;
                        break;
                    }
                    
                }
                
            }
            
        if(result.length && result.length > sepOut.length)
            result.length = result.length - sepOut.length;
        
        return result;
    }
    //static size_t index(T, A)(T t, A a
}
//Translate




debug(UnitTest) unittest
{    
    
    assert( Translate.lowersToSnum("abcdefghijklmnopqrstuvwxyz"c.dup, " "c.dup) 
        == "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 0" );
    assert( Translate.lowersToSnum("ABCDEFGHIJKLMNOPQRSTUVWXYZ"c.dup, " "c.dup) 
        == "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 0" );    
    assert( Translate.lowersToSnum("a b cd   efghijkl mnopqrstuvwxy z "c.dup, " "c.dup) 
        == "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 0" );    
    
    assert( Translate.alnumsToSnum("0123456789za b cd   efghijkl mnopqrstuvwxy"c.dup, " "c.dup) 
        == "0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35"c.dup );    

    assert( Translate.alphasToSnum("zabcdefghijklmnopqrstuvwxy"c.dup, " "c.dup) 
        == "0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25" );
    assert( Translate.alphasToSnum("ZABCDEFGHIJKLMNOPQRSTUVWXY") 
        == "26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51" );    
    
    assert( Translate.hexToLowers("0123456789abcdef") == "zabcdefghijklmno" );
    //Lower
    assert( Translate.getLowers("1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 0"c.dup, " "c.dup, ""c.dup) 
        == "abcdefghijklmnopqrstuvwxyz" );

    //Alpha
    assert( Translate.getAlphas("0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51"c.dup, " ".dup, "".dup) 
        == "zabcdefghijklmnopqrstuvwxyZABCDEFGHIJKLMNOPQRSTUVWXY" );

   
}
//

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
