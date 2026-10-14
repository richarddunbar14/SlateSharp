@echo off
rem Builds the game simulations the page needs right now:
rem   1. tonight's NBA, NHL and MLB slates (Oct 14), and
rem   2. this week's NFL slates (the Thu-Mon slate carries Oct 15; the same file is written for Sunday Oct 18).
rem Each build is checked and rolled back if it fails, so a bad run never replaces a good file.
rem About 5-10 minutes in all. Close other heavy programs first (the simulation uses several processes and a lot of memory).
setlocal
set "ROOT=C:\Users\richa\SlateSharp"
set "PY=C:\Users\richa\AppData\Local\Programs\Python\Python311\python.exe"
if not exist "%PY%" set "PY=python"
set "SLATESHARP_PY=%PY%"
set "PYTHONIOENCODING=utf-8"
cd /d "%ROOT%"

echo.
echo === NBA, NHL and MLB for 2026-10-14 ===
"%PY%" scripts\sim_day.py --day 2026-10-14 --sports nba nhl mlb --workers 2

echo.
echo === NFL for the week of 2026-10-18 ===
"%PY%" scripts\sim_day.py --day 2026-10-15 --sports nfl --workers 2

echo.
echo Done. Reload http://localhost:3100 (if the page is not running, open "Start SlateSharp.bat").
echo Read the lines above: "ROLLED BACK" or "FAILED" next to a sport means that sport did not get a new simulation.
pause
