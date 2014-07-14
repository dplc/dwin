module java.util.regex.PatternSyntaxException;

import java.lang.all;


class PatternSyntaxException : IllegalArgumentException {
    this(String desc, String regex, int index) {
        super(desc);
    }
}


version (build) {
    debug {
        pragma(link, "dwt2base");
    } else {
        pragma(link, "dwt2base");
    }
}
