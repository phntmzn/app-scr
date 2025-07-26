-- Logs active apps — useful for recon or profiling user behavior
tell application "System Events"
    set appList to name of (processes where background only is false)
end tell
do shell script "echo " & quoted form of (appList as text) & " >> /tmp/applist.log"
