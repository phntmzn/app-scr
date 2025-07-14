-- Encrypted payload stored in var
set b64 to "encrypted blob here"
-- Python decrypts with private RSA key (not shown)
do shell script "python3 decrypt_and_run.py"
