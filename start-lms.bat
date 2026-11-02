@echo off
title Nexora LMS Full-Stack Launcher
echo ===================================================
echo           Starting Nexora LMS Platform
echo ===================================================
echo.
echo 1. Launching Django Backend at http://127.0.0.1:8000 ...
start "Nexora Django Backend" cmd /k "cd /d "%~dp0lms_backend\backend" && "%~dp0lms_backend\venv\Scripts\python.exe" manage.py runserver 127.0.0.1:8000"

echo 2. Launching React Frontend at http://localhost:3000 ...
start "Nexora React Frontend" cmd /k "cd /d "%~dp0frontend" && npm start"

echo.
echo ===================================================
echo Backend and Frontend are starting in separate windows.
echo Opening browser at http://localhost:3000 ...
echo ===================================================
timeout /t 5 >nul
start http://localhost:3000
