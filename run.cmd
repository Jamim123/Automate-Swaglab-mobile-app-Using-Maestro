@echo off
setlocal

REM Load .env file manually
for /f "usebackq tokens=1,* delims==" %%A in ("Data\user_input.env") do (
  set "%%A=%%B"
)

maestro test android.apk Flows\add_to_cart.yaml^
  --env PASSWORD=%PASSWORD%

endlocal