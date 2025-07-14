-- Define the new AppleScript payload to be written dynamically
set payload to "display dialog \"Hi from variant #3!\""

-- Open a temporary file for writing mutated script
set f to open for access (POSIX file "/tmp/mutant.scpt") with write permission
write payload to f
close access f

-- Execute the mutated script
do shell script "osascript /tmp/mutant.scpt"
