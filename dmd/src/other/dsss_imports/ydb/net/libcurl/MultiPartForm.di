module ydb.net.libcurl.MultiPartForm;



private import ydb.net.libcurl.c.curl;
//private import libcurl.c.curl;
private import ydb.net.libcurl.model.IMultiPartForm;
private import ydb.net.libcurl.PlatForm;

/** MultiPartForm class, used form type="multipart" ( uploading files ) */

class MultiPartForm : IMultiPartForm
{



  /** Adds a file to the parameters to send */
  bool addFile(char [] parmName , char [] file)
  {

    return !curl_formadd(&post, &last, CURLFORM_COPYNAME,c_str(parmName ) ,
			 CURLFORM_FILE,c_str(file),
			 CURLFORM_END);
  }

  /** Adds a field to the parameters to send */
  bool addField(char [] parmName,char [] value)
  {

    return !curl_formadd(&post, &last,
			 CURLFORM_COPYNAME,c_str(parmName),
			 CURLFORM_COPYCONTENTS, c_str(value ),
			 CURLFORM_END);
  }

  curl_httppost *post;
  curl_httppost *last;

}


version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
