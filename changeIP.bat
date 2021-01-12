@ECHO off
cls
:start
ECHO.
ECHO 1. Change Connection1 Static IP 
ECHO 2. Change DHCP 
ECHO 3. Check IP
ECHO 4. Exit
set choice=
set /p choice=Type the number to print text.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto con1
if '%choice%'=='2' goto autosearch
if '%choice%'=='3' goto checkIp
if '%choice%'=='4' goto end
ECHO "%choice%" is not valid, try again
ECHO.
goto start
:con1
ECHO Connecting Connection 1
netsh interface ip set address "乙太網路" static 192.168.0.10 255.255.255.0 192.168.0.1 1
goto start

:checkIp
ECHO Checking IP
netsh interface ip show address "乙太網路"
goto start

:autosearch
ECHO obtaining auto IP
netsh interface ip  set address "乙太網路" source=dhcp
ipconfig /renew "乙太網路"
goto start

:bye
ECHO BYE
goto end

:end