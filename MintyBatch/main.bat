@echo off
:st

setlocal enabledelayedexpansion
mode 110,25
title - Minty Batch

for /f "tokens=2 delims=:" %%A in ('ipconfig ^| findstr /i "IPv4"') do (
	set "ip=%%A"
)

cd %~dp0firstLaunch
if not exist "chcp.txt" (
			echo done >> chcp.txt
			echo.
			echo   [91mConfiguration CHCP...[0m
			chcp 65001 >nul
			ping -n 3 8.8.8.8 >nul
)

cd %~dp0\commands
if exist "ms-command.txt" (
	del /q /f "%~dp0commands\ms-command.txt" >nul
)
if exist "ip-command.txt" (
	del /q /f "%~dp0commands\ip-command.txt" >nul
)

call :banner

:banner

	cls
	chcp 65001 >nul
	cd %~dp0
	
	echo.
	echo.
	echo	  	[38;2;0;31;77m███╗   ███╗██╗███╗   ██╗████████╗██╗   ██╗    ██████╗  █████╗ ████████╗ ██████╗██╗  ██╗[0m
	echo	  	[38;2;0;61;153m████╗ ████║██║████╗  ██║╚══██╔══╝╚██╗ ██╔╝    ██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██║  ██║[0m
	echo	  	[38;2;0;102;204m██╔████╔██║██║██╔██╗ ██║   ██║    ╚████╔╝     ██████╔╝███████║   ██║   ██║     ███████║[0m
	echo	  	[38;2;51;153;255m██║╚██╔╝██║██║██║╚██╗██║   ██║     ╚██╔╝      ██╔══██╗██╔══██║   ██║   ██║     ██╔══██║[0m
	echo	  	[38;2;51;153;255m██║ ╚═╝ ██║██║██║ ╚████║   ██║      ██║       ██████╔╝██║  ██║   ██║   ╚██████╗██║  ██║[0m
	echo	  	[38;2;179;229;255m╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝   ╚═╝      ╚═╝       ╚═════╝ ╚═╝  ╚═╝   ╚═╝    ╚═════╝╚═╝  ╚═╝[0m
	echo.
	echo 		[1;36mBEST BATCH[0;36m multitool made by [1;36mNEKOZ[0;36m.[0;0m
	echo.
	:return

set input= 
set /p input="[0m╚══> [38;2;144;238;144m"[0;0m

if /i "%input%"=="" ( 
	goto :banner
)
if /i "%input%"=="clear" (
	goto :banner
)
if /i "%input%"=="random" (
	echo.
	set /p min="[1;92m min ╔═> [0;0m"
	set /p max="[1;92m max ╚═> [0;0m"
	echo.
	set /a range=max - min + 1
	set /a rand=%RANDOM% %% range + min
	echo  [1;92mRandom number : !rand![0m
	echo.
)
if /i "%input%"=="ms" (
	:ms
	cd %~dp0commands
	if not exist "ms-command.txt" (
		echo done >> ms-command.txt
		for /f "tokens=4 delims==" %%a in ('ping -n 3 8.8.8.8 ^| find "Moyenne"') do set ping=%%a
		goto ms
	) else (
		for /f "tokens=4 delims==" %%a in ('ping -n 3 8.8.8.8 ^| find "Moyenne"') do set ping=%%a
		echo  [1;92mPing :%ping%[0m
	)
)
if /i "%input%"=="version" (
	echo [1;92mVersion : V1.3
)
if /i "%input%"=="credits" (
	echo [1;92mCredits : All rights for Nekoz, ® 2025 Nekoz
)
if /i "%input%"=="reduce" (
	cd %~dp0
	if not "%1"=="min" (
		start minimize.vbs
	)
)
if /i "%input%"=="ip" (
	echo [1;92mIPv4 : %ip%[0m
	:ip
	cd %~dp0commands
	if not exist "ip-command.txt" (
		echo Done >> ip-command.txt
		curl -s https://api.ipify.org > "%TEMP%\myip.txt"
		set /p ip2=<"%TEMP%\myip.txt"
		del "%TEMP%\myip.txt"
		goto ip
	) else (
		echo [1;92mPublic IP : %ip2%[0m
	)
)
if /i "%input%"=="ls" (
	echo. [1;92
	cd %~dp0
	tree /f | findstr /v /r "^$" | findstr /v "Répertoire"
)
if /i "%input%"=="IPV4" (
	echo [1;92mIPv4 : %ip%[0m
)
if /i "%input%"=="netst" (
	cd %~dp0prog
	start netst.bat
	echo [1;92mNETST.bat executed successfully.[0m
)
if /i "%input%"=="help" (
	cls
	ping -n 1 8.8.8.8 >nul
	echo.
	echo		[0m╔══════════╗
	echo		[0m║   HELP   ║
	echo		[0m╚══════════╝
	echo.
	ping -n 1 8.8.8.8 >nul
	echo  [38;2;144;238;144mclear - clear the page[0m
	ping -n 1 8.8.8.8 >nul
	echo  [38;2;144;238;144mms - shows your ping[0m
	ping -n 1 8.8.8.8 >nul
	echo  [38;2;144;238;144mip, IPV4 - shows your ip[0m
	ping -n 1 8.8.8.8 >nul
	echo  [38;2;144;238;144mrestart - restart the multitool[0m
	ping -n 1 8.8.8.8 >nul
	echo  [38;2;144;238;144mtasks - open taskmgr.exe[0m
	ping -n 1 8.8.8.8 >nul
	echo  [38;2;144;238;144mexit - close the multitool[0m
	ping -n 1 8.8.8.8 >nul
	echo  [38;2;144;238;144mversion - shows the version of the multitool[0m
	ping -n 1 8.8.8.8 >nul
	echo  [38;2;144;238;144mcredits - shows the credits[0m
	ping -n 1 8.8.8.8 >nul
	echo  [38;2;144;238;144mnetst - open a terminal with the network informations[0m
	ping -n 1 8.8.8.8 >nul
	echo  [38;2;144;238;144mrandom - shows a random number in range between two number[0m
	ping -n 1 8.8.8.8 >nul
	echo  [38;2;144;238;144mls - show the differents files and folders that compose the multitool[0m
	echo.
	pause >nul
	cls 
	goto :banner
)
if /i "%input%"=="tasks" (
	echo [1;92mTASKMGR.exe executed successfully.[0m
	start taskmgr.exe
)
if /i "%input%"=="panel" (
	cls
	echo.
	echo [33m Entering Panel.
	echo.
	ping -n 1 8.8.8.8 >nul
	cls
	echo.
	echo [33m Entering Panel..
	echo.
	ping -n 1 8.8.8.8 >nul
	cls
	echo.
	echo [33m Entering Panel...
	echo.
	ping -n 3 8.8.8.8 >nul
	cls
	call :panel
)
if /i "%input%"=="restart" (
	cd %~dp0
	start main.bat
	exit
)
if /i "%input%"=="exit" (
	exit
)
if not "%input%"=="" if not "%input%"=="clear" if not "%input%"=="ms" if not "%input%"=="ip" if not "%input%"=="help" if not "%input%"=="IPV4" if not "%input%"=="restart" if not "%input%"=="tasks" if not "%input%"=="panel" if not "%input%"=="random" if not "%input%"=="version" if not "%input%"=="credits" if not "%input%"=="netst" if not "%input%"=="ls" if not "%input%"=="reduce" (
	echo [38;2;139;0;0m "%input%" is not a command, type help to know more. 
)
goto :return



:panel
title - Minty Batch [PANEL]
echo.
echo		[38;5;196m██████╗  █████╗ ███╗   ██╗███████╗██╗          
echo		[38;5;202m██╔══██╗██╔══██╗████╗  ██║██╔════╝██║         
echo		[38;5;208m██████╔╝███████║██╔██╗ ██║█████╗  ██║        
echo		[38;5;214m██╔═══╝ ██╔══██║██║╚██╗██║██╔══╝  ██║            
echo		[38;5;220m██║     ██║  ██║██║ ╚████║███████╗███████╗  
echo		[38;5;226m╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝[0m
echo.
:cmd
set /p input="╚══> "
if /i "%input%"=="clone" (
	start main.bat
)
if /i "%input%"=="off -n" (
	shutdown /t 1
)
if /i "%input%"=="off -a" (
	shutdown /t 120
)
if /i "%input%"=="term" (
	start cmd.exe
)
if /i "%input%"=="cls --all" (
	cls
	goto panel
)
if /i "%input%"=="kill -i" (
	exit
)
if /i "%input%"=="exit" (
	goto :st
)
if not "%input%"=="clone" if not "%input%"=="off -n" if not "%input%"=="off -a" if not "%input%"=="term" if not "%input%"=="cls --all" (
	echo.
)
goto cmd