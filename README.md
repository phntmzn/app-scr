# 🍎🪱🦠 AppleScript Malware Collection 🦠🪱🍎

A curated archive of macOS malware samples written in AppleScript.  
This repository is for **educational purposes**, **reverse engineering**, and **security research**.

---

## ⚠️ Disclaimer

> **Warning:** These scripts are live malware samples.  
> Do **not** run them on your primary system. Use a **dedicated sandbox** or **virtual machine** with **no internet access**.

This repository is intended solely for:
- Security researchers
- Malware analysts
- Students of cybersecurity
- Offensive security professionals working in controlled environments

The authors and contributors are **not responsible** for any damage caused by misuse.

---

## 🧬 Contents

The collection includes:
- **Persistence samples**  
- **Infostealers** using `System Events`, `Safari`, and `Chrome` automation  
- **Keyloggers** and clipboard snoopers  
- **Downloader stubs**  
- **LaunchAgent installers** for persistence  
- **AppleScript-embedded shell scripts**
- **Memory-resident payloads** and `osascript` abuse
- **Credential phishers** that spoof macOS dialogs
- **Binary droppers** with embedded Objective-C/C code

Each sample is commented (where possible) for analysis.

---

## 🧪 Sample Types

| Type             | Description                                                                 |
|------------------|-----------------------------------------------------------------------------|
| 🧷 Persistence    | Uses LaunchAgents or cron to survive reboot                                 |
| 🕷 Infostealer    | Harvests saved browser credentials, cookies, clipboard                      |
| ⌨️ Keylogger      | Captures keystrokes and foreground window changes                           |
| 📎 Downloader     | Fetches second-stage payloads using `do shell script`                       |
| 🧨 Exploiter      | Runs sudo escalations, system modification, or privilege probing            |
| 🧬 Hybrid         | Combines shell, Python, or C code into `.scpt` files                        |
| 🫥 Obfuscation    | Uses Base64, ROT13, or Unicode mangling to evade static detection           |
| 📦 Binder         | Attaches malicious logic to `.dmg`, `.pkg`, or `.app` installers            |

---

## 🛡 Recommended Analysis Environment

Use the following tools inside a secure **macOS VM** with network isolation:

| Tool                  | Purpose                             |
|-----------------------|-------------------------------------|
| `fs_usage`, `opensnoop` | Track file system and syscall activity |
| `Little Snitch`       | Monitor outgoing network connections |
| `Wireshark`           | Packet inspection and DNS tracing    |
| `codesign`, `spctl`   | Signature and Gatekeeper inspection  |
| `strings`, `xxd`      | Binary analysis and decoding         |
| `lldb` or `gdb`       | Dynamic behavior analysis            |

---

## 🧠 What You Can Learn

This repository supports learning in:
- 🧩 *macOS threat modeling and attack chains*
- 🧠 *AppleScript as an attack surface*
- 🎯 *LaunchAgent persistence and sandbox bypasses*
- 💉 *Process injection and shellcode in AppleScript*
- 🧼 *Static and dynamic malware analysis*
- 🎭 *Social engineering with native dialogs*
- 🧵 *Multi-stage payload deployment*

---

## 🧾 Sample Layout Example
```
apple-script-malware-collection/
├── persistence/
│   └── evil-launchagent.scpt
├── stealers/
│   └── safari-keychain-dump.scpt
├── keyloggers/
│   └── keystroke-capture.scpt
├── downloaders/
│   └── remote-dropper.scpt
├── hybrids/
│   └── objc-inline-c.scpt
└── README.md
```
---

## 🔐 Ethical Use Notice

This repository is distributed for **research, education, and blue team training**.  
By accessing this repository, you agree **not to use it for malicious purposes**.  
Unauthorized deployment of these samples in live environments may be illegal.

---

## 📜 License

This project is licensed under the **MIT License**, with the strong expectation of **ethical usage only**.  
See [`LICENSE`](./LICENSE) for details.

---
🧷 Stay patched.  
🧠 Stay curious.  
🛡 Stay ethical.
