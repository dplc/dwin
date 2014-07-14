
// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2007  (yidabu  g m a i l at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: Dec 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module ydb.astrology.Calendar;

private import  ydb.astrology.WuZhu,
                ydb.Crypt;
    
private import dwin.text.Util;
    
private import tango.text.Util;
    
//version(ydbVerbose)
    private import tango.util.log.Trace;
        

/**
    the struct used for "2008 Calendar Chinese New Year"
*/
struct My2008
{
    /*
    static const char[] forecast        
             = ob!( "My name is calendar, my birth date is December 27, 2007, today is January 1, 2008, is it a lucky day for my love?"),
        name = "calendar",
        birthMonth = "December",
        birthDay   = "27",
        birthYear  = "2007",
        todayMonth = "January",
        todayDay   = "1",
        todayYear  = "2008",
        dayType    = "lucky"    //or bad, 余下的就是一般
        forecastType = "love";
    */
    
    char[]  name,
            birthMonth,
            birthDay,
            birthYear,
            todayMonth,
            todayDay,
            todayYear,
            dayType,
            forecastType;
            
    alias parse opCall;
    char[] parse()
    {
        assert(name.length && 
            birthMonth.length && birthDay.length && birthYear.length && 
            todayMonth.length && todayDay.length && todayYear.length && 
            dayType.length && forecastType.length, "you must specify the value in My2008 struct");
                
        
        return "My name is " ~ name ~ 
            ", my birth date is " ~ birthMonth ~ " " ~ birthDay ~ ", " ~ birthYear ~
            ", today is " ~ todayMonth ~ " " ~ todayDay ~ ", " ~ todayYear ~
            ", is it a " ~ dayType ~ " day for my " ~ forecastType ~ "?";
    }
    
}
//My2008


class Calendar
{

    /**
        Params:
            str = the arbitriry sring , e.g. "my name is calendar"
            sex = 0 means female, 1 means male
    */
    static bool ca2008(int i, size_t sex)
    {
        //char[] dec = substitute( strToDecimal(str), " ", "" );
        
        auto wz = WuZhu(i);  
        //Trace.formatln(
        return wz.meGan % 2 == sex;
    }    

    
    
    
    
    
    
}


debug(UnitTest) unittest
{
    
}
version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
