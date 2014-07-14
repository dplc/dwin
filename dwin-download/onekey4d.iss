[Setup]
AppName=D����һ����װ��20110213
AppVerName=D����һ����װ��20110213
OutputDir=E:\my\d\dwin-download
SourceDir=E:\my\d
DefaultDirName=D:\d
DefaultGroupName=D Language
Compression=lzma/max
SolidCompression=yes
OutputBaseFilename=onekey4d
AppPublisher=http://www.d-programming-language-china.org/
AppPublisherURL=http://www.d-programming-language-china.org/
AppSupportURL=http://www.d-programming-language-china.org/
AppUpdatesURL=http://www.d-programming-language-china.org/

[Files]
Source: "dm\*"; DestDir: "{app}\dm"; Excludes: "lib\*,*.map,*.obj,.hg,.svn"; Flags: recursesubdirs
Source: "dmd\windows\*"; DestDir: "{app}\dmd\windows"; Excludes: "*.map,*.obj,.hg,.svn,dsss.conf,dsss.last,*.iss,*.back,*.bak,_cmd.bat"; Flags: recursesubdirs
Source: "dmd\src\*"; DestDir: "{app}\dmd\src"; Excludes: "*\ydb\*,*\tlb\more\*,lib\org.eclipse.swt.win32.win32.x86,lib\dwt-base.lib,lib\debug*.lib,dsss.conf,dsss.last,dsss_imports,dsss_objs,*.exe,*.map,*.obj,.hg,.svn,_cmd.bat,*.iss,*.back,*.bak"; Flags: recursesubdirs
Source: "scite4d\*"; DestDir: "{app}\scite4d"; Excludes: "*.map,*.obj,.hg,.svn,dsss.conf,dsss.last,*.iss,*.back,*.bak,*.bat"; Flags: recursesubdirs
Source: "backup\helloworld\helloworld\*"; DestDir: "{app}\projects\helloworld"; Excludes: "*.exe,*.map,*.obj,.hg,.svn,dsss.last,*.iss,*.back,*.bak";
Source: "backup\helloworld\dwthelloworld\*"; DestDir: "{app}\projects\dwthelloworld"; Excludes: "*.exe,*.map,*.obj,private,dsss.last";
Source: "backup\helloworld\dflhelloworld\*"; DestDir: "{app}\projects\dflhelloworld"; Excludes: "*.exe,*.map,*.obj,private,dsss.last";
Source: "tools\Entice\*"; DestDir: "{app}\tools\Entice"; Excludes: "*.map,*.obj,*.iss,*.back,*.bak"; Flags: recursesubdirs
Source: "dwin-download\����ʹ��D����һ����װ��.txt"; DestDir: "{app}";

[Tasks]
Name: desktopicon; Description: ������ݷ�ʽ; GroupDescription: ������ݷ�ʽ

[Icons]
Name: {commondesktop}\SciTE4D; Filename: {app}\scite4d\Sc1.exe; WorkingDir: {app}\scite4d; Tasks: desktopicon
Name: {commondesktop}\����ʹ��D����һ����װ��; Filename: {app}\����ʹ��D����һ����װ��.txt; Tasks: desktopicon
Name: "{commondesktop}\D�����й�"; Filename: "http://www.d-programming-language-china.org/?desktop&onekey4d20110213"; Flags: uninsneveruninstall; Tasks: desktopicon
Name: "{commondesktop}\D������̳"; Filename: "http://bbs.d-programming-language-china.org/?desktop&onekey4d20110213"; Flags: uninsneveruninstall; Tasks: desktopicon

Name: {group}\SciTE4D; Filename: {app}\scite4d\Sc1.exe; WorkingDir: {app}\scite4d;
Name: {group}\����ʹ��D����һ����װ��; Filename: {app}\����ʹ��D����һ����װ��.txt;
Name: "{group}\D�����й�"; Filename: "http://www.d-programming-language-china.org/?programs&onekey4d20110213"; Flags: uninsneveruninstall; Tasks: desktopicon
Name: "{group}\D������̳"; Filename: "http://bbs.d-programming-language-china.org/?programs&onekey4d20110213"; Flags: uninsneveruninstall; Tasks: desktopicon

Name: "{userfavorites}\D����\D�����й�"; Filename: "http://www.d-programming-language-china.org/?fav&onekey4d20110213"; MinVersion: "4.1,4"; Flags: uninsneveruninstall
Name: "{userfavorites}\D����\D������̳"; Filename: "http://bbs.d-programming-language-china.org/?fav&onekey4d20110213"; MinVersion: "4.1,4"; Flags: uninsneveruninstall


