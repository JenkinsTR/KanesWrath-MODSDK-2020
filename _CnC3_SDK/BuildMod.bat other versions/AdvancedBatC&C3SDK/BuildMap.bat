@echo off

set /P var="Please enter the map name: "

if "%var%" == "" goto NoMapError

set version=1.0
set gamever=1.9

if not "%1" == "" set version=%1
if not "%2" == "" set gamever=%2

echo Map Name: %var% version %version%, for game version %gamever%

IF NOT EXIST "%cd%\Mods\maps" md "%cd%\Mods\maps"
IF NOT EXIST "%cd%\Mods\maps\%var%" md "%cd%\Mods\maps\%var%"
copy "%APPDATA%\Command & Conquer 3 Tiberium Wars\maps\%var%\*.*" "%cd%\Mods\maps\%var%"

echo.
echo *** Building Map Data... ***
echo.
tools\binaryAssetBuilder.exe "%cd%\Mods\maps\%var%\map.xml" /od:"%cd%\BuiltMods" /iod:"%cd%\BuiltMods" /ls:false /gui:false /UsePrecompiled:true /LinkedStreams:true
if not errorlevel 0 goto CriticalErrorBuildingMap

echo.
echo *** Fixing Map Civ Asset Data... ***
echo.
tools\AssetResolver.exe -m "%cd%\BuiltMods\mods\maps\%var%\map.manifest" -s map

echo.
echo *** Copying built map... ***
echo.
copy "%cd%\BuiltMods\mods\maps\%var%\map.manifest" "%APPDATA%\Command & Conquer 3 Tiberium Wars\maps\%var%"
copy "%cd%\BuiltMods\mods\maps\%var%\map.bin" "%APPDATA%\Command & Conquer 3 Tiberium Wars\maps\%var%"
copy "%cd%\BuiltMods\mods\maps\%var%\map.relo" "%APPDATA%\Command & Conquer 3 Tiberium Wars\maps\%var%"
copy "%cd%\BuiltMods\mods\maps\%var%\map.imp" "%APPDATA%\Command & Conquer 3 Tiberium Wars\maps\%var%"

echo.
echo *** Build process completed successfully. ***
goto End

:NoMapError
echo *** ERROR: No map name specified. ***
goto End

:CriticalErrorBuildingMap
echo.
echo *** ERROR: Compilation of 'map.xml' failed, aborting build process. ***
goto End

:End

echo.
pause
