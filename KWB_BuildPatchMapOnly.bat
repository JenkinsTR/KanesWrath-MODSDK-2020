@echo off
cd /D "%~dp0"
set modname=%~1
set modversion=%~2
set /P version=<"%cd%\Tools\version.txt"

echo.
echo WrathEd %version%
echo.

:modname
if not defined modname set /P modname="Mod Name: "
if not defined modname goto modname
:modversion
if not defined modversion set /P modversion="Mod Version: "
if not defined modversion goto modversion
set streamversion=_mod

for /F "tokens=2* delims=	 " %%A in ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Personal"') do call set mydocs=%%B
for /F "tokens=2* delims=	 " %%A in ('REG QUERY "HKLM\Software\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "UserDataLeafName" 2^>nul') do call set userdataleaf="%%B"
if not defined userdataleaf for /F "tokens=2* delims=	 " %%A in ('REG QUERY "HKLM\Software\Wow6432Node\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "UserDataLeafName" 2^>nul') do call set userdataleaf="%%B"

if not defined userdataleaf (
	set userdataleaf="Command and Conquer 3 Kanes Wrath"
)

for /F "delims=" %%A in (%userdataleaf%) do set userdataleaf=%%~A

echo.
echo %modname% %modversion%

if not exist "%cd%\Mods\%modname%" (
	echo Error: The mod doesn't exist
	echo.
	pause
	goto eof
)

if exist "%cd%\Compilation\Mods\%modname%" rd "%cd%\Compilation\Mods\%modname%" /S /Q

echo Compiling Maps...

if exist "%cd%\Mods\%modname%\Data\mapmetadata.xml" "%cd%\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Mods\%modname%\Data\mapmetadata.xml" -out:"%cd%\Compilation\Mods\%modname%\Data" -version:""

if exist "%cd%\Mods\%modname%\Data\AdditionalMaps\mapmetadata_SinglePlayer.xml" "%cd%\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Mods\%modname%\Data\AdditionalMaps\mapmetadata_SinglePlayer.xml" -out:"%cd%\Compilation\Mods\%modname%\Data\AdditionalMaps" -version:""

setlocal EnableDelayedExpansion

set sdk=!cd!
cd /D "!sdk!\Mods\%modname%\Data\maps\official"

for /D %%A in ("*") do (
	echo Compiling Map %%A...
	if exist "!sdk!\Mods\%modname%\Data\maps\official\%%A\map.xml" (
		if exist "!sdk!\Game Files\Manifest\maps\official\%%A\map_2.manifest" (
			"!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!sdk!\Mods\%modname%\Data\maps\official\%%A\map.xml" -data:"..\..\..\..\Data" -art:"..\..\..\..\Art" -audio:"..\..\..\..\Audio" -out:"!sdk!\Compilation\Mods\%modname%\Data\maps\official\%%A" -version:"%streamversion%" -bps:"maps\official\%%A\map_2.manifest,!sdk!\Game Files\Manifest\maps\official\%%A\map_2.manifest"
		) else if exist "!sdk!\Game Files\Manifest\maps\official\%%A\map_1.manifest" (
			"!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!sdk!\Mods\%modname%\Data\maps\official\%%A\map.xml" -data:"..\..\..\..\Data" -art:"..\..\..\..\Art" -audio:"..\..\..\..\Audio" -out:"!sdk!\Compilation\Mods\%modname%\Data\maps\official\%%A" -version:"%streamversion%" -bps:"maps\official\%%A\map_1.manifest,!sdk!\Game Files\Manifest\maps\official\%%A\map_1.manifest"	
		) else if exist "!sdk!\Game Files\Manifest\maps\official\%%A\map.manifest" (
			"!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!sdk!\Mods\%modname%\Data\maps\official\%%A\map.xml" -data:"..\..\..\..\Data" -art:"..\..\..\..\Art" -audio:"..\..\..\..\Audio" -out:"!sdk!\Compilation\Mods\%modname%\Data\maps\official\%%A" -version:"%streamversion%" -bps:"maps\official\%%A\map.manifest,!sdk!\Game Files\Manifest\maps\official\%%A\map.manifest"	
		)
	)
	if exist "!sdk!\Mods\%modname%\Data\maps\official\%%A\%%A.map" copy "!sdk!\Mods\%modname%\Data\maps\official\%%A\%%A.map" "!sdk!\Compilation\Mods\%modname%\Data\maps\official\%%A"	
	
	if exist "!sdk!\Compilation\Mods\%modname%\Data\maps\official\%%A\stringhashes.manifest" del "!sdk!\Compilation\Mods\%modname%\Data\maps\official\%%A\stringhashes.*"

)

cd /D "!sdk!"
set sdk=

endlocal EnableDelayedExpansion

if exist "%mydocs%\%userdataleaf%\Mods\%modname%\*.skudef" del "%mydocs%\%userdataleaf%\Mods\%modname%\*.skudef" /F /Q

if exist "%cd%\Compilation\Mods\%modname%" "%cd%\Tools\MakeBig.exe" -f "%cd%\Compilation\Mods\%modname%" -o:"%mydocs%\%userdataleaf%\Mods\%modname%\Meta\%modname%_%modversion%_Maps.big"

setlocal EnableDelayedExpansion

if exist "%cd%\Mods\%modname%\LanguagePacks" (
	set sdk=!cd!
	cd /D "!sdk!\Mods\%modname%\LanguagePacks"
	
	for /D %%A in ("*") do (
		
		if exist "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A" "!sdk!\Tools\MakeBig.exe" -f "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A" -o:"%mydocs%\%userdataleaf%\Mods\%modname%\%%AAudio\%%AAudio.big"
		
		if exist "!cd!\%%A\Misc" "!sdk!\Tools\MakeBig.exe" -f "!cd!\%%A\Misc" -o:"!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A" -o:"%mydocs%\%userdataleaf%\Mods\%modname%\Lang-%%A\%modname%_%modversion%_%%A.big"

		if exist "%mydocs%\%userdataleaf%\Mods\%modname%\Lang-%%A\%modname%_%modversion%_%%A.big" echo add-big Lang-%%A\%modname%_%modversion%_%%A.big>> "%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%%A_%modversion%.skudef"
		if exist "%mydocs%\%userdataleaf%\Mods\%modname%\%%AAudio\%%AAudio.big" echo add-big %%AAudio\%%AAudio.big>> "%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%%A_%modversion%.skudef"
		if exist "%mydocs%\%userdataleaf%\Mods\%modname%\Core\%modname%_%modversion%_Streams.big" echo add-big Core\%modname%_%modversion%_Streams.big>> "%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%%A_%modversion%.skudef"
		if exist "%mydocs%\%userdataleaf%\Mods\%modname%\Core\%modname%_%modversion%_Misc.big" echo add-big Core\%modname%_%modversion%_Misc.big>> "%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%%A_%modversion%.skudef"
		if exist "%mydocs%\%userdataleaf%\Mods\%modname%\Meta\%modname%_%modversion%_Maps.big" echo add-big Meta\%modname%_%modversion%_Maps.big>> "%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%%A_%modversion%.skudef"
	)
	
	cd /D "!sdk!"
	set sdk=
)

endlocal EnableDelayedExpansion

if not exist "%mydocs%\%userdataleaf%\Mods\%modname%\*.skudef" (
	if exist "%mydocs%\%userdataleaf%\Mods\%modname%\Core\%modname%_%modversion%_Streams.big" echo add-big Core\%modname%_%modversion%_Streams.big>> "%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_no-lang_%modversion%.skudef"
	if exist "%mydocs%\%userdataleaf%\Mods\%modname%\Core\%modname%_%modversion%_Misc.big" echo add-big Core\%modname%_%modversion%_Misc.big>> "%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_no-lang_%modversion%.skudef"
	if exist "%mydocs%\%userdataleaf%\Mods\%modname%\Meta\%modname%_%modversion%_Maps.big" echo add-big Meta\%modname%_%modversion%_Maps.big>> "%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_no-lang_%modversion%.skudef"
)

:eof