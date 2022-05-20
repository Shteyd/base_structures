@echo off

set help = false
set new = false

IF "%1" == "-h" set help=true
IF "%1" == "--help" set help=true
if "%help%" == "true" GOTO get_help

set /p name="Enter project name: "

IF "%1" == "-n" set new=true
IF "%1" == "--new" set new=true
if "%new%" == "true" GOTO new_project

GOTO project
exit


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
