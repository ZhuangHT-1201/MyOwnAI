@echo off
setlocal
cd /d "%~dp0"
title MyOwnAI Startup Console (Python 3.12)

set "VENV_DIR=.venv312"

echo ==========================================
echo MyOwnAI local startup (Python 3.12)
echo Workspace: %cd%
echo Venv: %VENV_DIR%
echo ==========================================
echo.

echo [1/7] Checking Python 3.12...
py -3.12 --version >nul 2>nul
if errorlevel 1 (
    echo ERROR: Python 3.12 is not installed or not available via py launcher.
    echo Please install Python 3.12 first, then run this script again.
    goto :END
)

if not exist "%VENV_DIR%\Scripts\python.exe" (
    echo [2/7] Creating Python 3.12 virtual environment...
    py -3.12 -m venv "%VENV_DIR%"
    if errorlevel 1 (
        echo ERROR: Failed to create %VENV_DIR%.
        goto :END
    )
) else (
    echo [2/7] Reusing existing %VENV_DIR%...
)

echo [3/7] Activating virtual environment...
call "%VENV_DIR%\Scripts\activate.bat"
if errorlevel 1 (
    echo ERROR: Failed to activate %VENV_DIR%.
    goto :END
)

echo [4/7] Upgrading pip/setuptools/wheel...
python -m pip install --upgrade pip "setuptools<82" wheel
if errorlevel 1 (
    echo ERROR: Failed while upgrading tooling.
    goto :END
)

echo [5/7] Installing project requirements...
pip install -r requirements.txt
if errorlevel 1 (
    echo ERROR: Failed while installing requirements.txt.
    goto :END
)

echo [6/7] Installing pywebview for native desktop window...
pip install pywebview
if errorlevel 1 (
    echo WARNING: pywebview install failed. App will fallback to browser mode.
    echo.
)

echo [7/7] Checking Ollama service...
curl -s http://127.0.0.1:11434/api/tags >nul 2>nul
if errorlevel 1 (
    echo WARNING: Ollama does not seem to be running.
    echo Please start it in another terminal with: ollama serve
    echo.
)

echo Starting app...
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
