@echo off
:: Check for admin privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo Setting up Neovim configuration...

:: Remove existing config if it exists
if exist %LOCALAPPDATA%\nvim (
    echo Backing up existing Neovim config...
    rename %LOCALAPPDATA%\nvim nvim_backup
)

:: Create symbolic link
echo Creating symbolic link...
mklink /D %LOCALAPPDATA%\nvim C:\Users\mike\Coding\dotfiles\nvim-config

echo Setup complete!
pause
