module java.util.ListIterator;

import java.lang.all;
import java.util.Iterator;

interface ListIterator : Iterator {
    public void   add(Object o);
    public void   add(String o);
    public bool   hasNext();
    public bool   hasPrevious();
    public Object next();
    public int    nextIndex();
    public Object previous();
    public int    previousIndex();
    public void   remove();
    public void   set(Object o);
}


version (build) {
    debug {
        pragma(link, "dwt2base");
    } else {
        pragma(link, "dwt2base");
    }
}
