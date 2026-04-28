@echo off
setlocal
cd /d "%~dp0"
title MyOwnAI Build Console

echo [0/5] Cleaning old running app and build artifacts...
taskkill /F /IM MyOwnAI.exe >nul 2>nul
timeout /t 1 /nobreak >nul

if exist "dist\MyOwnAI.exe" (
    del /F /Q "dist\MyOwnAI.exe" >nul 2>nul
)
if exist "dist\MyOwnAI.exe" (
    echo Old exe is still locked, retrying...
    timeout /t 2 /nobreak >nul
    del /F /Q "dist\MyOwnAI.exe" >nul 2>nul
)
if exist "dist\MyOwnAI.exe" (
    echo ERROR: dist\MyOwnAI.exe is in use. Please close it and run build again.
    pause
    exit /b 1
)

echo [1/5] Creating virtual environment if missing...
if not exist ".venv\Scripts\python.exe" (
    python -m venv .venv
    if errorlevel 1 (
        echo ERROR: Failed to create .venv
        goto :END
    )
)

echo [2/5] Installing dependencies...
call ".venv\Scripts\activate.bat"
if errorlevel 1 (
    echo ERROR: Failed to activate .venv
    goto :END
)
python -m pip install --upgrade pip "setuptools<82" wheel
if errorlevel 1 (
    echo ERROR: Failed to upgrade packaging tools
    goto :END
)
pip install -r requirements.txt
if errorlevel 1 (
    echo ERROR: Failed to install requirements.txt
    goto :END
)
pip install pywebview
if errorlevel 1 (
    echo WARNING: pywebview install failed. EXE may fallback from native window mode.
)

echo [3/5] Building executable with PyInstaller...
pyinstaller ^
  --noconfirm ^
  --clean ^
  --name MyOwnAI ^
  --onefile ^
  --noconsole ^
  --icon app.ico ^
  --add-data "app.ico;." ^
  --hidden-import=tkinter ^
  --collect-all webview ^
  --collect-all safehttpx ^
  --collect-all httpx ^
  --collect-all groovy ^
  --collect-all whisper ^
  --collect-all gradio ^
  --collect-all gradio_client ^
  --collect-all edge_tts ^
  main.py
if errorlevel 1 (
    echo ERROR: PyInstaller build failed.
    goto :END
)

echo [4/5] Build complete.
echo EXE path: %cd%\dist\MyOwnAI.exe
echo.
echo [5/5] Double-click dist\MyOwnAI.exe to run.
:END
pause
