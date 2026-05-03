@echo off
title SHSEWS - Health Surveillance System
color 0A

echo.
echo    ███████╗██╗  ██╗███████╗███████╗██╗    ██╗███████╗
echo    ██╔════╝██║  ██║██╔════╝██╔════╝██║    ██║██╔════╝
echo    ███████╗███████║███████╗█████╗  ██║ █╗ ██║███████╗
echo    ╚════██║██╔══██║╚════██║██╔══╝  ██║███╗██║╚════██║
echo    ███████║██║  ██║███████║███████╗╚███╔███╔╝███████║
echo    ╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝ ╚══╝╚══╝ ╚══════╝
echo.
echo    Smart Health Surveillance ^& Early Warning System
echo    Government of India - Ministry of Health ^& Family Welfare
echo.
echo ================================================================

REM Check if we're in the right directory
if not exist "package.json" (
    echo ERROR: Please run this file from the project root directory!
    echo Current directory: %CD%
    pause
    exit /b 1
)

REM Quick dependency check
echo [1/4] Checking system requirements...
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python not found! Please install Python first.
    echo Download from: https://www.python.org/downloads/
    pause
    exit /b 1
)

node --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Node.js not found! Please install Node.js first.
    echo Download from: https://nodejs.org/
    pause
    exit /b 1
)

echo ✅ Python and Node.js found!

REM Install dependencies if needed
echo [2/4] Checking dependencies...
if not exist "node_modules" (
    echo Installing npm dependencies...
    npm install --silent
)
echo ✅ Dependencies ready!

REM Start services
echo [3/4] Starting backend server...
start "SHSEWS-Backend" cmd /c "cd backend && echo Starting ML Prediction Server... && python fixed_ml_server.py"

REM Wait for backend
timeout /t 4 /nobreak >nul

echo [4/4] Starting frontend application...
start "SHSEWS-Frontend" cmd /c "echo Starting React Application... && npm run dev"

echo.
echo ✅ SYSTEM STARTING...
echo.
echo 🌐 Application will open automatically in your browser
echo 📊 Backend API: http://localhost:5000
echo 🖥️  Frontend UI: http://localhost:8081
echo.
echo ⏳ Waiting for services to initialize...

REM Wait for frontend to start, then open browser
timeout /t 8 /nobreak >nul
echo.
echo 🚀 Opening SHSEWS Dashboard...
start http://localhost:8081

echo.
echo ================================================================
echo                    🎉 SYSTEM LAUNCHED! 🎉
echo ================================================================
echo.
echo Your AI-powered health surveillance system is now running!
echo.
echo 📋 Available Features:
echo    • Real-time ML outbreak predictions
echo    • Dual model analysis (LightGBM + Final)
echo    • Auto-cycling village reports
echo    • Professional trend analytics
echo    • Government-grade dashboard
echo.
echo 💡 To stop the system:
echo    • Close the Backend and Frontend windows
echo    • Or press Ctrl+C in each window
echo.
echo ⚠️  Keep this window open for status monitoring
echo.

:monitor
echo [%TIME%] System monitoring... (Press Ctrl+C to exit)
timeout /t 30 /nobreak >nul
goto monitor