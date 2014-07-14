module ydb.PageRank;


/**
    for get Google Page Rank
    ported from http://www.ekhoury.com/files/Main.java

 */


 import tango.net.Uri;
 import tango.util.Convert;
 import tango.net.http.HttpGet;
 import Util = tango.text.Util;
 debug import tango.util.log.Trace;

private import  tango.time.Time;

 //import tango.core.Exception : SocketException;
 //import dwin.net.Net : isOnline;

public class PageRank {

    /*
    public void buttonClicked() {
        new Thread() {
            public void run() {
                result.setText("Please wait...");
                int res = getPageRank(input.getText());
                if (res != -1) {
                result.setText("<html>Your Google Pagerank is: <strong><span color=red>"+res+ "</span></strong>");
                }
                else {
                    result.setText("Invalid URL! chou 3amb tetmanyak?");
                }
            }
        }.start();
    }
    */
    private static float                timeout = 8f;

    static void setTimeout (float seconds)
    {
            timeout = seconds;
    }

    //setTimeout

    public static int getCheckSum(char[] url) {
        if(!validUrl(url))
            return 0;
        else
            //return generateCheckSum(strord("info:" + url));
            return generateCheckSum("info:" ~ url);
    }

    public static char[] getQueryUrl(char[] url) {
        int checksum;
        checksum = getCheckSum(url);
        if(checksum == 0)
            return null;

        char[] temp = "";
        try {

            //temp = URLEncoder.encode(url, "UTF-8");
            //scope uri = new Uri();
            temp = Uri.encode(url, Uri.IncQuery);
        }
        //catch (UnsupportedEncodingException ex)
        catch (Exception e)
        {
            debug Trace.formatln(e.msg);
        }
        return "http://www.google.com/search?client=navclient-auto&ch=6" ~ to!(char[])(checksum) ~ "&ie=UTF-8&oe=UTF-8&features=Rank" ~ "&q=info:" ~ temp;

    }

    /*
    public static char[] getXmlQueryUrl(char[] url) {
        int checksum;
        checksum = getCheckSum(url);
        if(checksum == 0)
            return null;

        char[] temp = "";
        try {

            temp = URLEncoder.encode(url, "UTF-8");
        } catch (UnsupportedEncodingException ex) {
            ex.printStackTrace();
        }

        return "http://www.google.com/search?client=navclient-auto&ch=6" + checksum + "&ie=UTF-8&oe=UTF-8" + "&q=info:" + temp;

    }
    */

    public static int getPageRank(char[] url)
    {
        auto result = getPageRankStr(url);
        return result !is null && result.length ? to!(int)(result) : -1 ;
    }

    /**
    Returns:
        1.  if the url have not pr, return null;
        2.  if not connected to the internet, throw IOException
        3.  return "0" - "10"

    */
    public static char[] getPageRankStr(char[] url)
    {
        /*
        static bool online;
        static bool onlineChecked;
        if(onlineChecked && !online) return null;
        if(!onlineChecked)
        {
            onlineChecked = true;
            online = isOnline();
        }
        */

        char[] pageRank;
        char[] query = getQueryUrl(url);
        if(!query.length)
            return pageRank;
        //BufferedReader in = null;
        //try
        //{
            scope page = new HttpGet(query);    //will throw IOException here if not connected to the internet
            page.setTimeout(timeout);

            auto content = cast(char[]) page.read;
            //if( !page.isResponseOK ) throw new SocketException("not connected to Internet");

            if(!content.length || content.length < 8 || content[0..4] != "Rank") return pageRank;
            debug Trace.formatln("content {}", content);    /// Rank_1:1:4
            foreach(line; Util.splitLines(content))
            {
                if(Util.contains(line, ':'))
                {
                    auto tokens = Util.delimit(line, ":");
                    if(tokens.length > 2)
                    {
                        pageRank = tokens[2].dup;
                        break;
                    }
                }
            }

            /*
            URL pr = new URL(query);
            URLConnection conn = pr.openConnection();
            in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            char[] line = null;
            do
            {
                if((line = in.readLine()) == null)
                    break;
                if(line.contains(":")) {
                    char[] tokens[] = line.split(":");
                    if(tokens.length > 2)
                        pageRank = Integer.parseInt(tokens[2]);
                }
            } while(true);
            */

        //}
        //catch(Exception e)
             //debug Trace.formatln("getPageRank catch {}", e.msg);
        return pageRank;
    }

    private static bool validUrl(char[] url)
    {
        return url.length && url.length > 4 && url[0..4] == "http";
        /*
        if(url == null || !url.startsWith("http"))
            return false;
        try {
            new URL(url);
        } catch(MalformedURLException e) {
            return false;
        }
        return true;
        */
    }

    /*
    private static int[] strord(char[] str) {
        int[] result = new int[str.length()];
        for(size_t i= 0; i < str.length(); i++)
            result[i] = str.charAt(i);

        return result;
    }
    */

    private static int zeroFill(int a, int b) {
        int z = 0x80000000;
        if((z & a) != 0) {
            a >>= 1;
            a &= ~z;
            a |= 0x40000000;
            a >>= b - 1;
        } else {
            a >>= b;
        }
        return a;
    }

    private static int[] mix(int a, int b, int c) {
        a -= b;
        a -= c;
        a ^= zeroFill(c, 13);
        b -= c;
        b -= a;
        b ^= a << 8;
        c -= a;
        c -= b;
        c ^= zeroFill(b, 13);
        a -= b;
        a -= c;
        a ^= zeroFill(c, 12);
        b -= c;
        b -= a;
        b ^= a << 16;
        c -= a;
        c -= b;
        c ^= zeroFill(b, 5);
        a -= b;
        a -= c;
        a ^= zeroFill(c, 3);
        b -= c;
        b -= a;
        b ^= a << 10;
        c -= a;
        c -= b;
        c ^= zeroFill(b, 15);
        //return (new int[] {a, b, c});
        return ([a, b, c]);
    }

    //private static int generateCheckSum(int url[]) {
    private static int generateCheckSum(char[] url) {
        auto length = url.length;
        int init = 0xe6359a60;
        int a = 0x9e3779b9;
        int b = 0x9e3779b9;
        int c = init;
        int k = 0;
        int len;
        //int mix[];
        int[] mi;
        for(len = length; len >= 12; len -= 12) {
            a += url[k + 0] + (url[k + 1] << 8) + (url[k + 2] << 16) + (url[k + 3] << 24);
            b += url[k + 4] + (url[k + 5] << 8) + (url[k + 6] << 16) + (url[k + 7] << 24);
            c += url[k + 8] + (url[k + 9] << 8) + (url[k + 10] << 16) + (url[k + 11] << 24);
            mi = mix(a, b, c);
            a = mi[0];
            b = mi[1];
            c = mi[2];
            k += 12;
        }

        c += length;
        switch(len) {
            case 11: // '\013'
                c += url[k + 10] << 24;
                // fall through

            case 10: // '\n'
                c += url[k + 9] << 16;
                // fall through

            case 9: // '\t'
                c += url[k + 8] << 8;
                // fall through

            case 8: // '\b'
                b += url[k + 7] << 24;
                // fall through

            case 7: // '\007'
                b += url[k + 6] << 16;
                // fall through

            case 6: // '\006'
                b += url[k + 5] << 8;
                // fall through

            case 5: // '\005'
                b += url[k + 4];
                // fall through

            case 4: // '\004'
                a += url[k + 3] << 24;
                // fall through

            case 3: // '\003'
                a += url[k + 2] << 16;
                // fall through

            case 2: // '\002'
                a += url[k + 1] << 8;
                // fall through

            case 1: // '\001'
                a += url[k + 0];
                // fall through

            default:
                mi = mix(a, b, c);
                break;
        }
        return mi[2];
    }
}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
