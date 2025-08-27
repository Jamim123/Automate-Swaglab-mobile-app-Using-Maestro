@echo off
setlocal EnableExtensions EnableDelayedExpansion

chcp 65001 >nul

set "ENVFILE=Data\user_input.env"

REM Load .env file manually
for /f "usebackq eol=# tokens=1,* delims==" %%A in ("%ENVFILE%") do (
  set "key=%%~A"
  set "val=%%~B"

  REM Strip UTF-8 BOM if present on first key (ï»¿)
  if "!key:~0,1!"=="ï" if "!key:~1,1!"=="»" if "!key:~2,1!"=="¿" set "key=!key:~3!"

  REM Trim surrounding quotes from value: "Foo Bar" -> Foo Bar
  if defined val if "!val:~0,1!"=="\"" if "!val:~-1!"=="\"" set "val=!val:~1,-1!"

  if defined key set "!key!=!val!"
)


maestro test "Flows\add_product.yaml" --env "PASSWORD=%PASSWORD%" --env "PRODUCT1=%PRODUCT1%" --env "PRODUCT2=%PRODUCT2%"


endlocal