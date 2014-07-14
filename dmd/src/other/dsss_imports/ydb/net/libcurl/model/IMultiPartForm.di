module ydb.net.libcurl.model.IMultiPartForm;

/** Interface for MultiPartForm */

interface IMultiPartForm
{
  /** Adds a file to the parameters to send */
  bool addFile(char [] parmName , char [] file);

  /** Adds a field to the parameters to send */
  bool addField(char [] parmName,char [] value);

}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
