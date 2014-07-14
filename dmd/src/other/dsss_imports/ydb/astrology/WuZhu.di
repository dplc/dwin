
// Written in the D programming language.

/*******************************************************************************
        
        copyright:      Copyright (c) 2007  (yidabu  g m a i l at com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: 2007

        author:         yidabu ( D programming language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module ydb.astrology.WuZhu;

private import  tango.text.convert.Integer,
                tango.text.Util,
                tango.text.Unicode,

                tango.util.Convert,
                tango.core.Traits,
                tango.core.Exception,
                tango.math.Math;

    
private import  dwin.math.Bignumber, 
                dwin.math.Scale,
                ydb.math.bigint.Bigint,
                //dwin.math.Util,
                //dwin.math.Templ,

                dwin.core.Ctfe,
                dwin.text.TextConst,
                dwin.text.Util;
                

private import  ydb.Scale;
    
version(ydbVerbose)
    private import tango.util.log.Trace;



class WuZhu
{
    private char[]  sDecimal;        // e.g. "112345665";
    public char[]   sWuZhu;
    
    struct gz
    {
        
    }
        
    public size_t bigYear,
                year,
                month,
                day,
                hour,
                me,
    
                bigYearGan,
                bigYearZhi,
    
                yearGan,
                yearZhi,
    
                monthGan,
                monthZhi,
    
                dayGan,
                dayZhi,
    
                hourGan,
                hourZhi,
    
                meGan,
                meZhi;
                
    static const size_t   HourBase      = 1,
                        DayBase       = 12,     //HourBase * 12
                        MonthBase     = 360,    //DayBase * 30
                        YearBase      = 4320,   //MonthBase * 12
                        BigYearBase   = 129600; //year * 30  

    static enum SourceType 
    { 
        sWord,          //sWord e.g. "hello" 
        sDecimal,       //sDecimal e.g. "1234"
        sAlnum          //TODO 
    };   


    public alias set opAssign;                  //WuZhu = x;
                
    final char[] toUtf8()
    {
        return sWuZhu;     //s = string 
    }

    this(uint num)
    {
        set(num);
    }    

        /***********************************************************************

                Call-site shortcut to create a FilePath instance. This
                enables the same syntax as struct usage, so may expose
                a migration path

        ***********************************************************************/    
        static WuZhu opCall(uint num)
        {
            return new WuZhu(num);
        }
        
    
    this(int num)
    {
        set(num);
    }
        static WuZhu opCall(int num)
        {
            return new WuZhu(num);
        }    
        
    this(char[] s, SourceType type = SourceType.sDecimal)
    {
        set(s, type);
    }
        static WuZhu opCall(char[] s, SourceType type = SourceType.sDecimal)
        {
            return new WuZhu(s, type);
        }    
    
    final WuZhu set(T)(T t, SourceType type = SourceType.sDecimal)
    {
        static if( isIntegerType!(T) )
        {
            sDecimal = to!(char[])(t);
        }
        else static if( is(ElemType!(T) == char) )
        {
            sDecimal = "";
            if(type == SourceType.sWord)        //e.g. "good"
            {
                char[] znum = Translate.lowersToSnum(t, " "c.dup);
                sDecimal = Scale(znum, 26, 10, " "c.dup);
                sDecimal = tango.text.Util.substitute(sDecimal, " ", "");                
            }
            else if(type == SourceType.sDecimal)    //e.g. "123456"
            {
                sDecimal = t;
            }
            else if(type == SourceType.sAlnum)    //TODO: not exact result now, use sDecimal instead
            {
                alias TextConst.Lower L;
                foreach(v; toLower(t))
                {
                    if(isDigit(v))
                        sDecimal ~= v;                    
                    else if(isLetter(v))
                        //sDecimal ~= to!(char) ( L[indexOf(L.ptr, v, L.length)] );
                        sDecimal ~= to!(char) ( indexOf(L.ptr, v, L.length) );
                    else 
                    {
                        version(ydbVerbose)
                            Trace.formatln("WuZhu set discard of " ~ v);
                        continue;
                    }
                    
                }
                
            }
            else
                throw new IllegalArgumentException("wrong parameter");
        }
        else static assert(false, "wrong type of " ~ typeof(T).stringof);
            
        return parse;
    }
    

    
    final WuZhu parse()
    {
        if(sDecimal.length)
        {
            Bigint b = Bigint(sDecimal);
            Bigint r;
            Bigint q;            
            hour   = (b % 60).toUint();
            
            q = divMod(b, Bigint(WuZhu.DayBase), r, b.Round.TOWARD_INFINITY);
            day    = cast(uint) ceil( (q % 60).toReal );
            
            q = divMod(b, Bigint(WuZhu.MonthBase), r, b.Round.TOWARD_INFINITY);    
            month    = cast(uint) ceil( (q % 60).toReal );    

            q = divMod(b, Bigint(WuZhu.YearBase), r, b.Round.TOWARD_INFINITY);    
            year    = cast(uint) ceil( (q % 60).toReal );    
            
            q = divMod(b, Bigint(WuZhu.BigYearBase), r, b.Round.TOWARD_INFINITY);    
            bigYear    = cast(uint) ceil( (q % 60).toReal );    
            
            me    = (this.hour + this.day + this.month + this.year + this.bigYear) % 60;

            hourGan     = hour % 10;
            hourZhi     = hour % 12;
            
            dayGan      = day % 10;
            dayZhi      = day % 12;
            
            monthGan    = month % 10;
            monthZhi    = month % 12;
            
            yearGan     = year % 10;
            yearZhi     = year % 12;
            
            bigYearGan  = bigYear % 10;
            bigYearZhi  = bigYear % 12;
            
            meGan       = me % 10;
            meZhi       = me % 12;
            
        char[] sep = " ";
        sWuZhu =   TextConst.GanZhi[bigYear]    ~ sep ~ 
                    TextConst.GanZhi[year]       ~ sep ~
                    TextConst.GanZhi[month]      ~ sep ~ 
                    TextConst.GanZhi[day]        ~ sep ~ 
                    TextConst.GanZhi[hour]       ~ "\n               " ~ 
                    TextConst.GanZhi[me];
            
        }
        return this;
    }
    //parse
    
}
//




//WhuZhu
debug(UnitTest) unittest
{
    auto wz = WuZhu("1234567"); //WuZhu wz = "1234567" cause access violation
    //癸酉 己酉 癸酉 甲辰 庚午丁巳
    assert( wz.bigYear == 10 );
    assert( wz.bigYearGan == 0 );
    assert( wz.bigYearZhi == 10 );
    
    assert( wz.year == 46 );
    assert( wz.yearGan == 6 );
    assert( wz.yearZhi == 10 );
    
    assert( wz.month == 10 );
    assert( wz.monthGan == 0 );
    assert( wz.monthZhi == 10 );
    
    assert( wz.day == 41 );
    assert( wz.dayGan == 1 );
    assert( wz.dayZhi == 5 );
    
    assert( wz.hour == 7 );
    assert( wz.hourGan == 7 );
    assert( wz.hourZhi == 7 );
    
    assert( wz.me == 54 );
    assert( wz.meGan == 4 );
    assert( wz.meZhi == 6 );
    
    
    
    wz = WuZhu(1234567);
    //癸酉 己酉 癸酉 甲辰 庚午丁巳
    assert( wz.bigYear == 10 );
    assert( wz.bigYearGan == 0 );
    assert( wz.bigYearZhi == 10 );
    
    assert( wz.year == 46 );
    assert( wz.yearGan == 6 );
    assert( wz.yearZhi == 10 );
    
    assert( wz.month == 10 );
    assert( wz.monthGan == 0 );
    assert( wz.monthZhi == 10 );
    
    assert( wz.day == 41 );
    assert( wz.dayGan == 1 );
    assert( wz.dayZhi == 5 );
    
    assert( wz.hour == 7 );
    assert( wz.hourGan == 7 );
    assert( wz.hourZhi == 7 );
    
    assert( wz.me == 54 );
    assert( wz.meGan == 4 );
    assert( wz.meZhi == 6 );    
    
    
    
    wz = WuZhu("g o d", WuZhu.SourceType.sWord);
    //甲子 乙丑 戊寅 辛未 己丑 乙卯
    assert( wz.bigYear == 1 );
    assert( wz.bigYearGan == 1 );
    assert( wz.bigYearZhi == 1 );
    
    assert( wz.year == 2 );
    assert( wz.yearGan == 2 );
    assert( wz.yearZhi == 2 );
    
    assert( wz.month == 15 );
    assert( wz.monthGan == 5 );
    assert( wz.monthZhi == 3 );
    
    assert( wz.day == 8 );
    assert( wz.dayGan == 8 );
    assert( wz.dayZhi == 8 );
    
    assert( wz.hour == 26 );
    assert( wz.hourGan == 6 );
    assert( wz.hourZhi == 2 );
    
    assert( wz.me == 52 );
    assert( wz.meGan == 2 );
    assert( wz.meZhi == 4 );   
    
    version(ydbVerbose)
        Trace.formatln("WuZhu tested ok!");
    
    
  
}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
