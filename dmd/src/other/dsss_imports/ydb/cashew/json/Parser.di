/+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 +  $(CASHEW_JSON_HEAD)
 +/
module ydb.cashew.json .Parser ;

/+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 +  Imports
 +/
private import ydb.cashew.json  .Value ;

static import Uni   = tango .text          .Unicode ;
static import Text  = tango .text          .Util    ;
static import Float = tango .text .convert .Float   ;
static import Int   = tango .text .convert .Integer ;
static import Utf   = tango .text .convert .Utf     ;

debug {
    import tango .io .Stdout ;
}

/+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 +  
 +/
final class JsonParser {

    /+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     +  
     +/
    private static enum {
        TOK_NONE     , // 00 // 
        TOK_LBRACE   , // 01 // '{'
        TOK_RBRACE   , // 02 // '}'
        TOK_LBRACKET , // 03 // '['
        TOK_RBRACKET , // 04 // ']'
        TOK_COLON    , // 05 // ':'
        TOK_COMMA    , // 06 // ','
        TOK_STRING   , // 07 // '"' ... '"'
        TOK_INT      , // 08 // 123
        TOK_FLOAT    , // 09 // 3.14e+10
        TOK_BOOL     , // 10 // 'true' | 'false'
        TOK_NULL     , // 11 // 'null'
        TOK_EOF        // 12 // 'eof'
    }

    /+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     +  
     +/
    private static const dchar EOF = dchar.init ;

    /+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     +  
     +/
    private static union TokenValue {
        JsonString s ;
        JsonBool   b ;
        JsonInt    i ;
        JsonFloat  f ;
    }

    /+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     +  Constructor
     +/
    public this () {
    }

    /+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     +  
     +/
    public JsonValue run (dchar[] src) {
        source = src ~ EOF;
        
        return parse();
    }

    /// ditto
    public JsonValue run (wchar[] src) {
        return run(Utf.toString32(src));
    }

    /// ditto
    public JsonValue run (char[] src) {
        return run(Utf.toString32(src));
    }

    /+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     +  
     +/
    private JsonValue parse (int pretok = TOK_NONE) {
        int       tok    ;
        JsonValue result ;

        tok = pretok == TOK_NONE ? lex() : pretok;
        switch (tok) {
            // Object
            case TOK_LBRACE :
                JsonString key ;

                result = new JsonValue(JsonType.Object);

                while (true) {
                    tok = lex();

                    // key
                    if (tok == TOK_STRING) {
                        key = tokValue.s;
                    }
                    else {
                        error("object keys must be strings/identifiers");
                    }

                    // colon
                    tok = lex();
                    if (tok != TOK_COLON) {
                        error("expected ':' after key");
                    }

                    // value
                    result[key] = parse();

                    // comma or end of object
                    tok = lex();
                    if (tok == TOK_COMMA) {
                        continue;
                    }
                    if (tok == TOK_RBRACE) {
                        break;
                    }
                    error("expected ',' or '}' after key/value pair");
                }
                break;

            // Array
            case TOK_LBRACKET :
                result = new JsonValue(JsonType.Array);
                tok = lex();

              L_start:
                if (tok == TOK_RBRACKET) {
                    goto L_end;
                }

              L_elem:
                result ~= parse(tok);
                tok = lex();
                if (tok == TOK_COMMA) {
                    tok = lex();
                    goto L_elem;
                }
                goto L_start;

              L_end:
                break;

            // String
            case TOK_STRING :
                result = new JsonValue(tokValue.s);
                break;

            // Int
            case TOK_INT :
                result = new JsonValue(tokValue.i);
                break;

            // Float
            case TOK_FLOAT :
                result = new JsonValue(tokValue.f);
                break;

            // 'true', 'false'
            case TOK_BOOL :
                result = new JsonValue(tokValue.b);
                break;

            // 'null'
            case TOK_NULL :
                result = new JsonValue(JsonType.Null);
                break;

            // oops!?
            default:
                error("malformed JSON value");
        }

        return result;
    }

    /+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     +  
     +/
    private int lex () {
        int      t         ;
        dchar    c   = ' ' ;
        dchar[]  buf       ;

        dchar getch () {
            if (c == EOF) {
                error("Premature EOF");
            }
            c = source[index] ;
            ++index;
            return c;
        }

        void ungetch () {
            --index;
        }

        void lexDigits () {
            do {
                buf ~= c;
                c = getch();
            } while (Uni.isDigit(c));
        }

        while (true) {
            getch();

            // skip whitespace
            // count lines
            if (Uni.isWhitespace(c)) {
                if (c == '\n') {
                    ++line;
                }
                continue;
            }

            // String
            else if (c == '"') {
                bool inEsc = false;
                
                while (true) {
                    getch();
                    if (inEsc) {
                        switch(c) {
                            case '"' : c = '"' ; break;
                            case '\\': c = '\\'; break;
                            case '/' : c = '/' ; break;
                            case 'b' : c = '\b'; break;
                            case 'f' : c = '\f'; break;
                            case 'n' : c = '\n'; break;
                            case 'r' : c = '\r'; break;
                            case 't' : c = '\t'; break;
                            case 'u' : {
                                // 4 hex digits
                                size_t val=0;
                                for(size_t i=0;i<4; i++) {
                                    val <<= 4;
                                    getch();
                                    if (c >= '0' && c <= '9') {
                                        val += c-'0';
                                    }
                                    else if (c >= 'a' && c <= 'f') {
                                        val += 10 + c-'a';
                                    }
                                    else if (c >= 'A' && c <= 'F') {
                                        val += 10 + c-'A';
                                    }
                                    else if (c == EOF) {
                                        error("unterminated string literal");
                                    }
                                    else {
                                        error("Non hex digit inside \\uXXXX escape sequence");
                                    }
                                }
                                c = cast(dchar)val;
                            }
                            break;
                        
                            default:
                                // TODO: handle more escape codes
                                error("Illegal JSON escape sequence");
                            }
                        buf ~= c;
                        inEsc = false;
                    }
                    else {
                        if (c == '\\') {
                            inEsc = true;
                            continue;
                        }
                        else if (c == '"') {
                            tokValue.s = buf;
                            return TOK_STRING;
                        }
                        else if (c == EOF) {
                            error("unterminated string literal");
                        }
                        else {
                            if (c == '\n') {
                                ++line;
                            }
                            buf ~= c;
                        }
                    }
                }
            }

            // Number
            else if (Uni.isDigit(c) || c == '-' || c == '+') {
                // int
                t = TOK_INT;
                lexDigits();
                
                // frac
                if (c == '.') {
                    t = TOK_FLOAT;
                    lexDigits();
                }

                // exp
                if (c == 'e' || c == 'E') {
                    t = TOK_FLOAT;
                    buf ~= c;
                    getch();
                    if (c == '+' || c == '-') {
                        buf ~= c;
                        getch();
                    }
                    if (Uni.isDigit(c)) {
                        lexDigits();
                    }
                    else {
                        error("empty exponent");
                    }
                }

                if (t == TOK_INT) {
                    tokValue.i = Int.toLong(buf);
                }
                else {
                    tokValue.f = Float.parse(buf);
                }
                ungetch();
                return t;
            }

            // Bool, Null, ID
            else if (Uni.isLetter(c)) {
                do {
                    buf ~= c;
                    getch();
                } while (Uni.isLetterOrDigit(c) || c == '_');
                ungetch();

                switch (buf) {
                    case "true"d  :
                    case "false"d :
                        t = TOK_BOOL;
                        tokValue.b = (buf == "true"d);
                        break;
                    
                    case "null"d :
                        t = TOK_NULL;
                        break;

                    default:
                        t = TOK_STRING;
                        tokValue.s = buf;
                }

                return t;
            }

            // Punctuation symbols
            switch (c) {
                case '{' : return TOK_LBRACE   ;
                case '}' : return TOK_RBRACE   ;
                case '[' : return TOK_LBRACKET ;
                case ']' : return TOK_RBRACKET ;
                case ':' : return TOK_COLON    ;
                case ',' : return TOK_COMMA    ;

                default:
            }

            // EOF
            if (c == EOF) {
                return TOK_EOF;
            }

            break;
        } // forever loop

        return TOK_NONE;
    } // lex()

    /+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     +  
     +/
    private void error (char[] msg) {
        throw new JsonSyntaxException(line, msg);
    }

    /+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     +  
     +/
    private size_t      line     = 1 ;
    private size_t      index        ;
    private dchar[]     source       ;
    private TokenValue  tokValue     ;

}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
