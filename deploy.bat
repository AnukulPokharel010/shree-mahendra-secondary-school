@echo off
echo ========================================
echo   Shree Mahendra School - Deployment
echo ========================================
echo.

echo Step 1: Installing dependencies...
call npm install
if %errorlevel% neq 0 (
    echo Error: Failed to install dependencies
    pause
    exit /b 1
)

echo.
echo Step 2: Building the project...
call npm run build
if %errorlevel% neq 0 (
    echo Error: Failed to build project
    pause
    exit /b 1
)

echo.
echo ========================================
echo   BUILD SUCCESSFUL!
echo ========================================
echo.
echo Your website is ready for deployment!
echo.
echo Next steps:
echo 1. Go to https://netlify.com
echo 2. Sign up/Login
echo 3. Drag and drop the 'out' folder
echo 4. Your site will be live instantly!
echo.
echo The 'out' folder contains your complete website
echo that can be deployed to any hosting service.
echo.
pause
