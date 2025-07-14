echo 'display dialog "AES-encrypted AppleScript!"' | openssl enc -aes-256-cbc -base64 -pass pass:secret > payload.aes
