module java.text.CharacterIterator;

import java.lang.all;

interface CharacterIterator {
    static const char DONE = '\u00FF';
    Object clone();
    char   current();
    char   first();
    int    getBeginIndex();
    int    getEndIndex();
    int    getIndex();
    char   last();
    char   next();
    char   previous();
    char   setIndex(int position);
}



version (build) {
    debug {
        pragma(link, "dwt2base");
    } else {
        pragma(link, "dwt2base");
    }
}
