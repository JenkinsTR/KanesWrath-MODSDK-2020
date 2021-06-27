@ECHO off
CD /D "%~dp0"

::SET modname and version from input
SET modname=%~1
SET modversion=%~2

::SET WrathEd version from file
SET /P version=<"%cd%\Tools\Version.txt"

::SET macros
SET "wrathed=%cd%\Tools\WrathEd.exe"
SET "WEBIG=%cd%\Tools\MakeBig.exe"
SET "WEMMG=%cd%\Tools\mapmetadatagenerator.exe"
SET "SDKDIR=%cd%"

::Print WrathEd version to console
ECHO.
ECHO WrathEd %version%
ECHO.

::Ask user for modname and version IF NOT DEFINED from input command
:modname
IF NOT DEFINED modname SET /P modname="Mod Name: "
IF NOT DEFINED modname GOTO modname
:modversion
IF NOT DEFINED modversion SET /P modversion="Mod Version: "
IF NOT DEFINED modversion GOTO modversion
REM SET streamversion=_mod
SET "streamversion="

::Check and SET My Documents location
::FOR /F "tokens=2* delims=	 " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Personal"') DO call SET mydocs=%%B
::FOR /F "tokens=2* delims=	 " %%A IN ('REG QUERY "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Personal"') DO call SET mydocs=%%B
::Workaround for above for running without Admin rights
SET mydocs=%userprofile%\Documents
ECHO mydocs detected as %mydocs%

::Check and SET UserDataLeaf locations
FOR /F "tokens=2* delims=	 " %%A IN ('REG QUERY "HKLM\Software\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "UserDataLeafName" 2^>nul') DO call SET userdataleaf="%%B"
IF NOT DEFINED userdataleaf FOR /F "tokens=2* delims=	 " %%A IN ('REG QUERY "HKLM\Software\Wow6432Node\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "UserDataLeafName" 2^>nul') DO call SET userdataleaf="%%B"

::TODO fix this
::ERROR 
:: userdataleaf detected and SET as Command
:: 'Conquer' is not recognized as an internal or external command,
:: operable program or batch file.

:: FIXED 06/06/21 - Double quotes required in [ FOR /F "delims=" %%A IN ("%userdataleaf%") ]


IF NOT DEFINED userdataleaf (
	::This seems to vary based on which install
	::TODO fix this
	::SET userdataleaf="Command and Conquer 3 Kanes Wrath"
	SET userdataleaf="Command ^& Conquer 3 Kane's Wrath"
)

FOR /F "delims=" %%A IN ("%userdataleaf%") DO SET userdataleaf=%%~A
ECHO userdataleaf detected and SET as "%userdataleaf%"

::Check FOR mod existance
IF NOT EXIST "%cd%\Xbox360\Mods\%modname%" (
	ECHO Error: The mod doesn't exist
	ECHO.
	PAUSE
	GOTO eof
)

::Print the mod name and version to the console
ECHO.
ECHO %modname% %modversion%

::Force remove temporary mod directory
IF EXIST "%cd%\Compilation\Xbox360\Mods\%modname%" RD "%cd%\Compilation\Xbox360\Mods\%modname%" /S /Q

ECHO Compiling Mod...

::MapMetaData_Global
IF EXIST "%cd%\Xbox360\Mods\%modname%\Data\AdditionalMaps\MapMetaData_Global.xml" "%wrathed%" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Xbox360\Mods\%modname%\Data\AdditionalMaps\MapMetaData_Global.xml" -art:"..\..\Art" -audio:"..\..\Audio" -out:"%cd%\Compilation\Xbox360\Mods\%modname%\Data\AdditionalMaps" -version:""

::MapMetaData_GlobalOverrides
IF EXIST "%cd%\Xbox360\Mods\%modname%\Data\AdditionalMaps\MapMetaData_GlobalOverrides.xml" "%wrathed%" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Xbox360\Mods\%modname%\Data\AdditionalMaps\MapMetaData_GlobalOverrides.xml" -art:"..\..\Art" -audio:"..\..\Audio" -out:"%cd%\Compilation\Xbox360\Mods\%modname%\Data\AdditionalMaps" -version:""

::Global.xml
IF EXIST "%cd%\Xbox360\Mods\%modname%\Data\Global.xml" "%wrathed%" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Xbox360\Mods\%modname%\Data\Global.xml" -art:"..\Art" -audio:"..\Audio" -out:"%cd%\Compilation\Xbox360\Mods\%modname%\Data" -version:"%streamversion%" -bps:"static_common_2.manifest,%cd%\Game Files\Manifest\static_common_2.manifest" -lowlod:"global%streamversion%.manifest"

::Static.xml -- Moved "Mod.xml" to here
IF EXIST "%cd%\Xbox360\Mods\%modname%\Data\Static.xml" "%wrathed%" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Xbox360\Mods\%modname%\Data\Static.xml" -art:"..\Art" -audio:"..\Audio" -out:"%cd%\Compilation\Xbox360\Mods\%modname%\Data" -version:"%streamversion%" -bps:"static_common_2.manifest,%cd%\Game Files\Manifest\static_common_2.manifest" -lowlod:"static%streamversion%.manifest"

::Worldbuilder.xml
IF EXIST "%cd%\Xbox360\Mods\%modname%\Data\Worldbuilder.xml" "%wrathed%" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Xbox360\Mods\%modname%\Data\Worldbuilder.xml" -art:"..\Art" -audio:"..\Audio" -out:"%cd%\Compilation\Xbox360\Mods\%modname%\Data" -version:"%streamversion%" -bps:"worldbuilder_2.manifest,%cd%\Game Files\Manifest\worldbuilder_2.manifest"

::MapMetaData
IF EXIST "%cd%\Xbox360\Mods\%modname%\Data\MapMetaData.xml" "%wrathed%" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Xbox360\Mods\%modname%\Data\MapMetaData.xml" -art:"..\Art" -audio:"..\Audio" -out:"%cd%\Compilation\Xbox360\Mods\%modname%\Data" -version:"%streamversion%" -bps:"mapmetadata.manifest,%cd%\Game Files\Manifest\mapmetadata.manifest"

::MetaGame
IF EXIST "%cd%\Xbox360\Mods\%modname%\Data\MetaGame.xml" "%wrathed%" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Xbox360\Mods\%modname%\Data\MetaGame.xml" -art:"..\Art" -audio:"..\Audio" -out:"%cd%\Compilation\Xbox360\Mods\%modname%\Data" -version:"%streamversion%" -bps:"metagame.manifest,%cd%\Game Files\Manifest\metagame.manifest"

::AptUI
SETLOCAL EnableDelayedExpansion

SET sdk=!cd!
CD /D "!sdk!\Game Files\Manifest\AptUI"

FOR %%A IN ("*.manifest") DO IF EXIST "!sdk!\Xbox360\Mods\%modname%\Data\AptUI\%%~nA.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!sdk!\Xbox360\Mods\%modname%\Data\AptUI\%%~nA.xml" -art:"..\..\Art" -audio:"..\..\Audio" -out:"!sdk!\Compilation\Xbox360\Mods\%modname%\Data\AptUI" -bps:"aptui\%%~nA.manifest,!sdk!\Game Files\Manifest\AptUI\%%~nA.manifest" -version:"%streamversion%"

CD /D "!sdk!"
SET sdk=

ENDLOCAL EnableDelayedExpansion

::StringHashGenerator
:: not sure if this is even needed...
"%cd%\Tools\StringHashGenerator.exe" "%cd%\Compilation\Xbox360\Mods\%modname%" "%cd%\Xbox360\Mods\%modname%\Data\StringHashes.xml"

SET XBBIGOUT1=%cd%\Xbox360\BuiltMods\%modname%

::LanguagePacks
SETLOCAL EnableDelayedExpansion

IF EXIST "%cd%\Xbox360\Mods\%modname%\LanguagePacks" (
	SET sdk=!cd!
	CD /D "!sdk!\Xbox360\Mods\%modname%\LanguagePacks"
	
	FOR /D %%A IN ("*") DO (
		ECHO Compiling %%A Language Pack...
		
		IF EXIST "!sdk!\Compilation\Xbox360\Mods\%modname%\Data\AdditionalMaps\MapMetaData_Global.manifest" (
			SET bps=-bps:"additionalmaps\mapmetadata_global.manifest,!sdk!\Compilation\Xbox360\Mods\%modname%\Data\AdditionalMaps\MapMetaData_Global.manifest"
		) ELSE (
			SET bps=
		)
		
		::MapMetaData_Global
		IF EXIST "!cd!\%%A\Data\AdditionalMaps\MapMetaData_Global.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!cd!\%%A\Data\AdditionalMaps\MapMetaData_Global.xml" -art:"..\..\Art;..\..\..\..\Art" -audio:"..\..\Audio;..\..\..\..\Audio" -out:"!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\AdditionalMaps" -version:"_LanguagePack" !bps!
				
		::MapMetaData_GlobalOverrides
		IF EXIST "!sdk!\Compilation\Xbox360\Mods\%modname%\Data\AdditionalMaps\MapMetaData_GlobalOverrides.manifest" (
			SET bps=-bps:"additionalmaps\mapmetadata_globaloverrides.manifest,!sdk!\Compilation\Xbox360\Mods\%modname%\Data\AdditionalMaps\MapMetaData_GlobalOverrides.manifest"
		) ELSE (
			SET bps=
		)
		
		IF EXIST "!cd!\%%A\Data\AdditionalMaps\MapMetaData_GlobalOverrides.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!cd!\%%A\Data\AdditionalMaps\MapMetaData_GlobalOverrides.xml" -art:"..\..\Art;..\..\..\..\Art" -audio:"..\..\Audio;..\..\..\..\Audio" -out:"!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\AdditionalMaps" -version:"_LanguagePack" !bps!
		
		::Global manifest
		IF EXIST "!sdk!\Compilation\Xbox360\Mods\%modname%\Data\Global%streamversion%.manifest" (
			SET bps=-bps:"global%streamversion%.manifest,!sdk!\Compilation\Xbox360\Mods\%modname%\Data\Global%streamversion%.manifest"
		) ELSE (
			SET bps=-bps:"global_common_2.manifest,!sdk!\Game Files\Manifest\Global_Common_2.manifest"
		)
		
		::Global.xml
		IF EXIST "!cd!\%%A\Data\Global.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!cd!\%%A\Data\Global.xml" -art:"..\Art;..\..\..\Art" -audio:"..\Audio;..\..\..\Audio" -out:"!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data" -version:"_LanguagePack" -lowlod:"global_languagepack.manifest" !bps!

		::Static manifest
		IF EXIST "!sdk!\Compilation\Xbox360\Mods\%modname%\Data\Static%streamversion%.manifest" (
			SET bps=-bps:"static%streamversion%.manifest,!sdk!\Compilation\Xbox360\Mods\%modname%\Data\Static%streamversion%.manifest"
		) ELSE (
			SET bps=-bps:"static_common_2.manifest,!sdk!\Game Files\Manifest\Static_Common_2.manifest"
		)
		
		::Static.xml
		IF EXIST "!cd!\%%A\Data\Static.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!cd!\%%A\Data\Static.xml" -art:"..\Art;..\..\..\Art" -audio:"..\Audio;..\..\..\Audio" -out:"!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data" -version:"_LanguagePack" -lowlod:"static_languagepack.manifest" !bps!

		::MapMetaData
		IF EXIST "!sdk!\Compilation\Xbox360\Mods\%modname%\Data\MapMetaData%streamversion%.manifest" (
			SET bps=-bps:"mapmetadata%streamversion%.manifest,!sdk!\Compilation\Xbox360\Mods\%modname%\Data\MapMetaData%streamversion%.manifest"
		) ELSE (
			SET bps=-bps:"mapmetadata.manifest,!sdk!\Game Files\Manifest\MapMetaData.manifest"
		)
		
		IF EXIST "!cd!\%%A\Data\MapMetaData.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!cd!\%%A\Data\MapMetaData.xml" -art:"..\Art;..\..\..\Art" -audio:"..\Audio;..\..\..\Audio" -out:"!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data" -version:"_LanguagePack" -lowlod:"mapmetadata_languagepack.manifest" !bps!

		::MetaGame
		IF EXIST "!sdk!\Compilation\Xbox360\Mods\%modname%\Data\MetaGame%streamversion%.manifest" (
			SET bps=-bps:"metagame%streamversion%.manifest,!sdk!\Compilation\Xbox360\Mods\%modname%\Data\MetaGame%streamversion%.manifest"
		) ELSE (
			SET bps=-bps:"metagame.manifest,!sdk!\Game Files\Manifest\MetaGame.manifest"
		)
		
		IF EXIST "!cd!\%%A\Data\MetaGame.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!cd!\%%A\Data\MetaGame.xml" -art:"..\Art;..\..\..\Art" -audio:"..\Audio;..\..\..\Audio" -out:"!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data" -version:"_LanguagePack" -lowlod:"metagame_languagepack.manifest" !bps!

		::AptUI
		SET dir=!cd!
		CD /D "!sdk!\Game Files\Manifest\AptUI"
		
		FOR %%B IN ("*.manifest") DO (
			IF EXIST "!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\AptUI\%%~nB%streamversion%.manifest" (
				SET bps=-bps:"aptui\%%~nB%streamversion%.manifest,!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\Aptui\%%~nB%streamversion%.manifest"
			) ELSE (
				SET bps=-bps:"aptui\%%~nB.manifest,!sdk!\Game Files\Manifest\AptUI\%%~nB.manifest"
			)
		
			IF EXIST "!dir!\%%A\Data\AptUI\%%~nB.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!dir!\%%A\Data\AptUI\%%~nB.xml" -art:"..\..\Art;..\..\..\..\Art" -audio:"..\..\Audio;..\..\..\..\Audio" -out:"!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\AptUI" -version:"_LanguagePack" !bps!
			
		)
		
		::StringHashGenerator
		:: not sure if this is even needed...
		REM CD /D "!dir!"
		REM SET dir=
		
		REM "!sdk!\Tools\StringHashGenerator.exe" "!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data" "!sdk!\Xbox360\Mods\%modname%\Data\StringHashes.xml"
		
		REM IF EXIST "%cd%\Xbox360\Mods\%modname%\Data\StringHashes.xml" (
			REM IF EXIST "!sdk!\Compilation\Xbox360\Mods\%modname%\Data\StringHashes%streamversion%.manifest" (
				REM SET bps=-bps:"stringhashes%streamversion%.manifest,!sdk!\Compilation\Xbox360\Mods\%modname%\Data\stringhashes%streamversion%.manifest"
			REM ) ELSE (
				REM SET bps=-bps:"stringhashes.manifest,!sdk!\Game Files\Manifest\StringHashes.manifest"
			REM )
		
			REM "%wrathed%" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Xbox360\Mods\%modname%\Data\StringHashes.xml" -art:"..\Art" -audio:"..\Audio" -out:"!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data" -version:"_LanguagePack" !bps!
			REM DEL "%cd%\Xbox360\Mods\%modname%\Data\StringHashes.xml" /F /Q
		REM )
		
		::MakeBig
		IF EXIST "!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A" "!sdk!\Tools\MakeBig.exe" -f "!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A" -o:"%XBBIGOUT1%\%modname%_%modversion%_Streams_%%A.big"
		IF EXIST "!cd!\%%A\Misc" "!sdk!\Tools\MakeBig.exe" -f "!cd!\%%A\Misc" -o:"!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A" -o:"%XBBIGOUT1%\%modname%_%modversion%_Misc_%%A.big"
	)
	
	CD /D "!sdk!"
	SET sdk=
)

:: ----------------------------------------------
:: BUILDMAPS

:: MAPS HAVE TO BE MANUALLY MOVED TO SDK\Xbox360\Mods\%modname%\Data\Maps\<MAPNAME>

ECHO Checking "%SDKDIR%\Xbox360\Mods\%modname%\Data\Maps\*.map"
ECHO.

:: Push into our maps directory
PUSHD "%SDKDIR%\Xbox360\Mods\%modname%\Data\Maps"

IF EXIST "%XBBIGOUT1%\%modname%_%modversion%_maps.cfg" DEL "%XBBIGOUT1%\%modname%_%modversion%_maps.cfg" /F /Q
	
FOR /R %%G IN (*.map) DO (
	SET mapname=%%~nG

	:: Begin compile
	ECHO -----
	ECHO !mapname!
		
	:: Clean pre-compiled directories 
	IF EXIST "%SDKDIR%\Compilation\Xbox360\Mods\%modname%\Data\Maps\!mapname!" RD "%SDKDIR%\Compilation\Xbox360\Mods\%modname%\Data\Maps\!mapname!" /S /Q
	
	ECHO Compiling Map...
	REM IF EXIST "%SDKDIR%\Xbox360\Mods\%modname%\Data\Maps\!mapname!\map.xml" "%WEMMG%" "%SDKDIR%\Xbox360\Mods\%modname%\Data\Maps\!mapname!\map.xml"
	REM IF EXIST "%SDKDIR%\Xbox360\Mods\%modname%\Data\Maps\!mapname!\mapmetadata_!mapname!.xml" "%wrathed%" -gameDefinition:"Kane's Wrath" -compile:"%SDKDIR%\Xbox360\Mods\%modname%\Data\Maps\!mapname!\mapmetadata_!mapname!.xml" -art:"Art" -audio:"Audio" -out:"%SDKDIR%\Compilation\Xbox360\Mods\%modname%\Data\Maps\!mapname!\AdditionalMaps" -version:""
	REM IF EXIST "%SDKDIR%\Xbox360\Mods\%modname%\Data\Maps\!mapname!\mapmetadata_!mapname!.xml" DEL "%SDKDIR%\Xbox360\Mods\%modname%\Data\Maps\!mapname!\mapmetadata_!mapname!.xml" /F /Q
	
	IF EXIST "%SDKDIR%\Xbox360\Mods\%modname%\Data\Maps\!mapname!\map.xml" "%wrathed%" -gameDefinition:"Kane's Wrath" -compile:"%SDKDIR%\Xbox360\Mods\%modname%\Data\Maps\!mapname!\map.xml" -map -terrain:"%SDKDIR%\Game Files\Art\Terrain" -art:"Art" -audio:"Audio" -data:"Data" -out:"%SDKDIR%\Compilation\Xbox360\Mods\%modname%\Data\Maps\!mapname!" -version:""
		
	:: We don't need to put the generated BIGs inside Mydocs as we're building FOR Xbox
	SET "XBBIGOUT=%XBBIGOUT1%\Maps\!mapname!"
	
	:: We need to copy the art and .map into the target directory to build the BIG properly
	:: Xbox360\Mods\TestMod\data\maps\map_mp_2_black6\map_mp_2_black6_art.tga
	COPY "%SDKDIR%\Xbox360\Mods\%modname%\Data\Maps\!mapname!\!mapname!_art.tga" "%SDKDIR%\Compilation\Xbox360\Mods\%modname%\Data\Maps\!mapname!\!mapname!_art.tga"
	COPY "%SDKDIR%\Xbox360\Mods\%modname%\Data\Maps\!mapname!\!mapname!.map" "%SDKDIR%\Compilation\Xbox360\Mods\%modname%\Data\Maps\!mapname!\!mapname!.map"
	
	:: BIG it up!
	REM "%WEBIG%" -f "%SDKDIR%\Compilation\Xbox360\Mods\%modname%\Data\Maps\!mapname!" -o:"!XBBIGOUT!\Map_Data.big"
	REM IF EXIST "%SDKDIR%\Compilation\Xbox360\Mods\%modname%\Data\Maps\!mapname!\Misc" "%WEBIG%" -f "%SDKDIR%\Compilation\Xbox360\Mods\%modname%\Data\Maps\!mapname!\Misc" -o:"!XBBIGOUT!\Map_Misc.big"
	
	:: We need to use filesystem.cfg instead of .skudef FOR Xbox
	REM IF EXIST "%SDKDIR%\Xbox360\Mods\%modname%\Data\Maps\!mapname!\filesystem_map.cfg" DEL "!XBBIGOUT!\filesystem_map.cfg" /F /Q
	REM IF EXIST "!XBBIGOUT!\Map_Streams.big" ECHO add-big Map_Streams.big>> "!XBBIGOUT!\filesystem_map.cfg"
	REM IF EXIST "!XBBIGOUT!\Map_Misc.big" ECHO add-big Map_Misc.big>> "!XBBIGOUT!\filesystem_map.cfg"
	
	REM IF EXIST "!XBBIGOUT!\Map_Data.big" ECHO add-big Maps\!mapname!\Map_Data.big>> "%SDKDIR%\Xbox360\BuiltMods\%modname%\%modname%_%modversion%_maps.cfg"
	REM IF EXIST "!XBBIGOUT!\Map_Misc.big" ECHO add-big Maps\!mapname!\Map_Misc.big>> "%SDKDIR%\Xbox360\BuiltMods\%modname%\%modname%_%modversion%_maps.cfg"

	:: We also need to pool the new filesystem_map files into one cfg -- deprecated, moved to above
	REM IF EXIST "!XBBIGOUT!\filesystem_map.cfg" ECHO try-add-config Maps\!mapname!\filesystem_map.cfg>> "%SDKDIR%\Xbox360\BuiltMods\%modname%\%modname%_%modversion%_maps.cfg"

	ECHO Done!
	
)

POPD

:: We don't need to put the generated BIGs inside Mydocs as we're building FOR Xbox

:: Remove stringhashes for this build (They're everywhere!)

REM DEL "%SDKDIR%\Compilation\Xbox360\Mods\%modname%\Data\stringhashes.*" /S /F /Q

::MakeBig
IF EXIST "%SDKDIR%\Compilation\Xbox360\Mods\%modname%" "%WEBIG%" -f "%SDKDIR%\Compilation\Xbox360\Mods\%modname%" -o:"%XBBIGOUT1%\%modname%_%modversion%.big"
IF EXIST "%SDKDIR%\Xbox360\Mods\%modname%\Misc" "%WEBIG%" -f "%SDKDIR%\Xbox360\Mods\%modname%\Misc" -o:"%XBBIGOUT1%\%modname%_%modversion%_Misc.big"

:: We need to use filesystem.cfg instead of .skudef FOR Xbox
IF EXIST "%XBBIGOUT1%\%modname%_%modversion%.cfg" DEL "%XBBIGOUT1%\%modname%_%modversion%.cfg" /F /Q
IF EXIST "%XBBIGOUT1%\%modname%_%modversion%.big" ECHO add-big %modname%_%modversion%.big>> "%XBBIGOUT1%\%modname%_%modversion%.cfg"
IF EXIST "%XBBIGOUT1%\%modname%_%modversion%_Misc.big" ECHO add-big %modname%_%modversion%_Misc.big>> "%XBBIGOUT1%\%modname%_%modversion%.cfg"

REM "%WEBIG%" -f "%SDKDIR%\Compilation\Xbox360\Mods\%modname%\Data\Maps\!mapname!" -o:"!XBBIGOUT!\Map_Data.big"

REM IF EXIST "%SDKDIR%\Xbox360\BuiltMods\%modname%\%modname%_%modversion%_maps.cfg" ECHO try-add-config %modname%_%modversion%_maps.cfg>> "%SDKDIR%\Xbox360\BuiltMods\%modname%\%modname%_%modversion%.cfg""


ENDLOCAL EnableDelayedExpansion

PAUSE
EXIT /B

:eof