
module com.ibm.icu.text.SimpleDateFormat;
import com.ibm.icu.text.DateFormat;

import java.lang.all;
public class SimpleDateFormat : DateFormat {

    public this(String string) {
        // TODO Auto-generated constructor stub
    }

}



version (build) {
    debug {
        pragma(link, "dwt2icu");
    } else {
        pragma(link, "dwt2icu");
    }
}
