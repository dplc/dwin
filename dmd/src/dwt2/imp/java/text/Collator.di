module java.text.Collator;

import java.lang.all;

class Collator : Comparator {
    public static Collator getInstance(){
        implMissing( __FILE__, __LINE__ );
        return null;
    }
    private this(){
    }
    int compare(Object o1, Object o2){
        implMissing( __FILE__, __LINE__ );
        return 0;
    }
}


version (build) {
    debug {
        pragma(link, "dwt2base");
    } else {
        pragma(link, "dwt2base");
    }
}
