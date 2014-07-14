/*****************************************************************************************
 *  $(CASHEW_JSON_HEAD)
 */
module ydb.cashew.json .Exception ;

/*****************************************************************************************
 *  Imports.
 */
private import tango  .core .Exception ;

static import Int = tango .text .convert .Integer ;

/*****************************************************************************************
 *  Root class for all CashewJSON exceptions.
 */
abstract class JsonException : Exception {
    this (char[] msg) {
        super("CashewJSON: " ~ msg);
    }
}

/*****************************************************************************************
 *  Unknown type exception.
 */
class JsonUnknownTypeException : JsonException {
    this (int t) {
        super("Unknown type: " ~ Int.toString(t));
    }
}

/*****************************************************************************************
 *  Wrong type for operation exception.
 */
class JsonWrongTypeException : JsonException {
    this (char[] found, char[] expected) {
        super("Found " ~ found ~ " when expecting " ~ expected);
    }
}

/*****************************************************************************************
 *  Index out of bounds exception, for JSON Arrays.
 */
class JsonArrayBoundsException : JsonException {
    this (size_t index, size_t length) {
        super(
            "Index " ~
            Int.toString(index) ~
            " exceeds length " ~
            Int.toString(length)
        );
    }
}

/*****************************************************************************************
 *  JSON source syntax error.
 */
class JsonSyntaxException : JsonException {
    this (size_t line, char[] msg) {
        super(
            "Syntax error, line " ~
            Int.toString(line) ~
            ": " ~
            msg
        );
    }
}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
