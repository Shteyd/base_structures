@echo off

set /p name="Enter package name: "

IF EXIST .\%name% CD %name%
CD .\lib

RMDIR /s /q .\data
RMDIR /s /q .\domain
RMDIR /s /q .\presentation
