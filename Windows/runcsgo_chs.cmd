@echo off
chcp 936
color a
for /f "delims=" %%a in ('"reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 730" | find "InstallLocation""') do (set reg_csgopath=%%a)

@REM ��Ĭ���������������Ϸ
if "%1"=="perfectworld_silent" goto perfectworld_silent

:menu
mode con cols=45 lines=25
cls
title CS2 ���׹���
echo ------------------------------------------
echo Counter-Strike 2 - ���׹���
echo ------------------------------------------
echo [w] �������ʰ� CS2
echo [p] �������� CS2 ���Զ�����г��
echo.
echo [1] ȫ������г
echo [2] ����гȫ���ָ�
echo.
echo [d] ɾ�����к�г�ļ�(���ɻָ�)
echo [o] ����Ϸ config �ļ�Ŀ¼
echo [fix] �޸� VAC ����������
echo.
echo [h] ����
echo [q] �˳�
echo ------------------------------------------

set /p user_input=��ѡ����:
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
title ��ʾ����
cls
echo ------------------------------------------
echo [CS2]���׹���(%~nx0)
echo.
echo �����Ӧ���Ų��س�����ִ����ز���
echo (���� h Ϊ������p Ϊ�������������w Ϊ���ʷ�)
echo ��ʾ��ϵͳ�Ҳ���ָ�����ļ�����
echo ��ζ���ļ���ʧ�������ظ�ִ�д˳�ʽ
echo.
echo ����������й���½������ CS2
echo ����г���ܲ���֤��ȫ��ԭ���ʷ�������
echo ������û���κε���
echo.
echo CS2 ��װ������·��
echo %reg_csgopath:~33%
echo.
echo ��Щ����г�����ܴ��������·��[ɾ����ʧЧ]
echo %reg_csgopath:~33%\game\csgo_lv
echo ------------------------------------------
pause
goto menu

:case1
cls
echo [�������ĵ�]ȫ������г
echo.
echo �������ļ���
echo.
ren "%reg_csgopath:~33%\game\csgo_lv" "csgo_lv.backup"
echo [ִ�н���]�������̨�Ƿ��д�����Ϣ
echo.
pause
goto menu

:case2
cls
echo [�������ĵ�]�ָ�ԭ��
echo.
echo �������ļ���
echo.
ren "%reg_csgopath:~33%\game\csgo_lv.backup" "csgo_lv"
echo [ִ�н���]�������̨�Ƿ��д�����Ϣ
echo.
pause
goto menu

:d
mode con cols=120 lines=30
cls
echo [ɾ���ĵ�]ȫ������г
echo.
del "%reg_csgopath:~33%\game\csgo_lv"
echo.
echo [ִ�н���]�������̨�Ƿ��д�����Ϣ
echo [��ʾ]�����Ϸ���ִ��󣬼���ļ������Լ��ɻָ���
echo.
pause
goto menu

:opencfgdir
cls
explorer "%reg_csgopath:~33%\game\csgo\cfg"
echo �Ѿ����´��ڴ���Ϸ Config �ļ�·��
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
echo ��Ҫ�رձ����ڣ���Ϸ����ʱ�����Զ��ر�
"%reg_csgopath:~33%\game\bin\win64\cs2.exe" "-perfectworld" "-novid"
ren "%reg_csgopath:~33%\game\csgo_lv.backup" "csgo_lv"
exit

:worldwide
start "" "%reg_csgopath:~33%\game\bin\win64\cs2.exe" "-worldwide" "-novid"
exit

:vacfix_0
title CS2 ����VAC��VPN�޸�����     -by �ٶ����� �ѻ���Ricky
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

:quit
exit

:end
echo �㲻Ӧ�ÿ���������Ϣ
pause
exit