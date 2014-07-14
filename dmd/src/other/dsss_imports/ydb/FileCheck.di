

// Written in the D programming language.

/*******************************************************************************

        Copyright:      Copyright (c) 2007  (yidabu  g m a i l at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: 1 Dec 2007

        Authors:        yidabu ( D Programming Language China : http://bbs.d-programming-language-china.org )

*******************************************************************************/

module ydb.FileCheck;

private import  tango.io.FilePath,
                tango.io.device.File,
                tango.io.FileScan;

private import  dwin.sys.win32.SpecialPath;


private import  dwin.io.Digest;

version(ydbVerbose)
    private import tango.util.log.Trace;

/**
    按：在本地检测太烦，程序完整性也放到网上检测好了．

    文件检查：
    用另外的线程来检查，以不干扰现有代码的逻辑
    用templates mixin直接插入代码
    conf文件是否存在
    conf文件的创建时间是否与exe创建时间相同，不同则删除.conf并退出
    与计算机特性绑定，　这样一个机器上做出的破解，换机就不能使用
    随机调用检查函数同一函数的多个变形
    分三段检查:md5,tiger, sha512, 每次随机检查一段
    代码尽量全部在模板里，而不是在主程序代码里
    检查失败延时若干秒直接退出

*/
template FileCheck()
{
    /*
    CheckExists checkExists;
    Check5 check5;
    Check10 check10;
    Check15 check15;
    */

    //check 0-5 check digit
    struct Check5
    {
        void opIndex()
        {

        }

        void checkA()
        {

        }
        void checkB()
        {

        }

        void checkC()
        {

        }

    }



    //check 6-10 check digit
    struct Check10
    {
        void opIndex(uint index)
        {

        }

        void checkA()
        {

        }
        void checkB()
        {

        }

        void checkC()
        {

        }

    }

    //check 11-15 check digit
    struct Check15
    {
        void opIndex(uint index)
        {

        }

        void checkA()
        {

        }
        void checkB()
        {

        }

        void checkC()
        {

        }

    }

    //check file exists and created time same as exe file
    struct CheckExists
    {
        static void opIndex()
        {

        }

        void checkA()
        {

        }
        void checkB()
        {

        }

        void checkC()
        {

        }
    }


    FilePath[] confList()
    {
        dir = exeDir;
        auto scan = new FileScan();
        scan(dir, ".conf", false);
        return scan.files;
    }

}
version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
