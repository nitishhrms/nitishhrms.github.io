@echo off
echo ========================================
echo GitHub Pages Deployment Script
echo ========================================
echo.

REM Check if git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Git is not installed!
    echo.
    echo Please install Git from: https://git-scm.com/download/win
    echo Then run this script again.
    pause
    exit /b 1
)

echo Git is installed. Proceeding...
echo.

REM Get GitHub username
set /p GITHUB_USERNAME="Enter your GitHub username (e.g., nitishhrms): "

if "%GITHUB_USERNAME%"=="" (
    echo ERROR: GitHub username cannot be empty!
    pause
    exit /b 1
)

echo.
echo Your GitHub Pages URL will be: https://%GITHUB_USERNAME%.github.io
echo Your repository URL will be: https://github.com/%GITHUB_USERNAME%/%GITHUB_USERNAME%.github.io
echo.
set /p CONFIRM="Is this correct? (Y/N): "

if /i not "%CONFIRM%"=="Y" (
    echo Deployment cancelled.
    pause
    exit /b 0
)

echo.
echo ========================================
echo Step 1: Initializing Git repository...
echo ========================================
git init

echo.
echo ========================================
echo Step 2: Adding files...
echo ========================================
git add .

echo.
echo ========================================
echo Step 3: Creating initial commit...
echo ========================================
git commit -m "Initial portfolio deployment"

echo.
echo ========================================
echo Step 4: Setting branch to main...
echo ========================================
git branch -M main

echo.
echo ========================================
echo Step 5: Adding remote repository...
echo ========================================
git remote add origin https://github.com/%GITHUB_USERNAME%/%GITHUB_USERNAME%.github.io.git

echo.
echo ========================================
echo Step 6: Pushing to GitHub...
echo ========================================
echo.
echo IMPORTANT: You may be prompted to login to GitHub.
echo Use your GitHub credentials when asked.
echo.
pause

git push -u origin main

if errorlevel 1 (
    echo.
    echo ========================================
    echo DEPLOYMENT FAILED!
    echo ========================================
    echo.
    echo Common issues:
    echo 1. Repository doesn't exist on GitHub
    echo 2. Authentication failed
    echo 3. Repository name is incorrect
    echo.
    echo Please:
    echo 1. Go to https://github.com/new
    echo 2. Create a repository named: %GITHUB_USERNAME%.github.io
    echo 3. Make it Public
    echo 4. DO NOT add README or .gitignore
    echo 5. Run this script again
    echo.
    pause
    exit /b 1
)

echo.
echo ========================================
echo SUCCESS! Portfolio deployed!
echo ========================================
echo.
echo Your portfolio will be live in 2-3 minutes at:
echo https://%GITHUB_USERNAME%.github.io
echo.
echo Repository:
echo https://github.com/%GITHUB_USERNAME%/%GITHUB_USERNAME%.github.io
echo.
echo Next steps:
echo 1. Wait 2-3 minutes for GitHub Pages to build
echo 2. Visit your portfolio URL
echo 3. Update social media links in index.html
echo 4. Share your portfolio!
echo.
echo ========================================
pause
