@echo off
title SYSTEM EXORCISM - Controlled Lethal Repair
color 0C

:: === ADMIN CHECK ===
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo [!] RUN AS ADMIN OR IT DOES NOTHING.
    pause
    exit /b
)

echo.
echo =========================================
echo   SYSTEM EXORCISM INITIATED
echo   Windows is about to behave.
echo =========================================
timeout /t 2 >nul

:: === STOP NOISY SERVICES ===
echo [+] Stopping services...
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
net stop dosvc >nul 2>&1

:: === KILL EXPLORER ===
taskkill /f /im explorer.exe >nul 2>&1

:: === TEMP / CACHE PURGE ===
echo [+] Purging temp and cache...
del /f /s /q "%TEMP%\*" >nul 2>&1
rd /s /q "%TEMP%" >nul 2>&1
mkdir "%TEMP%" >nul 2>&1

del /f /s /q "C:\Windows\Temp\*" >nul 2>&1
del /f /s /q "C:\Windows\Prefetch\*" >nul 2>&1

:: === WINDOWS UPDATE CACHE ===
echo [+] Clearing Windows Update cache...
rd /s /q "C:\Windows\SoftwareDistribution" >nul 2>&1
mkdir "C:\Windows\SoftwareDistribution" >nul 2>&1

:: === BROWSER JUNK ===
echo [+] Clearing browser caches...
for %%B in (
  "%LocalAppData%\Google\Chrome\User Data\Default\Cache"
  "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache"
) do (
  rd /s /q "%%~B" >nul 2>&1
)

:: === ICON + THUMB CACHE ===
echo [+] Resetting icon cache...
del /f /q "%LocalAppData%\Microsoft\Windows\Explorer\iconcache*" >nul 2>&1
del /f /q "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache*" >nul 2>&1

:: === RAM STANDBY PURGE ===
echo [+] Purging RAM standby list...
powershell -command "Clear-RecycleBin -Force" >nul 2>&1
powershell -command "[System.GC]::Collect()" >nul 2>&1

:: === COMPONENT STORE CLEAN (SAFE MODE) ===
echo [+] Cleaning component store (safe)...
DISM /Online /Cleanup-Image /StartComponentCleanup >nul

:: === SYSTEM FILE REPAIR ===
echo [+] Running SFC...
sfc /scannow

:: === RESTART SERVICES ===
echo [+] Restarting services...
net start wuauserv >nul 2>&1
net start bits >nul 2>&1
net start dosvc >nul 2>&1

:: === RESTART EXPLORER ===
start explorer.exe

echo.
echo =========================================
echo   EXORCISM COMPLETE
echo   Reboot recommended.
echo =========================================
pause
