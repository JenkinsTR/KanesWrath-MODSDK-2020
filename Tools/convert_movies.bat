@ECHO OFF

REM # = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
REM #
REM # CONVERT CNC MOVIES
REM #
REM # This file is included as part of the Jenkins Media Tools suite (JM Tools).
REM # Package Date: 22 Jan 2020
REM # (c)2008-2020 Jenkins Media. All Rights Reserved.
REM #
REM # - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
REM # Web:       http://solutions.jenkinsmedia.com.au/software
REM # Contact:                     jmtools@jenkinsmedia.com.au
REM # - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
REM #
REM # = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

SET JMS_Name=%~n0
SET JMS_Version=v1.0.0.1 (2020-03-12)
SET "JMS_Description=Convert CNC Movies to AVI"
SET JMSDateofv1=2020-03-12
SET "JMS_Notes=None"

REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

REM # Enable extensions and make sure we're in the Current Directory.
REM # Keep this at the top of any bat file with intricate loops or declarations

REM Set master local expansion and command extensions.
REM USE ONCE
@SetLocal enableextensions EnableDelayedExpansion

@CD /d "%~dp0"

REM Useful for debugging PUSHD level traversal (+) = number of levels, one + for each PUSHD level
@PROMPT $+

PUSHD "%~dp0"

REM # Copyright info & CLI window styling
SET "APPNAME=CONVERT CNC MOVIES [%JMS_Name% - %JMS_Version%]"

SET "CPR=^(c^)2008-2020 Jenkins Media. All Rights Reserved."
COLOR 8F
TITLE %APPNAME%

REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
REM                             # # Let's begin # #
REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

REM Set a macro for the current directory
SET "TOPDIR=%~dp0"

REM # UNIQUE TIME MACRO
SET "mm=%DATE:~4,2%"
SET "dd=%DATE:~7,2%"
SET "yy=%DATE:~10,4%"
FOR /f "tokens=1-4 delims=:. " %%A IN ("%time: =0%") DO @SET UNIQUE=%yy%-%dd%-%mm%-%%A%%B-%%C%%D

REM # Now we SET the %UNIQUE% time variable
REM Commented out to avoid conflicts
REM IF "%~1" NEQ "" (SET %~1=%UNIQUE%) ELSE GOTO LOGS
REM ----------------------------------------------------------------------------------

REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
REM # SET the Master Output options
REM -----------------------------------------------------------------------------------

:LOGS
SET "OUTDIR=%~dp0"

REM # SET Log filenames with unique time
REM and stamp our starting time with %STARTTD%
SET "STARTTD=!TIME! - !DATE!"
SET "LOGS=%TOPDIR%logs"
SET "LOGFILE=%LOGS%\%JMS_Name%.%UNIQUE%.log"
SET "DEBUGLOG=%LOGS%\debug.%JMS_Name%.%UNIQUE%.log"
SET "ERRLOG=%LOGS%\%JMS_Name% errors %UNIQUE%.txt"
SET "TMPL=tmplog.tmp"
SET "TMPD=debuglog.tmp"
SET "TMPE=errorlog.tmp"
SET DBGMAC="%TMPD%" ^&^& type "%TMPD%" ^&^& type "%TMPD%" ^>^> "%DEBUGLOG%"
SET LOGMAC="%TMPL%" ^&^& type "%TMPL%" ^&^& type "%TMPL%" ^>^> "%LOGFILE%"
SET ERRMAC="%TMPE%" ^&^& type "%TMPE%" ^&^& type "%TMPE%" ^>^> "%ERRLOG%"
SET LOGnBUG="%TMPL%" ^&^& type "%TMPL%" ^&^& type "%TMPL%" ^>^> "%LOGFILE%" ^&^& type "%TMPL%" ^>^> "%DEBUGLOG%"

IF NOT EXIST "%LOGS%" MD "%LOGS%"

REM END of setting the Master Output options
REM -----------------------------------------------------------------------------------
REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

REM -------------------------------------------------------------
REM #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
REM #                                                           #
REM #   Detect bitness                                          #
REM #                                                           #
REM #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
REM old way
REM IF %PROCESSOR_ARCHITECTURE%"=="AMD64" GOTO 64BIT
REM GOTO 32BIT

REM MS approved way
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && SET BITN=32BIT || SET BITN=64BIT
IF %BITN%==32BIT GOTO 32BIT
IF %BITN%==64BIT GOTO 64BIT

REM -------------------------------------------------------------
REM #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
REM -------------------------------------------------------------

REM -------------------------------------------------------------
REM #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
REM #                                                           #
REM #  Detect & SET directory                                   #
REM #                                                           #
REM #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
REM -------------------------------------------------------------
:64BIT

SET "PFILESX86=C:\Program Files (x86)"

GOTO CONTINUE

REM -------------------------------------------------------------

:32BIT

SET "PFILESX86=C:\Program Files"


REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
REM # SET the master program options
REM -----------------------------------------------------------------------------------

:CONTINUE
REM -----------------------------------------------------------------------------------
REM Set our binary paths
REM -----------------------------------------------------------------------------------
ECHO ===============================================================================>%DBGMAC%
ECHO Setting up our binary paths . . .>%DBGMAC%
ECHO(>%DBGMAC%

REM Main program directories
SET "JMTOOLS=%PFILESX86%\Jenkins Media\JM Tools"
SET "DBTOOLS=%JMTOOLS%\3rdparty"

REM Most common redists
SET "IM_MASTER=%DBTOOLS%\ImageMagick-7.0.3-6-portable-Q16-x64"
SET "LAME=%DBTOOLS%\Lame\lame.exe"
SET "FFMPEG=%DBTOOLS%\ffmpeg-N-96447-g19f75e7787-win64-static\ffmpeg.exe"
::DEPRECATED:: SET "FFMPEG=%DBTOOLS%\ffmpeg-20161110-863ebe6-win64-static\bin\ffmpeg.exe"
SET "HNDBRK_OLD=%DBTOOLS%\HandBrake-0.10.5-x86_64-Win_CLI"
::DEPRECATED:: SET "HNDBRK=%DBTOOLS%\HandBrakeCLI-1.0.7-win-x86_64" 
SET "HNDBRK=%DBTOOLS%\HandBrakeCLI-1.3.1.nightly-win-x86_64"
SET "HBCLI=HandBrakeCLI.exe"
SET "HBMKV=%HNDBRK%\%HBCLI%"
SET "VBX64=C:\Program Files\Oracle\VirtualBox\VBoxManage.exe"
SET "MAKMKV=%PFILESX86%\MakeMKV"
SET "MKMKVCONV=makemkvcon64.exe"
SET "MAKEMKV=%MAKMKV%\%MKMKVCONV%"
SET "MISOC=%DBTOOLS%\CDIMAGE.EXE"
SET "FNR=%DBTOOLS%\fnr.exe"
SET "SINEXE=%DBTOOLS%\singleinstance.exe"
REM -----------------------------------------------------------------------------------
REM Echo these SETs out to the debug log
ECHO SET DBTOOLS as "%DBTOOLS%" >NUL 2>&1 >%DBGMAC%

ECHO SET IM_MASTER as "%IM_MASTER%" >NUL 2>&1 >%DBGMAC%
ECHO SET LAME as "%LAME%" >NUL 2>&1 >%DBGMAC%
ECHO SET FFMPEG as "%FFMPEG%" >NUL 2>&1 >%DBGMAC%
ECHO SET HNDBRK as "%HNDBRK%" >NUL 2>&1 >%DBGMAC%
ECHO SET HNDBRK_OLD as "%HNDBRK_OLD%" >NUL 2>&1 >%DBGMAC%
ECHO SET HBCLI as "%HBCLI%" >NUL 2>&1 >%DBGMAC%
ECHO SET HBMKV as "%HBMKV%" >NUL 2>&1 >%DBGMAC%
ECHO SET VBX64 as "%VBX64%" >NUL 2>&1 >%DBGMAC%
ECHO SET MAKMKV as "%MAKMKV%" >NUL 2>&1 >%DBGMAC%
ECHO SET MKMKVCONV as "%MKMKVCONV%" >NUL 2>&1 >%DBGMAC%
ECHO SET MAKEMKV as "%MAKEMKV%" >NUL 2>&1 >%DBGMAC%
ECHO SET MISOC as "%MISOC%" >NUL 2>&1 >%DBGMAC%
ECHO SET FNR as "%FNR%" >NUL 2>&1 >%DBGMAC%
ECHO SET SINEXE as "%SINEXE%" >NUL 2>&1 >%DBGMAC%

:START
REM Set our starting time for later calcs
SET "STARTTIME=%TIME%"

REM First, reset our RC
SET ReturnCode=

REM # some fancy formatting for the console window and log file.
CLS
SET "q=^"
ECHO ===============================================================================>%DBGMAC%
ECHO %APPNAME% >%DBGMAC%
ECHO %CPR% >%DBGMAC%
ECHO ===============================================================================>%DBGMAC%
ECHO.>%DBGMAC%
CLS
ECHO ===============================================================================
CALL :c 97 "%APPNAME%" /n
ECHO %CPR%
ECHO ===============================================================================

:: Usage:
::  eaconv.exe on each .vp6 file.
:: 
:: To view produced .avi files, go to http://www.on2.com , download and install VP6 codec package.


SET "SDK=C:\Program Files (x86)\EA GAMES\Command & Conquer 3 - Dilogy\TW\MOD SDK\Tools"
SET "VP6=%SDK%\vp6.txt"
SET "VP6_KW=%SDK%\vp6_kw.txt"
SET "SND=%SDK%\snd.txt"
SET "SND_KW=%SDK%\snd_kw.txt"
SET "EACV=%SDK%\EA_Conv_06i\eaconv.exe"

SET "INDIR=C:\CNC3\_EXTRACTED\data"
SET "INDIR_KW=C:\CNC3KW\_EXTRACTED\data"
SET "OUTDIR=C:\CNC3\_CONVERTED\data"
SET "OUTDIR_KW=C:\CNC3KW\_CONVERTED\data"

SET OUTEXT=mp4

WMIC PATH Win32_videocontroller GET description>"%SDK%\vadapt.info"
FIND /I "NVIDIA" "%SDK%\vadapt.info" >NUL 2>&1 && GOTO CUDA || GOTO NOTCUDA

:CUDA
ECHO We detected an NVIDIA card. >%DBGMAC%
ECHO Setting CUDA options. >%DBGMAC%
ECHO. >%DBGMAC%
DEL "%SDK%\vadapt.info" >NUL 2>&1
REM SET "OPTS=-hwaccel cuvid -c:v h264_cuvid -n -hide_banner"
REM SET "OPTS=-hwaccel cuvid -c:v h264_cuvid -n"
SET "OPTS=-hwaccel cuvid -c:v vp6 -n"
SET "OPTS2=-c:v h264_nvenc -preset slow -minrate 3500k -maxrate 12000k -bufsize 1000k -c:a aac -b:a 192k"
GOTO LETSBEGIN

:NOTCUDA
ECHO We didn't detect an NVIDIA card. >%DBGMAC%
ECHO Setting normal options. >%DBGMAC%
ECHO. >%DBGMAC%
DEL "%SDK%\vadapt.info" >NUL 2>&1
REM SET "OPTS=-n -hide_banner"
SET "OPTS=-n"
SET "OPTS2=-c:v h264 -preset slow -minrate 3500k -maxrate 12000k -bufsize 1000k -c:a aac -b:a 192k"

:LETSBEGIN
GOTO KW

:TW
FOR /F "usebackq tokens=* delims=" %%G IN ("%VP6%") DO (
	REM CALL Our duration start subroutine
	CALL :DURATION_START

	REM CALL Our standard file constants
	SET "FILE=%%G"
	SET "FILED=%%~dpG"
	SET "FILEN=%%~nG"
	SET "FILEX=%%~xG"
	SET "FILEZ=%%~zG"
	CALL :DYNANMICFILE
	
	REM Supported files function - now serves as our main extension based conversion code
	PUSHD "!FILED!"
	REM CALL our pre supported files function
	CALL :PRESUPPORTEDFILES

	ECHO Found !FILEX! in !FILED! >%DBGMAC%
	ECHO. >%DBGMAC%
	ECHO Converting !FILEN!!FILEX! to !FILEN!.mp4 . . . >%DBGMAC%
	ECHO. >%DBGMAC%

	"%EACV%" "!FILE!"
	"%EACV%" "!FILED!!FILEN!.snd"
	
	ECHO The following files will be merged^: >%DBGMAC%
	ECHO "!FILEN!.avi" >%DBGMAC%
	ECHO "!FILEN!.wav" >%DBGMAC%
	ECHO Into >%DBGMAC%
	ECHO "!FILED!!FILEN!.%OUTEXT%" >%DBGMAC%
	ECHO. >%DBGMAC%
	
	REM "%FFMPEG%" %OPTS% -i "!FILED!!FILEN!.avi" -i "!FILED!!FILEN!.wav" -filter_complex "[0:v:0] [1:a:0] concat=n=2:v=1:a=1 [v] [a]" -map "[v]" -map "[a]" %OPTS2% "!FILED!!FILEN!.%OUTEXT%" 1>%ERRMAC%
	"%FFMPEG%" %OPTS% -i "!FILED!!FILEN!.avi" -i "!FILED!!FILEN!.wav" %OPTS2% "!FILED!!FILEN!.%OUTEXT%" 1>%ERRMAC%
		
	REM CALL Our duration end subroutine
	CALL :DURATION_END

	REM Silently erase all of our temporary files
	CALL :ERASETMPFILES

	REM End of master FOR loop

)

:KW
FOR /F "usebackq tokens=* delims=" %%G IN ("%VP6_KW%") DO (
	REM CALL Our duration start subroutine
	CALL :DURATION_START

	REM CALL Our standard file constants
	SET "FILE=%%G"
	SET "FILED=%%~dpG"
	SET "FILEN=%%~nG"
	SET "FILEX=%%~xG"
	SET "FILEZ=%%~zG"
	CALL :DYNANMICFILE
	
	REM Supported files function - now serves as our main extension based conversion code
	PUSHD "!FILED!"
	REM CALL our pre supported files function
	CALL :PRESUPPORTEDFILES

	ECHO Found !FILEX! in !FILED! >%DBGMAC%
	ECHO. >%DBGMAC%
	ECHO Converting !FILEN!!FILEX! to !FILEN!.mp4 . . . >%DBGMAC%
	ECHO. >%DBGMAC%

	"%EACV%" "!FILE!"
	"%EACV%" "!FILED!!FILEN!.snd"
	
	ECHO The following files will be merged^: >%DBGMAC%
	ECHO "!FILEN!.avi" >%DBGMAC%
	ECHO "!FILEN!.wav" >%DBGMAC%
	ECHO Into >%DBGMAC%
	ECHO "!FILED!!FILEN!.%OUTEXT%" >%DBGMAC%
	ECHO. >%DBGMAC%
	
	"%FFMPEG%" %OPTS% -i "!FILED!!FILEN!.avi" -i "!FILED!!FILEN!.wav" %OPTS2% "!FILED!!FILEN!.%OUTEXT%" 1>%ERRMAC%
	
	REM CALL Our duration end subroutine
	CALL :DURATION_END

	REM Silently erase all of our temporary files
	CALL :ERASETMPFILES

	REM End of master FOR loop

)

REM Finished all %sFileType9%'s, moving to the end
ECHO Finished all files, and finished all supported files. Moving to the end.>%DBGMAC%

REM Silently erase all of our temporary files
CALL :ERASETMPFILES

POPD

REM Silently erase all of our temporary files
CALL :ERASETMPFILES

GOTO END
REM -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

:ERRNOTYPE
ECHO.>%ERRMAC%>%DBGMAC%
ECHO ERROR: Either an error occurred or you cancelled.>%DBGMAC%>%ERRMAC%
ECHO.>%ERRMAC%>%DBGMAC%

GOTO ERREND

:ERRNOEXT
ECHO.>%ERRMAC%>%DBGMAC%
ECHO ERROR: No files of extension type %EXT1% were found, or the file is not supported.>%DBGMAC%>%ERRMAC%
ECHO.>%ERRMAC%>%DBGMAC%

GOTO ERREND

:ERROR
ECHO.>%DBGMAC%
ECHO.>%DBGMAC%
ECHO.>%DBGMAC%
ECHO.>%ERRMAC%>%DBGMAC%
ECHO ERROR: A unspecified error has occurred.>%DBGMAC%>%ERRMAC%
ECHO.>%ERRMAC%>%DBGMAC%
ECHO.>%ERRMAC%>%DBGMAC%
ECHO.>%DBGMAC%
ECHO.>%DBGMAC%
ECHO.>%DBGMAC%

GOTO ERREND

:CANCELLED
ECHO.>%DBGMAC%
ECHO.>%DBGMAC%
ECHO.>%DBGMAC%
ECHO.>%ERRMAC%>%DBGMAC%
ECHO You cancelled.>%DBGMAC%>%ERRMAC%
ECHO.>%ERRMAC%>%DBGMAC%
ECHO.>%ERRMAC%>%DBGMAC%
ECHO.>%DBGMAC%
ECHO.>%DBGMAC%
ECHO.>%DBGMAC%

GOTO ERREND

:ERREND
ECHO This is fired after any error or notice>%DBGMAC%
ECHO.>%DBGMAC%

REM -------------------------------------------------------------
:END
REM Put a new line at the end of the logs to be 150% sure not to prepend to previous ones
ECHO.>%DBGMAC%
:ENDTIME
SET "ENDTIME=%TIME%"

REM Change formatting for the start and end times
FOR /F "tokens=1-4 delims=:.," %%a IN ("%STARTTIME%") DO SET /A "start=(((%%a*60)+1%%b %% 100)*60+1%%c %% 100)*100+1%%d %% 100"

FOR /F "tokens=1-4 delims=:.," %%a IN ("%ENDTIME%") DO SET /A "end=(((%%a*60)+1%%b %% 100)*60+1%%c %% 100)*100+1%%d %% 100"

REM Calculate the elapsed time by subtracting values
SET /A elapsed=end-start

REM Format the results for output
SET /A hh=elapsed/(60*60*100), rest=elapsed%%(60*60*100), mm=rest/(60*100), rest%%=60*100, ss=rest/100, cc=rest%%100
IF %hh% lss 10 SET "hh=0%hh%"
IF %mm% lss 10 SET "mm=0%mm%"
IF %ss% lss 10 SET "ss=0%ss%"
IF %cc% lss 10 SET "cc=0%cc%"

REM SET DURATION=%hh%:%mm%:%ss%,%cc%
SET "DURATION=%hh%hrs %mm%mins %ss%secs"

IF "%hh%"=="00" (
 IF "%mm%"=="00" (
  SET "FANCYDURATION=%ss%secs"
  GOTO TIMINGS
 )
 SET "FANCYDURATION=%mm%mins, %ss%secs"
 GOTO TIMINGS
)

REM Else
SET "FANCYDURATION=%hh%hrs, %mm%mins, %ss%secs"
GOTO TIMINGS


:TIMINGS
REM -----------------------------------------------------------------------------------
REM # Some more fancy Formatting FOR CLI window and logfile to close.
ECHO ------------------------------------------------------------------------------->%DBGMAC%
REM CLS
REM # Display both a start time and end time and log to file.
ECHO %ACT1% started at %STARTTIME% >%DBGMAC%
ECHO %ACT2%d at %ENDTIME% >%DBGMAC%
ECHO Time to complete: %FANCYDURATION% >%DBGMAC%
ECHO.>%DBGMAC%

REM -----------------------------------------------------------------------------------
REM If the error log doesn't exist, skip to the E-end
IF NOT EXIST "%ERRLOG%" GOTO EEND

REM -----------------------------------------------------------------------------------
REM If it does, set it's filesize in bytes as "FSZ"
FOR %%G IN ("%ERRLOG%") DO SET "FSZ=%%~zG"

REM Erase the empty errors file (first check if it's zero bytes)
IF %FSZ% EQU 0 GOTO ERREQU0

REM -----------------------------------------------------------------------------------
REM Then, if the size is GTR than 1, do some more fancy printing, then skip to EEND
IF %FSZ% GTR 1 GOTO ERRGTR1
GOTO ERRLSS1

:ERRGTR1
ECHO The following errors occurred^: >%DBGMAC%
TYPE "%ERRLOG%" >%DBGMAC%
ECHO.>%ERRMAC%
ECHO The error log can be found at "%ERRLOG%" >%DBGMAC%
ECHO.>%DBGMAC%
GOTO EEND

:ERRLSS1
REM -----------------------------------------------------------------------------------
REM We found an error log, but it's size was ID'd as equal to or less-than 1 in above IF statement, so print this to logs
ECHO No known errors occurred. >%DBGMAC%
ECHO.>%DBGMAC%
ECHO However, an error log was found at "%ERRLOG%", >%DBGMAC%
ECHO it is recommended that you check this file if you encounter problems >%DBGMAC%
ECHO.>%DBGMAC%
GOTO EEND

:ERREQU0
DEL "%ERRLOG%" /q >%DBGMAC%
ECHO.>%DBGMAC%
GOTO EEND

REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
REM This is the end of all things
REM -----------------------------------------------------------------------------------
:EEND

ECHO The following logs were generated:>%DBGMAC%
ECHO.>%DBGMAC%
IF EXIST "%LOGFILE%" ECHO - "%LOGFILE%">%DBGMAC%
IF EXIST "%DEBUGLOG%" ECHO - "%DEBUGLOG%">%DBGMAC%
IF EXIST "%ERRLOG%" ECHO - "%ERRLOG%">%DBGMAC%
ECHO.>%DBGMAC%

ECHO.
CALL :c F8 "-----------------------------------------"
ECHO.
CALL :c F8 "| "
CALL :c F0 "Start time   : "
CALL :c 2F "%STARTTIME%           "
CALL :c F8 " |"
ECHO.
CALL :c F8 "| "
CALL :c F0 "Finish time  : "
CALL :c 9F "%ENDTIME%           "
CALL :c F8 " |"
ECHO.
CALL :c F8 "| "
CALL :c F0 "Duration     : "
CALL :c 5F " %DURATION%  "
CALL :c F8 " |"
ECHO.
CALL :c F8 "-----------------------------------------"
ECHO.
ECHO.

CALL :cleanupColorPrint

REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
REM -----------------------------------------------------------------------------------
ECHO Ending local expansion >%DBGMAC%
ECHO. >%DBGMAC%
ECHO %APPNAME%>%DBGMAC%
ECHO %CPR%>%DBGMAC%
ECHO ===============================================================================>%DBGMAC%

REM Silently erase all of our temporary files
CALL :ERASETMPFILES

REM End our master local expansion.
ENDLOCAL

REM Halt output
PAUSE

REM Clear screen
CLS

REM -----------------------------------------------------------------------------------
REM Something witty, wait, I had something for this . . .
REM -----------------------------------------------------------------------------------

REM THE REAL END
EXIT /B

REM Windows CLI colour matrix

REM 0 = Black       8 = Gray
REM 1 = Blue        9 = Light Blue
REM 2 = Green       A = Light Green
REM 3 = Aqua        B = Light Aqua
REM 4 = Red         C = Light Red
REM 5 = Purple      D = Light Purple
REM 6 = Yellow      E = Light Yellow
REM 7 = White       F = Bright White

REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
REM -----------------------------------------------------------------------------------------------------------------------------------------------------------------------

REM          S U B         -         R O U T I N E                  C I T Y

:SUB_ROUTINES
REM -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

REM -----------------------------------------------------------------------------------
REM Colour functions by SO user 'dbenham'

:c
SetLocal enableDelayedExpansion
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:colourPrint Color  Str  [/n]
SetLocal
SET "s=%~2"
CALL :colourPrintVar %1 s %3
EXIT /B

:colourPrintVar  Color  StrVar  [/n]
IF NOT DEFINED DEL CALL :initColorPrint
REM IF NOT DEFINED DEL (
REM 	FOR /f "usebackq" %%A IN (`"FOR %%B IN (1) DO REM"`) DO SET "DEL=%%A %%A"
REM 	<NUL >"%TEMP%\'" SET /p "=."
REM 	SUBST ': "%TEMP%" >NUL
REM )
SetLocal enableDelayedExpansion
PUSHD .
':
CD \
SET "s=!%~2!"
:: The single blank line within the following IN() clause is critical - DO NOT REMOVE
FOR %%n IN (^"^

^") DO (
  SET "s=!s:\=%%~n\%%~n!"
  SET "s=!s:/=%%~n/%%~n!"
  SET "s=!s::=%%~n:%%~n!"
)
FOR /f delims^=^ eol^= %%s IN ("!s!") DO (
  IF "!" EQU "" SetLocal disableDelayedExpansion
  IF %%s==\ (
    FINDSTR /a:%~1 "." "\'" NUL
    <NUL SET /p "=%DEL%%DEL%%DEL%"
  ) ELSE IF %%s==/ (
    FINDSTR /a:%~1 "." "/.\'" NUL
    <NUL SET /p "=%DEL%%DEL%%DEL%%DEL%%DEL%"
  ) ELSE (
    >colourPrint.txt (ECHO %%s\..\')
    FINDSTR /a:%~1 /f:colourPrint.txt "."
    <NUL SET /p "=%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%"
  )
)
IF /i "%~3"=="/n" ECHO.
POPD

EXIT /B

:initColorPrint
FOR /f %%A IN ('"PROMPT $H&FOR %%B IN (1) DO REM"') DO SET "DEL=%%A %%A"
<NUL >"%TEMP%\'" SET /p "=."
SUBST ': "%TEMP%" >NUL
EXIT /B


:cleanupColorPrint
2>NUL DEL "%TEMP%\'"
2>NUL DEL "%TEMP%\colourPrint.txt"
>NUL SUBST ': /d
EXIT /B

REM -----------------------------------------------------------------------------------
REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
REM -----------------------------------------------------------------------------------
:SIZEDIVIDE val_dividend val_divisor [ref_result] [ref_remainder]
REM Divide a huge number exceeding the 32-bit limitation
REM by a 32-bit number in the range from 1 to 1000000000;
REM the result might also exceed the 32-bit limitation.
SETLOCAL EnableDelayedExpansion
SET "DIVIDEND=%~1"
SET "DIVISOR=%~2"
SET "QUOTIENT=%~3"
SET "REMAINDER=%~4"

REM Check whether dividend and divisor are given:
IF NOT DEFINED DIVIDEND (
    >&2 ECHO(Too few arguments, dividend missing^^!
    EXIT /B 2
) ELSE IF NOT DEFINED DIVISOR (
    >&2 ECHO(Too few arguments, divisor missing^^!
    EXIT /B 2
)
REM Check whether dividend is purely numeric:
FOR /F "tokens=* delims=0123456789" %%N IN ("!DIVIDEND!") DO (
    IF NOT "%%N"=="" (
        >&2 ECHO(Dividend must be numeric^^!
        EXIT /B 2
    )
)
REM Convert divisor to numeric value without leading zeros:
FOR /F "tokens=* delims=0" %%N IN ("%DIVISOR%") DO SET "DIVISOR=%%N"
SET /A DIVISOR+=0
REM Check divisor against its range:
IF %DIVISOR% LEQ 0 (
    >&2 ECHO(Divisor value must be positive^^!
    EXIT /B 1
) ELSE IF %DIVISOR% GTR 1000000000 (
    >&2 ECHO(Divisor value exceeds its limit^^!
    EXIT /B 1
)
SET "COLL=" & SET "NEXT=" & SET /A INDEX=0
REM Do a division digit by digit as one would do it on paper:
:SIZELOOP
IF "!DIVIDEND:~%INDEX%,1!"=="" GOTO :SIZECONT
SET "NEXT=!NEXT!!DIVIDEND:~%INDEX%,1!"
REM Remove trailing zeros as such denote octal numbers:
FOR /F "tokens=* delims=0" %%N IN ("!NEXT!") DO SET "NEXT=%%N"
SET /A NEXT+=0
SET /A PART=NEXT/DIVISOR
SET "COLL=!COLL!!PART!"
SET /A NEXT-=PART*DIVISOR
SET /A INDEX+=1
GOTO :SIZELOOP
:SIZECONT
REM Remove trailing zeros as such denote octal numbers:
FOR /F "tokens=* delims=0" %%N IN ("%COLL%") DO SET "COLL=%%N"
IF NOT DEFINED COLL SET "COLL=0"
REM Set return variables or display result if none are given:
IF DEFINED QUOTIENT (
    IF DEFINED REMAINDER (
        ENDLOCAL
        SET "%REMAINDER%=%NEXT%"
    ) ELSE (
        ENDLOCAL
    )
    SET "%QUOTIENT%=%COLL%"
) ELSE (
    ENDLOCAL
    ECHO(%COLL%
)
EXIT /B
REM -----------------------------------------------------------------------------------
REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

:RESET_COUNTS_PERCS
SET /A PERCOUT=0
SET /A TOTALPERC=0
SET /A TOTALPERC1=0
SET /A COUNT=0
EXIT /B

REM -----------------------------------------------------------------------------------
REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

:TOTALPERC
IF !FILEAMT! GTR 1 (
	SET /A COUNT += 1
	SET FILENUM=!COUNT!
	ECHO FILENUM IS !FILENUM! out of !FILEAMT!>%DBGMAC%
	ECHO.>%DBGMAC%
	SET /A "FILENUM1=FILENUM*100"
	ECHO FILENUM1 = !FILENUM1! >%DBGMAC%
	ECHO.>%DBGMAC%
	SET /A "TOTALPERC=FILENUM1/FILEAMT"
	ECHO TOTALPERC IS !TOTALPERC!%% >%DBGMAC%
	ECHO.>%DBGMAC%
)
EXIT /B

REM -----------------------------------------------------------------------------------
REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

:TOTALSIZEIN
REM Go through each file, add their rounded MB values up.
ECHO Adding file sizes . . . >%DBGMAC%
ECHO.>%DBGMAC%
FOR /F "usebackq tokens=* delims=" %%G IN ("%temp%\userselectedfiles.tmp") DO (
	REM CALL Our standard file constants
	SET "FILE=%%G"
	SET "FILED=%%~dpG"
	SET "FILEN=%%~nG"
	SET "FILEX=%%~xG"
	SET "FILEZ=%%~zG"
	CALL :TOTALPERC
	CALL :DYNANMICFILE
	SET RUNNINGSIZE=0
	SET /A RUNNINGSIZE += MBYTES
	ECHO !RUNNINGSIZE!>>"runningsize.tmp"
	ECHO Added !RUNNINGSIZE!MB so far... >%DBGMAC%
	ECHO.>%DBGMAC%
)

REM Because the loop is finished (i.e no more files) then RUNNINGSIZE is now more like a total size.
REM Set this.
SET "TOTALSIZEIN=!RUNNINGSIZE!"

EXIT /B

:REMAINSIZE
REM Now, we subtract the current MB size from the total.
REM We also need to add the current files size to the total
REM in order for us to arrive at 0 when there are no files remaining

REM This can go in our main program FOR loop
REM FOR /F "usebackq tokens=* delims=" %%G IN ("%temp%\userselectedfiles.tmp") DO (
	SET /A REMAINSIZE=TOTALSIZEIN+MBYTES
	SET /A REMAINSIZE -= MBYTES
	ECHO !REMAINSIZE!>>"remainsize.tmp"
	ECHO !REMAINSIZE!MB remaining... >%DBGMAC%
	ECHO.>%DBGMAC%
REM )

EXIT /B

REM -----------------------------------------------------------------------------------
REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

:DURATION_START
SET "DURATION_START=!TIME!"

EXIT /B
REM -----------------------------------------------------------------------------------
REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

:DURATION_END
SET "DURATION_END=!TIME!"

REM Change formatting for the start and end times
FOR /F "tokens=1-4 delims=:.," %%a IN ("%DURATION_START%") DO SET /A "DUR_start=(((%%a*60)+1%%b %% 100)*60+1%%c %% 100)*100+1%%d %% 100"

FOR /F "tokens=1-4 delims=:.," %%a IN ("%DURATION_END%") DO SET /A "DUR_end=(((%%a*60)+1%%b %% 100)*60+1%%c %% 100)*100+1%%d %% 100"

REM Calculate the elapsed time by subtracting values
SET /A DUR_elapsed=DUR_end-DUR_start

REM Format the results for output
SET /A DUR_hh=DUR_elapsed/(60*60*100), DUR_rest=DUR_elapsed%%(60*60*100), DUR_mm=DUR_rest/(60*100), DUR_rest%%=60*100, DUR_ss=DUR_rest/100, DUR_cc=DUR_rest%%100
IF %DUR_hh% lss 10 SET "DUR_hh=0%DUR_hh%"
IF %DUR_mm% lss 10 SET "DUR_mm=0%DUR_mm%"
IF %DUR_ss% lss 10 SET "DUR_ss=0%DUR_ss%"
IF %DUR_cc% lss 10 SET "DUR_cc=0%DUR_cc%"

REM SET DURATION=%DUR_hh%:%DUR_mm%:%DUR_ss%,%DUR_cc%
SET "DURATION_=%DUR_hh%hrs %DUR_mm%mins %DUR_ss%secs"

SET "FANCYDURATION_=%DUR_hh%hrs %DUR_mm%mins %DUR_ss%secs"
IF "%DUR_hh%"=="00" (
	SET "FANCYDURATION_=%DUR_mm%mins %DUR_ss%secs"
	IF "%DUR_mm%"=="00" (
		SET "FANCYDURATION_=%DUR_ss%secs"
	)
)

EXIT /B
REM -----------------------------------------------------------------------------------
REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

:DYNANMICFILE
ECHO FILE EXISTS AS !FILE!>%DBGMAC%
ECHO FILED SET AS !FILED!>%DBGMAC%
ECHO FILEN SET AS !FILEN!>%DBGMAC%
ECHO FILEX SET AS !FILEX!>%DBGMAC%
ECHO FILEZ SET AS !FILEZ!>%DBGMAC%
ECHO.>%DBGMAC%

REM Useless now
REM SET /A FSIZE1=FILEZ/1024
REM ECHO FSIZE1 SET AS !FSIZE1!
REM SET /A FSIZE=FSIZE1/1024
REM ECHO FSIZE SET AS !FSIZE!
REM SET /A FSIZEG=FSIZE/1024
REM ECHO FSIZEG SET AS !FSIZEG!
REM ECHO.

SET "BYTES=!FILEZ!">%DBGMAC%

REM Define constants here:
SET /A DIVISOR=1024 & rem (1024 Bytes = 1 KBytes, 1024 KBytes = 1 MByte,...)
SET "ROUNDUP=#" & rem (SET to non-empty value to round up results)

IF NOT DEFINED BYTES SET "BYTES=0">%DBGMAC%
REM Display result in Bytes and divide it to get KBytes, MBytes, etc.:
CALL :SIZEDIVIDE !BYTES! 1 RESULT>%DBGMAC%
ECHO Bytes:    !RESULT!>%DBGMAC%
CALL :SIZEDIVIDE !RESULT! !DIVISOR! RESULT REST
IF DEFINED ROUNDUP if 0!REST! GTR 0 SET /A RESULT+=1
ECHO KBytes:    !RESULT!>%DBGMAC%
SET KBYTES=!RESULT!
ECHO SET KBYTES AS !KBYTES!>%DBGMAC%
CALL :SIZEDIVIDE !RESULT! !DIVISOR! RESULT REST
IF DEFINED ROUNDUP if 0!REST! GTR 0 SET /A RESULT+=1
ECHO MBytes:    !RESULT!>%DBGMAC%
SET MBYTES=!RESULT!
ECHO SET MBYTES AS !MBYTES!>%DBGMAC%
ECHO.>%DBGMAC%

REM GB is virtually useless without decimals and better rounding.
REM CALL :SIZEDIVIDE !RESULT! !DIVISOR! RESULT REST
REM IF DEFINED ROUNDUP if 0!REST! GTR 0 SET /A RESULT+=1
REM ECHO GBytes:    !RESULT!

EXIT /B

REM -----------------------------------------------------------------------------------
REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

:COUNTLINES
ECHO.>%DBGMAC%
ECHO Counting lines... >%DBGMAC%
ECHO.>%DBGMAC%
ECHO Using SET "CMD=findstr /R /N "^^" "%temp%\userselectedfiles.tmp" >%DBGMAC%
ECHO piped with find /C ":"">%DBGMAC%
ECHO.>%DBGMAC%

SET "CMD=findstr /R /N "^^" "%temp%\userselectedfiles.tmp" | find /C ":""

ECHO Running FOR loop on file>%DBGMAC%
ECHO.>%DBGMAC%
FOR /F %%A IN ('!CMD!') DO (
	SET FILEAMT=%%A
	ECHO Number of lines in selection = !FILEAMT!>%DBGMAC%
	ECHO.>%DBGMAC%
)
EXIT /B

REM -----------------------------------------------------------------------------------
REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

:OUTFILESIZE
ECHO OUTFILEZ SET AS !OUTFILEZ!>%DBGMAC%
ECHO.>%DBGMAC%

SET "OUTBYTES=!OUTFILEZ!">%DBGMAC%

REM Define constants here:
SET /A DIVISOR=1024 & rem (1024 Bytes = 1 KBytes, 1024 KBytes = 1 MByte,...)
SET "ROUNDUP=#" & rem (SET to non-empty value to round up results)

IF NOT DEFINED OUTBYTES SET "OUTBYTES=0">%DBGMAC%
REM Display result in Bytes and divide it to get KBytes, MBytes, etc.:
CALL :SIZEDIVIDE !OUTBYTES! 1 OUTRESULT>%DBGMAC%
ECHO Bytes:    !OUTRESULT!>%DBGMAC%
CALL :SIZEDIVIDE !OUTRESULT! !DIVISOR! OUTRESULT OUTREST
IF DEFINED ROUNDUP if 0!OUTREST! GTR 0 SET /A OUTRESULT+=1
ECHO KBytes:    !OUTRESULT!>%DBGMAC%
SET OUTKBYTES=!OUTRESULT!
ECHO SET OUTKBYTES AS !OUTKBYTES!>%DBGMAC%
CALL :SIZEDIVIDE !OUTRESULT! !DIVISOR! OUTRESULT OUTREST
IF DEFINED ROUNDUP if 0!OUTREST! GTR 0 SET /A OUTRESULT+=1
ECHO MBytes:    !OUTRESULT!>%DBGMAC%
SET OUTMBYTES=!OUTRESULT!
ECHO SET OUTMBYTES AS !OUTMBYTES!>%DBGMAC%
ECHO.>%DBGMAC%

REM These need to go together
REM EXIT /B

:SAVEDPERCENT
SET INSIZE=!RESULT!
ECHO INSIZE = !INSIZE!>%DBGMAC%
SET /A OUTSIZE=INSIZE-OUTRESULT
ECHO OUTSIZE = !INSIZE!-!OUTRESULT! = !OUTSIZE!>%DBGMAC%
SET /A OUTPERC=OUTSIZE*100
ECHO OUTPERC = !OUTSIZE!*100 = !OUTPERC!>%DBGMAC%
SET /A OUTPERC=OUTPERC/INSIZE
ECHO OUTPERC = !OUTPERC!/!INSIZE! = !OUTPERC!>%DBGMAC%
ECHO.>%DBGMAC%
ECHO You saved approx. !OUTSIZEKB! KB ^(!OUTPERC!%%^). >%DBGMAC%
EXIT /B
REM -----------------------------------------------------------------------------------
REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

:OUTFILESIZEKB
ECHO OUTFILEZKB SET AS !OUTFILEZKB!>%DBGMAC%
ECHO.>%DBGMAC%

SET "OUTBYTESKB=!OUTFILEZKB!">%DBGMAC%

REM Define constants here:
SET /A DIVISOR=1024 & rem (1024 Bytes = 1 KBytes, 1024 KBytes = 1 MByte,...)
SET "ROUNDUP=#" & rem (SET to non-empty value to round up results)

IF NOT DEFINED OUTBYTESKB SET "OUTBYTESKB=0">%DBGMAC%
REM Display result in Bytes and divide it to get KBytes, MBytes, etc.:
CALL :SIZEDIVIDE !OUTBYTESKB! 1 OUTRESULTKB>%DBGMAC%
ECHO Bytes:    !OUTRESULTKB!>%DBGMAC%
CALL :SIZEDIVIDE !OUTRESULTKB! !DIVISOR! OUTRESULTKB OUTRESTKB
IF DEFINED ROUNDUP if 0!OUTRESTKB! GTR 0 SET /A OUTRESULTKB+=1
ECHO KBytes:    !OUTRESULTKB!>%DBGMAC%
SET OUTKBYTES=!OUTRESULTKB!
ECHO SET OUTKBYTES AS !OUTKBYTES!>%DBGMAC%
CALL :SIZEDIVIDE !OUTRESULTKB! !DIVISOR! OUTRESULTKB OUTRESTKB
IF DEFINED ROUNDUP if 0!OUTRESTKB! GTR 0 SET /A OUTRESULTKB+=1
ECHO MBytes:    !OUTRESULTKB!>%DBGMAC%
SET OUTMBYTES=!OUTRESULTKB!
ECHO SET OUTMBYTES AS !OUTMBYTES!>%DBGMAC%
ECHO.>%DBGMAC%

REM These need to go together
REM EXIT /B

:SAVEDPERCENTKB
SET INSIZEKB=!KBYTES!
ECHO INSIZEKB = !INSIZEKB!>%DBGMAC%
SET /A OUTSIZEKB=INSIZEKB-OUTKBYTES
ECHO OUTSIZEKB = !INSIZEKB!-!OUTKBYTES! = !OUTSIZEKB!>%DBGMAC%
SET /A OUTPERCKB=OUTSIZEKB*100
ECHO OUTPERCKB = !OUTSIZEKB!*100 = !OUTPERCKB!>%DBGMAC%
SET /A OUTPERCKB=OUTPERCKB/INSIZEKB
ECHO OUTPERCKB = !OUTPERCKB!/!INSIZEKB! = !OUTPERCKB!>%DBGMAC%
ECHO.>%DBGMAC%
ECHO You saved approx. !OUTPERCKB!%% >%DBGMAC%
EXIT /B

REM -----------------------------------------------------------------------------------
REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

:REPLACEUSF_ALL
ECHO Replacing data...>%DBGMAC%
ECHO.>%DBGMAC%
"%FNR%" --cl --dir "%temp%" --fileMask "userselectedfiles.tmp" --find """ """ --replace "\n"
SET "q=^"
CLS
ECHO ===============================================================================
CALL :c 97 "%APPNAME%" /n
ECHO %CPR%
ECHO ===============================================================================
EXIT /B

REM -----------------------------------------------------------------------------------
REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

:REPLACEUSF_MULTI
ECHO We detected more than 1 line in "%temp%\userselectedfiles.tmp">%DBGMAC%
ECHO.>%DBGMAC%
ECHO Continuing...>%DBGMAC%
ECHO.>%DBGMAC%

ECHO Replacing data...>%DBGMAC%
ECHO.>%DBGMAC%
"%FNR%" --cl --dir "%temp%" --fileMask "userselectedfiles.tmp" --find "REM """ --replace ""
SET "q=^"
CLS
ECHO ===============================================================================
CALL :c 97 "%APPNAME%" /n
ECHO %CPR%
ECHO ===============================================================================

ECHO Replacing data...>%DBGMAC%
ECHO.>%DBGMAC%
"%FNR%" --cl --dir "%temp%" --fileMask "userselectedfiles.tmp" --find """\n" --replace ""
SET "q=^"
CLS
ECHO ===============================================================================
CALL :c 97 "%APPNAME%" /n
ECHO %CPR%
ECHO ===============================================================================
EXIT /B

REM -----------------------------------------------------------------------------------
REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

:REPLACEUSF_SINGLEFILE
ECHO Replacing data...>%DBGMAC%
ECHO.>%DBGMAC%
ECHO "%FNR%" --cl --dir "%temp%" --fileMask "userselectedfiles.tmp" --find "REM """ --replace "" >%DBGMAC%
ECHO.>%DBGMAC%
"%FNR%" --cl --dir "%temp%" --fileMask "userselectedfiles.tmp" --find "REM """ --replace ""
SET "q=^"
CLS
ECHO ===============================================================================
CALL :c 97 "%APPNAME%" /n
ECHO %CPR%
ECHO ===============================================================================

ECHO Replacing data...>%DBGMAC%
ECHO.>%DBGMAC%
ECHO "%FNR%" --cl --dir "%temp%" --fileMask "userselectedfiles.tmp" --find """\n" --replace "" >%DBGMAC%
ECHO.>%DBGMAC%
"%FNR%" --cl --dir "%temp%" --fileMask "userselectedfiles.tmp" --find """\n" --replace ""
SET "q=^"
CLS
ECHO ===============================================================================
CALL :c 97 "%APPNAME%" /n
ECHO %CPR%
ECHO ===============================================================================

ECHO IF !FILEAMT! LEQ 1 SET /p SINGLEINPUT=<"%temp%\userselectedfiles.tmp" >%DBGMAC%
ECHO.>%DBGMAC%
IF !FILEAMT! LEQ 1 SET /p SINGLEINPUT=<"%temp%\userselectedfiles.tmp"

EXIT /B

REM -----------------------------------------------------------------------------------
REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

:ERASETMPFILES
REM Erase temp log files before popping out of DP1
REM Suppressed output has to be sent to a NUL device
REM Fixed names
IF EXIST "%TMPL%" DEL "%TMPL%" /q /s >NUL 2>&1
IF EXIST "%TMPD%" DEL "%TMPD%" /q /s >NUL 2>&1
IF EXIST "%~dp0_" DEL "%~dp0_" /q /s >NUL 2>&1
IF EXIST "%~dp0o" DEL "%~dp0o" /q /s >NUL 2>&1
IF EXIST "%~dp0i" DEL "%~dp0i" /q /s >NUL 2>&1
IF EXIST "%~dp0y" DEL "%~dp0y" /q /s >NUL 2>&1
IF EXIST "!FILED!debuglog.tmp" DEL "!FILED!debuglog.tmp" /q /s >NUL 2>&1
IF EXIST "!FILED!errorlog.tmp" DEL "!FILED!errorlog.tmp" /q /s >NUL 2>&1
IF EXIST "!FILED!input.temp" DEL "!FILED!input.temp" /q /s >NUL 2>&1
IF EXIST "!FILED!tmplog.tmp" DEL "tmplog.tmp" /q /s >NUL 2>&1
IF EXIST "!FILED!_" DEL "!FILED!_" /q /s >NUL 2>&1
IF EXIST "!FILED!o" DEL "!FILED!o" /q /s >NUL 2>&1
IF EXIST "!FILED!i" DEL "!FILED!i" /q /s >NUL 2>&1
IF EXIST "!FILED!y" DEL "!FILED!y" /q /s >NUL 2>&1
IF EXIST "%TOPDIR%\debuglog.tmp" DEL "%TOPDIR%\debuglog.tmp" /q /s >NUL 2>&1
IF EXIST "%TOPDIR%\errorlog.tmp" DEL "%TOPDIR%\errorlog.tmp" /q /s >NUL 2>&1
IF EXIST "%TOPDIR%\input.temp" DEL "%TOPDIR%\input.temp" /q /s >NUL 2>&1
IF EXIST "%TOPDIR%\tmplog.tmp" DEL "%TOPDIR%\tmplog.tmp" /q /s >NUL 2>&1
IF EXIST "%TOPDIR%\_" DEL "%TOPDIR%\_" /q /s >NUL 2>&1
IF EXIST "%TOPDIR%\o" DEL "%TOPDIR%\o" /q /s >NUL 2>&1
IF EXIST "%TOPDIR%\i" DEL "%TOPDIR%\i" /q /s >NUL 2>&1
IF EXIST "%TOPDIR%\y" DEL "%TOPDIR%\y" /q /s >NUL 2>&1
IF EXIST "debuglog.tmp" DEL "debuglog.tmp" /q /s >NUL 2>&1
IF EXIST "errorlog.tmp" DEL "errorlog.tmp" /q /s >NUL 2>&1
IF EXIST "input.temp" DEL "input.temp" /q /s >NUL 2>&1
IF EXIST "tmplog.tmp" DEL "tmplog.tmp" /q /s >NUL 2>&1
IF EXIST "tmp.size" DEL "tmp.size" /q /s >NUL 2>&1
IF EXIST "remainsize.tmp" DEL "remainsize.tmp" /q /s >NUL 2>&1
REM IF EXIST "%temp%\userselectedfile.tmp" DEL "%temp%\userselectedfile.tmp" /q /s >NUL 2>&1
REM IF EXIST "%temp%\userselectedfiles.tmp" DEL "%temp%\userselectedfiles.tmp" /q /s >NUL 2>&1

REM Wildcard names
DEL "!FILED!*.cache" /q /s >NUL 2>&1
DEL "!FILED!*.mpc" /q /s >NUL 2>&1
DEL "!FILED!*.miff" /q /s >NUL 2>&1
DEL "%TOPDIR%\*.cache" /q /s >NUL 2>&1
DEL "%TOPDIR%\*.mpc" /q /s >NUL 2>&1
DEL "%TOPDIR%\*.miff" /q /s >NUL 2>&1
DEL "*.cache" /q /s >NUL 2>&1
DEL "*.mpc" /q /s >NUL 2>&1
DEL "*.miff" /q /s >NUL 2>&1

EXIT /B

REM -----------------------------------------------------------------------------------
REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

:INPUTFOLDERBROWSER
ECHO please select your input folder . . . >%DBGMAC%
ECHO.>%DBGMAC%

"%DODBEXE%" "%CD%" "%Username%, please select your input folder" >i
(
SET /p CHOSENDIR=
) <i

IF EXIST "i" DEL "i" /q /s >NUL 2>&1

ECHO Input folder chosen as^:
ECHO %CHOSENDIR% >%DBGMAC%
ECHO.>%DBGMAC%

REM DIR "%CHOSENDIR%" /s /b /A:-D > %temp%\userselectedfiles.tmp
REM Removed /s switch from these DIR commands to avoid unwanted recursions
PUSHD "%CHOSENDIR%"
IF EXIST "%temp%\userselectedfiles.tmp" DEL "%temp%\userselectedfiles.tmp" /q /s >NUL 2>&1
FOR /R %%G IN (*.%sFileType1%) DO ECHO %%G>> "%temp%\userselectedfiles.tmp"
FOR /R %%G IN (*.%sFileType2%) DO ECHO %%G>> "%temp%\userselectedfiles.tmp"
FOR /R %%G IN (*.%sFileType3%) DO ECHO %%G>> "%temp%\userselectedfiles.tmp"
FOR /R %%G IN (*.%sFileType4%) DO ECHO %%G>> "%temp%\userselectedfiles.tmp"
FOR /R %%G IN (*.%sFileType5%) DO ECHO %%G>> "%temp%\userselectedfiles.tmp"
FOR /R %%G IN (*.%sFileType6%) DO ECHO %%G>> "%temp%\userselectedfiles.tmp"
FOR /R %%G IN (*.%sFileType7%) DO ECHO %%G>> "%temp%\userselectedfiles.tmp"
FOR /R %%G IN (*.%sFileType8%) DO ECHO %%G>> "%temp%\userselectedfiles.tmp"
FOR /R %%G IN (*.%sFileType9%) DO ECHO %%G>> "%temp%\userselectedfiles.tmp"
FOR /R %%G IN (*.%sFileType10%) DO ECHO %%G>> "%temp%\userselectedfiles.tmp"
FOR /R %%G IN (*.%sFileType11%) DO ECHO %%G>> "%temp%\userselectedfiles.tmp"
POPD
ECHO.>%DBGMAC%
EXIT /B

REM -----------------------------------------------------------------------------------
REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

:OUTPUTFOLDERBROWSER
ECHO please select your output folder . . . >%DBGMAC%
ECHO.>%DBGMAC%

"%DODBEXE%" "%CD%" "%Username%, please select your output folder" >o
(
SET /p CHOSENDIROUT=
) <o

IF EXIST "o" DEL "o" /q /s >NUL 2>&1

IF "%ReturnCode%"=="1" GOTO ERROR
IF "%ReturnCode%"=="2" GOTO CANCELED

ECHO Output folder chosen as^:
ECHO %CHOSENDIROUT% >%DBGMAC%
ECHO.>%DBGMAC%

EXIT /B

REM -----------------------------------------------------------------------------------
REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

:PRESUPPORTEDFILES
IF EXIST "*Thumbs.db" (
	REM Get rid of Windows nonsense before processing anything.
	REM Windows will regenerate them if and when they're needed.
	ECHO We detected Windows thumbnail cache files in this directory, removing. >%DBGMAC%
	ECHO.>%DBGMAC%
	DEL /s /F /A:S *Thumbs.db >%DBGMAC%
	ECHO.>%DBGMAC%
)
IF EXIST "*ehthumbs*.db" (
	REM Get rid of Windows nonsense before processing anything.
	REM Windows will regenerate them if and when they're needed.
	ECHO We detected EH thumbnail cache files in this directory, removing. >%DBGMAC%
	ECHO.>%DBGMAC%
	DEL /s /F /A:S *ehthumbs*.db >%DBGMAC%
	ECHO.>%DBGMAC%
)
IF EXIST "jmt_files_input.txt" ECHO !FILE!>>jmt_files_input.txt ELSE ECHO !FILE!>jmt_files_input.txt
EXIT /B

REM -----------------------------------------------------------------------------------
REM = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
