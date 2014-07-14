module flowerd.dwt;

public import htmlayout.htmlayout;

version(DWT_import_libs)
{
	//pragma(lib, "dwt2.lib");
	pragma(lib, "advapi32");
	pragma(lib, "comctl32.lib");
	pragma(lib, "comdlg32.lib");
	pragma(lib, "gdi32.lib");
	pragma(lib, "kernel32.lib");
	pragma(lib, "shell32.lib");
	pragma(lib, "ole32.lib");
	pragma(lib, "oleaut32.lib");
	pragma(lib, "olepro32.lib");
	pragma(lib, "oleacc.lib");
	pragma(lib, "user32.lib");
	pragma(lib, "usp10.lib");
	pragma(lib, "msimg32.lib");
	pragma(lib, "opengl32.lib");
}

import org.eclipse.swt.SWT;
import org.eclipse.swt.widgets.Control;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.MessageBox;
import org.eclipse.swt.widgets.Canvas;
import org.eclipse.swt.widgets.Listener;
import org.eclipse.swt.widgets.Event;
import org.eclipse.swt.graphics.Point;
import org.eclipse.swt.graphics.Rectangle;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.internal.win32.OS;

//SWT's TIMERPROC is wrong
extern(Windows)
{
	alias VOID function(HWND, UINT, UINT, DWORD) TIMERPROC;
	UINT SetTimer(HWND hWnd, UINT nIDEvent, UINT uElapse, TIMERPROC lpTimerFunc);
	BOOL KillTimer(HWND hWnd, UINT uIDEvent);
}

class DWTForm : Display //easy access to syncExec
{
	this(int style=SWT.SHELL_TRIM)
	{
		super();
		shell = new Shell(this,style);
		shell.setLayout(new FillLayout());
	}

	void main(){} // this is supposed to be overloaded by the user

	void run(char[][] argv=null)
	{
		this.argv=argv;
		main();
		shell.open();
		while (!shell.isDisposed()){
			if (!readAndDispatch()) sleep();
		}
		dispose();
	}

	int msgBox(char[] text,char[] title="",int style=SWT.ICON_INFORMATION|SWT.OK)
	{
		scope auto m=new MessageBox(shell,style);
		m.setText(title);
		m.setMessage(text);
		return m.open;
	}

	void center(int w=-1,int h=-1)
	{
		auto bounds = shell.getMonitor.getBounds; //getPrimaryMonitor().getBounds();
		if(w==-1 || h==-1)
		{
			auto rect = shell.getBounds;
			w=rect.width;
			h=rect.height;
		}
		int x = bounds.x + (bounds.width - w) / 2;
		int y = bounds.y + (bounds.height - h) / 2;
		shell.setLocation(x,y);
	}

protected:
	char[][] argv;
	Shell shell;
}

class HLayoutForm : DWTForm
{
	this()
	{
		super();
		layout = new HLayoutControl(shell, SWT.NONE);
	}

	static HLayoutForm opCall(){return new HLayoutForm;}

	protected HLayoutControl layout;
}

class HLiteForm : DWTForm
{
	this()
	{
		super();
		layout = new HLiteControl(shell, SWT.NONE);
	}

	static HLiteForm opCall(){return new HLiteForm;}

	protected HLiteControl layout;
}

class HLayoutControl : HLayout
{
	this (Composite parent, int style)
	{
		ctrl=new HControl(parent,style);
		super(ctrl.handle);
	}

	Control opCast(){return ctrl;}
	Control control(){return ctrl;}

protected:

	Control ctrl;

	class HControl : Control
	{
		static WNDPROC HLayoutControlProc;
		static void static_this()
		{
			static bool done=false;
			synchronized
			{
				if(!done)
				{
					WNDCLASS lpWndClass;
					OS.GetClassInfo (null, HTMLayoutClassNameW(), &lpWndClass);
					HLayoutControlProc = lpWndClass.lpfnWndProc;
					done=true;
				}
			}
		}

		this (Composite parent, int style)
		{
			static_this();
			super (parent, style);
		}
	
		override int callWindowProc(HWND hwnd, int msg, int wParam, int lParam)
		{
			if (handle is null) return 0;
			bool bHandled;
			auto lResult=defProcND(msg,wParam,lParam,bHandled);
			if(bHandled) return lResult;
			return OS.DefWindowProc(hwnd,msg,wParam,lParam);
		}
	
		override public Point computeSize (int wHint, int hHint, bool changed) {
			checkWidget ();
			int border = getBorderWidth () * 2;
			int width,height;
			if (wHint !is SWT.DEFAULT) width += wHint;
			else width += minWidth;
			if (hHint !is SWT.DEFAULT) height += hHint;
			else height += minHeight(width);
			return new Point (width+border, height+border);
		}

		override char[] windowClass () {
			return HLayout.className8;
		}
		
		override int windowProc () {
			return cast(int) HLayoutControlProc;
		}
	}
}

class HLiteControl : HLite
{
	this(Composite parent, int style)
	{
		super();
		ctrl=new HControl(parent,style);
	}

	this() {super();}

	Control opCast(){return ctrl;}
	Control control(){return ctrl;}

protected:

	Control ctrl;

	class HControl : Canvas
	{
		this (Composite parent, int style)
		{
			super(parent, style|SWT.NO_BACKGROUND|SWT.DOUBLE_BUFFERED);
			setDragDetect(false);
			addListener(SWT.Paint,new onPaint);
			addListener(SWT.Resize,new onSize);
			addListener(SWT.MouseMove,new onMouseMove);
			addListener(SWT.MouseDown,new onMouseDown);
			addListener(SWT.MouseDoubleClick,new onMouseDoubleClick);
			addListener(SWT.MouseWheel,new onMouseWheel);
			addListener(SWT.MouseUp,new onMouseUp);
			addListener(SWT.KeyDown,new onKeyDown);
			addListener(SWT.KeyUp,new onKeyUp);
		}

		int getAltState(Event e)
		{
			int alts;
			if(e.stateMask&SWT.SHIFT) alts |= KEYBOARD_STATES.SHIFT_KEY_PRESSED;
			if(e.stateMask&SWT.CTRL) alts |= KEYBOARD_STATES.CONTROL_KEY_PRESSED;
			if(e.stateMask&SWT.ALT) alts |= KEYBOARD_STATES.ALT_KEY_PRESSED;
			return alts;
		}

		int getMouseButton(Event e)
		{
			int nMouseButton;
			if (e.button == 1) nMouseButton = MOUSE_BUTTONS.MAIN_MOUSE_BUTTON;
			else if(e.button == 2) nMouseButton = MOUSE_BUTTONS.PROP_MOUSE_BUTTON;
			else if(e.button == 3) nMouseButton = MOUSE_BUTTONS.MIDDLE_MOUSE_BUTTON;
			return nMouseButton;
		}

		class onPaint : Listener { void handleEvent(Event e)
		{
			render(e.gc.handle,0,0,e.width,e.height);
		} }

		class onSize : Listener { void handleEvent(Event e)
		{
			auto b=getClientArea;
			measure(b.width,b.height);
		} }

		class onMouseMove : Listener { void handleEvent(Event e)
		{
			traverseMouseEvent(MOUSE_MOVE,e.x,e.y,getMouseButton(e),getAltState(e));
		} }

		class onMouseDown : Listener { void handleEvent(Event e)
		{
			traverseMouseEvent(MOUSE_DOWN,e.x,e.y,getMouseButton(e),getAltState(e));
		} }

		class onMouseDoubleClick : Listener { void handleEvent(Event e)
		{
			traverseMouseEvent(MOUSE_DCLICK,e.x,e.y,getMouseButton(e),getAltState(e));
		} }

		class onMouseUp : Listener { void handleEvent(Event e)
		{
			traverseMouseEvent(MOUSE_UP,e.x,e.y,getMouseButton(e),getAltState(e));
		} }

		class onMouseWheel : Listener { void handleEvent(Event e)
		{
			traverseMouseEvent(MOUSE_WHEEL,e.x,e.y,e.count,0);
		} }

		class onKeyDown : Listener { void handleEvent(Event e)
		{
			traverseKeyboardEvent(KEY_DOWN,e.keyCode,getAltState(e));
		} }
		
		class onKeyUp : Listener { void handleEvent(Event e)
		{
			traverseKeyboardEvent(KEY_UP,e.keyCode,getAltState(e));
		} }
		
		/*
		// no such event in DWT
		void onKeyPress(Event e)
		{
			traverseKeyboardEvent(KEY_CHAR,e.character,getAltState(e));
		}*/

		override public Point computeSize (int wHint, int hHint, bool changed) {
			checkWidget ();
			int border = getBorderWidth () * 2;
			int width,height;
			if (wHint !is SWT.DEFAULT) width += wHint;
			else width += minWidth;
			if (hHint !is SWT.DEFAULT) height += hHint;
			else height += minHeight;
			return new Point (width+border, height+border);
		}
	}

	bool traverseMouseEvent(UINT mouseCmd, INT x, INT y, UINT buttons, UINT alt_state ) 
	{
		MOUSE_PARAMS mp; 
		mp.alt_state = alt_state;
		mp.button_state = buttons;
		mp.cmd = mouseCmd;
		mp.pos_document = tango.sys.win32.Types.POINT(x,y);
		bool result;
		assert(traverseUIEvent(HANDLE_MOUSE, &mp, result )==false);
		return result;
	}
	
	bool traverseKeyboardEvent(UINT keyCmd, UINT code, UINT alt_state ) 
	{
		KEY_PARAMS kp;
		kp.alt_state = alt_state;
		kp.key_code = code;
		kp.cmd = keyCmd;
		bool result;
		assert(traverseUIEvent(HANDLE_KEY, &kp, result )==false);
		return result;
	}

	bool onUpdateUI()
	{
		ctrl.update;
		return true;
	}

	bool onRefreshArea(HRefreshArea e)
	{
		ctrl.redraw(e.area.left,e.area.top,e.area.right-e.area.left,e.area.bottom-e.area.top,false);
		return true;
	}

	bool onSetCursor(HSetCursor e)
	{
		static auto cursor_ids = 
		[
			SWT.CURSOR_ARROW,
			SWT.CURSOR_IBEAM,
			SWT.CURSOR_WAIT,
			SWT.CURSOR_CROSS,
			SWT.CURSOR_UPARROW,
			SWT.CURSOR_SIZENWSE,
			SWT.CURSOR_SIZENESW,
			SWT.CURSOR_SIZEWE,
			SWT.CURSOR_SIZENS,
			SWT.CURSOR_SIZEALL,
			SWT.CURSOR_NO,
			SWT.CURSOR_APPSTARTING,
			SWT.CURSOR_HELP,
			SWT.CURSOR_HAND,
		];
		static int lastid=-1;
		if(lastid!=e.id)
		{
			ctrl.setCursor(ctrl.display.getSystemCursor(cursor_ids[e.id]));
			lastid=e.id;
		}
		return true;
	}

	bool onSetTimer(HSetTimer e)
	{
		if(e.time==0) KillTimer(ctrl.handle,e.id);
		else
		{
			if(!SetTimer(ctrl.handle,e.id,e.time,&traverseTimerEvent)) return false;
			mTimers[ctrl.handle]=this;
		}
		return true;
	}

	static extern(Windows) void traverseTimerEvent(HWND hwnd, UINT uMsg, UINT idEvent, DWORD dwTime)
	{
		auto t=hwnd in mTimers;
		bool result;
		if(t && t.traverseUIEvent(HANDLE_TIMER,&idEvent,result) && !result) KillTimer(hwnd,idEvent);
	}

	static HLite[HWND] mTimers;
}