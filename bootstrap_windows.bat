@echo off
where flutter >nul 2>nul
if errorlevel 1 (
  echo Flutter was not found in PATH. Install Flutter, reopen the terminal, and run this file again.
  pause
  exit /b 1
)
flutter create --platforms=android,ios .
flutter pub get
flutter run
