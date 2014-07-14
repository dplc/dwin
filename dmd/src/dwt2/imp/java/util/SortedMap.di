module java.util.SortedMap;

import java.lang.all;
import java.util.Map;

interface SortedMap : Map {
    Comparator     comparator();
    Object         firstKey();
    SortedMap      headMap(Object toKey);
    Object         lastKey();
    SortedMap      subMap(Object fromKey, Object toKey);
    SortedMap      tailMap(Object fromKey);
}


version (build) {
    debug {
        pragma(link, "dwt2base");
    } else {
        pragma(link, "dwt2base");
    }
}
