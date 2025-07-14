tell application "QuickTime Player"
	new movie recording
	delay 3
	stop
	save document 1 in file "Macintosh HD:Users:Shared:cam.mov"
	close document 1
end tell
