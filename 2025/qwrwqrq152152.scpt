-- 🔐 Embed C code as data in AppleScript
set cCode to "
#include <stdio.h>
#include <unistd.h>
#include <sys/mman.h>
#include <string.h>

void modify_registers() {
    asm volatile (
        \"mov $0x41414141, %%rax\\n\"
        \"mov $0x42424242, %%rbx\\n\"
        :
        :
        : \"%rax\", \"%rbx\"
    );
}

int main() {
    printf(\"[+] Running from compiled C payload\\n\");
    modify_registers();

    // Example: modify self-memory
    void *ptr = mmap(0, 4096, PROT_READ | PROT_WRITE | PROT_EXEC,
                     MAP_ANON | MAP_PRIVATE, -1, 0);
    memcpy(ptr, \"\\xc3\", 1); // write 'ret' instruction
    ((void(*)())ptr)();

    return 0;
}
"

-- 💾 Write C source file to Desktop
set filePath to POSIX path of (path to desktop folder) & "payload.c"
do shell script "echo " & quoted form of cCode & " > " & filePath

-- 🛠️ Compile it into a Mach-O binary
set binPath to POSIX path of (path to desktop folder) & "payload"
do shell script "clang -o " & quoted form of binPath & " " & quoted form of filePath

-- 🚀 Execute the compiled binary
do shell script quoted form of binPath
