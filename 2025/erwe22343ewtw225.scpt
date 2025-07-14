on open dropped_items
    repeat with i in dropped_items
        do shell script "cp " & quoted form of POSIX path of i & " ~/Documents/Stolen/"
    end repeat
end open
