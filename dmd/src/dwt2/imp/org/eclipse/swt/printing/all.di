module org.eclipse.swt.printing.all;

public import org.eclipse.swt.printing.PrintDialog;
public import org.eclipse.swt.printing.Printer;
public import org.eclipse.swt.printing.PrinterData;



version (build) {
    debug {
        pragma(link, "dwt2win32");
    } else {
        pragma(link, "dwt2win32");
    }
}
