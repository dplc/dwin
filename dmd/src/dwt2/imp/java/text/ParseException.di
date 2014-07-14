module java.text.ParseException;

import java.lang.all;

class ParseException : Exception {
    this( String e = null ){
        super(e);
    }
}


version (build) {
    debug {
        pragma(link, "dwt2base");
    } else {
        pragma(link, "dwt2base");
    }
}
