module ydb.DUtils;


/**
find some useful d code on internet

http://codesearch.google.com/ search lang:d   or lang:d tango

好像是一个游戏相关，有flash解密加密的内容
http://code.google.com/p/timezero-module-bot/

c http parser的d封装，还有一些封装，国人
http://code.google.com/

Skin Consortium
http://code.google.com/p/skinconsortium/

个人用的许多d代码，有sqlite 3.612的编译方法，lua D binding
http://komma8komma1.googlecode.com

一个简单的计算器：
http://code.google.com/p/d-zadania/source/browse/#svn%2Ftrunk%2FTango%2FCalc

密码破解，国人写的：
http://code.google.com/p/windump/

**/
version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
