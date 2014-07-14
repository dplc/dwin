/+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 +  $(CASHEW_JSON_HEAD)
 +/
module ydb.cashew.json .Value ;

/+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 +  Phobos not currently supported.
 +/
version (Tango) {} else {
    static assert(false, "CashewJSON: Phobos not currently supported.");
}

/+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 +  Imports
 +/
public import ydb.cashew.json .Exception ;

private import ydb.cashew.json  .Parser   ;
private import ydb.cashew.utils .Array    ;

static import Float = tango .text .convert .Float   ;
static import Int   = tango .text .convert .Integer ;

/+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 +  JSON Data Types
 +/
public enum JsonType {
    Null    , /// keyword 'null'
    Object  , /// a JSON _Object
    Array   , /// a JSON _Array
    String  , /// a JSON _String
    Bool    , /// keywords 'true' and 'false'
    Int     , /// an integral number
    Float   , /// a floating-point number
    Unknown   //  unknown type, used for sanity testing
}

/+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 +  Name Strings for JSON Data Types
 +/
public const char[][JsonType] JsonTypeStrings ;

static this () {
    JsonTypeStrings = [
        JsonType.Null    : "Null"[]  ,
        JsonType.Object  : "Object"  ,
        JsonType.Array   : "Array"   ,
        JsonType.String  : "String"  ,
        JsonType.Bool    : "Bool"    ,
        JsonType.Int     : "Int"     ,
        JsonType.Float   : "Float"   ,
        JsonType.Unknown : "Unknown" 
    ];
}

/+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 +  Convenience aliases
 +/
public alias JsonValue[dchar[]]  JsonObject ;
public alias JsonValue[]         JsonArray  ; /// ditto
public alias dchar[]             JsonString ; /// ditto
public alias bool                JsonBool   ; /// ditto
public alias long                JsonInt    ; /// ditto
public alias double              JsonFloat  ; /// ditto

/+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 +  A JSON Value
 +/
final class JsonValue {

    /+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     +  Wrapper for the JSON parser
     +/
    public static JsonValue parse (dchar[] source) {
        scope parser = new JsonParser ;

        return parser.run(source);
    }

    /// ditto
    public static JsonValue parse (wchar[] source) {
        scope parser = new JsonParser ;
        
        return parser.run(source);
    }
    
    /// ditto
    public static JsonValue parse (char[] source) {
        scope parser = new JsonParser ;
        
        return parser.run(source);
    }

    /+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     +  
     +/
    public static JsonObject dupObject (JsonObject source) {
        JsonObject dest ;

        foreach (key, value; source) {
            dest[key.dup] = value.dup;
        }
        return dest;
    }

    /+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     +  
     +/
    public static JsonArray dupArray (JsonArray source) {
        JsonArray dest = new JsonArray(source.length) ;

        foreach (index, elem; source) {
            dest[index] = elem.dup;
        }
        return dest;
    }

    /+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     +  
     +/
    private static void wrongType (JsonType found, JsonType expected) {
        throw new JsonWrongTypeException(
            JsonTypeStrings[found], JsonTypeStrings[expected]
        );
    }

    /+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     +  Constructor
     +/
    public this (JsonType t = JsonType.Null) {
        _type = t;

        switch (_type) {
            case JsonType.Null   :                       break;
            case JsonType.Object : _o.length           ; break;
            case JsonType.Array  : _a.length = 0       ; break;
            case JsonType.String : _s        = ""d.dup ; break;
            case JsonType.Bool   : _b        = false   ; break;
            case JsonType.Int    : _i        = 0       ; break;
            case JsonType.Float  : _f        = 0.0     ; break;

            default:
                throw new JsonUnknownTypeException(_type);
        }
    }

    public this (JsonObject value) { opAssign(value); } /// ditto
    public this (JsonArray  value) { opAssign(value); } /// ditto
    public this (JsonString value) { opAssign(value); } /// ditto
    public this (JsonBool   value) { opAssign(value); } /// ditto
    public this (JsonInt    value) { opAssign(value); } /// ditto
    public this (JsonFloat  value) { opAssign(value); } /// ditto

    /+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     +  Get type
     +/
    public JsonType type () {
        return _type;
    }

    /+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     +  Get name of type
     +/
    public char[] typeString () {
        return JsonTypeStrings[_type];
    }

    /+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     +  Get raw value as the specified JSON type.  Note that any of the times String,
     +  Bool, Int, or Float may be retrieved as a String, and that both Bool and Int may
     +  be retrieved as a Bool.
     +/
    public JsonObject asObject () {
        assertType(JsonType.Object);
        return dupObject(_o);
    }

    /// ditto
    public JsonArray asArray () {
        assertType(JsonType.Array);
        return dupArray(_a);
    }

    /// ditto
    public JsonString asString () {
        JsonString result ;

        switch (_type) {
            case JsonType.String : result = _s.dup                  ; break;
            case JsonType.Bool   : result = _b ? "true"d : "false"d ; break;
            case JsonType.Int    : result = Int.toString32(_i)      ; break;
            case JsonType.Float  : result = Float.toString32(_f)    ; break;

            default:
                wrongType(_type, JsonType.String);
        }
        return result;
    }

    /// ditto
    public JsonBool asBool () {
        JsonBool result ;

        switch (_type) {
            case JsonType.Bool : result = _b      ; break;
            case JsonType.Int  : result = _i != 0 ; break;

            default:
                wrongType(_type, JsonType.Bool);
        }
        return result;
    }

    /// ditto
    public JsonInt asInt () {
        assertType(JsonType.Int);
        return _i;
    }

    /// ditto
    public JsonFloat asFloat () {
        assertType(JsonType.Float);
        return _f;
    }

    /+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     +  
     +/
    public JsonValue dup () {
        auto result = new JsonValue ;

        switch (_type) {
            case JsonType.Null   :               break;
            case JsonType.Object : result = _o ; break;
            case JsonType.Array  : result = _a ; break;
            case JsonType.String : result = _s ; break;
            case JsonType.Bool   : result = _b ; break;
            case JsonType.Int    : result = _i ; break;
            case JsonType.Float  : result = _f ; break;

            debug {
                default:
                    assert(false, ".dup() with unknown type");
            }
        }
        return result;
    }

    /+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     +  
     +/
    public size_t length () {
        size_t result ;

        switch (_type) {
            case JsonType.Object : result = _o.length ; break;
            case JsonType.Array  : result = _a.length ; break;

            default:
                result = 0u;
        }
        return result;
    }

    /+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     +  
     +/
    public int opApply (int delegate (ref JsonString, ref JsonValue) dg) {
        int result ;

        assertType(JsonType.Object);
        foreach (key, ref value; _o) {
            result = dg(key, value);
            if (result != 0) {
                break;
            }
        }
        return result;
    }

    /+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     +  
     +/
    public int opApply (int delegate (ref JsonValue) dg) {
        int result ;

        assertType(JsonType.Array);
        foreach (ref elem; _a) {
            result = dg(elem);
            if (result != 0) {
                break;
            }
        }
        return result;
    }

    /+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     +  Index operator
     +/
    public JsonValue opIndex (JsonString key) {
        JsonValue result ;
        
        assertType(JsonType.Object);
        if (auto ptr = key in _o) {
            result = ptr.dup;
        }
        return result;
    }

    /// ditto
    public JsonValue opIndexAssign (JsonValue value, JsonString key) {
        assertType(JsonType.Object);
        _o[key.dup] = value.dup;
        return this;
    }

    /// ditto
    public JsonValue opIndex (size_t index) {
        assertBounds(index);
        return _a[index];
    }

    /// ditto
    public JsonValue opIndexAssign (JsonValue value, size_t index) {
        assertBounds(index);
        _a[index] = value.dup;
        return this;
    }

    /+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     +  
     +/
    public JsonValue opCatAssign (JsonValue value) {
        assertType(JsonType.Array);
        _a ~= value;
        return this;
    }

    /+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     +  Assignment operator
     +/
    public JsonValue opAssign (JsonObject value) {
        _type = JsonType.Object;
        _o = dupObject(value);
        return this;
    }

    /// ditto
    public JsonValue opAssign (JsonArray value) {
        _type = JsonType.Array;
        _a = dupArray(value);
        return this;
    }

    /// ditto
    public JsonValue opAssign (JsonString value) {
        _type = JsonType.String;
        _s = value.dup;
        return this;
    }

    /// ditto
    public JsonValue opAssign (JsonBool value) {
        _type = JsonType.Bool;
        _b = value;
        return this;
    }

    /// ditto
    public JsonValue opAssign (JsonInt value) {
        _type = JsonType.Int;
        _i = value;
        return this;
    }

    /// ditto
    public JsonValue opAssign (JsonFloat value) {
        _type = JsonType.Float;
        _f = value;
        return this;
    }

    /+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     +  Set to null value.
     +/
    public JsonValue toNull () {
        _type = JsonType.Null;
        return this;
    }

    /+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     +  Dump JSON data to a file.
     +/
    public dchar[] encode (dchar[] indent = ""d, bool inline = true) {
        dchar[]
            result = (inline ? indent.dup : ""d) ;
        
        dchar[] escape (dchar[] str) {
            dchar[]
                result ;
            
            foreach (c; str) {
                switch (c) {
                    case '"'  : result ~= `\"`d ; break;
                    case '\\' : result ~= `\\`d ; break;
                    case '\b' : result ~= `\b`d ; break;
                    case '\n' : result ~= `\n`d ; break;
                    case '\r' : result ~= `\r`d ; break;
                    case '\f' : result ~= `\f`d ; break;
                    case '\t' : result ~= `\t`d ; break;

                    default:
                        if (c < 32) {
                            //result ~= `\u00` ~ Int.toString32(Int.Style.Hex);
                            result ~= `\u00` ~ Int.toString32(c, "x");
                        }
                        else {
                            result ~= c;
                        }
                }
            }
            return result;
        }
            
        switch (_type) {
            case JsonType.Null:
                result ~= "null"d ;
                break;
            
            case JsonType.Object:
                if (_o.length == 0u) {
                    result ~= "{}"d ;
                }
                else {
                    result ~= "{"d;
                    foreach (key, value; _o) {
                        result ~= "\n"d ~ indent ~ `    "`d ~ escape(key) ~ `": `d;
                        result ~= value.encode(indent ~ `    `d, false);
                        result ~= `,`d;
                    }
                    result.length = result.length - 1;
                    result ~= "\n"d ~ indent ~ "}"d;
                }
                break;
            
            case JsonType.Array:
                if (_a.length == 0u) {
                    result ~= "[]"d;
                }
                else {
                    result ~= `[`d;
                    foreach (ref value; _a) {
                        result ~= "\n"d ~ value.encode(indent ~ `    `d) ~ `,`d;
                    }
                    result.length = result.length - 1;
                    result ~= "\n"d ~ indent ~ `]`d;
                }
                break;
            
            case JsonType.String:
                result ~= `"`d ~ escape(_s) ~ `"`d;
                break;

            case JsonType.Bool :
            case JsonType.Int  :
            case JsonType.Float:
                result ~= asString();
                break;
            
            default:
                throw new JsonUnknownTypeException(_type);
        }
        
        return result;
    }

    /+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     +  Private fields
     +/
    private {
        JsonType  _type  ;

        union {
            JsonObject _o ;
            JsonArray  _a ;
            JsonString _s ;
            JsonBool   _b ;
            JsonInt    _i ;
            JsonFloat  _f ;
        }
    }

    /+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     +  
     +/
    private void assertType (JsonType expected) {
        if (_type != expected) {
            wrongType(_type, expected);
        }
    }

    private void assertBounds (size_t index) {
        assertType(JsonType.Array);
        if (index >= _a.length) {
            throw new JsonArrayBoundsException(index, _a.length);
        }
    }

} // class JsonValue

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
