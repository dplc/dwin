module java.lang.reflect.AccessibleObject;

import java.lang.all;

class AccessibleObject {
    protected this(){
        implMissing(__FILE__,__LINE__);
    }
    bool isAccessible(){
        implMissing(__FILE__,__LINE__);
        return false;
    }
    static void setAccessible(AccessibleObject[] array, bool flag){
        implMissing(__FILE__,__LINE__);
    }
    void setAccessible(bool flag){
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
