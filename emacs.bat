REM @echo off
if not "%~1"=="p" start /min cmd.exe /c %0 p&exit rem just for min myself
rem %~dp0 is current path
echo %~dp0
set HOME=%~dp0
set PATH=%PATH%;%HOME%bin
REM  spaceemacs needs the option --insecure
"%HOME%"bin\emacs.exe --debug-init --insecure
