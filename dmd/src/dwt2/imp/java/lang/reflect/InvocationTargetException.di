module java.lang.reflect.InvocationTargetException;

import java.lang.all;

class InvocationTargetException : Exception {
    Exception cause;
    this( Exception e = null, String msg = null ){
        super(msg);
        cause = e;
    }

    alias getCause getTargetException;
    Exception getCause(){
        return cause;
    }
}


version (build) {
    debug {
        pragma(link, "dwt2base");
    } else {
        pragma(link, "dwt2base");
    }
}
