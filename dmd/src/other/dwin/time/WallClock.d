
// Written in the D programming language.

/*******************************************************************************

        Copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: Nov 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/




module dwin.time.WallClock;

private import  tango.time.WallClock,
                tango.time.Time,
                tango.time.ISO8601,
                tango.text.locale.Locale,
                tango.text.locale.Core;


/**
    get string type year, e.g. "2008"

*/

char[] sYear(Time time = WallClock.now)
{
    return (new Locale)("{:yyyy}", time );
}

/**
    get string type month, e.g. "01"
*/

char[] sMonth(Time time = WallClock.now)
{
    return (new Locale)("{:MM}", time);
}


/**
    get string type day, e.g. "31"
*/

char[] sDay(Time time = WallClock.now)
{
    return (new Locale)("{:dd}", time );
}


/**
    get string type of hour, e.g. 23
*/

char[] sHour(Time time = WallClock.now)
{
    return (new Locale)("{:HH}", time );
}


/**
    get string type of min e.g. "37"
*/

char[] sMin(Time time = WallClock.now)
{
    return (new Locale)("{:mm}", time );
}

/**
    get string type of second e.g. "59"
*/

char[] sSec(Time time = WallClock.now)
{
    return (new Locale)("{:ss}", time);
}


/**
    get string type year, month and day. e.g. "20080126" or "26 Jan 2008"
*/


char[] sYearMonthDay(Time time = WallClock.now, bool num = true)
{
    if(num)
        return (new Locale)("{:yyyyMMdd}", time );
    else
        return ( new Locale(Culture.getCulture ("en-US")) ) ("{:dd MMM yyyy}", WallClock.now);
}




/**
    get string type year and month. e.g. "200801" or "Jan 2008"
*/

char[] sYearMonth(Time time = WallClock.now, bool num = true)
{
    if(num)
        return (new Locale)("{:yyyyMM}", time);
    else
        return ( new Locale(Culture.getCulture ("en-US")) ) ("{:MMM yyyy}", WallClock.now);
}


/**
    yyyy'-'MM'-'dd'T'HH': 'mm': 'ss"
    2008-08-08T15:45:08
    Note:  Access Violation when link in from dwin.lib
*/
char[] sSortableDateTime(Time time)
{
    return (new Locale())("{:s}", time);
}
char[] sSortableDateTime()
{
    Time time = WallClock.now;
    return sSortableDateTime(time);
}

unittest
{
    Time t;
    char[] s = "2008-08-08T15:45:08";
    assert(parseDateAndTime(s,t) == s.length);
    assert(sSortableDateTime(t) == s);
}


