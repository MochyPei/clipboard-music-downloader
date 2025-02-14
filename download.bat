@echo off
chcp 1251 >nul
setlocal
FOR /F "tokens=* USEBACKQ" %%F IN (`powershell -sta "add-type -as System.Windows.Forms; [windows.forms.clipboard]::GetText()"`) DO (
    SET url=%%F
)

echo %url% | findstr /C:"https://" >nul
if %errorlevel% equ 0 (
	echo Downloading...
	yt-dlp --no-playlist -o "{%%(uploader)s} %%(fulltitle)s.%%(ext)s" -x --audio-quality 0 --audio-format mp3 "%url%"
	)
) else (
	echo Clipboard does not contain url
	echo %url%
)
timeout /t 5 /nobreak >nul
endlocal
