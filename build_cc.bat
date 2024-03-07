@echo off

call "C:\Program Files\Microsoft Visual Studio\2022\Professional\VC\Auxiliary\Build\vcvars64.bat"

set msvc_path=C:\Program Files\Microsoft Visual Studio\2022\Professional\VC\Tools\MSVC\14.38.33130\bin\Hostx64\x64

where /q cl || (echo "WARNING: MSVC (cl) not found -- cpp libs wil not be built")

echo "Building cpp files.."

setlocal

set _dir=%~dp0
set _cc_files=%_dir%%1
set _build_dir=%_dir%build\

if exist "%_cc_files%\*" (
    set _cc_files="%_cc_files%\*.cc"
    set _build_dir="%_cc_files%\build\"
)

if not exist %_build_dir% mkdir "%_build_dir%"

for %%G in (%_cc_files%) DO call %_dir%\build_single_cc.bat %%G %_build_dir%   

endlocal

