@echo off
color a
for /f "delims=" %%a in ('"reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 730" | find "InstallLocation""') do (set reg_csgopath=%%a)


:menu
mode con cols=45 lines=25
cls
title CS:GO简易工具
echo ------------------------------------------
echo Counter-Strike Global Offensive-简易工具
echo.
echo ------------------------------------------
echo [1]全部反和谐(推荐)
echo [2]反和谐全部恢复(推荐)
echo.
echo [v]关闭低暴力模式(未实装)
echo [b]恢复红色血液
echo [e]恢复英语语音
echo.
echo [d]删除所有和谐文件(不可恢复)
echo [c]覆盖config到游戏目录
echo.
echo [w]启动国际版CS:GO
echo [p]启动完美世界版CS:GO
echo [fix]修复VAC被屏蔽问题
echo.
echo [h]帮助
echo [0]退出
echo ------------------------------------------

set /p user_input=请选择功能:
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
title 显示帮助
cls
echo ------------------------------------------
echo [CS:GO]简易工具(csgocmd_cn)
echo.
echo 输入对应代号并回车即可执行相关操作
echo (比如h为帮助，p为完美世界国服，w为国际服)
echo 显示“系统找不到指定的文件。”
echo 意味着文件丢失或者您重复执行此程式
echo.
echo ·中国大陆地区为黑色血液
echo ·中国大陆地区为中文语音
echo.
echo 这些“和谐”功能存放在如下路径[删除即失效]
echo \Counter-Strike Global Offensive\csgo
echo.
echo 我的CS:GO路径
echo %reg_csgopath:~33%
echo ------------------------------------------
pause
goto menu

:case1
cls
echo [重命名文档]全部反和谐
echo.
echo 开始进行[低暴力]反和谐
echo.
ren "%reg_csgopath:~33%\csgo\pakxv_lowviolence_000.vpk"   pakxv_lowviolence_000.bak
ren "%reg_csgopath:~33%\csgo\pakxv_lowviolence_dir.vpk"     pakxv_lowviolence_dir.bak
echo.
echo 开始进行[中文语音]反和谐
echo.
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_000.vpk"  pakxv_audiochinese_000.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_001.vpk"  pakxv_audiochinese_001.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_002.vpk"  pakxv_audiochinese_002.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_003.vpk"  pakxv_audiochinese_003.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_004.vpk"  pakxv_audiochinese_004.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_dir.vpk"   pakxv_audiochinese_dir.bak
echo.
echo 开始进行[黑色血液]反和谐
echo.
ren "%reg_csgopath:~33%\csgo\pakxv_perfectworld_000.vpk"  pakxv_perfectworld_000.bak
ren "%reg_csgopath:~33%\csgo\pakxv_perfectworld_001.vpk"  pakxv_perfectworld_001.bak
ren "%reg_csgopath:~33%\csgo\pakxv_perfectworld_dir.vpk"  pakxv_perfectworld_dir.bak
echo.
echo [执行结束]请检查控制台
echo.
pause
goto menu

:case2
cls
echo [重命名文档]反和谐全部恢复
echo.
echo 开始恢复[低暴力模式]
echo.
ren "%reg_csgopath:~33%\csgo\pakxv_lowviolence_000.bak"   pakxv_lowviolence_000.vpk
ren "%reg_csgopath:~33%\csgo\pakxv_lowviolence_dir.bak"   pakxv_lowviolence_dir.vpk
echo.
echo 开始恢复[中文语音]
echo.
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_000.bak"  pakxv_audiochinese_000.vpk
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_001.bak"  pakxv_audiochinese_001.vpk
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_002.bak"  pakxv_audiochinese_002.vpk
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_003.bak"  pakxv_audiochinese_003.vpk
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_004.bak"  pakxv_audiochinese_004.vpk
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_dir.bak"  pakxv_audiochinese_dir.vpk
echo.
echo 开始恢复[黑色血液]
echo.
ren "%reg_csgopath:~33%\csgo\pakxv_perfectworld_000.bak"  pakxv_perfectworld_000.vpk
ren "%reg_csgopath:~33%\csgo\pakxv_perfectworld_001.bak"  pakxv_perfectworld_001.vpk
ren "%reg_csgopath:~33%\csgo\pakxv_perfectworld_dir.bak"  pakxv_perfectworld_dir.vpk
echo.
echo [执行结束]请检查控制台
echo.
pause
goto menu

:v
cls
echo [重命名文档]低暴力反和谐功能
echo.
ren "%reg_csgopath:~33%\csgo\pakxv_lowviolence_000.vpk"   pakxv_lowviolence_000.bak
ren "%reg_csgopath:~33%\csgo\pakxv_lowviolence_dir.vpk"     pakxv_lowviolence_dir.bak
echo.
echo [执行结束]请检查控制台
echo.
pause
goto menu

:b
cls
Echo [重命名文档]血液反和谐功能
echo.
ren "%reg_csgopath:~33%\csgo\pakxv_perfectworld_000.vpk"  pakxv_perfectworld_000.bak
ren "%reg_csgopath:~33%\csgo\pakxv_perfectworld_001.vpk"  pakxv_perfectworld_001.bak
ren "%reg_csgopath:~33%\csgo\pakxv_perfectworld_dir.vpk"  pakxv_perfectworld_dir.bak
echo.
echo [执行结束]请检查控制台
echo.
pause
goto menu

:e
cls
Echo [重命名文档]中文语音反和谐功能
echo.
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_000.vpk"  pakxv_audiochinese_000.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_001.vpk"  pakxv_audiochinese_001.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_002.vpk"  pakxv_audiochinese_002.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_003.vpk"  pakxv_audiochinese_003.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_004.vpk"  pakxv_audiochinese_004.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_dir.vpk"   pakxv_audiochinese_dir.bak
echo.
echo [执行结束]请检查控制台
echo.
pause
goto menu

:d
mode con cols=120 lines=30
cls
echo [删除文档]全部反和谐
echo.
echo 删除[低暴力]
echo.
del "%reg_csgopath:~33%\csgo\pakxv_lowviolence_000.vpk"
del "%reg_csgopath:~33%\csgo\pakxv_lowviolence_dir.vpk"
echo 删除[中文语音]
echo.
del "%reg_csgopath:~33%\csgo\pakxv_audiochinese_000.vpk"
del "%reg_csgopath:~33%\csgo\pakxv_audiochinese_001.vpk"
del "%reg_csgopath:~33%\csgo\pakxv_audiochinese_002.vpk"
del "%reg_csgopath:~33%\csgo\pakxv_audiochinese_003.vpk"
del "%reg_csgopath:~33%\csgo\pakxv_audiochinese_004.vpk"
del "%reg_csgopath:~33%\csgo\pakxv_audiochinese_dir.vpk"
echo 删除[黑色血液]
echo.
del "%reg_csgopath:~33%\csgo\pakxv_perfectworld_000.vpk"
del "%reg_csgopath:~33%\csgo\pakxv_perfectworld_001.vpk"
del "%reg_csgopath:~33%\csgo\pakxv_perfectworld_dir.vpk"
echo.
echo [执行结束]请检查控制台
echo.
pause
goto menu

:copycfg
cls
copy /y autoexec.cfg "%reg_csgopath:~33%\csgo\cfg\"
echo [执行结束]已尝试导入autoexec.cfg到%reg_csgopath:~33%\csgo\cfg
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
title CSGO网吧VAC＆VPN修复工具     -by 百度贴吧 狙击手Ricky
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

0:
exit

end:
echo This is the end
pause
exit