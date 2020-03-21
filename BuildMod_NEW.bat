@ECHO OFF
CD /D "%~dp0"
SET modname=%~1
SET modversion=%~2
REM SET /P version=<"%cd%\Tools\Version.txt"

REM ECHO.
REM ECHO WrathEd %version%
REM ECHO.
TYPE "ReadMe_BuildMod.txt"

::Check and ask for modname and version
:modname
IF NOT DEFINED modname SET /P modname="Type your Mod's folder name: "
IF NOT DEFINED modname GOTO modname
:modversion
IF NOT DEFINED modversion SET /P modversion="Mod Version: "
IF NOT DEFINED modversion GOTO modversion
SET streamversion=_mod

::Grab registry data for CnC install paths
FOR /F "tokens=2* delims=	 " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Personal"') DO CALL SET mydocs=%%B
FOR /F "tokens=2* delims=	 " %%A IN ('REG QUERY "HKLM\Software\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "UserDataLeafName" 2^>nul') DO CALL SET userdataleaf="%%B"
IF NOT DEFINED userdataleaf FOR /F "tokens=2* delims=	 " %%A IN ('REG QUERY "HKLM\Software\Wow6432Node\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "UserDataLeafName" 2^>nul') DO CALL SET userdataleaf="%%B"

IF NOT DEFINED userdataleaf (
	SET userdataleaf="Command and Conquer 3 Kanes Wrath"
)

FOR /F "delims=" %%A IN (%userdataleaf%) DO SET userdataleaf=%%~A

ECHO.
ECHO %modname% %modversion%

IF NOT EXIST"%cd%\Mods\%modname%" (
	ECHO Error: The mod doesn't exist
	ECHO.
	PAUSE
	GOTO eof
)

::SET macros
SET "compilation=%cd%\Compilation\Mods\%modname%"
SET "wrathed=%cd%\Tools\WrathEd.exe"

IF EXIST "%compilation%" RD "%compilation%" /S /Q

ECHO Compiling Mod...

::MapMetaData_Global
IF EXIST "%cd%\Mods\%modname%\Data\AdditionalMaps\MapMetaData_Global.xml" "%wrathed%" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Mods\%modname%\Data\AdditionalMaps\MapMetaData_Global.xml" -art:"..\..\Art" -audio:"..\..\Audio" -out:"%compilation%\Data\AdditionalMaps" -version:""

IF EXIST "%compilation%\Data\AdditionalMaps\MapMetaData_Global.manifest" IF EXIST "%cd%\Mods\%modname%\Assets\AdditionalMaps\MapMetaData_Global" (
	"%cd%\Tools\AssetMerger.exe" "%compilation%\Data\AdditionalMaps\MapMetaData_Global.manifest" "%cd%\Mods\%modname%\Assets\AdditionalMaps\MapMetaData_Global"
	"%cd%\Tools\StreamSorter.exe" "%compilation%\Data\AdditionalMaps\MapMetaData_Global.manifest"
)

::MapMetaData_GlobalOverrides
IF EXIST "%cd%\Mods\%modname%\Data\AdditionalMaps\MapMetaData_GlobalOverrides.xml" "%wrathed%" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Mods\%modname%\Data\AdditionalMaps\MapMetaData_GlobalOverrides.xml" -art:"..\..\Art" -audio:"..\..\Audio" -out:"%compilation%\Data\AdditionalMaps" -version:""

IF EXIST "%compilation%\Data\AdditionalMaps\MapMetaData_GlobalOverrides.manifest" IF EXIST "%cd%\Mods\%modname%\Assets\AdditionalMaps\MapMetaData_GlobalOverrides" (
	"%cd%\Tools\AssetMerger.exe" "%compilation%\Data\AdditionalMaps\MapMetaData_GlobalOverrides.manifest" "%cd%\Mods\%modname%\Assets\AdditionalMaps\MapMetaData_GlobalOverrides"
	"%cd%\Tools\StreamSorter.exe" "%compilation%\Data\AdditionalMaps\MapMetaData_GlobalOverrides.manifest"
)

::Static
IF EXIST "%cd%\Mods\%modname%\Data\Static.xml" "%wrathed%" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Mods\%modname%\Data\Static.xml" -art:"..\Art" -audio:"..\Audio" -out:"%compilation%\Data" -version:"%streamversion%" -bps:"static_common_2.manifest,%cd%\Game Files\Manifest\static_common_2.manifest" -lowlod:"static%streamversion%.manifest"

IF EXIST "%compilation%\Data\Static%streamversion%.manifest" IF EXIST "%cd%\Mods\%modname%\Assets\Static" (
	"%cd%\Tools\AssetMerger.exe" "%compilation%\Data\Static%streamversion%.manifest" "%cd%\Mods\%modname%\Assets\Static"
	"%cd%\Tools\StreamSorter.exe" "%compilation%\Data\Static%streamversion%.manifest"
)

::Worldbuilder
IF EXIST "%cd%\Mods\%modname%\Data\Worldbuilder.xml" "%wrathed%" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Mods\%modname%\Data\Worldbuilder.xml" -art:"..\Art" -audio:"..\Audio" -out:"%compilation%\Data" -version:"%streamversion%" -bps:"worldbuilder_2.manifest,%cd%\Game Files\Manifest\worldbuilder_2.manifest"

IF EXIST "%compilation%\Data\Worldbuilder%streamversion%.manifest" IF EXIST "%cd%\Mods\%modname%\Assets\Worldbuilder" (
	"%cd%\Tools\AssetMerger.exe" "%compilation%\Data\Worldbuilder%streamversion%.manifest" "%cd%\Mods\%modname%\Assets\Worldbuilder"
	"%cd%\Tools\StreamSorter.exe" "%compilation%\Data\Worldbuilder%streamversion%.manifest"
)

::MapMetaData
IF EXIST "%cd%\Mods\%modname%\Data\MapMetaData.xml" "%wrathed%" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Mods\%modname%\Data\MapMetaData.xml" -art:"..\Art" -audio:"..\Audio" -out:"%compilation%\Data" -version:"%streamversion%" -bps:"mapmetadata.manifest,%cd%\Game Files\Manifest\mapmetadata.manifest"

IF EXIST "%compilation%\Data\MapMetaData%streamversion%.manifest" IF EXIST "%cd%\Mods\%modname%\Assets\MapMetaData" (
	"%cd%\Tools\AssetMerger.exe" "%compilation%\Data\MapMetaData%streamversion%.manifest" "%cd%\Mods\%modname%\Assets\MapMetaData"
	"%cd%\Tools\StreamSorter.exe" "%compilation%\Data\MapMetaData%streamversion%.manifest"
)

::MetaGame
IF EXIST "%cd%\Mods\%modname%\Data\MetaGame.xml" "%wrathed%" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Mods\%modname%\Data\MetaGame.xml" -art:"..\Art" -audio:"..\Audio" -out:"%compilation%\Data" -version:"%streamversion%" -bps:"metagame.manifest,%cd%\Game Files\Manifest\metagame.manifest"

IF EXIST "%compilation%\Data\MetaGame%streamversion%.manifest" IF EXIST "%cd%\Mods\%modname%\Assets\MetaGame" (
	"%cd%\Tools\AssetMerger.exe" "%compilation%\Data\MetaGame%streamversion%.manifest" "%cd%\Mods\%modname%\Assets\MetaGame"
	"%cd%\Tools\StreamSorter.exe" "%compilation%\Data\MetaGame%streamversion%.manifest"
)

::AptUI
SETLOCAL EnableDelayedExpansion

SET sdk=!cd!
CD /D "!sdk!\Game Files\Manifest\AptUI"

FOR %%A IN ("*.manifest") do (
	IF EXIST "!sdk!\Mods\%modname%\Data\AptUI\%%~nA.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!sdk!\Mods\%modname%\Data\AptUI\%%~nA.xml" -art:"..\..\Art" -audio:"..\..\Audio" -out:"!sdk!\Compilation\Mods\%modname%\Data\AptUI" -bps:"aptui\%%~nA.manifest,!sdk!\Game Files\Manifest\AptUI\%%~nA.manifest" -version:"%streamversion%"
	
	IF EXIST "!sdk!\Compilation\Mods\%modname%\Data\AptUI\%%~nA%streamversion%.manifest" IF EXIST "!sdk!\Mods\%modname%\Assets\AptUI\%%~nA" (
		"!sdk!\Tools\AssetMerger.exe" "!sdk!\Compilation\Mods\%modname%\Data\AptUI\%%~nA%streamversion%.manifest" "!sdk!\Mods\%modname%\Assets\AptUI\%%~nA"
		"!sdk!\Tools\StreamSorter.exe" "!sdk!\Compilation\Mods\%modname%\Data\AptUI\%%~nA%streamversion%.manifest"
	)
)

CD /D "!sdk!"
SET sdk=

ENDLOCAL EnableDelayedExpansion

::MakeBig
IF EXIST "%compilation%" "%cd%\Tools\MakeBig.exe" -f "%compilation%" -o:"%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%modversion%_Streams.big"
IF EXIST "%cd%\Mods\%modname%\Misc" "%cd%\Tools\MakeBig.exe" -f "%cd%\Mods\%modname%\Misc" -o:"%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%modversion%_Misc.big"
IF EXIST "%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%modversion%.skudef" del "%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%modversion%.skudef" /F /Q
IF EXIST "%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%modversion%_Streams.big" ECHO add-big %modname%_%modversion%_Streams.big>> "%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%modversion%.skudef"
IF EXIST "%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%modversion%_Misc.big" ECHO add-big %modname%_%modversion%_Misc.big>> "%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%modversion%.skudef"

::LanguagePacks
SETLOCAL EnableDelayedExpansion

IF EXIST "%cd%\Mods\%modname%\LanguagePacks" (
	SET sdk=!cd!
	CD /D "!sdk!\Mods\%modname%\LanguagePacks"
	
	FOR /D %%A IN ("*") do (
		ECHO Compiling %%A Language Pack...
		
		IF EXIST "!sdk!\Compilation\Mods\%modname%\Data\AdditionalMaps\MapMetaData_Global.manifest" (
			SET bps=-bps:"additionalmaps\mapmetadata_global.manifest,!sdk!\Compilation\Mods\%modname%\Data\AdditionalMaps\MapMetaData_Global.manifest"
		) ELSE (
			SET bps=
		)
		
		IF EXIST "!cd!\%%A\Data\AdditionalMaps\MapMetaData_Global.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!cd!\%%A\Data\AdditionalMaps\MapMetaData_Global.xml" -art:"..\..\Art;..\..\..\..\Art" -audio:"..\..\Audio;..\..\..\..\Audio" -out:"!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\AdditionalMaps" -version:"_LanguagePack" !bps!
		
		IF EXIST "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\AdditionalMaps\MapMetaData_Global_LanguagePack.manifest" IF EXIST "!cd!\%%A\Assets\AdditionalMaps\MapMetaData_Global" (
			"!sdk!\Tools\AssetMerger.exe" "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\AdditionalMaps\MapMetaData_Global_LanguagePack.manifest" "!cd!\%%A\Assets\AdditionalMaps\MapMetaData_Global"
			"!sdk!\Tools\StreamSorter.exe" "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\AdditionalMaps\MapMetaData_Global_LanguagePack.manifest"
		)
		
		IF EXIST "!sdk!\Compilation\Mods\%modname%\Data\AdditionalMaps\MapMetaData_GlobalOverrides.manifest" (
			SET bps=-bps:"additionalmaps\mapmetadata_globaloverrides.manifest,!sdk!\Compilation\Mods\%modname%\Data\AdditionalMaps\MapMetaData_GlobalOverrides.manifest"
		) ELSE (
			SET bps=
		)
		
		IF EXIST "!cd!\%%A\Data\AdditionalMaps\MapMetaData_GlobalOverrides.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!cd!\%%A\Data\AdditionalMaps\MapMetaData_GlobalOverrides.xml" -art:"..\..\Art;..\..\..\..\Art" -audio:"..\..\Audio;..\..\..\..\Audio" -out:"!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\AdditionalMaps" -version:"_LanguagePack" !bps!
		
		IF EXIST "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\AdditionalMaps\MapMetaData_GlobalOverrides_LanguagePack.manifest" IF EXIST "!cd!\%%A\Assets\AdditionalMaps\MapMetaData_GlobalOverrides" (
			"!sdk!\Tools\AssetMerger.exe" "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\AdditionalMaps\MapMetaData_GlobalOverrides_LanguagePack.manifest" "!cd!\%%A\Assets\AdditionalMaps\MapMetaData_GlobalOverrides"
			"!sdk!\Tools\StreamSorter.exe" "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\AdditionalMaps\MapMetaData_GlobalOverrides_LanguagePack.manifest"
		)
		
		IF EXIST "!sdk!\Compilation\Mods\%modname%\Data\Static%streamversion%.manifest" (
			SET bps=-bps:"static%streamversion%.manifest,!sdk!\Compilation\Mods\%modname%\Data\Static%streamversion%.manifest"
		) ELSE (
			SET bps=-bps:"static_common_2.manifest,!sdk!\Game Files\Manifest\Static_Common_2.manifest"
		)
		
		IF EXIST "!cd!\%%A\Data\Static.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!cd!\%%A\Data\Static.xml" -art:"..\Art;..\..\..\Art" -audio:"..\Audio;..\..\..\Audio" -out:"!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data" -version:"_LanguagePack" -lowlod:"static_languagepack.manifest" !bps!

		IF EXIST "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\Static_LanguagePack.manifest" IF EXIST "!cd!\%%A\Assets\Static_LanguagePack" (
			"!sdk!\Tools\AssetMerger.exe" "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\Static_LanguagePack.manifest" "!cd!\%%A\Assets\Static_LanguagePack"
			"!sdk!\Tools\StreamSorter.exe" "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\Static_LanguagePack.manifest"
		)
		
		IF EXIST "!sdk!\Compilation\Mods\%modname%\Data\MapMetaData%streamversion%.manifest" (
			SET bps=-bps:"mapmetadata%streamversion%.manifest,!sdk!\Compilation\Mods\%modname%\Data\MapMetaData%streamversion%.manifest"
		) ELSE (
			SET bps=-bps:"mapmetadata.manifest,!sdk!\Game Files\Manifest\MapMetaData.manifest"
		)
		
		IF EXIST "!cd!\%%A\Data\MapMetaData.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!cd!\%%A\Data\MapMetaData.xml" -art:"..\Art;..\..\..\Art" -audio:"..\Audio;..\..\..\Audio" -out:"!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data" -version:"_LanguagePack" -lowlod:"mapmetadata_languagepack.manifest" !bps!

		IF EXIST "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\MapMetaData_LanguagePack.manifest" IF EXIST "!cd!\%%A\Assets\MapMetaData_LanguagePack" (
			"!sdk!\Tools\AssetMerger.exe" "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\MapMetaData_LanguagePack.manifest" "!cd!\%%A\Assets\MapMetaData_LanguagePack"
			"!sdk!\Tools\StreamSorter.exe" "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\MapMetaData_LanguagePack.manifest"
		)
		
		IF EXIST "!sdk!\Compilation\Mods\%modname%\Data\MetaGame%streamversion%.manifest" (
			SET bps=-bps:"metagame%streamversion%.manifest,!sdk!\Compilation\Mods\%modname%\Data\MetaGame%streamversion%.manifest"
		) ELSE (
			SET bps=-bps:"metagame.manifest,!sdk!\Game Files\Manifest\MetaGame.manifest"
		)
		
		IF EXIST "!cd!\%%A\Data\MetaGame.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!cd!\%%A\Data\MetaGame.xml" -art:"..\Art;..\..\..\Art" -audio:"..\Audio;..\..\..\Audio" -out:"!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data" -version:"_LanguagePack" -lowlod:"metagame_languagepack.manifest" !bps!

		IF EXIST "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\MetaGame_LanguagePack.manifest" IF EXIST "!cd!\%%A\Assets\MetaGame_LanguagePack" (
			"!sdk!\Tools\AssetMerger.exe" "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\MetaGame_LanguagePack.manifest" "!cd!\%%A\Assets\MetaGame_LanguagePack"
			"!sdk!\Tools\StreamSorter.exe" "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\MetaGame_LanguagePack.manifest"
		)
		
		SET dir=!cd!
		CD /D "!sdk!\Game Files\Manifest\AptUI"
		
		FOR %%B IN ("*.manifest") do (
			IF EXIST "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\AptUI\%%~nB%streamversion%.manifest" (
				SET bps=-bps:"aptui\%%~nB%streamversion%.manifest,!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\Aptui\%%~nB%streamversion%.manifest"
			) ELSE (
				SET bps=-bps:"aptui\%%~nB.manifest,!sdk!\Game Files\Manifest\AptUI\%%~nB.manifest"
			)
		
			IF EXIST "!dir!\%%A\Data\AptUI\%%~nB.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!dir!\%%A\Data\AptUI\%%~nB.xml" -art:"..\..\Art;..\..\..\..\Art" -audio:"..\..\Audio;..\..\..\..\Audio" -out:"!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\AptUI" -version:"_LanguagePack" !bps!
			
			IF EXIST "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\AptUI\%%~nB_LanguagePack.manifest" IF EXIST "!dir!\%%A\Assets\AptUI\%%~nB" (
				"!sdk!\Tools\AssetMerger.exe" "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\AptUI\%%~nB_LanguagePack.manifest" "!dir!\%%A\Assets\AptUI\%%~nB"
				"!sdk!\Tools\StreamSorter.exe" "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A\Data\AptUI\%%~nB_LanguagePack.manifest"
			)
		)
		
		CD /D "!dir!"
		SET dir=
		
		IF EXIST "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A" "!sdk!\Tools\MakeBig.exe" -f "!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A" -o:"%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%modversion%_Streams_%%A.big"
		IF EXIST "!cd!\%%A\Misc" "!sdk!\Tools\MakeBig.exe" -f "!cd!\%%A\Misc" -o:"!sdk!\Compilation\Mods\%modname%\LanguagePacks\%%A" -o:"%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%modversion%_Misc_%%A.big"
	)
	
	CD /D "!sdk!"
	SET sdk=
)

ENDLOCAL EnableDelayedExpansion

:EOF