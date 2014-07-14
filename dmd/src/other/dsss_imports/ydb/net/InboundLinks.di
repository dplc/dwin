// Written in the D programming language.

/*******************************************************************************

        Copyright:      Copyright (c) 2008  (yidabu  g m a i l at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: June 2008

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/


module ydb.net.InboundLinks;

private import TextUtil = tango.text.Util;
private import tango.text.Ascii;
private import tango.net.http.HttpGet;
private import tango.util.Convert;
private import tango.time.Time;

private import dwin.sys.Process;
private import dwin.text.scregexp;

debug import tango.util.log.Trace;


/**
    Example:
    ---
        auto links = new InboundLinks("http://eye-care.software-download.name");
        auto re = links.onePerSite();
        foreach(k,link; re)
        {
            Stdout(k ~ " = " ~ link).newline;
        }

    ---
    See_Also: http://developer.yahoo.com/search/siteexplorer/V1/inlinkData.html

    yahoo backlink application id
        PICwC4rV34EUJM9tMnHPfqoKVq_Mwadqkh0dn_p98STJTttWWBLfMIXsf6_y9w--

    yahoo web search application id is
        E3yEw0zV34FiiK11tvGCJtrfChSpN1ZrLdXgqbtjcTgX3f1DKitjLLWMnLQzVg--

*/


class InboundLinks
{

    this(char[] query_)
    {
        this.query = query_;
    }

    private static float                timeout = 5;

    static void setTimeout (uint seconds)
    {
            timeout = seconds;
    }

    int totalResultsAvailable;     //The number of URLs in the database that link to the domain or page.
    //int firstResultPosition;            //he number of URLs returned. This may be lower than the number of results requested if there were fewer total results available.
    //int totalResultsReturned;           //The position of the first URL in the overall result set.

    private static char[] base = "http://search.yahooapis.com/SiteExplorerService/V1/inlinkData";
    static char[] appid = "PICwC4rV34EUJM9tMnHPfqoKVq_Mwadqkh0dn_p98STJTttWWBLfMIXsf6_y9w--";               //string (required)  	 The application ID. See Application IDs for more information.
    char[] query;               //string (required) 	The domain or path to get inlink data for.
    char[] results = "100";     // 	integer: default 50, max 100 	The number of results to return.
    char[] start = "1";         // 	integer: default 1 	The starting result position to return (1-based). The finishing position (start + results - 1) cannot exceed 1000.
    char[] entire_site = ""; 	//no value (default), or 1 	Specifies whether to provide results for the entire site, or just the page referenced by the query. If the query is not a domain URL (i.e. it contains path information, such as http://smallbusiness.yahoo.com/webhosting/), this parameter has no effect.
    char[] omit_inlinks = "";   // 	none (default), domain, or subdomain 	If specified, inlinks will not be returned if they are from pages in the same domain/subdomain as the requested page.
    char[] output = "xml";      // 	string: xml (default), json, php 	The format for the output. If json is requested, the results will be returned in JSON format. If php is requested, the results will be returned in Serialized PHP format.
    char[] callback = "";       // 	string 	The name of the callback function to wrap around the JSON data. The following characters are allowed: A-Z a-z 0-9 . [] and _. If output=json has not been requested, this parameter has no effect. More information on the callback can be found in the Yahoo! Developer Network JSON Documentation.


    bool validQueryUrl()
    {
        return appid.length && query.length > 5 && query[0..5] == "http:" ;
    }
    char[] getQueryUrl()
    {
        return base ~ "?" ~
        "appid=" ~ appid ~ "&" ~
        "query=" ~ query ~ "&" ~
        "results=" ~ results ~ "&" ~
        "start=" ~ start ~ "&" ~
        "entire_site=" ~ entire_site ~ "&" ~
        "omit_inlinks=" ~ omit_inlinks ~ "&" ~
        "output=" ~ output ~ "&" ~
        "callback=" ~ callback;
    }

    char[] get()
    {
        if(!validQueryUrl()) return null;
        auto query = getQueryUrl();

        char[] result;
        try
        {
            scope page = new HttpGet(query);    //will throw IOException here if not connected to the internet
            page.setTimeout(timeout);

            result = cast(char[]) page.read;
        }
        catch(Exception e)
                debug Trace.formatln("get catch {}", e.msg);
        return result;
    }

    static bool validResult(char[] result)
    {
        return result !is null && result.length &&
            TextUtil.containsPattern(result, "totalResultsAvailable") &&
            TextUtil.containsPattern(result, "<Url>");
    }

    //移除网址前缀，以简明显示
    static char[] getDomain(char[] s)
    {
        auto result = s;
        result = TextUtil.chopl( result, "http://" );
        result = TextUtil.chopl( result, "https://" );
        result = TextUtil.chopl( result, "www." );
        result = TextUtil.chopr( result, "/" );
        result = TextUtil.delimit(result, "/")[0];
        return toLower(result);
    }
    //

    char[][char[]] onePerSite()
    {
        char[][char[]] result;

        auto all = parse();
        if(!all.length) return null;
        foreach(url; all)
        {
            auto domain = getDomain(url);
            if((domain in result) is null)
                result[domain] = url;
            else
            {
                if(result[domain].length > url.length)
                    result[domain] = url;
            }
        }
        return result;
    }

    char[][] parse()
    {
        char[][] result;

        results = "1";
        auto strGet = get();
        if(!validResult(strGet)) return null;

        scope regex = new screg!("totalResultsAvailable=\"([^\"]+)\"");
        if(!regex.match(strGet)) return null;
        totalResultsAvailable = to!(int)(regex._(1));

        results = "100";
        strGet = "";
        for(size_t i= 1; i < 1000 && i < totalResultsAvailable; i += 100)
        {
            start = to!(char[])(i);
            auto tmp = get();
            if(!validResult(tmp)) break;
            strGet ~= tmp;
            doEvents(50);
        }

        if(!validResult(strGet)) return null;
        scope regex2 = new screg!("<Url>(.+?)</Url>");
        while(regex2.match(strGet))
        {
            result ~= regex2._(1);
        }
        return result;
    }

}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
