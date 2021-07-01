@echo off
cd /D "%~dp0"
set mapname=%~1
set /P version=<"%cd%\Tools\Version.txt"

echo.
echo WrathEd %version%
echo.

:mapname
if not defined mapname set /P mapname="Map Name: "
if not defined mapname goto mapname

for /F "tokens=2* delims=	 " %%A in ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Personal"') do call set mydocs=%%B
for /F "tokens=2* delims=	 " %%A in ('REG QUERY "HKLM\Software\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "UserDataLeafName" 2^>nul') do call set userdataleaf="%%B"
if not defined userdataleaf for /F "tokens=2* delims=	 " %%A in ('REG QUERY "HKLM\Software\Wow6432Node\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "UserDataLeafName" 2^>nul') do call set userdataleaf="%%B"

if not defined userdataleaf (
	set userdataleaf="Command and Conquer 3 Kanes Wrath"
)

for /F "delims=" %%A in (%userdataleaf%) do set userdataleaf=%%~A

echo.
echo %mapname%

if not exist "%mydocs%\%userdataleaf%\Maps\%mapname%" (
	echo Error: The map doesn't exist
	echo.
	pause
	goto eof
)

if exist "%cd%\Compilation\Maps\%mapname%" rd "%cd%\Compilation\Maps\%mapname%" /S /Q

echo Compiling Map...
if exist "%mydocs%\%userdataleaf%\Maps\%mapname%\map.xml" "%cd%\Tools\mapmetadatagenerator.exe" "%mydocs%\%userdataleaf%\Maps\%mapname%\map.xml"
if exist "%mydocs%\%userdataleaf%\Maps\%mapname%\mapmetadata_%mapname%.xml" "%cd%\Tools\wrathed.exe" -gameDefinition:"Kane's Wrath" -compile:"%mydocs%\%userdataleaf%\Maps\%mapname%\mapmetadata_%mapname%.xml" -art:"Art" -audio:"Audio" -out:"%cd%\Compilation\Maps\%mapname%\Data\AdditionalMaps" -version:""
if exist "%mydocs%\%userdataleaf%\Maps\%mapname%\mapmetadata_%mapname%.xml" del "%mydocs%\%userdataleaf%\Maps\%mapname%\mapmetadata_%mapname%.xml" /F /Q

if exist "%cd%\Compilation\Maps\%mapname%\Data\AdditionalMaps\MapMetaData_%mapname%.manifest" if exist "%mydocs%\%userdataleaf%\Maps\%mapname%\Assets\AdditionalMaps\MapMetaData_%mapname%" (
	"%cd%\Tools\AssetMerger.exe" "%cd%\Compilation\Maps\%mapname%\Data\AdditionalMaps\MapMetaData_%mapname%.manifest" "%mydocs%\%userdataleaf%\Maps\%mapname%\Assets\AdditionalMaps\MapMetaData_%mapname%"
	"%cd%\Tools\StreamSorter.exe" "%cd%\Compilation\Maps\%mapname%\Data\AdditionalMaps\MapMetaData_%mapname%.manifest"
)

if exist "%mydocs%\%userdataleaf%\Maps\%mapname%\map.xml" "%cd%\Tools\wrathed.exe" -gameDefinition:"Kane's Wrath" -compile:"%mydocs%\%userdataleaf%\Maps\%mapname%\map.xml" -map -terrain:"Game Files\Art\Terrain" -art:"Art" -audio:"Audio" -data:"Data" -out:"%cd%\Compilation\Maps\%mapname%\Data\%mapname%" -version:""

if exist "%cd%\Compilation\Maps\%mapname%\Data\%mapname%\Map.manifest" if exist "%mydocs%\%userdataleaf%\Maps\%mapname%\Assets\Map" (
	"%cd%\Tools\AssetMerger.exe" "%cd%\Compilation\Maps\%mapname%\Data\%mapname%\Map.manifest" "%mydocs%\%userdataleaf%\Maps\%mapname%\Assets\Map"
	"%cd%\Tools\StreamSorter.exe" "%cd%\Compilation\Maps\%mapname%\Data\%mapname%\Map.manifest"
)

if exist "%cd%\Compilation\Maps\%mapname%" "%cd%\Tools\MakeBig.exe" -f "%cd%\Compilation\Maps\%mapname%" -o:"%mydocs%\%userdataleaf%\Maps\%mapname%\Map_Streams.big"
if exist "%mydocs%\%userdataleaf%\Maps\%mapname%\Misc" "%cd%\Tools\MakeBig.exe" -f "%mydocs%\%userdataleaf%\Maps\%mapname%\Misc" -o:"%mydocs%\%userdataleaf%\Maps\%mapname%\Map_Misc.big"
if exist "%mydocs%\%userdataleaf%\Maps\%mapname%\Map.skudef" del "%mydocs%\%userdataleaf%\Maps\%mapname%\Map.skudef" /F /Q
if exist "%mydocs%\%userdataleaf%\Maps\%mapname%\Map_Streams.big" echo add-big Map_Streams.big>> "%mydocs%\%userdataleaf%\Maps\%mapname%\Map.skudef"
if exist "%mydocs%\%userdataleaf%\Maps\%mapname%\Map_Misc.big" echo add-big Map_Misc.big>> "%mydocs%\%userdataleaf%\Maps\%mapname%\Map.skudef"

:eof
