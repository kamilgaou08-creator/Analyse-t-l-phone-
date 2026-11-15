@echo off
where gradle >nul 2>nul
if %ERRORLEVEL% EQU 0 (
  gradle %*
  exit /b %ERRORLEVEL%
)
echo Gradle 8.9 is required. Install Gradle or use GitHub Actions.
exit /b 1
