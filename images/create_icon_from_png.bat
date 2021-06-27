@ECHO OFF

SET IMC=C:\Program Files (x86)\Jenkins Media\JM Tools\3rdparty\ImageMagick-7.0.3-6-portable-Q16-x64\convert.exe

REM FOR /R %%G IN (*.png) DO (

	REM "%IMC%" "%%G" -resize 256x256 "%%~dpG\%%~nG_256.png"
	REM "%IMC%" "%%G" -resize 128x128 "%%~dpG\%%~nG_128.png"
	REM "%IMC%" "%%G" -resize 96x96 "%%~dpG\%%~nG_96.png"
	REM "%IMC%" "%%G" -resize 64x64 "%%~dpG\%%~nG_64.png"
	REM "%IMC%" "%%G" -resize 48x48 "%%~dpG\%%~nG_48.png"
	REM "%IMC%" "%%G" -resize 32x32 "%%~dpG\%%~nG_32.png"
	REM "%IMC%" "%%G" -resize 16x16 "%%~dpG\%%~nG_16.png"
	
	REM "%IMC%" "%%~dpG\%%~nG_16.png" "%%~dpG\%%~nG_32.png" "%%~dpG\%%~nG_48.png" "%%~dpG\%%~nG_64.png" "%%~dpG\%%~nG_96.png" "%%~dpG\%%~nG_128.png" "%%~dpG\%%~nG_256.png" "%%~dpnG.ico"

REM )


"%IMC%" "%1" -resize 256x256 "%~dp1\%~n1_256.png"
"%IMC%" "%1" -resize 128x128 "%~dp1\%~n1_128.png"
"%IMC%" "%1" -resize 96x96 "%~dp1\%~n1_96.png"
"%IMC%" "%1" -resize 64x64 "%~dp1\%~n1_64.png"
"%IMC%" "%1" -resize 48x48 "%~dp1\%~n1_48.png"
"%IMC%" "%1" -resize 32x32 "%~dp1\%~n1_32.png"
"%IMC%" "%1" -resize 16x16 "%~dp1\%~n1_16.png"

"%IMC%" "%~dp1\%~n1_16.png" "%~dp1\%~n1_32.png" "%~dp1\%~n1_48.png" "%~dp1\%~n1_64.png" "%~dp1\%~n1_96.png" "%~dp1\%~n1_128.png" "%~dp1\%~n1_256.png" "%~dpn1.ico"


PAUSE