@echo off

:: Check if running with administrator priviges
net session >nul 2>&1
if %ERRORLEVEL% neq 0 (
  echo Error: This script requieres admin privileges.
  echo Please run with admin privileges.
  pause 
  exit /b 1
)


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
echo [Step 1/5] Installing Rust...
powershell -Command "Invoke-WebRequest https://win.rustup.rs/x86_64 -OutFile rustup-init.exe"
echo Installing Rust silently...
set RUSTUP_INIT_SKIP_PATH_CHECH=yes
set CARGO_HOME=%USERPROFILE%\.cargo
set RUSTUP_HOME=%USERPROFILE%\.rustup
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to install Rust. Please check your internet connection and try again.
    pause
    exit /b 1
)

:: Run rustup with default installation options
rustup.exe -y --default-toolchain stable --no-modify-path
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to install Rust. Please check the logs above.
    pause
    exit /b 1
) else (
    echo Rust installed successfully.
)

:: Add cargo to PATH
setx PATH "%PATH%;%USERPROFILE%\.cargo\bin" /M
echo Rust installed successfully.

:: Step 2: Install CMake and Clang (if needed)
echo [Step 2/5] Installing CMake and Clang...

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
echo [Step 3/5] Building Rust project...
cargo build --release
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to build the Rust project. Please check the logs above.
    pause
    exit /b 1
)
echo Rust project built successfully.

:: Step 4: Download Raylib Windows release
echo [Step 4/5] Downloading Raylib Windows release...
curl -L https://github.com/raysan5/raylib/releases/download/4.5.0/raylib-4.5.0_win64_mingw-w64.zip -o raylib.zip
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to download Raylib. Please check your internet connection and try again.
    pause
    exit /b 1
)

:: Step 5: Extract raylib.dll
echo [Step 5/5] Extracting raylib.dll...
tar -xf raylib.zip --wildcards "*/lib/raylib.dll" --strip-components=2
copy raylib.dll target\release\
del raylib.zip
echo raylib.dll extracted and copied successfully.

echo Done! Run 'target\release\your_game.exe' to play.
pause
