@echo off

SET help = false
SET new = false

IF "%1" == "-h" SET help=true
IF "%1" == "--help" SET help=true
IF "%help%" == "true" GOTO get_help

SET /p name="Enter project name: "

IF "%1" == "-n" SET new=true
IF "%1" == "--new" SET new=true
if "%new%" == "true" GOTO new_project

GOTO project
EXIT


:new_project
flutter create %name%
CD %name%

GOTO base_struct


:project
IF EXIST .\%name% CD .\%name%
GOTO base_struct


:base_struct
CD .\lib

MKDIR .\utils
MKDIR .\data\features
MKDIR .\data\api
MKDIR .\data\db
MKDIR .\data\utils
MKDIR .\domain\features
MKDIR .\presentation\pages
MKDIR .\presentation\widgets

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
