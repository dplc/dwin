
module com.ibm.icu.text.CollationKey;

import java.lang.all;

public class CollationKey {

    public int compareTo(CollationKey descriptionKey) {
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
