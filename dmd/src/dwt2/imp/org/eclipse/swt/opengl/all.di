module org.eclipse.swt.opengl.all;

public import org.eclipse.swt.opengl.GLCanvas;
public import org.eclipse.swt.opengl.GLData;



version (build) {
    debug {
        pragma(link, "dwt2win32");
    } else {
        pragma(link, "dwt2win32");
    }
}
