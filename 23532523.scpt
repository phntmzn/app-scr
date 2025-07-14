-- AES encrypted: display dialog "stealthy script"
set payload to "U2FsdGVkX1+jfVQhD6UWl7To5Go3OD4xFhzQfKszbdg="
set command to "echo " & quoted form of payload & " | base64 -D | openssl enc -aes-256-cbc -d -pass pass:secret | osascript"
do shell script command
