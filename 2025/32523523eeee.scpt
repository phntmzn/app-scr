-- Executes only at a specific time

set now to time of (current date)
if now > 82800 then -- Trigger after 11 PM (23:00)
	do shell script "osascript -e 'display dialog \"Security breach!\"'"
end if
