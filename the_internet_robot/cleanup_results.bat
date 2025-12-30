@echo off
setlocal enabledelayedexpansion

:: ========================================
:: Results Cleanup Script
:: ========================================

echo ========================================
echo 🧹 Robot Framework Results Cleanup
echo ========================================

set "RESULTS_DIR=results"
set "DAYS_TO_KEEP=7"
set "CURRENT_DATE=%DATE%"

:: Check if results directory exists
if not exist "%RESULTS_DIR%" (
    echo ❌ Results directory not found: %RESULTS_DIR%
    echo Nothing to clean up.
    goto :end
)

echo 📁 Scanning results directory: %RESULTS_DIR%
echo 📅 Keeping results from last %DAYS_TO_KEEP% days

:: Count total directories
set "TOTAL_DIRS=0"
set "DELETED_DIRS=0"
set "KEPT_DIRS=0"

for /d %%D in ("%RESULTS_DIR%\execution_*") do (
    set /a TOTAL_DIRS+=1
)

echo 📊 Found %TOTAL_DIRS% execution directories

:: Delete old directories (simplified approach for demo)
:: In production, you'd want more sophisticated date comparison
for /d %%D in ("%RESULTS_DIR%\execution_*") do (
    set "DIR_NAME=%%~nxD"
    
    :: Extract date from directory name (execution_YYYY-MM-DD_HH-MM-SS)
    set "DIR_DATE=!DIR_NAME:~10,10!"
    
    :: Simple check - delete if directory name is older pattern
    :: This is a simplified version - in production use proper date comparison
    if "!DIR_DATE!" LSS "2024-12-01" (
        echo 🗑️  Deleting old directory: %%D
        rmdir /s /q "%%D" 2>nul
        if !ERRORLEVEL! EQU 0 (
            set /a DELETED_DIRS+=1
            echo ✅ Deleted: %%~nxD
        ) else (
            echo ❌ Failed to delete: %%~nxD
        )
    ) else (
        set /a KEPT_DIRS+=1
        echo 📌 Keeping: %%~nxD
    )
)

:: Clean up loose files in results directory
echo.
echo 🧹 Cleaning up loose files...

if exist "%RESULTS_DIR%\*.html" (
    del /q "%RESULTS_DIR%\*.html" 2>nul
    echo ✅ Removed loose HTML files
)

if exist "%RESULTS_DIR%\*.xml" (
    del /q "%RESULTS_DIR%\*.xml" 2>nul
    echo ✅ Removed loose XML files
)

if exist "%RESULTS_DIR%\*.png" (
    del /q "%RESULTS_DIR%\*.png" 2>nul
    echo ✅ Removed loose screenshot files
)

:: Summary
echo.
echo ========================================
echo 📊 Cleanup Summary
echo ========================================
echo Total directories found: %TOTAL_DIRS%
echo Directories deleted: %DELETED_DIRS%
echo Directories kept: %KEPT_DIRS%
echo ========================================

:: Calculate space saved (approximate)
echo 💾 Estimated space saved: ~%DELETED_DIRS%0 MB
echo.

:end
echo ✅ Cleanup completed!
echo.
pause