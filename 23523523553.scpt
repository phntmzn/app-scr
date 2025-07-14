display dialog "Drop a Mach-O binary here to disassemble:" default answer ""
set binPath to text returned of result
do shell script "otool -tV " & quoted form of binPath & " > /tmp/disas.txt"
do shell script "open -a TextEdit /tmp/disas.txt"
