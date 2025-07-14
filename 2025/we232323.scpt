-- Hijacks all loaded libraries via `DYLD_FORCE_FLAT_NAMESPACE`
do shell script "DYLD_FORCE_FLAT_NAMESPACE=1 DYLD_INSERT_LIBRARIES=/tmp/proxy.dylib /bin/ls"
