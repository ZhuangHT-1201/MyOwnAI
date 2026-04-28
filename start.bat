@echo off
setlocal
cd /d "%~dp0"
title MyOwnAI Startup Console

echo ================================
echo MyOwnAI local startup
echo Workspace: %cd%
echo ================================
echo.

if not exist ".venv\Scripts\python.exe" (
    echo [1/6] Creating virtual environment...
    python -m venv .venv
    if errorlevel 1 (
        echo ERROR: Failed to create virtual environment.
        goto :END
    )
)

echo [2/6] Activating virtual environment...
call ".venv\Scripts\activate.bat"
if errorlevel 1 (
    echo ERROR: Failed to activate virtual environment.
    goto :END
)

echo [3/6] Upgrading pip...
python -m pip install --upgrade pip "setuptools<82" wheel
if errorlevel 1 (
    echo ERROR: Failed while upgrading pip/setuptools/wheel.
    goto :END
)

echo [4/6] Installing requirements...
pip install -r requirements.txt
if errorlevel 1 (
    echo ERROR: Failed while installing requirements.
    goto :END
)
pip install pywebview
if errorlevel 1 (
    echo WARNING: pywebview install failed. App will fallback to browser mode.
    echo.
)

echo [5/6] Checking Ollama service...
curl -s http://127.0.0.1:11434/api/tags >nul 2>nul
if errorlevel 1 (
    echo WARNING: Ollama does not seem to be running.
    echo Please start it in another terminal with: ollama serve
    echo.
)

echo [6/6] Starting app...
set USE_NATIVE_WINDOW=1
set AUTO_OPEN_BROWSER=0
set PYTHONUTF8=1
python main.py
if errorlevel 1 (
    echo.
    echo ERROR: main.py exited with error code %errorlevel%.
)

:END
echo.
echo Startup script finished. Press any key to close this window...
pause >nul
