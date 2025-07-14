-- AppleScript that asks the user for a binary, runs otool, and displays the output
set binaryPath to POSIX path of (choose file with prompt "Select a Mach-O binary to disassemble")

-- Use otool to disassemble __TEXT section
do shell script "otool -tV " & quoted form of binaryPath & " > /tmp/disassembly.txt"

-- Show output in TextEdit
do shell script "open -a TextEdit /tmp/disassembly.txt"
