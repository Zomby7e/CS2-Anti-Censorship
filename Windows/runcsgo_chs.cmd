@echo off
color a
for /f "delims=" %%a in ('"reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 730" | find "InstallLocation""') do (set reg_csgopath=%%a)


:menu
mode con cols=45 lines=25
cls
title CS:GO���׹���
echo ------------------------------------------
echo Counter-Strike Global Offensive-���׹���
echo.
echo ------------------------------------------
echo [1]ȫ������г(�Ƽ�)
echo [2]����гȫ���ָ�(�Ƽ�)
echo.
echo [v]�رյͱ���ģʽ(δʵװ)
echo [b]�ָ���ɫѪҺ
echo [e]�ָ�Ӣ������
echo.
echo [d]ɾ�����к�г�ļ�(���ɻָ�)
echo [c]����config����ϷĿ¼
echo.
echo [w]�������ʰ�CS:GO
echo [p]�������������CS:GO
echo [fix]�޸�VAC����������
echo.
echo [h]����
echo [0]�˳�
echo ------------------------------------------

set /p user_input=��ѡ����:
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
title ��ʾ����
cls
echo ------------------------------------------
echo [CS:GO]���׹���(csgocmd_cn)
echo.
echo �����Ӧ���Ų��س�����ִ����ز���
echo (����hΪ������pΪ�������������wΪ���ʷ�)
echo ��ʾ��ϵͳ�Ҳ���ָ�����ļ�����
echo ��ζ���ļ���ʧ�������ظ�ִ�д˳�ʽ
echo.
echo ���й���½����Ϊ��ɫѪҺ
echo ���й���½����Ϊ��������
echo.
echo ��Щ����г�����ܴ��������·��[ɾ����ʧЧ]
echo \Counter-Strike Global Offensive\csgo
echo.
echo �ҵ�CS:GO·��
echo %reg_csgopath:~33%
echo ------------------------------------------
pause
goto menu

:case1
cls
echo [�������ĵ�]ȫ������г
echo.
echo ��ʼ����[�ͱ���]����г
echo.
ren "%reg_csgopath:~33%\csgo\pakxv_lowviolence_000.vpk"   pakxv_lowviolence_000.bak
ren "%reg_csgopath:~33%\csgo\pakxv_lowviolence_dir.vpk"     pakxv_lowviolence_dir.bak
echo.
echo ��ʼ����[��������]����г
echo.
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_000.vpk"  pakxv_audiochinese_000.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_001.vpk"  pakxv_audiochinese_001.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_002.vpk"  pakxv_audiochinese_002.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_003.vpk"  pakxv_audiochinese_003.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_004.vpk"  pakxv_audiochinese_004.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_dir.vpk"   pakxv_audiochinese_dir.bak
echo.
echo ��ʼ����[��ɫѪҺ]����г
echo.
ren "%reg_csgopath:~33%\csgo\pakxv_perfectworld_000.vpk"  pakxv_perfectworld_000.bak
ren "%reg_csgopath:~33%\csgo\pakxv_perfectworld_001.vpk"  pakxv_perfectworld_001.bak
ren "%reg_csgopath:~33%\csgo\pakxv_perfectworld_dir.vpk"  pakxv_perfectworld_dir.bak
echo.
echo [ִ�н���]�������̨
echo.
pause
goto menu

:case2
cls
echo [�������ĵ�]����гȫ���ָ�
echo.
echo ��ʼ�ָ�[�ͱ���ģʽ]
echo.
ren "%reg_csgopath:~33%\csgo\pakxv_lowviolence_000.bak"   pakxv_lowviolence_000.vpk
ren "%reg_csgopath:~33%\csgo\pakxv_lowviolence_dir.bak"   pakxv_lowviolence_dir.vpk
echo.
echo ��ʼ�ָ�[��������]
echo.
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_000.bak"  pakxv_audiochinese_000.vpk
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_001.bak"  pakxv_audiochinese_001.vpk
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_002.bak"  pakxv_audiochinese_002.vpk
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_003.bak"  pakxv_audiochinese_003.vpk
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_004.bak"  pakxv_audiochinese_004.vpk
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_dir.bak"  pakxv_audiochinese_dir.vpk
echo.
echo ��ʼ�ָ�[��ɫѪҺ]
echo.
ren "%reg_csgopath:~33%\csgo\pakxv_perfectworld_000.bak"  pakxv_perfectworld_000.vpk
ren "%reg_csgopath:~33%\csgo\pakxv_perfectworld_001.bak"  pakxv_perfectworld_001.vpk
ren "%reg_csgopath:~33%\csgo\pakxv_perfectworld_dir.bak"  pakxv_perfectworld_dir.vpk
echo.
echo [ִ�н���]�������̨
echo.
pause
goto menu

:v
cls
echo [�������ĵ�]�ͱ�������г����
echo.
ren "%reg_csgopath:~33%\csgo\pakxv_lowviolence_000.vpk"   pakxv_lowviolence_000.bak
ren "%reg_csgopath:~33%\csgo\pakxv_lowviolence_dir.vpk"     pakxv_lowviolence_dir.bak
echo.
echo [ִ�н���]�������̨
echo.
pause
goto menu

:b
cls
Echo [�������ĵ�]ѪҺ����г����
echo.
ren "%reg_csgopath:~33%\csgo\pakxv_perfectworld_000.vpk"  pakxv_perfectworld_000.bak
ren "%reg_csgopath:~33%\csgo\pakxv_perfectworld_001.vpk"  pakxv_perfectworld_001.bak
ren "%reg_csgopath:~33%\csgo\pakxv_perfectworld_dir.vpk"  pakxv_perfectworld_dir.bak
echo.
echo [ִ�н���]�������̨
echo.
pause
goto menu

:e
cls
Echo [�������ĵ�]������������г����
echo.
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_000.vpk"  pakxv_audiochinese_000.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_001.vpk"  pakxv_audiochinese_001.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_002.vpk"  pakxv_audiochinese_002.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_003.vpk"  pakxv_audiochinese_003.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_004.vpk"  pakxv_audiochinese_004.bak
ren "%reg_csgopath:~33%\csgo\pakxv_audiochinese_dir.vpk"   pakxv_audiochinese_dir.bak
echo.
echo [ִ�н���]�������̨
echo.
pause
goto menu

:d
mode con cols=120 lines=30
cls
echo [ɾ���ĵ�]ȫ������г
echo.
echo ɾ��[�ͱ���]
echo.
del "%reg_csgopath:~33%\csgo\pakxv_lowviolence_000.vpk"
del "%reg_csgopath:~33%\csgo\pakxv_lowviolence_dir.vpk"
echo ɾ��[��������]
echo.
del "%reg_csgopath:~33%\csgo\pakxv_audiochinese_000.vpk"
del "%reg_csgopath:~33%\csgo\pakxv_audiochinese_001.vpk"
del "%reg_csgopath:~33%\csgo\pakxv_audiochinese_002.vpk"
del "%reg_csgopath:~33%\csgo\pakxv_audiochinese_003.vpk"
del "%reg_csgopath:~33%\csgo\pakxv_audiochinese_004.vpk"
del "%reg_csgopath:~33%\csgo\pakxv_audiochinese_dir.vpk"
echo ɾ��[��ɫѪҺ]
echo.
del "%reg_csgopath:~33%\csgo\pakxv_perfectworld_000.vpk"
del "%reg_csgopath:~33%\csgo\pakxv_perfectworld_001.vpk"
del "%reg_csgopath:~33%\csgo\pakxv_perfectworld_dir.vpk"
echo.
echo [ִ�н���]�������̨
echo.
pause
goto menu

:copycfg
cls
copy /y autoexec.cfg "%reg_csgopath:~33%\csgo\cfg\"
echo [ִ�н���]�ѳ��Ե���autoexec.cfg��%reg_csgopath:~33%\csgo\cfg
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
title CSGO����VAC��VPN�޸�����     -by �ٶ����� �ѻ���Ricky
 >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
echo ��Ҫ�������ԱȨ��
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
echo [VAC�޸�]ȷ��ִ��VAC�޸���
echo Steam��װ·��Ϊ�� %reg_steampath:~34,-32%
echo.
pause
cls
echo [VAC�޸�]��ʼִ��
echo.
steamservice.exe /install
echo.
steamservice.exe /repair
echo.
echo [VAC�޸�]ִ�н���
echo.
pause
goto menu

0:
exit

end:
echo This is the end
pause
exit