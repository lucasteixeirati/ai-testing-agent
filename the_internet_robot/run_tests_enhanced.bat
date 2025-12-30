@echo off
setlocal enabledelayedexpansion

:: ========================================
:: Enhanced Robot Framework Test Runner
:: ========================================

:: Default parameters
set "BROWSER=Chrome"
set "ENVIRONMENT=prod"
set "HEADLESS=False"
set "TEST_SUITE=tests/ImprovedTests.robot"
set "TAGS="

:: Parse command line arguments
if not "%1"=="" set "BROWSER=%1"
if not "%2"=="" set "ENVIRONMENT=%2"
if not "%3"=="" set "HEADLESS=%3"
if not "%4"=="" set "TEST_SUITE=%4"
if not "%5"=="" set "TAGS=%5"

:: Get timestamp
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "timestamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"

:: Create results directory
set "results_dir=results\execution_%timestamp%_%BROWSER%_%ENVIRONMENT%"
if not exist "%results_dir%" mkdir "%results_dir%"

echo ========================================
echo 🤖 Robot Framework Enhanced Test Runner
echo ========================================
echo Browser: %BROWSER%
echo Environment: %ENVIRONMENT%
echo Headless Mode: %HEADLESS%
echo Test Suite: %TEST_SUITE%
echo Tags: %TAGS%
echo Timestamp: %timestamp%
echo Results Directory: %results_dir%
echo ========================================

:: Build robot command
set "ROBOT_CMD=robot --outputdir "%results_dir%""
set "ROBOT_CMD=%ROBOT_CMD% --variable BROWSER:%BROWSER%"
set "ROBOT_CMD=%ROBOT_CMD% --variable HEADLESS_MODE:%HEADLESS%"
set "ROBOT_CMD=%ROBOT_CMD% --variable ENVIRONMENT:%ENVIRONMENT%"

:: Add tags if specified
if not "%TAGS%"=="" (
    set "ROBOT_CMD=%ROBOT_CMD% --include %TAGS%"
)

:: Add listener for Allure reports
set "ROBOT_CMD=%ROBOT_CMD% --listener allure_robotframework"

:: Add test suite
set "ROBOT_CMD=%ROBOT_CMD% %TEST_SUITE%"

echo Executing: %ROBOT_CMD%
echo ========================================

:: Execute tests
%ROBOT_CMD%

:: Check execution result
if %ERRORLEVEL% EQU 0 (
    echo ✅ Tests executed successfully!
) else (
    echo ❌ Tests failed with exit code: %ERRORLEVEL%
)

echo ========================================
echo 📊 Execution Summary
echo ========================================
echo Reports saved in: %results_dir%
echo.
echo 📄 Available Reports:
echo - HTML Report: %results_dir%\report.html
echo - Detailed Log: %results_dir%\log.html
echo - XML Output: %results_dir%\output.xml
echo.
echo 🎨 Generate Allure Report:
echo   allure serve %results_dir%\allure-results
echo ========================================

:: Open report automatically if successful
if %ERRORLEVEL% EQU 0 (
    echo.
    set /p "open_report=Open HTML report now? (y/n): "
    if /i "!open_report!"=="y" (
        start "" "%results_dir%\report.html"
    )
)

echo.
echo Press any key to exit...
pause >nul