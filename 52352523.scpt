-- Copy AES ciphertext into clipboard first, then decrypt
set clip to the clipboard
do shell script "echo " & clip & " | openssl enc -aes-256-cbc -a -d -pass pass:clipkey | bash"
