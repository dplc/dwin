
// Written in the D programming language.

/*******************************************************************************

        Copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: Nov 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/




module dwin.text.Util;

private import  tango.text.Util,
                tango.text.convert.Integer,
                Path = tango.io.Path,
                tango.util.Convert;

private import  tango.core.Traits : isCharType;
private import  tango.math.Math : abs;
private import  tango.core.Array : shuffle;


private import  dwin.core.Array : replaceSeries;

private import  dwin.core.Ctfe,
        dwin.math.Scale,
        dwin.text.TextConst;




/******************************************************************************

        Substitute all instances of match from source. Set replacement
        to null in order to remove instead of replace

******************************************************************************/

T[] substitute(T) (T[] source, T[] match, T[] replacement, T lookbehind, T lookahead, T nlookbehind, T nlookahead)
{
        T[] output;

        foreach (s; patterns (source, match, replacement, lookbehind, lookahead, nlookbehind, nlookahead))
                    output ~= s;
        return output;
}
unittest
{
       assert(substitute("a %b c"c, "%b"c, "B"c, char.init, char.init, char.init, char.init)  == "a B c"c);
       // test lookbehind, lookahead
       assert(substitute("a ,%b, %b c"c, "%b"c, "B"c, ',',  ',', char.init, char.init)  == "a ,B, %b c"c, "lookbehind, lookahead");
       assert(substitute(",%b, %b c"c, "%b"c, "B"c, ',',  ',', char.init, char.init)  == ",B, %b c"c, "lookbehind, lookahead");
       assert(substitute("%b, %b c"c, "%b"c, "B"c, ',',  ',', char.init, char.init)  == "%b, %b c"c, "lookbehind, lookahead");
       //test lookbehind
       assert(substitute("a ,%b %b c"c, "%b"c, "B"c, ',',  char.init, char.init, char.init)  == "a ,B %b c"c, "lookbehind");
       assert(substitute(",%b %b c"c, "%b"c, "B"c, ',',  char.init, char.init, char.init)  == ",B %b c"c, "lookbehind");
       assert(substitute("%b %b c"c, "%b"c, "B"c, ',',  char.init, char.init, char.init)  == "%b %b c"c, "lookbehind");
       //test lookahead
       assert(substitute("%b, %b,"c, "%b"c, "B"c, char.init,  ',', char.init, char.init)  == "B, B,"c, "lookahead");
       assert(substitute("%b, %b"c, "%b"c, "B"c, char.init,  ',', char.init, char.init)  == "B, %b"c, "lookahead");
       //test nlookbehind
       assert(substitute(",%b %b"c, "%b"c, "B"c, char.init,  char.init, ',', char.init)  == ",%b B"c, "nlookbehind");
       assert(substitute("%b, %b"c, "%b"c, "B"c, char.init,  char.init, ',', char.init)  == "B, B"c, "nlookbehind");
       // test nlookahead
       assert(substitute("%b, %b"c, "%b"c, "B"c, char.init,  char.init, char.init, ',')  == "%b, B"c, "nlookahead");
       assert(substitute("%b, %b,"c, "%b"c, "B"c, char.init,  char.init, char.init, ',')  == "%b, %b,"c, "nlookahead");
       assert(substitute("%b %b"c, "%b"c, "B"c, char.init,  char.init, char.init, ',')  == "B B"c, "nlookahead");
}

/******************************************************************************

        Iterator to isolate text elements.

        Split the provided array wherever a pattern instance is found, 
        and return the resultant segments. Pattern are excluded from
        each of the segments, and an optional sub argument enables 
        replacement.
        
        ---
        foreach (segment; patterns ("one, two, three", ", "))
                 ...
        ---
        
******************************************************************************/

private PatternFruct!(T) patterns(T) (T[] src, T[] pattern, T[] sub, T lookbehind, T lookahead, T nlookbehind, T nlookahead)
{
        PatternFruct!(T) elements;
        elements.pattern = pattern;
        elements.sub = sub;
        elements.src = src;
        elements.lookbehind = lookbehind;
        elements.lookahead = lookahead;
        elements.nlookbehind = nlookbehind;
        elements.nlookahead = nlookahead;
        return elements;
}


/******************************************************************************

        Helper fruct for iterator patterns(). A fruct is a low 
        impact mechanism for capturing context relating to an 
        opApply (conjunction of the names struct and foreach)
        
******************************************************************************/

private struct PatternFruct(T)
{
        private T[] src,
                    sub,
                    pattern;
        private T lookbehind = T.init,
                  lookahead = T.init,
                  nlookbehind = T.init,
                  nlookahead = T.init;

        int opApply (int delegate (inout T[] token) dg)
        {
                size_t    ret,
                        pos,
                        mark;
                T[]     token;

                // optimize for single-element pattern
                if (pattern.length is 1)   
                {                    
                    while ((pos = locate (src, pattern[0], mark)) < src.length)
                    {
                          token = src [mark .. pos];
                          if ((ret = dg(token)) != 0)
                               return ret;
                          if (sub.ptr)
                          {
                              bool ok = true;
                              if(ok && lookbehind != T.init)
                                  if( (pos > 0 && src[pos-1] != lookbehind) || (pos==0) )
                                    ok = false;
                              if(ok && lookahead != T.init)
                                  if( (pos < src.length-1 && src[pos+1] != lookahead) || (pos==src.length-1) )
                                    ok = false;
                              if(ok && nlookbehind != T.init && pos > 0 && src[pos-1] == nlookbehind)
                                  ok = false;
                              if(ok && nlookahead != T.init && pos < src.length-1 && src[pos] == nlookahead)
                                  ok = false;
                              if(ok)
                              {
                                if ((ret = dg(sub)) != 0)
                                   return ret;
                              }
                              else
                              {
                                if ((ret = dg(pattern)) != 0)
                                   return ret;                                  
                              }
                                  
                          }
                          mark = pos + 1;
                    }
                }
                else
                {
                   if (pattern.length > 1)
                       while ((pos = locatePattern (src, pattern, mark)) < src.length)
                        {
                             token = src [mark .. pos];
                             if ((ret = dg(token)) != 0)
                                  return ret;
                             if (sub.ptr)
                             {
                                bool ok = true;
                                if(ok && lookbehind != T.init)
                                    if( (pos > 0 && src[pos-1] != lookbehind) || (pos==0) )
                                        ok = false;
                                if(ok && lookahead != T.init)
                                    if( (pos+pattern.length < src.length && src[pos+pattern.length] != lookahead) || (pos+pattern.length==src.length) )
                                        ok = false;
                                if(ok && nlookbehind != T.init && pos > 0 && src[pos-1] == nlookbehind)
                                    ok = false;
                                if(ok && nlookahead != T.init && pos+pattern.length < src.length && src[pos+pattern.length]==nlookahead)
                                    ok = false;
                              
                                if(ok)
                                {
                                    if ((ret = dg(sub)) != 0)
                                        return ret;
                                }
                                else
                                {
                                    if ((ret = dg(pattern)) != 0)
                                        return ret;                                    
                                }
                             mark = pos + pattern.length;
                             }
                        }
                }
                token = src [mark .. $];

                if (mark <= src.length)
                    ret = dg (token);

                return ret;
        }
}



// General utilities.
// mathextra.blade.BladeUtil
char [] itoa(T)(T x)
{
    char [] s="";
    static if (is(T==byte)||is(T==short)||is(T==int)||is(T==long)) {
        if (x<0) {
            return "-" ~ itoa(-x);
        }
    }
    do {
        s = cast(char)('0' + (x%10)) ~ s;
        x/=10;
    } while (x>0);
    return s;
}
debug( UnitTest )
{
    unittest
    {
        assert ( itoa(20071001) == "20071001" );
        assert ( itoa(-20071001) == "-20071001" );
    }
}
//

// mathextra.blade.BladeUtil
char [] wrapInQuotes(char [] instr)
{
    char [] str=`"`;
    foreach(char c; instr) {
        if (c=='"') str~=`\"`;
        else str~=c;
    }
    return str~ `"`;
}
//

V[K] uniqueKey(V, K)(V[K] t)
{
    static assert ( isStringType!(K), "type of " ~ typeof(K).stringof ~ " must be one of the string types" );

    V[K] result;
    bool garbage;
    foreach(k, v; t)
    {
        if(!k.length) continue;
        garbage = false;
        foreach(kk, vv; t)
        {
            if( k.length < kk.length && locatePattern(kk, k) != kk.length )
            {
              garbage = true;
              break;
            }
        }
        if(!garbage)
            result[k] = v;
    }
    return result;
}
//uniqueKey
debug( UnitTest ) unittest
{
    int[char[]] foo;
    foo["abc"c] = 0;
    foo["ab"c] = 0;
    foo["bc"c] = 0;
    foo[""c] = 0;
    foo = uniqueKey(foo);
    assert( ("ab"c in foo) is  null );
    assert( ("bc"c in foo) is  null );
    assert( (""c in foo) is null ) ;
    assert( ("abc"c in foo) !is null ) ;
}
//

/******************************************************************************

        Returns whether or not the provided array inside an instance
        of the given match

******************************************************************************/

bool insidePattern(T) (T[] src, T[] match)
{
    return match.length < src.length  &&  locatePattern (src, match) != src.length ;
}
debug unittest
{
    assert( insidePattern("abc", "a") );
    assert( insidePattern("abc", "b") );
    assert( insidePattern("abc", "c") );
    assert( !insidePattern("abc", "abc") );
    assert( !insidePattern("abc", "abcd") );
}
//

/**

*/
char[][] absUnique(char[][] src, char[] sep = ",")
{
    char[][] result;
    if(!src.length) return result;

    char[] tmp = tango.text.Util.join(src, sep);
    foreach(v; src)
    {
        if( Path.patternMatch(tmp, "*" ~ v ~ "[!" ~ sep ~ "]*") ||
            Path.patternMatch(tmp, "*[!" ~ sep ~ "]" ~ v ~ "*") )
            continue;
        else
            result ~= v;
    }
    return result;
}
debug( UnitTest ) unittest
{
    char[][] s = ["abc", "a", "b", "c", "ab", "bc"];
    assert( absUnique(s) == ["abc"] );
}
//

/******************************************************************************

        Returns whether or not the provided array contains an instance
        of the given match

******************************************************************************/

bool containsPatterns(T) (T[] src, T[] match, T[] sep = ",")
{
    T[][] amatch = delimit(match, sep);
    foreach(v; amatch)
        if( containsPattern(src, v) )
            return true;
    return false;
}
debug unittest
{
    assert( containsPatterns("abcd", "bb,abcd") == true );
    assert( containsPatterns("abcd", "bb,cc") == false );

}

/******************************************************************************

        Returns whether or not the provided array contains an instance
        of the given match

******************************************************************************/

bool containsPatterns(T) (T[] src, T[][] match)
{
    foreach(v; match)
        if( containsPattern(src, v) )
            return true;
    return false;
}
debug unittest
{
    assert( containsPatterns("abcd", ["bb", "abcd"]) == true );
    assert( containsPatterns("abcd", ["bb", "cc"]) == false );
}
//

char[] replacePart(char[] fullname, int i, char[] to, char[] separator)
{
    if(!fullname.length || !to.length || !separator.length)
        return fullname;

    fullname = replaceSeries(fullname, "\\\\", "\\", "//", "/"); //no more need if delimit has a removeEmptyEntries switch

	char[][] a = delimit(fullname, separator);
    if( abs(i) > (a.length - 1) )
        return fullname;
	if ( i < 0 ) i = a.length + i;
	a[i] = to;
    char[] j;
    j ~= separator[0];  //maby has multi separator, use first separator for join
	return join(a, j);
}
debug unittest
{
	char[] p = r"D:\a\b\c.txt";
	assert( replacePart(p, 0, "C:", "\\") == r"C:\a\b\c.txt" );
	assert( replacePart(p, -1, "d.txt", "\\") == r"D:\a\b\d.txt" );
	assert( replacePart(p, -3, "d", "\\") == r"D:\d\b\c.txt" );

	p = "/a/b/c.txt";
	assert( replacePart(p, 1, "d", "/") == r"/d/b/c.txt" );
	assert( replacePart(p, -1, "d.txt", "/") == r"/a/b/d.txt" );
}
//


char[] getPart(char[] fullname, int n, char[] separator)
{
	char[][] a = delimit(fullname, separator);
	if ( abs(n) > a.length - 1 )
		return fullname;
	if ( n > -1 )
		return a[n];
	else
		return a[a.length +n];
}
debug unittest
{
	char[] p = r"D:\a\b\\c.txt";
	assert( getPart(p, 0, "\\") == "D:" );
	assert( getPart(p, 1, "\\") == "a" );
	assert( getPart(p, -1, "\\") == "c.txt" );
	//assert( getPart(p, -2) == "b" );
}
//


/**********************************************
 * Insert sub[] into s[] at location index.
 */

char[] insert(char[] s, char[] sub, size_t distance = 1 )
in
{
    assert(0 <= distance && distance <= s.length);
}
body
{
    if (!sub.length)
        return s;

    if (!s.length)
        return sub;

    char[] result;
    for(size_t i= 0; i < s.length -1; i++)
    {
        result ~= s[i];
        if( i % distance == distance -1 )
            result ~= sub;
    }
    result ~= s[$-1];

    return result;
}
//insert
debug unittest
{
    assert( insert("abcd", " ") == "a b c d" );
    assert( insert("a", " ") == "a" );
    assert( insert("abcd", " ", 2) == "ab cd" );
    assert( insert("abcde", " ", 2) == "ab cd e" );

}
//

/**
    convert string to associate array
    e.g. "createdTime=20071027" to array["cretedTime"] = "20071027";
*/
T[] [T[]] strToAssoc(T = char)(T[] src, T[] separator, bool btrim = true)
{
    static assert( isCharType!(T), "wrong type : " ~ typeof(T).stringof );

    T[][] tmp = delimit!(T)(src, separator);
    T[] [T[]] result;

    if(tmp.length < 2)
        return result;
    T[] key     =   tmp[0];
    T[] value   =   tmp[1];

    if(btrim)
    {
        key     = tango.text.Util.trim(tmp[0]);
        value   = tango.text.Util.trim(tmp[1]);
    }
    if(key.length)
        result [ key ] = value;

    return result;
}
debug unittest
{
    char[] [char[]] s;
    s["createdTime"] = "20071027";
    foreach(k,v; strToAssoc("createdTime=20071027", "="))
        assert( s[k] == v );

}
//


/**
    convert string to associative array, K means Key, V means Value
    e.g. "a=A;b=B" to array["a"] = "A", array["b"] = "B";
*/
T[] [T[]] strToAssoc(T)(T[] src, T[] separatorA, T[] separatorB, bool btrim = true)
{
    static assert( isCharType!(T), "wrong type : " ~ typeof(T).stringof );

    T[][T[]] result;

    T[][] tmp = delimit!(T)(src, separatorA);
    foreach(ref v; tmp)
    {
        if(btrim)
            v = tango.text.Util.trim(v);

        T[][] temp = delimit(v, separatorB);
        if(temp.length < 2)
            continue;

        T[] key     = temp[0];
        T[] value   = temp[1];
        if(btrim)
        {
            key     = tango.text.Util.trim(key);
            value   = tango.text.Util.trim(value);
        }

        if(key.length && value.length)
            result[key] = value;

    }

    return result;
}
debug unittest
{
    char[] [char[]] s;
    s["host"] = "bbs.d-programming-language-china.org";
    s["publishUrl"] = "http://bbs.d-programming-language-china.org/thread-381-1.html";
    s["pid"] = "444";
    s["publishDate"] = "20070419";
    foreach(k,v; strToAssoc("host=bbs.d-programming-language-china.org;publishUrl=http://bbs.d-programming-language-china.org/thread-381-1.html;pid=444;publishDate=20070419;", ";", "="))
        assert(s[k] == v);

}
//

K[] assocToStr(K = char,V = char[])(V[K[]] src, K[] sepA, K[] sepB)
{
    static assert( isCharType!(K), "wrong type : " ~ typeof(K).stringof );
    if(!src.length)
        return null;

    char[] result;
    foreach(k,v; src)
    {
        static if( is(K[]==V) )
            result ~= k ~ sepB ~ v ~sepA;
        else
            result ~= k ~ sepB ~ to!(K[])(v) ~ sepA;
    }

    return result[0..$-sepA.length];
}

debug unittest
{
    char[] [char[]] array = ["name" : "ydb", "pass" : "god"];
    assert( assocToStr(array, "&", "=") == "pass=god&name=ydb" );

    int [char[]] array2 = ["name" : 1, "pass" : 2];
    assert( assocToStr(array2, "&", "=") == "pass=2&name=1" );
}



/******************************************************************************

        Trim the provided array by stripping whitespace from both
        ends. Returns a slice of the original content

        TODO : faild on trim \u3000

******************************************************************************/

T[] trimEx(T) (T[] src)
{
        T*   head = src.ptr,
             tail = head + src.length;

        while (head < tail && isSpaceEx(*head))
               ++head;

        while (tail > head && isSpaceEx(*(tail-1)))
               --tail;

        return head [0 .. tail - head];

}
debug unittest
{
    wchar[] s = "    　"; //space, \t, \u3000
    assert( trimEx(s) == "" );
}


/******************************************************************************

        Trim the provided array by stripping whitespace from both
        ends. Returns a slice of the original content

        TODO : faild on trim \u3000

******************************************************************************/

T[] trimlEx(T) (T[] src)
{
        T*   head = src.ptr,
             tail = head + src.length;

        while (head < tail && isSpaceEx(*head))
               ++head;

        return head [0 .. tail - head];
}
debug unittest
{
    wchar[] s = "    　hello";
    assert( trimlEx(s) == "hello" );
}

/******************************************************************************

        Trim the provided array by stripping whitespace from both
        ends. Returns a slice of the original content

        TODO : faild on trim \u3000

******************************************************************************/

T[] trimrEx(T) (T[] src)
{
        T*   head = src.ptr,
             tail = head + src.length;

        while (tail > head && isSpaceEx(*(tail-1)))
               --tail;

        return head [0 .. tail - head];
}
debug unittest
{
    wchar[] s = "hello   　";
    assert( trimrEx(s) == "hello" );
}

/******************************************************************************

        Is the argument a whitespace character?
        \u2028 line separator
        \u2029 paragraph separator
        \u3000 UTF SBC case

        TODO : faild on trim \u3000
******************************************************************************/

bool isSpaceEx(T) (T c)
{
        static if (T.sizeof is 1)
                   return (c <= 32 && (c is ' ' | c is '\t' | c is '\r' | c is '\n' | c is '\f'));
        else
           return (c <= 32 && (c is ' ' | c is '\t' | c is '\r' | c is '\n' | c is '\f')) || (c is '\u2028' | c is '\u2029' | c is '\u3000');
}
debug unittest
{
    wchar[] s;
    s ~= ' ';   //space
    s ~= '\t';  //\t
    s ~= '　';   //\u3000
    foreach(v; s)
        assert( isSpaceEx(v) );

}

/// convert text and url to HREF
T[] getHref(T)(T[] text, T[] url)
{
    return "<a href=\"" ~ url ~ "\">" ~ text ~ "</a>";
}

///get slice from string with begin identifier and end identifier
T[] getSlice(T=char)(T[] src, T[] begin, T[] end)
{
    static assert(isCharType!(T));

    auto b = locatePattern(src, begin);
    if(b == src.length)
        return null;

    auto e = locatePattern(src, end, b + begin.length);
    if(e == src.length )
        return null;

    return src[b .. e + end.length];
}
debug unittest
{
    char[] s = "abcded";
    assert(getSlice(s, "b", "d") == "bcd");
    assert(getSlice(s, "d", "b") is null);
    assert(getSlice(s, "f", "d") is null);
    assert(getSlice(s, "b", "f") is null);

}


///replace slice from string with begin identifier and end identifier
T[] substituteSlice(T=char)(T[] src, T[] begin, T[] end, T[] replaceWith)
{
    static assert(isCharType!(T));

    auto b = locatePattern(src, begin);
    if(b == src.length)
        return null;

    auto e = locatePattern(src, end, b + begin.length);
    if(e == src.length )
        return null;

    return src[0..b] ~ replaceWith ~ src[e + end.length .. $];
}
debug unittest
{
    char[] s = `I don't want to say "Goodbye"`;
    assert(substituteSlice(s, `"`, `"`, `"hello"`) == `I don't want to say "hello"`);

}
//


// get random lowercase letters
char[] randomLower(uint num)
{
    char[] result;
    char[] tmp = TextConst.Lower.dup;
    while( num-- > 0)
    {
        shuffle(tmp);
        result ~= tmp[0];
    }
    return result;
}
debug unittest
{
    assert( randomLower(0) is null );
    assert( randomLower(1).length is 1 );
    assert( randomLower(2).length is 2 );
}


char[] strTo256(char[] str, char[] sep = " ")
{
    char[3] tmp;
    char[] result;
    foreach(v; str)
        result ~= tango.text.convert.Integer.format(tmp, v, "u") ~ sep;

    return result.length ? result[0..$-sep.length] : null;
}
debug unittest
{
    assert( strTo256("abc", " ") == "97 98 99" );
    assert( strTo256("ABC", " ") == "65 66 67" );
}
//

/*
// TODO: Could not convert `6.00` of type char[] to type int.
char[] strToDecimal(char[] str, char[] sep = " ")
{
    if(!str.length) return null;
    return Scale( strTo256(str, sep), 256, 10, sep );
}
debug unittest
{
    assert( strToDecimal("AB", " ") == "1 6 7 0 6" );
}
*/

/*

*/
char[][] split(char[] str)
{
    char[][] result;
    foreach(v; str)
        result ~= "" ~ v;
    return result;
}
debug unittest
{
    auto str = "abcd";
    auto arr = split(str);
    assert( arr.length == str.length );
    assert( arr[0] == "a" );
    assert( arr[3] == "d" );

}

/** Return true if text is a D keyword
 */
// mathextra.blade.SyntaxTree
bool isDkeyword(char[] text) {

    char [][] dkeywords = [ "abstract", "alias", "align", "asm", "assert",
    "auto", "body", "bool", "break", "byte", "case", "cast", "catch",
    "cdouble", "cent", "cfloat", "char", "class", "const", "continue",
    "creal", "dchar", "debug", "default", "delegate", "delete", "deprecated",
    "do", "double", "else", "enum", "export", "extern", "false", "final",
    "finally", "float", "for", "foreach", "foreach_reverse", "function",
    "goto", "idouble", "if", "ifloat", "import", "in", "inout", "int",
    "interface", "invariant", "ireal", "is", "lazy", "long", "macro", "mixin",
    "module", "new", "null", "out", "override", "package", "pragma", "private",
    "protected", "public", "real", "ref", "return", "scope", "short", "static",
    "struct", "super", "switch", "synchronized", "template", "this", "throw",
    "__traits", "true", "try", "typedef", "typeid", "typeof", "ubyte", "ucent",
    "uint", "ulong", "union", "unittest", "ushort",  "version", "void",
    "volatile", "wchar", "while", "with" ];

    foreach(char [] s; dkeywords) {
        if (s==text) return true;
    }
    return false;
}


/// Date: 2008 09 07 
char[] firstCharToUpperCase(char[] str)
{
    char[] tmp = str.dup;
    tmp = tango.text.Util.trim(tmp);
    if(!tmp.length) return tmp;
    if(tmp[0] > 0x60 && tmp[0] < 0x7B)
        tmp[0] -= 32;
    for(size_t i=1; i< tmp.length-1; i++)
    {
        if(tmp[i] == 0x20)
        {
            if(tmp[i+1] > 0x60 && tmp[i+1] < 0x7B)
            {
                tmp[i+1] -= 32;
                ++i;
            }
        }
    }
    return tmp;
}
unittest 
{
    assert(firstCharToUpperCase("a") == "A");
    assert(firstCharToUpperCase("bc") == "Bc");
    assert(firstCharToUpperCase("cd ef") == "Cd Ef");
    assert(firstCharToUpperCase("gh  ij") == "Gh  Ij");
    assert(firstCharToUpperCase("kL  MN") == "KL  MN");
}


public bool startsWith(T)( T[] src, T[] pattern ){
    if( src.length < pattern.length ){
        return false;
    }
    return src[ 0 .. pattern.length ] == pattern;
}


public bool endsWith(T)(T[] src, T[] pattern ){
    if( src.length < pattern.length ){
        return false;
    }
    return src[ $-pattern.length .. $ ] == pattern;
}

public bool enclosedWith(T)(T[] src, T[] pattern ){
    if( src.length < (pattern.length * 2) ){
        return false;
    }
    return src[ 0 .. pattern.length ] == pattern && src[ $-pattern.length .. $ ] == pattern;
}

public bool enclosedWithQuote(T)(T[] src){
    if( src.length < 2 )
        return false;
    return (src[0] is '\'' && src[$-1] is '\'') || (src[$-1] is '"' && src[$-1] is '"');
}

T[] stripQuote(T)(T[] src) {
    if(src.length >2)
        if( (src[0] is '\'' && src[$-1] is '\'') || (src[$-1] is '"' && src[$-1] is '"') )
            src = src[1..$-1];
    return src;
}
version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
