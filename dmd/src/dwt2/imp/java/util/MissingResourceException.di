module java.util.MissingResourceException;

import java.lang.all;

class MissingResourceException : Exception {
    String classname;
    String key;
    this( String msg, String classname, String key ){
        super(msg);
        this.classname = classname;
        this.key = key;
    }
}


version (build) {
    debug {
        pragma(link, "dwt2base");
    } else {
        pragma(link, "dwt2base");
    }
}
