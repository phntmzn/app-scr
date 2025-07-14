-- Read and decode base64 at runtime
set b64 to "ZGlzcGxheSBkaWFsb2cgIkhlbGxvIGZyb20gZW5jb2RlZCBBcHBsZVNjcmlwdCEi"
do shell script "echo " & quoted form of b64 & " | base64 -D | osascript"
