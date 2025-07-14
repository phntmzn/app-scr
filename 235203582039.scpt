-- Use objdump to get disassembly with symbols
set target to POSIX path of (choose file with prompt "Select a binary")
do shell script "objdump -d --macho " & quoted form of target & " > /tmp/objdump.txt"
do shell script "open -a TextEdit /tmp/objdump.txt"
