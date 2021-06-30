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

echo Compiling Mod...

if exist "%cd%\Mods\%modname%\Data\AdditionalMaps\MapMetaData_Global.xml" "%cd%\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Mods\%modname%\Data\AdditionalMaps\MapMetaData_Global.xml" -art:"..\..\Art" -audio:"..\..\Audio" -out:"%cd%\Compilation\Mods\%modname%\Data\AdditionalMaps" -version:""

if exist "%cd%\Mods\%modname%\Data\AdditionalMaps\MapMetaData_GlobalOverrides.xml" "%cd%\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Mods\%modname%\Data\AdditionalMaps\MapMetaData_GlobalOverrides.xml" -art:"..\..\Art" -audio:"..\..\Audio" -out:"%cd%\Compilation\Mods\%modname%\Data\AdditionalMaps" -version:""

if exist "%cd%\Mods\%modname%\Data\Global.xml" "%cd%\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Mods\%modname%\Data\Global.xml" -art:"..\Art" -audio:"..\Audio" -out:"%cd%\Compilation\Mods\%modname%\Data" -version:"common%streamversion%" -bps:"global_common_2.manifest,%cd%\Game Files\Manifest\global_common_2.manifest"

if exist "%cd%\Mods\%modname%\Data\Static.xml" (
	"%cd%\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Mods\%modname%\Data\Static.xml" -art:"..\Art" -audio:"..\Audio" -out:"%cd%\Compilation\Mods\%modname%\Data" -version:"_common%streamversion%" -bps:"static_common_2.manifest,%cd%\Game Files\Manifest\static_common_2.manifest"

	"%cd%\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Mods\%modname%\Data\Static.xml" -art:"..\Art_L" -audio:"..\Audio" -out:"%cd%\Compilation\Mods\%modname%\Data" -version:"_l_common%streamversion%" -bcn:LowLOD -bps:"static_l_common_2.manifest,%cd%\Game Files\Manifest\static_l_common_2.manifest"

	if exist "%cd%\Compilation\Mods\%modname%\Data\Static.version" del "%cd%\Compilation\Mods\%modname%\Data\Static.version"
	if exist "%cd%\Compilation\Mods\%modname%\Data\Static_l.version" del "%cd%\Compilation\Mods\%modname%\Data\Static_l.version"
	echo _common%streamversion%>> "%cd%\Compilation\Mods\%modname%\Data\Static.version"
	echo _common%streamversion%>> "%cd%\Compilation\Mods\%modname%\Data\Static_l.version"
)

if exist "%cd%\Mods\%modname%\Data\Worldbuilder.xml" "%cd%\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Mods\%modname%\Data\Worldbuilder.xml" -art:"..\Art" -audio:"..\Audio" -out:"%cd%\Compilation\Mods\%modname%\Data" -version:"%streamversion%" -bps:"worldbuilder_2.manifest,%cd%\Game Files\Manifest\worldbuilder_2.manifest"

if exist "%cd%\Mods\%modname%\Data\MetaGame.xml" "%cd%\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Mods\%modname%\Data\MetaGame.xml" -art:"..\Art" -audio:"..\Audio" -out:"%cd%\Compilation\Mods\%modname%\Data" -version:"%streamversion%" -bps:"metagame.manifest,%cd%\Game Files\Manifest\metagame.manifest"

if exist "%cd%\Mods\%modname%\Data\StringHashes1.xml" "%cd%\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Mods\%modname%\Data\StringHashes1.xml" -art:"..\Art" -audio:"..\Audio" -out:"%cd%\Compilation\Mods\%modname%\Data"
if exist "%cd%\Compilation\Mods\%modname%\Data\stringhashes.manifest" del "%cd%\Compilation\Mods\%modname%\Data\stringhashes.*"
if exist "%cd%\Compilation\Mods\%modname%\Data\stringhashes1.manifest" (
	copy "%cd%\Compilation\Mods\%modname%\Data\stringhashes1.*" "%cd%\Compilation\Mods\%modname%\Data\stringhashes.*"
	del "%cd%\Compilation\Mods\%modname%\Data\stringhashes1.*"
)

if exist "%cd%\Mods\%modname%\Data\AptUI\_Compiled" (
	echo Copying AptUI...
	if not exist "%cd%\Compilation\Mods\%modname%\Data\AptUI" md "%cd%\Compilation\Mods\%modname%\Data\AptUI"
	copy "%cd%\Mods\%modname%\Data\AptUI\_Compiled\*" "%cd%\Compilation\Mods\%modname%\Data\AptUI"
)


setlocal EnableDelayedExpansion

set sdk=!cd!
cd /D "!sdk!\Game Files\Manifest\AptUI"

for %%A in ("*.manifest") do (
	if exist "!sdk!\Mods\%modname%\Data\AptUI\%%~nA.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!sdk!\Mods\%modname%\Data\AptUI\%%~nA.xml" -art:"..\..\Art" -audio:"..\..\Audio" -out:"!sdk!\Compilation\Mods\%modname%\Data\AptUI" -bps:"aptui\%%~nA.manifest,!sdk!\Game Files\Manifest\AptUI\%%~nA.manifest" -version:"%streamversion%"
)

cd /D "!sdk!"
set sdk=

endlocal EnableDelayedExpansion

if exist "%mydocs%\%userdataleaf%\Mods\%modname%\*.skudef" del "%mydocs%\%userdataleaf%\Mods\%modname%\*.skudef" /F /Q

if exist "%cd%\Compilation\Mods\%modname%" "%cd%\Tools\MakeBig.exe" -f "%cd%\Compilation\Mods\%modname%" -o:"%mydocs%\%userdataleaf%\Mods\%modname%\Core\%modname%_%modversion%_Streams.big"
if exist "%cd%\Mods\%modname%\Misc" "%cd%\Tools\MakeBig.exe" -f "%cd%\Mods\%modname%\Misc" -o:"%mydocs%\%userdataleaf%\Mods\%modname%\Core\%modname%_%modversion%_Misc.big"

setlocal EnableDelayedExpansion

if exist "%cd%\Mods\%modname%\LanguagePacks" (
	set sdk=!cd!
	cd /D "!sdk!\Mods\%modname%\LanguagePacks"
	
	for /D %%A in ("*") do (
		echo Compiling %%A Language Pack...
		
		if exist "!sdk!\Compilation\Mods\%modname%\Data\AdditionalMaps\MapMetaData_Global.manifest" (
			set bps=-bps:"additionalmaps\mapmetadata_global.manifest,!sdk!\Compilation\Mods\%modname%\Data\AdditionalMaps\MapMetaData_Global.manifest"
		) else (
			set bps=
		)
		
		if exist "!cd!\%%A\Data\AdditionalMaps\MapMetaData_Global.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!cd!\%%A\Data\AdditionalMaps\MapMetaData_Global.xml" -art:"..\..\Art;..\..\..\..\Art" -audio:"..\..\Audio;..\..\..\..\Audio" -out:"!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\AdditionalMaps" -version:"_LanguagePack" !bps!
		
		if exist "!sdk!\Compilation\Mods\%modname%\Data\AdditionalMaps\MapMetaData_GlobalOverrides.manifest" (
			set bps=-bps:"additionalmaps\mapmetadata_globaloverrides.manifest,!sdk!\Compilation\Mods\%modname%\Data\AdditionalMaps\MapMetaData_GlobalOverrides.manifest"
		) else (
			set bps=
		)
		
		if exist "!cd!\%%A\Data\AdditionalMaps\MapMetaData_GlobalOverrides.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!cd!\%%A\Data\AdditionalMaps\MapMetaData_GlobalOverrides.xml" -art:"..\..\Art;..\..\..\..\Art" -audio:"..\..\Audio;..\..\..\..\Audio" -out:"!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\AdditionalMaps" -version:"_LanguagePack" !bps!
		
		if exist "!sdk!\Compilation\Mods\%modname%\Data\Global%streamversion%.manifest" (
			set bps=-bps:"global_%%A_2.manifest,!sdk!\Game Files\Manifest\global_%%A_2.manifest"
		) else (
			set bps=
		)
		
		if exist "!cd!\%%A\Data\Global.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!cd!\%%A\Data\Global.xml" -art:"..\Art;..\..\..\Art" -audio:"..\Audio;..\..\..\Audio" -data:"..\Data;..\..\..\Data" -out:"!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data" -version:"_%%A%streamversion%" !bps!

		if exist "!sdk!\Compilation\Mods\%modname%\Data\MapMetaData%streamversion%.manifest" (
			set bps=-bps:"mapmetadata%streamversion%.manifest,!sdk!\Compilation\Mods\%modname%\Data\MapMetaData%streamversion%.manifest"
		) else (
			set bps=-bps:"mapmetadata.manifest,!sdk!\Game Files\Manifest\MapMetaData.manifest"
		)
		
		if exist "!cd!\%%A\Data\MapMetaData.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!cd!\%%A\Data\MapMetaData.xml" -art:"..\Art;..\..\..\Art" -audio:"..\Audio;..\..\..\Audio" -out:"!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data" -version:"_LanguagePack" -lowlod:"mapmetadata_languagepack.manifest" !bps!

		if exist "!sdk!\Compilation\Mods\%modname%\Data\MetaGame%streamversion%.manifest" (
			set bps=-bps:"metagame%streamversion%.manifest,!sdk!\Compilation\Mods\%modname%\Data\MetaGame%streamversion%.manifest"
		) else (
			set bps=-bps:"metagame.manifest,!sdk!\Game Files\Manifest\MetaGame.manifest"
		)
		
		if exist "!cd!\%%A\Data\MetaGame.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!cd!\%%A\Data\MetaGame.xml" -art:"..\Art;..\..\..\Art" -audio:"..\Audio;..\..\..\Audio" -out:"!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data" -version:"_LanguagePack" -lowlod:"metagame_languagepack.manifest" !bps!

		set dir=!cd!
		cd /D "!sdk!\Game Files\Manifest\AptUI"
		
		for %%B in ("*.manifest") do (
			if exist "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\AptUI\%%~nB%streamversion%.manifest" (
				set bps=-bps:"aptui\%%~nB%streamversion%.manifest,!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\Aptui\%%~nB%streamversion%.manifest"
			) else (
				set bps=-bps:"aptui\%%~nB.manifest,!sdk!\Game Files\Manifest\AptUI\%%~nB.manifest"
			)
		
			if exist "!dir!\%%A\Data\AptUI\%%~nB.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!dir!\%%A\Data\AptUI\%%~nB.xml" -art:"..\..\Art;..\..\..\..\Art" -audio:"..\..\Audio;..\..\..\..\Audio" -out:"!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\AptUI" -version:"_LanguagePack" !bps!
			
		)
		
		cd /D "!dir!"
		set dir=
		
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