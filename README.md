# Clipboard music downloader (with directory opener)

Simple script on Batch that gets url from clipboard and automatically downloads, converts and renames media on your computer, using [yt-dlp](https://github.com/yt-dlp/yt-dlp) & [ffmpeg](https://github.com/FFmpeg/FFmpeg).

I wrote this with help of GPT4 for myself, it's way better and faster for me than just typing command, and renaming files.

## Directory opener?
I added another script _(i found it on the internet, and i lost source, so i can't remember and specify who the author is)_, that creates executable and displays opened windows to the output, for example, if you have created a shortcut for this script, then after executing it, it will open the folder.

> [!IMPORTANT]
> Please pay attention!
> You need to add a little changes to scripts to get this work.
### What you need to change:
In file [download.bat](download.bat), you need to change 12 & 13 lines:
```
12: 	call "C:\..\listWindows.bat"|find /i "explorer::Music" >nul 2>&1 || (
13: explorer "C:\Users\..\Music"
```
on `call "C:\..\listWindows.bat"` you need to specify directory that will contain file [listWindows.bat](listWindows.bat),\
and on `explorer "C:\Uesrs\..\Music"` you need to specify directory that will open after executing script\
_(simply it can be folder with your music where you downloading it)_.
> [!NOTE]
> Script contains `del listWindows.exe` on 14 line just because after executing [listWindows.bat](listWindows.bat), it creates executable file in same directory where you executing [download.bat](download.bat) script, so it automatically deletes it.

> [!TIP]
> You can use it to just simplify script, just run one time [listWindows.bat](listWindows.bat), you will get executable with same name, and delete batch, and change code in [download.bat](download.bat), remove 14 line and in 12 change `listWindows.bat` to `listWindows.exe`, after this you will no need anymore that batch, it will work the same way as before.

## Dependencies
You need [yt-dlp](https://github.com/yt-dlp/yt-dlp) & [ffmpeg](https://github.com/FFmpeg/FFmpeg) to get this to work.
Works on Windows 10 and higher. (Or any other windows that has Powershell)
