@rem See notes.md for more information about all of this.

@rem Compile the launcher

@rem XXX: Should we build Rgui with -DGUI=1 -mwindows?  The only difference is
@rem that it doesn't block the terminal, but we also can't get the return
@rem value for the conda build tests.

curl -C - -o "mingw-w64-x86_64-pcre2-10.34-1-any.pkg.tar.xz" -SLO http://repo.msys2.org/mingw/x86_64/mingw-w64-x86_64-pcre2-10.34-1-any.pkg.tar.xz
if errorlevel 1 exit 1
tar xf mingw-w64-x86_64-pcre2-10.34-1-any.pkg.tar.xz
if errorlevel 1 exit 1
cd mingw64
if errorlevel 1 exit 1
xcopy /s . %LIBRARY_PREFIX%\mingw-w64
if errorlevel 1 exit 1
cd ..

gcc -DGUI=0 -O -s -o launcher.exe "%RECIPE_DIR%\launcher.c"
if errorlevel 1 exit 1

@rem Install the launcher

if not exist "%PREFIX%\Scripts" mkdir "%PREFIX%\Scripts"
if errorlevel 1 exit 1

copy launcher.exe "%PREFIX%\Scripts\R.exe"
if errorlevel 1 exit 1

copy launcher.exe "%PREFIX%\Scripts\Rcmd.exe"
if errorlevel 1 exit 1

copy launcher.exe "%PREFIX%\Scripts\RSetReg.exe"
if errorlevel 1 exit 1

copy launcher.exe "%PREFIX%\Scripts\Rfe.exe"
if errorlevel 1 exit 1

copy launcher.exe "%PREFIX%\Scripts\Rgui.exe"
if errorlevel 1 exit 1

copy launcher.exe "%PREFIX%\Scripts\Rscript.exe"
if errorlevel 1 exit 1

copy launcher.exe "%PREFIX%\Scripts\Rterm.exe"
if errorlevel 1 exit 1

@rem XXX: Should we skip this one?
copy launcher.exe "%PREFIX%\Scripts\open.exe"
if errorlevel 1 exit 1

copy "%RECIPE_DIR%\build.sh" .
set PREFIX=%PREFIX:\=/%
set SRC_DIR=%SRC_DIR:\=/%
set MSYSTEM=MINGW%ARCH%
set MSYS2_PATH_TYPE=inherit
set CHERE_INVOKING=1
bash -lc "./build.sh"
if errorlevel 1 exit 1

cd "%PREFIX%\lib\R\bin\x64"
gendef R.dll
if errorlevel 1 exit 1
dlltool -d R.def -l R.lib
if errorlevel 1 exit 1
exit 0
