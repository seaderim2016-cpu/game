@echo off
chcp 65001 > nul
cls
echo ===================================================
echo   Advanced GitHub Uploader for Half-Life Mod v2.0
echo ===================================================
echo.

echo [1] Checking Git Configuration...
:: Check if user config exists, if not, ask for it
git config --global user.name >nul 2>&1
if %errorlevel% neq 0 (
    echo Git username not found. Please enter it.
    set /p gl_user="Enter your Name (e.g. Ali Ahmed): "
    git config --global user.name "%gl_user%"
)

git config --global user.email >nul 2>&1
if %errorlevel% neq 0 (
    echo Git email not found. Please enter it.
    set /p gl_email="Enter your Email (e.g. ali@example.com): "
    git config --global user.email "%gl_email%"
)

echo.
echo [2] Initializing Git repository...
if exist ".git" (
    echo Existing repository detected. Resuming...
) else (
    git init
)

echo.
echo [3] Adding files (Please wait, this might take time)...
git add .

echo.
echo [4] Committing changes...
git commit -m "Updated Half-Life Mod Files" >nul 2>&1
if %errorlevel% neq 0 (
    echo No new changes to commit or already committed. Continuing...
) else (
    echo Changes committed successfully.
)

echo.
echo ===================================================
echo IMPORTANT: You need a GitHub Repository URL!
echo ===================================================
echo.

set /p repo_url="Paste your GitHub Repository URL here: "

echo.
echo [5] Linking to remote repository...
:: Remove old origin if exists to avoid errors
git remote remove origin >nul 2>&1
git remote add origin %repo_url%
git branch -M main

echo.
echo [6] Pushing files to GitHub...
echo Please ensure you are logged in if a popup appears.
git push -u origin main --force

echo.
echo ===================================================
echo Done! Please ignore any 'Everything up-to-date' messages.
echo Check your GitHub repository now.
echo ===================================================
pause
