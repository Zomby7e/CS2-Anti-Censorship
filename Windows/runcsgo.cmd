@echo off
setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
chcp 65001
color a
@REM Get CS2 installation path from registry
for /f "delims=" %%a in ('"reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 730" | find "InstallLocation""') do (set reg_csgopath=%%a)
@REM Locate steam.exe from registry
for /f "tokens=2*" %%A in ('reg query "HKCU\Software\Valve\Steam" /v SteamExe 2^>nul') do (
    set "steam_exe=%%B"
)
@REM Remove extra quotes (if any)
set "steam_exe=!steam_exe:"=!"

@REM Run Perfect World version silently
if "%1"=="perfectworld_silent" goto perfectworld_silent

:menu
mode con cols=80 lines=25
cls
title CS2 Simple Tool
echo ------------------------------------------
echo Counter-Strike 2 - Simple Tool
echo ------------------------------------------
echo [w] Launch the original CS2.
echo [p] Perfectworld with Auto anti-censorship
echo.
echo [1] Anti-censorship on
echo [2] Anti-censorship off
echo.
echo [d] Delete all "censorship" patch.
echo [c] Open CS2 cfg folder
echo [v] Fix VAC
echo [f] Verify integrity of game files
echo.
echo [h] Help
echo [q] Quit
echo ------------------------------------------

set /p user_input=choose function:
if "%user_input%"=="1" goto case1
if "%user_input%"=="2" goto case2
if "%user_input%"=="d" goto d
if "%user_input%"=="h" goto help
if "%user_input%"=="q" goto quit
if "%user_input%"=="p" goto perfectworld
if "%user_input%"=="w" goto worldwide
if "%user_input%"=="c" goto opencfgdir
if "%user_input%"=="v" goto vacfix_0
if "%user_input%"=="v" goto verify_files

:help
title Information
cls
echo ------------------------------------------
echo A simple script for CS2 on Windows.(%~nx0)
echo.
echo simply type a letter and press Enter to use the function.
echo If it displays "The system cannot find the specified file"
echo Those files may be lost or you run this program repeatedly
echo.
echo This tool is specifically for
echo the special version of CS2 in mainland China.
echo The anti-censorship feature does not guarantee a complete
echo restoration of the international server's experience.
echo This tool is provided without any warranties.
echo.
echo Your CS2 installation path:
echo %reg_csgopath:~33%
echo Location of steam.exe:
echo "!steam_exe!"
echo.
echo The "censorship" functionalities
echo are located in the following path:
echo %reg_csgopath:~33%\game\csgo_lv
echo (deletion renders them ineffective)
echo ------------------------------------------
pause
goto menu

:case1
cls
echo [Rename files] Anti-censorship on
echo.
echo Renaming files
echo.
ren "%reg_csgopath:~33%\game\csgo_lv" "csgo_lv.backup"
echo [Finished] Please check the console for any error messages.
echo.
pause
goto menu

:case2
cls
echo [Rename files] revert to original
echo.
echo Renaming files
echo.
ren "%reg_csgopath:~33%\game\csgo_lv.backup" "csgo_lv"
echo [Finished] Please check the console for any error messages.
echo.
pause
goto menu

:d
mode con cols=120 lines=30
cls
echo [Delete files] Delete all "censorship" patch.
echo.
echo Deleting files
echo.
del "%reg_csgopath:~33%\game\csgo_lv"
echo.
echo [Finished] Please check the console for any error messages.
echo [Note] If the game encounters errors,
echo checking the file integrity should restore it.
echo.
pause
goto menu

:opencfgdir
cls
explorer "%reg_csgopath:~33%\game\csgo\cfg"
echo The game's config file path has been opened in a new window.
pause
cls
goto menu

:perfectworld
cls
ren "%reg_csgopath:~33%\game\csgo_lv" "csgo_lv.backup"
start /min cmd /c "%0 perfectworld_silent"
exit

:perfectworld_silent
cls
echo Do not close this window, Enjoy your game.
start "" "!steam_exe!" -applaunch 730 -perfectworld
timeout 30
ren "%reg_csgopath:~33%\game\csgo_lv.backup" "csgo_lv"
exit

:worldwide
start "" "!steam_exe!" -applaunch 730 -worldwide
exit

:vacfix_0
title Fix VAC function
echo "Fix VAC function -by Sniper Ricky from Baidu Post Bar"
 >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
echo "Request admin rights"
goto UACPrompt
 ) else ( goto vacfix_1 )

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B

:vacfix_1
for /f "delims=" %%a in ('"reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 730" | find "UninstallString""') do (set reg_steampath=%%a)
cd /d %reg_steampath:~34,-32%\bin
cls
echo [VAC fix]confirm
echo Steam Installation path: %reg_steampath:~34,-32%
echo.
pause
cls
echo [VAC fix]Start
echo.
steamservice.exe /install
echo.
steamservice.exe /repair
echo.
echo [VAC fix]Over
echo.
pause
goto menu

:verify_files
cls
start steam://validate/730
echo [OK] Verifying in background
pause
goto menu

:quit
endlocal
exit