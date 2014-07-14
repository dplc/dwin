/*****************************************************************************************
 *  CashewCGI: Utility to URL encode/decode strings.
 *
 *  $(CASHEW_HEAD)
 *
 *  Version: 0.2.1
 *
 *  Authors:
 *    Christopher Nicholson-Sauls, initial version
 *
 *  Date: Jan 26, 2008
 */
module ydb.cashew.cgi .UrlEncode ;

/*****************************************************************************************
 *  Imports and externals.
 */
private import ydb.cashew.utils .Array  ;

version (Tango) {
    static import CType   = tango .stdc          .ctype   ;
    static import Text    = tango .text          .Util    ;
    static import Integer = tango .text .convert .Integer ;

    private alias Text.split splitFunc ;
}
else {
    static import CType = std .ctype  ;
    static import         std .string ;

    private alias std.string.split splitFunc ;
}

/*****************************************************************************************
 *  
 */
char[] encode (char[] src) {
    char[] result ;
    char[] hex    ;

    foreach (x; src) {
        if (CType.isalnum(x)) {
            result ~= x;
        }
        else {
            version (Tango) {
                result ~= Integer.toString(cast(long) x, "X");
            }
            else {
                result ~= std.string.format("%%%2X", x);
            }
        }
    }
    return result;
}

/*****************************************************************************************
 *  
 */
char[] decode (char[] src) {
    char   c      ;
    char[] result ;

    for (size_t i = 0_U; i < src.length; ++i) {
        c = src[i];
        if (c == '%') {
            c = 0;
            
            version (Tango) {
                c = Integer.convert(src[i + 1 .. i + 2], 16_U);
            }
            else {
                c += std.string.hexdigits.indexOf(src[i + 1]) * 16 ;
                c += std.string.hexdigits.indexOf(src[i + 2])      ;
            }

            i += 2;
        }
        result ~= c;
    }
    return result;
}

/*****************************************************************************************
 *  
 */
char[] encodeQuery (char[][char[]] src, bool escapeGlue = true) {
    char[] result                                ;
    char[] glue   = escapeGlue ? r"&amp;" : r"&" ;

    foreach (i, x; src) {
        result ~= i.encode() ~ "=" ~ x.encode() ~ glue;
    }
    result.reat(glue.length);
    return result;
}

/*****************************************************************************************
 *  
 */
char[][char[]] decodeQuery (char[] src) {
    size_t         eq     ;
    char[][char[]] result ;

    foreach (x; splitFunc(src, r"&")) {
        eq = x.indexOf('=');
        result[x[0 .. eq].decode()] = x[eq + 1 .. $].decode();
    }
    return result;
}

/*****************************************************************************************
 *  
 */
char[] encodeArgs (char[][] src) {
    return src
        .collect((char[] arg) { return arg.encode(); })
        .join("+")
    ;
}

/*****************************************************************************************
 *  
 */
char[][] decodeArgs (char[][] src) {
    auto result = src.dup ;

    foreach (inout x; result) {
        x = x.decode();
    }
    return result;
}

/*****************************************************************************************
 *  
 */
char[][] decodeArgs (char[] src) {
    return decodeArgs(splitFunc(src, "+"));
}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
