/*

This is based on HTMLayout's gui_queue

*/

module flowerd.syncexec;

import tango.sys.win32.Types;
public import tango.core.Thread;
public import tango.core.sync.Mutex;

extern(Windows)
{
	alias VOID function(HWND, UINT, UINT, DWORD) TIMERPROC;
	UINT SetTimer(HWND hWnd, UINT nIDEvent, UINT uElapse, TIMERPROC lpTimerFunc);
	BOOL KillTimer(HWND hWnd, UINT uIDEvent);
	BOOL PostMessageA(HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam);
}

/*class GuiQueue
{
	this() {syncCtor();}
	~this() {syncDtor();}

	mixin SyncExec;
}*/

//the interval delegate should return false to stop the interval and true to continue
template TimerExec(THIS_TYPE)
{
	uint setInterval(uint time,bool delegate(uint,Object) dg,Object param=null) {return mSetTimer(time,new TIMEREXEC_BOOL1(dg,param));}
	uint setInterval(uint time,bool delegate(uint) dg) {return mSetTimer(time,new TIMEREXEC_BOOL2(dg));}
	uint setInterval(uint time,bool delegate(Object) dg,Object param=null) {return mSetTimer(time,new TIMEREXEC_BOOL1A(dg,param));}
	uint setInterval(uint time,bool delegate() dg) {return mSetTimer(time,new TIMEREXEC_BOOL2A(dg));}
	uint setInterval(uint time,void delegate(uint,Object) dg,Object param=null) {return mSetTimer(time,new TIMEREXEC_VOID1(dg,param,true));}
	uint setInterval(uint time,void delegate(uint) dg) {return mSetTimer(time,new TIMEREXEC_VOID2(dg,true));}
	uint setInterval(uint time,void delegate(Object) dg,Object param=null) {return mSetTimer(time,new TIMEREXEC_VOID1A(dg,param,true));}
	uint setInterval(uint time,void delegate() dg) {return mSetTimer(time,new TIMEREXEC_VOID2A(dg,true));}
	uint setTimeout(uint time,void delegate(uint,Object) dg,Object param=null) {return mSetTimer(time,new TIMEREXEC_VOID1(dg,param,false));}
	uint setTimeout(uint time,void delegate(uint) dg) {return mSetTimer(time,new TIMEREXEC_VOID2(dg,false));}
	uint setTimeout(uint time,void delegate(Object) dg,Object param=null) {return mSetTimer(time,new TIMEREXEC_VOID1A(dg,param,false));}
	uint setTimeout(uint time,void delegate() dg) {return mSetTimer(time,new TIMEREXEC_VOID2A(dg,false));}

	bool clearTimer(uint id)
	{
		if(KillTimer(null,id)!=0)
		{
			auto t=id in mTimers;
			if(t) delete *t;
			return true;
		}
		else return false;
	}

protected:

	uint mSetTimer(uint time,TIMEREXEC t)
	{
		if(time==0) return 0;
		t.id=cast(uint)SetTimer(null,0,time,&mTimerProc);
		if(t.id==0) {delete t;return 0;}
		mTimers[t.id]=t;
		return t.id;
	}

	static extern(Windows) void mTimerProc(HWND hwnd, UINT uMsg, UINT idEvent, DWORD dwTime)
	{
		auto t=idEvent in mTimers;
		if(t && t.exec()==false) t.outer.clearTimer(idEvent);
	}

	class TIMEREXEC
	{
		this(Object o=null) {param=o;}
		~this(){mTimers.remove(id);}
		bool exec(){return false;}

		uint id;
		Object param;
	}

	class TIMEREXEC_BOOL1 : THIS_TYPE.TIMEREXEC
	{
		this(bool delegate(uint,Object) dg,Object o) {this.dg=dg; super(o);}
		bool exec(){return dg(id,param);}

		bool delegate(uint,Object) dg;
	}

	class TIMEREXEC_BOOL2 : THIS_TYPE.TIMEREXEC
	{
		this(bool delegate(uint) dg) {this.dg=dg;}
		bool exec(){return dg(id);}

		bool delegate(uint) dg;
	}

	class TIMEREXEC_BOOL1A : THIS_TYPE.TIMEREXEC
	{
		this(bool delegate(Object) dg,Object o) {this.dg=dg; super(o);}
		bool exec(){return dg(param);}

		bool delegate(Object) dg;
	}

	class TIMEREXEC_BOOL2A : THIS_TYPE.TIMEREXEC
	{
		this(bool delegate() dg) {this.dg=dg;}
		bool exec(){return dg();}

		bool delegate() dg;
	}

	class TIMEREXEC_VOID1 : THIS_TYPE.TIMEREXEC
	{
		this(void delegate(uint,Object) dg,Object o,bool ret) {this.dg=dg; this.ret=ret; super(o);}
		bool exec(){dg(id,param);return ret;}

		bool ret;
		void delegate(uint,Object) dg;
	}

	class TIMEREXEC_VOID2 : THIS_TYPE.TIMEREXEC
	{
		this(void delegate(uint) dg,bool ret) {this.dg=dg; this.ret=ret;}
		bool exec(){dg(id);return ret;}

		bool ret;
		void delegate(uint) dg;
	}

	class TIMEREXEC_VOID1A : THIS_TYPE.TIMEREXEC
	{
		this(void delegate(Object) dg,Object o,bool ret) {this.dg=dg; this.ret=ret; super(o);}
		bool exec(){dg(param);return ret;}

		bool ret;
		void delegate(Object) dg;
	}

	class TIMEREXEC_VOID2A : THIS_TYPE.TIMEREXEC
	{
		this(void delegate() dg,bool ret) {this.dg=dg; this.ret=ret;}
		bool exec(){dg();return ret;}

		bool ret;
		void delegate() dg;
	}

	static TIMEREXEC[uint] mTimers;
}

// this one needs to be created as singleton - one instance per GUI thread(s)
template SyncExec(THIS_TYPE)
{
	void syncCtor()
	{
		mThread=Thread.getThis;
		auto r=mThread in mGuiThreads;
		if(r && *r) throw new Exception("One SyncExec instance per GUI thread!");
		mGuiThreads[mThread]=true;
		mGuard=new Mutex;
		//mGuard2=new Mutex;
	}

	void syncDtor()
	{
		mGuiThreads.remove(mThread);
		delete mGuard;
		//delete mGuard2;
	}

	void asyncExec(void delegate(Object) dg,Object param=null)
	{
		auto job=new SYNCEXEC_1(dg,param);
		mAsyncExec(job);
	}

	void asyncExec(void delegate() dg)
	{
		auto job=new SYNCEXEC_2(dg);
		mAsyncExec(job);
	}

/* these hang sometimes
	void syncExec(void delegate() dg)
	{
		auto th=Thread.getThis;
		if(th is mThread) dg();
		else
		{
			synchronized(mGuard2)
			{
				if(bSyncExecDone==false || bASyncExecDone==false) throw new Exception("Calling syncExec from syncExec is not possible!");
				bSyncExecDone=false;
			}
			asyncExec(dg);
			while(bSyncExecDone==false) th.yield;
		}
	}

	void syncExec(void delegate(Object) dg,Object param=null)
	{
		auto th=Thread.getThis;
		if(th is mThread) dg(param);
		else
		{
			synchronized(mGuard2)
			{
				if(bSyncExecDone==false || bASyncExecDone==false) throw new Exception("Calling syncExec from syncExec is not possible!");
				bSyncExecDone=false;
			}
			asyncExec(dg,param);
			while(bSyncExecDone==false) th.yield;
		}
	}
*/

	// Place this call after GetMessage()/PeekMessage() in main loop
	void execute()
	{
		if(Thread.getThis !is mThread) throw new Exception("Calling SyncExec.execute from a wrong thread!");
		synchronized(mGuard)
		{
			//bASyncExecDone=false;
			SYNCEXEC next;
			while((next = pop()) !is null)
			{
				next.exec(); // do it
				delete next;
			}
			//bSyncExecDone=true;
			//bASyncExecDone=true;
		}
	}

protected:
	void mAsyncExec(SYNCEXEC job)
	{
		synchronized(mGuard)
		{
			if(mTail) mTail.next = job;
			else mHead=job;
			mTail=job;
		}
		PostMessageA(handle, WM_NULL, 0,0);
	}

	SYNCEXEC pop()
	{
		//synchronized(guard)
		{
			if(mHead is null) return null;
			SYNCEXEC t = mHead;
			mHead = mHead.next;
			if(mHead is null) mTail = null;
			return t;
		}
	}

	class SYNCEXEC
	{
		this(Object o=null) {param=o;}
		void exec(){}

		SYNCEXEC next;
		Object param;
	}

	class SYNCEXEC_1 : THIS_TYPE.SYNCEXEC
	{
		this(void delegate(Object) dg,Object o) {this.dg=dg; super(o);}
		void exec(){dg(param);}

		void delegate(Object) dg;
	}

	class SYNCEXEC_2 : THIS_TYPE.SYNCEXEC
	{
		this(void delegate() dg) {this.dg=dg;}
		void exec(){dg();}

		void delegate() dg;
	}

	SYNCEXEC mHead;
	SYNCEXEC mTail;
	Mutex mGuard;
	//Mutex mGuard2;
	Thread mThread;
	static bool[Thread] mGuiThreads;
	//bool bSyncExecDone=true,bASyncExecDone=true;
}
version (build) {
    debug {
        pragma(link, "debug-flowerd");
    } else {
        pragma(link, "flowerd");
    }
}
