@echo off

SET /p name="Enter package name: "

IF EXIST .\%name% CD %name%

RMDIR /s /q .\