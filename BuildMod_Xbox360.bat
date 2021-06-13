@echo off
cd /D "%~dp0"

::SET modname and version from input
set modname=%~1
set modversion=%~2

::SET WrathEd version from file
set /P version=<"%cd%\Tools\Version.txt"

::SET macros
set "wrathed=%cd%\Tools\WrathEd.exe"
set "WEAM=%cd%\Tools\AssetMerger.exe"
set "WESS=%cd%\Tools\StreamSorter.exe"
set "WEBIG=%cd%\Tools\MakeBig.exe"

::Print WrathEd version to console
echo.
echo WrathEd %version%
echo.

::Ask user for modname and version if not defined from input command
:modname
if not defined modname set /P modname="Mod Name: "
if not defined modname goto modname
:modversion
if not defined modversion set /P modversion="Mod Version: "
if not defined modversion goto modversion
set streamversion=_mod

::Check and set My Documents location
::for /F "tokens=2* delims=	 " %%A in ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Personal"') do call set mydocs=%%B
::for /F "tokens=2* delims=	 " %%A in ('REG QUERY "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Personal"') do call set mydocs=%%B
::Workaround for above for running without Admin rights
set mydocs=%userprofile%\Documents
echo mydocs detected as %mydocs%

::Check and set UserDataLeaf locations
for /F "tokens=2* delims=	 " %%A in ('REG QUERY "HKLM\Software\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "UserDataLeafName" 2^>nul') do call set userdataleaf="%%B"
if not defined userdataleaf for /F "tokens=2* delims=	 " %%A in ('REG QUERY "HKLM\Software\Wow6432Node\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "UserDataLeafName" 2^>nul') do call set userdataleaf="%%B"

::TODO fix this
::ERROR 
:: userdataleaf detected and set as Command
:: 'Conquer' is not recognized as an internal or external command,
:: operable program or batch file.

:: FIXED 06/06/21 - Double quotes required in [ for /F "delims=" %%A in ("%userdataleaf%") ]


if not defined userdataleaf (
	::This seems to vary based on which install
	::TODO fix this
	::set userdataleaf="Command and Conquer 3 Kanes Wrath"
	set userdataleaf="Command ^& Conquer 3 Kane's Wrath"
)

for /F "delims=" %%A in ("%userdataleaf%") do set userdataleaf=%%~A
echo userdataleaf detected and set as "%userdataleaf%"

::Check for mod existance
if not exist "%cd%\Xbox360\Mods\%modname%" (
	echo Error: The mod doesn't exist
	echo.
	pause
	goto eof
)

::Print the mod name and version to the console
echo.
echo %modname% %modversion%

::Force remove temporary mod directory
if exist "%cd%\Compilation\Xbox360\Mods\%modname%" rd "%cd%\Compilation\Xbox360\Mods\%modname%" /S /Q

echo Compiling Mod...

::MapMetaData_Global
if exist "%cd%\Xbox360\Mods\%modname%\Data\AdditionalMaps\MapMetaData_Global.xml" "%wrathed%" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Xbox360\Mods\%modname%\Data\AdditionalMaps\MapMetaData_Global.xml" -art:"..\..\Art" -audio:"..\..\Audio" -out:"%cd%\Compilation\Xbox360\Mods\%modname%\Data\AdditionalMaps" -version:""

if exist "%cd%\Compilation\Xbox360\Mods\%modname%\Data\AdditionalMaps\MapMetaData_Global.manifest" if exist "%cd%\Xbox360\Mods\%modname%\Assets\AdditionalMaps\MapMetaData_Global" (
	"%WEAM%" "%cd%\Compilation\Xbox360\Mods\%modname%\Data\AdditionalMaps\MapMetaData_Global.manifest" "%cd%\Xbox360\Mods\%modname%\Assets\AdditionalMaps\MapMetaData_Global"
	"%WESS%" "%cd%\Compilation\Xbox360\Mods\%modname%\Data\AdditionalMaps\MapMetaData_Global.manifest"
)

::MapMetaData_GlobalOverrides
if exist "%cd%\Xbox360\Mods\%modname%\Data\AdditionalMaps\MapMetaData_GlobalOverrides.xml" "%wrathed%" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Xbox360\Mods\%modname%\Data\AdditionalMaps\MapMetaData_GlobalOverrides.xml" -art:"..\..\Art" -audio:"..\..\Audio" -out:"%cd%\Compilation\Xbox360\Mods\%modname%\Data\AdditionalMaps" -version:""

if exist "%cd%\Compilation\Xbox360\Mods\%modname%\Data\AdditionalMaps\MapMetaData_GlobalOverrides.manifest" if exist "%cd%\Xbox360\Mods\%modname%\Assets\AdditionalMaps\MapMetaData_GlobalOverrides" (
	"%WEAM%" "%cd%\Compilation\Xbox360\Mods\%modname%\Data\AdditionalMaps\MapMetaData_GlobalOverrides.manifest" "%cd%\Xbox360\Mods\%modname%\Assets\AdditionalMaps\MapMetaData_GlobalOverrides"
	"%WESS%" "%cd%\Compilation\Xbox360\Mods\%modname%\Data\AdditionalMaps\MapMetaData_GlobalOverrides.manifest"
)

::Global.xml
if exist "%cd%\Xbox360\Mods\%modname%\Data\Global.xml" "%wrathed%" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Xbox360\Mods\%modname%\Data\Global.xml" -art:"..\Art" -audio:"..\Audio" -out:"%cd%\Compilation\Xbox360\Mods\%modname%\Data" -version:"%streamversion%" -bps:"static_common_2.manifest,%cd%\Game Files\Manifest\static_common_2.manifest" -lowlod:"global%streamversion%.manifest"

if exist "%cd%\Compilation\Xbox360\Mods\%modname%\Data\Global%streamversion%.manifest" if exist "%cd%\Xbox360\Mods\%modname%\Assets\Global" (
	"%WEAM%" "%cd%\Compilation\Xbox360\Mods\%modname%\Data\Global%streamversion%.manifest" "%cd%\Xbox360\Mods\%modname%\Assets\Global"
	"%WESS%" "%cd%\Compilation\Xbox360\Mods\%modname%\Data\Global%streamversion%.manifest"
)

::Static.xml
if exist "%cd%\Xbox360\Mods\%modname%\Data\Static.xml" "%wrathed%" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Xbox360\Mods\%modname%\Data\Static.xml" -art:"..\Art" -audio:"..\Audio" -out:"%cd%\Compilation\Xbox360\Mods\%modname%\Data" -version:"%streamversion%" -bps:"static_common_2.manifest,%cd%\Game Files\Manifest\static_common_2.manifest" -lowlod:"static%streamversion%.manifest"

if exist "%cd%\Compilation\Xbox360\Mods\%modname%\Data\Static%streamversion%.manifest" if exist "%cd%\Xbox360\Mods\%modname%\Assets\Static" (
	"%WEAM%" "%cd%\Compilation\Xbox360\Mods\%modname%\Data\Static%streamversion%.manifest" "%cd%\Xbox360\Mods\%modname%\Assets\Static"
	"%WESS%" "%cd%\Compilation\Xbox360\Mods\%modname%\Data\Static%streamversion%.manifest"
)

::Worldbuilder.xml
if exist "%cd%\Xbox360\Mods\%modname%\Data\Worldbuilder.xml" "%wrathed%" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Xbox360\Mods\%modname%\Data\Worldbuilder.xml" -art:"..\Art" -audio:"..\Audio" -out:"%cd%\Compilation\Xbox360\Mods\%modname%\Data" -version:"%streamversion%" -bps:"worldbuilder_2.manifest,%cd%\Game Files\Manifest\worldbuilder_2.manifest"

if exist "%cd%\Compilation\Xbox360\Mods\%modname%\Data\Worldbuilder%streamversion%.manifest" if exist "%cd%\Xbox360\Mods\%modname%\Assets\Worldbuilder" (
	"%WEAM%" "%cd%\Compilation\Xbox360\Mods\%modname%\Data\Worldbuilder%streamversion%.manifest" "%cd%\Xbox360\Mods\%modname%\Assets\Worldbuilder"
	"%WESS%" "%cd%\Compilation\Xbox360\Mods\%modname%\Data\Worldbuilder%streamversion%.manifest"
)

::MapMetaData
if exist "%cd%\Xbox360\Mods\%modname%\Data\MapMetaData.xml" "%wrathed%" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Xbox360\Mods\%modname%\Data\MapMetaData.xml" -art:"..\Art" -audio:"..\Audio" -out:"%cd%\Compilation\Xbox360\Mods\%modname%\Data" -version:"%streamversion%" -bps:"mapmetadata.manifest,%cd%\Game Files\Manifest\mapmetadata.manifest"

if exist "%cd%\Compilation\Xbox360\Mods\%modname%\Data\MapMetaData%streamversion%.manifest" if exist "%cd%\Xbox360\Mods\%modname%\Assets\MapMetaData" (
	"%WEAM%" "%cd%\Compilation\Xbox360\Mods\%modname%\Data\MapMetaData%streamversion%.manifest" "%cd%\Xbox360\Mods\%modname%\Assets\MapMetaData"
	"%WESS%" "%cd%\Compilation\Xbox360\Mods\%modname%\Data\MapMetaData%streamversion%.manifest"
)

::MetaGame
if exist "%cd%\Xbox360\Mods\%modname%\Data\MetaGame.xml" "%wrathed%" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Xbox360\Mods\%modname%\Data\MetaGame.xml" -art:"..\Art" -audio:"..\Audio" -out:"%cd%\Compilation\Xbox360\Mods\%modname%\Data" -version:"%streamversion%" -bps:"metagame.manifest,%cd%\Game Files\Manifest\metagame.manifest"

if exist "%cd%\Compilation\Xbox360\Mods\%modname%\Data\MetaGame%streamversion%.manifest" if exist "%cd%\Xbox360\Mods\%modname%\Assets\MetaGame" (
	"%WEAM%" "%cd%\Compilation\Xbox360\Mods\%modname%\Data\MetaGame%streamversion%.manifest" "%cd%\Xbox360\Mods\%modname%\Assets\MetaGame"
	"%WESS%" "%cd%\Compilation\Xbox360\Mods\%modname%\Data\MetaGame%streamversion%.manifest"
)

::AptUI
setlocal EnableDelayedExpansion

set sdk=!cd!
cd /D "!sdk!\Game Files\Manifest\AptUI"

for %%A in ("*.manifest") do (
	if exist "!sdk!\Xbox360\Mods\%modname%\Data\AptUI\%%~nA.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!sdk!\Xbox360\Mods\%modname%\Data\AptUI\%%~nA.xml" -art:"..\..\Art" -audio:"..\..\Audio" -out:"!sdk!\Compilation\Xbox360\Mods\%modname%\Data\AptUI" -bps:"aptui\%%~nA.manifest,!sdk!\Game Files\Manifest\AptUI\%%~nA.manifest" -version:"%streamversion%"
	
	if exist "!sdk!\Compilation\Xbox360\Mods\%modname%\Data\AptUI\%%~nA%streamversion%.manifest" if exist "!sdk!\Xbox360\Mods\%modname%\Assets\AptUI\%%~nA" (
		"!sdk!\Tools\AssetMerger.exe" "!sdk!\Compilation\Xbox360\Mods\%modname%\Data\AptUI\%%~nA%streamversion%.manifest" "!sdk!\Xbox360\Mods\%modname%\Assets\AptUI\%%~nA"
		"!sdk!\Tools\StreamSorter.exe" "!sdk!\Compilation\Xbox360\Mods\%modname%\Data\AptUI\%%~nA%streamversion%.manifest"
	)
)

cd /D "!sdk!"
set sdk=

endlocal EnableDelayedExpansion

::StringHashGenerator
"%cd%\Tools\StringHashGenerator.exe" "%cd%\Compilation\Xbox360\Mods\%modname%" "%cd%\Xbox360\Mods\%modname%\Data\StringHashes.xml"

if exist "%cd%\Xbox360\Mods\%modname%\Data\StringHashes.xml" (
	"%wrathed%" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Xbox360\Mods\%modname%\Data\StringHashes.xml" -art:"..\Art" -audio:"..\Audio" -out:"%cd%\Compilation\Xbox360\Mods\%modname%\Data" -version:"%streamversion%" -bps:"stringhashes.manifest,%cd%\Game Files\Manifest\stringhashes.manifest"
	del "%cd%\Xbox360\Mods\%modname%\Data\StringHashes.xml" /F /Q
)


:: We don't need to put the generated BIGs inside Mydocs as we're building for Xbox
set XBBIGOUT=%cd%\Xbox360\BuiltMods\%modname%

::MakeBig
if exist "%cd%\Compilation\Xbox360\Mods\%modname%" "%WEBIG%" -f "%cd%\Compilation\Xbox360\Mods\%modname%" -o:"%XBBIGOUT%\%modname%_%modversion%_Streams.big"
if exist "%cd%\Xbox360\Mods\%modname%\Misc" "%WEBIG%" -f "%cd%\Xbox360\Mods\%modname%\Misc" -o:"%XBBIGOUT%\%modname%_%modversion%_Misc.big"

:: We need to use filesystem.cfg instead of .skudef for Xbox
if exist "%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%modversion%.cfg" del "%XBBIGOUT%\%modname%_%modversion%.cfg" /F /Q
if exist "%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%modversion%_Streams.big" echo add-big %modname%_%modversion%_Streams.big>> "%XBBIGOUT%\%modname%_%modversion%.cfg"
if exist "%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%modversion%_Misc.big" echo add-big %modname%_%modversion%_Misc.big>> "%XBBIGOUT%\%modname%_%modversion%.cfg"

::LanguagePacks
setlocal EnableDelayedExpansion

if exist "%cd%\Xbox360\Mods\%modname%\LanguagePacks" (
	set sdk=!cd!
	cd /D "!sdk!\Xbox360\Mods\%modname%\LanguagePacks"
	
	for /D %%A in ("*") do (
		echo Compiling %%A Language Pack...
		
		if exist "!sdk!\Compilation\Xbox360\Mods\%modname%\Data\AdditionalMaps\MapMetaData_Global.manifest" (
			set bps=-bps:"additionalmaps\mapmetadata_global.manifest,!sdk!\Compilation\Xbox360\Mods\%modname%\Data\AdditionalMaps\MapMetaData_Global.manifest"
		) else (
			set bps=
		)
		
		::MapMetaData_Global
		if exist "!cd!\%%A\Data\AdditionalMaps\MapMetaData_Global.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!cd!\%%A\Data\AdditionalMaps\MapMetaData_Global.xml" -art:"..\..\Art;..\..\..\..\Art" -audio:"..\..\Audio;..\..\..\..\Audio" -out:"!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\AdditionalMaps" -version:"_LanguagePack" !bps!
		
		if exist "!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\AdditionalMaps\MapMetaData_Global_LanguagePack.manifest" if exist "!cd!\%%A\Assets\AdditionalMaps\MapMetaData_Global" (
			"!sdk!\Tools\AssetMerger.exe" "!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\AdditionalMaps\MapMetaData_Global_LanguagePack.manifest" "!cd!\%%A\Assets\AdditionalMaps\MapMetaData_Global"
			"!sdk!\Tools\StreamSorter.exe" "!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\AdditionalMaps\MapMetaData_Global_LanguagePack.manifest"
		)
		
		::MapMetaData_GlobalOverrides
		if exist "!sdk!\Compilation\Xbox360\Mods\%modname%\Data\AdditionalMaps\MapMetaData_GlobalOverrides.manifest" (
			set bps=-bps:"additionalmaps\mapmetadata_globaloverrides.manifest,!sdk!\Compilation\Xbox360\Mods\%modname%\Data\AdditionalMaps\MapMetaData_GlobalOverrides.manifest"
		) else (
			set bps=
		)
		
		if exist "!cd!\%%A\Data\AdditionalMaps\MapMetaData_GlobalOverrides.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!cd!\%%A\Data\AdditionalMaps\MapMetaData_GlobalOverrides.xml" -art:"..\..\Art;..\..\..\..\Art" -audio:"..\..\Audio;..\..\..\..\Audio" -out:"!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\AdditionalMaps" -version:"_LanguagePack" !bps!
		
		if exist "!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\AdditionalMaps\MapMetaData_GlobalOverrides_LanguagePack.manifest" if exist "!cd!\%%A\Assets\AdditionalMaps\MapMetaData_GlobalOverrides" (
			"!sdk!\Tools\AssetMerger.exe" "!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\AdditionalMaps\MapMetaData_GlobalOverrides_LanguagePack.manifest" "!cd!\%%A\Assets\AdditionalMaps\MapMetaData_GlobalOverrides"
			"!sdk!\Tools\StreamSorter.exe" "!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\AdditionalMaps\MapMetaData_GlobalOverrides_LanguagePack.manifest"
		)
		
		::Global manifest
		if exist "!sdk!\Compilation\Xbox360\Mods\%modname%\Data\Global%streamversion%.manifest" (
			set bps=-bps:"global%streamversion%.manifest,!sdk!\Compilation\Xbox360\Mods\%modname%\Data\Global%streamversion%.manifest"
		) else (
			set bps=-bps:"global_common_2.manifest,!sdk!\Game Files\Manifest\Global_Common_2.manifest"
		)
		
		::Global.xml
		if exist "!cd!\%%A\Data\Global.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!cd!\%%A\Data\Global.xml" -art:"..\Art;..\..\..\Art" -audio:"..\Audio;..\..\..\Audio" -out:"!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data" -version:"_LanguagePack" -lowlod:"global_languagepack.manifest" !bps!

		::Global_LanguagePack manifest
		if exist "!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\Global_LanguagePack.manifest" if exist "!cd!\%%A\Assets\Global_LanguagePack" (
			"!sdk!\Tools\AssetMerger.exe" "!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\Global_LanguagePack.manifest" "!cd!\%%A\Assets\Global_LanguagePack"
			"!sdk!\Tools\StreamSorter.exe" "!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\Global_LanguagePack.manifest"
		)
		
		::Static manifest
		if exist "!sdk!\Compilation\Xbox360\Mods\%modname%\Data\Static%streamversion%.manifest" (
			set bps=-bps:"static%streamversion%.manifest,!sdk!\Compilation\Xbox360\Mods\%modname%\Data\Static%streamversion%.manifest"
		) else (
			set bps=-bps:"static_common_2.manifest,!sdk!\Game Files\Manifest\Static_Common_2.manifest"
		)
		
		::Static.xml
		if exist "!cd!\%%A\Data\Static.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!cd!\%%A\Data\Static.xml" -art:"..\Art;..\..\..\Art" -audio:"..\Audio;..\..\..\Audio" -out:"!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data" -version:"_LanguagePack" -lowlod:"static_languagepack.manifest" !bps!

		::Static_LanguagePack manifest
		if exist "!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\Static_LanguagePack.manifest" if exist "!cd!\%%A\Assets\Static_LanguagePack" (
			"!sdk!\Tools\AssetMerger.exe" "!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\Static_LanguagePack.manifest" "!cd!\%%A\Assets\Static_LanguagePack"
			"!sdk!\Tools\StreamSorter.exe" "!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\Static_LanguagePack.manifest"
		)
		
		::MapMetaData
		if exist "!sdk!\Compilation\Xbox360\Mods\%modname%\Data\MapMetaData%streamversion%.manifest" (
			set bps=-bps:"mapmetadata%streamversion%.manifest,!sdk!\Compilation\Xbox360\Mods\%modname%\Data\MapMetaData%streamversion%.manifest"
		) else (
			set bps=-bps:"mapmetadata.manifest,!sdk!\Game Files\Manifest\MapMetaData.manifest"
		)
		
		if exist "!cd!\%%A\Data\MapMetaData.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!cd!\%%A\Data\MapMetaData.xml" -art:"..\Art;..\..\..\Art" -audio:"..\Audio;..\..\..\Audio" -out:"!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data" -version:"_LanguagePack" -lowlod:"mapmetadata_languagepack.manifest" !bps!

		if exist "!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\MapMetaData_LanguagePack.manifest" if exist "!cd!\%%A\Assets\MapMetaData_LanguagePack" (
			"!sdk!\Tools\AssetMerger.exe" "!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\MapMetaData_LanguagePack.manifest" "!cd!\%%A\Assets\MapMetaData_LanguagePack"
			"!sdk!\Tools\StreamSorter.exe" "!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\MapMetaData_LanguagePack.manifest"
		)
		
		::MetaGame
		if exist "!sdk!\Compilation\Xbox360\Mods\%modname%\Data\MetaGame%streamversion%.manifest" (
			set bps=-bps:"metagame%streamversion%.manifest,!sdk!\Compilation\Xbox360\Mods\%modname%\Data\MetaGame%streamversion%.manifest"
		) else (
			set bps=-bps:"metagame.manifest,!sdk!\Game Files\Manifest\MetaGame.manifest"
		)
		
		if exist "!cd!\%%A\Data\MetaGame.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!cd!\%%A\Data\MetaGame.xml" -art:"..\Art;..\..\..\Art" -audio:"..\Audio;..\..\..\Audio" -out:"!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data" -version:"_LanguagePack" -lowlod:"metagame_languagepack.manifest" !bps!

		if exist "!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\MetaGame_LanguagePack.manifest" if exist "!cd!\%%A\Assets\MetaGame_LanguagePack" (
			"!sdk!\Tools\AssetMerger.exe" "!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\MetaGame_LanguagePack.manifest" "!cd!\%%A\Assets\MetaGame_LanguagePack"
			"!sdk!\Tools\StreamSorter.exe" "!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\MetaGame_LanguagePack.manifest"
		)
		
		::AptUI
		set dir=!cd!
		cd /D "!sdk!\Game Files\Manifest\AptUI"
		
		for %%B in ("*.manifest") do (
			if exist "!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\AptUI\%%~nB%streamversion%.manifest" (
				set bps=-bps:"aptui\%%~nB%streamversion%.manifest,!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\Aptui\%%~nB%streamversion%.manifest"
			) else (
				set bps=-bps:"aptui\%%~nB.manifest,!sdk!\Game Files\Manifest\AptUI\%%~nB.manifest"
			)
		
			if exist "!dir!\%%A\Data\AptUI\%%~nB.xml" "!sdk!\Tools\WrathEd.exe" -gameDefinition:"Kane's Wrath" -compile:"!dir!\%%A\Data\AptUI\%%~nB.xml" -art:"..\..\Art;..\..\..\..\Art" -audio:"..\..\Audio;..\..\..\..\Audio" -out:"!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\AptUI" -version:"_LanguagePack" !bps!
			
			if exist "!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\AptUI\%%~nB_LanguagePack.manifest" if exist "!dir!\%%A\Assets\AptUI\%%~nB" (
				"!sdk!\Tools\AssetMerger.exe" "!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\AptUI\%%~nB_LanguagePack.manifest" "!dir!\%%A\Assets\AptUI\%%~nB"
				"!sdk!\Tools\StreamSorter.exe" "!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data\AptUI\%%~nB_LanguagePack.manifest"
			)
		)
		
		::StringHashGenerator
		cd /D "!dir!"
		set dir=
		
		"!sdk!\Tools\StringHashGenerator.exe" "!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data" "!sdk!\Xbox360\Mods\%modname%\Data\StringHashes.xml"
		
		if exist "%cd%\Xbox360\Mods\%modname%\Data\StringHashes.xml" (
			if exist "!sdk!\Compilation\Xbox360\Mods\%modname%\Data\StringHashes%streamversion%.manifest" (
				set bps=-bps:"stringhashes%streamversion%.manifest,!sdk!\Compilation\Xbox360\Mods\%modname%\Data\stringhashes%streamversion%.manifest"
			) else (
				set bps=-bps:"stringhashes.manifest,!sdk!\Game Files\Manifest\StringHashes.manifest"
			)
		
			"%wrathed%" -gameDefinition:"Kane's Wrath" -compile:"%cd%\Xbox360\Mods\%modname%\Data\StringHashes.xml" -art:"..\Art" -audio:"..\Audio" -out:"!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A\Data" -version:"_LanguagePack" !bps!
			del "%cd%\Xbox360\Mods\%modname%\Data\StringHashes.xml" /F /Q
		)
		
		::MakeBig
		if exist "!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A" "!sdk!\Tools\MakeBig.exe" -f "!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A" -o:"%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%modversion%_Streams_%%A.big"
		if exist "!cd!\%%A\Misc" "!sdk!\Tools\MakeBig.exe" -f "!cd!\%%A\Misc" -o:"!sdk!\Compilation\Xbox360\Mods\%modname%\LanguagePacks\%%A" -o:"%mydocs%\%userdataleaf%\Mods\%modname%\%modname%_%modversion%_Misc_%%A.big"
	)
	
	cd /D "!sdk!"
	set sdk=
)

endlocal EnableDelayedExpansion

pause
exit /b

:eof