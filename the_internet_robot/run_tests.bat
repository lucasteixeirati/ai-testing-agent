@echo off
setlocal enabledelayedexpansion

:: Obter data e hora atual
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

:: Criar nome do diretório com timestamp
set "timestamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"
set "results_dir=results\execution_%timestamp%"

:: Criar diretório se não existir
if not exist "%results_dir%" mkdir "%results_dir%"

echo ========================================
echo Robot Framework Test Execution
echo Timestamp: %timestamp%
echo Results Directory: %results_dir%
echo ========================================

:: Executar testes com diretório timestampado
robot --outputdir "%results_dir%" --variable HEADLESS_MODE:False tests/AllTests.robot

echo ========================================
echo Execution completed!
echo Reports saved in: %results_dir%
echo ========================================
echo.
echo Open reports:
echo - Summary: %results_dir%\report.html
echo - Detailed: %results_dir%\log.html
echo ========================================

pause