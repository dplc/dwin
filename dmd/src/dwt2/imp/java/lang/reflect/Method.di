module java.lang.reflect.Method;

import java.lang.all;
import java.lang.Class;
import java.lang.String;

class Method {
    public override equals_t opEquals(Object obj){
        implMissing(__FILE__,__LINE__);
        return false;
    }
    Class getDeclaringClass(){
        implMissing(__FILE__,__LINE__);
        return null;
    }
    Class[] getExceptionTypes(){
        implMissing(__FILE__,__LINE__);
        return null;
    }
    int getModifiers(){
        implMissing(__FILE__,__LINE__);
        return 0;
    }
    String getName(){
        implMissing(__FILE__,__LINE__);
        return null;
    }
    Class[] getParameterTypes(){
        implMissing(__FILE__,__LINE__);
        return null;
    }
    Class getReturnType(){
        implMissing(__FILE__,__LINE__);
        return null;
    }
    public override hash_t toHash(){
        implMissing(__FILE__,__LINE__);
        return 0;
    }
    Object invoke(Object obj, Object[] args){
        implMissing(__FILE__,__LINE__);
        return null;
    }
    public override String toString(){
        implMissing(__FILE__,__LINE__);
        return null;
    }
}

version (build) {
    debug {
        pragma(link, "dwt2base");
    } else {
        pragma(link, "dwt2base");
    }
}