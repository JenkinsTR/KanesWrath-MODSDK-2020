@echo off
cd /D "%~dp0"
set modname=%~1
set modversion=%~2
set /P version=<"%cd%\Tools\Version.txt"

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

if exist "%cd%\Compilation\Mods\%modname%\Data\AdditionalMaps\MapMetaData_Global.manifest" if exist "%cd%\Mods\%modname%\Assets\AdditionalMaps\MapMetaData_Global" (
	"%cd%\Tools\AssetMerger.exe" "%cd%\Compilation\Mods\%modname%\Data\AdditionalMaps\MapMetaData_Global.manifest" "%cd%\Mods\%modname%\Assets\AdditionalMaps\MapMetaData_Global"
	"%cd%\Tools\StreamSorter.exe" "%cd%\Compilation\Mods\%modname%\Data\AdditionalMaps\MapMetaData_Global.manifest"
)

if exist "%cd%\Mods\%modname%\Data\AdditionalMaps\MapMetaData_GlobalOverrides.xml" "%cd%\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Mods\%modname%\Data\AdditionalMaps\MapMetaData_GlobalOverrides.xml" -art:"..\..\Art" -audio:"..\..\Audio" -out:"%cd%\Compilation\Mods\%modname%\Data\AdditionalMaps" -version:""

if exist "%cd%\Compilation\Mods\%modname%\Data\AdditionalMaps\MapMetaData_GlobalOverrides.manifest" if exist "%cd%\Mods\%modname%\Assets\AdditionalMaps\MapMetaData_GlobalOverrides" (
	"%cd%\Tools\AssetMerger.exe" "%cd%\Compilation\Mods\%modname%\Data\AdditionalMaps\MapMetaData_GlobalOverrides.manifest" "%cd%\Mods\%modname%\Assets\AdditionalMaps\MapMetaData_GlobalOverrides"
	"%cd%\Tools\StreamSorter.exe" "%cd%\Compilation\Mods\%modname%\Data\AdditionalMaps\MapMetaData_GlobalOverrides.manifest"
)

if exist "%cd%\Mods\%modname%\Data\Static.xml" "%cd%\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Mods\%modname%\Data\Static.xml" -art:"..\Art" -audio:"..\Audio" -out:"%cd%\Compilation\Mods\%modname%\Data" -version:"%streamversion%" -bps:"static_common_2.manifest,%cd%\Game Files\Manifest\static_common_2.manifest" -lowlod:"static%streamversion%.manifest"

if exist "%cd%\Compilation\Mods\%modname%\Data\Static%streamversion%.manifest" if exist "%cd%\Mods\%modname%\Assets\Static" (
	"%cd%\Tools\AssetMerger.exe" "%cd%\Compilation\Mods\%modname%\Data\Static%streamversion%.manifest" "%cd%\Mods\%modname%\Assets\Static"
	"%cd%\Tools\StreamSorter.exe" "%cd%\Compilation\Mods\%modname%\Data\Static%streamversion%.manifest"
)

if exist "%cd%\Mods\%modname%\Data\Worldbuilder.xml" "%cd%\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Mods\%modname%\Data\Worldbuilder.xml" -art:"..\Art" -audio:"..\Audio" -out:"%cd%\Compilation\Mods\%modname%\Data" -version:"%streamversion%" -bps:"worldbuilder_2.manifest,%cd%\Game Files\Manifest\worldbuilder_2.manifest"

if exist "%cd%\Compilation\Mods\%modname%\Data\Worldbuilder%streamversion%.manifest" if exist "%cd%\Mods\%modname%\Assets\Worldbuilder" (
	"%cd%\Tools\AssetMerger.exe" "%cd%\Compilation\Mods\%modname%\Data\Worldbuilder%streamversion%.manifest" "%cd%\Mods\%modname%\Assets\Worldbuilder"
	"%cd%\Tools\StreamSorter.exe" "%cd%\Compilation\Mods\%modname%\Data\Worldbuilder%streamversion%.manifest"
)

if exist "%cd%\Mods\%modname%\Data\MapMetaData.xml" "%cd%\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Mods\%modname%\Data\MapMetaData.xml" -art:"..\Art" -audio:"..\Audio" -out:"%cd%\Compilation\Mods\%modname%\Data" -version:"%streamversion%" -bps:"mapmetadata.manifest,%cd%\Game Files\Manifest\mapmetadata.manifest"

if exist "%cd%\Compilation\Mods\%modname%\Data\MapMetaData%streamversion%.manifest" if exist "%cd%\Mods\%modname%\Assets\MapMetaData" (
	"%cd%\Tools\AssetMerger.exe" "%cd%\Compilation\Mods\%modname%\Data\MapMetaData%streamversion%.manifest" "%cd%\Mods\%modname%\Assets\MapMetaData"
	"%cd%\Tools\StreamSorter.exe" "%cd%\Compilation\Mods\%modname%\Data\MapMetaData%streamversion%.manifest"
)

if exist "%cd%\Mods\%modname%\Data\MetaGame.xml" "%cd%\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Mods\%modname%\Data\MetaGame.xml" -art:"..\Art" -audio:"..\Audio" -out:"%cd%\Compilation\Mods\%modname%\Data" -version:"%streamversion%" -bps:"metagame.manifest,%cd%\Game Files\Manifest\metagame.manifest"

if exist "%cd%\Compilation\Mods\%modname%\Data\MetaGame%streamversion%.manifest" if exist "%cd%\Mods\%modname%\Assets\MetaGame" (
	"%cd%\Tools\AssetMerger.exe" "%cd%\Compilation\Mods\%modname%\Data\MetaGame%streamversion%.manifest" "%cd%\Mods\%modname%\Assets\MetaGame"
	"%cd%\Tools\StreamSorter.exe" "%cd%\Compilation\Mods\%modname%\Data\MetaGame%streamversion%.manifest"
)

setlocal EnableDelayedExpansion

set sdk=!cd!
cd /D "!sdk!\Game Files\Manifest\AptUI"

for %%A in ("*.manifest") do (
	if exist "!sdk!\Mods\%modname%\Data\AptUI\%%~nA.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!sdk!\Mods\%modname%\Data\AptUI\%%~nA.xml" -art:"..\..\Art" -audio:"..\..\Audio" -out:"!sdk!\Compilation\Mods\%modname%\Data\AptUI" -bps:"aptui\%%~nA.manifest,!sdk!\Game Files\Manifest\AptUI\%%~nA.manifest" -version:"%streamversion%"
	
	if exist "!sdk!\Compilation\Mods\%modname%\Data\AptUI\%%~nA%streamversion%.manifest" if exist "!sdk!\Mods\%modname%\Assets\AptUI\%%~nA" (
		"!sdk!\Tools\AssetMerger.exe" "!sdk!\Compilation\Mods\%modname%\Data\AptUI\%%~nA%streamversion%.manifest" "!sdk!\Mods\%modname%\Assets\AptUI\%%~nA"
		"!sdk!\Tools\StreamSorter.exe" "!sdk!\Compilation\Mods\%modname%\Data\AptUI\%%~nA%streamversion%.manifest"
	)
)

cd /D "!sdk!"
set sdk=

endlocal EnableDelayedExpansion


"%cd%\Tools\StringHashGenerator.exe" "%cd%\Compilation\Mods\%modname%" "%cd%\Mods\%modname%\Data\StringHashes.xml"

if exist "%cd%\Mods\%modname%\Data\StringHashes.xml" (
	"%cd%\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Mods\%modname%\Data\StringHashes.xml" -art:"..\Art" -audio:"..\Audio" -out:"%cd%\Compilation\Mods\%modname%\Data" -version:"%streamversion%" -bps:"stringhashes.manifest,%cd%\Game Files\Manifest\stringhashes.manifest"
	del "%cd%\Mods\%modname%\Data\StringHashes.xml" /F /Q
)
if exist "%cd%\Compilation\Mods\%modname%" "%cd%\Tools\MakeBig.exe" -f "%cd%\Compilation\Mods\%modname%" -o:"%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%modversion%_Streams.big"
if exist "%cd%\Mods\%modname%\Misc" "%cd%\Tools\MakeBig.exe" -f "%cd%\Mods\%modname%\Misc" -o:"%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%modversion%_Misc.big"
if exist "%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%modversion%.skudef" del "%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%modversion%.skudef" /F /Q
if exist "%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%modversion%_Streams.big" echo add-big %modname%_%modversion%_Streams.big>> "%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%modversion%.skudef"
if exist "%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%modversion%_Misc.big" echo add-big %modname%_%modversion%_Misc.big>> "%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%modversion%.skudef"

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
		
		if exist "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\AdditionalMaps\MapMetaData_Global_LanguagePack.manifest" if exist "!cd!\%%A\Assets\AdditionalMaps\MapMetaData_Global" (
			"!sdk!\Tools\AssetMerger.exe" "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\AdditionalMaps\MapMetaData_Global_LanguagePack.manifest" "!cd!\%%A\Assets\AdditionalMaps\MapMetaData_Global"
			"!sdk!\Tools\StreamSorter.exe" "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\AdditionalMaps\MapMetaData_Global_LanguagePack.manifest"
		)
		
		if exist "!sdk!\Compilation\Mods\%modname%\Data\AdditionalMaps\MapMetaData_GlobalOverrides.manifest" (
			set bps=-bps:"additionalmaps\mapmetadata_globaloverrides.manifest,!sdk!\Compilation\Mods\%modname%\Data\AdditionalMaps\MapMetaData_GlobalOverrides.manifest"
		) else (
			set bps=
		)
		
		if exist "!cd!\%%A\Data\AdditionalMaps\MapMetaData_GlobalOverrides.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!cd!\%%A\Data\AdditionalMaps\MapMetaData_GlobalOverrides.xml" -art:"..\..\Art;..\..\..\..\Art" -audio:"..\..\Audio;..\..\..\..\Audio" -out:"!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\AdditionalMaps" -version:"_LanguagePack" !bps!
		
		if exist "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\AdditionalMaps\MapMetaData_GlobalOverrides_LanguagePack.manifest" if exist "!cd!\%%A\Assets\AdditionalMaps\MapMetaData_GlobalOverrides" (
			"!sdk!\Tools\AssetMerger.exe" "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\AdditionalMaps\MapMetaData_GlobalOverrides_LanguagePack.manifest" "!cd!\%%A\Assets\AdditionalMaps\MapMetaData_GlobalOverrides"
			"!sdk!\Tools\StreamSorter.exe" "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\AdditionalMaps\MapMetaData_GlobalOverrides_LanguagePack.manifest"
		)
		
		if exist "!sdk!\Compilation\Mods\%modname%\Data\Static%streamversion%.manifest" (
			set bps=-bps:"static%streamversion%.manifest,!sdk!\Compilation\Mods\%modname%\Data\Static%streamversion%.manifest"
		) else (
			set bps=-bps:"static_common_2.manifest,!sdk!\Game Files\Manifest\Static_Common_2.manifest"
		)
		
		if exist "!cd!\%%A\Data\Static.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!cd!\%%A\Data\Static.xml" -art:"..\Art;..\..\..\Art" -audio:"..\Audio;..\..\..\Audio" -out:"!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data" -version:"_LanguagePack" -lowlod:"static_languagepack.manifest" !bps!

		if exist "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\Static_LanguagePack.manifest" if exist "!cd!\%%A\Assets\Static_LanguagePack" (
			"!sdk!\Tools\AssetMerger.exe" "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\Static_LanguagePack.manifest" "!cd!\%%A\Assets\Static_LanguagePack"
			"!sdk!\Tools\StreamSorter.exe" "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\Static_LanguagePack.manifest"
		)
		
		if exist "!sdk!\Compilation\Mods\%modname%\Data\MapMetaData%streamversion%.manifest" (
			set bps=-bps:"mapmetadata%streamversion%.manifest,!sdk!\Compilation\Mods\%modname%\Data\MapMetaData%streamversion%.manifest"
		) else (
			set bps=-bps:"mapmetadata.manifest,!sdk!\Game Files\Manifest\MapMetaData.manifest"
		)
		
		if exist "!cd!\%%A\Data\MapMetaData.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!cd!\%%A\Data\MapMetaData.xml" -art:"..\Art;..\..\..\Art" -audio:"..\Audio;..\..\..\Audio" -out:"!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data" -version:"_LanguagePack" -lowlod:"mapmetadata_languagepack.manifest" !bps!

		if exist "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\MapMetaData_LanguagePack.manifest" if exist "!cd!\%%A\Assets\MapMetaData_LanguagePack" (
			"!sdk!\Tools\AssetMerger.exe" "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\MapMetaData_LanguagePack.manifest" "!cd!\%%A\Assets\MapMetaData_LanguagePack"
			"!sdk!\Tools\StreamSorter.exe" "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\MapMetaData_LanguagePack.manifest"
		)
		
		if exist "!sdk!\Compilation\Mods\%modname%\Data\MetaGame%streamversion%.manifest" (
			set bps=-bps:"metagame%streamversion%.manifest,!sdk!\Compilation\Mods\%modname%\Data\MetaGame%streamversion%.manifest"
		) else (
			set bps=-bps:"metagame.manifest,!sdk!\Game Files\Manifest\MetaGame.manifest"
		)
		
		if exist "!cd!\%%A\Data\MetaGame.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!cd!\%%A\Data\MetaGame.xml" -art:"..\Art;..\..\..\Art" -audio:"..\Audio;..\..\..\Audio" -out:"!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data" -version:"_LanguagePack" -lowlod:"metagame_languagepack.manifest" !bps!

		if exist "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\MetaGame_LanguagePack.manifest" if exist "!cd!\%%A\Assets\MetaGame_LanguagePack" (
			"!sdk!\Tools\AssetMerger.exe" "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\MetaGame_LanguagePack.manifest" "!cd!\%%A\Assets\MetaGame_LanguagePack"
			"!sdk!\Tools\StreamSorter.exe" "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\MetaGame_LanguagePack.manifest"
		)
		
		set dir=!cd!
		cd /D "!sdk!\Game Files\Manifest\AptUI"
		
		for %%B in ("*.manifest") do (
			if exist "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\AptUI\%%~nB%streamversion%.manifest" (
				set bps=-bps:"aptui\%%~nB%streamversion%.manifest,!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\Aptui\%%~nB%streamversion%.manifest"
			) else (
				set bps=-bps:"aptui\%%~nB.manifest,!sdk!\Game Files\Manifest\AptUI\%%~nB.manifest"
			)
		
			if exist "!dir!\%%A\Data\AptUI\%%~nB.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!dir!\%%A\Data\AptUI\%%~nB.xml" -art:"..\..\Art;..\..\..\..\Art" -audio:"..\..\Audio;..\..\..\..\Audio" -out:"!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\AptUI" -version:"_LanguagePack" !bps!
			
			if exist "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\AptUI\%%~nB_LanguagePack.manifest" if exist "!dir!\%%A\Assets\AptUI\%%~nB" (
				"!sdk!\Tools\AssetMerger.exe" "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\AptUI\%%~nB_LanguagePack.manifest" "!dir!\%%A\Assets\AptUI\%%~nB"
				"!sdk!\Tools\StreamSorter.exe" "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\AptUI\%%~nB_LanguagePack.manifest"
			)
		)
		
		cd /D "!dir!"
		set dir=
		
		"!sdk!\Tools\StringHashGenerator.exe" "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data" "!sdk!\Mods\%modname%\Data\StringHashes.xml"
		
		if exist "%cd%\Mods\%modname%\Data\StringHashes.xml" (
			if exist "!sdk!\Compilation\Mods\%modname%\Data\StringHashes%streamversion%.manifest" (
				set bps=-bps:"stringhashes%streamversion%.manifest,!sdk!\Compilation\Mods\%modname%\Data\stringhashes%streamversion%.manifest"
			) else (
				set bps=-bps:"stringhashes.manifest,!sdk!\Game Files\Manifest\StringHashes.manifest"
			)
		
			"%cd%\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Mods\%modname%\Data\StringHashes.xml" -art:"..\Art" -audio:"..\Audio" -out:"!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data" -version:"_LanguagePack" !bps!
			del "%cd%\Mods\%modname%\Data\StringHashes.xml" /F /Q
		)
		
		if exist "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A" "!sdk!\Tools\MakeBig.exe" -f "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A" -o:"%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%modversion%_Streams_%%A.big"
		if exist "!cd!\%%A\Misc" "!sdk!\Tools\MakeBig.exe" -f "!cd!\%%A\Misc" -o:"!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A" -o:"%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%modversion%_Misc_%%A.big"
	)
	
	cd /D "!sdk!"
	set sdk=
)

endlocal EnableDelayedExpansion

:eof