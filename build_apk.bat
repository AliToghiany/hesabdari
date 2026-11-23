@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo ====================================================
echo   Building ModiriatSefareshPro Android APK (v3.3)
echo ====================================================
where gradle >nul 2>&1
if errorlevel 1 (
    echo [INFO] Open this folder in Android Studio or upload to GitHub Actions to build APK automatically.
    pause
    exit /b 1
)
gradle assembleDebug
if exist "app\build\outputs\apk\debug\app-debug.apk" (
    copy /Y "app\build\outputs\apk\debug\app-debug.apk" "ModiriatSefareshPro-v3.3.apk" >nul
    echo SUCCESS! APK created: ModiriatSefareshPro-v3.3.apk
)
pause
