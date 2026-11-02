@echo off
cd /d "%~dp0lms_backend\backend"
..\venv\Scripts\python.exe manage.py runserver 127.0.0.1:8000
