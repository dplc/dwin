module java.io.StringWriter;

import java.lang.all;
import java.io.Writer;

class StringWriter : Writer {
}



version (build) {
    debug {
        pragma(link, "dwt2base");
    } else {
        pragma(link, "dwt2base");
    }
}
