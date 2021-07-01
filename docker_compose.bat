@ECHO OFF

PUSHD "%~dp0"
docker-compose build --no-cache && docker-compose up

PAUSE