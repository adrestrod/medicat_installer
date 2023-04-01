@echo off
:check
cls
set size=0
set propersize=22994783619
call :filesize "MediCat.USB.v21.12.7z"
if "%size%" == "%propersize%" (goto done)
)

:download
echo.Downloading from Medicat server.
wget "http://files.medicatusb.com/main.html?download&weblink=76c769ac1d76951558cbc1daf98a161b&realfilename=MediCat.USB.v21.12.7z" -O ./MediCat.USB.v21.12.7z -q --show-progress --progress=bar -c

:done
cls
echo.Completed Downloading, Checking File Size.
set size=0
call :filesize "MediCat.USB.v21.12.7z"
if "%size%" == "%propersize%" (goto exit)
echo.the file doesnt appear to be complete.
timeout 3 > nul
goto check


:exit
echo.File Appears to be downloaded successfully.
timeout 5 > nul
exit /b


:filesize
  set size=%~z1
  exit /b 0