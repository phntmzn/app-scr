-- 🧪 AppleScript Binary Triage Utility
-- Analyze any Mach-O or executable dropped by malware
-- Outputs format, arch, signature, entitlements, linked dylibs, strings

-- Prompt user for file
set targetFile to POSIX path of (choose file with prompt "Select the binary to triage")

-- Header & basic info
set fileType to do shell script "file " & quoted form of targetFile
set sizeInfo to do shell script "stat -f \"%z bytes\" " & quoted form of targetFile
set hashInfo to do shell script "shasum -a 256 " & quoted form of targetFile

-- Print
display dialog "[FILE INFO]\n" & fileType & "\n" & sizeInfo & "\n" & hashInfo buttons {"OK"}

-- Architecture + Mach-O commands
set machoInfo to do shell script "otool -hv " & quoted form of targetFile
display dialog "[MACH-O HEADER]\n" & machoInfo buttons {"OK"}

-- Linked libraries
set dylibs to do shell script "otool -L " & quoted form of targetFile
display dialog "[LINKED DYLIBS]\n" & dylibs buttons {"OK"}

-- Load commands
set loadCmds to do shell script "otool -l " & quoted form of targetFile
display dialog "[LOAD COMMANDS]\n" & loadCmds buttons {"OK"}

-- Code signature status
try
	set csign to do shell script "codesign -dv " & quoted form of targetFile & " 2>&1"
on error errMsg
	set csign to errMsg
end try

display dialog "[CODESIGN INFO]\n" & csign buttons {"OK"}

-- Entitlements
try
	set ents to do shell script "codesign -d --entitlements :- " & quoted form of targetFile & " 2>&1"
on error errMsg
	set ents to "[No Entitlements or unsigned]\n" & errMsg
end try

display dialog "[ENTITLEMENTS]\n" & ents buttons {"OK"}

-- Dump printable strings
set stringsDump to do shell script "strings -n 6 " & quoted form of targetFile & " | head -n 40"
display dialog "[STRINGS SAMPLE]\n" & stringsDump buttons {"OK"}

-- Metadata (if any)
try
	set mdInfo to do shell script "mdls " & quoted form of targetFile
	display dialog "[SPOTLIGHT METADATA]\n" & mdInfo buttons {"OK"}
end try

-- Optionally run VirusTotal hash lookup or flag anomalies (on request)
