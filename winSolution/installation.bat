@echo off

:: Check if running with administrator priviges
net session >nul 2>&1
if %ERRORLEVEL% neq 0 (
  echo Error: This script requieres admin privileges.
  echo Please run with admin privileges.
  pause 
  exit /b 1
)

:: Change to the script directory
cd /d "%~dp0"
cd ..

:: Check if curl exists
where curl >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo Error: 'curl' is not installed. Please install it and try again.
    pause
    exit /b 1
)

:: Check if tar exists
where tar >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo Error: 'tar' is not installed. Please install it and try again.
    pause
    exit /b 1
)

:: Step 1: Install Rust
echo [Step 1/6] Installing Rust...
powershell -Command "Invoke-WebRequest https://win.rustup.rs/x86_64 -OutFile rustup-init.exe"
echo Installing Rust silently...
set RUSTUP_INIT_SKIP_PATH_CHECK=yes
set CARGO_HOME=%USERPROFILE%\.cargo
set RUSTUP_HOME=%USERPROFILE%\.rustup
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to install Rust. Please check your internet connection and try again.
    pause
    exit /b 1
)

:: Run rustup with default installation options
rustup-init.exe -y --default-toolchain stable --no-modify-path
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to install Rust. Please check the logs above.
    pause
    exit /b 1
) else (
    echo Rust installed successfully.
)

:: Add cargo to PATH
setx PATH "%PATH%;%USERPROFILE%\.cargo\bin" /M
set PATH=%PATH%;%USERPROFILE%\.cargo\bin
echo Rust installed successfully.

:: Step 2: Install Visual Studio Build Tools (for MSVC linker)
echo [Step 2/6] Installing Visual Studio Build Tools...

:: Download VS Build Tools installer
echo   - Downloading Visual Studio Build Tools...
curl -L https://aka.ms/vs/17/release/vs_BuildTools.exe -o vs_BuildTools.exe
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to download Visual Studio Build Tools.
    pause
    exit /b 1
)

:: Install VS Build Tools with required components
echo   - Installing required MSVC components silently...
vs_BuildTools.exe --quiet --wait --norestart --nocache ^
  --installPath "C:\BuildTools" ^
  --add Microsoft.VisualStudio.Workload.VCTools ^
  --add Microsoft.VisualStudio.Component.Windows10SDK.19041 ^
  --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64

if %ERRORLEVEL% neq 0 (
    echo Error: Failed to install Visual Studio Build Tools.
    pause
    exit /b 1
) else (
    echo Visual Studio Build Tools installed successfully.
)

del vs_BuildTools.exe


:: Step 3: Install CMake and Clang (if needed)
echo [Step 3/6] Installing CMake and Clang...

:: Download CMake
echo   - Downloading CMake v4.0.0...
curl -L https://github.com/Kitware/CMake/releases/download/v4.0.0/cmake-4.0.0.zip -o cmake.zip
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to download CMake. Please check your internet connection and try again.
    pause
    exit /b 1
)
echo   - Extracting CMake...
tar -xf cmake.zip --strip-components=1 -C "C:\Program Files\CMake"
del cmake.zip

:: Download Clang
echo   - Downloading Clang LLVM-20.1.2...
curl -L https://github.com/llvm/llvm-project/releases/download/llvmorg-20.1.2/LLVM-20.1.2-win64.exe -o llvm.exe
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to download Clang. Please check your internet connection and try again.
    pause
    exit /b 1
)
echo   - Installing Clang silently...
llvm.exe /S /D="C:\Program Files\LLVM"
del llvm.exe

:: Add CMake and Clang to PATH
setx PATH "%PATH%;C:\Program Files\CMake\bin;C:\Program Files\LLVM\bin" /M
echo CMake and Clang installed successfully.

:: Step 3: Build the Rust project
echo [Step 4/6] Building Rust project...
cargo build --release
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to build the Rust project. Please check the logs above.
    pause
    exit /b 1
)
echo Rust project built successfully.

:: Step 4: Download Raylib Windows release
echo [Step 5/6] Downloading Raylib Windows release...
curl -L https://github.com/raysan5/raylib/releases/download/4.5.0/raylib-4.5.0_win64_mingw-w64.zip -o raylib.zip
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to download Raylib. Please check your internet connection and try again.
    pause
    exit /b 1
)

:: Step 5: Extract raylib.dll
echo [Step 6/6] Extracting raylib.dll...
tar -xf raylib.zip
for /r %%i in (raylib.dll) do if exist "%%i" copy "%%i" target\release\ >nul

:: Clean up
del raylib.zip
echo raylib.dll extracted and copied successfully.

echo Done! Run 'target\release\UnwantedSearchEngine.exe' to play.
start "" "target\release\UnwantedSearchEngine.exe"

