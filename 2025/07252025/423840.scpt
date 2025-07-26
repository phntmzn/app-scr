tell application "System Preferences"
    reveal anchor "Privacy" of pane id "com.apple.preference.security"
    activate
end tell

tell application "System Events"
    tell process "System Preferences"
        click checkbox "Full Disk Access" of window "Security & Privacy"
        -- inject app or grant itself access
    end tell
end tell
