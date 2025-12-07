@ECHO OFF
cd /d C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build
call vcvarsall.bat x86
cd /d D:\BSTU\Course-Project-KPO-SAA-2025\SAA-2025\Debug
ml /c /coff /Zi in.txt.asm
link /OPT:NOREF /DEBUG /SUBSYSTEM:CONSOLE in.txt.obj 
call in.txt.exe
pause
exit