@setlocal
@for /F "delims== tokens=1,* eol=#" %%i in ('type .env') do @set %%i=%%~j

cmake -S %~dp0Prerequisite -B %~dp0build/Prerequisite -DBOOST_VERSION="%BOOST_VERSION%"
cmake --build %~dp0build/Prerequisite

cmake -S %~dp0Compile -B %~dp0build/Compile -DBOOST_VERSION="%BOOST_VERSION%"
cmake --build %~dp0build/Compile

cmake -S %~dp0Package -B %~dp0build/Package -DBOOST_VERSION="%BOOST_VERSION%" -DPACKAGE_NAME="boost-win64-msvc.zip"
cmake --build %~dp0build/Package
@endlocal