module java.util.Iterator;

import java.lang.all;

interface Iterator {
    public bool hasNext();
    public Object next();
    public void  remove();
}



version (build) {
    debug {
        pragma(link, "dwt2base");
    } else {
        pragma(link, "dwt2base");
    }
}
