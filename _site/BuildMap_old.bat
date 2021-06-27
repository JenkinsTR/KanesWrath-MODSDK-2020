::==============================================================::
::===== ABOUT ==================================================::
::==============================================================::
::                                                              ::
:: Extended BuildMap.bat for compiling Command & Conquer 3 maps ::
::                                                              ::
:: Author: Bibber                                               ::
:: eMail: m.bibber@web.de                                       ::
:: Homepage: http://bibber.bplaced.net                          ::
::                                                              ::
::==============================================================::
::===== USAGE ==================================================::
::==============================================================::
::                                                              ::
:: BuildMap.bat MapName [/b | /nb] [/c | /nc] [/f | /nf]        ::
::                                                              ::
:: /b: Clear built map                                          ::
:: /nb: Do not clear built map (default)                        ::
:: /c: Clear cache                                              ::
:: /nc: Do not clear cache (default)                            ::
:: /f: Fix assets                                               ::
:: /nf: Do not fix assets                                       ::
::                                                              ::
::==============================================================::
::===== PROGRAM ================================================::
::==============================================================::

@echo off
set map=
set udl=
set sdk=
set cbm=false
set clc=false
set fix=true

echo.
set par=%~1
if defined par set map=%par%
if not defined map set /P map="Map: " else echo Map: %map%

:par_start
	set par=%~2
	if defined par (
		if /I "%par%" == "/b" set cbm=true
		if /I "%par%" == "/c" set clc=true
		if /I "%par%" == "/f" set fix=true
		if /I "%par%" == "/nb" set cbm=false
		if /I "%par%" == "/nc" set clc=false
		if /I "%par%" == "/nf" set fix=false
		shift
	) else goto par_end
	goto par_start
:par_end

if not defined udl for /F "tokens=2* delims=	 " %%A IN ('REG QUERY "HKLM\Software\Electronic Arts\Electronic Arts\Command and Conquer 3" /v "UserDataLeafName" 2^>nul') do call set udl="%%B"
if not defined udl for /F "tokens=2* delims=	 " %%A IN ('REG QUERY "HKLM\Software\Wow6432Node\Electronic Arts\Electronic Arts\Command and Conquer 3" /v "UserDataLeafName" 2^>nul') do call set udl="%%B"
if not defined udl set udl="Command & Conquer 3 Tiberium Wars"
for %%A in (%udl%) do set udl=%%~A

if not defined sdk for /F "tokens=2* delims=	 " %%A IN ('REG QUERY "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\{86C7336D-0E3A-4953-ADF4-F4B5E0096278}" /v "InstallLocation" 2^>nul') do call set sdk="%%B\"
if not defined sdk for /F "tokens=2* delims=	 " %%A IN ('REG QUERY "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{86C7336D-0E3A-4953-ADF4-F4B5E0096278}" /v "InstallLocation" 2^>nul') do call set sdk="%%B\"
if not defined sdk set sdk="%~dp0"
for %%A in (%sdk%) do set sdk=%%~A

set exc=buildmap_exclude.txt
cd /D "%sdk%"

if exist "%appdata%\%udl%\maps\%map%" (
	if /I %cbm%==true (
		echo.
		echo Clearing built map
		for /R "%sdk%builtmods\mods\maps\%map%" %%I in ("*.*") do if not "%%~xI" == ".asset" del "%%I" /F /Q
	)

	if /I %clc%==true (
		echo.
		echo Clearing cache
		if exist "%sdk%builtmods\builtmods" rd "%sdk%builtmods\builtmods" /S /Q
		for /R "%sdk%builtmods\mods\maps\%map%" %%I in ("*.asset") do del "%%I" /F /Q
		if exist "%sdk%builtmods\stringhashes.xml" del "%sdk%builtmods\stringhashes.xml" /F /Q
	)

	echo.
	echo Building map
	echo .cdata>%exc%
	echo map.bin>>%exc%
	echo map.imp>>%exc%
	echo map.manifest>>%exc%
	echo map.relo>>%exc%
	xcopy "%appdata%\%udl%\maps\%map%\*.*" "%sdk%mods\maps\%map%" /Q /Y /I /R /S /EXCLUDE:%exc%
	if exist "%exc%" del "%exc%" /F /Q
	if exist "%sdk%builtmods\mods\maps\%map%\map.bin" del "%sdk%builtmods\mods\maps\%map%\map.bin" /F /Q
	if exist "%sdk%builtmods\mods\maps\%map%\map.imp" del "%sdk%builtmods\mods\maps\%map%\map.imp" /F /Q
	if exist "%sdk%builtmods\mods\maps\%map%\map.manifest" del "%sdk%builtmods\mods\maps\%map%\map.manifest" /F /Q
	if exist "%sdk%builtmods\mods\maps\%map%\map.relo" del "%sdk%builtmods\mods\maps\%map%\map.relo" /F /Q
	if exist "%sdk%builtmods\mods\maps\%map%\map.version" del "%sdk%builtmods\mods\maps\%map%\map.version" /F /Q
	for /R "%sdk%builtmods\mods\maps\%map%" %%I in ("*.cdata") do del "%%I" /F /Q
	"%sdk%tools\binaryassetbuilder.exe" "%sdk%mods\maps\%map%\map.xml" /od:"%sdk%builtmods" /iod:"%sdk%builtmods" /ls:true /pc:true"

	if exist "%sdk%builtmods\mods\maps\%map%\map.manifest" (
		if /I %fix%==true if exist "%sdk%tools\assetresolver.exe" (
			echo.
			echo Fixing assets
			"%sdk%tools\hashfix.exe" "%sdk%builtmods\mods\maps\%map%\map.manifest"	
			xcopy "%sdk%builtmods\cnc3xml\worldbuilder.manifest" "%sdk%builtmods\mods\maps\%map%" /Q /Y /I /R /S
			"%sdk%tools\assetresolver.exe" -m "%sdk%builtmods\mods\maps\%map%\map.manifest" -s map
			if exist "%sdk%builtmods\mods\maps\%map%\worldbuilder.manifest" del "%sdk%builtmods\mods\maps\%map%\worldbuilder.manifest" /F /Q
		)

		echo .asset>%exc%
		xcopy "%sdk%builtmods\mods\maps\%map%\*.*" "%appdata%\%udl%\maps\%map%" /Q /Y /I /R /S /EXCLUDE:%exc%
		if exist "%exc%" del "%exc%" /F /Q
		echo.
		echo Map successfully compiled
	) else (
		echo.
		echo Map not compiled
	)

	if exist "%sdk%mods\maps" rd "%sdk%mods\maps" /S /Q
) else (
	echo.
	echo Map not found
)

echo.
pause

::==============================================================::
::==============================================================::
::==============================================================::