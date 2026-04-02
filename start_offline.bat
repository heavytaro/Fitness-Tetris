@echo off
setlocal
cd /d "%~dp0"

echo Starting local server for FIT TETRIS...

set PORT=9090

where py >nul 2>nul
if %errorlevel%==0 (
  start /b py -m http.server %PORT%
  timeout /t 1 /nobreak >nul
  start "" "http://127.0.0.1:%PORT%/index.html"
  py -m http.server %PORT%
  goto :eof
)

where python >nul 2>nul
if %errorlevel%==0 (
  start /b python -m http.server %PORT%
  timeout /t 1 /nobreak >nul
  start "" "http://127.0.0.1:%PORT%/index.html"
  python -m http.server %PORT%
  goto :eof
)

where node >nul 2>nul
if %errorlevel%==0 (
  start /b node -e "require('http').createServer((req,res)=>{require('fs').createReadStream('.'+(req.url==='/'?'/index.html':req.url)).on('error',()=>{res.statusCode=404;res.end('Not Found')}).pipe(res)}).listen(%PORT%)"
  timeout /t 1 /nobreak >nul
  start "" "http://127.0.0.1:%PORT%/index.html"
  goto :eof
)

echo.
echo ERROR: Python/py or Node.js not found.
echo Install Python (recommended) and retry.
echo.
pause
