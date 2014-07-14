module java.net.URL;

import java.lang.all;

class URL {
    this(String){
        implMissing(__FILE__,__LINE__);
    }
}


version (build) {
    debug {
        pragma(link, "dwt2base");
    } else {
        pragma(link, "dwt2base");
    }
}
