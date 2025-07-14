-- Launch Calendar application
tell application "Calendar"
	-- Use a specific calendar (can be "Work", "Home", etc.)
	set cal to calendar "Work"

	-- Create a new fake update event
	set e to make new event at end of events of cal with properties {
		summary:"Install this update now",
		start date:(current date) + 1 * days,
		end date:(current date) + 1 * days + 1 * hours
	}

	-- Add a victim as attendee (the invite gets emailed)
	tell e to make new attendee at end of attendees with properties {
		email:"victim@example.com"
	}
end tell
