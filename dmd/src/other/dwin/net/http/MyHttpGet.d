// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2009  (dyuyan  gmail at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: June 2009

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/



module dwin.net.http.MyHttpGet;


//no public may causes OPTLINK error
private import tango.net.http.HttpClient;
private import tango.net.http.HttpConst;
private import tango.net.Uri;

class MyHttpGet : HttpClient
{      
        alias HttpClient.read read;

        /***********************************************************************
        
                Create a client for the given URL. The argument should be
                fully qualified with an "http:" or "https:" scheme, or an
                explicit port should be provided.

        ***********************************************************************/

        this (char[] url)
        {
                this (new Uri(url));
        }

        /***********************************************************************
        
                Create a client with the provided Uri instance. The Uri should 
                be fully qualified with an "http:" or "https:" scheme, or an
                explicit port should be provided. 

        ***********************************************************************/

        this (Uri uri)
        {
                super (HttpClient.Get, uri);
        }

        /***********************************************************************
        
        ***********************************************************************/

        void[] read (int len = int.max)
        {
                auto buffer = super.open;
                try {
                    if (super.isResponseOK)
                        buffer.load ( (len != int.max) ? len : getResponseHeaders.getInt(HttpHeader.ContentLength));
                    } finally {super.close;}
                return buffer.slice;
        }
}
