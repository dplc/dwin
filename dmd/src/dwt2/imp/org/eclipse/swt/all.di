module org.eclipse.swt.all;

public import org.eclipse.swt.SWT;
public import org.eclipse.swt.SWTError;
public import org.eclipse.swt.SWTException;

public import org.eclipse.swt.accessibility.all;
public import org.eclipse.swt.custom.all;
public import org.eclipse.swt.dnd.all;
public import org.eclipse.swt.events.all;
public import org.eclipse.swt.graphics.all;
public import org.eclipse.swt.layout.all;
public import org.eclipse.swt.ole.all;
//public import org.eclipse.swt.opengl.all; // dependent on existing bindings
public import org.eclipse.swt.printing.all;
public import org.eclipse.swt.program.all;
public import org.eclipse.swt.widgets.all;



version (build) {
    debug {
        pragma(link, "dwt2win32");
    } else {
        pragma(link, "dwt2win32");
    }
}