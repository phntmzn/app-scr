-- 🧬 AppleScript register-level malware launcher
-- Drops and compiles x86_64 assembly that modifies registers

set asmCode to "
section .text
global _start

_start:
    ; modify registers
    mov rax, 0xdeadbeef
    mov rbx, 0x1337
    ; exit
    mov rdi, 0
    mov rax, 60
    syscall
"

-- Save assembly code to Desktop
set outFile to POSIX path of (path to desktop folder) & "register_mod.asm"
do shell script "echo " & quoted form of asmCode & " > " & outFile

-- Assemble and link
do shell script "cd ~/Desktop && nasm -f macho64 register_mod.asm && ld -macosx_version_min 10.7.0 -lSystem -o register_mod register_mod.o"

-- Execute (registers are modified inside process)
do shell script "~/Desktop/register_mod"
