module java.util.Enumeration;

import java.lang.all;

interface Enumeration {
    public bool hasMoreElements();
    public Object nextElement();
}



version (build) {
    debug {
        pragma(link, "dwt2base");
    } else {
        pragma(link, "dwt2base");
    }
}
