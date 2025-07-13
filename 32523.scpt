-- Moves a file into a system folder and makes it invisible to Finder
do shell script "mv ~/Downloads/drop.bin /usr/local/.drop.bin && chflags hidden /usr/local/.drop.bin"
