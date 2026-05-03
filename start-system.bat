@echo off
echo ============================================
echo   SHSEWS - Health Surveillance System
echo   Starting Backend and Frontend...
echo ============================================

REM Change to the project directory
cd /d "%~dp0"

REM Start the Python backend in a new window
echo Starting Python ML Backend Server...
start "SHSEWS Backend" cmd /k "cd backend && python fixed_ml_server.py"

REM Wait a moment for backend to start
timeout /t 3 /nobreak >nul

REM Start the React frontend in a new window
echo Starting React Frontend...
start "SHSEWS Frontend" cmd /k "npm run dev"

echo.
echo ============================================
echo   System Starting...
echo ============================================
echo   Backend: http://localhost:5000
echo   Frontend: http://localhost:8081
echo ============================================
echo.
echo Press any key to open the application in browser...
pause >nul

REM Open the application in default browser
start http://localhost:8081

echo.
echo System is now running!
echo Close this window to keep both servers running.
echo To stop the system, close the Backend and Frontend windows.
pause