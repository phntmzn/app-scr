set clipContent to the clipboard
do shell script "echo " & quoted form of clipContent & " >> /tmp/clip.log"
