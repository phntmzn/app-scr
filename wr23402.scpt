-- Prevents user from dismissing a malicious dialog
repeat
	display dialog "System Error. Click OK to continue." buttons {"OK"} default button 1
end repeat
