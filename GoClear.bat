@echo off

set /p name="Enter package name: "

IF EXIST .\%name% CD %name%

RMDIR /s /q .\cmd
RMDIR /s /q .\pkg
RMDIR /s /q .\ui

IF EXIST .\go.mod DEL /F .\go.mod