module com.ibm.icu.util.Calendar;

import java.lang.all;

public class Calendar {

    public static final int YEAR = 0;

    public static Calendar getInstance() {
        // TODO Auto-generated method stub
        return null;
    }

    public int get(int year2) {
        // TODO Auto-generated method stub
        return 0;
    }

}

version (build) {
    debug {
        pragma(link, "dwt2icu");
    } else {
        pragma(link, "dwt2icu");
    }
}
