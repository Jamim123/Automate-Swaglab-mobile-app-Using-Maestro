@echo off
setlocal

REM Load .env file manually
for /f "usebackq tokens=1,* delims==" %%A in ("Data\company_dta.env") do (
  set "%%A=%%B"
)

maestro test 
  --env USERNAME=%USERNAME% ^
  --env PASSWORD=%PASSWORD% ^
  --env GROUPNAME=%GROUPNAME%

endlocal