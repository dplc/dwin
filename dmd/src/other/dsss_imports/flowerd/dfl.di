module flowerd.dfl;

public import htmlayout.htmlayout;
import flowerd.syncexec;

version(DFL_import_libs)
{
	pragma(lib,"dfl.lib");
	pragma(lib,"user32.lib");
	pragma(lib,"kernel32.lib");
	pragma(lib,"shell32.lib");
	pragma(lib,"gdi32.lib");
	pragma(lib,"user32.lib");
	pragma(lib,"uuid.lib");
	pragma(lib,"comdlg32.lib");
	pragma(lib,"ole32.lib");
	pragma(lib,"oleaut32.lib");
	pragma(lib,"advapi32.lib");
	pragma(lib,"comctl32.lib");
}

import dfl.all;
import tango.sys.win32.Types;

extern(Windows)
{
	alias VOID function(HWND, UINT, UINT, DWORD) TIMERPROC;
	UINT SetTimer(HWND hWnd, UINT nIDEvent, UINT uElapse, TIMERPROC lpTimerFunc);
	BOOL KillTimer(HWND hWnd, UINT uIDEvent);
	HCURSOR LoadCursorA(HINSTANCE hInstance, LPCSTR lpCursorName);
}

class HLayoutControl : HLayout
{
	class HControl : Control
	{
		void wndProc(inout Message msg)
		{
			if(mReady)
			{
				BOOL bHandled;
				auto lResult = HTMLayoutProcND(handle,msg.msg,msg.wParam,msg.lParam, &bHandled);
				if(bHandled)
				{
					msg.result=lResult;
					return;
				}
			}
			super.wndProc(msg);
		}
	}

	this(HWND parent)
	{
		mControl=new HControl;
		mControl.parent=Control.fromHandle(cast(dfl.internal.winapi.HANDLE)parent);
		mReady=true;
		super(mControl.handle);
	}

	this(Control parent)
	{
		mControl=new HControl;
		mControl.parent=parent;
		mReady=true;
		super(mControl.handle);
	}

	HWND handle(){return mControl.handle;}

protected:
	HControl mControl;
	bool mReady;
}

class HLayoutForm : HLayoutControl
{
	class HForm : Form
	{
		void pack()
		{
			auto w=minWidth;
			clientSize=Size(w,minHeight(w));
		}

		void onClosing(CancelEventArgs args)
		{
			super.onClosing(args);
			if(!args.cancel) mReady=false;
		}
	}

	this()
	{
		syncCtor();
		mForm=new HForm;
		mForm.visible=false;
		super(mForm);
		mControl.dock=DockStyle.FILL;
	}

	~this(){syncDtor();}

	void run(char[][] argv=null)
	{
		this.argv=argv;
		main();
		//Application.run(mForm,&execute);
		Application.run(mForm);
	}

	Form opCast(){return mForm;}
	HForm form(){return mForm;}
	HWND handle(){return mForm.handle;}

	mixin SyncExec!(HLayoutForm);
	mixin TimerExec!(HLayoutForm);

protected:

	HForm mForm;
	char[][] argv;
	void main(){}
}

class HLiteControl : HLite
{
	this(){}

	this(HWND parent)
	{
		mControl=new HControl;
		mControl.parent=Control.fromHandle(cast(dfl.internal.winapi.HANDLE)parent);
	}

	this(Control parent)
	{
		mControl=new HControl;
		mControl.parent=parent;
	}

	HWND handle(){return mControl.handle;}

	class HControl : Control//DoubleBufferedControl
	{
		void onResize(EventArgs ea)
		{
			super.onResize(ea);
			auto s=clientSize();
			measure(s.width,s.height);
		}

		/*void onBufferPaint(PaintEventArgs p)
		{
			super.onBufferPaint(p);
			auto s=clientSize();
			render(p.graphics.handle,0,0,s.width,s.height);
		}*/

		void onPaint(PaintEventArgs p)
		{
			auto s=clientSize();
			render(p.graphics.handle,0,0,s.width,s.height);
		}

		int getMouseButton(MouseEventArgs mea)
		{
			int nMouseButton;
			if (mea.button == MouseButtons.LEFT) nMouseButton = MAIN_MOUSE_BUTTON;
			else if(mea.button == MouseButtons.RIGHT) nMouseButton = PROP_MOUSE_BUTTON;
			else if(mea.button == MouseButtons.MIDDLE) nMouseButton = MIDDLE_MOUSE_BUTTON;
			return nMouseButton;
		}

		int getAltState(KeyEventArgs kea)
		{
			int alts;
			if(kea.shift) alts |= SHIFT_KEY_PRESSED;
			if(kea.control) alts |= CONTROL_KEY_PRESSED;
			if(kea.alt) alts |= ALT_KEY_PRESSED;
			return alts;
		}

		void onMouseMove(MouseEventArgs mea)
		{
			super.onMouseMove(mea);

			traverseMouseEvent(MOUSE_MOVE,mea.x,mea.y,getMouseButton(mea),0);
		}

		void onMouseDown(MouseEventArgs mea)
		{
			super.onMouseDown(mea);
			traverseMouseEvent(mea.clicks==2?MOUSE_DCLICK:MOUSE_DOWN,mea.x,mea.y,getMouseButton(mea),0);
		}

		void onMouseUp(MouseEventArgs mea)
		{
			super.onMouseUp(mea);
			traverseMouseEvent(MOUSE_UP,mea.x,mea.y,getMouseButton(mea),0);
		}

		void onMouseWheel(MouseEventArgs mea)
		{
			super.onMouseWheel(mea);
			auto p=pointToClient(Point(mea.x,mea.y));
			traverseMouseEvent(MOUSE_WHEEL,p.x,p.y,mea.delta/120,0);
		}

		void onKeyDown(KeyEventArgs kea)
		{
			super.onKeyDown(kea);
			traverseKeyboardEvent(KEY_DOWN,kea.keyCode,getAltState(kea));
		}

		void onKeyUp(KeyEventArgs kea)
		{
			super.onKeyUp(kea);
			traverseKeyboardEvent(KEY_UP,kea.keyCode,getAltState(kea));
		}

		void onKeyPress(KeyPressEventArgs kea)
		{
			if(kea.keyChar=='\t') advanceFocus(kea.shift?FOCUS_PREV:FOCUS_NEXT);
			else traverseKeyboardEvent(KEY_CHAR,kea.keyChar,getAltState(kea));
		}
	}

	bool onUpdateUI()
	{
		mControl.update();
		return true;
	}

	bool onRefreshArea(HRefreshArea e)
	{
		mControl.invalidate(Rect(cast(dfl.internal.winapi.RECT*)&e.area()));
		//mControl.updateGraphics(Rect(&e.area));
		return true;
	}

	bool onSetCursor(HSetCursor e)
	{
		static int last=-1;
		if(last!=e.id)
		{
			mControl.cursor(new Cursor(cast(dfl.internal.winapi.HANDLE)LoadCursorA(null,e.res)));
			last=e.id;
		}
		return true;
	}

	bool onSetTimer(HSetTimer e)
	{
		if(e.time==0) return(KillTimer(mControl.handle,e.id)!=0);
		else
		{
			if(SetTimer(mControl.handle,e.id,e.time,&traverseTimerEvent)!=0)
			{
				mTimers[mControl.handle]=this;
				return true;
			}
		}
		return false;
	}

	bool traverseMouseEvent( UINT mouseCmd, INT x, INT y, UINT buttons, UINT alt_state )
	{
		MOUSE_PARAMS mp;
		mp.alt_state = alt_state;
		mp.button_state = buttons;
		mp.cmd = mouseCmd;
		mp.pos_document = POINT(x,y);
		bool result;
		assert(traverseUIEvent(EVENT_GROUPS.HANDLE_MOUSE, &mp, result )==false);
		return result;
	}

	bool traverseKeyboardEvent( UINT keyCmd, UINT code, UINT alt_state )
	{
		KEY_PARAMS kp;
		kp.alt_state = alt_state;
		kp.key_code = code;
		kp.cmd = keyCmd;
		bool result;
		assert(traverseUIEvent(EVENT_GROUPS.HANDLE_KEY, &kp, result )==false);
		return result;
	}

protected:
	static extern(Windows) void traverseTimerEvent(HWND hwnd, UINT uMsg, UINT idEvent, DWORD dwTime)
	{
		auto t=hwnd in mTimers;
		bool result;
		if(t && t.traverseUIEvent(EVENT_GROUPS.HANDLE_TIMER,&idEvent,result) && !result) KillTimer(hwnd,idEvent);
	}

	HControl mControl;
	static HLite[HWND] mTimers;
}

class HLiteForm : HLiteControl
{
	class HForm : Form
	{
		void pack()
		{
			clientSize=Size(minWidth,minHeight);
		}
	}

	Form opCast() {return mForm;}
	HWND handle(){return mForm.handle;}
	HForm form(){return mForm;}

	this()
	{
		syncCtor();
		mForm=new HForm;
		mForm.visible=false;
		super(mForm);
		mControl.dock=DockStyle.FILL;
	}

	~this() {syncDtor();}

	void run(char[][] argv=null)
	{
		this.argv=argv;
		main();
		Application.run(mForm,&execute);
	}

	mixin SyncExec!(HLiteForm);
	mixin TimerExec!(HLiteForm);

	void onKeyDown(KeyEventArgs kea)
	{
		mControl.onKeyDown(kea);
	}

	void onKeyUp(KeyEventArgs kea)
	{
		mControl.onKeyUp(kea);
	}

	void onKeyPress(KeyPressEventArgs kea)
	{
		mControl.onKeyPress(kea);
	}

protected:

	HForm mForm;
	char[][] argv;
	void main(){}
}
version (build) {
    debug {
        pragma(link, "debug-flowerd");
    } else {
        pragma(link, "flowerd");
    }
}
