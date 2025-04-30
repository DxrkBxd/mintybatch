@echo off
mode 80,20
title Network Stats [V1]

echo.
echo Loading Network Information...

:loop

	for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "SSID" ^| findstr /v "BSSID"') do set ssid=%%a
	for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "Description"') do set adapter=%%a
	for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "Signal"') do set signal=%%a

	ping -n 3 8.8.8.8>%temp%\ping.txt

	for /f "tokens=4 delims==" %%a in ('type %temp%\ping.txt ^| find "Moyenne"') do set ping=%%a
	for /f "tokens=10 delims= " %%a in ('type %temp%\ping.txt ^| find "perdus"') do set ploss=%%a
	for /f "tokens=2 delims= " %%a in ('netstat -e ^| find "Octets"') do set rbytes=%%a
	for /f "tokens=3 delims= " %%a in ('netstat -e ^| find "Octets"') do set sbytes=%%a

	set /a r1bytes=%rbytes%/1000000
	set /a s1bytes=%sbytes%/1000000
	set /a r2bytes=%rbytes%/1000
	set /a s2bytes=%sbytes%/1000
 
	cls
	color 3
	echo.
	echo  Network State :
	echo  --------------------
	echo.
	echo   SSID :%ssid%
	echo   N.I.C (Network Interface Card) :%adapter%
	echo   Signal :%signal%
	echo.
	echo  Speed :
	echo  --------------------
	echo.
	echo   Ping :%ping%
	echo   Packet Loss : %ploss%
	echo   Received : %r1bytes% Mo (%r2bytes% ko)
	echo   Sent : %s1bytes% Mo (%s2bytes% ko)

goto loop