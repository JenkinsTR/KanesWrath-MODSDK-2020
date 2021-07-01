@ECHO OFF
@SETLOCAL enableextensions

@CD /d "%~dp0"

DIR /s /a:-d /b /o:n *.vp6 > vp6.txt
DIR /s /a:-d /b /o:n *.snd > snd.txt