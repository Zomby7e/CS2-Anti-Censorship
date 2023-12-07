@echo off
chcp 936
color a
for /f "delims=" %%a in ('"reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 730" | find "InstallLocation""') do (set reg_csgopath=%%a)

@REM 静默启动完美世界版游戏
if "%1"=="perfectworld_silent" goto perfectworld_silent

:menu
mode con cols=45 lines=25
cls
title CS2 简易工具
echo ------------------------------------------
echo Counter-Strike 2 - 简易工具
echo ------------------------------------------
echo [w] 启动国际版 CS2
echo [p] 启动国服 CS2 （自动反和谐）
echo.
echo [1] 全部反和谐
echo [2] 反和谐全部恢复
echo.
echo [d] 删除所有和谐文件(不可恢复)
echo [o] 打开游戏 config 文件目录
echo [fix] 修复 VAC 被屏蔽问题
echo.
echo [h] 帮助
echo [q] 退出
echo ------------------------------------------

set /p user_input=请选择功能:
if "%user_input%"=="1" goto case1
if "%user_input%"=="2" goto case2
if "%user_input%"=="d" goto d
if "%user_input%"=="h" goto help
if "%user_input%"=="q" goto quit
if "%user_input%"=="p" goto perfectworld
if "%user_input%"=="w" goto worldwide
if "%user_input%"=="o" goto opencfgdir
if "%user_input%"=="fix" goto vacfix_0

:help
title 显示帮助
cls
echo ------------------------------------------
echo [CS2]简易工具(%~nx0)
echo.
echo 输入对应代号并回车即可执行相关操作
echo (比如 h 为帮助，p 为完美世界国服，w 为国际服)
echo 显示“系统找不到指定的文件。”
echo 意味着文件丢失或者您重复执行此程式
echo.
echo 本工具针对中国大陆地区的 CS2
echo 反和谐功能不保证完全还原国际服的体验
echo 本工具没有任何担保
echo.
echo CS2 安装在如下路径
echo %reg_csgopath:~33%
echo.
echo 这些“和谐”功能存放在如下路径[删除即失效]
echo %reg_csgopath:~33%\game\csgo_lv
echo ------------------------------------------
pause
goto menu

:case1
cls
echo [重命名文档]全部反和谐
echo.
echo 重命名文件中
echo.
ren "%reg_csgopath:~33%\game\csgo_lv" "csgo_lv.backup"
echo [执行结束]请检查控制台是否有错误信息
echo.
pause
goto menu

:case2
cls
echo [重命名文档]恢复原版
echo.
echo 重命名文件中
echo.
ren "%reg_csgopath:~33%\game\csgo_lv.backup" "csgo_lv"
echo [执行结束]请检查控制台是否有错误信息
echo.
pause
goto menu

:d
mode con cols=120 lines=30
cls
echo [删除文档]全部反和谐
echo.
del "%reg_csgopath:~33%\game\csgo_lv"
echo.
echo [执行结束]请检查控制台是否有错误信息
echo [提示]如果游戏出现错误，检查文件完整性即可恢复。
echo.
pause
goto menu

:opencfgdir
cls
explorer "%reg_csgopath:~33%\game\csgo\cfg"
echo 已经在新窗口打开游戏 Config 文件路径
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
echo 不要关闭本窗口，游戏结束时它会自动关闭
"%reg_csgopath:~33%\game\bin\win64\cs2.exe" "-perfectworld" "-novid"
ren "%reg_csgopath:~33%\game\csgo_lv.backup" "csgo_lv"
exit

:worldwide
start "" "%reg_csgopath:~33%\game\bin\win64\cs2.exe" "-worldwide" "-novid"
exit

:vacfix_0
title CS2 网吧VAC＆VPN修复工具     -by 百度贴吧 狙击手Ricky
 >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
echo 需要请求管理员权限
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
echo [VAC修复]确定执行VAC修复吗
echo Steam安装路径为： %reg_steampath:~34,-32%
echo.
pause
cls
echo [VAC修复]开始执行
echo.
steamservice.exe /install
echo.
steamservice.exe /repair
echo.
echo [VAC修复]执行结束
echo.
pause
goto menu

:quit
exit

:end
echo 你不应该看到这条消息
pause
exit