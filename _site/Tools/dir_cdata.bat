@ECHO OFF
@SETLOCAL enableextensions

@CD /d "%~dp0"

DIR /s /a:-d /b /o:n *.cdata > cdata.txt