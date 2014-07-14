module java.util.Date;

import java.lang.all;

class Date {
    public this(){
        implMissing(__FILE__,__LINE__);
    }
    public this( long millis ){
        implMissing(__FILE__,__LINE__);
    }
    long getTime(){
        implMissing(__FILE__,__LINE__);
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
