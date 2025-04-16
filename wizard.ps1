# Define variables
$raylibUrl = "https://github.com/raysan5/raylib/releases/download/5.5/raylib-5.5_win64_mingw-w64.zip"
$downloadPath = "$env:TEMP\raylib-5.5_win64_mingw-w64.zip"
$extractPath = "$env:USERPROFILE\raylib-5.5"
$binPath = "$extractPath\bin"

# Rust-specific variables
$rustInstallerUrl = "https://win.rustup.rs/x86_64"
$rustInstallerPath = "$env:TEMP\rustup-init.exe"

# CMake-specific variables
$cmakeUrl = "https://github.com/Kitware/CMake/releases/download/v4.0.1/cmake-4.0.1-windows-x86_64.zip"
$cmakeDownloadPath = "$env:TEMP\cmake-4.0.1-windows-x86_64.zip"
$cmakeExtractPath = "$env:USERPROFILE\cmake-4.0.1"
$cmakeBinPath = "$cmakeExtractPath\bin"

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
    # Check if the bin path already exists in the system PATH
    $currentPath = [Environment]::GetEnvironmentVariable("Path", "Machine")
    if ($currentPath -split ';' -contains $binPath) {
        Write-Host "Raylib's bin directory is already in the system PATH."
    } else {
        # Append the bin path to the system PATH
        $newPath = "$currentPath;$binPath"
        [Environment]::SetEnvironmentVariable("Path", $newPath, "Machine")
        Write-Host "Raylib's bin directory added to the system PATH."
    }
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

# Download CMake
Write-Host "Downloading CMake from: $cmakeUrl"
try {
    Invoke-WebRequest -Uri $cmakeUrl -OutFile $cmakeDownloadPath
    Write-Host "CMake downloaded successfully to: $cmakeDownloadPath"
} catch {
    Write-Host "Failed to download CMake. Error: $_"
    exit 1
}

# Extract CMake
Write-Host "Extracting CMake to: $cmakeExtractPath"
try {
    if (Test-Path -Path $cmakeExtractPath) {
        Remove-Item -Path $cmakeExtractPath -Recurse -Force
    }
    New-Item -ItemType Directory -Path $cmakeExtractPath | Out-Null
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [System.IO.Compression.ZipFile]::ExtractToDirectory($cmakeDownloadPath, $cmakeExtractPath)
    Write-Host "CMake extracted successfully."
} catch {
    Write-Host "Failed to extract CMake. Error: $_"
    exit 1
}

# Clean up the downloaded CMake ZIP file
Write-Host "Cleaning up downloaded CMake ZIP file..."
try {
    Remove-Item -Path $cmakeDownloadPath -Force
    Write-Host "CMake ZIP file removed: $cmakeDownloadPath"
} catch {
    Write-Host "Failed to remove CMake ZIP file. Error: $_"
}

# Add CMake's bin directory to the system PATH
Write-Host "Adding CMake's bin directory to the system PATH..."
try {
    # Check if the bin path already exists in the system PATH
    $currentPath = [Environment]::GetEnvironmentVariable("Path", "Machine")
    if ($currentPath -split ';' -contains $cmakeBinPath) {
        Write-Host "CMake's bin directory is already in the system PATH."
    } else {
        # Append the bin path to the system PATH
        $newPath = "$currentPath;$cmakeBinPath"
        [Environment]::SetEnvironmentVariable("Path", $newPath, "Machine")
        Write-Host "CMake's bin directory added to the system PATH."
    }
} catch {
    Write-Host "Failed to update the system PATH. Error: $_"
    exit 1
}

# Install Chocolatey
Write-Host "Installing Chocolatey package manager..."
try {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    Write-Host "Chocolatey installed successfully."
    
    # Refresh the PATH environment variable to include Chocolatey
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    
    # Verify Chocolatey installation
    if (Get-Command choco -ErrorAction SilentlyContinue) {
        Write-Host "Chocolatey is ready to use. You can now install packages with 'choco install'."
    } else {
        Write-Host "Chocolatey installation completed but may require a new shell session to use."
    }
} catch {
    Write-Host "Failed to install Chocolatey. Error: $_"
    exit 1
}

Write-Host "Raylib setup completed successfully. Files are located in: $extractPath"
Write-Host "Raylib's bin directory has been added to the system PATH."
Write-Host "Rust has been installed successfully."
Write-Host "CMake has been installed successfully. Files are located in: $cmakeExtractPath"
Write-Host "CMake's bin directory has been added to the system PATH."
Write-Host "Chocolatey package manager has been installed successfully."
