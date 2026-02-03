@echo off
echo ========================================
echo Portfolio Update Script
echo ========================================
echo.

REM Check if git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Git is not installed!
    pause
    exit /b 1
)

REM Check if this is a git repository
if not exist ".git" (
    echo ERROR: This is not a git repository!
    echo Please run deploy-to-github.bat first to set up your repository.
    pause
    exit /b 1
)

echo This script will update your live portfolio with your latest changes.
echo.
echo Make sure you have edited index.html or style.css before running this.
echo.
set /p CONFIRM="Have you made your changes and want to deploy them? (Y/N): "

if /i not "%CONFIRM%"=="Y" (
    echo Update cancelled.
    pause
    exit /b 0
)

echo.
set /p COMMIT_MSG="Enter a description of your changes (e.g., 'Added new project'): "

if "%COMMIT_MSG%"=="" (
    set COMMIT_MSG=Update portfolio content
)

echo.
echo ========================================
echo Step 1: Adding changed files...
echo ========================================
git add .

echo.
echo ========================================
echo Step 2: Committing changes...
echo ========================================
git commit -m "%COMMIT_MSG%"

if errorlevel 1 (
    echo.
    echo No changes to commit. Your portfolio is already up to date!
    echo.
    pause
    exit /b 0
)

echo.
echo ========================================
echo Step 3: Pushing to GitHub...
echo ========================================
git push

if errorlevel 1 (
    echo.
    echo ========================================
    echo UPDATE FAILED!
    echo ========================================
    echo.
    echo There was an error pushing to GitHub.
    echo Please check your internet connection and GitHub credentials.
    echo.
    pause
    exit /b 1
)

echo.
echo ========================================
echo SUCCESS! Portfolio updated!
echo ========================================
echo.
echo Your changes will appear on your live site in 1-2 minutes.
echo.
echo Refresh your portfolio page to see the updates.
echo.
pause
