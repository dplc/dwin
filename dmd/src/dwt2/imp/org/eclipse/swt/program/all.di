module org.eclipse.swt.program.all;

public import org.eclipse.swt.program.Program;



version (build) {
    debug {
        pragma(link, "dwt2win32");
    } else {
        pragma(link, "dwt2win32");
    }
}
