@echo off

set help = false
set new = false


IF "%1" == "-h" set help=true
IF "%1" == "--help" set help=true
if "%help%" == "true" GOTO get_help


set /p name="Enter package name: "


IF "%1" == "-n" set new=true
IF "%1" == "--new" set new=true
if "%new%" == "true" GOTO new_pkg


GOTO pkg
exit

:new_pkg
MKDIR .\%name%
CD %name%

GOTO base_struct

:pkg
IF EXIST .\%name% CD .\%name%
GOTO base_struct

:base_struct
MKDIR .\cmd
MKDIR .\pkg\models
MKDIR .\pkg\server
MKDIR .\pkg\service
MKDIR .\pkg\handler
MKDIR .\pkg\repository
MKDIR .\ui

go mod init github.com/Shteyd/%name%

echo "package main">.\cmd\main.go
echo "package server">.\pkg\server\server.go
echo "package service">.\pkg\service\service.go
echo "package handler">.\pkg\handler\handler.go

exit

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
exit
