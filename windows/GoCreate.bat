@echo off

SET help = false
SET new = false


IF "%1" == "-h" SET help=true
IF "%1" == "--help" SET help=true
IF "%help%" == "true" GOTO get_help


SET /p name="Enter package name: "


IF "%1" == "-n" SET new=true
IF "%1" == "--new" SET new=true
IF "%new%" == "true" GOTO new_pkg


GOTO pkg
EXIT

:new_pkg
MKDIR .\%name%
CD %name%

GOTO base_struct

:pkg
IF EXIST .\%name% CD .\%name%
GOTO base_struct

:base_struct
MKDIR .\cmd
MKDIR .\pkg
MKDIR .\internal\config
MKDIR .\internal\core
MKDIR .\internal\service
MKDIR .\internal\storage
MKDIR .\internal\transport

go mod init github.com/Shteyd/%name%

echo package main>.\cmd\main.go
echo .env>.\.gitignore
echo.>.\docker-compose.yml
echo.>.\DockerFile
echo # %name%>.\README.md

EXIT

:get_help
echo -h, --help
echo    Prints out the help menu.
echo:
echo -n, --new
echo    Create new project.
echo:
echo without flags
echo    Create base struct in project.
echo:
EXIT
