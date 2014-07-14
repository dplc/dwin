// Written in the D programming language

/*
 *  Copyright (C) 2002-2007 by Digital Mars, www.digitalmars.com
 *  Written by Walter Bright
 *
 *  This software is provided 'as-is', without any express or implied
 *  warranty. In no event will the authors be held liable for any damages
 *  arising from the use of this software.
 *
 *  Permission is granted to anyone to use this software for any purpose,
 *  including commercial applications, and to alter it and redistribute it
 *  freely, subject to the following restrictions:
 *
 *  o  The origin of this software must not be misrepresented; you must not
 *     claim that you wrote the original software. If you use this software
 *     in a product, an acknowledgment in the product documentation would be
 *     appreciated but is not required.
 *  o  Altered source versions must be plainly marked as such, and must not
 *     be misrepresented as being the original software.
 *  o  This notice may not be removed or altered from any source
 *     distribution.
 */

/* NOTE: This file has been patched from the original DMD distribution to
   work with the GDC compiler.

   Modified by David Friedman, September 2007
*/

/**************************
 * The thread module defines the class $(B Thread).
 *
 * $(B Thread) is the basis
 * for writing multithreaded applications. Each thread
 * has a unique instance of class $(B Thread) associated with it.
 * It is important to use the $(B Thread) class to create and manage
 * threads as the garbage collector needs to know about all the threads.
 * Macros:
 *	WIKI=Phobos/StdThread
 */
 /**
  * Wrapper around Tango thread
  */

module std.thread;
import std.compat;

private import TT = tango.core.Thread;
import std.c.stdio;


/**
 * Thrown for errors.
 */
class ThreadError : Error
{
    this(char[] s)
    {
        super("Thread error: " ~ s);
    }
}

/**
 * One of these is created for each thread.
 */
class Thread
{
    /**
     * Constructor used by classes derived from Thread that override main(). 
     * The optional stacksize parameter default value of 0 will cause threads
     * to be created with the default size for the executable - Dave Fladebo
     */
    this(size_t stacksize = 0)
    {
        t = new TT.Thread(&runImpl, stacksize);
    }

    /**
     * Constructor used by classes derived from Thread that override run().
     */
    this(int (*fp)(void *), void *arg, size_t stacksize = 0)
    {
        this.fp = fp;
        this.arg = arg;
        this(stacksize);
    }

    /**
     * Constructor used by classes derived from Thread that override run().
     */
    this(int delegate() dg, size_t stacksize = 0)
    {
        this.dg = dg;
        this(stacksize);
    }

    /**
     * Create a new thread and start it running. The new thread initializes
     * itself and then calls run(). start() can only be called once.
     */
    void start()
    {
        t.start();
    }

    /**
     * Entry point for a thread. If not overridden, it calls the function
     * pointer fp and argument arg passed in the constructor, or the delegate
     * dg.
     * Returns: the thread exit code, which is normally 0.
     */
    int run()
    {
	if (fp)
	    return fp(arg);
	else if (dg)
	    return dg();
	assert(0);
    }

    /*****************************
     * Wait for this thread to terminate.
     * Simply returns if thread has already terminated.
     * Throws: $(B ThreadError) if the thread hasn't begun yet or
     * is called on itself.
     */
    void wait()
    {
        t.join();
    }

    /******************************
     * Wait for this thread to terminate or until milliseconds time has
     * elapsed, whichever occurs first.
     * Simply returns if thread has already terminated.
     * Throws: $(B ThreadError) if the thread hasn't begun yet or
     * is called on itself.
     */
    void wait(uint milliseconds)
    {
        t.join();
    }

    /**
     * The state of a thread.
     */
    enum TS
    {
        INITIAL,        /// The thread hasn't been started yet.
        RUNNING,        /// The thread is running or paused.
        TERMINATED,     /// The thread has ended.
        FINISHED        /// The thread has been cleaned up
    }

    /**
     * Returns the state of a thread.
     */
    TS getState()
    {
	return t.isRunning ? TS.RUNNING : TS.TERMINATED;
    }

    /**
     * The priority of a thread.
     */
    enum PRIORITY
    {
	INCREASE,	/// Increase thread priority
	DECREASE,	/// Decrease thread priority
	IDLE,		/// Assign thread low priority
	CRITICAL	/// Assign thread high priority
    }

    /**
     * Adjust the priority of this thread.
     * Throws: ThreadError if cannot set priority
     */
    void setPriority(PRIORITY p)
    {
        error("not supported in Tango thread proxy");
    }

    /**
     * Returns true if this thread is the current thread.
     */
    bool isSelf()
    {
        error("not supported in Tango thread proxy");
        return false;
    }

    /**
     * Returns a reference to the Thread for the thread that called the
     * function.
     */
    static Thread getThis()
    {
        error("not supported in Tango thread proxy");
        return null;
    }

    /**
     * Returns an array of all the threads currently running.
     */
    static Thread[] getAll()
    {
        error("not supported in Tango thread proxy");
        return null;
    }

    /**
     * Suspend execution of this thread.
     */
    void pause()
    {
        error("not supported in Tango proxy class");
    }

    /**
     * Resume execution of this thread.
     */
    void resume()
    {
        error("not supported in Tango proxy class");
    }

    /**
     * Suspend execution of all threads but this thread.
     */
    static void pauseAll()
    {
        TT.thread_suspendAll();
    }

    /**
     * Resume execution of all paused threads.
     */
    static void resumeAll()
    {
        TT.thread_resumeAll();
    }

    /**
     * Give up the remainder of this thread's time slice.
     */
    static void yield()
    {
        t.yield();
    }

    /**
     *
     */
    static uint nthreads = 1;

private:
    TS state;

    int (*fp)(void *);
    void *arg;

    int delegate() dg;

    static void error(char[] msg)
    {
        throw new ThreadError(msg);
    }

    void runImpl()
    {
        run();
    }

    private TT.Thread t;
}
