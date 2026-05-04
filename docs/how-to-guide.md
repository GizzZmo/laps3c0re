# How-To Guide — Laps3c0re

This guide walks you through the complete process of jailbreaking a supported PS4 console using **Laps3c0re** (Lapse + Mast1c0re).

> [!WARNING]
> This project is no longer actively supported. Unless you already have *Okage: Shadow King* on a supported firmware, consider [PS Vue](https://github.com/Vuemony) (PS4) or [Y2JB](https://github.com/Gezine/Y2JB) (PS5) instead.

---

## Table of Contents

1. [What You Need](#1-what-you-need)
2. [Prepare Your USB Stick](#2-prepare-your-usb-stick)
3. [Get the Laps3c0re Binaries](#3-get-the-laps3core-binaries)
4. [Set Up the Save File](#4-set-up-the-save-file)
5. [Run the Exploit](#5-run-the-exploit)
   - [Option A — USB ELF Loader](#option-a--usb-elf-loader)
   - [Option B — Network ELF Loader](#option-b--network-elf-loader)
   - [Option C — No Loader (save-only)](#option-c--no-loader-save-only)
6. [Receive Debug Logs (Optional)](#6-receive-debug-logs-optional)
7. [Troubleshooting](#7-troubleshooting)

---

## 1. What You Need

| Requirement | Details |
|-------------|---------|
| PS4 console | Must be on a **[supported firmware](../README.md#supported-fws)** version |
| *Okage: Shadow King* | A digital, **activated** copy purchased from PSN (must already be installed) |
| Save signing tool | [Apollo Save Tool](https://github.com/bucanero/apollo-ps4) **or** a pre-built [ELF loader](#option-a--usb-elf-loader) |
| USB stick | Formatted as **exFAT with MBR** (GPT partitioning will not work with the USB ELF Loader) |
| GoldHEN | Latest binary from [Sistro's Ko-fi shop](https://ko-fi.com/sistro/shop) (`goldhen.bin`) |
| Laps3c0re release | Downloaded from the [Releases](https://github.com/GizzZmo/laps3c0re/releases/latest) page |

---

## 2. Prepare Your USB Stick

1. Format the USB stick as **exFAT** with **MBR** (not GPT).
2. Place `goldhen.bin` in the **root** of the USB stick.  
   > **Tip:** if your payload is named `payload.bin`, rename it to `goldhen.bin`.
3. For the USB ELF Loader, create an `ELFs/` folder in the root and copy `laps3c0re-PSx-xx-xx.elf` (the binary matching your firmware) into it.  
   See the [USB ELF Loader README](https://github.com/McCaulay/mast1c0re-ps2-usb-elf-loader?tab=readme-ov-file#configuring-a-usb) for the full directory layout.

---

## 3. Get the Laps3c0re Binaries

Download the zip archive matching your firmware from the [Releases](https://github.com/GizzZmo/laps3c0re/releases/latest) page.  
Each zip contains a single `.elf` file.

**Firmware naming convention:**

| File name | Firmware |
|-----------|---------|
| `PS4-9-00.zip` | 9.00 |
| `PS4-10-01.zip` | 10.01 |
| `PS4-11-50.zip` | 11.50 / 11.52 |
| *(etc.)* | *(see README for full list)* |

Extract the `.elf` from the matching archive.

---

## 4. Set Up the Save File

You need a **patched Okage: Shadow King** save file on your console that embeds the exploit data.

Follow this external guide:  
👉 [Creating the save and adding the exploit data to it](https://consolemods.org/wiki/PS4:Jailbreak_With_Mast1c0re%2BLapse#Creating_the_save_and_adding_the_exploit_data_to_it)

**Pro tip:** The [Releases](https://github.com/GizzZmo/laps3c0re/releases/latest) page includes a pre-bundled save file alongside the ELF loader save file. Consider keeping **both on two separate user accounts** so you can switch between loaders easily.

---

## 5. Run the Exploit

> Make sure the USB stick (with `goldhen.bin` and, if needed, the ELF loader files) is **inserted in the console** before you start.

### Option A — USB ELF Loader

Pre-release USB ELF Loader builds for firmware 5.05–12.52 by [@EchoStretch](https://github.com/EchoStretch):
- [mast1c0re-ps2-usb-elf-loader-505-1252.7z](https://www.mediafire.com/file/p9aii0yv68glkvd/mast1c0re-ps2-usb-elf-loader-505-1252.7z/file)

**Steps:**

1. Place `laps3c0re-PSx-xx-xx.elf` (for your FW) in the `ELFs/` directory on the USB stick.
2. Insert the USB stick into the PS4.
3. Open **Okage: Shadow King**.
4. Press the **Start** button (right half of the touch pad).
5. Select **RESTORE GAME**.
6. Follow the on-screen prompt to choose and load Laps3c0re from the USB.

---

### Option B — Network ELF Loader

Pre-release Network ELF Loader builds by [@EchoStretch](https://github.com/EchoStretch):
- [mast1c0re-ps2-network-elf-loader-505-1252.7z](https://www.mediafire.com/file/vfr9p1r83cx1fab/mast1c0re-ps2-network-elf-loader-505-1252.7z/file)

**Steps:**

1. Install [Python 3](https://www.python.org/downloads/) on your computer and the required dependency:
   ```bash
   pip install progress
   ```
2. Make sure your computer and PS4 are on the **same local network**.
3. Open **Okage: Shadow King** on the PS4.
4. Press the **Start** button and select **RESTORE GAME** to put the console into "waiting" mode.
5. On your computer, send the payload:
   ```bash
   python ./mast1c0re-send-file.py \
       -i 192.168.x.xx \
       -p 9045 \
       -f ./PSx-xx-xx/laps3c0re-PSx-xx-xx.elf
   ```
   Replace `192.168.x.xx` with your console's IP address and `laps3c0re-PSx-xx-xx.elf` with the ELF matching your firmware.

---

### Option C — No Loader (save-only)

If you are using only the exploit save (without an ELF loader):

1. Make sure the correct save file is on your console (see [Step 4](#4-set-up-the-save-file)).
2. Open **Okage: Shadow King**.
3. Press the **Start** button and select **RESTORE GAME**.
4. The payload embedded in the save will execute automatically.

---

## 6. Receive Debug Logs (Optional)

To capture debug output from the exploit, run the following on a machine at IP `192.168.1.39`:

```bash
ncat --udp --listen --keep-open --recv-only -p 9023
```

You will need [Ncat / Nmap](https://nmap.org/download) installed.

> The PS4 sends logs to **UDP port 9023** on the hardcoded address `192.168.1.39`.  
> Configure your network so your computer uses that IP, or adjust the source before building.

---

## 7. Troubleshooting

| Symptom | Likely cause | Fix |
|---------|--------------|-----|
| USB stick not detected / loader doesn't appear | GPT partition table | Reformat as exFAT **MBR** |
| "RESTORE GAME" hangs or crashes immediately | Wrong save file / ELF binary | Verify the ELF matches your firmware; re-sign the save |
| Console panics / kernel panic | Unstable heap or wrong FW offsets | Make sure you selected the correct firmware version |
| Nothing happens after "RESTORE GAME" | Save file not patched correctly | Redo [Step 4](#4-set-up-the-save-file) carefully |
| GoldHEN doesn't load | `goldhen.bin` missing or in wrong location | Place `goldhen.bin` in the USB root; insert USB before starting |
| Network loader times out | Firewall / wrong IP | Check that port 9045 is open and the IP is correct |

For additional help, check the [FAQ](./faq.md) or open an issue on GitHub.
