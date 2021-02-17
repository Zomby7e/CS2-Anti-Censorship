@echo off
chcp 65001
color a
for /f "delims=" %%a in ('"reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 730" | find "InstallLocation""') do (set reg_csgopath=%%a)


:menu
mode con cols=50 lines=25
cls
title CS:GO Simple Tool
echo ------------------------------------------
echo Counter-Strike Global Offensive - Simple Tool
echo ------------------------------------------
echo [1] All anti-harmony(recommend)
echo [2] Cancel all anti-harmony(recommend)
echo.
echo [v] Turn off "low violence mode"
echo [b] Red blood
echo [e] English voice
echo.
echo [d] Delete all "harmony" patch.
echo [c] Overwrite the config file.
echo.
echo [w] Launch the "perfectworld" version of CS:GO.
echo [p] Launch the CS:GO.
echo [fix] Fix VAC
echo.
echo [h] Help
echo [0] Exit
echo ------------------------------------------

set /p user_input=choose function:
if "%user_input%"=="1" goto case1
if "%user_input%"=="2" goto case2
if "%user_input%"=="v" goto v
if "%user_input%"=="b" goto b
if "%user_input%"=="e" goto e
if "%user_input%"=="d" goto d
if "%user_input%"=="h" goto help
if "%user_input%"=="0" goto 0
if "%user_input%"=="p" goto perfectworld
if "%user_input%"=="w" goto worldwide
if "%user_input%"=="c" goto copycfg
if "%user_input%"=="fix" goto vacfix_0

:help
title Information
cls
echo ------------------------------------------
echo A simple script for CS:GO on Windows.
echo.
echo simply type a letter and press Enter to use the function.
echo If it displays "The system cannot find the specified file"
echo Those files may be lost or you run this program repeatedly
echo.
echo ·By default, the perfect world version of CSGO will have black blood.
echo ·By default, the perfect world version of CSGO will have Chinese voice.
echo.
echo Your CS:GO installation path:
echo %reg_csgopath:~33%
echo ------------------------------------------
pause
goto menu

:case1
cls
echo All anti-harmony
echo.
echo Turn off "low violence mode"
echo.
ren "%reg_csgopath:~33%\csgo\pakxv_lowviolence_000.vpk"   pakxv_lowviolence_000.bak
ren "%reg_csgopath:~33%\csgo\pakxv_lowviolence_dir.vpk"     pakxv_lowviolence_dir.bak
echo.
echo Disable Chinese voice.
echo.
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_000.vpk"  pakxv_audiochinese_000.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_001.vpk"  pakxv_audiochinese_001.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_002.vpk"  pakxv_audiochinese_002.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_003.vpk"  pakxv_audiochinese_003.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_004.vpk"  pakxv_audiochinese_004.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_dir.vpk"   pakxv_audiochinese_dir.bak
echo.
echo Red blood.
echo.
ren "%reg_csgopath:~33%\csgo\pakxv_perfectworld_000.vpk"  pakxv_perfectworld_000.bak
ren "%reg_csgopath:~33%\csgo\pakxv_perfectworld_001.vpk"  pakxv_perfectworld_001.bak
ren "%reg_csgopath:~33%\csgo\pakxv_perfectworld_dir.vpk"  pakxv_perfectworld_dir.bak
echo.
echo [Over]You can check the console.
echo.
pause
goto menu

:case2
cls
echo Cancel all anti-harmony.
echo.
echo Restore "low violence mode" files
echo.
ren "%reg_csgopath:~33%\csgo\pakxv_lowviolence_000.bak"   pakxv_lowviolence_000.vpk
ren "%reg_csgopath:~33%\csgo\pakxv_lowviolence_dir.bak"   pakxv_lowviolence_dir.vpk
echo.
echo Chinese voice.
echo.
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_000.bak"  pakxv_audiochinese_000.vpk
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_001.bak"  pakxv_audiochinese_001.vpk
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_002.bak"  pakxv_audiochinese_002.vpk
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_003.bak"  pakxv_audiochinese_003.vpk
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_004.bak"  pakxv_audiochinese_004.vpk
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_dir.bak"  pakxv_audiochinese_dir.vpk
echo.
echo black blood.
echo.
ren "%reg_csgopath:~33%\csgo\pakxv_perfectworld_000.bak"  pakxv_perfectworld_000.vpk
ren "%reg_csgopath:~33%\csgo\pakxv_perfectworld_001.bak"  pakxv_perfectworld_001.vpk
ren "%reg_csgopath:~33%\csgo\pakxv_perfectworld_dir.bak"  pakxv_perfectworld_dir.vpk
echo.
echo [Over]You can check the console.
echo.
pause
goto menu

:v
cls
echo Turn off "low violence mode"
echo.
ren "%reg_csgopath:~33%\csgo\pakxv_lowviolence_000.vpk"   pakxv_lowviolence_000.bak
ren "%reg_csgopath:~33%\csgo\pakxv_lowviolence_dir.vpk"     pakxv_lowviolence_dir.bak
echo.
echo [Over]You can check the console.
echo.
pause
goto menu

:b
cls
Echo Red blood.
echo.
ren "%reg_csgopath:~33%\csgo\pakxv_perfectworld_000.vpk"  pakxv_perfectworld_000.bak
ren "%reg_csgopath:~33%\csgo\pakxv_perfectworld_001.vpk"  pakxv_perfectworld_001.bak
ren "%reg_csgopath:~33%\csgo\pakxv_perfectworld_dir.vpk"  pakxv_perfectworld_dir.bak
echo.
echo [Over]You can check the console.
echo.
pause
goto menu

:e
cls
Echo English voice.
echo.
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_000.vpk"  pakxv_audiochinese_000.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_001.vpk"  pakxv_audiochinese_001.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_002.vpk"  pakxv_audiochinese_002.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_003.vpk"  pakxv_audiochinese_003.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_004.vpk"  pakxv_audiochinese_004.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_dir.vpk"   pakxv_audiochinese_dir.bak
echo.
echo [Over]You can check the console.
echo.
pause
goto menu

:d
mode con cols=120 lines=30
cls
echo Delete all "harmony" patch.
echo.
echo Delete "low violence mode" files.
echo.
del "%reg_csgopath:~33%\csgo\pakxv_lowviolence_000.vpk"
del "%reg_csgopath:~33%\csgo\pakxv_lowviolence_dir.vpk"
echo Delete "Chinese voice" files.
echo.
del "%reg_csgopath:~33%\csgo\pakxv_audiochinese_000.vpk"
del "%reg_csgopath:~33%\csgo\pakxv_audiochinese_001.vpk"
del "%reg_csgopath:~33%\csgo\pakxv_audiochinese_002.vpk"
del "%reg_csgopath:~33%\csgo\pakxv_audiochinese_003.vpk"
del "%reg_csgopath:~33%\csgo\pakxv_audiochinese_004.vpk"
del "%reg_csgopath:~33%\csgo\pakxv_audiochinese_dir.vpk"
echo Delete "Black blood" files.
echo.
del "%reg_csgopath:~33%\csgo\pakxv_perfectworld_000.vpk"
del "%reg_csgopath:~33%\csgo\pakxv_perfectworld_001.vpk"
del "%reg_csgopath:~33%\csgo\pakxv_perfectworld_dir.vpk"
echo.
echo [Over]You can check the console.
echo.
pause
goto menu

:copycfg
cls
copy /y autoexec.cfg "%reg_csgopath:~33%\csgo\cfg\"
echo [Over]Try to import the configuration file to %reg_csgopath:~33%\csgo\cfg
pause
cls
goto menu

:perfectworld
explorer "steam://rungameid/730//-perfectworld -novid -tickrate 128"
exit
:worldwide
explorer "steam://rungameid/730//-worldwide -novid -tickrate 128"
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

sc config Netman start= AUTO
sc start Netman
sc config rasman start= AUTO
sc start rasman
sc config tapisrv start= AUTO
sc start tapisrv
sc config mpssvc start= AUTO
sc start mpssvc
netsh advfirewall set allprofiles state on
bcdedit.exe /set {current} nx alwayson

:vacfix_1
for /f "delims=" %%a in ('"reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 730" | find "UninstallString""') do (set reg_steampath=%%a)
cd /d %reg_steampath:~34,-32%\bin
cls
echo [VAC fix]confirm
echo Steam Installation path： %reg_steampath:~34,-32%
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

0:
exit

end:
echo This is the end
pause
exit