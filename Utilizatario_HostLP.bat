:INICIO
chcp 65001
@ECHO OFF
CLS
:: #############################################################################################
:: # Title:      Limpeza de Disco Total                                                        #
:: # Created By: Thiago Castro                                                                 #
:: # Created On: 01-Junho-2022                                                                 #
:: #############################################################################################
title Limpeza de Disco Total - Feito por HostLP. & mode con: cols=100 lines=50 & color 17

setlocal EnableDelayedExpansion
set "params=%*"
cd /d "%~dp0" && ( if exist "%Temp%\getadmin.vbs" del "%Temp%\getadmin.vbs") && fsutil dirty query %systemdrive% 1>nul 2>nul || ( echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%Temp%\getadmin.vbs" && "%Temp%\getadmin.vbs" && Exit /b)
%windir%\system32\reg.exe query "HKU\S-1-5-19" 1>nul 2>nul || ( echo. & echo  ERRO: Este arquivo em lote DEVE ser executado em um prompt de cmd ELEVADO [Administrador] & echo. & echo         Clique com o botão direito do mouse no arquivo Batch e clique em ^<Executar como Administrador^>. & echo. & echo ^>Aperte qualquer tecla para sair . . . & pause >nul & Exit )

ECHO --------------------------------------------------------------
ECHO .:: Ajustes v1.0 ::.
ECHO --------------------------------------------------------------
ECHO Digite "1" para Limpar Cache Google Chrome
ECHO Digite "2" para Limpar Discos
ECHO Digite "3" para Limpar Lixeira
ECHO Digite "4" para Limpar Logs
ECHO Digite "5" para Cancelar e Sair
ECHO --------------------------------------------------------------
:LOOP
SET /P choice1= Escolha 1,2,3,4 ou 5, e pressione ENTER:    
IF /I "%choice1%"=="1" GOTO OP01
IF /I "%choice1%"=="2" GOTO OP02
IF /I "%choice1%"=="3" GOTO OP03
IF /I "%choice1%"=="4" GOTO OP04
IF /I "%choice1%"=="5" GOTO CANCEL
:: ELSE
GOTO LOOP

:OP01
@ECHO OFF
CLS

TASKKILL /F /IM Chrome.exe /T
for /f %%a in ('dir c:\users /b') do (
rd "c:\users\%%a\AppData\Local\Google\Chrome\User Data\Default\Cache" /s /q
del "c:\users\%%a\AppData\Local\Google\Chrome\User Data\Default\*history*.*" /s /q
del "c:\users\%%a\AppData\Local\Google\Chrome\User Data\Default\*History Provider Cache*.*" /s /q
del "c:\users\%%a\AppData\Local\Google\Chrome\User Data\Default\*cookies*.*" /s /q
)
ECHO.
GOTO SUCCESS

:OP02
@ECHO OFF
CLS

title Limpeza de Disco Total - Feito por HostLP. & mode con: cols=100 lines=50 & color 17

setlocal EnableDelayedExpansion
set "params=%*"
cd /d "%~dp0" && ( if exist "%Temp%\getadmin.vbs" del "%Temp%\getadmin.vbs") && fsutil dirty query %systemdrive% 1>nul 2>nul || ( echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%Temp%\getadmin.vbs" && "%Temp%\getadmin.vbs" && Exit /b)
%windir%\system32\reg.exe query "HKU\S-1-5-19" 1>nul 2>nul || ( echo. & echo  ERRO: Este arquivo em lote DEVE ser executado em um prompt de cmd ELEVADO [Administrador] & echo. & echo         Clique com o botão direito do mouse no arquivo Batch e clique em ^<Executar como Administrador^>. & echo. & echo ^>Aperte qualquer tecla para sair . . . & pause >nul & Exit )

:Options

echo. & echo  ==============================================================================
        echo  Olá %username%.
        echo  ==============================================================================
echo. & echo  Options:
echo. & echo  [0] SAIR deste programa.
echo. & echo  [1] Executar limpeza de disco - Standard    Mode.
        echo  [2] Executar limpeza de disco - Advanced    Mode.
        echo  [3] Executar limpeza de disco - LOWDISK     Mode.
        echo  [4] Executar limpeza de disco - VERYLOWDISK Mode.
echo. & echo  ##############################################################################
        echo  #                                                                            #
        echo  #AVISO: A opção [2] também LIMPARÁ AUTOMATICAMENTE TODAS AS UNIDADES LIGADAS.#
        echo  #                                                                            #
        echo  ##############################################################################
echo. & echo  NOTA: Opção [1] Selecione o HDD que deseja limpar.
        echo                   Marque OU Desmarque as caixas apropriadas.
        echo                   Confirme a exclusão de arquivos.
echo. & echo        Option [2] Marque OU Desmarque as caixas apropriadas.
        echo                   Ele é executado automaticamente.
echo. & echo        Option [3] Selecione o HDD que deseja limpar.
        echo                   TODAS as caixas de seleção estão marcadas por padrão.
        echo                   Desmarque as caixas apropriadas.
        echo                   Confirme a exclusão de arquivos.
        echo                   Feche a caixa de notificação de espaço em disco.
echo. & echo        Option [4] TODAS as caixas de seleção estão marcadas por padrão.
        echo                   Ele é executado automaticamente.
        echo                   Feche a caixa de notificação de espaço em disco.
echo. & echo  ==============================================================================& echo.

CHOICE /N /C 01234 /M ">Insira uma opção:"

if errorlevel 5 goto :VERY_LOW_DISK
if errorlevel 4 goto :LOW_DISK
if errorlevel 3 goto :Advanced
if errorlevel 2 goto :Standard
if errorlevel 1 GOTO SUCCESS

:Standard

echo. & echo  Em processamento . . .
              %ComSpec% /c cleanmgr.exe
        echo  Em processamento Complete.
echo. & echo ^>Aperte qualquer tecla para sair . . . & pause >nul & GOTO SUCCESS

:Advanced

echo. & echo  Em processamento . . .
              %ComSpec% /c cleanmgr.exe /sageset:65535 & cleanmgr.exe /sagerun:65535
        echo  Em processamento Complete.
echo. & echo ^>Aperte qualquer tecla para sair . . . & pause >nul & GOTO SUCCESS

:LOW_DISK

echo. & echo  Em processamento . . .
              %ComSpec% /c cleanmgr.exe /LOWDISK
        echo  Em processamento Complete.
echo. & echo ^>Aperte qualquer tecla para sair . . . & pause >nul & GOTO SUCCESS

:VERY_LOW_DISK

echo. & echo  Em processamento . . .
              %ComSpec% /c cleanmgr.exe /VERYLOWDISK
        echo  Em processamento Complete.
echo. & echo ^>Aperte qualquer tecla para sair . . . & pause >nul & GOTO SUCCESS

ECHO.
GOTO SUCCESS

:OP03
@ECHO OFF
CLS

title Limpeza da Lixeira - Feito por HostLP. & mode con: cols=100 lines=50 & color 17

setlocal EnableDelayedExpansion
set "params=%*"
cd /d "%~dp0" && ( if exist "%Temp%\getadmin.vbs" del "%Temp%\getadmin.vbs") && fsutil dirty query %systemdrive% 1>nul 2>nul || ( echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%Temp%\getadmin.vbs" && "%Temp%\getadmin.vbs" && Exit /b)
%windir%\system32\reg.exe query "HKU\S-1-5-19" 1>nul 2>nul || ( echo. & echo  ERRO: Este arquivo em lote DEVE ser executado em um prompt de cmd ELEVADO [Administrador] & echo. & echo         Clique com o botão direito do mouse no arquivo Batch e clique em ^<Executar como Administrador^>. & echo. & echo ^>Aperte qualquer tecla para sair . . . & pause >nul & Exit )

:Options

echo. & echo  ==============================================================================
        echo  Olá %username%.
        echo  ==============================================================================
echo. & echo  Options:
echo. & echo  [0] SAIR deste programa.
echo. & echo  [1] Esvazie a lixeira de uma unidade especificada.
        echo  [2] Esvazie a Lixeira para TODAS as unidades.
echo. & echo  ==============================================================================& echo.

CHOICE /N /C 012 /M ">Insira uma opção:"

if errorlevel 3 goto :ALL_Drives
if errorlevel 2 goto :Specific_Drive
if errorlevel 1 GOTO SUCCESS

:Specific_Drive

cls & echo.
set "Drive="
echo  ==============================================================================
echo  Para qual unidade você gostaria de esvaziar a lixeira?
echo  ==============================================================================& echo.
set /p "Drive=>Por favor, digite a letra da unidade e pressione <Enter>: " & echo.
if not exist %Drive%:\ (
  echo  ------------------------------------------------------------------------------
  echo  ERRO: O Drive NÃO existe.
  echo  ------------------------------------------------------------------------------
  echo. & echo ^>Pressione QUALQUER tecla para retornar às Opções . . . & pause >nul & cls & GOTO SUCCESS
) else (
          echo  Em processamento [ Esvaziar a lixeira da unidade especificada ] . . .
                PowerShell Clear-RecycleBin -DriveLetter %Drive% -Force -ErrorAction:Ignore
          echo  Em processamento Complete.
  echo. & echo  ------------------------------------------------------------------------------
  echo. & echo ^>Pressione QUALQUER tecla para retornar às Opções . . . & pause >nul & cls & GOTO SUCCESS
)

:ALL_Drives

cls & echo.
echo  ==============================================================================
echo  Esvazie a Lixeira para TODAS as unidades.
echo  ==============================================================================
echo. & echo  Em processamento [ Emptying the Recycle Bin for ALL Drives ] . . .
              PowerShell Clear-RecycleBin -Force -ErrorAction:Ignore
        echo  Em processamento Complete.
echo. & echo  ------------------------------------------------------------------------------
echo. & echo ^>Pressione QUALQUER tecla para retornar às Opções . . . & pause >nul & cls & GOTO SUCCESS

ECHO.
GOTO SUCCESS

:OP04
@ECHO OFF
CLS

title Limpeza e Backup de Event Viewer Logs - Feito por HostLP. & mode con: cols=100 lines=50 & color 17

setlocal EnableDelayedExpansion
set "params=%*"
cd /d "%~dp0" && ( if exist "%Temp%\getadmin.vbs" del "%Temp%\getadmin.vbs") && fsutil dirty query %systemdrive% 1>nul 2>nul || ( echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%Temp%\getadmin.vbs" && "%Temp%\getadmin.vbs" && Exit /b)
%windir%\system32\reg.exe query "HKU\S-1-5-19" 1>nul 2>nul || ( echo. & echo  ERRO: Este arquivo em lote DEVE ser executado em um prompt de cmd ELEVADO [Administrador] & echo. & echo         Clique com o botão direito do mouse no arquivo Batch e clique em ^<Executar como Administrador^>. & echo. & echo ^>Aperte qualquer tecla para sair . . . & pause >nul & Exit )

set "DT=HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"
for /f "usebackq tokens=3" %%X in (`Reg Query "%DT%" /V Desktop`) do (set Desktop=%%X)
for /f "usebackq delims=" %%X in (`echo "%Desktop%"`) do (set "Desktop=%%X")
set "Desktop=%Desktop:~1,-1%"

set "Folder_Name=EV_BackUp"
set "DT_Folder=%Desktop%\%Folder_Name%"

set "OFN1=%DT_Folder%\Application Log Backup"
set "OFN2=%DT_Folder%\Security Log Backup"
set "OFN3=%DT_Folder%\System Log Backup"

:Options

echo. & echo  ==============================================================================
        echo  Olá %username%.
        echo  ==============================================================================
echo. & echo  [1] Event Viewer Backup.
echo. & echo  NOTA: A %Folder_Name% pasta será criada na área de trabalho.
echo. & echo  SOMENTE os seguintes logs na pasta de logs do Windows serão copiados . . .
echo. & echo     Application Log
        echo     Security    Log
        echo     System      Log
echo. & echo  Cada um dos nomes de arquivo de Logs com backup estará no formato . . .
echo. & echo     LogName Backup - Criado dd-mm-yyyy as hh-mm-ss
echo. & echo  Como os nomes dos arquivos incluem a Data ATUAL ^& Hora, qualquer
        echo  up Os logs NÃO serão sobrescritos.
echo. & echo  ------------------------------------------------------------------------------
echo. & echo  [2] Event Viewer Clear Logs.
echo. & echo  AVISO: TODOS os logs nas seguintes pastas SERÃO LIMPOS . . .
echo. & echo           Windows Logs
        echo           Applications and Service Logs
echo. & echo  ==============================================================================
echo. & echo  Opções:
echo. & echo  [0] SAIR deste programa.
echo. & echo  [1] Run Event Viewer Backup.
        echo  [2] Run Event Viewer Clear Logs.
echo. & echo  ==============================================================================& echo.

CHOICE /N /C 012 /M ">Insira uma opção:"

if errorlevel 3 goto :Event_Viewer_Clear_Logs
if errorlevel 2 goto :Event_Viewer_BackUp
if errorlevel 1 GOTO SUCCESS

:Event_Viewer_BackUp

if not exist %DT_Folder% (mkdir %DT_Folder% >nul 2>&1)
for /f %%i in ('WMIC OS Get LocalDateTime /Value') do for /f %%j in ("%%i") do set "%%j"
set "Day=%LocalDateTime:~6,2%"   & set "Month=%LocalDateTime:~4,2%"    & set "Year=%LocalDateTime:~0,4%"
set "Hours=%LocalDateTime:~8,2%" & set "Minutes=%LocalDateTime:~10,2%" & set "Seconds=%LocalDateTime:~12,2%"
set "Date+Time=Created %Day%-%Month%-%Year% at %Hours%-%Minutes%-%Seconds%"
echo. & echo  Em processamento . . .
              wevtutil export-log Application "%OFN1% - %Date+Time%.evtx"
              wevtutil export-log Security    "%OFN2% - %Date+Time%.evtx"
              wevtutil export-log System      "%OFN3% - %Date+Time%.evtx"
        echo  Em processamento Complete.
echo. & echo ^>Aperte qualquer tecla para sair . . . & pause >nul & GOTO SUCCESS

:Event_Viewer_Clear_Logs

cls & mode con: lines=12 
echo. & echo  ##############################################################################
        echo  #                                                                            #
        echo  #    IMPORTANTE: Isso pode demorar um pouco, por favor, seja paciente^^!     #
        echo  #                                                                            #
        echo  ##############################################################################
echo. & echo  Em processamento . . .
              for /f "tokens=*" %%i in ('wevtutil.exe el') do echo "%%i" >nul 2>&1 & wevtutil.exe cl "%%i" >nul 2>&1 & wevtutil.exe cl System >nul 2>&1
        echo  Em processamento Complete.
echo. & echo ^>Aperte qualquer tecla para sair . . . & pause >nul & GOTO SUCCESS

ECHO.
GOTO SUCCESS

:SUCCESS
@ECHO .::TUDO OK::.
ECHO.
@PAUSE > NUL
GOTO INICIO

:CANCEL
CLS
mode con: lines=3 & color A & cls & echo. & echo  Tchauzin %username%. & timeout /t 3 /nobreak >nul
EXIT
