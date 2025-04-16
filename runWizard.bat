@echo off
:: Check if the script is running with administrative privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo This script must be run as an administrator.
    pause
    exit /b 1
)

:: Run the PowerShell script
echo Running PowerShell script...
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0wizard.ps1"

:: Check if the PowerShell script completed successfully
if %errorlevel% neq 0 (
    echo PowerShell script failed with error code %errorlevel%.
    pause
    exit /b %errorlevel%
)

:: Refresh the environment variables to include the updated PATH
echo Refreshing environment variables...
call refreshenv

:: Verify that cargo is available
echo Verifying cargo installation...
where cargo >nul 2>&1
if %errorlevel% neq 0 (
    echo Cargo is not available in the PATH. Please check your installation.
    pause
    exit /b 1
)

:: Change to the directory where the batch file is located
cd /d "%~dp0"

:: Build the Rust application in release mode
echo Building the application in release mode...
cargo build --release
if %errorlevel% neq 0 (
    echo Failed to build the application in release mode.
    pause
    exit /b %errorlevel%
)

:: Get the path to the release binary
set "RELEASE_BINARY=%~dp0target\release\your_app_name.exe"
if not exist "%RELEASE_BINARY%" (
    echo Release binary not found at: %RELEASE_BINARY%
    pause
    exit /b 1
)

:: Create a desktop shortcut using PowerShell
echo Creating a desktop shortcut for the application...
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "$ShortcutPath = [System.IO.Path]::Combine([Environment]::GetFolderPath('Desktop'), 'YourAppName.lnk'); " ^
    "$WScriptShell = New-Object -ComObject WScript.Shell; " ^
    "$Shortcut = $WScriptShell.CreateShortcut($ShortcutPath); " ^
    "$Shortcut.TargetPath = '%RELEASE_BINARY%'; " ^
    "$Shortcut.WorkingDirectory = '%~dp0'; " ^
    "$Shortcut.Save();"

if %errorlevel% neq 0 (
    echo Failed to create the desktop shortcut.
    pause
    exit /b %errorlevel%
)

:: Run the release binary
echo Running the release version of the application...
start "" "%RELEASE_BINARY%"

:: Pause to allow the user to see the output
pause
