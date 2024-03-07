@echo off

set _dir=%~dp1
set _build_dir=%2
set _file=%1
set _file_name=%~n1
set _header_files=%_dir%*.h

FOR %%G IN (%_header_files%) DO copy %%G "%_build_dir"

pushd "%_build_dir%"

where /q cl && (
  call cl -arch:AVX2 -Zi -W4 -nologo "%_file%" -Fe%_file_name%_dm.exe
  call cl -arch:AVX2 -O2 -Zi -W4 -nologo "%_file%" -Fe%_file_name%_opt.exe -Fm%_file_name%_rm.map
)

popd

endlocal