
// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: Feb 2008

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module ydb.bridge.php.Preg;

public import   ydb.bridge.php.Array,
                ydb.bridge.php.String;

private import  dwin.text.pcre.RegExp,
                dwin.text.Util,
                dwin.io.Digest;
    
private import  tango.text.Unicode,
                tango.util.Convert;

private import  tango.util.log.Trace;

private import  Integer = tango.text.convert.Integer;
private import  Util = tango.text.Util;
    
   
enum
{
    PREG_SPLIT_NO_EMPTY ,
    //如果设定了本标记，则 preg_split() 只返回非空的成分。 
    
    PREG_SPLIT_DELIM_CAPTURE ,
    //如果设定了本标记，定界符模式中的括号表达式也会被捕获并返回。本标记添加于 PHP 4.0.5。
    
    PREG_SPLIT_OFFSET_CAPTURE 
    //如果设定了本标记，如果设定本标记，对每个出现的匹配结果也同时返回其附属的字符串偏移量。注意这改变了返回的数组的值，使其中的每个单元也是一个数组，其中第一项为匹配字符串，第二项为其在 subject 中的偏移量。本标记自 PHP 4.3.0 起可用。     
    
}




char[] preg_replace(char[] pattern , char[] replacement , char[] subject, int limit = int.max, int compileOptions = PCRE_UTF8)
{
    scope regexp = new RegExp(pattern, compileOptions);
    return regexp.replace(subject, replacement);
}
debug unittest
{
    char[] str = "April 15, 2003";
    char[] pattern = r"(\w+) (\d+), (\d+)";
    char[] replacement = r"\g(1)1,\3";
    //auto result = preg_replace(pattern, replacement, str, int.max, PCRE_CASELESS);
    //Trace.formatln(result);
    assert ( preg_replace(pattern, replacement, str, int.max, PCRE_CASELESS) == "April1,2003");    
}
//

char[] preg_replace_callback (char[] pattern , char[] delegate(RegMatch matches) callback , char[] subject, int limit = int.max, int compileOptions = PCRE_UTF8)
{
    scope regexp = new RegExp(pattern, compileOptions);
    return regexp.replace(subject, callback);    
}
debug unittest
{
    // 此文本是用于 2002 年的，
    // 现在想使其能用于 2003 年
    
    char[] text =   "April fools day is 04/01/2002\n"
                    "Last christmas was 12/24/2001\n";

    // 回调函数
    char[] next_year(RegMatch matches) {
        // 通常：$matches[0] 是完整的匹配项
        // $matches[1] 是第一个括号中的子模式的匹配项
        // 以此类推
        return matches[1] ~ dwin.text.Util.itoa( to!(int)(matches[2]) + 1 );
    }

    auto result = preg_replace_callback(
              r"(\d{2}/\d{2}/)(\d{4})",
              &next_year,
              text);
    //Trace.formatln(result);
    assert(result ==    "April fools day is 04/01/2003\n"
                        "Last christmas was 12/24/2002\n");
    
      // 结果为：
      // April fools day is 04/01/2003
      // Last christmas was 12/24/2002
}





/// todo : flags not implement
int preg_match (char[] pattern , char[] subject)
{
    scope regexp = new RegExp(pattern, PCRE_UTF8);
    auto matches = regexp.execute(subject);
    return matches ? 1 : 0;
}

/// todo : flags not implement
int preg_match (char[] pattern , char[] subject, ref RegMatch matches, int flags = 0, int compileOptions = PCRE_UTF8)
{
    scope regexp = new RegExp(pattern, compileOptions);
    matches = regexp.execute(subject);
    return matches ? 1 : 0;
}

/**
    fix this, this pattern not got result:
        preg_split(r"(?<!^)(?!$)", "mailto:abcd@efgh.com")
    返回一个数组，包含 subject 中沿着与 pattern 匹配的边界所分割的子串。 

    如果指定了 limit ，则最多返回 limit 个子串，如果 limit 是 -1，则意味着没有限制，可以用来继续指定可选参数 flags 。 

*/
char[][] preg_split ( char[] pattern , char[] subject , int limit = -1 , int flags = PREG_SPLIT_NO_EMPTY, int compileOptions = PCRE_UTF8)
{
    if(!subject.length || !pattern.length) 
        return null;
    
    char[][] result;
    if(limit == 1)
    {
        result ~= subject;
        return result;
    }
    
    scope regexp = new RegExp(pattern, compileOptions);

    auto iter = regexp.iterate(subject);
    size_t start;
    foreach(RegMatch m; iter)
    {
        if(limit != -1)
        {
            if(flags == PREG_SPLIT_NO_EMPTY && result.length >= limit -1 )
                break;
            if(flags == PREG_SPLIT_DELIM_CAPTURE && result.length / 2 >= limit -1 )
                break;
        }

        char[] part = subject[start..m.start];
        switch (flags)
        {
            case PREG_SPLIT_NO_EMPTY:
                if(part.length)
                    result ~= part;
                break;
            case PREG_SPLIT_DELIM_CAPTURE:
                result ~= part;
                result ~= m.group;
                break;
            default:
        }
        start = m.end;
    }
    if(!start)
        result ~= subject;
    else
        result ~= subject[start .. $];
    
    
    /*
    auto result =  regexp.split(subject);
    if(!result.length) 
        return result;
    
    if(limit != -1 && limit < result.length)
        result.length = limit;
    
    char[][] result2;
    if(flags == PREG_SPLIT_NO_EMPTY)
    {
        foreach(v; result)
            if(v.length)
                result2 ~= v;
        return result2;
    }
    */
    return result;
}
debug unittest
{
    // split the phrase by any number of commas or space characters,
    // which include " ", \r, \t, \n and \f
        char[] str = "hypertext language, programming";
        auto keywords = preg_split (r"[\s,]+", str);  
        assert ( keywords.length == 3 && keywords[0] == "hypertext" );
        assert ( keywords[1] == "language" );
        assert ( keywords[2] == "programming" );    
        
        keywords = preg_split (r"[\s,]+", str, 2);  
        assert ( keywords.length == 2 && keywords[0] == "hypertext" );
        assert ( keywords[1] == "language, programming" );
        
        keywords = preg_split (r"[\s,]+", str, 1);  
        assert ( keywords.length == 1 && keywords[0] == str );

        auto result = preg_split("(,)", "1,2,3,4", -1 ,PREG_SPLIT_DELIM_CAPTURE );        
        assert( result.length == 7 && result[0] == "1" && result[1] == "," && result[6] == "4");

        result = preg_split("(,)", "1,2,3,4", 3 ,PREG_SPLIT_DELIM_CAPTURE );        
        assert( result.length == 5 && result[0] == "1" && result[1] == "," && result[4] == "3,4");
        
    
}
//


char[] preg_quote ( char[] str , char[] delimiter = null )
{
    
    //char[] escape_chars = "\`*_{}[]()>#+-.!";
    char[] escapes = r".\+*?[^]$(){}=!<>|:";
    if(delimiter)
        escapes ~= delimiter;
    
    char[] result;
    foreach(v; str)
    {
        if( Util.contains(escapes, v) )
            result ~= r"\" ~ v;
        else
            result ~= v;
    }
    
    return result;
}
debug unittest
{
    char[] keywords = "$40 for a g3/400";
    keywords = preg_quote(keywords, "/");
    assert ( keywords == r"\$40 for a g3\/400") ;
}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
