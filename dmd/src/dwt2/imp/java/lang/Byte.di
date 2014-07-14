module java.lang.Byte;

import java.lang.util;
import java.lang.exceptions;
import java.lang.Number;

version(Tango){
    static import tango.text.convert.Integer;
} else { // Phobos
}
class Byte : Number {
    public static const byte MIN_VALUE = byte.min;
    public static const byte MAX_VALUE = byte.max;
    private byte value;

    public static byte parseByte( String s ){
        version(Tango){
            try{
                int res = tango.text.convert.Integer.parse( s );
                if( res < byte.min || res > byte.max ){
                    throw new NumberFormatException( "out of range" );
                }
                return res;
            }
            catch( IllegalArgumentException e ){
                throw new NumberFormatException( e );
            }
        } else { // Phobos
            implMissing( __FILE__, __LINE__);
            return 0;
        }
    }
    this( byte value ){
        super();
        this.value = value;
    }

    public static String toString( byte i ){
        return String_valueOf(i);
    }

    private static TypeInfo TYPE_;
    public static TypeInfo TYPE(){
        if( TYPE_ is null ){
            TYPE_ = typeid(byte);
        }
        return TYPE_;
    }

    byte byteValue(){ return value; }
    double doubleValue(){ return value; }
    float floatValue(){ return value; }
    int intValue(){ return value; }
    long longValue(){ return value; }
    short shortValue(){ return value; }
}
alias Byte ValueWrapperByte;



version (build) {
    debug {
        pragma(link, "dwt2base");
    } else {
        pragma(link, "dwt2base");
    }
}
