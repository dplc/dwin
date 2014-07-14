/*****************************************************************************************
 *  Program benchmarking utilities.
 *
 *  $(CASHEW_HEAD)
 *
 *  Version: 0.4.1
 *
 *  Authors:
 *    Christopher Nicholson-Sauls<br />
 *
 *  Date: Jan 26, 2008
 *
 */
module ydb.cashew.utils .Benchmark ;

/*****************************************************************************************
 * Imports
 */
version (Tango) {
    import tango .io   .Stdout    ;
    import tango .time .StopWatch ;
}
else {
    static assert(false, "ydb.cashew.utils.Benchmark: Phobos not currently supported.");
}

/*****************************************************************************************
 *  A scoped class for benchmarking a block/scope of code.  This is really just a Tango
 *  StopWatch with a label and auto-destruct.
 *
 * --------------------------------------------------------------------------------------
 *  ulong bar = 2 ;
 *
 *  { scope Foo = new ScopedBenchmark("math loop");
 *      for (int i; i < 10_000_000; i++) {
 *          bar = ((bar * 2) + (bar / 2)) - bar;
 *      }
 *  }
 * --------------------------------------------------------------------------------------
 */
public scope class ScopedBenchmark {

    /***********************************************************************************
     *  Params:
     *      label = A textual label to identify the benchmark
     */
    public this (char[] label) {
        this.label = label ;

        timer.start;
    }

    /***********************************************************************************
     *  Destructor
     */
    public ~this () {
        auto elapse = timer.stop;
        Stdout.formatln("<Benchmark {}> {,10:6f}", label, elapse).flush;
    }

    /***********************************************************************************
     *  The textual label associated with this benchmark.
     */
    private char[] label ;

    /***********************************************************************************
     *  Timer for this benchmark.
     */
    private StopWatch timer ;

} // end class ScopedBenchmark


/*****************************************************************************************
 *  A class for benchmarking code which compares later results against an original.
 * 
 * --------------------------------------------------------------------------------------
 *  scope bench = new BaselineBenchmark("alternatives");
 *
 *  bench.begin;  foo = someFunc       (foo);  bench.end;
 *  bench.begin;        someFuncInline (foo);  bench.end;
 *  bench.begin;  foo = someFuncOther  (foo);  bench.end;
 * --------------------------------------------------------------------------------------
 */
public class BaselineBenchmark {

    /***********************************************************************************
     *  Params:
     *      label = A textual label to identify the benchmark
     */
    public this (char[] label) {
        this.label = label ;

        reset();
    }

    /***********************************************************************************
     *  Start a new benchmark.
     */
    public void begin () {
        timer.start;
    }

    /***********************************************************************************
     *  End the current benchmark.
     */
    public void end () {
        auto elapse = timer.stop ;

        Stdout.format("<Benchmark {}> ", label);
        if (baseline == 0.0L) {
            baseline = elapse;
            Stdout.formatln("Baseline {,10:6f}", elapse).flush;
        }
        else {
            Stdout.formatln("Time     {,10:6f} ({,10:6f} versus baseline)",
                elapse,
                baseline / elapse
            ).flush;
        }
    }

    /***********************************************************************************
     *  Clear the baseline.
     */
    public void reset () {
        baseline = 0.0L;
    }

    /***********************************************************************************
     *  The textual label associated with these benchmarks.
     */
    private char[] label ;

    /***********************************************************************************
     *  Timer for this benchmark.
     */
    private StopWatch timer ;

    /***********************************************************************************
     *  The baseline time for these benchmarks.
     */
    private double baseline ;

} // end class BaselineBenchmark

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
