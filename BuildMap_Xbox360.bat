@echo off
cd /D "%~dp0"

:: Set mapname from input
set mapname=%~1

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

:mapname
if not defined mapname set /P mapname="Map Name: "
if not defined mapname goto mapname

:: Pull directories from registry
for /F "tokens=2* delims=	 " %%A in ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Personal"') do call set mydocs=%%B
for /F "tokens=2* delims=	 " %%A in ('REG QUERY "HKLM\Software\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "UserDataLeafName" 2^>nul') do call set userdataleaf="%%B"
if not defined userdataleaf for /F "tokens=2* delims=	 " %%A in ('REG QUERY "HKLM\Software\Wow6432Node\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "UserDataLeafName" 2^>nul') do call set userdataleaf="%%B"

if not defined userdataleaf (
	set userdataleaf="Command and Conquer 3 Kanes Wrath"
)

for /F "delims=" %%A in ("%userdataleaf%") do set userdataleaf=%%~A

:: Begin compile
echo.
echo %mapname%

:: Check for map data
if not exist "%mydocs%\%userdataleaf%\Maps\%mapname%" (
	echo Error: The map doesn't exist
	echo.
	pause
	goto eof
)

:: Clean pre-compiled directories 
if exist "%cd%\Compilation\Xbox360\Maps\%mapname%" rd "%cd%\Compilation\Xbox360\Maps\%mapname%" /S /Q

echo Compiling Map...
if exist "%mydocs%\%userdataleaf%\Maps\%mapname%\map.xml" "%WEMMG%" "%mydocs%\%userdataleaf%\Maps\%mapname%\map.xml"
if exist "%mydocs%\%userdataleaf%\Maps\%mapname%\mapmetadata_%mapname%.xml" "%wrathed%" -gameDefinition:"Kane's Wrath" -compile:"%mydocs%\%userdataleaf%\Maps\%mapname%\mapmetadata_%mapname%.xml" -art:"Art" -audio:"Audio" -out:"%cd%\Compilation\Xbox360\Maps\%mapname%\Data\AdditionalMaps" -version:""
if exist "%mydocs%\%userdataleaf%\Maps\%mapname%\mapmetadata_%mapname%.xml" del "%mydocs%\%userdataleaf%\Maps\%mapname%\mapmetadata_%mapname%.xml" /F /Q

if exist "%cd%\Compilation\Xbox360\Maps\%mapname%\Data\AdditionalMaps\MapMetaData_%mapname%.manifest" if exist "%mydocs%\%userdataleaf%\Maps\%mapname%\Assets\AdditionalMaps\MapMetaData_%mapname%" (
	"%WEAM%" "%cd%\Compilation\Xbox360\Maps\%mapname%\Data\AdditionalMaps\MapMetaData_%mapname%.manifest" "%mydocs%\%userdataleaf%\Maps\%mapname%\Assets\AdditionalMaps\MapMetaData_%mapname%"
	"%WESS%" "%cd%\Compilation\Xbox360\Maps\%mapname%\Data\AdditionalMaps\MapMetaData_%mapname%.manifest"
)

if exist "%mydocs%\%userdataleaf%\Maps\%mapname%\map.xml" "%wrathed%" -gameDefinition:"Kane's Wrath" -compile:"%mydocs%\%userdataleaf%\Maps\%mapname%\map.xml" -map -terrain:"Game Files\Art\Terrain" -art:"Art" -audio:"Audio" -data:"Data" -out:"%cd%\Compilation\Xbox360\Maps\%mapname%\Data\%mapname%" -version:""

if exist "%cd%\Compilation\Xbox360\Maps\%mapname%\Data\%mapname%\Map.manifest" if exist "%mydocs%\%userdataleaf%\Maps\%mapname%\Assets\Map" (
	"%WEAM%" "%cd%\Compilation\Xbox360\Maps\%mapname%\Data\%mapname%\Map.manifest" "%mydocs%\%userdataleaf%\Maps\%mapname%\Assets\Map"
	"%WESS%" "%cd%\Compilation\Xbox360\Maps\%mapname%\Data\%mapname%\Map.manifest"
)

:: We don't need to put the generated BIGs inside Mydocs as we're building for Xbox
set XBBIGOUT=%cd%\Xbox360\BuiltMaps\%mapname%

if exist "%cd%\Compilation\Xbox360\Maps\%mapname%" "%WEBIG%" -f "%cd%\Compilation\Xbox360\Maps\%mapname%" -o:"%XBBIGOUT%\Map_Streams.big"
if exist "%mydocs%\%userdataleaf%\Maps\%mapname%\Misc" "%WEBIG%" -f "%mydocs%\%userdataleaf%\Maps\%mapname%\Misc" -o:"%XBBIGOUT%\Map_Misc.big"

:: We need to use filesystem.cfg instead of .skudef for Xbox
if exist "%mydocs%\%userdataleaf%\Maps\%mapname%\filesystem_map.cfg" del "%XBBIGOUT%\filesystem_map.cfg" /F /Q
if exist "%XBBIGOUT%\Map_Streams.big" echo add-big Map_Streams.big>> "%XBBIGOUT%\filesystem_map.cfg"
if exist "%XBBIGOUT%\Map_Misc.big" echo add-big Map_Misc.big>> "%XBBIGOUT%\filesystem_map.cfg"

:: We also need to pool the new filesystem_map files into one cfg
:: Welp, this won't work because of being a separate script. Looks like we'll have to combine them.
REM if exist "%XBBIGOUT%\filesystem_map.cfg" echo try-add-config Mods\MODNAME\Maps\%mapname%\filesystem_map.cfg>> "%cd%\Xbox360\BuiltMods\MODNAME\filesystem_maps.cfg"

:eof
