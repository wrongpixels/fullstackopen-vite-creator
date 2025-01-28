@echo off
color 0B

echo.
echo    ========================
echo      VITE PROJECT CREATOR
echo    ========================
echo.
echo    *************************
echo     * React + Vite Setup *
echo    *************************
echo.

:folder_input
set "pretext=part"
<nul set /p ="    Part or subfolder name: %pretext%"
set /p suffix=""
set "folder_name=%pretext%%suffix%"

if "%folder_name%"=="" (
    echo.
    echo    [ERROR!] Folder name cannot be empty
    echo    Press any key to try again...
    pause >nul
    cls
    goto :folder_input
)

if not exist "%folder_name%" (
    echo    - Creating subfolder %folder_name%...
    mkdir "%folder_name%"
    echo Exercises for Part %suffix% > "%folder_name%\README.md"
) 
echo    - %folder_name% selected!
echo.

cd "%folder_name%"

:project_input
set /p project_name="    Project name: "

if exist "%project_name%" (
    echo    [ERROR!] Project %project_name% already exists in %folder_name%!
    echo    Please choose a different name.
    goto :project_input
)

echo.
echo    [Starting] Creating project %project_name%...
echo    ============================================
call npm create vite@latest %project_name% -- --template react
cd %project_name%
call npm install

:: JSON Server Setup
echo.
:json_server_prompt
set /p json_server="    Add JSON Server features? (Y/N): "
if /i "%json_server%"=="Y" (
    echo    - Installing axios...
    call npm install axios
    echo    - Creating db.json...
    echo {^} > db.json
    echo    - Creating run-json-server.bat...
    echo npx json-server --port 3001 --watch db.json > run-json-server.bat
    set json_server_enabled=Y
) else if /i not "%json_server%"=="N" (
    echo    [ERROR!] Invalid input. Please enter Y/N
    goto :json_server_prompt
)

echo    [Cleaning] Removing unnecessary files...
del /Q src\*.css
del /Q src\assets\*.*
rmdir /S /Q src\assets
del /Q public\*.*

echo    [Setup] Creating minimal structure...
echo import React from 'react' > src\main.jsx
echo import ReactDOM from 'react-dom/client' >> src\main.jsx
echo import App from './App' >> src\main.jsx
echo. >> src\main.jsx
echo ReactDOM.createRoot(document.getElementById('root')).render( >> src\main.jsx
echo   ^<React.StrictMode^> >> src\main.jsx
echo     ^<App /^> >> src\main.jsx
echo   ^</React.StrictMode^> >> src\main.jsx
echo ) >> src\main.jsx

echo function App() { > src\App.jsx
echo   return ( >> src\App.jsx
echo     ^<div^> >> src\App.jsx
echo       ^<h1^>My AMAZING empty project^</h1^> >> src\App.jsx
echo     ^</div^> >> src\App.jsx
echo   ) >> src\App.jsx
echo } >> src\App.jsx
echo. >> src\App.jsx
echo export default App >> src\App.jsx

echo ^<!DOCTYPE html^> > index.html
echo ^<html lang="en"^> >> index.html
echo   ^<head^> >> index.html
echo     ^<meta charset="UTF-8" /^> >> index.html
echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0" /^> >> index.html
echo     ^<title^>React App^</title^> >> index.html
echo   ^</head^> >> index.html
echo   ^<body^> >> index.html
echo     ^<div id="root"^>^</div^> >> index.html
echo     ^<script type="module" src="/src/main.jsx"^>^</script^> >> index.html
echo   ^</body^> >> index.html
echo ^</html^> >> index.html

echo    [Setup] Creating quick start script...
echo @echo off > runweb.bat
echo color 0A >> runweb.bat
echo taskkill /F /IM node.exe ^>nul 2^>^&1 >> runweb.bat
echo for /f "tokens=5" %%%%a in ('netstat -ano ^^^| findstr ":5173"') do ( >> runweb.bat
echo     taskkill /F /PID %%%%a ^>nul 2^>^&1 >> runweb.bat
echo ) >> runweb.bat
echo for /f "tokens=5" %%%%a in ('netstat -ano ^^^| findstr ":5174"') do ( >> runweb.bat
echo     taskkill /F /PID %%%%a ^>nul 2^>^&1 >> runweb.bat
echo ) >> runweb.bat
echo echo Starting development server... >> runweb.bat
echo start "" npm run dev >> runweb.bat
echo timeout /t 4 ^>nul >> runweb.bat
echo start http://localhost:5173 >> runweb.bat

cls
echo.
echo    ================================
echo    [SUCCESS] Project created!
echo    ================================
echo.
echo    To start the local server any time:
echo    1. Navigate to %folder_name%\%project_name%
if "%json_server_enabled%"=="Y" (
    echo    2. Double-click runweb.bat AND run-json-server.bat
) else (
    echo    2. Double-click runweb.bat
)
echo.
echo    Would you like to start the development server now? (Y/N)
set /p choice="    Your choice: "

if /i "%choice%"=="Y" (
    cls
    echo    Starting development server...
    if "%json_server_enabled%"=="Y" (
        echo    Starting JSON Server...
        start "" run-json-server.bat
    )
    echo    ============================
    echo.
    start /B runweb.bat
    cd ..
    cd ..
    exit
) else (
    echo.
    echo    Happy coding!
    cd ..
    cd ..
    timeout /t 2 >nul
    exit
)