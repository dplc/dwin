module java.beans.PropertyChangeListener;

import java.lang.all;
import java.beans.PropertyChangeEvent;

interface PropertyChangeListener {
    void   propertyChange(PropertyChangeEvent evt);
}


version (build) {
    debug {
        pragma(link, "dwt2base");
    } else {
        pragma(link, "dwt2base");
    }
}
