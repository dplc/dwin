module java.util.List;

import java.lang.all;
import java.util.Collection;
import java.util.Iterator;
import java.util.ListIterator;

interface List : Collection {
    public void     add(int index, Object element);
    public bool     add(Object o);
    public bool     add(String o);
    public bool     addAll(Collection c);
    public bool     addAll(int index, Collection c);
    public void     clear();
    public bool     contains(Object o);
    public bool     contains(String o);
    public bool     containsAll(Collection c);
    public int      opEquals(Object o);
    public Object   get(int index);
    public hash_t   toHash();
    public int      indexOf(Object o);
    public bool     isEmpty();
    public Iterator iterator();
    public int      lastIndexOf(Object o);
    public ListIterator   listIterator();
    public ListIterator   listIterator(int index);
    public Object   remove(int index);
    public bool     remove(Object o);
    public bool     remove(String o);
    public bool     removeAll(Collection c);
    public bool     retainAll(Collection c);
    public Object   set(int index, Object element);
    public int      size();
    public List     subList(int fromIndex, int toIndex);
    public Object[] toArray();
    public Object[] toArray(Object[] a);
    public String[] toArray(String[] a);
    public String   toString();
}


version (build) {
    debug {
        pragma(link, "dwt2base");
    } else {
        pragma(link, "dwt2base");
    }
}
