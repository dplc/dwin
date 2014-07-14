@set _dlib_save89824=%dlib%
@set dlib=Tango
@set dmd_path=..\..\..
@set dmc_path=..\..\..\..\dm
@set dwin_path=..\dwin
@call makelib.bat

@set dlib=%_dlib_save89824%
mv *.lib ../dwin/lib
pause
