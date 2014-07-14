module org.eclipse.swt.events.all;

public import org.eclipse.swt.events.ArmEvent;
public import org.eclipse.swt.events.ArmListener;
public import org.eclipse.swt.events.ControlAdapter;
public import org.eclipse.swt.events.ControlEvent;
public import org.eclipse.swt.events.ControlListener;
public import org.eclipse.swt.events.DisposeEvent;
public import org.eclipse.swt.events.DisposeListener;
public import org.eclipse.swt.events.DragDetectEvent;
public import org.eclipse.swt.events.DragDetectListener;
public import org.eclipse.swt.events.ExpandAdapter;
public import org.eclipse.swt.events.ExpandEvent;
public import org.eclipse.swt.events.ExpandListener;
public import org.eclipse.swt.events.FocusAdapter;
public import org.eclipse.swt.events.FocusEvent;
public import org.eclipse.swt.events.FocusListener;
public import org.eclipse.swt.events.HelpEvent;
public import org.eclipse.swt.events.HelpListener;
public import org.eclipse.swt.events.KeyAdapter;
public import org.eclipse.swt.events.KeyEvent;
public import org.eclipse.swt.events.KeyListener;
public import org.eclipse.swt.events.MenuAdapter;
public import org.eclipse.swt.events.MenuDetectEvent;
public import org.eclipse.swt.events.MenuDetectListener;
public import org.eclipse.swt.events.MenuEvent;
public import org.eclipse.swt.events.MenuListener;
public import org.eclipse.swt.events.ModifyEvent;
public import org.eclipse.swt.events.ModifyListener;
public import org.eclipse.swt.events.MouseAdapter;
public import org.eclipse.swt.events.MouseEvent;
public import org.eclipse.swt.events.MouseListener;
public import org.eclipse.swt.events.MouseMoveListener;
public import org.eclipse.swt.events.MouseTrackAdapter;
public import org.eclipse.swt.events.MouseTrackListener;
public import org.eclipse.swt.events.MouseWheelListener;
public import org.eclipse.swt.events.PaintEvent;
public import org.eclipse.swt.events.PaintListener;
public import org.eclipse.swt.events.SelectionAdapter;
public import org.eclipse.swt.events.SelectionEvent;
public import org.eclipse.swt.events.SelectionListener;
public import org.eclipse.swt.events.ShellAdapter;
public import org.eclipse.swt.events.ShellEvent;
public import org.eclipse.swt.events.ShellListener;
public import org.eclipse.swt.events.TraverseEvent;
public import org.eclipse.swt.events.TraverseListener;
public import org.eclipse.swt.events.TreeAdapter;
public import org.eclipse.swt.events.TreeEvent;
public import org.eclipse.swt.events.TreeListener;
public import org.eclipse.swt.events.TypedEvent;
public import org.eclipse.swt.events.VerifyEvent;
public import org.eclipse.swt.events.VerifyListener;



version (build) {
    debug {
        pragma(link, "dwt2win32");
    } else {
        pragma(link, "dwt2win32");
    }
}