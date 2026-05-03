# SHSEWS - Smart Health Surveillance & Early Warning System
# PowerShell Startup Script for Windows

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "   SHSEWS - Health Surveillance System" -ForegroundColor Green
Write-Host "   Starting Backend and Frontend..." -ForegroundColor Yellow
Write-Host "============================================" -ForegroundColor Cyan

# Get the script directory
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $ScriptDir

# Function to check if a port is in use
function Test-Port {
    param($Port)
    try {
        $connection = New-Object System.Net.Sockets.TcpClient
        $connection.Connect("127.0.0.1", $Port)
        $connection.Close()
        return $true
    }
    catch {
        return $false
    }
}

# Check if Python is available
try {
    $pythonVersion = python --version 2>&1
    Write-Host "✓ Python found: $pythonVersion" -ForegroundColor Green
}
catch {
    Write-Host "✗ Python not found! Please install Python." -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit
}

# Check if Node.js is available
try {
    $nodeVersion = node --version 2>&1
    Write-Host "✓ Node.js found: $nodeVersion" -ForegroundColor Green
}
catch {
    Write-Host "✗ Node.js not found! Please install Node.js." -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit
}

# Check if npm dependencies are installed
if (!(Test-Path "node_modules")) {
    Write-Host "Installing npm dependencies..." -ForegroundColor Yellow
    npm install
}

Write-Host "`nStarting services..." -ForegroundColor Yellow

# Start Python backend
Write-Host "🚀 Starting Python ML Backend Server..." -ForegroundColor Green
$backendJob = Start-Process -FilePath "cmd" -ArgumentList "/c", "cd /d `"$ScriptDir\backend`" && python fixed_ml_server.py" -WindowStyle Normal -PassThru

# Wait for backend to start
Write-Host "⏳ Waiting for backend to initialize..." -ForegroundColor Yellow
Start-Sleep -Seconds 3

# Check if backend started successfully
if (Test-Port 5000) {
    Write-Host "✓ Backend server started on http://localhost:5000" -ForegroundColor Green
} else {
    Write-Host "⚠️ Backend may still be starting..." -ForegroundColor Yellow
}

# Start React frontend
Write-Host "🌐 Starting React Frontend..." -ForegroundColor Green
$frontendJob = Start-Process -FilePath "cmd" -ArgumentList "/c", "cd /d `"$ScriptDir`" && npm run dev" -WindowStyle Normal -PassThru

# Wait for frontend to start
Write-Host "⏳ Waiting for frontend to initialize..." -ForegroundColor Yellow
Start-Sleep -Seconds 5

Write-Host "`n============================================" -ForegroundColor Cyan
Write-Host "   🎉 SHSEWS System Started Successfully!" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "   📊 Backend API: http://localhost:5000" -ForegroundColor White
Write-Host "   🌐 Frontend App: http://localhost:8081" -ForegroundColor White
Write-Host "============================================" -ForegroundColor Cyan

# Wait a moment then open browser
Write-Host "`n🌐 Opening application in browser..." -ForegroundColor Yellow
Start-Sleep -Seconds 2
Start-Process "http://localhost:8081"

Write-Host "`n✅ System is now running!" -ForegroundColor Green
Write-Host "📝 Features available:" -ForegroundColor White
Write-Host "   • AI-powered outbreak predictions" -ForegroundColor Gray
Write-Host "   • Real-time village health monitoring" -ForegroundColor Gray
Write-Host "   • Dual ML model analysis (LightGBM + Final)" -ForegroundColor Gray
Write-Host "   • Comprehensive trend analytics" -ForegroundColor Gray
Write-Host "   • Government-grade dashboard" -ForegroundColor Gray

Write-Host "`n📋 System Status:" -ForegroundColor White
Write-Host "   • Backend Process ID: $($backendJob.Id)" -ForegroundColor Gray
Write-Host "   • Frontend Process ID: $($frontendJob.Id)" -ForegroundColor Gray

Write-Host "`n⚠️ To stop the system:" -ForegroundColor Yellow
Write-Host "   • Close both command windows that opened" -ForegroundColor Gray
Write-Host "   • Or press Ctrl+C in each window" -ForegroundColor Gray

Write-Host "`nPress any key to exit this launcher (services will continue running)..." -ForegroundColor Cyan
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")