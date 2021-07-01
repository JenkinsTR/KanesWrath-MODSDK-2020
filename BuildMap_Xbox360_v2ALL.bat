@echo off

cd /D "%~dp0"

:: Set mapname from input
:: set mapname=%~1

::SET WrathEd version from file
set /P version=<"%cd%\Tools\Version.txt"

::SET macros
set "wrathed=%cd%\Tools\WrathEd.exe"
set "WEAM=%cd%\Tools\AssetMerger.exe"
set "WESS=%cd%\Tools\StreamSorter.exe"
set "WEBIG=%cd%\Tools\MakeBig.exe"
set "WEMMG=%cd%\Tools\mapmetadatagenerator.exe"

::Print WrathEd version to console
echo.
echo WrathEd %version%
echo.

:: :mapname
:: if not defined mapname set /P mapname="Map Name: "
:: if not defined mapname goto mapname

:: Pull directories from registry
REM for /F "tokens=2* delims=	 " %%A in ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Personal"') do call set mydocs=%%B
REM for /F "tokens=2* delims=	 " %%A in ('REG QUERY "HKLM\Software\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "UserDataLeafName" 2^>nul') do call set userdataleaf="%%B"
REM if not defined userdataleaf for /F "tokens=2* delims=	 " %%A in ('REG QUERY "HKLM\Software\Wow6432Node\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "UserDataLeafName" 2^>nul') do call set userdataleaf="%%B"

REM IF NOT DEFINED userdataleaf (
	::This seems to vary based on which install
	::TODO fix this hack
	::SET userdataleaf="Command and Conquer 3 Kanes Wrath"
	REM SET userdataleaf="Command ^& Conquer 3 Kane's Wrath"
REM )

REM for /F "delims=" %%A in ("%userdataleaf%") do set userdataleaf=%%~A

:: Hack for now to get around userdataleaf issues
SET "mydocs=P:\OneDrive\Documents"
SET "userdataleaf=Command & Conquer 3 Kane's Wrath"
SET "SDK=%cd%"

PUSHD "%mydocs%\%userdataleaf%\Maps"

SETLOCAL EnableDelayedExpansion

FOR /R %%G IN (*.map) DO (
	SET "mapname=%%~nG"

	:: Begin compile
	echo !mapname!

	:: Check for map data
	REM if not exist "%mydocs%\%userdataleaf%\Maps\%mapname%" (
		REM echo Error: The map doesn't exist
		REM echo.
		REM pause
		REM goto eof
	REM )
	
	PUSHD "%SDK%"
	
	:: Clean pre-compiled directories 
	if exist "%SDK%\Compilation\Xbox360\Maps\data\maps\official\!mapname!" rd "%SDK%\Compilation\Xbox360\Maps\data\maps\official\!mapname!" /S /Q
	
	echo Compiling Map...
	REM if exist "%mydocs%\%userdataleaf%\Maps\!mapname!\map.xml" "%WEMMG%" "%mydocs%\%userdataleaf%\Maps\!mapname!\map.xml"
	REM if exist "%mydocs%\%userdataleaf%\Maps\!mapname!\mapmetadata_!mapname!.xml" "%wrathed%" -gameDefinition:"Kane's Wrath" -compile:"%mydocs%\%userdataleaf%\Maps\!mapname!\mapmetadata_!mapname!.xml" -art:"Art" -audio:"Audio" -out:"%SDK%\Compilation\Xbox360\Maps\data\maps\official\!mapname!\Data\AdditionalMaps" -version:""
	REM if exist "%mydocs%\%userdataleaf%\Maps\!mapname!\mapmetadata_!mapname!.xml" del "%mydocs%\%userdataleaf%\Maps\!mapname!\mapmetadata_!mapname!.xml" /F /Q
	
	REM if exist "%SDK%\Compilation\Xbox360\Maps\data\maps\official\!mapname!\Data\AdditionalMaps\MapMetaData_!mapname!.manifest" if exist "%mydocs%\%userdataleaf%\Maps\!mapname!\Assets\AdditionalMaps\MapMetaData_!mapname!" (
		REM "%WEAM%" "%SDK%\Compilation\Xbox360\Maps\data\maps\official\!mapname!\Data\AdditionalMaps\MapMetaData_!mapname!.manifest" "%mydocs%\%userdataleaf%\Maps\!mapname!\Assets\AdditionalMaps\MapMetaData_!mapname!"
		REM "%WESS%" "%SDK%\Compilation\Xbox360\Maps\data\maps\official\!mapname!\Data\AdditionalMaps\MapMetaData_!mapname!.manifest"
	REM )
	
	if exist "%mydocs%\%userdataleaf%\Maps\!mapname!\map.xml" "%wrathed%" -gameDefinition:"Kane's Wrath" -compile:"%mydocs%\%userdataleaf%\Maps\!mapname!\map.xml" -map -terrain:"Game Files\Art\Terrain" -art:"Art" -audio:"Audio" -data:"Data" -out:"%SDK%\Compilation\Xbox360\Maps\data\maps\official\!mapname!" -version:""
	if exist "%mydocs%\%userdataleaf%\Maps\!mapname!\!mapname!.tga" COPY "%mydocs%\%userdataleaf%\Maps\!mapname!\!mapname!.tga" "%SDK%\Compilation\Xbox360\Maps\data\maps\official\!mapname!\!mapname!.tga"
	if exist "%mydocs%\%userdataleaf%\Maps\!mapname!\!mapname!_art.tga" COPY "%mydocs%\%userdataleaf%\Maps\!mapname!\!mapname!_art.tga" "%SDK%\Compilation\Xbox360\Maps\data\maps\official\!mapname!\!mapname!_art.tga"
	if exist "%mydocs%\%userdataleaf%\Maps\!mapname!\!mapname!.map" COPY "%mydocs%\%userdataleaf%\Maps\!mapname!\!mapname!.map" "%SDK%\Compilation\Xbox360\Maps\data\maps\official\!mapname!\!mapname!.map"
	
	REM if exist "%SDK%\Compilation\Xbox360\Maps\data\maps\official\!mapname!\Data\!mapname!\Map.manifest" if exist "%mydocs%\%userdataleaf%\Maps\!mapname!\Assets\Map" (
		REM "%WEAM%" "%SDK%\Compilation\Xbox360\Maps\data\maps\official\!mapname!\Data\!mapname!\Map.manifest" "%mydocs%\%userdataleaf%\Maps\!mapname!\Assets\Map"
		REM "%WESS%" "%SDK%\Compilation\Xbox360\Maps\data\maps\official\!mapname!\Data\!mapname!\Map.manifest"
	REM )
	
	:: We don't need to put the generated BIGs inside Mydocs as we're building for Xbox
	REM set XBBIGOUT=%SDK%\Xbox360\BuiltMaps\!mapname!
	
	REM if exist "%SDK%\Compilation\Xbox360\Maps\data\maps\official\!mapname!" "%WEBIG%" -f "%SDK%\Compilation\Xbox360\Maps\data\maps\official\!mapname!" -o:"!XBBIGOUT!\Map_Streams.big"
	REM if exist "%mydocs%\%userdataleaf%\Maps\!mapname!\Misc" "%WEBIG%" -f "%mydocs%\%userdataleaf%\Maps\!mapname!\Misc" -o:"!XBBIGOUT!\Map_Misc.big"
	
	:: We need to use filesystem.cfg instead of .skudef for Xbox
	REM if exist "%mydocs%\%userdataleaf%\Maps\!mapname!\filesystem_map.cfg" del "!XBBIGOUT!\filesystem_map.cfg" /F /Q
	REM if exist "!XBBIGOUT!\Map_Streams.big" echo add-big Map_Streams.big>> "!XBBIGOUT!\filesystem_map.cfg"
	REM if exist "!XBBIGOUT!\Map_Misc.big" echo add-big Map_Misc.big>> "!XBBIGOUT!\filesystem_map.cfg"
	
	:: We also need to pool the new filesystem_map files into one cfg
	:: Welp, this won't work because of being a separate script. Looks like we'll have to combine them.
	REM if exist "!XBBIGOUT!\filesystem_map.cfg" echo try-add-config Mods\MODNAME\Maps\%mapname%\filesystem_map.cfg>> "%SDK%\Xbox360\BuiltMods\MODNAME\filesystem_maps.cfg"
)

ENDLOCAL EnableDelayedExpansion

:: DLC Package test
set XBBIGOUT=%SDK%\Xbox360\BuiltMaps

"%WEBIG%" -f "%SDK%\Compilation\Xbox360\Maps" -o:"%XBBIGOUT%\package.big"


PAUSE
EXIT /B

:eof
