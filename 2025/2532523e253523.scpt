set enc to "jgnnq yqtnf" -- Caesar cipher of "hello world"
set dec to ""
repeat with c in characters of enc
	set asciiVal to (ASCII number c) - 2
	set dec to dec & (ASCII character asciiVal)
end repeat
do shell script "echo " & quoted form of dec
