module ydb.net.libcurl.model.IEasyCurl;

/** PerformStyle enum , for determing how to handle the input .  For string performs use opCall()*/
enum PerformStyle
  {
    PERFORM_FILE,
    PERFORM_SILENT,
    PERFORM_NORMAL,
    //PERFORM_STRING , use opCall instead
  }

/** EasyCurl interface*/
interface IEasyCurl
{

  /** Performs the operation based on PerformStyle, and returns the response code  */
  long perform(PerformStyle ps = PerformStyle.PERFORM_SILENT, char [] path = "");



}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
