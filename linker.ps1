# Get the path to the release binary
$releaseBinary = Join-Path $PSScriptRoot "target\release\UnwantedSearchEngine.exe"

# Debugging: Print the resolved path
Write-Host "Resolved path: $releaseBinary"

# Check if the release binary exists
if (-Not (Test-Path $releaseBinary)) {
    Write-Host "Release binary not found at: $releaseBinary"
    Read-Host "Press Enter to exit..."
} else {
    Write-Host "Release binary found at: $releaseBinary"

    # Create a desktop shortcut
    $desktopPath = [System.Environment]::GetFolderPath("Desktop")
    $shortcutName = "UnwantedSearchEngine.lnk"
    $shortcutPath = Join-Path $desktopPath $shortcutName

    # Use the Windows Script Host Shell object to create the shortcut
    $shell = New-Object -ComObject WScript.Shell
    $shortcut = $shell.CreateShortcut($shortcutPath)
    $shortcut.TargetPath = $releaseBinary
    $shortcut.WorkingDirectory = Split-Path $releaseBinary
    $shortcut.Save()

    Write-Host "Desktop shortcut created: $shortcutPath"
}