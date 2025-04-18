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
)

:: Change to the directory where the batch file is located
cd /d "%~dp0"

:: Build the Rust application in release mode
echo Building the application in release mode...
cargo build --release
if %errorlevel% neq 0 (
	echo Failed to build the application in release mode.
	pause
)

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0linker.ps1"

if %errorlevel% neq 0 (
	echo PowerShell script failed with error code %errorlevel%.
	pause
	exit /b %errorlevel%
)
cargo run
