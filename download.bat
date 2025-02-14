@echo off
chcp 1251 >nul
setlocal
FOR /F "tokens=* USEBACKQ" %%F IN (`powershell -sta "add-type -as System.Windows.Forms; [windows.forms.clipboard]::GetText()"`) DO (
    SET url=%%F
)

echo %url% | findstr /C:"https://" >nul
if %errorlevel% equ 0 (
	echo Downloading...
	yt-dlp -o "{%%(uploader)s} %%(fulltitle)s.%%(ext)s" -x --audio-quality 0 --audio-format mp3 "%url%"
	call "C:\..\listWindows.bat"|find /i "explorer::Music" >nul 2>&1 || (
	explorer "C:\Users\..\Music"
	)
	del listWindows.exe
) else (
	echo Clipboard does not contain url
	echo %url%
)
timeout /t 5 /nobreak >nul
endlocal