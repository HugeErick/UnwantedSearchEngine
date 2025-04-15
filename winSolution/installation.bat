@echo off
setlocal EnableDelayedExpansion

:: Check for admin rights
net session >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo Error: This script requires admin privileges.
    pause
    exit /b 1
)

cd /d "%~dp0"
cd ..

:: Step 1: Install Rust if not already installed
where rustc >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo [Step 1/5] Installing Rust...
    powershell -Command "Invoke-WebRequest https://win.rustup.rs/x86_64 -OutFile rustup-init.exe"
    if exist rustup-init.exe (
        set RUSTUP_INIT_SKIP_PATH_CHECK=yes
        set CARGO_HOME=%USERPROFILE%\.cargo
        set RUSTUP_HOME=%USERPROFILE%\.rustup
        rustup-init.exe -y --default-toolchain stable --no-modify-path
        del rustup-init.exe
        setx PATH "%PATH%;%USERPROFILE%\.cargo\bin" /M
        set PATH=%PATH%;%USERPROFILE%\.cargo\bin
        echo Rust installed successfully.
    ) else (
        echo Error: rustup-init.exe download failed.
        pause
        exit /b 1
    )
) else (
    echo Rust already installed. Skipping.
)

:: Step 2: Install CMake and Clang if not found
where cmake >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo [Step 2/5] Installing CMake...
    curl -L https://github.com/Kitware/CMake/releases/download/v4.0.0/cmake-4.0.0-windows-x86_64.zip -o cmake.zip
    mkdir "C:\Program Files\CMake"
    powershell -Command "Expand-Archive 'cmake.zip' 'C:\Program Files\CMake'" >nul
    del cmake.zip
    setx PATH "%PATH%;C:\Program Files\CMake\bin" /M
) else (
    echo CMake already installed. Skipping.
)

where clang >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo Installing Clang...
    curl -L https://github.com/llvm/llvm-project/releases/download/llvmorg-20.1.2/LLVM-20.1.2-win64.exe -o llvm.exe
    llvm.exe /S /D="C:\Program Files\LLVM"
    del llvm.exe
    setx PATH "%PATH%;C:\Program Files\LLVM\bin" /M
) else (
    echo Clang already installed. Skipping.
)

:: Step 3: Build Rust project
echo [Step 3/5] Building Rust project...
cargo build --release
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to build the Rust project.
    pause
    exit /b 1
)
echo Rust project built successfully.

:: Step 4: Download Raylib if raylib.dll not found
if not exist target\release\raylib.dll (
    echo [Step 4/5] Downloading Raylib...
    curl -L https://github.com/raysan5/raylib/releases/download/4.5.0/raylib-4.5.0_win64_mingw-w64.zip -o raylib.zip

    echo [Step 5/5] Extracting raylib.dll...
    powershell -Command "Expand-Archive 'raylib.zip' 'raylib_temp'" >nul

    for /R "raylib_temp" %%f in (raylib.dll) do (
        copy "%%f" target\release\
    )

    rmdir /s /q raylib_temp
    del raylib.zip
    echo raylib.dll extracted and copied successfully.
) else (
    echo raylib.dll already exists. Skipping download and extraction.
)

echo Done! Run 'target\release\UnwantedSearchEngine.exe' to play.
pause
exit /b 0

