@echo off
setlocal
cd /d "%~dp0"
title MyOwnAI EXE Launcher

if not exist "dist\MyOwnAI.exe" (
    echo dist\MyOwnAI.exe not found. Building first...
    call build_exe.bat
    if errorlevel 1 (
        echo Build failed. Please check logs above.
        pause
        exit /b 1
    )
)

echo Launching dist\MyOwnAI.exe ...
start "" "dist\MyOwnAI.exe"
