-- Reads and logs clipboard contents
set clip to the clipboard
do shell script "echo " & quoted form of clip & " >> /tmp/clip.log"
