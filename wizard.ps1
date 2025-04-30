<#
.SYNOPSIS
    Installs Raylib development environment with all dependencies including CMake and LLVM via Chocolatey.
.DESCRIPTION
    This script sets up a complete Raylib development environment including:
    - Raylib binaries
    - Rust toolchain
    - CMake (via Chocolatey)
    - LLVM/Clang (via Chocolatey)
    - Visual C++ Build Tools
.NOTES
    File Name      : Setup-Raylib-Environment.ps1
    Prerequisite   : PowerShell running as Administrator
#>

#Requires -RunAsAdministrator

# Define variables
$raylibUrl = "https://github.com/raysan5/raylib/releases/download/5.5/raylib-5.5_win64_mingw-w64.zip"
$downloadPath = "$env:TEMP\raylib-5.5_win64_mingw-w64.zip"
$extractPath = "$env:USERPROFILE\raylib-5.5"
$binPath = "$extractPath\bin"

# Rust-specific variables
$rustInstallerUrl = "https://win.rustup.rs/x86_64"
$rustInstallerPath = "$env:TEMP\rustup-init.exe"

function Add-ToSystemPath {
    param(
        [string]$PathToAdd
    )
    
    $systemPath = [System.Environment]::GetEnvironmentVariable('Path', 'Machine')
    if ($systemPath -split ';' -notcontains $PathToAdd) {
        $newPath = $systemPath + ';' + $PathToAdd
        [System.Environment]::SetEnvironmentVariable('Path', $newPath, 'Machine')
        Write-Host "Added $PathToAdd to system PATH" -ForegroundColor Green
        return $true
    }
    return $false
}

function Refresh-Environment {
    # Refresh PATH from registry
    $env:Path = [System.Environment]::GetEnvironmentVariable('Path','Machine') + ';' + 
                [System.Environment]::GetEnvironmentVariable('Path','User')
}

# Create or clean the extraction directory
if (Test-Path -Path $extractPath) {
    Write-Host "Cleaning up existing extraction directory: $extractPath"
    try {
        Remove-Item -Path $extractPath -Recurse -Force
        Write-Host "Existing directory removed successfully."
    } catch {
        Write-Host "Failed to remove existing directory. Error: $_"
        exit 1
    }
}

Write-Host "Creating directory: $extractPath"
New-Item -ItemType Directory -Path $extractPath | Out-Null

# Download Raylib
Write-Host "Downloading Raylib from: $raylibUrl"
try {
    Invoke-WebRequest -Uri $raylibUrl -OutFile $downloadPath
    Write-Host "Raylib downloaded successfully to: $downloadPath"
} catch {
    Write-Host "Failed to download Raylib. Error: $_"
    exit 1
}

# Extract the ZIP file
Write-Host "Extracting Raylib to: $extractPath"
try {
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [System.IO.Compression.ZipFile]::ExtractToDirectory($downloadPath, $extractPath)
    Write-Host "Raylib extracted successfully."
} catch {
    Write-Host "Failed to extract Raylib. Error: $_"
    exit 1
}

# Clean up the downloaded ZIP file
Write-Host "Cleaning up downloaded ZIP file..."
try {
    Remove-Item -Path $downloadPath -Force
    Write-Host "ZIP file removed: $downloadPath"
} catch {
    Write-Host "Failed to remove ZIP file. Error: $_"
}

# Add Raylib's bin directory to the system PATH
Write-Host "Adding Raylib's bin directory to the system PATH..."
try {
    Add-ToSystemPath -PathToAdd $binPath
    Refresh-Environment
} catch {
    Write-Host "Failed to update the system PATH. Error: $_"
    exit 1
}

# Download Rust installer
Write-Host "Downloading Rust installer from: $rustInstallerUrl"
try {
    Invoke-WebRequest -Uri $rustInstallerUrl -OutFile $rustInstallerPath
    Write-Host "Rust installer downloaded successfully to: $rustInstallerPath"
} catch {
    Write-Host "Failed to download Rust installer. Error: $_"
    exit 1
}

# Install Rust
Write-Host "Installing Rust..."
try {
    Start-Process -FilePath $rustInstallerPath -ArgumentList "-y" -NoNewWindow -Wait
    Write-Host "Rust installed successfully."
} catch {
    Write-Host "Failed to install Rust. Error: $_"
    exit 1
}

# Clean up the Rust installer
Write-Host "Cleaning up Rust installer..."
try {
    Remove-Item -Path $rustInstallerPath -Force
    Write-Host "Rust installer removed: $rustInstallerPath"
} catch {
    Write-Host "Failed to remove Rust installer. Error: $_"
}

# Install Chocolatey (if not already installed)
Write-Host "Checking for Chocolatey package manager..."
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Chocolatey package manager..."
    try {
        Set-ExecutionPolicy Bypass -Scope Process -Force
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
        Refresh-Environment
        
        if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
            throw "Chocolatey installation failed"
        }
        Write-Host "Chocolatey installed successfully." -ForegroundColor Green
    } catch {
        Write-Host "Failed to install Chocolatey: $_" -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host "Chocolatey is already installed." -ForegroundColor Green
}

# Install/Upgrade CMake using Chocolatey
Write-Host "Installing/Upgrading CMake using Chocolatey..."
try {
    choco upgrade cmake --installargs 'ADD_CMAKE_TO_PATH=System' -y
    
    # Manually ensure CMake is in PATH
    $cmakePath = "${env:ProgramFiles}\CMake\bin"
    if (Test-Path $cmakePath) {
        Add-ToSystemPath -PathToAdd $cmakePath
    }
    
    Refresh-Environment
    
    # Verify installation
    if (Get-Command cmake -ErrorAction SilentlyContinue) {
        Write-Host "CMake version:"
        cmake --version
    } else {
        throw "CMake installation verification failed"
    }
} catch {
    Write-Host "Failed to install CMake: $_" -ForegroundColor Red
    exit 1
}

# Install LLVM/Clang using Chocolatey
Write-Host "Installing LLVM/Clang using Chocolatey..." -ForegroundColor Yellow
try {
    choco install llvm -y
    
    # LLVM typically adds itself to PATH, but let's verify
    $llvmPath = "${env:ProgramFiles}\LLVM\bin"
    if (Test-Path $llvmPath) {
        Add-ToSystemPath -PathToAdd $llvmPath
    }
    
    Refresh-Environment
    
    # Verify installation
    if (Get-Command clang -ErrorAction SilentlyContinue) {
        Write-Host "Clang version:"
        clang --version
    } else {
        Write-Host "LLVM/Clang installed but not in PATH. You may need to restart your terminal." -ForegroundColor Yellow
    }
} catch {
    Write-Host "Failed to install LLVM/Clang: $_" -ForegroundColor Red
    exit 1
}

# Install Visual C++ Build Tools via Chocolatey
Write-Host "Installing Visual C++ Build Tools via Chocolatey..." -ForegroundColor Yellow
try {
    choco install visualcpp-build-tools --version=17.0.0 --force -y
    Write-Host "Visual C++ Build Tools installed successfully." -ForegroundColor Green
} catch {
    Write-Host "Failed to install visualcpp-build-tools. Error: $_" -ForegroundColor Red
    exit 1
}

# Locate the MSVC tools directory dynamically (optional check)
Write-Host "Searching for MSVC tools directory..." -ForegroundColor Yellow
$msvcPath = $null

# Search common locations
$possiblePaths = @(
    "C:\Program Files (x86)\Microsoft Visual Studio\*\BuildTools\VC\Tools\MSVC",
    "C:\Program Files (x86)\Microsoft Visual Studio\*\Community\VC\Tools\MSVC"
)

foreach ($pathPattern in $possiblePaths) {
    $matchingPaths = Get-ChildItem -Path $pathPattern -Directory -ErrorAction SilentlyContinue
    if ($matchingPaths.Count -gt 0) {
        $msvcPath = $matchingPaths[0].FullName
        Write-Host "MSVC tools found at: $msvcPath" -ForegroundColor Green
        break
    }
}

# If found, locate link.exe
if ($msvcPath) {
    $linkExePath = Get-ChildItem -Path $msvcPath -Recurse -Filter "link.exe" | Select-Object -First 1 -ExpandProperty FullName
    if ($linkExePath) {
        Write-Host "link.exe found at: $linkExePath" -ForegroundColor Green
    }
}

# Final success message
Write-Host @"
=============================================
Raylib development environment setup complete!
=============================================

Components installed:
- Raylib 5.5: $extractPath
- Rust toolchain
- CMake (via Chocolatey)
- LLVM/Clang (via Chocolatey)
- Visual C++ Build Tools

Your system PATH has been updated to include:
- Raylib binaries
- CMake
- LLVM/Clang

"@ -ForegroundColor Green
