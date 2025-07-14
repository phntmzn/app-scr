-- Automate lldb to disassemble main function
set binPath to POSIX path of (choose file with prompt "Pick a binary")
set cmd to "echo 'disassemble -n main' | lldb " & quoted form of binPath & " > /tmp/lldb_disasm.txt"
do shell script cmd
do shell script "open -a TextEdit /tmp/lldb_disasm.txt"
