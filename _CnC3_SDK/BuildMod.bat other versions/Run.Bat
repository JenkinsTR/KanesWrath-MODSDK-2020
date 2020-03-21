@echo off
set /P modname= 

set artpaths=".\Mods\%modname%\art;.\Art"
set audiopaths=".\Mods\%modname%\audio;.\Audio"
set datapaths=".\Mods\%modname%\data;.;.\Mods;.\Cnc3Xml"

echo.
echo *** Building Mod Data... ***
echo.
tools\binaryAssetBuilder.exe "%cd%\Mods\%modname%\data\mod.xml" /od:"%cd%\BuiltMods" /iod:"%cd%\BuiltMods" /DefaultDataPaths:%datapaths% /DefaultArtPaths:%artpaths% /DefaultAudioPaths:%audiopaths% /ls:true /gui:false /UsePrecompiled:true /vf:true
if not errorlevel 0 goto CriticalErrorBuildingMod

echo.
echo *** Building Low LOD... ***
echo.
tools\binaryAssetBuilder.exe "%cd%\Mods\%modname%\data\mod.xml" /od:"%cd%\BuiltMods" /iod:"%cd%\BuiltMods" /DefaultDataPaths:%datapaths% /DefaultArtPaths:%artpaths% /DefaultAudioPaths:%audiopaths% /ls:true /gui:false /UsePrecompiled:true /vf:true /bcn:LowLOD /bps:"%cd%\BuiltMods\mods\%modname%\data\mod.manifest"
if not errorlevel 0 goto CriticalErrorBuildingModL
del "%cd%\BuiltMods\mods\%modname%\data\mod_l.version"

echo.
echo *** Copying ini files... ***
echo.
if exist "%cd%\BuiltMods\mods\%modname%\data\ini" rd /s /q "%cd%\BuiltMods\mods\%modname%\data\ini"
if exist "%cd%\Mods\%modname%\data\ini" xcopy /s /i "%cd%\Mods\%modname%\data\ini\*.ini" "%cd%\BuiltMods\mods\%modname%\data\ini"

echo.
echo *** Copying scripts... ***
echo.
if exist "%cd%\BuiltMods\mods\%modname%\data\scripts" rd /s /q "%cd%\BuiltMods\mods\%modname%\data\scripts"
if exist "%cd%\Mods\%modname%\data\scripts" xcopy /s /i "%cd%\Mods\%modname%\data\scripts" "%cd%\BuiltMods\mods\%modname%\data\scripts"

echo.
echo *** Copying str file if it exists... ***
echo.
if exist "%cd%\BuiltMods\mods\%modname%\data\mod.str" del /q "%cd%\BuiltMods\mods\%modname%\data\mod.str"
if exist "%cd%\Mods\%modname%\data\mod.str" copy "%cd%\Mods\%modname%\data\mod.str" "%cd%\BuiltMods\mods\%modname%\data"

echo.
echo *** Copying Shaders... ***
echo.
if not exist "%cd%\BuiltMods\mods\%modname%\Shaders" md "%cd%\BuiltMods\mods\%modname%\Shaders"
copy "%cd%\Shaders\*.fx" "%cd%\BuiltMods\mods\%modname%\Shaders"

echo.
echo *** Creating Mod Big File... ***
echo.
tools\MakeBig.exe -f "%cd%\BuiltMods\mods\%modname%" -x:*.asset -o:"%cd%\BuiltMods\mods\%modname%_%version%.big"
if not errorlevel 0 goto CriticalErrorMakingBig

echo.
echo *** Copying built mod... ***
echo.
if not exist "%mydocs%\Command & Conquer 3 Tiberium Wars\mods" md "%mydocs%\Command & Conquer 3 Tiberium Wars\mods
if not exist "%mydocs%\Command & Conquer 3 Tiberium Wars\mods\%modname%" md "%mydocs%\Command & Conquer 3 Tiberium Wars\mods\%modname%
copy "builtmods\mods\%modname%_%version%.big" "%mydocs%\Command & Conquer 3 Tiberium Wars\mods\%modname%"


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
