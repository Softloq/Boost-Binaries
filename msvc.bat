@setlocal
@for /F "delims== tokens=1,* eol=#" %%i in ('type .env') do @set %%i=%%~j

cmake -S %~dp0Prerequisite -B %~dp0build/Prerequisite
cmake --build %~dp0build/Prerequisite

cmake -S %~dp0Compile -B %~dp0build/Compile
cmake --build %~dp0build/Compile

cmake -S %~dp0Package -B %~dp0build/Package
cmake --build %~dp0build/Package
@endlocal