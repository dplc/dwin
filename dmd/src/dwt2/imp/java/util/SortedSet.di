module java.util.SortedSet;

import java.lang.all;
import java.util.Set;

interface SortedSet : Set {
    Comparator     comparator();
    Object         first();
    SortedSet      headSet(Object toElement);
    Object         last();
    SortedSet      subSet(Object fromElement, Object toElement);
    SortedSet      tailSet(Object fromElement);
}


version (build) {
    debug {
        pragma(link, "dwt2base");
    } else {
        pragma(link, "dwt2base");
    }
}
