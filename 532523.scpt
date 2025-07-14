-- Python script to print current user, encrypted via base64
set b64 to "cHJpbnQoImhlbGxvIiwgImZyb20gcHl0aG9uIik=" -- base64 of: print("hello", "from python")
do shell script "echo " & quoted form of b64 & " | base64 -D | python3"
