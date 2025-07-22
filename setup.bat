@echo off
setlocal enabledelayedexpansion

:: Zero-Touch Godot Project Setup Script (Windows Batch)
:: v1.0 Release ready
::
:: This script will install all plugins, including those with file conflicts,
:: and self-destruct on success.

:: --- Configuration ---
set "LOG_FILE=setup.log"
set "GDPLUG_REPO=https://github.com/imjp94/gd-plug.git"
set "ADDONS_DIR=addons"
set "PLUGGED_DIR=.plugged"
set "GDPLUG_TEMP_DIR=gd-plug-temp"
set "GDPLUG_DIR_OS=addons\gd-plug"

:: --- Start Clean ---
echo [INFO] Starting clean setup. Removing old plugin folders...
if exist "%ADDONS_DIR%" (rmdir /s /q "%ADDONS_DIR%" 2>nul)
if exist "%PLUGGED_DIR%" (rmdir /s /q "%PLUGGED_DIR%" 2>nul)
mkdir "%ADDONS_DIR%"

> "%LOG_FILE%" echo.
echo [%DATE% %TIME:~0,8%] [INFO] Starting Godot project setup... >> "%LOG_FILE%"

:: --- Run Main Logic ---
echo [INFO] Verifying dependencies...
where godot >nul 2>&1 || (echo [ERROR] Godot not found in PATH. & pause & exit /b 1)
where git >nul 2>&1 || (echo [ERROR] Git not found in PATH. & pause & exit /b 1)
echo [SUCCESS] Dependencies verified.

echo [INFO] Installing gd-plug core...
git clone --depth 1 "%GDPLUG_REPO%" "%GDPLUG_TEMP_DIR%"
if !ERRORLEVEL! neq 0 (echo [ERROR] Failed to clone gd-plug repo. & pause & exit /b 1)
xcopy "%GDPLUG_TEMP_DIR%\addons\gd-plug" "%GDPLUG_DIR_OS%" /e /i /q
rmdir /s /q "%GDPLUG_TEMP_DIR%" 2>nul
echo [SUCCESS] gd-plug core installed.

echo [INFO] Installing all plugins from your plug.gd. This will take a moment...
:: CORRECTED: Added the "force" argument to resolve file conflicts.
godot --headless --script plug.gd install force

:: --- Final Verification and Cleanup ---
if !ERRORLEVEL! equ 0 (
	echo [SUCCESS] All plugins installed successfully.
	echo [INFO] Setup complete. Removing setup script and log file...
	del "%LOG_FILE%" >nul 2>nul
	(goto) 2>nul & del "%~f0"
) else (
	echo [ERROR] Plugin installation failed. Please check the output above.
	echo [INFO] The setup script and log file will not be removed.
	pause
)

endlocal
