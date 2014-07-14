[Setup]
AppName=D Programming Language Library DWin
AppVerName=D Programming Language Library 0.39
DefaultDirName={pf}\DWin
DefaultGroupName=DWin Library
UninstallDisplayIcon={app}\dwin_icon_32.ico
Compression=lzma/max
SolidCompression=yes
SourceDir=E:\my\d\dmd\src\other\dwin
OutputDir=E:\my\d\dwin-download\dwin
OutputBaseFilename=dwin
AppPublisher=http://www.software-download.name/d-programming-language-library-dwin/
AppPublisherURL=http://www.software-download.name/d-programming-language-library-dwin/
AppSupportURL=http://www.software-download.name/d-programming-language-library-dwin/
AppUpdatesURL=http://www.software-download.name/d-programming-language-library-dwin/

[Files]
Source: "*"; DestDir: "{app}"; Excludes: "*.iss,*.txt,*.dll,*bat,*svn"; Flags: recursesubdirs

[Icons]
Name: "{commondesktop}\DWin Library"; Filename: "{app}\"; IconFilename: "{app}\dwin_icon_32.ico"
Name: "{group}\DWin directory"; Filename: "{app}\"; IconFilename: "{app}\dwin_icon_32.ico"
Name: "{group}\Uninstall DWin"; Filename: "{uninstallexe}"
