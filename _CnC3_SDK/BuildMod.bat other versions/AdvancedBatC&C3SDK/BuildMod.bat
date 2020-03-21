@echo off

set /P var="Please enter the mod name: "

if "%var%" == "" goto NoModError

set version=1.0
set gamever=1.9

if not "%1" == "" set version=%1
if not "%2" == "" set gamever=%2

echo.
echo.
echo Mod Name: %var% version %version%, for game version %gamever%

set mydocs=CopyToYourMyDocumentsFolder

set artpaths=".\Mods\%var%\art;.\Art"
set audiopaths=".\Mods\%var%\audio;.\Audio"
set datapaths=".\Mods\%var%\data;.;.\Mods;.\Cnc3Xml"

echo.
echo *** Building Mod Data... ***
echo.
tools\binaryAssetBuilder.exe "%cd%\Mods\%var%\data\mod.xml" /od:"%cd%\BuiltMods" /iod:"%cd%\BuiltMods" /DefaultDataPaths:%datapaths% /DefaultArtPaths:%artpaths% /DefaultAudioPaths:%audiopaths% /ls:true /gui:false /UsePrecompiled:true /vf:true
if not errorlevel 0 goto CriticalErrorBuildingMod

echo.
echo *** Building Low LOD... ***
echo.
tools\binaryAssetBuilder.exe "%cd%\Mods\%var%\data\mod.xml" /od:"%cd%\BuiltMods" /iod:"%cd%\BuiltMods" /DefaultDataPaths:%datapaths% /DefaultArtPaths:%artpaths% /DefaultAudioPaths:%audiopaths% /ls:true /gui:false /UsePrecompiled:true /vf:true /bcn:LowLOD /bps:"%cd%\BuiltMods\mods\%var%\data\mod.manifest"
if not errorlevel 0 goto CriticalErrorBuildingModL
del "%cd%\BuiltMods\mods\%var%\data\mod_l.version"

echo.
echo *** Copying ini files... ***
echo.
if exist "%cd%\BuiltMods\mods\%var%\data\ini" rd /s /q "%cd%\BuiltMods\mods\%var%\data\ini"
if exist "%cd%\Mods\%var%\data\ini" xcopy /s /i "%cd%\Mods\%var%\data\ini\*.ini" "%cd%\BuiltMods\mods\%var%\data\ini"

echo.
echo *** Copying scripts... ***
echo.
if exist "%cd%\BuiltMods\mods\%var%\data\scripts" rd /s /q "%cd%\BuiltMods\mods\%var%\data\scripts"
if exist "%cd%\Mods\%var%\data\scripts" xcopy /s /i "%cd%\Mods\%var%\data\scripts" "%cd%\BuiltMods\mods\%var%\data\scripts"

echo.
echo *** Copying str file if it exists... ***
echo.
if exist "%cd%\BuiltMods\mods\%var%\data\mod.str" del /q "%cd%\BuiltMods\mods\%var%\data\mod.str"
if exist "%cd%\Mods\%var%\data\mod.str" copy "%cd%\Mods\%var%\data\mod.str" "%cd%\BuiltMods\mods\%var%\data"

echo.
echo *** Copying Shaders... ***
echo.
if not exist "%cd%\BuiltMods\mods\%var%\Shaders" md "%cd%\BuiltMods\mods\%var%\Shaders"
copy "%cd%\Shaders\*.fx" "%cd%\BuiltMods\mods\%var%\Shaders"

echo.
echo *** Fixing Manifest... ***
echo.
tools\FixManifest.exe "%cd%\BuiltMods\mods\%var%\data\mod.manifest" "%cd%\BuiltMods\mods\%var%\data\mod_L.manifest"

echo.
echo *** Resolving Civ Assets ***
echo.
tools\AssetResolver.exe -m "%cd%\BuiltMods\mods\%var%\data\mod.manifest" -s mod

echo.
echo *** Creating Mod Big File... ***
echo.
tools\MakeBig.exe -f "%cd%\BuiltMods\mods\%var%" -x:*.asset -o:"%cd%\BuiltMods\mods\%var%_%version%.big"
if not errorlevel 0 goto CriticalErrorMakingBig

echo.
echo *** Copying built mod... ***
echo.
if not exist "%mydocs%\Command & Conquer 3 Tiberium Wars\mods" md "%mydocs%\Command & Conquer 3 Tiberium Wars\mods
if not exist "%mydocs%\Command & Conquer 3 Tiberium Wars\mods\%var%" md "%mydocs%\Command & Conquer 3 Tiberium Wars\mods\%var%
copy "builtmods\mods\%var%_%version%.big" "%mydocs%\Command & Conquer 3 Tiberium Wars\mods\%var%"


echo.
echo *** Creating SkuDef file... ***
echo.
echo mod-game %gamever% > "builtmods\mods\%var%_%version%.SkuDef"
echo add-big %var%_%version%.big >> "builtmods\mods\%var%_%version%.SkuDef"
copy "builtmods\mods\%var%_%version%.SkuDef" "%mydocs%\Command & Conquer 3 Tiberium Wars\mods\%var%"

echo.
echo *** Build process completed successfully. ***
goto End

:NoModError
echo *** ERROR: No mod name specified. ***
goto end

:CriticalErrorBuildingMod
echo.
echo *** ERROR: Compilation of 'mod.xml' failed, aborting build process. ***
goto End

:CriticalErrorBuildingModL
echo.
echo *** ERROR: Compilation of 'mod_l.xml' failed, aborting build process. ***
goto End

:CriticalErrorMakingBig
echo.
echo *** ERROR: Creation of BIG file failed, aborting build process. ***
goto End

:End

echo.
pause