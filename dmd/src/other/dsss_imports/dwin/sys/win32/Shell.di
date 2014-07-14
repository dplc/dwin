// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2008  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: May 2008

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/



module dwin.sys.win32.Shell;

private import dwin.sys.win32.Wrapper : shellExecute;
private import dwin.sys.win32.SpecialPath : InternetExplorerPath;
private import tango.sys.win32.Types : SW_SHOWMAXIMIZED;

/// open a file by default binary
void* shellOpenDefault(char[] link)
{
    return shellExecute(null, "open", link, null, null, SW_SHOWMAXIMIZED); 
}
    
/// open internet url
void* shellOpenIE(char[] link)
{
    auto ie = InternetExplorerPath();
    if(ie.length)
        return shellExecute(null, "open", ie, link, null, SW_SHOWMAXIMIZED); 
    else
        return shellExecute(null, "open", "IEXPLORE", link, null, SW_SHOWMAXIMIZED);                 
}
    
alias shellOpenIE openLink;



/*
    深入浅出ShellExecute  
  Q:   如何打开一个应用程序？  
   
  ShellExecute(this->m_hWnd,"open","calc.exe","","",   SW_SHOW   );  
   
  或  
   
  ShellExecute(this->m_hWnd,"open","notepad.exe",  
   
  "c:\MyLog.log","",SW_SHOW   );  
   
   
   
  Q:   如何打开一个同系统程序相关连的文档？  
   
  ShellExecute(this->m_hWnd,"open",  
   
  "c:\abc.txt","","",SW_SHOW   );  
   
   
  Q:   如何打开一个网页？  
   
  ShellExecute(this->m_hWnd,"open","http://www.google.com";,"","",   SW_SHOW   );  
   
   
  Q:   如何激活相关程序，发送EMAIL？  
   
  ShellExecute(this->m_hWnd,"open",  
   
  "mailto:nishinapp@yahoo.com","","",   SW_SHOW   );  
   
   
  Q:   如何用系统打印机打印文档？  
   
  ShellExecute(this->m_hWnd,"print",  
   
  "c:\abc.txt","","",   SW_HIDE);  
   
   
  Q:   如何用系统查找功能来查找指定文件？  
   
  ShellExecute(m_hWnd,"find","d:\nish",  
   
  NULL,NULL,SW_SHOW);  
   
   
  Q:   如何启动一个程序，直到它运行结束？  
   
  SHELLEXECUTEINFO   ShExecInfo   =   {0};  
   
  ShExecInfo.cbSize   =   sizeof(SHELLEXECUTEINFO);  
   
  ShExecInfo.fMask   =   SEE_MASK_NOCLOSEPROCESS;  
   
  ShExecInfo.hwnd   =   NULL;  
   
  ShExecInfo.lpVerb   =   NULL;  
   
  ShExecInfo.lpFile   =   "c:\MyProgram.exe";    
   
  ShExecInfo.lpParameters   =   "";    
   
  ShExecInfo.lpDirectory   =   NULL;  
   
  ShExecInfo.nShow   =   SW_SHOW;  
   
  ShExecInfo.hInstApp   =   NULL;    
   
  ShellExecuteEx(&ShExecInfo);  
   
  WaitForSingleObject(ShExecInfo.hProcess,INFINITE);  
   
  或：  
   
  PROCESS_INFORMATION   ProcessInfo;    
   
  STARTUPINFO   StartupInfo;   //入口参数  
   
  ZeroMemory(&StartupInfo,   sizeof(StartupInfo));  
   
  StartupInfo.cb   =   sizeof   StartupInfo   ;   //分配大小  
   
  if(CreateProcess("c:\winnt\notepad.exe",   NULL,    
   
  NULL,NULL,FALSE,0,NULL,  
   
  NULL,&StartupInfo,&ProcessInfo))  
   
  {    
   
  WaitForSingleObject(ProcessInfo.hProcess,INFINITE);  
   
  CloseHandle(ProcessInfo.hThread);  
   
  CloseHandle(ProcessInfo.hProcess);  
   
  }    
   
  else  
   
  {  
   
  MessageBox("The   process   could   not   be   started...");  
   
  }  
   
   
   
  Q:   如何显示文件或文件夹的属性？  
   
  SHELLEXECUTEINFO   ShExecInfo   ={0};  
   
  ShExecInfo.cbSize   =   sizeof(SHELLEXECUTEINFO);  
   
  ShExecInfo.fMask   =   SEE_MASK_INVOKEIDLIST   ;  
   
  ShExecInfo.hwnd   =   NULL;  
   
  ShExecInfo.lpVerb   =   "properties";  
   
  ShExecInfo.lpFile   =   "c:\";   //也可以是文件  
   
  ShExecInfo.lpParameters   =   "";    
   
  ShExecInfo.lpDirectory   =   NULL;  
   
  ShExecInfo.nShow   =   SW_SHOW;  
   
  ShExecInfo.hInstApp   =   NULL;    
   
  ShellExecuteEx(&ShExecInfo);   

*/
version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
