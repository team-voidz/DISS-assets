@echo off
:downloadfront
COLOR 02
cls
:::1      DDDDDDDDDDDDD      IIIIIIIIII   SSSSSSSSSSSSSSS    SSSSSSSSSSSSSSS
:::1      D::::::::::::DDD   I::::::::I SS:::::::::::::::S SS:::::::::::::::S
:::1      D:::::::::::::::DD I::::::::IS:::::SSSSSS::::::SS:::::SSSSSS::::::S
:::1      DDD:::::DDDDD:::::DII::::::IIS:::::S     SSSSSSSS:::::S     SSSSSSS
:::1         D:::::D    D:::::D I::::I  S:::::S            S:::::S
:::1         D:::::D     D:::::DI::::I  S:::::S            S:::::S
:::1         D:::::D     D:::::DI::::I   S::::SSSS          S::::SSSS
:::1         D:::::D     D:::::DI::::I    SS::::::SSSSS      SS::::::SSSSS
:::1         D:::::D     D:::::DI::::I      SSS::::::::SS      SSS::::::::SS
:::1         D:::::D     D:::::DI::::I         SSSSSS::::S        SSSSSS::::S
:::1         D:::::D     D:::::DI::::I              S:::::S            S:::::S
:::1         D:::::D    D:::::D I::::I              S:::::S            S:::::S
:::1      DDD:::::DDDDD:::::DII::::::IISSSSSSS     S:::::SSSSSSSS     S:::::S
:::1      D:::::::::::::::DD I::::::::IS::::::SSSSSS:::::SS::::::SSSSSS:::::S
:::1      D::::::::::::DDD   I::::::::IS:::::::::::::::SS S:::::::::::::::SS
:::1       DDDDDDDDDDDDD      IIIIIIIIII SSSSSSSSSSSSSSS    SSSSSSSSSSSSSSS
for /f "delims=:::1 tokens=*" %%A in ('findstr /b :::1 "%~f0"') do @echo(%%A
echo.
echo	                  CLEAN, DELETE AND BACKUP
echo.
if exist "%~dp0\DISS_A\temp0\DISS_Version.diss" (
    rename %~dp0\DISS_A\temp0\DISS_Version.diss DISS_Version.txt
    copy "%~dp0\DISS_A\temp0\DISS_Version.txt" "%~dp0\DISS_A\DISS_Version.txt"
    )
powershell write-host -back Red These File have been installed into your SD CARD.
powershell Get-Content %~dp0\DISS_A\DISS_Version.txt 
powershell write-host -back Red .................................................
echo.
echo.
if exist "%~dp0\DISS_A\assets" (RD /s /q "%~dp0\DISS_A\assets")
if exist "%~dp0\DISS_A\hekate" (RD /s /q "%~dp0\DISS_A\hekate")
if exist "%~dp0\DISS_A\cfw" (RD /s /q "%~dp0\DISS_A\cfw")
if exist "%~dp0\DISS_A\trash" (RD /s /q "%~dp0\DISS_A\trash")
if exist "%~dp0\DISS_A\temp0" (RD /s /q "%~dp0\DISS_A\temp1")
if exist "%~dp0\DISS_A\temp1" (RD /s /q "%~dp0\DISS_A\temp1")
if exist "%~dp0\DISS" (RD /s /q "%~dp0\DISS")
powershell -command "Compress-Archive -Path DISS_B\ -Destination DISS_OLDSD.zip"  -verbose -Force
TIMEOUT /T 2
powershell -command "Compress-Archive -Path DISS_A\ -Destination DISS_ABCBackups.zip"  -verbose -Force
RD /s /q C:\dissbackup\
md C:\dissbackup\
if exist "%~dp0\DISS_ABCBackups.zip" (
    copy "%~dp0\DISS_ABCBackups.zip" "C:\dissbackup\DISS_ABCBackups.zip"
    )
if exist "%~dp0\DISS_OLDSD.zip" (
    copy "%~dp0\DISS_OLDSD.zip" "C:\dissbackup\DISS_OLDSD.zip"
    )	
if exist "%~dp0\DISS_ABCBackups.zip" (
    copy "%~dp0\DISS_ABCBackups.zip" "C:\dissbackup\DISS_ABCBackups.zip"
    )
if exist "%~dp0\DISS_A\temp0\DISS_Version.txt" (
    copy "%~dp0\DISS_A\temp0\DISS_Version.txt" "C:\dissbackup\DISS_Version.txt"
    )	
if exist "%~dp0\DISS_B" (RD /s /q "%~dp0\DISS_B")
TIMEOUT /T 1
DEL Clean_Clean.bat
DEL DISS_downloader.bat
RD /s /q DISS_A
pause
del %0