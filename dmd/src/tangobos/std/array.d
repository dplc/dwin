module std.array;
import std.compat;

public import tango.core.Exception;

class ArrayBoundsError : Error {
    this(char[] msg, Exception next = null)
    { super(msg, next); }
    
    this(char[] msg, char[] file, size_t line, Exception next = null)
    { super(msg, file, line, next); }
    
    this(char[] file, size_t line, Exception next = null)
    { super("Array bounds error", file, line, next); }
}
