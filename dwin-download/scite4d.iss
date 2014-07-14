[Setup]
AppName=SciTE4D
AppVerName=SciTE4D 0.19
DefaultDirName=D:\d\SciTE4D
DefaultGroupName=D Language
Compression=lzma/max
SolidCompression=yes
SourceDir=E:\my\d\scite4d
OutputDir=E:\my\d\dwin-download\scite4d
OutputBaseFilename=scite4d
AppPublisher=http://scite4d.d-programming-language-china.org/
AppPublisherURL=http://scite4d.d-programming-language-china.org/
AppSupportURL=http://scite4d.d-programming-language-china.org/
AppUpdatesURL=http://scite4d.d-programming-language-china.org/

[Files]
Source: "*"; DestDir: "{app}"; Excludes: "*.map,*.obj,.hg,.svn,dsss.conf,dsss.last,*.iss,*.back,*.bak,*.bat"; Flags: recursesubdirs

[Tasks]
Name: desktopicon; Description: Create Desktop Shortcut; GroupDescription: Create Shortcut

[Icons]
Name: "{commondesktop}\SciTE4D"; Filename: "{app}\Sc1.exe"; WorkingDir: "{app}"; Tasks:desktopicon

Name: "{group}\SciTE4D"; Filename: "{app}\Sc1.exe"; WorkingDir: "{app}"
Name: "{group}\SciTE4D Help"; Filename: "{app}\SciTEhelp\SciTEDoc.html"
Name: "{group}\Uninstall"; Filename: "{uninstallexe}"

[Run]
Filename: "{app}\Sc1.exe"; Description: "Launch SciTE4D Text Editor"; Flags: postinstall nowait skipifsilent shellexec

