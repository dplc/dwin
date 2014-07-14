/*

based on HTMLayout's skinned window example.

*/

//todo: window.icon

module flowerd.skin;

public import htmlayout.htmlayout;
import tango.sys.win32.Types;
import tango.sys.win32.Macros;
import flowerd.syncexec;
import tango.stdc.stringz;

version(WIN32_import_libs)
{
	//pragma(lib,"user32.lib");
	//pragma(lib,"kernel32.lib");
	//pragma(lib,"shell32.lib");
	pragma(lib,"gdi32.lib");
	//pragma(lib,"user32.lib");
	//pragma(lib,"uuid.lib");
	//pragma(lib,"comdlg32.lib");
	//pragma(lib,"ole32.lib");
	//pragma(lib,"oleaut32.lib");
	//pragma(lib,"advapi32.lib");
	//pragma(lib,"comctl32.lib");
}

extern(Windows)
{
	WINBOOL GetMessageW(LPMSG, HWND, UINT, UINT);
	WINBOOL GetMessageA(LPMSG, HWND, UINT, UINT);
	WINBOOL TranslateMessage(LPMSG);
	LONG DispatchMessageW(LPMSG);
	LONG DispatchMessageA(LPMSG);
	WINBOOL PostMessageA(HWND, UINT, WPARAM, LPARAM);
	WINBOOL PostMessageW(HWND, UINT, WPARAM, LPARAM);
	HMODULE GetModuleHandleA(LPCSTR);
	HMODULE GetModuleHandleW(LPCWSTR);
	void PostQuitMessage(int);
	ATOM RegisterClassExA(LPWNDCLASSEX);
	ATOM RegisterClassExW(LPWNDCLASSEXW);
	WINBOOL ShowWindow(HWND, int);
	WINBOOL IsWindowVisible(HWND);
	WINBOOL UpdateWindow(HWND);
	WINBOOL SetWindowPos(HWND, HWND, int, int, int, int, UINT);
	WINBOOL SetWindowTextW(HWND, LPCWSTR);
	WINBOOL SetWindowTextA(HWND, LPCSTR);
	HWND CreateWindowExA(DWORD, LPCSTR, LPCSTR, DWORD, int, int, int, int, HWND, HMENU, HINST, LPVOID);
	HWND CreateWindowExW(DWORD, LPCWSTR, LPCWSTR, DWORD, int, int, int, int, HWND, HMENU, HINST, LPVOID);
	WINBOOL GetWindowPlacement(HWND, WINDOWPLACEMENT*);
	int MapWindowPoints(HWND, HWND, LPPOINT, UINT);
	LRESULT DefWindowProcA(HWND, UINT, WPARAM, LPARAM);
	LRESULT DefWindowProcW(HWND, UINT, WPARAM, LPARAM);
	WINBOOL GetWindowRect(HWND, LPRECT);
	WINBOOL DestroyWindow(HWND);
	HCURSOR SetCursor(HCURSOR);
	HCURSOR LoadCursorA(HINST, LPCSTR);
	WINBOOL SystemParametersInfoA(UINT, UINT, PVOID, UINT);
	LRESULT SendMessageA(HWND, UINT, WPARAM, LPARAM);
}

struct WNDCLASSEXW {
	UINT        cbSize;
	/* Win 3.x */
	UINT        style;
	WNDPROC     lpfnWndProc;
	int         cbClsExtra;
	int         cbWndExtra;
	HINSTANCE   hInstance;
	HICON       hIcon;
	HCURSOR     hCursor;
	HBRUSH      hbrBackground;
	LPCWSTR     lpszMenuName;
	LPCWSTR     lpszClassName;
	/* Win 4.0 */
	HICON       hIconSm;
}

alias WNDCLASSEXW* LPWNDCLASSEXW;

const SPI_GETWORKAREA = (48);
const WS_EX_LAYERED=0x00080000;
int GET_X_LPARAM(LPARAM lParam){return cast(int)cast(short)LOWORD(lParam);}
int GET_Y_LPARAM(LPARAM lParam){return cast(int)cast(short)HIWORD(lParam);}

class HSkinLayout : HLayout
{
	this(bool maximize=true,bool resize=true,int x=CW_USEDEFAULT, int y=CW_USEDEFAULT, int width=640, int height=480)
	{
		syncCtor();
		window = SkinnedWindow(maximize,resize,x,y,width,height);
		window.msgHandler=&msgHandler;
		super(handle);
	}

	~this()
	{
		syncDtor();
	}

	void pack()
	{
		auto w=minWidth;
		window.size(w,minHeight(w));
	}

	mixin SkinnedForm!(HSkinLayout);
}

/*class HSkinLite : HLite
{
	mixin SkinnedForm!(HSkinLite);
}*/

template SkinnedForm(THIS_TYPE)
{
	bool run(char[][] argv)
	{
		MSG msg;

		main();
		
		// Main message loop:
		while (GetMessageA(&msg, null, 0, 0)) 
		{
			// execute asynchronous tasks in GUI thread.
			execute();

			TranslateMessage(&msg);
			DispatchMessageA(&msg);
		}

		return cast(bool)msg.wParam;
	}

	HWND handle(){return window.handle;}

	mixin SyncExec!(THIS_TYPE);
	mixin TimerExec!(THIS_TYPE);

protected:

	LRESULT msgHandler(uint msg,WPARAM wParam,LPARAM lParam,out bool handled)
	{
		return defProcND(msg,wParam,lParam,handled);
	}

	void main()
	{
		window.init(this);
		window.show;
		window.update;
	}

	char[][] argv;
	SkinnedWindow window;
}


class SkinnedWindow
{
	HWND handle(){return mHandle;}

	static SkinnedWindow opCall(bool maximize,bool resize,int x, int y, int width, int height) //CW_USEDEFAULT
	{
		static const CLASSNAME8="HTMLayoutSkinnedWindow\0";
		static const CLASSNAME16="HTMLayoutSkinnedWindow\0"w;
		auto hInstance=GetModuleHandleA(null);

		static bool registered;
		if(registered == false)
		{
			WNDCLASSEX wcex;
			wcex.cbSize = WNDCLASSEX.sizeof;
			
			//wcex.style			= CS_HREDRAW | CS_VREDRAW; //do we need that?
			wcex.lpfnWndProc		= &wndProc;
			wcex.hInstance			= hInstance;
			//wcex.cbClsExtra = wcex.cbWndExtra	= 0; // D makes these 0 anyway
			//wcex.hIcon			= LoadIconA(hInstance, (LPCTSTR)IDI_SKIN);
			//wcex.hIconSm			= LoadIconA(wcex.hInstance, (LPCTSTR)IDI_SKINSMALL);
			//wcex.hCursor			= LoadCursorA(null, IDC_ARROW); //don't think this is of any use
			//wcex.hbrBackground	= cast(HBRUSH)(COLOR_WINDOW+1); //not used anyway
			//wcex.lpszMenuName		= null; // D makes it null anyway
			wcex.lpszClassName		= CLASSNAME8.ptr;
			
			
			if(RegisterClassExA(&wcex)) registered=true;
			else return null;
		}

		return new SkinnedWindow(
			CreateWindowExA(WS_EX_LAYERED, CLASSNAME8.ptr, null, 
				WS_POPUP | (maximize?WS_MAXIMIZEBOX:0) | WS_MINIMIZEBOX | WS_SYSMENU | (resize?WS_SIZEBOX:0),
				x, y, width, height, null, null, hInstance, null)
		);
	}

	void center() // getter
	{
		RECT area;
		SystemParametersInfoA(SPI_GETWORKAREA, 0, &area, FALSE);

		RECT rc;
		GetWindowRect(mHandle,&rc);

		position(
			area.left + (((area.right - area.left) - (rc.right - rc.left)) / 2),
			area.top + (((area.bottom - area.top) - (rc.bottom - rc.top)) / 2)
		);
	}

	void icon(HICON hico,bool big){SendMessageA(mHandle, WM_SETICON, cast(int)big, cast(LPARAM)hico);}

	HCURSOR cursor(HCURSOR c){return SetCursor(c);}

	bool minimize(){return ShowWindow(mHandle,SW_MINIMIZE)!=FALSE;}

	bool maximize(){return ShowWindow(mHandle,SW_MAXIMIZE)!=FALSE;}

	bool restore(){return ShowWindow(mHandle,SW_RESTORE)!=FALSE;}

	bool visible(bool bShow=true){return ShowWindow(mHandle,bShow?SW_SHOW:SW_HIDE)!=FALSE;}

	bool hide(){return visible(false);}

	bool show(){return visible(true);}

	bool visible(){return IsWindowVisible(mHandle)!=FALSE;}

	bool update(){return UpdateWindow(mHandle)!=FALSE;}

	bool size(int x,int y){return SetWindowPos(mHandle,null,0,0,x,y,SWP_NOMOVE)!=FALSE;}

	bool position(int x,int y){return SetWindowPos(mHandle,null,x,y,0,0,SWP_NOSIZE)!=FALSE;}

	void init(HLayoutBase layout)
	{
		if(layout is null) return;
		else mLayout=layout;
		auto r=layout.rootElement;
		if(r is null) return;

		mBody = r.getTag("body")[0];
		mDrag = r.getId("skin_drag");
		mCaption = r.getId("skin_caption");
		if((mButton_min = r.getId("skin_minimize")) !is null) mButton_min.handleEvent(delegate(HBehaviorEvent p)
		{
			if(p.cmd!=BUTTON_CLICK) return false;
			return (cast(SkinnedWindow)p.param).minimize;
		},this);
		if((mButton_max = r.getId("skin_maximize")) !is null) mButton_max.handleEvent(delegate(HBehaviorEvent p)
		{
			if(p.cmd!=BUTTON_CLICK) return false;
			with(cast(SkinnedWindow)p.param)
			{
				if(maximized) return restore;
				else return maximize;
			}
		},this);
		if((mButton_close = r.getId("skin_close")) !is null) mButton_close.handleEvent(delegate(HBehaviorEvent p)
		{
			if(p.cmd!=BUTTON_CLICK) return false;
			PostMessageA((cast(SkinnedWindow)p.param).mHandle,WM_CLOSE,0,0); 
			return true;
		},this);
		mButton_icon = r.getId("skin_icon");
		mCorner	= r.getId("skin_corner");

		auto h=r.getTag("head");
		if(h.length)
		{
			h=h[0].getTag("title");
			if(h.length) caption=h[0].innerText;
		}
	}

	void caption(char[] text)
	{
		SetWindowTextA(mHandle,toStringz/*16z*/(/*tango.text.convert.Utf.toString16*/(text)));
		if(mCaption)
		{
			mCaption.innerText=text;
			mCaption.update;
		}
	}

	bool minimized()
	{
		WINDOWPLACEMENT wp;
		GetWindowPlacement(mHandle,&wp);
		return wp.showCmd == SW_SHOWMINIMIZED;
	}

	bool maximized()
	{
		WINDOWPLACEMENT wp;
		GetWindowPlacement(mHandle,&wp);
		return wp.showCmd == SW_SHOWMAXIMIZED;
	}

	LRESULT delegate(uint,WPARAM,LPARAM,out bool) msgHandler;

protected:

	this(HWND h)
	{
		if(h is null) throw new Exception("Invalid handle passed to SkinnedWindow.this!");
		windows[mHandle=h]=this;
	}

	int mHitTest(int x, int y)
	{
		auto pt = POINT(x,y);
		MapWindowPoints(cast(HWND)HWND_DESKTOP,mHandle,&pt,1u);

		if(mButton_icon && mButton_icon.isInside(pt)) return HTSYSMENU;

		if(mCaption && mCaption.isInside(pt)) return HTCAPTION;

		if(mCorner && mCorner.isInside(pt)) return HTBOTTOMRIGHT;

		auto ret=HTCLIENT;

		if(mBody)
		{
			auto body_rc = mBody.location(ROOT_RELATIVE | CONTENT_BOX);
	
			if(!PtInRect(body_rc, pt))
			{
				if( pt.y < body_rc.top + 10 ) 
				{
					if( pt.x < body_rc.left + 10 ) return HTTOPLEFT;
					if( pt.x > body_rc.right - 10 ) return HTTOPRIGHT;
				}
		
				else if( pt.y > body_rc.bottom - 10 ) 
				{
					if( pt.x < body_rc.left + 10 ) return HTBOTTOMLEFT;
					if( pt.x > body_rc.right - 10 ) return HTBOTTOMRIGHT;
				}
		
				if( pt.y < body_rc.top ) return HTTOP;
				if( pt.y > body_rc.bottom ) return HTBOTTOM;
				if( pt.x < body_rc.left ) return HTLEFT;
				if( pt.x > body_rc.right ) return HTRIGHT;
			}
		}

		if(mDrag && mDrag.isInside(pt)) return HTCAPTION;

		return ret;
	}

	static SkinnedWindow[HWND] windows;

	extern(Windows) static LRESULT wndProc(HWND mHandle, UINT message, WPARAM wParam, LPARAM lParam)
	{
		auto me = mHandle in windows;
		if(me && me.msgHandler)
		{
			bool bHandled;
			auto ret=me.msgHandler(message,wParam,lParam,bHandled);
			if(bHandled) return ret;
		}
		else
		{
			BOOL bHandled;
			auto ret=HTMLayoutProcND(mHandle,message,wParam,lParam, &bHandled);
			if(bHandled) return ret;
		}

		switch (message) 
		{
			case WM_NCHITTEST:
				if(me) return me.mHitTest(GET_X_LPARAM(lParam),GET_Y_LPARAM(lParam));
				break;

			case WM_NCACTIVATE:
				if(me && me.mBody)
				{
					if(wParam) {if(me.mBody.delClass("skin_inactive")) me.mBody.update;}
					else {if(me.mBody.addClass("skin_inactive")) me.mBody.update;}
				}
				break;

			case WM_NCPAINT:
			case WM_NCCALCSIZE: return 0; // we have no non-client areas.

			case WM_GETMINMAXINFO:
			{
				if(me && me.mLayout)
				{
					auto m1=cast(HLayout)me.mLayout;
					auto m2=m1?null:cast(HLite)me.mLayout;

					LRESULT lr = DefWindowProcA(mHandle, message, wParam, lParam);
					MINMAXINFO* pmmi = cast(MINMAXINFO*)lParam;
					pmmi.ptMinTrackSize.x = m1?m1.minWidth:m2.minWidth;
					RECT rc;
					GetWindowRect(mHandle,&rc);
					pmmi.ptMinTrackSize.y = m1?m1.minHeight(rc.right - rc.left):m2.minHeight;
					return lr;
				}
				else return 0;
			}

			case WM_CLOSE:
				DestroyWindow(mHandle);
				return 0;

			case WM_DESTROY:
				windows.remove(mHandle);
				if(me) delete *me; // delete window instance!
				PostQuitMessage(0);
				return 0;

			default:
				break;
		 }

		 return DefWindowProcA(mHandle, message, wParam, lParam);
	}

	HWND mHandle;
	HLayoutBase mLayout;
	HElement mBody,mCaption,mButton_min,mButton_max,mButton_icon,mButton_close,mCorner,mDrag;
}