module java.util.LinkedHashMap;

import java.lang.all;
import java.util.HashMap;

class LinkedHashMap : HashMap {
    this(){
        implMissing( __FILE__, __LINE__ );
    }
}


version (build) {
    debug {
        pragma(link, "dwt2base");
    } else {
        pragma(link, "dwt2base");
    }
}
