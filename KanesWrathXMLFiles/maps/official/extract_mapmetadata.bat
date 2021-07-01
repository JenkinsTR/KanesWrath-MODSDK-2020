@ECHO OFF

SETLOCAL EnableDelayedExpansion

SET OUTXML=%~dp0\MapMetaData.xml

TYPE "MapMetaData_header.xml">"%OUTXML%"

FOR /R %%G IN (*map.xml) DO (

	COPY "%~dp0\extract_mapmetadata.ps1" "%%~dpG\extract_mapmetadata.ps1"
	
	PUSHD "%%~dpG"
	powershell -file "%%~dpG\extract_mapmetadata.ps1"
	POPD

	DEL "%%~dpG\extract_mapmetadata.ps1" /F /Q
	
	TYPE "%%~dpG\MapMetaData.xml">>"%OUTXML%"
	ECHO.>>"%OUTXML%"
)

TYPE "MapMetaData_footer.xml">>"%OUTXML%"

ENDLOCAL EnableDelayedExpansion

PAUSE
EXIT /B

:eof