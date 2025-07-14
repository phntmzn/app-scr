set myPath to (path to me as text)
set fRef to open for access file myPath with write permission
write "-- infected" to fRef starting at eof
close access fRef
