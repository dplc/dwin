[Setup]
AppName=D���Կ� DWin
AppVerName=D���Կ� DWin 0.40
DefaultDirName=D:\d\DWin
DefaultGroupName=D Language
UninstallDisplayIcon={app}\dwin_icon_32.ico
Compression=lzma/max
SolidCompression=yes
SourceDir=E:\my\d\dmd\src\other\dwin
OutputDir=E:\my\d\dwin-download\dwin
OutputBaseFilename=dwinsetup
AppPublisher=http://dwin.d-programming-language-china.org/
AppPublisherURL=http://dwin.d-programming-language-china.org/
AppSupportURL=http://dwin.d-programming-language-china.org/
AppUpdatesURL=http://dwin.d-programming-language-china.org/

[Files]
Source: "*"; DestDir: "{app}"; Excludes: "lib\org.eclipse.swt.win32.win32.x86,lib\dwt-base.lib,lib\debug*.lib,dsss.last,dsss_imports,dsss_objs,*.exe,*.map,*.obj,.hg,.svn,*.bat,*.iss,*.back,*.bak"; Flags: recursesubdirs

[Tasks]
Name: desktopicon; Description: ���������ݷ�ʽ; GroupDescription: ������ݷ�ʽ

[Icons]
Name: "{commondesktop}\D�����й�"; Filename: "http://www.d-programming-language-china.org/?desktop&DWin&Feb13,2011"; Tasks: desktopicon
Name: "{commondesktop}\D������̳"; Filename: "http://bbs.d-programming-language-china.org/?desktop&DWin&Feb13,2011"; Tasks: desktopicon

Name: "{group}\DWin��"; Filename: "{app}"; IconFilename: "{app}\dwin_icon_32.ico";
Name: "{group}\DWin��ҳ"; Filename: "http://dwin.d-programming-language-china.org/?programs&DWin&Feb13,2011"; Flags: uninsneveruninstall
Name: "{group}\SciTE4D�༭��"; Filename: "http://scite4d.d-programming-language-china.org/?programs&DWin&Feb13,2011";
Name: "{group}\D�����й�"; Filename: "http://www.d-programming-language-china.org/?programs&DWin&Feb13,2011";
Name: "{group}\D������̳"; Filename: "http://bbs.d-programming-language-china.org/?programs&DWin&Feb13,2011";


Name: "{userfavorites}\D����\D�����й�"; Filename: "http://www.d-programming-language-china.org/?fav&DWin&Feb13,2011"; MinVersion: "4.1,4"; Flags: uninsneveruninstall
Name: "{userfavorites}\D����\D������̳"; Filename: "http://bbs.d-programming-language-china.org/?fav&DWin&Feb13,2011"; MinVersion: "4.1,4"; Flags: uninsneveruninstall
Name: "{userfavorites}\D����\SciTE4D�༭��"; Filename: "http://scite4d.d-programming-language-china.org/?fav&DWin&Feb13,2011"; MinVersion: "4.1,4"; Flags: uninsneveruninstall
Name: "{userfavorites}\D����\DWin��"; Filename: "http://dwin.d-programming-language-china.org/?fav&DWin&Feb13,2011"; MinVersion: "4.1,4"; Flags: uninsneveruninstall


