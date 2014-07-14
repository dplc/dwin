/**
    Authors: http://www.the-charlie.com/
    License: unknown
    
    libcurl 7.16.0 with D programming language
    
    modified by yidabu to works with recent Tango ( D China http://www.d-programming-language-china.org/ )
    Date: January 10, 2011
        
    Libs, dlls:
    dwin/lib/libcurl-4.dll
    dwin/lib/libcurl-4.lib
    dwin/lib/libeay32.dll
    dwin/lib/libssl32.dll
    
    copy libcurl-4.dll into exe directory
    
    Example:
    ------------
  EasyCurl curl = new EasyCurl();
  curl.url = "http://www.d-programming-language-china.org/";
  char [] buffer = curl(); // PERFORM_STRING            
    ------------
*/


module ydb.net.libcurl.EasyCurl;

version(Tangobos):

version(Win32)
    { pragma(lib, "libcurl-4.lib"); }

public  import ydb.net.libcurl.c.curl;
//public  import libcurl.c.curl;
public  import ydb.net.libcurl.MultiPartForm;
public  import ydb.net.libcurl.model.IEasyCurl;
private import ydb.net.libcurl.PlatForm;

struct ProxyData {
	char [] url;
	char [] userName;
	char [] password;
	curl_proxytype type;
	long authType;
}

struct FormField {
	char [] name;
	char [] value;
}



/** EasyCurl class , for POSTing, GETing, and PUTing to websites */
class EasyCurl : IEasyCurl
{
    
private:

    CURL* curl;
    char* curlError;

    ProxyData mProxyData;

public:

    char [] host; /// current URL
    char [] parameters; /// parameters for POST / GET 
    CURLcode lastCode; // last CURLcode


    static char [] buffer; /// Used for PERFORM_STRING


    /* these fields are used for callbacks */
    static progressFunction progressFunc;
    static writeFunction writeFunc;
    static readFunction readFunc;
    static debugFunction debugFunc;

    version ( Phobos )
    {
        static File file;
    }
    version ( Tango )
    {
        static File file;
    }


    //* Construcor takes  a url as an argument *//
    this( char [] url_= "" )
    out
    {
        assert(curl !is null);
    }
    body
    {
        curl = curl_easy_init();
        curlError = (new char[CURL_ERROR_SIZE]).ptr;
        curl_easy_setopt(curl,CURLOPT_ERRORBUFFER,curlError );
        host = url_;
        setOpt( CURLOPT_URL,host );
        
        version ( Phobos )
        {
            file = new File();
        }
    }

    //January 9, 2011
    ~this()
    {
        cleanup();
    }

    /** read property for host parameter */

    char [] url () { return host; }

    /** write property for host paramter */

    void url( char [] u ) { host = u; setOpt(CURLOPT_URL , host); }


    /** write property for multipartform */

    void multiPartForm( MultiPartForm m )
    {
        curl_easy_setopt(curl, CURLOPT_HTTPPOST, m.post);
    }

    /** Use opCall for PerformStyle.PERFORM_STRING, it returns the HTML buffer */
    char [] opCall()
    {
        char [] ret;
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, &stringCallback );
        lastCode = curl_easy_perform(curl);
        ret = buffer;
        buffer = "";
        return ret;
    }

    /** for FILE , NORMAL and SILENT performs */ 
    long perform(PerformStyle ps = PerformStyle.PERFORM_SILENT , char [] path = "")
    {

        switch ( ps )
        {
            case PerformStyle.PERFORM_NORMAL:
            {
                curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, &normalCallback );
                lastCode = curl_easy_perform(curl);
                break;
            }

            case PerformStyle.PERFORM_SILENT:
            {
                curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, &silentCallback );
                lastCode = curl_easy_perform(curl);
                break;
            }
            case PerformStyle.PERFORM_FILE:
            {
                version ( Phobos )
                {
                    try
                    {
                        file.create(path);
                        file.open(path,FileMode.Out );
                    }                
                    catch (Object e )
                    {
                        close;
                        throw e;
                    }
                    
                    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, &fileCallback );
                    lastCode = curl_easy_perform(curl);
                    file.close();
                }
                else version ( Tango )
                {
                    if ( file !is null ) 
                    {
                        //delete file;
                        file.close(); //January 9, 2011
                    }
                    file = new File(path,File.ReadWriteCreate);
                    scope(exit)
                        file.close();            
                    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, &fileCallback );
                    lastCode = curl_easy_perform(curl);

                }
                            
                break;
            }
            default:
          }

        return responseCode;

    }


    long responseCode()
    {
        long code;
        curl_easy_getinfo(curl,CURLINFO_RESPONSE_CODE,&code);

        return code;
    }


    /** setopt for string values , see <a href='http://curl.haxx.se/libcurl/c/curl_easy_setopt.html'> http://curl.haxx.se/libcurl/c/curl_easy_setopt.html </a> */

    bool setOpt(CURLoption opt, char [] str )
    {
        return curl_easy_setopt (curl, opt,c_str(str) ) == CURLE_OK;
    }

    /** setopt for long values , see <a href='http://curl.haxx.se/libcurl/c/curl_easy_setopt.html'> http://curl.haxx.se/libcurl/c/curl_easy_setopt.html </a> */
    bool setOpt(CURLoption opt, long val )
    {
        return curl_easy_setopt (curl, opt, val)  == CURLE_OK;
    }
    
	bool setOpt(CURLoption opt, int optData) {				
		return curl_easy_setopt(curl, opt, optData) == CURLE_OK;
	
	}

	bool setOpt(CURLoption opt, bool optData) {		
		return curl_easy_setopt(curl, opt, optData) == CURLE_OK;
	}

	bool setOpt(CURLoption opt, void * optData) {		
		return curl_easy_setopt(curl, opt, optData) == CURLE_OK;
	}    


    /** Set the user agent, see UserAgents module for common settings */

    bool userAgent(char [] user ) 
    {
        return setOpt(CURLOPT_USERAGENT,user );
    }

    /** Set the refering page */

    bool referer(char [] refPage )
    {
        return setOpt(CURLOPT_REFERER ,refPage );
    }
    /** Follows redirected pages */

    bool followRedirect(int state )
    {
        return setOpt(CURLOPT_FOLLOWLOCATION, state );
    }

    /** Use the built in cookie parser */

    bool useCookieEngine()
    {
        return setOpt(CURLOPT_COOKIEFILE, "hopefullythisfiledoesntexit" );
    }

    void proxy(ProxyData pData) {
        mProxyData = pData;
        setOpt( CURLOPT_PROXY, pData.url);
        if (pData.userName != null) {
            setOpt( CURLOPT_PROXYUSERPWD, UriEncode(pData.userName) ~ ":" ~ UriEncode(pData.password));
        }
        setOpt( CURLOPT_PROXYTYPE, pData.type);
        if (pData.authType != 0)
            setOpt( CURLOPT_PROXYAUTH, pData.authType);		
        else 
            setOpt( CURLOPT_PROXYAUTH, CURLAUTH_ANY);
    }

    ProxyData proxy() {
        return mProxyData;
    }

    /* Error functions

    /** get the last error */

    char [] error ()
    {
        return d_str(curlError);
    }

    char [] easyError()
    {
    return d_str(curl_easy_strerror(lastCode));
    }


    /** Close the handle */
    void cleanup() { curl_easy_cleanup(curl); }


    /** Callback for progress */
    alias int function (void *clientp,
              double dltotal,
              double dlnow,
              double ultotal,
              double ulnow) progressFunction;


    /** Callback for writeing, good for redirecting the output to another source */
    alias size_t function (char *buffer,
             size_t size,
             size_t nitems,
             void *outstream) writeFunction;

    /** Callback for reading, good for redirecting the input to another source */
    alias size_t function (char *buffer,
             size_t size,
             size_t nitems,
             void *instream) readFunction;

    /** libcurl's debug function , see <a href='http://curl.haxx.se/libcurl/c/curl_easy_setopt.html#CURLOPTDEBUGFUNCTION'>http://curl.haxx.se/libcurl/c/curl_easy_setopt.html#CURLOPTDEBUGFUNCTION</a> */

    alias int function (CURL *handle,
              curl_infotype type,
              char *data,
              size_t size,
              void *userptr) debugFunction;


    /** write only progress setter */
    void progress( progressFunction p )
    in
    {
    assert(p !is null);
    }
    body
    {
    curl_easy_setopt(curl,CURLOPT_NOPROGRESS,0);
    curl_easy_setopt(curl,CURLOPT_PROGRESSFUNCTION,&progressCallback );
    progressFunc = p;
    }

    /** write only write setter */
    void write( writeFunction w )
    in
    {
    assert( w !is null );
    }
    body
    {
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION,&writeCallback );
    writeFunc = w;
    }

    /** write only read  setter */
    void read( readFunction r )
    in
    {
    assert(r !is null);
    }
    body
    {
    curl_easy_setopt(curl, CURLOPT_READFUNCTION,&readCallback );
    readFunc =r ;
    }

    /** write only debug  setter */
    void debugCallback( debugFunction d )
    in
    {
    assert ( d !is null );
    }
    body
    {
    curl_easy_setopt(curl, CURLOPT_DEBUGFUNCTION,&debugCallback );
    debugFunc =d ;

    }


    // C callbacks

    extern (C) static size_t normalCallback( void* ptr, size_t size , size_t nmemb, void* up )
    {
        puts(cast(char*)ptr);
        return size*nmemb;
    }

    extern (C) static size_t silentCallback( void* ptr, size_t size , size_t nmemb, void* up )
    {
        return size*nmemb;
    }

    extern (C) static size_t stringCallback( void* ptr, size_t size , size_t nmemb, void* up )
    {
        char [] str = d_str(cast(char*)ptr);
        if ( str.length  )
          buffer ~= str[0 .. (size * nmemb)]  ;

        return size*nmemb;
    }


    extern (C) static size_t fileCallback( void* ptr, size_t size , size_t nmemb, void* up )
    {

    version ( Phobos )
      {


        file.writeBlock(ptr,size*nmemb);

      }
    else version ( Tango )
      {

        file.write(ptr[0 .. (size*nmemb)-1]);

      }


    return size*nmemb;
    }

    extern (C) static int progressCallback(void *clientp,
                     double dltotal,
                     double dlnow,
                     double ultotal,
                     double ulnow)
    {
    return progressFunc(clientp, dltotal, dlnow, ultotal, ulnow );


    }


    extern(C) static size_t writeCallback(char *buffer,
                    size_t size,
                    size_t nitems,
                    void *outstream)
    {
    return writeFunc(buffer, size, nitems, outstream );

    }

    extern(C) static size_t readCallback(char *buffer,
                       size_t size,
                       size_t nitems,
                       void *instream)
    {
    return readFunc(buffer,size,nitems,instream);
    }

    extern(C) static int debugCallback (CURL *handle,      /* the handle/transfer this concerns */
                      curl_infotype type, /* what kind of data */
                      char *data,        /* points to the data */
                      size_t size,       /* size of the data pointed to */
                      void *userptr)
    {    /* whatever the user please */

    return debugFunc(handle,type,data,size,userptr );
    }



    // ~ C Callbacks



  
}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
