@echo off
setlocal
cd /d "%~dp0"
echo ============================================
echo OmniFind - setup and local launch
echo ============================================
where py >nul 2>nul
if %errorlevel%==0 (
  set "PY=py"
) else (
  set "PY=python"
)
echo Installing Python dependencies from requirements.txt...
%PY% -m pip install --upgrade pip
if errorlevel 1 goto failed
%PY% -m pip install -r requirements.txt
if errorlevel 1 goto failed
echo.
echo Starting OmniFind at http://127.0.0.1:5000/login
%PY% app.py
goto end
:failed
echo.
echo Dependency installation failed. Check the error above and try:
echo   python -m pip install -r requirements.txt
pause
:end
endlocal
