@echo off
:: This script uses curl to download a file from GitHub
set "url=https://github.com/user/repository/releases/download/v1.0/file.zip"
set "destination=%userprofile%\Desktop\file.zip"

:: Check if curl is available
where curl >nul 2>nul
if %errorlevel% neq 0 (
    echo curl is not installed. Exiting.
    pause
    exit /b
)

:: Download the file
echo Downloading file from GitHub...
curl -L -o "%destination%" "%url%"

:: Check if the file was downloaded successfully
if exist "%destination%" (
    echo Download complete: %destination%
) else (
    echo Download failed.
)
pause