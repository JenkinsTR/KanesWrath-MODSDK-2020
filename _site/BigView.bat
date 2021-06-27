@echo off
cd /D "%~dp0Tools"

start "" /D "%cd%" /MAX "%cd%\WrathEd.exe" -bigview -gamedefinition:"Kane's Wrath"
:: or just double-click the exe