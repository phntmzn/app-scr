-- Open Calculator, then hide it — could be used as a decoy before launching malware
tell application "Calculator"
    activate
end tell
delay 0.2
tell application "System Events" to set visible of process "Calculator" to false
